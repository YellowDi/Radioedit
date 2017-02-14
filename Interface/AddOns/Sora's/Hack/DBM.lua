-- Engine
local S, C, L, DB = unpack(select(2, ...))

-- Begin
local function OnPlayerLogin(self, event, ...)
    if DBM_AllSavedOptions and not DBM_AllSavedOptions._hacked then
        DBM_AllSavedOptions = {
            ["_hacked"] = true,
            ["Default"] = {
                ["WarningFontStyle"] = "OUTLINE",
            },
        }
    end
    
    if DBT_AllPersistentOptions and not DBT_AllPersistentOptions._hacked then
        DBT_AllPersistentOptions = {
            ["_hacked"] = true,
            ["Default"] = {
                ["DBM"] = {
                    ["FontFlag"] = "OUTLINE",
                },
            },
        }
    end
end

-- Event
local Event = CreateFrame("Frame", nil, UIParent)
Event:RegisterEvent("PLAYER_LOGIN")
Event:SetScript("OnEvent", function(self, event, ...)
    if event == "PLAYER_LOGIN" then
        OnPlayerLogin(self, event, ...)
    end
end)
