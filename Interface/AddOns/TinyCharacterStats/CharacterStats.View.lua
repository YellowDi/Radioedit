
-------------------------------------
-- 人物面板信息:視圖 Author: M
-------------------------------------

TinyCharacterStatsDB = {}

local _, Addon = ...

local StatScrollFrame = CreateFrame("ScrollFrame", nil, CharacterFrameInsetRight, "UIPanelScrollFrameTemplate")
StatScrollFrame:SetPoint("TOPLEFT", CharacterFrameInsetRight, "TOPLEFT", 5, -4)
StatScrollFrame:SetPoint("BOTTOMRIGHT", CharacterFrameInsetRight, "BOTTOMRIGHT", -3, 2)
StatScrollFrame.ScrollBar:Hide()
StatScrollFrame.ScrollBar:ClearAllPoints()
StatScrollFrame.ScrollBar:SetPoint("TOPLEFT", StatScrollFrame, "TOPRIGHT", -16, -16)
StatScrollFrame.ScrollBar:SetPoint("BOTTOMLEFT", StatScrollFrame, "BOTTOMRIGHT", -16, 16)
StatScrollFrame:HookScript("OnScrollRangeChanged", function(self, xrange, yrange)
    self.ScrollBar:SetShown(floor(yrange) ~= 0)
end)

local StatFrame = CreateFrame("Frame", nil, StatScrollFrame)
StatFrame:SetWidth(197)
StatFrame:SetPoint("TOPLEFT")
StatFrame.AnchorFrame = CreateFrame("Frame", nil, StatFrame)
StatFrame.AnchorFrame:SetSize(StatFrame:GetWidth(), 2)
StatFrame.AnchorFrame:SetPoint("TOPLEFT")
StatScrollFrame:SetScrollChild(StatFrame)

CharacterStatsPane.ItemLevelFrame:SetParent(StatFrame)
CharacterStatsPane.AttributesCategory:SetParent(StatFrame)
CharacterStatsPane.EnhancementsCategory:SetParent(StatFrame)
CharacterStatsPane.ItemLevelFrame.Value:SetFont(CharacterStatsPane.ItemLevelFrame.Value:GetFont(), 14, "THINOUTLINE")
CharacterStatsPane.ItemLevelFrame.Value:SetPoint("CENTER",CharacterStatsPane.ItemLevelFrame.Background, "CENTER", 0, 1)

for k, v in pairs(Addon.StatData) do
    if (not v.frame) then
        if (v.category) then
            v.frame = CreateFrame("FRAME", nil, StatFrame, "CharacterStatFrameCategoryTemplate")
        else
            v.frame = CreateFrame("FRAME", nil, StatFrame, "CharacterStatFrameTemplate")
        end
    end
    v.frame.statKey = k
end

local ShownData = Addon:MergeStat({
    { statKey = "ItemLevelFrame" },
    { statKey = "AttributesCategory" },
        { statKey = "HEALTH" },
        { statKey = "POWER" },
        { statKey = "ALTERNATEMANA" },
        { statKey = "STRENGTH" },
        { statKey = "AGILITY" },
        { statKey = "INTELLECT" },
        { statKey = "STAMINA" },
        { statKey = "ARMOR" },
        { statKey = "DODGE" },
        { statKey = "PARRY" },
        { statKey = "BLOCK" },
        { statKey = "MOVESPEED" },
        { statKey = "ITEMLEVEL", hidden = true },
        { statKey = "GCD" },
        { statKey = "REPAIR_COST" },
    { statKey = "EnhancementsCategory" },
        { statKey = "CRITCHANCE" },
        { statKey = "HASTE" },
        { statKey = "MASTERY" },
        { statKey = "VERSATILITY" },
        { statKey = "LIFESTEAL" },
        { statKey = "AVOIDANCE" },
        { statKey = "ATTACK_DAMAGE" },
        { statKey = "ATTACK_AP" },
        { statKey = "ENERGY_REGEN" },
        { statKey = "RUNE_REGEN" },
        { statKey = "FOCUS_REGEN" },
        { statKey = "ATTACK_ATTACKSPEED" },
        { statKey = "SPELLPOWER" },
        { statKey = "MANAREGEN" },
})

