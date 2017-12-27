local A, C, M, L = select(2, ...):unpack()

local Class = select(2, UnitClass("player"))
local CustomClassColor = A.Colors.class[Class]

if (Class ~= "WARLOCK") then return end

A.ClassFeature["WARLOCK"] = function(self)
	--local SoulShards = self:CreateFontString(nil, "OVERLAY")
	--SoulShards:SetPoint("CENTER", self, "RIGHT", 14, -10)
	--SoulShards:SetFontTemplate(C.Media.Font2, C.UnitFrames.ClassTagFontSize)
	--SoulShards:SetTextColor(unpack(CustomClassColor))
	
	-- Register with oUF
	--self:Tag(SoulShards, "[Aftermathh:SoulShards]")
end
