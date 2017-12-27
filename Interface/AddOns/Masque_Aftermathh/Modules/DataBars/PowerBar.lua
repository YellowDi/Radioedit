local A, C, M, L = select(2, ...):unpack()

local PowerBar = CreateFrame("Frame")

local Class = select(2, UnitClass("player"))
local CustomClassColor = A.Colors.class[Class]

function PowerBar:CreateBar()
	local StatusBar = CreateFrame("StatusBar", nil, UIParent)
	StatusBar:Size(198, 8)
	StatusBar:Point("CENTER", UIParent, 0, -102)
	StatusBar:SetStatusBarTexture("Interface\\Buttons\\WHITE8x8")
	StatusBar:CreateBackdrop()
	StatusBar:Hide()

	StatusBar:RegisterEvent("PLAYER_REGEN_ENABLED")
	StatusBar:RegisterEvent("PLAYER_REGEN_DISABLED")
	StatusBar:RegisterEvent("PLAYER_TARGET_CHANGED")
	StatusBar:RegisterEvent("UPDATE_SHAPESHIFT_FORM")
	StatusBar:RegisterEvent("RUNE_TYPE_UPDATE")
	StatusBar:RegisterUnitEvent("UNIT_COMBO_POINTS", "player")
	StatusBar:RegisterUnitEvent("UNIT_DISPLAYPOWER", "player")
	StatusBar:RegisterUnitEvent("UNIT_POWER_FREQUENT", "player")
	StatusBar:SetScript("OnEvent", PowerBar.OnEvent)

	local Animation = A["Animation"]
	Animation:AddSmooth(StatusBar)

	local InvisFrame = CreateFrame("Frame", nil, StatusBar)
	InvisFrame:SetFrameLevel(StatusBar:GetFrameLevel() + 2)
	InvisFrame:SetAllPoints()

	local Text = InvisFrame:CreateFontString(nil, "OVERLAY")
	Text:SetFontTemplate(C.Media.Font2, 18)
	Text:Point("CENTER", StatusBar, 0, 0)
	
	local ExtraText = InvisFrame:CreateFontString(nil, "OVERLAY")
	ExtraText:SetFontTemplate(C.Media.Font2, 24)
	ExtraText:Point("CENTER", StatusBar, 0, 32)
	
	local ArrowDown = StatusBar:CreateTexture(nil, "OVERLAY")
	ArrowDown:Size(12, 12)
	ArrowDown:SetTexture(C.Media.PowerArrowDown)

	local ArrowUp = StatusBar:CreateTexture(nil, "OVERLAY")
	ArrowUp:Size(12, 12)
	ArrowUp:SetTexture(C.Media.PowerArrowUp)
	
	if (Class == "DEATHKNIGHT") then
		local Runes = {}	
	
		for i = 1, 6 do
			local RuneText = StatusBar:CreateFontString(nil, "OVERLAY")
			RuneText:SetFontTemplate(C.Media.Font2, 22)
			RuneText:SetTextColor(0.0, 0.69, 0.89)
		
			Runes[i] = RuneText
		end

		Runes[1]:Point("CENTER", StatusBar, -86.5, 32)
		Runes[2]:Point("CENTER", StatusBar, -51.5, 32)
		Runes[3]:Point("CENTER", StatusBar, -16.5, 32)
		Runes[4]:Point("CENTER", StatusBar, 16.5, 32)
		Runes[5]:Point("CENTER", StatusBar, 51.5, 32)
		Runes[6]:Point("CENTER", StatusBar, 86.5, 32)
	
		self.Runes = Runes
	end
	
	self.StatusBar = StatusBar
	self.Text = Text
	self.ExtraText = ExtraText
	self.ArrowDown = ArrowDown
	self.ArrowUp = ArrowUp
end

