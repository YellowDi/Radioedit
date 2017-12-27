local T, C, L, G = unpack(select(2, ...))

local addon_name = G.addon_name
local options = T.CreateOptions(EJ_GetEncounterInfo(2009), G.gui, -20, -390, -550)

-- icons
T.CreateAuras(options, "HARMFUL", 247367, "Imonar_auras_247367", 1, 1, 1, true, true, "all", "TOPLEFT", 30, -50) -- 震击之枪
T.CreateAuras(options, "HARMFUL", 250255, "Imonar_auras_250255", 1, 1, 1, true, true, "all", "TOPLEFT", 30, -85) -- 强化震击之枪
T.CreateAuras(options, "HARMFUL", 247687, "Imonar_auras_247687", 1, 1, 1, true, true, "all", "TOPLEFT", 30, -120) -- 撕裂
T.CreateBossMsg(options, "RAID_BOSS_WHISPER", 254244, "254244", 3, "Imonar_msg_254244", 0, 1, 0, L["靠边"], "all", "TOPLEFT", 30, -155) -- 催眠气罐
T.CreateAura(options, "HARMFUL", "player", 255029, "Imonar_aura_255029",  0, 1, 1, true, false, "", "all", "TOPLEFT", 30, -190) -- 催眠气罐
T.CreateAura(options, "HARMFUL", "player", 247565, "Imonar_aura_247565",  1, 1, 0, true, false, "", "all", "TOPLEFT", 30, -225) -- 催眠毒气
T.CreateAura(options, "HARMFUL", "player", 250006, "Imonar_aura_250006",  1, 1, 0, true, false, "", "all", "TOPLEFT", 30, -260) -- 强化脉冲手雷
T.CreateAura(options, "HARMFUL", "player", 247932, "Imonar_aura_247932",  1, 0, 0, true, false, "", "all", "TOPLEFT", 30, -295) -- 霰弹爆破
T.CreateAura(options, "HARMFUL", "player", 248070, "Imonar_aura_248070",  1, 0, 0, false, false, "", "all", "TOPLEFT", 30, -330) -- 强化霰弹爆破

T.CreateAura(options, "HARMFUL", "player", 247641, "Imonar_aura_247641",  0, 1, 1, true, false, "", "all", "TOPLEFT", 430, -50) -- 静滞陷阱
T.CreateAura(options, "HARMFUL", "player", 250224, "Imonar_aura_250224",  1, 1, 1, true, true, "", "all", "TOPLEFT", 430, -85) -- 震晕
T.CreateAura(options, "HARMFUL", "player", 247949, "Imonar_aura_247949",  1, 0, 0, true, false, "", "all", "TOPLEFT", 430, -120) -- 霰弹爆破（转阶段）
T.CreateAura(options, "HARMFUL", "player", 248321, "Imonar_aura_248321",  1, 1, 0, true, false, "", "all", "TOPLEFT", 430, -155) -- 洪荒烈火 250191 同名
T.CreateAura(options, "HELPFUL", "boss1", 248424, "Imonar_aura_248424",  1, 1, 0, true, true, "", "all", "TOPLEFT", 430, -190) -- 聚合之力
T.CreateLog(options, "SPELL_AURA_APPLIED", 254183, "player", 2, "Imonar_logs_254183", 1, 0.5, 0, L["快走开"], "all", "TOPLEFT", 430, -225) -- 灼伤皮肤
T.CreateAura(options, "HARMFUL", "player", 247716, "Imonar_aura_247716",  1, 0, 0, true, false, "", "all", "TOPLEFT", 430, -260) -- 充能轰炸
T.CreateLog(options, "SPELL_CAST_START", 248254, nil, 7, "Imonar_logs_248254", 1, 0.5, 0, L["施法"], "all", "TOPLEFT", 430, -295) -- 充能轰炸

-- sounds
T.CreateSoundFrame(options, 30, -420, nil, "6_247367", "COMBAT_LOG_EVENT_UNFILTERED", 247367, "SPELL_CAST_START") -- 震击之枪
T.CreateSoundFrame(options, 30, -450, nil, "6_250255", "COMBAT_LOG_EVENT_UNFILTERED", 250255, "SPELL_CAST_START") -- 强化震击之枪
T.CreateSoundFrame(options, 30, -480, nil, "6_247687", "COMBAT_LOG_EVENT_UNFILTERED", 247687, "SPELL_CAST_START") -- 撕裂
T.CreateSoundFrame(options, 30, -510, nil, "6_247923", "COMBAT_LOG_EVENT_UNFILTERED", 247923, "SPELL_CAST_START") -- 霰弹爆破
T.CreateSoundFrame(options, 230, -420, nil, "6_248070", "COMBAT_LOG_EVENT_UNFILTERED", 248070, "SPELL_CAST_START") -- 强化霰弹爆破
T.CreateSoundFrame(options, 230, -450, nil, "6_248068", "COMBAT_LOG_EVENT_UNFILTERED", 248068, "SPELL_CAST_START") -- 强化脉冲手雷
T.CreateSoundFrame(options, 230, -480, nil, "6_248254", "COMBAT_LOG_EVENT_UNFILTERED", 248254, "SPELL_CAST_START") -- 充能轰炸
T.CreateSoundFrame(options, 230, -510, nil, "6_254244", "RAID_BOSS_WHISPER", 254244) -- 催眠气罐
T.CreateSoundFrame(options, 430, -420, nil, "6_254183", "COMBAT_LOG_EVENT_UNFILTERED", 254183, "SPELL_AURA_APPLIED", G.PlayerName) -- 灼伤皮肤


-- health
hp_range = {
	Heroic = {
		{ ul = 69, ll = 66, tip = L["阶段转换"]},
		{ ul = 36, ll = 33, tip = L["阶段转换"]},
	},
	Mythic = {
		{ ul = 83, ll = 80, tip = L["阶段转换"]},
		{ ul = 63, ll = 60, tip = L["阶段转换"]},
		{ ul = 43, ll = 40, tip = L["阶段转换"]},
		{ ul = 23, ll = 20, tip = L["阶段转换"]},
	},
}

T.CreateHPAlertframe(options, 2082, "124158", "boss_2009", "boss1", "124158", hp_range, 30, -580)


-- hl icon on raid
T.Create_HL_EventFrame(options, "hl_254244_3", 30, -610, nil, "CHAT_MSG_ADDON", "254244") -- 催眠气罐

-- chat msg
T.Create_ChatMsgSpells_Options(options, 254244, 30, -640) -- 催眠气罐 msg