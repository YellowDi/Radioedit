
BugGrabberDB = {
	["session"] = 8,
	["lastSanitation"] = 3,
	["errors"] = {
		{
			["message"] = "[ADDON_ACTION_BLOCKED] 插件 'BigFootMark' 尝试调用保护功能 '<unnamed>:ClearAllPoints()'。",
			["time"] = "2016/09/22 22:48:49",
			["locals"] = "",
			["stack"] = "Interface\\AddOns\\!BugGrabber\\BugGrabber.lua:573: in function <Interface\\AddOns\\!BugGrabber\\BugGrabber.lua:573>\n[C]: in function `ClearAllPoints'\nInterface\\FrameXML\\WorldMapFrame.lua:1332: in function `WorldMapFrame_SetOverlayLocation'\nInterface\\FrameXML\\WorldMapFrame.lua:1355: in function `WorldMapFrame_UpdateOverlayLocations'\nInterface\\FrameXML\\WorldMapFrame.lua:481: in function <Interface\\FrameXML\\WorldMapFrame.lua:394>",
			["session"] = 5,
			["counter"] = 1,
		}, -- [1]
		{
			["message"] = "Interface\\AddOns\\DBM-Core\\DBM-Core-7.0.5-16-gee66974.lua:6167: script ran too long",
			["time"] = "2016/09/23 23:46:43",
			["locals"] = "",
			["stack"] = "Interface\\AddOns\\DBM-Core\\DBM-Core-7.0.5-16-gee66974.lua:6167: in function `PlaySoundFile'\nInterface\\AddOns\\DBM-Core\\DBM-Core-7.0.5-16-gee66974.lua:8845: in function `func'\nInterface\\AddOns\\DBM-Core\\DBM-Core-7.0.5-16-gee66974.lua:1533: in function <Interface\\AddOns\\DBM-Core\\DBM-Core.lua:1524>",
			["session"] = 7,
			["counter"] = 1,
		}, -- [2]
		{
			["message"] = "[ADDON_ACTION_BLOCKED] 插件 'BigFootMark' 尝试调用保护功能 '<unnamed>:Hide()'。",
			["time"] = "2016/09/24 00:05:34",
			["locals"] = "",
			["stack"] = "Interface\\AddOns\\!BugGrabber\\BugGrabber.lua:573: in function <Interface\\AddOns\\!BugGrabber\\BugGrabber.lua:573>\n[C]: in function `Hide'\nInterface\\FrameXML\\WorldMapActionButton.lua:58: in function `Clear'\nInterface\\FrameXML\\WorldMapActionButton.lua:67: in function `Refresh'\nInterface\\FrameXML\\WorldMapActionButton.lua:19: in function `SetMapAreaID'\nInterface\\FrameXML\\WorldMapFrame.lua:390: in function <Interface\\FrameXML\\WorldMapFrame.lua:353>\n[C]: in function `Hide'\nInterface\\FrameXML\\UIParent.lua:2320: in function `SetUIPanel'\nInterface\\FrameXML\\UIParent.lua:2347: in function `MoveUIPanel'\nInterface\\FrameXML\\UIParent.lua:2378: in function `HideUIPanel'\nInterface\\FrameXML\\UIParent.lua:2052: in function <Interface\\FrameXML\\UIParent.lua:2044>\n[C]: in function `SetAttribute'\nInterface\\FrameXML\\UIParent.lua:2846: in function `HideUIPanel'\nInterface\\FrameXML\\UIParent.lua:2812: in function `ToggleFrame'\nInterface\\FrameXML\\WorldMapFrame.lua:219: in function `ToggleWorldMap'\n[string \"TOGGLEWORLDMAP\"]:1: in function <[string \"TOGGLEWORLDMAP\"]:1>",
			["session"] = 7,
			["counter"] = 1,
		}, -- [3]
		{
			["message"] = "Interface\\AddOns\\ElvUI_Config\\single.lua:124: HandyNotes isn't registed with AceConfigRegistry, unable to open config",
			["time"] = "2016/09/24 00:45:16",
			["stack"] = "[C]: ?\n....0-ElvUI\\AceConfigDialog-3.0\\AceConfigDialog-3.0-99.lua:1807: in function `Open'\nInterface\\AddOns\\ElvUI_Config\\single.lua:124: in function <Interface\\AddOns\\ElvUI_Config\\single.lua:123>\n(tail call): ?\n[C]: ?\n[string \"safecall Dispatcher[3]\"]:9: in function <[string \"safecall Dispatcher[3]\"]:5>\n(tail call): ?\n....0-ElvUI\\AceConfigDialog-3.0\\AceConfigDialog-3.0-99.lua:805: in function <....0-ElvUI\\AceConfigDialog-3.0\\AceConfigDialog-3.0.lua:620>\n(tail call): ?\n[C]: ?\n[string \"safecall Dispatcher[4]\"]:9: in function <[string \"safecall Dispatcher[4]\"]:5>\n(tail call): ?\nInterface\\AddOns\\Libs\\AceGUI-3.0\\AceGUI-3.0-34.lua:314: in function `Fire'\n...dOns\\Libs\\AceGUI-3.0-34\\widgets\\AceGUIWidget-Button.lua:22: in function <...dOns\\Libs\\AceGUI-3.0\\widgets\\AceGUIWidget-Button.lua:19>",
			["session"] = 8,
			["counter"] = 2,
		}, -- [4]
	},
}
