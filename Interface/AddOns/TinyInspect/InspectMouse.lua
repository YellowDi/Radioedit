
-------------------------------------
-- 鼠标装等和天赋 Author: M
-------------------------------------

local LibEvent = LibStub:GetLibrary("LibEvent.7000")

--GameTooltip顯示
local LevelLabel = STAT_AVERAGE_ITEM_LEVEL .. ": "
local SpecLabel  = TALENT .. SPECIALIZATION .. ": "
local function AppendToGameTooltip(guid, ilevel, spec)
    local _, unit = GameTooltip:GetUnit()
    if (not unit or UnitGUID(unit) ~= guid) then return end
    
    local line, text, ilevelLine, specLine
    for i = 2, GameTooltip:NumLines() do
        line = _G["GameTooltipTextLeft" .. i]
        text = line:GetText()
        if (text and strfind(text, LevelLabel)) then
            ilevelLine = line
        elseif (text and strfind(text, SpecLabel)) then
            specLine = line
        end
    end

    if (ilevel) then
        text = "|cffffeeaa" .. LevelLabel .. "|cffffffff" .. ilevel
        if (ilevelLine) then
            ilevelLine:SetText(text)
        else
            GameTooltip:AddLine(text)
        end
    end

    if (spec) then
        text = "|cffffeeaa" .. SpecLabel .. "|cffffffff" .. spec
        if (specLine) then
            specLine:SetText(text)
        else
            GameTooltip:AddLine(text)
        end
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
    local data = GetInspectInfo(unit, 600)
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
