local E, L, V, P, G = unpack(select(2, ...)); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB
local LO = E:NewModule('Layout', 'AceEvent-3.0');

--Cache global variables
--Lua functions
--WoW API / Variables
local CreateFrame = CreateFrame
local UIFrameFadeIn, UIFrameFadeOut = UIFrameFadeIn, UIFrameFadeOut

--Global variables that we don't cache, list them here for the mikk's Find Globals script
-- GLOBALS: HideLeftChat, HideRightChat, HideBothChat, LeftChatPanel, RightChatPanel, Minimap
-- GLOBALS: GameTooltip, LeftChatTab, RightChatTab
-- GLOBALS: LeftChatDataPanel, LeftMiniPanel, RightChatDataPanel, RightMiniPanel, ElvConfigToggle

local PANEL_HEIGHT = 22;
local SIDE_BUTTON_WIDTH = 16;

E.Layout = LO;

local function Panel_OnShow(self)
	self:SetFrameLevel(200)
	self:SetFrameStrata('BACKGROUND')
end

local menuFrame = CreateFrame("Frame", "MinimapRightClickMenu", E.UIParent)
local menuList = {
	{text = CHARACTER_BUTTON,
	func = function() ToggleCharacter("PaperDollFrame") end},
	{text = SPELLBOOK_ABILITIES_BUTTON,
	func = function() if not SpellBookFrame:IsShown() then ShowUIPanel(SpellBookFrame) else HideUIPanel(SpellBookFrame) end end},
	{text = TALENTS_BUTTON,
	func = function()
		if not PlayerTalentFrame then
			TalentFrame_LoadUI()
		end

		if not PlayerTalentFrame:IsShown() then
			ShowUIPanel(PlayerTalentFrame)
		else
			HideUIPanel(PlayerTalentFrame)
		end
	end},
	{text = COLLECTIONS,
	func = function()
		ToggleCollectionsJournal()
	end},
	{text = TIMEMANAGER_TITLE,
	func = function() ToggleFrame(TimeManagerFrame) end},		
	{text = ACHIEVEMENT_BUTTON,
	func = function() ToggleAchievementFrame() end},
	{text = SOCIAL_BUTTON,
	func = function() ToggleFriendsFrame(1) end},
	{text = L["Calendar"],
	func = function() GameTimeFrame:Click() end},
	{text = GARRISON_LANDING_PAGE_TITLE,
	func = function() GarrisonLandingPageMinimapButton_OnClick() end},
	{text = ACHIEVEMENTS_GUILD_TAB,
	func = function()
		if IsInGuild() then
			if not GuildFrame then GuildFrame_LoadUI() end
			GuildFrame_Toggle()
		else
			if not LookingForGuildFrame then LookingForGuildFrame_LoadUI() end
			if not LookingForGuildFrame then return end
			LookingForGuildFrame_Toggle()
		end
	end},
	{text = LFG_TITLE,
	func = function() ToggleLFDParentFrame(); end},
--	{text = L["Raid Browser"],
--	func = function() ToggleFrame(RaidBrowserFrame); end},
	{text = ENCOUNTER_JOURNAL,  
	func = function() if not IsAddOnLoaded('Blizzard_EncounterJournal') then EncounterJournal_LoadUI(); end ToggleFrame(EncounterJournal) end},	
	{text = BLIZZARD_STORE,
	func = function() StoreMicroButton:Click() end},
	{text = MAINMENU_BUTTON,
	func = function() 
		if ( not GameMenuFrame:IsShown() ) then
			if ( VideoOptionsFrame:IsShown() ) then
				VideoOptionsFrameCancel:Click();
			elseif ( AudioOptionsFrame:IsShown() ) then
				AudioOptionsFrameCancel:Click();
			elseif ( InterfaceOptionsFrame:IsShown() ) then
				InterfaceOptionsFrameCancel:Click();
			end		
			CloseMenus();
			CloseAllWindows()
			PlaySound("igMainMenuOpen");
			ShowUIPanel(GameMenuFrame);
		else
			PlaySound("igMainMenuQuit");
			HideUIPanel(GameMenuFrame);
			MainMenuMicroButton_SetNormal();
		end
	end},
	{text = HELP_BUTTON,
	func = function() ToggleHelpFrame() end},
}
LO.menuList = menuList
function LO:Initialize()
	menuFrame:SetTemplate("Transparent", true)
	self:CreateChatPanels()
	self:CreateMinimapPanels()
	self:CreateActionbarInfobar()
	self:InfoBar()

	self.BottomPanel = CreateFrame('Frame', 'ElvUI_BottomPanel', E.UIParent)
	self.BottomPanel:SetTemplate('Transparent')
	self.BottomPanel:Point('BOTTOMLEFT', E.UIParent, 'BOTTOMLEFT', -1, -1)
	self.BottomPanel:Point('BOTTOMRIGHT', E.UIParent, 'BOTTOMRIGHT', 1, -1)
	self.BottomPanel:Height(PANEL_HEIGHT)
	self.BottomPanel:SetScript('OnShow', Panel_OnShow)
	E.FrameLocks['ElvUI_BottomPanel'] = true;
	Panel_OnShow(self.BottomPanel)
	self:BottomPanelVisibility()

	self.TopPanel = CreateFrame('Frame', 'ElvUI_TopPanel', E.UIParent)
	self.TopPanel:SetTemplate('Transparent')
	self.TopPanel:Point('TOPLEFT', E.UIParent, 'TOPLEFT', -1, 1)
	self.TopPanel:Point('TOPRIGHT', E.UIParent, 'TOPRIGHT', 1, 1)
	self.TopPanel:Height(PANEL_HEIGHT)
	self.TopPanel:SetScript('OnShow', Panel_OnShow)
	Panel_OnShow(self.TopPanel)
	E.FrameLocks['ElvUI_TopPanel'] = true;
	E.FrameLocks['AB1Infobar'] = true;
	E.FrameLocks['AB5Infobar'] = true;
	E.FrameLocks['AB3Infobar'] = true;
	self:TopPanelVisibility()
