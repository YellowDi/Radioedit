local A, C, M, L = select(2, ...):unpack()

if C.DataTexts.Coords then else return end

local CoordFrame = CreateFrame("Frame", nil, UIParent)
CoordFrame:SetSize(160, 50)
CoordFrame:SetPoint(unpack(C.DataTexts.CoordsPoint))

local CoordText = CoordFrame:CreateFontString(nil, "OVERLAY")
CoordText:SetPoint("CENTER", CoordFrame)
CoordText:SetFontTemplate(C.Media.Font2, C.DataTexts.FontSize)
CoordText:SetTextColor(unpack(C.DataTexts.TextColor))

CoordFrame:HookScript("OnUpdate", function(self)
	self.Update = (self.Update or 0) + 1

	if (self.Update >= 3) then
		local PlayerX, PlayerY = GetPlayerMapPosition("player")
		if not GetPlayerMapPosition("player") then
			PlayerX = 0
			PlayerY = 0
		end
		
		PlayerX = math.floor(100 * PlayerX)
		PlayerY = math.floor(100 * PlayerY)
		
		if (PlayerX == 0 and PlayerY == 0) then
			CoordText:SetText("?" .. "," .. "?")
		else 
			CoordText:SetText("|CFFFFFFFFYou|r: " .. PlayerX .. "*" .. PlayerY)
		end
		
		self.Update = 0
	end
end)