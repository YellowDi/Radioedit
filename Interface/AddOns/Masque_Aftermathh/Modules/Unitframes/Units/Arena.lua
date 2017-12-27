local A, C, M, L = select(2, ...):unpack()

local parent, ns = ...
local oUF = ns.oUF or oUF

local UnitFrames = A["UnitFrames"]

local function SetupArena(self, unit)
	local Font = C.Media.Font
	local Font2 = C.Media.Font2

	self:SetAttribute("type2", "togglemenu")
	self:RegisterForClicks("AnyUp")
	self:SetScript("OnEnter", UnitFrame_OnEnter)
	self:SetScript("OnLeave", UnitFrame_OnLeave)
	
	local ArenaPanel = CreateFrame("Frame", "ArenaPanel", self)
	ArenaPanel:Point("CENTER", self, 0, -9)
	ArenaPanel:Size(205, 44.5)
	ArenaPanel:SetTemplate()
	
    local HighlightBG = ArenaPanel:CreateTexture(nil, "BORDER")
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

	local Buffs = CreateFrame("Frame", nil, self)
	Buffs:Size(270, 270)
	Buffs:Point("TOPLEFT", self, 0, 29)
	Buffs.size = A.Scale(26)
	Buffs.spacing = A.Scale(3)
	Buffs.num = 7
	Buffs.initialAnchor = "TOPLEFT"
	Buffs["growth-y"] = "DOWN"
	Buffs["growth-x"] = "RIGHT"
	Buffs.PostCreateIcon = UnitFrames.CreateAura
	Buffs.PostUpdateIcon = UnitFrames.UpdateAura

	local InvisFrame = CreateFrame("Frame", nil, self)
	InvisFrame:SetFrameStrata("HIGH")
	InvisFrame:SetFrameLevel(1)
	InvisFrame:SetAllPoints()
	
	local RaidIcon = InvisFrame:CreateTexture(nil, "OVERLAY")
	RaidIcon:Size(28, 28)
	RaidIcon:Point("TOP", self, 0, 14)
	
	local PvP = InvisFrame:CreateTexture(nil, "OVERLAY")
	PvP:Size(20, 20)
	PvP:Point("BOTTOMRIGHT", Health, 8, -11)
	
    --local SpecIcon = CreateFrame("Frame", nil, self)
	--SpecIcon:Size(32)
	--SpecIcon:Point("RIGHT", self, "LEFT", -6, -3)
	--SpecIcon:SetTemplate(true, 32, 32)
	
    local Trinket = CreateFrame("Frame", nil, self)
	Trinket:Size(32)
	Trinket:Point("RIGHT", self, "LEFT", -6, -3)
	Trinket:SetTemplate(true, 32, 32)

	-- Register with oUF	
	self.Health = Health
	self.Health.bg = HealthBG
	self.Power = Power
	self.Power.bg = PowerBG
	self.Buffs = Buffs
	self.Debuffs = Debuffs
	self.RaidTargetIndicator = RaidIcon
	self.PvPIndicator = PvP
	self.PVPSpecIcon = SpecIcon
	self.Trinket = Trinket
	
	self.SpellRange = {
		insideAlpha = 1,
		outsideAlpha = 0.3,
	}
end

oUF:RegisterStyle("AftermathhArena", SetupArena)
oUF:Factory(function(self)
	self:SetActiveStyle("AftermathhArena")
	
	local Arena = {}
	local ArenaPreparation = {}
	
	for i = 1, 5 do
		Arena[i] = self:Spawn("Arena" .. i, nil)
		Arena[i]:Size(205, 27)
		
		if (i == 1) then
			Arena[i]:Point("BOTTOMRIGHT", UIParent, "TOPRIGHT", -6, -562)
		else
			Arena[i]:Point("BOTTOM", Arena[i-1], "TOP", 0, 58)
		end
	
		ArenaPreparation[i] = CreateFrame("Frame", "ArenaPreparation" .. i, UIParent)
		ArenaPreparation[i]:SetAllPoints(Arena[i])

		ArenaPreparation[i].Health = CreateFrame("StatusBar", nil, ArenaPreparation[i])
		ArenaPreparation[i].Health:SetAllPoints()
		ArenaPreparation[i].Health:SetTemplate()
		ArenaPreparation[i].Health:SetStatusBarTexture("Interface\\Buttons\\WHITE8x8")
		ArenaPreparation[i].Health:SetStatusBarColor(unpack(C.UnitFrames.HealthBarColor))

		ArenaPreparation[i].SpecClass = ArenaPreparation[i].Health:CreateFontString(nil, "OVERLAY")
		ArenaPreparation[i].SpecClass:Point("CENTER", ArenaPreparation[i], 0, 0)
		ArenaPreparation[i].SpecClass:SetFontTemplate(C.Media.Font, 12)
		
		ArenaPreparation[i]:Hide()
	end
	
	local ArenaPreparationFrame = CreateFrame("Frame")
	ArenaPreparationFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
	ArenaPreparationFrame:RegisterEvent("ARENA_PREP_OPPONENT_SPECIALIZATIONS")
	ArenaPreparationFrame:RegisterEvent("ARENA_OPPONENT_UPDATE")

	ArenaPreparationFrame:SetScript("OnEvent", function(self, event)
		if (event == "ARENA_OPPONENT_UPDATE") then
			for i = 1, 5 do
				local ArenaPrep = ArenaPreparation[i]
				ArenaPrep:Hide()
			end
		else
			local NumOpps = GetNumArenaOpponentSpecs()
		
			for i = 1, 5 do
				local ArenaPrep = ArenaPreparation[i]
			
				if (i <= NumOpps) then
					local SpecID = GetArenaOpponentSpec(i)
				
					if (SpecID and SpecID > 0) then
						local _, Spec, _, _, _, Class = GetSpecializationInfoByID(SpecID)

						if (Class and SpecID) then
							ArenaPrep.SpecClass:SetText(LOCALIZED_CLASS_NAMES_MALE[Class] .. "  -  " .. Spec)
							
							local CustomClassColor = Arena[i].colors.class[Class]
							ArenaPreparation[i].SpecClass:SetTextColor(unpack(CustomClassColor))
						end

						ArenaPrep:Show()
					else 
						ArenaPrep:Hide()
					end
				else
					ArenaPrep:Hide()
				end
			end
		end
	end)
end)