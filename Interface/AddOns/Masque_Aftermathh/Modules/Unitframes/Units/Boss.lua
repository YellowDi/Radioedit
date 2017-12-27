local A, C, M, L = select(2, ...):unpack()

local parent, ns = ...
local oUF = ns.oUF or oUF

local UnitFrames = A["UnitFrames"]

local function SetupBoss(self, unit)
	local Font = C.Media.Font
	local Font2 = C.Media.Font2

	self:SetAttribute("type2", "togglemenu")	
	self:RegisterForClicks("AnyUp")
	self:SetScript("OnEnter", UnitFrame_OnEnter)
	self:SetScript("OnLeave", UnitFrame_OnLeave)

	local BossPanel = CreateFrame("Frame", "ABossPanel", self)
	BossPanel:Point("CENTER", self, 0, -9)
	BossPanel:Size(204, 44.5)
	BossPanel:SetFrameLevel(self:GetFrameLevel() + 2)
	BossPanel:SetTemplate()

	local HighlightBG = BossPanel:CreateTexture(nil, "BORDER")
	HighlightBG:SetTexture("Interface\\Buttons\\WHITE8x8")
	HighlightBG:SetAllPoints()
	HighlightBG:SetAlpha(0)
	
	self:HookScript("OnEnter", function(self) HighlightBG:SetVertexColor(1, 1, 1, 0.025) end)
	self:HookScript("OnLeave", function(self) HighlightBG:SetVertexColor(0, 0, 0, 0) end)

	local Health = CreateFrame("StatusBar", nil, self)
	Health:SetStatusBarTexture("Interface\\Buttons\\WHITE8x8")
	Health:Height(40)
	Health:Point("TOPRIGHT", self, 0, 0)
	Health:Point("TOPLEFT", self, 0, 0)

	local HealthBG = Health:CreateTexture(nil, "BORDER")
	HealthBG:SetTexture("Interface\\Buttons\\WHITE8x8")
	HealthBG:SetAllPoints(Health)
	HealthBG:SetVertexColor(unpack(C.UnitFrames.HealthBackdropColor))

	local HealthText = Health:CreateFontString(nil, "OVERLAY")
	HealthText:Point("LEFT", Health, 4, 0)
	HealthText:SetFontTemplate(Font2, 12)
	Health.Value = HealthText

	if (C.UnitFrames.CustomHealtBarColor) then
		Health:SetStatusBarColor(unpack(C.UnitFrames.HealthBarColor))
		Health.colorClass = false
		Health.colorReaction = false
	else
		Health.colorClass = true
		Health.colorReaction = true
	end

	Health.frequentUpdates = true
	Health.PostUpdate = UnitFrames.UpdateHealth

	local Power = CreateFrame("StatusBar", nil, self)
	Power:SetStatusBarTexture("Interface\\Buttons\\WHITE8x8")
	Power:Height(4)
	Power:Point("TOPLEFT", Health, "BOTTOMLEFT", 0, 0)
	Power:Point("TOPRIGHT", Health, "BOTTOMRIGHT", 0, 0)

	local PowerBG = Power:CreateTexture(nil, "BORDER")
	PowerBG:SetAllPoints(Power)
	PowerBG:SetTexture("Interface\\Buttons\\WHITE8x8")
	PowerBG.multiplier = unpack(C.UnitFrames.PowerBackdropMultiplier)

	local PowerText = Power:CreateFontString(nil, "OVERLAY")
	PowerText:Point("RIGHT", Health, -4, 0)
	PowerText:SetFontTemplate(Font2, 12)
	Power.Value = PowerText

	if (C.UnitFrames.PowerColoring) then
		Power.colorPower = true
	else
		Power.colorClass = true
		Power.colorReaction = true
	end

	Power.frequentUpdates = true
	Power.PostUpdate = UnitFrames.UpdatePower
	
	if (C.UnitFrames.Smooth) then
	    local Animation = A["Animation"]
		Animation:AddSmooth(Health)
	    Animation:AddSmooth(Power)
	end

	if (C.UnitFrames.Portraits) then 
		--local Portrait = CreateFrame("PlayerModel", nil, self)
		--Portrait:Size(205, 36.5)
		--Portrait:Point("CENTER", 0, -6)
		--Portrait:SetAlpha(0.10)

		--self.Portrait = Portrait
	end

	local InvisFrame = CreateFrame("Frame", nil, self)
	InvisFrame:SetFrameLevel(Health:GetFrameLevel() + 8)
	InvisFrame:SetAllPoints()

	local RaidIcon = InvisFrame:CreateTexture(nil, "OVERLAY")
	RaidIcon:Size(28, 28)
	RaidIcon:Point("TOP", self, 0, 14)

	local Quest = InvisFrame:CreateTexture(nil, "OVERLAY")
	Quest:Size(28, 28)
	Quest:Point("CENTER", self, "TOP", 4, 0)

	-- Register with oUF	
	self.Health = Health
	self.Health.bg = HealthBG
	self.Power = Power
	self.Power.bg = PowerBG
	self.Buffs = Buffs
	self.Debuffs = Debuffs
	self.QuestIndicator = Quest
	self.RaidTargetIndicator = RaidIcon
	
	self.SpellRange = {
		insideAlpha = 1,
		outsideAlpha = 0.3,
	}
end

oUF:RegisterStyle("AftermathhBoss", SetupBoss)
oUF:Factory(function(self)
	self:SetActiveStyle("AftermathhBoss")
	
	local Boss = {}
	for i = 1, MAX_BOSS_FRAMES do
		Boss[i] = oUF:Spawn("Boss" .. i, nil)
		Boss[i]:Size(205, 26)
		
		if (i == 1) then
			Boss[i]:Point("BOTTOMRIGHT", UIParent, "TOPRIGHT", -6, -512)
		else
			Boss[i]:Point("BOTTOM", Boss[i-1], "TOP", 0, 32)
		end
	end
end)