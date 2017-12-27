local A, C, M, L = select(2, ...):unpack()

local CustomTooltip = CreateFrame("Frame")

local Tooltip = _G["GameTooltip"]
local TooltipStatusBar = _G["GameTooltipStatusBar"]

local ItemCloseButton = _G["ItemRefCloseButton"]
ItemCloseButton:SkinCloseButton(-5, -4)

CustomTooltip.Tooltips = {
	GameTooltip,
	FriendsTooltip,

	ItemRefTooltip,
	ItemRefShoppingTooltip1,
	ItemRefShoppingTooltip2,
	ItemRefShoppingTooltip3,

	WorldMapTooltip,
	WorldMapCompareTooltip1,
	WorldMapCompareTooltip2,
	WorldMapCompareTooltip3,

	ShoppingTooltip1,
	ShoppingTooltip2,
	ShoppingTooltip3,
	
	--PVPRewardTooltipTooltip,
	--PVPRewardTooltip,
	QueueStatusFrame,
	
	GarrisonBonusAreaTooltip,
	GarrisonFollowerTooltip,
	GarrisonFollowerAbilityTooltip,
	GarrisonMissionMechanicTooltip,
	GarrisonMissionMechanicFollowerCounterTooltip,
	GarrisonShipyardMapMissionTooltip,
	GarrisonShipyardFollowerTooltip,
	FloatingGarrisonShipyardFollowerTooltip,
	FloatingGarrisonFollowerTooltip,
	FloatingGarrisonFollowerAbilityTooltip,
	
	PetBattlePrimaryAbilityTooltip,
	PetBattlePrimaryUnitTooltip,
	BattlePetTooltip,
	FloatingBattlePetTooltip,
	FloatingPetBattleAbilityTooltip,
	
	AutoCompleteBox,
	ChatMenu,
	EmoteMenu,
	LanguageMenu,
	VoiceMacroMenu,
}

function CustomTooltip:StyleDropDownMenu()	
	for i = 1, UIDROPDOWNMENU_MAXLEVELS do
		local DropDrownMenu = _G["DropDownList"..i.."MenuBackdrop"]
		local DropDownBackdrop = _G["DropDownList"..i.."Backdrop"]

		if not (DropDownBackdrop.IsSkinned) then
			DropDrownMenu:CreateBackdrop()
		
			DropDownBackdrop.IsSkinned = true
		end
	end
end

function CustomTooltip:GetFormattedUnitType(Unit)
	local CreatureType = UnitCreatureType(Unit)

	if (CreatureType) then
		return CreatureType
	else
		return ""
	end
end

function CustomTooltip:GetFormattedUnitClassification(Unit)
	local UnitClassification = UnitClassification(Unit)

	if (UnitClassification == "worldboss") then
		return "|CFFFF0000" .. BOSS .. "|r "
	elseif (UnitClassification == "rareelite") then
		return "|CFFFF66CCRare|r |cffFFFF00" .. ELITE .. "|r "
	elseif (UnitClassification == "rare") then 
		return "|CFFFF66CCRare|r " 
	elseif (UnitClassification == "elite") then
		return "|CFFFFFF00" .. ELITE .. "|r "
	else
		return ""
	end
end

function CustomTooltip:GetFormattedUnitLevel(Unit)
	local DifficultyColor = GetQuestDifficultyColor(UnitLevel(Unit))
	
	if (UnitLevel(Unit) == -1) then
		return "|CFFFF0000??|r "
	elseif (UnitLevel(Unit) == 0) then
		return "? "
	else
		return format("|CFF%02x%02x%02x%s|r ", DifficultyColor.r*255, DifficultyColor.g*255, DifficultyColor.b*255, UnitLevel(Unit))
	end
end

function CustomTooltip:GetFormattedUnitClass(Unit)
	local Class = select(2, UnitClass(Unit))
	local CustomClassColor = A.Colors.class[Class]

	if (Class) then
		return format(" |CFF%02x%02x%02x%s|r", CustomClassColor[1]*255, CustomClassColor[2]*255, CustomClassColor[3]*255, UnitClass(Unit))
	end
end

function CustomTooltip:GetFormattedUnitString(Unit)
	local UnitIsPlayer = UnitIsPlayer(Unit)

	if (UnitIsPlayer) then
		return CustomTooltip:GetFormattedUnitLevel(Unit) .. UnitRace(Unit) .. CustomTooltip:GetFormattedUnitClass(Unit)
	else
		return CustomTooltip:GetFormattedUnitLevel(Unit) .. CustomTooltip:GetFormattedUnitClassification(Unit) .. CustomTooltip:GetFormattedUnitType(Unit)
	end
