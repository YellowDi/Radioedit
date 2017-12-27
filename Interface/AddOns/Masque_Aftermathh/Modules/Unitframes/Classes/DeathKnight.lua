local A, C, M, L = select(2, ...):unpack()

local Class = select(2, UnitClass("player"))

if (Class ~= "DEATHKNIGHT") then return end

A.ClassFeature["DEATHKNIGHT"] = function(self)
	local Runes = {}

	for i = 1, 6 do
		local Rune = CreateFrame("StatusBar", nil, self)
		Rune:SetFrameLevel(self:GetFrameLevel() + 2)
		Rune:Size(34, 8)
		Rune:SetStatusBarTexture(C.Media.Texture2)
		Rune:CreateBackdrop(true)
		Rune:SetBackdropColor(0.77*0.5, 0.12*0.5, 0.23*0.5)

		if (i == 1) then
			Rune:Point("TOPLEFT", self, "BOTTOMLEFT", 7.5, 42)
		else
			Rune:Point("LEFT", Runes[i - 1], "RIGHT", 4, 0)
		end
		
		Runes[i] = Rune
	end
	
	-- Register with oUF
	self.Runes = Runes
end