local LibStub = LibStub
local AceAddon = LibStub("AceAddon-3.0")
local LookingForGroup = AceAddon:GetAddon("LookingForGroup")
local LookingForGroup_Options = AceAddon:GetAddon("LookingForGroup_Options")
local AceGUI = LibStub("AceGUI-3.0")
local AceConfigDialog = LibStub("AceConfigDialog-3.0")
local L = LibStub("AceLocale-3.0"):GetLocale("LookingForGroup")
local wipe = wipe
local table_insert = table.insert
local C_LFGList_GetSearchResultInfo = C_LFGList.GetSearchResultInfo
local C_LFGList_ApplyToGroup = C_LFGList.ApplyToGroup
local pairs = pairs

local order = 0
local function get_order()
	local temp = order
	order = order +1
	return temp
end

local party_tb = {}

local cr_sr =
{
	name = KBASE_SEARCH_RESULTS,
	desc = LFG_LIST_SELECT_A_SEARCH_RESULT,
	type = "group",
}

local sign_up

local rc_args,select_sup=LookingForGroup_Options.CreateReceivedArgs(
						"LookingForGroup_Options_Cross_Realm_Multiselect",party_tb,"cr",function() sign_up() end)

local function callback()
	wipe(party_tb)
	local counts,results = C_LFGList.GetSearchResults()
	local player_realm = GetRealmName()
	local string_find = string.find
	local string_match = string.match
	local C_LFGList_GetActivityInfo = C_LFGList.GetActivityInfo
	local i
	for i=1,#results do
		local ri = results[i]
		local id, activityID, name, comment, voiceChat, iLvl, honorLevel,
				age, numBNetFriends, numCharFriends, numGuildMates,
				isDelisted, leaderName, numMembers, isAutoAccept = C_LFGList_GetSearchResultInfo(ri)
		local activity = C_LFGList_GetActivityInfo(activityID)
		if isAutoAccept and leaderName ~= nil then
			local realm = string_match(leaderName,"-(.*)$")
			if realm == nil then
				realm = player_realm
			end
			if party_tb[realm] == nil then
				party_tb[realm] = {}
			end
			table_insert(party_tb[realm],ri)
		end
	end
	LookingForGroup_Options.NotifyChangeIfSelected("search_result")
	return #party_tb
end

sign_up=function()
	local tank,healer,dps = select(2,GetLFGRoles())
	local comment_text = LookingForGroup_Options.db.profile.role_comment_text
	local applications =  C_LFGList.GetApplications()
	local n = #applications
	local ApplyToGroup = LookingForGroup_Options.ApplyToGroup
	if LookingForGroup.db.profile.hardware then
		local C_LFGList_GetApplicationInfo = C_LFGList.GetApplicationInfo
		for i = 1,n do
			local groupID, status, unknown, timeRemaining, role = C_LFGList_GetApplicationInfo(applications[i])
			if status == "applied" then
				C_LFGList.CancelApplication(groupID)
				return
			elseif status == "invited" then
				C_LFGList.DeclineInvite(groupID)
				return
			end
		end
		for k,v in pairs(select_sup) do
			if v then
				local party = party_tb[k]
				local np = #party
				for i=np,1,-1 do
					if ApplyToGroup(party[i],comment_text,tank,healer,dps) then
						party[i] = nil
						if #party == 0 then
							select_sup[k] = nil
						end
						return
					end					
				end
			end
		end
	else
		local C_LFGList_CancelApplication = C_LFGList.CancelApplication
		for i = 1,n do
			C_LFGList_CancelApplication(applications[i])
		end
		for k,v in pairs(select_sup) do
			if v then
				local party = party_tb[k]
				for i=1,#party do
					ApplyToGroup(party[i],comment_text,tank,healer,dps)
				end
			end
		end
	end
end

local matches = {}
local realm_matches = {}
local terms = {{matches = matches},{matches = realm_matches}}