end

function LO:BottomPanelVisibility()
	if E.db.general.bottomPanel then
		self.BottomPanel:Show()
	else
		self.BottomPanel:Hide()
	end
end

function LO:TopPanelVisibility()
	if E.db.general.topPanel then
		self.TopPanel:Show()
	else
		self.TopPanel:Hide()
	end
end

local function ChatPanelLeft_OnFade(self)
	LeftChatPanel:Hide()
end

local function ChatPanelRight_OnFade(self)
	RightChatPanel:Hide()
end

local function ChatButton_OnEnter(self, ...)
	if E.db[self.parent:GetName()..'Faded'] then
		self.parent:Show()
		UIFrameFadeIn(self.parent, 0.2, self.parent:GetAlpha(), 1)
		UIFrameFadeIn(self, 0.2, self:GetAlpha(), 1)
	end

	if not self.parent.editboxforced then
		GameTooltip:SetOwner(self, 'ANCHOR_TOPLEFT', 0, 4)
		GameTooltip:ClearLines()
		GameTooltip:AddDoubleLine(L["Left Click:"], L["Toggle Chat Frame"], 1, 1, 1)
		GameTooltip:Show()
	end
end

local function ChatButton_OnLeave(self, ...)
	if E.db[self.parent:GetName()..'Faded'] then
		UIFrameFadeOut(self.parent, 0.2, self.parent:GetAlpha(), 0)
		UIFrameFadeOut(self, 0.2, self:GetAlpha(), 0)
		self.parent.fadeInfo.finishedFunc = self.parent.fadeFunc
	end
	GameTooltip:Hide()
end

