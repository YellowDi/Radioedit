-- rActionBar: blizzard
-- zork, 2016
-----------------------------
-- Config
-----------------------------
local cfg = {}

-----------------------------
-- Variables
-----------------------------
local A, L = ...

local hiddenFrame = CreateFrame("Frame")
hiddenFrame:Hide()

local scripts = {
    "OnShow", "OnHide", "OnEvent", "OnEnter", "OnLeave", "OnUpdate", "OnValueChanged", "OnClick", "OnMouseDown", "OnMouseUp",
}

local framesToHide = {
    MainMenuBar,
    MainMenuBarPageNumber, MainMenuBarLeftEndCap, MainMenuBarRightEndCap,
    MainMenuBarTexture0, MainMenuBarTexture1, MainMenuBarTexture2, MainMenuBarTexture3,
    ActionBarDownButton, ActionBarUpButton, MainMenuBarVehicleLeaveButton, ExhaustionTick,
    ReputationWatchBar, ArtifactWatchBar, HonorWatchBar, MainMenuExpBar, MainMenuBarMaxLevelBar,
    OverrideActionBarBG,
    OverrideActionBarBorder, OverrideActionBarDivider2, OverrideActionBarLeaveFrame,
    OverrideActionBarEndCapL, OverrideActionBarEndCapR,
    OverrideActionBarMicroBGL, OverrideActionBarMicroBGR, OverrideActionBarMicroBGMid,
    OverrideActionBarButtonBGL, OverrideActionBarButtonBGR, OverrideActionBarButtonBGMid,
    OverrideActionBarExpBar, OverrideActionBarHealthBar, OverrideActionBarPowerBar, OverrideActionBarPitchFrame,
}

-----------------------------
-- Init
-----------------------------
for i, frame in next, framesToHide do
    frame:SetParent(hiddenFrame)
    
    if frame.UnregisterAllEvents then
        frame:UnregisterAllEvents()
        
        for i, script in next, scripts do
            if frame:HasScript(script) then
                frame:SetScript(script, nil)
            end
        end
    end
end
