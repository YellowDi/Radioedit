local A, C, M, L = select(2, ...):unpack()

local TalkingHeadEvent = CreateFrame("Frame")

function TalkingHeadEvent:Enable()
	if not IsAddOnLoaded("Blizzard_TalkingHeadUI") then
        LoadAddOn("Blizzard_TalkingHeadUI")
    end

	local TalkingHead = _G["TalkingHeadFrame"]
	TalkingHead:ClearAllPoints()
	TalkingHead:SetPoint("TOP", UIParent, 0, -15)
	TalkingHead.ignoreFramePositionManager = true

	if (C.Theme.ThemeMod) then
		TalkingHead:StripTexture()
	
		local TalkingHeadFramePanel = CreateFrame("Frame", nil, TalkingHead)
		TalkingHeadFramePanel:SetFrameLevel(TalkingHead:GetFrameLevel() - 1)
		TalkingHeadFramePanel:SetPoint("CENTER")
		TalkingHeadFramePanel:SetSize(545, 135)
		TalkingHeadFramePanel:CreateBackdrop()
	
		TalkingHead.BackgroundFrame:StripTexture()
		TalkingHead.PortraitFrame:StripTexture()
		TalkingHead.MainFrame.Model.PortraitBg:SetAlpha(0)
	
		TalkingHead.NameFrame.Name:SetFontTemplate(C.Media.Font2, 18)
		TalkingHead.TextFrame.Text:SetFontTemplate(C.Media.Font2, 14)
		
		TalkingHead.MainFrame.CloseButton:SkinCloseButton(-22, -22)
	end
end

TalkingHeadEvent:RegisterEvent("PLAYER_LOGIN")
TalkingHeadEvent:RegisterEvent("PLAYER_ENTERING_WORLD")
TalkingHeadEvent:RegisterEvent("ADDON_LOADED")

TalkingHeadEvent:SetScript("OnEvent", function(self, event)
	if (event == "PLAYER_LOGIN") then
		TalkingHeadEvent:Enable()
	end
end)