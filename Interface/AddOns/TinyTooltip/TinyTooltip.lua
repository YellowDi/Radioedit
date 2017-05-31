
-------------------------------------
-- TinyTooltip Author: M
-------------------------------------

local LibEvent = LibStub:GetLibrary("LibEvent.7000")

local addon = ...

local tooltips = {
    GameTooltip,
    ItemRefTooltip,
    ShoppingTooltip1,
    ShoppingTooltip2,
    WorldMapTooltip,
    ItemRefShoppingTooltip1,
    ItemRefShoppingTooltip2,
    WorldMapCompareTooltip1,
    WorldMapCompareTooltip2,
}

LibEvent:attachEvent("PLAYER_LOGIN", function()
    if (not TinyTooltipDB) then
        TinyTooltipDB = {
            version = 1.3,                          --!配置版本號
            Scale = 1,                              --縮放比列
            Alpha = 0.9,                            --透明度
            BorderSize = 1,                         --邊框大小
            HPHeight = 12,                          --HP高度
            StaticPosition = false,                 --固定位置坐標
            UseMouseAnchor = true,                  --鼠標跟隨
                AnchorCursorRight = true,           --跟随鼠标右側
                OnlyMouseoverUnit = true,           --僅鼠標目標時跟隨
                OriginalInCombat = true,            --戰鬥時回原始位置
            AppendLevelToName = false,              --等級種族職業顯示在名稱之後
            DisplayStyleMask = true,                --顯示遮罩
            ShowAngularBorder = true,               --直角邊框
            ShowColoredClassBorder = false,         --邊框按職業顔色
            ShowColoredItemBorder = false,          --物品品質邊框
            ShowStatusBar   = true,                 --顯示HP
            StatusBarText   = true,                 --HP文字
            DynamicStatusBarColor = false,          --HP动态颜色
            ShowTarget      = true,                 --顯示目標
            name = {
                PVPIcon     = true,                 --PVP圖標
                FactionIcon = true,                 --陣營圖標 優先級1
                ClassIcon   = true,                 --職業圖標 優先級2
                Title       = "|cffCCFFFF%s|r",     --頭銜
                Realm       = "|cff00EEEE%s|r",     --服務器
                AFK         = "|cffFFD200(%s)|r",   --AFK
                DND         = "|cffFFD200(%s)|r",   --DND
                OFFLINE     = "|cff999999(%s)|r",   --OFFLINE
                Race        = "|cffcccccc%s|r",     --種族
                Class       = "|cffffffff%s|r",     --職業
            },
            guild = {
                Guild       = "|cffFF00FF<%.36s>|r", --公會
                Rank        = "|cffCC88FF(%s:%s)|r", --公會階級
                Realm       = "|cff00CCCC%s|r",      --公會服務器
            },
            npc = {
                Title       = "|cff99E8E8<%s>|r",    --頭銜
                Boss        = "|cffff0000(%s)|r",    --首領
                Elite       = "|cffffff33(%s)|r",    --精英
                Rare        = "|cffffaaff(%s)|r",    --稀有
                Reaction    = "|cff33ffff<%s>|r",    --聲望(尊敬)以上顯示
                Friendly    = "|cff99ff66%1|r",      --友方顔色替換    
            },
        }
    end
    
    for _, tooltip in ipairs(tooltips) do
        
        --UNIT
        if (tooltip:HasScript("OnTooltipSetUnit")) then
            tooltip:HookScript("OnTooltipSetUnit", function(self)
                local name, unit = self:GetUnit()
                if (not unit) then return end
                LibEvent:trigger("TOOLTIP_UNIT", self, unit)
            end)
        end

        --物品
        if (tooltip:HasScript("OnTooltipSetItem")) then
            tooltip:HookScript("OnTooltipSetItem", function(self)
                local name, link = self:GetItem()
                if (not link) then return end
                LibEvent:trigger("TOOLTIP_ITEM", self, name, link)
            end)
        end
        
        --樣式
        tooltip:HookScript("OnShow", function(self)
            LibEvent:trigger("TOOLTIP_SHOWN", self)
        end)
    end
end)

