-- Engine
local S, C, L, DB = unpack(select(2, ...))

-- Variables
local anchor = nil

-- Begin
local function SetAnchor(self, ...)
    local width = C.ActionBar.Size * 18 + C.ActionBar.Space * 17
    local height = C.ActionBar.Size * 2 + C.ActionBar.Space
    
    anchor = CreateFrame("Frame", nil, UIParent, "SecureHandlerStateTemplate")
    anchor:SetSize(width, height)
    anchor:SetPoint(unpack(C.ActionBar.MainBarPostion))
end

local function SetActionBarButton(self, ...)
    MainMenuBarArtFrame:ClearAllPoints()
    MainMenuBarArtFrame:SetParent(anchor)
    MainMenuBarArtFrame:EnableMouse(false)
    for i = 1, NUM_ACTIONBAR_BUTTONS do
        local button = _G["ActionButton" .. i]
        button:ClearAllPoints()
        button:SetSize(C.ActionBar.Size, C.ActionBar.Size)
        
        if i == 1 then
            button:SetPoint("BOTTOMLEFT", anchor, C.ActionBar.Size * 3 + C.ActionBar.Space * 3, 0)
        else
            button:SetPoint("LEFT", _G["ActionButton" .. i - 1], "RIGHT", C.ActionBar.Space, 0)
        end
    end
    
    MultiBarBottomLeft:ClearAllPoints()
    MultiBarBottomLeft:SetParent(anchor)
    MultiBarBottomLeft:EnableMouse(false)
    for i = 1, NUM_ACTIONBAR_BUTTONS do
        local button = _G["MultiBarBottomLeftButton" .. i]
        button:ClearAllPoints()
        button:SetSize(C.ActionBar.Size, C.ActionBar.Size)
        
        if i == 1 then
            button:SetPoint("TOPLEFT", anchor, C.ActionBar.Size * 3 + C.ActionBar.Space * 3, 0)
        else
            button:SetPoint("LEFT", _G["MultiBarBottomLeftButton" .. i - 1], "RIGHT", C.ActionBar.Space, 0)
        end
    end
    
    MultiBarBottomRight:ClearAllPoints()
    MultiBarBottomRight:SetParent(anchor)
    MultiBarBottomRight:EnableMouse(false)
    for i = 1, NUM_ACTIONBAR_BUTTONS do
        local button = _G["MultiBarBottomRightButton" .. i]
        button:ClearAllPoints()
        button:SetSize(C.ActionBar.Size, C.ActionBar.Size)
        
        if i == 1 then
            button:SetPoint("TOPLEFT", anchor)
        elseif i == 4 then
            button:SetPoint("TOP", _G["MultiBarBottomRightButton" .. i - 3], "BOTTOM", 0, -C.ActionBar.Space)
        elseif i == 7 then
            button:SetPoint("TOPRIGHT", anchor, -1 * (C.ActionBar.Size * 2 + C.ActionBar.Space * 2), 0)
        elseif i == 10 then
            button:SetPoint("TOP", _G["MultiBarBottomRightButton" .. i - 3], "BOTTOM", 0, -C.ActionBar.Space)
        else
            button:SetPoint("LEFT", _G["MultiBarBottomRightButton" .. i - 1], "RIGHT", C.ActionBar.Space, 0)
        end
    end
end

local function RegisterForStateDriver(self, ...)
    hooksecurefunc("MultiActionBar_UpdateGridVisibility", function(self, event, ...)
        if not InCombatLockdown() then
            for i = 1, NUM_ACTIONBAR_BUTTONS do
                _G["ActionButton" .. i]:SetAttribute("showgrid", 1)
                ActionButton_ShowGrid(_G["ActionButton" .. i])
            end
        end
    end)
    
    RegisterStateDriver(anchor, "visibility", "[petbattle][overridebar][vehicleui][possessbar][shapeshift] hide; show")
end

local function OnPlayerLogin(self, event, ...)
    SetAnchor(self, ...)
    SetActionBarButton(self, ...)
    
    RegisterForStateDriver(self, ...)
end

-- Event
local Event = CreateFrame("Frame", nil, UIParent)
Event:RegisterEvent("PLAYER_LOGIN")
Event:SetScript("OnEvent", function(self, event, ...)
    if event == "PLAYER_LOGIN" then
        OnPlayerLogin(self, event, ...)
    end
end)