local function UpdateStatFrameWidth(width)
    local stat
    for _, v in ipairs(ShownData) do
        stat = Addon.StatData[v.statKey]
        if (stat) then
            stat.frame:SetWidth(width)
            if (stat.frame.Background) then
                stat.frame.Background:SetWidth(width)
            end
        end
    end
end

local configMode = false

local function ShowCharacterStats(unit)
    local stat
    local count, height = 0, 4
    for _, v in ipairs(ShownData) do
        stat = Addon.StatData[v.statKey]
        stat.updateFunc(stat.frame, unit)
        if (stat.afterUpdateFunc) then
            stat.afterUpdateFunc(stat.frame, unit)
        end
        if (configMode) then
            if (not stat.frame:IsShown()) then
                stat.frame.tooltip = v.statKey
            end
            stat.frame:Show()
            stat.frame.checkButton:Show()
            stat.frame.checkButton:SetChecked(not v.hidden)
            if (v.hidden) then
                stat.frame:SetAlpha(0.32)
            else
                stat.frame:SetAlpha(1)
            end
        elseif (v.hidden) then
            stat.frame:Hide()
        else
            if (stat.frame.checkButton) then
                stat.frame.checkButton:Hide()
            end
            if (stat.frame.tooltip2 == STAT_NO_BENEFIT_TOOLTIP) then
                stat.frame:Hide()
            end
        end
        if (stat.frame:IsShown()) then
            stat.frame:ClearAllPoints()
            stat.frame:SetPoint("TOPLEFT", StatFrame.AnchorFrame, "TOPLEFT", 0, -height)
            if (stat.category) then
                count = 0
            else
                if (stat.frame.Background) then
                    stat.frame.Background:SetShown((count%2) ~= 0)
                end
                count = count + 1
            end
            height = height + stat.frame:GetHeight()
        end
    end
    height = floor(height)
    StatFrame:SetHeight(height)
    UpdateStatFrameWidth(height > 353 and 180 or 197)
end

CharacterStatsPane:HookScript("OnShow", function(self)
    self:Hide()
    StatScrollFrame:Show()
end)

hooksecurefunc("PaperDollFrame_UpdateStats", function()
    ShowCharacterStats("player")
end)

hooksecurefunc("PaperDollFrame_SetSidebar", function(self, index)
    if (PaperDollFrame.currentSideBar and PaperDollFrame.currentSideBar:GetName() == "CharacterStatsPane") then
        StatScrollFrame:Show()
    else
        StatScrollFrame:Hide()
    end
end)

