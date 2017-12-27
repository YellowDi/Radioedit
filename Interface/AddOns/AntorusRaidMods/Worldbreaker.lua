local T, C, L, G = unpack(select(2, ...))

local addon_name = G.addon_name
local options = T.CreateOptions(EJ_GetEncounterInfo(1992), G.gui, -20, -390, -550)

-- icons
T.CreateAuras(options, "HARMFUL", 246220, "Worldbreaker_auras_246200", 1, 1, 1, true, false, "all", "TOPLEFT", 30, -50) -- 邪能轰炸
T.CreateCasting(options, "CASTING", 240277, 30, "Worldbreaker_cast_240277", 1, 1, 1, L["限时"], "all", "TOPLEFT", 30, -85) -- 天启引擎
T.CreateLog(options, "SPELL_CAST_START", 244969, nil, 5.5, "Worldbreaker_logs_244969", 1, 1, 0, L["远离"], "all", "TOPLEFT", 30, -120) -- 根除
local ficon, fop = T.CreateLog(options, "SPELL_CAST_SUCCESS", 244294, nil, 4, "Worldbreaker_logs_244294", 0, 1, 1, L["接圈"], "all", "TOPLEFT", 30, -155) -- 歼灭
T.texture_fix(ficon, fop, 244761)
T.CreateLog(options, "SPELL_CAST_START", 247044, nil, 4, "Worldbreaker_logs_247044", 0, 1, 1, L["接圈"], 16, "TOPLEFT", 30, -190) -- 错乱歼灭
T.CreateBossMsg(options, "RAID_BOSS_WHISPER", 244410, "244410", 5, "Worldbreaker_msg_244410", 1, 0, 0, L["点你"], "all", "TOPLEFT", 30, -225) -- 屠戮

T.CreateAura(options, "HARMFUL", "player", 246919, "Worldbreaker_aura_246919",  1, 0, 0, true, false, L["点你"], 16, "TOPLEFT", 30, -260) -- 错乱屠戮
T.CreateAura(options, "HARMFUL", "player", 246848, "Worldbreaker_aura_246848",  1, 1, 1, true, false, "", 16, "TOPLEFT", 30, -295) -- 引力毁灭

-- sounds
T.CreateSoundFrame(options, 30, -420, nil, "1_246220", "COMBAT_LOG_EVENT_UNFILTERED", 246220, "SPELL_AURA_APPLIED") --邪能轰炸
T.CreateSoundFrame(options, 30, -450, nil, "1_240277", "COMBAT_LOG_EVENT_UNFILTERED", 240277, "SPELL_CAST_START") -- 天启引擎
T.CreateSoundFrame(options, 30, -480, nil, "1_244294", "COMBAT_LOG_EVENT_UNFILTERED", 244294, "SPELL_CAST_SUCCESS") -- 歼灭
T.CreateSoundFrame(options, 30, -510, nil, "1_247044", "COMBAT_LOG_EVENT_UNFILTERED", 247044, "SPELL_CAST_START") -- 错乱歼灭
T.CreateSoundFrame(options, 230, -420, nil, "1_244410", "RAID_BOSS_WHISPER", 244410) -- 屠戮
T.CreateSoundFrame(options, 230, -450, nil, "1_246919", "RAID_BOSS_WHISPER", 246919) -- 错乱屠戮
T.CreateSoundFrame(options, 230, -480, nil, "1_246848", "COMBAT_LOG_EVENT_UNFILTERED", 246848, "SPELL_CAST_SUCCESS") -- 引力毁灭
T.CreateSoundFrame(options, 230, -510, nil, "1_244969", "COMBAT_LOG_EVENT_UNFILTERED", 244969, "SPELL_CAST_SUCCESS") -- 根除


-- health
hp_range = {
	All = {
		{ ul = 68, ll = 65, tip = L["阶段转换"]},
		{ ul = 38, ll = 35, tip = L["阶段转换"]},
	},
}

T.CreateHPAlertframe(options, 2076, "122450", "boss_1992", "boss1", "122450", hp_range, 30, -580)

-- hl icon on raid
T.Create_HL_EventFrame(options, "hl_244410_d", 30, -610, nil, "COMBAT_LOG_EVENT_UNFILTERED", 244410, "SPELL_AURA_APPLIED")   -- 屠戮
T.Create_HL_EventFrame(options, "hl_246919_d", 30, -640, nil, "COMBAT_LOG_EVENT_UNFILTERED", 246919, "SPELL_AURA_APPLIED")   -- 错乱屠戮

-- chat msg
T.Create_ChatMsgSpells_Options(options, 244410, 30, -670) -- 屠戮
T.Create_ChatMsgSpells_Options(options, 246919, 30, -700) -- 错乱屠戮