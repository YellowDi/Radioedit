
BugGrabberDB = {
	["session"] = 48,
	["lastSanitation"] = 3,
	["errors"] = {
		{
			["message"] = "C stack overflow",
			["time"] = "2018/11/28 17:07:12",
			["locals"] = "(*temporary) = DetailsOptionsWindow {\n 0 = <userdata>\n full_created = true\n __var_Frame = DetailsOptionsWindow {\n }\n CheckButton = DetailsOptionsWindowDisable3D {\n }\n OpenInPluginPanel = <function> defined @Interface\\AddOns\\Details\\gumps\\janela_options.lua:12154\n __var_Utility = true\n __name = \"Options\"\n instance = <table> {\n }\n MyObject = <table> {\n }\n ScaleBar = <table> {\n }\n __background = <unnamed> {\n }\n real_name = \"DETAILS_OPTIONS\"\n RefreshWindow = <function> defined @Interface\\AddOns\\Details\\gumps\\janela_options.lua:98\n Initialized = true\n Gradient = <table> {\n }\n Frame = DetailsOptionsWindow {\n }\n __icon = \"Interface\\Scenarios\\ScenarioIcon-Interact\"\n}\n(*temporary) = <function> defined =[C]:-1\n(*temporary) = DetailsOptionsWindow {\n 0 = <userdata>\n full_created = true\n __var_Frame = DetailsOptionsWindow {\n }\n CheckButton = DetailsOptionsWindowDisable3D {\n }\n OpenInPluginPanel = <function> defined @Interface\\AddOns\\Details\\gumps\\janela_options.lua:12154\n __var_Utility = true\n __name = \"Options\"\n instance = <table> {\n }\n MyObject = <table> {\n }\n ScaleBar = <table> {\n }\n __background = <unnamed> {\n }\n real_name = \"DETAILS_OPTIONS\"\n RefreshWindow = <function> defined @Interface\\AddOns\\Details\\gumps\\janela_options.lua:98\n Initialized = true\n Gradient = <table> {\n }\n Frame = DetailsOptionsWindow {\n }\n __icon = \"Interface\\Scenarios\\ScenarioIcon-Interact\"\n}\n = <function> defined =[C]:-1\n = <function> defined @Interface\\AddOns\\Details\\core\\plugins.lua:619\n",
			["stack"] = "[C]: ?\n[C]: ?\n[C]: ?\n[C]: ?\n[C]: ?\n[C]: ?\n[C]: ?\n[C]: ?\n[C]: ?\n[C]: ?\n[C]: ?\n[C]: ?\n...\n[C]: ?\n[C]: ?\n[C]: ?\n[C]: ?\n[C]: ?\n[C]: ?\n[C]: in function `Hide'\nInterface\\FrameXML\\UIParent.lua:3150: in function `HideUIPanel'\nInterface\\SharedXML\\SharedUIPanelTemplates.lua:316: in function `HideParentPanel'\n[string \"*:OnClick\"]:1: in function <[string \"*:OnClick\"]:1>",
			["session"] = 18,
			["counter"] = 1,
		}, -- [1]
		{
			["message"] = "...erface\\AddOns\\TidyPlatesContinued\\TidyPlatesCore.lua:167: attempt to index a nil value",
			["time"] = "2018/11/28 17:31:19",
			["locals"] = "self = <unnamed> {\n 0 = <userdata>\n}\ne = 0.016000000759959\nplate = nil\ncurChildren = nil\n(for generator) = <function> defined =[C]:-1\n(for state) = <table> {\n (null) = \"nameplate1\"\n}\n(for control) = NamePlate1 {\n 0 = <userdata>\n unitFrame = ElvUI_NamePlate1 {\n }\n carrier = TidyPlatesContCarrier-1 {\n }\n UpdateHealth = false\n UpdateMe = false\n extended = <unnamed> {\n }\n}\nplate = NamePlate1 {\n 0 = <userdata>\n unitFrame = ElvUI_NamePlate1 {\n }\n carrier = TidyPlatesContCarrier-1 {\n }\n UpdateHealth = false\n UpdateMe = false\n extended = <unnamed> {\n }\n}\nUpdateMe = true\nUpdateHealth = nil\ncarrier = TidyPlatesContCarrier-1 {\n 0 = <userdata>\n}\nextended = <unnamed> {\n 0 = <userdata>\n stylename = \"Default\"\n requestedAlpha = 0.35\n unitcache = <table> {\n }\n widgetParent = <unnamed> {\n }\n widgets = <table> {\n }\n regions = <table> {\n }\n Active = true\n stylecache = <table> {\n }\n style = <table> {\n }\n unit = <table> {\n }\n bars = <table> {\n }\n defaultLevel = 20\n visual = <table> {\n }\n}\n(*temporary) = nil\n(*temporary) = nil\n(*temporary) = \"attempt to index a nil value\"\nHasMouseover = false\nSetUpdateAll = <function> defined @Interface\\AddOns\\TidyPlatesContinued\\TidyPlatesCore.lua:61\npairs = <function> defined =[C]:-1\nPlatesVisible = <table> {\n (null) = \"nameplate1\"\n}\nUpdateAll = false\nOnHealthUpdate = <function> defined @Interface\\AddOns\\TidyPlatesContinued\\TidyPlatesCore.lua:453\nOnUpdateNameplate = <function> defined @Interface\\AddOns\\TidyPlatesContinued\\TidyPlatesCore.lua:437\n",
			["stack"] = "...erface\\AddOns\\TidyPlatesContinued\\TidyPlatesCore.lua:167: in function <...erface\\AddOns\\TidyPlatesContinued\\TidyPlatesCore.lua:141>",
			["session"] = 28,
			["counter"] = 679,
		}, -- [2]
		{
			["message"] = "...terface\\AddOns\\ElvUI_BenikUI\\modules\\misc\\ilevel.lua:74: attempt to index field 'f' (a nil value)",
			["time"] = "2018/11/28 20:26:20",
			["stack"] = "...terface\\AddOns\\ElvUI_BenikUI\\modules\\misc\\ilevel.lua:74: in function `UpdateItemLevel'\n...erface\\AddOns\\ElvUI_BenikUI\\modules\\misc\\options-设置选项.lua:46: in function <...erface\\AddOns\\ElvUI_BenikUI\\modules\\misc\\options.lua:46>\n[C]: ?\n...nfig-3.0\\AceConfigDialog-3.0\\AceConfigDialog-3.0-67.lua:50: in function <...nfig-3.0\\AceConfigDialog-3.0\\AceConfigDialog-3.0.lua:48>\n...nfig-3.0\\AceConfigDialog-3.0\\AceConfigDialog-3.0-67.lua:789: in function <...nfig-3.0\\AceConfigDialog-3.0\\AceConfigDialog-3.0.lua:610>\n[C]: ?\n...terface\\AddOns\\Masque\\Libs\\AceGUI-3.0\\AceGUI-3.0-36.lua:71: in function <...terface\\AddOns\\Masque\\Libs\\AceGUI-3.0\\AceGUI-3.0.lua:69>\n...terface\\AddOns\\Masque\\Libs\\AceGUI-3.0\\AceGUI-3.0-36.lua:285: in function `Fire'\n...CT\\Libs\\AceGUI-3.0-36-SharedMediaWidgets\\FontWidget.lua:23: in function <...CT\\Libs\\AceGUI-3.0-SharedMediaWidgets\\FontWidget.lua:21>",
			["session"] = 32,
			["counter"] = 1,
		}, -- [3]
		{
			["message"] = "[ADDON_ACTION_BLOCKED] 插件 'ElvUI_SLE' 尝试调用保护功能 'CollectionsJournal:EnableMouse()'。",
			["time"] = "2018/11/29 22:38:01",
			["locals"] = "InCombatSkipped",
			["stack"] = "Interface\\AddOns\\!BugGrabber\\BugGrabber.lua:519: in function <Interface\\AddOns\\!BugGrabber\\BugGrabber.lua:519>\n[C]: in function `EnableMouse'\nInterface\\AddOns\\ElvUI_SLE\\modules\\blizzard.lua:193: in function `MakeMovable'\nInterface\\AddOns\\ElvUI_SLE\\modules\\blizzard.lua:238: in function `?'\n...que\\Libs\\CallbackHandler-1.0\\CallbackHandler-1.0-7.lua:119: in function <...que\\Libs\\CallbackHandler-1.0\\CallbackHandler-1.0.lua:119>\n[C]: ?\n...que\\Libs\\CallbackHandler-1.0\\CallbackHandler-1.0-7.lua:29: in function <...que\\Libs\\CallbackHandler-1.0\\CallbackHandler-1.0.lua:25>\n...que\\Libs\\CallbackHandler-1.0\\CallbackHandler-1.0-7.lua:64: in function `Fire'\n...AddOns\\ElvUI\\Libraries\\AceEvent-3.0\\AceEvent-3.0-4.lua:120: in function <...AddOns\\ElvUI\\Libraries\\AceEvent-3.0\\AceEvent-3.0.lua:119>\n[C]: ?\n[C]: in function `LoadAddOn'\nInterface\\FrameXML\\UIParent.lua:446: in function `UIParentLoadAddOn'\nInterface\\FrameXML\\UIParent.lua:612: in function `CollectionsJournal_LoadUI'\nInterface\\FrameXML\\UIParent.lua:952: in function `SetCollectionsJournalShown'\nInterface\\FrameXML\\UIParent.lua:946: in function `ToggleCollectionsJournal'\n[string \"TOGGLECOLLECTIONS\"]:1: in function <[string \"TOGGLECOLLECTIONS\"]:1>",
			["session"] = 43,
			["counter"] = 1,
		}, -- [4]
		{
			["message"] = "[ADDON_ACTION_BLOCKED] 插件 'ElvUI_WindTools' 尝试调用保护功能 'CollectionsJournal:EnableMouse()'。",
			["time"] = "2018/11/29 22:38:01",
			["locals"] = "InCombatSkipped",
			["stack"] = "Interface\\AddOns\\!BugGrabber\\BugGrabber.lua:519: in function <Interface\\AddOns\\!BugGrabber\\BugGrabber.lua:519>\n[C]: in function `EnableMouse'\n...vUI_WindTools\\Modules\\More\\EnhancedBlizzardFrame.lua:182: in function `MakeMovable'\n...vUI_WindTools\\Modules\\More\\EnhancedBlizzardFrame.lua:233: in function `?'\n...que\\Libs\\CallbackHandler-1.0\\CallbackHandler-1.0-7.lua:119: in function <...que\\Libs\\CallbackHandler-1.0\\CallbackHandler-1.0.lua:119>\n[C]: ?\n...que\\Libs\\CallbackHandler-1.0\\CallbackHandler-1.0-7.lua:29: in function <...que\\Libs\\CallbackHandler-1.0\\CallbackHandler-1.0.lua:25>\n...que\\Libs\\CallbackHandler-1.0\\CallbackHandler-1.0-7.lua:64: in function `Fire'\n...AddOns\\ElvUI\\Libraries\\AceEvent-3.0\\AceEvent-3.0-4.lua:120: in function <...AddOns\\ElvUI\\Libraries\\AceEvent-3.0\\AceEvent-3.0.lua:119>\n[C]: ?\n[C]: in function `LoadAddOn'\nInterface\\FrameXML\\UIParent.lua:446: in function `UIParentLoadAddOn'\nInterface\\FrameXML\\UIParent.lua:612: in function `CollectionsJournal_LoadUI'\nInterface\\FrameXML\\UIParent.lua:952: in function `SetCollectionsJournalShown'\nInterface\\FrameXML\\UIParent.lua:946: in function `ToggleCollectionsJournal'\n[string \"TOGGLECOLLECTIONS\"]:1: in function <[string \"TOGGLECOLLECTIONS\"]:1>",
			["session"] = 43,
			["counter"] = 1,
		}, -- [5]
		{
			["message"] = "[ADDON_ACTION_BLOCKED] 插件 'ElvUI_Config' 尝试调用保护功能 'CollectionsJournal:Hide()'。",
			["time"] = "2018/11/29 22:38:09",
			["locals"] = "InCombatSkipped",
			["stack"] = "Interface\\AddOns\\!BugGrabber\\BugGrabber.lua:519: in function <Interface\\AddOns\\!BugGrabber\\BugGrabber.lua:519>\n[C]: in function `Hide'\nInterface\\FrameXML\\UIParent.lua:3292: in function <Interface\\FrameXML\\UIParent.lua:3287>\n...nfig-3.0\\AceConfigDialog-3.0\\AceConfigDialog-3.0-67.lua:1837: in function <...nfig-3.0\\AceConfigDialog-3.0\\AceConfigDialog-3.0.lua:1836>\n[C]: in function `securecall'\nInterface\\FrameXML\\UIParent.lua:3330: in function `CloseWindows'\nInterface\\FrameXML\\UIParent.lua:3355: in function <Interface\\FrameXML\\UIParent.lua:3345>\n[C]: in function `securecall'\nInterface\\FrameXML\\UIParent.lua:3983: in function `ToggleGameMenu'\n[string \"TOGGLEGAMEMENU\"]:1: in function <[string \"TOGGLEGAMEMENU\"]:1>",
			["session"] = 43,
			["counter"] = 1,
		}, -- [6]
		{
			["message"] = "Interface\\FrameXML\\StaticPopup.lua:4447: bad argument #2 to 'SetFormattedText' (number expected, got nil)",
			["time"] = "2018/11/28 18:06:51",
			["locals"] = "(*temporary) = StaticPopup1Text {\n 0 = <userdata>\n text_arg1 = \"|cff82c5ff可爱的熊孩子|r邀请你加入队伍\"\n}\n(*temporary) = \"针对此项活动，你的队伍人数已满（%d），将被移出列表。\"\n(*temporary) = nil\n(*temporary) = nil\n(*temporary) = \"number expected, got nil\"\n",
			["stack"] = "[C]: in function `SetFormattedText'\nInterface\\FrameXML\\StaticPopup.lua:4447: in function <Interface\\FrameXML\\StaticPopup.lua:4298>\n[C]: in function `StaticPopup_Show'\nInterface\\FrameXML\\LFGList.lua:165: in function <Interface\\FrameXML\\LFGList.lua:110>",
			["session"] = 43,
			["counter"] = 5,
		}, -- [7]
		{
			["message"] = "Interface\\FrameXML\\CharacterFrame.lua:184: attempt to perform arithmetic on a nil value",
			["time"] = "2018/11/28 17:07:51",
			["locals"] = "self = CharacterFrameTab1 {\n 0 = <userdata>\n backdrop = <unnamed> {\n }\n}\n(*temporary) = nil\n(*temporary) = nil\n(*temporary) = CharacterFrame {\n 0 = <userdata>\n TitleText = CharacterFrameTitleText {\n }\n portrait = CharacterFramePortrait {\n }\n LeftBorder = CharacterFrameLeftBorder {\n }\n TopRightCorner = CharacterFrameTopRightCorner {\n }\n TopLeftCorner = CharacterFrameTopLeftCorner {\n }\n Bg = CharacterFrameBg {\n }\n SetPoint = <function> defined =[C]:-1\n ignoreFramePositionManager = true\n TopBorder = CharacterFrameTopBorder {\n }\n ReputationTabHelpBox = <unnamed> {\n }\n TopTileStreaks = CharacterFrameTopTileStreaks {\n }\n TitleBg = CharacterFrameTitleBg {\n }\n BottomBorder = CharacterFrameBottomBorder {\n }\n template = \"Transparent\"\n OnLoad = <function> defined @Interface\\SharedXML\\SharedUIPanelTemplates.lua:860\n numTabs = 3\n BotRightCorner = CharacterFrameBotRightCorner {\n }\n Inset = CharacterFrameInset {\n }\n CloseButton = CharacterFrameCloseButton {\n }\n BotLeftCorner = CharacterFrameBotLeftCorner {\n }\n PortraitFrame = CharacterFramePortraitFrame {\n }\n selectedTab = 1\n RightBorder = CharacterFrameRightBorder {\n }\n}\n(*temporary) = nil\n(*temporary) = <function> defined @Interface\\SharedXML\\SharedUIPanelTemplates.lua:446\n(*temporary) = CharacterFrameTab3 {\n 0 = <userdata>\n backdrop = <unnamed> {\n }\n}\n(*temporary) = 0\n(*temporary) = nil\n(*temporary) = 36\n(*temporary) = 88\n(*temporary) = \"attempt to perform arithmetic on a nil value\"\nNUM_CHARACTERFRAME_TABS = 3\nCharTabtable = <table> {\n}\nCompareFrameSize = <function> defined @Interface\\FrameXML\\CharacterFrame.lua:170\n",
			["stack"] = "Interface\\FrameXML\\CharacterFrame.lua:184: in function `CharacterFrame_TabBoundsCheck'\n[string \"*:OnShow\"]:2: in function <[string \"*:OnShow\"]:1>\n[C]: in function `Show'\nInterface\\FrameXML\\UIParent.lua:3134: in function `ShowUIPanel'\nInterface\\FrameXML\\CharacterFrame.lua:21: in function `ToggleCharacter'\n[string \"TOGGLECHARACTER0\"]:1: in function <[string \"TOGGLECHARACTER0\"]:1>",
			["session"] = 47,
			["counter"] = 39,
		}, -- [8]
	},
}
