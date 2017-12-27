local T, C, L, G = unpack(select(2, ...))

local addon_name = G.addon_name
local options = T.CreateOptions(EJ_GetEncounterInfo(1986), G.gui, -20, -390, -550)

-- icons
T.CreateAura(options, "HARMFUL", "player", 253753, "CovenofShivarra_aura_253753", 1, 0, 0, false, true, "", "all", "TOPLEFT", 30, -50) -- 恐惧
T.CreateAuras(options, "HARMFUL", 244899, "CovenofShivarra_auras_244899", 1, 1, 1, true, true, "all", "TOPLEFT", 30, -85) -- 火焰打击
T.CreateLog(options, "SPELL_AURA_APPLIED", 245634, "player", 2, "CovenofShivarra_logs_245634", 1, 0.5, 0, L["快走开"], "all", "TOPLEFT", 30, -120) -- 飞旋的军刀
T.CreateAuras(options, "HARMFUL", 245518, "CovenofShivarra_auras_245518", 1, 1, 1, true, true, "all", "TOPLEFT", 30, -155) -- 快速冻结
T.CreateAura(options, "HARMFUL", "player", 253520, "CovenofShivarra_aura_253520",  1, 1, 0, true, false, L["分散"], "all", "TOPLEFT", 30, -190) -- 爆裂脉冲
T.CreateLog(options, "SPELL_CAST_START", 252861, nil, 18, "CovenofShivarra_logs_252861", 1, 0, 1, "", "all", "TOPLEFT", 30, -225)  -- 黑暗风暴
T.CreateAura(options, "HARMFUL", "player", 253020, "CovenofShivarra_aura_253020",  1, 0.5, 0, false, false, "", "all", "TOPLEFT", 30, -260) -- 黑暗风暴
T.CreateAuras(options, "HARMFUL", 245586, "CovenofShivarra_auras_245586", 0, 1, 1, true, false, "all", "TOPLEFT", 30, -295) -- 冷凝之血
T.CreateAura(options, "HARMFUL", "player", 253697, "CovenofShivarra_aura_253697",  0, 1, 1, false, false, "", "all", "TOPLEFT", 30, -330) -- 冰霜之球

T.CreateAuras(options, "HARMFUL", 250757, "CovenofShivarra_auras_250757", 0, 1, 0, true, false, 16, "TOPLEFT", 430, -50) -- 宇宙之光
T.CreateAura(options, "HARMFUL", "player", 250097, "CovenofShivarra_aura_250097",  1, 1, 0, true, true, "", "all", "TOPLEFT", 430, -85) -- 阿曼苏尔的诡诈
T.CreateLog(options, "SPELL_CAST_SUCCESS", 249863, nil, 30, "CovenofShivarra_logs_249863", 1, .5, 1, "", "all", "TOPLEFT", 430, -120)  -- 泰坦的面容
T.CreateBossMsg(options, "CHAT_MSG_RAID_BOSS_EMOTE", 250095, "250095", 6, "CovenofShivarra_msg_250095", 1, 0, 0, L["刷血"], "all", "TOPLEFT", 430, -155) -- 阿曼苏尔的痛苦
T.CreateBossMsg(options, "CHAT_MSG_RAID_BOSS_EMOTE", 245671, "245671", 6, "CovenofShivarra_msg_245671", 1, 0, 0, L["靠边"], "all", "TOPLEFT", 430, -190) -- 卡兹格罗斯的痛苦
T.CreateBossMsg(options, "CHAT_MSG_RAID_BOSS_EMOTE", 246763, "246763", 6, "CovenofShivarra_msg_246763", 0, 1, 1, L["分散"], "all", "TOPLEFT", 430, -225) -- 高戈奈斯的痛苦
T.CreateBossMsg(options, "CHAT_MSG_RAID_BOSS_EMOTE", 245910, "245910", 6, "CovenofShivarra_msg_245910", 1, 1, 1, L["躲避"], "all", "TOPLEFT", 430, -260) -- 诺甘农的痛苦

