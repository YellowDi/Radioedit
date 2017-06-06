
local LibEvent = LibStub:GetLibrary("LibEvent.7000")

local addon = select(2, ...)

local function AnchorFrame(tip, parent, anchor, isUnitFrame, finally)
    if (not anchor) then return end
    if (anchor.returnInCombat and InCombatLockdown()) then return end
    if (anchor.returnOnUnitFrame and isUnitFrame) then return end
    if (anchor.position == "cursorRight") then
        LibEvent:trigger("tooltip.anchor.cursor.right", tip, parent, anchor.cx, anchor.cy)
    elseif (anchor.position == "cursor") then
        LibEvent:trigger("tooltip.anchor.cursor", tip, parent)
    elseif (anchor.position == "static") then
        LibEvent:trigger("tooltip.anchor.static", tip, anchor.x, anchor.y)
    elseif (anchor.position == "inherit" and not finally) then
        AnchorFrame(tip, parent, addon.db.general.anchor, isUnitFrame, true)
    end
end

LibEvent:attachTrigger("tooltip:anchor", function(self, tip, parent)
    if (tip ~= GameTooltip) then return end
    local unit
    local focus = GetMouseFocus()
    local isUnitFrame = false
    if (focus and focus.unit) then
        unit = focus.unit
        isUnitFrame = true
    end
    if (not unit and focus and focus.GetAttribute) then
        unit = focus:GetAttribute("unit")
    end
    if (not unit) then
        unit = "mouseover"
    end
    if (UnitIsPlayer(unit)) then
        AnchorFrame(tip, parent, addon.db.unit.player.anchor, isUnitFrame)
    elseif (UnitExists(unit)) then
        AnchorFrame(tip, parent, addon.db.unit.npc.anchor, isUnitFrame)
    else
        AnchorFrame(tip, parent, addon.db.general.anchor, isUnitFrame)
    end
end)