local function ChatButton_OnClick(self, btn)
	GameTooltip:Hide()

	if E.db[self.parent:GetName()..'Faded'] then
		E.db[self.parent:GetName()..'Faded'] = nil
		UIFrameFadeIn(self.parent, 0.2, self.parent:GetAlpha(), 1)
		UIFrameFadeIn(self, 0.2, self:GetAlpha(), 1)
	else
		E.db[self.parent:GetName()..'Faded'] = true
		UIFrameFadeOut(self.parent, 0.2, self.parent:GetAlpha(), 0)
		UIFrameFadeOut(self, 0.2, self:GetAlpha(), 0)
		self.parent.fadeInfo.finishedFunc = self.parent.fadeFunc
	end
end

function HideLeftChat()
	ChatButton_OnClick(LeftChatToggleButton)
end

function HideRightChat()
	ChatButton_OnClick(RightChatToggleButton)
end

function HideBothChat()
	ChatButton_OnClick(LeftChatToggleButton)
	ChatButton_OnClick(RightChatToggleButton)
end

function LO:ToggleChatTabPanels(rightOverride, leftOverride)
	if leftOverride or not E.db.chat.panelTabBackdrop then
		LeftChatTab:Hide()
	else
		LeftChatTab:Show()
	end

	if rightOverride or not E.db.chat.panelTabBackdrop then
		RightChatTab:Hide()
	else
		RightChatTab:Show()
	end
end

function LO:SetChatTabStyle()
	if E.db.chat.panelTabTransparency then
		LeftChatTab:SetTemplate("Transparent")
		RightChatTab:SetTemplate("Transparent")
	else
		LeftChatTab:SetTemplate("Default", true)
		RightChatTab:SetTemplate("Default", true)
	end
end

function LO:SetDataPanelStyle()
	if E.db.datatexts.panelTransparency then
		LeftChatDataPanel:SetTemplate("Transparent")
		LeftChatToggleButton:SetTemplate("Transparent")
		LeftMiniPanel:SetTemplate("Transparent")
		RightChatDataPanel:SetTemplate("Transparent")
		RightChatToggleButton:SetTemplate("Transparent")
		RightMiniPanel:SetTemplate("Transparent")
		-- ElvConfigToggle:SetTemplate("Transparent")
	else
		LeftChatDataPanel:SetTemplate("Default", true)
		LeftChatToggleButton:SetTemplate("Default", true)
		LeftMiniPanel:SetTemplate("Default", true)
		RightChatDataPanel:SetTemplate("Default", true)
		RightChatToggleButton:SetTemplate("Default", true)
		RightMiniPanel:SetTemplate("Default", true)
		-- ElvConfigToggle:SetTemplate("Default", true)
	end
end

