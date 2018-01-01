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

local function hardware_func(desc,func)
	local dialog = StaticPopupDialogs.LookingForGroup_HardwareAPIDialog
	dialog.text = desc
	dialog.OnAccept = func
	StaticPopup_Show("LookingForGroup_HardwareAPIDialog")
end

local function hardware_api(desc,func,secure)
	if not secure and LookingForGroup.db.profile.hardware then
		hardware_func(desc,func)
	else
		func()
	end
end

local GetLFGMode = GetLFGMode
local GetMaxBattlefieldID = GetMaxBattlefieldID
local GetBattlefieldStatus = GetBattlefieldStatus

local function lfg_active()
	for i = 1,6 do
		if GetLFGMode(i) then
			return true
		end
	end
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

local function hardware_search(create,results)
	local filter_realm = LookingForGroup.FilterRealm
	local maxnum = 0
	local maxid
	for i=1,#results do
		local id, activityID, name, comment, voiceChat, iLvl, honorLevel, age, numBNetFriends, numCharFriends, numGuildMates, isDelisted, leaderName, numMembers, autoaccept = C_LFGList.GetSearchResultInfo(results[i])
		if not isDelisted and autoaccept and filter_realm(leaderName) then
			if numMembers == 5 then
				if maxid == nil then
					maxid = id
				end
			elseif maxnum < numMembers then
				maxnum = numMembers
				maxid = id
			end
		end
	end
	if maxid then
		hardware_func(SIGN_UP,function()
			local isDelisted, _, numMembers, autoaccept = select(12,C_LFGList.GetSearchResultInfo(maxid))
			if isDelisted or not autoaccept then
				hardware_func(START_A_GROUP,create)
				return
			end
			local _,tank,healer,dps = GetLFGRoles()
			C_LFGList.ApplyToGroup(maxid, "", tank,healer,true)
			C_Timer.After(5,function()
				local groupID, status = C_LFGList.GetApplicationInfo(maxid)
				if status == "applied" then
					hardware_func(CANCEL_SIGN_UP,function()
						C_LFGList.CancelApplication(groupID)
						hardware_func(START_A_GROUP,create)
					end)
				elseif status ~= "invited" and status ~= "inviteaccepted" then
					hardware_func(START_A_GROUP,create)
				end
			end)
		end)
	else
		hardware_func(START_A_GROUP,create)
	end
end

function LookingForGroup_Auto.apply(create)
	local count,results = C_LFGList.GetSearchResults()
	if count == 0 then
		hardware_api(START_A_GROUP,create)
	else
		local profile = LookingForGroup.db.profile
		if profile.hardware then
			hardware_search(create,results)
			return
		end
		local _,tank,healer,dps = GetLFGRoles()
		local i = 1
		local b = 0
		while i<=#results and b<5 do
			local id, activityID, name, comment, voiceChat, iLvl, honorLevel, age, numBNetFriends, numCharFriends, numGuildMates, isDelisted, leaderName, numMembers, autoaccept = C_LFGList.GetSearchResultInfo(results[i])
			if not isDelisted and autoaccept and LookingForGroup.FilterRealm(leaderName) then
				C_LFGList.ApplyToGroup(id, "", tank,healer,true)
				b = b + 1
			end
			i = i+1
		end
		if 0 < b then
			if profile.auto_auto_accept then
				C_Timer.After(0.5,function()
					local applications = C_LFGList.GetApplications()
					for i = 1,#applications do
						C_LFGList.AcceptInvite(applications[i])
					end
				end)
			end
			C_Timer.After(5,function()
				if not IsInGroup() then
					local applications =  C_LFGList.GetApplications()
					if applications == nil or #applications == 0 then
						create()
					else
						local C_LFGList_GetApplicationInfo = C_LFGList.GetApplicationInfo
						local C_LFGList_CancelApplication = C_LFGList.CancelApplication
						local ok = false
						local i
						for i = 1,#applications do
							local groupID, status, unknown, timeRemaining, role = C_LFGList_GetApplicationInfo(applications[i])
							if status == "invited" then
								ok = true
							else
								C_LFGList_CancelApplication(groupID)
							end
						end
						if not ok then
							C_Timer.After(1,create)
						end
					end
				end
			end)
		else
			create()
		end
	end
end

function LookingForGroup_Auto.accepted(create,search,secure,name,value)
	if lfg_active() then
		return
	end
	local status,LookingForGroup_Options = pcall(AceAddon.GetAddon,AceAddon,"LookingForGroup_Options")
	if status then
		LookingForGroup_Options.Background_Timer_Stop()
		LookingForGroup_Options.Background_NoSearchResult_StartMusic()
	end
	if IsInGroup() then
		if not C_LFGList.GetActiveEntryInfo() and UnitIsGroupLeader("player") then
			hardware_api(START_A_GROUP,create,secure)
		end
	else
		if name and value then
			LookingForGroup_Auto.db.profile[name] = value
		end
		if LookingForGroup.db.profile.auto_start_a_group then
			hardware_api(START_A_GROUP,create,secure)
		else
			hardware_api(SEARCH,search,secure)
		end
	end
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
