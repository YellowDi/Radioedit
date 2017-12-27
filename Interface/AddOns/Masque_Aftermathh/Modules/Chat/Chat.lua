local A, C, M, L = select(2, ...):unpack()

local CustomChat = CreateFrame("Frame")

local Lines = {}
local AddMessage = ChatFrame1.AddMessage

local function AddNewMessage(self, Text, ...)
    if (type(Text) == "string") then
        Text = gsub(Text, "(|HBNplayer.-|h)%[(.-)%]|h", "%1%2|h")
        Text = gsub(Text, "(|Hplayer.-|h)%[(.-)%]|h", "%1%2|h")
        Text = gsub(Text, "%[(%d0?)%. (.-)%]", "(%1)")
		Text = format("%s %s", date"|cff707070[%H:%M:%S]|r", Text)
    end
    return AddMessage(self, Text, ...)
end

function CustomChat:StyleFrames(self)
	if (self.IsSkinned) then
		return
	end

	local Panels = A["Panels"]
	local FrameName = self:GetName()

	local Chat = _G[FrameName]
	Chat:StripTexture()
	Chat:SetClampedToScreen(false)
	Chat:SetMaxResize(UIParent:GetWidth(), UIParent:GetHeight())
	Chat:SetMinResize(150, 25)
	Chat:SetFontTemplate(C.Media.Font, 12)

	local EditBox = _G[FrameName.."EditBox"]
	EditBox:SetFontTemplate(C.Media.Font, 12)
	
	EditBox:StripTexture()
	EditBox:ClearAllPoints()
	EditBox:SetInside(Panels.ChatTabPanelLeft)
	EditBox:CreateBackdrop()
	EditBox:SetBackdropColor(0.050, 0.050, 0.050, 1)

	local EditBoxHeader = _G[FrameName.."EditBoxHeader"]
	EditBoxHeader:SetFontTemplate(C.Media.Font, 12)

	if (C.Chat.EditBoxChatColor) then
		hooksecurefunc("ChatEdit_UpdateHeader", function(EditBox)
			local Type = EditBox:GetAttribute("chatType")
			if not Type then return end
			local Info = ChatTypeInfo[Type]
			EditBox.Backdrop:SetColorTemplate(Info.r, Info.g, Info.b)
		end)
	end

	local Tab = _G[FrameName.."Tab"]
	Tab:SetFrameStrata("MEDIUM")
	Tab:SetAlpha(1)
	Tab.SetAlpha = UIFrameFadeRemoveFrame

	local TabText = _G[FrameName.."TabText"]
	TabText:SetFontTemplate(C.Media.Font2, 12)

	--local A1, A2, A3, A4, A5 = TabText:GetPoint()
	--TabText:SetPoint(A1, A2, A3, A4, -13)

	local HideTextures = {
		"ButtonFrameBottomTexture",
		"ButtonFrameRightTexture",
		"ButtonFrameLeftTexture",
		"ButtonFrameTopRightTexture",
		"ButtonFrameTopLeftTexture",
		"ButtonFrameTopTexture",
		"ButtonFrameBackground",
		"TabHighlightMiddle",
		"TabHighlightRight",
		"TabHighlightLeft",
		"TabSelectedRight",
		"TabSelectedMiddle",
		"TabSelectedLeft",
		"TabRight",
		"TabLeft",
		"TabMiddle",
	}

	for i, Textures in pairs(HideTextures) do
		local Texture = _G[FrameName..Textures]
		Texture:SetTexture(nil)
	end
	
	local ButtonUp = _G[FrameName.."ButtonFrameUpButton"]
	local ButtonDown = _G[FrameName.."ButtonFrameDownButton"]
	local ButtonBottom = _G[FrameName.."ButtonFrameBottomButton"]
	local MinimizeButton = _G[FrameName.."ButtonFrameMinimizeButton"]
	local QuickJoinButton = _G["QuickJoinToastButton"]
	local ChatMenuButton = _G["ChatFrameMenuButton"]

	ButtonUp:SetAlpha(0)
	ButtonUp:EnableMouse(false)
	ButtonDown:SetAlpha(0)
	ButtonDown:EnableMouse(false)
	ButtonBottom:SetAlpha(0)
	ButtonBottom:EnableMouse(false)
	MinimizeButton:SetAlpha(0)
	MinimizeButton:EnableMouse(false)
	QuickJoinButton:SetAlpha(0)
	QuickJoinButton:EnableMouse(false)
	ChatMenuButton:SetAlpha(0)
	ChatMenuButton:EnableMouse(false)

	if (i ~= 2) then
	    self.AddMessage = AddNewMessage
    end
	
    self.IsSkinned = true
end

