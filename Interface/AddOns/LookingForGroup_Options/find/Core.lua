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

local C_LFGList_Search = C_LFGList.Search
local C_LFGList_GetActivityInfo = C_LFGList.GetActivityInfo
local C_LFGList_GetAvailableCategories = C_LFGList.GetAvailableCategories
local C_LFGList_GetCategoryInfo = C_LFGList.GetCategoryInfo
local C_LFGList_GetAvailableActivityGroups = C_LFGList.GetAvailableActivityGroups
local C_LFGList_GetActivityGroupInfo = C_LFGList.GetActivityGroupInfo
local C_LFGList_GetAvailableActivities = C_LFGList.GetAvailableActivities
local C_LFGList_GetActiveEntryInfo = C_LFGList.GetActiveEntryInfo
local C_LFGList_CreateListing = C_LFGList.CreateListing
local C_LFGList_UpdateListing = C_LFGList.UpdateListing
local C_LFGList_ClearSearchResults = C_LFGList.ClearSearchResults

local function lfg_get_available_activities(...)
	local res = C_LFGList_GetAvailableActivities(...)
	local ret = {}
	local i
	for i=1,#res do
		local res_i = res[i]
		ret[res_i] = C_LFGList_GetActivityInfo(res_i)
	end
	return ret
end

local activities_tb0 
local activities_tb1 = {}
local activities_tb2 = {}

local function get_activities(category,group)
	if category == nil then
		category = 0
	end
	if group == nil then
		group = 0
	end
	if category == 0 then
		if activities_tb0 == nil then
			activities_tb0 = lfg_get_available_activities()
		end
		return activities_tb0
	end
	if group == 0 then
		if activities_tb1[category] == nil then
			activities_tb1[category] = lfg_get_available_activities(category)	
		end
		return activities_tb1[category]
	end
	if activities_tb2[category] == nil then
		activities_tb2[category] = {}
	end
	if activities_tb2[category][group] == nil then
		activities_tb2[category][group]  = lfg_get_available_activities(category,group)
	end
	return activities_tb2[category][group]
end

local nulltb = {}

local categorys_tb

local function categorys_values()
	if categorys_tb == nil then
		local categorys = C_LFGList_GetAvailableCategories()
		categorys_tb = {}
		local i
		for i=1,#categorys do
			categorys_tb[categorys[i]]=C_LFGList_GetCategoryInfo(categorys[i])
		end
	end
	return categorys_tb
end

LookingForGroup_Options.categorys_values = categorys_values

local groups_tb = {}

local function groups_values()
	local a_group_category = LookingForGroup_Options.db.profile.a_group_category
	if a_group_category == 0 then
		return nulltb
	end
	if groups_tb[a_group_category] == nil then
		local groups = C_LFGList_GetAvailableActivityGroups(a_group_category)
		groups_tb[a_group_category] = {}
		local gtbs = groups_tb[a_group_category]
		local i
		for i = 1,#groups do
			local groups_i = groups[i]
			gtbs[groups_i] = C_LFGList_GetActivityGroupInfo(groups_i)
		end
	end
	return groups_tb[a_group_category]
end

local function activities_values()
	local profile = LookingForGroup_Options.db.profile
	return get_activities(profile.a_group_category,profile.a_group_group)
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
		if data ~= nil then
			profile.start_a_group_details = summary
			profile.start_a_group_title = fullName
		end
		profile.a_group_category,profile.a_group_group,profile.a_group_activity = categoryID,groupID,activityID
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

local filter_role = LookingForGroup_Options.FilterRole

local function filter_search_results(resultID,activity,encounters,mbnm,role,class)
	local id, activityID, name, comment, voiceChat, iLvl, honorLevel,
			age, numBNetFriends, numCharFriends, numGuildMates,
			isDelisted, leaderName, numMembers = C_LFGList_GetSearchResultInfo(resultID)
	if activity ~= nil and activity ~= activityID then
		return false
	end
	if role and filter_role(id,numMembers,select(3,C_LFGList_GetActivityInfo(activityID))) then
		return false
	end
	if class then
		local class_tb = C_LFGList.GetSearchResultMemberCounts(resultID)
		if class_tb[class] < 2 then
			return false
		end
	end
	local rse = C_LFGList_GetSearchResultEncounterInfo(id)
	if encounters ~= nil then
		local mct = 0
		if rse ~= nil then
			local k,v
			for k,v in pairs(rse) do
				local gt = encounters[v]
				if gt then
					mct = mct +1
				elseif gt == false then
					return false
				end
			end
		end
		if mct < mbnm then
			return false
		end
	end
	return true