-- sounds
T.CreateSoundFrame(options, 30, -420, nil, "9_244899", "COMBAT_LOG_EVENT_UNFILTERED", 244899, "SPELL_CAST_START") -- 火焰打击
T.CreateSoundFrame(options, 30, -450, nil, "9_245627", "COMBAT_LOG_EVENT_UNFILTERED", 245627, "SPELL_CAST_START") -- 飞旋的军刀
T.CreateSoundFrame(options, 30, -480, nil, "9_253520", "COMBAT_LOG_EVENT_UNFILTERED", 253520, "SPELL_CAST_SUCCESS") -- 爆裂脉冲
T.CreateSoundFrame(options, 30, -510, nil, "9_246329", "COMBAT_LOG_EVENT_UNFILTERED", 246329, "SPELL_CAST_SUCCESS") -- 暗影之刃
T.CreateSoundFrame(options, 230, -420, nil, "9_252861", "COMBAT_LOG_EVENT_UNFILTERED", 252861, "SPELL_CAST_START") -- 黑暗风暴
T.CreateSoundFrame(options, 230, -450, nil, "9_245518", "COMBAT_LOG_EVENT_UNFILTERED", 245518, "SPELL_CAST_SUCCESS") -- 快速冻结
T.CreateSoundFrame(options, 230, -480, nil, "9_245532", "COMBAT_LOG_EVENT_UNFILTERED", 245532, "SPELL_CAST_SUCCESS") -- 冷凝之血
T.CreateSoundFrame(options, 230, -510, nil, "9_253650", "COMBAT_LOG_EVENT_UNFILTERED", 253650, "SPELL_CAST_START") -- 冰霜之球
T.CreateSoundFrame(options, 430, -420, nil, "9_250757", "COMBAT_LOG_EVENT_UNFILTERED", 250757, "SPELL_CAST_START") -- 宇宙之光
T.CreateSoundFrame(options, 430, -450, nil, "9_250095", "CHAT_MSG_RAID_BOSS_EMOTE", 250095) -- 阿曼苏尔的痛苦
T.CreateSoundFrame(options, 430, -480, nil, "9_245671", "CHAT_MSG_RAID_BOSS_EMOTE", 245671) -- 卡兹格罗斯的痛苦
T.CreateSoundFrame(options, 430, -510, nil, "9_246763", "CHAT_MSG_RAID_BOSS_EMOTE", 246763) -- 高戈奈斯的痛苦
T.CreateSoundFrame(options, 630, -420, nil, "9_245910", "CHAT_MSG_RAID_BOSS_EMOTE", 245910) -- 诺甘农的痛苦

-- hl icon on raid
T.Create_HL_EventFrame(options, "hl_253520_d", 30, -580, nil, "COMBAT_LOG_EVENT_UNFILTERED", 253520, "SPELL_AURA_APPLIED")   -- 爆裂脉冲
T.Create_HL_EventFrame(options, "hl_245586_i", 30, -610, nil, "COMBAT_LOG_EVENT_UNFILTERED", 245586, "SPELL_AURA_APPLIED")   -- 冷凝之血
T.Create_HL_EventFrame(options, "hl_250757_d", 30, -640, nil, "COMBAT_LOG_EVENT_UNFILTERED", 250757, "SPELL_AURA_APPLIED")   -- 宇宙之光 


-- chat msg
T.Create_ChatMsgSpells_Options(options, 253520, 30, -670) -- 爆裂脉冲
T.Create_ChatMsgSpells_Options(options, 250757, 30, -700) -- 宇宙之光

-- 折磨倒计时
local Frame = CreateFrame("Frame", G.addon_name.."CovenofShivarra_Alert", G.FrameHolder)
Frame:SetSize(300, 30)

Frame.movingname = string.format(L["提示框"] , EJ_GetEncounterInfo(1986))
Frame.point = { a1 = "TOPLEFT", parent = "UIParent", a2 = "CENTER", x = 300, y = -40 }
T.CreateDragFrame(Frame)
T.createborder(Frame)

local function CreateCooldownbar(r, g, b, spell)
	local bar = T.createStatusbar(Frame, "ARTWORK", 30, 300, 0, 0, 0, 0)
	bar:SetPoint("CENTER")
	bar:SetMinMaxValues(0, 90)
	bar.t = 0
	
	bar.tab = bar:CreateTexture(nil, "OVERLAY")
	bar.tab:SetSize(3, 30)
	bar.tab:SetColorTexture(r, g, b)
	bar.tab:SetPoint("CENTER", bar:GetStatusBarTexture(), "RIGHT", 0, 0)
	
	bar.icon = bar:CreateTexture(nil, "OVERLAY")	
	bar.icon:SetSize(30, 30)
	bar.icon:SetPoint("RIGHT", bar.tab, "LEFT", -1, 0)
	bar.icon:SetTexture(select(3, GetSpellInfo(spell)))
	bar.icon:SetTexCoord( .1, .9, .1, .9)
	
	bar.iconbd = bar:CreateTexture(nil, "BORDER")
	bar.iconbd:SetColorTexture(0, 0, 0)
	bar.iconbd:SetPoint("TOPLEFT", bar.icon, "TOPLEFT", -1, 1)
	bar.iconbd:SetPoint("BOTTOMRIGHT", bar.icon, "BOTTOMRIGHT", 1, -1)
	
	bar.text = T.createtext(bar, "OVERLAY", 12, "OUTLINE", "CENTER")
	bar.text:SetPoint("BOTTOM", bar.icon, "TOP", 0, 1)
	bar.text:SetSize(40,20)
	
	bar.text:SetText(GetSpellInfo(spell))
	
	return bar
