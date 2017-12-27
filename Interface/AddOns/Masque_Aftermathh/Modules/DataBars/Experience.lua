local A, C, L = select(2, ...):unpack()

if UnitLevel("player") == MAX_PLAYER_LEVEL then return end

local ExperienceBar = CreateFrame("Frame")

function ExperienceBar:CreateBar()
    local Panels = A["Panels"]

    local StatusBar = CreateFrame("StatusBar",  nil, UIParent)
    StatusBar:SetOrientation("VERTICAL")
    StatusBar:Size(8, 74)
    StatusBar:Point("LEFT", Panels.ActionBarPanel, -12.5, 0)
    StatusBar:SetStatusBarTexture("Interface\\Buttons\\WHITE8x8")
    StatusBar:SetStatusBarColor(0.6, 0, 0.6)
    StatusBar:CreateBackdrop()

    local StatusBarRested = CreateFrame("StatusBar", nil, UIParent)
    StatusBarRested:SetOrientation("VERTICAL")
    StatusBarRested:SetSize(8, 74)
    StatusBarRested:SetParent(StatusBar)
    StatusBarRested:SetAllPoints(StatusBar)
    StatusBarRested:SetStatusBarTexture("Interface\\Buttons\\WHITE8x8") 
    StatusBarRested:SetStatusBarColor(0, 200/255, 1)
	StatusBarRested:SetFrameLevel(StatusBar:GetFrameLevel() - 1)
	StatusBarRested:Hide()
	
	self:RegisterEvent("PLAYER_XP_UPDATE")
    self:RegisterEvent("PLAYER_LEVEL_UP")
    self:RegisterEvent("UPDATE_EXHAUSTION")
    self:RegisterEvent("PLAYER_UPDATE_RESTING")
	self:SetScript("OnEvent", ExperienceBar.UpdateBar)

	StatusBar:SetScript("OnEnter", ExperienceBar.OnEnter)
    StatusBar:SetScript("OnLeave", function() GameTooltip:Hide() end)

	self.StatusBar = StatusBar
	self.StatusBarRested = StatusBarRested
end
 
function ExperienceBar:UpdateBar()
	local Min, Max = UnitXP("player"), UnitXPMax("player")
	local Rested = GetXPExhaustion()
	local IsRested = GetRestState()

	self.StatusBar:SetMinMaxValues(0, Max)
    self.StatusBar:SetValue(Min)

	if (IsRested == 1 and Rested) then
		self.StatusBarRested:Show()
		self.StatusBarRested:SetMinMaxValues(0, Max)
		self.StatusBarRested:SetValue(Rested + Min)
	else
	    self.StatusBarRested:Hide()
	end
end

function ExperienceBar:OnEnter()
	local Min, Max = UnitXP("player"), UnitXPMax("player")
	local Rested = GetXPExhaustion()
	local IsRested = GetRestState()
	
	GameTooltip:ClearLines()
	GameTooltip:SetOwner(self, "ANCHOR_CURSOR", 0, -4)
	
	GameTooltip:AddLine("|cffffd200Experience|r")
	GameTooltip:AddDoubleLine("Current Experience:", Min .. "/" .. Max .. " - (" .. math.floor(Min/Max*100) .. "%)", 1, 1, 1, 1, 1, 1)
	GameTooltip:AddDoubleLine("Remaining Experience:", Max - Min, 1, 1, 1, 1, 1, 1)
 
	if (IsRested == 1 and Rested) then
		GameTooltip:AddDoubleLine("Rested Experience:", Rested, 1, 1, 1, 1, 1, 1)
	else
		GameTooltip:AddDoubleLine("Rested Experience:", "0", 1, 1, 1, 1, 1, 1)
	end
	
	GameTooltip:Show()
end

function ExperienceBar:Enable()
	if not (C.DataBars.ExperienceBar) then
		return
	end

    if not (self.IsCreated) then
	    ExperienceBar:CreateBar()
	
	    self.IsCreated = true
	end
end

ExperienceBar:RegisterEvent("PLAYER_LOGIN")
ExperienceBar:RegisterEvent("PLAYER_ENTERING_WORLD")
ExperienceBar:RegisterEvent("ADDON_LOADED")
 
ExperienceBar:SetScript("OnEvent", function(self, event)
	if (event == "PLAYER_LOGIN") then
		ExperienceBar:Enable()
	end
end)