do
    --文字加阴影
    GameTooltipHeaderText:SetShadowOffset(1, -1)
    GameTooltipHeaderText:SetShadowColor(0, 0, 0, 0.9)
    GameTooltipText:SetShadowOffset(1, -1)
    GameTooltipText:SetShadowColor(0, 0, 0, 0.9)
    Tooltip_Small:SetShadowOffset(1, -1)
    Tooltip_Small:SetShadowColor(0, 0, 0, 0.9)
    
    --血条加背景和血量文字
    GameTooltipStatusBar:ClearAllPoints()
    GameTooltipStatusBar:SetPoint("BOTTOMLEFT", 5, 5)
    GameTooltipStatusBar:SetPoint("BOTTOMRIGHT", -5 ,5)
    GameTooltipStatusBar:SetHeight(12)
    GameTooltipStatusBar:SetStatusBarTexture("Interface\\AddOns\\"..addon.."\\texture\\StatusBar")
    GameTooltipStatusBar.bg = GameTooltipStatusBar:CreateTexture(nil, "BACKGROUND")
    GameTooltipStatusBar.bg:SetAllPoints()
    GameTooltipStatusBar.bg:SetColorTexture(1, 1, 1)
    GameTooltipStatusBar.bg:SetVertexColor(0.2, 0.2, 0.2, 0.8)
    GameTooltipStatusBar.TextString = GameTooltipStatusBar:CreateFontString(nil, "OVERLAY")
    GameTooltipStatusBar.TextString:SetPoint("CENTER")
    GameTooltipStatusBar.TextString:SetFont(NumberFontNormal:GetFont(), 11, "OUTLINE")
    GameTooltipStatusBar:HookScript("OnValueChanged", function(self, hp)
        local min, max = self:GetMinMaxValues()
        local percent = ceil(hp/max*100)
        local textDisplay = GetCVar("statusTextDisplay")
        if (TinyTooltipDB.DynamicStatusBarColor) then
            self:SetStatusBarColor(1-percent/100, percent/100, 0)
        end
        if (not TinyTooltipDB.StatusBarText) then
            self.TextString:SetText("")
        elseif (hp <= 0) then
            self.TextString:SetFormattedText("|cff999999%s|r |cffffcc33<%s>|r", AbbreviateLargeNumbers(max), DEAD)
        else
            if (TinyTooltipDB.statusTextBoth or textDisplay == "BOTH") then
                self.TextString:SetFormattedText("%s / %s%%", AbbreviateLargeNumbers(hp), percent)
            elseif (textDisplay == "NUMERIC") then
                self.TextString:SetFormattedText("%s / %s", AbbreviateLargeNumbers(hp), AbbreviateLargeNumbers(max))
            else
                self.TextString:SetFormattedText("%s%%", percent)
            end
        end
    end)
    GameTooltipStatusBar:HookScript("OnShow", function(self)
        if (not TinyTooltipDB.ShowStatusBar) then
            self:Hide()
        end
    end)

    --按鈕樣式
    if (ItemRefCloseButton) then
        ItemRefCloseButton:SetSize(14, 14)
        ItemRefCloseButton:SetPoint("TOPRIGHT", -4, -4)
        ItemRefCloseButton:SetNormalTexture("Interface\\\Buttons\\UI-StopButton")
        ItemRefCloseButton:SetPushedTexture("Interface\\\Buttons\\UI-StopButton")
        ItemRefCloseButton:GetNormalTexture():SetVertexColor(0.9, 0.6, 0)
    end

    --设置鼠标跟随
    hooksecurefunc("GameTooltip_SetDefaultAnchor", function(self, parent)
        LibEvent:trigger("TOOLTIP_ANCHOR", self, parent)
    end)

    local backdrop = { edgeFile = "Interface\\Buttons\\WHITE8X8", edgeSize = 1 }

    for _, tooltip in ipairs(tooltips) do
    
        --樣式
        tooltip.mask = tooltip:CreateTexture(nil, "OVERLAY")
        tooltip.mask:SetTexture("Interface\\Tooltips\\UI-Tooltip-Background")
        tooltip.mask:SetPoint("TOPLEFT", tooltip, "TOPLEFT", 4, -4)
        tooltip.mask:SetPoint("BOTTOMRIGHT", tooltip, "TOPRIGHT", -4, -32)
        tooltip.mask:SetBlendMode("ADD")
        tooltip.mask:SetGradientAlpha("VERTICAL", 0, 0, 0, 0, 0.9, 0.9, 0.9, 0.4)

        --邊框
        tooltip.border = CreateFrame("Frame", nil, tooltip)
        tooltip.border:SetPoint("TOPLEFT", 3, -3)
        tooltip.border:SetPoint("BOTTOMRIGHT", -3, 3)
        tooltip.border:SetBackdrop(backdrop)
        tooltip.border:SetBackdropBorderColor(1, 1, 1, 0.2)
        tooltip.border.mask = CreateFrame("Frame", nil, tooltip.border)
        tooltip.border.mask:SetPoint("TOPLEFT", 1, -1)
        tooltip.border.mask:SetPoint("BOTTOMRIGHT", -1, 1)
        tooltip.border.mask:SetBackdrop(backdrop)
        tooltip.border.mask:SetBackdropBorderColor(0.1, 0.1, 0.1)
        tooltip.border:Hide()
    end

