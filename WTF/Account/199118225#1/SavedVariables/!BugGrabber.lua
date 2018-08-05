
BugGrabberDB = {
	["session"] = 92,
	["lastSanitation"] = 3,
	["errors"] = {
		{
			["message"] = "[ADDON_ACTION_BLOCKED] 插件 'WorldQuestTracker' 尝试调用保护功能 'MultiBarBottomLeft:SetShown()'。",
			["time"] = "2018/07/30 00:11:41",
			["locals"] = "InCombatSkipped",
			["stack"] = "Interface\\AddOns\\!BugGrabber\\BugGrabber.lua:578: in function <Interface\\AddOns\\!BugGrabber\\BugGrabber.lua:578>\n[C]: in function `SetShown'\nInterface\\FrameXML\\MultiActionBars.lua:36: in function <Interface\\FrameXML\\MultiActionBars.lua:34>\nInterface\\FrameXML\\MultiActionBars.lua:57: in function `MultiActionBar_Update'\nInterface\\FrameXML\\InterfaceOptionsPanels.lua:1184: in function `setFunc'\nInterface\\FrameXML\\InterfaceOptionsPanels.lua:87: in function <Interface\\FrameXML\\InterfaceOptionsPanels.lua:83>\n[C]: in function `pcall'\nInterface\\FrameXML\\InterfaceOptionsFrame.lua:217: in function <Interface\\FrameXML\\InterfaceOptionsFrame.lua:216>\n[C]: in function `securecall'\nInterface\\FrameXML\\InterfaceOptionsFrame.lua:252: in function <Interface\\FrameXML\\InterfaceOptionsFrame.lua:248>\n[C]: in function `Click'\nInterface\\FrameXML\\UIParent.lua:3956: in function `ToggleGameMenu'\n[string \"TOGGLEGAMEMENU\"]:1: in function <[string \"TOGGLEGAMEMENU\"]:1>",
			["session"] = 2,
			["counter"] = 1,
		}, -- [1]
		{
			["message"] = "[ADDON_ACTION_BLOCKED] 插件 'Details' 尝试调用保护功能 'CompactPartyFrame:unusedFunc()'。",
			["time"] = "2018/08/01 17:35:41",
			["locals"] = "InCombatSkipped",
			["stack"] = "Interface\\AddOns\\!BugGrabber\\BugGrabber.lua:578: in function <Interface\\AddOns\\!BugGrabber\\BugGrabber.lua:578>\n[C]: in function `unusedFunc'\n...actRaidFrames\\Blizzard_CompactRaidFrameContainer.lua:160: in function `CompactRaidFrameContainer_LayoutFrames'\n...actRaidFrames\\Blizzard_CompactRaidFrameContainer.lua:130: in function `CompactRaidFrameContainer_TryUpdate'\n...actRaidFrames\\Blizzard_CompactRaidFrameContainer.lua:57: in function `CompactRaidFrameContainer_OnEvent'\n[string \"*:OnEvent\"]:1: in function <[string \"*:OnEvent\"]:1>",
			["session"] = 13,
			["counter"] = 1,
		}, -- [2]
		{
			["message"] = "[ADDON_ACTION_FORBIDDEN] 插件 'OrderHallCommander' 尝试调用保护功能 'CastItemSpellOnFollowerAbility()'。",
			["time"] = "2018/08/03 20:41:59",
			["stack"] = "Interface\\AddOns\\!BugGrabber\\BugGrabber.lua:578: in function <Interface\\AddOns\\!BugGrabber\\BugGrabber.lua:578>\n[C]: in function `CastItemSpellOnFollowerAbility'\n...rrisonTemplates\\Blizzard_GarrisonSharedTemplates.lua:59: in function `OnAccept'\nInterface\\FrameXML\\StaticPopup.lua:4964: in function `StaticPopup_OnClick'\n[string \"*:OnClick\"]:1: in function <[string \"*:OnClick\"]:1>",
			["session"] = 41,
			["counter"] = 1,
		}, -- [3]
		{
			["message"] = "[ADDON_ACTION_FORBIDDEN] 插件 'TinyChat' 尝试调用保护功能 'UseQuestLogSpecialItem()'。",
			["time"] = "2018/08/03 22:58:06",
			["stack"] = "Interface\\AddOns\\!BugGrabber\\BugGrabber.lua:578: in function <Interface\\AddOns\\!BugGrabber\\BugGrabber.lua:578>\n[C]: in function `UseQuestLogSpecialItem'\n...ObjectiveTracker\\Blizzard_ObjectiveTrackerShared.lua:95: in function <...ObjectiveTracker\\Blizzard_ObjectiveTrackerShared.lua:88>",
			["session"] = 51,
			["counter"] = 1,
		}, -- [4]
		{
			["message"] = "[ADDON_ACTION_FORBIDDEN] 插件 'AngryKeystones' 尝试调用保护功能 'GuildControlSetRank()'。",
			["time"] = "2018/08/05 04:28:18",
			["stack"] = "Interface\\AddOns\\!BugGrabber\\BugGrabber.lua:578: in function <Interface\\AddOns\\!BugGrabber\\BugGrabber.lua:578>\n[C]: in function `GuildControlSetRank'\n...\\Blizzard_GuildControlUI\\Blizzard_GuildControlUI.lua:24: in function <...\\Blizzard_GuildControlUI\\Blizzard_GuildControlUI.lua:7>\n[C]: in function `LoadAddOn'\nInterface\\FrameXML\\UIParent.lua:445: in function `UIParentLoadAddOn'\nInterface\\FrameXML\\UIParent.lua:691: in function `Communities_LoadUI'\nInterface\\FrameXML\\UIParent.lua:925: in function `ToggleCommunitiesFrame'\nInterface\\FrameXML\\UIParent.lua:812: in function <Interface\\FrameXML\\UIParent.lua:791>",
			["session"] = 61,
			["counter"] = 1,
		}, -- [5]
		{
			["message"] = "[ADDON_ACTION_BLOCKED] 插件 'oUF_Abu' 尝试调用保护功能 'CompactRaidFrame1:SetAttribute()'。",
			["time"] = "2018/08/05 10:16:22",
			["locals"] = "InCombatSkipped",
			["stack"] = "Interface\\AddOns\\!BugGrabber\\BugGrabber.lua:578: in function <Interface\\AddOns\\!BugGrabber\\BugGrabber.lua:578>\n[C]: in function `SetAttribute'\nInterface\\AddOns\\oUF_Abu\\Init.lua:74: in function <Interface\\AddOns\\oUF_Abu\\Init.lua:72>\n[C]: in function `CompactUnitFrame_SetUpFrame'\n...actRaidFrames\\Blizzard_CompactRaidFrameContainer.lua:347: in function `CompactRaidFrameContainer_GetUnitFrame'\n...actRaidFrames\\Blizzard_CompactRaidFrameContainer.lua:317: in function `CompactRaidFrameContainer_AddUnitFrame'\n...actRaidFrames\\Blizzard_CompactRaidFrameContainer.lua:277: in function `CompactRaidFrameContainer_AddPets'\n...actRaidFrames\\Blizzard_CompactRaidFrameContainer.lua:182: in function `CompactRaidFrameContainer_LayoutFrames'\n...actRaidFrames\\Blizzard_CompactRaidFrameContainer.lua:130: in function `CompactRaidFrameContainer_TryUpdate'\n...actRaidFrames\\Blizzard_CompactRaidFrameContainer.lua:62: in function `CompactRaidFrameContainer_OnEvent'\n[string \"*:OnEvent\"]:1: in function <[string \"*:OnEvent\"]:1>",
			["session"] = 64,
			["counter"] = 1,
		}, -- [6]
		{
			["message"] = "[ADDON_ACTION_BLOCKED] 插件 'oUF' 尝试调用保护功能 'oUF_AbuPlayer:SetSize()'。",
			["time"] = "2018/08/05 10:33:27",
			["locals"] = "InCombatSkipped",
			["stack"] = "Interface\\AddOns\\!BugGrabber\\BugGrabber.lua:578: in function <Interface\\AddOns\\!BugGrabber\\BugGrabber.lua:578>\n[C]: in function `SetSize'\nInterface\\AddOns\\oUF_Abu\\Layout.lua:231: in function `func'\nInterface\\AddOns\\oUF\\events.lua:50: in function <Interface\\AddOns\\oUF\\events.lua:48>\n(tail call): ?",
			["session"] = 65,
			["counter"] = 1,
		}, -- [7]
		{
			["message"] = "Deferred XML Node object named OmniCC_TabPanelTemplate already exists",
			["time"] = "2018/08/05 04:55:53",
			["stack"] = "Interface\\AddOns\\!BugGrabber\\BugGrabber.lua:578: in function <Interface\\AddOns\\!BugGrabber\\BugGrabber.lua:578>",
			["session"] = 70,
			["counter"] = 12,
		}, -- [8]
		{
			["message"] = "Error loading Interface\\AddOns\\oUF_AbuOptions\\aurapanels.lua",
			["time"] = "2018/08/05 04:55:53",
			["stack"] = "Interface\\AddOns\\!BugGrabber\\BugGrabber.lua:578: in function <Interface\\AddOns\\!BugGrabber\\BugGrabber.lua:578>",
			["session"] = 70,
			["counter"] = 9,
		}, -- [9]
		{
			["message"] = "Error loading Interface\\AddOns\\!!!Libs\\!External\\LibGraph-2.0\\LibGraph-2.0-90055.lua",
			["time"] = "2018/08/05 21:58:47",
			["stack"] = "Interface\\AddOns\\!BugGrabber\\BugGrabber.lua:578: in function <Interface\\AddOns\\!BugGrabber\\BugGrabber.lua:578>",
			["session"] = 89,
			["counter"] = 16,
		}, -- [10]
		{
			["message"] = "Interface\\AddOns\\Castbars\\Castbars.lua:1: Cannot find a library instance of \"AceAddon-3.0\".",
			["time"] = "2018/08/06 01:24:36",
			["locals"] = "(*temporary) = \"Cannot find a library instance of \"AceAddon-3.0\".\"\n",
			["stack"] = "[C]: in function `error'\nInterface\\AddOns\\BugSack\\Libs\\LibStub\\LibStub.lua:38: in function `LibStub'\nInterface\\AddOns\\Castbars\\Castbars.lua:1: in main chunk",
			["session"] = 90,
			["counter"] = 1,
		}, -- [11]
		{
			["message"] = "Error loading Interface\\AddOns\\Castbars\\Libs\\LibStub\\LibStub.lua",
			["time"] = "2018/08/06 01:24:40",
			["stack"] = "Interface\\AddOns\\!BugGrabber\\BugGrabber.lua:578: in function <Interface\\AddOns\\!BugGrabber\\BugGrabber.lua:578>",
			["session"] = 90,
			["counter"] = 1,
		}, -- [12]
		{
			["message"] = "Couldn't open Interface\\AddOns\\Castbars\\Libs\\CallbackHandler-1.0-7\\CallbackHandler-1.0.xml",
			["time"] = "2018/08/06 01:24:40",
			["stack"] = "Interface\\AddOns\\!BugGrabber\\BugGrabber.lua:578: in function <Interface\\AddOns\\!BugGrabber\\BugGrabber.lua:578>",
			["session"] = 90,
			["counter"] = 1,
		}, -- [13]
		{
			["message"] = "Couldn't open Interface\\AddOns\\Castbars\\Libs\\AceAddon-3.0-12\\AceAddon-3.0.xml",
			["time"] = "2018/08/06 01:24:40",
			["stack"] = "Interface\\AddOns\\!BugGrabber\\BugGrabber.lua:578: in function <Interface\\AddOns\\!BugGrabber\\BugGrabber.lua:578>",
			["session"] = 90,
			["counter"] = 1,
		}, -- [14]
		{
			["message"] = "Couldn't open Interface\\AddOns\\Castbars\\Libs\\AceGUI-3.0-36\\AceGUI-3.0.xml",
			["time"] = "2018/08/06 01:24:40",
			["stack"] = "Interface\\AddOns\\!BugGrabber\\BugGrabber.lua:578: in function <Interface\\AddOns\\!BugGrabber\\BugGrabber.lua:578>",
			["session"] = 90,
			["counter"] = 1,
		}, -- [15]
		{
			["message"] = "Couldn't open Interface\\AddOns\\Castbars\\Libs\\AceConfig-3.0-3\\AceConfig-3.0.xml",
			["time"] = "2018/08/06 01:24:40",
			["stack"] = "Interface\\AddOns\\!BugGrabber\\BugGrabber.lua:578: in function <Interface\\AddOns\\!BugGrabber\\BugGrabber.lua:578>",
			["session"] = 90,
			["counter"] = 1,
		}, -- [16]
		{
			["message"] = "Couldn't open Interface\\AddOns\\Castbars\\Libs\\AceConsole-3.0-7\\AceConsole-3.0.xml",
			["time"] = "2018/08/06 01:24:40",
			["stack"] = "Interface\\AddOns\\!BugGrabber\\BugGrabber.lua:578: in function <Interface\\AddOns\\!BugGrabber\\BugGrabber.lua:578>",
			["session"] = 90,
			["counter"] = 1,
		}, -- [17]
		{
			["message"] = "Couldn't open Interface\\AddOns\\Castbars\\Libs\\AceDB-3.0-26\\AceDB-3.0.xml",
			["time"] = "2018/08/06 01:24:40",
			["stack"] = "Interface\\AddOns\\!BugGrabber\\BugGrabber.lua:578: in function <Interface\\AddOns\\!BugGrabber\\BugGrabber.lua:578>",
			["session"] = 90,
			["counter"] = 1,
		}, -- [18]
		{
			["message"] = "Couldn't open Interface\\AddOns\\Castbars\\Libs\\AceDBOptions-3.0-15\\AceDBOptions-3.0.xml",
			["time"] = "2018/08/06 01:24:40",
			["stack"] = "Interface\\AddOns\\!BugGrabber\\BugGrabber.lua:578: in function <Interface\\AddOns\\!BugGrabber\\BugGrabber.lua:578>",
			["session"] = 90,
			["counter"] = 1,
		}, -- [19]
		{
			["message"] = "Couldn't open Interface\\AddOns\\Castbars\\Libs\\LibSharedMedia-3.0-6010002\\lib.xml",
			["time"] = "2018/08/06 01:24:40",
			["stack"] = "Interface\\AddOns\\!BugGrabber\\BugGrabber.lua:578: in function <Interface\\AddOns\\!BugGrabber\\BugGrabber.lua:578>",
			["session"] = 90,
			["counter"] = 1,
		}, -- [20]
		{
			["message"] = "Couldn't open Interface\\AddOns\\oUF_Abu\\Libs\\libs.xml",
			["time"] = "2018/08/05 04:55:18",
			["stack"] = "Interface\\AddOns\\!BugGrabber\\BugGrabber.lua:578: in function <Interface\\AddOns\\!BugGrabber\\BugGrabber.lua:578>",
			["session"] = 92,
			["counter"] = 87,
		}, -- [21]
	},
}
