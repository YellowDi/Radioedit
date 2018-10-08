local L = LibStub("AceLocale-3.0"):GetLocale("ExtVendor", true);

local SELLING_JUNK_PROCESS = false;
local PROCESS_TOTAL_SELL_PRICE = 0;
local PROCESS_TOTAL_ITEMS_SOLD = 0;
local SELL_ITEM_GROUP_SIZE = 4;
local REFRESH_CURRENT_BAG = 0;
local REFRESH_CURRENT_SLOT = 1;
local REFRESH_SLOTS_IN_BAG = 0;
local NUM_BLACKLISTED_JUNK = 0;
EXTVENDOR_CURRENT_JUNK_LIST = {};
EXTVENDOR_PROCESS_JUNK_LIST = {};

local GEAR_OUTLEVEL_TABLE = {
    [0] = 70,
    [1] = 90,
    [2] = 90,
    [3] = 100,
    [4] = 100,
    [5] = 110,
    [6] = 120,
    [7] = 130,
    [8] = 130,
    [9] = 130,
    [10] = 130,
};

--========================================
-- Gets a list of junk items in the
-- player's bags
--========================================
--function ExtVendor_GetQuickVendorList()
--    do return nil; end
--    --local startTime = debugprofilestop();
--    local junk = {};
--    local link, count, itemId, name, quality, price, maxStack, bindType, itemType, itemSubType, itemEquipLoc, isAccountBound, slot, bag;
--    local isKnown, reqClasses, isJunk, reason, __;
--    local numBlacklisted = 0;
--
--    for bag = 0, 4, 1 do
--        if (GetContainerNumSlots(bag)) then
--            for slot = 1, GetContainerNumSlots(bag), 1 do
--                isJunk, junkInfo = ExtVendor_IsContainerItemJunk(bag, slot);
--                --isJunk = false;
--                --__, count = GetContainerItemInfo(bag, slot);
--                --if (count) then
--                --    link = GetContainerItemLink(bag, slot);
--                --    if (link) then
--                --        isKnown, reqClasses, itemId, isAccountBound = ExtVendor_GetExtendedItemInfo(link);
--                --        name, __, quality, __, __, itemType, itemSubType, maxStack, itemEquipLoc, __, price, __, __, bindType = GetItemInfo(link);
--                --        
--                --        -- make sure the item has a vendor price
--                --        if ((price or 0) > 0) then
--                --            isJunk, reason = ExtVendor_IsItemQuickVendor(link, quality, bindType, isKnown, itemType, itemSubType, itemEquipLoc, reqClasses, isAccountBound);
--                --
--                --            if ((not isJunk) and (reason == 100)) then
--                --                numBlacklisted = numBlacklisted + 1;
--                --            end
--                --
--                --            -- if the item meets requirements, add it to the list
--                --            if (isJunk) then
--                --                table.insert(junk, {name = name, quality = quality, count = count, maxStack = maxStack, stackPrice = count * price, reason = reason});
--                --            end
--                --        end
--                --    end
--                --end
--                if (isJunk) then table.insert(junk, junkInfo); end
--            end
--        end
--    end
--
--    table.sort(junk, function(a, b) return (a.stackPrice < b.stackPrice); end);
--    
--    --local endTime = debugprofilestop();
--    --ExtVendor_Message("QuickVendorList took " .. ((endTime - startTime) / 1000) .. " seconds");
--
--    if (table.maxn(junk) > 0) then
--        return junk, numBlacklisted;
--    end
--    return nil;
--
--end

function ExtVendor_StartQuickVendorRefresh()
    if (EXTVENDOR.RefreshingQuickVendorList) then return; end
    REFRESH_CURRENT_BAG = 0;
    REFRESH_CURRENT_SLOT = 1;
    NUM_BLACKLISTED_JUNK = 0;
    REFRESH_SLOTS_IN_BAG = GetContainerNumSlots(REFRESH_CURRENT_BAG);
    EXTVENDOR_CURRENT_JUNK_LIST = {};
    EXTVENDOR.RefreshingQuickVendorList = true;
    ExtVendor_SetJunkButtonState(false);
end

