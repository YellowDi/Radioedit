local A, C, M, L = select(2, ...):unpack()

local Loading = CreateFrame("Frame")

local Class = select(2, UnitClass("player"))
local CustomClassColor = A.Colors.class[Class]

Loading:RegisterEvent("PLAYER_LOGIN")
Loading:RegisterEvent("PLAYER_ENTERING_WORLD")
Loading:RegisterEvent("ADDON_LOADED")

Loading:SetScript("OnEvent", function(self, event)
	if (event == "PLAYER_LOGIN") then		
		-- AUTOMATIC SETTINGS
		if (C.General.AutoScale) then
			SetCVar("uiScale", C.General.UIScale)
		end

		-- WELCOME
		if (C.General.WelcomeLoading) then
			local WelcomeFrame = CreateFrame("Frame", nil, UIParent)
			WelcomeFrame:Size(352, 78)
			WelcomeFrame:Point("TOP", UIParent, 0, -32)
			WelcomeFrame:CreateBackdrop(true)
			
			local WelcomeCloseButton = CreateFrame("CheckButton", "CheckBoxButton", WelcomeFrame, "UIPanelCloseButton")
			WelcomeCloseButton:Point("TOPRIGHT", WelcomeFrame)
			WelcomeCloseButton:SkinCloseButton(-4, -4, 12)

			local WelcomeVersionText = WelcomeFrame:CreateFontString(nil, "OVERLAY")
			WelcomeVersionText:Point("CENTER", 0, 12)
			WelcomeVersionText:SetFontTemplate(C.Media.Font2, 18)
			WelcomeVersionText:SetTextColor(unpack(CustomClassColor))
			WelcomeVersionText:SetText("|r|cffffffffWelcome to|r AftermathhUI " .. "|r|cffffffff" .. A.Version .. "|r")

			local WelcomeName = WelcomeFrame:CreateFontString(nil, "OVERLAY")
			WelcomeName:Point("BOTTOM", 2, 14)
			WelcomeName:SetFontTemplate(C.Media.Font2, 12)
			WelcomeName:SetTextColor(unpack(CustomClassColor))
			WelcomeName:SetText("|r|cffffffffby|r Aftermathhyo |r|cffffffff@|r Silvermoon EU |r|cffffffff- wwww.wowinterface.com|r")
		end
	end
end)