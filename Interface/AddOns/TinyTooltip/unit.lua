
local LibEvent = LibStub:GetLibrary("LibEvent.7000")

local PVP = PVP
local LEVEL = LEVEL
local FACTION_HORDE = FACTION_HORDE
local FACTION_ALLIANCE = FACTION_ALLIANCE

local addon = select(2, ...)

local function ColorBorder(tip, config, raw)
    if (config.coloredBorder and addon.colorfunc[config.coloredBorder]) then
        local r, g, b = addon.colorfunc[config.coloredBorder](raw)
        LibEvent:trigger("tooltip.style.border.color", tip, r, g, b)
    elseif (type(config.coloredBorder) == "string" and config.coloredBorder ~= "default") then
        local r, g, b = addon:GetRGBColor(config.coloredBorder)
        if (r and g and b) then
            LibEvent:trigger("tooltip.style.border.color", tip, r, g, b)
        end
    end
end

local function PlayerCharacter(tip, unit, config, raw)
    local data = addon:GetUnitData(unit, config.elements, raw)
    for i, v in ipairs(data) do
        addon:GetLine(tip,i):SetText(table.concat(v, " "))
    end
    addon:HideLine(tip, "^"..LEVEL)
    addon:HideLine(tip, "^"..FACTION_ALLIANCE)
    addon:HideLine(tip, "^"..FACTION_HORDE)
    addon:HideLine(tip, "^"..PVP)
    ColorBorder(tip, config, raw)
end

local function NonPlayerCharacter(tip, unit, config, raw)
    local data = addon:GetUnitData(unit, config.elements, raw)
    local titleLine = addon:GetNpcTitle(tip)
    local increase = 0
    for i, v in ipairs(data) do
        if (i == 1) then
            addon:GetLine(tip,i):SetText(table.concat(v, " "))
        end
        if (i == 2) then
            if (config.elements.npcTitle.enable and titleLine) then
                titleLine:SetText(addon:FormatData(titleLine:GetText(), config.elements.npcTitle, raw))
                increase = 1
            end
            i = i + increase
            addon:GetLine(tip,i):SetText(table.concat(v, " "))
        elseif ( i > 2) then
            i = i + increase
            addon:GetLine(tip,i):SetText(table.concat(v, " "))
        end
    end
    addon:HideLine(tip, "^"..LEVEL)
    addon:HideLine(tip, "^"..PVP)
    ColorBorder(tip, config, raw)
end

LibEvent:attachTrigger("tooltip:unit", function(self, tip, unit)
    local raw = addon:GetUnitInfo(unit)
    if (UnitIsPlayer(unit)) then
        PlayerCharacter(tip, unit, addon.db.unit.player, raw)
    else
        NonPlayerCharacter(tip, unit, addon.db.unit.npc, raw)
    end
end)