function ExtVendor_DoQuickVendorRefresh()
    local processed = 0;
    local __, count, isJunk, junkInfo;
    while true do
        if (processed >= 20) then break; end
        if (REFRESH_CURRENT_SLOT <= REFRESH_SLOTS_IN_BAG) then
            __, count = GetContainerItemInfo(REFRESH_CURRENT_BAG, REFRESH_CURRENT_SLOT);
            if (count) then
                isJunk, junkInfo = ExtVendor_IsContainerItemJunk(REFRESH_CURRENT_BAG, REFRESH_CURRENT_SLOT);
                if (isJunk) then
                    table.insert(EXTVENDOR_CURRENT_JUNK_LIST, junkInfo);
                else
                    if (junkInfo == true) then
                        NUM_BLACKLISTED_JUNK = NUM_BLACKLISTED_JUNK + 1;
                    end
                end
                processed = processed + 1;
            end
        end
        REFRESH_CURRENT_SLOT = REFRESH_CURRENT_SLOT + 1;
        if (REFRESH_CURRENT_SLOT > REFRESH_SLOTS_IN_BAG) then
            REFRESH_CURRENT_SLOT = 1;
            REFRESH_CURRENT_BAG = REFRESH_CURRENT_BAG + 1;
            REFRESH_SLOTS_IN_BAG = GetContainerNumSlots(REFRESH_CURRENT_BAG);
        end
        if (REFRESH_CURRENT_BAG > 4) then
            ExtVendor_StopQuickVendorRefresh();
            break;
        end
    end
end