end

-- 找行
local function FindLine(tooltip, keyword)
    local line, text
    for i = 2, tooltip:NumLines() do
        line = _G[tooltip:GetName() .. "TextLeft" .. i]
        text = line:GetText() or ""
        if (string.find(text, keyword)) then
            return line, i
        end
    end
end

-- 刪行
local function HideLine(tooltip, keyword)
    local line, text
    for i = 3, tooltip:NumLines() do
        line = _G[tooltip:GetName() .. "TextLeft" .. i]
        text = line:GetText() or ""
        if (keyword == text) then
            line:SetText(nil)
            break
        end
    end
end

-- 顔色
local function GetHexColor(color, g, b)
    if (g and b) then
        return ("%02x%02x%02x"):format(color*255, g*255, b*255)
    elseif color.r then
        return ("%02x%02x%02x"):format(color.r*255, color.g*255, color.b*255)
    else
        local r, g, b = unpack(color)
        return ("%02x%02x%02x"):format(r*255, g*255, b*255)
    end
end

--獲值
local function GetValue(key, text, ...)
    if (not text) then return "" end
    local variable = TinyTooltipDB[key]
    if (string.find(key, ".")) then
        local key1, key2 = strsplit(".", key)
        variable = TinyTooltipDB[key1][key2]
    end
    if (variable) then
        return " " .. variable:format(text, ...)
    else
        return ""
    end
end

-- 設置：邊框寬度
LibEvent:attachTrigger("TOOLTIP_BORDER_SIZE", function(self, size)
    local backdrop = GameTooltip.border:GetBackdrop() 
    backdrop.edgeSize = tonumber(size) or 1
    for _, tooltip in ipairs(tooltips) do
        tooltip.border:SetBackdrop(backdrop)
    end
end)

-- 設置：背景透明度
LibEvent:attachTrigger("TOOLTIP_ALPHA", function(self, alpha)
    TinyTooltipDB.Alpha = alpha or 0.9
end)

-- 設置：HP高度
LibEvent:attachTrigger("TOOLTIP_HP_HEIGHT", function(self, height)
    GameTooltipStatusBar:SetHeight(height or 12)
end)

-- 設置：縮放
LibEvent:attachTrigger("TOOLTIP_SCALE", function(self, scale)
    for _, tooltip in ipairs(tooltips) do
        tooltip:SetScale(scale or 1)
    end
end)

--設置：鼠標跟隨
LibEvent:attachTrigger("TOOLTIP_ANCHOR", function(self, tooltip, parent)
    if (tooltip ~= GameTooltip) then return end
    if (not TinyTooltipDB.UseMouseAnchor) then return end
    if (TinyTooltipDB.OnlyMouseoverUnit and not UnitExists("mouseover")) then return end
    if (TinyTooltipDB.OriginalInCombat and InCombatLockdown()) then else
        tooltip:SetOwner(parent, "ANCHOR_NONE")
        if (TinyTooltipDB.AnchorCursorRight) then
            tooltip:SetOwner(parent, "ANCHOR_CURSOR_RIGHT", 30)
        else
            tooltip:SetOwner(parent, "ANCHOR_CURSOR")
        end
    end
end)

