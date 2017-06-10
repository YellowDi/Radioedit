
-------------------------------------
-- Core Author:M
-------------------------------------

local LibEvent = LibStub:GetLibrary("LibEvent.7000")

local AFK = AFK
local DND = DND
local MALE = MALE
local BOSS = BOSS
local DEAD = DEAD
local ELITE = ELITE
local FEMALE = FEMALE
local TARGET = TARGET
local PLAYER = PLAYER
local RARE = GARRISON_MISSION_RARE
local OFFLINE = FRIENDS_LIST_OFFLINE

local addon = select(2, ...)

if (not addon.L) then
    addon.L = {} setmetatable(addon.L, {__index = function(_, k) return k end})
end

-- tooltips
addon.tooltips = {
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

-- 圖標集
addon.icons = {
    Alliance  = "|TInterface\\TargetingFrame\\UI-PVP-ALLIANCE:16:16:0:0:64:64:10:36:2:38|t",
    Horde     = "|TInterface\\TargetingFrame\\UI-PVP-HORDE:16:16:0:0:64:64:4:38:2:36|t",
    pvp       = "|TInterface\\TargetingFrame\\UI-PVP-FFA:16:16:0:0:64:64:10:36:0:38|t",
    class     = "|TInterface\\TargetingFrame\\UI-Classes-Circles:16:16:0:0:256:256:%d:%d:%d:%d|t",
    questboss = "|TInterface\\TargetingFrame\\PortraitQuestBadge:0|t",
    TANK      = "|TInterface\\LFGFrame\\UI-LFG-ICON-PORTRAITROLES:0:0:0:0:64:64:0:19:22:41|t",
    HEALER    = "|TInterface\\LFGFrame\\UI-LFG-ICON-PORTRAITROLES:0:0:0:0:64:64:20:39:1:20|t",
    DAMAGER   = "|TInterface\\LFGFrame\\UI-LFG-ICON-PORTRAITROLES:0:0:0:0:64:64:20:39:22:41|t",
    --Alliance  = "|TInterface\\FriendsFrame\\PlusManz-Alliance:16|t",
    --Horde     = "|TInterface\\FriendsFrame\\PlusManz-Horde:16|t",
}

-- 配置 (elements鍵不合併)
function addon:MergeVariable(src, dst)
    dst.version = src.version
    for k, v in pairs(src) do
        if (dst[k] == nil) then
            dst[k] = v
        elseif (type(dst[k]) == "table" and k~="elements") then
            self:MergeVariable(v, dst[k])
        end
    end
    return dst
end

-- 找行
function addon:FindLine(tooltip, keyword)
    local line, text
    for i = 2, tooltip:NumLines() do
        line = _G[tooltip:GetName() .. "TextLeft" .. i]
        text = line:GetText() or ""
        if (strfind(text, keyword)) then
            return line, i
        end
    end
end

-- 刪行
function addon:HideLine(tooltip, keyword)
    local line, text
    for i = 2, tooltip:NumLines() do
        line = _G[tooltip:GetName() .. "TextLeft" .. i]
        text = line:GetText() or ""
        if (strfind(text, keyword)) then
            line:SetText(nil)
            break
        end
    end
end

-- 刪行
function addon:HideAllLine(tooltip, number)
    local line, text
    for i = number, tooltip:NumLines() do
        _G[tooltip:GetName() .. "TextLeft" .. i]:SetText(nil)
    end
end

-- 取行
function addon:GetLine(tooltip, number)
    local num = tooltip:NumLines()
    if (number > num) then
        tooltip:AddLine(" ")
        return self:GetLine(tooltip, num+1), true
    end
    return _G[tooltip:GetName() .. "TextLeft" .. number]
end

-- 顔色
function addon:GetHexColor(color, g, b)
    if (g and b) then
        return ("%02x%02x%02x"):format(color*255, g*255, b*255)
    elseif color.r then
        return ("%02x%02x%02x"):format(color.r*255, color.g*255, color.b*255)
    else
        local r, g, b = unpack(color)
        return ("%02x%02x%02x"):format(r*255, g*255, b*255)
    end
end

-- 顔色
function addon:GetRGBColor(hex)
    if (not hex) then return 1, 1, 1 end
    if (string.match(hex, "^%x%x%x%x%x%x$")) then
        local r = tonumber(strsub(hex,1,2),16) or 255
        local g = tonumber(strsub(hex,3,4),16) or 255
        local b = tonumber(strsub(hex,5,6),16) or 255
        return r/255, g/255, b/255
    end
end

-- 任務怪
function addon:GetQuestBossIcon(unit)
    if UnitIsQuestBoss(unit) then
        return self.icons.questboss
    end
end

-- PVP圖標
function addon:GetPVPIcon(unit)
    if (UnitIsPVPFreeForAll(unit) and UnitPrestige(unit) <= 0) then
        return self.icons.pvp
    end
end

-- 角色圖標
function addon:GetRoleIcon(unit)
    local role = UnitGroupRolesAssigned(unit)
    if (role) then
        return self.icons[strupper(role)]
    end
end

-- 陣營圖標
function addon:GetFactionIcon(factionGroup)
    return self.icons[factionGroup]
end

-- 標記圖標
function addon:GetRaidIcon(unit)
    local index = GetRaidTargetIndex(unit)
    if (index) then
        return ICON_LIST[index] .. "0|t"
    end
end

-- 職業圖標
function addon:GetClassIcon(class)
    if (not class) then return end
    local x1, x2, y1, y2 = unpack(CLASS_ICON_TCOORDS[strupper(class)])
    return format(self.icons.class, x1*256, x2*256, y1*256, y2*256)
end

-- 頭銜 @param2:true為前綴
function addon:GetTitle(name, pvpName)
    if (not pvpName) then return end
    if (name == pvpName) then return end
    local pos = string.find(pvpName, name)
    local title = pvpName:gsub(name, "", 1)
    title = title:gsub(",", ""):gsub("，", "")
    title = strtrim(title)
    return title, pos ~= 1
end

-- 性別
function addon:GetGender(gender)
    if (gender == 2) then
        return MALE
    elseif (gender == 3) then
        return FEMALE
    end
end

-- NPC頭銜
function addon:GetNpcTitle(tip)
    local line, index = self:FindLine(tip, "^"..LEVEL)
    if (not line or index <= 2) then return end
    return self:GetLine(tip, 2)
end

-- 全信息
function addon:GetUnitInfo(unit)
    local name, realm = UnitName(unit)
    local pvpName = UnitPVPName(unit)
    local gender = UnitSex(unit)
    local level = UnitLevel(unit)
    local raceName, race = UnitRace(unit)
    local className, class = UnitClass(unit)
    local factionGroup, factionName = UnitFactionGroup(unit)
    local reaction = UnitReaction(unit, "player")
    local guildName, guildRank, guildIndex, guildRealm = GetGuildInfo(unit)
    local classif = UnitClassification(unit)
    local role = UnitGroupRolesAssigned(unit)

    local t = {
        raidIcon     = self:GetRaidIcon(unit),
        pvpIcon      = self:GetPVPIcon(unit),
        factionIcon  = self:GetFactionIcon(factionGroup),
        classIcon    = self:GetClassIcon(class),
        roleIcon     = self:GetRoleIcon(unit),
        questIcon    = self:GetQuestBossIcon(unit),
        factionName  = factionName,
        role         = role ~= "NONE" and role,
        name         = name,
        gender       = self:GetGender(gender),
        realm        = realm,
        levelValue   = level >= 0 and level or "??",
        className    = className,
        raceName     = raceName,
        guildName    = guildName,
        guildRank    = guildRank,
        guildIndex   = guildName and guildIndex,
        guildRealm   = guildRealm,
        statusAFK    = UnitIsAFK(unit) and AFK,
        statusDND    = UnitIsDND(unit) and DND,
        statusDC     = not UnitIsConnected(unit) and OFFLINE,
        reactionName = reaction and _G["FACTION_STANDING_LABEL"..reaction],
        creature     = UnitCreatureType(unit),
        classifBoss  = (level==-1 or classif == "worldboss") and BOSS,
        classifElite = classif == "elite" and ELITE,
        classifRare  = (classif == "rare" or classif == "rareelite") and RARE,
        isPlayer     = UnitIsPlayer(unit) and PLAYER,
        

        unit         = unit,                     --unit
        level        = level,                    --1~113|-1
        race         = race,                     --nil|NightElf|Troll...
        class        = class,                    --DRUID|HUNTER...
        factionGroup = factionGroup,             --Alliance|Horde|Neutral
        reaction     = reaction,                 --nil|1|2|3|4|5|6|7|8
        classif      = classif, --normal|worldboss|elite|rare|rareelite
    }
    if (t.classifBoss) then t.classifElite = false end
    t.title, t.titleIsPrefix = self:GetTitle(name, pvpName)
    return t
end

-- Filter
function addon:CheckFilter(config, raw)
    if (IsAltKeyDown() or IsControlKeyDown()) then return true end
    if (not config.enable) then return end
    if (config.filter == "" or config.filter == "none") then
        return true
    end
    if (config.filter) then
        local key, oppo, func
        key = strsplit(":", config.filter)
        key, oppo = key:gsub("not%s+", "")
        func = self.filterfunc[key]
        if (func) then
            local res = func(raw, select(2,strsplit(":", config.filter)))
            if (oppo > 0) then
                return not res
            else
                return res
            end
        end
    end
    return true
end

-- 格式化數據
function addon:FormatData(value, config, raw)
    local color, wildcard = config.color, config.wildcard
    if (self.colorfunc[color]) then
        color = select(4, self.colorfunc[color](raw))
    end
    if (color == "" or color == "default" or color == "none") then
        return (wildcard):format(value)
    else
        if (type(color)=="table") then color = self:GetHexColor(color) end
        return ("|cff"..color..wildcard.."|r"):format(value)
    end
end

-- 獲取數據
function addon:GetUnitData(unit, elements, raw)
    local data = {}
    local config, name, title
    if (not raw) then
        raw = self:GetUnitInfo(unit)
    end
    for i, v in ipairs(elements) do
        data[i] = {}
        for ii, e in ipairs(v) do
            config = elements[e]
            if (raw[e] and self:CheckFilter(config, raw)) then
                if (e == "name") then name = #data[i]+1 end   --name位置
                if (e == "title") then title = #data[i]+1 end --title位置
                if (config.color and config.wildcard) then
                    if (e == "title" and name == #data[i] and raw.titleIsPrefix) then
                        tinsert(data[i], name, self:FormatData(raw[e], config, raw))
                    elseif (e == "name" and title == #data[i] and not raw.titleIsPrefix) then
                        tinsert(data[i], title, self:FormatData(raw[e], config, raw))
                    else
                        tinsert(data[i], self:FormatData(raw[e], config, raw))
                    end
                else
                    tinsert(data[i], raw[e])
                end
            end
        end
    end
    for i = #data, 1, -1 do
        if (not data[i][1]) then tremove(data, i) end
    end
    return data
end


addon.filterfunc, addon.colorfunc = {}, {}

addon.colorfunc.class = function(raw)
    local r, g, b = GetClassColor(raw.class)
    return r, g, b, addon:GetHexColor(r, g, b)
end

addon.colorfunc.level = function(raw)
    local color = GetCreatureDifficultyColor(raw.level>0 and raw.level or 999)
    return color.r, color.g, color.b, addon:GetHexColor(color)
end

addon.colorfunc.reaction = function(raw)
    local color = FACTION_BAR_COLORS[raw.reaction or 4]
    return color.r, color.g, color.b, addon:GetHexColor(color)
end

addon.colorfunc.itemQuality = function(raw)
    local color = ITEM_QUALITY_COLORS[raw.itemQuality or 0]
    return color.r, color.g, color.b, addon:GetHexColor(color)
end

addon.colorfunc.selection = function(raw)
    local r, g, b = UnitSelectionColor(raw.unit)
    return r, g, b, addon:GetHexColor(r, g, b)
end

addon.colorfunc.faction = function(raw)
    if (raw.factionGroup == "Neutral") then
        return 0.9, 0.7, 0, "e5b200"
    elseif (raw.factionGroup == UnitFactionGroup("player")) then
        return 0, 1, 0.2, "00cc33"
    else
        return 1, 0.2, 0, "dd3300"
    end
end

addon.filterfunc.reaction6 = function(raw, reaction)
    return (raw.reaction or 4) >= 6
end

addon.filterfunc.reaction5 = function(raw, reaction)
    return (raw.reaction or 4) >= 5
end

addon.filterfunc.reaction = function(raw, reaction)
    return (raw.reaction or 4) >= (tonumber(reaction) or 5)
end

addon.filterfunc.inraid = function(raw)
    return IsInRaid()
end

addon.filterfunc.incombat = function(raw)
    return InCombatLockdown()
end

addon.filterfunc.samerealm = function(raw)
    return raw.realm == raw.guildRealm
end

addon.filterfunc.inpvp = function(raw)
    return select(2, IsInInstance()) == "pvp"
end

addon.filterfunc.inarena = function(raw)
    return select(2, IsInInstance()) == "arena"
end

addon.filterfunc.ininstance = function(raw)
    return IsInInstance()
end

LibEvent:attachTrigger("tooltip.scale", function(self, frame, scale)
    frame:SetScale(scale)
end)

LibEvent:attachTrigger("tooltip.anchor.cursor", function(self, frame, parent)
    frame:SetOwner(parent, "ANCHOR_CURSOR")
end)

LibEvent:attachTrigger("tooltip.anchor.cursor.right", function(self, frame, parent, offsetX, offsetY)
    frame:SetOwner(parent, "ANCHOR_CURSOR_RIGHT", tonumber(offsetX) or 30, tonumber(offsetY) or -12)
end)

LibEvent:attachTrigger("tooltip.anchor.static", function(self, frame, parent, offsetX, offsetY, anchorPoint)
    local anchor = select(2, frame:GetPoint())
    if (anchor == UIParent) then
        frame:ClearAllPoints()
        frame:SetPoint(anchorPoint or "BOTTOMRIGHT", UIParent, anchorPoint or "BOTTOMRIGHT", tonumber(offsetX) or (-CONTAINER_OFFSET_X-13), tonumber(offsetY) or CONTAINER_OFFSET_Y)
    end
end)

LibEvent:attachTrigger("tooltip.style.mask", function(self, frame, boolean)
    LibEvent:trigger("tooltip.style.init", frame)
    frame.style.mask:SetShown(boolean)
end)

LibEvent:attachTrigger("tooltip.style.background", function(self, frame, r, g, b, a)
    LibEvent:trigger("tooltip.style.init", frame)
    local rr, gg, bb, aa = frame.style:GetBackdropColor()
    if (rr ~= r or gg ~= g or bb ~= b or aa ~= a) then
        frame.style:SetBackdropColor(r or rr, g or gg, b or bb, a or aa)
    end
end)

LibEvent:attachTrigger("tooltip.style.border.size", function(self, frame, size)
    LibEvent:trigger("tooltip.style.init", frame)
    local backdrop = frame.style:GetBackdrop()
    local r, g, b, a = frame.style:GetBackdropColor()
    if (backdrop.edgeFile == "Interface\\Buttons\\WHITE8X8") then
        backdrop.edgeSize = size
        backdrop.insets.top = size
        backdrop.insets.left = size
        backdrop.insets.right = size
        backdrop.insets.bottom = size
        frame.style:SetBackdrop(backdrop)
        frame.style:SetBackdropColor(r, g, b, a)
        frame.style.inside:SetPoint("TOPLEFT", frame.style, "TOPLEFT", size, -size)
        frame.style.inside:SetPoint("BOTTOMRIGHT", frame.style, "BOTTOMRIGHT", -size, size)
    end
end)

LibEvent:attachTrigger("tooltip.style.border.corner", function(self, frame, corner)
    LibEvent:trigger("tooltip.style.init", frame)
    local backdrop = frame.style:GetBackdrop()
    local r, g, b, a = frame.style:GetBackdropColor()
    if (corner == "angular") then
        backdrop.edgeFile = "Interface\\Buttons\\WHITE8X8"
        backdrop.edgeSize = min(backdrop.edgeSize, 6)
        frame.style.mask:SetPoint("TOPLEFT", 1, -1)
        frame.style.mask:SetPoint("BOTTOMRIGHT", frame.style, "TOPRIGHT", -1, -32)
        frame.style.outside:Show()
        frame.style.inside:Show()
        frame.style.inside:SetPoint("TOPLEFT", frame.style, "TOPLEFT", backdrop.edgeSize, -backdrop.edgeSize)
        frame.style.inside:SetPoint("BOTTOMRIGHT", frame.style, "BOTTOMRIGHT", -backdrop.edgeSize, backdrop.edgeSize)
    else
        backdrop.edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border"
        backdrop.edgeSize = 16
        backdrop.insets.top = 3
        backdrop.insets.left = 3
        backdrop.insets.right = 3
        backdrop.insets.bottom = 3
        frame.style.mask:SetPoint("TOPLEFT", 3, -3)
        frame.style.mask:SetPoint("BOTTOMRIGHT", frame.style, "TOPRIGHT", -3, -32)
        frame.style.inside:Hide()
        frame.style.outside:Hide()
    end
    frame.style:SetBackdrop(backdrop)
    frame.style:SetBackdropColor(r, g, b, a)
end)

LibEvent:attachTrigger("tooltip.style.border.color", function(self, frame, r, g, b, a)
    LibEvent:trigger("tooltip.style.init", frame)
    local rr, gg, bb, aa = frame.style:GetBackdropBorderColor()
    if (rr ~= r or gg ~= g or bb ~= b or aa ~= a) then
        frame.style:SetBackdropBorderColor(r or rr, g or gg, b or bb, a or aa)
    end
end)

LibEvent:attachTrigger("tooltip.statusbar.height", function(self, height)
    GameTooltipStatusBar:SetHeight(height or 12)
end)

LibEvent:attachTrigger("tooltip.statusbar.text", function(self, boolean)
    GameTooltipStatusBar.forceHideText = not boolean
end)

LibEvent:attachTrigger("tooltip.statusbar.font", function(self, font, size, flag)
    if (not GameTooltipStatusBar.TextString) then return end
    local origFont, origSize, origFlag = GameTooltipStatusBar.TextString:GetFont()
    if (font ~= origFont or size ~= origSize or flag ~= origFlag) then
        GameTooltipStatusBar.TextString:SetFont(font or origFont, size or origSize, flag or origFlag)
    end
end)

LibEvent:attachTrigger("tooltip.statusbar.position", function(self, position, offsetY)
    LibEvent:trigger("tooltip.style.init", GameTooltip)
    GameTooltip.style:ClearAllPoints()
    GameTooltipStatusBar:ClearAllPoints()
    local backdrop = GameTooltip.style:GetBackdrop()
    if (not GameTooltipStatusBar:IsShown()) then position = "" end
    if (position == "bottom") then
        local offset = backdrop.edgeFile == "Interface\\Tooltips\\UI-Tooltip-Border" and 5 or backdrop.edgeSize + 1
        if (not offsetY or offsetY == 0) then offsetY = -offset end
        GameTooltipStatusBar:SetPoint("TOPLEFT", GameTooltip, "BOTTOMLEFT", offset, 2)
        GameTooltipStatusBar:SetPoint("TOPRIGHT", GameTooltip, "BOTTOMRIGHT", -offset, 2)
        GameTooltip.style:SetPoint("TOPLEFT")
        GameTooltip.style:SetPoint("BOTTOMRIGHT", GameTooltipStatusBar, "BOTTOMRIGHT", offset, offsetY)
    elseif (position == "top") then
        local offset = backdrop.edgeFile == "Interface\\Tooltips\\UI-Tooltip-Border" and 4 or backdrop.edgeSize
        if (not offsetY or offsetY == 0) then offsetY = offset end
        GameTooltipStatusBar:SetPoint("BOTTOMLEFT", GameTooltip, "TOPLEFT", offset, 0)
        GameTooltipStatusBar:SetPoint("BOTTOMRIGHT", GameTooltip, "TOPRIGHT", -offset, 0)
        GameTooltip.style:SetPoint("TOPLEFT", GameTooltipStatusBar, "TOPLEFT", -offset, offsetY)
        GameTooltip.style:SetPoint("BOTTOMRIGHT")
    else
        local offset = backdrop.edgeFile == "Interface\\Tooltips\\UI-Tooltip-Border" and 2 or 0
        GameTooltipStatusBar:SetPoint("TOPLEFT", GameTooltip, "BOTTOMLEFT", offset, -1)
        GameTooltipStatusBar:SetPoint("TOPRIGHT", GameTooltip, "BOTTOMRIGHT", -offset, -1)
        GameTooltip.style:SetAllPoints()
    end
end)

LibEvent:attachTrigger("tooltip.style.init", function(self, tip)
    if (tip.style) then return end
    local backdrop = {
        bgFile   = "Interface\\Tooltips\\UI-Tooltip-Background",
        insets   = {left = 3, right = 3, top = 3, bottom = 3},
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        edgeSize = 16,
    }
    tip:SetBackdrop({})
    tip.style = CreateFrame("Frame", nil, tip)
    tip.style:SetFrameLevel(max(0,tip:GetFrameLevel()-1))
    tip.style:SetAllPoints()
    tip.style:SetBackdrop(backdrop)
    tip.style:SetBackdropColor(0, 0, 0, 0.9)
    tip.style:SetBackdropBorderColor(0.6, 0.6, 0.6, 0.8)
    tip.style.inside = CreateFrame("Frame", nil, tip.style)
    tip.style.inside:SetBackdrop({edgeSize=1,edgeFile="Interface\\Buttons\\WHITE8X8"})
    tip.style.inside:SetPoint("TOPLEFT", tip.style, "TOPLEFT", 1, -1)
    tip.style.inside:SetPoint("BOTTOMRIGHT", tip.style, "BOTTOMRIGHT", -1, 1)
    tip.style.inside:SetBackdropBorderColor(0.1, 0.1, 0.1, 0.8)
    tip.style.inside:Hide()
    tip.style.outside = CreateFrame("Frame", nil, tip.style)
    tip.style.outside:SetBackdrop({edgeSize=1,edgeFile="Interface\\Buttons\\WHITE8X8"})
    tip.style.outside:SetPoint("TOPLEFT", tip.style, "TOPLEFT", -1, 1)
    tip.style.outside:SetPoint("BOTTOMRIGHT", tip.style, "BOTTOMRIGHT", 1, -1)
    tip.style.outside:SetBackdropBorderColor(0, 0, 0, 0.5)
    tip.style.outside:Hide()
    tip.style.mask = tip.style:CreateTexture(nil, "OVERLAY")
    tip.style.mask:SetTexture("Interface\\Tooltips\\UI-Tooltip-Background")
    tip.style.mask:SetPoint("TOPLEFT", 3, -3)
    tip.style.mask:SetPoint("BOTTOMRIGHT", tip.style, "TOPRIGHT", -3, -32)
    tip.style.mask:SetBlendMode("ADD")
    tip.style.mask:SetGradientAlpha("VERTICAL", 0, 0, 0, 0, 0.9, 0.9, 0.9, 0.4)
    tip.style.mask:Hide()
    tip:HookScript("OnShow", function(self) LibEvent:trigger("tooltip:show", self) end)
    tip:HookScript("OnHide", function(self) LibEvent:trigger("tooltip:hide", self) end)
    if (tip:HasScript("OnTooltipSetUnit")) then
        tip:HookScript("OnTooltipSetUnit", function(self)
            local unit = select(2, self:GetUnit())
            if (not unit) then return end
            LibEvent:trigger("tooltip:unit", self, unit)
        end)
    end
    if (tip:HasScript("OnTooltipSetItem")) then
        tip:HookScript("OnTooltipSetItem", function(self)
            local link = select(2, self:GetItem())
            if (not link) then return end
            LibEvent:trigger("tooltip:item", self, link)
        end)
    end
    if (tip:HasScript("OnTooltipSetSpell")) then
        tip:HookScript("OnTooltipSetSpell", function(self) LibEvent:trigger("tooltip:spell", self) end)
    end
    if (tip:HasScript("OnTooltipCleared")) then
        tip:HookScript("OnTooltipCleared", function(self) LibEvent:trigger("tooltip:cleared", self) end)
    end
    if (tip:HasScript("OnTooltipSetQuest")) then
        tip:HookScript("OnTooltipSetQuest", function(self) LibEvent:trigger("tooltip:quest", self) end)
    end
    LibEvent:trigger("tooltip:init", tip)
    if (tip == GameTooltip) then
        tip.GetBackdrop = function(self) return self.style:GetBackdrop() end
        tip.GetBackdropColor = function(self) return self.style:GetBackdropColor() end
        tip.GetBackdropBorderColor = function(self) return self.style:GetBackdropBorderColor() end
    end
end)

hooksecurefunc("GameTooltip_SetDefaultAnchor", function(self, parent)
    LibEvent:trigger("tooltip:anchor", self, parent)
end)

TinyTooltip = addon

-- tooltip:init
-- tooltip:anchor
-- tooltip:show
-- tooltip:hide
-- tooltip:unit
-- tooltip:item
-- tooltip:spell
-- tooltip:quest
-- tooltip:cleared
