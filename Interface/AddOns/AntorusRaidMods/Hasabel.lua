local T, C, L, G = unpack(select(2, ...))

local addon_name = G.addon_name
local options = T.CreateOptions(EJ_GetEncounterInfo(1985), G.gui, -20, -390, -550)

-- icons
T.CreateAuras(options, "HARMFUL", 244016, "Hasabel_auras_244016", 1, 1, 1, true, true, "all", "TOPLEFT", 30, -50) -- 时空裂隙
T.CreateLog(options, "SPELL_CAST_START", 243983, nil, 10, "Hasabel_logs_243983", .8, .8, 0, "", "all", "TOPLEFT", 30, -85) -- 崩塌的世界
T.CreateLog(options, "SPELL_CAST_START", 244000, nil, 12, "Hasabel_logs_244000", 0, 1, 0, "", "all", "TOPLEFT", 30, -120) -- 邪能风暴扫射
T.CreateLog(options, "SPELL_AURA_APPLIED", 246208, "player", 2, "Hasabel_logs_246208", 1, 0.5, 0, L["快走开"], "all", "TOPLEFT", 30, -155) -- 酸性之网
T.CreateAura(options, "HARMFUL", "player", 244709, "Hasabel_aura_244709",  1, 1, 1, true, true, "", "all", "TOPLEFT", 30, -190)  -- 烈焰引爆
local ficon1, fop1 = T.CreateCasting(options, "UNIT_SPELLCAST_SUCCEEDED", 257939, 30, "Hasabel_cast_257939", 1, 1, 1, "", "all", "TOPLEFT", 30, -225) -- 火门计时器
T.texture_fix(ficon1, fop1, 244318)
T.StopLog(ficon1, "UNIT_DIED", 122211)
T.CreateAuras(options, "HARMFUL", 244613, "Hasabel_auras_244613", 1, 0, 0, true, false, "all", "TOPLEFT", 30, -260) -- 永燃烈焰
T.CreateAura(options, "HELPFUL", "boss2", 244383, "Hasabel_aura_244383",  1, .5, 0, true, true, "", 16, "TOPLEFT", 30, -295) -- 烈焰之盾
local ficon2, fop2 = T.CreateCasting(options, "UNIT_SPELLCAST_SUCCEEDED", 257941, 30, "Hasabel_cast_257941", 1, 1, 1, "", "all", "TOPLEFT", 30, -330) -- 毒门计时器
T.texture_fix(ficon2, fop2, 246082)
T.StopLog(ficon2, "UNIT_DIED", 122212)

T.CreateAuras(options, "HARMFUL", 244849, "Hasabel_auras_244849", 0, 1, 0, true, false, "all", "TOPLEFT", 430, -50) -- 腐蚀烂泥
local ficon3, fop3 = T.CreateCasting(options, "UNIT_SPELLCAST_SUCCEEDED", 257942, 30, "Hasabel_cast_257942", 1, 1, 1, "", "all", "TOPLEFT", 430, -85) -- 暗门计时器
T.texture_fix(ficon3, fop3, 246157)
T.StopLog(ficon3, "UNIT_DIED", 122213)
T.CreateAuras(options, "HARMFUL", 245075, "Hasabel_auras_245075", 1, 0, 1, true, false, "all", "TOPLEFT", 430, -120) -- 饥饿幽影
T.CreateAuras(options, "HARMFUL", 245118, "Hasabel_auras_245118", 1, 0, 1, true, false, "all", "TOPLEFT", 430, -155) -- 饱足幽影
T.CreateAura(options, "HARMFUL", "player", 245050, "Hasabel_aura_245050",  0, 1, 1, true, false, "", "all", "TOPLEFT", 430, -190)  -- 欺骗幻境
T.CreateAura(options, "HARMFUL", "player", 245040, "Hasabel_aura_245040",  0, .5, .5, true, true, "", "all", "TOPLEFT", 430, -225)  -- 腐蚀