function LO:ToggleChatPanels()
	LeftChatDataPanel:ClearAllPoints()
	RightChatDataPanel:ClearAllPoints()
	local SPACING = E.Border*3 - E.Spacing

	if E.db.datatexts.leftChatPanel then
		LeftChatDataPanel:Show()
		LeftChatToggleButton:Show()
	else
		LeftChatDataPanel:Hide()
		LeftChatToggleButton:Hide()
	end

	if E.db.datatexts.rightChatPanel then
		RightChatDataPanel:Show()
		RightChatToggleButton:Show()
	else
		RightChatDataPanel:Hide()
		RightChatToggleButton:Hide()
	end
	
	local panelBackdrop = E.db.chat.panelBackdrop
	if panelBackdrop == 'SHOWBOTH' then
		LeftChatPanel.backdrop:Show()
		RightChatPanel.backdrop:Show()
		LeftChatDataPanel:Point('BOTTOMLEFT', LeftChatPanel, 'BOTTOMLEFT', SPACING + SIDE_BUTTON_WIDTH, SPACING)
		LeftChatDataPanel:Point('TOPRIGHT', LeftChatPanel, 'BOTTOMRIGHT', -SPACING, (SPACING + PANEL_HEIGHT))
		RightChatDataPanel:Point('BOTTOMLEFT', RightChatPanel, 'BOTTOMLEFT', SPACING, SPACING)
		RightChatDataPanel:Point('TOPRIGHT', RightChatPanel, 'BOTTOMRIGHT', -(SPACING + SIDE_BUTTON_WIDTH), SPACING + PANEL_HEIGHT)
		LeftChatToggleButton:Point('BOTTOMLEFT', LeftChatPanel, 'BOTTOMLEFT', SPACING, SPACING)
		RightChatToggleButton:Point('BOTTOMRIGHT', RightChatPanel, 'BOTTOMRIGHT', -SPACING, SPACING)
		LO:ToggleChatTabPanels()
	elseif panelBackdrop == 'HIDEBOTH' then
		LeftChatPanel.backdrop:Hide()
		RightChatPanel.backdrop:Hide()
		LeftChatDataPanel:Point('BOTTOMLEFT', LeftChatPanel, 'BOTTOMLEFT', SIDE_BUTTON_WIDTH, 0)
		LeftChatDataPanel:Point('TOPRIGHT', LeftChatPanel, 'BOTTOMRIGHT', 0, PANEL_HEIGHT)
		RightChatDataPanel:Point('BOTTOMLEFT', RightChatPanel, 'BOTTOMLEFT')
		RightChatDataPanel:Point('TOPRIGHT', RightChatPanel, 'BOTTOMRIGHT', -SIDE_BUTTON_WIDTH, PANEL_HEIGHT)
		LeftChatToggleButton:Point('BOTTOMLEFT', LeftChatPanel, 'BOTTOMLEFT')
		RightChatToggleButton:Point('BOTTOMRIGHT', RightChatPanel, 'BOTTOMRIGHT')
		LO:ToggleChatTabPanels(true, true)
	elseif panelBackdrop == 'LEFT' then
		LeftChatPanel.backdrop:Show()
		RightChatPanel.backdrop:Hide()
		LeftChatDataPanel:Point('BOTTOMLEFT', LeftChatPanel, 'BOTTOMLEFT', SPACING + SIDE_BUTTON_WIDTH, SPACING)
		LeftChatDataPanel:Point('TOPRIGHT', LeftChatPanel, 'BOTTOMRIGHT', -SPACING, (SPACING + PANEL_HEIGHT))
		RightChatDataPanel:Point('BOTTOMLEFT', RightChatPanel, 'BOTTOMLEFT')
		RightChatDataPanel:Point('TOPRIGHT', RightChatPanel, 'BOTTOMRIGHT', -SIDE_BUTTON_WIDTH, PANEL_HEIGHT)
		LeftChatToggleButton:Point('BOTTOMLEFT', LeftChatPanel, 'BOTTOMLEFT', SPACING, SPACING)
		RightChatToggleButton:Point('BOTTOMRIGHT', RightChatPanel, 'BOTTOMRIGHT')
		LO:ToggleChatTabPanels(true)
	else
		LeftChatPanel.backdrop:Hide()
		RightChatPanel.backdrop:Show()
		LeftChatDataPanel:Point('BOTTOMLEFT', LeftChatPanel, 'BOTTOMLEFT', SIDE_BUTTON_WIDTH, 0)
		LeftChatDataPanel:Point('TOPRIGHT', LeftChatPanel, 'BOTTOMRIGHT', 0, PANEL_HEIGHT)
		RightChatDataPanel:Point('BOTTOMLEFT', RightChatPanel, 'BOTTOMLEFT', SPACING, SPACING)
		RightChatDataPanel:Point('TOPRIGHT', RightChatPanel, 'BOTTOMRIGHT', -(SPACING + SIDE_BUTTON_WIDTH), SPACING + PANEL_HEIGHT)
		LeftChatToggleButton:Point('BOTTOMLEFT', LeftChatPanel, 'BOTTOMLEFT')
		RightChatToggleButton:Point('BOTTOMRIGHT', RightChatPanel, 'BOTTOMRIGHT', -SPACING, SPACING)
		LO:ToggleChatTabPanels(nil, true)
	end
end