end

local results_table = {}

local function get_search_result()
	wipe(results_table)
	local profile = LookingForGroup_Options.db.profile
	local encounters = profile.find_a_group_encounters
	local activity = profile.a_group_activity
	local find_a_group_role = profile.find_a_group_role
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
	local groupsIDs = GetSearchResults()
	for i=1,#groupsIDs do
		local number = groupsIDs[i]
		if filter_search_results(number,activity,encounters,mbnm,find_a_group_role,class) then
			table_insert(results_table,number)
		end
	end
end

local rc_args,select_sup=LookingForGroup_Options.CreateReceivedArgs(
						"LookingForGroup_Options_Search_Result_Multiselect",results_table,"find")
						
local matches = {}
local searchTerm = {matches = matches}

local function do_search()
	local profile = LookingForGroup_Options.db.profile
	local ctg = profile.a_group_category	
	if ctg == 0 then
		return
	end
	local terms = LFGListSearchPanel_ParseSearchTerms(profile.find_a_group_filter)
	local act = profile.a_group_activity
	if act == 0 then
		local grp = profile.a_group_group
		if grp ~= 0 then
			matches[1] = C_LFGList_GetActivityGroupInfo(grp)
			table_insert(terms,searchTerm)
		end
	else
		matches[1] = C_LFGList_GetActivityInfo(act)
		table_insert(terms,searchTerm)
	end
	LookingForGroup_Options.Search(rc_args,get_search_result,ctg,terms,0,0)
end
rc_args.search_again.func = do_search				
						
LookingForGroup_Options:push("find",{
	name = FIND_A_GROUP,
	desc = LFG_LIST_SELECT_A_CATEGORY,
	type = "group",
	childGroups = "tab",
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
				LookingForGroup_Options:RestoreDBVariable("a_group_activity")
				wipe(encounters_tb)
				wipe(profile.find_a_group_encounters)
			end,
			get = function(info) return LookingForGroup_Options.db.profile.a_group_group end,
			width = "full",
			control = "LookingForGroup_Options_groups_dropdown"
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
				_,_,profile.a_group_category,profile.a_group_group = C_LFGList_GetActivityInfo(val)
				wipe(encounters_tb)
				wipe(profile.find_a_group_encounters)
			end,
			get = function(info) return LookingForGroup_Options.db.profile.a_group_activity end,
			width = "full",
			control = "LookingForGroup_Options_activities_dropdown"
		},
		cancel = 
		{
			name = CANCEL,
			type = "execute",
			func = function()
				LookingForGroup_Options:RestoreDBVariable("a_group_category")
				LookingForGroup_Options:RestoreDBVariable("a_group_activity")
				LookingForGroup_Options:RestoreDBVariable("a_group_group")
				wipe(encounters_tb)
				wipe(LookingForGroup_Options.db.profile.find_a_group_encounters)
			end
		},
		f =
		{
			name = LFG_LIST_FIND_A_GROUP,
			order = get_order(),
			type = "group",
			args =
			{
				filter =
				{
					order = get_order(),
					name = FILTER,
					type = "input",
					get = function(info) return LookingForGroup_Options.db.profile.find_a_group_filter end,
					set = function(info,val) LookingForGroup_Options.db.profile.find_a_group_filter = val end,
					width = "full"
				},
				role =
				{
					order = get_order(),
					name = ROLE,
					type = "toggle",
					get = function(info)
						return LookingForGroup_Options.db.profile.find_a_group_role
					end,
					set = function(info,val)
						LookingForGroup_Options.db.profile.find_a_group_role = val
					end
				},
				class =
				{
					order = get_order(),
					name = UnitClass("player"),
					type = "toggle",
					get = function(info)
						return LookingForGroup_Options.db.profile.find_a_group_class
					end,
					set = function(info,val)
						LookingForGroup_Options.db.profile.find_a_group_class = val
					end
				},
				encounters =
				{
					order = get_order(),
					name = RAID_ENCOUNTERS,
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
				gold =
				{
					order = get_order(),
					name ="|TInterface\\MoneyFrame\\UI-GoldIcon:%d:%d:2:0|t",
					type = "toggle",
					get = function(info)
						return LookingForGroup_Options.db.profile.find_a_group_gold
					end,
					set = function(info,val)
						LookingForGroup_Options.db.profile.find_a_group_gold = val
					end
				},
				clearall = 
				{
					order = get_order(),
					name = REMOVE_WORLD_MARKERS,
					type = "execute",
					func = function()
						wipe(LookingForGroup_Options.db.profile.find_a_group_encounters)
					end
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
					name = CANCEL,
					type = "execute",
					func = function()
						LookingForGroup_Options:RestoreDBVariable("find_a_group_filter")
						LookingForGroup_Options:RestoreDBVariable("find_a_group_role")
						LookingForGroup_Options.db.profile.find_a_group_class = nil
						LookingForGroup_Options.db.profile.find_a_group_gold = nil
						wipe(encounters_tb)
						wipe(LookingForGroup_Options.db.profile.find_a_group_encounters)
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
						if quest_id ~= nil then
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
					name = START,
					type = "execute",
					func = function()
						local profile = LookingForGroup_Options.db.profile
						if profile.a_group_activity ~= 0 and profile.start_a_group_title~="" then
							local funcListing = C_LFGList_CreateListing
							if C_LFGList_GetActiveEntryInfo() then
								funcListing = C_LFGList_UpdateListing
							end
							local quest_id = profile.start_a_group_quest_id
							if quest_id == nil then
								funcListing(profile.a_group_activity,
										profile.start_a_group_title,
										profile.start_a_group_minimum_item_level,
										profile.start_a_group_minimum_honor_level,
										profile.start_a_group_voice_chat,
										profile.start_a_group_details,
										profile.start_a_group_auto_accept,
										profile.start_a_group_private)
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
							end
							AceConfigDialog:SelectGroup("LookingForGroup","requests")
						end
					end
				},
				cancel = 
				{
					order = get_order(),
					name = CANCEL,
					type = "execute",
					func = LookingForGroup_Options.UpdateEditing
				},
			}
		},
	}
})

