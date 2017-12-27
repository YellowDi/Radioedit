local A, C, M, L = select(2, ...):unpack()

local parent, ns = ...
local oUF = ns.oUF or oUF

local UnitFrames = A["UnitFrames"]

local function SetupTargetOfTarget(self, unit)
	local Font = C.Media.Font
	local Font2 = C.Media.Font2

	self:SetAttribute("type2", "togglemenu")	
	self:RegisterForClicks("AnyUp")
	self:SetScript("OnEnter", UnitFrame_OnEnter)
	self:SetScript("OnLeave", UnitFrame_OnLeave)
	
	local TargetTargetPanel = CreateFrame("Frame", "ATargetTargetPanel", self)
	TargetTargetPanel:Point("CENTER", self, 0, -3)
	TargetTargetPanel:Size(108, 27)
	TargetTargetPanel:SetFrameLevel(self:GetFrameLevel() + 2)
    TargetTargetPanel:SetTemplate()
	
	local HighlightBG = TargetTargetPanel:CreateTexture(nil, "BORDER")
	HighlightBG:SetTexture("Interface\\Buttons\\WHITE8x8")
	HighlightBG:SetAllPoints()
	HighlightBG:SetAlpha(0)
	
	self:HookScript("OnEnter", function(self) HighlightBG:SetVertexColor(1, 1, 1, 0.025) end)
	self:HookScript("OnLeave", function(self) HighlightBG:SetVertexColor(0, 0, 0, 0) end)
	
	local Health = CreateFrame("StatusBar", nil, self)
	Health:SetStatusBarTexture("Interface\\Buttons\\WHITE8x8")
	Health:Height(24)
	Health:Point("TOPRIGHT", self, 0, 0)
	Health:Point("TOPLEFT", self, 0, 0)
	
	local HealthBG = Health:CreateTexture(nil, "BORDER")
	HealthBG:SetTexture("Interface\\Buttons\\WHITE8x8")
	HealthBG:SetAllPoints(Health)
	HealthBG:SetVertexColor(unpack(C.UnitFrames.HealthBackdropColor))
	
	if (C.UnitFrames.CustomHealtBarColor) then
		Health:SetStatusBarColor(unpack(C.UnitFrames.HealthBarColor))
		Health.colorClass = false
		Health.colorReaction = false
	else
		Health.colorClass = true
		Health.colorReaction = true
	end
	
	Health.frequentUpdates = true

	local Power = CreateFrame("StatusBar", nil, self)
	Power:SetStatusBarTexture("Interface\\Buttons\\WHITE8x8")
	Power:Height(4)
	Power:Point("TOPLEFT", Health, "BOTTOMLEFT", 0, 0)
	Power:Point("TOPRIGHT", Health, "BOTTOMRIGHT", 0, 0)

	local PowerBG = Power:CreateTexture(nil, "BORDER")
	PowerBG:SetAllPoints(Power)
	PowerBG:SetTexture("Interface\\Buttons\\WHITE8x8")
	PowerBG.multiplier = unpack(C.UnitFrames.PowerBackdropMultiplier)
	
	if (C.UnitFrames.PowerColoring) then
		Power.colorPower = true
	else
		Power.colorClass = true
		Power.colorReaction = true
	end

	Power.frequentUpdates = true
	
	if (C.UnitFrames.Smooth) then
	    local Animation = A["Animation"]
		Animation:AddSmooth(Health)
	    Animation:AddSmooth(Power)
	end

	if (C.UnitFrames.Portraits) then 
		--local Portrait = CreateFrame("PlayerModel", nil, self)	
		--Portrait:SetInside()
		--Portrait:SetAlpha(0.10)
		
		--self.Portrait = Portrait
	end

	local HealthText = Health:CreateFontString(nil, "OVERLAY")
    HealthText:Point("CENTER", Health, 2, -8)
	HealthText:SetFontTemplate(Font2, 12)
	
	local Name = Health:CreateFontString(nil, "OVERLAY")
	Name:SetFontTemplate(Font, 12)
	Name:Point("CENTER", Health, 0, 2)
	
	local InvisFrame = CreateFrame("Frame", nil, self)
	InvisFrame:SetFrameLevel(Health:GetFrameLevel() + 8)
	InvisFrame:SetAllPoints()

	local Phase = InvisFrame:CreateTexture(nil, "OVERLAY")
	Phase:Size(28, 28)
	Phase:Point("CENTER", self, "TOP")
	
	local Quest = InvisFrame:CreateTexture(nil, "OVERLAY")
	Quest:Size(28, 28)
	Quest:Point("CENTER", self, "TOP", 4, 0)

	local RaidIcon = InvisFrame:CreateTexture(nil, "OVERLAY")
	RaidIcon:Size(28, 28)
	RaidIcon:Point("CENTER", self, "TOP", 0, 6)
	
	--local PvP = InvisFrame:CreateTexture(nil, "OVERLAY")
	--PvP:Size(18, 18)
	--PvP:Point("BOTTOMRIGHT", Health, 6, -11)

	-- Register with oUF
	self:Tag(HealthText, "|cff559655[perhp]%")
	self:Tag(Name, "[raidcolor][Aftermathh:ShortName]")

	self.Health = Health
	self.Health.bg = HealthBG
	self.Power = Power
	self.Power.bg = PowerBG
	self.PhaseIndicator = Phase
	self.QuestIndicator = Quest
	self.RaidTargetIndicator = RaidIcon
	self.PvPIndicator = PvP
	
	self.SpellRange = {
		insideAlpha = 1,
		outsideAlpha = 0.3,
	}
end

oUF:RegisterStyle("AftermathhTargetOfTarget", SetupTargetOfTarget)
oUF:Factory(function(self)
	self:SetActiveStyle("AftermathhTargetOfTarget")
	
	local TargetTarget = oUF:Spawn("TargetTarget")
	TargetTarget:Size(108, 22)
	TargetTarget:Point(unpack(C.UnitFrames.TargetTargetPoint))
end)