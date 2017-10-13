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
function NOP:UI_ERROR_MESSAGE(event, msgType, msg, ...) -- handle lockpicking item could be already unlocked or still locked and can't be used yet.
  if (msgType == 35) and (msg == ERR_ITEM_LOCKED) and not self:inCombat() then
    UIErrorsFrame:Clear()
    local bt = self.BF
    if bt and self:ItemToPicklock(bt.itemID) then
      bt.mtext = format(private.MACRO_PICKLOCK,self.pickLockSpell,bt.bagID,bt.slotID)
      bt:SetAttribute("type1", "macro")
      bt:SetAttribute("macrotext1", bt.mtext)
    end
    return
  end
  if (msgType == 50) and (msg == SPELL_FAILED_BAD_TARGETS) then
    UIErrorsFrame:Clear()
    self:ItemShowNew()
    return
  end
  if (msgType == 51) and ((msg == SPELL_FAILED_ITEM_NOT_READY) or (msg == ERR_ITEM_COOLDOWN)) then
    UIErrorsFrame:Clear()
    return
  end
  if (msgType == 27) and (msg == ERR_ITEM_NOT_FOUND) then 
    UIErrorsFrame:Clear()
    self:ItemShowNew()
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
function NOP:LOOT_SPEC() -- after spec or loot spec switch I need update spell strings!
  self.spellLoad = nil
  self.spellLoadRetry = 10 -- limit number of retries
  self:SpellLoad()
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
  self.frameHider = CreateFrame("Frame", ADDON .. "_Hider", UIParent, "SecureHandlerStateTemplate") -- State hide buttons in vehicle and petbattles
  self.frameHider:SetAllPoints(UIParent)
  RegisterStateDriver(self.frameHider, "visibility", "[petbattle] [vehicleui] hide; show")
  self:ButtonLoad() -- create button
  self:QBAnchor() -- create quest bar
  self.itemLoadRetry = private.LOAD_RETRY; self:ItemLoad() -- create item patterns
  self.spellLoadRetry = private.LOAD_RETRY; self:SpellLoad() -- create spell patterns
  self:PickLockUpdate() -- picklock skills
  local key = GetBindingKey("CLICK " .. private.BUTTON_FRAME .. ":LeftButton")
  if self.BF.hotkey then self.BF.hotkey:SetText(self:ButtonHotKey(key)) end
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
