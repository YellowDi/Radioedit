local LookingForGroup = LibStub("AceAddon-3.0"):GetAddon("LookingForGroup")
local LookingForGroup_Core = LibStub("AceAddon-3.0"):NewAddon("LookingForGroup_Core")

local C_LFGList_GetSearchResultInfo = C_LFGList.GetSearchResultInfo
local C_LFGList_GetActivityInfo = C_LFGList.GetActivityInfo
local C_LFGList_GetSearchResultMemberInfo = C_LFGList.GetSearchResultMemberInfo
local C_LFGList_GetSearchResultEncounterInfo = C_LFGList.GetSearchResultEncounterInfo
local C_LFGList_GetActiveEntryInfo = C_LFGList.GetActiveEntryInfo
local C_LFGList_GetNumApplicants = C_LFGList.GetNumApplicants
local string_find = string.find
local math_floor = math.floor
local string_format = string.format
local string_match = string.match
local table_sort = table.sort
local table_concat = table.concat
local wipe = wipe
local GetGroupMemberCounts = GetGroupMemberCounts
local RAID_CLASS_COLORS = RAID_CLASS_COLORS

local member_roles_tb = {}
local concat_tb = {}
local tank_tb = {}
local healer_tb = {}
local damager_tb = {}
local table_insert = table.insert
local class_table = FillLocalizedClassList({})
local pairs = pairs
local string_gsub = string.gsub
local tank_icon = "|TInterface\\LFGFrame\\UI-LFG-ICON-PORTRAITROLES:16:16:0:0:64:64:0:19:22:41|t"
local healer_icon = "|TInterface\\LFGFrame\\UI-LFG-ICON-PORTRAITROLES:16:16:0:0:64:64:20:39:1:20|t"
local damager_icon = "|TInterface\\LFGFrame\\UI-LFG-ICON-PORTRAITROLES:16:16:0:0:64:64:20:39:22:41|t"
local name_ct = {}

local function add_role_num(prefix,id,numMembers)
	wipe(name_ct)
	table_insert(name_ct,prefix)
	table_insert(name_ct,"|cff00ffff")
	table_insert(name_ct,numMembers)
	local i
	local tanks,healers,damagers = 0,0,0
	for i = 1, numMembers do
		local role = C_LFGList_GetSearchResultMemberInfo(id,i)
		if role == "TANK" then
			tanks = tanks + 1
		elseif role == "HEALER" then
			healers = healers + 1
		elseif role == "DAMAGER" then
			damagers = damagers + 1
		end
	end
	table_insert(name_ct,"(")
	table_insert(name_ct,tanks)
	table_insert(name_ct,"/")
	table_insert(name_ct,healers)
	table_insert(name_ct,"/")
	table_insert(name_ct,damagers)
	table_insert(name_ct,")|r")
	return table_concat(name_ct)
end

function LookingForGroup_Core.GetSearchResultName(resultID)
	local id, activityID, name, comment, voiceChat, iLvl, honorLevel,
			age, numBNetFriends, numCharFriends, numGuildMates,
			isDelisted, leaderName, numMembers = C_LFGList_GetSearchResultInfo(resultID)
	local activityName, shortName, categoryID, groupID, itemLevel, filters, minLevel, maxPlayers, displayType = 
			C_LFGList_GetActivityInfo(activityID)
			
	local summary,data = string_match(comment,'^(.*)%((^1^.+^^)%)$')
	if summary then
		comment = summary
	end
	local masummary,mdata = string_match(comment,'^(.*)%[LFG:(.*)%]$')
	if masummary then
		comment = masummary
		local val = string_gsub(mdata,"##","\n")
		activityName = table_concat{activityName,"\n",val}
	end
	if activityID == 44 and string_find(name,"#AV#") then
		name = string.sub(name,5)
		activityName = GetMapNameByID(401)
	end
	if data and not string_find(data,"LookingForGroup") then
		name = '|cff8080cc'..activityName
	else
		name = name..'\n|cff8080cc'..activityName
	end
	name = add_role_num(name..'|r\n',id,numMembers)
	if activityID == 458 or categoryID == 1 then
		return name
	end
	return name , comment
end

