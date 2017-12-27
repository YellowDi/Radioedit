local A, C, L = select(2, ...):unpack()

if (UnitLevel("player") ~= MAX_PLAYER_LEVEL) then return end

local HonorBar = CreateFrame("Frame")

function HonorBar:CreateBar()
    local Panels = A["Panels"]
	local Class = select(2, UnitClass("player"))
	local CustomClassColor = A.Colors.class[Class]

    local StatusBar = CreateFrame("StatusBar",  nil, UIParent)
    StatusBar:SetOrientation("VERTICAL")
    StatusBar:Size(8, 74)
    StatusBar:Point("LEFT", Panels.ActionBarPanel, -12.5, 0)
    StatusBar:SetStatusBarTexture("Interface\\Buttons\\WHITE8x8")
    StatusBar:SetStatusBarColor(unpack(CustomClassColor))
    StatusBar:CreateBackdrop()

	self:RegisterEvent("HONOR_XP_UPDATE")
    self:RegisterEvent("HONOR_LEVEL_UPDATE")
    self:RegisterEvent("HONOR_PRESTIGE_UPDATE")
	self:SetScript("OnEvent", HonorBar.UpdateBar)

    StatusBar:SetScript("OnEnter", HonorBar.OnEnter)
    StatusBar:SetScript("OnLeave", function() GameTooltip:Hide() end)
	
	self.StatusBar = StatusBar
end

function HonorBar:UpdateBar()
	local Min, Max = UnitHonor("player"), UnitHonorMax("player")

	self.StatusBar:SetMinMaxValues(0, Max)
	self.StatusBar:SetValue(Min)
end

function HonorBar:OnEnter()
	if InCombatLockdown() then
		return
	end

	local Min, Max = UnitHonor("player"), UnitHonorMax("player")
	local Level = UnitHonorLevel("player")
	local LevelMax = GetMaxPlayerHonorLevel()
	local Prestige = UnitPrestige("player")
	
	GameTooltip:ClearLines()
	GameTooltip:SetOwner(self, "ANCHOR_CURSOR", 0, -4)   
	
	if (Max == 0) then
		GameTooltip:AddLine(PVP_HONOR_PRESTIGE_AVAILABLE)
		GameTooltip:AddLine(PVP_HONOR_XP_BAR_CANNOT_PRESTIGE_HERE) 
	else		
		GameTooltip:AddLine("|cffffd200Honor|r")
		GameTooltip:AddDoubleLine("Current Honor:", Min .. "/" .. Max .. " - (" .. math.floor(Min/Max*100) .. "%)", 1, 1, 1, 1, 1, 1)
		GameTooltip:AddDoubleLine("Current Honor Rank:", Level .. "/" .. LevelMax, 1, 1, 1, 1, 1, 1)
		GameTooltip:AddDoubleLine("Prestige Level:", Prestige, 1, 1, 1, 1, 1, 1)
	end

	GameTooltip:Show()
end

function HonorBar:Enable()
	if not (C.DataBars.HonorBar) then
		return
	end

    if not (self.IsCreated) then
	    HonorBar:CreateBar()
	
	    self.IsCreated = true
    end
end

HonorBar:RegisterEvent("PLAYER_LOGIN")
HonorBar:RegisterEvent("PLAYER_ENTERING_WORLD")
HonorBar:RegisterEvent("ADDON_LOADED")

HonorBar:SetScript("OnEvent", function(self, event)
	if (event == "PLAYER_LOGIN") then
		HonorBar:Enable()
	end
end)