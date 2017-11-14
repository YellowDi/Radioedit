--[[ Event handlers ]]
local _
local ADDON, private = ...
local NOP = LibStub("AceAddon-3.0"):GetAddon(ADDON)
function NOP:InitEvents()
  self:RegisterEvent("PLAYER_LOGIN")
  self:RegisterEvent("PLAYER_LEVEL_UP")
  self:RegisterEvent("SPELLS_CHANGED","PLAYER_LEVEL_UP")
  self:RegisterEvent("BAG_UPDATE_DELAYED","BAG_UPDATE")
  self:RegisterEvent("UNIT_INVENTORY_CHANGED","BAG_UPDATE")
  self:RegisterEvent("ACTIVE_TALENT_GROUP_CHANGED","LOOT_SPEC")
  self:RegisterEvent("PLAYER_LOOT_SPEC_UPDATED","LOOT_SPEC")
  self:RegisterEvent("MINIMAP_ZONE_CHANGED","ZONE_CHANGED") -- old event, kept for compatibility
  self:RegisterEvent("ZONE_CHANGED","ZONE_CHANGED") -- change zone
  self:RegisterEvent("ZONE_CHANGED_INDOORS","ZONE_CHANGED") -- leave indoors to outdoors or oposite
  self:RegisterEvent("ZONE_CHANGED_NEW_AREA","ZONE_CHANGED") -- leave instance
  self:RegisterEvent("PLAYER_ENTERING_WORLD","ZONE_CHANGED") -- Loading screen
  self:RegisterEvent("ACTIONBAR_UPDATE_COOLDOWN") -- cooldown for quest bar
  self:RegisterEvent("QUEST_ACCEPTED") -- update Quest Bar if any item starting quest is placed on it
  self:RegisterEvent("UI_ERROR_MESSAGE") -- blacklist some messages when items and spells are loaded from cache
  self:RegisterEvent("GARRISON_LANDINGPAGE_SHIPMENTS") -- herald notify
  self:RegisterEvent("PLAYER_ENTERING_WORLD") -- Loading screen
end
local OK_ERROR_SHOW = { -- OK errors not ship but not clear them as well
  [ERR_SPELL_FAILED_ANOTHER_IN_PROGRESS] = true,
  [SPELL_FAILED_ITEM_NOT_READY] = true,
  [ERR_NO_ITEMS_WHILE_SHAPESHIFTED] = true,
  [SPELL_FAILED_MOVING] = true,
}
local OK_ERROR_NEXT = { -- OK error, clear and skip
 [ERR_ITEM_NOT_FOUND] = true,
 [SPELL_FAILED_BAD_TARGETS] = true,
}
function NOP:UI_ERROR_MESSAGE(event, msgType, msg, ...) -- handle lockpicking item could be already unlocked or still locked and can't be used yet.
  if (msg == ERR_ITEM_LOCKED) and not self:inCombat() then -- replace action on button
    UIErrorsFrame:Clear()
    local bt = self.BF
    if bt and self:ItemToPicklock(bt.itemID) then
      bt.mtext = format(private.MACRO_PICKLOCK,self.pickLockSpell,bt.bagID,bt.slotID)
      bt:SetAttribute("type1", "macro")
      bt:SetAttribute("macrotext1", bt.mtext)
    end
    return
  end
  if OK_ERROR_NEXT[msg] then -- someone bashing button or item did move in bags
    UIErrorsFrame:Clear() -- remove error from error frame
    self:ItemShowNew() -- look for another item
    return
  end
  if OK_ERROR_SHOW[msg] then -- these errors are ok, item is on CD or can't be used in current state
    return
  end
  if self.preClick and NOP.DB.SkipOnError then -- something with button went wrong, lets temporary blacklist it
    self.printt(msg)
    UIErrorsFrame:Clear()
    self:BlacklistItem(false,self.BF.itemID)
    return
  end
  --self.printt("Type",msgType,"Msg",private.RGB_RED .. msg .. "|r")
