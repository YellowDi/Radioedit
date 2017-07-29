local LibStub = LibStub
local AceAddon = LibStub("AceAddon-3.0")
local LookingForGroup = AceAddon:GetAddon("LookingForGroup")
local LookingForGroup_Options = AceAddon:GetAddon("LookingForGroup_Options")
local AceConfigDialog = LibStub("AceConfigDialog-3.0")
local table_insert = table.insert

local order = 0
local function get_order()
	local temp = order
	order = order +1
	return temp
end

local search_config_tb =
{
	name = KBASE_SEARCH_RESULTS,
	type = "group",
	childGroups = "tab",
}

local failed_args =
{
	back = 
	{
		order = 1,
		name = BACK,
		type = "execute",
	},
	search_again = 
	{
		order = 2,
		name = LFG_LIST_SEARCH_AGAIN,
		type = "execute",
	},
	error_msg =
	{
		order = 3,
		name = LFG_LIST_SEARCH_FAILED,
		type = "description",
		width = "full"
	}
}

local select_sup = {}

local ApplyToGroup = LookingForGroup_Options.ApplyToGroup

local function signup_func(comment_text)
	local k,v
	local tank,healer,dps = select(2,GetLFGRoles())
	for k,v in pairs(select_sup) do
		if v then
			ApplyToGroup(k,comment_text,tank,healer,dps)
		end
	end
end

local function default_signup()
	if next(select_sup) then
		if LookingForGroup.db.profile.role_check then
			LFGListApplicationDialog_Show(LFGListApplicationDialog,signup_func)
		else
			signup_func(LookingForGroup_Options.db.profile.role_comment_text)
		end
	end
end

function LookingForGroup_Options.CreateReceivedArgs(dialogControl,values,group,custom_signup)
	local args =
	{
		back = 
		{
			order = 1,
			name = BACK,
			type = "execute",
			func = function()
				LookingForGroup_Options.Background_Timer_Stop()
				LookingForGroup_Options.Background_NoSearchResult_StartMusic()
				C_LFGList.ClearSearchResults()
				wipe(select_sup)
				LookingForGroup_Options.reset_search_result()
				AceConfigDialog:SelectGroup("LookingForGroup",group)
			end
		},
		search_again = 
		{
			order = 2,
			name = LFG_LIST_SEARCH_AGAIN,
			type = "execute",
		},
		sign_up =
		{
			order = 3,
			name = SIGN_UP,
			type = "execute",
			func = custom_signup or default_signup
		},
		results =
		{
			name = " ",
			type = "multiselect",
			order = 4,
			dialogControl = dialogControl,
			values = values,
			get = function(info,val)	return select_sup[val] end,
			width = "full",
		},
	}
	return args,select_sup
end

local function lfeedback(callback,category,terms,filters,preferredfilters,delay)
	local results = callback()
	if results then
		if 0 < results then
			LookingForGroup_Options.Background_Notifing_Music()
		else
			LookingForGroup_Options.Background_NoSearchResult_StartMusic()
		end
		local elaspe = math.ceil((results+1)/10)*10
		local function feedback()
			lfeedback(callback,category,terms,filters,preferredfilters,delay)
			LookingForGroup_Options.NotifyChangeIfSelected("search_result")
		end
		if LookingForGroup.db.profile.hardware then
			LookingForGroup_Options.Background_Sceduled_Timer_Start(
			function()
				if next(select_sup) == nil then
					feedback()
				end
			end,elaspe)
		else
			LookingForGroup_Options.Background_Sceduled_Timer_Start(function()
				if next(select_sup) == nil then
					LookingForGroup.Search(feedback,category,terms,filters,preferredfilters,delay)
				end
			end,elaspe)
		end
	end
end

function LookingForGroup_Options.Search(rargs,callback,category,terms,filters,preferredfilters,delay)
	LookingForGroup.Search(function()
		wipe(select_sup)
		lfeedback(callback,category,terms,filters,preferredfilters,delay)
		search_config_tb.args = rargs
		LookingForGroup_Options.option_table.args.search_result = search_config_tb
		AceConfigDialog:SelectGroup("LookingForGroup","search_result")
	end,category,terms,filters,preferredfilters,delay)
	LookingForGroup_Options:RegisterEvent("LFG_LIST_SEARCH_FAILED",function()
		LookingForGroup_Options:UnregisterEvent("LFG_LIST_SEARCH_FAILED")
		failed_args.back.func = rargs.back.func
		failed_args.search_again.func = rargs.search_again.func
		search_config_tb.args = failed_args
		LookingForGroup_Options.option_table.args.search_result = search_config_tb
		LookingForGroup_Options.Background_Timer_Start(failed_args.search_again.func,5)
		AceConfigDialog:SelectGroup("LookingForGroup","search_result")
	end)
end