function LookingForGroup_Core.GetSearchResultCancelName(resultID)
	local id, activityID, name, comment = C_LFGList_GetSearchResultInfo(resultID)
	local summary,data = string_match(comment,'^(.*)%((^1^.+^^)%)$')
	if data and not string_find(data,"LookingForGroup") then
		name = C_LFGList_GetActivityInfo(activityID)
	end
	return name
end

function LookingForGroup_Core.GetSearchResultInviteDialog(resultID)
	local id, activityID, name, comment, _, _, _,
			_, _, _, _,
			_, leaderName, numMembers = C_LFGList_GetSearchResultInfo(resultID)
	local activityName, shortName, categoryID = C_LFGList_GetActivityInfo(activityID)
	local summary,data = string_match(comment,'^(.*)%((^1^.+^^)%)$')
	if activityID == 44 and string_find(name,"#AV#") then
		name = string.sub(name,5)
		activityName = GetMapNameByID(401)
	end
	if data and not string_find(data,"LookingForGroup") then
		return activityName,add_role_num(nil,id,numMembers)
	end
	return name,add_role_num(activityName..'\n',id,numMembers)
end
	
local function convert_sec_to_xx_xx_xx(value)
	value = math_floor(value)
	local hour = value / 3600
	local min_sec = value % 3600
	local minute = min_sec / 60
	local sec = min_sec % 60
	return string_format("%02d:%02d:%02d",hour,minute,sec)
end

