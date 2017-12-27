local A, C, M, L = select(2, ...):unpack()

if not (C.Nameplates.NameplateMod) then 
	return 
end

local parent, ns = ...
local oUF = ns.oUF or oUF

local UnitFrames = A["UnitFrames"]

local function SetupNameplates(self, unit)
	local Font = C.Media.Font
	local Font2 = C.Media.Font2

    local Scale = UIParent:GetEffectiveScale()
	self:SetScale(Scale)
	self:Size(172, 20)
	self:Point("CENTER", 0, 0)

	local NameplatesPanel = CreateFrame("Frame", "ANameplatesPanel", self)
	NameplatesPanel:Width(172)
	NameplatesPanel:Height(26)
	NameplatesPanel:Point("CENTER", self, 0, -1)
	NameplatesPanel:SetFrameLevel(self:GetFrameLevel() + 2)
	NameplatesPanel:SetTemplate()
	
	local Health = CreateFrame("StatusBar", nil, self)
	Health:SetStatusBarTexture("Interface\\Buttons\\WHITE8x8")
	Health:Height(20)
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
	Power:Height(3)
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

	local Debuffs = CreateFrame("Frame", nil, self)
	Debuffs:Size(270, 270)
	Debuffs:Point("BOTTOMLEFT", self, "TOPLEFT", 0, -98)
	Debuffs.size = A.Scale(28)
	Debuffs.spacing = A.Scale(3)
	Debuffs.num = 5
	Debuffs["growth-x"] = "RIGHT"
	Debuffs.initialAnchor = "LEFT"
	Debuffs.PostCreateIcon = UnitFrames.CreateAura
	Debuffs.PostUpdateIcon = UnitFrames.UpdateAura
	Debuffs.onlyShowPlayer = true
	Debuffs.disableMouse = true
	
	if (C.UnitFrames.CastBarMod) then
		local Castbar = CreateFrame("StatusBar", nil, self)
		Castbar:SetStatusBarTexture(C.Media.Texture)
		Castbar:SetStatusBarColor(unpack(C.UnitFrames.CastBarColor))
		Castbar:Point("TOPLEFT", Health, "BOTTOMLEFT", 0, -8)
		Castbar:Point("BOTTOMRIGHT", Health, "BOTTOMRIGHT", 0, -28)
		Castbar:CreateBackdrop()
		
		local CastbarIcon = Castbar:CreateTexture(nil, "ARTWORK")
		CastbarIcon:Size(28, 28)
		CastbarIcon:Point("LEFT", -34, 12)
		CastbarIcon:SetTexCoord(unpack(A.TexCoords))
	
		local IconOverlay = CreateFrame("Frame", nil, Castbar)
		IconOverlay:SetAllPoints(CastbarIcon)
		IconOverlay:SetTemplate(true, 28, 28)

		local CastbarTime = Castbar:CreateFontString(nil, "OVERLAY")
		CastbarTime:Point("RIGHT", Castbar, -4, 0)
		CastbarTime:SetJustifyH("RIGHT")
		CastbarTime:SetFontTemplate(Font, 12)

		local CastbarText = Castbar:CreateFontString(nil, "OVERLAY")
		CastbarText:Point("LEFT", Castbar, 4, 0)
		CastbarText:SetJustifyH("LEFT")
		CastbarText:SetFontTemplate(Font, 12)

		self.Castbar = Castbar
		self.Castbar.Icon = CastbarIcon
		self.Castbar.Time = CastbarTime 
		self.Castbar.Text = CastbarText

		Castbar.CustomDelayText = UnitFrames.UpdateCustomDelayText
		Castbar.CustomTimeText = UnitFrames.UpdateCustomTimeText
		Castbar.PostChannelStart = UnitFrames.UpdateInterruptColor
		Castbar.PostCastStart = UnitFrames.UpdateInterruptColor
	end
	
	local InvisFrame = CreateFrame("Frame", nil, self)
	InvisFrame:SetFrameLevel(Health:GetFrameLevel() + 10)
	InvisFrame:SetAllPoints()
	
	local Name = self:CreateFontString(nil, "OVERLAY")
	Name:Point("TOP", self,	0, 20)
	Name:SetFontTemplate(C.Media.Font, 13)

	local RaidIcon = InvisFrame:CreateTexture(nil, "OVERLAY", 7)
	RaidIcon:Size(28, 28)
	RaidIcon:Point("CENTER", Health, "TOP")
	
	--table.insert(self.__elements, UnitFrames.UpdateThreatNameplates)
	--self:RegisterEvent("PLAYER_TARGET_CHANGED", UnitFrames.UpdateThreatNameplates)
	--self:RegisterEvent("UNIT_THREAT_LIST_UPDATE", UnitFrames.UpdateThreatNameplates)
	--self:RegisterEvent("UNIT_THREAT_SITUATION_UPDATE", UnitFrames.UpdateThreatNameplates)

	-- Register with oUF	
	self:Tag(Name, "[raidcolor][Aftermathh:Name]")

	self.Health = Health
	self.Health.bg = HealthBG
	self.Power = Power
	self.Power.bg = PowerBG
	self.Debuffs = Debuffs
	self.RaidTargetIndicator = RaidIcon
end

local CVars = {
    nameplateGlobalScale = 1,
    NamePlateHorizontalScale = 1,
    NamePlateVerticalScale = 1,
    nameplateLargerScale = 1,
    nameplateMaxScale = 1,
    nameplateMinScale = 1,
    nameplateSelectedScale = 1,
    nameplateSelfScale = 1,
}

oUF:RegisterStyle("Aftermathh_Nameplates", SetupNameplates)
oUF:SetActiveStyle("Aftermathh_Nameplates")
oUF:SpawnNamePlates("Aftermathh_Nameplate", nil, CVars)