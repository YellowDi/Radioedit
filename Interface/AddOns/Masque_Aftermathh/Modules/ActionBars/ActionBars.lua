local A, C, M, L = select(2, ...):unpack()

if C.ActionBars.ActionBarsMod then else return end

local CustomActionBars = CreateFrame("Frame")

local Class = select(2, UnitClass("player"))
local CustomClassColor = A.Colors.class[Class]

local MainMenuBar, MainMenuBarArtFrame = _G["MainMenuBar"], _G["MainMenuBarArtFrame"]
local OverrideActionBar = _G["OverrideActionBar"]
local PossessBarFrame = _G["PossessBarFrame"]
local PetActionBarFrame = _G["PetActionBarFrame"]
local ShapeshiftBarLeft, ShapeshiftBarMiddle, ShapeshiftBarRight = _G["ShapeshiftBarLeft"], _G["ShapeshiftBarMiddle"], _G["ShapeshiftBarRight"]

local ButtonSize = 30
local PetButtonSize = 26
local Spacing = 3

local Noop = function() end

----------------------
-- Disable Blizzard --
----------------------

local Frames = {
	MainMenuBar, MainMenuBarArtFrame, OverrideActionBar,
	PossessBarFrame, PetActionBarFrame, IconIntroTracker,
	ShapeshiftBarLeft, ShapeshiftBarMiddle, ShapeshiftBarRight,
	TalentMicroButtonAlert, CollectionsMicroButtonAlert, EJMicroButtonAlert
}

function CustomActionBars:DisableBlizzard()
	SetCVar("alwaysShowActionBars", 0)

	for _, DisableArt in pairs(Frames) do
	    local Panels = A["Panels"]
	
		DisableArt:UnregisterAllEvents()
		DisableArt.ignoreFramePositionManager = true
		DisableArt:SetParent(Panels.Hider)
	end
end

--------------
-- Skinning --
--------------

function CustomActionBars:SkinButton()
	local Name = self:GetName()
	self:SetNormalTexture("")
	
	local Flash	 = _G[Name.."Flash"]
	Flash:SetTexture("")

	local Border  = _G[Name.."Border"]
	if (Border) then
		Border:SetTexture("Interface\\Buttons\\WHITE8x8")
		Border:SetInside(self, 1, 1)
		Border:SetVertexColor(unpack(C.ActionBars.EquipColor))
		
		if (Border:IsShown()) then
			Border:SetVertexColor(unpack(C.ActionBars.EquipColor))
		else
			Border:SetVertexColor(0,0,0,0)
		end
	end
	
	local ButtonName = _G[Name.."Name"]
	if (ButtonName) then
		if (C.ActionBars.HideMacroText) then
			ButtonName:SetText("")
			ButtonName:SetAlpha(0)
		else
			ButtonName:SetFontTemplate(C.Media.Font, 12)
			ButtonName:ClearAllPoints()
			ButtonName:SetPoint("BOTTOM", 1, 1)
		end
	end
	
	local HotKey = _G[Name.."HotKey"]
	if (C.ActionBars.HideHotKeyText) then
		HotKey:SetText("")
		HotKey:SetAlpha(0)
	else
		HotKey:SetFontTemplate(C.Media.Font, 12)
		HotKey.ClearAllPoints = Noop
		HotKey.SetPoint = Noop
		HotKey:ClearAllPoints()
		HotKey:SetPoint("TOPRIGHT", 0, -3)
	end
	
	local Count = _G[Name.."Count"]
	Count:SetFontTemplate(C.Media.Font2, 12)
	Count:ClearAllPoints()
	Count:Point("BOTTOMRIGHT", 0, 3)
	
	if (self.isSkinned) then
		return
	end

	--[[
	local Normal  = _G[Name.."NormalTexture"]
	if (Normal) then
		Normal:ClearAllPoints()
		Normal:SetPoint("TOPLEFT", self, 0, 0)
		Normal:SetPoint("BOTTOMRIGHT", self, 0, 0)
    
		if (self:GetChecked()) then
			ActionButton_UpdateState(self)
		end
	end
	--]]

	local FloatingBG = _G[Name.."FloatingBG"]
	if (FloatingBG) then
		FloatingBG:SetTexture("")
	end
	
	local Icon = _G[Name.."Icon"]
	Icon:SetTexCoord(unpack(A.TexCoords))
	
	if not (Name:match("ExtraActionButton1")) then
		self:CreateButtonPanel(true, ButtonSize, ButtonSize)
		self:CreateButtonBackdrop()
		self:StyleButton()
	end

    --self:UnregisterEvent("ACTIONBAR_SHOWGRID")
	--self:UnregisterEvent("ACTIONBAR_HIDEGRID")
	--self.showgrid = 1

	self.isSkinned = true
