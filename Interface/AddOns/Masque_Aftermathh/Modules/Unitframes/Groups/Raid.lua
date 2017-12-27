local A, C, M, L = select(2, ...):unpack()

local parent, ns = ...
local oUF = ns.oUF or oUF

local UnitFrames = A["UnitFrames"]

local Width = 68
local Height = 36

local function SetupRaid(self, unit)
	local Font = C.Media.Font
	local Font2 = C.Media.Font2

    self:SetAttribute("type2", "menu")
	self:RegisterForClicks("AnyDown")

	local RaidPanel = CreateFrame("Frame", "ARaidPanel", self)
	RaidPanel:Point("CENTER", self, 0, -2)
	RaidPanel:Size(Width, Height+4)
	RaidPanel:SetFrameLevel(self:GetFrameLevel() + 5)
    RaidPanel:SetTemplate()

	local Health = CreateFrame("StatusBar", nil, self)
	Health:SetOrientation("VERTICAL")
	Health:SetStatusBarTexture("Interface\\Buttons\\WHITE8x8")
	Health:Height(Height)
	Health:Point("TOPRIGHT", self, 0, 0)
	Health:Point("TOPLEFT", self, 0, 0)
	
	local HealthBG = Health:CreateTexture(nil, "BORDER")
	HealthBG:SetAllPoints(Health)
	HealthBG:SetTexture("Interface\\Buttons\\WHITE8x8")
	HealthBG:SetVertexColor(unpack(C.UnitFrames.HealthBackdropColor))
	
	if (C.UnitFrames.CustomBarColorRaid) then
		Health:SetStatusBarColor(unpack(C.UnitFrames.HealthBarColorRaid))
	else
		Health.colorClass = true
	end

	Health.frequentUpdates = true
	
	local Power = CreateFrame("StatusBar", nil, Health)
	Power:SetHeight(4)
	Power:SetStatusBarTexture("Interface\\Buttons\\WHITE8x8")
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
	
	local HealthText = Health:CreateFontString(nil, "OVERLAY")
	HealthText:SetPoint("TOP", 0, -20)
	HealthText:SetFontTemplate(Font2, 12)

	local Name = Health:CreateFontString(nil, "OVERLAY")
	Name:SetPoint("TOP", 0, -6)
	Name:SetFontTemplate(Font, 12)

	if (C.UnitFrames.AuraWatch) then
		UnitFrames:CreateAuraWatch(self)
	end
	
	if (C.UnitFrames.RaidDebuffs) then
		local RaidDebuffs = CreateFrame("Frame", nil, self)
		RaidDebuffs:Size(18, 18)
		RaidDebuffs:Point("CENTER", self)
		RaidDebuffs:SetFrameLevel(Health:GetFrameLevel() + 5)
	
		RaidDebuffs.FilterDispelableDebuff = false
		RaidDebuffs.MatchBySpellName = false
		RaidDebuffs.ShowDispelableDebuff = true
		RaidDebuffs.ShowBossDebuff = true
		RaidDebuffs.BossDebuffPriority = 5
	
		local Icon = RaidDebuffs:CreateTexture(nil, "ARTWORK")
		Icon:SetTexCoord(unpack(A.TexCoords))
		Icon:SetAllPoints(RaidDebuffs)
	    RaidDebuffs.icon = Icon
	
	    local OverlayFrame = CreateFrame("Frame", nil, RaidDebuffs)
		OverlayFrame:SetFrameStrata("MEDIUM")
	    OverlayFrame:SetFrameLevel(RaidDebuffs:GetFrameLevel() + 5)
	
		local Count = RaidDebuffs:CreateFontString(nil, "OVERLAY")
		Count:SetPoint("TOPRIGHT", 2, 3)
		Count:SetParent(OverlayFrame)
		Count:SetFontTemplate(Font2, 10)
		RaidDebuffs.count = Count

		local Cooldown = CreateFrame("Cooldown", nil, RaidDebuffs, "CooldownFrameTemplate")
		Cooldown:SetAllPoints(RaidDebuffs)
		Cooldown:SetInside()
		RaidDebuffs.cd = Cooldown
	
		RaidDebuffs.Debuffs = UnitFrames.RaidDebuffsTracking
	
		self.RaidDebuffs = RaidDebuffs
	end
	
	local InvisFrame = CreateFrame("Frame", nil, self)
	InvisFrame:SetFrameLevel(Health:GetFrameLevel() + 8)
	InvisFrame:SetAllPoints()
	
	local HighlightBG = InvisFrame:CreateTexture(nil, "BORDER")
	HighlightBG:SetInside(RaidPanel)
	HighlightBG:SetTexture("Interface\\Buttons\\WHITE8x8")
	HighlightBG:SetAlpha(0)
	
	self:HookScript("OnEnter", function(self) HighlightBG:SetVertexColor(1, 1, 1, 0.1) end)
	self:HookScript("OnLeave", function(self) HighlightBG:SetVertexColor(0, 0, 0, 0) end)

	local MasterLoot = InvisFrame:CreateTexture(nil, "OVERLAY", self)
	MasterLoot:Size(11, 11)
	MasterLoot:Point("TOPRIGHT", Health, 2, 6)
	
	local Assistant = InvisFrame:CreateTexture(nil, "OVERLAY", self)
	Assistant:Size(11, 11)
	Assistant:Point("TOPLEFT", Health, -2.5, 6)

	local Leader = InvisFrame:CreateTexture(nil, "OVERLAY", self)
	Leader:Size(11, 11)
	Leader:Point("TOPLEFT", Health, -2.5, 6)
	
	local RaidIcon = InvisFrame:CreateTexture(nil, "OVERLAY")
	RaidIcon:Size(12, 12)
	RaidIcon:Point("TOP", Health, 0, 8)
	
	local ReadyCheck = InvisFrame:CreateTexture(nil, "OVERLAY")
	ReadyCheck:Size(25, 25)
	ReadyCheck:Point("CENTER", Health, 0, 0)
	
	if (C.UnitFrames.ShowRoleIcon) then
		local GroupRole = InvisFrame:CreateTexture(nil, 'OVERLAY')
		GroupRole:Point("BOTTOM", Health, 0, -2)
		GroupRole:Size(10, 10)
		
		self.GroupRoleIndicator = GroupRole
	end
	
	if (C.UnitFrames.TankIcon) then
		local TankIcon = InvisFrame:CreateTexture(nil, 'OVERLAY')
		TankIcon:Point("TOP", Health, 0, 8)
		TankIcon:Size(14, 14)
		
		self.RaidRoleIndicator = TankIcon
	end
	
	if (C.UnitFrames.HealthPrediction) then
		local FirstBar = CreateFrame("StatusBar", nil, Health)
		FirstBar:SetOrientation("VERTICAL")
		FirstBar:Point("BOTTOM", Health:GetStatusBarTexture(), "TOP", 0, 0)
		FirstBar:Size(Width, Height)
		FirstBar:SetStatusBarTexture("Interface\\Buttons\\WHITE8x8")
		FirstBar:SetStatusBarColor(0, 1, 0.5, 0.45)

		local SecondBar = CreateFrame("StatusBar", nil, Health)
		SecondBar:SetOrientation("VERTICAL")
		SecondBar:Point("BOTTOM", Health:GetStatusBarTexture(), "TOP", 0, 0)
		SecondBar:Size(Width, Height)
		SecondBar:SetStatusBarTexture("Interface\\Buttons\\WHITE8x8")
		SecondBar:SetStatusBarColor(0, 0.5, 1, 0.45)
	
		local ThirdBar = CreateFrame("StatusBar", nil, Health)
		ThirdBar:SetOrientation("VERTICAL")
		ThirdBar:Point("BOTTOM", Health:GetStatusBarTexture(), "TOP", 0, 0)
		ThirdBar:Size(Width, Height)
		ThirdBar:SetStatusBarTexture("Interface\\Buttons\\WHITE8x8")
		ThirdBar:SetStatusBarColor(0.3, 0.3, 0, 0.45)
		
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

	--table.insert(self.__elements, UpdateThreatRaid)
	--self:RegisterEvent("PLAYER_TARGET_CHANGED", UpdateThreatRaid)
	--self:RegisterEvent("UNIT_THREAT_LIST_UPDATE", UpdateThreatRaid)
	--self:RegisterEvent("UNIT_THREAT_SITUATION_UPDATE", UpdateThreatRaid)
	
	-- Register with oUF	
	self:Tag(HealthText, "[Aftermathh:Deficit]")
	self:Tag(Name, "[raidcolor][Aftermathh:RaidName]")
	
	self.Health = Health
	self.Health.bg = HealthBG
	self.Power = Power
	self.Power.bg = PowerBG
	self.MasterLooterIndicator = MasterLoot
	self.AssistantIndicator = Assistant
	self.LeaderIndicator = Leader
	self.RaidTargetIndicator  = RaidIcon
	self.ReadyCheckIndicator = ReadyCheck
	
	self.SpellRange = { 
		insideAlpha = 1, 
		outsideAlpha = 0.5,
	}
end

oUF:RegisterStyle("Aftermathh_Raid", SetupRaid)
oUF:SetActiveStyle("Aftermathh_Raid")

local Aftermathh_Raid = oUF:SpawnHeader(nil, nil, "solo,party,raid",
	"showPlayer", true,
	"showRaid", true,
	"showParty", true,
	"showSolo", C.UnitFrames.ShowRaidSolo,
	"oUF-initialConfigFunction", [[
		local header = self:GetParent()
		self:SetWidth(header:GetAttribute("initial-width"))
		self:SetHeight(header:GetAttribute("initial-height"))
	]],
	"initial-width", A.Scale(Width),
	"initial-height", A.Scale(Height),
	"xoffset", A.Scale(4),
	"yOffset", -A.Scale(4),
	"point", "LEFT",
	"columnAnchorPoint", "TOP",
	"groupFilter", "1,2,3,4,5,6,7,8",
	"groupingOrder", "1,2,3,4,5,6,7,8",
	"groupBy", "GROUP",
	"sortMethod", "GROUP",
	"maxColumns", 8,
	"unitsPerColumn", 5,
	"columnSpacing", 8
)
Aftermathh_Raid:Point(unpack(C.UnitFrames.RaidPoint))