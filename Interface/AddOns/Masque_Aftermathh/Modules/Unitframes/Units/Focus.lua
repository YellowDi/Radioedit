local A, C, M, L = select(2, ...):unpack()

local parent, ns = ...
local oUF = ns.oUF or oUF

local UnitFrames = A["UnitFrames"]

local function SetupFocus(self, unit)
	local Font = C.Media.Font
	local Font2 = C.Media.Font2
	local Texture = C.Media.Texture

	self:SetAttribute("type2", "togglemenu")	
	self:RegisterForClicks("AnyUp")
	self:SetScript("OnEnter", UnitFrame_OnEnter)
	self:SetScript("OnLeave", UnitFrame_OnLeave)

	local FocusPanel = CreateFrame("Frame", "AFocusPanel", self)
	FocusPanel:Point("CENTER", self, 0, -4)
	FocusPanel:Size(132, 34.5)
	FocusPanel:SetFrameLevel(self:GetFrameLevel() + 2)
	FocusPanel:SetTemplate()
	
	local HighlightBG = FocusPanel:CreateTexture(nil, "BORDER")
	HighlightBG:SetTexture("Interface\\Buttons\\WHITE8x8")
	HighlightBG:SetAllPoints()
	HighlightBG:SetAlpha(0)
	
	self:HookScript("OnEnter", function(self) HighlightBG:SetVertexColor(1, 1, 1, 0.025) end)
	self:HookScript("OnLeave", function(self) HighlightBG:SetVertexColor(0, 0, 0, 0) end)
	
	local Health = CreateFrame("StatusBar", nil, self)
	Health:SetStatusBarTexture("Interface\\Buttons\\WHITE8x8")
	Health:Height(30)
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

	local Name = Health:CreateFontString(nil, "OVERLAY")
	Name:Point("CENTER", Health, 0, 0)
	Name:SetFontTemplate(Font, 12)

	local Buffs = CreateFrame("Frame", nil, self)
	Buffs:Size(270, 270)
	Buffs:Point("TOPLEFT", self, 0, 29)
	Buffs.size = A.Scale(24)
	Buffs.spacing = A.Scale(3)
	Buffs.num = 5
	Buffs.initialAnchor = "TOPLEFT"
	Buffs["growth-y"] = "DOWN"
	Buffs["growth-x"] = "RIGHT"
	Buffs.PostCreateIcon = UnitFrames.CreateAura
	Buffs.PostUpdateIcon = UnitFrames.UpdateAura

	if (C.UnitFrames.CastBarMod) then
		local Castbar = CreateFrame("StatusBar", nil, self)
		Castbar:Size(300, 34)
		Castbar:SetStatusBarTexture(Texture)
		Castbar:SetStatusBarColor(unpack(C.UnitFrames.CastBarColor))
		Castbar:Point("CENTER", UIParent, 0, -2)
		Castbar:CreateBackdrop()
		
		local CastbarIcon = Castbar:CreateTexture(nil, "ARTWORK")
		CastbarIcon:Size(34, 34)
		CastbarIcon:Point("LEFT", -38, 0)
		CastbarIcon:SetTexCoord(unpack(A.TexCoords))
		
		local IconOverlay = CreateFrame("Frame", nil, Castbar)
		IconOverlay:SetAllPoints(CastbarIcon)
		IconOverlay:SetTemplate(true, 34, 34)
		
		local CastbarTime = Castbar:CreateFontString(nil, "OVERLAY")	
		CastbarTime:Point("RIGHT", Castbar, -4, 0)
		CastbarTime:SetJustifyH("RIGHT")
		CastbarTime:SetFontTemplate(Font, 13)

		local CastbarText = Castbar:CreateFontString(nil, "OVERLAY")
		CastbarText:Point("LEFT", Castbar, 4, 0)
		CastbarText:SetJustifyH("LEFT")
		CastbarText:SetFontTemplate(Font, 13)
		
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
	InvisFrame:SetFrameLevel(Health:GetFrameLevel() + 8)
	InvisFrame:SetAllPoints()
	
	local Quest = InvisFrame:CreateTexture(nil, "OVERLAY")
	Quest:Size(28, 28)
	Quest:Point("CENTER", self, "TOP", 4, 0)

	local RaidIcon = InvisFrame:CreateTexture(nil, "OVERLAY")
	RaidIcon:Size(28, 28)
	RaidIcon:Point("TOP", self)
	
	local PvP = InvisFrame:CreateTexture(nil, "OVERLAY")
	PvP:Size(20, 20)
	PvP:Point("BOTTOMRIGHT", Health, 8, -11)
	
	-- Register with oUF
	self:Tag(Name, "[raidcolor][Aftermathh:ShortName]")
	
	self.Health = Health
	self.Health.bg = HealthBG
	self.Power = Power
	self.Power.bg = PowerBG
	self.Buffs = Buffs
	self.Debuffs = Debuffs
	self.QuestIndicator = Quest
	self.RaidTargetIndicator = RaidIcon
	self.PvPIndicator = PvP
	
	self.SpellRange = {
		insideAlpha = 1,
		outsideAlpha = 0.3,
	}
end

oUF:RegisterStyle("AftermathhFocus", SetupFocus)
oUF:Factory(function(self)
	self:SetActiveStyle("AftermathhFocus")

	local Focus = oUF:Spawn("Focus")
	Focus:Size(132, 27)
	Focus:Point(unpack(C.UnitFrames.FocusPoint))
end)