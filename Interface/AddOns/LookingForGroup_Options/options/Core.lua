local AceAddon = LibStub("AceAddon-3.0")
local LookingForGroup = AceAddon:GetAddon("LookingForGroup")
local LookingForGroup_Options = AceAddon:GetAddon("LookingForGroup_Options")
local L = LibStub("AceLocale-3.0"):GetLocale("LookingForGroup")

LookingForGroup_Options:push("options",{
	name = OPTIONS,
	desc = "Toggles of Sub-AddOns",
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
			name = BACKGROUND,
			type = "group",
			desc = SEARCHING,
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
			desc = L["Pretend we are using other LFG addons"],
			type = "group",
			args =
			{
				meeting_stone =
				{
					name = "Meeting Stone",
					type = "toggle",
					set = function(_,val)
						if val then 
							LookingForGroup_Options.db.profile.addon_meeting_stone = true
						else
							LookingForGroup_Options.db.profile.addon_meeting_stone = nil
						end
					end,
					get = function() return LookingForGroup_Options.db.profile.addon_meeting_stone end,
				}
			}
		},
		wq = 
		{
			name = TRACKER_HEADER_WORLD_QUESTS,
			type = "group",
			args =
			{
				enable =
				{
					name = ENABLE,
					desc = "LookingForGroup_WQ",
					type = "toggle",
					order = 1,
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
				start_a_group =
				{
					name = '('..HARDWARE..')'..START_A_GROUP,
					desc = "LFG_LIST_ENTRY_EXPIRED_TOO_MANY_PLAYERS",
					type = "toggle",
					width = "full",
					get = function()
						return LookingForGroup.db.profile.wq_start_a_group
					end,
					set = function(_,val)
						if val then
							LookingForGroup.db.profile.wq_start_a_group = true
						else
							LookingForGroup.db.profile.wq_start_a_group = nil
						end
					end
				},
				kick =
				{
					name = CHAT_KICK,
					type = "toggle",
					width = "full",
					get = function()
						return not LookingForGroup.db.profile.wq_kick
					end,
					set = function(_,val)
						if val then
							LookingForGroup.db.profile.wq_kick = nil
						else
							LookingForGroup.db.profile.wq_kick = true
						end
					end
				}
			}
		},
		windowed =
		{
			name = VIDEO_OPTIONS_WINDOWED,
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
		kick =
		{
			name = CHAT_KICK,
			desc = "LookingForGroup_Kicker",
			type = "group",
			args =
			{
				wq =
				{
					name = TRACKER_HEADER_WORLD_QUESTS,
					type = "toggle",
					get = function()
						return not LookingForGroup.db.profile.wq_kick
					end,
					set = function(_,val)
						if val then
							LookingForGroup.db.profile.wq_kick = nil
						else
							LookingForGroup.db.profile.wq_kick = true
						end
					end
				},
				lfr =
				{
					name = RAID_FINDER,
					type = "toggle",
					get = function()
						return not LookingForGroup.db.profile.lfr_kick
					end,
					set = function(_,val)
						if val then
							LookingForGroup.db.profile.lfr_kick = nil
						else
							LookingForGroup.db.profile.lfr_kick = true
						end
					end
				},
				pug =
				{
					name = "PUG",
					type = "toggle",
					get = function()
						return LookingForGroup.db.profile.pug_kick
					end,
					set = function(_,val)
						if val then
							LookingForGroup.db.profile.pug_kick = 0
						else
							LookingForGroup.db.profile.pug_kick = nil
						end
					end
				},
				pugdps =
				{
					name = "PUG",
					desc = "DPS",
					type = "input",
					pattern = "^[0-9]*$",
					get = function()
						local pk = LookingForGroup.db.profile.pug_kick
						if pk then
							return tostring(pk)
						end
					end,
					set = function(_,v)
						if v=="" then
							LookingForGroup.db.profile.pug_kick = nil
						else
							LookingForGroup.db.profile.pug_kick = tonumber(v)
						end
					end
				},
			}
		},
		advance =
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
			}
		},
	}
})