function PowerBar:UpdateBar()
	local StatusBar = self.StatusBar
	local Text = self.Text
	local ArrowDown = self.ArrowDown
	local ArrowUp = self.ArrowUp

	local Min, Max = UnitPower("player"), UnitPowerMax("player")
	local R, G, B = A.ColorGradient(Min, Max, 0.8, 0, 0, 0.8, 0.8, 0, 0, 0.8, 0)

	if (StatusBar) then
		StatusBar:SetMinMaxValues(0, Max)
		StatusBar:SetValue(Min)		

		local PowerType, PowerToken = UnitPowerType("player")
		local PowerColor = A.Colors.power[PowerToken]
		
		if (PowerColor) then
			StatusBar:SetStatusBarColor(PowerColor[1], PowerColor[2], PowerColor[3])
			StatusBar:SetBackdropColor(PowerColor[1]*0.5, PowerColor[2]*0.5, PowerColor[3]*0.5)
		end
		
		if (ArrowDown) or (ArrowUp) then
			ArrowDown:SetVertexColor(R, G, B)
			ArrowDown:Point("TOP", StatusBar, "BOTTOMLEFT", Min / Max * 198, 0)
		
			ArrowUp:SetVertexColor(R, G, B)
			ArrowUp:Point("BOTTOM", ArrowDown, "TOP", 0, 8)
		end
	end

	if (Text) then
		--Text:SetText(A.ShortNumbers(Min) .. " (" .. math.floor(Min/Max*100) ..  "%)")
		Text:SetText(A.ShortNumbers(Min))
		Text:SetTextColor(R, G, B)
	end
end

function PowerBar:UpdateExtraPoints()
	local PowerType
	local Text = self.ExtraText

	if (Class == "ROGUE" or Class == "DRUID") then
		PowerType = UnitPower("player", SPELL_POWER_COMBO_POINTS)
	elseif (Class == "PALADIN") then
		PowerType = UnitPower("player", SPELL_POWER_HOLY_POWER)
	elseif (Class == "WARLOCK") then
		PowerType = UnitPower("player", SPELL_POWER_SOUL_SHARDS)
	elseif (Class == "MONK") then
		PowerType = UnitPower("player", SPELL_POWER_CHI)
	elseif (Class == "MAGE") then
		PowerType = UnitPower("player", SPELL_POWER_ARCANE_CHARGES)
	else
		return
	end

	if (Text) then
		if (PowerType == 1) then
			Text:SetTextColor(0.80, 0.22, 0)
		elseif (PowerType == 2) then
			Text:SetTextColor(0.80, 0.42, 0)
		elseif (PowerType == 3) then
			Text:SetTextColor(0.80, 0.62, 0)
		elseif (PowerType == 4) then
			Text:SetTextColor(0.80, 0.82, 0)
		elseif (PowerType == 5) then
			Text:SetTextColor(0, 1, 0)
		end
	
		Text:SetText(PowerType == 0 and "" or PowerType)
	end
end

function PowerBar:RuneCooldown(self)
	local Start, Duration, RuneIsReady = GetRuneCooldown(self)
	local Time = floor(GetTime() - Start)
	local Cooldown = ceil(Duration - Time)
	
	if (RuneIsReady) then
		return "#"
	elseif (Cooldown) then
		return Cooldown
	else
		return "#"
	end		
end

function PowerBar:UpdateRunes()
	self:SetScript("OnUpdate", function(self)
		for i = 1, 6 do
			local RuneText = self.Runes[i]
			RuneText:SetText(PowerBar:RuneCooldown(i))
		end
	end)
end

function PowerBar:OnEvent(event)
	PowerBar:UpdateBar()
	PowerBar:UpdateExtraPoints()
	
	if (Class == "DEATHKNIGHT") then
	    PowerBar:UpdateRunes()
	end

	if (event == "PLAYER_REGEN_DISABLED") then
		self:Show()
	elseif (event == "PLAYER_REGEN_ENABLED") then
		self:Hide()
	end
end

function PowerBar:Enable()
	if not (C.DataBars.PowerBar) then
		return
	end

	if not (self.IsCreated) then
		self:CreateBar()
	
		self.IsCreated = true
	end
end

PowerBar:RegisterEvent("PLAYER_LOGIN")
PowerBar:RegisterEvent("PLAYER_ENTERING_WORLD")
PowerBar:RegisterEvent("ADDON_LOADED")

PowerBar:SetScript("OnEvent", function(self, event)
	if (event == "PLAYER_LOGIN") then
		self:Enable()
	end
end)