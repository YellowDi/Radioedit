local A, C, M, L = select(2, ...):unpack()

local Maps = CreateFrame("Frame")

local Minimap = _G["Minimap"]
local Width = 176
local Height = 176

function Maps:OnMouseClick(Button)
	if (Button == "RightButton") then
		ToggleDropDownMenu(1, nil, MiniMapTrackingDropDown, self)
	else
		Minimap_OnClick(self)
	end
end

function Maps:ScrollZoom(Zoom)
	if (Zoom > 0) then
		MinimapZoomIn:Click()
	elseif (Zoom < 0) then
		MinimapZoomOut:Click()
	end
end

function Maps:Style()
	Minimap:SetMaskTexture("Interface\\Buttons\\WHITE8x8")
	Minimap:Size(Width, Height)
	Minimap:SetTemplate(true, Width, Height)
	
    Minimap:SetScript("OnMouseUp", Maps.OnMouseClick)
    Minimap:SetScript("OnMouseWheel", Maps.ScrollZoom)
	
	local QueStatusButton = _G["QueueStatusMinimapButton"]
	QueStatusButton:SetScale(0.90)
	QueStatusButton:ClearAllPoints()
	QueStatusButton:Point("BOTTOMLEFT", Minimap, 0.5, -2)

	local GarrisonButton = _G["GarrisonLandingPageMinimapButton"]
	GarrisonButton:SetScale(0.65)
	GarrisonButton:Point("TOPLEFT", Minimap, 4, -2)

	local Mail = _G["MiniMapMailFrame"]
	Mail:ClearAllPoints()
	Mail:Point("BOTTOMRIGHT", Minimap, 0, 0)

	local MailIcon = _G["MiniMapMailIcon"]
	MailIcon:SetTexture(C.Media.Mail)

	local Date = _G["GameTimeFrame"]
	Date:StripTexture()
	Date:Size(14, 14)
	Date:ClearAllPoints()
	Date:Point("TOPRIGHT", Minimap, -6, -6)
	Date:SetHitRectInsets(0, 0, 0, 0)
  
	local DateText = Date:GetFontString()
	DateText:SetFontTemplate(C.Media.Font2, C.DataTexts.FontSize)
	DateText:SetTextColor(unpack(C.DataTexts.TextColor))

	local ZoneButton = _G["MinimapZoneTextButton"]
	ZoneButton:EnableMouse(false)
	
	Maps.ZonePanel = CreateFrame("Frame", nil, Minimap)
	Maps.ZonePanel:Size(168, 26)
	Maps.ZonePanel:Point("TOP", Minimap, 0, -4)
	Maps.ZonePanel:SetFrameStrata("HIGH")
	Maps.ZonePanel:CreateBackdrop(true)
	Maps.ZonePanel:Hide()

	local ZoneText = _G["MinimapZoneText"]
	ZoneText:Point("CENTER", Maps.ZonePanel, 0, 0)
	ZoneText:SetParent(Maps.ZonePanel)
	ZoneText:SetFontTemplate(C.Media.Font2, 13)
	
	Minimap:HookScript("OnEnter", function(self) Maps.ZonePanel:Show() end)
	Minimap:HookScript("OnLeave", function(self) Maps.ZonePanel:Hide() end)
end

function Maps:NewGlow()
	local Textures = {
		"GameTimeCalendarEventAlarmTexture",
		"GameTimeCalendarInvitesTexture",
		"GameTimeCalendarInvitesGlow",
	}

	for i, TexturesName in pairs(Textures) do
		local Texture = _G[TexturesName]
		Texture:SetTexture(nil)

		hooksecurefunc(Texture, "Show", function() Minimap:SetColorTemplate(1, 0, 1) end)
		hooksecurefunc(Texture, "Hide", function() Minimap:SetColorTemplate(unpack(C.General.BorderColor)) end)
	end
end

function Maps:Disable()
	local HiddenFrames = {
		"MiniMapInstanceDifficulty",
		"GuildInstanceDifficulty",
		"MinimapBorder",
		"MinimapBorderTop",
		"MinimapZoomIn",
		"MinimapZoomOut",
		"MiniMapVoiceChatFrame",
		"MinimapNorthTag",
		"MiniMapWorldMapButton",
		"MiniMapTracking",
		"MiniMapMailBorder",
		"QueueStatusMinimapButtonBorder",
		--"MiniMapChallangeMode",
	}

	for i, FrameName in pairs(HiddenFrames) do
		local Frame = _G[FrameName]
		Frame:Hide()
	
		if (Frame.UnregisterAllEvents) then
			Frame:UnregisterAllEvents()
		end
	end

	local North = _G["MinimapNorthTag"]
	if (North) then
	    North:SetTexture(nil)
	end
end

function Maps:Enable()
	Maps:Disable()
	Maps:Style()
	Maps:NewGlow()
	
	local Time = _G["TimeManagerClockButton"]
	if (Time) then
		Time:Kill()
	end
end

Maps:RegisterEvent("PLAYER_LOGIN")
Maps:RegisterEvent("PLAYER_ENTERING_WORLD")
Maps:RegisterEvent("ADDON_LOADED")

Maps:SetScript("OnEvent", function(self, event)
	if (event == "PLAYER_LOGIN") then
		Maps:Enable()
	end
end)