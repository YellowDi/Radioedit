
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
local RARE = GARRISON_MISSION_RARE
local OFFLINE = FRIENDS_LIST_OFFLINE

local addon = select(2, ...)

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
}

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
    for i = 3, tooltip:NumLines() do
        line = _G[tooltip:GetName() .. "TextLeft" .. i]
        text = line:GetText() or ""
        if (strfind(text, keyword)) then
            line:SetText(nil)
            break
        end
    end
end

-- 取行
function addon:GetLine(tooltip, number)
    if (not _G[tooltip:GetName() .. "TextLeft" .. number]) then
        tooltip:AddLine(" ")
        return self:GetLine(tooltip, number)
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
    local r = tonumber(strsub(hex,1,2),16) or 255
	local g = tonumber(strsub(hex,3,4),16) or 255
	local b = tonumber(strsub(hex,5,6),16) or 255
	return r/255, g/255, b/255
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

-- 頭銜 @param2:false為前綴
function addon:GetTitle(name, pvpName)
    if (not pvpName) then return end
    local pos = string.find(pvpName, name)
    local title = pvpName:gsub(name, "", 1)
    title = title:gsub(",", ""):gsub("，", "")
    title = strtrim(title)
    return title, pos == 1
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

    return {
        raidIcon     = self:GetRaidIcon(unit),
        pvpIcon      = self:GetPVPIcon(unit),
        factionIcon  = self:GetFactionIcon(factionGroup),
        classIcon    = self:GetClassIcon(class),
        questIcon    = self:GetQuestBossIcon(unit),
        factionName  = factionName,
        name         = name,
        gender       = self:GetGender(gender),
        title        = self:GetTitle(name, pvpName),
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

        unit         = unit,                     --unit
        level        = level,                    --1~113|-1
        race         = race,                     --nil|NightElf|Troll...
        class        = class,                    --DRUID|HUNTER...
        factionGroup = factionGroup,             --Alliance|Horde|Neutral
        reaction     = reaction,                 --nil|1|2|3|4|5|6|7|8
        classif      = UnitClassification(unit), --normal|worldboss|elite|rare|rareelite
    }
end

-- 格式化數據
function addon:FormatData(value, config, raw)
    local color, wildcard = config.color, config.wildcard
    if (self.colorfunc[color]) then
        color = self.colorfunc[color](raw)
    end
    if (color == "") then
        return (wildcard):format(value)
    else
        return ("|cff"..color..wildcard.."|r"):format(value)
    end
end

-- 獲取數據
function addon:GetUnitData(unit, configs, raw)
    local data = {}
    if (not raw) then
        raw = self:GetUnitInfo(unit)
    end
    for i, v in ipairs(configs) do
        data[i] = {}
        for _, config in ipairs(v) do
            if (raw[config.key]) then
                if (config.color and config.wildcard) then
                    tinsert(data[i], self:FormatData(raw[config.key], config, raw))
                else
                    tinsert(data[i], raw[config.key])
                end
            end
        end
    end
    for i, v in ipairs(data) do
        if (not v[1]) then tremove(data, i) end
    end
    return data
end


addon.datafunc, addon.colorfunc = {}, {}

addon.colorfunc.class = function(raw)
    return addon:GetHexColor(GetClassColor(raw.class))
end

addon.colorfunc.level = function(raw)
    local color = GetCreatureDifficultyColor(raw.level>0 and raw.level or 999)
    return addon:GetHexColor(color)
end

addon.colorfunc.reaction = function(raw)
    return addon:GetHexColor(FACTION_BAR_COLORS[raw.reaction or 3])
end

addon.colorfunc.itemQuality = function(raw)
    return addon:GetHexColor(ITEM_QUALITY_COLORS[raw.itemQuality or 0])
end

addon.colorfunc.selection = function(raw)
    return addon:GetHexColor(UnitSelectionColor(raw.unit))
end

addon.colorfunc.faction = function(raw)
    if (raw.factionGroup == "Neutral") then
        return "e5b200"
    elseif (raw.factionGroup == UnitFactionGroup("player")) then
        return "00cc33"
    else
        return "dd3300"
    end
end


LibEvent:attachTrigger("tooltip.scale", function(self, frame, scale)
    frame:SetScale(scale)
end)

LibEvent:attachTrigger("tooltip.anchor.cursor", function(self, frame, parent)
    frame:SetOwner(parent, "ANCHOR_NONE")
    frame:SetOwner(parent, "ANCHOR_CURSOR")
end)

