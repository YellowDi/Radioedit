
local LibEvent = LibStub:GetLibrary("LibEvent.7000")
local LibSchedule = LibStub:GetLibrary("LibSchedule.7000")

local addon = select(2, ...)

local function AnchorCursor(tip, parent, cp, cx, cy)
    LibSchedule:AddTask({
        identity = tostring(tip),
        elasped  = 0.01,
        expired  = GetTime() + 300,
        override = true,
        tip      = tip,
        cp       = cp or "BOTTOM",
        cx       = cx or 0,
        cy       = cy or 20,
        scale    = tip:GetEffectiveScale(),
        onExecute = function(self)
            if (not self.tip:IsShown()) then return true end
            if (self.tip:GetAnchorType() == "ANCHOR_NONE") then return true end
            local x, y = GetCursorPosition()
            self.tip:ClearAllPoints()
            self.tip:SetPoint(self.cp, UIParent, "BOTTOMLEFT", floor(x/self.scale+self.cx), floor(y/self.scale+self.cy))
        end,
    })
end

local function AnchorDefaultPosition(tip, parent, anchor, finally)
    if (finally) then
        LibEvent:trigger("tooltip.anchor.static", tip, parent, anchor.x, anchor.y)
    elseif (anchor.position == "inherit") then
        AnchorDefaultPosition(tip, parent, addon.db.general.anchor, true)
    else
        LibEvent:trigger("tooltip.anchor.static", tip, parent, anchor.x, anchor.y)
    end
end

local function AnchorFrame(tip, parent, anchor, isUnitFrame, finally)
    if (not anchor) then return end
    if (anchor.returnInCombat and InCombatLockdown()) then return AnchorDefaultPosition(tip, parent, anchor, finally) end
    if (anchor.returnOnUnitFrame and isUnitFrame) then return AnchorDefaultPosition(tip, parent, anchor, finally) end
    if (anchor.position == "cursorRight") then
        LibEvent:trigger("tooltip.anchor.cursor.right", tip, parent)
    elseif (anchor.position == "cursor") then
        LibEvent:trigger("tooltip.anchor.cursor", tip, parent)
        AnchorCursor(tip, parent, anchor.cp, anchor.cx, anchor.cy)
    elseif (anchor.position == "inherit" and not finally) then
        AnchorFrame(tip, parent, addon.db.general.anchor, isUnitFrame, true)
    elseif (anchor.position == "static") then
        LibEvent:trigger("tooltip.anchor.static", tip, parent, anchor.x, anchor.y)
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
