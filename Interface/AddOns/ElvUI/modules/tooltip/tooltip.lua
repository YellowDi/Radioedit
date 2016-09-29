local E, L, V, P, G = unpack(select(2, ...)); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB
local TT = E:NewModule('Tooltip', 'AceTimer-3.0', 'AceHook-3.0', 'AceEvent-3.0')
local rc = LibStub("LibRangeCheck-2.0")
local ItemUpgradeInfo = LibStub("LibItemUpgradeInfo-1.0")
--Cache global variables
--Lua functions
local _G = _G
local unpack, tonumber, select, pairs = unpack, tonumber, select, pairs
local twipe, tinsert, tconcat = table.wipe, table.insert, table.concat
local floor = math.floor
local find, format, sub = string.find, string.format, string.sub
--WoW API / Variables
local CanInspect = CanInspect
local CreateFrame = CreateFrame
local C_PetJournalGetPetTeamAverageLevel = C_PetJournal.GetPetTeamAverageLevel
local GameTooltip_ClearMoney = GameTooltip_ClearMoney
local GetAverageItemLevel = GetAverageItemLevel
local GetGuildInfo = GetGuildInfo
local GetInspectSpecialization = GetInspectSpecialization
local GetInventoryItemLink = GetInventoryItemLink
local GetInventorySlotInfo = GetInventorySlotInfo
local GetItemCount = GetItemCount
local GetMouseFocus = GetMouseFocus
local GetNumGroupMembers = GetNumGroupMembers
local GetQuestDifficultyColor = GetQuestDifficultyColor
local GetRaidBuffTrayAuraInfo = GetRaidBuffTrayAuraInfo
local GetRelativeDifficultyColor = GetRelativeDifficultyColor
local GetScreenWidth = GetScreenWidth
local GetSpecialization = GetSpecialization
local GetSpecializationInfo = GetSpecializationInfo
local GetSpecializationInfoByID = GetSpecializationInfoByID
local GetSpecializationRoleByID = GetSpecializationRoleByID
local GetTime = GetTime
local InCombatLockdown = InCombatLockdown
local IsAltKeyDown = IsAltKeyDown
local IsControlKeyDown = IsControlKeyDown
local IsInGroup = IsInGroup
local IsInRaid = IsInRaid
local IsShiftKeyDown = IsShiftKeyDown
local NotifyInspect = NotifyInspect
local SetTooltipMoney = SetTooltipMoney
local UnitAura = UnitAura
local UnitBattlePetLevel = UnitBattlePetLevel
local UnitBattlePetType = UnitBattlePetType
local UnitClass = UnitClass
local UnitClassification = UnitClassification
local UnitCreatureType = UnitCreatureType
local UnitExists = UnitExists
local UnitFactionGroup = UnitFactionGroup
local UnitGUID = UnitGUID
local UnitHasVehicleUI = UnitHasVehicleUI
local UnitIsAFK = UnitIsAFK
local UnitIsBattlePetCompanion = UnitIsBattlePetCompanion
local UnitIsDeadOrGhost = UnitIsDeadOrGhost
local UnitIsDND = UnitIsDND
local UnitIsPlayer = UnitIsPlayer
local UnitIsPVP = UnitIsPVP
local UnitIsTapDenied = UnitIsTapDenied
local UnitIsTapDeniedByPlayer = UnitIsTapDeniedByPlayer
local UnitIsUnit = UnitIsUnit
local UnitIsWildBattlePet = UnitIsWildBattlePet
local UnitLevel = UnitLevel
local UnitName = UnitName
local UnitPVPName = UnitPVPName
local UnitRace = UnitRace
local UnitReaction = UnitReaction
local UnitRealmRelationship = UnitRealmRelationship
local CUSTOM_CLASS_COLORS = CUSTOM_CLASS_COLORS
local DEAD = DEAD
local FACTION_ALLIANCE = FACTION_ALLIANCE
local FACTION_BAR_COLORS = FACTION_BAR_COLORS
local FACTION_HORDE = FACTION_HORDE
local FOREIGN_SERVER_LABEL = FOREIGN_SERVER_LABEL
local ID = ID
local INTERACTIVE_SERVER_LABEL = INTERACTIVE_SERVER_LABEL
local LEVEL = LEVEL
local LE_REALM_RELATION_COALESCED = LE_REALM_RELATION_COALESCED
local LE_REALM_RELATION_VIRTUAL = LE_REALM_RELATION_VIRTUAL
local PET_TYPE_SUFFIX = PET_TYPE_SUFFIX
local PVP = PVP
local RAID_CLASS_COLORS = RAID_CLASS_COLORS
local TARGET = TARGET
local C_MountJournal_GetNumMounts = C_MountJournal.GetNumMounts
local C_MountJournal_GetMountInfo = C_MountJournal.GetMountInfoByID
local C_MountJournal_GetMountInfoExtra = C_MountJournal.GetMountInfoExtraByID
--Global variables that we don't cache, list them here for mikk's FindGlobals script
-- GLOBALS: ElvUI_ContainerFrame, RightChatPanel, TooltipMover, UIParent, ElvUI_KeyBinder
-- GLOBALS: ItemRefCloseButton, RightChatToggleButton, BNToastFrame, MMHolder, GameTooltipText
-- GLOBALS: BNETMover, ItemRefTooltip, InspectFrame,  GameTooltipHeaderText, GameTooltipTextSmall
-- GLOBALS: ShoppingTooltip1TextLeft1, ShoppingTooltip1TextLeft2, ShoppingTooltip1TextLeft3
-- GLOBALS: ShoppingTooltip1TextLeft4, ShoppingTooltip1TextRight1, ShoppingTooltip1TextRight2
-- GLOBALS: ShoppingTooltip1TextRight3, ShoppingTooltip1TextRight4, ShoppingTooltip2TextLeft1
-- GLOBALS: ShoppingTooltip2TextLeft2, ShoppingTooltip2TextLeft3, ShoppingTooltip2TextLeft4
-- GLOBALS: ShoppingTooltip2TextRight1, ShoppingTooltip2TextRight2, ShoppingTooltip2TextRight3
-- GLOBALS: ShoppingTooltip2TextRight4, GameTooltipTextLeft1, GameTooltipTextLeft2