function LO:GetLocTextColor()
	local pvpType = GetZonePVPInfo()
	if pvpType == "arena" then
		return 0.84, 0.03, 0.03
	elseif pvpType == "friendly" then
		return 0.05, 0.85, 0.03
	elseif pvpType == "contested" then
		return 0.9, 0.85, 0.05
	elseif pvpType == "hostile" then 
		return 0.84, 0.03, 0.03
	elseif pvpType == "sanctuary" then
		return 0.035, 0.58, 0.84
	elseif pvpType == "combat" then
		return 0.84, 0.03, 0.03
	else
		return 0.84, 0.03, 0.03
	end	
end

function LO:CreateActionbarInfobar()
	local db = E.db.actionbar
	local backdrop = 0
	
	local mbar = CreateFrame('Frame', 'AB1Infobar', E.UIParent)
	mbar:SetFrameLevel(2)
	mbar:SetTemplate("Default", true)
	mbar:CreateShadow("Default")
	mbar:Point("BOTTOM", E.UIParent, "BOTTOM", 0, 4)
	E:GetModule('DataTexts'):RegisterPanel(mbar, 3, 'ANCHOR_TOPLEFT', -17, 4)
	
	
	local num = (min(db.bar1.buttons, db.bar1.buttonsPerRow)) / 2
	
	local lbar = CreateFrame('Frame', 'AB5Infobar', E.UIParent)
	lbar:SetFrameLevel(2)
	lbar:SetTemplate("Default", true)
	lbar:CreateShadow("Default")
	lbar:Point('BOTTOMRIGHT', 'ElvUIParent', 'BOTTOM', -(4 + db['bar1'].buttonsize * num + db['bar1'].buttonspacing * (num + 1)), 4)
	
	E:GetModule('DataTexts'):RegisterPanel(lbar, 1, 'ANCHOR_TOPLEFT', -17, 4)

	local rbar = CreateFrame('Frame', 'AB3Infobar', E.UIParent)
	rbar:SetFrameLevel(2)
	rbar:SetTemplate("Default", true)
	rbar:CreateShadow("Default")
	rbar:Point('BOTTOMLEFT', 'ElvUIParent', 'BOTTOM', 4 + db['bar4'].buttonsize * num + db['bar4'].buttonspacing * (num + 1), 4)
	
	E:GetModule('DataTexts'):RegisterPanel(rbar, 1, 'ANCHOR_TOPLEFT', -17, 4)
	
	self:UpdateActionbarInfobar()
end

function LO:UpdateActionbarInfobar()
	if E.db.datatexts.panels.AB1Infobar.left == '' and E.db.datatexts.panels.AB1Infobar.middle == '' and E.db.datatexts.panels.AB1Infobar.right == '' and E.db.datatexts.panels.AB3Infobar == '' and E.db.datatexts.panels.AB5Infobar == '' then return; end

	local db = E.db.actionbar
	local backdrop = 0
	
	if db.bar1.backdrop then backdrop = 8 else backdrop = 0 end
	AB1Infobar:Size(min(db.bar1.buttons, db.bar1.buttonsPerRow) * (db.bar1.buttonsize + db.bar1.buttonspacing) - db.bar1.buttonspacing + backdrop, 23)
	if db.bar5.backdrop then backdrop = 4 else backdrop = 0 end
	AB5Infobar:Size(min(db.bar5.buttons, db.bar5.buttonsPerRow) * (db.bar5.buttonsize + db.bar5.buttonspacing) + backdrop, 23)
	if db.bar3.backdrop then backdrop = 4 else backdrop = 0 end
	AB3Infobar:Size(min(db.bar3.buttons, db.bar3.buttonsPerRow) * (db.bar3.buttonsize + db.bar3.buttonspacing) + backdrop, 23)
	
	E:CreateMover(AB1Infobar, 'AB1InfobarMover', L['AB1Infobar'] , nil, nil, nil, 'ALL,EUI', function() if E.db.datatexts.panels.AB1Infobar.left == '' and E.db.datatexts.panels.AB1Infobar.middle == '' and E.db.datatexts.panels.AB1Infobar.right == '' then return false; else return true; end; end)
	E:CreateMover(AB5Infobar, 'AB5InfobarMover', L['AB5Infobar'], nil, nil, nil, 'ALL,EUI', function() if E.db.datatexts.panels.AB5Infobar == '' then return false; else return true; end; end)
	E:CreateMover(AB3Infobar, 'AB3InfobarMover', L['AB3Infobar'], nil, nil, nil, 'ALL,EUI', function() if E.db.datatexts.panels.AB3Infobar == '' then return false; else return true; end; end)
