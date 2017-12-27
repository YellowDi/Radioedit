local A, C, M, L = select(2, ...):unpack()

local Class = select(2, UnitClass("player"))
local CustomClassColor = A.Colors.class[Class]

if (Class ~= "MONK") then return end

A.ClassFeature["MONK"] = function(self)
	--local Chi = self:CreateFontString(nil, "OVERLAY")
	--Chi:SetPoint("CENTER", self, "RIGHT", 14, -10)
	--Chi:SetFontTemplate(C.Media.Font2, 20)
	--Chi:SetTextColor(unpack(CustomClassColor))

    local Stagger = CreateFrame("StatusBar", nil, self)
	Stagger:Size(228, 8)
	Stagger:Point("TOP", self, 0, 16)
	Stagger:GetFrameLevel(self:GetFrameLevel() + 2)
	Stagger:SetStatusBarTexture(C.Media.Texture2)
	Stagger:SetTemplate()
	
	local StaggerBG = Stagger:CreateTexture(nil, "BORDER")
	StaggerBG:SetAllPoints(Stagger)
	StaggerBG:SetTexture(C.Media.Texture2)
	StaggerBG.multiplier = unpack(C.UnitFrames.PowerBackdropMultiplier)
	
	-- Register with oUF
	--self:Tag(Chi, "[Aftermathh:Chi]")
	self.Stagger = Stagger
	self.Stagger.bg = StaggerBG
	self.SpecialPowerBar = Stagger
end