end

function CustomActionBars:SkinPetAndShiftButton(Normal, Button, Icon, Name, Pet)
	if (Button.isSkinned) then 
		return 
	end
	
	local Flash = _G[Name.."Flash"]
	Flash:SetTexture("")

	Button:SetNormalTexture("")
	Button.SetNormalTexture = function() return end
	
	if (Pet) then
		local Shine = _G[Name.."Shine"]
		Shine:Size(PetButtonSize -6, PetButtonSize -6)
		Shine:ClearAllPoints()
		Shine:SetPoint("CENTER")
		Shine:SetFrameLevel(Button:GetFrameLevel() + 10)
		
		local AutoCastable = _G[Name.."AutoCastable"]
		AutoCastable:SetAlpha(0)
	end
	
	local HotKey = _G[Button:GetName().."HotKey"]
	HotKey:SetText("")
	HotKey:SetAlpha(0)
	
	Icon:SetTexCoord(unpack(A.TexCoords))
	Icon:SetInside()
	
	Button:SetWidth(PetButtonSize)
	Button:SetHeight(PetButtonSize)

	Button:CreateButtonPanel(true, PetButtonSize, PetButtonSize)
	Button:CreateButtonBackdrop()
	Button:StyleButton()
	
	Button.isSkinned = true
end

function CustomActionBars:SkinPetButtons()
	for i = 1, NUM_PET_ACTION_SLOTS do
		local Name = "PetActionButton"..i
		local Button  = _G[Name]
		local Icon  = _G[Name.."Icon"]
		local Normal  = _G[Name.."NormalTexture2"]
		CustomActionBars:SkinPetAndShiftButton(Normal, Button, Icon, Name, true)
	end
end

function CustomActionBars:SkinStanceButtons()
	for i = 1, NUM_STANCE_SLOTS do
		local Name = "StanceButton"..i
		local Button  = _G[Name]
		local Icon  = _G[Name.."Icon"]
		local Normal  = _G[Name.."NormalTexture"]
		CustomActionBars:SkinPetAndShiftButton(Normal, Button, Icon, Name, false)
	end
end

function CustomActionBars:StyleFlyout()
	if not (self.FlyoutArrow) then 
		return 
	end
	
	self.FlyoutArrow:SetAlpha(0)

	if (self.FlyoutBorder) then
		self.FlyoutBorder:SetAlpha(0)
		self.FlyoutBorderShadow:SetAlpha(0)
	end
	
	local HB = SpellFlyoutHorizontalBackground
	local VB = SpellFlyoutVerticalBackground
	local BE = SpellFlyoutBackgroundEnd

	HB:SetAlpha(0)
	VB:SetAlpha(0)
	BE:SetAlpha(0)

	local FlyoutButtons = 0
	
	for i = 1, GetNumFlyouts() do
		local ID = GetFlyoutID(i)
		local _, _, NumSlots, IsKnown = GetFlyoutInfo(ID)
		if (IsKnown) then
			FlyoutButtons = NumSlots
			break
		end
	end
		
	for i = 1, FlyoutButtons do
		local Button = _G["SpellFlyoutButton"..i]
		if (Button and not Button.IsSkinned) then
			Button:CreateButtonPanel(true, 28, 28)
			Button:StyleButton()
			
			Button.IsSkinned = true
		end
	end
end

function CustomActionBars:StartButtonHighlight()
    local CustomHideOverlayGlow = ActionButton_HideOverlayGlow

	if (self.overlay) then
		self.overlay:Hide()
		CustomHideOverlayGlow(self)		
	end

	if not (self.Animation) then
		local NewProc = CreateFrame("Frame", nil, self)
		NewProc:SetAllPoints(self)
		NewProc:SetFrameLevel(self:GetFrameLevel() + 5)
		NewProc:SetBackdrop({
			bgFile = "Interface\\Buttons\\WHITE8x8",
			insets = {top = A.Scale(1), left = A.Scale(1), bottom = A.Scale(1), right = A.Scale(1)},
		})
		NewProc:SetBackdropColor(CustomClassColor[1], CustomClassColor[2], CustomClassColor[3], 0.8)

		local Animation = NewProc:CreateAnimationGroup()
		Animation:SetLooping("BOUNCE")

		local FadeOut = Animation:CreateAnimation("Alpha")
		FadeOut:SetFromAlpha(0.8)
		FadeOut:SetToAlpha(0)
		FadeOut:SetDuration(0.40)
		FadeOut:SetSmoothing("IN_OUT")

		self.NewProc = NewProc
		self.Animation = Animation
	end

	if not (self.Animation:IsPlaying()) then
		self.Animation:Play()
		self.NewProc:Show()
	end
