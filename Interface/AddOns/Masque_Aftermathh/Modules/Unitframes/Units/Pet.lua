local A, C, M, L = select(2, ...):unpack()

local parent, ns = ...
local oUF = ns.oUF or oUF

local UnitFrames = A["UnitFrames"]

local function SetupPet(self, unit)
	local Font = C.Media.Font
	local Font2 = C.Media.Font2
	local Texture = C.Media.Texture

	self:SetAttribute("type2", "togglemenu")
	self:RegisterForClicks("AnyUp")
	self:SetScript("OnEnter", UnitFrame_OnEnter)
	self:SetScript("OnLeave", UnitFrame_OnLeave)
	
	local PetPanel = CreateFrame("Frame", "APetPanel", self)
	PetPanel:Point("CENTER", self, 0, -4)
	PetPanel:Size(102, 34.5)
	PetPanel:SetFrameLevel(self:GetFrameLevel() + 2)
	PetPanel:SetTemplate()
	
	local HighlightBG = PetPanel:CreateTexture(nil, "BORDER")
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
		--Portrait:SetAlpha(0.35)
		
		--self.Portrait = Portrait
		
		local Portrait = CreateFrame("PlayerModel", nil, Health)
		Portrait:Size(32, 34.5)
		Portrait:Point("LEFT", Health, -34, -1.5)
		Portrait:CreateBackdrop()
	
		self.Portrait = Portrait
	end

	local Name = Health:CreateFontString(nil, "OVERLAY")
	Name:Point("CENTER", Health, 0, 0)
	Name:SetFontTemplate(Font, 12)
	
	local Buffs = CreateFrame("Frame", nil, self)
	Buffs:Size(270, 270)
	Buffs:Point("RIGHT", self, 29, 0.5)
	Buffs.size = A.Scale(26)
	Buffs.spacing = A.Scale(3)
	Buffs.num = 5
	Buffs.initialAnchor = "RIGHT"
	Buffs["growth-y"] = "DOWN"
	Buffs["growth-x"] = "RIGHT"
	Buffs.PostCreateIcon = UnitFrames.CreateAura
	Buffs.PostUpdateIcon = UnitFrames.UpdateAura

	if (C.UnitFrames.CastBarMod) then
		local Castbar = CreateFrame("StatusBar", nil, self)
		Castbar:Size(115.5, 18)
		Castbar:SetStatusBarTexture(Texture)
		Castbar:SetStatusBarColor(unpack(C.UnitFrames.CastBarColor))
		Castbar:Point("BOTTOM", self, -7.5, -29)
		Castbar:CreateBackdrop()
		
		local CastbarIcon = Castbar:CreateTexture(nil, "ARTWORK")
		CastbarIcon:Size(18, 18)
		CastbarIcon:Point("LEFT", -20, 0)
		CastbarIcon:SetTexCoord(unpack(A.TexCoords))
		
		local IconOverlay = CreateFrame("Frame", nil, Castbar)
		IconOverlay:SetAllPoints(CastbarIcon)
		IconOverlay:SetTemplate(true, 18, 18)
		
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

		Castbar.CustomDelayText = UnitFrames.UpdateCustomTimeText
		--Castbar.CustomTimeText = UnitFrames.UpdateCustomDelayText
		Castbar.PostCastStart = UnitFrames.UpdateInterruptColor
		Castbar.PostChannelStart = UnitFrames.UpdateInterruptColor
	end

	-- Register with oUF
	self:Tag(Name, "[raidcolor][Aftermathh:ShortName]")
	
	self.Health = Health
	self.Health.bg = HealthBG
	self.Power = Power
	self.Power.bg = PowerBG
	self.Buffs = Buffs
	self.Debuffs = Debuffss
	self.RaidTargetIndicator = RaidIcon
	self.PvPIndicator = PvP
	
	self.SpellRange = {
		insideAlpha = 1,
		outsideAlpha = 0.3,
	}
end

oUF:RegisterStyle("AftermathhPet", SetupPet)
oUF:Factory(function(self)
	self:SetActiveStyle("AftermathhPet")

	local Pet = oUF:Spawn("Pet")
	Pet:Size(102, 27)
	Pet:Point(unpack(C.UnitFrames.PetPoint))
end)