local GameTooltip, GameTooltipStatusBar = _G["GameTooltip"], _G["GameTooltipStatusBar"]
local S_ITEM_LEVEL = ITEM_LEVEL:gsub( "%%d", "(%%d+)" )
local playerGUID --Will be set in Initialize
local targetList, inspectCache = {}, {}
local NIL_COLOR = { r=1, g=1, b=1 }
local TAPPED_COLOR = { r=.6, g=.6, b=.6 }
local AFK_LABEL = " |cffFFFFFF[|r|cffFF0000"..L["AFK"].."|r|cffFFFFFF]|r"
local DND_LABEL = " |cffFFFFFF[|r|cffFFFF00"..L["DND"].."|r|cffFFFFFF]|r"
local keybindFrame

local tooltips = {
	GameTooltip,
	ItemRefTooltip,
	ItemRefShoppingTooltip1,
	ItemRefShoppingTooltip2,
	ItemRefShoppingTooltip3,
	AutoCompleteBox,
	FriendsTooltip,
	ShoppingTooltip1,
	ShoppingTooltip2,
	ShoppingTooltip3,

	WorldMapTooltip.BackdropFrame, --Set template on backdrop because it is resized to cover potential item tooltips on worldmap
	WorldMapCompareTooltip1,
	WorldMapCompareTooltip2,
	WorldMapCompareTooltip3,
	DropDownList1MenuBackdrop,
	DropDownList2MenuBackdrop,
	DropDownList3MenuBackdrop,
	BNToastFrame
}

--- PVP Item Detect ---
local function IsPVPItem(link)
	local itemStats = GetItemStats(link)

	for stat in pairs(itemStats) do
		if (stat == 'ITEM_MOD_RESILIENCE_RATING_SHORT') or (stat == 'ITEM_MOD_PVP_POWER_SHORT') then
			return true
		end
	end

	return false
end

local classification = {
	worldboss = format("|cffAF5050 %s|r", BOSS),
	rareelite = format("|cffAF5050+ %s|r", ITEM_QUALITY3_DESC),
	elite = "|cffAF5050+|r",
	rare = format("|cffAF5050 %s|r", ITEM_QUALITY3_DESC)
}

local SlotName = {
	"Head","Neck","Shoulder","Back","Chest","Wrist",
	"Hands","Waist","Legs","Feet","Finger0","Finger1",
	"Trinket0","Trinket1","MainHand","SecondaryHand"
}

--All this does is increase the spacing between tooltips when you compare items
function TT:GameTooltip_ShowCompareItem(tt, shift)
	if ( not tt ) then
		tt = GameTooltip;
	end
	local item, link = tt:GetItem();
	if ( not link ) then
		return;
	end

	local shoppingTooltip1, shoppingTooltip2, shoppingTooltip3 = unpack(tt.shoppingTooltips);

	local item1 = nil;
	local item2 = nil;
	local item3 = nil;
	local side = "left";
	if ( shoppingTooltip1:SetHyperlinkCompareItem(link, 1, shift, tt) ) then
		item1 = true;
	end
	if ( shoppingTooltip2:SetHyperlinkCompareItem(link, 2, shift, tt) ) then
		item2 = true;
	end
	if ( shoppingTooltip3:SetHyperlinkCompareItem(link, 3, shift, tt) ) then
		item3 = true;
	end

	-- find correct side
	local rightDist = 0;
	local leftPos = tt:GetLeft();
	local rightPos = tt:GetRight();
	if ( not rightPos ) then
		rightPos = 0;
	end
	if ( not leftPos ) then
		leftPos = 0;
	end

	rightDist = GetScreenWidth() - rightPos;

	if (leftPos and (rightDist < leftPos)) then
		side = "left";
	else
		side = "right";
	end

	-- see if we should slide the tooltip
	if ( tt:GetAnchorType() and tt:GetAnchorType() ~= "ANCHOR_PRESERVE" ) then
		local totalWidth = 0;
		if ( item1  ) then
			totalWidth = totalWidth + shoppingTooltip1:GetWidth();
		end
		if ( item2  ) then
			totalWidth = totalWidth + shoppingTooltip2:GetWidth();
		end
		if ( item3  ) then
			totalWidth = totalWidth + shoppingTooltip3:GetWidth();
		end

		if ( (side == "left") and (totalWidth > leftPos) ) then
			tt:SetAnchorType(tt:GetAnchorType(), (totalWidth - leftPos), 0);
		elseif ( (side == "right") and (rightPos + totalWidth) >  GetScreenWidth() ) then
			tt:SetAnchorType(tt:GetAnchorType(), -((rightPos + totalWidth) - GetScreenWidth()), 0);
		end
	end

	-- anchor the compare tooltips
	if ( item3 ) then
		shoppingTooltip3:SetOwner(tt, "ANCHOR_NONE");
		shoppingTooltip3:ClearAllPoints();
		if ( side and side == "left" ) then
			shoppingTooltip3:Point("TOPRIGHT", tt, "TOPLEFT", -2, -10);
		else
			shoppingTooltip3:Point("TOPLEFT", tt, "TOPRIGHT", 2, -10);
		end
		shoppingTooltip3:SetHyperlinkCompareItem(link, 3, shift, tt);
		shoppingTooltip3:Show();
	end

	if ( item1 ) then
		if( item3 ) then
			shoppingTooltip1:SetOwner(shoppingTooltip3, "ANCHOR_NONE");
		else
			shoppingTooltip1:SetOwner(tt, "ANCHOR_NONE");
		end
		shoppingTooltip1:ClearAllPoints();
		if ( side and side == "left" ) then
			if( item3 ) then
				shoppingTooltip1:Point("TOPRIGHT", shoppingTooltip3, "TOPLEFT", -2, 0);
			else
				shoppingTooltip1:Point("TOPRIGHT", tt, "TOPLEFT", -2, -10);
			end
		else
			if( item3 ) then
				shoppingTooltip1:Point("TOPLEFT", shoppingTooltip3, "TOPRIGHT", 2, 0);
			else
				shoppingTooltip1:Point("TOPLEFT", tt, "TOPRIGHT", 2, -10);
			end
		end
		shoppingTooltip1:SetHyperlinkCompareItem(link, 1, shift, tt);
		shoppingTooltip1:Show();

		if ( item2 ) then
			shoppingTooltip2:SetOwner(shoppingTooltip1, "ANCHOR_NONE");
			shoppingTooltip2:ClearAllPoints();
			if ( side and side == "left" ) then
				shoppingTooltip2:Point("TOPRIGHT", shoppingTooltip1, "TOPLEFT", -2, 0);
			else
				shoppingTooltip2:Point("TOPLEFT", shoppingTooltip1, "TOPRIGHT", 2, 0);
			end
			shoppingTooltip2:SetHyperlinkCompareItem(link, 2, shift, tt);
			shoppingTooltip2:Show();
		end
	end