end

function CustomActionBars:StopButtonHighlight()
	if (self.Animation and self.Animation:IsPlaying()) then
		self.Animation:Stop()
		self.NewProc:Hide()
	end
end 

-----------------
-- Update Bars --
-----------------

function CustomActionBars:UpdateStanceBar(...)
	if InCombatLockdown() then return end

	local NumForms = GetNumShapeshiftForms()
	local Texture, Name, IsActive, IsCastable, Button, Icon, Cooldown, Start, Duration, Enable

	if (NumForms == 0) then
		CustomActionBars.StanceBar:SetAlpha(0)
	else
		CustomActionBars.StanceBar:SetAlpha(0.8)

		for i = 1, NUM_STANCE_SLOTS do
			local ButtonName = "StanceButton" .. i
			Button = _G[ButtonName]
			Icon = _G[ButtonName.."Icon"]
			
			if (i <= NumForms) then
				Texture, Name, IsActive, IsCastable = GetShapeshiftFormInfo(i)

				if not (Icon) then
					return
				end

				Icon:SetTexture(Texture)
				Cooldown = _G[ButtonName.."Cooldown"]

				if (Texture) then
					Cooldown:SetAlpha(1)
				else
					Cooldown:SetAlpha(0)
				end

				Start, Duration, Enable = GetShapeshiftFormCooldown(i)
				CooldownFrame_Set(Cooldown, Start, Duration, Enable)

				if (IsActive) then
					StanceBarFrame.lastSelected = Button:GetID()
					Button:SetChecked(true)
				else
					Button:SetChecked(false)
				end

				if (IsCastable) then
					Icon:SetVertexColor(1.0, 1.0, 1.0)
				else
					Icon:SetVertexColor(0.4, 0.4, 0.4)
				end
			end
		end
	end
end

function CustomActionBars:UpdatePetBar(...)
	for i = 1, NUM_PET_ACTION_SLOTS, 1 do
		local ButtonName = "PetActionButton" .. i
		local PetActionButton = _G[ButtonName]
		local PetActionIcon = _G[ButtonName.."Icon"]
		local PetAutoCastableTexture = _G[ButtonName.."AutoCastable"]
		local PetAutoCastShine = _G[ButtonName.."Shine"]
		local Name, SubText, Texture, IsToken, IsActive, AutoCastAllowed, AutoCastEnabled = GetPetActionInfo(i)
		
		if (not IsToken) then
			PetActionIcon:SetTexture(Texture)
			PetActionButton.tooltipName = Name
		else
			PetActionIcon:SetTexture(_G[Texture])
			PetActionButton.tooltipName = _G[Name]
		end

		PetActionButton.IsToken = IsToken
		PetActionButton.tooltipSubtext = SubText

		if (IsActive) then
			PetActionButton:SetChecked(1)

			if IsPetAttackAction(i) then
				PetActionButton_StartFlash(PetActionButton)
			end
		else
			PetActionButton:SetChecked()
			
			if IsPetAttackAction(i) then
				PetActionButton_StopFlash(PetActionButton)
			end
		end

		if (AutoCastAllowed) then
			PetAutoCastableTexture:Show()
		else
			PetAutoCastableTexture:Hide()
		end

		if (AutoCastEnabled) then
			AutoCastShine_AutoCastStart(PetAutoCastShine)
		else
			AutoCastShine_AutoCastStop(PetAutoCastShine)
		end

		if (Texture) then
			if (GetPetActionSlotUsable(i)) then
				SetDesaturation(PetActionIcon, nil)
			else
				SetDesaturation(PetActionIcon, 1)
			end

			PetActionIcon:Show()
		else
			PetActionIcon:Hide()
		end

		if (not PetHasActionBar() and Texture and Name ~= "PET_ACTION_FOLLOW") then
			PetActionButton_StopFlash(PetActionButton)
			SetDesaturation(PetActionIcon, 1)
			PetActionButton:SetChecked(0)
		end
	end
end

------------------------
-- Create Action Bars --
------------------------

