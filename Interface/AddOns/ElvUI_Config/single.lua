local E, L, V, P, G, _ = unpack(ElvUI); --Engine

local AD = LibStub('AceAddon-3.0')
local ACD = LibStub("AceConfigDialog-3.0-ElvUI")
local DisableAddOn = DisableAddOn
local EnableAddOn = EnableAddOn
local IsAddOnLoaded = IsAddOnLoaded
local SetCVar = SetCVar
local InterfaceOptionsFrame_OpenToCategory = InterfaceOptionsFrame_OpenToCategory
local ENABLE, DISABLE = ENABLE, DISABLE

local temToggle = {
	["EuiGarrison"] = true,
	["ExtraCD"] = true,
	["HandyNotes_DraenorTreasures"] = true,
	["HandyNotes_LegionRaresTreasures"] = true,
	["MikScrollingBattleText"] = true,
	["OfflineDataCenter"] = true,
	["MeetingStone"] = true,
	["Skada"] = true,
	["Rematch"] = true,
	["RareScanner"] = true,
	["GearStatsSummary"] = true,
	["Mapster"] = true,
--	["WorldQuestTracker"] = false,
	["AngryKeystones"] = true,
}
for k, v in pairs(temToggle) do
	temToggle[k] = IsAddOnLoaded(k)
end

local function ToggleAddOnMsg(info, value)
	if value then
		E:Print(ENABLE..L[info]);
		EnableAddOn(info);
	else
		E:Print(DISABLE..L[info]);
		DisableAddOn(info);
	end
	E:StaticPopup_Show("CONFIG_RL");
end