end

function TT:GameTooltip_SetDefaultAnchor(tt, parent)
	if E.private.tooltip.enable ~= true then return end
	if not self.db.visibility then return; end

	if(tt:GetAnchorType() ~= "ANCHOR_NONE") then return end
	if InCombatLockdown() and self.db.visibility.combat then
		tt:Hide()
		return
	end

	local ownerName = tt:GetOwner() and tt:GetOwner().GetName and tt:GetOwner():GetName()
	if (self.db.visibility.actionbars ~= 'NONE' and ownerName and (find(ownerName, "ElvUI_Bar") or find(ownerName, "ElvUI_StanceBar") or find(ownerName, "PetAction")) and not keybindFrame.active) then
		local modifier = self.db.visibility.actionbars

		if(modifier == 'ALL' or not ((modifier == 'SHIFT' and IsShiftKeyDown()) or (modifier == 'CTRL' and IsControlKeyDown()) or (modifier == 'ALT' and IsAltKeyDown()))) then
			tt:Hide()
			return
		end
	end

	if(parent) then
		if(self.db.cursorAnchor) then
			tt:SetOwner(parent, "ANCHOR_CURSOR_RIGHT", self.db.offsetX, self.db.offsetY)
			if(not GameTooltipStatusBar.anchoredToTop) then
				GameTooltipStatusBar:ClearAllPoints()
				GameTooltipStatusBar:Point("BOTTOMLEFT", GameTooltip, "TOPLEFT", E.Border, (E.Spacing * 3))
				GameTooltipStatusBar:Point("BOTTOMRIGHT", GameTooltip, "TOPRIGHT", -E.Border, (E.Spacing * 3))
				GameTooltipStatusBar.text:Point("CENTER", GameTooltipStatusBar, 0, 3)
				GameTooltipStatusBar.anchoredToTop = true
			end
			return
		else
			tt:SetOwner(parent, "ANCHOR_NONE")
			if(GameTooltipStatusBar.anchoredToTop) then
				GameTooltipStatusBar:ClearAllPoints()
				GameTooltipStatusBar:Point("TOPLEFT", GameTooltip, "BOTTOMLEFT", E.Border, -(E.Spacing * 3))
				GameTooltipStatusBar:Point("TOPRIGHT", GameTooltip, "BOTTOMRIGHT", -E.Border, -(E.Spacing * 3))
				GameTooltipStatusBar.text:Point("CENTER", GameTooltipStatusBar, 0, -3)
				GameTooltipStatusBar.anchoredToTop = nil
			end
		end
	end

	local _, anchor = tt:GetPoint()
	if (anchor == nil or (ElvUI_ContainerFrame and anchor == ElvUI_ContainerFrame) or anchor == RightChatPanel or anchor == TooltipMover or anchor == UIParent or anchor == E.UIParent) then
		tt:ClearAllPoints()
		if(not E:HasMoverBeenMoved('TooltipMover')) then
			if ElvUI_ContainerFrame and ElvUI_ContainerFrame:IsShown() then
				tt:Point('BOTTOMRIGHT', ElvUI_ContainerFrame, 'TOPRIGHT', 0, 18)
			elseif RightChatPanel:GetAlpha() == 1 and RightChatPanel:IsShown() then
				tt:Point('BOTTOMRIGHT', RightChatPanel, 'TOPRIGHT', 0, 18)
			else
				tt:Point('BOTTOMRIGHT', RightChatPanel, 'BOTTOMRIGHT', 0, 18)
			end
		else
			local point = E:GetScreenQuadrant(TooltipMover)
			if point == "TOPLEFT" then
				tt:Point("TOPLEFT", TooltipMover, "BOTTOMLEFT", 1, -4)
			elseif point == "TOPRIGHT" then
				tt:Point("TOPRIGHT", TooltipMover, "BOTTOMRIGHT", -1, -4)
			elseif point == "BOTTOMLEFT" or point == "LEFT" then
				tt:Point("BOTTOMLEFT", TooltipMover, "TOPLEFT", 1, 18)
			else
				tt:Point("BOTTOMRIGHT", TooltipMover, "TOPRIGHT", -1, 18)
			end
		end
	end
end

