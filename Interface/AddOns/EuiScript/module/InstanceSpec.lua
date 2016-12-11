local dungeon_ready_switch_spec_button = CreateFrame("Button", nil, LFGDungeonReadyDialog, "UIPanelButtonTemplate")
local prev_text = TALENT_SPEC_ACTIVATE
local prev_width = 115
local is_shown = true
local is_disabled = false
dungeon_ready_switch_spec_button:SetText(prev_text)
dungeon_ready_switch_spec_button:SetHeight(25)
dungeon_ready_switch_spec_button:SetPoint("BOTTOM", LFGDungeonReadyDialog, "BOTTOM", 0, -46) -- -42, below BigWigs dungeon timer, 3 - below standard buttons, 45 - above standard buttons, 120 - above spec image, check if it collides with number of killed bosses
dungeon_ready_switch_spec_button:SetScript("OnClick", function()
   local proposalExists, id, typeID, subtypeID, name, texture, role, hasResponded, totalEncounters, completedEncounters, numMembers, isLeader = GetLFGProposal()
   if not proposalExists then return end

   local current_spec = GetSpecialization()
   local spec_role = GetSpecializationRole(current_spec)

   if role ~= spec_role and not InCombatLockdown() then
      local other_spec_group = 3 - GetActiveSpecGroup(false)
      local other_spec = GetSpecialization(false, false, other_spec_group)
      local other_spec_role = GetSpecializationRole(other_spec)

      if other_spec_role == role then
         SetActiveSpecGroup(other_spec_group)
      end
   end
end)

local equipment_manager_button = CreateFrame("Button", nil, dungeon_ready_switch_spec_button, "UIPanelButtonTemplate")
equipment_manager_button:SetText(EQUIPMENT_MANAGER)
local em_text_width = equipment_manager_button:GetTextWidth() + 30
if prev_width < em_text_width then em_text_width = prev_width end
equipment_manager_button:SetHeight(25)
equipment_manager_button:SetPoint("TOP", dungeon_ready_switch_spec_button, "BOTTOM", 0, 0)
equipment_manager_button:SetScript("OnClick", function()
   ToggleCharacter("PaperDollFrame", true)
   PaperDollFrame_SetSidebar(PaperDollFrame, 3)
end)

dungeon_ready_switch_spec_button:SetWidth(prev_width)
equipment_manager_button:SetWidth(em_text_width)

local role_icon = {
   TANK    = "|TInterface\\LFGFrame\\UI-LFG-ICON-PORTRAITROLES:20:20:0:0:64:64:0:19:21:40|t",
   HEALER  = "|TInterface\\LFGFrame\\UI-LFG-ICON-PORTRAITROLES:20:20:0:0:64:64:20:39:0:19|t",
   DAMAGER = "|TInterface\\LFGFrame\\UI-LFG-ICON-PORTRAITROLES:20:20:0:0:64:64:20:39:21:40|t",
   NONE    = "|TInterface\\LFGFrame\\UI-LFG-ICON-PORTRAITROLES:20:20:0:0:64:64:20:39:21:40|t"
}

local function UpdateButton()
   local proposalExists, id, typeID, subtypeID, name, texture, role, hasResponded, totalEncounters, completedEncounters, numMembers, isLeader = GetLFGProposal()
   if not proposalExists then return end

   local current_spec = GetSpecialization()
   local spec_role
   if current_spec then
      spec_role = GetSpecializationRole(current_spec)
   end

   if role == spec_role then
      if is_shown then
         dungeon_ready_switch_spec_button:Hide()
         is_shown = false
      end
      return
   else
      if not is_shown then
         dungeon_ready_switch_spec_button:Show()
         is_shown = true
      end
   end

   local other_spec_group = 3 - GetActiveSpecGroup(false)
   local other_spec = GetSpecialization(false, false, other_spec_group)
   local id, name, description, icon, background, other_spec_role, primaryStat
   if other_spec then
      id, name, description, icon, background, other_spec_role, primaryStat = GetSpecializationInfo(other_spec)
   end

   if other_spec_role ~= role then
      if is_shown then
         dungeon_ready_switch_spec_button:Hide()
         is_shown = false
      end
      return
   else
      if not is_shown then
         dungeon_ready_switch_spec_button:Show()
         is_shown = true
      end
   end

   if InCombatLockdown() then
      if not is_disabled then
         dungeon_ready_switch_spec_button:Disable()
         is_disabled = true
      end
   else
      if is_disabled then
         dungeon_ready_switch_spec_button:Enable()
         is_disabled = false
      end
   end

   local text = role_icon[other_spec_role] .. "|T" .. icon .. ":0|t" .. name .. " - " .. TALENT_SPEC_ACTIVATE
   if text ~= prev_text then
      -- print("updating text")
      dungeon_ready_switch_spec_button:SetText(text)
      local text_width_and_pad = dungeon_ready_switch_spec_button:GetTextWidth() + 30
      if text_width_and_pad > prev_width then
         -- print("updating width")
         dungeon_ready_switch_spec_button:SetWidth(text_width_and_pad)
         equipment_manager_button:SetWidth(text_width_and_pad)
         prev_width = text_width_and_pad
      end
      prev_text = text
   end
end

ISB = dungeon_ready_switch_spec_button

local event_watcher = CreateFrame("Frame", nil, LFGDungeonReadyDialog)
local event_watcher_working = false

local function LFGDungeonReadyPopup_Update_More()
   -- This gets automatically called on ACTIVE_TALENT_GROUP_CHANGED too,
   -- but we will watch event just in case this changes in future.

   local parent_is_shown = LFGDungeonReadyDialog:IsShown()
   if parent_is_shown then
      if not event_watcher_working then
         event_watcher:SetScript("OnEvent", UpdateButton) -- function() print("CAUGHT EVENT") UpdateButton() end
         event_watcher_working = true
      end
      UpdateButton()
   else
      if event_watcher_working then
         event_watcher:SetScript("OnEvent", nil)
         event_watcher_working = false
      end
   end
end
hooksecurefunc("LFGDungeonReadyPopup_Update", LFGDungeonReadyPopup_Update_More)

event_watcher:RegisterEvent("ACTIVE_TALENT_GROUP_CHANGED")
event_watcher:RegisterEvent("PLAYER_REGEN_ENABLED")
event_watcher:RegisterEvent("PLAYER_REGEN_DISABLED")