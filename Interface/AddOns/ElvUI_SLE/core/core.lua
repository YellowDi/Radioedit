local E, L, V, P, G = unpack(ElvUI);
local EP = LibStub("LibElvUIPlugin-1.0")
local AddOnName, Engine = ...;
local _G = _G
local tonumber = tonumber

--GLOBALS: hooksecurefunc, LibStub, GetAddOnMetadata, CreateFrame, GetAddOnEnableState, BINDING_HEADER_SLE

local SLE = LibStub("AceAddon-3.0"):NewAddon(AddOnName, "AceConsole-3.0", "AceEvent-3.0", 'AceTimer-3.0', 'AceHook-3.0');
SLE.callbacks = SLE.callbacks or LibStub("CallbackHandler-1.0"):New(SLE)
 
SLE.version = GetAddOnMetadata("ElvUI_SLE", "Version")
SLE.Title = format("|cff9482c9%s |r", "Shadow & Light")

BINDING_HEADER_SLE = "|cff9482c9Shadow & Light|r"

--Creating a toolkit table
local Toolkit = {}

--localizing functions and stuff--

SLE.elvV = tonumber(E.version)
SLE.elvR = tonumber(GetAddOnMetadata("ElvUI_SLE", "X-ElvVersion"))

--Setting up table to unpack. Why? no idea
Engine[1] = SLE
Engine[2] = Toolkit
Engine[3] = E
Engine[4] = L
Engine[5] = V
Engine[6] = P
Engine[7] = G
_G[AddOnName] = Engine;

--A function to concentrate options from different modules to a single table used in plugin reg
local function GetOptions()
	for _, func in Toolkit.pairs(SLE.Configs) do
		func()
	end
end

function SLE:OnInitialize()
	--Incompatibility stuff will go here
	SLE:AddTutorials()
end

local f=CreateFrame("Frame")
f:RegisterEvent("PLAYER_LOGIN")
f:SetScript("OnEvent", function()
	SLE:Initialize()
end)

function SLE:ConfigCats() --Additional mover groups
	Toolkit.tinsert(E.ConfigModeLayouts, #(E.ConfigModeLayouts)+1, "S&L");
	E.ConfigModeLocalizedStrings["S&L"] = L["S&L: All"]
	Toolkit.tinsert(E.ConfigModeLayouts, #(E.ConfigModeLayouts)+1, "S&L DT");
	E.ConfigModeLocalizedStrings["S&L DT"] = L["S&L: Datatexts"]
	Toolkit.tinsert(E.ConfigModeLayouts, #(E.ConfigModeLayouts)+1, "S&L BG");
	E.ConfigModeLocalizedStrings["S&L BG"] = L["S&L: Backgrounds"]
	Toolkit.tinsert(E.ConfigModeLayouts, #(E.ConfigModeLayouts)+1, "S&L MISC");
	E.ConfigModeLocalizedStrings["S&L MISC"] = L["S&L: Misc"]
end

function SLE:Initialize()
	--ElvUI's version check
	if SLE.elvV < 10 then return end

	if SLE.elvV < SLE.elvR then
		E:StaticPopup_Show("VERSION_MISMATCH")
		return --Not loading shit if version is too old, prevents shit from being broken
	end
	if SLE:CheckIncompatible() then return end
	SLE:DatabaseConversions()
	SLE:ConfigCats()
	self.initialized = true
	self:InitializeModules(); --Load Modules

	SLE:CreateSplashScreen()

	hooksecurefunc(E, "UpdateAll", SLE.UpdateAll)
	--Here goes installation script

	--Annoying message
	if E.db.general.loginmessage then
		SLE:Print(Toolkit.format(L["SLE_LOGIN_MSG"], E["media"].hexvaluecolor, SLE.version), "info")
	end

	SLE:BuildGameMenu()
	SLE:CyrillicsInit()

	if not E.private.sle.install_complete or (E.private.sle.install_complete ~= "BETA" and tonumber(E.private.sle.install_complete) < 3) then
		E:GetModule("PluginInstaller"):Queue(SLE.installTable)
	end
	if not E.private.sle.characterGoldsSorting[E.myrealm] then E.private.sle.characterGoldsSorting[E.myrealm] = {} end

	LibStub("LibElvUIPlugin-1.0"):RegisterPlugin(AddOnName, GetOptions) --Registering as plugin
	
	if SLE:IsFoolsDay() then
		if Toolkit.IsAddOnLoaded('ElvUI_BenikUI') and E.db.benikui.general.splashScreen then
			_G["BenikUISplashScreen"]:HookScript("OnHide", function() SLE:ShowSplashScreen() end)
		elseif Toolkit.IsAddOnLoaded('ElvUI_BenikUI') and not E.db.benikui.general.splashScreen then
			SLE:ShowSplashScreen()
		else
			SLE:ShowSplashScreen()
		end
	end
end
