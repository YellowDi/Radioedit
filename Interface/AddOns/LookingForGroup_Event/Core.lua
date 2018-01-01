local LibStub = LibStub
local AceAddon = LibStub("AceAddon-3.0")
local LookingForGroup = AceAddon:GetAddon("LookingForGroup")
local LookingForGroup_Event = AceAddon:NewAddon("LookingForGroup_Event","AceEvent-3.0")

--------------------------------------------------------------------------------------

function LookingForGroup_Event:OnInitialize()
end

function LookingForGroup_Event:OnEnable()
	if LookingForGroup.db.profile.enable_event then
		self:RegisterEvent("LFG_LIST_APPLICANT_LIST_UPDATED")
		self:RegisterEvent("LOADING_SCREEN_DISABLED")
		self:RegisterEvent("ADDON_ACTION_BLOCKED")
		self:RegisterEvent("LFG_LIST_ACTIVE_ENTRY_UPDATE")
		self:RegisterEvent("LFG_LIST_APPLICANT_UPDATED")
	else
		self:UnregisterAllEvents()
	end
end

function LookingForGroup_Event:LFG_LIST_APPLICANT_LIST_UPDATED(event,hasNewPending,hasNewPendingWithData,...)
	if LFGListUtil_IsEntryEmpowered() then
		local active, activityID, iLevel, honorLevel, name, comment, voiceChat, expiration, autoAccept, privateGroup, questID = C_LFGList.GetActiveEntryInfo()
		if autoAccept then
			if activityID == 458 then
				ConvertToRaid()
			elseif (name and name:find("Invasion Point:")) or (comment and comment:find("Invasion Point:")) then
				ConvertToRaid()
			elseif MAX_PARTY_MEMBERS + 1 < GetNumGroupMembers(LE_PARTY_CATEGORY_HOME) + C_LFGList.GetNumInvitedApplicantMembers() + C_LFGList.GetNumPendingApplicantMembers() then
				local categoryID = select(3,C_LFGList.GetActivityInfo(activityID))
				if categoryID == 3 or categoryID == 9 then
					ConvertToRaid()
				elseif categoryID == 6 then
					StaticPopup_Show("LFG_LIST_AUTO_ACCEPT_CONVERT_TO_RAID")
				end
			end
		elseif not InCombatLockdown() and ( hasNewPending and hasNewPendingWithData ) then
			QueueStatusMinimapButton_SetGlowLock(QueueStatusMinimapButton, "lfglist-applicant", true, 1);
		end
	end
end

function LookingForGroup_Event:LFG_LIST_APPLICANT_UPDATED()
	if InCombatLockdown() or ( select(2,C_LFGList.GetNumApplicants()) == 0 ) then
		QueueStatusMinimapButton_SetGlowLock(QueueStatusMinimapButton, "lfglist-applicant", false)
	end
end

function LookingForGroup_Event:ADDON_ACTION_BLOCKED(info,addon,method)
	if addon == "LookingForGroup" and method == "Search()" then
		LookingForGroup.db.profile.hardware = true
		LookingForGroup:Print(MODE,HARDWARE)
	end
end

function LookingForGroup_Event:LOADING_SCREEN_DISABLED()
	local enable
	local name, instanceType, difficulty, difficultyName, maxPlayers, playerDifficulty, isDynamicInstance, mapID, instanceGroupSize = GetInstanceInfo()

	local profile = LookingForGroup.db.profile
	local lfrk = not profile.lfr_kick
	local pugk = profile.pug_kick
	if lfrk and difficulty==17 then
		enable = true
	end
	if pugk and (difficulty==14 or difficulty==15) then
		enable = true
	end
	local status,LookingForGroup_Kicker = pcall(AceAddon.GetAddon,AceAddon,"LookingForGroup_Kicker")
	if enable then
		if status then
			LookingForGroup_Kicker:OnEnable()
		else
			LookingForGroup_Kicker = LookingForGroup.GetAddon("LookingForGroup_Kicker")
		end
	else
		if status then
			LookingForGroup_Kicker:OnDisable()
		end
	end
end

local function relisting()
	local active, activityID, iLevel, honorLevel, name, comment,
		voiceChat, expiration, autoAccept, privateGroup, questID = C_LFGList.GetActiveEntryInfo()
	if active then
		if questID then
			name = ""
		end
		C_LFGList.UpdateListing(activityID,name,iLevel,honorLevel,voiceChat,comment,autoAccept,privateGroup,questID)
	end
end

local relisting_timer

function LookingForGroup_Event:LFG_LIST_ACTIVE_ENTRY_UPDATE()
	local active, _, _, _, _, _, _, expiration = C_LFGList.GetActiveEntryInfo()
	if relisting_timer then
		relisting_timer:Cancel()
		relisting_timer = nil
	end
	if active then
		if 10 < expiration then
			relisting_timer = C_Timer.NewTimer(expiration-10,relisting)
		else
			relisting()
		end
	end
end
