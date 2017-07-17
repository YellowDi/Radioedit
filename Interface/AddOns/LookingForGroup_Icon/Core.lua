local LookingForGroup = LibStub("AceAddon-3.0"):GetAddon("LookingForGroup")
local LookingForGroup_Icon = LibStub("AceAddon-3.0"):NewAddon("LookingForGroup_Icon")

local LDB = LibStub("LibDataBroker-1.1"):NewDataObject("LookingForGroup_Icon",{
	type = "data source",
	icon = "Interface/Icons/INV_Misc_GroupNeedMore"
})

function LDB:OnClick(button)
	if button == "LeftButton" then
		LookingForGroup.GetAddon("LookingForGroup_CR").do_scan()
	else
		if button == "MiddleButton" then
			LookingForGroup.GetAddon("LookingForGroup_Options").DoCRSearch()
		end
		LookingForGroup:ChatCommand()
	end
end

function LDB:OnEnter()
	GameTooltip:SetOwner(self)
	GameTooltip:ClearLines()
	GameTooltip:AddLine("LookingForGroup")
	GameTooltip:Show()
end

function LDB:OnLeave()
	GameTooltip:Hide()
end

local icon = LibStub("LibDBIcon-1.0")

function LookingForGroup_Icon:OnInitialize()
	self.db = LibStub("AceDB-3.0"):New("LookingForGroup_IconCharacterDB", {profile = {}})
	self.icon = LibStub("LibDBIcon-1.0"):Register("LookingForGroup_Icon",LDB,self.db.profile)
end

function LookingForGroup_Icon:OnEnable()
	if LookingForGroup.db.profile.enable_icon then
		icon:Show("LookingForGroup_Icon")
	else
		icon:Hide("LookingForGroup_Icon")
	end
end