function TT:GetItemLvL(unit)
	local total, item, boa, pvp = 0, 15, 0, 0 --装备总数默认15件，双持职业就+1
	local ulvl = UnitLevel(unit)
	local not2hand
	local findItem = 0
	local itemM, itemS, itemMlv, itemSlv, itemMMax
	
	itemM = GetInventoryItemLink(unit, 16)
	itemS = GetInventoryItemLink(unit, 17)
	itemMlv = itemM and ItemUpgradeInfo:GetUpgradedItemLevel(itemM) or 0
	itemSlv = itemS and ItemUpgradeInfo:GetUpgradedItemLevel(itemS) or 0
	itemMMax = (itemMlv > itemSlv) and itemMlv or itemSlv

	for i = 1, #SlotName do
		local slotLink = GetInventoryItemLink(unit, GetInventorySlotInfo(("%sSlot"):format(SlotName[i])))
		if (slotLink ~= nil) then
			local _, _, quality, ilvl, _, _, _, _,ItemEquipLoc = GetItemInfo(slotLink)
			if ilvl ~= nil then
				if quality == 7 then
					boa = boa + 1
				elseif IsPVPItem(slotLink) then
					pvp = pvp + 1
				end
				if quality == 6 and ilvl == 750 and (SlotName[i] == "SecondaryHand" or SlotName[i] == "MainHand") then --修正神器副手itemLink字串不含升级物品信息的问题
					total = total + itemMMax
				else
					total = total + ItemUpgradeInfo:GetUpgradedItemLevel(slotLink)
				end
			end

			if ((SlotName[i] == 'SecondaryHand') or (SlotName[i] == 'MainHand' and ItemEquipLoc ~= "INVTYPE_2HWEAPON" and ItemEquipLoc ~= "INVTYPE_RANGED" and ItemEquipLoc ~= "INVTYPE_RANGEDRIGHT")) and not not2hand then
				item = item + 1
				not2hand = true
			end	
			findItem = findItem + 1
		end
	end

	if (total < 1 or findItem < 15) then
		return
	end
	
	return ('%.1f'):format(total / item), boa, pvp;
end

function TT:RemoveTrashLines(tt)
	for i=3, tt:NumLines() do
		local tiptext = _G["GameTooltipTextLeft"..i]
		local linetext = tiptext:GetText()

		if(linetext == PVP or linetext == FACTION_ALLIANCE or linetext == FACTION_HORDE) then
			tiptext:SetText(nil)
			tiptext:Hide()
		end
	end
end

function TT:GetLevelLine(tt, offset)
	for i=offset, tt:NumLines() do
		local tipText = _G["GameTooltipTextLeft"..i]
		if(tipText:GetText() and tipText:GetText():find(LEVEL)) then
			return tipText
		end
	end
end

function TT:GetTalentSpec(unit, isPlayer)
	local spec
	if(isPlayer) then
		spec = GetSpecialization()
	else
		spec = GetInspectSpecialization(unit)
	end
	if(spec ~= nil and spec > 0) then
		if(not isPlayer) then
			local role = GetSpecializationRoleByID(spec);
			if(role ~= nil) then
				local _, name = GetSpecializationInfoByID(spec);
				return name
			end
		else
			local _, name = GetSpecializationInfo(spec)

			return name
		end
	end
end

function TT:INSPECT_READY(event, GUID)
	if(self.lastGUID ~= GUID) then return end

	local unit = "mouseover"
	if(UnitExists(unit)) then
		local itemLevel, boa, pvp = self:GetItemLvL(unit)
		local talentName = self:GetTalentSpec(unit)
		inspectCache[GUID] = {time = GetTime()}

		if(talentName) then
			inspectCache[GUID].talent = talentName
		end

		if(itemLevel) then
			inspectCache[GUID].itemLevel = itemLevel
			inspectCache[GUID].boa = boa
			inspectCache[GUID].pvp = pvp
		end

		GameTooltip:SetUnit(unit)
	end
	self:UnregisterEvent("INSPECT_READY")
end

function TT:ShowInspectInfo(tt, unit, level, r, g, b, numTries)
	local canInspect = CanInspect(unit)
	if(not canInspect or level < 10 or numTries > 1) then return end

	local GUID = UnitGUID(unit)
	if(GUID == playerGUID) then
		tt:AddDoubleLine(L["Current Talent"]..":", self:GetTalentSpec(unit, true), nil, nil, nil, r, g, b)
		tt:AddDoubleLine(L["AvgItemLvl"]..":", floor(select(2, GetAverageItemLevel())), nil, nil, nil, 1, 1, 1)		
	elseif(inspectCache[GUID]) then
		local talent = inspectCache[GUID].talent
		local boa = inspectCache[GUID].boa or 0
		local pvp = inspectCache[GUID].pvp or 0
		local itemLevel = inspectCache[GUID].itemLevel

		if(((GetTime() - inspectCache[GUID].time) > 900) or not talent or not itemLevel) then
			inspectCache[GUID] = nil

			return self:ShowInspectInfo(tt, unit, level, r, g, b, numTries + 1)
		end
		tt:AddDoubleLine(L["Current Talent"]..":", talent, nil, nil, nil, r, g, b)
		local levelstr = tostring(itemLevel)
		if boa and boa > 0 then levelstr = levelstr.. "|cffe6cc80(".. boa.. " BOA)|r" end
		if pvp and pvp > 0 then levelstr = levelstr.. "|cffa335ee(".. pvp.. " PVP)|r" end

		tt:AddDoubleLine(L["AvgItemLvl"]..":", levelstr, nil, nil, nil, 1, 1, 1)
	else
		if(not canInspect) or (InspectFrame and InspectFrame:IsShown()) then return end
		self.lastGUID = GUID
		NotifyInspect(unit)
		self:RegisterEvent("INSPECT_READY")
	end
end

local function RGB(r, g, b)
	return string.format("%02x%02x%02x", r*255, g*255, b*255);	
end

local function GetRangeColorText(minRange, maxRange)
	local color, text;
	if (minRange) then
		if (minRange > 100) then
			maxRange = nil;
		end		
		
		if (maxRange) then
			local tmpText = format("%d-%d %s", minRange, maxRange, L["Yard"]);		
	
			if ( maxRange <= 5) then
				color = RGB(0.9, 0.9, 0.9);
			elseif (maxRange <= 20) then
				color = RGB(0.055, 0.875, 0.825);
			elseif (maxRange <= 30) then
				color = RGB(0.035, 0.865, 0.0);
			elseif (minRange >= 40) then
				color = RGB(0.9, 0.055, 0.075);
			else
				color = RGB(1.0, 0.82, 0);
			end
			
			text = format("|cff%s%s|r", color, tmpText);
		end
	end
	
	return text;
end

local ReactionName = {'Hated','Hostile','Unfriendly','Neutral','Friendly','Honored','Revered','Exalted'}