function CustomActionBars:CreateActionBars()
    local A1 = CreateFrame("Frame", "CustomActionBar1", UIParent, "SecureHandlerStateTemplate")
    A1:Size(ButtonSize*12 + Spacing*13, ButtonSize*1 + Spacing*2)
    A1:Point(unpack(C.ActionBars.ActionBar1Point))
	
	local A2 = CreateFrame("Frame", "CustomActionBar2", UIParent, "SecureHandlerStateTemplate")
    A2:Size(ButtonSize*12 + Spacing*13, ButtonSize*2 + Spacing*3)
    A2:Point(unpack(C.ActionBars.ActionBar2Point))
	
    local A5 = CreateFrame("Frame", "CustomActionBar5", UIParent, "SecureHandlerStateTemplate")
	A5:Size((ButtonSize * 1) + (Spacing * 1.8), (ButtonSize * 12) + (Spacing * 12.5))
    A5:Point(unpack(C.ActionBars.ActionBar5Point))
	
	A5.Backdrop = CreateFrame("Frame", nil, A5)
	A5.Backdrop:SetFrameLevel(A5:GetFrameLevel() - 1)
	A5.Backdrop:SetAllPoints()

    local A6 = CreateFrame("Frame", "CustomStanceBar", UIParent, "SecureHandlerStateTemplate")
    A6:Size((PetButtonSize * 10) + (Spacing * 11), PetButtonSize + (Spacing * 2))
    A6:Point(unpack(C.ActionBars.StanceBarPoint))
	
	--A6.Backdrop = CreateFrame("Frame", nil, A7)
	--A6.Backdrop:SetFrameLevel(A7:GetFrameLevel() - 1)
	--A6.Backdrop:SetAllPoints()
	--A6.Backdrop:CreateBackdrop()
	
	local A7 = CreateFrame("Frame", "CustomPetActionBar", UIParent, "SecureHandlerStateTemplate")
	A7:Size((PetButtonSize * 10) + (Spacing * 9.5), (PetButtonSize) + (Spacing * 1.8))
    A7:Point(unpack(C.ActionBars.PetBarPoint))

	A7.Backdrop = CreateFrame("Frame", nil, A7)
	A7.Backdrop:SetFrameLevel(A7:GetFrameLevel() - 1)
	A7.Backdrop:SetAllPoints()
	
	if not (self.IsCreated) then
		A5.Backdrop:CreateBackdrop()
		A7.Backdrop:CreateBackdrop()
		
		self.IsCreated = true
	end

	self.ActionBar1 = A1
	self.ActionBar2 = A2
	--self.ActionBar3 = A3
	--self.ActionBar4 = A4
	self.ActionBar5 = A5
	self.StanceBar = A6
	self.PetActionBar = A7
end

function CustomActionBars:UpdateBar1()
    local ActionBar1 = CustomActionBars.ActionBar1

    for i = 1, NUM_ACTIONBAR_BUTTONS do
 	    local Button = _G["ActionButton"..i]
	    ActionBar1:SetFrameRef("ActionButton"..i, Button)
    end

    ActionBar1:Execute([[
	Button = table.new()
	    for i = 1, 12 do
		    table.insert(Button, self:GetFrameRef("ActionButton"..i))
	    end
    ]])

	ActionBar1:SetAttribute("_onstate-page", [[
		if HasTempShapeshiftActionBar() then
			newstate = GetTempShapeshiftBarIndex() or newstate
		end

		for i, Button in ipairs(Button) do
			Button:SetAttribute("actionpage", tonumber(newstate))
		end
	]])

    RegisterStateDriver(ActionBar1, "page", CustomActionBars:GetBar())
    RegisterStateDriver(ActionBar1, "visibility", "[petbattle] hide; show")
end