end

function CustomTooltip:TooltipGetColor(Unit)
	if (not Unit) then
		return
	end

	if (UnitIsPlayer(Unit) and not UnitHasVehicleUI(Unit)) then
		local Class = select(2, UnitClass(Unit))
		local Color = A.Colors.class[Class]
		
		if (not Color) then
			return
		end

		local Hex = A.RGBToHex(unpack(Color))
		return Hex, Color.r, Color.g, Color.b
	else
		local Reaction = UnitReaction(Unit, "player")
		local Color = A.Colors.reaction[Reaction]
		
		if (not Color) then
			return
		end

		local Hex = A.RGBToHex(unpack(Color))
		return Hex, Color.r, Color.g, Color.b
	end
end

function CustomTooltip:UpdateStatusBar(self)
	local _, Unit = Tooltip:GetUnit()
	
	if (not Unit) then
		return
	end
	
	local UnitIsPlayer = Unit and UnitIsPlayer(Unit)
	local UnitIsFriend = Unit and UnitIsFriend(Unit, "player")
	local UnitIsDead = Unit and UnitIsDead(Unit)
	local UnitIsGhost = Unit and UnitIsGhost(Unit)
	local UnitIsTapDenied = Unit and UnitIsTapDenied(Unit)
	local Reaction = Unit and UnitReaction(Unit, "player")

	local Class = select(2, UnitClass(Unit))
	local CustomClassColor = A.Colors.class[Class]
	local ReactionColor = A.Colors.reaction[Reaction]
	
	if (TooltipStatusBar) then
		if (UnitIsPlayer and UnitIsFriend) then
			if (Class) then
				TooltipStatusBar:SetStatusBarColor(unpack(CustomClassColor))
				TooltipStatusBar:SetBackdropColor(CustomClassColor[1]*0.5, CustomClassColor[2]*0.5, CustomClassColor[3]*0.5)
			end
		elseif (UnitIsDead or UnitIsGhost or UnitIsTapDenied) then
			TooltipStatusBar:SetStatusBarColor(0.5, 0.5, 0.5)
			TooltipStatusBar:SetBackdropColor(0.5*0.5, 0.5*0.5, 0.5*0.5)
		elseif (Reaction) then
			TooltipStatusBar:SetStatusBarColor(unpack(ReactionColor))
			TooltipStatusBar:SetBackdropColor(ReactionColor[1]*0.5, ReactionColor[2]*0.5, ReactionColor[3]*0.5)
		end
	end
end

function CustomTooltip:UpdateTooltip(...)
	local GetMouseFocus = GetMouseFocus()
	local Unit = (select(2, self:GetUnit())) or (GetMouseFocus and GetMouseFocus.GetAttribute and GetMouseFocus:GetAttribute("unit"))
	
	if (not Unit) and (UnitExists("mouseover")) then
		Unit = ("mouseover")
	end
	
	if (not Unit) then
		self:Hide()
		return
	end
	
	if (UnitIsUnit(Unit, "mouseover")) then
		Unit = "mouseover"
	end
	
	local Name, Realm = UnitName(Unit)
	local UnitIsPlayer = UnitIsPlayer(Unit)
	local UnitIsAFK = UnitIsAFK(Unit)
	local UnitIsDND = UnitIsDND(Unit)
	local GInfo = GetGuildInfo(Unit)
	local GetGuildInfoPlayer = GetGuildInfo("player")
	local Relationship = UnitRealmRelationship(Unit)
	local Color = CustomTooltip:TooltipGetColor(Unit)
	
	local Line1 = _G["GameTooltipTextLeft1"]
	local Line2 = _G["GameTooltipTextLeft2"]

	if (not Color) then
		Color = ("|CFFFFFFFF")
	end

	if (UnitIsPlayer) then
		if (Realm and Realm ~= "") then
			if (Relationship == LE_REALM_RELATION_COALESCED) then
				Name = Name .. FOREIGN_SERVER_LABEL .. " - " .. Realm
			elseif (Relationship == LE_REALM_RELATION_VIRTUAL) then
				Name = Name .. INTERACTIVE_SERVER_LABEL .. " - " .. Realm
			end
		end
	end

	if (Name) then
		Line1:SetFormattedText("%s%s%s", Color, Name, "|r")
	end

	if (GInfo) then
		if GInfo == GetGuildInfoPlayer and GetGuildInfoPlayer then
			Line2:SetText("|CFFFF66CC<" .. Line2:GetText() ..">|r")
		else
			Line2:SetText("|CFFFFFFFF<" .. Line2:GetText() .. ">|r")
		end
	end

	for i = 2, Tooltip:NumLines() do
		local Line = _G["GameTooltipTextLeft"..i]
		if Line:GetText():find("^" .. TOOLTIP_UNIT_LEVEL:gsub("%%s", ".+")) then
			Line:SetText(CustomTooltip:GetFormattedUnitString(Unit))
		end
	end
	
	for i = 3, Tooltip:NumLines() do
		local Line = _G["GameTooltipTextLeft"..i]
		if Line:GetText():find(PVP_ENABLED) then
			Line1:SetText("|CFFFFFFFF#PvP |r" .. Line1:GetText())
		end
	end

	if (UnitIsAFK) then 
		self:AppendText(" |CFF707070#AFK|r")
	elseif (UnitIsDND) then
		self:AppendText(" |CFFFFFF00#DND|r")
	end

	if TooltipStatusBar:IsShown() then
		self:AddLine(" ")
	end
	
	TooltipStatusBar:ClearAllPoints()
	TooltipStatusBar:Point("LEFT", self:GetName() .. "TextLeft" .. self:NumLines(), 1, -4)
	TooltipStatusBar:Point("RIGHT", self, -10, 0)
	TooltipStatusBar:SetHeight(8)
    TooltipStatusBar:SetStatusBarTexture("Interface\\Buttons\\WHITE8x8")
    TooltipStatusBar:CreateBackdrop()
	
	CustomTooltip:UpdateStatusBar(TooltipStatusBar)
	
	if not (TooltipStatusBar.IsValueHooked) then
		TooltipStatusBar:HookScript("OnValueChanged", CustomTooltip.UpdateStatusBar)
	
		TooltipStatusBar.IsValueHooked = true
	end
