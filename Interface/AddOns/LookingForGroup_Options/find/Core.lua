local LibStub = LibStub
local AceAddon = LibStub("AceAddon-3.0")
local AceConfigDialog = LibStub("AceConfigDialog-3.0")
local LookingForGroup = AceAddon:GetAddon("LookingForGroup")
local LookingForGroup_Options = AceAddon:GetAddon("LookingForGroup_Options")
local wipe = wipe
local string_format = string.format
local string_find = string.find
local string_match = string.match
local string_lower = string.lower
local string_gsub = string.gsub
local tonumber = tonumber
local tostring = tostring
local select = select
local GetAverageItemLevel = GetAverageItemLevel
local GetNumSavedInstances = GetNumSavedInstances
local GetSavedInstanceEncounterInfo = GetSavedInstanceEncounterInfo
local math_floor = math.floor
local table_concat = table.concat
local next = next
--local error = error
--local pcall = pcall
local GetSearchResults = LookingForGroup_Options.GetSearchResults
local C_LFGList = C_LFGList
local C_LFGList_GetSearchResultInfo = C_LFGList.GetSearchResultInfo
local C_LFGList_GetSearchResultEncounterInfo = C_LFGList.GetSearchResultEncounterInfo
local C_LFGList_GetSearchResultMemberCounts = C_LFGList.GetSearchResultMemberCounts
local table_insert = table.insert

local order = 0
local function get_order()
	local temp = order
	order = order + 1
	return temp
end

local C_LFGList_GetActivityInfo = C_LFGList.GetActivityInfo
local C_LFGList_GetAvailableCategories = C_LFGList.GetAvailableCategories
local C_LFGList_GetAvailableActivityGroups = C_LFGList.GetAvailableActivityGroups
local C_LFGList_GetActivityGroupInfo = C_LFGList.GetActivityGroupInfo
local C_LFGList_GetActiveEntryInfo = C_LFGList.GetActiveEntryInfo
local C_LFGList_CreateListing = C_LFGList.CreateListing
local C_LFGList_UpdateListing = C_LFGList.UpdateListing
local C_LFGList_ClearSearchResults = C_LFGList.ClearSearchResults

local L = LibStub("AceLocale-3.0"):GetLocale("LookingForGroup")

local function get_filters()
	local legacy = LookingForGroup_Options.db.profile.a_group_legacy
	if legacy then
		return LE_LFG_LIST_FILTER_NOT_RECOMMENDED
	elseif legacy == false then
		return
	else
		return LE_LFG_LIST_FILTER_RECOMMENDED
	end
end

local nulltb = {}

local function categorys_values()
	local filter = get_filters()
	local categorys_tb = {}
	local GetCategoryInfo = C_LFGList.GetCategoryInfo
	if filter then
		local categorys = C_LFGList_GetAvailableCategories()
		local i
		for i=1,#categorys do
			categorys_tb[categorys[i]] = GetCategoryInfo(categorys[i])
		end
	else
		local i = 1
		while true do
			local ctg = GetCategoryInfo(i)
			if ctg == nil then
				break
			end
			categorys_tb[i] = ctg
			i = i + 1
		end
	end
	return categorys_tb
end

LookingForGroup_Options.categorys_values = categorys_values

local function groups_values()
	local groups_tb = {}
	local filter = get_filters()
	local groups = C_LFGList_GetAvailableActivityGroups(LookingForGroup_Options.db.profile.a_group_category,filter)
	local i
	for i = 1,#groups do
		local groups_i = groups[i]
		groups_tb[groups_i] = C_LFGList_GetActivityGroupInfo(groups_i)
	end
	local grp = LookingForGroup_Options.db.profile.a_group_group
	if groups_tb[grp] == nil then
		groups_tb[grp] = C_LFGList_GetActivityGroupInfo(grp)
	end
	return groups_tb
end

local function activities_values()
	local profile = LookingForGroup_Options.db.profile
	local cid,gid = profile.a_group_category,profile.a_group_group
	local filters = get_filters()
	local ret = {}
	if filters then
		local res = C_LFGList.GetAvailableActivities(cid,gid,filters)
		local i
		for i=1,#res do
			local res_i = res[i]
			local fullName, shortName = C_LFGList_GetActivityInfo(res_i)
			if fullName then
				ret[res_i] = fullName
			else
				if shortName then
					ret[res_i] = shortName
				end
			end
		end
	else
		local i = 2
		local j = 0
		while true do
			local fullName, shortName, categoryID, groupID = C_LFGList_GetActivityInfo(i)
			if categoryID == nil then
				j = j + 1
				if j == 20 then
					break
				end
			else
				j = 0
			end
			if cid == categoryID and (gid == 0 or gid == groupID) then
				if fullName then
					ret[i] = fullName
				else
					if shortName then
						ret[i] = shortName
					end
				end
			end
			i = i + 1
		end
	end
	return ret
end

local encounters_tb = {}
local encounters_check = {0," (",0,")"}