function CustomActionBars:CreateBar1()
    local ActionBar1 = CustomActionBars.ActionBar1
    local Druid, Rogue = "", ""

    if (C.ActionBars.SwitchBarOnStance) then
	    Rogue = "[bonusbar:1] 7;"
	    Druid = "[bonusbar:1,nostealth] 7; [bonusbar:1,stealth] 8; [bonusbar:2] 8; [bonusbar:3] 9; [bonusbar:4] 10;"
    end

    ActionBar1.Page = {
	    ["DRUID"] = Druid,
	    ["ROGUE"] = Rogue,
	    ["DEFAULT"] = "[vehicleui:12] 12; [possessbar] 12; [overridebar] 14; [shapeshift] 13; [bar:2] 2; [bar:3] 3; [bar:4] 4; [bar:5] 5; [bar:6] 6;",
    }

	function CustomActionBars:GetBar()
		local Condition = ActionBar1.Page["DEFAULT"]
		local Class = select(2, UnitClass("player"))
		local Page = ActionBar1.Page[Class]

		if (Page) then
			Condition = Condition .. " " .. Page
		end

		Condition = Condition .. " [form] 1; 1"

		return Condition
	end
	
	CustomActionBars:UpdateBar1()

	ActionBar1:RegisterEvent("PLAYER_ENTERING_WORLD")
	ActionBar1:RegisterEvent("KNOWN_CURRENCY_TYPES_UPDATE")
	ActionBar1:RegisterEvent("CURRENCY_DISPLAY_UPDATE")
	ActionBar1:RegisterEvent("BAG_UPDATE")
	ActionBar1:SetScript("OnEvent", function(self, event, unit, ...)
		if (event == "ACTIVE_TALENT_GROUP_CHANGED") then
			CustomActionBars:UpdateBar1()
		elseif (event == "PLAYER_ENTERING_WORLD") then
			for i = 1, NUM_ACTIONBAR_BUTTONS do
			    local PreviousButton = _G["ActionButton"..i-1]
				local Button = _G["ActionButton"..i]
				Button:Size(ButtonSize, ButtonSize)
				Button:SetParent(ActionBar1)
			
				if (i == 1) then
				    Button:ClearAllPoints()
					Button:Point("BOTTOMLEFT", Spacing, Spacing)
				else
				    Button:ClearAllPoints()
					Button:Point("LEFT", PreviousButton, "RIGHT", Spacing, 0)
				end
			end
		else
			MainMenuBar_OnEvent(self, event, ...)
		end
	end)

	for i = 1, NUM_ACTIONBAR_BUTTONS do
		local Button = _G["ActionButton"..i]
		ActionBar1["Button"..i] = Button
	end
end

function CustomActionBars:CreateBar2()
    local ActionBar2 = CustomActionBars.ActionBar2

    local MultiBarBottomLeft = _G["MultiBarBottomLeft"]
    MultiBarBottomLeft:SetParent(ActionBar2)

    for i = 1, NUM_ACTIONBAR_BUTTONS do
	    local PreviousButton = _G["MultiBarBottomLeftButton"..i-1]
	    local Button = _G["MultiBarBottomLeftButton"..i]
	    Button:Size(ButtonSize, ButtonSize)
	
	    if (i == 1) then
			Button:ClearAllPoints()
		    Button:Point("TOPLEFT", ActionBar2, Spacing, -Spacing)
	    else
			Button:ClearAllPoints()
		    Button:Point("LEFT", PreviousButton, "RIGHT", Spacing, 0)
	    end

	    ActionBar2["Button"..i] = Button
    end

    RegisterStateDriver(ActionBar2, "visibility", "[vehicleui][petbattle][overridebar] hide; show")
end

function CustomActionBars:CreateBar5()
    local ActionBar5 = CustomActionBars.ActionBar5

    local MultiBarLeft = _G["MultiBarLeft"]
    MultiBarLeft:SetParent(ActionBar5)

    for i = 1, NUM_ACTIONBAR_BUTTONS do
	    local PreviousButton = _G["MultiBarLeftButton"..i-1]
	    local Button = _G["MultiBarLeftButton"..i]
	    Button:Size(ButtonSize, ButtonSize)
	    Button:SetAttribute("flyoutDirection", "RIGHT")
	
	    if (i == 1) then
		    Button:ClearAllPoints()
		    Button:Point("TOPRIGHT", ActionBar5, -Spacing, -Spacing)
	    else
		    Button:ClearAllPoints()
		    Button:Point("TOP", PreviousButton, "BOTTOM", 0, -Spacing)
	    end 

	    ActionBar5["Button"..i] = Button
    end

    RegisterStateDriver(ActionBar5, "visibility", "[vehicleui][petbattle][overridebar] hide; show")
end

