local A, C, M, L = select(2, ...):unpack()

local Panels = CreateFrame("Frame")

function Panels:Enable()
    if (self.IsCreated) then
		return
	end
   
	-- Chat Panel

	local ChatPanelLeft = CreateFrame("Frame", nil, UIParent)
	ChatPanelLeft:Size(414, 147)
	ChatPanelLeft:Point("BOTTOMLEFT", 6, 20)
	ChatPanelLeft:SetFrameStrata("BACKGROUND")
	ChatPanelLeft:CreateBackdrop()

	local ChatTabPanelLeft = CreateFrame("Frame", nil, ChatPanelLeft)
	ChatTabPanelLeft:Size(408, 22)
	ChatTabPanelLeft:Point("TOP", ChatPanelLeft, 0, -4)
	ChatTabPanelLeft:SetFrameStrata("BACKGROUND")
	ChatTabPanelLeft:CreateBackdrop()

	local ChatPanelRight = CreateFrame("Frame", nil, UIParent)
	ChatPanelRight:Size(414, 147)
	ChatPanelRight:Point("BOTTOMRIGHT", -6, 20)
	ChatPanelRight:SetFrameStrata("BACKGROUND")
	ChatPanelRight:CreateBackdrop()

	local ChatTabPanelRight = CreateFrame("Frame", nil, ChatPanelRight)
	ChatTabPanelRight:Size(408, 22)
	ChatTabPanelRight:Point("TOP", ChatPanelRight, 0, -4)
	ChatTabPanelRight:SetFrameStrata("BACKGROUND")
	ChatTabPanelRight:CreateBackdrop()
	
	-- ActionBar Panel

	local ActionBarPanel = CreateFrame("Frame", nil, UIParent)
	ActionBarPanel:Size(402.5, 74)
	ActionBarPanel:Point("BOTTOM", 0, 4)
	ActionBarPanel:CreateBackdrop()

	-- Bottom Panels

	local BottomPanel = CreateFrame("Frame", nil, UIParent)
	BottomPanel:Size(613, 22)
	BottomPanel:Point("BOTTOM", 0, -2)
	BottomPanel:SetFrameStrata("LOW")
	BottomPanel:SetFrameLevel(10)
	BottomPanel:CreateBackdrop(true)

	-- Top Panel (Orderhall Bar)

	local TopPanel = CreateFrame("Frame", nil, UIParent)
	TopPanel:Size(2000, 26)
	TopPanel:Point("TOP", UIParent, 0, 2)
	TopPanel:SetFrameStrata("BACKGROUND")
	TopPanel:SetFrameLevel(Minimap:GetFrameLevel() - 1)
	TopPanel:CreateBackdrop()
	
	--- Locals
	
	local Class = select(2, UnitClass("player"))
	local CustomClassColor = A.Colors.class[Class]
	local CubeSizeWidth, CubeSizeHeight = 9, 9
	
	-- Top Line

	local TopLine = CreateFrame("Frame", nil, UIParent)
	TopLine:Size(1694, 2)
	TopLine:Point("TOP", 0, -8)
	TopLine:SetFrameStrata("LOW")
	TopLine:SetFrameLevel(1)
	TopLine:SetTemplate()

	local CubeTopLeft = CreateFrame("Frame", nil, TopLine)
	CubeTopLeft:Size(CubeSizeWidth, CubeSizeHeight)
	CubeTopLeft:Point("LEFT", TopLine, 0, 1)
	CubeTopLeft:SetFrameLevel(5)
	CubeTopLeft:CreateBackdrop()
	CubeTopLeft:SetBackdropColor(unpack(CustomClassColor))

	local CubeTopRight = CreateFrame("Frame", nil, TopLine)
	CubeTopRight:Size(CubeSizeWidth, CubeSizeHeight)
	CubeTopRight:Point("RIGHT", TopLine, 0, 1)
	CubeTopRight:SetFrameLevel(5)
	CubeTopRight:CreateBackdrop()
	CubeTopRight:SetBackdropColor(unpack(CustomClassColor))

	-- Bottom Line

	local BottomLine = CreateFrame("Frame", nil, UIParent)
	BottomLine:Size(1694, 2)
	BottomLine:Point("BOTTOM", 0, 6)
	BottomLine:SetFrameStrata("LOW")
	BottomLine:SetFrameLevel(1)
	BottomLine:SetTemplate()

	local CubeBottomLeft = CreateFrame("Button", nil, BottomLine)
	CubeBottomLeft:Size(CubeSizeWidth, CubeSizeHeight)
	CubeBottomLeft:Point("LEFT", BottomLine, 0, 1)
	CubeBottomLeft:SetFrameLevel(5)
	CubeBottomLeft:CreateBackdrop()
	CubeBottomLeft:SetBackdropColor(unpack(CustomClassColor))

	local CubeBottomRight = CreateFrame("Button", nil, BottomLine)
	CubeBottomRight:Size(CubeSizeWidth, CubeSizeHeight)
	CubeBottomRight:Point("RIGHT", BottomLine, 0, 1)
	CubeBottomRight:SetFrameLevel(5)
	CubeBottomRight:CreateBackdrop()
	CubeBottomRight:SetBackdropColor(unpack(CustomClassColor))
	
	--[[
	local CubeBottomRight2 = CreateFrame("Frame", nil, BottomLine)
	CubeBottomRight2:Size(CubeSizeWidth, CubeSizeHeight)
	CubeBottomRight2:Point("CENTER", BottomLine, -314, 1)
	CubeBottomRight2:SetFrameLevel(5)
	CubeBottomRight2:CreateBackdrop()
	CubeBottomRight2:SetBackdropColor(unpack(CustomClassColor))

	local CubeBottomLeft2 = CreateFrame("Frame", nil, BottomLine)
	CubeBottomLeft2:Size(CubeSizeWidth, CubeSizeHeight)
	CubeBottomLeft2:Point("CENTER", BottomLine, 314, 1)
	CubeBottomLeft2:SetFrameLevel(5)
	CubeBottomLeft2:CreateBackdrop()
	CubeBottomLeft2:SetBackdropColor(unpack(CustomClassColor))
	--]]

	-- Hiders

	local HiderSecurePanel = CreateFrame("Frame", nil, UIParent, "SecureHandlerStateTemplate")
	RegisterStateDriver(HiderSecurePanel, "visibility", "hide")
	
	local Hider = CreateFrame("Frame")
	Hider:Hide()

	local PetBattleHiderPanel = CreateFrame("Frame", nil, UIParent, "SecureHandlerStateTemplate")
	PetBattleHiderPanel:SetAllPoints()
	PetBattleHiderPanel:SetFrameStrata("LOW")
	RegisterStateDriver(PetBattleHiderPanel, "visibility", "[petbattle] hide; show")
	
	-- Register

	self.ChatPanelLeft = ChatPanelLeft
	self.ChatTabPanelLeft = ChatTabPanelLeft
	self.ChatPanelRight = ChatPanelRight
	self.ChatTabPanelRight = ChatTabPanelRight
	self.ActionBarPanel = ActionBarPanel
	self.BottomPanel = BottomPanel
	self.TopPanel = TopPanel
	self.TopLine = TopLine
	self.HiderSecure = HiderSecurePanel
	self.Hider = Hider
	self.PetBattleHiderPanel = PetBattleHiderPanel
	
	self.IsCreated = true
end

Panels:RegisterEvent("PLAYER_LOGIN")
Panels:RegisterEvent("PLAYER_ENTERING_WORLD")
Panels:RegisterEvent("ADDON_LOADED")

Panels:SetScript("OnEvent", function(self, event, AddOn)
	if (event == "PLAYER_LOGIN") then
		self:Enable()
	end
end)

A["Panels"] = Panels