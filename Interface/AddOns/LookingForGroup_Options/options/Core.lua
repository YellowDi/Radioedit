local LibStub = LibStub
local AceAddon = LibStub("AceAddon-3.0")
local LookingForGroup = AceAddon:GetAddon("LookingForGroup")
local LookingForGroup_Options = AceAddon:GetAddon("LookingForGroup_Options")

LookingForGroup_Options:push("options",{
	name = OPTIONS,
	type = "group",
	args =
	{
		icon =
		{
			name = EMBLEM_SYMBOL,
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
		wq =
		{
			name = TRACKER_HEADER_WORLD_QUESTS,
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
})
