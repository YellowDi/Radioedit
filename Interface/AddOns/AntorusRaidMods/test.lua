local T, C, L, G = unpack(select(2, ...))

local addon_name = G.addon_name

local options = T.CreateOptions("TEST", G.gui, -20, -390, -550)

-- 白 1, 1, 1
-- 红 1, 0, 0
-- 黄 1, 1, 0
-- 浅蓝 0, 1, 1
-- 浅绿 0, 1, 0
-- 浅紫色 1, 0, 1
-- 橙色 1, .5, 0
-- 深蓝 0, .5, .5
-- 深紫色 .5, 0, .5


T.CreateAura(options, "HELPFUL", "player", 774, "Test_aura_774",  1, 1, 1, true, true, "一二三四五六七八九", "all", "TOPLEFT", 30, -50)
T.CreateAuras(options, "HELPFUL", 48438, "Test_auras_48438",  1, 0, 0, true, false, "all", "TOPLEFT", 30, -85)
T.CreateLog(options, "SPELL_CAST_START", 8936, nil, 10, "Test_logs_8936", 1, 1, 1, "波", "all", "TOPLEFT", 30, -120)
T.CreateCasting(options, "CASTING", 5185, 5, "Test_cast_5185", 1, 1, 1, L["限时"], "all", "TOPLEFT", 30, -155)
T.CreateBossMsg(options, "CHAT_MSG_SAY", 774, "回春", 6, "Test_msg_774", 1, 0, 0, L["刷血"], "all", "TOPLEFT", 30, -190)

-- power
pp_range = {
	{ ul = 100, ll = 10, tip = L["准备连击"]},
}

T.CreatePPAlertframe(options, 1810, "91784", "boss_1810", "boss1", "91784", pp_range, 30, -580)

-- health
hp_range = {
	All = {
		{ ul = 100, ll = 80, tip = L["阶段转换"]},
		{ ul = 43, ll = 40, tip = L["阶段转换"]},
	},
}

T.CreateHPAlertframe(options, 1810, "91784", "boss_1810", "boss1", "91784", hp_range, 30, -610)

--T.CreateSoundFrame(options, 30, -350, nil, "1_246220", "COMBAT_LOG_EVENT_UNFILTERED", 61295, "SPELL_AURA_APPLIED", G.PlayerName) --"邪能轰炸"
--T.CreateSoundFrame(options, 30, -380, nil, "1_246848", "UNIT_SPELLCAST_START", 8004) -- "引力毁灭"
--T.CreateSoundFrame(options, 30, -410, nil, "1_240277", "UNIT_SPELLCAST_SUCCEEDED", 77472) -- "天启引擎"
--[[
"COMBAT_LOG_EVENT_UNFILTERED"
"UNIT_SPELLCAST_START"
"UNIT_SPELLCAST_SUCCEEDED"
"CHAT_MSG_RAID_BOSS_EMOTE"
"RAID_BOSS_WHISPER"
"UNIT_SPELLCAST_CHANNEL_START"
]]

T.Create_HL_EventFrame(options, "hl_2061_3", 30, -640, nil, "COMBAT_LOG_EVENT_UNFILTERED", 2061, "SPELL_CAST_SUCCESS")
T.Create_HL_EventFrame(options, "hl_774_d", 30, -670, nil, "COMBAT_LOG_EVENT_UNFILTERED", 774, "SPELL_AURA_APPLIED")
T.Create_HL_EventFrame(options, "hl_139_5", 30, -700, nil, "CHAT_MSG_ADDON", "zzz")

-- group share
T.Create_GS_Options(options, "gs_48438", 230, -580)

T.Create_ChatMsgSpells_Options(options, 48438, 230, -610) -- 野性成长













