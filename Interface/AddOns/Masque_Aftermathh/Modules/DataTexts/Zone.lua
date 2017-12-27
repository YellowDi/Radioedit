local A, C, M, L = select(2, ...):unpack()	

if C.DataTexts.Zone then else return end

local ZoneFrame = CreateFrame("Frame", nil, UIParent)
ZoneFrame:SetSize(160, 50)
ZoneFrame:SetPoint(unpack(C.DataTexts.ZonePoint))

local ZoneText = ZoneFrame:CreateFontString(nil, "OVERLAY")
ZoneText:SetPoint("CENTER", ZoneFrame)
ZoneText:SetFontTemplate(C.Media.Font2, C.DataTexts.FontSize+2)
ZoneText:SetTextColor(unpack(C.DataTexts.TextColor))

local ZoneColors = {
	["friendly"] = {0.1, 1.0, 0.1},
	["sanctuary"] = {0.41, 0.8, 0.94},
	["arena"] = {1.0, 0.1, 0.1},
	["hostile"] = {1.0, 0.1, 0.1},
	["contested"] = {1.0, 0.7, 0.0},
}

local function UpdateZone()
	local Info = GetZonePVPInfo()

	if ZoneColors[Info] then
		local ZoneColors = ZoneColors[Info]
		ZoneText:SetTextColor(unpack(ZoneColors))
	else
		ZoneText:SetTextColor(1.0, 1.0, 1.0)
	end
	
	ZoneText:SetText(GetMinimapZoneText())
end

ZoneFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
ZoneFrame:RegisterEvent("ZONE_CHANGED_NEW_AREA")	
ZoneFrame:RegisterEvent("ZONE_CHANGED")
ZoneFrame:RegisterEvent("ZONE_CHANGED_INDOORS")

ZoneFrame:SetScript("OnEvent", UpdateZone)