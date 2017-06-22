
local LibEvent = LibStub:GetLibrary("LibEvent.7000")

local addon = TinyTooltip

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

local function SpellIcon(tip)
    if (addon.db.spell.showIcon) then
        local id = select(3, tip:GetSpell())
        local texture = select(3, GetSpellInfo(tonumber(id) or 0))
        if (texture) then
            addon:GetLine(tip,1):SetFormattedText("|T%s:16|t %s", texture, addon:GetLine(tip,1):GetText())
        end
    end
end

LibEvent:attachTrigger("tooltip:spell", function(self, tip)
    SpellIcon(tip)
    ColorBorder(tip)
    ColorBackground(tip)
end)
