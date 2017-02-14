
-------------------------------------
-- 查看面板信息 Author: M
-------------------------------------

local LibSchedule = LibStub:GetLibrary("LibSchedule.7000")
local LibItemInfo = LibStub:GetLibrary("LibItemInfo.7000")

local OutsideLevelString = false

local function ShowPaperDollItemLevel(self, unit)
    local id = self:GetID()
    if (id == 4 or id > 17) then return end
    if (not self.levelString) then
        local fontAdjust = GetLocale():sub(1,2) == "zh" and 0 or -3
        self.levelString = self:CreateFontString(nil, "OVERLAY")
        self.levelString:SetFont(STANDARD_TEXT_FONT, 12, "OUTLINE")
        self.levelString:SetPoint("TOP",2,0)
        self.levelString:SetTextColor(1, 0.82, 0)
        if (OutsideLevelString) then
            self.levelString:ClearAllPoints()
            if (id <= 5 or id == 9 or id == 15) then
                self.levelString:SetPoint("LEFT", self, "RIGHT", 8, 6)
            elseif (id == 16) then
                self.levelString:SetPoint("RIGHT", self, "LEFT", -8, 12)
            elseif (id == 17) then
                self.levelString:SetPoint("LEFT", self, "RIGHT", 8, 12)
            else
                self.levelString:SetPoint("RIGHT", self, "LEFT", -8, 6)
            end
        end
    end
    local result
    if (unit and self.hasItem) then
        local unknownCount, level, _, link, quality = LibItemInfo:GetUnitItemInfo(unit, id)
        if (level > 0 and quality) then
            if (OutsideLevelString) then
                local r, g, b = GetItemQualityColor(quality)
                self.levelString:SetTextColor(r, g, b)
            end
            self.levelString:SetText(level)
            result = true
        end
    else
        self.levelString:SetText("")
        result = true
    end
    if (id == 16 or id == 17) then
        local _, offhand, _, _, quality = LibItemInfo:GetUnitItemInfo(unit, 17)
        if (quality == 6) then
            local _, mainhand = LibItemInfo:GetUnitItemInfo(unit, 16)
            self.levelString:SetText(max(mainhand, offhand))
        end
    end
    return result
end

hooksecurefunc("PaperDollItemSlotButton_Update", function(self)
    ShowPaperDollItemLevel(self, "player")
end)

local frame = CreateFrame("Frame", nil, UIParent)
frame:RegisterEvent("INSPECT_READY")
frame:SetScript("OnEvent", function(self, event, arg1)
    if (event == "INSPECT_READY" and InspectFrame and InspectFrame.unit and UnitGUID(InspectFrame.unit) == arg1) then
        for _, button in ipairs({
              InspectHeadSlot,InspectNeckSlot,InspectShoulderSlot,InspectBackSlot,InspectChestSlot,InspectWristSlot,
              InspectHandsSlot,InspectWaistSlot,InspectLegsSlot,InspectFeetSlot,InspectFinger0Slot,InspectFinger1Slot,
              InspectTrinket0Slot,InspectTrinket1Slot,InspectMainHandSlot,InspectSecondaryHandSlot
            }) do
            LibSchedule:AddTask({
                button    = button,
                identity  = button:GetName(),
                elasped   = 1,
                expired   = GetTime() + 4,
                onStart   = function(self)
                    if (self.button.levelString) then
                        self.button.levelString:SetText("")
                    end
                end,
                onExecute = function(self)
                    if (not InspectFrame.unit) then return end
                    return ShowPaperDollItemLevel(self.button, InspectFrame.unit)
                end,
            })
        end
    end
end)