function TT:GameTooltip_OnTooltipSetUnit(tt)
	local unit = select(2, tt:GetUnit())
	if((tt:GetOwner() ~= UIParent) and self.db.visibility.unitFrames ~= 'NONE') then
		local modifier = self.db.visibility.unitFrames

		if(modifier == 'ALL' or not ((modifier == 'SHIFT' and IsShiftKeyDown()) or (modifier == 'CTRL' and IsControlKeyDown()) or (modifier == 'ALT' and IsAltKeyDown()))) then
			tt:Hide()
			return
		end
	end

	if(not unit) then
		local GMF = GetMouseFocus()
		if(GMF and GMF:GetAttribute("unit")) then
			unit = GMF:GetAttribute("unit")
		end
		if(not unit or not UnitExists(unit)) then
			return
		end
	end

	self:RemoveTrashLines(tt) --keep an eye on this may be buggy
	local level = UnitLevel(unit)
	local isShiftKeyDown = IsShiftKeyDown()

	local color
	if(UnitIsPlayer(unit)) then
		local localeClass, class = UnitClass(unit)
		local name, realm = UnitName(unit)
		local guildName, guildRankName, guildRankIndex, guildRealm = GetGuildInfo(unit)
		local pvpName = UnitPVPName(unit)
		local relationship = UnitRealmRelationship(unit);
		if not localeClass or not class then return; end
		color = CUSTOM_CLASS_COLORS and CUSTOM_CLASS_COLORS[class] or RAID_CLASS_COLORS[class]
		if not color then --fix unknow player. by eui.cc
			color = {
				b=0.41,
				colorStr="fffff569",
				g=0.96,
				r=1
			}
		end
		if(self.db.playerTitles and pvpName) then
			name = pvpName
		end

		if(realm and realm ~= "") then
			local letter = realm
			if(relationship == LE_REALM_RELATION_COALESCED) then
				letter = letter..FOREIGN_SERVER_LABEL
			elseif(relationship == LE_REALM_RELATION_VIRTUAL) then
				letter = letter..INTERACTIVE_SERVER_LABEL
			end
			name = name.."-"..letter
		end

		if(UnitIsAFK(unit)) then
			name = name..AFK_LABEL
		elseif(UnitIsDND(unit)) then
			name = name..DND_LABEL
		end

		GameTooltipTextLeft1:SetFormattedText("|c%s%s|r", color.colorStr, name)

		local lineOffset = 2
		if(guildName) then
			if(guildRealm and isShiftKeyDown) then
				guildName = guildName.."-"..guildRealm
			end

			if(self.db.guildRanks) then
				GameTooltipTextLeft2:SetText(("<|cff00ff10%s|r> [|cff00ff10%s|r][|cff00ff10%s|r]"):format(guildName, guildRankIndex, guildRankName))
			else
				GameTooltipTextLeft2:SetText(("<|cff00ff10%s|r>"):format(guildName))
			end
			lineOffset = 3
		end


		local levelLine = self:GetLevelLine(tt, lineOffset)
		if(levelLine) then
			local diffColor = GetQuestDifficultyColor(level)
			local race, englishRace = UnitRace(unit)
			local _, factionGroup = UnitFactionGroup(unit)
			if(factionGroup and englishRace == "Pandaren") then
				race = factionGroup.." "..race
			end
			levelLine:SetFormattedText("|cff%02x%02x%02x%s|r %s |c%s%s|r", diffColor.r * 255, diffColor.g * 255, diffColor.b * 255, level > 0 and level or "??", race or '', color.colorStr, localeClass)
		end

		--High CPU usage, restricting it to shift key down only.
		if(self.db.inspectInfo) then
			self:ShowInspectInfo(tt, unit, level, color.r, color.g, color.b, 0)
		end
	else
		if UnitIsTapDenied(unit) then
			color = TAPPED_COLOR
		else
			local unitReaction = UnitReaction(unit, "player")
			if E.db.tooltip.useCustomFactionColors then
				if unitReaction then
					unitReaction = format("%s", unitReaction) --Cast to string because our table is indexed by string keys
					color = E.db.tooltip.factionColors[unitReaction]
				end
			else
				color = FACTION_BAR_COLORS[unitReaction]
			end
		end

		local levelLine = self:GetLevelLine(tt, 2)
		if(levelLine) then
			local isPetWild, isPetCompanion = UnitIsWildBattlePet(unit), UnitIsBattlePetCompanion(unit);
			local creatureClassification = UnitClassification(unit)
			local creatureType = UnitCreatureType(unit)
			local pvpFlag = ""
			local diffColor
			if(isPetWild or isPetCompanion) then
				level = UnitBattlePetLevel(unit)

				local petType = PET_TYPE_SUFFIX[UnitBattlePetType(unit)]
				if creatureType then
					creatureType = format("%s %s", creatureType, petType)
				else
					creatureType = petType
				end

				local teamLevel = C_PetJournalGetPetTeamAverageLevel();
				if(teamLevel) then
					diffColor = GetRelativeDifficultyColor(teamLevel, level);
				else
					diffColor = GetQuestDifficultyColor(level)
				end
			else
				diffColor = GetQuestDifficultyColor(level)
			end

			if(UnitIsPVP(unit)) then
				pvpFlag = format(" (%s)", PVP)
			end

			levelLine:SetFormattedText("|cff%02x%02x%02x%s|r%s %s%s", diffColor.r * 255, diffColor.g * 255, diffColor.b * 255, level > 0 and level or "??", classification[creatureClassification] or "", creatureType or "", pvpFlag)
		end
	end

	local unitTarget = unit.."target"
	if(self.db.targetInfo and unit ~= "player" and UnitExists(unitTarget)) then
		local targetColor
		if(UnitIsPlayer(unitTarget) and not UnitHasVehicleUI(unitTarget)) then
			local _, class = UnitClass(unitTarget)
			targetColor = CUSTOM_CLASS_COLORS and CUSTOM_CLASS_COLORS[class] or RAID_CLASS_COLORS[class]
		else
			targetColor = E.db.tooltip.useCustomFactionColors and E.db.tooltip.factionColors[""..UnitReaction(unitTarget, "player")] or FACTION_BAR_COLORS[UnitReaction(unitTarget, "player")]
		end

		GameTooltip:AddDoubleLine(format("%s:", TARGET), format("|cff%02x%02x%02x%s|r", targetColor.r * 255, targetColor.g * 255, targetColor.b * 255, UnitName(unitTarget)))
	end

	if(self.db.targetInfo and IsInGroup()) then
		for i = 1, GetNumGroupMembers() do
			local groupUnit = (IsInRaid() and "raid"..i or "party"..i);
			if (UnitIsUnit(groupUnit.."target", unit)) and (not UnitIsUnit(groupUnit,"player")) then
				local _, class = UnitClass(groupUnit);
				local color = CUSTOM_CLASS_COLORS and CUSTOM_CLASS_COLORS[class] or RAID_CLASS_COLORS[class]
				tinsert(targetList, format("|c%s%s|r", color.colorStr, UnitName(groupUnit)))
			end
		end
		local numList = #targetList
		if (numList > 0) then
			GameTooltip:AddLine(format("%s (|cffffffff%d|r): %s", L["Targeted By:"], numList, tconcat(targetList, ", ")), nil, nil, nil, true);
			twipe(targetList);
		end
	end

	--Reputation line by eui.cc
	local unitreaction = UnitReaction(unit, "player")
	if(not UnitIsPlayer(unit)) and unitreaction then
		local fcolor = E.db.tooltip.factionColors[""..unitreaction] or {r = 0, g = 0.6, b = 0.1}
		local gender = UnitSex("player");
		GameTooltip:AddDoubleLine(format("%s:", REPUTATION), format("|cff%02x%02x%02x%s|r", fcolor.r * 255, fcolor.g * 255, fcolor.b * 255, GetText("FACTION_STANDING_LABEL"..unitreaction, gender)))
	end

	-- Range line by eui.cc
	if E.db.tooltip.range and UnitExists(unit) and unit ~= "player" and rc then
		local minRange, maxRange = rc:getRange(unit)
		if maxRange then
			local text = GetRangeColorText(minRange, maxRange)
			GameTooltip:AddDoubleLine(L["Range"]..":", text)
		else
			GameTooltip:AddDoubleLine(L["Range"]..":", '80+')
		end
	end


	if(color) then
		GameTooltipStatusBar:SetStatusBarColor(color.r, color.g, color.b)
	else
		GameTooltipStatusBar:SetStatusBarColor(0.6, 0.6, 0.6)
	end

	local textWidth = GameTooltipStatusBar.text:GetStringWidth()
	if textWidth then
		tt:SetMinimumWidth(textWidth)
	end