function ExtVendor_StopQuickVendorRefresh()
    EXTVENDOR.RefreshingQuickVendorList = false;
    if (#EXTVENDOR_CURRENT_JUNK_LIST > 0) then
        ExtVendor_SetJunkButtonState(true);
    else
        ExtVendor_SetJunkButtonState(false);
    end
end

--========================================
-- Show confirmation for selling all
-- junk items
--========================================
function ExtVendor_StartQuickVendor(self)

    --local junk, numBlacklisted = ExtVendor_GetQuickVendorList();

    --if (junk) then
    if (#EXTVENDOR_CURRENT_JUNK_LIST > 0) then
        table.sort(EXTVENDOR_CURRENT_JUNK_LIST, function(a, b) return (a.stackPrice < b.stackPrice); end);
        ExtVendor_ShowJunkPopup(EXTVENDOR_CURRENT_JUNK_LIST, NUM_BLACKLISTED_JUNK);
    end

end

function ExtVendor_IsContainerItemJunk(bag, slot)
    local __, count = GetContainerItemInfo(bag, slot);
    if (count) then
        local link = GetContainerItemLink(bag, slot);
        if (link) then
            local isKnown, reqClasses, itemId, isAccountBound, isFoodOrDrink = ExtVendor_GetExtendedItemInfo(link);
            local name, __, quality, itemLevel, __, itemType, itemSubType, maxStack, itemEquipLoc, __, price, __, __, bindType, expacID = GetItemInfo(link);
            
            -- make sure the item has a vendor price
            if ((price or 0) > 0) then
                local isJunk, reason = ExtVendor_IsItemQuickVendor(bag, slot, link, quality, itemLevel, bindType, isKnown, itemType, itemSubType, itemEquipLoc, reqClasses, isAccountBound, expacID, isFoodOrDrink);

                if ((not isJunk) and (reason == 100)) then
                    --numBlacklisted = numBlacklisted + 1;
                    return false, true;
                end

                -- if the item meets requirements, add it to the list
                if (isJunk) then
                    --table.insert(junk, {name = name, quality = quality, count = count, maxStack = maxStack, stackPrice = count * price, reason = reason});
                    return isJunk, {name = name, quality = quality, count = count, maxStack = maxStack, stackPrice = count * price, reason = reason};
                end
            end
        end
    end
    return nil;
end

--========================================
-- Returns whether an item should
-- quick-vendor based on quality, type,
-- if it is already known, soulbound
--========================================
function ExtVendor_IsItemQuickVendor(bag, bagSlot, link, quality, itemLevel, bindType, alreadyKnown, itemType, subType, equipSlot, requiredClasses, isAccountBound, expacID, isFoodOrDrink)
    local itemID = ExtVendor_GetItemID(link);
    local idx, id;

    for idx, id in pairs(EXTVENDOR_INTERNAL_BLACKLIST) do
        if (id == itemID) then
            return false;
        end
    end
    
    local playerLevel = UnitLevel("player");

    -- don't vendor blacklisted items
    if (ExtVendor_IsBlacklisted(itemID)) then
        return false, 100;
    end
    -- always vendor whitelisted items
    if (ExtVendor_IsWhitelisted(itemID)) then
        return true, L["QUICKVENDOR_REASON_WHITELISTED"];
    end
    -- never attempt to sell account-bound items (unless they're whitelisted)
    if (isAccountBound) then
        return false;
    end
    -- NEVER quick-vendor legendary or heirloom items. EVER. Ever. ever.
    if (quality > 4) then
        return false;
    end
    -- don't vendor equipment if it's part of an equipment set
    if ((itemType == L["ITEMTYPE_ARMOR"]) or (itemType == L["ITEMTYPE_WEAPON"])) then
        if (ExtVendor_IsItemInEquipmentSet(bag, bagSlot)) then return false; end
    end
    -- *** Poor (grey) items ***
    if (quality == 0) then
        return true, L["QUICKVENDOR_REASON_POORQUALITY"];
    end
    -- *** Common (white) gear ***
    if (EXTVENDOR_DATA['config']['quickvendor_whitegear']) then
        if (quality == 1) then
            if (itemType == L["ITEMTYPE_ARMOR"]) then
                if ((subType == L["ARMOR_CLOTH"]) or (subType == L["ARMOR_LEATHER"]) or (subType == L["ARMOR_MAIL"]) or (subType == L["ARMOR_PLATE"])) then
                    if ((equipSlot ~= "INVTYPE_TABARD") and (equipSlot ~= "INVTYPE_SHIRT")) then
                        return true, L["QUICKVENDOR_REASON_WHITEGEAR"];
                    end
                end
            elseif (itemType == L["ITEMTYPE_WEAPON"]) then
                if ((subType == L["WEAPON_1H_AXE"]) or (subType == L["WEAPON_1H_MACE"]) or (subType == L["WEAPON_1H_SWORD"]) or (subType == L["WEAPON_2H_AXE"])
                or (subType == L["WEAPON_2H_MACE"]) or (subType == L["WEAPON_2H_SWORD"]) or (subType == L["WEAPON_POLEARM"]) or (subType == L["WEAPON_DAGGER"])
                or (subType == L["WEAPON_FIST"]) or (subType == L["WEAPON_STAFF"]) or (subType == L["WEAPON_WAND"]) or (subType == L["WEAPON_BOW"])
                or (subType == L["WEAPON_GUN"]) or (subType == L["WEAPON_CROSSBOW"])) then
                    return true, L["QUICKVENDOR_REASON_WHITEGEAR"];
                end
            end
        end
    end
    if (EXTVENDOR_DATA['config']['quickvendor_oldfood']) then
        if (isFoodOrDrink) then
            if (ExtVendor_IsOutdatedItemLevel(itemLevel, playerLevel)) then
                return true, L["QUICKVENDOR_REASON_OUTDATED_FOOD"];
            end
        end
    end
    -- Soulbound stuff
    if (bindType == 1) then
        -- *** "Already Known" ***
        if (EXTVENDOR_DATA['config']['quickvendor_alreadyknown']) then
            if (alreadyKnown) then
                return true, L["QUICKVENDOR_REASON_ALREADYKNOWN"];
            end
        end
        -- *** Unusable (class-restricted, unusable armor/weapon types) ***
        if (EXTVENDOR_DATA['config']['quickvendor_unusable']) then
            if (not ExtVendor_ClassIsAllowed(UnitClass("player"), requiredClasses)) then
                --if (ExtVendor_QuickVendorExempt_ClassRestricted(itemID)) then
                --    return false;
                --end
                return true, L["QUICKVENDOR_REASON_CLASSRESTRICTED"];
            end
            if (not ExtVendor_IsUsableArmorType(itemType, subType, equipSlot)) then
                return true, L["QUICKVENDOR_REASON_UNUSABLEARMOR"];
            end
            if (not ExtVendor_IsUsableWeaponType(itemType, subType, equipSlot)) then
                return true, L["QUICKVENDOR_REASON_UNUSABLEWEAPON"];
            end
        end
        -- *** Sub-optimal armor ***
        if (EXTVENDOR_DATA['config']['quickvendor_suboptimal']) then
            if (not ExtVendor_IsOptimalArmor(itemType, subType, equipSlot)) then
                return true, L["QUICKVENDOR_REASON_SUBOPTIMAL"];
            end
        end
        -- *** Outdated gear ***
        if (((quality == 3) or (quality == 4)) and ((itemType == L["ITEMTYPE_ARMOR"]) or (itemType == L["ITEMTYPE_WEAPON"])) and (equipSlot ~= "")) then
            if (EXTVENDOR_DATA['config']['quickvendor_oldgear']) then
                -- always ignore items from the account's expansion level (or higher)
                if (expacID < GetAccountExpansionLevel()) then
                    if ((playerLevel >= GEAR_OUTLEVEL_TABLE[expacID]) or ((expacID == 0) and (playerLevel >= (itemLevel + 12)))) then
                        return true, L["QUICKVENDOR_REASON_OUTDATED_GEAR"];
                    end
                end
            end
        end
    end
    -- nothing matched = do not quickvendor
    return false;
end

--========================================
-- Performs quick-vendor
--========================================
function ExtVendor_ConfirmQuickVendor()
    local link, count, name, color, quality, price, maxStack, quantity, bindType, expacID, itemType, itemSubType, itemEquipLoc, __;
    local isKnown, reqClasses, itemId, isAccountBound, isFoodOrDrink;
    local bag, slot;
    local totalPrice = 0;
    local itemsOnLine = 0;
    local numItemsSold = 0;
    local itemsSold = "";
    local soldPref = L["SOLD"];

    if (not MerchantFrame:IsShown()) then return; end
    
    EXTVENDOR_PROCESS_JUNK_LIST = EXTVENDOR_CURRENT_JUNK_LIST; --ExtVendor_GetQuickVendorList();
    if (not EXTVENDOR_PROCESS_JUNK_LIST) then return; end
    if (table.maxn(EXTVENDOR_PROCESS_JUNK_LIST) < 1) then return; end
    
    -- use the progress window if the junk item list is bigger than 10 items
    if (table.maxn(EXTVENDOR_PROCESS_JUNK_LIST) > SELL_ITEM_GROUP_SIZE) then
        ExtVendor_StartProcessQuickVendor();
        return;
    end

    -- otherwise just do it the old way
    for bag = 0, 4, 1 do
        if (GetContainerNumSlots(bag)) then
            for slot = 1, GetContainerNumSlots(bag), 1 do
                __, count = GetContainerItemInfo(bag, slot);
                link = GetContainerItemLink(bag, slot);
                if (link and count) then
                    name, __, quality, itemLevel, __, itemType, itemSubType, maxStack, itemEquipLoc, __, price, __, __, bindType, expacID = GetItemInfo(link);
                    isKnown, reqClasses, itemId, isAccountBound, isFoodOrDrink = ExtVendor_GetExtendedItemInfo(link);

                    if ((price or 0) > 0) then
                        if (ExtVendor_IsItemQuickVendor(bag, slot, link, quality, itemLevel, bindType, isKnown, itemType, itemSubType, itemEquipLoc, reqClasses, isAccountBound, expacID, isFoodOrDrink)) then
                            PickupContainerItem(bag, slot);
                            PickupMerchantItem(0);
                            __, __, __, color = GetItemQualityColor(quality);
                            if (itemsOnLine > 0) then
                                itemsSold = itemsSold .. ", ";
                            end
                            if (maxStack > 1) then
                                quantity = "x" .. count;
                            else
                                quantity = "";
                            end
                            itemsSold = itemsSold .. "|c" .. color .. "[" .. name .. "]|r" .. quantity;
                            itemsOnLine = itemsOnLine + 1;
                            if (itemsOnLine == 12) then
                                DEFAULT_CHAT_FRAME:AddMessage(soldPref .. " " .. itemsSold, ChatTypeInfo["SYSTEM"].r, ChatTypeInfo["SYSTEM"].g, ChatTypeInfo["SYSTEM"].b, GetChatTypeIndex("SYSTEM"));
                                soldPref = "    ";
                                itemsSold = "";
                                itemsOnLine = 0;
                            end
                            totalPrice = totalPrice + (price * count);
                            numItemsSold = numItemsSold + 1;
                        end
                    end
                end
            end
        end
    end

    if (EXTVENDOR_DATA['config']['quickvendor_msg_compact']) then
        if (numItemsSold > 0) then
            DEFAULT_CHAT_FRAME:AddMessage(ExtVendor_FormatString(L["SOLD_COMPACT"], { ["count"] = numItemsSold, ["price"] = "|cffffffff" .. ExtVendor_FormatMoneyString(totalPrice) }), ChatTypeInfo["SYSTEM"].r, ChatTypeInfo["SYSTEM"].g, ChatTypeInfo["SYSTEM"].b, GetChatTypeIndex("SYSTEM"));
        end
    else
        if (itemsOnLine > 0) then
            DEFAULT_CHAT_FRAME:AddMessage(soldPref .. " " .. itemsSold, ChatTypeInfo["SYSTEM"].r, ChatTypeInfo["SYSTEM"].g, ChatTypeInfo["SYSTEM"].b, GetChatTypeIndex("SYSTEM"));
        end
        if (numItemsSold > 0) then
            DEFAULT_CHAT_FRAME:AddMessage(string.format(L["JUNK_MONEY_EARNED"], "|cffffffff" .. ExtVendor_FormatMoneyString(totalPrice)), ChatTypeInfo["SYSTEM"].r, ChatTypeInfo["SYSTEM"].g, ChatTypeInfo["SYSTEM"].b, GetChatTypeIndex("SYSTEM"));
        end
    end
end

function ExtVendor_StartProcessQuickVendor()
    if (SELLING_JUNK_PROCESS) then return; end
    
    SELLING_JUNK_PROCESS = true;
    PROCESS_TOTAL_SELL_PRICE = 0;
    PROCESS_TOTAL_ITEMS_SOLD = 0;
    ExtVendor_ShowProgressPopup();
end

function ExtVendor_ProgressQuickVendor()
    if (not SELLING_JUNK_PROCESS) then return nil; end

    -- cancel the process if the vendor window is no longer shown
    if (not MerchantFrame:IsShown()) then
        ExtVendor_StopProcessQuickVendor();
        return nil;
    end
    
    local link, count, name, color, quality, price, maxStack, quantity, bindType, expacID, itemType, itemSubType, itemEquipLoc, __;
    local isKnown, reqClasses, itemId, isAccountBound, isFoodOrDrink;
    local bag, slot;
    local totalPrice = 0;
    local itemsOnLine = 0;
    local numItemsSold = 0;
    local itemsSold = "";
    local soldPref = L["SOLD"];
    
    local CANCEL = false;
    
    for bag = 0, 4, 1 do
        if (GetContainerNumSlots(bag)) then
            for slot = 1, GetContainerNumSlots(bag), 1 do
            
                if (not CANCEL) then

                    __, count, locked = GetContainerItemInfo(bag, slot);
                    if (not locked) then
                        link = GetContainerItemLink(bag, slot);
                        if (link and count) then
                            name, __, quality, itemLevel, __, itemType, itemSubType, maxStack, itemEquipLoc, __, price, __, __, bindType, expacID = GetItemInfo(link);
                            isKnown, reqClasses, itemId, isAccountBound, isFoodOrDrink = ExtVendor_GetExtendedItemInfo(link);

                            if ((price or 0) > 0) then
                                if (ExtVendor_IsItemQuickVendor(bag, slot, link, quality, itemLevel, bindType, isKnown, itemType, itemSubType, itemEquipLoc, reqClasses, isAccountBound, expacID, isFoodOrDrink)) then
                                    PickupContainerItem(bag, slot);
                                    PickupMerchantItem(0);
                                    __, __, __, color = GetItemQualityColor(quality);
                                    if (itemsOnLine > 0) then
                                        itemsSold = itemsSold .. ", ";
                                    end
                                    if (maxStack > 1) then
                                        quantity = "x" .. count;
                                    else
                                        quantity = "";
                                    end
                                    itemsSold = itemsSold .. "|c" .. color .. "[" .. name .. "]|r" .. quantity;
                                    itemsOnLine = itemsOnLine + 1;
                                    --if (itemsOnLine == 12) then
                                    --    DEFAULT_CHAT_FRAME:AddMessage(soldPref .. " " .. itemsSold, ChatTypeInfo["SYSTEM"].r, ChatTypeInfo["SYSTEM"].g, ChatTypeInfo["SYSTEM"].b, GetChatTypeIndex("SYSTEM"));
                                    --    soldPref = "    ";
                                    --    itemsSold = "";
                                    --    itemsOnLine = 0;
                                    --end
                                    totalPrice = totalPrice + (price * count);
                                    numItemsSold = numItemsSold + 1;
                                    
                                    if (numItemsSold >= SELL_ITEM_GROUP_SIZE) then CANCEL = true; end
                                end
                            end
                        end
                    end
                    
                end
                
            end
        end
    end
    
    PROCESS_TOTAL_ITEMS_SOLD = PROCESS_TOTAL_ITEMS_SOLD + numItemsSold;
    PROCESS_TOTAL_SELL_PRICE = PROCESS_TOTAL_SELL_PRICE + totalPrice;
    
    if (not EXTVENDOR_DATA['config']['quickvendor_msg_compact']) then
        if (itemsOnLine > 0) then
            DEFAULT_CHAT_FRAME:AddMessage(soldPref .. " " .. itemsSold, ChatTypeInfo["SYSTEM"].r, ChatTypeInfo["SYSTEM"].g, ChatTypeInfo["SYSTEM"].b, GetChatTypeIndex("SYSTEM"));
        end
    end

    if (numItemsSold == 0) then
        if (EXTVENDOR_DATA['config']['quickvendor_msg_compact']) then
            DEFAULT_CHAT_FRAME:AddMessage(ExtVendor_FormatString(L["SOLD_COMPACT"], { ["count"] = PROCESS_TOTAL_ITEMS_SOLD, ["price"] = "|cffffffff" .. ExtVendor_FormatMoneyString(PROCESS_TOTAL_SELL_PRICE) }), ChatTypeInfo["SYSTEM"].r, ChatTypeInfo["SYSTEM"].g, ChatTypeInfo["SYSTEM"].b, GetChatTypeIndex("SYSTEM"));
        else
            DEFAULT_CHAT_FRAME:AddMessage(string.format(L["JUNK_MONEY_EARNED"], "|cffffffff" .. ExtVendor_FormatMoneyString(PROCESS_TOTAL_SELL_PRICE)), ChatTypeInfo["SYSTEM"].r, ChatTypeInfo["SYSTEM"].g, ChatTypeInfo["SYSTEM"].b, GetChatTypeIndex("SYSTEM"));
        end
        ExtVendor_StopProcessQuickVendor();
    end
    
    return numItemsSold, totalPrice, PROCESS_TOTAL_ITEMS_SOLD, PROCESS_TOTAL_SELL_PRICE;
    
end

function ExtVendor_StopProcessQuickVendor()
    SELLING_JUNK_PROCESS = false;
    ExtVendor_SellJunkProgressPopup:Hide();
    ExtVendor_UpdateDisplay();
end

function ExtVendor_IsProcessingQuickVendor()
    return SELLING_JUNK_PROCESS;
end

--========================================
-- Returns whether or not the specified
-- item ID is blacklisted
--========================================
function ExtVendor_IsBlacklisted(itemId)

    for idx, id in pairs(EXTVENDOR_DATA['quickvendor_blacklist']) do
        if (id == itemId) then
            return true;
        end
    end

    return false;

end

--========================================
-- Returns whether or not the specified
-- item ID is whitelisted
--========================================
function ExtVendor_IsWhitelisted(itemId, globalOnly)
    for idx, id in pairs(EXTVENDOR_DATA['quickvendor_whitelist']) do
        if (id == itemId) then
            return true;
        end
    end
    if (not globalOnly) then
        for idx, id in pairs(EXTVENDOR_DATA[EXTVENDOR.Profile]['quickvendor_whitelist']) do
            if (id == itemId) then
                return true;
            end
        end
    end
    return false;
end

--========================================
-- Shows or hides the quick vendor button
-- depending on configuration
--========================================
function ExtVendor_UpdateQuickVendorButtonVisibility()
    if (EXTVENDOR_DATA['config']['enable_quickvendor']) then
        MerchantFrameSellJunkButton:Show();
    else
        MerchantFrameSellJunkButton:Hide();
    end
end
