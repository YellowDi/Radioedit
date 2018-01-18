local AceAddon = LibStub("AceAddon-3.0")
local LookingForGroup = AceAddon:NewAddon("LookingForGroup","AceEvent-3.0","AceConsole-3.0")
--------------------------------------------------------------------------------------

function LookingForGroup:OnInitialize()
	local china = GetCurrentRegion() == 5
	self.db = LibStub("AceDB-3.0"):New("LookingForGroupDB",
	{
		profile =
		{
			enable_wq = true,
			enable_invasionpoint = true,
			enable_elite = true,
--			enable_av = false,
			enable_icon = true,
			enable_hook = true,
			enable_event = true,
--			enable_qj = false,
			enable_ms = china or nil,
			enable_sf = true,
			spam_filter_keywords = {},
			realm_filters = {},
			spam_filter_maxlength = china and 50 or -1
		}
	})
	self:RegisterChatCommand("LookingForGroup", "ChatCommand")
	self:RegisterChatCommand("LFG", "ChatCommand")
	if self.db.profile.enable_sf then
		LoadAddOn("LookingForGroup_SF")
	end
end

function LookingForGroup.GetAddon(name)
	if IsAddOnLoaded(name) == false then
		local loaded , reason = LoadAddOn(name)
		if not loaded then
			error(reason)
		end
	end
	return AceAddon:GetAddon(name)
end

function LookingForGroup:ChatCommand(input)
	local LookingForGroup_Options = self.GetAddon("LookingForGroup_Options")
	if not input or input:trim() == "" then
		LibStub("AceConfigDialog-3.0"):Open("LookingForGroup")
	else
		LibStub("AceConfigCmd-3.0"):HandleCommand("LookingForGroup", "LookingForGroup",input)
	end
end