-- 設置：固定位置
LibEvent:attachTrigger("TOOLTIP_ANCHOR", function(self, tooltip, parent)
    if (tooltip ~= GameTooltip) then return end
    local anchor = select(2, tooltip:GetPoint())
    if (anchor == UIParent and TinyTooltipDB.StaticPosition) then
        tooltip:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", strsplit(",",TinyTooltipDB.StaticPosition))
    end
end)

-- 設置：顯示
LibEvent:attachTrigger("TOOLTIP_SHOWN", function(self, tooltip)
    local r, g, b = tooltip:GetBackdropColor()
    tooltip:SetBackdropColor(r, g, b, TinyTooltipDB.Alpha or 0.9)
    tooltip:SetBackdropBorderColor(0, 0, 0, 0.5)
    tooltip.mask:SetShown(TinyTooltipDB.DisplayStyleMask)
    if (TinyTooltipDB.ShowAngularBorder) then
        tooltip.border:Show()
        local backdrop = tooltip.border:GetBackdrop()
        tooltip.border.mask:SetShown(backdrop.edgeSize==1)
    else
        tooltip.border:Hide()
    end
    LibEvent:trigger("TOOLTIP_BORDER", tooltip)
end)

-- 設置：邊框
LibEvent:attachTrigger("TOOLTIP_BORDER", function(self, tooltip)
    if (not tooltip.GetUnit or not tooltip.GetItem) then return end
    local border = tooltip.border:IsShown() and tooltip.border or tooltip
    local _, unit = tooltip:GetUnit()
    local _, link = tooltip:GetItem()
    local r, g, b, quality
    if (unit and UnitIsPlayer(unit) and TinyTooltipDB.ShowColoredClassBorder) then
        r, g, b = GetClassColor(select(2, UnitClass(unit)))
        border:SetBackdropBorderColor(r, g, b, 0.6)
    elseif (link and TinyTooltipDB.ShowColoredItemBorder) then
        quality = select(3, GetItemInfo(link)) or 0
        r, g, b = GetItemQualityColor(quality)
        border:SetBackdropBorderColor(r, g, b, 0.6)
    elseif (tooltip.border:IsShown()) then
        border:SetBackdropBorderColor(1, 1, 1, 0.25)
    end
end)

-- 設置：UNIT
LibEvent:attachTrigger("TOOLTIP_UNIT", function(self, tooltip, unit)
    if (UnitIsPlayer(unit)) then
        LibEvent:trigger("TOOLTIP_UNIT_NAME", tooltip, unit)
        LibEvent:trigger("TOOLTIP_UNIT_GUILD", tooltip, unit)
        LibEvent:trigger("TOOLTIP_UNIT_LEVEL_RACE", tooltip, unit)
        LibEvent:trigger("TOOLTIP_UNIT_HIDELINE", tooltip, unit)
        LibEvent:trigger("TOOLTIP_UNIT_TARGET", tooltip, unit)
    else
        LibEvent:trigger("TOOLTIP_NPC_NAME", tooltip, unit)
        LibEvent:trigger("TOOLTIP_NPC_TITLE", tooltip, unit)
        LibEvent:trigger("TOOLTIP_NPC", tooltip, unit)
    end
    LibEvent:trigger("TOOLTIP_UNIT_COMMON", tooltip, unit)
end)

-- 設置：HP内置需要撐高高度
LibEvent:attachTrigger("TOOLTIP_UNIT_COMMON", function(self, tooltip)
    if (tooltip == GameTooltip and TinyTooltipDB.ShowStatusBar and GameTooltipStatusBar:IsShown()) then
        if (GameTooltipStatusBar:GetHeight() >= 4) then
            tooltip:AddLine(" ")
            tooltip:Show()
        end
    end
end)

-- 圖標
local NameIcons = {
    Alliance = "|TInterface\\TargetingFrame\\UI-PVP-ALLIANCE:16:16:0:0:64:64:10:36:2:38|t ",
    Horde = "|TInterface\\TargetingFrame\\UI-PVP-HORDE:16:16:0:0:64:64:4:38:2:36|t ",
    pvp = "|TInterface\\TargetingFrame\\UI-PVP-FFA:16:16:0:0:64:64:10:36:0:38|t ",
    default = "|TInterface\\TargetingFrame\\UI-Classes-Circles:16:16:0:0:256:256:%d:%d:%d:%d|t ",
}

