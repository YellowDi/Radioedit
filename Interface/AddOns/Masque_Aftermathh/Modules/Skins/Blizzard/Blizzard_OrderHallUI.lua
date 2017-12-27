local A, C, M, L = select(2, ...):unpack()

local OrderHallEvent = CreateFrame("Frame")

function OrderHallEvent:Load()
	if not IsAddOnLoaded("Blizzard_OrderHallUI") then
        LoadAddOn("Blizzard_OrderHallUI")
    end

	local OrderHallCommandBar = _G["OrderHallCommandBar"]
	OrderHallCommandBar.Background:SetAlpha(0)
	OrderHallCommandBar.WorldMapButton:SetAlpha(0)
	
	OrderHallCommandBar.AreaName:SetFontTemplate(C.Media.Font2, 14)    
	OrderHallCommandBar.AreaName:SetVertexColor(0.41, 0.8, 0.94)
end

function OrderHallEvent:UpdatePoints()
	local IsPlayerInOrderHall = C_Garrison.IsPlayerInGarrison(LE_GARRISON_TYPE_7_0)
	local Minimap = _G["Minimap"]
	local BuffFrame = _G["TempEnchant1"]
	local Panels = A["Panels"]
	
	if (IsPlayerInOrderHall) then
		UIFrameFadeIn(Panels.TopPanel, 0.5, Panels.TopPanel:GetAlpha(), 1)
		UIFrameFadeOut(Panels.TopLine, 0.5, Panels.TopLine:GetAlpha(), 0)
	
	    Minimap:ClearAllPoints()
	    Minimap:Point("TOPLEFT", UIParent, 6, -32)
		MinimapCluster:ClearAllPoints()
		MinimapCluster:SetPoint("CENTER", Minimap, 0, 0)
		MinimapBackdrop:ClearAllPoints()
		MinimapBackdrop:SetPoint("CENTER", Minimap, 0, 0)
		
        CustomBuffsHeaders:ClearAllPoints()
        CustomBuffsHeaders:Point("TOPRIGHT", UIParent, -6, -32)
    elseif not (IsPlayerInOrderHall) then
		UIFrameFadeIn(Panels.TopLine, 0.5, Panels.TopLine:GetAlpha(), 1)
		UIFrameFadeOut(Panels.TopPanel, 0.5, Panels.TopPanel:GetAlpha(), 0)
	
	    Minimap:ClearAllPoints()
		Minimap:Point("TOPLEFT", UIParent, 6, -18)
		MinimapCluster:ClearAllPoints()
		MinimapCluster:SetPoint("CENTER", Minimap, 0, 0)
		MinimapBackdrop:ClearAllPoints()
		MinimapBackdrop:SetPoint("CENTER", Minimap, 0, 0)	
	
        CustomBuffsHeaders:ClearAllPoints()
        CustomBuffsHeaders:Point("TOPRIGHT", UIParent, -6, -18)
    end
end

function OrderHallEvent:Enable()
	OrderHallEvent:Load()
    OrderHallEvent:UpdatePoints()
end

OrderHallEvent:RegisterEvent("PLAYER_LOGIN")
OrderHallEvent:RegisterEvent("PLAYER_ENTERING_WORLD")
OrderHallEvent:RegisterEvent("ADDON_LOADED")
OrderHallEvent:RegisterEvent("GARRISON_UPDATE")

OrderHallEvent:SetScript("OnEvent", function(self, event, AddOn)
	if (event == "PLAYER_LOGIN" or event == "GARRISON_UPDATE") then
		self:Enable()
	end
end)