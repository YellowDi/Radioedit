local SLE, T, E, L, V, P, G = unpack(select(2, ...))

local GetAddOnEnableState = GetAddOnEnableState
--Check if some stuff happens to be enable
SLE._Compatibility = {}
local _CompList = {
	"oRA3",
	"ElvUI_CustomTweaks",
	"ElvUI_MerathilisUI",
	"ElvUI_Enhanced",
	"DejaCharacterStats",
	"ElvUI_ExtraActionBars",
	"ElvUI_ChaoticUI",
	"TradeSkillMaster",
	"WorldQuestTracker",
	"ElvUI_PagedLootHistory",
	"ElvUI_VisualAuraTimers",
	"SunnArt",
	"SquareMinimapButtons", --Module incompatible
	"LootConfirm", --Module incompatible
	"SquareMinimapButtons", --Module incompatible
}
--Populate compatibility checks table
for i = 1, #_CompList do
	if GetAddOnEnableState(E.myname, _CompList[i]) == 0 then SLE._Compatibility[_CompList[i]] = nil else SLE._Compatibility[_CompList[i]] = true end
end

local Bastards = {}
local function IsDeclined()
	local CheckRealm = T.gsub(E.myrealm,'[%s%-]','')
	for realm, people in T.pairs(Bastards) do
		if people[E.myname] then return true end
	end
	return false
end

--This function sets up a popup dialog in case there is an incompatible addon running
function SLE:IncompatibleAddOn(addon, module, optiontable, value)
	E.PopupDialogs["SLE_INCOMPATIBLE_ADDON"].button1 = addon
	E.PopupDialogs["SLE_INCOMPATIBLE_ADDON"].button2 = 'S&L: '..module
	E.PopupDialogs["SLE_INCOMPATIBLE_ADDON"].addon = addon
	E.PopupDialogs["SLE_INCOMPATIBLE_ADDON"].module = module
	E.PopupDialogs["SLE_INCOMPATIBLE_ADDON"].optiontable = optiontable
	E.PopupDialogs["SLE_INCOMPATIBLE_ADDON"].value = value
	E.PopupDialogs["SLE_INCOMPATIBLE_ADDON"].showAlert = true
	E:StaticPopup_Show('SLE_INCOMPATIBLE_ADDON', addon, module)
end

--Check if incompatibility is in place
function SLE:CheckIncompatible()
	if SLE._Compatibility["ElvUI_Enhanced"] then
		E:StaticPopup_Show("ENHANCED_SLE_INCOMPATIBLE")
		return true
	end
	if SLE._Compatibility["SquareMinimapButtons"] and E.private.sle.minimap.mapicons.enable then
		SLE:IncompatibleAddOn("SquareMinimapButtons", "SquareMinimapButtons", E.private.sle.minimap.mapicons, "enable")
		return true
	end
	if SLE._Compatibility["LootConfirm"] then
		E:StaticPopup_Show("LOOTCONFIRM_SLE_INCOMPATIBLE")
		return true
	end
	if SLE._Compatibility["ElvUITransparentActionbars"] then
		E:StaticPopup_Show("TRANSAB_SLE_INCOMPATIBLE")
		return true
	end
	if IsDeclined() then
		return true
	end
	return false
end