-- 設置：UNIT名稱
LibEvent:attachTrigger("TOOLTIP_UNIT_NAME", function(self, tooltip, unit)
    local line = _G[tooltip:GetName().."TextLeft1"]
    local pvpname = UnitPVPName(unit)
    local name, server = UnitName(unit)
    local class = select(2, UnitClass(unit))
    local factionGroup = UnitFactionGroup(unit)
    local colorCode = select(4, GetClassColor(class))

    local text = ""
    
    if (TinyTooltipDB.name.PVPIcon and UnitIsPVPFreeForAll(unit) and UnitPrestige(unit) <= 0) then
        text = text .. NameIcons.pvp
    end

    if (TinyTooltipDB.name.FactionIcon) then
        text = text .. NameIcons[factionGroup] or ""
    end
    if (TinyTooltipDB.name.ClassIcon) then
        local x1, x2, y1, y2 = unpack(CLASS_ICON_TCOORDS[strupper(class)])
        text = text .. format(NameIcons.default, x1*256, x2*256, y1*256, y2*256)
    end

    if (TinyTooltipDB.name.Title and pvpname and pvpname ~= name) then
        local pos = string.find(pvpname, name)
        local title = pvpname:gsub(name, "", 1)
        title = strtrim(title:gsub(",", ""))
        title = strtrim(title:gsub("，", ""))
        if (pos == 1) then
            text = text .. format("|c%s%s|r ", colorCode, name) .. TinyTooltipDB.name.Title:format(title)
        else
            text = text .. TinyTooltipDB.name.Title:format(title) .. format(" |c%s%s|r", colorCode, name)
        end
    else
        text = text .. format("|c%s%s|r", colorCode, name)
    end

    line:SetText(text)

    if (TinyTooltipDB.name.Realm and server and not UnitIsSameServer(unit)) then
        local realm = TinyTooltipDB.name.Realm:format(server)
        tooltip:AppendText(" " .. realm)
    end
    
    local status = ""
    if (TinyTooltipDB.name.AFK and UnitIsAFK(unit)) then
        status = TinyTooltipDB.name.AFK:format(AFK)
    elseif (TinyTooltipDB.name.DND and UnitIsDND(unit)) then
        status = TinyTooltipDB.name.DND:format(DND)
    elseif (TinyTooltipDB.name.OFFLINE and not UnitIsConnected(unit)) then
        status = TinyTooltipDB.name.OFFLINE:format(FRIENDS_LIST_OFFLINE)
    end
    if (status ~= "") then
        tooltip:AppendText(" " .. status)
    end
end)

-- 設置：UNIT公會
LibEvent:attachTrigger("TOOLTIP_UNIT_GUILD", function(self, tooltip, unit)
    local line = _G[tooltip:GetName().."TextLeft2"]
    local guild, guildRank, guildIndex, guildRealm = GetGuildInfo(unit)
    if (not guild) then return end
    
    local text = ""
    if (TinyTooltipDB.guild.Guild) then
        text = TinyTooltipDB.guild.Guild:format(guild)
    end
    if (TinyTooltipDB.guild.Rank and guildRank) then
        text = text .. " " .. TinyTooltipDB.guild.Rank:format(guildIndex, guildRank)
    end
    if (TinyTooltipDB.guild.Realm and guildRealm) then
        text = text .. " " .. TinyTooltipDB.guild.Realm:format(guildRealm)
    end

    line:SetText(text)
end)

