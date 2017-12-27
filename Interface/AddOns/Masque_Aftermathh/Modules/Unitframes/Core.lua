local A, C, M, L = select(2, ...):unpack()

local UnitFrames = CreateFrame("Frame")

local parent, ns = ...
local oUF = ns.oUF or oUF

local Font = C.Media.Font
local Font2 = C.Media.Font2

--function UnitFrames:PortraitUpdate(unit, event)
--	local GUID = UnitGUID(unit)
--	if (self.GUID ~= GUID or event == "UNIT_MODEL_CHANGED") then
--		self:SetCamDistanceScale(0.8)
--	end
--end

function UnitFrames:UpdateHealth(unit)
	if (not UnitIsConnected(unit)) then
		self:SetStatusBarColor(0.20, 0.20, 0.20)
	elseif (UnitIsDead(unit)) then
		self.bg:SetVertexColor(0.20, 0.20, 0.20, 0.8)
	elseif (UnitIsGhost(unit)) then
		self.bg:SetVertexColor(0.20, 0.20, 0.20, 0.8)
	elseif (UnitIsTapDenied(unit)) then
		self:SetStatusBarColor(0.20, 0.20, 0.20)
	else
		self.bg:SetVertexColor(unpack(C.UnitFrames.HealthBackdropColor))
		self:SetStatusBarColor(unpack(C.UnitFrames.HealthBarColor))
	end

	local Min, Max = UnitHealth(unit), UnitHealthMax(unit)
	if (Min ~= Max) then
		local R, G, B = A.ColorGradient(Min, Max, 0.69, 0.31, 0.31, 0.65, 0.63, 0.35, 0.33, 0.59, 0.33)
		self.Value:SetFormattedText("|CFF559655%s|r |CFFD7BEA5-|r |CFF%02x%02x%02x%d%%|r", A.ShortNumbers(Min), R * 255, G * 255, B * 255, floor(Min / Max * 100))
	else
		self.Value:SetText("|CFF559655"..A.ShortNumbers(Min).."|r")
	end
end

function UnitFrames:UpdatePower(unit)
	local pType, pToken = UnitPowerType(unit)
	local PowerColor = oUF.colors.power[pToken]
	
	if (PowerColor) then
		self.Value:SetTextColor(PowerColor[1], PowerColor[2], PowerColor[3])
	end
	
	local Min, Max = UnitPower(unit), UnitPowerMax(unit)
	if (Min ~= Max) then
		self.Value:SetFormattedText("%d%% |CFFD7BEA5-|r %s", floor(Min / Max * 100), A.ShortNumbers(Max - (Max - Min)))
	else
		self.Value:SetText(A.ShortNumbers(Min))  
	end
end

function UnitFrames:UpdateCustomTimeText(duration)
	local Value = format("%.1f/%.1f", duration, self.max)
	self.Time:SetText(Value)
end

function UnitFrames:UpdateCustomDelayText(duration)
	local Value = format("(|CFFFF0000-%.1f|r) %.1f/%.1f", self.delay, duration, self.max)
	self.Time:SetText(Value)
end

function UnitFrames:UpdateInterruptColor(unit)
	local Interrupt = select(9, UnitCastingInfo(unit))

	if (Interrupt) then
		self.Icon:SetDesaturated(1)
		self:SetStatusBarColor(unpack(C.UnitFrames.InterruptColor))
	else
		self.Icon:SetDesaturated(false)
		self:SetStatusBarColor(unpack(C.UnitFrames.CastBarColor))
	end
end

local function GetDebuffType(unit, filter)
	if not (UnitCanAssist("player", unit)) then
		return 
	end

	local i = 1
	while true do
		local _, _, Texture, _, DebuffType = UnitAura(unit, i, "HARMFUL")
		if not Texture then break end
		if DebuffType and not filter then
			return DebuffType, Texture
		end
		i = i + 1
	end
end