end

function TT:GameTooltipStatusBar_OnValueChanged(tt, value)
	if not value or not self.db.healthBar.text or not tt.text then return end
	local unit = select(2, tt:GetParent():GetUnit())
	if(not unit) then
		local GMF = GetMouseFocus()
		if(GMF and GMF:GetAttribute("unit")) then
			unit = GMF:GetAttribute("unit")
		end
	end

	local min, max = tt:GetMinMaxValues()
	if(value > 0 and max == 1) then
		tt.text:SetFormattedText("%d%%", floor(value * 100))
		tt:SetStatusBarColor(TAPPED_COLOR.r, TAPPED_COLOR.g, TAPPED_COLOR.b) --most effeciant?
	elseif(value == 0 or (unit and UnitIsDeadOrGhost(unit))) then
		tt.text:SetText(DEAD)
	else
		tt.text:SetText(E:ShortValue(value).." / "..E:ShortValue(max))
	end
end

function TT:GameTooltip_OnTooltipCleared(tt)
	tt.itemCleared = nil
end

function TT:GameTooltip_OnTooltipSetItem(tt)
	local ownerName = tt:GetOwner() and tt:GetOwner().GetName and tt:GetOwner():GetName()
	if (self.db.visibility.bags ~= 'NONE' and ownerName and (find(ownerName, "ElvUI_Container") or find(ownerName, "ElvUI_BankContainer"))) then
		local modifier = self.db.visibility.bags

		if(modifier == 'ALL' or not ((modifier == 'SHIFT' and IsShiftKeyDown()) or (modifier == 'CTRL' and IsControlKeyDown()) or (modifier == 'ALT' and IsAltKeyDown()))) then
			tt.itemCleared = true
			tt:Hide()
			return
		end
	end

	if not tt.itemCleared then
		local item, link = tt:GetItem()
		local num = GetItemCount(link)
		local numall = GetItemCount(link,true)
		local left = " "
		local right = " "
		local bankCount = " "

		if link ~= nil and self.db.spellID then
			left = (("|cFFCA3C3C%s|r %s"):format(ID, link)):match(":(%w+)")
		end

		if self.db.itemCount == "BAGS_ONLY" then
			right = ("|cFFCA3C3C%s|r %d"):format(L["Count"], num)
		elseif self.db.itemCount == "BANK_ONLY" then
			bankCount = ("|cFFCA3C3C%s|r %d"):format(L["Bank"],(numall - num))
		elseif self.db.itemCount == "BOTH" then
			right = ("|cFFCA3C3C%s|r %d"):format(L["Count"], num)
			bankCount = ("|cFFCA3C3C%s|r %d"):format(L["Bank"],(numall - num))
		end

		if left ~= " " or right ~= " " then
			tt:AddLine(" ")
			tt:AddDoubleLine(left, right)
		end
		if bankCount ~= " " then
			tt:AddDoubleLine(" ", bankCount)
		end

		tt.itemCleared = true
	end
end

function TT:GameTooltip_ShowStatusBar(tt, min, max, value, text)
	local statusBar = _G[tt:GetName().."StatusBar"..tt.shownStatusBars];
	if statusBar and not statusBar.skinned then
		statusBar:StripTextures()
		statusBar:SetStatusBarTexture(E['media'].normTex)
		E:RegisterStatusBar(statusBar)
		statusBar:CreateBackdrop('Default')
		statusBar.skinned = true;
	end
end

function TT:SetStyle(tt)
--	tt:SetTemplate("Transparent")
	tt:SetTemplate(E.db.tooltip.transparent and "notrans" or "Transparent", nil, true)
	local r, g, b = tt:GetBackdropColor()
	tt:SetBackdropColor(r, g, b, self.db.colorAlpha)
