-- Copyright 2016, r. brian harrison.  all rights reserved.

local ADDON_NAME = ...
local AceLocale = LibStub:GetLibrary("AceLocale-3.0")
assert(AceLocale, string.format("%s requires AceLocale-3.0", ADDON_NAME))

local L = AceLocale:NewLocale(ADDON_NAME, "zhTW")
if not L then return end

-- import

L["%s requires %s"] = true

-- config
L["Achievements"] = "成就"
L["Icon Scale"] = "圖示尺寸"
L["The size of the icons."] = "圖示的尺寸大小"
L["Icon Alpha"] = "圖示的透明度"
L["The transparency of the icons."] = "圖示的透明度"
L["Show Completed"] = "顯示已完成"
L["Show map pins for achievements you have completed."] = "在地圖上顯示你已完成的成就座標"
L["Consolidate Zone Pins"] = "整合區域點"
L["Show fewer map pins."] = "在地圖上顯示較少的點"
L["Just Mine"] = "只顯示我的"
L["Show more map pins by including achievements completed only by other characters."] = "顯示更多的點包括已被其它角色完成的成就"
L["Season Warning"] = "節日警告"
L["Days in advance to show pins for seasonal holiday achievements."] = "提前顯示節日成就"
