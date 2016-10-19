local E, L, V, P, G = unpack(select(2, ...)); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB

--顯示面板裝備物品等級
local function ShowPaperDollItemLevel(self, unit)
	if (self:GetID() == 4 or self:GetID() > 17) then return end
    if (not self.levelString) then
        self.levelBorder = self:CreateTexture(nil, 'OVERLAY')
        self.levelBorder:SetSize(67, 67)
        self.levelBorder:SetPoint('CENTER')
        self.levelBorder:SetTexture([[Interface\Buttons\UI-ActionButton-Border]])
        self.levelBorder:SetBlendMode('ADD')
        self.levelBorder:Hide()
        self.levelString = self:CreateFontString(nil, "OVERLAY")
		self.levelString:SetFont(STANDARD_TEXT_FONT, 13, "OUTLINE")
		self.levelString:SetPoint("TOP")
        self.levelString:SetTextColor(1, 0.82, 0)
        self.DurabString = self:CreateFontString(nil, "OVERLAY")
		self.DurabString:SetFont(STANDARD_TEXT_FONT, 13, "OUTLINE")
		self.DurabString:SetPoint("BOTTOM")
        self.DurabString:SetTextColor(0, 0.9, 0)
    end
    local result
    if (unit and self.hasItem) then
        local unknownCount, level, _, link, quality = EuiLibItem:GetUnitItemInfo(unit, self:GetID())
        if (unknownCount == 0 and level > 0) then
            self.levelString:SetText(level)
            result = true
        end
        if (quality) then
            local r, g, b, hex = GetItemQualityColor(quality)
            self.levelBorder:SetVertexColor(r, g, b, 0.4)
            self.levelBorder:Show()
        end
        if (unit == "player") then
            local durability, maxDurability = GetInventoryItemDurability(self:GetID())
            if (durability and maxDurability) then
                local durabPercent = durability / maxDurability
                self.DurabString:SetText(format("%d%%", durabPercent * 100))
                self.DurabString:SetTextColor(1-durabPercent, durabPercent, 0)
            else
                self.DurabString:SetText("")
            end
        end
    else
        self.levelString:SetText("")
        self.levelBorder:Hide()
        result = true
    end
    --副手有神器時才需要修正
    if (self:GetID() == 16 or self:GetID() == 17) then
        local _, offhand, _, _, quality = EuiLibItem:GetUnitItemInfo(unit, 17)
        if (quality == 6) then
            local _, mainhand = EuiLibItem:GetUnitItemInfo(unit, 16)
            self.levelString:SetText(max(mainhand, offhand))
        end
    end
    return result
end

--玩家面板
hooksecurefunc("PaperDollItemSlotButton_Update", function(self)
    if not E.db.euiscript.char_ilvl then return end
	ShowPaperDollItemLevel(self, "player")
end)

--觀察面板
local frame = CreateFrame("Frame", nil, UIParent)
frame:RegisterEvent("INSPECT_READY")
frame:SetScript("OnEvent", function(self, event, arg1)
    if (event == "INSPECT_READY" and InspectFrame and InspectFrame.unit and UnitGUID(InspectFrame.unit) == arg1) then
        --InspectPaperDollItemSlotButton_Update刷太猛或導致卡頓,故使用TASK模式
        for _, button in ipairs({
              InspectHeadSlot,InspectNeckSlot,InspectShoulderSlot,InspectBackSlot,InspectChestSlot,InspectWristSlot,
              InspectHandsSlot,InspectWaistSlot,InspectLegsSlot,InspectFeetSlot,InspectFinger0Slot,InspectFinger1Slot,
              InspectTrinket0Slot,InspectTrinket1Slot,InspectMainHandSlot,InspectSecondaryHandSlot
            }) do
            EuiLibItem:AddTask({
                button    = button,
                identity  = button:GetName(),
                elasped   = 1,
                expired   = GetTime() + 4,
                onStart   = function(self)
                    if (self.button.levelString) then
                        self.button.levelString:SetText("")
                        self.button.levelBorder:Hide()
                    end
                end,
                onExecute = function(self)
                    if (not InspectFrame.unit) then return end
					if not E.db.euiscript.char_ilvl then return end
                    return ShowPaperDollItemLevel(self.button, InspectFrame.unit)
                end,
            })
        end
    end
end)