end

function TT:MODIFIER_STATE_CHANGED(event, key)
	if((key == "LSHIFT" or key == "RSHIFT") and UnitExists("mouseover")) then
		GameTooltip:SetUnit('mouseover')
	end
end

function TT:SetUnitAura(tt, unit, index, filter)
	local _, _, _, _, _, _, _, caster, _, _, id = UnitAura(unit, index, filter)
	local showIt = false
	if id and self.db.spellID then
		if caster and UnitClass(caster) then
			local name = UnitName(caster)
			local _, class = UnitClass(caster)
			local color = CUSTOM_CLASS_COLORS and CUSTOM_CLASS_COLORS[class] or RAID_CLASS_COLORS[class]
			tt:AddDoubleLine(("|cFFCA3C3C%s|r %d"):format(ID, id), format("|c%s%s|r", color.colorStr, name))
		else
			tt:AddLine(("|cFFCA3C3C%s|r %d"):format(ID, id))
		end
		showIt = true
	end
	if id and self.db.mountinfo then
		-- Version: 2.1
		-- Author: Yafis
		-- Title: MountInfo
		-- 本地化：by Eui老中医

		for i = 1, C_MountJournal_GetNumMounts() do
			local creatureName, spellID, icon, active, isUsable, sourceType, isFavorite, isFactionSpecific, faction, hideOnChar, isCollected = C_MountJournal_GetMountInfo(i)
			if spellID == id then
				local creatureDisplayID, descriptionText, sourceText, isSelfMount = C_MountJournal_GetMountInfoExtra(i)
				tt:AddLine(' ')
				tt:AddLine(L["Mount Info"], 1, 1, 1)
				tt:AddLine(sourceText, 1, 1, 1)						
				if isCollected then
					tt:AddLine(L["Mount Info haved"], GREEN_FONT_COLOR.r, GREEN_FONT_COLOR.g, GREEN_FONT_COLOR.b)
				else
					tt:AddLine(L["Mount Info not haved"], RED_FONT_COLOR.r, RED_FONT_COLOR.g, RED_FONT_COLOR.b)
				end
				break;
			end
		end	
		showIt = true		
		--MountInfo end
	end
	if showIt then tt:Show() end
end

function TT:GameTooltip_OnTooltipSetSpell(tt)
	local id = select(3, tt:GetSpell())
	if not id or not self.db.spellID then return end

	local displayString = ("|cFFCA3C3C%s|r %d"):format(ID, id)
	local lines = tt:NumLines()
	local isFound
	for i= 1, lines do
		local line = _G[("GameTooltipTextLeft%d"):format(i)]
		if line and line:GetText() and line:GetText():find(displayString) then
			isFound = true;
			break
		end
	end

	if not isFound then
		tt:AddLine(displayString)
		tt:Show()
	end
end

function TT:SetItemRef(link, text, button, chatFrame)
	if find(link,"^spell:") and self.db.spellID then
		local id = sub(link,7)
		ItemRefTooltip:AddLine(("|cFFCA3C3C%s|r %d"):format(ID, id))
		ItemRefTooltip:Show()
	end
end

function TT:RepositionBNET(frame, point, anchor, anchorPoint, xOffset, yOffset)
	if anchor ~= BNETMover then
		BNToastFrame:ClearAllPoints()
		BNToastFrame:SetPoint('TOPLEFT', BNETMover, 'TOPLEFT');
	end
end

function TT:CheckBackdropColor()
	local r, g, b = GameTooltip:GetBackdropColor()
	r = E:Round(r, 1)
	g = E:Round(g, 1)
	b = E:Round(b, 1)
	local red, green, blue = unpack(E.media.backdropfadecolor)
	local alpha = self.db.colorAlpha

	if(r ~= red or g ~= green or b ~= blue) then
		GameTooltip:SetBackdropColor(red, green, blue, alpha)
	end
end

function TT:SetTooltipFonts()
	local font = E.LSM:Fetch("font", E.db.tooltip.font)
	local fontOutline = E.db.tooltip.fontOutline
	local headerSize = E.db.tooltip.headerFontSize
	local textSize = E.db.tooltip.textFontSize
	local smallTextSize = E.db.tooltip.smallTextFontSize

	GameTooltipHeaderText:SetFont(font, headerSize, fontOutline)
	GameTooltipText:SetFont(font, textSize, fontOutline)
	GameTooltipTextSmall:SetFont(font, smallTextSize, fontOutline)
	if GameTooltip.hasMoney then
		for i = 1, GameTooltip.numMoneyFrames do
			_G["GameTooltipMoneyFrame"..i.."PrefixText"]:SetFont(font, textSize, fontOutline)
			_G["GameTooltipMoneyFrame"..i.."SuffixText"]:SetFont(font, textSize, fontOutline)
			_G["GameTooltipMoneyFrame"..i.."GoldButtonText"]:SetFont(font, textSize, fontOutline)
			_G["GameTooltipMoneyFrame"..i.."SilverButtonText"]:SetFont(font, textSize, fontOutline)
			_G["GameTooltipMoneyFrame"..i.."CopperButtonText"]:SetFont(font, textSize, fontOutline)
		end
	end

	--These show when you compare items ("Currently Equipped", name of item, item level)
	--Since they appear at the top of the tooltip, we set it to use the header font size.
	ShoppingTooltip1TextLeft1:SetFont(font, headerSize, fontOutline)
	ShoppingTooltip1TextLeft2:SetFont(font, headerSize, fontOutline)
	ShoppingTooltip1TextLeft3:SetFont(font, headerSize, fontOutline)
	ShoppingTooltip1TextLeft4:SetFont(font, headerSize, fontOutline)
	ShoppingTooltip1TextRight1:SetFont(font, headerSize, fontOutline)
	ShoppingTooltip1TextRight2:SetFont(font, headerSize, fontOutline)
	ShoppingTooltip1TextRight3:SetFont(font, headerSize, fontOutline)
	ShoppingTooltip1TextRight4:SetFont(font, headerSize, fontOutline)
	ShoppingTooltip2TextLeft1:SetFont(font, headerSize, fontOutline)
	ShoppingTooltip2TextLeft2:SetFont(font, headerSize, fontOutline)
	ShoppingTooltip2TextLeft3:SetFont(font, headerSize, fontOutline)
	ShoppingTooltip2TextLeft4:SetFont(font, headerSize, fontOutline)
	ShoppingTooltip2TextRight1:SetFont(font, headerSize, fontOutline)
	ShoppingTooltip2TextRight2:SetFont(font, headerSize, fontOutline)
	ShoppingTooltip2TextRight3:SetFont(font, headerSize, fontOutline)
	ShoppingTooltip2TextRight4:SetFont(font, headerSize, fontOutline)
