
BugGrabberDB = {
	["lastSanitation"] = 3,
	["session"] = 15,
	["errors"] = {
		{
			["message"] = "Interface\\AddOns\\WindTools\\ArtifactTab.lua:351: attempt to index local 'button' (a nil value)",
			["time"] = "2017/08/23 15:34:44",
			["locals"] = "button = nil\n(*temporary) = 3\n(*temporary) = nil\n(*temporary) = 1\n(*temporary) = 3\n(*temporary) = <unnamed> {\n 0 = <userdata>\n}\n(*temporary) = <unnamed> {\n 0 = <userdata>\n}\n(*temporary) = <function> defined =[C]:-1\n(*temporary) = <unnamed> {\n 0 = <userdata>\n}\n(*temporary) = \"TOP\"\n(*temporary) = nil\n(*temporary) = \"TOP\"\n(*temporary) = 0\n(*temporary) = -10\n(*temporary) = \"attempt to index local 'button' (a nil value)\"\nbtnList = <table> {\n 1 = ArtifactTab_Button_128823 {\n }\n 2 = ArtifactTab_Button_128866 {\n }\n 3 = ArtifactTab_Button_120978 {\n }\n}\n",
			["stack"] = "Interface\\AddOns\\WindTools\\ArtifactTab.lua:351: in function `ArtifactTab_setActiveButton'\nInterface\\AddOns\\WindTools\\ArtifactTab.lua:196: in function <Interface\\AddOns\\WindTools\\ArtifactTab.lua:194>",
			["session"] = 4,
			["counter"] = 1,
		}, -- [1]
		{
			["message"] = "Interface\\AddOns\\EKPlates\\EKPlates-R1.6.lua:617: attempt to index field 'name' (a nil value)",
			["time"] = "2017/08/23 16:35:36",
			["locals"] = "unitFrame = NamePlate1UnitFrame {\n 0 = <userdata>\n Debuffs = <unnamed> {\n }\n unit = \"nameplate1\"\n CastBar = NamePlate1UnitFrameCastBar {\n }\n HealerIcon = <unnamed> {\n }\n inVehicle = false\n PersonalHealPrediction = NamePlate1UnitFrameHealthBarPersonalHealPrediction {\n }\n PowerBar = NamePlate1UnitFramePowerBar {\n }\n TopOffset = 17\n TopLevelFrame = NamePlate1UnitFrameHealthBar {\n }\n NPCTitle = <unnamed> {\n }\n RaidIcon = <unnamed> {\n }\n UnitType = \"ENEMY_NPC\"\n HealPrediction = NamePlate1UnitFrameHealthBarHealPrediction {\n }\n AbsorbBar = NamePlate1UnitFrameHealthBarAbsorbBar {\n }\n Level = <unnamed> {\n }\n Glow = <unnamed> {\n }\n HealthBar = NamePlate1UnitFrameHealthBar {\n }\n Name = <unnamed> {\n }\n Elite = <unnamed> {\n }\n ThreatScale = 1\n Buffs = <unnamed> {\n }\n displayedUnit = \"nameplate1\"\n DetectionModel = <unnamed> {\n }\n}\nname = \"无脑的僵尸\"\nlevel = 1\nhexColor = nil\n(*temporary) = nil\n(*temporary) = nil\n(*temporary) = \"player\"\n(*temporary) = false\n(*temporary) = nil\n(*temporary) = nil\n(*temporary) = nil\n(*temporary) = nil\n(*temporary) = \"attempt to index field 'name' (a nil value)\"\nC = <table> {\n myfiltertype = \"blacklist\"\n ShowPower = <table> {\n }\n threatcolor = true\n show_power = true\n Customcoloredplates = <table> {\n }\n numberstyle = false\n cbshield = false\n playerplate = false\n BlackList = <table> {\n }\n MinAlpha = 0.8\n otherfiltertype = \"whitelist\"\n auraiconsize = 22\n level = false\n Inset = true\n classresource_show = false\n SelectedScale = 1\n auranum = 5\n PlayerClickThrough = false\n castbar = false\n plateaura = false\n HorizontalArrow = false\n cbtext = false\n friendlyCR = true\n name_mod = true\n MaxDistance = 45\n classresource = \"player\"\n EnemyClickThrough = false\n FriendlyClickThrough = true\n WhiteList = <table> {\n }\n enemyCR = true\n HideArrow = false\n}\n",
			["stack"] = "Interface\\AddOns\\EKPlates\\EKPlates-R1.6.lua:617: in function <Interface\\AddOns\\EKPlates\\EKPlates.lua:585>\nInterface\\AddOns\\EKPlates\\EKPlates-R1.6.lua:1035: in function <Interface\\AddOns\\EKPlates\\EKPlates.lua:1031>\nInterface\\AddOns\\EKPlates\\EKPlates-R1.6.lua:1395: in function <Interface\\AddOns\\EKPlates\\EKPlates.lua:1372>",
			["session"] = 10,
			["counter"] = 8,
		}, -- [2]
		{
			["message"] = "Interface\\AddOns\\EKPlates\\EKPlates-R1.6.lua:866: attempt to index field 'powerBar' (a nil value)",
			["time"] = "2017/08/23 16:34:04",
			["locals"] = "unitFrame = NamePlate1UnitFrame {\n 0 = <userdata>\n Debuffs = <unnamed> {\n }\n unit = \"nameplate1\"\n CastBar = NamePlate1UnitFrameCastBar {\n }\n HealerIcon = <unnamed> {\n }\n inVehicle = false\n PersonalHealPrediction = NamePlate1UnitFrameHealthBarPersonalHealPrediction {\n }\n PowerBar = NamePlate1UnitFramePowerBar {\n }\n NPCTitle = <unnamed> {\n }\n HealPrediction = NamePlate1UnitFrameHealthBarHealPrediction {\n }\n AbsorbBar = NamePlate1UnitFrameHealthBarAbsorbBar {\n }\n Level = <unnamed> {\n }\n Glow = <unnamed> {\n }\n HealthBar = NamePlate1UnitFrameHealthBar {\n }\n Name = <unnamed> {\n }\n Elite = <unnamed> {\n }\n RaidIcon = <unnamed> {\n }\n Buffs = <unnamed> {\n }\n displayedUnit = \"nameplate1\"\n DetectionModel = <unnamed> {\n }\n}\nunit = \"nameplate1\"\ndisplayedUnit = nil\n(*temporary) = nil\n(*temporary) = nil\n(*temporary) = \"UNIT_POWER_FREQUENT\"\n(*temporary) = <userdata>\n(*temporary) = nil\n(*temporary) = <userdata>\n(*temporary) = nil\n(*temporary) = \"attempt to index field 'powerBar' (a nil value)\"\nC = <table> {\n myfiltertype = \"blacklist\"\n ShowPower = <table> {\n }\n threatcolor = true\n show_power = true\n Customcoloredplates = <table> {\n }\n numberstyle = false\n cbshield = false\n playerplate = false\n BlackList = <table> {\n }\n MinAlpha = 0.8\n otherfiltertype = \"whitelist\"\n auraiconsize = 22\n level = false\n Inset = true\n classresource_show = false\n SelectedScale = 1\n auranum = 5\n PlayerClickThrough = false\n castbar = false\n plateaura = false\n HorizontalArrow = false\n cbtext = false\n friendlyCR = true\n name_mod = true\n MaxDistance = 45\n classresource = \"player\"\n EnemyClickThrough = false\n FriendlyClickThrough = true\n WhiteList = <table> {\n }\n enemyCR = true\n HideArrow = false\n}\n",
			["stack"] = "Interface\\AddOns\\EKPlates\\EKPlates-R1.6.lua:866: in function <Interface\\AddOns\\EKPlates\\EKPlates.lua:842>\nInterface\\AddOns\\EKPlates\\EKPlates-R1.6.lua:985: in function <Interface\\AddOns\\EKPlates\\EKPlates.lua:978>\nInterface\\AddOns\\EKPlates\\EKPlates-R1.6.lua:999: in function <Interface\\AddOns\\EKPlates\\EKPlates.lua:994>\nInterface\\AddOns\\EKPlates\\EKPlates-R1.6.lua:1307: in function <Interface\\AddOns\\EKPlates\\EKPlates.lua:1304>\nInterface\\AddOns\\EKPlates\\EKPlates-R1.6.lua:1386: in function <Interface\\AddOns\\EKPlates\\EKPlates.lua:1372>",
			["session"] = 10,
			["counter"] = 17,
		}, -- [3]
		{
			["message"] = "Interface\\FrameXML\\CastingBarFrame.lua:62: attempt to index local 'self' (a nil value)",
			["time"] = "2017/08/23 16:34:33",
			["locals"] = "self = nil\nunit = nil\nshowTradeSkills = false\nshowShield = true\n(*temporary) = nil\n(*temporary) = nil\n(*temporary) = nil\n(*temporary) = nil\n(*temporary) = \"attempt to index local 'self' (a nil value)\"\n",
			["stack"] = "Interface\\FrameXML\\CastingBarFrame.lua:62: in function `CastingBarFrame_SetUnit'\nInterface\\AddOns\\EKPlates\\EKPlates-R1.6.lua:1314: in function <Interface\\AddOns\\EKPlates\\EKPlates.lua:1311>\nInterface\\AddOns\\EKPlates\\EKPlates-R1.6.lua:1389: in function <Interface\\AddOns\\EKPlates\\EKPlates.lua:1372>",
			["session"] = 10,
			["counter"] = 17,
		}, -- [4]
		{
			["message"] = "[ADDON_ACTION_BLOCKED] 插件 'WindTools' 尝试调用保护功能 '<unnamed>:Hide()'。",
			["time"] = "2017/08/23 16:15:40",
			["locals"] = "",
			["stack"] = "Interface\\AddOns\\!BugGrabber\\BugGrabber.lua:573: in function <Interface\\AddOns\\!BugGrabber\\BugGrabber.lua:573>\n[C]: in function `Hide'\nInterface\\FrameXML\\WorldMapActionButton.lua:58: in function `Clear'\nInterface\\FrameXML\\WorldMapActionButton.lua:67: in function `Refresh'\nInterface\\FrameXML\\WorldMapActionButton.lua:19: in function `SetMapAreaID'\nInterface\\FrameXML\\WorldMapFrame.lua:429: in function <Interface\\FrameXML\\WorldMapFrame.lua:392>\n[C]: ?\n[C]: in function `Hide'\nInterface\\FrameXML\\UIParent.lua:2405: in function `SetUIPanel'\nInterface\\FrameXML\\UIParent.lua:2432: in function `MoveUIPanel'\nInterface\\FrameXML\\UIParent.lua:2463: in function `HideUIPanel'\nInterface\\FrameXML\\UIParent.lua:2137: in function <Interface\\FrameXML\\UIParent.lua:2129>\n[C]: in function `SetAttribute'\nInterface\\FrameXML\\UIParent.lua:2931: in function `HideUIPanel'\nInterface\\FrameXML\\UIParent.lua:3099: in function `CloseWindows'\nInterface\\FrameXML\\UIParent.lua:3138: in function <Interface\\FrameXML\\UIParent.lua:3128>\n[C]: in function `securecall'\nInterface\\FrameXML\\UIParent.lua:3751: in function `ToggleGameMenu'\n[string \"TOGGLEGAMEMENU\"]:1: in function <[string \"TOGGLEGAMEMENU\"]:1>",
			["session"] = 12,
			["counter"] = 2,
		}, -- [5]
		{
			["message"] = "Interface\\AddOns\\NOP\\nop-item.lua:139: script ran too long",
			["time"] = "2017/08/23 17:42:38",
			["stack"] = "Interface\\AddOns\\NOP\\nop-item.lua:139: in function `ItemScan'\nInterface\\AddOns\\NOP\\nop-item.lua:286: in function `ItemShowNew'\nInterface\\AddOns\\NOP\\nop-events.lua:81: in function `?'\n...que\\Libs\\CallbackHandler-1.0\\CallbackHandler-1.0-6.lua:145: in function <...que\\Libs\\CallbackHandler-1.0\\CallbackHandler-1.0.lua:145>\n[string \"safecall Dispatcher[1]\"]:4: in function <[string \"safecall Dispatcher[1]\"]:4>\n[C]: ?\n[string \"safecall Dispatcher[1]\"]:13: in function `?'\n...que\\Libs\\CallbackHandler-1.0\\CallbackHandler-1.0-6.lua:90: in function `Fire'\n...xternal\\Wildpants\\libs\\AceEvent-3.0\\AceEvent-3.0-4.lua:120: in function <...xternal\\Wildpants\\libs\\AceEvent-3.0\\AceEvent-3.0.lua:119>",
			["session"] = 14,
			["counter"] = 1,
		}, -- [6]
		{
			["message"] = "Interface\\AddOns\\NOP\\nop-item.lua:188: script ran too long",
			["time"] = "2017/08/23 17:42:39",
			["stack"] = "Interface\\AddOns\\NOP\\nop-item.lua:188: in function `ItemIsUsable'\nInterface\\AddOns\\NOP\\nop-item.lua:317: in function `ItemShowNew'\nInterface\\AddOns\\NOP\\nop-events.lua:56: in function `?'\n...que\\Libs\\CallbackHandler-1.0\\CallbackHandler-1.0-6.lua:145: in function <...que\\Libs\\CallbackHandler-1.0\\CallbackHandler-1.0.lua:145>\n[string \"safecall Dispatcher[1]\"]:4: in function <[string \"safecall Dispatcher[1]\"]:4>\n[C]: ?\n[string \"safecall Dispatcher[1]\"]:13: in function `?'\n...que\\Libs\\CallbackHandler-1.0\\CallbackHandler-1.0-6.lua:90: in function `Fire'\n...xternal\\Wildpants\\libs\\AceEvent-3.0\\AceEvent-3.0-4.lua:120: in function <...xternal\\Wildpants\\libs\\AceEvent-3.0\\AceEvent-3.0.lua:119>",
			["session"] = 14,
			["counter"] = 1,
		}, -- [7]
		{
			["message"] = "[string \"safecall Dispatcher[1]\"]:13: script ran too long",
			["time"] = "2017/08/23 17:42:38",
			["locals"] = "handlers = <table> {\n (null) = <function> defined @Interface\\AddOns\\Masque\\Libs\\CallbackHandler-1.0\\CallbackHandler-1.0.lua:145\n (null) = <function> defined @Interface\\AddOns\\Masque\\Libs\\CallbackHandler-1.0\\CallbackHandler-1.0.lua:145\n}\nindex = <table> {\n printt = <function> defined @Interface\\AddOns\\NOP\\nop-core.lua:7\n itemLoadRetry = 10\n modules = <table> {\n }\n CancelTimer = <function> defined @Interface\\AddOns\\ElvUI\\Libraries\\AceTimer-3.0\\AceTimer-3.0.lua:145\n QBQuestAccept = <function> defined @Interface\\AddOns\\NOP\\nop-quest.lua:235\n LOOT_SPEC = <function> defined @Interface\\AddOns\\NOP\\nop-events.lua:49\n ItemGetItem = <function> defined @Interface\\AddOns\\NOP\\nop-item.lua:29\n ButtonOnDragStop = <function> defined @Interface\\AddOns\\NOP\\nop-button.lua:128\n SetDefaultModulePrototype = <function> defined @Interface\\AddOns\\Masque\\Libs\\AceAddon-3.0\\AceAddon-3.0.lua:440\n ItemGetLockPattern = <function> defined @Interface\\AddOns\\NOP\\nop-item.lua:51\n ActionButton_ShowOverlayGlow = <function> defined @Interface\\AddOns\\NOP\\nop-button.lua:360\n QBAnchor = <function> defined @Interface\\AddOns\\NOP\\nop-quest.lua:35\n IsEnabled = <function> defined @Interface\\AddOns\\Masque\\Libs\\AceAddon-3.0\\AceAddon-3.0.lua:482\n SpellLoad = <function> defined @Interface\\AddOns\\NOP\\nop-core.lua:86\n ButtonSave = <function> defined @Interface\\AddOns\\NOP\\nop-button.lua:160\n QBButton = <function> defined @Interface\\AddOns\\NOP\\nop-quest.lua:53\n ProfileLoad = <function> defined @Interface\\AddOns\\NOP\\nop-profile.lua:13\n itemFrame = NOP_TOOLTIP_ITEM {\n }\n PLAYER_LOGIN = <function> defined @Interface\\AddOns\\NOP\\nop-events.lua:58\n UnregisterMessage = <function> defined @Interface\\AddOns\\Masque\\Libs\\CallbackHandler-1.0\\CallbackHandler-1.0.lua:179\n PrintTooltip = <function> defined @Interface\\AddOns\\NOP\\nop-core.lua:173\n timerZoneChanged = <table> {\n }\n ButtonHotKey = <function> defined @Interface\\AddOns\\NOP\\nop-button.lua:299\n ItemLoad = <function> defined @Interface\\AddOns\\NOP\\nop-core.lua:32\n SetEnabledState = <function> defined @Interface\\AddOns\\Masque\\Libs\\AceAddon-3.0\\AceAddon-3.0.lua:455\n T_ITEMS = <table> {\n }\n OnEnable = <function> defined @Interface\\AddOns\\NOP\\nop-core.lua:18\n ButtonShow = <function> defined @Interface\\AddOns\\NOP\\nop-button.lua:264\n spellLoad = true\n ButtonOnEnter = <function> defined @Interface\\AddOns\\NOP\\nop-button.lua:85\n T_BLACKLIST_Q = <table> {\n }\n ButtonCount = <function> defined @Interface\\AddOns\\NOP\\nop-button.lua:259\n UnregisterAllEvents = <function> defined @Interface\\AddOns\\Masque\\Libs\\CallbackHandler-1.0\\CallbackHandler-1.0.lua:200\n removekey = <function> defined @Interface\\AddOns\\NOP\\nop-core.lua:279\n itemLoad = true\n T_BLACKLIST = <table> {\n }\n ActionButton_HideOverlayGlow = <function> defined @Interface\\AddOns\\NOP\\nop-button.lua:374\n QUEST_ACCEPTED = <function> defined @Interface\\AddOns\\NOP\\nop-events.lua:83\n ItemGetSpell = <function> defined @Interface\\AddOns\\NOP\\nop-item.lua:19\n QBOnLeave = <function> defined @Interface\\AddOns\\NOP\\nop-quest.lua:101\n GetName = <function> defined @Interface\\AddOns\\Masque\\Libs\\AceAddon-3.0\\AceAddon-3.0.lua:310\n ActionButton_GetOverlayGlow = <function> defined @Interface\\AddOns\\NOP\\nop-button.lua:352\n QBSkin = <function> defined @Interface\\AddOns\\NOP\\nop-quest.lua:231\n ButtonLoad = <function> defined @Interface\\AddOns\\NOP\\nop-button.lua:203\n Disable = <function> defined @Interface\\AddOns\\Masque\\Libs\\AceAddon-3.0\\AceAddon-3.0.lua:345\n PLAYER_LEVEL_UP = <function> defined @Interface\\AddOns\\NOP\\nop-events.lua:78\n Print = <function> defined @Interface\\AddOns\\ElvUI\\Libraries\\AceConsole-3.0\\AceConsole-3.0.lua:54\n QBAutoQuest = <function> defined @Interface\\AddOns\\NOP\\nop-quest.lua:244\n ItemIsUnusable = <function> defined @Interface\\AddOns\\NOP\\nop-item.lua:177\n QBKeyBind = <function> defined @Interface\\AddOns\\NOP\\nop-quest.lua:128\n Profile = <function> defined @Interface\\AddOns\\NOP\\nop-core.lua:233\n ACTIONBAR_UPDATE_COOLDOWN = <function> defined @Interface\\AddOns\\NOP\\nop-events.lua:87\n UnregisterEvent = <function> defined @Interface\\AddOns\\Masque\\Libs\\CallbackHandler-1.0\\CallbackHandler-1.0.lua:17",
			["stack"] = "[string \"safecall Dispatcher[1]\"]:13: in function `?'\n...que\\Libs\\CallbackHandler-1.0\\CallbackHandler-1.0-6.lua:90: in function `Fire'\n...xternal\\Wildpants\\libs\\AceEvent-3.0\\AceEvent-3.0-4.lua:120: in function <...xternal\\Wildpants\\libs\\AceEvent-3.0\\AceEvent-3.0.lua:119>",
			["session"] = 14,
			["counter"] = 2,
		}, -- [8]
		{
			["message"] = "...s_InstanceInfo\\EncounterJournalPlus_InstanceInfo-0.1.1.lua:221: attempt to index local 'difficultyButton' (a nil value)",
			["time"] = "2017/08/23 17:33:58",
			["locals"] = "instanceButton = EncounterJournalInstanceSelectScrollFrameinstance12 {\n 0 = <userdata>\n heroicIcon = EncounterJournalInstanceSelectScrollFrameinstance12HeroicIcon {\n }\n template = \"Default\"\n link = \"|cff66bbff|Hjournal:0:740:23|h[黑鸦堡垒]|h|r\"\n isSkinned = true\n range = EncounterJournalInstanceSelectScrollFrameinstance12Range {\n }\n instanceID = 740\n bgImage = EncounterJournalInstanceSelectScrollFrameinstance12bgImage {\n }\n backdropTexture = <unnamed> {\n }\n glossTex = true\n name = EncounterJournalInstanceSelectScrollFrameinstance12Name {\n }\n tooltipText = \"黑鸦堡垒是古代的精灵石匠在瓦尔莎拉的山峦中雕砌而成的，在上古之战中它是抵抗燃烧军团的壁垒。这座坚不可摧的要塞同时也是伊利丹曾经的导师库塔洛斯·拉文凯斯领主家族的故园。然而在军团最近的一次攻击之后，一股诡异的黑暗能量开始从要塞中涌出，无情的死亡像瘟疫一样感染了附近的土地。\"\n tooltipTitle = \"黑鸦堡垒\"\n}\nsavedInstance = <table> {\n 1 = <table> {\n }\n}\ndifficultyButton = nil\nencounterProgressButton = nil\ndifficulty = \"\n史诗\"\nencounterProgress = \"\n4/4\"\n(*temporary) = <function> defined =[C]:-1\n(*temporary) = nil\n(*temporary) = <function> defined @Interface\\AddOns\\EncounterJournalPlus_InstanceInfo\\EncounterJournalPlus_InstanceInfo.lua:216\n(*temporary) = 1\n(*temporary) = \"attempt to index local 'difficultyButton' (a nil value)\"\n",
			["stack"] = "...s_InstanceInfo\\EncounterJournalPlus_InstanceInfo-0.1.1.lua:221: in function <...s_InstanceInfo\\EncounterJournalPlus_InstanceInfo.lua:210>\n...s_InstanceInfo\\EncounterJournalPlus_InstanceInfo-0.1.1.lua:280: in function <...s_InstanceInfo\\EncounterJournalPlus_InstanceInfo.lua:275>\n...s_InstanceInfo\\EncounterJournalPlus_InstanceInfo-0.1.1.lua:127: in function <...s_InstanceInfo\\EncounterJournalPlus_InstanceInfo.lua:125>\n[C]: in function `foreach'\n...s_InstanceInfo\\EncounterJournalPlus_InstanceInfo-0.1.1.lua:125: in function <...s_InstanceInfo\\EncounterJournalPlus_InstanceInfo.lua:123>\n...s_InstanceInfo\\EncounterJournalPlus_InstanceInfo-0.1.1.lua:275: in function <...s_InstanceInfo\\EncounterJournalPlus_InstanceInfo.lua:268>\n...s_InstanceInfo\\EncounterJournalPlus_InstanceInfo-0.1.1.lua:332: in function <...s_InstanceInfo\\EncounterJournalPlus_InstanceInfo.lua:316>",
			["session"] = 14,
			["counter"] = 2,
		}, -- [9]
	},
}