end

function LO:CreateChatPanels()
	local SPACING = E.Border*3 - E.Spacing

	--Left Chat
	local lchat = CreateFrame('Frame', 'LeftChatPanel', E.UIParent)
	lchat:SetFrameStrata('BACKGROUND')
	lchat:SetFrameLevel(300)
	lchat:Size(E.db.chat.panelWidth, E.db.chat.panelHeight)
	lchat:Point('BOTTOMLEFT', E.UIParent, 4, 4)
	lchat:CreateBackdrop('Transparent')
	lchat.backdrop:SetAllPoints()
	E:CreateMover(lchat, "LeftChatMover", L["Left Chat"])


	--Background Texture
	lchat.tex = lchat:CreateTexture(nil, 'OVERLAY')
	lchat.tex:SetInside()
	lchat.tex:SetTexture(E.db.chat.panelBackdropNameLeft)
	lchat.tex:SetAlpha(E.db.general.backdropfadecolor.a - 0.7 > 0 and E.db.general.backdropfadecolor.a - 0.7 or 0.5)

	--Left Chat Tab
	local lchattab = CreateFrame('Frame', 'LeftChatTab', LeftChatPanel)
	lchattab:Point('TOPLEFT', lchat, 'TOPLEFT', SPACING, E.db["euiscript"].chatbar and -(SPACING + PANEL_HEIGHT) or -SPACING)
	lchattab:Point('BOTTOMRIGHT', lchat, 'TOPRIGHT', -SPACING, E.db["euiscript"].chatbar and -(SPACING + PANEL_HEIGHT)*2 or -(SPACING + PANEL_HEIGHT))
	lchattab:SetTemplate(E.db.chat.panelTabTransparency == true and 'Transparent' or 'Default', true)

	--Left Chat Data Panel
	local lchatdp = CreateFrame('Frame', 'LeftChatDataPanel', LeftChatPanel)
	lchatdp:Point('BOTTOMLEFT', lchat, 'BOTTOMLEFT', SPACING + SIDE_BUTTON_WIDTH, SPACING)
	lchatdp:Point('TOPRIGHT', lchat, 'BOTTOMRIGHT', -SPACING, (SPACING + PANEL_HEIGHT))
	lchatdp:SetTemplate(E.db.datatexts.panelTransparency and 'Transparent' or 'Default', true)
	
	E:GetModule('DataTexts'):RegisterPanel(lchatdp, 3, 'ANCHOR_TOPLEFT', -17, 4)

	--Left Chat Toggle Button
	local lchattb = CreateFrame('Button', 'LeftChatToggleButton', E.UIParent)
	lchattb.parent = LeftChatPanel
	LeftChatPanel.fadeFunc = ChatPanelLeft_OnFade
	lchattb:Point('TOPRIGHT', lchatdp, 'TOPLEFT', E.Border - E.Spacing*3, 0)
	lchattb:Point('BOTTOMLEFT', lchat, 'BOTTOMLEFT', SPACING, SPACING)
	lchattb:SetTemplate(E.db.datatexts.panelTransparency and 'Transparent' or 'Default', true)
	lchattb:RegisterForClicks('AnyUp')
	lchattb:SetScript('OnEnter', ChatButton_OnEnter)
	lchattb:SetScript('OnLeave', ChatButton_OnLeave)
	lchattb:SetScript('OnClick', ChatButton_OnClick)
	lchattb.text = lchattb:CreateFontString(nil, 'OVERLAY')
	lchattb.text:FontTemplate()
	lchattb.text:Point('CENTER')
	lchattb.text:SetJustifyH('CENTER')
	lchattb.text:SetText('<')

	--Right Chat
	local rchat = CreateFrame('Frame', 'RightChatPanel', E.UIParent)
	rchat:SetFrameStrata('BACKGROUND')
	rchat:SetFrameLevel(300)
	rchat:Size(E.db.chat.separateSizes and E.db.chat.panelWidthRight or E.db.chat.panelWidth, E.db.chat.separateSizes and E.db.chat.panelHeightRight or E.db.chat.panelHeight)
	rchat:Point('BOTTOMRIGHT', E.UIParent, -4, 4)
	rchat:CreateBackdrop('Transparent')
	rchat.backdrop:SetAllPoints()
	E:CreateMover(rchat, "RightChatMover", L["Right Chat"])

	--Background Texture
	rchat.tex = rchat:CreateTexture(nil, 'OVERLAY')
	rchat.tex:SetInside()
	rchat.tex:SetTexture(E.db.chat.panelBackdropNameRight)
	rchat.tex:SetAlpha(E.db.general.backdropfadecolor.a - 0.7 > 0 and E.db.general.backdropfadecolor.a - 0.7 or 0.5)

	--Right Chat Tab
	local rchattab = CreateFrame('Frame', 'RightChatTab', RightChatPanel)
	rchattab:Point('TOPRIGHT', rchat, 'TOPRIGHT', -SPACING, -SPACING)
	rchattab:Point('BOTTOMLEFT', rchat, 'TOPLEFT', SPACING, -(SPACING + PANEL_HEIGHT))
	rchattab:SetTemplate(E.db.chat.panelTabTransparency == true and 'Transparent' or 'Default', true)

	--Right Chat Data Panel
	local rchatdp = CreateFrame('Frame', 'RightChatDataPanel', RightChatPanel)
	rchatdp:Point('BOTTOMLEFT', rchat, 'BOTTOMLEFT', SPACING, SPACING)
	rchatdp:Point('TOPRIGHT', rchat, 'BOTTOMRIGHT', -(SPACING + SIDE_BUTTON_WIDTH), SPACING + PANEL_HEIGHT)
	rchatdp:SetTemplate(E.db.datatexts.panelTransparency and 'Transparent' or 'Default', true)
	E:GetModule('DataTexts'):RegisterPanel(rchatdp, 3, 'ANCHOR_TOPRIGHT', 17, 4)

	--Right Chat Toggle Button
	local rchattb = CreateFrame('Button', 'RightChatToggleButton', E.UIParent)
	rchattb.parent = RightChatPanel
	RightChatPanel.fadeFunc = ChatPanelRight_OnFade
	rchattb:Point('TOPLEFT', rchatdp, 'TOPRIGHT', -E.Border + E.Spacing*3, 0)
	rchattb:Point('BOTTOMRIGHT', rchat, 'BOTTOMRIGHT', -SPACING, SPACING)
	rchattb:SetTemplate(E.db.datatexts.panelTransparency and 'Transparent' or 'Default', true)
	rchattb:RegisterForClicks('AnyUp')
	rchattb:SetScript('OnEnter', ChatButton_OnEnter)
	rchattb:SetScript('OnLeave', ChatButton_OnLeave)
	rchattb:SetScript('OnClick', ChatButton_OnClick)
	rchattb.text = rchattb:CreateFontString(nil, 'OVERLAY')
	rchattb.text:FontTemplate()
	rchattb.text:Point('CENTER')
	rchattb.text:SetJustifyH('CENTER')
	rchattb.text:SetText('>')

	--Load Settings
	if E.db['LeftChatPanelFaded'] then
		LeftChatToggleButton:SetAlpha(0)
		LeftChatPanel:Hide()
	end

	if E.db['RightChatPanelFaded'] then
		RightChatToggleButton:SetAlpha(0)
		RightChatPanel:Hide()
	end

	self:ToggleChatPanels()
