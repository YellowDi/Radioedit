-- Engine
local S, C, L, DB = unpack(select(2, ...))

-- Variables
local anchor = nil

-- Begin
local function SetAnchor(self, ...)
    anchor = CreateFrame("Frame", nil, UIParent)
    anchor:SetSize(C.ActionBar.Size, C.ActionBar.Size)
    anchor:SetPoint("BOTTOM", MultiBarBottomLeftButton5, "TOP", 0, C.ActionBar.Space)
end

local function OnClick(self, event, ...)
    if not UnitOnTaxi("player") then
        VehicleExit()
    else
        TaxiRequestEarlyLanding()
        print("已请求中途下机 ：）")
    end
end

local function OnEvent(self, event, ...)
    if not anchor then
        return
    end
    
    if CanExitVehicle() then
        anchor:Show()
    else
        anchor:Hide()
    end
end

local function SetActionBarButton(self, ...)
    local button = CreateFrame("Button", nil, anchor)
    button:SetAllPoints()
    button:RegisterForClicks("AnyUp")
    button:SetScript("OnClick", OnClick)
    
    button.Shadow = S.MakeShadow(button, 2)
    button:SetNormalTexture("INTERFACE\\PLAYERACTIONBARALT\\NATURAL")
    button:SetPushedTexture("INTERFACE\\PLAYERACTIONBARALT\\NATURAL")
    button:SetHighlightTexture("INTERFACE\\PLAYERACTIONBARALT\\NATURAL")
    button:GetHighlightTexture():SetBlendMode("ADD")
    button:GetNormalTexture():SetTexCoord(0.0859375, 0.1679688, 0.359375, 0.4414063)
    button:GetPushedTexture():SetTexCoord(0.001953125, 0.08398438, 0.359375, 0.4414063)
    button:GetHighlightTexture():SetTexCoord(0.6152344, 0.6972656, 0.359375, 0.4414063)
end

local function OnPlayerLogin(self, event, ...)
    SetAnchor(self, ...)
    SetActionBarButton(self, ...)
end

-- Event
local Event = CreateFrame("Frame", nil, UIParent)
Event:RegisterEvent("PLAYER_LOGIN")
Event:RegisterEvent("VEHICLE_UPDATE")
Event:RegisterEvent("UNIT_EXITED_VEHICLE")
Event:RegisterEvent("UNIT_ENTERED_VEHICLE")
Event:RegisterEvent("PLAYER_ENTERING_WORLD")
Event:RegisterEvent("UPDATE_BONUS_ACTIONBAR")
Event:RegisterEvent("UPDATE_MULTI_CAST_ACTIONBAR")
Event:SetScript("OnEvent", function(self, event, ...)
    if event == "PLAYER_LOGIN" then
        OnPlayerLogin(self, event, ...)
    else
        OnEvent(self, event, ...)
    end
end)
