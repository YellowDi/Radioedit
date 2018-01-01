local LibStub = LibStub
local AceAddon = LibStub("AceAddon-3.0")
local LookingForGroup = AceAddon:GetAddon("LookingForGroup")
local LookingForGroup_Options = AceAddon:GetAddon("LookingForGroup_Options")
local C_LFGList_ClearSearchResults = C_LFGList.ClearSearchResults
local AceConfigDialog = LibStub("AceConfigDialog-3.0")
local string_find = string.find
local C_LFGList_GetSearchResultInfo = C_LFGList.GetSearchResultInfo
local string_gsub = string.gsub
local string_lower = string.lower
local table_insert = table.insert

local order = 0
local function get_order()
	local temp = order
	order = order + 1
	return temp
end


local function do_start()
	local profile = LookingForGroup_Options.db.profile
	local name = profile.start_a_group_title
	if name ~="" then
		local lfgav = LookingForGroup_Options.GetLFG_AV()
		local funcListing = lfgav.CreateListing
		if C_LFGList.GetActiveEntryInfo() then
			funcListing = lfgav.UpdateListing
		end
		funcListing(name,
					profile.start_a_group_minimum_item_level,
					profile.start_a_group_minimum_honor_level,
					profile.start_a_group_voice_chat,
					profile.start_a_group_details,
					false,
					profile.start_a_group_private)
		LookingForGroup_Options.set_requests()
		AceConfigDialog:SelectGroup("LookingForGroup","requests")
	end
end

local rc_args,select_sup=LookingForGroup_Options.CreateReceivedArgs(
						"LookingForGroup_Options_AV_Multiselect",nil,"av")
local function get_search_result()
	local results_table,p,counts = LookingForGroup_Options.GetSearchResults()
	return #results_table,p,counts
end

local activity_name = C_LFGList.GetActivityInfo(44)
local searchTerms = {{matches = {activity_name}},{matches = {"#AV#"}}}

local function do_search()
	LookingForGroup_Options.Search(rc_args,get_search_result,3,searchTerms,LE_LFG_LIST_FILTER_NOT_RECOMMENDED,0)
end
rc_args.results.args.search_again.func = do_search

local concat_tb = {}
local class_table

