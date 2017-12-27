local A, C, M, L = select(2, ...):unpack()

local ThreatBar = CreateFrame("Frame")

function ThreatBar:CreateBar()
    local Panels = A["Panels"]

	local StatusBar = CreateFrame("StatusBar", nil, UIParent)
    StatusBar:SetOrientation("VERTICAL")
    StatusBar:Size(8, 74)
    StatusBar:Point("LEFT", Panels.ActionBarPanel, -37, 0)
    StatusBar:SetStatusBarTexture("Interface\\Buttons\\WHITE8x8")
	StatusBar:CreateBackdrop()
	StatusBar:SetMinMaxValues(0, 100)
    StatusBar:SetAlpha(0)
	
	local Animation = A["Animation"]
	Animation:AddSmooth(StatusBar)
	
	StatusBar:RegisterEvent("PLAYER_REGEN_ENABLED")
	StatusBar:RegisterEvent("PLAYER_REGEN_DISABLED")
	StatusBar:SetScript("OnEvent", ThreatBar.OnEvent)
	StatusBar:SetScript("OnUpdate", ThreatBar.Update)
end

function ThreatBar:OnEvent(event)
	if (event == "PLAYER_REGEN_ENABLED") then
		self:SetAlpha(0)
	elseif (event == "PLAYER_REGEN_DISABLED") then
		self:SetAlpha(1)
	else
		self:SetAlpha(0)
	end
end

function ThreatBar:Update()
	local _, _, ThreatPercent = UnitDetailedThreatSituation("player", "target")
	local ThreatValue = ThreatPercent or 0

	self:SetValue(ThreatValue)
	
	local R, G, B = A.ColorGradient(ThreatValue, 100, 0, 0.8, 0, 0.8, 0.8, 0, 0.8, 0, 0)
	self:SetStatusBarColor(R, G, B)
	
	if (ThreatValue > 0) then
		self:SetAlpha(1)
	else
		self:SetAlpha(0)
	end
end

function ThreatBar:Enable()
	if not (C.DataBars.ThreatBar) then
		return
	end

	if not (self.IsCreated) then
	    ThreatBar:CreateBar()
	
	    self.IsCreated = true
	end
end

ThreatBar:RegisterEvent("PLAYER_LOGIN")
ThreatBar:RegisterEvent("PLAYER_ENTERING_WORLD")
ThreatBar:RegisterEvent("ADDON_LOADED")

ThreatBar:SetScript("OnEvent", function(self, event)
	if (event == "PLAYER_LOGIN") then
		ThreatBar:Enable()
	end
end)