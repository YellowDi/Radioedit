local L = LibStub("AceLocale-3.0"):GetLocale("HandyNotes", false)
local FOLDER_NAME = ...
local Frame = CreateFrame("Frame")

local iconDefault = [[Interface\AddOns\]] .. FOLDER_NAME .. [[\Buttons\Default]]
local iconDisabled = [[Interface\AddOns\]] .. FOLDER_NAME .. [[\Buttons\Disabled]]

local btn = CreateFrame("Button", "HandyNotesWorldMapButton", WorldMapFrame.BorderFrame, "UIPanelButtonTemplate")

local function SetIconTexture()
	if HandyNotes:IsEnabled() then
		btn:SetNormalTexture(iconDefault)
	else
		btn:SetNormalTexture(iconDisabled)
	end
end

btn:ClearAllPoints()
btn:SetPoint("TOPRIGHT", WorldMapFrame.BorderFrame, "TOPRIGHT", -48, -3)
btn:RegisterForClicks("AnyUp")
btn:SetWidth(16)
btn:SetHeight(16)
btn:SetText("")
SetIconTexture()
btn:Hide()

local function btnOnEnter(self, motion)
	SetIconTexture()
	WorldMapTooltip:Hide()
	WorldMapTooltip:SetOwner(self, "ANCHOR_TOPLEFT")
	if HandyNotes:IsEnabled() then
		WorldMapTooltip:AddLine(L["Hide HandyNotes Icons"], nil, nil, nil, nil, 1 )
	else
		WorldMapTooltip:AddLine(L["Show HandyNotes Icons"], nil, nil, nil, nil, 1 )
	end
	WorldMapTooltip:Show()
end

local function btnOnLeave(self, motion)
	SetIconTexture()
	WorldMapTooltip:Hide()
end

local function btnOnClick(self)
	local db = LibStub("AceDB-3.0"):New("HandyNotesDB", defaults).profile

	if HandyNotes:IsEnabled() then
		db.enabled = false
		HandyNotes:Disable()
		if MapMarkToggleEnable then MapMarkToggleEnable(false) end
	else
		db.enabled = true
		HandyNotes:Enable()
		if MapMarkToggleEnable then MapMarkToggleEnable(true) end
	end	
	SetIconTexture()
end

btn:SetScript("OnClick", btnOnClick)
btn:SetScript("OnEnter", btnOnEnter)
btn:SetScript("OnLeave", btnOnLeave)

Frame:RegisterEvent("WORLD_MAP_UPDATE")
Frame:SetScript("OnEvent", function(self, event, ...)
	if ((event == "WORLD_MAP_UPDATE") and (WorldMapFrame:IsVisible())) then
		if IsAddOnLoaded('HandyNotes') then
			if btn then
				btn:Show();
				SetIconTexture();
			end
		else
			if btn then
				btn:Hide();
			end
		end
	end
end)