E.Options.args.singleFunc = {
	type = "group",
	name = '15.'..L['singleFunc'],
	desc = L['singleFunc desc'],
	childGroups = 'tree',
	get = function(info) return temToggle[ info[#info] ]; end,
	set = function(info, value)	temToggle[ info[#info] ] = value; ToggleAddOnMsg(info[#info], value); end,
	args = {
		EuiGarrisonHeader = {
			order = 0,
			type = "header",
			name = L["EuiGarrison"],
		},	
		EuiGarrison = {
			order = 1,
			type = 'toggle',
			name = L["EuiGarrison"],
			desc = L["Enable/Disable"]..L["EuiGarrison"],
			disabled = function() return not E:IsConfigurableAddOn('EuiGarrison'); end,
		},
		BodyGuardAway = {
			order = 3,
			type = 'toggle',
			name = L["BodyGuardAway"],
			name = L["Hold CTRL while clicking the bodyguard, show DiagFrame"],
			get = function(info) return E.db.euiscript.BodyGuardAway; end,
			set = function(info, value)
				E.db.euiscript.BodyGuardAway = value;
				EUIBODYGUARDAWAY:Toggle()
			end,
		},
		ExtraCDHeader = {
			order = 6,
			type = "header",
			name = L['ExtraCD'],
		},		
		ExtraCD = {
			order = 7,
			type = 'toggle',
			name = L["ExtraCD"],
			desc = L["Enable/Disable"]..L["ExtraCD"],
			disabled = function() return not E:IsConfigurableAddOn('ExtraCD'); end,
		},
		ShowExtraCDOpt = {
			order = 8,
			type = 'execute',
			name = L['Show ExtraCD Config'],
			disabled = function() return not IsAddOnLoaded('ExtraCD'); end,
			func = function()
				if not ExtraCD.optionFrames then
					ExtraCD:OnOptionCreate();
				end
				InterfaceOptionsFrame_OpenToCategory(ExtraCD.optionFrames.profiles)
				InterfaceOptionsFrame_OpenToCategory(ExtraCD.optionFrames.general)
				E:ToggleConfig();
			end,
		},
		HandyNotes_DraenorTreasuresHeader = {
			order = 9,
			type = "header",
			name = L['HandyNotes_DraenorTreasures'],
		},		
		HandyNotes_DraenorTreasures = {
			order = 10,
			type = 'toggle',
			name = L["HandyNotes_DraenorTreasures"],
			desc = L["Enable/Disable"]..L["HandyNotes_DraenorTreasures"],
			disabled = function() return not E:IsConfigurableAddOn('HandyNotes_DraenorTreasures'); end,
		},
		HandyNotes_LegionRaresTreasures = {
			order = 11,
			type = 'toggle',
			name = L["HandyNotes_LegionRaresTreasures"],
			desc = L["Enable/Disable"]..L["HandyNotes_LegionRaresTreasures"],
			disabled = function() return not E:IsConfigurableAddOn('HandyNotes_LegionRaresTreasures'); end,
		},
		ShowHandyNotes_DraenorTreasuresCfg = {
			order = 12,
			type = 'execute',
			name = L['Show HandyNotes_DraenorTreasures Config'],
			disabled = function() return not IsAddOnLoaded('HandyNotes_DraenorTreasures'); end,
			func = function()
				ACD:Open("HandyNotes");
				E:ToggleConfig();
			end,
		},	
		MikScrollingBattleTextHeader = {
			order = 13,
			type = "header",
			name = L['MikScrollingBattleText'],
		},		
		MikScrollingBattleText = {
			order = 14,
			type = 'toggle',
			name = L["MikScrollingBattleText"],
			desc = L["Enable/Disable"]..L["MikScrollingBattleText"],
			disabled = function() return not E:IsConfigurableAddOn('MikScrollingBattleText'); end,
		},
		ShowMSBTOpt = {
			order = 15,
			type = 'execute',
			name = L['Show MikScrollingBattleText Config'],
			disabled = function() return not IsAddOnLoaded('MikScrollingBattleText'); end,
			func = function()
				if E:IsDisabledAddon('MSBTOptions') then
					EnableAddOn('MSBTOptions')
					E:StaticPopup_Show("CONFIG_RL");
				end
				if (not IsAddOnLoaded('MSBTOptions')) then
					LoadAddOn('MSBTOptions');
				end
				if (IsAddOnLoaded('MSBTOptions')) then
					MSBTOptions.Main.ShowMainFrame();
					E:ToggleConfig();
				end
			end,					
		},		
		ToggleBlzCombat = {
			order = 16,
			type = 'toggle',
			name = L['Disable Blz CombatText'],
			get = function(info) return E.db.euiscript.disableBLZCombatText; end,
			set = function(info, value)
				E.db.euiscript.disableBLZCombatText = value;
				local toggle = "1"
				if value then toggle = "0"; end
				SetCVar("floatingCombatTextCombatHealing", toggle) --(此为治疗数字，把0改成1)
				SetCVar("floatingCombatTextCombatDamage", toggle) --(此为伤害数字，把0改成1)
				SetCVar("enableFloatingCombatText", toggle)
			end,
		},
		DBM_CoreHeader = {
			order = 17,
			type = "header",
			name = L['DBM-Core'],
		},			
--[[	DBM_Core = {
			order = 16,
			type = 'toggle',
			name = L['DBM-Core'],
			set = function(info, value)
				E.db.single.DBM_Core = value;
				if value then
					if E:IsConfigurableAddOn('DBM-Core') then
						if (not IsAddOnLoaded('DBM-Core')) then
							LoadAddOn('DBM-Core');
							LoadAddOn('DBM-StatusBarTimers')
							LoadAddOn('DBM-DefaultSkin')
						end
						if AddOnSkins then
							E.private.addonskins.DBM = true;
						end
					end
				else
					if E:IsConfigurableAddOn('DBM-Core') then
						if IsAddOnLoaded('DBM-Core') then
							E:StaticPopup_Show("CONFIG_RL");
							E.private.addonskins.DBM = false
						end
					end					
				end
			end,
		},]]
		ShowDBMOpt = {
			order = 18,
			type = 'execute',
			name = L['Show DBM Config'],
			disabled = function() return not IsAddOnLoaded('DBM-Core'); end,
			func = function()
				DBM:LoadGUI();
				E:ToggleConfig();
			end,					
		},
		TestDBMSound = {
			order = 19,
			type = 'execute',
			name = L['Test DBM Sound'],
			disabled = function() return not IsAddOnLoaded('DBM-Core'); end,
			func = function()
				if E:IsConfigurableAddOn('DBM-Core') then
					DBM:DemoMode();
					E:ToggleConfig();
				end
			end,
		},	
		OfflineDataCenterHeader = {
			order = 20,
			type = "header",
			name = L['OfflineDataCenter'],
		},		
		OfflineDataCenter = {
			order = 21,
			type = 'toggle',
			name = L["OfflineDataCenter"],
			desc = L["Enable/Disable"]..L["OfflineDataCenter"],
			disabled = function() return not E:IsConfigurableAddOn('OfflineDataCenter'); end,
		},
		ShowODCFrame = {
			order = 22,
			type = 'execute',
			name = L['Show OfflineDataCenter Frame'],
			disabled = function() return not IsAddOnLoaded('OfflineDataCenter'); end,
			func = function()
				AD:GetAddon("OfflineDataCenter"):ToggleWindow();
				E:ToggleConfig();
			end,
		},
		ShowODCCfg = {
			order = 23,
			type = 'execute',
			name = L['Show OfflineDataCenter Config Frame'],
			disabled = function() return not IsAddOnLoaded('OfflineDataCenter'); end,
			func = function()
				ODCFrameSettingSubFrame.configdialog:Click();
				E:ToggleConfig();
			end,
		},
		MeetingStoneHeader = {
			order = 24,
			type = "header",
			name = L['MeetingStone'],
		},		
		MeetingStone = {
			order = 25,
			type = 'toggle',
			name = L["MeetingStone"],
			desc = L["Enable/Disable"]..L["MeetingStone"],
			disabled = function() return not E:IsConfigurableAddOn('MeetingStone'); end,
		},
		ShowMeetingStoneFrame = {
			order = 26,
			type = 'execute',
			name = L['Show MeetingStone Config Frame'],
			disabled = function() return not IsAddOnLoaded('MeetingStone'); end,
			func = function()
				AD:GetAddon('MeetingStone'):ToggleModule('MainPanel');
				E:ToggleConfig();
			end,
		},
		ToggleMeetingStoneBrokerPanel = {
			order = 27,
			type = 'execute',
			name = L['Toggle MeetingStone BrokerPanel'],
			disabled = function() return not IsAddOnLoaded('MeetingStone'); end,
			func = function()
				if AD:GetAddon('MeetingStone'):GetModule('DataBroker').BrokerPanel:IsShown() then
					AD:GetAddon('MeetingStone'):GetModule('DataBroker').BrokerPanel:Hide()
				else
					AD:GetAddon('MeetingStone'):GetModule('DataBroker').BrokerPanel:Show()
				end
			end,
		},		
		SkadaHeader = {
			order = 28,
			type = "header",
			name = L['Skada'],
		},
		Skada = {
			order = 29,
			type = 'toggle',
			name = L["Skada"],
			desc = L["Enable/Disable"]..L["Skada"],
			disabled = function() return not E:IsConfigurableAddOn('Skada'); end,
		},			
		ShowSkadaConfig = {
			order = 30,
			type = 'execute',
			name = L['Show Skada Config Frame'],
			disabled = function() return not IsAddOnLoaded('Skada'); end,
			func = function()
				InterfaceOptionsFrame_OpenToCategory(Skada.optionsFrame)
				InterfaceOptionsFrame_OpenToCategory(Skada.optionsFrame)
				E:ToggleConfig();
			end,
		},
		ToggleSkadaWindow = {
			order = 31,
			type = 'execute',
			name = L['Toggle Skada Window'],
			disabled = function() return not IsAddOnLoaded('Skada'); end,
			func = function()
				Skada:ToggleWindow();
				E:ToggleConfig();
			end,
		},
		ResetSkadaProfile = {
			order = 32,
			type = 'execute',
			width = 'full',
			name = L['Reset Skada Profile'],
			disabled = function() return not IsAddOnLoaded('Skada'); end,
			func = function()
				Skada.db:ResetProfile();
				E:ToggleConfig();
			end,
		},
		RematchHeader = {
			order = 45,
			type = "header",
			name = L["Rematch"],
		},
		Rematch = {
			order = 46,
			type = "toggle",
			name = L["Rematch"],
			desc = L["Enable/Disable"]..L["Rematch"],
			disabled = function() return not E:IsConfigurableAddOn('Rematch'); end,
		},
		RematchFrame = {
			order = 47,
			type = "execute",
			name = L["Rematch Config Frame"],
			disabled = function() return not IsAddOnLoaded('Rematch'); end,
			func = function()
				if E:IsConfigurableAddOn('Rematch') then
					Rematch.Frame:Toggle()
					E:ToggleConfig();
				end
			end,
		},
		RareScannerHeader = {
			order = 51,
			type = "header",
			name = L['RareScanner'],
		},	
		RareScanner = {
			order = 52,
			type = 'toggle',
			name = L["RareScanner"],
			desc = L["Enable/Disable"]..L["RareScanner"],
			disabled = function() return not E:IsConfigurableAddOn('RareScanner'); end,
		},	
		RareScannerConfigFrame = {
			order = 53,
			type = 'execute',
			name = L['RareScanner Config Frame'],
			disabled = function() return not IsAddOnLoaded('RareScanner'); end,
			func = function()
				if E:IsConfigurableAddOn('RareScanner') then
					InterfaceOptionsFrame_OpenToCategory(AD:GetAddon("RareScanner").optionsFrame)
					InterfaceOptionsFrame_OpenToCategory(AD:GetAddon("RareScanner").optionsFrame)
					E:ToggleConfig();
				end
			end,
		},	
		GearStatsSummaryHeader = {
			order = 57,
			type = "header",
			name = L['GearStatsSummary'],
		},
		GearStatsSummary = {
			order = 58,
			type = 'toggle',
			name = L["GearStatsSummary"],
			desc = L["Enable/Disable"]..L["GearStatsSummary"],
			disabled = function() return not E:IsConfigurableAddOn('GearStatsSummary'); end,
		},
		MapsterHeader = {
			order = 67,
			type = "header",
			name = L['Mapster'],
		},		
		Mapster = {
			order = 68,
			type = 'toggle',
			name = L["Mapster"],
			desc = L["Enable/Disable"]..L["Mapster"],
			disabled = function() return not E:IsConfigurableAddOn('Mapster'); end,
		},
		ShowMapsterFrame = {
			order = 69,
			type = 'execute',
			name = L['Show Mapster Frame'],
			disabled = function() return not IsAddOnLoaded('Mapster'); end,
			func = function()
				if not WorldMapFrame:IsShown() then
					ToggleWorldMap()
				end
				E:ToggleConfig();
			end,
		},	
		ToggleWorldFlightMap = {
			order = 70,
			type = 'toggle',
			name = L['Toggle World Flight Map'],
			disabled = function() return not IsAddOnLoaded('Mapster'); end,
			get = function() return E.db.SingleAddons.WorldFlightMap; end,
			set = function(info,value)
				if E:IsConfigurableAddOn('Mapster') then
					E.db.SingleAddons.WorldFlightMap = value;
					E:StaticPopup_Show("CONFIG_RL");
				end
			end,
		},
	--[[	WorldQuestTrackerHeader = {
			order = 75,
			type = "header",
			name = L['WorldQuestTracker'],
		},		
		WorldQuestTracker = {
			order = 76,
			type = 'toggle',
			name = L["WorldQuestTracker"],
			desc = L["Enable/Disable"]..L["WorldQuestTracker"],
			disabled = function() return not E:IsConfigurableAddOn('WorldQuestTracker'); end,
		},]]
		AngryKeystonesHeader = {
			order = 77,
			type = "header",
			name = L['AngryKeystones'],
		},		
		AngryKeystones = {
			order = 78,
			type = 'toggle',
			name = L["AngryKeystones"],
			desc = L["Enable/Disable"]..L["AngryKeystones"],
			disabled = function() return not E:IsConfigurableAddOn('AngryKeystones'); end,
		},
		AngryKeystonesConfig = {
			order = 79,
			type = 'execute',
			name = L['Show AngryKeystones Option'],
			disabled = function() return not IsAddOnLoaded('AngryKeystones'); end,
			func = function()
				SlashCmdList.AngryKeystones();
				E:ToggleConfig();
			end,
		},
	},
}