local function encounters_values()
	local profile = LookingForGroup_Options.db.profile
	local activity = profile.a_group_activity
	if activity == 0 then
		return nulltb
	end
	if next(encounters_tb) == nil then
		local find_a_group_encounters = profile.find_a_group_encounters
		local fullName, shortName, categoryID, groupID, itemLevel, filters, minLevel, maxPlayers, displayType, activityOrder = C_LFGList_GetActivityInfo(activity)
		if groupID == 0 then
			return nulltb
		end
		local name = C_LFGList_GetActivityGroupInfo(groupID)
		local num = GetNumSavedInstances()
		local i
		for i=1,num do
			local instanceName, instanceID, _, instanceDifficulty, locked, _, instanceIDMostSig, isRaid, maxPlayers, difficultyName, maxBosses, _ = GetSavedInstanceInfo(i)
			if (string_find(name,instanceName) or string_find(instanceName,name)) and shortName == difficultyName then
				if locked then
					local j
					for j = 1, maxBosses do
						local enm,_,iskilled = GetSavedInstanceEncounterInfo(i,j)
						encounters_tb[j] = enm
						if iskilled then
							find_a_group_encounters[enm] = true
						end
					end
				else
					local j
					for j = 1, maxBosses do
						encounters_tb[j] = GetSavedInstanceEncounterInfo(i,j)
					end
				end
				break
			end
		end
	end
	return encounters_tb
end

function LookingForGroup_Options.SetCategory(_,val)
	local profile = LookingForGroup_Options.db.profile
	profile.a_group_category = val
	LookingForGroup_Options:RestoreDBVariable("a_group_group")
	LookingForGroup_Options:RestoreDBVariable("a_group_activity")
	wipe(LookingForGroup_Options.db.profile.find_a_group_activities)
	wipe(encounters_tb)
	wipe(profile.find_a_group_encounters)
end

function LookingForGroup_Options.UpdateEditing()
	local active, activityID, iLevel, honorLevel, name, comment, voiceChat, expiration, oldAutoAccept, privateGroup, questID = C_LFGList_GetActiveEntryInfo()
	if active then
		local profile = LookingForGroup_Options.db.profile
		profile.start_a_group_minimum_item_level,profile.start_a_group_minimum_honor_level,profile.start_a_group_title,profile.start_a_group_details,profile.start_a_group_voice_chat,profile.start_a_group_auto_accept,profile.start_a_group_private,profile.start_a_group_quest_id =
		iLevel, honorLevel, name, comment, voiceChat, oldAutoAccept, privateGroup, questID
		local fullName, shortName, categoryID, groupID, itemLevel, filters, minLevel, maxPlayers, displayType, activityOrder = C_LFGList_GetActivityInfo(activityID)
		local summary,data = string_match(comment,'^(.*)%((^1^.+^^)%)$')
		if summary then
			profile.start_a_group_details = summary
		end
		if data and not string_find(data,"LookingForGroup") then
			profile.start_a_group_title = ""
		end
		if bit.band(filters,LE_LFG_LIST_FILTER_RECOMMENDED) == 1 then
			profile.a_group_legacy = nil
		elseif bit.band(filters,LE_LFG_LIST_FILTER_NOT_RECOMMENDED) == 1 then
			profile.a_group_legacy = false
		else
			profile.a_group_legacy = true
		end
		profile.a_group_category,profile.a_group_group,profile.a_group_activity = categoryID,groupID,activityID
		profile.find_a_group_activities[1]=fullName or shortName
		wipe(encounters_tb)
		wipe(profile.find_a_group_encounters)
	else
		LookingForGroup_Options:RestoreDBVariable("start_a_group_title")
		LookingForGroup_Options:RestoreDBVariable("start_a_group_minimum_item_level")
		LookingForGroup_Options:RestoreDBVariable("start_a_group_minimum_honor_level")
		LookingForGroup_Options:RestoreDBVariable("start_a_group_voice_chat")
		LookingForGroup_Options:RestoreDBVariable("start_a_group_details")
		LookingForGroup_Options:RestoreDBVariable("start_a_group_auto_accept")
		LookingForGroup_Options:RestoreDBVariable("start_a_group_private")
		LookingForGroup_Options:RestoreDBVariable("start_a_group_quest_id")
	end						
end

local issubstr = LookingForGroup_Options.issubstr

local function filter_search_results(resultID,activity,encounters,mbnm,role,class,complete,twoxfilters,ilvl,new)
	local id, activityID, name, comment, voiceChat, iLvl, honorLevel,
			age, numBNetFriends, numCharFriends, numGuildMates,
			isDelisted, leaderName, numMembers = C_LFGList_GetSearchResultInfo(resultID)
	if iLvl < ilvl then
		return
	end
	if role or complete or twoxfilters then
		local fullName, shortName, categoryID, groupID, itemLevel, filters, minLevel, maxPlayers, displayType, activityOrder = C_LFGList_GetActivityInfo(activityID)

		if (role and role(id,numMembers,categoryID)) or (complete and numMembers < bit.rshift(maxPlayers,1) ) then
			return
		end
		if twoxfilters then
			local profile = LookingForGroup_Options.db.profile
			local activities = profile.find_a_group_activities
			if activities and next(activities) then
				local i = 1
				while i <= #activities do
					if issubstr(fullName,activities[i]) then
						break
					end
					i = i + 1
				end
				if #activities < i then
					return
				end
			else
				local fnm,snm = C_LFGList_GetActivityInfo(profile.a_group_activity)
				if fnm then
					if not issubstr(fullName,fnm) then
						return
					end
				elseif snm and not issubstr(fullName,snm) then
					return
				end
			end
			local filter = profile.find_a_group_filter
			if filter and next(filter) then
				local summary,data = string_match(comment,'^(.*)%((^1^.+^^)%)$')
				if summary then
					comment = summary
				end
				if data and not issubstr(data,"LookingForGroup") then
					name = ""
					comment = summary
				end
				i = 1
				while i <= #filter do
					if issubstr(name,filter[i]) or issubstr(comment,filter[i]) or issubstr(voiceChat,filter[i]) then
						break
					end
					i = i + 1
				end
				if #filter < i then
					return
				end
			end
		end
	end
	if class then
		local class_tb = C_LFGList.GetSearchResultMemberCounts(resultID)
		if class and class_tb[class] < 2 then
			return
		end
	end
	local rse = C_LFGList_GetSearchResultEncounterInfo(id)
	if new and rse then
		return
	end
	if encounters ~= nil then
		local mct = 0
		if rse ~= nil then
			local k,v
			for k,v in pairs(rse) do
				local gt = encounters[v]
				if gt then
					mct = mct +1
				elseif gt == false then
					return
				end
			end
		end
		if mct < mbnm then
			return
		end
	end
	return true
