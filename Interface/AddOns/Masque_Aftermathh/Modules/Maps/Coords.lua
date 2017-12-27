local A, C, M, L = select(2, ...):unpack()

local Class = select(2, UnitClass("player"))
local CustomClassColor = A.Colors.class[Class]

local WorldMap = _G["WorldMapFrame"]
local WorldMapScroll = _G["WorldMapScrollFrame"]

local WorldMapChoords = CreateFrame("Frame", nil, WorldMap)
WorldMapChoords:SetParent(WorldMapScroll)

local PlayerText = WorldMapChoords:CreateFontString(nil, "OVERLAY")
PlayerText:SetJustifyH("LEFT")
PlayerText:SetPoint("BOTTOMLEFT", WorldMapScroll, "BOTTOM", 20, 5)
PlayerText:SetFontTemplate(C.Media.Font2, 16)
PlayerText:SetTextColor(unpack(CustomClassColor))

local CursorText = WorldMapChoords:CreateFontString(nil, "OVERLAY")
CursorText:SetJustifyH("RIGHT")
CursorText:SetPoint("BOTTOMRIGHT", WorldMapScroll, "BOTTOM", -20, 5)
CursorText:SetFontTemplate(C.Media.Font2, 16)
CursorText:SetTextColor(unpack(CustomClassColor))

WorldMapChoords:SetScript("OnUpdate", function(self, Elapsed)
	self.Update = (self.Update or 0) - Elapsed

	if (self.Update < 0) then
		local AWorldMapDetailFrame = _G["WorldMapDetailFrame"]
		local Scale = WorldMapDetailFrame:GetEffectiveScale()
		local Width = WorldMapDetailFrame:GetWidth()
		local Height = WorldMapDetailFrame:GetHeight()
		local CenterX, CenterY = WorldMapDetailFrame:GetCenter()
		local PlayerX, PlayerY = GetPlayerMapPosition("player")
		local CursorX, CursorY = GetCursorPosition()
		
		local AdjustedX = (CursorX / Scale - (CenterX - (Width / 2))) / Width
		local AdjustedY = (CenterY + (Height / 2 ) - CursorY / Scale) / Height
		
		if not GetPlayerMapPosition("player") then
			PlayerX = 0
			PlayerY = 0
		end

		PlayerX = math.floor(100 * PlayerX)
		PlayerY = math.floor(100 * PlayerY)

		if PlayerX ~= 0 and PlayerY ~= 0 then
			PlayerText:SetText("|cffffffffYou:|r " .. PlayerX .. "*" .. PlayerY)
		else
			PlayerText:SetText("")
		end

		if (AdjustedX >= 0  and AdjustedY >= 0 and AdjustedX <= 1 and AdjustedY <= 1) then
			AdjustedX = math.floor(100 * AdjustedX)
			AdjustedY = math.floor(100 * AdjustedY)

			CursorText:SetText("|cffffffffCursor:|r " .. AdjustedX .. "*" .. AdjustedY)
		else
			CursorText:SetText("")
		end

		self.Update = 0
	end
end)