function UnitFrames:UpdateDebuffHighlight(event, unit)
	local DebuffType, Texture = GetDebuffType(unit)

	if (DebuffType) then
		local Color = DebuffTypeColor[DebuffType]
		APlayerPanel:SetColorTemplate(Color.r, Color.g, Color.b)
	else
		APlayerPanel:SetColorTemplate(unpack(C.General.BorderColor))
	end	
end

function UnitFrames:UpdateThreatTarget(event, unit)
	if (self.unit ~= unit) then 
		return 
	end

	local Threat = UnitThreatSituation("player", "target")
	if (Threat and Threat > 0) then
		local R, G, B = GetThreatStatusColor(Threat)
		ATargetPanel:SetColorTemplate(R, G, B)
	else
		ATargetPanel:SetColorTemplate(unpack(C.General.BorderColor))
	end
end

function UnitFrames:UpdateThreatNameplates(event, unit)
	if (self.unit ~= unit) then 
		return 
	end

	local Threat = UnitThreatSituation("player", self.unit)
	if (Threat and Threat > 0) then
		local R, G, B = GetThreatStatusColor(Threat)
		ANameplatesPanel:SetColorTemplate(R, G, B)
	else
		ANameplatesPanel:SetColorTemplate(unpack(C.General.BorderColor))
	end
end

function UnitFrames:CreateAuraTimer(elapsed)
	if (self.TimeLeft) then
		self.Elapsed = (self.Elapsed or 0) + elapsed
		
		if (self.Elapsed >= 0.1) then
			if not (self.First) then
				self.TimeLeft = self.TimeLeft - self.Elapsed
			else
				self.TimeLeft = self.TimeLeft - GetTime()
				self.First = false
			end
			
			if (self.TimeLeft > 0) then
				local TimeText = A.FormatTimeShort(self.TimeLeft)
				self.Remaining:SetText(TimeText)
				
				if (self.TimeLeft <= 10) then
					self.Remaining:SetTextColor(unpack(C.Cooldowns.ExpireColor))
				elseif (self.TimeLeft <= 30) then
					self.Remaining:SetTextColor(unpack(C.Cooldowns.SecondsColor))
				elseif (self.TimeLeft <= 60) then
					self.Remaining:SetTextColor(unpack(C.Cooldowns.SecondsColor2))
				else
					self.Remaining:SetTextColor(unpack(C.Cooldowns.NormalColor))
				end
			else
				self.Remaining:Hide()
				self:SetScript("OnUpdate", nil)
			end
			
			self.Elapsed = 0
		end
	end
end

function UnitFrames:CreateAura(button)
	if (button.isSkinned) then
		return
	end
	
	button:CreateButtonPanel(true, button:GetWidth(), button:GetHeight())
	button:StyleButton()
	
	local OverlayFrame = CreateFrame("Frame", nil, button, nil)
	OverlayFrame:SetFrameLevel(button:GetFrameLevel() + 2)
	
	button.Remaining = button:CreateFontString(nil, "OVERLAY")
	button.Remaining:Point("CENTER", 1, -3)
	button.Remaining:SetParent(OverlayFrame)
	button.Remaining:SetFontTemplate(Font2, 12)

	button.count:ClearAllPoints()
	button.count:Point("TOPRIGHT", button, 2, 1)
	button.count:SetParent(OverlayFrame)
	button.count:SetFontTemplate(Font2, 12)
	
	button.icon:SetTexCoord(unpack(A.TexCoords))
	
	button.cd.noOCC = true
	button.cd.noCooldownCount = true
	button.cd:SetHideCountdownNumbers(true)

	button.cd:SetReverse()
	button.cd:SetInside()

	button.IsSkinned = true
end

