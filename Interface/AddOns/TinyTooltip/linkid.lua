
local addon = select(2, ...)

local function ParseHyperLink(link)
    if (not link) then return end
    local name, value = string.match(link, "|?H?(%a+):(%d+):")
    if (name and value) then
        return name:gsub("^([a-z])", function(s) return strupper(s) end) .. ":", value
    end
end

local function ShowId(tooltip, name, value, noBlankLine)
    if (not name or not value) then return end
    if (IsShiftKeyDown() or IsControlKeyDown() or IsAltKeyDown()) then
        local line = addon:FindLine(tooltip, name)
        if (not line) then
            if (not noBlankLine) then tooltip:AddLine(" ") end
            tooltip:AddLine(format("%s %s", name, value), 0, 1, 0.8)
            tooltip:Show()
        end
    end
end

local function ShowLinkIdInfo(tooltip, link)
    ShowId(tooltip, ParseHyperLink(link))
end

local function ShowItemIdInfo(tooltip)
    ShowLinkIdInfo(tooltip, select(2,tooltip:GetItem()))
end

-- Link
hooksecurefunc(ItemRefTooltip, "SetHyperlink", ShowLinkIdInfo)
hooksecurefunc(GameTooltip, "SetHyperlink", ShowLinkIdInfo)
hooksecurefunc("SetItemRef", function(link) ShowLinkIdInfo(ItemRefTooltip, link) end)

-- Item
GameTooltip:HookScript("OnTooltipSetItem", ShowItemIdInfo)
ItemRefTooltip:HookScript("OnTooltipSetItem", ShowItemIdInfo)
ItemRefShoppingTooltip1:HookScript("OnTooltipSetItem", ShowItemIdInfo)
ItemRefShoppingTooltip2:HookScript("OnTooltipSetItem", ShowItemIdInfo)
ShoppingTooltip1:HookScript("OnTooltipSetItem", ShowItemIdInfo)
ShoppingTooltip2:HookScript("OnTooltipSetItem", ShowItemIdInfo)

-- Spell
GameTooltip:HookScript("OnTooltipSetSpell", function(self) ShowId(self, "Spell:", (select(3,self:GetSpell()))) end)
hooksecurefunc(GameTooltip, "SetUnitAura", function(self, ...) ShowId(self, "Spell:", (select(11,UnitAura(...)))) end)
hooksecurefunc(GameTooltip, "SetUnitBuff", function(self, ...) ShowId(self, "Spell:", (select(11,UnitBuff(...)))) end)
hooksecurefunc(GameTooltip, "SetUnitDebuff", function(self, ...) ShowId(self, "Spell:", (select(11,UnitDebuff(...)))) end)
hooksecurefunc(GameTooltip, "SetArtifactPowerByID", function(self, powerID)
    ShowId(self, "Power:", powerID)
    ShowId(self, "Spell:", C_ArtifactUI.GetPowerInfo(powerID).spellID, 1)
end)
