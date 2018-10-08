local L = LibStub("AceLocale-3.0"):GetLocale("ExtVendor", true);

--========================================
-- Show the filter options dropdown menu
--========================================
function ExtVendor_DisplayFilterDropDown(self)

    local className = UnitClass("player");
    local currFilter = GetMerchantFilter();
    stockFilters = { { text = className, checked = ((currFilter ~= LE_LOOT_FILTER_BOE) and (currFilter ~= LE_LOOT_FILTER_ALL)), func = function() ExtVendor_SetStockFilter(LE_LOOT_FILTER_CLASS); end } };
    local numSpecs = GetNumSpecializations();
    for i = 1, numSpecs do
        local EXTVENDOR_DUMMY, name, EXTVENDOR_DUMMY, icon = GetSpecializationInfo(i);
        table.insert(stockFilters, { text = name, checked = (currFilter == LE_LOOT_FILTER_SPEC1 + i - 1), leftPadding = 10, func = function() ExtVendor_SetStockFilter(LE_LOOT_FILTER_SPEC1 + i - 1); end });
    end
    table.insert(stockFilters, { text = ALL_SPECS, checked = (currFilter == LE_LOOT_FILTER_CLASS), leftPadding = 10, func = function() ExtVendor_SetStockFilter(LE_LOOT_FILTER_CLASS); end });
    table.insert(stockFilters, { text = ITEM_BIND_ON_EQUIP, checked = (currFilter == LE_LOOT_FILTER_BOE), func = function(self) ExtVendor_SetStockFilter(LE_LOOT_FILTER_BOE); end });
    table.insert(stockFilters, { text = ALL, checked = (currFilter == LE_LOOT_FILTER_ALL), func = function() ExtVendor_SetStockFilter(LE_LOOT_FILTER_ALL); end });

    local menu = {
        { text = L["HIDE_FILTERED"], checked = EXTVENDOR_DATA['config']['hide_filtered'], func = function() ExtVendor_ToggleSetting("hide_filtered"); ExtVendor_UpdateDisplay(); end },
		{ text = "", notCheckable = true, notClickable = true, disabled = true },
        { text = L["HIDE_UNUSABLE"], checked = EXTVENDOR_DATA['config']['usable_items'], func = function() ExtVendor_ToggleSetting("usable_items"); ExtVendor_UpdateDisplay(); end },
        { text = L["FILTER_SUBOPTIMAL"], checked = EXTVENDOR_DATA['config']['optimal_armor'], func = function() ExtVendor_ToggleSetting("optimal_armor"); ExtVendor_UpdateDisplay(); end },
        { text = L["FILTER_TRANSMOG"], hasArrow = true, notCheckable = true,
            menuList = {
                { text = L["FILTER_TRANSMOG_ONLY"], checked = EXTVENDOR_SHOW_TRANSMOG_ONLY, func = function() ExtVendor_SetFilterTransmogOnly(not EXTVENDOR_SHOW_TRANSMOG_ONLY); end },
                { text = L["FILTER_COLLECTED_TRANSMOG"], checked = EXTVENDOR_HIDE_COLLECTED_TRANSMOG, func = function() ExtVendor_SetFilterCollectedTransmog(not EXTVENDOR_HIDE_COLLECTED_TRANSMOG); end },
            },
        },
        { text = L["FILTER_RECIPES"], hasArrow = true, notCheckable = true,
            menuList = {
                { text = L["FILTER_ALREADY_KNOWN"], checked = EXTVENDOR_DATA['config']['hide_known_recipes'], func = function() ExtVendor_ToggleSetting("hide_known_recipes"); ExtVendor_UpdateDisplay(); end, disabled = EXTVENDOR_DATA['config']['high_performance'] },
                { text = L["FILTER_PURCHASED"], checked = EXTVENDOR_DATA['config']['filter_purchased_recipes'], func = function() ExtVendor_ToggleSetting("filter_purchased_recipes"); ExtVendor_UpdateDisplay(); end },
            },
        },
        { text = L["FILTER_COLLECTABLES"], hasArrow = true, notCheckable = true,
            menuList = {
                { text = L["FILTER_COLLECTED_HEIRLOOMS"], checked = EXTVENDOR_DATA['config']['hide_known_heirlooms'], func = function() ExtVendor_ToggleSetting("hide_known_heirlooms"); ExtVendor_UpdateDisplay(); end },
                { text = L["FILTER_COLLECTED_TOYS"], checked = EXTVENDOR_DATA['config']['hide_known_toys'], func = function() ExtVendor_ToggleSetting("hide_known_toys"); ExtVendor_UpdateDisplay(); end },
            },
        },
        { text = L["FILTER_SLOT"], hasArrow = true, notCheckable = true,
            menuList = {
                { text = ALL,                   checked = (SLOT_FILTER_INDEX == 0),  func = function() ExtVendor_SetSlotFilter(0); end },
                { text = L["SLOT_CAT_ARMOR"], hasArrow = true, notCheckable = true,
                    menuList = {
                        { text = ALL,                   checked = (SLOT_FILTER_INDEX == 1),  func = function() ExtVendor_SetSlotFilter(1); end },
                        { text = L["SLOT_HEAD"],        checked = (SLOT_FILTER_INDEX == 2),  func = function() ExtVendor_SetSlotFilter(2); end },
                        { text = L["SLOT_SHOULDER"],    checked = (SLOT_FILTER_INDEX == 3),  func = function() ExtVendor_SetSlotFilter(3); end },
                        { text = L["SLOT_BACK"],        checked = (SLOT_FILTER_INDEX == 4),  func = function() ExtVendor_SetSlotFilter(4); end },
                        { text = L["SLOT_CHEST"],       checked = (SLOT_FILTER_INDEX == 5),  func = function() ExtVendor_SetSlotFilter(5); end },
                        { text = L["SLOT_WRIST"],       checked = (SLOT_FILTER_INDEX == 6),  func = function() ExtVendor_SetSlotFilter(6); end },
                        { text = L["SLOT_HANDS"],       checked = (SLOT_FILTER_INDEX == 7),  func = function() ExtVendor_SetSlotFilter(7); end },
                        { text = L["SLOT_WAIST"],       checked = (SLOT_FILTER_INDEX == 8),  func = function() ExtVendor_SetSlotFilter(8); end },
                        { text = L["SLOT_LEGS"],        checked = (SLOT_FILTER_INDEX == 9),  func = function() ExtVendor_SetSlotFilter(9); end },
                        { text = L["SLOT_FEET"],        checked = (SLOT_FILTER_INDEX == 10), func = function() ExtVendor_SetSlotFilter(10); end },
                    },
                },
                { text = L["SLOT_CAT_ACCESSORIES"], hasArrow = true, notCheckable = true,
                    menuList = {
                        { text = ALL,                   checked = (SLOT_FILTER_INDEX == 20), func = function() ExtVendor_SetSlotFilter(20); end },
                        { text = L["SLOT_NECK"],        checked = (SLOT_FILTER_INDEX == 21), func = function() ExtVendor_SetSlotFilter(21); end },
                        { text = L["SLOT_SHIRT"],       checked = (SLOT_FILTER_INDEX == 22), func = function() ExtVendor_SetSlotFilter(22); end },
                        { text = L["SLOT_TABARD"],      checked = (SLOT_FILTER_INDEX == 23), func = function() ExtVendor_SetSlotFilter(23); end },
                        { text = L["SLOT_FINGER"],      checked = (SLOT_FILTER_INDEX == 24), func = function() ExtVendor_SetSlotFilter(24); end },
                        { text = L["SLOT_TRINKET"],     checked = (SLOT_FILTER_INDEX == 25), func = function() ExtVendor_SetSlotFilter(25); end },
                    },
                },
                { text = L["SLOT_CAT_WEAPONS"], hasArrow = true, notCheckable = true,
                    menuList = {
                        { text = ALL,                   checked = (SLOT_FILTER_INDEX == 30), func = function() ExtVendor_SetSlotFilter(30); end },
                        { text = L["SLOT_WEAPON1H"],    checked = (SLOT_FILTER_INDEX == 31), func = function() ExtVendor_SetSlotFilter(31); end },
                        { text = L["SLOT_WEAPON2H"],    checked = (SLOT_FILTER_INDEX == 32), func = function() ExtVendor_SetSlotFilter(32); end },
                        { text = L["SLOT_WEAPONOH"],    checked = (SLOT_FILTER_INDEX == 33), func = function() ExtVendor_SetSlotFilter(33); end },
                        { text = L["SLOT_RANGED"],      checked = (SLOT_FILTER_INDEX == 34), func = function() ExtVendor_SetSlotFilter(34); end },
                    },
                },
                { text = L["SLOT_CAT_OFFHAND"], hasArrow = true, notCheckable = true,
                    menuList = {
                        { text = ALL,                   checked = (SLOT_FILTER_INDEX == 40), func = function() ExtVendor_SetSlotFilter(40); end },
                        { text = L["SLOT_OFFHAND"],     checked = (SLOT_FILTER_INDEX == 41), func = function() ExtVendor_SetSlotFilter(41); end },
                        { text = L["SLOT_SHIELD"],      checked = (SLOT_FILTER_INDEX == 42), func = function() ExtVendor_SetSlotFilter(42); end },
                    },
                },
            },
        },
        { text = L["QUALITY_FILTER_MINIMUM"], hasArrow = true, notCheckable = true,
            menuList = {
                { text = ALL, checked = (EXTVENDOR.SelectedQuality == 0), func = function() ExtVendor_SetMinimumQuality(0); end },
                { text = ITEM_QUALITY_COLORS[2].hex .. ITEM_QUALITY2_DESC, checked = (EXTVENDOR.SelectedQuality == 2), func = function() ExtVendor_SetMinimumQuality(2); end },
                { text = ITEM_QUALITY_COLORS[3].hex .. ITEM_QUALITY3_DESC, checked = (EXTVENDOR.SelectedQuality == 3), func = function() ExtVendor_SetMinimumQuality(3); end },
                { text = ITEM_QUALITY_COLORS[4].hex .. ITEM_QUALITY4_DESC, checked = (EXTVENDOR.SelectedQuality == 4), func = function() ExtVendor_SetMinimumQuality(4); end },
                { text = ITEM_QUALITY_COLORS[7].hex .. ITEM_QUALITY7_DESC, checked = (EXTVENDOR.SelectedQuality == 7), func = function() ExtVendor_SetMinimumQuality(7); end },
            },
        },
        { text = L["QUALITY_FILTER_SPECIFIC"], hasArrow = true, notCheckable = true,
            menuList = {
                { text = ALL, checked = (EXTVENDOR.SelectedQuality == 0), func = function() ExtVendor_SetMinimumQuality(0); end },
                { text = ITEM_QUALITY_COLORS[1].hex .. ITEM_QUALITY1_DESC, checked = (EXTVENDOR.SelectedQuality == 1), func = function() ExtVendor_SetSpecificQuality(1); end },
                { text = ITEM_QUALITY_COLORS[2].hex .. ITEM_QUALITY2_DESC, checked = (EXTVENDOR.SelectedQuality == 2), func = function() ExtVendor_SetSpecificQuality(2); end },
                { text = ITEM_QUALITY_COLORS[3].hex .. ITEM_QUALITY3_DESC, checked = (EXTVENDOR.SelectedQuality == 3), func = function() ExtVendor_SetSpecificQuality(3); end },
                { text = ITEM_QUALITY_COLORS[4].hex .. ITEM_QUALITY4_DESC, checked = (EXTVENDOR.SelectedQuality == 4), func = function() ExtVendor_SetSpecificQuality(4); end },
                { text = ITEM_QUALITY_COLORS[7].hex .. ITEM_QUALITY7_DESC, checked = (EXTVENDOR.SelectedQuality == 7), func = function() ExtVendor_SetSpecificQuality(7); end },
            },
        },
        { text = L["STOCK_FILTER"], hasArrow = true, notCheckable = true, menuList = stockFilters },
		{ text = "", notCheckable = true, notClickable = true, disabled = true },
        { text = L["CONFIGURE_QUICKVENDOR"], notCheckable = true, func = function() ExtVendor_QVConfigFrame:Show(); end },
    };
    EasyMenu(menu, MerchantFrameFilterDropDown, self, 0, 0, "MENU", 1);