end

Frame.bar1 = CreateCooldownbar(1, .3, 0, 250333) -- 卡兹格罗斯的痛苦
Frame.bar2 = CreateCooldownbar(0, .5, .5, 250335) -- 阿曼苏尔的痛苦
Frame.bar3 = CreateCooldownbar(0, 1, 1, 249793) -- 高戈奈斯的痛苦
Frame.bar4 = CreateCooldownbar(1, 0, 1, 250334) -- 诺甘农的痛苦

local function Start(bar, start)
	bar:Show()
	bar:SetScript("OnUpdate", function(self, e)
		bar.t = bar.t - e
		if bar.t <= 0 then
			local v = time() - start
			if v <= 90 then
				bar:SetValue(v)
			else
				bar:Hide()
				bar:SetScript("OnUpdate", nil)
			end
			bar.t = .3
		end
	end)
end

local function Reset()
	for i = 1, 4 do
		Frame["bar"..i]:Hide()
		Frame["bar"..i]:SetScript("OnUpdate", nil)
	end
end

local function Update(event, ...)
	if event == "COMBAT_LOG_EVENT_UNFILTERED" then
		local Time_stamp, Event_type, _, _, _, _, _, _, _, _, _, SpellID = ...
		if Event_type == "SPELL_CAST_SUCCESS" then
			if SpellID == 250333 then -- 卡兹格罗斯的痛苦
				Start(Frame.bar1, Time_stamp)
			elseif SpellID == 250335 then -- 阿曼苏尔的痛苦
				Start(Frame.bar2, Time_stamp)
			elseif SpellID == 249793 then -- 高戈奈斯的痛苦
				Start(Frame.bar3, Time_stamp)
			elseif SpellID == 250334 then -- 诺甘农的痛苦
				Start(Frame.bar4, Time_stamp)
			end
		end
	elseif event == "ENCOUNTER_START" then
		Reset()
	elseif event == "ENCOUNTER_END" then
		Reset()
	else
		Reset()
	end
end

Frame.Visibility = function(event, ...)
	local show = false
	
	if Frame.enable then
		if event == "ENCOUNTER_START" then
			local encounterID, encounterName, difficultyID, groupSize = ...
			if encounterID == 2073 then
				show = true
			end
		elseif event == "ENCOUNTER_END" then
			show = false
		else
			local guid = UnitGUID("boss1")
			if guid then
				local NPC_ID = select(6, strsplit("-", UnitGUID("boss1")))
				if NPC_ID == "122468" then
					show = true
				end
			end
		end
	end
	
	if show then
		Frame:Show()
		Frame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
	else
		Frame:Hide()
		Frame:UnregisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
	end
	
	Update(event)
end

Frame.Edit = function()
	if not ARM_CDB["General"]["disable_all"] and ARM_CDB["BossMod"]["CovenofShivarra_Alert"] then
		Frame:RegisterEvent("ENCOUNTER_START")
		Frame:RegisterEvent("ENCOUNTER_END")
		Frame.enable = true
	else
		Frame:UnregisterEvent("ENCOUNTER_START")
		Frame:UnregisterEvent("ENCOUNTER_END")
		Frame.enable = false
	end
	Frame.Visibility()
end

Frame:RegisterEvent("PLAYER_ENTERING_WORLD")
Frame:SetScript("OnEvent", function(self, event, ...)
	if event == "PLAYER_ENTERING_WORLD" then
		Frame.Edit()
		Frame:UnregisterEvent("PLAYER_ENTERING_WORLD")
	elseif event == "COMBAT_LOG_EVENT_UNFILTERED" then
		Update(event, ...)
	elseif event == "ENCOUNTER_START" or event == "ENCOUNTER_END" then
		Frame.Visibility(event, ...)
	end
end)

Frame.StartTest = function()
	for i = 1, 4 do
		Frame["bar"..i]:Show()
		Frame["bar"..i]:SetValue(i*25-15)
	end
	Frame:Show()
	
	C_Timer.After(10, function()
		Frame:Hide()
		Reset()	
	end)
end
G.Test["bossmod_9"] = Frame

local bu = T.Create_BossMod_Options(options, L["技能提示"], "CovenofShivarra_Alert", 230, -580)
bu.apply = Frame.Edit
table.insert(G.RM_Frames, Frame)