-- Talent Set Manager
-- by Jadya - EU Well of Eternity

local addonName, addonTable = ...

local locale = GetLocale()
addonTable.L = {}
local L = addonTable.L

local debug
--[===[@debug@
debug = true
--@end-debug@]===]

if debug then
 L["talent_sets"] = "Talent Set Manager"
 L["set_already_exists"] = "A talent set with that name already exists"
 L["sets_limit_reached"] = "You cannot create any more new talent sets."
 L["confirm_save_set"] = "Would you like to save the talent set '%s'?"
 L["confirm_delete_set"] = "Are you sure you want to delete the talent set %s?"
 L["confirm_overwrite_set"] = "You already have a talent set named %s. Would you like to overwrite it?"
end

if locale == "esES" then 
L["confirm_delete_set"] = "Are you sure you want to delete the talent set %s?" -- Requires localization
L["confirm_overwrite_set"] = "You already have a talent set named %s. Would you like to overwrite it?" -- Requires localization
L["confirm_save_set"] = "Would you like to save the talent set '%s'?" -- Requires localization
L["set_already_exists"] = "A talent set with that name already exists" -- Requires localization
L["sets_limit_reached"] = "You cannot create any more new talent sets." -- Requires localization
L["talent_sets"] = "Talent Set Manager" -- Requires localization

elseif locale == "esMX" then 
L["confirm_delete_set"] = "Are you sure you want to delete the talent set %s?" -- Requires localization
L["confirm_overwrite_set"] = "You already have a talent set named %s. Would you like to overwrite it?" -- Requires localization
L["confirm_save_set"] = "Would you like to save the talent set '%s'?" -- Requires localization
L["set_already_exists"] = "A talent set with that name already exists" -- Requires localization
L["sets_limit_reached"] = "You cannot create any more new talent sets." -- Requires localization
L["talent_sets"] = "Talent Set Manager" -- Requires localization

elseif locale == "zhCN" then
L["confirm_delete_set"] = "你确信要删除天赋配置 %s?"
L["confirm_overwrite_set"] = "你已有一个名为 %s 的天赋配置. 你想覆盖么?"
L["confirm_save_set"] = "你想保存天赋配置 '%s'?"
L["set_already_exists"] = "同名的天赋配置已经存在"
L["sets_limit_reached"] = "你不能新建更多的天赋配置了."
L["talent_sets"] = "天赋配置管理"

elseif locale =="zhTW" then
L["confirm_delete_set"] ="你確信要删除天賦配寘%s？"
L["confirm_overwrite_set"] ="你已有一個名為%s的天賦配寘.你想覆蓋麼？"
L["confirm_save_set"] ="你想保存天賦配寘'%s'？"
L["set_already_exists"] ="同名的天賦配寘已經存在"
L["sets_limit_reached"] ="你不能新建更多的天賦配寘了."
L["talent_sets"] ="天賦配置管理"

else -- enUS
L["confirm_delete_set"] = "Are you sure you want to delete the talent set %s?"
L["confirm_overwrite_set"] = "You already have a talent set named %s. Would you like to overwrite it?"
L["confirm_save_set"] = "Would you like to save the talent set '%s'?"
L["set_already_exists"] = "A talent set with that name already exists"
L["sets_limit_reached"] = "You cannot create any more new talent sets."
L["talent_sets"] = "Talent Set Manager"

end