function LookingForGroup_Options.DoCRSearch()
	if LookingForGroup_Options.db.profile.cr_map then
		matches[1] = GetMapNameByID(GetCurrentMapAreaID())
	else
		matches[1] = nil
	end
	if LookingForGroup_Options.db.profile.cr_realm then
		realm_matches[1] = LookingForGroup_Options.db.profile.cr_realm
	else
		realm_matches[1] = nil
	end
	LookingForGroup_Options.Search(rc_args,callback,LookingForGroup_Options.db.profile.cr_category,
									terms,0,0,0.3)
end

rc_args.results.args.search_again.func = LookingForGroup_Options.DoCRSearch

LookingForGroup_Options:push("cr",{
	name = L["Cross Realm"],
	type = "group",
	args =
	{
		scan =
		{
			order = get_order(),
			name = L.cr_realm_scan,
			desc = L.cr_realm_scan_desc,
			type = "execute",
			func = function()
				LookingForGroup.GetAddon("LookingForGroup_CR").do_scan()
			end,
		},
		rand_hop =
		{
			order = get_order(),
			name = L.cr_realm_rand_hop,
			desc = L.cr_realm_rand_hop_desc,
			type = "execute",
			func = function()
				LookingForGroup.GetAddon("LookingForGroup_CR").do_hop()
			end,
		},
		search =
		{
			order = get_order(),
			name = SEARCH,
			type = "execute",
			func = LookingForGroup_Options.DoCRSearch,
		},
		cancel =
		{
			order = get_order(),
			name = RESET,
			type = "execute",
			func = function()
				LookingForGroup_Options:RestoreDBVariable("cr_category")
				LookingForGroup_Options.db.profile.cr_map = nil
				LookingForGroup_Options.db.profile.cr_realm = nil
			end
		},
		map =
		{
			order = get_order(),
			name = function() return GetMapNameByID(GetCurrentMapAreaID()) end,
			type = "toggle",
			get = function(info)
				return LookingForGroup_Options.db.profile.cr_map
			end,
			set = function(info,val)
				LookingForGroup_Options.db.profile.cr_map = val
			end
		},
		realm =
		{
			order = get_order(),
			name = FRIENDS_LIST_REALM:match("^(.*)%:") or FRIENDS_LIST_REALM:match("^(.*)%：") or FRIENDS_LIST_REALM,
			type = "input",
			get = function(info)
				return LookingForGroup_Options.db.profile.cr_realm
			end,
			set = function(info,val)
				if val == "" then
					LookingForGroup_Options.db.profile.cr_realm = nil
				else
					LookingForGroup_Options.db.profile.cr_realm = val
				end
			end
		},
		category =
		{
			order = get_order(),
			name = CATEGORY,
			type = "select",
			values = LookingForGroup_Options.categorys_values,
			get = function(info) return LookingForGroup_Options.db.profile.cr_category end,
			set = function(info,key) LookingForGroup_Options.db.profile.cr_category = key end,
		},
		rdh =
		{
			name = L.cr_realm_rand_hop,
			type = "group",
			args =
			{
				aacpt = 
				{
					name = LFG_LIST_AUTO_ACCEPT,
					type = "toggle",
					get = function(info)
						return LookingForGroup.db.profile.cr_auto_accept
					end,
					set = function(info,val)
						if val then
							LookingForGroup.db.profile.cr_auto_accept = val
						else
							LookingForGroup.db.profile.cr_auto_accept = nil
						end
					end
				},
				scafterhop = 
				{
					name = L.cr_realm_scan,
					type = "toggle",
					get = function(info)
						return LookingForGroup.db.profile.cr_scan_realm_after_hop
					end,
					set = function(info,val)
						if val then
							LookingForGroup.db.profile.cr_scan_realm_after_hop = val
						else
							LookingForGroup.db.profile.cr_scan_realm_after_hop = nil
						end
					end
				},
				lp = 
				{
					name = PARTY_LEAVE,
					type = "toggle",
					get = function(info)
						return LookingForGroup.db.profile.cr_leave_party
					end,
					set = function(info,val)
						LookingForGroup.db.profile.cr_leave_party = val
					end
				}
			}
		}
	}
})

