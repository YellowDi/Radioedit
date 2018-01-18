local LookingForGroup_Options = LibStub("AceAddon-3.0"):GetAddon("LookingForGroup_Options")

local order = 0
local function get_order()
	local temp = order
	order = order +1
	return temp
end

local function compare(ae,be)
	if ae == nil or be == nil then
		if ae and be == nil then
			return true
		elseif ae == nil and be then
			return false
		end
	else
		local tp = type(ae)
		if tp == "boolean" then
			if ae and be == false then
				return true
			elseif ae == false and be then
				return false
			end
		end
		if ae < be then
			return true
		elseif ae~= be then
			return false
		end
	end
end

function LookingForGroup_Options.SortSearchResults(results_tb)
	local profile = LookingForGroup_Options.db.profile
	local sort = profile.sort
	if sort then
		local type = type
		local n = #sort
		local C_LFGList_GetSearchResultInfo = C_LFGList.GetSearchResultInfo
		if n~= 0 then 
			table.sort(results_tb,function(a,b)
				local ta = {C_LFGList_GetSearchResultInfo(a)}
				local tb = {C_LFGList_GetSearchResultInfo(b)}
				for i=1,n do
					local ele = sort[i]
					if ele < 0 then
						ele = -ele
						local d = compare(ta[ele],tb[ele])
						if d then
							return
						elseif d == false then
							return true
						end
					else
						local d = compare(ta[ele],tb[ele])
						if d then
							return true
						elseif d == false then
							return
						end
					end
				end
			end)
		end
	end
end

local sort_values = {ID,LFG_LIST_ACTIVITY,LFG_LIST_TITLE,LFG_LIST_DETAILS,VOICE_CHAT,LFG_LIST_ITEM_LEVEL_INSTR_SHORT,LFG_LIST_HONOR_LEVEL_INSTR_SHORT,ACTION_SPELL_CREATE,BATTLETAG,CHARACTER,GUILD,UNLIST_MY_GROUP,LEADER,MEMBERS,LFG_LIST_AUTO_ACCEPT}

local select_tb = {}

LookingForGroup_Options:push("sort",
{
	name = RAID_FRAME_SORT_LABEL,
	desc = KBASE_SEARCH_RESULTS,
	type = "group",
	args =
	{
		filter =
		{
			order = get_order(),
			name = FILTER,
			type = "select",
			values = sort_values,
			set = function(_,val)
				LookingForGroup_Options.db.profile.sortfilter = val
			end,
			get = function(info) return LookingForGroup_Options.db.profile.sortfilter end,
			width = "full",
		},
		revs = 
		{
			name = "-",
			width = "full",
			type = "toggle",
			order = get_order(),
			get = function(info)
				return LookingForGroup_Options.db.profile.sortby_revs
			end,
			set = function(info,val)
				if val then
					LookingForGroup_Options.db.profile.sortby_revs = true
				else
					LookingForGroup_Options.db.profile.sortby_revs = nil
				end
			end
		},
		add =
		{
			name = ADD,
			type = "execute",
			order = get_order(),
			func = function(_,val)
				local profile = LookingForGroup_Options.db.profile
				local sortfilter = profile.sortfilter
				if sortfilter then
					local tb = profile.sort
					if tb == nil then
						tb = {}
					end
					if profile.sortby_revs then
						tb[#tb+1] = -sortfilter
					else
						tb[#tb+1] = sortfilter
					end
					profile.sort = tb
				end
			end,
		},
		rmv =
		{
			name = REMOVE,
			type = "execute",
			order = get_order(),
			func = function()
				local profile = LookingForGroup_Options.db.profile
				local spkt = profile.sort
				if spkt then
					local cp = {}
					local i
					local n = #spkt
					for i = 1,n do
						if select_tb[i]~=true then
							cp[#cp+1] = spkt[i]
						end
					end
					wipe(select_tb)
					if #cp == 0 then
						profile.sort = nil
					else
						profile.sort = cp
					end
				end
			end
		},
		reset =
		{
			name = RESET,
			type = "execute",
			order = get_order(),
			func = function()
				local profile = LookingForGroup_Options.db.profile
				profile.sortby_revs = nil
				profile.sortfilter = nil
				wipe(select_tb)
			end
		},
		filters_s =
		{
			name = FILTERS,
			type = "multiselect",
			order = get_order(),
			values =
			function()
				local sort = LookingForGroup_Options.db.profile.sort
				if sort and #sort ~= 0 then
					local v = {}
					for i=1,#sort do
						local ele = sort[i]
						if ele<0 then
							v[i] = sort_values[-ele].."(-)"
						else
							v[i] = sort_values[ele]
						end
					end
					return v
				end
			end,
			set = function(_,key,val)
				if val then
					select_tb[key] = true
				else
					select_tb[key] = nil
				end
			end,
			get = function(_,key)
				return select_tb[key]
			end,
			width = "full",
		},
		resetc =
		{
			order = -1,
			name = RESET,
			type = "execute",
			func = function()
				LookingForGroup_Options.db.profile.sort = nil
				wipe(select_tb)
			end,
			width = "full"
		},
	}
})
