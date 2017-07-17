local AceAddon = LibStub("AceAddon-3.0")
local LookingForGroup = AceAddon:GetAddon("LookingForGroup")
local LookingForGroup_Background = AceAddon:NewAddon("LookingForGroup_Background","AceEvent-3.0")

function LookingForGroup_Background:OnInitialize()
	self.db = LibStub("AceDB-3.0"):New("LookingForGroup_BackgroundCharacterDB",
	{
		profile =
		{
		}
	},true)
end

function LookingForGroup_Background:OnEnable()
end