function CustomActionBars:CreatePetBar()
	local PetBar = CustomActionBars.PetActionBar

	local CustomPetBarFrame = _G["PetActionBarFrame"]
    CustomPetBarFrame:UnregisterEvent("PET_BAR_SHOWGRID")
    CustomPetBarFrame:UnregisterEvent("PET_BAR_HIDEGRID")
	CustomPetBarFrame:UnregisterEvent("ACTIONBAR_SHOWGRID")
	CustomPetBarFrame:UnregisterEvent("ACTIONBAR_HIDEGRID")
    CustomPetBarFrame.showgrid = 1

    for i = 1, NUM_PET_ACTION_SLOTS do
        local PreviousButton = _G["PetActionButton"..i-1]
	    local Button = _G["PetActionButton"..i]
	    Button:Size(PetButtonSize, PetButtonSize)
	    Button:SetParent(PetBar)
	    Button:Show()

	    if (i == 1) then
		    Button:ClearAllPoints()
	    	Button:Point("TOPLEFT", Spacing, -Spacing)
	    else
			Button:ClearAllPoints()
		    Button:Point("LEFT", PreviousButton, "RIGHT", Spacing, 0)
	    end

	    PetBar:SetAttribute("addchild", Button)
	    PetBar["Button"..i] = Button
    end

	hooksecurefunc("PetActionBar_Update", CustomActionBars.UpdatePetBar)

	CustomActionBars:SkinPetButtons()

	RegisterStateDriver(PetBar, "visibility", "[pet,nopetbattle,novehicleui,nooverridebar,nobonusbar:5] show; hide")

	PetBar:RegisterEvent("PLAYER_CONTROL_LOST")
	PetBar:RegisterEvent("PLAYER_CONTROL_GAINED")
	PetBar:RegisterEvent("PLAYER_FARSIGHT_FOCUS_CHANGED")
	PetBar:RegisterEvent("PET_BAR_UPDATE")
	PetBar:RegisterEvent("PET_BAR_UPDATE_USABLE")
	PetBar:RegisterEvent("PET_BAR_UPDATE_COOLDOWN")
	PetBar:RegisterEvent("PET_BAR_HIDE")
	PetBar:RegisterEvent("UNIT_PET")
	PetBar:RegisterEvent("UNIT_FLAGS")
	PetBar:RegisterEvent("UNIT_AURA")
	PetBar:SetScript("OnEvent", function(self, event, arg1)
		if (event == "PET_BAR_UPDATE")
			or (event == "UNIT_PET" and arg1 == "player")
			or (event == "PLAYER_CONTROL_LOST")
			or (event == "PLAYER_CONTROL_GAINED")
			or (event == "PLAYER_FARSIGHT_FOCUS_CHANGED")
			or (event == "UNIT_FLAGS")
			or (arg1 == "pet" and (event == "UNIT_AURA")) then
				CustomActionBars:UpdatePetBar()
		elseif event == "PET_BAR_UPDATE_COOLDOWN" then
			PetActionBar_UpdateCooldowns()
		else
			CustomActionBars:SkinPetButtons()
		end
	end)
end

function CustomActionBars:CreateStanceBar()
	local StanceBar = CustomActionBars.StanceBar

	local CustomStanceBarFrame = _G["StanceBarFrame"]
	CustomStanceBarFrame.ignoreFramePositionManager = true
    CustomStanceBarFrame:SetParent(StanceBar)
    CustomStanceBarFrame:ClearAllPoints()
    CustomStanceBarFrame:Point("TOPLEFT", StanceBar, "TOPLEFT", -7, 0)
    CustomStanceBarFrame:EnableMouse(false)

    for i = 1, NUM_STANCE_SLOTS do
	    local PreviousButton = _G["StanceButton"..i-1]
	    local Button = _G["StanceButton"..i]

	    if (i ~= 1) then
		    Button:ClearAllPoints()
		    Button:Point("LEFT", PreviousButton, "RIGHT", Spacing, 0)
	    else
		    Button:ClearAllPoints()
		    Button:Point("BOTTOMLEFT", StanceBar, "BOTTOMLEFT", Spacing, Spacing)
	    end
    end

	RegisterStateDriver(StanceBar, "visibility", "[vehicleui][petbattle] hide; show")

	StanceBar:RegisterEvent("PLAYER_ENTERING_WORLD")
	StanceBar:RegisterEvent("UPDATE_SHAPESHIFT_FORMS")
	StanceBar:RegisterEvent("UPDATE_SHAPESHIFT_USABLE")
	StanceBar:RegisterEvent("UPDATE_SHAPESHIFT_COOLDOWN")
	StanceBar:RegisterEvent("UPDATE_SHAPESHIFT_FORM")
	StanceBar:RegisterEvent("ACTIONBAR_PAGE_CHANGED")
	StanceBar:RegisterEvent("PLAYER_TALENT_UPDATE")
	StanceBar:RegisterEvent("SPELLS_CHANGED")
	StanceBar:SetScript("OnEvent", function(self, event, ...)
		if (event == "UPDATE_SHAPESHIFT_FORMS") then

		elseif (event == "PLAYER_ENTERING_WORLD") then
			CustomActionBars.UpdateStanceBar(self)
			CustomActionBars.SkinStanceButtons()
		else
			CustomActionBars.UpdateStanceBar(self)
		end
	end)

	RegisterStateDriver(StanceBar, "visibility", "[vehicleui][petbattle][overridebar] hide; show")
