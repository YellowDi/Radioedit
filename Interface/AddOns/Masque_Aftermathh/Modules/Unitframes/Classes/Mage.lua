local A, C, M, L = select(2, ...):unpack()

local Class = select(2, UnitClass("player"))
local CustomClassColor = A.Colors.class[Class]

if (Class ~= "MAGE") then return end

A.ClassFeature["MAGE"] = function(self)
	--local ArcaneCharge = self:CreateFontString(nil, "OVERLAY")
	--ArcaneCharge:SetPoint("CENTER", self, "RIGHT", 14, -10)
	--ArcaneCharge:SetFontTemplate(C.Media.Font2, 20)
	--ArcaneCharge:SetTextColor(unpack(CustomClassColor))
	
	-- Register with oUF
	--self:Tag(ArcaneCharge, "[Aftermathh:ArcaneCharge]")
end