local AceAddon = LibStub("AceAddon-3.0")
local LookingForGroup = AceAddon:GetAddon("LookingForGroup")
local LookingForGroup_Auto = AceAddon:NewAddon("LookingForGroup_Auto")

function LookingForGroup_Auto:OnInitialize()
	self.db = LibStub("AceDB-3.0"):New("LookingForGroup_AutoCharacterDB",
	{
		profile =
		{
		}
	},true)
end

function LookingForGroup_Auto:OnEnable()
	StaticPopupDialogs.LookingForGroup_HardwareAPIDialog = {button1=ACCEPT,button2=CANCEL,timeOut = 45}
end

function LookingForGroup_Auto.hardware_api(desc,func)
	if LookingForGroup.db.profile.hardware then
		local dialog = StaticPopupDialogs.LookingForGroup_HardwareAPIDialog
		dialog.text = desc
		dialog.OnAccept = func
		StaticPopup_Show("LookingForGroup_HardwareAPIDialog")
	else
		func()
	end
end

local function lfg_active()
	local i
	local GetLFGMode = GetLFGMode
	for i = 1,6 do
		if GetLFGMode(i) then
			return true
		end
	end
	local GetBattlefieldStatus = GetBattlefieldStatus
	for i=1,GetMaxBattlefieldID() do
		if GetBattlefieldStatus(i) ~= "none" then
			return true
		end
	end
end

function LookingForGroup_Auto.restore()
	if lfg_active() and C_LFGList.GetActiveEntryInfo() and IsInGroup() then
		StaticPopup_Hide("LookingForGroup_HardwareAPIDialog")
	end
end

function LookingForGroup_Auto.apply(create)
	local count,results = C_LFGList.GetSearchResults()
	if results == nil or count == 0 then
		LookingForGroup_Auto.hardware_api(START_A_GROUP,create)
	else
		LookingForGroup_Auto.hardware_api(SIGN_UP,function()
			local i = 1
			local b = 0
			local _,tank,healer,dps = GetLFGRoles()
			while i<=#results and b<5 do
				local v = results[i]
				local _, _, _, comment, _, _, _,
					_, _, _, _,
					_, leaderName, _, autoaccept = C_LFGList.GetSearchResultInfo(v)
				if LookingForGroup.FilterRealm(leaderName) then
					if autoaccept then
						C_LFGList.ApplyToGroup(v, "", tank,healer,true)
						b = b + 1
					end
				end
				i = i+1
			end
			if 0 < b then
				C_Timer.After(5,function()
					if not IsInGroup() then
						local applications =  C_LFGList.GetApplications()
						if applications == nil or #applications == 0 then
							hardware_api(START_A_GROUP,create)
						else
							local C_LFGList_GetApplicationInfo = C_LFGList.GetApplicationInfo
							local C_LFGList_CancelApplication = C_LFGList.CancelApplication
							local ok = false
							local i
							for i = 1,#applications do
								local id = applications[i]
								local groupID, status, unknown, timeRemaining, role = C_LFGList_GetApplicationInfo(id)
								if status == "invited" then
									ok = true
								else
									C_LFGList_CancelApplication(id)
								end
							end
							if not ok then
								if LookingForGroup.db.profile.hardware then
									LookingForGroup_Auto.hardware_api(START_A_GROUP,create)
								else
									C_Timer.After(1,create)
								end
							end
						end
					end
				end)
			else
				create()
			end
		end)
	end
end

function LookingForGroup_Auto.accepted(search)
	local status,LookingForGroup_Options = pcall(AceAddon.GetAddon,AceAddon,"LookingForGroup_Options")
	if status then
		LookingForGroup_Options.Background_Timer_Stop()
		LookingForGroup_Options.Background_NoSearchResult_StartMusic()
	end
	LookingForGroup_Auto.hardware_api(SEARCH,search)
end


function LookingForGroup_Auto.abandon(func)
	if lfg_active() then
		StaticPopup_Hide("LookingForGroup_HardwareAPIDialog")
		return true
	end
	local applications = C_LFGList.GetApplications()
	local i
	for i = 1,#applications do
		local id,status = C_LFGList.GetApplicationInfo(applications[i])
		if status == "invited" then
			C_LFGList.DeclineInvite(id)
		end
	end
	if IsMounted() then
		LeaveParty()
		StaticPopup_Hide("LookingForGroup_HardwareAPIDialog")
		return true
	end
	if GetNumGroupMembers() == 0 then
		StaticPopup_Hide("LookingForGroup_HardwareAPIDialog")
		return true
	else
		StaticPopupDialogs.LookingForGroup_HardwareAPIDialog.text = PARTY_LEAVE
		StaticPopupDialogs.LookingForGroup_HardwareAPIDialog.OnAccept = func
		StaticPopup_Show("LookingForGroup_HardwareAPIDialog")
	end
end

function LookingForGroup_Auto.done()
	if lfg_active() then
		StaticPopup_Hide("LookingForGroup_HardwareAPIDialog")
		return
	end
	local applications = C_LFGList.GetApplications()
	for i = 1,#applications do
		local id,status = C_LFGList.GetApplicationInfo(applications[i])
		if status == "invited" then
			C_LFGList.DeclineInvite(id)
		end
	end
	if LookingForGroup.db.profile.wq_leave_party then
		LeaveParty()
		return
	end
	if GetNumGroupMembers() < 2 then
		LeaveParty()
		StaticPopup_Hide("LookingForGroup_HardwareAPIDialog")
	else
		StaticPopupDialogs.LookingForGroup_HardwareAPIDialog.text = PARTY_LEAVE
		StaticPopupDialogs.LookingForGroup_HardwareAPIDialog.OnAccept = LeaveParty
		StaticPopup_Show("LookingForGroup_HardwareAPIDialog")
	end
end
