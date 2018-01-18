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
		self:RegisterEvent("ADDON_ACTION_BLOCKED")
		self:RegisterEvent("LFG_LIST_ACTIVE_ENTRY_UPDATE")
		self:RegisterEvent("LFG_LIST_APPLICANT_UPDATED")
		self:RegisterEvent("LFG_LIST_APPLICATION_STATUS_UPDATED")
		LFGListFrame:UnregisterEvent("LFG_LIST_ACTIVE_ENTRY_UPDATE")
		LFGListFrame:UnregisterEvent("LFG_LIST_APPLICANT_LIST_UPDATED")
		LFGListFrame:UnregisterEvent("LFG_LIST_ENTRY_EXPIRED_TOO_MANY_PLAYERS")
		LFGListFrame:UnregisterEvent("LFG_LIST_ENTRY_EXPIRED_TIMEOUT")
		LFGListFrame:UnregisterEvent("LFG_LIST_APPLICATION_STATUS_UPDATED")
	else
		self:UnregisterAllEvents()
		LFGListFrame:RegisterEvent("LFG_LIST_ACTIVE_ENTRY_UPDATE")
		LFGListFrame:RegisterEvent("LFG_LIST_APPLICANT_LIST_UPDATED")
		LFGListFrame:RegisterEvent("LFG_LIST_ENTRY_EXPIRED_TOO_MANY_PLAYERS")
		LFGListFrame:RegisterEvent("LFG_LIST_ENTRY_EXPIRED_TIMEOUT")
		LFGListFrame:RegisterEvent("LFG_LIST_APPLICATION_STATUS_UPDATED")
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
			if LookingForGroup.db.profile.mute then
				QueueStatusMinimapButton_SetGlowLock(QueueStatusMinimapButton, "lfglist-applicant", true, 1)
			elseif UnitIsGroupLeader("player", LE_PARTY_CATEGORY_HOME) then
				QueueStatusMinimapButton_SetGlowLock(QueueStatusMinimapButton, "lfglist-applicant", true)
			end
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

function LookingForGroup_Event:LFG_LIST_ACTIVE_ENTRY_UPDATE(event,creatednew)
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
	LFGListFrame_FixPanelValid(LFGListFrame)
	if active then
		LFGListFrame.EntryCreation.WorkingCover:Hide()
	else
		LFGListFrame_CheckPendingQuestIDSearch(LFGListFrame)
	end
	if creatednew and not LookingForGroup.db.profile.mute then
		PlaySound(SOUNDKIT.PVP_ENTER_QUEUE)
	end
end

local function handle_lfg_list_application_status_update(message,id)
	local info = ChatTypeInfo["SYSTEM"]
	local id, activityID, name, comment = C_LFGList.GetSearchResultInfo(id)
	local summary,data = string.match(comment,'^(.*)%((^1^.+^^)%)$')
	if activityID == 44 and string.find(name,"#AV#") then
		name = string.sub(name,5)
	end
	if data and not string.find(data,"LookingForGroup") then
		DEFAULT_CHAT_FRAME:AddMessage(string.format(message, summary), info.r, info.g, info.b)
	else
		DEFAULT_CHAT_FRAME:AddMessage(string.format(message, name), info.r, info.g, info.b)
	end
end

function LookingForGroup_Event:LFG_LIST_APPLICATION_STATUS_UPDATED(event, id, newStatus, oldStatus)
	if ( newStatus == "declined" ) then
		handle_lfg_list_application_status_update(LFG_LIST_APP_DECLINED_MESSAGE,id)
	elseif ( newStatus == "declined_full" ) then
		handle_lfg_list_application_status_update(LFG_LIST_APP_DECLINED_FULL_MESSAGE,id)
	elseif ( newStatus == "declined_delisted" ) then
		handle_lfg_list_application_status_update(LFG_LIST_APP_DECLINED_DELISTED_MESSAGE,id)
	elseif ( newStatus == "timedout" ) then
		handle_lfg_list_application_status_update(LFG_LIST_APP_TIMED_OUT_MESSAGE,id)
	end
end