end

function CustomTooltip:SetTooltipAnchor(parent)
	self:ClearAllPoints()
	
	if (C.Tooltip.TooltipOnMouseOver) then
		self:SetOwner(parent, "ANCHOR_CURSOR")
	else
		self:Point("BOTTOMRIGHT", UIParent, -7.5, 172)
	end
	
	--if (C.Tooltip.HideTooltipInCombat) then 
	--    if InCombatLockdown() then
	--		self:Hide()
	--	end
	--end
end

function CustomTooltip:UpdateBackdropColor()
	self:SetBackdropColor(unpack(C.General.BackdropColor))
end

function CustomTooltip:Skin(self)
	if (not self.IsSkinned) then
		self:CreateBackdrop()
		
		self.IsSkinned = true
	end

	self:HookScript("OnShow", CustomTooltip.UpdateBackdropColor)
	self:HookScript("OnHide", CustomTooltip.UpdateBackdropColor)
	self:HookScript("OnUpdate", CustomTooltip.UpdateBackdropColor)
end

function CustomTooltip:AddHooks()
	hooksecurefunc("UIDropDownMenu_CreateFrames", self.StyleDropDownMenu)
	hooksecurefunc("GameTooltip_SetDefaultAnchor", self.SetTooltipAnchor)
end

function CustomTooltip:Enable()
	if not (C.Tooltip.TooltipMod) then
		return
	end

	Tooltip:HookScript("OnTooltipSetUnit", self.UpdateTooltip)
	
	for _, Tooltips in pairs(CustomTooltip.Tooltips) do
		if (Tooltips.BackdropFrame) then Tooltips.BackdropFrame:Kill() end
		if (Tooltips.BorderTop) then Tooltips.BorderTop:Hide() end
		if (Tooltips.BorderTopLeft) then Tooltips.BorderTopLeft:Hide() end
		if (Tooltips.BorderTopRight) then Tooltips.BorderTopRight:Hide() end
		if (Tooltips.BorderBottomLeft) then Tooltips.BorderBottomLeft:Hide() end
		if (Tooltips.BorderBottomRight) then Tooltips.BorderBottomRight:Hide() end
		if (Tooltips.BorderLeft) then Tooltips.BorderLeft:Hide() end
		if (Tooltips.BorderRight) then Tooltips.BorderRight:Hide() end
		if (Tooltips.BorderBottom) then Tooltips.BorderBottom:Hide() end
		if (Tooltips.Background) then Tooltips.Background:Hide() end
	
		CustomTooltip:Skin(Tooltips)
	end

    self:AddHooks()
end

CustomTooltip:RegisterEvent("PLAYER_LOGIN")
CustomTooltip:RegisterEvent("PLAYER_ENTERING_WORLD")
CustomTooltip:RegisterEvent("ADDON_LOADED")

CustomTooltip:SetScript("OnEvent", function(self, event)
	if (event == "PLAYER_LOGIN") then
		self:Enable()
	end
end)