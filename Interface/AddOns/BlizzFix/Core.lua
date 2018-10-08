-- GuildControlUI Fix
GuildControlUIRankSettingsFrameRosterLabel = CreateFrame("Frame")
GuildControlUIRankSettingsFrameRosterLabel:Hide()

-- StaticPopupDialogs Fix
if GetLocale() == "zhCN" then
    StaticPopupDialogs["LFG_LIST_ENTRY_EXPIRED_TOO_MANY_PLAYERS"] = {
        text = "",
        button1 = OKAY,
        timeout = 0.001,
        whileDead = 1,
        preferredIndex = 3
    }
end
