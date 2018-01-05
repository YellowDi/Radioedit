local AceAddon = LibStub("AceAddon-3.0")
local LookingForGroup = AceAddon:GetAddon("LookingForGroup")
local LookingForGroup_Options = AceAddon:GetAddon("LookingForGroup_Options")
local L = LibStub("AceLocale-3.0"):GetLocale("LookingForGroup")

local function generate_class_table()
	local tb = {}
	local i = 1
	local GetClassInfoByID = GetClassInfoByID
	local RAID_CLASS_COLORS = RAID_CLASS_COLORS
	local tconcat = table.concat
	while true do
		local loc,class = GetClassInfoByID(i)
		if loc == nil then
			break
		end
		tb[i] = tconcat{"|c",RAID_CLASS_COLORS[class].colorStr,loc,"|r"}
		i = i + 1
	end
	return tb
end


LookingForGroup_Options:push("options",{
	name = OPTIONS,
	desc = L.options,
	type = "group",
	args =
	{
		icon =
		{
			name = EMBLEM_SYMBOL,
			desc = "LookingForGroup_Icon",
			type = "toggle",
			get = function(info)
				return LookingForGroup.db.profile.enable_icon
			end,
			set = function(info,val)
				LookingForGroup.db.profile.enable_icon = val
				if val then
					LoadAddOn("LookingForGroup_Icon")
				end
				local LookingForGroup_Icon = AceAddon:GetAddon("LookingForGroup_Icon")
				LookingForGroup_Icon:OnEnable()
			end
		},
		hook =
		{
			name = "Hook",
			desc = "LookingForGroup_Hook",
			type = "toggle",
			get = function(info)
				return LookingForGroup.db.profile.enable_hook
			end,
			set = function(info,val)
				LookingForGroup.db.profile.enable_hook = val
				if val then
					LoadAddOn("LookingForGroup_Hook")
				end
				local LookingForGroup_Hook = AceAddon:GetAddon("LookingForGroup_Hook")
				LookingForGroup_Hook:OnEnable()
			end
		},
		event =
		{
			name = "Event",
			desc = "LookingForGroup_Event",
			type = "toggle",
			get = function(info)
				return LookingForGroup.db.profile.enable_event
			end,
			set = function(info,val)
				LookingForGroup.db.profile.enable_event = val
				if val then
					LoadAddOn("LookingForGroup_Event")
				end
				local LookingForGroup_Event = AceAddon:GetAddon("LookingForGroup_Event")
				LookingForGroup_Event:OnEnable()
			end
		},
		av =
		{
			name = GetMapNameByID(401),
			desc = "LookingForGroup_AV",
			type = "toggle",
			get = function(info)
				return LookingForGroup.db.profile.enable_av
			end,
			set = function(info,val)
				if val then
					LookingForGroup.db.profile.enable_av = true
				else
					LookingForGroup.db.profile.enable_av = nil
				end
				if val then
					LoadAddOn("LookingForGroup_AV")
				end
				local LookingForGroup_AV = AceAddon:GetAddon("LookingForGroup_AV")
				LookingForGroup_AV:OnEnable()
				LookingForGroup_Options:EnableAV()
			end,
		},
		sf =
		{
			name = SPAM_FILTER,
			desc = "LookingForGroup_SF",
			type = "toggle",
			get = function(info)
				return LookingForGroup.db.profile.enable_sf
			end,
			set = function(info,val)
				LookingForGroup.db.profile.enable_sf = val
				if val then
					LoadAddOn("LookingForGroup_SF")
				end
				local LookingForGroup_SF = AceAddon:GetAddon("LookingForGroup_SF")
				LookingForGroup_SF:OnEnable()
			end,
		},
		ms =
		{
			name = "Meeting Stone",
			desc = "LookingForGroup_MS",
			type = "toggle",
			get = function(info)
				return LookingForGroup.db.profile.enable_ms
			end,
			set = function(info,val)
				LookingForGroup.db.profile.enable_ms = val
			end,
		},
		disable_blizzard =
		{
			name = DISABLE.." BlizzardUI",
			type = "group",
			args =
			{
				quick_join =
				{
					name = QUICK_JOIN,
					type = "toggle",
					get = function(info)
						return LookingForGroup.db.profile.hook_quick_join
					end,
					set = function(info,val)
						local status,LookingForGroup_Hook = pcall(AceAddon.GetAddon,AceAddon,"LookingForGroup_Hook")
						if val then
							LookingForGroup.db.profile.hook_quick_join = true
							QuickJoinToastButton:Hide()
							if status then
								LookingForGroup_Hook:Unhook(QuickJoinFrame,"Show")
							end
						else
							LookingForGroup.db.profile.hook_quick_join = nil
							QuickJoinToastButton:Show()
							if status then
								LookingForGroup_Hook:RawHook(QuickJoinFrame,"Show",function()end,true)
							end
						end
					end,
				},
			}
		},
		background =
		{
			name = L.background_search,
			type = "group",
			args =
			{
				enable_music =
				{
					name = ENABLE_MUSIC,
					type = "toggle",
					order = 1,
					get = function(info)
						return LookingForGroup_Options.db.profile.background_enable_music
					end,
					set = function(info,val)
						if val then
							LookingForGroup_Options.db.profile.background_enable_music = true
						else
							LookingForGroup_Options.db.profile.background_enable_music = nil
						end
					end,
				},
				chat =
				{
					name = SYSTEM_MESSAGES,
					desc = KBASE_SEARCH_RESULTS,
					order = 2,
					type = "toggle",
					get = function(info)
						return LookingForGroup_Options.db.profile.background_message
					end,
					set = function(info,val)
						if val then
							LookingForGroup_Options.db.profile.background_message = true
						else
							LookingForGroup_Options.db.profile.background_message = nil
						end
					end,
				},
				sr =
				{
					name = KBASE_SEARCH_RESULTS,
					order = 3,
					type = "input",
					get = function(info)
						return LookingForGroup_Options.db.profile.background_music
					end,
					set = function(info,val)
						LookingForGroup_Options.db.profile.background_music = val
					end,
					width = "full",
				},
				cancel = 
				{
					name = RESET,
					order = 4,
					type = "execute",
					func = function()
						LookingForGroup_Options:RestoreDBVariable("background_music")
						LookingForGroup.db.profile.background_enable_music = nil
						LookingForGroup.db.profile.background_message = nil
					end
				},
			}
		},
		addons =
		{
			name = ADDONS,
			desc = L.options_addons,
			type = "group",
			args =
			{
				wqgf =
				{
					name = "World Quest Group Finder",
					type = "toggle",
					set = function(_,val)
						if val then 
							LookingForGroup.db.profile.addon_wqgf = true
						else
							LookingForGroup.db.profile.addon_wqgf = nil
						end
					end,
					get = function() return LookingForGroup.db.profile.addon_wqgf end,
					width = "full"
				},
				wqt =
				{
					name = "World Quest Tracker",
					type = "toggle",
					set = function(_,val)
						if val then 
							LookingForGroup.db.profile.addon_wqt = true
						else
							LookingForGroup.db.profile.addon_wqt = nil
						end
					end,
					get = function() return LookingForGroup.db.profile.addon_wqt end,
					width = "full"
				}
			}
		},
		meeting_stone =
		{
			name = "Meeting Stone",
			type = "group",
			args =
			{
				warning =
				{
					name = "|TInterface\\OptionsFrame\\UI-OptionsFrame-NewFeatureIcon:0:0:0:-1|t",
					desc = "|TInterface\\OptionsFrame\\UI-OptionsFrame-NewFeatureIcon:0:0:0:-1|t|c00ff0000"..L.warning.."|r",
					type = "toggle",
					set = function(_,val)
						if val then
							LookingForGroup.db.profile.ignore_warning = nil
						else
							LookingForGroup.db.profile.ignore_warning = true
						end
					end,
					get = function()
						return not LookingForGroup.db.profile.ignore_warning
					end
				},
				enable=
				{
					type = "toggle",
					name = ENABLE,
					set = function(_,val)
						if val then 
							LookingForGroup_Options.db.profile.addon_meeting_stone = true
						else
							LookingForGroup_Options.db.profile.addon_meeting_stone = nil
						end
					end,
					get = function() return LookingForGroup_Options.db.profile.addon_meeting_stone end,
				},
				ilvl =
				{
					name = LFG_LIST_ITEM_LEVEL_INSTR_SHORT,
					desc = LEADER,
					type = "input",
					pattern = "^[0-9]*$",
					get = function()
						local ilv = LookingForGroup_Options.db.profile.addon_meeting_stone_ilvl
						if ilv then
							return ilv
						end
					end,
					set = function(_,v)
						if v=="" then
							LookingForGroup_Options.db.profile.addon_meeting_stone_ilvl = nil
						else
							LookingForGroup_Options.db.profile.addon_meeting_stone_ilvl = v
						end
					end
				},
				
				rating =
				{
					name = RATING,
					type = "input",
					pattern = "^[0-9]*$",
					get = function()
						local ilv = LookingForGroup_Options.db.profile.addon_meeting_stone_rating
						if ilv then
							return ilv
						end
					end,
					set = function(_,v)
						if v=="" then
							LookingForGroup_Options.db.profile.addon_meeting_stone_rating = nil
						else
							LookingForGroup_Options.db.profile.addon_meeting_stone_rating = v
						end
					end
				},
				
				req =
				{
					name = LFG_LIST_HONOR_LEVEL_REQ,
					desc = RATING,
					type = "input",
					pattern = "^[0-9]*$",
					get = function()
						local req = LookingForGroup_Options.db.profile.addon_meeting_stone_req
						if req then
							return req
						end
					end,
					set = function(_,v)
						if v=="" then
							LookingForGroup_Options.db.profile.addon_meeting_stone_req = nil
						else
							LookingForGroup_Options.db.profile.addon_meeting_stone_req = v
						end
					end
				},
				loot =
				{
					name = UNIT_FRAME_DROPDOWN_SUBSECTION_TITLE_LOOT,
					type = "select",
					values = {LOOT_FREE_FOR_ALL,LOOT_ROUND_ROBIN,LOOT_MASTER_LOOTER,LOOT_GROUP_LOOT,LOOT_NEED_BEFORE_GREED,LOOT_PERSONAL_LOOT,[0]=ALL},
					set = function(_,v)
						if v == 1 then
							LookingForGroup_Options.db.profile.addon_meeting_stone_loot = nil
						else
							LookingForGroup_Options.db.profile.addon_meeting_stone_loot = v
						end
					end,
					get = function()
						local loot = LookingForGroup_Options.db.profile.addon_meeting_stone_loot
						if loot then
							return loot
						else
							return 1
						end
					end
				},
				mode =
				{
					name = MODE,
					type = "select",
					values = {GARRISON_SHIPYARD_MSSION_INPROGRESS_TOOLTIP,"Carry",ACHIEVEMENTS,APPEARANCE_LABEL,"Yolo","MMR",HONOR,"GG",TRANSMOG_SOURCE_2,DAILY,LEVELING,"LOL","Farm",WORLD,[0]=ALL,[255]=UNKNOWN,[99]=OTHER},
					set = function(_,v)
						if v == 1 then
							LookingForGroup_Options.db.profile.addon_meeting_stone_mode = nil
						else
							LookingForGroup_Options.db.profile.addon_meeting_stone_mode = v
						end
					end,
					get = function()
						local mode = LookingForGroup_Options.db.profile.addon_meeting_stone_mode
						if mode then
							return mode
						else
							return 1
						end
					end
				},
				class =
				{
					name = CLASS,
					type = "select",
					values = generate_class_table,
					set = function(_,v)
						local _,_,classid = UnitClass("player")
						if v == classid then
							LookingForGroup_Options.db.profile.addon_meeting_stone_class = nil
						else
							LookingForGroup_Options.db.profile.addon_meeting_stone_class = v
						end
					end,
					get = function()
						return LookingForGroup_Options.db.profile.addon_meeting_stone_class
					end
				},

				hack =
				{
					name = "Hack",
					type = "toggle",
					set = function(_,v)
						if v then
							LookingForGroup_Options.db.profile.addon_meeting_stone_hack = true
						else
							LookingForGroup_Options.db.profile.addon_meeting_stone_hack = nil
						end
					end,
					get = function()
						return LookingForGroup_Options.db.profile.addon_meeting_stone_hack
					end
				},
			},
		},
		auto = 
		{
			name = L.Auto,
			desc = "LookingForGroup_Auto",
			type = "group",
			args =
			{
				addons =
				{
					name = ADDONS,
					type = "group",
					args =
					{
						wq =
						{
							name = TRACKER_HEADER_WORLD_QUESTS,
							desc = "LookingForGroup_WQ",
							type = "toggle",
							get = function(info)
								return LookingForGroup.db.profile.enable_wq
							end,
							set = function(info,val)
								LookingForGroup.db.profile.enable_wq = val
								if val then
									LoadAddOn("LookingForGroup_WQ")
								end
								local LookingForGroup_WQ = AceAddon:GetAddon("LookingForGroup_WQ")
								LookingForGroup_WQ:OnEnable()
							end,
							width = "full"
						},
						ip =
						{
							name = "Invasion Point",
							desc = "LookingForGroup_InvasionPoint",
							type = "toggle",
							get = function(info)
								return LookingForGroup.db.profile.enable_invasionpoint
							end,
							set = function(info,val)
								LookingForGroup.db.profile.enable_invasionpoint = val
								if val then
									LoadAddOn("LookingForGroup_InvasionPoint")
								end
								local LookingForGroup_InvasionPoint = AceAddon:GetAddon("LookingForGroup_InvasionPoint")
								LookingForGroup_InvasionPoint:OnEnable()
							end,
							width = "full"
						},
						elite =
						{
							name = ELITE,
							desc = "LookingForGroup_Elite",
							type = "toggle",
							get = function(info)
								return LookingForGroup.db.profile.enable_elite
							end,
							set = function(info,val)
								LookingForGroup.db.profile.enable_elite = val
								if val then
									LoadAddOn("LookingForGroup_Elite")
								end
								local LookingForGroup_Elite = AceAddon:GetAddon("LookingForGroup_Elite")
								LookingForGroup_Elite:OnEnable()
							end,
							width = "full"
						},
					}
				},
				leave_party =
				{
					name = PARTY_LEAVE,
					desc = "QUEST_TURNED_IN",
					type = "toggle",
					get = function(info)
						return LookingForGroup.db.profile.wq_leave_party
					end,
					set = function(info,val)
						if val then
							LookingForGroup.db.profile.wq_leave_party = true
						else
							LookingForGroup.db.profile.wq_leave_party = nil
						end
					end,
					width = "full",
				},
				pve =
				{
					name = "PVE",
					desc = L.options_auto_pve_desc,
					type = "toggle",
					width = "full",
					get = function()
						local pve = LookingForGroup.db.profile.auto_pve
						if pve then
							return true
						elseif pve == false then
							return
						else
							return false
						end
					end,
					tristate = true,
					set = function(_,val)
						if val == nil then
							LookingForGroup.db.profile.auto_pve = false
						elseif val then
							LookingForGroup.db.profile.auto_pve = true
						else
							LookingForGroup.db.profile.auto_pve = nil
						end
					end
				},
				aacpt = 
				{
					name = LFG_LIST_AUTO_ACCEPT,
					type = "toggle",
					get = function(info)
						local profile = LookingForGroup.db.profile
						if profile.hardware then
							profile.auto_auto_accept = nil
						end
						return profile.auto_auto_accept
					end,
					set = function(info,val)
						local profile = LookingForGroup.db.profile
						if not profile.hardware then
							if val then
								profile.auto_auto_accept = val
							else
								profile.auto_auto_accept = nil
							end
						end
					end
				},
				start =
				{
					name = START_A_GROUP,
					type = "toggle",
					get = function(info)
						return LookingForGroup.db.profile.auto_start_a_group
					end,
					set = function(info,val)
						if val then
							LookingForGroup.db.profile.auto_start_a_group = val
						else
							LookingForGroup.db.profile.auto_start_a_group = nil
						end
					end
				}
			}
		},
		window =
		{
			name = L.options_window,
			type = "group",
			args =
			{
				save = 
				{
					name = SAVE,
					order = 1,
					type = "execute",
					func = function()
						local st = LibStub("AceConfigDialog-3.0"):GetStatusTable("LookingForGroup")
						local height, width	= st.height, st.width
						local profile = LookingForGroup_Options.db.profile
						if height == 500 then
							profile.window_height = nil
						else
							profile.window_height = height
						end
						if width == 700 then
							profile.window_width = nil
						else
							profile.window_width = width
						end
					end,
				},
				cancel = 
				{
					name = RESET,
					order = 2,
					type = "execute",
					func = function()
						local v = LibStub("AceConfigDialog-3.0"):GetStatusTable("LookingForGroup")
						local profile = LookingForGroup_Options.db.profile
						v.height = nil
						profile.window_height = nil
						v.width = nil
						profile.window_width = nil
					end,
				},
				line =
				{
					name = function()end,
					order = 3,
					type = "description",
					width = "full"
				},
				height =
				{
					name = COMPACT_UNIT_FRAME_PROFILE_FRAMEHEIGHT,
					type = "range",
					max = tonumber(GetCVar("gxFullscreenResolution"):match("%d+x(%d+)")),
					step = 0.01,
					get = function()
						local v = (LibStub("AceConfigDialog-3.0"):GetStatusTable("LookingForGroup")).height
						if v then
							return v
						else
							return 500
						end
					end,
					set = function(info,val)
						local st = LibStub("AceConfigDialog-3.0"):GetStatusTable("LookingForGroup")
						if val == 500 then
							st.height = nil
						else
							st.height = val
						end
					end,
				},
				width =
				{
					name = COMPACT_UNIT_FRAME_PROFILE_FRAMEWIDTH,
					type = "range",
					max = tonumber(GetCVar("gxFullscreenResolution"):match("(%d+)x%d+")),
					step = 0.01,
					get = function(info)
						local v = (LibStub("AceConfigDialog-3.0"):GetStatusTable("LookingForGroup")).width
						if v then
							return v
						else
							return 700
						end
					end,
					set = function(info,val)
						local st = LibStub("AceConfigDialog-3.0"):GetStatusTable("LookingForGroup")
						if val == 700 then
							st.width = nil
						else
							st.width = val
						end
					end,
				},
			}
		},
		advanced =
		{
			name = ADVANCED_LABEL,
			type = "group",
			order = -1,
			args =
			{
				role_check =
				{
					name = LFG_LIST_ROLE_CHECK,
					type = "toggle",
					get = function(info)
						return LookingForGroup.db.profile.role_check
					end,
					set = function(info,val)
						if val then
							LookingForGroup.db.profile.role_check = true
						else
							LookingForGroup.db.profile.role_check = nil
						end
					end,
				},
				hardware =
				{
					name = HARDWARE,
					desc = L.options_advanced_hardware,
					type = "toggle",
					get = function(info)
						return LookingForGroup.db.profile.hardware
					end,
					set = function(info,val)
						if val then
							LookingForGroup.db.profile.hardware = true
						else
							LookingForGroup.db.profile.hardware = nil
						end
					end,
				},
				mute =
				{
					name = MUTE,
					type = "toggle",
					get = function(info)
						return LookingForGroup.db.profile.mute
					end,
					set = function(info,val)
						if val then
							LookingForGroup.db.profile.mute = true
						else
							LookingForGroup.db.profile.mute = nil
						end
					end,
				},
			}
		},
	}
})