end

-------------------------
-- Extra Action Button --
-------------------------

function CustomActionBars:CreateExtraActionButton()
    for i = 1, ExtraActionBarFrame:GetNumChildren() do
        local Holder = CreateFrame("Frame", "ExtraActionButtonHolder", UIParent)
        Holder:Size(64, 64)
        Holder:Point("BOTTOM", UIParent, 0, 284)
		
        local ExtraBar = _G["ExtraActionBarFrame"]
	    local ExtraButton = _G["ExtraActionButton"..i]
		
		local ZoneBar = _G["ZoneAbilityFrame"]
	    local ZoneButton = ZoneAbilityFrame.SpellButton
	
	    ExtraBar:SetParent(UIParent)
	    ExtraBar:ClearAllPoints()
	    ExtraBar:SetPoint("CENTER", Holder, 0, 0)
	    ExtraBar.ignoreFramePositionManager = true
		
		ZoneBar:SetParent(UIParent)
	    ZoneBar:ClearAllPoints()
	    ZoneBar:SetPoint("CENTER", Holder, 0, 0)
	    ZoneBar.ignoreFramePositionManager = true
	
		if (self.IsSkinned) then
			return
		end
	
	    if (ExtraButton) then
			local Icon = _G["ExtraActionButton"..i.."Icon"]
		    Icon:SetTexCoord(unpack(A.TexCoords))
		
		    local Count = _G["ExtraActionButton"..i.."Count"]
		    Count:ClearAllPoints()
	        Count:Point("BOTTOMRIGHT", -2, 4)
	        Count:SetFontTemplate(C.Media.Font2, 14)
		
		    local Style = ExtraButton.style
		    Style:SetAlpha(0)
	
		    ExtraButton:SetNormalTexture("")
		    ExtraButton:StyleExtraButton()

		    ExtraButton.Panel = CreateFrame("Frame", "ExtraActionButtonPanel", ExtraButton)
	        ExtraButton.Panel:SetOutside(ExtraButton, 0, 0)
	        ExtraButton.Panel:SetTemplate(true, 52, 52)
	    end
	
        if (ZoneButton) then
		    local Icon = ZoneAbilityFrame.SpellButton.Icon
            Icon:SetTexCoord(unpack(A.TexCoords))
		
		    local Count = ZoneAbilityFrame.SpellButton.Count
		    Count:ClearAllPoints()
	        Count:Point("BOTTOMRIGHT", -2, 4)
	        Count:SetFontTemplate(C.Media.Font2, 14)
		
		    local Style = ZoneAbilityFrame.SpellButton.Style
			Style:SetAlpha(0)
		
            ZoneButton:SetNormalTexture("")
	        ZoneButton:StyleExtraButton()

		    ZoneButton.Panel = CreateFrame("Frame", "ZoneAbilityFrameButtonPanel", ZoneButton)
		    ZoneButton.Panel:SetOutside(ZoneButton, 0, 0)
			ZoneButton.Panel:SetTemplate(true, 52, 52)
	    end
		
		self.IsSkinned = true
	end
end

-------------------------
-- Vehicle Exit Button --
-------------------------