-- 設置：UNIT 等級 種族 職業
LibEvent:attachTrigger("TOOLTIP_UNIT_LEVEL_RACE", function(self, tooltip, unit)
    local line = FindLine(tooltip, "^"..LEVEL.."%s?[%d%?]+")
    if (not line) then return end
    local level = UnitLevel(unit)
    local raceName = UnitRace(unit)
    local className, class = UnitClass(unit)
    local colorCode = select(4, GetClassColor(class))
    local color = GetCreatureDifficultyColor(level > 0 and level or 999)
    
    local text = format("|cff%s%s|r", GetHexColor(color), level > 0 and level or "??")
    if (TinyTooltipDB.name.Race) then
        text = text .. " " .. TinyTooltipDB.name.Race:format(raceName or "")
    end
    if (TinyTooltipDB.name.Class) then
        text = text .. " " .. TinyTooltipDB.name.Class:format(className or "")
    end
    
    if (TinyTooltipDB.AppendLevelToName) then
        tooltip:AppendText(" " .. text)
        line:SetText(nil)
    else
        line:SetText(text)
    end
end)

-- 設置：UNIT隱藏行
LibEvent:attachTrigger("TOOLTIP_UNIT_HIDELINE", function(self, tooltip, unit)
    HideLine(tooltip, PVP)
    HideLine(tooltip, FACTION_ALLIANCE)
    HideLine(tooltip, FACTION_HORDE)
end)

-- 目標
local function GetTargetString(unit)
    if (not UnitExists(unit)) then
        return format("|cff999999(%s)|r", EMPTY)
    end
    local name = UnitName(unit)
    local class = select(2, UnitClass(unit))
    if (UnitIsUnit(unit, "player")) then
        return format("|cffff0000>>%s<<|r", strupper(YOU))
    else
        local index = GetRaidTargetIndex(unit)
        local icon = index and ICON_LIST[index] .. "0|t" or ""
        if (UnitIsPlayer(unit)) then
            local colorCode = select(4, GetClassColor(class))
            return format("%s|c%s%s|r", icon, colorCode, name)
        else
            return format("%s|cff%s[%s]|r", icon, GetHexColor(GameTooltip_UnitColor(unit)), name)
        end
    end
end

-- 刷新目標
GameTooltip:HookScript("OnUpdate", function(self, elapsed)
    if (not TinyTooltipDB.ShowTarget) then return end
    if (self.updateTooltip ~= TOOLTIP_UPDATE_TIME) then return end
    if (not self:GetUnit()) then return end
    local line = FindLine(self, "^"..TARGET..":")
    if (not line) then return end
    line:SetFormattedText("%s: %s", TARGET, GetTargetString("mouseovertarget"))
end)

-- 設置：UNIT目標
LibEvent:attachTrigger("TOOLTIP_UNIT_TARGET", function(self, tooltip, unit)
    if (TinyTooltipDB.ShowTarget and UnitIsVisible(unit)) then
        tooltip:AddLine(format("%s: %s", TARGET, GetTargetString(unit.."target")))
    end
end)

-- 設置：NPC任務怪圖標
LibEvent:attachTrigger("TOOLTIP_NPC_NAME", function(self, tooltip, unit)
    if (UnitIsQuestBoss(unit)) then
        local line = _G[tooltip:GetName().."TextLeft1"]
        line:SetText("|TInterface\\TargetingFrame\\PortraitQuestBadge:14|t " .. line:GetText())
    end
end)

-- 設置：NPC頭銜
LibEvent:attachTrigger("TOOLTIP_NPC", function(self, tooltip, unit)
    if (not TinyTooltipDB.npc.Title) then return end
    local line, index = FindLine(tooltip, "^"..LEVEL.."%s?[%d%?]+")
    if (not line or index <= 2) then return end
    line = _G[tooltip:GetName().."TextLeft2"]
    line:SetFormattedText(TinyTooltipDB.npc.Title, line:GetText())
end)