end

local results_table = {}
local applications_count

local rc_args,select_sup=LookingForGroup_Options.CreateReceivedArgs(
						"LookingForGroup_Options_Search_Result_Multiselect",results_table,"find")

local do_search
						
local function get_search_result()
	wipe(results_table)
	applications_count = nil
	local profile = LookingForGroup_Options.db.profile
	local encounters = profile.find_a_group_encounters
	local activity = profile.a_group_activity
	local role
	if profile.find_a_group_role then
		role = LookingForGroup_Options.FilterRole
	end
	if activity == 0 then
		activity = nil
	end
	local class
	if profile.find_a_group_class then
		class = select(2,UnitClass("player"))
	end
	local mbnm = 0
	local k,v
	for k,v in pairs(encounters) do
		if v then
			mbnm = mbnm + 1
		end
	end
	local applications = C_LFGList.GetApplications()
	local GetApplicationInfo = C_LFGList.GetApplicationInfo
	local i
	for i=1,#applications do
		local number = applications[i]
		if select(2,GetApplicationInfo(number)) == "applied" then
			table_insert(results_table,number)
		end
	end
	local complete = profile.find_a_group_complete
	local twoxfilters = profile.find_a_group_2xfilters
	local ilvl = profile.find_a_group_ilvl
	local new = profile.find_a_group_new
	local dk = profile.spam_filter_dk
	local solo = profile.spam_filter_solo
	if not ilvl then
		ilvl = 0
	end
	applications_count = #results_table
	local groupsIDs,p,counts = GetSearchResults()
	for i=1,#groupsIDs do
		local number = groupsIDs[i]
		if filter_search_results(number,activity,encounters,mbnm,role,class,complete,twoxfilters,ilvl,new,dk,solo) then
			table_insert(results_table,number)
		end
	end
	return #results_table - applications_count,p,counts
end
				
local matches = {}
local searchTerm = {}
local filterTerm = {}
local terms = {}

