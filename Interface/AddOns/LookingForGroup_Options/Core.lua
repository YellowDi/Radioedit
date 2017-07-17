local LibStub = LibStub
local AceAddon = LibStub("AceAddon-3.0")
local AceDBOptions = LibStub("AceDBOptions-3.0")
local AceConfig = LibStub("AceConfig-3.0")
local AceConfigRegistry = LibStub("AceConfigRegistry-3.0")
local AceConfigDialog = LibStub("AceConfigDialog-3.0")

local LookingForGroup = AceAddon:GetAddon("LookingForGroup")
local LookingForGroup_Options = AceAddon:GetAddon("LookingForGroup_Options")
local C_LFGList_ClearSearchResults = C_LFGList.ClearSearchResults

function LookingForGroup_Options:OnInitialize()
	local options = LookingForGroup_Options : get_table()
--	LookingForGroup_Options.option_table = nil
	self.db = LibStub("AceDB-3.0"):New("LookingForGroup_OptionsCharacterDB",
	{
		profile = 
		{
			cr_category = 1,
			a_group_category = 0,
			a_group_group = 0,
			a_group_activity = 0,
			start_a_group_title = "",
			start_a_group_details = "",
			start_a_group_minimum_item_level = 0,
			start_a_group_minimum_honor_level = 0,
			start_a_group_voice_chat = "",
			start_a_group_auto_accept = false,
			start_a_group_private = false,
			find_a_group_role = true,
			find_a_group_filter = "",
			find_a_group_encounters = {}
		}
	},true)
	options.args.profile = AceDBOptions:GetOptionsTable(LookingForGroup.db)
	AceConfig:RegisterOptionsTable("LookingForGroup", options, nil)
	LookingForGroup.db.RegisterCallback(LookingForGroup, "OnProfileChanged", "OnEnable")
	LookingForGroup.db.RegisterCallback(LookingForGroup, "OnProfileCopied", "OnEnable")
	LookingForGroup.db.RegisterCallback(LookingForGroup, "OnProfileReset", "OnEnable")
	self:RegisterEvent("LFG_LIST_APPLICANT_UPDATED")
end

function LookingForGroup_Options:OnEnable()
	self:EnableAV()
	self:EnableQuickJoin()
end

function LookingForGroup_Options:SOCIAL_QUEUE_UPDATE()
	AceConfigRegistry:NotifyChange("LookingForGroup")
end

function LookingForGroup_Options:RestoreDBVariable(key)
	self.db.profile[key] = self.db.defaults.profile[key]
end