end


--========================================
-- Sets the 'stock' filter and updates
-- the vendor display
--========================================
function ExtVendor_SetStockFilter(index)
    SetMerchantFilter(index);
    ExtVendor_UpdateDisplay();
end

--========================================
-- Sets the minimum quality filter
--========================================
function ExtVendor_SetMinimumQuality(quality)
    EXTVENDOR.SelectedQuality = math.max(0, math.min(7, quality));
    EXTVENDOR.SpecificQuality = false;
    ExtVendor_UpdateDisplay();
end

--========================================
-- Sets the specific quality filter
--========================================
function ExtVendor_SetSpecificQuality(quality)
    EXTVENDOR.SelectedQuality = math.max(0, math.min(7, quality));
    EXTVENDOR.SpecificQuality = true;
    ExtVendor_UpdateDisplay();
end

--========================================
-- Changes the equipment slot filter
--========================================
function ExtVendor_SetSlotFilter(index)
    SLOT_FILTER_INDEX = index;
    ExtVendor_UpdateDisplay();
end

--========================================
-- Enables/disables filtering of
-- transmoggable item types
--========================================
function ExtVendor_SetFilterTransmogOnly(state)
    EXTVENDOR_SHOW_TRANSMOG_ONLY = state;
    ExtVendor_UpdateDisplay();
end

--========================================
-- Enables/disables filtering of
-- collected item appearances
--========================================
function ExtVendor_SetFilterCollectedTransmog(state)
    EXTVENDOR_HIDE_COLLECTED_TRANSMOG = state;
    ExtVendor_UpdateDisplay();
end