local start_av =
{
	name = START_A_GROUP,
	type = "group",
	args =
	{
		title =
		{
			order = get_order(),
			name = LFG_LIST_TITLE,
			desc = LFG_LIST_ENTER_NAME,
			type = "input",
			get = function(info) return LookingForGroup_Options.db.profile.start_a_group_title end,
			set = function(info,val) LookingForGroup_Options.db.profile.start_a_group_title = val end,
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
			end,
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
		start =
		{
			order = get_order(),
			name = START,
			type = "execute",
			func = do_start
		},
		cancel = 
		{
			order = get_order(),
			name = RESET,
			type = "execute",
			func = LookingForGroup_Options.UpdateEditing
		},
		back = 
		{
			order = get_order(),
			name = BACK,
			type = "execute",
			func = function()
				LookingForGroup_Options.option_table.args.av.args.s = nil
				AceConfigDialog:SelectGroup("LookingForGroup","av")
			end
		},
	}
}

local function av_rl_command(...)
	local LookingForGroup_AV = AceAddon:GetAddon("LookingForGroup_AV")						
	local profile = LookingForGroup_AV.db.profile
	if profile.role == 2 then
		local serialize = LookingForGroup_AV:Serialize(2,...)
		local LookingForGroup_AV_SendCommand = LookingForGroup_AV.SendCommand
		local parties = profile.parties
		local k,v
		for k,v in pairs(parties) do
			LookingForGroup_AV_SendCommand(LookingForGroup_AV,serialize,"WHISPER",k)
		end
	end
end

local string_format = string.format
local math_floor = math.floor

local function convert_ms_to_xx_xx_xx_xx(value)
	value = math_floor(value)
	local hour = value / 3600000
	local min_sec_ms = value % 3600000
	local minute = min_sec_ms / 60000
	local sec_ms = min_sec_ms % 60000
	local sec = sec_ms / 1000
	local ms = sec_ms % 1000
	return string_format("%02d:%02d:%02d.%03d",hour,minute,sec,ms)
end


local function convert_name(name)
	return string.upper(string.sub(name,1,1))..string.lower(string.sub(name,2,-1))
end

local select_tb = {}
local party_tb = {}

local av_tb =
{
	name = GetMapNameByID(401),
	type = "group",
	args =
	{
		search =
		{
			order = get_order(),
			name = LFG_LIST_FIND_A_GROUP,
			type = "execute",
			func = do_search,
		},
		start_a_g =
		{
			order = get_order(),
			name = START_A_GROUP,
			type = "execute",
			func = function()
				local status,LookingForGroup_AV = pcall(AceAddon.GetAddon,AceAddon,"LookingForGroup_AV")
				if status then
					LookingForGroup_Options.option_table.args.av.args.s = start_av
					AceConfigDialog:SelectGroup("LookingForGroup","av","s")
				end
			end,
		},
		disban =
		{
			order = get_order(),
			name = RESET,
			desc = TEAM_DISBAND,
			type = "execute",
			confirm = true,
			func = function()
				LookingForGroup.GetAddon("LookingForGroup_AV").rl_disban()
				wipe(select_tb)
			end,
		},
		start =
		{
			order = get_order(),
			name = START,
			type = "execute",
			func = function()
				local LookingForGroup_AV = AceAddon:GetAddon("LookingForGroup_AV")
				LookingForGroup_AV.Start()
			end
		},
		raid_leader =
		{
			order = get_order(),
			type = "input",
			name = RAID_LEADER,
			get = function()
				local LookingForGroup_AV = AceAddon:GetAddon("LookingForGroup_AV")
				local rl = LookingForGroup_AV.db.profile.raid_leader
				if rl then
					return rl
				end
			end,
			set = function(_,val)
				local LookingForGroup_AV = AceAddon:GetAddon("LookingForGroup_AV")
				local profile = LookingForGroup_AV.db.profile
				if profile.role == 0 then
					if val and not string_find(val,'-') then
						val = convert_name(val)
						local name = UnitFullName("player")
						profile.raid_leader = val
						if name == val then
							profile.role = 2
						else
							profile.role = 1
							LookingForGroup_AV:SendCommand(LookingForGroup_AV:Serialize(3,4),"WHISPER",val)
						end
					end
				end
			end
		},
		parties =
		{
			name = PARTY_MEMBERS,
			type = "group",
			args =
			{
				roleconfirm =
				{
					order = get_order(),
					name = ROLE_POLL,
					type = "execute",
					func = function() av_rl_command(3) end,
					width = "full"
				},
				leave_queue =
				{
					order = get_order(),
					name = LEAVE_QUEUE,
					type = "execute",
					confirm = true,
					func = function()
						av_rl_command(6)
					end,
				},
				join_battle =
				{
					order = get_order(),
					name = BATTLEFIELD_JOIN,
					type = "execute",
					confirm = true,
					func = function()
						av_rl_command(7)
					end,
				},
				parties =
				{
					order = get_order(),
					name = " ",
					type = "multiselect",
					order = get_order(),
					values = function()end,
					width = "full",
					dialogControl = "LookingForGroup_Options_AV_Parties_Multiselect"
				}
			},
		},
		status =
		{
			name = STATUS,
			type = "group",
			args =
			{
				add =
				{
					order = get_order(),
					type = "input",
					name = ADD,
					get = function()
					end,
					set = function(_,val)
						local LookingForGroup_AV = AceAddon:GetAddon("LookingForGroup_AV")
						local profile = LookingForGroup_AV.db.profile
						if profile.role == 2 then
							if val and not string_find(val,'-') then
								val = convert_name(val)
								profile.parties[val] = {}
								profile.status[val] = {}
								LookingForGroup_AV:SendCommand(LookingForGroup_AV:Serialize(2,8),"WHISPER",val)
							end
						end
					end
				},
				rem =
				{
					order = get_order(),
					type = "execute",
					name = REMOVE,
					func = function()
						local LookingForGroup_AV = AceAddon:GetAddon("LookingForGroup_AV")
						local profile = LookingForGroup_AV.db.profile
						for k,v in pairs(select_tb) do
							if v then
								profile.parties[k] = nil
								profile.status[k] = nil
							end
						end
						wipe(select_tb)
					end
				},
				rest =
				{
					order = get_order(),
					type = "execute",
					name = RESET,
					func = function()
						wipe(select_tb)
					end
				},
				prty =
				{
					type = "multiselect",
					order = get_order(),
					name = PARTY,
					width = "full",
					values = function()
						local LookingForGroup_AV = AceAddon:GetAddon("LookingForGroup_AV")
						local profile = LookingForGroup_AV.db.profile
						local parties = profile.parties
						wipe(party_tb)
						for k,v in pairs(parties) do
							party_tb[k] = k
						end
						return party_tb
					end,
					get = function(_,key)
						return select_tb[key]
					end,
					set = function(_,key,val)
						if val then
							select_tb[key] = true
						else
							select_tb[key] = nil
						end
					end
				},
				potentials =
				{
					name = " ",
					type = "multiselect",
					order = get_order(),
					values = function()
						return LookingForGroup.GetAddon("LookingForGroup_AV").db.profile.potentials
					end,
					width = "full",
					set = function()end,
					get = function()end,
				}
			}
		}
	}
}
LookingForGroup_Options:push("av",av_tb)

function LookingForGroup_Options:EnableAV()
	if LookingForGroup.db.profile.enable_av then
		LookingForGroup_Options.option_table.args.av = av_tb
	else
		LookingForGroup_Options.option_table.args.av = nil
	end
end

local AceGUI = LibStub("AceGUI-3.0")
local GameTooltip = GameTooltip

local function tooltip_feedback()
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
		select_sup[val] = nil
		obj:SetValue(false)
		obj:SetDisabled(true)
		if LookingForGroup_Options.SearchResult_Tooltip_Feedback_timer ~= nil then
			LookingForGroup_Options:CancelTimer(LookingForGroup_Options.SearchResult_Tooltip_Feedback_timer)
			LookingForGroup_Options.SearchResult_Tooltip_Feedback_timer = nil
		end
	end
end

AceGUI:RegisterWidgetType("LookingForGroup_Options_AV_Multiselect", function()
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
		local ok, name, desc = LookingForGroup.GetAddon("LookingForGroup_Core").GetSearchResultInfo(val)
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
			LookingForGroup_Options.SearchResult_Tooltip_Feedback_timer = LookingForGroup_Options:ScheduleRepeatingTimer(tooltip_feedback, 1)
			tooltip_feedback()
		end)
		self:AddChild(check)
	end
	return AceGUI:RegisterAsContainer(control)
end , 1)

