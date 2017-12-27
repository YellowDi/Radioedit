local A, C, M, L = select(2, ...):unpack()

local Durability = CreateFrame("Frame")

function Durability:Enable()
	local DurabilityFrame = _G["DurabilityFrame"]

	local DurabilityWarningFrame = CreateFrame("Frame", nil, UIParent)
	DurabilityWarningFrame:SetSize(300, 50)
	DurabilityWarningFrame:SetPoint("TOP", UIParent, 0, -12)
	DurabilityWarningFrame:Hide()

	local DurabilityWarningText = DurabilityWarningFrame:CreateFontString(nil, "OVERLAY")  
	DurabilityWarningText:SetPoint("CENTER", DurabilityWarningFrame)
	DurabilityWarningText:SetFontTemplate(C.Media.Font2, 16)
	DurabilityWarningText:SetTextColor(1, 0, 0)
	DurabilityWarningText:SetText("Warning! You need to repair your equipment!")

	DurabilityFrame:SetAlpha(0)
	DurabilityFrame:Hide()
	DurabilityFrame:HookScript("OnShow", function(self) DurabilityWarningFrame:Show() end)
	DurabilityFrame:HookScript("OnHide", function(self) DurabilityWarningFrame:Hide() end)
end

Durability:RegisterEvent("PLAYER_LOGIN")
Durability:RegisterEvent("PLAYER_ENTERING_WORLD")
Durability:RegisterEvent("ADDON_LOADED")

Durability:SetScript("OnEvent", function(self, event)
	if (event == "PLAYER_LOGIN") then
	    Durability:Enable()
	end
end)