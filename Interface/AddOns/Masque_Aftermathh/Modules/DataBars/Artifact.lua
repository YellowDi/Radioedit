local A, C, L = select(2, ...):unpack()

local ArtifactBar = CreateFrame("Frame")

function ArtifactBar:CreateBar()
    local Panels = A["Panels"]
 
    local StatusBar = CreateFrame("StatusBar", nil, UIParent)
    StatusBar:SetOrientation("VERTICAL")
    StatusBar:Size(8, 74)
    StatusBar:Point("LEFT", Panels.ActionBarPanel, -24.5, 0)
    StatusBar:SetStatusBarTexture("Interface\\Buttons\\WHITE8x8")
    StatusBar:SetStatusBarColor(157/255, 138/255, 108/255)
    StatusBar:CreateBackdrop()
	
	self:RegisterEvent("ARTIFACT_XP_UPDATE")
    self:RegisterEvent("UNIT_INVENTORY_CHANGED")
	self:SetScript("OnEvent", ArtifactBar.UpdateBar)
	
	StatusBar:SetScript("OnEnter", ArtifactBar.OnEnter)
	StatusBar:SetScript("OnLeave", function() GameTooltip:Hide() end)

    self.StatusBar = StatusBar	
end

function ArtifactBar:UpdateBar()
	local HasArtifactEquip = HasArtifactEquipped()

	if not (HasArtifactEquip) then
		self.StatusBar:Hide()
	else
	    local GetEquippedArtifactInfo = C_ArtifactUI.GetEquippedArtifactInfo
		local _, _, Name, _, TotalExp, ArtifactLevel, _, _, _, _, _, _, ArtifactTier = GetEquippedArtifactInfo()
		local PointsAvailableToSpend, Min, Max = MainMenuBar_GetNumArtifactTraitsPurchasableFromXP(ArtifactLevel, TotalExp, ArtifactTier)

		self.StatusBar:Show()
		self.StatusBar:SetMinMaxValues(0, Max)
		self.StatusBar:SetValue(Min)
	end
end

function ArtifactBar:OnEnter()
	if InCombatLockdown() then
		return
	end

	local HasArtifactEquip = HasArtifactEquipped()

	if (HasArtifactEquip) then
	    local GetEquippedArtifactInfo = C_ArtifactUI.GetEquippedArtifactInfo
		local _, _, Name, _, TotalExp, ArtifactLevel, _, _, _, _, _, _, ArtifactTier = GetEquippedArtifactInfo()
		local PointsAvailableToSpend, Min, Max = MainMenuBar_GetNumArtifactTraitsPurchasableFromXP(ArtifactLevel, TotalExp, ArtifactTier)

		GameTooltip:ClearLines()
		GameTooltip:SetOwner(self, "ANCHOR_CURSOR", 0, -4)

		GameTooltip:AddLine("|cffffd200" .. Name .. ", Artifact Level: " .. ArtifactLevel)
		GameTooltip:AddDoubleLine("Current Artifact Power:", Min .. "/" .. Max .. " - (" .. math.floor(Min/Max*100) .. "%)", 1, 1, 1, 1, 1, 1)
		GameTooltip:AddDoubleLine("Remaining Artifact Power To Next Level:", Max - Min, 1, 1, 1, 1, 1, 1)
		GameTooltip:AddDoubleLine("Points To Spend:", PointsAvailableToSpend, 1, 1, 1, 1, 1, 1)

		GameTooltip:Show()
	end
end

function ArtifactBar:Enable()
	if not (C.DataBars.ArtifactBar) then
		return
	end

    if not (self.IsCreated) then
	    ArtifactBar:CreateBar()
	
	    self.IsCreated = true
	end
end

ArtifactBar:RegisterEvent("PLAYER_LOGIN")
ArtifactBar:RegisterEvent("PLAYER_ENTERING_WORLD")
ArtifactBar:RegisterEvent("ADDON_LOADED")
 
ArtifactBar:SetScript("OnEvent", function(self, event)
	if (event == "PLAYER_LOGIN") then
		ArtifactBar:Enable()
	end
end)