function CustomActionBars:CreateVehicleExitButton()
    if (self.VehicleExitButton) then
		return
	end

    local VehicleExitButton = CreateFrame("Button", "LeaveVehicleButton", UIParent)
    VehicleExitButton:Size(42, 40)
    VehicleExitButton:Point("LEFT", UIParent, 394, -256.5)
    VehicleExitButton:SetNormalTexture("Interface\\Vehicles\\UI-Vehicles-Button-Exit-Up")
    VehicleExitButton:SetHighlightTexture("Interface\\Vehicles\\UI-Vehicles-Button-Exit-Up")
	VehicleExitButton:SetAlpha(0)

	VehicleExitButton.Panel = CreateFrame("Frame", "VehicleExitButtonPanel", VehicleExitButton)
	VehicleExitButton.Panel:Point("CENTER", VehicleExitButton, 0, 0)
	VehicleExitButton.Panel:Size(28, 28)
	VehicleExitButton.Panel:SetTemplate(true, 28, 28)

    VehicleExitButton:RegisterEvent("PLAYER_ENTERING_WORLD")
    VehicleExitButton:RegisterEvent("UPDATE_BONUS_ACTIONBAR")
    VehicleExitButton:RegisterEvent("UPDATE_MULTI_CAST_ACTIONBAR")
    VehicleExitButton:RegisterEvent("UNIT_ENTERED_VEHICLE")
    VehicleExitButton:RegisterEvent("UNIT_EXITED_VEHICLE")
    VehicleExitButton:RegisterEvent("VEHICLE_UPDATE")
    VehicleExitButton:RegisterForClicks("AnyUp")

    VehicleExitButton:SetScript("OnClick", function(self)
	    if UnitOnTaxi("player") then
		    TaxiRequestEarlyLanding()
		    VehicleExitButtonPanel:SetColorTemplate(1, 0, 0)
	    else
		    VehicleExit()
		    VehicleExitButtonPanel:SetColorTemplate(1, 0, 0)
	    end
    end)

    VehicleExitButton:SetScript("OnEvent", function(self)
	    if CanExitVehicle() then
		    self:SetAlpha(1)
	    else
		    self:SetAlpha(0)
		    VehicleExitButtonPanel:SetColorTemplate(unpack(C.General.BorderColor))
	    end
    end)
	
	self.VehicleExitButton = VehicleExitButton
end

------------------
-- Range Plugin --
------------------

function CustomActionBars:RangeUpdate()
	local Icon = self.icon
	local NormalTexture = self.NormalTexture
	local ID = self.action

	if not (ID) then 
		return 
	end

	local IsUsable, NotEnoughMana = IsUsableAction(ID)
	local HasRange = ActionHasRange(ID)
	local InRange = IsActionInRange(ID)

	if (IsUsable) then -- Usable
		if (HasRange and InRange == false) then -- Out of range
			Icon:SetVertexColor(0.8, 0.1, 0.1)
			NormalTexture:SetVertexColor(0.8, 0.1, 0.1)
		else -- In range
			Icon:SetVertexColor(1.0, 1.0, 1.0)
			NormalTexture:SetVertexColor(1.0, 1.0, 1.0)
		end
	elseif (NotEnoughMana) then -- Not enough power
		Icon:SetVertexColor(0.1, 0.3, 1.0)
		NormalTexture:SetVertexColor(0.1, 0.3, 1.0)
	else -- Not usable
		Icon:SetVertexColor(0.3, 0.3, 0.3)
		NormalTexture:SetVertexColor(0.3, 0.3, 0.3)
	end
end

function CustomActionBars:RangeOnUpdate()
	if (not self.rangeTimer) then
		return
	end

	if (self.rangeTimer == TOOLTIP_UPDATE_TIME) then
		CustomActionBars.RangeUpdate(self)
	end
end

----------------------
-- Hook And OnEvent --
----------------------

function CustomActionBars:AddHooks()
    hooksecurefunc("ActionButton_Update", CustomActionBars.SkinButton)
    hooksecurefunc("ActionButton_UpdateFlyout", CustomActionBars.StyleFlyout)
    hooksecurefunc("SpellButton_OnClick", CustomActionBars.StyleFlyout)
    hooksecurefunc("ActionButton_ShowOverlayGlow", CustomActionBars.StartButtonHighlight)
    hooksecurefunc("ActionButton_HideOverlayGlow", CustomActionBars.StopButtonHighlight)
	hooksecurefunc("ActionButton_Update", CustomActionBars.RangeUpdate)
	hooksecurefunc("ActionButton_UpdateUsable", CustomActionBars.RangeUpdate)
	hooksecurefunc("ActionButton_OnUpdate", CustomActionBars.RangeOnUpdate)
end

CustomActionBars:RegisterEvent("PLAYER_LOGIN")
CustomActionBars:RegisterEvent("PLAYER_ENTERING_WORLD")
CustomActionBars:RegisterEvent("ADDON_LOADED")

CustomActionBars:SetScript("OnEvent", function(self, event)
    if (event == "PLAYER_LOGIN") then
		CustomActionBars:DisableBlizzard()
		CustomActionBars:CreateActionBars()
		CustomActionBars:CreateBar1()
		CustomActionBars:CreateBar2()
		CustomActionBars:CreateBar5()
		CustomActionBars:CreatePetBar()
		CustomActionBars:CreateStanceBar()
		CustomActionBars:CreateExtraActionButton()
		CustomActionBars:CreateVehicleExitButton()
		CustomActionBars:AddHooks()
	end
end)