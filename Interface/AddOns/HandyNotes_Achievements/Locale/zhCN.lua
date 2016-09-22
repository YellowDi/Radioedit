-- Copyright 2016, r. brian harrison.  all rights reserved.

local ADDON_NAME = ...
local AceLocale = LibStub:GetLibrary("AceLocale-3.0")
assert(AceLocale, string.format("%s requires AceLocale-3.0", ADDON_NAME))

local L = AceLocale:NewLocale(ADDON_NAME, "zhCN")
if not L then return end

-- import

L["%s requires %s"] = true

-- config
L["Achievements"] = "成就"
L["Icon Scale"] = "图标尺寸"
L["The size of the icons."] = "图标的尺寸大小"
L["Icon Alpha"] = "图标的透明度"
L["The transparency of the icons."] = "图标的透明度"
L["Show Completed"] = "显示已完成"
L["Show map pins for achievements you have completed."] = "在地图上显示你已完成的成就座标"
L["Consolidate Zone Pins"] = "整合区域点"
L["Show fewer map pins."] = "在地图上显示较少的点"
L["Just Mine"] = "只显示我的"
L["Show more map pins by including achievements completed only by other characters."] = "显示更多的点包括已被其它角色完成的成就"
L["Season Warning"] = "节日警告"
L["Days in advance to show pins for seasonal holiday achievements."] = "提前显示节日成就"
