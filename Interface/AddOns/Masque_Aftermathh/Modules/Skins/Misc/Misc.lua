local A, C, M, L = select(2, ...):unpack()

local Skins = CreateFrame("Frame")

function Skins:Enable()
	if not (C.Theme.ThemeMod) then 
		return
	end
	
	local Frames = {
		"GameMenuFrame",
		"ReadyCheckFrame",
	}
	
	for i = 1, #Frames do
		local SkinFrames = _G[Frames[i]]
		if (SkinFrames) then
			SkinFrames:CreateBackdrop()
		end
	end
	
	local Buttons = {
	"ReadyCheckFrameYesButton",
	"ReadyCheckFrameNoButton",
	}
	
	for i = 1, #Buttons do
		local SkinNormalButtons = _G[Buttons[i]]
		if (SkinNormalButtons) then
			SkinNormalButtons:SkinButton()
		end
	end
	
	ReadyCheckFrame:HookScript("OnShow", function(self) if UnitIsUnit("player", self.initiator) then self:Hide() end end)
	select(2, ReadyCheckListenerFrame:GetRegions()):Hide()

	local SmallButtons = {
		"GameMenuButtonHelp",
		"GameMenuButtonWhatsNew",
		"GameMenuButtonOptions",
		"GameMenuButtonUIOptions",
		"GameMenuButtonKeybindings",
		"GameMenuButtonMacros",
		"GameMenuButtonAddons",
		"GameMenuButtonLogout",
		"GameMenuButtonQuit",
		"GameMenuButtonContinue",
		"GameMenuButtonStore",
	}

	for i = 1, #SmallButtons do
		local SkinSmallButtons = _G[SmallButtons[i]]
		if (SkinSmallButtons) then
			SkinSmallButtons:SkinButton(true)
		end
	end

	local Headers = {
		"GameMenuFrame"
	}

	for i = 1, #Headers do
	local Title = _G[Headers[i].."Header"]
		if (Title) then
			Title:SetTexture("")
			Title:ClearAllPoints()
			if _G["GameMenuFrameHeader"] then
				Title:Point("TOP", GameMenuFrame, 0, 4)
			else
				Title:Point("TOP", Headers[i], 0, 0)
			end
		end
	end

	for i = 1, 4 do
		local StaticFrame = _G["StaticPopup"..i]
		for k = 1, 3 do
			StaticFrame["button"..k]:SkinButton()
		end
		StaticFrame:CreateBackdrop()
	end
	
	local GhostButton = _G["GhostFrame"]
	GhostButton:StripTexture(true)
	GhostButton:SkinButton()
	GhostButton:ClearAllPoints()
	GhostButton:Point("TOP", UIParent, 0, -56.5)

	local GhostIcon = _G["GhostFrameContentsFrameIcon"]
	GhostIcon:SetTexCoord(.08, .92, .08, .92)
end

Skins:RegisterEvent("PLAYER_LOGIN")
Skins:RegisterEvent("PLAYER_ENTERING_WORLD")
Skins:RegisterEvent("ADDON_LOADED")

Skins:SetScript("OnEvent", function(self, event)
	if (event == "PLAYER_LOGIN") then
		self:Enable()
	end
end)