local function concat_role(tbl,icon)
	local n = #tbl
	if n ~= 0 then
		concat_tb[#concat_tb+1] = "\n\n"
		concat_tb[#concat_tb+1] = icon
		concat_tb[#concat_tb+1] = n
		table_sort(tbl)
		local i = 1
		while i <= n do
			local j = i + 1
			local key = tbl[i]
			while j <= n and tbl[j] == key do
				j = j + 1
			end
			concat_tb[#concat_tb+1] = "\n|c"
			concat_tb[#concat_tb+1] = RAID_CLASS_COLORS[key].colorStr
			concat_tb[#concat_tb+1] = class_table[key]
			if i + 1 < j then
				concat_tb[#concat_tb+1] = " "
				concat_tb[#concat_tb+1] = j - i
			end
			concat_tb[#concat_tb+1] = "|r"
			i = j
		end
	end
end


local pcall = pcall
local LookingForGroup_MS

function LookingForGroup_Core.GetSearchResultInfo(resultID)
	if resultID == nil then
		return false
	end
	local id, activityID, name, comment, voiceChat, iLvl, honorLevel,
			age, numBNetFriends, numCharFriends, numGuildMates,
			isDelisted, leaderName, numMembers, autoaccept = C_LFGList_GetSearchResultInfo(resultID)
	if id == nil or isDelisted then
		return false
	end	
	local activityName, shortName, categoryID, groupID, itemLevel, filters, minLevel, maxPlayers, displayType = C_LFGList_GetActivityInfo(activityID)
	wipe(member_roles_tb)
	wipe(concat_tb)
	wipe(tank_tb)
	wipe(healer_tb)
	wipe(damager_tb)
	wipe(name_ct)
	if activityID == 44 and string_find(name,"#AV#") then
		name_ct[#name_ct+1]=GetMapNameByID(401)
		name = string.sub(name,5)
	else
		name_ct[#name_ct+1]=activityName
	end
	local summary,data = string_match(comment,'^(.*)%((^1^.+^^)%)$')
	if summary then
		comment = summary
	end
	local masummary,mdata = string_match(comment,'^(.*)%[LFG:(.*)%]$')
	if masummary then
		comment = masummary
		concat_tb[#concat_tb+1] = string_gsub(mdata,"##","\n")
		concat_tb[#concat_tb+1] = "\n"
	end
	if comment and (string_find(comment,"World Quest Tracker") or string_find(comment,"HandyNotes")) then
		comment = nil
	end
	if string_find(name,"集合石") or (data and not string_find(data,"LookingForGroup")) then
		name = nil
	else
		name = "|cffffff00"..name.."|r"
		concat_tb[#concat_tb+1] = name
		concat_tb[#concat_tb+1] = "\n"
	end
	concat_tb[#concat_tb+1]  = ID
	concat_tb[#concat_tb+1]  = " "
	concat_tb[#concat_tb+1] = id
	if iLvl ~=0 then
		concat_tb[#concat_tb+1] = "\n"
		concat_tb[#concat_tb+1]  = ITEM_LEVEL_ABBR
		concat_tb[#concat_tb+1]  = " "
		concat_tb[#concat_tb+1] = iLvl
	end
	if honorLevel ~= 0 then
		concat_tb[#concat_tb+1] = "\n"
		concat_tb[#concat_tb+1]  = LFG_LIST_HONOR_LEVEL_INSTR_SHORT
		concat_tb[#concat_tb+1]  = " "
		concat_tb[#concat_tb+1] = honorLevel
	end
	if age ~=0 then
		concat_tb[#concat_tb+1] = "\n"
		concat_tb[#concat_tb+1] = convert_sec_to_xx_xx_xx(age)
	end
	if leaderName then
		concat_tb[#concat_tb+1] = "\n"
		concat_tb[#concat_tb+1] = leaderName
	end
	if voiceChat and voiceChat ~= "" then
		table_insert(concat_tb,"\n")
		table_insert(concat_tb,LFG_LIST_VOICE_CHAT)
		table_insert(concat_tb," |c0000ff00")
		table_insert(concat_tb,voiceChat)
		table_insert(concat_tb,"|r")
	end
	if autoaccept then
		concat_tb[#concat_tb+1] = "\n"
		concat_tb[#concat_tb+1] = LFG_LIST_AUTO_ACCEPT
	end
	concat_tb[#concat_tb+1] = "\n"
	concat_tb[#concat_tb+1] = numMembers
	local i
	for i = 1, numMembers do
		local role, class, class_localized = C_LFGList_GetSearchResultMemberInfo(id,i)
		if role == "TANK" then
			tank_tb[#tank_tb+1] = class
		elseif role == "HEALER" then
			healer_tb[#healer_tb+1] = class
		elseif role == "DAMAGER" then
			damager_tb[#damager_tb+1] = class
		end
	end
	concat_tb[#concat_tb+1] = " ("
	concat_tb[#concat_tb+1] = #tank_tb
	concat_tb[#concat_tb+1] = "/"
	concat_tb[#concat_tb+1] = #healer_tb
	concat_tb[#concat_tb+1] = "/"
	concat_tb[#concat_tb+1] = #damager_tb
	concat_tb[#concat_tb+1] = ")"
	table_insert(name_ct," ")
	if numMembers < 6 then
		for i=1,#tank_tb do
			table_insert(name_ct,"|c")
			table_insert(name_ct,RAID_CLASS_COLORS[tank_tb[i]].colorStr)
			table_insert(name_ct,"T|r")
		end
		for i=1,#healer_tb do
			table_insert(name_ct,"|c")
			table_insert(name_ct,RAID_CLASS_COLORS[healer_tb[i]].colorStr)
			table_insert(name_ct,"H|r")
		end
		for i=1,#damager_tb do
			table_insert(name_ct,"|c")
			table_insert(name_ct,RAID_CLASS_COLORS[damager_tb[i]].colorStr)
			table_insert(name_ct,"D|r")
		end
	else
		name_ct[#name_ct+1] = "|cff8080cc"
		table_insert(name_ct,numMembers)
		table_insert(name_ct,"(")
		table_insert(name_ct,#tank_tb)
		table_insert(name_ct,"/")
		table_insert(name_ct,#healer_tb)
		table_insert(name_ct,"/")
		table_insert(name_ct,#damager_tb)
		table_insert(name_ct,")|r")
	end
	if name then
		table_insert(name_ct," ")
		table_insert(name_ct,name)
	else
		table_insert(name_ct," |c0000ff00")
		table_insert(name_ct,comment)
		table_insert(name_ct,"|r")
	end
	local ms = data and LookingForGroup.db.profile.enable_ms
	local progression
	if ms then
		if LookingForGroup_MS == nil then
			LookingForGroup_MS = LookingForGroup.GetAddon("LookingForGroup_MS")
		end
		local status, info, pg = pcall(LookingForGroup_MS.hsr,data)
		if status then
			concat_tb[#concat_tb+1] = info
			progression = pg
		end
	end
	concat_role(tank_tb,tank_icon)
	concat_role(healer_tb,healer_icon)
	concat_role(damager_tb,damager_icon)
	if comment and comment ~="" then
		concat_tb[#concat_tb+1] = "\n\n"
		concat_tb[#concat_tb+1] = comment
	end
	local rse = C_LFGList_GetSearchResultEncounterInfo(id)
	if rse then
		if ms then
			ms = LookingForGroup_MS.hpg(groupID,progression,rse)
			if ms then
				concat_tb[#concat_tb+1] = ms
			end
		end
		if not ms then
			concat_tb[#concat_tb+1] = "\n\n|cffffffff"
			concat_tb[#concat_tb+1] = #rse
			concat_tb[#concat_tb+1] = "|r|cffff0000"
			for i=1,#rse do
				concat_tb[#concat_tb+1] = "\n"
				concat_tb[#concat_tb+1] = rse[i]
			end
			concat_tb[#concat_tb+1] = "|r"
		end
	end
	local friendlist =LFGListSearchEntryUtil_GetFriendList(resultID)
	if friendlist ~= "" then
		concat_tb[#concat_tb+1] = '\n\n'
		concat_tb[#concat_tb+1] = friendlist
	end
	return true,table_concat(name_ct),table_concat(concat_tb)
end

function LookingForGroup_Core.GetActiveEntryInfo()
	local active, activityID, iLevel, honorLevel, name, comment, voiceChat, expiration, autoAccept, privateGroup, questID = C_LFGList_GetActiveEntryInfo()
	local _,numActiveApplicants = C_LFGList_GetNumApplicants()
	local activityName, shortName, categoryID, groupID, itemLevel, filters, minLevel, maxPlayers, displayType = 
			C_LFGList_GetActivityInfo(activityID)
	wipe(concat_tb)
	if string_find(comment,"World Quest Tracker") or string_find(comment,"HandyNotes") then
		comment = nil
	else
		local summary,data = string_match(comment,'^(.*)%((^1^.+^^)%)$')
		if summary then
			comment = summary
		end
		local masummary,mdata = string_match(comment,'^(.*)%[LFG:(.*)%]$')
		if masummary then
			comment = masummary
			local t = string_gsub(mdata,"##","\n")
			activityName = table_concat{activityName,"\n",t}
		end
		if data and not string_find(data,"LookingForGroup") then
			name = activityName
		else
			concat_tb[#concat_tb+1] = "|cff8080cc"
			if activityID == 44 and string_find(name,"#AV#") then
				name = string.sub(name,5)
				concat_tb[#concat_tb+1] = GetMapNameByID(401)
			else
				concat_tb[#concat_tb+1] = activityName
			end
			concat_tb[#concat_tb+1] ="|r\n"
		end
	end
	table_insert(concat_tb,string_format(LFG_LIST_PENDING_APPLICANTS,numActiveApplicants))
	local member_count_tb = GetGroupMemberCounts()
	local tank = member_count_tb.TANK
	local healer = member_count_tb.HEALER
	local damager = member_count_tb.DAMAGER+member_count_tb.NOROLE
	local total = tank+healer+damager
	table_insert(concat_tb,"\n|cffffffff")
	table_insert(concat_tb,total)
	table_insert(concat_tb,"(")
	table_insert(concat_tb,tank)
	table_insert(concat_tb,"/")
	table_insert(concat_tb,healer)
	table_insert(concat_tb,"/")
	table_insert(concat_tb,damager)
	table_insert(concat_tb,")|r")
	if voiceChat and voiceChat ~= "" then
		table_insert(concat_tb,"\n")
		table_insert(concat_tb,LFG_LIST_VOICE_CHAT)
		table_insert(concat_tb," |c0000ff00")
		table_insert(concat_tb,voiceChat)
		table_insert(concat_tb,"|r")
	end
	if questID == nil and comment and comment ~= "" then
		table_insert(concat_tb,"\n\n|cff8080cc")
		table_insert(concat_tb,comment)
		table_insert(concat_tb,"|r")
	end
	if autoAccept then
		table_insert(concat_tb,"\n\n")
		table_insert(concat_tb,LFG_LIST_AUTO_ACCEPT)
	end
	return name,table_concat(concat_tb)
end