local function tooltip_feedback()
	GameTooltip:ClearLines()
	local owner = GameTooltip:GetOwner()
	local obj = owner.obj
	local users = obj:GetUserDataTable()
	local key = users.key
	local val = users.val
	local i
	local q = {}
	for i=1,#val do
		local ri = val[i]
		local isDelisted = select(12,C_LFGList_GetSearchResultInfo(ri))
		if isDelisted == false then
			table_insert(q,ri)
		end
	end
	
	if next(q) == nil then
		obj:SetDisabled(true)
		if LookingForGroup_Options.CR_Tooltip_Feedback_timer ~= nil then
			LookingForGroup_Options:CancelTimer(LookingForGroup_Options.CR_Tooltip_Feedback_timer)
			LookingForGroup_Options.CR_Tooltip_Feedback_timer = nil
		end
		party_tb[key] = nil
	else
		party_tb[key] = q
	end
	
	local tm = "|cff8080cc("..#q..")|r"
	obj:SetLabel(key.." "..tm)
	GameTooltip:AddDoubleLine(key,#q)
	for i=1,#q do
		local id, activityID, name, comment, voiceChat, iLvl, honorLevel,
		age, numBNetFriends, numCharFriends, numGuildMates,
		isDelisted, leaderName, numMembers = C_LFGList.GetSearchResultInfo(q[i])
		local activity = C_LFGList.GetActivityInfo(activityID)
		if leaderName then
			GameTooltip:AddDoubleLine("|cff8080cc"..activity.."|r",leaderName)
		else
			GameTooltip:AddLine("|cff8080cc"..activity.."|r")
		end
	end
	GameTooltip:Show()
end

AceGUI:RegisterWidgetType("LookingForGroup_Options_Cross_Realm_Multiselect", function()
	local control = AceGUI:Create("InlineGroup")
	control:SetLayout("Flow")
	control.width = "fill"
	control.SetList = function(self,values)
		self.values = values
	end
	control.SetLabel = function(self,value)
		self:SetTitle(value)
	end
	control.SetDisabled = function(self,disabled)
		self.disabled = disabled
	end
	control.SetMultiselect = function()end
	control.SetItemValue = function(self,key)
		local val = self.values[key]
		local check = AceGUI:Create("CheckBox")
		check:SetUserData("key", key)
		check:SetUserData("val", val)
		check:SetValue(select_sup[key])
		check:SetLabel(key.." |cff8080cc("..#val..")|r")
		check:SetCallback("OnValueChanged",function(self,event,val)
			local user = self:GetUserDataTable()
			local key = user.key
			select_sup[key] = val
			check:SetValue(select_sup[key])
		end)
		check:SetCallback("OnLeave", function(self,...)
			if LookingForGroup_Options.CR_Tooltip_Feedback_timer ~= nil then
				LookingForGroup_Options:CancelTimer(LookingForGroup_Options.CR_Tooltip_Feedback_timer)
				LookingForGroup_Options.CR_Tooltip_Feedback_timer = nil
			end
			GameTooltip:Hide()
		end)
		check:SetCallback("OnEnter", function(self,...)
			if LookingForGroup_Options.CR_Tooltip_Feedback_timer ~= nil then
				LookingForGroup_Options:CancelTimer(LookingForGroup_Options.CR_Tooltip_Feedback_timer)
			end
			GameTooltip:SetOwner(self.frame,"ANCHOR_TOPRIGHT")
			LookingForGroup_Options.CR_Tooltip_Feedback_timer = LookingForGroup_Options:ScheduleRepeatingTimer(tooltip_feedback,1)
			tooltip_feedback()
		end)
		self:AddChild(check)
	end
	return AceGUI:RegisterAsContainer(control)
end , 1)
