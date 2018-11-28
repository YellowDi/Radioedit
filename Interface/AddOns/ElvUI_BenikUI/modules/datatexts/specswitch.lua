local E, L, V, P, G = unpack(ElvUI);
local DT = E:GetModule('DataTexts')

local format = string.format
local select = select
local join = string.join

local CreateFrame = CreateFrame
local EasyMenu = EasyMenu
local GetSpecialization = GetSpecialization
local GetActiveSpecGroup = GetActiveSpecGroup
local GetSpecializationInfo = GetSpecializationInfo
local GetNumSpecGroups = GetNumSpecGroups
local GetLootSpecialization = GetLootSpecialization
local GetSpecializationInfoByID = GetSpecializationInfoByID
local SetLootSpecialization = SetLootSpecialization

local SELECT_LOOT_SPECIALIZATION, LOOT_SPECIALIZATION_DEFAULT = SELECT_LOOT_SPECIALIZATION, LOOT_SPECIALIZATION_DEFAULT

local lastPanel, active
local displayString = '';
local activeString = join("", "|cff00FF00" , ACTIVE_PETS, "|r")
local inactiveString = join("", "|cffFF0000", FACTION_INACTIVE, "|r")

local menuFrame = CreateFrame("Frame", "BenikUI_LootSpecializationDatatextClickMenu", E.UIParent, "UIDropDownMenuTemplate")
menuFrame:SetTemplate('Transparent')

local menuList = {
	{ text = SELECT_LOOT_SPECIALIZATION, isTitle = true, notCheckable = true },
	{ notCheckable = true, func = function() SetLootSpecialization(0) end },
	{ notCheckable = true },
	{ notCheckable = true },
	{ notCheckable = true },
	{ notCheckable = true }
}

local specList = {
	{ text = SPECIALIZATION, isTitle = true, notCheckable = true },
	{ notCheckable = true },
	{ notCheckable = true },
	{ notCheckable = true },
	{ notCheckable = true }
}

local function OnEvent(self)
	lastPanel = self

	local specIndex = GetSpecialization();
	if not specIndex then return end

	active = GetActiveSpecGroup()

	local talent = ''
	local i = GetSpecialization(false, false, active)
	if i then
		i = select(2, GetSpecializationInfo(i))
		if(i) then
			talent = format('%s', i)
		end
	end

	self.text:SetFormattedText('%s', talent)
end

local function OnEnter(self)
	DT:SetupTooltip(self)

	for i = 1, GetNumSpecGroups() do
		if GetSpecialization(false, false, i) then
			DT.tooltip:AddLine(join(" ", format(displayString, select(2, GetSpecializationInfo(GetSpecialization(false, false, i)))), (i == active and activeString or inactiveString)),1,1,1)
		end
	end

	DT.tooltip:AddLine(' ')
	local specialization = GetLootSpecialization()
	if specialization == 0 then
		local specIndex = GetSpecialization();

		if specIndex then
			local _, name = GetSpecializationInfo(specIndex);
			DT.tooltip:AddLine(format('|cffFFFFFF%s:|r %s', SELECT_LOOT_SPECIALIZATION, format(LOOT_SPECIALIZATION_DEFAULT, name)))
		end
	else
		local specID, name = GetSpecializationInfoByID(specialization);
		if specID then
			DT.tooltip:AddLine(format('|cffFFFFFF%s:|r %s', SELECT_LOOT_SPECIALIZATION, name))
		end
	end

	DT.tooltip:AddLine(' ')
	DT.tooltip:AddLine(L["|cffFFFFFFLeft Click:|r Change Talent Specialization"])
	DT.tooltip:AddLine(L["|cffFFFFFFRight Click:|r Change Loot Specialization"])

	DT.tooltip:Show()
end

local function OnClick(self, button)
	local specIndex = GetSpecialization();
	if not specIndex then return end

	DT.tooltip:Hide()

	if button == "LeftButton" then
		if not PlayerTalentFrame then
			LoadAddOn("Blizzard_TalentUI")
		end
		for index = 1, 4 do
			local id, name, _, texture = GetSpecializationInfo(index);
			if ( id ) then
				specList[index + 1].text = format('|T%s:14:14:0:0:64:64:4:60:4:60|t  %s', texture, name)
				specList[index + 1].func = function() SetSpecialization(index) end
			else
				specList[index + 1] = nil
			end
		end
		EasyMenu(specList, menuFrame, "cursor", -15, -7, "MENU", 2)
	else
		local specID, specName = GetSpecializationInfo(specIndex);
		menuList[2].text = format(LOOT_SPECIALIZATION_DEFAULT, specName);

		for index = 1, 4 do
			local id, name = GetSpecializationInfo(index);
			if ( id ) then
				menuList[index + 2].text = name
				menuList[index + 2].func = function() SetLootSpecialization(id) end
			else
				menuList[index + 2] = nil
			end
		end
		EasyMenu(menuList, menuFrame, "cursor", -15, -7, "MENU", 2)
	end
end

local function ValueColorUpdate(hex)
	displayString = join("", "|cffFFFFFF%s:|r ")

	if lastPanel ~= nil then
		OnEvent(lastPanel)
	end
end
E['valueColorUpdateFuncs'][ValueColorUpdate] = true

DT:RegisterDatatext('Spec Switch (BenikUI)',{"PLAYER_ENTERING_WORLD", "CHARACTER_POINTS_CHANGED", "PLAYER_TALENT_UPDATE", "ACTIVE_TALENT_GROUP_CHANGED"}, OnEvent, nil, OnClick, OnEnter)