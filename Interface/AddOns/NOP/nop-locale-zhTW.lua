-- Chinese Traditional localization file for zhTW. by a9012456, BNSSNB
local ADDON = ...
local _ ;
local AceLocale = LibStub:GetLibrary("AceLocale-3.0");
local L = AceLocale:NewLocale(ADDON, "zhTW");
if not L then return end

L["NOP_TITLE"] = "New Openables"
L["NOP_VERSION"] = "|cFFFFFFFF%s 使用 |cFFFF00FF/nop|cFFFFFFFF"

L["ALT-LeftClick and drag to move."] = "ALT-左鍵點擊拖曳移動。"
L["LeftClick to open or use."] = "左鍵點擊開啟或使用。"
L["RightClick to skip item."] = "右鍵點擊略過物品"
L["CTRL-RightClick to blacklist item."] = "CTRL-右鍵點擊到黑名單物品。"
L["No openable items!"] = "沒有可開啟物品!"
L["Reset and move button to middle of screen!"] = "重置並移動按鈕到螢幕中間!"
L["Use: "] = "使用:"
L["Spell:"] = "施法:"
L["|cFFFF00FFPermanently blacklisted items:"] = "|cFFFF00FF永遠黑名單物品:"
L["|cFFFF00FFPermanent blacklist is empty"] = "|cFFFF00FF永遠黑名單是空的"
L["Permanently Blacklisted:|cFF00FF00"] = "永遠黑名單:|cFF00FF00"
L["Session Blacklisted:|cFF00FF00"] = "本次上線黑名單:|cFF00FF00"
L["Temporary Blacklisted:|cFF00FF00"] = "臨時黑名單:|cFF00FF00"
L["|cFFFF0000Error loading tooltip for|r "] = "|cFFFF0000錯誤載入提示|r "
L["Plans, patterns and recipes cache update."] = "計畫、圖案和配方快取更新。"
L["Spell patterns cache update."] = "施法圖案快取更新。"
L["|cFFFF0000Error loading tooltip for spell |r "] = "|cFFFF0000法術錯誤載入提示 |r "
L["|cFFFF0000Error loading tooltip for spellID %d"] = "|cFFFF0000%d 法術ID錯誤載入提示"
L["Toggle"] = "切換"
L["Skin Button"] = "皮膚按鈕"
L["Masque Enable"] = true
L["Need UI reload or relogin to activate."] = true
L["Lock Button"] = "鎖定按鈕"
L["Lock button in place to disbale drag."] = "鎖定按鈕來禁用拖曳。"
L["Glow Button"] = "閃光按鈕"
L["When item is placed by zone change, button will have glow effect."] = "當物品根據區域改變來放置，按鈕將會有發光效果。"
L["Backdrop Button"] = "背景按鈕"
L["Create or remove backdrop around button, need reload UI."] = "創建或移除環繞按鈕的背景，需要重載UI。"
L["Session skip"] = "本次上線略過"
L["Skipping item last until relog."] = "略過物品直到重新登入。"
L["Clear Blacklist"] = "清空黑名單"
L["Reset Permanent blacklist."] = "重置永遠黑名單。"
L["Zone unlock"] = "區域解鎖"
L["Don't zone restrict openable items"] = "不要根據區域限制可開啟的物品"
L["Profession"] = "專業"
L["Place items usable by lockpicking"] = "根據開鎖放置可使用物品"
L["Button"] = "按鈕"
L["Buttom location"] = "按鈕位置"
L["Button size"] = "按鈕大小"
L["Width and Height"] = "寬和高"
L["Button size in pixels"] = "按鈕大小向素"
L["Miner's Coffee stacks"] = "礦工咖啡堆疊數"
L["Allow buff up to this number of stacks"] = "允許增益堆疊到此數字"
L["Quest bar"] = "任務條"
L["Quest items placed on bar"] = "任務物品放置在條上"
L["Visible"] = "可視的"
L["Make button visible by placing fake item on it"] = "透過放置假物品使按鈕可見"
L["Swap"] = "交換"
L["Swap location of numbers for count and cooldown timer"] = "交換數字計數和冷卻時間的位置"
L["Buttons per row"] = "每行幾個按鈕"
L["AutoQuest"]  = "自動任務"
L["Auto accept or hand out quests from AutoQuestPopupTracker!"] = "自動接受或交出任務從AutoQuestPopupTracker！"
L["Strata"] = true
L["Set strata for items button to HIGH, place it over normal windows."] = true
L["Herald"] = true
L["Announce completed work orders, artifact points etc.."] = true
L["Skip on Error"] = true
L["Temporary blacklist item when click produce error message"] = true
L["Number of buttons placed in one row"] = "放置在一行的按鈕數"
L["Spacing"] = "間距"
L["Space between buttons"] = "按鈕之間的距離"
L["Sticky"] = "黏附"
L["Anchor to Item button"] = "定位到物品按鈕"
L["Direction"] = "方向"
L["Expand bar to"] = "條的擴展方向"
L["Up"] = "上"
L["Down"] = "下"
L["Left"] = "左"
L["Right"] = "右"
L["Add new row"] = "增加新行"
L["Above or below last one"] = "最後一個以上或以下"
L["Hot-Key"] = "熱鍵"
L["Key to use for automatic key binding."] = "用於自動綁定按鍵的熱鍵。"
L["Quest"] = "任務"
L["Quest not found for this item."] = "找不到此物品的任務。"
L["Items cache update run |cFF00FF00%d."] = "物品快取更新執行|cFF00FF00%d。"
L["Spells cache update run |cFF00FF00%d."] = "法術快取更新執行|cFF00FF00%d。"
L["%s: %d done %d to go!"] = true
L["Paragon reward for %s is ready!"] = true
L["Shipyard have %d/%d ships!"] = true
L["Artifact have %d talents ready!"] = true
L["Archaeology %s is ready!"] = true
L["%s is ready!"] = true

L["CONSOLE_USAGE"] = [=[ [reset|skin|lock|clear|list|unlist|skip|glow|zone|quest|show]
reset  - 將會重置物品位置到螢幕中間
skin   - 將會切換按鈕皮膚
lock   - 將會鎖定/解鎖按鈕
clear  - 將會重置永遠黑名單
list   - 列出永遠黑名單物品
unlist - remove single item from blacklist based on itemID
skip   - 切換右鍵點擊略過臨時或是直到重新記錄
glow   - 切換按鈕在區域時物品發亮
zone   - 切換物品區域限制
quest  - 開關任務條
show   - 空按鈕可見]=];