---------------------
-- 配置功能 OPTIONS
---------------------
do
    local DragSourceFrame, DragTargetFrame

    local function OnDragStart(self)
        if (not configMode) then return end
        DragSourceFrame = self
        local cursorX, cursorY = GetCursorPosition()
        local uiScale = UIParent:GetScale()
        local adjust = select(5, UIParent:GetPoint(2)) or 0
        self:StartMoving()
        self:ClearAllPoints()
        self:SetPoint("CENTER", UIParent, "BOTTOMLEFT", cursorX / uiScale, (cursorY-adjust) / uiScale)
    end
    
    local function OnDragStop(self)
        if (not configMode) then return end
        DragSourceFrame = false
        self:StopMovingOrSizing()
        local stat
        for i, v in ipairs(ShownData) do
            stat = Addon.StatData[v.statKey]
            if (stat.frame.statKey ~= self.statKey and stat.frame:IsMouseOver()) then
                Addon:SwapStat(ShownData, self.statKey, v)
                break
            end
        end
        if (DragTargetFrame) then
            DragTargetFrame.anchorBar:Hide()
        end
        ShowCharacterStats("player")
    end
    
    local function OnCheckClick(self)
        local checked = self:GetChecked()
        local statKey = self:GetParent().statKey
        if (checked) then
            self:GetParent():SetAlpha(1)
        else
            self:GetParent():SetAlpha(0.32)
        end
        for _, v in ipairs(ShownData) do
            if (v.statKey == statKey) then
                v.hidden = not checked
                break
            end
        end
    end

    for k, v in pairs(Addon.StatData) do
        v.frame:EnableMouse(true)
        v.frame:SetMovable(true)
        v.frame:RegisterForDrag("LeftButton")
        v.frame:HookScript("OnDragStart", OnDragStart)
        v.frame:HookScript("OnDragStop", OnDragStop)
        v.frame.checkButton = CreateFrame("CheckButton", nil, v.frame, "UICheckButtonTemplate")
        v.frame.checkButton:SetSize(14, 14)
        v.frame.checkButton:SetPoint("LEFT", -1, 0)
        v.frame.checkButton:SetScript("OnClick", OnCheckClick)
        v.frame.checkButton:Hide()
        v.frame.anchorBar = v.frame:CreateTexture(nil, "OVERLAY")
        v.frame.anchorBar:SetPoint("TOPLEFT", 0, 2)
        v.frame.anchorBar:SetPoint("TOPRIGHT", 0, -2)
        v.frame.anchorBar:SetColorTexture(1, 0.8, 0)
        v.frame.anchorBar:Hide()
    end
    
    StatScrollFrame:HookScript("OnUpdate", function(self, elasped)
        if (DragSourceFrame) then
            self.timer = (self.timer or 0) + elasped
            if (self.timer > 0.2) then
                local stat
                for i, v in ipairs(ShownData) do
                    stat = Addon.StatData[v.statKey]
                    if (stat.frame.statKey ~= DragSourceFrame.statKey and stat.frame:IsMouseOver()) then
                        DragTargetFrame = stat.frame
                        stat.frame.anchorBar:Show()
                    else
                        stat.frame.anchorBar:Hide()
                    end
                end
                self.timer = 0
            end
        end
    end)

    local configButton = CreateFrame("Button", nil, PaperDollSidebarTab1)
    configButton:SetSize(24, 26)
    configButton:SetPoint("BOTTOMLEFT", PaperDollSidebarTab1, "BOTTOMLEFT", -24, -4)
    configButton:SetNormalTexture("Interface\\Buttons\\LockButton-Locked-Up")
    configButton:SetPushedTexture("Interface\\Buttons\\LockButton-Unlocked-Down")
    configButton:SetHighlightTexture("Interface\\Buttons\\UI-Common-MouseHilight", "ADD")
    configButton:SetScript("OnClick", function(self)
        configMode = not configMode
        if (configMode) then
            self:SetNormalTexture("Interface\\Buttons\\LockButton-Unlocked-Up")
        else
            self:SetNormalTexture("Interface\\Buttons\\LockButton-Locked-Up")
        end
        ShowCharacterStats("player")
    end)

    local frame = CreateFrame("Frame", nil, UIParent)
    frame:RegisterEvent("PLAYER_TALENT_UPDATE")
    frame:SetScript("OnEvent", function(self, event, ...)
        local uniqueKey = UnitName("player") .. ":" .. GetRealmName() .. ":" .. GetSpecialization()
        if (TinyCharacterStatsDB[uniqueKey]) then
            if (ShownData.uniqueKey ~= uniqueKey) then
                ShownData = Addon:MergeStat(TinyCharacterStatsDB[uniqueKey])
            end
        else
            ShownData = Addon:CopyTable(ShownData)
            ShownData.uniqueKey = uniqueKey
            TinyCharacterStatsDB[uniqueKey] = ShownData
        end
    end)

end

--百分比的數據都顯示2位小數
hooksecurefunc("PaperDollFrame_SetLabelAndText", function(statFrame, label, text, isPercentage, numericValue)
	if (isPercentage) then
		text = format("%.2f%%", numericValue)
        statFrame.Value:SetText(text)
	end
end)