end

function LO:CreateMinimapPanels()
	local lminipanel = CreateFrame('Frame', 'LeftMiniPanel', Minimap)

	lminipanel:Point('TOPLEFT', Minimap, 'BOTTOMLEFT', -E.Border, -E.Spacing*3)
	lminipanel:Point('BOTTOMRIGHT', Minimap, 'BOTTOM', 0, -(E.Spacing*3 + PANEL_HEIGHT))
	lminipanel:SetTemplate(E.db.datatexts.panelTransparency and 'Transparent' or 'Default', true)
	E:GetModule('DataTexts'):RegisterPanel(lminipanel, 1, 'ANCHOR_BOTTOMLEFT', lminipanel:GetWidth() * 2, -4)

	local rminipanel = CreateFrame('Frame', 'RightMiniPanel', Minimap)
	rminipanel:Point('TOPRIGHT', Minimap, 'BOTTOMRIGHT', E.Border, -(E.Spacing*3))
	rminipanel:Point('BOTTOMLEFT', lminipanel, 'BOTTOMRIGHT', -E.Border + (E.Spacing*3), 0)
	rminipanel:SetTemplate(E.db.datatexts.panelTransparency and 'Transparent' or 'Default', true)
	E:GetModule('DataTexts'):RegisterPanel(rminipanel, 1, 'ANCHOR_BOTTOM', 0, -4)

	if E.db.datatexts.minimapPanels then
		LeftMiniPanel:Show()
		RightMiniPanel:Show()
	else
		LeftMiniPanel:Hide()
		RightMiniPanel:Hide()
	end
	
	local f = CreateFrame("Frame", 'BottomMiniPanel', Minimap)
	f:SetPoint("BOTTOM", Minimap, "BOTTOM")
	f:Width(75)
	f:Height(20)
	f:SetFrameLevel(Minimap:GetFrameLevel() + 5)
	E:GetModule('DataTexts'):RegisterPanel(f, 1, 'ANCHOR_BOTTOM', 0, -10)
	
	f = CreateFrame("Frame", 'TopMiniPanel', Minimap)
	f:SetPoint("TOP", Minimap, "TOP")
	f:Width(75)
	f:Height(20)
	f:SetFrameLevel(Minimap:GetFrameLevel() + 5)
	E:GetModule('DataTexts'):RegisterPanel(f, 1, 'ANCHOR_BOTTOM', 0, -10)		
	
	f = CreateFrame("Frame", 'TopLeftMiniPanel', Minimap)
	f:SetPoint("TOPLEFT", Minimap, "TOPLEFT")
	f:Width(75)
	f:Height(20)
	f:SetFrameLevel(Minimap:GetFrameLevel() + 5)
	E:GetModule('DataTexts'):RegisterPanel(f, 1, 'ANCHOR_BOTTOMLEFT', 0, -10)	

	f = CreateFrame("Frame", 'TopRightMiniPanel', Minimap)
	f:SetPoint("TOPRIGHT", Minimap, "TOPRIGHT")
	f:Width(75)
	f:Height(20)
	f:SetFrameLevel(Minimap:GetFrameLevel() + 5)
	E:GetModule('DataTexts'):RegisterPanel(f, 1, 'ANCHOR_BOTTOMRIGHT', 0, -10)	
	
	f = CreateFrame("Frame", 'BottomLeftMiniPanel', Minimap)
	f:SetPoint("BOTTOMLEFT", Minimap, "BOTTOMLEFT")
	f:Width(75)
	f:Height(20)
	f:SetFrameLevel(Minimap:GetFrameLevel() + 5)
	E:GetModule('DataTexts'):RegisterPanel(f, 1, 'ANCHOR_BOTTOMLEFT', 0, -10)	

	f = CreateFrame("Frame", 'BottomRightMiniPanel', Minimap)
	f:SetPoint("BOTTOMRIGHT", Minimap, "BOTTOMRIGHT")
	f:Width(75)
	f:Height(20)
	f:SetFrameLevel(Minimap:GetFrameLevel() + 5)
	E:GetModule('DataTexts'):RegisterPanel(f, 1, 'ANCHOR_BOTTOMRIGHT', 0, -10)
end

E:RegisterModule(LO:GetName())