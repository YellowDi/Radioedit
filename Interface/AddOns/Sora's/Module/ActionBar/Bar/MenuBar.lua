-- Engine
local S, C, L, DB = unpack(select(2, ...))

-- Begin
local Parent = CreateFrame("Frame", nil, UIParent, "SecureHandlerStateTemplate")
Parent:Hide()

for _, name in pairs(MICRO_BUTTONS) do
    if _G[name] then
        _G[name]:SetParent(Parent)
    end
end

MainMenuBar:SetScript("OnShow", nil)
OverrideActionBar:SetScript("OnShow", nil)
PetBattleFrame.BottomFrame.MicroButtonFrame:SetScript("OnShow", nil)
