
-------------------------------------
-- 鼠标装等和天赋 Author: M
-------------------------------------

local LibEvent = LibStub:GetLibrary("LibEvent.7000")

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

--GameTooltip顯示
local LevelLabel = STAT_AVERAGE_ITEM_LEVEL .. ": "
local SpecLabel  = TALENT .. SPECIALIZATION .. ": "
local function AppendToGameTooltip(guid, ilevel, spec)
    local _, unit = GameTooltip:GetUnit()
    if (not unit or UnitGUID(unit) ~= guid) then return end
    local ilvlLine = FindLine(GameTooltip, LevelLabel)
    local specLine = FindLine(GameTooltip, SpecLabel)
    local text
    if (ilevel) then
        text = format("%s|cffffffff%s|r", LevelLabel, ilevel)
        if (ilvlLine) then
            ilvlLine:SetText(text)
        else
            GameTooltip:AddLine(text)
        end
    end
    if (spec) then
        text = format("%s|cffffffff%s|r", SpecLabel, spec)
        if (specLine) then
            specLine:SetText(text)
        else
            GameTooltip:AddLine(text)
        end
    elseif (specLine) then
        specLine:SetText(nil)
    end
    GameTooltip:Show()
end

--觸發觀察
GameTooltip:HookScript("OnTooltipSetUnit", function(self)
    if (TinyInspectDB and not TinyInspectDB.EnableMouseItemLevel) then return end
    local _, unit = self:GetUnit()
    if (not unit) then return end
    local guid = UnitGUID(unit)
    if (not guid) then return end
    local hp = UnitHealthMax(unit)
    local data = GetInspectInfo(unit, 1800)
    if (data and data.hp == hp and data.ilevel > 0) then
        return AppendToGameTooltip(guid, floor(data.ilevel), data.spec)
    end
    if (not CanInspect(unit) or not UnitIsVisible(unit)) then return end
    local inspecting = GetInspecting()
    if (inspecting) then
        if (inspecting.guid ~= guid) then
            return AppendToGameTooltip(guid, "n/a", "n/a")
        else
            return AppendToGameTooltip(guid, "....", "....")
        end
    end
    ClearInspectPlayer()
    NotifyInspect(unit)
    AppendToGameTooltip(guid, "...", "...")
end)

--@see InspectCore.lua
LibEvent:attachTrigger("UNIT_INSPECT_READY", function(self, data)
    if (TinyInspectDB and not TinyInspectDB.EnableMouseItemLevel) then return end
    if (data.guid == UnitGUID("mouseover")) then
        AppendToGameTooltip(data.guid, floor(data.ilevel), data.spec)
    end
end)
