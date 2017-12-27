local A, C, M, L = select(2, ...):unpack()

local VehicleIndicator = CreateFrame("Frame")

function VehicleIndicator:Enable()
	local Indicator = _G["VehicleSeatIndicator"]
	Indicator:ClearAllPoints()
	Indicator:SetParent(UIParent)
	Indicator:Point("BOTTOMRIGHT", Minimap, 12, -142)

	-- This will block UIParent_ManageFramePositions() to be executed
	Indicator.IsShown = function() return false end
end

VehicleIndicator:RegisterEvent("PLAYER_LOGIN")
VehicleIndicator:RegisterEvent("PLAYER_ENTERING_WORLD")
VehicleIndicator:RegisterEvent("ADDON_LOADED")

VehicleIndicator:SetScript("OnEvent", function(self, event)
    if (event == "PLAYER_LOGIN") then
		VehicleIndicator:Enable()
	end
end)