function CustomChat:StyleCombatLog()
    if (self.IsSkinned) then
	    return
	end
	
	local Class = select(2, UnitClass("player"))
    local CustomClassColor = A.Colors.class[Class]

	local CombatLogButton = _G["CombatLogQuickButtonFrame_Custom"]
	CombatLogButton:StripTexture()
	CombatLogButton:CreateBackdrop()
	
	local CombatLogQuickButton1 = _G["CombatLogQuickButtonFrameButton1"]
	local CombatLogQuickButton2 = _G["CombatLogQuickButtonFrameButton2"]
	
	for i = 1, 2 do
		local CombatLogQuickButton = _G["CombatLogQuickButtonFrameButton"..i]
	    local CombatLogText = CombatLogQuickButton:GetFontString()
        CombatLogText:SetFontTemplate(C.Media.Font2, 12)
    end

	local CombatLogProgressBar = _G["CombatLogQuickButtonFrame_CustomProgressBar"]
	CombatLogProgressBar:SetStatusBarTexture(C.Media.Texture)
	CombatLogProgressBar:SetStatusBarColor(unpack(CustomClassColor))
	CombatLogProgressBar:ClearAllPoints()
	CombatLogProgressBar:SetInside(CombatLogButton)

	self.isSkinned = true
end

function CustomChat:KillPetBattleCombatLog(Frame)
	if (_G[Frame:GetName().."Tab"]:GetText():match(PET_BATTLE_COMBAT_LOG)) then
		return FCF_Close(Frame)
	end
end

function CustomChat:StyleTempFrame()
	local Frame = FCF_GetCurrentChatFrame()
	Chat:KillPetBattleCombatLog(Frame)

	if (Frame.IsSkinned) then
		return
	end

	Chat:StyleFrames(Frame)
end

function CustomChat:UpdateTabColors(Selected)
	if (Selected) then
		self:GetFontString():SetTextColor(unpack(C.Chat.TabTextSelectedColor))
	else
		self:GetFontString():SetTextColor(unpack(C.Chat.TabTextColor))
	end
end

function CustomChat:NoMouseAlpha()
	local Frame = self:GetName()
	local Tab = _G[Frame.."Tab"]

	if (Tab.noMouseAlpha == 0.4) or (Tab.noMouseAlpha == 0.2) then
		Tab:SetAlpha(0)
		Tab.noMouseAlpha = 0
	end
end

function CustomChat:OnMouseWheel(Direction)
	if (Direction > 0) then
		if (IsShiftKeyDown()) then
			self:ScrollToTop()
		end
	elseif (Direction < 0) then
		if (IsShiftKeyDown()) then
			self:ScrollToBottom()
		end
	end
end

function CustomChat:AddHooks()
	hooksecurefunc("FCF_OpenTemporaryWindow", CustomChat.StyleTempFrame)
    --hooksecurefunc("FCFTab_UpdateAlpha", CustomChat.NoMouseAlpha)
    hooksecurefunc("FCFTab_UpdateColors", CustomChat.UpdateTabColors)
    hooksecurefunc("FloatingChatFrame_OnMouseScroll", CustomChat.OnMouseWheel)
end

function CustomChat:AddChatMenu()
    local ChatTab = _G["ChatFrame1Tab"]
    local ChatMenu = _G["ChatMenu"]

    ChatTab:RegisterForClicks("AnyUp")
    ChatTab:HookScript("OnClick", function(self, Button)
	    if (Button == "MiddleButton") then
		    ChatMenu:Show()
		end
	end)
end

function CustomChat:SkinToastFrame()
    local Toast = _G["BNToastFrame"]
    Toast:CreateBackdrop()
	
	Toast:HookScript("OnShow", function(self)
		self:ClearAllPoints()
	    self:Point("BOTTOMLEFT", UIParent, 6, 172)
	end)

    local ToastCloseButton = _G["BNToastFrameCloseButton"]
    ToastCloseButton:SkinCloseButton(-4, -4, 14)
end

function CustomChat:Setup()
    for i = 1, NUM_CHAT_WINDOWS do
	    local ChatFrames = _G["ChatFrame"..i]
	    ChatFrames:SetPoint("BOTTOMLEFT", UIParent, 8.5, 24.5)
		ChatFrames:SetSize(408, 114.5)
		
	    if (not ChatFrames.isLocked) then
			FCF_SetLocked(ChatFrames, 1)
		end
		
	    CustomChat:StyleFrames(ChatFrames)
    end
end

function CustomChat:GetLines(...)
	local Count = 1
	for i = select("#", ...), 1, -1 do
		local Region = select(i, ...)
		if (Region:GetObjectType() == "FontString") then
			Lines[Count] = tostring(Region:GetText())
	
			Count = Count + 1
		end
	end
	return Count - 1
end

