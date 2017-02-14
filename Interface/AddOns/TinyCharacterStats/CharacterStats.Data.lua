--------------------------------------- 人物面板信息:數據 Author: M-------------------------------------local _, Addon = ...function Addon:CopyTable(tab)	local copy = {}	for k, v in pairs(tab) do        copy[k] = (type(v) == "table") and Addon:CopyTable(v) or v	end	return copyendfunction Addon:MergeTable(tab)    local exists	for i, v in ipairs(tab) do        if (not self.StatData[v.statKey]) then            table.remove(tab, i)        end    end    for k in pairs(self.StatData) do        exists = false         for _, v in ipairs(tab) do            if (k == v.statKey) then exists = true end        end        if (not exists) then            table.insert(tab, { statKey = k })        end    end    return tabendfunction Addon:SwapStat(tab, statKey, dst)    local src    for i, v in ipairs(tab) do        if (v.statKey == statKey) then            src = v            table.remove(tab, i)        end    end    for i, v in ipairs(tab) do        if (v.statKey == dst.statKey) then            table.insert(tab, i, src or {statKey = statKey})            break        end    end    return tabendAddon.StatData = Addon:CopyTable(PAPERDOLL_STATINFO)Addon.StatData.ItemLevelFrame = {    category   = true,    frame      = CharacterStatsPane.ItemLevelFrame,    updateFunc = function(statFrame, unit)        local avgItemLevel, avgItemLevelEquipped = GetAverageItemLevel()        if (avgItemLevel == avgItemLevelEquipped) then            PaperDollFrame_SetLabelAndText(statFrame, STAT_AVERAGE_ITEM_LEVEL, format("%.1f",avgItemLevelEquipped), false, avgItemLevelEquipped)        else            PaperDollFrame_SetLabelAndText(statFrame, STAT_AVERAGE_ITEM_LEVEL, format("%.1f/%.1f",avgItemLevelEquipped,avgItemLevel), false, avgItemLevelEquipped)        end        statFrame:Show()    end}Addon.StatData.AttributesCategory = {    category   = true,    frame      = CharacterStatsPane.AttributesCategory,    updateFunc = function() end}Addon.StatData.EnhancementsCategory = {    category   = true,    frame      = CharacterStatsPane.EnhancementsCategory,    updateFunc = function() end}Addon.StatData.GCD = {    updateFunc = function(statFrame, unit)        local haste = GetHaste()        local gcd = max(0.75, 1.5 * 100 / (100+haste))        PaperDollFrame_SetLabelAndText(statFrame, "GCD", format("%.2fs",gcd), false, gcd)    end}Addon.StatData.REPAIR_COST = {    updateFunc = function(statFrame, unit)        if (not statFrame.scanTooltip) then            statFrame.scanTooltip = CreateFrame("GameTooltip", "StatRepairCostTooltip", statFrame, "GameTooltipTemplate")            statFrame.scanTooltip:SetOwner(statFrame, "ANCHOR_NONE")            statFrame.MoneyFrame = CreateFrame("Frame", "StatRepairCostMoneyFrame", statFrame, "TooltipMoneyFrameTemplate")            MoneyFrame_SetType(statFrame.MoneyFrame, "TOOLTIP")            statFrame.MoneyFrame:SetScale(0.8)            statFrame.MoneyFrame:SetPoint("RIGHT", 3, -1)            local font, size, flag = statFrame.Label:GetFont()            statFrame.Label:SetFont(font, size-1, flag)        end        local totalCost = 0        local _, repairCost        for _, index in ipairs({1,3,5,6,7,8,9,10,16,17}) do            statFrame.scanTooltip:ClearLines()            _, _, repairCost = statFrame.scanTooltip:SetInventoryItem(unit, index)            if (repairCost and repairCost > 0) then                totalCost = totalCost + repairCost            end        end        statFrame.Label:SetText(REPAIR_COST)        MoneyFrame_Update(statFrame.MoneyFrame, totalCost)    end}