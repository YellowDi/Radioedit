
local LibEvent = LibStub:GetLibrary("LibEvent.7000")

local YOU = YOU
local NONE = NONE
local EMPTY = EMPTY
local TARGET = TARGET
local TOOLTIP_UPDATE_TIME = TOOLTIP_UPDATE_TIME

local addon = select(2, ...)

local function GetTargetString(unit)
    if (not UnitExists(unit)) then
        return format("|cff999999(%s)|r", EMPTY)
    end
    local name = UnitName(unit)
    local icon = addon:GetRaidIcon(unit) or ""
    if UnitIsUnit(unit, "player") then
        return format("|cffff3333>>%s<<|r", strupper(YOU))
    elseif UnitIsPlayer(unit) then
        local class = select(2, UnitClass(unit))
        local colorCode = select(4, GetClassColor(class))
        return format("%s|c%s%s|r", icon, colorCode, name)
    elseif UnitIsOtherPlayersPet(unit) then
        return format("%s|cff%s<%s>|r", icon, addon:GetHexColor(GameTooltip_UnitColor(unit)), name)
    else
        return format("%s|cff%s[%s]|r", icon, addon:GetHexColor(GameTooltip_UnitColor(unit)), name)
    end
end

GameTooltip:HookScript("OnUpdate", function(self, elapsed)
    if (self.updateTooltip ~= TOOLTIP_UPDATE_TIME) then return end
    if (not self:IsUnit("mouseover")) then return end
    if (addon.db.unit.player.showTarget and UnitIsPlayer("mouseover"))
        or (addon.db.unit.npc.showTarget and not UnitIsPlayer("mouseover")) then
        local line = addon:FindLine(self, "^"..TARGET..":")
        if (line) then
            line:SetFormattedText("%s: %s", TARGET, GetTargetString("mouseovertarget"))
        elseif (not line and UnitExists("mouseovertarget")) then
            self:AddLine(format("%s: %s", TARGET, GetTargetString("mouseovertarget")))
            self:Show()
        end
    end
end)


-- Target By

local function GetTargetByString(mouseover, num)
    local count, prefix = 0, IsInRaid() and "raid" or "party"
    local names, unit = ""
    for i = 1, num do
        unit = prefix..i.."target"
        if UnitIsUnit(mouseover, unit) then
            count = count + 1
            if (prefix == "party") then
                names = names .. "|c" .. GetClassColor(select(2,UnitClass(unit))) .. UnitName(unit) .. "|r "
            end
        end
    end
    if (count > 0) then
        return names == "" and format("|cff33ffff%s|r", count) or names
    end
end

LibEvent:attachTrigger("tooltip:unit", function(self, tip, unit)
    if (tip:IsUnit("mouseover")) then
        local num = GetNumGroupMembers()
        if (num >= 1) and
          ((addon.db.unit.player.showTargetBy and UnitIsPlayer("mouseover"))
          or (addon.db.unit.npc.showTargetBy and not UnitIsPlayer("mouseover"))) then
            local text = GetTargetByString("mouseover", num)
            if (text) then
                tip:AddLine(format("%s: %s", addon.L and addon.L.TargetBy or "Target By", text), nil, nil, nil, true)
            end
        end
    end
end)
