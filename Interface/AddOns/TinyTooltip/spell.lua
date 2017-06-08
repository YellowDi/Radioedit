
local LibEvent = LibStub:GetLibrary("LibEvent.7000")

local addon = select(2, ...)

local function ColorBorder(tip)
    if (addon.db.spell.borderColor) then
        LibEvent:trigger("tooltip.style.border.color", tip, unpack(addon.db.spell.borderColor))
    end
end

local function ColorBackground(tip)
    if (addon.db.spell.background) then
        LibEvent:trigger("tooltip.style.background", tip, unpack(addon.db.spell.background))
    end
end

LibEvent:attachTrigger("tooltip:spell", function(self, tip)
    ColorBorder(tip)
    ColorBackground(tip)
end)
