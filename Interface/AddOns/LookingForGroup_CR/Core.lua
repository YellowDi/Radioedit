LoadAddOn("LookingForGroup_Locale")
local LookingForGroup = LibStub("AceAddon-3.0"):GetAddon("LookingForGroup")
local LookingForGroup_CR = LibStub("AceAddon-3.0"):NewAddon("LookingForGroup_CR","AceEvent-3.0","AceTimer-3.0")

local L = LibStub("AceLocale-3.0"):GetLocale("LookingForGroup")

local function print_result(tb)
	local tb2 = {}
	local k,v
	local num = 0
	local table_insert = table.insert
	for k,v in pairs(tb) do
		table_insert(tb2,{k,v})
		num = num + v
	end
	table.sort(tb2,function(a,b) return b[2] < a[2]; end)
	if num == 0 then
		LookingForGroup:Print(L.Results,UNKNOWN)
	else
		local n = #tb2
		local string_format = string.format
		LookingForGroup:Print(L.Results)
		for i = 1, n do
			local ti = tb2[i]
			LookingForGroup:Print(i,ti[1],string_format("%.0f%%",100 * ti[2]/num))
			if i < n and tb2[i+1][2]*2 < ti[2] then
				break
			end
		end
	end
end

local log_tb = {}
local player_realm = GetRealmName()
local event_counter = 0

local function add_to_log_tb(uid,name)
	if not string.find(uid,"Player") or UnitGUID("player") == uid then
		return
	end
	local realm = string.match(name,"-(.*)$")
	if realm == nil then
		realm = player_realm
	end
	if log_tb[realm] == nil then
		log_tb[realm] = 1
	else
		log_tb[realm] = log_tb[realm] + 1
	end
	event_counter = event_counter + 1
end

function LookingForGroup_CR:COMBAT_LOG_EVENT_UNFILTERED(...)
	add_to_log_tb(select(5, ...))
	add_to_log_tb(select(9, ...))
	if 50 < event_counter then
		self:TimerFeedback()
	end
end

function LookingForGroup_CR:TimerFeedback()
	self:UnregisterEvent("WHO_LIST_UPDATE")
	self:UnregisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
	print_result(log_tb)
	wipe(log_tb)
	event_counter = 0
	if LookingForGroup_CR.timer ~= nil then
		self:CancelTimer(LookingForGroup_CR.timer)
		LookingForGroup_CR.timer = nil
	end
end

function LookingForGroup_CR:WHO_LIST_UPDATE()
	self:UnregisterEvent("WHO_LIST_UPDATE")
	local i
	local numwho = GetNumWhoResults()
	local tb = {}
	local GetWhoInfo = GetWhoInfo
	local string_match = string.match
	local table_insert = table.insert
	local all_player_realm = true
	for i = 1,numwho do
		local name = GetWhoInfo(i)
		local realm = string_match(name,"-(.*)$")
		if realm == nil then
			realm = player_realm
		else
			all_player_realm = false
		end
		local tbs = tb[realm]
		if tbs == nil then
			tb[realm] = 1
		else
			tb[realm] = tbs + 1
		end
	end
	if not all_player_realm then
		LookingForGroup_CR:UnregisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
		if LookingForGroup_CR.timer ~= nil then
			self:CancelTimer(LookingForGroup_CR.timer)
			LookingForGroup_CR.timer = nil
		end
		print_result(tb)
	end
end

function LookingForGroup_CR.do_scan()
	local name, t = GetInstanceInfo()
	if t == "none" then
		if LookingForGroup_CR.timer ~= nil then
			LookingForGroup_CR:CancelTimer(LookingForGroup_CR.timer)
			LookingForGroup_CR.timer = LookingForGroup_CR:ScheduleTimer("TimerFeedback", 20)
			LookingForGroup_CR:UnregisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
		end
		LookingForGroup:Print(L.cr_scanningyourcurrentrealm)
		wipe(log_tb)
		event_counter = 0
		LookingForGroup_CR.timer = LookingForGroup_CR:ScheduleTimer("TimerFeedback", 20)
		LookingForGroup_CR:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
		LookingForGroup_CR:RegisterEvent("WHO_LIST_UPDATE")
		SendWho("z-\""..GetZoneText().."\"")
	else
		LookingForGroup:Print(INSTANCE)
	end
end

local matches = {}
local searchTerms = {{matches = matches}}

local function apply_to_group(id,...)
	C_Timer.After(1,function()
		C_LFGList.AcceptInvite(id)
	end)
	C_LFGList.ApplyToGroup(id,...)
end

local function hop()
	local counts,results = C_LFGList.GetSearchResults()
	local string_match = string.match
	local filter_realm = LookingForGroup.FilterRealm
	local C_LFGList_GetSearchResultInfo = C_LFGList.GetSearchResultInfo
	local profile = LookingForGroup.db.profile
	if LookingForGroup.db.profile.hardware then
		local dialog = StaticPopupDialogs.LookingForGroup_HardwareAPIDialog
		if dialog == nil then
			dialog = {button1=ACCEPT,button2=CANCEL,timeOut = 45}
			StaticPopupDialogs.LookingForGroup_HardwareAPIDialog = dialog
		end
		dialog.text = SIGN_UP
		dialog.OnAccept = function()
			for i=1,#results do
				local id, _, _, comment, _, _, _,
						_, _, _, _,
						isDelisted, leaderName, numMembers, isAutoAccept = C_LFGList_GetSearchResultInfo(results[i])
				if not isDelisted and isAutoAccept and numMembers ~= 5 and filter_realm(leaderName) then
					local leader,tank,healer,dps = GetLFGRoles()
					C_LFGList.ApplyToGroup(id,"",tank,healer,true)
					if profile.cr_leave_party then
						LookingForGroup_CR:ScheduleTimer(LeaveParty,10)
					end
					return
				end
			end
		end
		StaticPopup_Show("LookingForGroup_HardwareAPIDialog")
	else
		local ApplyToGroup 
		if profile.cr_auto_accept then
			ApplyToGroup = apply_to_group
		else
			ApplyToGroup = C_LFGList.ApplyToGroup
		end
		local leader,tank,healer,dps = GetLFGRoles()
		local j = 0
		for i=1,#results do
			local id, _, _, comment, _, _, _,
					_, _, _, _,
					isDelisted, leaderName, numMembers, isAutoAccept = C_LFGList_GetSearchResultInfo(results[i])
			if not isDelisted and isAutoAccept and numMembers ~= 5 and filter_realm(leaderName) then
				ApplyToGroup(id,"",tank,healer,true)
				j = j + 1
				if j == 2 then
					break
				end
			end
		end
		if profile.cr_leave_party then
			LookingForGroup_CR:ScheduleTimer(LeaveParty,10)
		end
	end
end

function LookingForGroup_CR.do_hop()
	if UnitInParty("player") and not UnitIsGroupLeader("player") then
		return
	end
	matches[1] = GetMapNameByID(GetCurrentMapAreaID())
	LookingForGroup.Search(hop,1,searchTerms,0,0)
end

function LookingForGroup_CR:OnInitialize()
end

function LookingForGroup_CR:OnEnable()
	SetWhoToUI(0)
	FriendsFrame:UnregisterEvent("WHO_LIST_UPDATE")
end