end

function TT:Initialize()
	self.db = E.db.tooltip

	BNToastFrame:Point('TOPRIGHT', MMHolder, 'BOTTOMRIGHT', 0, -10);
	E:CreateMover(BNToastFrame, 'BNETMover', L["BNet Frame"])
	self:SecureHook(BNToastFrame, "SetPoint", "RepositionBNET")

	if E.private.tooltip.enable ~= true then return end
	E.Tooltip = TT

	GameTooltipStatusBar:Height(self.db.healthBar.height)
	GameTooltipStatusBar:SetStatusBarTexture(E["media"].normTex)
	E:RegisterStatusBar(GameTooltipStatusBar)
	GameTooltipStatusBar:CreateBackdrop('Transparent')
	GameTooltipStatusBar:SetScript("OnValueChanged", self.OnValueChanged)
	GameTooltipStatusBar:ClearAllPoints()
	GameTooltipStatusBar:Point("TOPLEFT", GameTooltip, "BOTTOMLEFT", E.Border, -(E.Spacing * 3))
	GameTooltipStatusBar:Point("TOPRIGHT", GameTooltip, "BOTTOMRIGHT", -E.Border, -(E.Spacing * 3))
	GameTooltipStatusBar.text = GameTooltipStatusBar:CreateFontString(nil, "OVERLAY")
	GameTooltipStatusBar.text:Point("CENTER", GameTooltipStatusBar, 0, -3)
	GameTooltipStatusBar.text:FontTemplate(E.LSM:Fetch("font", self.db.healthBar.font), self.db.healthBar.fontSize, "OUTLINE")

	--Tooltip Fonts
	if not GameTooltip.hasMoney then
		 --Force creation of the money lines, so we can set font for it
		SetTooltipMoney(GameTooltip, 1, nil, "", "")
		SetTooltipMoney(GameTooltip, 1, nil, "", "")
		GameTooltip_ClearMoney(GameTooltip)
	end
	self:SetTooltipFonts()

	local GameTooltipAnchor = CreateFrame('Frame', 'GameTooltipAnchor', E.UIParent)
	GameTooltipAnchor:Point('BOTTOMRIGHT', RightChatToggleButton, 'BOTTOMRIGHT')
	GameTooltipAnchor:Size(130, 20)
	GameTooltipAnchor:SetFrameLevel(GameTooltipAnchor:GetFrameLevel() + 400)
	E:CreateMover(GameTooltipAnchor, 'TooltipMover', L["Tooltip"])

	self:SecureHook('GameTooltip_SetDefaultAnchor')
	self:SecureHook('GameTooltip_ShowStatusBar')
	self:SecureHook("SetItemRef")
	--self:SecureHook("GameTooltip_ShowCompareItem")
	self:SecureHook(GameTooltip, "SetUnitAura")
	self:SecureHook(GameTooltip, "SetUnitBuff", "SetUnitAura")
	self:SecureHook(GameTooltip, "SetUnitDebuff", "SetUnitAura")
	--self:SecureHook(GameTooltip, "SetUnitConsolidatedBuff", "SetConsolidatedUnitAura")
	self:HookScript(GameTooltip, "OnTooltipSetSpell", "GameTooltip_OnTooltipSetSpell")
	self:HookScript(GameTooltip, 'OnTooltipCleared', 'GameTooltip_OnTooltipCleared')
	self:HookScript(GameTooltip, 'OnTooltipSetItem', 'GameTooltip_OnTooltipSetItem')
	self:HookScript(GameTooltip, 'OnTooltipSetUnit', 'GameTooltip_OnTooltipSetUnit')
	self:HookScript(GameTooltip, "OnSizeChanged", "CheckBackdropColor")
	self:HookScript(GameTooltip, "OnUpdate", "CheckBackdropColor") --There has to be a more elegant way of doing this.
	self:HookScript(GameTooltipStatusBar, 'OnValueChanged', 'GameTooltipStatusBar_OnValueChanged')

	self:RegisterEvent("MODIFIER_STATE_CHANGED")
	self:RegisterEvent("CURSOR_UPDATE", "CheckBackdropColor")
	E.Skins:HandleCloseButton(ItemRefCloseButton)
	for _, tt in pairs(tooltips) do
		self:HookScript(tt, 'OnShow', 'SetStyle')
		if tt.BackdropFrame then tt.BackdropFrame:Kill() end
	end

	--World Quest Reward Icon
	WorldMapTooltip.ItemTooltip.IconBorder:SetAlpha(0)
	WorldMapTooltip.ItemTooltip.Icon:SetTexCoord(unpack(E.TexCoords))
	WorldMapTooltip.ItemTooltip:CreateBackdrop()
	WorldMapTooltip.ItemTooltip.backdrop:SetOutside(WorldMapTooltip.ItemTooltip.Icon)
	WorldMapTooltip.ItemTooltip.Count:ClearAllPoints()
	WorldMapTooltip.ItemTooltip.Count:SetPoint("BOTTOMRIGHT", WorldMapTooltip.ItemTooltip.Icon, "BOTTOMRIGHT", 0, 2)

	--Variable is localized at top of file, then set here when we're sure the frame has been created
	--Used to check if keybinding is active, if so then don't hide tooltips on actionbars
	keybindFrame = ElvUI_KeyBinder
	
	--Variable is localized at top of file, but setting it right away doesn't work on first session after opening up WoW
	playerGUID = UnitGUID("player")
end

E:RegisterModule(TT:GetName())