-- 設置：NPC 等級 類型 聲望
LibEvent:attachTrigger("TOOLTIP_NPC", function(self, tooltip, unit)
    local line = FindLine(tooltip, "^"..LEVEL.."%s?[%d%?]+")
    if (not line) then return end
    local level = UnitLevel(unit)
    local color = GetCreatureDifficultyColor(level > 0 and level or 999)
    local text = format("|cff%s%s|r", GetHexColor(color), level > 0 and level or "??")

    local classif = UnitClassification(unit)
    if (TinyTooltipDB.npc.Boss and (level == -1 or classif == "worldboss")) then
        classif = TinyTooltipDB.npc.Boss:format(BOSS)
    elseif (TinyTooltipDB.npc.Elite and classif == "elite") then
        classif = TinyTooltipDB.npc.Elite:format(ELITE)
    elseif (TinyTooltipDB.npc.Rare and (classif == "rare" or classif == "rareelite")) then
        classif = TinyTooltipDB.npc.Rare:format(GARRISON_MISSION_RARE)
    else
        classif = ""
    end
    if (classif ~= "") then
        text = text .. " " .. classif
    end
    
    if (TinyTooltipDB.npc.Friendly and UnitIsFriend("player", unit)) then
        text = text:gsub("|cff%x%x%x%x%x%x(.-)|r", TinyTooltipDB.npc.Friendly)
    end

    local race = UnitCreatureType(unit)
    local r, g, b = UnitSelectionColor(unit)
    text = text .. format(" |cff%s%s|r", GetHexColor(r, g, b), race or "")
    
    local reaction = UnitReaction(unit, "player")
    if (reaction and reaction > 5 and TinyTooltipDB.npc.Reaction) then
        text = text .. " " .. TinyTooltipDB.npc.Reaction:format(_G["FACTION_STANDING_LABEL"..reaction] or "")
    end

    line:SetText(text)
    
    HideLine(tooltip, PVP)
end)


---------------
--  ID Info  --
---------------
local function ParseHyperLink(link)
    if (not link) then return end
    local name, value = string.match(link, "|?H?(%a+):(%d+):")
    if (name and value) then
        return name:gsub("^([a-z])", function(s) return strupper(s) end) .. ":", value
    end
end

local function ShowId(tooltip, name, value, noBlankLine)
    if (IsShiftKeyDown() or IsControlKeyDown() or IsAltKeyDown()) then
        local line = FindLine(tooltip, name)
        if (not line) then
            if (not noBlankLine) then tooltip:AddLine(" ") end
            tooltip:AddLine(format("%s %s", name, value), 0, 1, 0.8)
            tooltip:Show()
        end
    end
end

local function ShowLinkIdInfo(tooltip, link)
    local name, value = ParseHyperLink(link)
    if (not name) then return end
    ShowId(tooltip, name, value)
end

local function ShowItemIdInfo(tooltip)
    ShowLinkIdInfo(tooltip, select(2,tooltip:GetItem()))
end

local function ShowCastByInfo(tooltip, ...)
    local unit = select(8, UnitAura(...))
    if (unit) then
        ShowId(tooltip, "CastBy:", format("|cff%s%s|r", GetHexColor(GameTooltip_UnitColor(unit)), UnitName(unit)), 1)
    end
end

-- Link
hooksecurefunc(ItemRefTooltip, "SetHyperlink", ShowLinkIdInfo)
hooksecurefunc(GameTooltip, "SetHyperlink", ShowLinkIdInfo)
hooksecurefunc("SetItemRef", function(link) ShowLinkIdInfo(ItemRefTooltip, link) end)

-- Item
GameTooltip:HookScript("OnTooltipSetItem", ShowItemIdInfo)
ItemRefTooltip:HookScript("OnTooltipSetItem", ShowItemIdInfo)
ItemRefShoppingTooltip1:HookScript("OnTooltipSetItem", ShowItemIdInfo)
ItemRefShoppingTooltip2:HookScript("OnTooltipSetItem", ShowItemIdInfo)
ShoppingTooltip1:HookScript("OnTooltipSetItem", ShowItemIdInfo)
ShoppingTooltip2:HookScript("OnTooltipSetItem", ShowItemIdInfo)

-- Spell
GameTooltip:HookScript("OnTooltipSetSpell", function(self) ShowId(self, "Spell:", select(3,self:GetSpell())) end)
hooksecurefunc(GameTooltip, "SetUnitAura", function(self, ...) ShowId(self, "Spell:", select(11,UnitAura(...))) end)
hooksecurefunc(GameTooltip, "SetUnitBuff", function(self, ...) ShowId(self, "Spell:", select(11,UnitBuff(...))) end)
hooksecurefunc(GameTooltip, "SetUnitDebuff", function(self, ...) ShowId(self, "Spell:", select(11,UnitDebuff(...))) end)

-- CastBy
-- hooksecurefunc(GameTooltip, "SetUnitAura", ShowCastByInfo)
