local A, C, M, L = select(2, ...):unpack()

local AltPowerBar = CreateFrame("Frame")

function AltPowerBar:Disable()
	local PlayerPowerBarAlt = _G["PlayerPowerBarAlt"]
    PlayerPowerBarAlt:UnregisterAllEvents()
end

function AltPowerBar:CreateBar()
	local Panels = A["Panels"]
	
    local StatusBar = CreateFrame("StatusBar", nil, UIParent)
    StatusBar:SetOrientation("VERTICAL")
    StatusBar:Size(8, 74)
    StatusBar:Point("RIGHT", Panels.ActionBarPanel, 24.5, 0)
    StatusBar:SetStatusBarTexture("Interface\\Buttons\\WHITE8x8")
	StatusBar:SetStatusBarColor(0, 144/255, 1)
    StatusBar:CreateBackdrop()
	StatusBar:Hide()

    StatusBar:RegisterEvent("UNIT_POWER_BAR_SHOW")
    StatusBar:RegisterEvent("UNIT_POWER_BAR_HIDE")
    StatusBar:RegisterUnitEvent("UNIT_POWER", "player")
    StatusBar:RegisterUnitEvent("UNIT_MAXPOWER", "player")
	StatusBar:SetScript("OnEvent", AltPowerBar.OnEvent)

    StatusBar:SetScript("OnEnter", AltPowerBar.OnEnter)
	StatusBar:SetScript("OnLeave", function() GameTooltip:Hide() end)
	
	self.StatusBar = StatusBar
end

function AltPowerBar:UpdateBar()
	local Min, Max = UnitPower("player", ALTERNATE_POWER_INDEX), UnitPowerMax("player", ALTERNATE_POWER_INDEX)

 	self.StatusBar:SetMinMaxValues(0, Max)
	self.StatusBar:SetValue(Min)
end

function AltPowerBar:OnEnter()
    local Min, Max = UnitPower("player", ALTERNATE_POWER_INDEX), UnitPowerMax("player", ALTERNATE_POWER_INDEX)
	
	GameTooltip:ClearLines()
	GameTooltip:SetOwner(self, "ANCHOR_CURSOR", 0, -4)
	
	GameTooltip:AddLine("|cffffd200Alternate Power|r")
	GameTooltip:AddDoubleLine("Power:", Min .. "/" .. Max .. " - (" .. math.floor(Min/Max*100) .. "%)", 1, 1, 1, 1, 1, 1)
	
	GameTooltip:Show()
end

function AltPowerBar:OnEvent(event)
    local AltPowerInfo = UnitAlternatePowerInfo("player")
	if (AltPowerInfo) then
		self:Show()
		AltPowerBar:UpdateBar()
	else
		self:Hide()
	end
end

function AltPowerBar:Enable()
	if not (C.DataBars.AltPowerBar) then
		return
	end

	if not (self.IsCreated) then
	    AltPowerBar:CreateBar()
	
	    self.IsCreated = true
	end
end

AltPowerBar:RegisterEvent("PLAYER_LOGIN")
AltPowerBar:RegisterEvent("PLAYER_ENTERING_WORLD")
AltPowerBar:RegisterEvent("ADDON_LOADED")

AltPowerBar:SetScript("OnEvent", function(self, event)
	if (event == "PLAYER_LOGIN") then
		AltPowerBar:Disable()
		AltPowerBar:Enable()
	end
end)