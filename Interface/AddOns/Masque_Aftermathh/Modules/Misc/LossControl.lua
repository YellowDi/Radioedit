local A, C, M, L = select(2, ...):unpack()

local LossControl = CreateFrame("Frame")

function LossControl:Update()
	local AbilityName = self.AbilityName
	AbilityName.scrollTime = nil
	AbilityName:SetFontTemplate(C.Media.Font2, 18)

	local TimeLeftNumber = self.TimeLeft.NumberText
	TimeLeftNumber.scrollTime = nil
	TimeLeftNumber:SetFontTemplate(C.Media.Font2, 16)

	local TimeLeftSec = self.TimeLeft.SecondsText
	TimeLeftSec.scrollTime = nil
	TimeLeftSec:SetFontTemplate(C.Media.Font2, 16)
end

function LossControl:AddHooks()
	hooksecurefunc("LossOfControlFrame_SetUpDisplay", LossControl.Update)
end

function LossControl:Enable()
	LossControl:AddHooks()

	local LossOfControlFrame = _G["LossOfControlFrame"]
	LossOfControlFrame.Cooldown:SetAlpha(0)
	LossOfControlFrame:StripTexture()

	local LossOfControlPanel = CreateFrame("Frame", nil, LossOfControlFrame)
	LossOfControlPanel:SetFrameLevel(LossOfControlFrame:GetFrameLevel() - 1)
	LossOfControlPanel:SetPoint("CENTER")
	LossOfControlPanel:SetSize(212, 56)
	LossOfControlPanel:CreateBackdrop()

	LossOfControlFrame.Icon:SetTexCoord(.1, .9, .1, .9)
	LossOfControlFrame.Icon:SetSize(38, 38)

	local IconOverlay = CreateFrame("Frame", nil, LossOfControlFrame)
	IconOverlay:SetAllPoints(LossOfControlFrame.Icon)
	IconOverlay:SetTemplate(true, 38, 38)
end

LossControl:RegisterEvent("PLAYER_LOGIN")
LossControl:RegisterEvent("PLAYER_ENTERING_WORLD")
LossControl:RegisterEvent("ADDON_LOADED")

LossControl:SetScript("OnEvent", function(self, event)
	if (event == "PLAYER_LOGIN") then
		LossControl:Enable()
	end
end)