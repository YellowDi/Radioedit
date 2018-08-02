
BugGrabberDB = {
	["lastSanitation"] = 3,
	["session"] = 39,
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
	},
}
