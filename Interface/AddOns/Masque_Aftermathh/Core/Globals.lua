local GlobalStrings = CreateFrame("Frame")

function GlobalStrings:Update()
    ITEM_LEVEL = "|CFF00FFFFilvl: %d|r"
    ITEM_BIND_ON_EQUIP = "BoE"
    ITEM_BIND_ON_PICKUP = "BoP"
    ITEM_CREATED_BY = "" -- No creator name
    ITEM_LEVEL_AND_MIN = "Level: %d (min: %d)"
    ITEM_LEVEL_RANGE = "Requires level: %d - %d"
    ITEM_LEVEL_RANGE_CURRENT = "Requires level: %d - %d (%d)"
    ITEM_LIMIT_CATEGORY_MULTIPLE = "BoE: %s (%d)"
    DAMAGE_TEMPLATE = "Damage: %s - %s"
    DPS_TEMPLATE = "%s DPS"

    CURRENCY_GAINED = "+ |CFFFFFFFF%s|r"
    CURRENCY_GAINED_MULTIPLE = "+ |CFFFFFFFF%s|r x|CFFFFFFFF%d|r"

    YOU_LOOT_MONEY = "|CFFFFFF00+|r |CFFFFFFFF%s"
    YOU_LOOT_MONEY_GUILD = "|CFFFFFF00+|r |CFFFFFFFF%s|r |CFFFFFF00+|r |CFFFFFFFF( %s )|r"
	LOOT_MONEY = "|CFFFFFF00+|r |CFFFFFFFF%s"
    LOOT_MONEY_SPLIT_GUILD = "|CFFFFFF00+|r |CFFFFFFFF%s|r |CFFFFFF00+|r |CFFFFFFFF( %s )|r"
    LOOT_MONEY_SPLIT = "|CFFFFFF00+|r |CFFFFFFFF%s"

    LOOT_ITEM = "%s |CFFFFFF00+|r %s"
    LOOT_ITEM_MULTIPLE = "%s |CFFFFFF00+|r %sx%d"
    LOOT_ITEM_SELF = "|CFFFFFF00+|r %s"
    LOOT_ITEM_SELF_MULTIPLE = "|CFFFFFF00+|r %sx%d"
    LOOT_ITEM_PUSHED_SELF = "|CFFFFFF00+|r %s"
    LOOT_ITEM_PUSHED_SELF_MULTIPLE = "|CFFFFFF00+|r %sx%d"

    FACTION_STANDING_DECREASED = "%s -%d"
    FACTION_STANDING_INCREASED = "%s +%d"
    FACTION_STANDING_INCREASED_ACH_BONUS = "%s +%d (+%.1f)"
    FACTION_STANDING_INCREASED_ACH_PART = "(+%.1f)"
    FACTION_STANDING_INCREASED_BONUS = "%s + %d (+%.1f RAF)"
    FACTION_STANDING_INCREASED_DOUBLE_BONUS = "%s +%d (+%.1f RAF) (+%.1f)"
    FACTION_STANDING_INCREASED_REFER_PART = "(+%.1f RAF)"
    FACTION_STANDING_INCREASED_REST_PART = "(+%.1f Rested)"

    ERR_AUCTION_SOLD_S = "|CFF1EFF00%s|r |CFFFF0000Sold.|r"

    BN_INLINE_TOAST_FRIEND_OFFLINE = '%s has gone |CFFFF0000offline|r!'
    BN_INLINE_TOAST_FRIEND_ONLINE = '%s has come |CFF00FF00online|r!'

    ERR_FRIEND_OFFLINE_S = "%s has gone |CFFFF0000offline|r."
    ERR_FRIEND_ONLINE_SS = "|Hplayer:%s|h%s|h has come |CFF00FF00online|r."

end

GlobalStrings:RegisterEvent("PLAYER_LOGIN")
GlobalStrings:RegisterEvent("PLAYER_ENTERING_WORLD")
GlobalStrings:RegisterEvent("ADDON_LOADED")

GlobalStrings:SetScript("OnEvent", function(self, event)
    if (event == "PLAYER_LOGIN") then
        self:Update()
    end
end)