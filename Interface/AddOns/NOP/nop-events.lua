--[[ Event handlers ]]
local _
local ADDON, private = ...
local NOP = LibStub("AceAddon-3.0"):GetAddon(ADDON)
function NOP:InitEvents()
  self:RegisterEvent("PLAYER_LOGIN")
  self:RegisterEvent("PLAYER_LEVEL_UP")
  self:RegisterEvent("BAG_UPDATE_DELAYED","BAG_UPDATE")
  self:RegisterEvent("UNIT_INVENTORY_CHANGED","BAG_UPDATE")
  self:RegisterEvent("BANKFRAME_OPENED")
  self:RegisterEvent("BANKFRAME_CLOSED")
  self:RegisterEvent("GUILDBANKFRAME_OPENED")
  self:RegisterEvent("GUILDBANKFRAME_CLOSED")
  self:RegisterEvent("ACTIVE_TALENT_GROUP_CHANGED","LOOT_SPEC")
  self:RegisterEvent("PLAYER_LOOT_SPEC_UPDATED","LOOT_SPEC")
  self:RegisterEvent("MINIMAP_ZONE_CHANGED","ZONE_CHANGED") -- old event, kept for compatibility
  self:RegisterEvent("ZONE_CHANGED","ZONE_CHANGED") -- change zone
  self:RegisterEvent("ZONE_CHANGED_INDOORS","ZONE_CHANGED") -- leave indoors to outdoors or oposite
  self:RegisterEvent("ZONE_CHANGED_NEW_AREA","ZONE_CHANGED") -- leave instance
  self:RegisterEvent("PLAYER_ENTERING_WORLD","ZONE_CHANGED") -- Loading screen
  self:RegisterEvent("ACTIONBAR_UPDATE_COOLDOWN") -- cooldown for quest bar
  self:RegisterEvent("QUEST_ACCEPTED") -- update Quest Bar if any item starting quest is placed on it
  self:RegisterEvent("UNIT_SPELLCAST_FAILED","SPELLCAST")
  self:RegisterEvent("UNIT_SPELLCAST_FAILED_QUIET","SPELLCAST")
  self:RegisterEvent("UNIT_SPELLCAST_INTERRUPTED","SPELLCAST")
  self:RegisterEvent("UNIT_SPELLCAST_STOP","SPELLCAST")
  self:RegisterEvent("UNIT_SPELLCAST_CHANNEL_STOP","SPELLCAST")
  self:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED","SPELLCAST")
  self:RegisterEvent("UI_ERROR_MESSAGE")
end
function NOP:UI_ERROR_MESSAGE(event, ...)
  if (self.spellLoad and self.itemLoad) then self:UnregisterEvent("UI_ERROR_MESSAGE"); return; end
  UIErrorsFrame:Clear()
end
function NOP:BANKFRAME_OPENED()
  self.bankOpen = true
end
function NOP:BANKFRAME_CLOSED()
  self.bankOpen = nil
end
function NOP:GUILDBANKFRAME_OPENED()
  self.guildOpen = true
end
function NOP:GUILDBANKFRAME_CLOSED()
  self.guildOpen = nil
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
  self.frameHider = CreateFrame("Frame", ADDON .. "_Hider", UIParent, "SecureHandlerStateTemplate") -- State hide buttons i vehicle and petbattles
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
function NOP:ACTIONBAR_UPDATE_COOLDOWN() -- update cooldowns on quest bar and item button
  if not self.QB or (not NOP.DB.quest and self.qbHidden) then return end -- quest bar is disabled or none and hidden nothing to do
  for _, bt in ipairs(self.QB.buttons) do -- quest bar buttons text cooldowns
    if bt:IsShown() and bt.cooldown and bt.itemID then 
      local start, duration, enable = GetItemCooldown(bt.itemID)
      CooldownFrame_Set(bt.cooldown, start, duration, enable)
      --[[
      bt.expiration = startTime + duration - GetTime()
      bt.nextupdate = 0
      if (startTime > 0) and (duration > 0) then
        bt:SetScript('OnUpdate',NOP.ButtonOnUpdate)
      else
        bt:SetScript('OnUpdate',nil)
        bt.timer:SetText(nil)
      end
      if not NOP.DB.skinButton and (duration > 0) then CooldownFrame_Set(bt.cooldown,  startTime, duration, enable, true) end -- place swipe if not skinned
      ]]
    end
  end
  local bt = self.BF -- item button
  if not (bt.cooldown and bt.itemID and bt:IsShown()) then return end -- nothing there to use
  local start, duration, enable = GetItemCooldown(bt.itemID)
  CooldownFrame_Set(bt.cooldown, start, duration, enable)
  --[[
  bt.expiration = startTime + duration - GetTime()
  bt.nextupdate = 0
  if (startTime > 0) and (duration > 0) then
    bt:SetScript('OnUpdate',NOP.ButtonOnUpdate)
  else
    bt:SetScript('OnUpdate',nil)
    bt.timer:SetText(nil)
  end
  if not NOP.DB.skinButton and (duration > 0) then CooldownFrame_Set(bt.cooldown,  startTime, duration, enable, true) end -- place swipe if not skinned
  ]]
end
function NOP:SPELLCAST(event,unitID) -- if click on item produce cast then is time to update it after end of cast
  if self.itemClick and (unitID == private.UNITID_PLAYER) then
    self.itemClick = nil
    if not self.timerItemShowNew then self.timerItemShowNew = self:ScheduleTimer("ItemShowNew", private.TIMER_IDLE) end -- back to timer
  end
end