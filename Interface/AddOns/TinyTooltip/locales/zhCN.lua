
local addon = select(2, ...)

if (GetLocale() ~= "zhCN") then return end

addon.L = {
    ["general.mask"]                        = "顶部遮罩",
    ["general.statusbarText"]               = "HP文字",
    ["general.background"]                  = "背景颜色",
    ["general.borderColor"]                 = "边框颜色",
    ["general.scale"]                       = "框架缩放",
    ["general.borderSize"]                  = "边框大小",
    ["general.statusbarHeight"]             = "HP高度",
    ["general.borderCorner"]                = "边框样式",
    ["general.statusbarPosition"]           = "HP位置",
    ["general.statusbarColor"]              = "HP颜色",
    ["general.anchor.position"]             = "框架锚点",
    ["general.anchor.returnInCombat"]       = "战斗时复位",
    ["general.anchor.returnOnUnitFrame"]    = "UnitFrame上时复位",
    
    ["item.coloredItemBorder"]              = "物品边框染色",
    ["quest.coloredQuestBorder"]            = "任务边框染色",
    
    ["unit.player.anchor.position"]         = "框架锚点",
    ["unit.player.anchor.returnInCombat"]   = "战斗时复位",
    ["unit.player.anchor.returnOnUnitFrame"] = "UnitFrame上时复位",
    ["unit.player.coloredBorder"]           = "边框染色",
    ["unit.player.showTarget"]              = "显示目标",
    ["unit.player.showTargetBy"]            = "显示被关注数",
    ["unit.player.showModel"]               = "显示模型",
    ["unit.player.elements.raidIcon"]       = "标记图标",
    ["unit.player.elements.pvpIcon"]        = "PVP状态",
    ["unit.player.elements.factionIcon"]    = "阵营图标",
    ["unit.player.elements.classIcon"]      = "职业图标",
    ["unit.player.elements.title"]          = "头衔",
    ["unit.player.elements.name"]           = "名称",
    ["unit.player.elements.realm"]          = "服务器",
    ["unit.player.elements.statusAFK"]      = "AFK",
    ["unit.player.elements.statusDND"]      = "DND",
    ["unit.player.elements.statusDC"]       = "OFFLINE",
    ["unit.player.elements.guildName"]      = "公会名称",
    ["unit.player.elements.guildIndex"]     = "公会阶级数字",
    ["unit.player.elements.guildRank"]      = "公会阶级名称",
    ["unit.player.elements.guildRealm"]     = "公会服务器",
    ["unit.player.elements.levelValue"]     = "等级",
    ["unit.player.elements.factionName"]    = "阵营",
    ["unit.player.elements.gender"]         = "性别",
    ["unit.player.elements.raceName"]       = "种族",
    ["unit.player.elements.className"]      = "职业",
    ["unit.player.elements.isPlayer"]       = "玩家",
    
    ["unit.npc.anchor.position"]            = "框架锚点",
    ["unit.npc.anchor.returnInCombat"]      = "战斗时复位",
    ["unit.npc.anchor.returnOnUnitFrame"]   = "UnitFrame上时复位",
    ["unit.npc.coloredBorder"]              = "边框染色",
    ["unit.npc.showTarget"]                 = "显示目标",
    ["unit.npc.showTargetBy"]               = "显示被关注数",
    ["unit.npc.elements.raidIcon"]          = "标记图标",
    ["unit.npc.elements.classIcon"]         = "职业图标",
    ["unit.npc.elements.questIcon"]         = "任务图标",
    ["unit.npc.elements.npcTitle"]          = "头衔",
    ["unit.npc.elements.name"]              = "名称",
    ["unit.npc.elements.levelValue"]        = "等级",
    ["unit.npc.elements.classifBoss"]       = "首领",
    ["unit.npc.elements.classifElite"]      = "精英",
    ["unit.npc.elements.classifRare"]       = "稀有",
    ["unit.npc.elements.creature"]          = "类型",
    ["unit.npc.elements.reactionName"]      = "声望",
    
    ["dropdown.inherit"]        = "|cffffee00继承全局|r",
    ["dropdown.default"]        = "|cffaaaaaa系统默认|r",
    ["dropdown.angular"]        = "直角边框",
    ["dropdown.bottom"]         = "底部",
    ["dropdown.top"]            = "顶部",
    ["dropdown.auto"]           = "智能匹配",
    ["dropdown.smooth"]         = "百分比动态",
    ["dropdown.cursorRight"]    = "鼠标右侧",
    ["dropdown.cursor"]         = "鼠标",
    ["dropdown.static"]         = "固定位置",
    ["dropdown.class"]          = "职业染色",
    ["dropdown.level"]          = "等差染色",
    ["dropdown.reaction"]       = "声望染色",
    ["dropdown.itemQuality"]    = "物品品质染色",
    ["dropdown.selection"]      = "类型染色",
    ["dropdown.faction"]        = "阵营染色",

    ["dropdown.none"]           = "|cffaaaaaa(无)|r",
    ["dropdown.reaction5"]      = "声望友好以上",
    ["dropdown.reaction6"]      = "声望尊敬以上",
    ["dropdown.inraid"]         = "团队时",
    ["dropdown.incombat"]       = "战斗中",
    ["dropdown.inpvp"]          = "战场里",
    ["dropdown.inarena"]        = "竞技场",
    ["dropdown.ininstance"]     = "副本时",
    ["dropdown.samerealm"]      = "同公会服",
    ["dropdown.not reaction5"]      = "|cffff3333非|r声望友好以上",
    ["dropdown.not reaction6"]      = "|cffff3333非|r声望尊敬以上",
    ["dropdown.not inraid"]         = "|cffff3333非|r团队时",
    ["dropdown.not incombat"]       = "|cffff3333非|r战斗中",
    ["dropdown.not inpvp"]          = "|cffff3333非|r战场里",
    ["dropdown.not inarena"]        = "|cffff3333非|r竞技场",
    ["dropdown.not ininstance"]     = "|cffff3333非|r副本时",
    ["dropdown.not samerealm"]      = "|cffff3333非|r同公会服",
    
    ["TargetBy"] = "被关注数",
}