do_search=function()
	local profile = LookingForGroup_Options.db.profile
	local ctg = profile.a_group_category	
	if ctg == 0 then
		return
	end
	local mn
	if ctg == 2 then
		mn = 3
	else
		mn = 1
	end
	wipe(terms)
	terms[1] = searchTerm
	local atvs = profile.find_a_group_activities
	if atvs and next(atvs) then
		if mn < #atvs then
			wipe(matches)
			searchTerm.matches = matches
			profile.find_a_group_2xfilters = true
		else
			searchTerm.matches = atvs
		end
	else
		searchTerm.matches = matches
	end
	if profile.find_a_group_minus then
		local mc = searchTerm.matches
		local tb = {}
		for i=1,#mc do
			tb[i] = "-"..mc[i]
		end
		searchTerm.matches = tb
	end
	local filter = profile.find_a_group_filter
	if filter then
		if mn < #filter then
			profile.find_a_group_2xfilters = true
		elseif #filter ~= 0 then
			filterTerm.matches = profile.find_a_group_filter
			terms[2] = filterTerm
		end
	end
	local realm = profile.find_a_group_realm and GetRealmName()
	local lfg_profile = LookingForGroup.db.profile
	local mode_rf = lfg_profile.mode_rf
	if mode_rf == false then
		local realm_filters = lfg_profile.realm_filters
		local rm_tb = {realm}

		for k,v in pairs(realm_filters) do
			local p = #rm_tb + 1
			if mn < p then
				break
			end
			rm_tb[p]=k
		end
		if #rm_tb ~= 0 then
			terms[#terms+1]={matches=rm_tb}
		end
	elseif realm then
		terms[#terms+1]={matches={realm}}
	end
	if profile.find_a_group_mythic then
		if not realm then
			terms[#terms+1]={matches={GetRealmName()}}
		end
		terms[#terms+1]={matches={PLAYER_DIFFICULTY6}}
	end
	LookingForGroup_Options.Search(rc_args,get_search_result,ctg,terms,get_filters(),0)
end
rc_args.results.args.search_again.func = do_search				

local activities_select_tb,filters_select_sup = {},{}


LookingForGroup_Options:push("find",{
	name = FIND_A_GROUP,
	desc = LFG_LIST_SELECT_A_CATEGORY,
	type = "group",
	childGroups = "tab",
	args =
	{
		activities=
		{
			name = LFG_LIST_ACTIVITY,
			desc = LFG_LIST_SELECT_A_CATEGORY,
			type = "group",
			order = 1,
			args =
			{
				Category =
				{
					order = get_order(),
					name = CATEGORY,
					type = "select",
					values = categorys_values,
					set = LookingForGroup_Options.SetCategory,
					get = function(info) return LookingForGroup_Options.db.profile.a_group_category end,
					width = "full",
				},
				Group =
				{
					order = get_order(),
					name = GROUP,
					type = "select",
					values = groups_values,
					set = function(info,val)
						local profile = LookingForGroup_Options.db.profile
						profile.a_group_group = val
						local activit = profile.find_a_group_activities
						activit[1]=C_LFGList_GetActivityGroupInfo(val)
						LookingForGroup_Options:RestoreDBVariable("a_group_activity")
						wipe(encounters_tb)
						wipe(profile.find_a_group_encounters)
					end,
					get = function(info) return LookingForGroup_Options.db.profile.a_group_group end,
					width = "full",
				},
				activity_id =
				{
					order = get_order(),
					name = ID,
					type = "input",
					pattern = "^[0-9]*$",
					get = function(info)
						local activity = LookingForGroup_Options.db.profile.a_group_activity
						if activity and activity ~= 0 then
							return tostring(activity)
						end
					end,
					set = function(info,val)
						if val == "" then
							LookingForGroup_Options.db.profile.a_group_activity = 0
						else
							val = tonumber(val)
							local profile = LookingForGroup_Options.db.profile
							local cat,grp
							activit[1],_,cat,grp = C_LFGList_GetActivityInfo(val)
							if cat and grp then
								profile.a_group_category = cat
								profile.a_group_group = grp
								profile.a_group_activity = val
							end
							wipe(encounters_tb)
							wipe(profile.find_a_group_encounters)
							encounters_values()
						end
					end,
					width = "half"
				},
				Activity =
				{
					order = get_order(),
					name = LFG_LIST_ACTIVITY,
					type = "select",
					values = activities_values,
					set = function(info,val)
						local profile = LookingForGroup_Options.db.profile
						profile.a_group_activity = val
						local activit = profile.find_a_group_activities
						activit[1],_,profile.a_group_category,profile.a_group_group = C_LFGList_GetActivityInfo(val)
						wipe(encounters_tb)
						wipe(profile.find_a_group_encounters)
						encounters_values()
					end,
					get = function(info) return LookingForGroup_Options.db.profile.a_group_activity end,
					width = "double"
				},
				add =
				{
					order = get_order(),
					name = ADD,
					type = "execute",
					func = function()
						local profile = LookingForGroup_Options.db.profile
						local act = profile.a_group_activity
						local mtc
						if act == 0 then
							local grp = profile.a_group_group
							if grp ~= 0 then
								mtc = C_LFGList_GetActivityGroupInfo(grp)
							end
						else
							mtc = C_LFGList_GetActivityInfo(act)
						end
						local atvs = profile.find_a_group_activities
						if atvs then
							for i=2,#atvs do
								if mtc == atvs[i] then
									return
								end
							end
						else
							atvs = {}
							profile.find_a_group_activities = atvs
						end
						table_insert(atvs,mtc)
					end
				},
				rmv = 
				{
					name = REMOVE,
					type = "execute",
					order = get_order(),
					func = function()
						local atvs = LookingForGroup_Options.db.profile.find_a_group_activities
						local tb = {atvs[1]}
						local i
						for i = 2,#atvs do
							if not activities_select_tb[i] then
								table_insert(tb,atvs[i])
							end
						end
						LookingForGroup_Options.db.profile.find_a_group_activities = tb
						wipe(activities_select_tb)
					end
				},
				activities =
				{
					order = get_order(),
					name = L.Keywords,
					type = "multiselect",
					width = "full",
					values = function()
						return LookingForGroup_Options.db.profile.find_a_group_activities
					end,
					get = function(info,key)
						return activities_select_tb[key]
					end,
					set = function(info,key,val)
						if val then
							activities_select_tb[key] = true
						else
							activities_select_tb[key] = nil
						end
					end
				},
				cancel = 
				{
					order = get_order(),
					name = RESET,
					type = "execute",
					func = function()
						LookingForGroup_Options:RestoreDBVariable("a_group_category")
						LookingForGroup_Options:RestoreDBVariable("a_group_activity")
						LookingForGroup_Options:RestoreDBVariable("a_group_group")
						LookingForGroup_Options.db.profile.a_group_legacy = nil
						wipe(encounters_tb)
						wipe(LookingForGroup_Options.db.profile.find_a_group_encounters)
						wipe(activities_select_tb)
						wipe(filters_select_sup)
						wipe(LookingForGroup_Options.db.profile.find_a_group_activities)
					end
				},
				recommanded =
				{
					order = get_order(),
					name = RECOMMENDED,
					desc = L.find_recommended_desc,
					type = "toggle",
					get = function(info)
						local legacy = LookingForGroup_Options.db.profile.a_group_legacy
						if legacy then
							return nil
						elseif legacy == false then
							return false
						else
							return true
						end
					end,
					set = function(info,val)
						if val then
							LookingForGroup_Options.db.profile.a_group_legacy = nil
						elseif val == false then
							LookingForGroup_Options.db.profile.a_group_legacy = false
						else
							LookingForGroup_Options.db.profile.a_group_legacy = true
						end
					end,
					tristate = true,
				},
			}
		},
		f =
		{
			name = LFG_LIST_FIND_A_GROUP,
			order = get_order(),
			type = "group",
			childGroups = "tab",
			args =
			{
				filters =
				{
					name = L.Keywords,
					desc = KBASE_DEFAULT_SEARCH_TEXT,
					order = get_order(),
					type = "group",
					args =
					{
						add =
						{
							order = get_order(),
							name = ADD,
							type = "input",
							set = function(_,val)
								if val == "" then
									return
								end
								local profile = LookingForGroup_Options.db.profile
								local ft = profile.find_a_group_filter
								if ft == nil then
									ft = {}
									profile.find_a_group_filter = ft
								end
								for _,v in ipairs(ft) do
									if val == v then
										return
									end
								end
								table_insert(ft,val)
							end,
							get = function()end,
							width = "full"
						},
						filters =
						{
							order = get_order(),
							name = L.Keywords,
							type = "multiselect",
							width = "full",
							values = function()
								return LookingForGroup_Options.db.profile.find_a_group_filter
							end,
							get = function(info,key)
								return filters_select_sup[key]
							end,
							set = function(info,key,val)
								if val then
									filters_select_sup[key] = true
								else
									filters_select_sup[key] = nil
								end
							end
						},
						rmv = 
						{
							name = REMOVE,
							type = "execute",
							order = get_order(),
							func = function()
								local ft = LookingForGroup_Options.db.profile.find_a_group_filter
								if ft then
									local tb = {}
									local i
									for i = 1,#ft do
										if not filters_select_sup[i] then
											table_insert(tb,ft[i])
										end
									end
									LookingForGroup_Options.db.profile.find_a_group_filter = tb
									wipe(filters_select_sup)
								end
							end
						},
						cancel =
						{
							order = get_order(),
							name = RESET,
							type = "execute",
							func = function()
								wipe(filters_select_sup)
								LookingForGroup_Options.db.profile.find_a_group_filter = nil
							end
						},
						filter =
						{
							order = get_order(),
							name = L.Keywords,
							desc = KBASE_DEFAULT_SEARCH_TEXT,
							type = "input",
							set = function(_,val)
								local gmatch = string.gmatch
								local t,hash = {},{}
								for k,_ in gmatch(val, "([^\n]+)") do
									if not hash[k] then
										table.insert(t,k)
										hash[k] = true
									end
								end
								LookingForGroup_Options.db.profile.find_a_group_filter = t
							end,
							get = function()
								local ft = LookingForGroup_Options.db.profile.find_a_group_filter
								if ft then
									return table_concat(ft,'\n')
								end
							end,
							width = "full",
							multiline = true,
						}
					}
				},
				encounters =
				{
					name = RAID_BOSSES,
					order = get_order(),
					type = "group",
					args =
					{
						encounters =
						{
							order = get_order(),
							name = RAID_BOSSES,
							desc = L.find_f_encounters,
							type = "multiselect",
							width = "full",
							values = encounters_values,
							tristate = true,
							get = function(info,val)
								local v = LookingForGroup_Options.db.profile.find_a_group_encounters[encounters_tb[val]]
								if v then
									return true
								elseif v == false then
									return nil
								end
								return false
							end,
							set = function(info,key,val)
								local k = false
								if val then
									k = true
								elseif val == false then
									k = nil
								end
								LookingForGroup_Options.db.profile.find_a_group_encounters[encounters_tb[key]] = k
							end
						},
						cancel =
						{
							order = get_order(),
							name = RESET,
							type = "execute",
							func = function()
								wipe(encounters_tb)
								wipe(LookingForGroup_Options.db.profile.find_a_group_encounters)
							end
						},
						clearall = 
						{
							order = get_order(),
							name = REMOVE_WORLD_MARKERS,
							type = "execute",
							func = function()
								wipe(LookingForGroup_Options.db.profile.find_a_group_encounters)
							end,
						},
					}
				},
				advanced =
				{
					name = ADVANCED_LABEL,
					order = get_order(),
					type = "group",
					args =
					{
						role =
						{
							name = ROLE,
							desc = L.find_f_advanced_role,
							type = "toggle",
							get = function(info)
								return LookingForGroup_Options.db.profile.find_a_group_role
							end,
							set = function(info,val)
								if val then
									LookingForGroup_Options.db.profile.find_a_group_role = true
								else
									LookingForGroup_Options.db.profile.find_a_group_role = nil
								end
							end
						},
						class =
						{
							name = CLASS,
							desc = L.find_f_advanced_class,
							type = "toggle",
							get = function(info)
								return LookingForGroup_Options.db.profile.find_a_group_class
							end,
							set = function(info,val)
								if val then
									LookingForGroup_Options.db.profile.find_a_group_class = true
								else
									LookingForGroup_Options.db.profile.find_a_group_class = nil
								end
							end
						},
						complete =
						{
							name = COMPLETE,
							desc = L.find_f_advanced_complete,
							type = "toggle",
							get = function(info)
								return LookingForGroup_Options.db.profile.find_a_group_complete
							end,
							set = function(info,val)
								if val then
									LookingForGroup_Options.db.profile.find_a_group_complete = true
								else
									LookingForGroup_Options.db.profile.find_a_group_complete = nil
								end
							end
						},
						gold =
						{
							name ="|TInterface\\MoneyFrame\\UI-GoldIcon:%d:%d:2:0|t",
							type = "toggle",
							desc = L.find_f_advanced_gold,
							get = function(info)
								return LookingForGroup_Options.db.profile.find_a_group_gold
							end,
							set = function(info,val)
								if val then
									LookingForGroup_Options.db.profile.find_a_group_gold = true
								else
									LookingForGroup_Options.db.profile.find_a_group_gold = nil
								end
							end
						},
						twoxfilters =
						{
							name = "2x"..FILTERS,
							desc = L.find_f_advanced_2xfilters,
							type = "toggle",
							get = function()
								return LookingForGroup_Options.db.profile.find_a_group_2xfilters
							end,
							set = function(_,val)
								if val then
									LookingForGroup_Options.db.profile.find_a_group_2xfilters = true
								else
									LookingForGroup_Options.db.profile.find_a_group_2xfilters = nil
								end
							end
						},
						realm =
						{
							name = GetRealmName,
							type = "toggle",
							get = function()
								return LookingForGroup_Options.db.profile.find_a_group_realm
							end,
							set = function(_,val)
								if val then
									LookingForGroup_Options.db.profile.find_a_group_realm = true
								else
									LookingForGroup_Options.db.profile.find_a_group_realm = nil
								end
							end
						},
						new =
						{
							name = NEW,
							type = "toggle",
							get = function()
								return LookingForGroup_Options.db.profile.find_a_group_new
							end,
							set = function(_,val)
								if val then
									LookingForGroup_Options.db.profile.find_a_group_new = true
								else
									LookingForGroup_Options.db.profile.find_a_group_new = nil
								end
							end
						},
						
						mythic =
						{
							name = PLAYER_DIFFICULTY6,
							type = "toggle",
							get = function()
								return LookingForGroup_Options.db.profile.find_a_group_mythic
							end,
							set = function(_,val)
								if val then
									LookingForGroup_Options.db.profile.find_a_group_mythic = true
								else
									LookingForGroup_Options.db.profile.find_a_group_mythic = nil
								end
							end
						},
						minus = 
						{
							name = "-",
							type = "toggle",
							get = function()
								return LookingForGroup_Options.db.profile.find_a_group_minus
							end,
							set = function(_,val)
								if val then
									LookingForGroup_Options.db.profile.find_a_group_minus = true
								else
									LookingForGroup_Options.db.profile.find_a_group_minus = nil
								end
							end
						},
						ilvl =
						{
							name = ITEM_LEVEL_ABBR,
							desc = LFG_LIST_ITEM_LEVEL_REQ,
							type = "input",
							width = "full",
							order = 0,
							get = function()
								local ilv = LookingForGroup_Options.db.profile.find_a_group_ilvl
								if ilv then
									return tostring(ilv)
								end
							end,
							set = function(_,val)
								if val == "" then
									LookingForGroup_Options.db.profile.find_a_group_ilvl = nil
								else
									local num = tonumber(val)
									local average = GetAverageItemLevel()
									if num <= average then
										LookingForGroup_Options.db.profile.find_a_group_ilvl = num
									else
										LookingForGroup_Options.db.profile.find_a_group_ilvl = math_floor(average)
									end
								end
							end,
							pattern = "^[0-9]*$"
						},
						reset =
						{
							order = -1,
							name = RESET,
							type = "execute",
							func = function()
								LookingForGroup_Options.db.profile.find_a_group_role = nil
								LookingForGroup_Options.db.profile.find_a_group_class = nil
								LookingForGroup_Options.db.profile.find_a_group_gold = nil
								LookingForGroup_Options.db.profile.find_a_group_complete = nil
								LookingForGroup_Options.db.profile.find_a_group_2xfilters = nil
								LookingForGroup_Options.db.profile.find_a_group_ilvl = nil
								LookingForGroup_Options.db.profile.find_a_group_new = nil
								LookingForGroup_Options.db.profile.find_a_group_mythic = nil
							end,
						},
					},
				},
				search =
				{
					order = get_order(),
					name = SEARCH,
					type = "execute",
					func = do_search
				},
				cancel = 
				{
					order = get_order(),
					name = RESET,
					type = "execute",
					func = function()
						LookingForGroup_Options.db.profile.find_a_group_filter = nil
						wipe(filters_select_sup)
						LookingForGroup_Options.db.profile.find_a_group_role = nil
						LookingForGroup_Options.db.profile.find_a_group_class = nil
						LookingForGroup_Options.db.profile.find_a_group_gold = nil
						LookingForGroup_Options.db.profile.find_a_group_complete = nil
						LookingForGroup_Options.db.profile.find_a_group_2xfilters = nil
						LookingForGroup_Options.db.profile.find_a_group_ilvl = nil
						LookingForGroup_Options.db.profile.find_a_group_new = nil
						LookingForGroup_Options.db.profile.find_a_group_mythic = nil
					end
				},
			}
		},
		s =
		{
			name = START_A_GROUP,
			order = get_order(),
			type = "group",
			args =
			{
				title =
				{
					order = get_order(),
					name = LFG_LIST_TITLE,
					desc = LFG_LIST_ENTER_NAME,
					type = "input",
					get = function(info)
						local profile = LookingForGroup_Options.db.profile
						local quest_id = profile.start_a_group_quest_id
						if quest_id ~= nil then
							return select(4,LFGListUtil_GetQuestCategoryData(quest_id))
						end
						return profile.start_a_group_title
					end,
					set = function(info,val)
						LookingForGroup_Options.db.profile.start_a_group_title = val
						LookingForGroup_Options.db.profile.start_a_group_quest_id = nil
					end,
					width = "full"
				},
				details =
				{
					order = get_order(),
					name = LFG_LIST_DETAILS,
					desc = DESCRIPTION_OF_YOUR_GROUP,
					type = "input",
					multiline = true,
					get = function(info) return LookingForGroup_Options.db.profile.start_a_group_details end,
					set = function(info,val) LookingForGroup_Options.db.profile.start_a_group_details = val end,
					width = "full"
				},
				minitemlvl =
				{
					order = get_order(),
					name = LFG_LIST_ITEM_LEVEL_INSTR_SHORT,
					desc = LFG_LIST_ITEM_LEVEL_REQ,
					type = "input",
					get = function(info)
						local sminilv = LookingForGroup_Options.db.profile.start_a_group_minimum_item_level
						if sminilv == 0 then
							return ""
						else
							return tostring(sminilv)
						end
					end,
					pattern = "^[0-9]*$",
					set = function(info,val)
						if val == nil or val == "" then
							LookingForGroup_Options.db.profile.start_a_group_minimum_item_level = 0
						else
							local player_ilv = math_floor(GetAverageItemLevel())
							val = tonumber(val)
							if player_ilv < val then
								LookingForGroup_Options.db.profile.start_a_group_minimum_item_level = player_ilv
							else
								LookingForGroup_Options.db.profile.start_a_group_minimum_item_level = val
							end
						end
					end
				},
				minhonorlvl =
				{
					order = get_order(),
					name = LFG_LIST_HONOR_LEVEL_INSTR_SHORT,
					desc = LFG_LIST_HONOR_LEVEL_REQ,
					type = "input",
					get = function(info)
						local sminilv = LookingForGroup_Options.db.profile.start_a_group_minimum_honor_level
						if sminilv == 0 then
							return ""
						else
							return tostring(sminilv)
						end
					end,
					pattern = "^[0-9]*$",
					set = function(info,val)
						if val == nil or val == "" then
							LookingForGroup_Options.db.profile.start_a_group_minimum_honor_level = 0
						else
							local player_ilv = math_floor(UnitHonorLevel("player"))
							val = tonumber(val)
							if player_ilv < val then
								LookingForGroup_Options.db.profile.start_a_group_minimum_honor_level = player_ilv
							else
								LookingForGroup_Options.db.profile.start_a_group_minimum_honor_level = val
							end
						end
					end
				},
				vc =
				{
					order = get_order(),
					name = VOICE_CHAT,
					desc = LFG_LIST_VOICE_CHAT_INSTR,
					type = "input",
					get = function(info)
						return LookingForGroup_Options.db.profile.start_a_group_voice_chat
					end,
					set = function(info,val)
						LookingForGroup_Options.db.profile.start_a_group_voice_chat = val
					end,
					width = "full",
				},
				auto_acc =
				{
					order = get_order(),
					name = LFG_LIST_AUTO_ACCEPT,
					type = "toggle",
					get = function(info)
						return LookingForGroup_Options.db.profile.start_a_group_auto_accept
					end,
					set = function(info,val)
						LookingForGroup_Options.db.profile.start_a_group_auto_accept = val
					end
				},
				prv =
				{
					order = get_order(),
					name = LFG_LIST_PRIVATE,
					desc = LFG_LIST_PRIVATE_TOOLTIP,
					type = "toggle",
					get = function(info)
						return LookingForGroup_Options.db.profile.start_a_group_private
					end,
					set = function(info,val)
						LookingForGroup_Options.db.profile.start_a_group_private = val
					end
				},
				quest_id =
				{
					order = get_order(),
					name = BATTLE_PET_SOURCE_2..ID,
					type = "input",
					get = function(info)
						local quest_id = LookingForGroup_Options.db.profile.start_a_group_quest_id
						if quest_id then
							return tostring(quest_id)
						end
					end,
					pattern = "^[0-9]*$",
					set = function(info,val)
						if val == "" then
							LookingForGroup_Options.db.profile.start_a_group_quest_id = nil
						else
							local activityID, categoryID, filters, questName = LFGListUtil_GetQuestCategoryData(val)
							if questName ~= nil then
								local profile = LookingForGroup_Options.db.profile
								profile.a_group_category = categoryID
								profile.a_group_activity = activityID
								profile.start_a_group_auto_accept = true
								profile.start_a_group_quest_id = val
							end
						end
					end,
					width = "full"
				},
				start =
				{
					order = get_order(),
					name = function()
						if C_LFGList.GetActiveEntryInfo() then
							return DONE_EDITING
						end
						return START
					end,
					type = "execute",
					func = function()
						local profile = LookingForGroup_Options.db.profile
						local activityID = profile.a_group_activity
						if activityID ~= 0 then
							local funcListing = C_LFGList_CreateListing
							if C_LFGList_GetActiveEntryInfo() then
								funcListing = C_LFGList_UpdateListing
							end
							local quest_id = profile.start_a_group_quest_id
							if quest_id == nil then
								local title = profile.start_a_group_title
								local atvs = profile.find_a_group_activities
								local t
								if atvs then
									local temp = {}
									local fullname,shortname = C_LFGList_GetActivityInfo(activityID)
									for i=1,#atvs do
										local ele = atvs[i]
										if ele ~= fullname then
											temp[#temp+1] = ele
										end
									end
									if #temp ~= 0 then
										t = table_concat(temp,"#-")
									end
								end
								if profile.addon_meeting_stone then
									local player,realm = UnitFullName("player")
									local ilvl = profile.addon_meeting_stone_ilvl
									if ilvl == nil then
										ilvl = math_floor(GetAverageItemLevel())
									end

									local req
									if profile.addon_meeting_stone_req then
										req = "^N"..profile.addon_meeting_stone_req
									else
										req = "^Z"
									end
									local max_player_level = GetMaxPlayerLevel()
									local details = profile.start_a_group_details
									if details == "" then
										if title ~= "" then
											details = title
										end
									end
									local fullname,shortname = C_LFGList_GetActivityInfo(activityID)
									local activityname = fullname or shortname
									local tt = profile.addon_meeting_stone_title
									if title == "" then
										if tt then	
											title = "集合石-"
											if activityname then
												title = title..activityname
											end
										else
											title = "LookingForGroup"
										end
									end
									local version = profile.addon_meeting_stone_vers
									if version == nil then
										if tt then
											version = "7308"
										else
											version = "LookingForGroup"
										end
									end
									local dt
									if profile.addon_meeting_stone_hack then
										dt = table_concat{details,"(^1^Z^T^N1^S",version,"^t^N",profile.addon_meeting_stone_mode or 1,"^N",profile.addon_meeting_stone_loot or 1,"^T^t^N",ilvl,"^T^t^T^t^N",max_player_level,"^N",max_player_level,req,"^Z^S",player,'-',realm,"^Z^S",t or "","^Z^^)"}
									else
										if tt then
											activityname = ""
										else
											activityname = "-"..activityname
										end
										dt = table_concat{details,"(^1^Z^S",version,"^N",profile.addon_meeting_stone_mode or 1,"^N",profile.addon_meeting_stone_loot or 1,"^N",profile.addon_meeting_stone_class or select(3,UnitClass("player")),"^N",ilvl,"^N2147483647^",LookingForGroup_Options.ms_rating(activityID,profile),"^N",max_player_level,"^N",max_player_level,req,"^Z^S",player,'-',realm,"^Z^S",activityname,t and "-" or "",t or "","^Z^^)"}
									end
									funcListing(activityID,
											title,
											profile.start_a_group_minimum_item_level,
											profile.start_a_group_minimum_honor_level,
											profile.start_a_group_voice_chat,
											dt,
											profile.start_a_group_auto_accept,
											profile.start_a_group_private)
									LookingForGroup_Options.set_requests()
									AceConfigDialog:SelectGroup("LookingForGroup","requests")
								elseif title ~= "" then
										funcListing(activityID,
												title,
												profile.start_a_group_minimum_item_level,
												profile.start_a_group_minimum_honor_level,
												profile.start_a_group_voice_chat,
												t and table_concat{profile.start_a_group_details,"[LFG:",t,"]"} or profile.start_a_group_details,
												profile.start_a_group_auto_accept,
												profile.start_a_group_private)
									LookingForGroup_Options.set_requests()
									AceConfigDialog:SelectGroup("LookingForGroup","requests")
								end
							else
								local activityID = LFGListUtil_GetQuestCategoryData(quest_id)
								funcListing(activityID,
										"",
										profile.start_a_group_minimum_item_level,
										profile.start_a_group_minimum_honor_level,
										profile.start_a_group_voice_chat,
										profile.start_a_group_details,
										profile.start_a_group_auto_accept,
										profile.start_a_group_private,
										quest_id)
								LookingForGroup_Options.set_requests()
								AceConfigDialog:SelectGroup("LookingForGroup","requests")
							end
							if not LookingForGroup.db.profile.hardware then
								do_search()
							end
						end
					end
				},
				cancel = 
				{
					order = get_order(),
					name = CANCEL,
					type = "execute",
					func = function()
						LookingForGroup_Options.UpdateEditing()
					end
				},
			}
		},
	}
})

local AceGUI = LibStub("AceGUI-3.0")
local GameTooltip = GameTooltip

function LookingForGroup_Options:SearchResult_Tooltip_Feedback()
	local owner = GameTooltip:GetOwner()
	if owner then
		local obj = owner.obj
		local users = obj:GetUserDataTable()
		local val = users.val
		local ok,name,srinfo = LookingForGroup.GetAddon("LookingForGroup_Core").GetSearchResultInfo(val)
		if ok then
			GameTooltip:GetOwner().obj:SetLabel(name)
			GameTooltip:ClearLines()
			GameTooltip:AddLine(srinfo, 0.5, 0.5, 0.8, true)
			GameTooltip:Show()
			h = true
		else
			if val ~= nil then
				select_sup[val] = nil
			end
			if obj then
				obj:SetValue(false)
				obj:SetDisabled(true)
			end
			if LookingForGroup_Options.SearchResult_Tooltip_Feedback_timer ~= nil then
				LookingForGroup_Options:CancelTimer(LookingForGroup_Options.SearchResult_Tooltip_Feedback_timer)
				LookingForGroup_Options.SearchResult_Tooltip_Feedback_timer = nil
			end
		end
	else
		if LookingForGroup_Options.SearchResult_Tooltip_Feedback_timer then
			LookingForGroup_Options:CancelTimer(LookingForGroup_Options.SearchResult_Tooltip_Feedback_timer)
			LookingForGroup_Options.SearchResult_Tooltip_Feedback_timer = nil
		end
	end
end

AceGUI:RegisterWidgetType("LookingForGroup_Options_Search_Result_Multiselect", function()
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
		local ok, name,desc = LookingForGroup.GetAddon("LookingForGroup_Core").GetSearchResultInfo(val)
		if not ok then
			return
		end
		local check = AceGUI:Create("LookingForGroup_search_result_checkbox")
		check:SetUserData("key", key)
		check:SetLabel(name)
		check:SetUserData("val", val)
		if key <= applications_count then
			check:SetTriState(true)
			check:SetValue(nil)
			check:SetCallback("OnValueChanged",function()end)
		else
			check:SetValue(select_sup[val])
			check:SetCallback("OnValueChanged",function(self,...)
				local user = self:GetUserDataTable()
				local v = user.val
				if select_sup[v] then
					select_sup[v] = nil
				else
					select_sup[v] = true
				end
				check:SetValue(select_sup[v])
			end)
		end
		check:SetCallback("OnLeave", function(self,...)
			if LookingForGroup_Options.SearchResult_Tooltip_Feedback_timer ~= nil then
				LookingForGroup_Options:CancelTimer(LookingForGroup_Options.SearchResult_Tooltip_Feedback_timer)
			end
			GameTooltip:Hide()
		end)
		check:SetCallback("OnEnter", function(self,...)
			GameTooltip:SetOwner(self.frame,"ANCHOR_TOPRIGHT")
			if LookingForGroup_Options.SearchResult_Tooltip_Feedback_timer ~= nil then
				LookingForGroup_Options:CancelTimer(LookingForGroup_Options.SearchResult_Tooltip_Feedback_timer)
			end
			LookingForGroup_Options.SearchResult_Tooltip_Feedback_timer = LookingForGroup_Options:ScheduleRepeatingTimer("SearchResult_Tooltip_Feedback", 1)
			LookingForGroup_Options:SearchResult_Tooltip_Feedback()
		end)
		self:AddChild(check)
	end
	return AceGUI:RegisterAsContainer(control)
end , 1)
