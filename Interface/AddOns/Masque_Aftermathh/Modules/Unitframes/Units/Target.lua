local A, C, M, L = select(2, ...):unpack()

local parent, ns = ...
local oUF = ns.oUF or oUF

local UnitFrames = A["UnitFrames"]

local TargetWidth = 238

local function SetupTarget(self, unit)
	local Font = C.Media.Font
	local Font2 = C.Media.Font2
	local Texture = C.Media.Texture
	local Texture2 = C.Media.Texture2

	self:SetAttribute("type2", "togglemenu")	
	self:RegisterForClicks("AnyUp")
	self:SetScript("OnEnter", UnitFrame_OnEnter)
	self:SetScript("OnLeave", UnitFrame_OnLeave)
	
	local TargetPanel = CreateFrame("Frame", "ATargetPanel", self)
	TargetPanel:Point("CENTER", self, 0, -9)
	TargetPanel:Size(TargetWidth, 44.5)
	TargetPanel:SetFrameLevel(self:GetFrameLevel() + 5)
    TargetPanel:SetTemplate()

	local TargetPanel2 = CreateFrame("Frame", "ATargetPanel2", self)
	TargetPanel2:Point("TOP", self, 0, 22)
	TargetPanel2:Size(TargetWidth, 20)
	TargetPanel2:CreateBackdrop(true)
	
	local HighlightBG = TargetPanel:CreateTexture(nil, "BORDER")
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
	HealthBG:SetAllPoints(Health)
	HealthBG:SetTexture("Interface\\Buttons\\WHITE8x8")
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
		local Portrait = CreateFrame("PlayerModel", nil, Health)	
		Portrait:Size(54, 66.5)
		Portrait:Point("RIGHT", Health, 56, 8.5)
		Portrait:CreateBackdrop()

		self.Portrait = Portrait
	end

	local Name = Health:CreateFontString(nil, "OVERLAY")
	Name:Point("LEFT", TargetPanel2, 6, 0)
	Name:SetFontTemplate(Font, 12)

	local Level = Health:CreateFontString(nil, "OVERLAY")
	Level:Point("RIGHT", TargetPanel2, -6, 0)
	Level:SetFontTemplate(Font2, 13)

	local Buffs = CreateFrame("Frame", nil, self)
	Buffs:Size(310, 270)
	Buffs:Point("TOPLEFT", self, 0, 56)
	Buffs.size = A.Scale(30)
	Buffs.spacing = A.Scale(3)
	Buffs.num = 9
	Buffs.initialAnchor = "TOPLEFT"
	Buffs["growth-y"] = "DOWN"
	Buffs["growth-x"] = "RIGHT"
	Buffs.PostCreateIcon = UnitFrames.CreateAura
	Buffs.PostUpdateIcon = UnitFrames.UpdateAura

	local Debuffs = CreateFrame("Frame", nil, self)
	Debuffs:Size(310, 270)
	Debuffs:Point("TOPLEFT", self, 0, 89)
	Debuffs.size = A.Scale(30)
	Debuffs.spacing = A.Scale(3)
	Debuffs.num = 9
	Debuffs.initialAnchor = "TOPLEFT"
	Debuffs["growth-y"] = "DOWN"
	Debuffs["growth-x"] = "RIGHT"
	Debuffs.PostCreateIcon = UnitFrames.CreateAura
	Debuffs.PostUpdateIcon = UnitFrames.UpdateAura
	Debuffs.onlyShowPlayer = C.UnitFrames.OnlyShowPlayerDebuffs
	
	if (C.UnitFrames.TargetDebuffFilter) then 
		Debuffs.CustomFilter = UnitFrames.CustomDebuffFilter
    end
	
	if (C.UnitFrames.CastBarMod) then
		local Castbar = CreateFrame("StatusBar", nil, self)
		Castbar:Size(TargetWidth, 22)
		Castbar:SetStatusBarTexture(Texture)
		Castbar:SetStatusBarColor(unpack(C.UnitFrames.CastBarColor))
		Castbar:Point("BOTTOM", self, 0, -45)
		Castbar:CreateBackdrop()
		
		local CastbarIcon = Castbar:CreateTexture(nil, "ARTWORK")
		CastbarIcon:Size(22, 22)
		CastbarIcon:SetTexCoord(unpack(A.TexCoords))
		CastbarIcon:Point("RIGHT", 24, 0)
		
		local IconOverlay = CreateFrame("Frame", nil, Castbar)
		IconOverlay:SetAllPoints(CastbarIcon)
		IconOverlay:SetTemplate(true, 22, 22)
		
		local CastbarTime = Castbar:CreateFontString(nil, "OVERLAY")	
		CastbarTime:Point("RIGHT", Castbar, -4, 0)
		CastbarTime:SetJustifyH("RIGHT")
		CastbarTime:SetFontTemplate(Font, 12)

		local CastbarText = Castbar:CreateFontString(nil, "OVERLAY")
		CastbarText:Point("LEFT", Castbar, 4, 0)
		CastbarText:SetJustifyH("LEFT")
		CastbarText:SetFontTemplate(Font, 12)
		
		self.Castbar = Castbar
		self.Castbar.Bg = CastbarBG
		self.Castbar.Icon = CastbarIcon
		self.Castbar.Time = CastbarTime		
		self.Castbar.Text = CastbarText
		
		Castbar.CustomDelayText = UnitFrames.UpdateCustomDelayText
		Castbar.CustomTimeText = UnitFrames.UpdateCustomTimeText
		Castbar.PostCastStart = UnitFrames.UpdateInterruptColor
		Castbar.PostChannelStart = UnitFrames.UpdateInterruptColor
	end

	local InvisFrame = CreateFrame("Frame", nil, self)
	InvisFrame:SetAllPoints()
	InvisFrame:SetFrameLevel(Health:GetFrameLevel() + 8)
	
	local RaidIcon = InvisFrame:CreateTexture(nil, "OVERLAY")
	RaidIcon:Size(28, 28)
	RaidIcon:Point("CENTER", self, "TOP", 0, 28)
	
	local PvP = InvisFrame:CreateTexture(nil, "OVERLAY")
	PvP:Size(22, 22)
	PvP:Point("BOTTOMRIGHT", self.Portrait, 9, -6)
	
	local Phase = InvisFrame:CreateTexture(nil, "OVERLAY")
	Phase:Size(28, 28)
	Phase:Point("CENTER", self, "TOP", 0, 0)
	
	local Quest = InvisFrame:CreateTexture(nil, "OVERLAY")
	Quest:Size(28, 28)
	Quest:Point("CENTER", self, "TOP", 4, 22)

	if (C.UnitFrames.CombatFeedback) then
		local CombatFeedbackText = InvisFrame:CreateFontString(nil, "OVERLAY")
		CombatFeedbackText.maxAlpha = 0.6
		CombatFeedbackText:Point("CENTER", self.Portrait)
		CombatFeedbackText:SetFontTemplate(Font2, 16)
		
		self.CombatFeedbackText = CombatFeedbackText
	end
	
	if (C.UnitFrames.HealthPrediction) then
		local FirstBar = CreateFrame("StatusBar", nil, Health)
		FirstBar:Point("TOPLEFT", Health:GetStatusBarTexture(), "TOPRIGHT")
		FirstBar:Point("BOTTOMLEFT", Health:GetStatusBarTexture(), "BOTTOMRIGHT")
		FirstBar:Width(TargetWidth)
		FirstBar:SetStatusBarTexture("Interface\\Buttons\\WHITE8x8")
		FirstBar:SetStatusBarColor(0, 1, 0.5, 0.45)
		FirstBar:SetMinMaxValues(0,1)

		local SecondBar = CreateFrame("StatusBar", nil, Health)
		SecondBar:Point("TOPLEFT", Health:GetStatusBarTexture(), "TOPRIGHT")
		SecondBar:Point("BOTTOMLEFT", Health:GetStatusBarTexture(), "BOTTOMRIGHT")
		SecondBar:Width(TargetWidth)
		SecondBar:SetStatusBarTexture("Interface\\Buttons\\WHITE8x8")
		SecondBar:SetStatusBarColor(0, 0.5, 1, 0.45)

		local ThirdBar = CreateFrame("StatusBar", nil, Health)
		ThirdBar:Point("TOPLEFT", Health:GetStatusBarTexture(), "TOPRIGHT")
		ThirdBar:Point("BOTTOMLEFT", Health:GetStatusBarTexture(), "BOTTOMRIGHT")
		ThirdBar:Width(TargetWidth)
		ThirdBar:SetStatusBarTexture("Interface\\Buttons\\WHITE8x8")
		ThirdBar:SetStatusBarColor(0, 0.5, 1, 0.45)

		ThirdBar:SetFrameLevel(Health:GetFrameLevel())
		SecondBar:SetFrameLevel(ThirdBar:GetFrameLevel() + 1)
		FirstBar:SetFrameLevel(ThirdBar:GetFrameLevel() + 2)
		
		self.HealthPrediction = {
			myBar = FirstBar,
			otherBar = SecondBar,
			absorbBar = ThirdBar,
			maxOverflow = 1,
		}
	end
	
	table.insert(self.__elements, UnitFrames.UpdateThreatTarget)
	self:RegisterEvent("PLAYER_TARGET_CHANGED", UnitFrames.UpdateThreatTarget)
	self:RegisterEvent("UNIT_THREAT_LIST_UPDATE", UnitFrames.UpdateThreatTarget)
	self:RegisterEvent("UNIT_THREAT_SITUATION_UPDATE", UnitFrames.UpdateThreatTarget)
	
	-- Register with oUF
	self:Tag(Name, "[raidcolor][Aftermathh:Name]")
	self:Tag(Level, "[Aftermathh:Level]")

	self.Health = Health
	self.Health.bg = HealthBG
	self.Power = Power
	self.Power.bg = PowerBG
	self.Buffs = Buffs
	self.Debuffs = Debuffs
	self.PhaseIndicator = Phase
	self.QuestIndicator = Quest
	self.RaidTargetIndicator = RaidIcon
	self.PvPIndicator = PvP
	
	self.SpellRange = {
		insideAlpha = 1,
		outsideAlpha = 0.3,
	}
end

oUF:RegisterStyle("AftermathhTarget", SetupTarget)
oUF:Factory(function(self)
	self:SetActiveStyle("AftermathhTarget")

	local Target = oUF:Spawn("Target")
	Target:Size(TargetWidth, 27)
	Target:Point(unpack(C.UnitFrames.TargetPoint))
end)