-- sounds
T.CreateSoundFrame(options, 30, -420, nil, "4_244016", "COMBAT_LOG_EVENT_UNFILTERED", 244016, "SPELL_CAST_SUCCESS") -- 时空裂痕
T.CreateSoundFrame(options, 30, -450, nil, "4_243983", "COMBAT_LOG_EVENT_UNFILTERED", 243983, "SPELL_CAST_START") -- 崩塌的世界
T.CreateSoundFrame(options, 30, -480, nil, "4_244000", "COMBAT_LOG_EVENT_UNFILTERED", 244000, "SPELL_CAST_START") -- 邪能风暴扫射
T.CreateSoundFrame(options, 30, -510, nil, "4_244689", "COMBAT_LOG_EVENT_UNFILTERED", 244689, "SPELL_CAST_START") -- 传送门
T.CreateSoundFrame(options, 230, -420, nil, "4_244613", "COMBAT_LOG_EVENT_UNFILTERED", 244613, "SPELL_AURA_APPLIED", G.PlayerName) -- 永燃烈焰
T.CreateSoundFrame(options, 230, -450, nil, "4_244849", "COMBAT_LOG_EVENT_UNFILTERED", 244849, "SPELL_AURA_APPLIED", G.PlayerName) -- 腐蚀烂泥
T.CreateSoundFrame(options, 230, -480, nil, "4_245118", "COMBAT_LOG_EVENT_UNFILTERED", 245118, "SPELL_AURA_APPLIED", G.PlayerName) -- 饱足幽影
T.CreateSoundFrame(options, 230, -510, nil, "4_245075", "COMBAT_LOG_EVENT_UNFILTERED", 245075, "SPELL_AURA_APPLIED", G.PlayerName) -- 饥饿幽影
T.CreateSoundFrame(options, 430, -420, nil, "4_246208", "COMBAT_LOG_EVENT_UNFILTERED", 246208, "SPELL_AURA_APPLIED", G.PlayerName) -- 酸性之网
T.CreateSoundFrame(options, 430, -450, nil, "4_245504", "COMBAT_LOG_EVENT_UNFILTERED", 245504, "SPELL_CAST_START") -- 咆哮暗影
T.CreateSoundFrame(options, 430, -480, nil, "4_244318", "UNIT_SPELLCAST_SUCCEEDED", 257939) -- 火门
T.CreateSoundFrame(options, 430, -510, nil, "4_246082", "UNIT_SPELLCAST_SUCCEEDED", 257941) -- 毒门
T.CreateSoundFrame(options, 630, -420, nil, "4_246157", "UNIT_SPELLCAST_SUCCEEDED", 257942) -- 暗门
T.CreateSoundFrame(options, 630, -450, nil, "4_244607", "COMBAT_LOG_EVENT_UNFILTERED", 244607, "SPELL_CAST_START") -- 克索诺斯之焰
T.CreateSoundFrame(options, 630, -480, nil, "4_244915", "COMBAT_LOG_EVENT_UNFILTERED", 244915, "SPELL_AURA_APPLIED", G.PlayerName) -- 吸取精华
T.CreateSoundFrame(options, 630, -510, nil, "4_245040", "COMBAT_LOG_EVENT_UNFILTERED", 245040, "SPELL_CAST_SUCCESS") -- 腐蚀

-- health
hp_range = {
	All = {
		{ ul = 93, ll = 90, tip = L["阶段转换"]},
		{ ul = 63, ll = 60, tip = L["阶段转换"]},
		{ ul = 33, ll = 30, tip = L["阶段转换"]},
	},
}

T.CreateHPAlertframe(options, 2064, "122104", "boss_1985", "boss1", "122104", hp_range, 30, -580)

-- hl icon on raid
T.Create_HL_EventFrame(options, "hl_244613_10", 30, -610, nil, "COMBAT_LOG_EVENT_UNFILTERED", 244613, "SPELL_AURA_APPLIED")   -- 永燃烈焰 
T.Create_HL_EventFrame(options, "hl_244849_20", 30, -640, nil, "COMBAT_LOG_EVENT_UNFILTERED", 244849, "SPELL_AURA_APPLIED")   -- 腐蚀烂泥 
T.Create_HL_EventFrame(options, "hl_245118_30", 30, -670, nil, "COMBAT_LOG_EVENT_UNFILTERED", 245118, "SPELL_AURA_APPLIED")   -- 饱足幽影 