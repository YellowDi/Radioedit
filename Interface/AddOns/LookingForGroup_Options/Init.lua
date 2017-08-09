LoadAddOn("LookingForGroup_Locale")
local AceAddon = LibStub("AceAddon-3.0")
local LookingForGroup_Options = AceAddon:NewAddon("LookingForGroup_Options","AceEvent-3.0","AceTimer-3.0")
local LookingForGroup = AceAddon:GetAddon("LookingForGroup")

LookingForGroup_Options.option_table =
{
	type = "group",
	name = "LookingForGroup",
	args = {}
}

local order = 0
local function get_order()
	local temp = order
	order = order +1
	return temp
end

function LookingForGroup_Options.GetRoleIcon(role)
	if role == "DAMAGER" then
		return "|TInterface\\LFGFrame\\UI-LFG-ICON-PORTRAITROLES:16:16:0:0:64:64:20:39:22:41|t"
	elseif role == "HEALER" then
		return "|TInterface\\LFGFrame\\UI-LFG-ICON-PORTRAITROLES:16:16:0:0:64:64:20:39:1:20|t"
	elseif role == "TANK" then
		return "|TInterface\\LFGFrame\\UI-LFG-ICON-PORTRAITROLES:16:16:0:0:64:64:0:19:22:41|t"
	end
end

function LookingForGroup_Options : push(key,val)
	if val.order == nil then
		val.order = get_order()
	end
	self.option_table.args[key] = val
end

function LookingForGroup_Options.set_search_result(tb)
	LookingForGroup_Options.option_table.args.search_result = tb
end

function LookingForGroup_Options.reset_search_result()
	LookingForGroup_Options.option_table.args.search_result = nil
end

function LookingForGroup_Options : get_table()
	return self.option_table
end

local LookingForGroup_AV
local C_LFGList_GetSearchResultInfo = C_LFGList.GetSearchResultInfo
local C_LFGList_ApplyToGroup = C_LFGList.ApplyToGroup

local string_find = string.find
local tonumber = tonumber
local string_match = string.match
local table_insert = table.insert

function LookingForGroup_Options.issubstr(s,substr)
	local sbyte = string.byte
	local i = 1
	local slen = s:len()
	local substr_len = substr:len()
	local j = 1
	while i <= slen and j <= substr_len do
		if sbyte(s,i) == sbyte(substr,j) then
			j = j + 1
		else
			j = 1
		end
		i = i + 1
	end
	if substr_len < j then
		return true
	end
end

function LookingForGroup_Options.GetLFG_AV()
	if LookingForGroup_AV == nil then
		LookingForGroup_AV = LookingForGroup.GetAddon("LookingForGroup_AV")
	end
	return LookingForGroup_AV
end

local results_tb = {}

local function language_filter(name,comment,voicechat)
	local profile = LookingForGroup.db.profile
	if profile.spam_filter_language then
		local msg = name..voicechat..comment
		if string_find(msg,"[\128-\255]") then
			local f
			if profile.spam_filter_language_russian and string_find(msg,"\208") then
				f = true
			end
			if profile.spam_filter_language_chinese and string_find(msg,"\228-\233") then
				f = true
			end
			if profile.spam_filter_language_korean and string_find(msg,"\234-\237") then
				f = true
			end
			if not f then
				return true
			end
		elseif not profile.spam_filter_language_english then
			return true
		end
	end
end


local filter_realm = LookingForGroup.FilterRealm
local issubstr = LookingForGroup_Options.issubstr

function LookingForGroup_Options.FilterSearchResult(groupid)
	local id, activityID, name, comment, voiceChat, iLvl, honorLevel,
		age, numBNetFriends, numCharFriends, numGuildMates,
		isDelisted, leaderName, numMembers, autoaccept = C_LFGList_GetSearchResultInfo(groupid)
	local summary,data = string_match(comment,'^(.*)%((^1^.+^^)%)$')
	if summary then
		comment = summary
	end
	if data and not issubstr(data,"LookingForGroup") then
		name = ""
		comment = summary
	end
	if not filter_realm(leaderName) then
		return
	end
	if LookingForGroup_Options.db.profile.find_a_group_language and language_filter(name,comment,voiceChat) then
		return
	end
	local i
	if LookingForGroup_Options.db.profile.find_a_group_gold then
		local profile = LookingForGroup.db.profile
		local filters = profile.spam_filter_keywords
		local maxlength = profile.spam_filter_maxlength
		if maxlength and ( maxlength < name:len() or maxlength < comment:len() or maxlength < voiceChat:len() ) then
			return true
		end
		name = name:gsub(" ",""):lower()
		comment = comment:gsub(" ",""):lower()
		voiceChat = voiceChat:gsub(" ",""):lower()
		for i=1,#filters do
			local ele = filters[i]
			if string_find(name,ele) or string_find(comment,ele) or string_find(voiceChat,ele) then
				return true
			end
		end
		return
	else
		local profile = LookingForGroup.db.profile
		local filters = profile.spam_filter_keywords
		local maxlength = profile.spam_filter_maxlength
		if maxlength and ( maxlength < name:len() or maxlength < comment:len() or maxlength < voiceChat:len() ) then
			return
		end
		name = name:gsub(" ",""):lower()
		comment = comment:gsub(" ",""):lower()
		voiceChat = voiceChat:gsub(" ",""):lower()
		for i=1,#filters do
			local ele = filters[i]
			if string_find(name,ele) or string_find(comment,ele) or string_find(voiceChat,ele) then
				return
			end
		end
		return true
	end
end

function LookingForGroup_Options.GetResultsTB()
	return results_tb
end

function LookingForGroup_Options.GetSearchResults()
	local _,groupsIDs = C_LFGList.GetSearchResults()
	wipe(results_tb)
	local fsr = LookingForGroup_Options.FilterSearchResult
	local i
	for i=1,#groupsIDs do
		local ele = groupsIDs[i]
		if fsr(ele) then
			table_insert(results_tb,ele)
		end
	end
	LookingForGroup_Options.SortSearchResults(results_tb)
	return results_tb
end

function LookingForGroup_Options.ApplyToGroup(lfgid,cmt,...)
	local id, activityID, name, comment, voiceChat, iLvl, honorLevel,
		age, numBNetFriends, numCharFriends, numGuildMates,
		isDelisted, leaderName, numMembers, autoaccept = C_LFGList_GetSearchResultInfo(lfgid)
	if activityID == 44 and string_find(name,"#AV#") then
		if LookingForGroup_AV == nil then
			LookingForGroup_AV = LookingForGroup.GetAddon("LookingForGroup_AV")
		end
		LookingForGroup_AV.ApplyToGroup(lfgid,cmt,...)
		return
	end
	if comment ~= nil then
		local wq_id = tonumber(string_match(comment,"#WQ:([%d]+)#"))
		if wq_id ~= nil then
			C_LFGList_ApplyToGroup(lfgid, "WorldQuestGroupFinderUser-"..wq_id, ...)
			return
		end
		if string_find(comment,'^(.*)%((^1^.+^^)%)$') then
			if cmt == nil then
				cmt = ""
			end
			cmt = cmt.."(^1^N2147483647^^)"
		end
	end
	C_LFGList_ApplyToGroup(lfgid, cmt, ...)
end
