
-------------------------------------
-- 人物面板装备耐久 Author: M
-------------------------------------

local function ShowPaperDollDurability(self)
    local id = self:GetID()
    if (id == 4 or id > 17) then return end
    if (not self.durabString) then
        local fontAdjust = GetLocale():sub(1,2) == "zh" and 0 or -3
        self.durabString = self:CreateFontString(nil, "OVERLAY")
        self.durabString:SetFont(STANDARD_TEXT_FONT, 10, "THINOUTLINE")
        self.durabString:SetPoint("BOTTOM", 0, 2)
    end
    if (self.hasItem) then
        local durability, maxDurability = GetInventoryItemDurability(id)
        if (durability and maxDurability) then
            local durabPercent = durability / maxDurability
            self.durabString:SetText(format("%d%%", durabPercent * 100))
            self.durabString:SetTextColor(1-durabPercent, durabPercent, 0)
        else
            self.durabString:SetText("")
        end
    else
        self.durabString:SetText("")
    end
end

hooksecurefunc("PaperDollItemSlotButton_Update", function(self)
    ShowPaperDollDurability(self)
end)