end
function NOP:LOOT_SPEC() -- after spec or loot spec switch I need update all paterns!
  self.spellLoad = nil; self.spellLoadRetry = private.LOAD_RETRY; wipe(NOP.T_OPEN); self:SpellLoad() 
  self.itemLoad = nil; self.itemLoadRetry = private.LOAD_RETRY; wipe(NOP.T_RECIPES_FIND); self:ItemLoad()
  self:ItemShowNew()
end
function NOP:BAG_UPDATE() -- bags have changed
  self:ItemShowNew()
end
function NOP:PLAYER_LOGIN() -- player entering game
  if not NOP.DB["version"] or NOP.DB["version"] ~= private.NOP_VERSION then
    self.printt("|cFFFF0000" .. private.NOP_TITLE .. " " .. private.NOP_VERSION)
    NOP.DB["version"] = private.NOP_VERSION
  end
  self.frameHiderB = CreateFrame("Frame", ADDON .. "_HiderB", UIParent, "SecureHandlerStateTemplate") -- State hide buttons in vehicle, petbattles and or combat
  self.frameHiderB:SetAllPoints(UIParent)
  RegisterStateDriver(self.frameHiderB, "visibility", string.format( "[petbattle] [vehicleui] %shide; show", NOP.DB.HideInCombat and "[combat] " or ""))
  self.frameHiderQ = CreateFrame("Frame", ADDON .. "_HiderQ", UIParent, "SecureHandlerStateTemplate") -- State hide buttons in vehicle and petbattles
  self.frameHiderQ:SetAllPoints(UIParent)
  RegisterStateDriver(self.frameHiderQ, "visibility", "[petbattle] [vehicleui] hide; show")
  self:ButtonLoad() -- create button
  self:QBAnchor() -- create quest bar
  self.itemLoadRetry = private.LOAD_RETRY; self:ItemLoad() -- create item patterns
  self.spellLoadRetry = private.LOAD_RETRY; self:SpellLoad() -- create spell patterns
  self:PickLockUpdate() -- picklock skills
  local key = GetBindingKey("CLICK " .. private.BUTTON_FRAME .. ":LeftButton")
  if self.BF.hotkey then self.BF.hotkey:SetText(self:ButtonHotKey(key)) end
  if not self.timerZoneChanged then self.timerZoneChanged = self:ScheduleTimer("ZoneChanged",private.TIMER_IDLE) end
  self.backTimer = self:ScheduleRepeatingTimer("ItemTimer", private.TIMER_RECHECK) -- slow backing timer for complete rescan, sometime GetItemSpell get hang or new item is added post events are triggered
end
function NOP:ZONE_CHANGED() -- map change, all items tied to zone need update
  if not self.timerZoneChanged then self.timerZoneChanged = self:ScheduleTimer("ZoneChanged",private.TIMER_IDLE) end
end
function NOP:PLAYER_LEVEL_UP() -- may be there are items now usable
  self:PickLockUpdate() -- new level rising picklock level
  wipe(NOP.T_CHECK) -- empty list
  self:ItemShowNew()
end
function NOP:QUEST_ACCEPTED()
  if not NOP.DB.quest then return end -- quest bar is disabled and hidden nothing to do
  self:QBQuestAccept()
end
function NOP:PLAYER_ENTERING_WORLD() -- loading screen
  self:CheckBuilding(true) -- refresh garrison landing page as well
end
function NOP:ACTIONBAR_UPDATE_COOLDOWN() -- update cooldowns on quest bar and item button
  if self.QB and NOP.DB.quest and not self.qbHidden then -- quest bar is not disabled or none and hidden nothing to do
    for _, bt in ipairs(self.QB.buttons) do -- quest bar buttons text cooldowns
      if bt:IsShown() and bt.itemID then 
        local start, duration, enable = GetItemCooldown(bt.itemID)
        self:ButtonOnUpdate(bt,start,duration)
      end
    end
  end
  local bt = self.BF -- item button
  if bt and bt.itemID and bt:IsShown() then
    local start, duration, enable = GetItemCooldown(bt.itemID) -- GetContainerItemCooldown(bt.bagID, bt.slotID)
    self:ButtonOnUpdate(bt,start,duration)
  end
end
function NOP:GARRISON_LANDINGPAGE_SHIPMENTS()
  self:CheckBuilding()
end