AceGUI:RegisterWidgetType("LookingForGroup_Options_AV_Parties_Multiselect", function()
	local control = AceGUI:Create("InlineGroup")
	control:SetLayout("Flow")
	control.width = "fill"
	control.SetList = function()end
	control.SetLabel = function()end
	control.SetDisabled = function()end
	control.SetMultiselect = function()end
	control.SetItemValue = function()end
	if class_table == nil then
		class_table = FillLocalizedClassList({})
	end
	local ticker
	ticker = C_Timer.NewTicker(0,function()
		control:ReleaseChildren()
		if not LookingForGroup_Options.IsSelected("av\1parties") then
			ticker:Cancel()
			return
		end
		local profile = AceAddon:GetAddon("LookingForGroup_AV").db.profile
		local status = profile.status
		local geticon = LookingForGroup_Options.GetRoleIcon
		local gtime = GetTime()
		local refresh
		for k,v in pairs(profile.parties) do
			local interactivelabel = AceGUI:Create("InteractiveLabel")
			wipe(concat_tb)
			concat_tb[#concat_tb+1] = k
			concat_tb[#concat_tb+1] = '\n'
			local status_k = status[k]
			if status_k then
				local st = status_k[1]
				if st == 0 then
					concat_tb[#concat_tb+1] = AVERAGE_WAIT_TIME
					local average_wt = status_k[3]
					local wait_time = status_k[4]+(gtime-status_k[2])*1000
					if average_wt then
						concat_tb[#concat_tb+1] = convert_ms_to_xx_xx_xx_xx(average_wt)
						concat_tb[#concat_tb+1] = '\n'
						if wait_time < average_wt then
							concat_tb[#concat_tb+1] = TIME_REMAINING
							concat_tb[#concat_tb+1] = convert_ms_to_xx_xx_xx_xx(average_wt-wait_time)
							concat_tb[#concat_tb+1] = '\n'
						end
					end
					concat_tb[#concat_tb+1] = format(TIME_IN_QUEUE,convert_ms_to_xx_xx_xx_xx(wait_time))
					concat_tb[#concat_tb+1] = '\n'
				elseif st == 1 then
					concat_tb[#concat_tb+1] = TIME_REMAINING
					concat_tb[#concat_tb+1] = convert_ms_to_xx_xx_xx_xx(status_k[3]-(gtime-status_k[2])*1000)
					concat_tb[#concat_tb+1] = '\n'
				end
				refresh = true
			end
			for i=1,#v do
				local vi = v[i]
				local class = vi[3]
				concat_tb[#concat_tb+1] = "|c"
				concat_tb[#concat_tb+1] = RAID_CLASS_COLORS[class].colorStr
				concat_tb[#concat_tb+1] = vi[1]
				concat_tb[#concat_tb+1] = ' '
				concat_tb[#concat_tb+1] = class_table[class]
				concat_tb[#concat_tb+1] = '|r '
				concat_tb[#concat_tb+1] = geticon(vi[2])
				concat_tb[#concat_tb+1] = '\n'
			end
			interactivelabel:SetText(table.concat(concat_tb))
			control:AddChild(interactivelabel)
		end
	end)
	return AceGUI:RegisterAsContainer(control)
end , 1)
