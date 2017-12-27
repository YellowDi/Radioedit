local A, C, M, L = select(2, ...):unpack()

local Class = select(2, UnitClass("player"))
local CustomClassColor = A.Colors.class[Class]

if (Class ~= "PALADIN") then return end

A.ClassFeature["PALADIN"] = function(self)
	--local HolyPower = self:CreateFontString(nil, "OVERLAY")
	--HolyPower:SetPoint("CENTER", self, "RIGHT", 14, -10)
	--HolyPower:SetFontTemplate(C.Media.Font2, 20)
	--HolyPower:SetTextColor(unpack(CustomClassColor))
	
	-- Register with oUF
	--self:Tag(HolyPower, "[Aftermathh:HolyPower]")
end