local A, C, M, L = select(2, ...):unpack()

local ErrorFilter = CreateFrame("Frame")

function ErrorFilter:Enable()
	if not (C.ErrorsFrame.ErrorsMod) then
		return
	end

	local ErrorFrame = _G["UIErrorsFrame"]
	ErrorFrame:UnregisterEvent("UI_ERROR_MESSAGE")
	ErrorFrame:SetTimeVisible(1)
	ErrorFrame:SetFadeDuration(0.8)
	ErrorFrame:SetFontTemplate(C.Media.Font2, C.ErrorsFrame.FontSize)

	ErrorFilter:RegisterEvent("UI_ERROR_MESSAGE")
	ErrorFilter:SetScript("OnEvent", function(self, event, messageType, message)
		ErrorFrame:AddMessage(message, unpack(C.ErrorsFrame.TextColor))
	end)
end

ErrorFilter:RegisterEvent("PLAYER_LOGIN")
ErrorFilter:RegisterEvent("PLAYER_ENTERING_WORLD")
ErrorFilter:RegisterEvent("ADDON_LOADED")

ErrorFilter:SetScript("OnEvent", function(self, event)
	if (event == "PLAYER_LOGIN") then
	    ErrorFilter:Enable()
	end
end)