local AceGUI = LibStub("AceGUI-3.0")
local GameTooltip = GameTooltip

function LookingForGroup_Options:SearchResult_Tooltip_Feedback()
	local owner = GameTooltip:GetOwner()
	local obj = owner.obj
	local users = obj:GetUserDataTable()
	local val = users.val
	local ok,name,srinfo = LookingForGroup.GetAddon("LookingForGroup_Core").GetSearchResultInfo(val)
	if ok then
		GameTooltip:GetOwner().obj:SetLabel(name)
		GameTooltip:ClearLines()
		GameTooltip:AddLine(srinfo, 0.5, 0.5, 0.8, true)
		GameTooltip:Show()
	else
		if val ~= nil then
			select_sup[val] = nil
		end
		obj:SetValue(false)
		obj:SetDisabled(true)
		if LookingForGroup_Options.SearchResult_Tooltip_Feedback_timer ~= nil then
			LookingForGroup_Options:CancelTimer(LookingForGroup_Options.SearchResult_Tooltip_Feedback_timer)
			LookingForGroup_Options.SearchResult_Tooltip_Feedback_timer = nil
		end
	end
end

AceGUI:RegisterWidgetType("LookingForGroup_Options_Search_Result_Multiselect", function()
	local control = AceGUI:Create("InlineGroup")
	control:SetLayout("Flow")
	control:SetTitle(name)
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

local order_tb = {}

AceGUI:RegisterWidgetType("LookingForGroup_Options_activities_dropdown",function()
	local widget = AceGUI:Create("Dropdown")
	local SetList = widget.SetList
	widget.SetList = function(self, list, order, itemType)
		wipe(order_tb)
		local k
		for k,_ in pairs(list) do
			table_insert(order_tb,k)
		end
		LFGListUtil_SortActivitiesByRelevancy(order_tb)
		SetList(self, list, order_tb, itemType)
	end
	return widget
end , 1)

AceGUI:RegisterWidgetType("LookingForGroup_Options_groups_dropdown",function()
	local widget = AceGUI:Create("Dropdown")
	local SetList = widget.SetList
	widget.SetList = function(self, list, order, itemType)
		wipe(order_tb)
		local k
		for k,_ in pairs(list) do
			table_insert(order_tb,k)
		end
		table.sort(order_tb,function(g1,g2)
			local category = LookingForGroup_Options.db.profile.a_group_category
			local c1 = C_LFGList_GetAvailableActivities(category,g1)
			local c2 = C_LFGList_GetAvailableActivities(category,g2)
			return LFGListUtil_SortActivitiesByRelevancyCB(c1[#c1],c2[#c2])
		end)
		SetList(self, list, order_tb, itemType)
	end
	return widget
end , 1)