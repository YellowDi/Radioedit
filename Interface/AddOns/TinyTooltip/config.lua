
local addon = select(2, ...)

addon.db = {
    version = 2,
    general = {
        scale             = 1,                      --縮放
        mask              = true,                   --頂部遮罩層
        background        = {0, 0, 0, 0.8},         --背景顔色和透明度
        borderSize        = 1,                      --邊框大小（直角邊框才生效）
        borderCorner      = "default",              --邊框類型 default|angular:直角邊框
        borderColor       = {0.6, 0.6, 0.6, 0.8},   --邊框顔色和透明度
        statusbarHeight   = 12,                     --HP高度
        statusbarPosition = "bottom",               --HP位置 default|bottom|top
        statusbarText     = true,                   --HP文字
        statusbarColor    = "auto",                 --HP顔色 default|auto|smooth
        anchor            = { position = "cursorRight", returnInCombat = false, returnOnUnitFrame = false }, --鼠標位置 default|cursor|static|cursorRight
    },
    unit = {
        player = {
            coloredBorder = "class",                --玩家邊框顔色 default|class|level|reaction|itemQuality|selection|faction|HEX
            anchor = { position = "inherit", returnInCombat = true, returnOnUnitFrame = false },
            showTarget = true,                      --顯示目標
            showTargetBy = true,                    --顯示被關注
            showModel = true,                       --顯示模型
            elements = {
                raidIcon    = { enable = true, filter = "none" },
                pvpIcon     = { enable = true, filter = "none" },
                factionIcon = { enable = true, filter = "none" },
                classIcon   = { enable = true, filter = "none" },
                title       = { enable = true, color = "ccffff", wildcard = "%s",   filter = "none" },
                name        = { enable = true, color = "class",  wildcard = "%s",   filter = "none" },
                realm       = { enable = true, color = "00eeee", wildcard = "%s",   filter = "none" },
                statusAFK   = { enable = true, color = "ffd200", wildcard = "(%s)", filter = "none" },
                statusDND   = { enable = true, color = "ffd200", wildcard = "(%s)", filter = "none" },
                statusDC    = { enable = true, color = "999999", wildcard = "(%s)", filter = "none" },
                guildName   = { enable = true, color = "ff00ff", wildcard = "<%s>", filter = "none" },
                guildIndex  = { enable = true, color = "cc88ff", wildcard = "-%s-", filter = "none" },
                guildRank   = { enable = true, color = "cc88ff", wildcard = "%s",   filter = "none" },
                guildRealm  = { enable = true, color = "00cccc", wildcard = "%s",   filter = "none" },
                levelValue  = { enable = true, color = "level",   wildcard = "%s",  filter = "none" }, 
                factionName = { enable = true, color = "faction", wildcard = "%s",  filter = "none" }, 
                gender      = { enable = false, color = "999999",  wildcard = "%s",  filter = "none" }, 
                raceName    = { enable = true, color = "cccccc",  wildcard = "%s",  filter = "none" }, 
                className   = { enable = true, color = "ffffff",  wildcard = "%s",  filter = "none" }, 
                isPlayer    = { enable = false, color = "ffffff",  wildcard = "(%s)", filter = "none" }, 
                { "raidIcon", "pvpIcon", "factionIcon", "classIcon", "title", "name", "realm", "statusAFK", "statusDND", "statusDC", },
                { "guildName", "guildIndex", "guildRank", "guildRealm", },
                { "levelValue", "factionName", "gender", "raceName", "className", "isPlayer", },
            },
        },
        npc = {
            coloredBorder = "reaction",
            showTarget = true,
            showTargetBy = true,
            anchor = { position = "inherit", returnInCombat = true, returnOnUnitFrame = false },
            elements = {
                raidIcon     = { enable = true,  filter = "none" },
                classIcon    = { enable = false, filter = "none" },
                questIcon    = { enable = true,  filter = "none" },
                name         = { enable = true, color = "",       wildcard = "%s",    filter = "none" },
                npcTitle     = { enable = true, color = "99e8e8", wildcard = "<%s>",  filter = "none" },
                levelValue   = { enable = true, color = "level",  wildcard = "%s",    filter = "none" }, 
                classifBoss  = { enable = true, color = "ff0000", wildcard = "(%s)",  filter = "none" },
                classifElite = { enable = true, color = "ffff33", wildcard = "(%s)",  filter = "none" }, 
                classifRare  = { enable = true, color = "ffaaff", wildcard = "(%s)",  filter = "none" }, 
                creature     = { enable = true, color = "selection", wildcard = "%s", filter = "none" },
                reactionName = { enable = true, color = "33ffff", wildcard = "<%s>",  filter = "reaction6" },
                { "raidIcon", "classIcon", "questIcon", "name", },
                { "levelValue", "classifBoss", "classifElite", "classifRare", "creature", "reactionName", },
            },
        },
    },
    item = {
        coloredItemBorder = true,  --邊框按品質染色
    },
    spell = {},
    quest = {
        coloredQuestBorder = true,  --任務按等差染色
    },
}