LibEvent:attachTrigger("tooltip.anchor.cursor.right", function(self, frame, parent, offsetX, offsetY)
    frame:SetOwner(parent, "ANCHOR_NONE")
    frame:SetOwner(parent, "ANCHOR_CURSOR_RIGHT", offsetX or 30, offsetY or 0)
end)

LibEvent:attachTrigger("tooltip.anchor.static", function(self, frame, offsetX, offsetY)
    local anchor = select(2, frame:GetPoint())
    if (anchor == UIParent) then
        frame:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", offsetX or (-CONTAINER_OFFSET_X-13), offsetY or CONTAINER_OFFSET_Y)
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
    if (backdrop.edgeFile == "Interface\\Buttons\\WHITE8X8") then
        backdrop.edgeSize = size
        backdrop.insets.top = size
        backdrop.insets.left = size
        backdrop.insets.right = size
        backdrop.insets.bottom = size
        frame.style:SetBackdrop(backdrop)
    end
end)

LibEvent:attachTrigger("tooltip.style.border.corner", function(self, frame, corner)
    LibEvent:trigger("tooltip.style.init", frame)
    local backdrop = frame.style:GetBackdrop()
    if (corner == "angular") then
        backdrop.edgeFile = "Interface\\Buttons\\WHITE8X8"
        frame.style.mask:SetPoint("TOPLEFT", 1, -1)
        frame.style.mask:SetPoint("BOTTOMRIGHT", frame.style, "TOPRIGHT", -1, -32)
    else
        backdrop.edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border"
        backdrop.edgeSize = 16
        backdrop.insets.top = 3
        backdrop.insets.left = 3
        backdrop.insets.right = 3
        backdrop.insets.bottom = 3
        frame.style.mask:SetPoint("TOPLEFT", 3, -3)
        frame.style.mask:SetPoint("BOTTOMRIGHT", frame.style, "TOPRIGHT", -3, -32)
    end
    frame.style:SetBackdrop(backdrop)
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

LibEvent:attachTrigger("tooltip.statusbar.position", function(self, position)
    LibEvent:trigger("tooltip.style.init", GameTooltip)
    GameTooltip.style:ClearAllPoints()
    GameTooltipStatusBar:ClearAllPoints()
    local backdrop = GameTooltip.style:GetBackdrop()
    if (not GameTooltipStatusBar:IsShown()) then position = "" end
    if (position == "BOTTOM") then
        local offset = backdrop.edgeFile == "Interface\\Tooltips\\UI-Tooltip-Border" and 5 or backdrop.edgeSize + 1
        GameTooltipStatusBar:SetPoint("TOPLEFT", GameTooltip, "BOTTOMLEFT", offset, 2)
        GameTooltipStatusBar:SetPoint("TOPRIGHT", GameTooltip, "BOTTOMRIGHT", -offset, 2)
        GameTooltip.style:SetPoint("TOPLEFT")
        GameTooltip.style:SetPoint("BOTTOMRIGHT", GameTooltipStatusBar, "BOTTOMRIGHT", offset, -offset)
    elseif (position == "TOP") then
        local offset = backdrop.edgeFile == "Interface\\Tooltips\\UI-Tooltip-Border" and 4 or backdrop.edgeSize
        GameTooltipStatusBar:SetPoint("BOTTOMLEFT", GameTooltip, "TOPLEFT", offset, 0)
        GameTooltipStatusBar:SetPoint("BOTTOMRIGHT", GameTooltip, "TOPRIGHT", -offset, 0)
        GameTooltip.style:SetPoint("TOPLEFT", GameTooltipStatusBar, "TOPLEFT", -offset, offset)
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
    LibEvent:trigger("tooltip:init", tip)
end)

LibEvent:attachTrigger("tooltip:cleared", function(self, tip)
    LibEvent:trigger("tooltip.style.border.color", tip, 0.6, 0.6, 0.6)
    LibEvent:trigger("tooltip.style.background", tip, 0, 0, 0)
end)

hooksecurefunc("GameTooltip_SetDefaultAnchor", function(self, parent)
    LibEvent:trigger("tooltip:anchor", self, parent)
end)

-- tooltip:init
-- tooltip:anchor
-- tooltip:show
-- tooltip:hide
-- tooltip:unit
-- tooltip:item
-- tooltip:spell
-- tooltip:cleared
