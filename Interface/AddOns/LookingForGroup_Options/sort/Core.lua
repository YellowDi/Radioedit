local LookingForGroup_Options = LibStub("AceAddon-3.0"):GetAddon("LookingForGroup_Options")

local function get_title(groupid)
	local id, activityID, name, comment = C_LFGList.GetSearchResultInfo(groupid)
	local summary,data = comment:match('^(.*)%((^1^.+^^)%)$')
	if summary then
		if data and LookingForGroup_Options.issubstr(data,"LookingForGroup") then
			return name
		else
			return summary
		end
	else
		return name
	end
end

function LookingForGroup_Options.SortSearchResults(results_tb)
	local profile = LookingForGroup_Options.db.profile
	local sortby = profile.sortby
	if sortby then
		local sort_f
		if sortby == "blizzard" then
			sort_f = LFGListUtil_SortSearchResultsCB
		elseif sortby == "created" then
			sort_f = function(a,b)
				return select(8,C_LFGList.GetSearchResultInfo(a)) < select(8,C_LFGList.GetSearchResultInfo(b))
			end
		elseif sortby == "title" then
			sort_f = function(a,b)
				return get_title(a) < get_title(b)
			end
		elseif sortby == "id" then
			sort_f = function(a,b)
				return a < b
			end
		elseif sortby == "activity" then
			sort_f = function(a,b)
				return select(2,C_LFGList.GetSearchResultInfo(a)) < select(2,C_LFGList.GetSearchResultInfo(b))
			end
		end
		if sort_f then
			if profile.sortby_revs then
				table.sort(results_tb,function(a,b)
					return not sort_f(a,b)
				end)
			else
				table.sort(results_tb,sort_f)
			end
		end
	end
end

LookingForGroup_Options:push("sort",
{
	name = RAID_FRAME_SORT_LABEL,
	desc = KBASE_SEARCH_RESULTS,
	type = "group",
	args =
	{
		revs = 
		{
			name = "-",
			width = "full",
			type = "toggle",
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
		blizzard =
		{
			name = "Blizzard",
			desc = "LFGListUtil_SortSearchResultsCB",
			type = "toggle",
			get = function(info)
				return LookingForGroup_Options.db.profile.sortby == "blizzard"
			end,
			set = function(info,val)
				if val then
					LookingForGroup_Options.db.profile.sortby = "blizzard"
				else
					LookingForGroup_Options.db.profile.sortby = nil
				end
			end
		},
		created =
		{
			name = ACTION_SPELL_CREATE,
			type = "toggle",
			get = function(info)
				return LookingForGroup_Options.db.profile.sortby == "created"
			end,
			set = function(info,val)
				if val then
					LookingForGroup_Options.db.profile.sortby = "created"
				else
					LookingForGroup_Options.db.profile.sortby = nil
				end
			end
		},
		title =
		{
			name = LFG_LIST_TITLE,
			type = "toggle",
			get = function(info)
				return LookingForGroup_Options.db.profile.sortby == "title"
			end,
			set = function(info,val)
				if val then
					LookingForGroup_Options.db.profile.sortby = "title"
				else
					LookingForGroup_Options.db.profile.sortby = nil
				end
			end
		},
		id =
		{
			name = ID,
			type = "toggle",
			get = function(info)
				return LookingForGroup_Options.db.profile.sortby == "id"
			end,
			set = function(info,val)
				if val then
					LookingForGroup_Options.db.profile.sortby = "id"
				else
					LookingForGroup_Options.db.profile.sortby = nil
				end
			end
		},
		activity =
		{
			name = LFG_LIST_ACTIVITY,
			type = "toggle",
			get = function(info)
				return LookingForGroup_Options.db.profile.sortby == "activity"
			end,
			set = function(info,val)
				if val then
					LookingForGroup_Options.db.profile.sortby = "activity"
				else
					LookingForGroup_Options.db.profile.sortby = nil
				end
			end
		},
		cancel =
		{
			order = -1,
			name = RESET,
			type = "execute",
			func = function()
				LookingForGroup_Options.db.profile.sortby = nil
				LookingForGroup_Options.db.profile.sortby_revs = nil
			end,
			width = "full"
		},
	}
})