function UnitFrames:UpdateAura(unit, button, index, offset, filter, isDebuff, duration, timeLeft)
	local _, _, _, _, DebuffType, Duration, ExpirationTime, UnitCaster, IsStealable = UnitAura(unit, index, button.filter)

	if (button) then	
		if (button.filter == "HARMFUL") then
			if (not UnitIsFriend("player", unit) and button.caster ~= "player" and button.caster ~= "vehicle") then
				button.icon:SetDesaturated(true)
				button.ButtonPanel:SetColorTemplate(unpack(C.General.BorderColor))
			else
				local Color = DebuffTypeColor[DebuffType] or DebuffTypeColor.none
				button.icon:SetDesaturated(false)
				button.ButtonPanel:SetColorTemplate(Color.r, Color.g, Color.b)
			end
		else
			if (IsStealable or DebuffType == "Magic") and not UnitIsFriend("player", unit) then
				button.ButtonPanel:SetColorTemplate(1, 0, 1)
			else
				button.ButtonPanel:SetColorTemplate(unpack(C.General.BorderColor))
			end
		end
		
		if (Duration and Duration > 0) then
			button.Remaining:Show()
		else
			button.Remaining:Hide()
		end
	
		button.Duration = Duration
		button.TimeLeft = ExpirationTime
		button.First = true
		button:SetScript("OnUpdate", UnitFrames.CreateAuraTimer)
	end
end

function UnitFrames:CreateAuraWatch(self)
    local Class = select(2, UnitClass("player"))

	local Auras = CreateFrame("Frame", nil, self)
	Auras:SetPoint("TOPLEFT", self)
	Auras:SetPoint("BOTTOMRIGHT", self)
	Auras.presentAlpha = 1
	Auras.missingAlpha = 0
	Auras.icons = {}
	Auras.strictMatching = true
	
	local Buffs = {}

	if (UnitFrames.BuffsTracking["ALL"]) then
		for key, value in pairs(UnitFrames.BuffsTracking["ALL"]) do
			tinsert(Buffs, value)
		end
	end

	if (UnitFrames.BuffsTracking[Class]) then
		for key, value in pairs(UnitFrames.BuffsTracking[Class]) do
			tinsert(Buffs, value)
		end
	end

	if (Buffs) then
		for key, spell in pairs(Buffs) do
			local Icon = CreateFrame("Frame", nil, Auras)
			Icon.spellID = spell[1]
			Icon.anyUnit = spell[4]
			Icon:SetWidth(10)
			Icon:SetHeight(10)
			Icon:SetFrameLevel(Auras:GetFrameLevel() + 20)
			Icon:SetPoint(spell[2], 0, 0)
			Icon:SetTemplate(true, 10, 10, nil, true)

			if (spell[3]) then
				Icon.Border:SetBackdropBorderColor(unpack(spell[3]))
			else
				Icon.Border:SetBackdropBorderColor(0,0,0,0)
			end
			
			local IconOverlay = CreateFrame("Frame", nil, Icon)
			IconOverlay:SetFrameStrata("MEDIUM")
			
			local Count = Icon:CreateFontString(nil, "OVERLAY")
			Count:SetParent(IconOverlay)
			Count:SetPoint("TOPRIGHT", Icon, 2, 1)
			Count:SetFontTemplate(Font2, 9)
			Icon.count = Count
			
			local Cooldown = CreateFrame("Cooldown", nil, Icon, "CooldownFrameTemplate")
			Cooldown:SetHideCountdownNumbers(true)
			Cooldown:SetReverse()
			Icon.cd = Cooldown
			
			Auras.icons[spell[1]] = Icon
		end
	end

	self.AuraWatch = Auras
end

function UnitFrames:DisableBlizzard()
    local Panels = A["Panels"]

    if (CompactRaidFrameManager) then
	    CompactRaidFrameManager:SetParent(Panels.Hider)
    end

    if (CompactUnitFrameProfiles) then
	    CompactUnitFrameProfiles:UnregisterAllEvents()
    end
end

function UnitFrames:Enable()
	self:DisableBlizzard()
end

UnitFrames:RegisterEvent("PLAYER_LOGIN")
UnitFrames:RegisterEvent("PLAYER_ENTERING_WORLD")
UnitFrames:RegisterEvent("ADDON_LOADED")

UnitFrames:SetScript("OnEvent", function(self, event)
	if (event == "PLAYER_LOGIN") then
		self:Enable()
	end
end)

A["UnitFrames"] = UnitFrames