function CustomChat:CopyText(self)
	local LineCount = CustomChat:GetLines(self:GetRegions())
	local Text = table.concat(Lines, "\n", 1, LineCount)
	
	for i = 1, self:GetNumMessages() do
		Text = Text..self:GetMessageInfo(i).."\n"
	end
	
	if CustomChat.CopyFrame:IsVisible() then
	    return CustomChat.CopyFrame:Hide()
	end

	CustomChat.EditBox:SetText(Text)
	CustomChat.CopyFrame:Show()
end

local OnMouseUp = function(self)
	if InCombatLockdown() then
		return
	end

	CustomChat:CopyText(self.ChatFrame)
end

function CustomChat:CreateCopyFrame()
	local CopyFrame = CreateFrame("Frame", nil, UIParent)
	CopyFrame:Width(772)
	CopyFrame:Height(250)
	CopyFrame:Point("CENTER", UIParent, 0, 0)
	CopyFrame:SetFrameStrata("DIALOG")
	CopyFrame:CreateBackdrop()
	CopyFrame:Hide()

	local EditBox = CreateFrame("EditBox", nil, CopyFrame)
	EditBox:SetFontTemplate(C.Media.Font, 12)
	EditBox:SetMultiLine(true)
	EditBox:SetMaxLetters(99999)
	EditBox:EnableMouse(true)
	EditBox:SetAutoFocus(false)
	EditBox:Width(772)
	EditBox:Height(250)
	EditBox:SetScript("OnEscapePressed", function()
		CopyFrame:Hide()
	end)

	local ScrollArea = CreateFrame("ScrollFrame", "ACopyScrollArea", CopyFrame, "UIPanelScrollFrameTemplate")
	ScrollArea:SetPoint("TOPLEFT", CopyFrame, "TOPLEFT", 8, -28)
	ScrollArea:SetPoint("BOTTOMRIGHT", CopyFrame, "BOTTOMRIGHT", -28, 8)
	ScrollArea:SetScrollChild(EditBox)
	
	local Close = CreateFrame("Button", nil, CopyFrame, "UIPanelCloseButton")
	Close:SetPoint("TOPRIGHT", CopyFrame, "TOPRIGHT", 2, 0)
	Close:SkinCloseButton()
	Close:SetScript("OnClick", function()
		CopyFrame:Hide()
	end)
	
	CustomChat.EditBox = EditBox
	CustomChat.Close = Close
	CustomChat.CopyFrame = CopyFrame
end

function CustomChat:CreateCopyButtons()
	for i = 1, NUM_CHAT_WINDOWS do
		local Chat = _G["ChatFrame"..i]

		local Button = CreateFrame("Button", nil, Chat)
		Button:Size(16, 16)
		Button:Point("TOPRIGHT", -1, -8)
		Button:SetAlpha(0.25)
		Button:CreateBackdrop()
		
		local ButtonTexture = Button:CreateTexture(nil, "BORDER")
		ButtonTexture:Size(22, 22)
		ButtonTexture:Point("CENTER", Button, 0.5, 0)
		ButtonTexture:SetTexture(C.Media.ChatCopy)
		ButtonTexture:SetVertexColor(0.355, 0.355, 0.355)

		Button:SetScript("OnMouseUp", OnMouseUp)
		Button:SetScript("OnEnter", function(self) UIFrameFadeIn(Button, 1, Button:GetAlpha(), 1) end)
		Button:SetScript("OnLeave", function(self) UIFrameFadeIn(Button, 1, Button:GetAlpha(), 0.25) end)
		
		Button.ChatFrame = Chat
	end
end

function CustomChat:Enable()
	if not (C.Chat.ChatMod) then 
		return
	end

	CustomChat:Setup()
    CustomChat:SkinToastFrame()
	CustomChat:AddChatMenu()
	CustomChat:CreateCopyFrame()
	CustomChat:CreateCopyButtons()
    CustomChat:AddHooks()
	
	if not IsAddOnLoaded("Blizzard_CombatLog") then
        LoadAddOn("Blizzard_CombatLog")
    end
	
	CustomChat:StyleCombatLog()
	
	local Whisper = CreateFrame("Frame")
    Whisper:RegisterEvent("CHAT_MSG_WHISPER")
    Whisper:RegisterEvent("CHAT_MSG_BN_WHISPER")
    Whisper:SetScript("OnEvent", function(self, event)
	    PlaySoundFile(C.Media.Whisper)
    end)
end

CustomChat:RegisterEvent("PLAYER_LOGIN")
CustomChat:RegisterEvent("PLAYER_ENTERING_WORLD")
CustomChat:RegisterEvent("ADDON_LOADED")

CustomChat:SetScript("OnEvent", function(self, event, AddOn)
	if (event == "PLAYER_LOGIN") then
		CustomChat:Enable()
	end
end)