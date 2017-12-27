local A, C, M, L = select(2, ...):unpack()

local parent, ns = ...
local oUF = ns.oUF or oUF

local UnitFrames = A["UnitFrames"]

local PlayerWidth = 238

local function SetupPlayer(self, unit)
	local TotemSize = 32
	local Font = C.Media.Font
	local Font2 = C.Media.Font2
	local Texture = C.Media.Texture
	local Texture2 = C.Media.Texture2

	self:SetAttribute("type2", "togglemenu")
	self:RegisterForClicks("AnyUp")
	self:SetScript("OnEnter", UnitFrame_OnEnter)
	self:SetScript("OnLeave", UnitFrame_OnLeave)
	
	local PlayerPanel = CreateFrame("Frame", "APlayerPanel", self)
	PlayerPanel:Point("CENTER", self, 0, -9)
	PlayerPanel:Size(PlayerWidth, 44.5)
	PlayerPanel:SetFrameLevel(self:GetFrameLevel() + 5)
	PlayerPanel:SetTemplate()
	
	local PlayerPanel2 = CreateFrame("Frame", "APlayerPanel2", self)
	PlayerPanel2:Point("TOP", self, 0, 22)
	PlayerPanel2:Size(PlayerWidth, 20)
	PlayerPanel2:CreateBackdrop(true)
	
	local HighlightBG = PlayerPanel:CreateTexture(nil, "BORDER")
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
		local Portrait = CreateFrame("PlayerModel", nil, Health)
		Portrait:Size(52, 66.5)
		Portrait:Point("LEFT", Health, -54, 8.5)
		Portrait:CreateBackdrop()
	
		self.Portrait = Portrait
	end
	
	local Buffs = CreateFrame("Frame", nil, self)
	Buffs:Size(270, 270)
	Buffs:Point("TOPRIGHT", self, 0, 59.5)
	Buffs.size = A.Scale(34)
	Buffs.spacing = A.Scale(3)
	Buffs.num = 6
	Buffs.initialAnchor = "TOPRIGHT"
	Buffs["growth-y"] = "DOWN"
	Buffs["growth-x"] = "LEFT"
	Buffs.PostCreateIcon = UnitFrames.CreateAura
	Buffs.PostUpdateIcon = UnitFrames.UpdateAura
	Buffs.CustomFilter = UnitFrames.CustomBuffFilter
	
	--[[
	local Debuffs = CreateFrame("Frame", nil, self)
	Debuffs:Size(310, 270)
	Debuffs:Point("CENTER", UIParent, 0, 0)
	Debuffs.size = A.Scale(52)
	Debuffs.spacing = A.Scale(3)
	Debuffs.num = 1
	Debuffs.initialAnchor = "CENTER"
	Debuffs["growth-y"] = "DOWN"
	Debuffs["growth-x"] = "RIGHT"
	Debuffs.PostCreateIcon = UnitFrames.CreateAura
	Debuffs.PostUpdateIcon = UnitFrames.UpdateAura
	Debuffs.CustomFilter = UnitFrames.CustomDebuffFilter
	Debuffs.disableMouse = true
	--]]

	if (C.UnitFrames.CastBarMod) then
		local Castbar = CreateFrame("StatusBar", nil, self)
		Castbar:Size(312, 24)
		Castbar:SetStatusBarTexture(Texture)
		Castbar:SetStatusBarColor(unpack(C.UnitFrames.CastBarColor))
		Castbar:Point("BOTTOM", UIParent, 0, 86)	
        Castbar:CreateBackdrop()
		
		local CastbarSpark = Castbar:CreateTexture(nil, "OVERLAY")
		CastbarSpark:SetBlendMode("Add")
		CastbarSpark:SetSize(15, 45)
		CastbarSpark:SetAlpha(0.2)
		
		local CastbarSafeZone = Castbar:CreateTexture(nil, "BORDER")
		CastbarSafeZone:SetTexture("Interface\\Buttons\\WHITE8x8")
		CastbarSafeZone:SetVertexColor(0.31, 0.45, 0.63, 0.80)
	
		if (C.UnitFrames.CastBarIconPlayer) then
			local CastbarIcon = Castbar:CreateTexture(nil, "ARTWORK")
			CastbarIcon:Size(28, 28)
			CastbarIcon:SetTexCoord(unpack(A.TexCoords))
			CastbarIcon:Point("LEFT", -34, 0)
			
			local IconOverlay = CreateFrame("Frame", nil, Castbar)
			IconOverlay:SetAllPoints(CastbarIcon)
			IconOverlay:SetTemplate(true, 28, 28)
		end

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
		self.Castbar.Spark = CastbarSpark
		self.Castbar.SafeZone = CastbarSafeZone
		self.Castbar.Icon = CastbarIcon
		self.Castbar.Time = CastbarTime		
		self.Castbar.Text = CastbarText
		self.Castbar.CustomDelayText = UnitFrames.UpdateCustomDelayText
		self.Castbar.CustomTimeText = UnitFrames.UpdateCustomTimeText
		
		if (C.UnitFrames.CastBarLatecy) then
		    Castbar:ClearAllPoints()
		    Castbar:Point("BOTTOM", UIParent, 0, 92)	
		
		    local InvisFrameC = CreateFrame("Frame", nil, Castbar)
		    InvisFrameC:SetFrameLevel(Castbar:GetFrameLevel() + 4)
		    InvisFrameC:SetAllPoints()

		    local CastbarLatency = Castbar:CreateFontString(nil, "OVERLAY")
		    CastbarLatency:SetParent(InvisFrameC)
		    CastbarLatency:SetFontTemplate(Font2, 11.5)
		    CastbarLatency:SetVertexColor(0.6, 0.6, 0.6)
	
		    Castbar.PostCastStart = function(self, unit)
			    if (self.Latency) then
				    local MS = select(3, GetNetStats())
				    self.Latency:ClearAllPoints()
				    self.Latency:Point("RIGHT", self, "BOTTOMRIGHT", -1, -1)
				    self.Latency:SetText(string.format("%.0f", MS).."ms")
			    end
		    end

		    Castbar.PostChannelStart = function(self, unit)
			    if (self.Latency) then
				    local MS = select(3, GetNetStats())
				    self.Latency:ClearAllPoints()
				    self.Latency:Point("LEFT", Castbar, "BOTTOMLEFT", 1, -1)
				    self.Latency:SetText(string.format("%.0f", MS).."ms")
			    end
		    end
			
			self.Castbar.Latency = CastbarLatency
		end
	end

	local InvisFrame = CreateFrame("Frame", nil, self)
	InvisFrame:SetFrameLevel(Health:GetFrameLevel() + 5)
	InvisFrame:SetAllPoints()

	local RaidIcon = InvisFrame:CreateTexture(nil, "OVERLAY")
	RaidIcon:Size(28, 28)
	RaidIcon:Point("CENTER", self, "TOP", 0, 28)
	
	local PvP = InvisFrame:CreateTexture(nil, "OVERLAY")
	PvP:Size(22, 22)
	PvP:Point("BOTTOMLEFT", self.Portrait, -9, -6)
	
	local Resting = InvisFrame:CreateTexture(nil, "OVERLAY")
	Resting:Size(18, 18)
	Resting:Point("TOPLEFT", self.Portrait, -9, 6)
	
	local Combat = InvisFrame:CreateTexture(nil, "OVERLAY")
	Combat:Size(18, 18)
	Combat:Point("TOP", self.Portrait, 0, 6)

	local Leader = InvisFrame:CreateTexture(nil, "OVERLAY")
	Leader:Size(14, 14)
	Leader:Point("BOTTOMLEFT", Health, "TOPLEFT", -1, -4)

	local MasterLoot = InvisFrame:CreateTexture(nil, "OVERLAY")
	MasterLoot:Size(12, 12)
	MasterLoot:Point("BOTTOMLEFT", Health, "TOPLEFT", 15, -2)
	
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
		FirstBar:Width(PlayerWidth)
		FirstBar:SetStatusBarTexture("Interface\\Buttons\\WHITE8x8")
		FirstBar:SetStatusBarColor(0, 1, 0.5, 0.45)
		FirstBar:SetMinMaxValues(0,1)

		local SecondBar = CreateFrame("StatusBar", nil, Health)
		SecondBar:Point("TOPLEFT", Health:GetStatusBarTexture(), "TOPRIGHT")
		SecondBar:Point("BOTTOMLEFT", Health:GetStatusBarTexture(), "BOTTOMRIGHT")
		SecondBar:Width(PlayerWidth)
		SecondBar:SetStatusBarTexture("Interface\\Buttons\\WHITE8x8")
		SecondBar:SetStatusBarColor(0, 0.5, 1, 0.45)

		local ThirdBar = CreateFrame("StatusBar", nil, Health)
		ThirdBar:Point("TOPLEFT", Health:GetStatusBarTexture(), "TOPRIGHT")
		ThirdBar:Point("BOTTOMLEFT", Health:GetStatusBarTexture(), "BOTTOMRIGHT")
		ThirdBar:Width(PlayerWidth)
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
	
	if (C.UnitFrames.AdditionalPower) then
	    local PowerColorR, PowerColorB, PowerColorG = 0.31, 0.45, 0.63
	
		local AdditionalPower = CreateFrame("StatusBar", nil, self)
		AdditionalPower:Size(224, 8)
		AdditionalPower:Point("TOP", Health, 0, 15.5)
		AdditionalPower:GetFrameLevel(Health:GetFrameLevel() + 2)
		AdditionalPower:SetStatusBarTexture(Texture2)
		AdditionalPower:SetStatusBarColor(PowerColorR, PowerColorB, PowerColorG )
		AdditionalPower:SetTemplate()

		local AdditionalPowerBG = AdditionalPower:CreateTexture(nil, "BORDER")
	    AdditionalPowerBG:SetAllPoints(AdditionalPower)
	    AdditionalPowerBG:SetTexture(Texture2)
		AdditionalPowerBG:SetVertexColor(PowerColorR*0.5, PowerColorG*0.5, PowerColorB*0.5)
		
		self.AdditionalPower = AdditionalPower
		self.AdditionalPower.bg = AdditionalPowerBG
	end
	
	if (C.UnitFrames.Totems) then
		local Totems = CreateFrame("Frame", nil, self)
		Totems:Size(TotemSize, TotemSize)
		Totems:Point("CENTER", UIParent, -36, -286)

		for i = 1, MAX_TOTEMS do
			local Totem = CreateFrame("Frame", "ATotemBarSlot"..i, Totems)
			Totem:Size(TotemSize, TotemSize)
			Totem:SetTemplate(true, TotemSize, TotemSize)
			
			if (i == 1) then
				Totem:Point("CENTER", Totems, 0, 0)
			else
				Totem:Point("LEFT", Totems[i - 1], "RIGHT", 4, 0)
			end
			
			local Icon = Totem:CreateTexture(nil, "OVERLAY")
			Icon:SetAllPoints()
			Icon:SetTexCoord(unpack(A.TexCoords))
			Totem.Icon = Icon

			local Cooldown = CreateFrame("Cooldown", nil, Totem, "CooldownFrameTemplate")
			Cooldown:SetAllPoints()
			Cooldown:SetInside()
		    Totem.Cooldown = Cooldown

			Totems[i] = Totem
		end

		self.Totems = Totems
	end

	-- Add ClassFeature
	local Class = select(2, UnitClass("player"))
	A.ClassFeature[Class](self)

	-- Register with oUF
	table.insert(self.__elements, UnitFrames.UpdateDebuffHighlight)
	self:RegisterEvent("UNIT_AURA", UnitFrames.UpdateDebuffHighlight)

	self.Health = Health
	self.Health.bg = HealthBG
	self.Power = Power
	self.Power.bg = PowerBG
	self.Buffs = Buffs
	self.Debuffs = Debuffs
	self.RaidTargetIndicator = RaidIcon
	self.PvPIndicator = PvP
	self.RestingIndicator = Resting
	self.CombatIndicator = Combat
	self.LeaderIndicator = Leader
	self.MasterLooterIndicator = MasterLoot
end

oUF:RegisterStyle("AftermathhPlayer", SetupPlayer)
oUF:Factory(function(self)
	self:SetActiveStyle("AftermathhPlayer")

	local Player = oUF:Spawn("Player")
	Player:Size(PlayerWidth, 27)
	Player:Point(unpack(C.UnitFrames.PlayerPoint))
end)