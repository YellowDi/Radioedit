local T, C, L, G = unpack(select(2, ...))

local addon_name = G.addon_name
local options = T.CreateOptions(EJ_GetEncounterInfo(2031), G.gui, -20, -440, -600)

-- icons
T.CreateLog(options, "SPELL_AURA_APPLIED", 248167, "player", 2, "Argus_logs_248167", 1, 0.5, 0, L["快走开"], "all", "TOPLEFT", 30, -50) -- 死亡之雾
T.CreateAura(options, "HARMFUL", "player", 248396, "Argus_aura_248396",  1, 0, 1, true, false, L["靠边"], "all", "TOPLEFT", 30, -85) -- 灵魂凋零
T.CreateAuras(options, "HARMFUL", 248499, "Argus_auras_248499", 1, 1, 1, true, true, "all", "TOPLEFT", 30, -120) -- 巨镰横扫
T.CreateAura(options, "HARMFUL", "player", 258646, "Argus_aura_258646",  0, 1, 1, true, false, "", "all", "TOPLEFT", 30, -155) -- 天空之赐
T.CreateAura(options, "HARMFUL", "player", 253903, "Argus_aura_253903",  0, 1, 1, true, true, "", "all", "TOPLEFT", 30, -190) -- 天空之力
T.CreateAura(options, "HARMFUL", "player", 258647, "Argus_aura_258647",  0, .5, 1, true, false, "", "all", "TOPLEFT", 30, -225) -- 海洋之赐
T.CreateAura(options, "HARMFUL", "player", 253901, "Argus_aura_253901",  0, .5, 1, true, true, "", "all", "TOPLEFT", 30, -260) -- 海洋之力
T.CreateAuras(options, "HARMFUL", 255199, "Argus_auras_255199", 1, 1, 1, true, false, "all", "TOPLEFT", 30, -295)  -- 阿格拉玛的化身
T.CreateAura(options, "HARMFUL", "player", 255200, "Argus_aura_255200",  0, .5, .5, true, false, "", "all", "TOPLEFT", 30, -330) -- 阿格拉玛的恩赐
T.CreateAuras(options, "HARMFUL", 250669, "Argus_auras_250669", 1, 1, 0, true, false, "all", "TOPLEFT", 30, -365) -- 灵魂爆发
T.CreateAura(options, "HARMFUL", "player", 250669, "Argus_aura_250669",  1, 1, 0, true, false, L["点你"], "all", "TOPLEFT", 30, -400) -- 灵魂爆发

T.CreateAuras(options, "HARMFUL", 251570, "Argus_auras_251570", 1, 0, 0, true, false, "all", "TOPLEFT", 345, -50) -- 灵魂炸弹
T.CreateAura(options, "HARMFUL", "player", 251570, "Argus_aura_251570",  1, 0, 0, true, false, L["点你"], "all", "TOPLEFT", 345, -85) -- 灵魂炸弹
T.CreateAura(options, "HELPFUL", "target", 253021, "Argus_aura_253021",  1, .5, 0, true, false, L["免疫打断"], "all", "TOPLEFT", 345, -120) -- 宿命
T.CreateAuras(options, "HARMFUL", 252729, "Argus_auras_252729", 0, 1, 1, true, false, "all", "TOPLEFT", 345, -155) -- 宇宙射线
T.CreateAuras(options, "HARMFUL", 252616, "Argus_auras_252616", 1, 0, .5, true, false, "all", "TOPLEFT", 345, -190) -- 宇宙道标
T.CreateAura(options, "HARMFUL", "player", 252634, "Argus_aura_252634",  1, 0, 0, true, true, "", "all", "TOPLEFT", 345, -225) -- 宇宙重击
T.CreateAura(options, "HELPFUL", "boss3", 256399, "Argus_aura_256399",  .5, .5, 0, true, true, "", "all", "TOPLEFT", 345, -260) -- 凋零之根
T.CreateAuras(options, "HARMFUL", 258039, "Argus_auras_258039", 1, 1, 1, true, true, "all", "TOPLEFT", 345, -295) -- 死亡之镰
T.CreateAura(options, "HARMFUL", "player", 257299, "Argus_aura_257299",  0, 1, 1, true, true, "", "all", "TOPLEFT", 345, -330) -- 怒火余烬
T.CreateAura(options, "HARMFUL", "player", 256899, "Argus_aura_256899",  .5, .5, .5, true, false, "", "all", "TOPLEFT", 345, -365) -- 灵魂引爆
T.CreateAura(options, "HARMFUL", "player", 257215, "Argus_aura_257215",  0, 1, 0, true, false, "", "all", "TOPLEFT", 345, -400) -- 泰坦造物

T.CreateLog(options, "SPELL_CAST_START", 256396, nil, 3, "Argus_logs_256396", 1, 0, 0, L["减伤"], 15, "TOPLEFT", 660, -50) -- 重组脉冲
T.CreateAuras(options, "HARMFUL", 258838, "Argus_auras_258838", 1, 1, 1, true, true, 16, "TOPLEFT", 660, -85) -- 碎魂之镰
T.CreateAura(options, "HARMFUL", "player", 257966, "Argus_aura_257966",  1, 0, 0, true, true, "", 16, "TOPLEFT", 660, -120) -- 萨格拉斯的判决
T.CreateAura(options, "HARMFUL", "player", 258000, "Argus_aura_258000",  1, 1, 0, true, true, "", 16, "TOPLEFT", 660, -155) -- 断裂羁绊
T.CreateBossMsg(options, "CHAT_MSG_RAID_BOSS_EMOTE", 258068, "258068", 3, "Argus_msg_258068", 1, 0, 0, L["分散"], 16, "TOPLEFT", 660, -190) -- 萨格拉斯的凝视
T.CreateAura(options, "HARMFUL", "player", 257931, "Argus_aura_257931",  1, 0, 1, true, false, "", 16, "TOPLEFT", 660, -225) -- 萨格拉斯的恐惧
T.CreateAura(options, "HARMFUL", "player", 257930, "Argus_aura_257930",  1, 0, .5, true, true, "", 16, "TOPLEFT", 660, -260) -- 毁灭之惧
T.CreateAura(options, "HARMFUL", "player", 257869, "Argus_aura_257869",  1, 0, 0, true, false, "", 16, "TOPLEFT", 660, -295) -- 萨格拉斯的狂怒
T.CreateAura(options, "HARMFUL", "player", 257911, "Argus_aura_257911",  1, .5, 0, true, true, "", 16, "TOPLEFT", 660, -330) -- 狂野怒意
T.CreateLog(options, "SPELL_CAST_START", 258030, nil, 3, "Argus_logs_258030", 1, 0, 0, L["快走开"], 16, "TOPLEFT", 660, -365) -- 天启领域 

-- sounds
T.CreateSoundFrame(options, 30, -470, nil, "11_248167", "COMBAT_LOG_EVENT_UNFILTERED", 248167, "SPELL_AURA_APPLIED", G.PlayerName)   -- 死亡之雾
T.CreateSoundFrame(options, 30, -500, nil, "11_248165", "COMBAT_LOG_EVENT_UNFILTERED", 248165, "SPELL_CAST_START") -- 死亡之锥
T.CreateSoundFrame(options, 30, -530, nil, "11_248317", "COMBAT_LOG_EVENT_UNFILTERED", 248317, "SPELL_CAST_START") -- 灵魂凋零宝珠
T.CreateSoundFrame(options, 30, -560, nil, "11_248396", "COMBAT_LOG_EVENT_UNFILTERED", 248396, "SPELL_AURA_APPLIED", G.PlayerName) -- 灵魂凋零
T.CreateSoundFrame(options, 160, -470, nil, "11_257296", "COMBAT_LOG_EVENT_UNFILTERED", 257296, "SPELL_CAST_START") -- 痛苦之怒
T.CreateSoundFrame(options, 160, -500, nil, "11_248499", "COMBAT_LOG_EVENT_UNFILTERED", 248499, "SPELL_CAST_START") -- 巨镰横扫
T.CreateSoundFrame(options, 160, -530, nil, "11_255594", "COMBAT_LOG_EVENT_UNFILTERED", 255594, "SPELL_CAST_START") -- 海天之力
T.CreateSoundFrame(options, 160, -560, nil, "11_258646", "COMBAT_LOG_EVENT_UNFILTERED", 258646, "SPELL_AURA_APPLIED") -- 天空之赐
T.CreateSoundFrame(options, 290, -470, nil, "11_258647", "COMBAT_LOG_EVENT_UNFILTERED", 258647, "SPELL_AURA_APPLIED") -- 海洋之赐
T.CreateSoundFrame(options, 290, -500, nil, "11_250669", "COMBAT_LOG_EVENT_UNFILTERED", 250669, "SPELL_AURA_APPLIED", G.PlayerName) -- 灵魂爆发
T.CreateSoundFrame(options, 290, -530, nil, "11_251570", "COMBAT_LOG_EVENT_UNFILTERED", 251570, "SPELL_AURA_APPLIED", G.PlayerName) -- 灵魂炸弹
T.CreateSoundFrame(options, 290, -560, nil, "11_255839", "COMBAT_LOG_EVENT_UNFILTERED", 255839, "SPELL_CAST_SUCCESS") -- 湮灭刀锋
T.CreateSoundFrame(options, 420, -470, nil, "11_255199", "COMBAT_LOG_EVENT_UNFILTERED", 255199, "SPELL_AURA_APPLIED", G.PlayerName) -- 阿格拉玛的化身
T.CreateSoundFrame(options, 420, -500, nil, "11_252729", "COMBAT_LOG_EVENT_UNFILTERED", 252729, "SPELL_AURA_APPLIED", G.PlayerName) -- 宇宙射线
T.CreateSoundFrame(options, 420, -530, nil, "11_252616", "COMBAT_LOG_EVENT_UNFILTERED", 252616, "SPELL_CAST_START") -- 宇宙道标
T.CreateSoundFrame(options, 420, -560, nil, "11_258039", "COMBAT_LOG_EVENT_UNFILTERED", 258039, "SPELL_CAST_START") -- 死亡之镰
T.CreateSoundFrame(options, 550, -470, nil, "11_256388", "COMBAT_LOG_EVENT_UNFILTERED", 256388, "SPELL_CAST_SUCCESS")   -- 初始化序列H
T.CreateSoundFrame(options, 550, -500, nil, "11_256396", "COMBAT_LOG_EVENT_UNFILTERED", 256396, "SPELL_CAST_START") -- 重组脉冲
T.CreateSoundFrame(options, 550, -530, nil, "11_257215", "COMBAT_LOG_EVENT_UNFILTERED", 257215, "SPELL_AURA_APPLIED", G.PlayerName)   -- 泰坦造物
T.CreateSoundFrame(options, 550, -560, nil, "11_258838", "COMBAT_LOG_EVENT_UNFILTERED", 258838, "SPELL_CAST_START") -- 碎魂之镰
T.CreateSoundFrame(options, 680, -470, nil, "11_257966", "COMBAT_LOG_EVENT_UNFILTERED", 257966, "SPELL_AURA_APPLIED", G.PlayerName)   -- 萨格拉斯的判决
T.CreateSoundFrame(options, 680, -500, nil, "11_258000", "COMBAT_LOG_EVENT_UNFILTERED", 258000, "SPELL_AURA_APPLIED", G.PlayerName)   -- 断裂羁绊
T.CreateSoundFrame(options, 680, -530, nil, "11_258068", "CHAT_MSG_RAID_BOSS_EMOTE", 258068)   -- 萨格拉斯的凝视
T.CreateSoundFrame(options, 680, -560, nil, "11_257931", "COMBAT_LOG_EVENT_UNFILTERED", 257931, "SPELL_AURA_APPLIED", G.PlayerName)   -- 萨格拉斯的恐惧
T.CreateSoundFrame(options, 810, -470, nil, "11_257869", "COMBAT_LOG_EVENT_UNFILTERED", 257869, "SPELL_AURA_APPLIED", G.PlayerName)   -- 萨格拉斯的狂怒
T.CreateSoundFrame(options, 810, -500, nil, "11_258029", "COMBAT_LOG_EVENT_UNFILTERED", 258029, "SPELL_CAST_SUCCESS")   -- 初始化序列M
T.CreateSoundFrame(options, 810, -530, nil, "11_258030", "COMBAT_LOG_EVENT_UNFILTERED", 258030, "SPELL_CAST_START")   -- 天启领域

-- health
hp_range = {
	All = {
		{ ul = 73, ll = 70, tip = L["阶段转换"]},
		{ ul = 43, ll = 40, tip = L["阶段转换"]},
	},
}

T.CreateHPAlertframe(options, 2092, "124828", "boss_2031", "boss1", "124828", hp_range, 30, -630)

-- power
pp_range = {
	{ ul = 100, ll = 70, tip = L["能量"]},
}

T.CreatePPAlertframe(options, 2092, "124828", "boss_2031", "boss1", "124828", pp_range, 30, -660)

-- hl icon on raid
T.Create_HL_EventFrame(options, "hl_248396_d", 30, -690, nil, "COMBAT_LOG_EVENT_UNFILTERED", 248396, "SPELL_AURA_APPLIED")   -- 灵魂凋零
T.Create_HL_EventFrame(options, "hl_250669_d", 30, -720, nil, "COMBAT_LOG_EVENT_UNFILTERED", 250669, "SPELL_AURA_APPLIED")   -- 灵魂爆发
T.Create_HL_EventFrame(options, "hl_251570_d", 30, -750, nil, "COMBAT_LOG_EVENT_UNFILTERED", 251570, "SPELL_AURA_APPLIED")   -- 灵魂炸弹
T.Create_HL_EventFrame(options, "hl_252729_d", 230, -630, nil, "COMBAT_LOG_EVENT_UNFILTERED", 252729, "SPELL_AURA_APPLIED")   -- 宇宙射线

-- Nameplate buffs
T.Create_PlateAlerts_Options(options, "vulnerability", 230, -660)
T.Create_PlateAlerts_Options(options, 255496, 230, -690) -- 宇宙之剑
T.Create_PlateAlerts_Options(options, 255935, 230, -720) -- 宇宙之力
T.Create_PlateAlerts_Options(options, 255478, 230, -750) -- 永恒之刃

-- chat msg
T.Create_ChatMsgSpells_Options(options, 258646, 430, -630) -- 天空之赐
T.Create_ChatMsgSpells_Options(options, 258647, 430, -660) -- 海洋之赐
T.Create_ChatMsgSpells_Options(options, 250669, 430, -690) -- 灵魂爆发
T.Create_ChatMsgSpells_Options(options, 251570, 430, -720) -- 灵魂炸弹
T.Create_ChatMsgSpells_Options(options, 252729, 430, -750) -- 宇宙射线
T.Create_ChatMsgSpells_Options(options, 252616, 630, -630) -- 宇宙道标

-- big text
local events_1 = {"COMBAT_LOG_EVENT_UNFILTERED"}
local text_1 = T.CreateBigText(options, 630, -660, L["灵魂凋零计数"], "Argus_text_1", 1, 1, 0, "all", events_1)

text_1.update_onevent = function(self, event, ...)
	if event == "COMBAT_LOG_EVENT_UNFILTERED" then
		local timestamp, type, hideCaster, sourceGUID, sourceName, sourceFlags, sourceRaidFlags, destGUID, destName, destFlags, destRaidFlags, spellID, spellName = ...
		if type == "SPELL_CAST_START" and spellID == 248317 then          
			self.index = 0
		elseif type == "SPELL_AURA_APPLIED" and spellID == 248396 and self.index then
			self.index = self.index +1
			if destName == G.PlayerName then
				self.str = spellName.." |cffFF0000( "..self.index.." )|r"
				self.ind = self.index
				self.exp = time() + 8
				self:Show()
			end
		elseif type == "SPELL_AURA_REMOVED" and spellID == 248396 and destName == G.PlayerName then
			self:Hide()
		end
	end
end

text_1.update_onframe = function(self)
	self.remain = self.exp - time()
	if self.remain > 0 then
		self.text:SetText(self.str.." "..T.FormatTime(self.remain))
		local remaining = math.floor(self.remain)
		if remaining < 6 and (not self.previous or self.previous ~= remaining) then
			SendChatMessage("{rt8} ("..self.ind..self.ind..self.ind..") "..remaining.."s")
            self.previous = remaining
		end
	else
		self:Hide()
	end
end

local events_2 = {"COMBAT_LOG_EVENT_UNFILTERED"}
local text_2 = T.CreateBigText(options, 630, -690, L["护送提醒"], "Argus_text_2", 0, 1, 1, 16, events_2)

text_2.update_onevent = function(self, event, ...)
    if event == "COMBAT_LOG_EVENT_UNFILTERED" then
        local timestamp, type, hideCaster, sourceGUID, sourceName, sourceFlags, sourceRaidFlags, destGUID, destName, destFlags, destRaidFlags, spellID = ...   
        if type == "SPELL_AURA_APPLIED" and (spellID == 248396 or spellID == 250669 or spellID == 257966) then
            local debuff = GetSpellInfo(257931) -- 萨格拉斯的恐惧
            if UnitDebuff(destName, debuff) then
				self.text:SetText(T.ColorName(destName)..L["需要护送"])
                self.exp = time() + 5
				self:Show()
            end
        end
    end
end

text_2.update_onframe = function(self)
	self.remain = self.exp - time()
	if self.remain <= 0 then
		self:Hide()
	end
end

local spell_cd = CreateFrame("Frame")
spell_cd:RegisterEvent("ENCOUNTER_START")
spell_cd:RegisterEvent("ENCOUNTER_END")
spell_cd:RegisterEvent("PLAYER_ENTERING_WORLD")
spell_cd:Hide()

spell_cd.t = 0
spell_cd.stage = 1
spell_cd.gaze_count = 1
spell_cd.gaze_p3 = {33.4, 75, 70, 53, 53}
spell_cd.sent_count = 1
spell_cd.sent_p3 = {67.4, 57.0, 60.0, 53, 53}

spell_cd:SetScript("OnEvent", function(self, event, ...)
	if event == "ENCOUNTER_START" then
		local encounterID, encounterName, difficultyID, groupSize = ...
		if encounterID == 2092 and difficultyID == 16 then
			self:RegisterEvent("CHAT_MSG_RAID_BOSS_EMOTE")
			self:RegisterEvent("CHAT_MSG_MONSTER_YELL")
			self:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
			self.stage = 1
			
			self.gaze_count = 1
			self.gaze_exp = time() + 8.5

			self:Show()
		end
	elseif event == "ENCOUNTER_END" then
		local encounterID, encounterName, difficultyID, groupSize = ...
		if encounterID == 2092 and difficultyID == 16 then
			self:UnregisterEvent("CHAT_MSG_RAID_BOSS_EMOTE")
			self:UnregisterEvent("CHAT_MSG_MONSTER_YELL")
			self:UnregisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
			
			self.gaze_exp = 0
			self.sent_exp = 0
			
			self:Hide()
		end
	elseif event == "PLAYER_ENTERING_WORLD" then
		local guid = UnitGUID("boss1")
		if guid then
			local NPC_ID = select(6, strsplit("-", UnitGUID("boss1")))
			local difficultyID = select(3, GetInstanceInfo())
			if NPC_ID == "124828" and difficultyID == 16 then
				self:RegisterEvent("CHAT_MSG_RAID_BOSS_EMOTE")
				self:RegisterEvent("CHAT_MSG_MONSTER_YELL")
				self:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
				self.stage = 1
				
				self.gaze_count = 1	
				self.gaze_exp = time() + 8.5
				
				self:Show()
			end
		end
		self:UnregisterEvent("PLAYER_ENTERING_WORLD")
	elseif event == "CHAT_MSG_MONSTER_YELL" then
		local msg = ...
		if msg:find(L["阿古斯P2"]) then -- p1转p2
			self.gaze_exp = 0
		end
	elseif event == "COMBAT_LOG_EVENT_UNFILTERED" then
		local event_type = select(2, ...)
		local spell_id = select(12, ...)
		if event_type == "SPELL_CAST_START" then
			if spell_id == 255648 then -- p2开始
				self.stage = 2
				
				self.gaze_count = 1			
				self.gaze_exp = time() + 26.3
			elseif spell_id == 256544 then -- p3开始
				self.stage = 3
				self.gaze_count = 1
				self.gaze_exp = time() + 33.4
				
				self.sent_count = 1
				self.sent_exp = time() + self.sent_p3[self.sent_count]
			elseif spell_id == 256542 then -- 收割灵魂 p2转p3
				self.gaze_exp = 0
			end			
		end
	elseif event == "CHAT_MSG_RAID_BOSS_EMOTE" then
		local msg = ...
		if msg:find("258068") then -- 萨格拉斯的凝视
			self.gaze_count = self.gaze_count + 1
			if self.stage == 1 then
				self.gaze_exp = time() + 35.1
			elseif self.stage == 2 then
				self.gaze_exp = time() + 60.5
			elseif self.stage == 3 then
				self.gaze_exp = time() + self.gaze_p3[self.gaze_count]
			end
		end
    end
end)

spell_cd:SetScript("OnUpdate", function(self, e)
	self.t = self.t + e
	if self.t > .2 then
		-- 萨格拉斯的凝视
		self.gaze_remain = self.gaze_exp - time()
		if self.gaze_remain >0 and self.gaze_remain < 6 then		
			local gaze_remaining = math.floor(self.gaze_remain)	
			if not self.gaze_previous or self.gaze_previous ~= gaze_remaining then
				SendAddonMessage("arm_gaze", self.gaze_count.."_"..gaze_remaining, "RAID")
				self.gaze_previous = gaze_remaining
			end
		end
		
		-- 萨格拉斯的判决
		self.sent_remain = self.sent_exp - time()
		if self.sent_remain == 0 then
			self.sent_count = self.sent_count + 1
			if self.sent_p3[self.sent_count] then
				self.sent_exp = time() + self.sent_p3[self.sent_count]
			end
		elseif self.sent_remain > 0 and self.sent_remain < 6 then
			local sent_remaining = math.floor(self.sent_remain)	
			if not self.sent_previous or self.sent_previous ~= sent_remaining then
				SendAddonMessage("arm_sent", self.sent_count.."_"..sent_remaining, "RAID")
				self.sent_previous = sent_remaining
			end
		end
		self.t = 0
	end
end)

local events_3 = {"COMBAT_LOG_EVENT_UNFILTERED", "CHAT_MSG_ADDON", "CHAT_MSG_RAID_BOSS_EMOTE"}
local text_3 = T.CreateBigText(options, 630, -720, L["萨格拉斯的凝视"], "Argus_text_3", 1, 0, 0, 16, events_3)

text_3.update_onevent = function(self, event, ...)
    if event == "COMBAT_LOG_EVENT_UNFILTERED" then
        local timestamp, type, hideCaster, sourceGUID, sourceName, sourceFlags, sourceRaidFlags, destGUID, destName, destFlags, destRaidFlags, spellID = ...   
        if type == "SPELL_AURA_APPLIED" and destName == G.PlayerName then
			if spellID == 257931 then
				self.text:SetText(L["朋友圈"])
				self.exp = time() + 5
				self:Show()
			elseif spellID == 257869 then
				self.text:SetText(L["孤儿圈"])
				self.exp = time() + 5
				self:Show()
			end
        end
	elseif event == "CHAT_MSG_ADDON" then
		local prefix, message, channel, sender = ...
			
		if prefix == "arm_gaze" then
			local count, cd = strsplit("_", message)
			self.text:SetText(L["分散"].." ("..count..") "..cd.."s")
			self.exp = time() + 1.5
			self:Show()
		end
	elseif event == "CHAT_MSG_RAID_BOSS_EMOTE" then
		local msg = ...
		if msg:find("258068") then -- 萨格拉斯的凝视
			self.text:SetText(L["萨格拉斯的凝视"])
			self.exp = time() + 4
			self:Show()
		end
	end
end

text_3.update_onframe = function(self)
	self.remain = self.exp - time()
	if self.remain <= 0 then
		self:Hide()
	end
end

local events_4 = {"CHAT_MSG_ADDON"}
local text_4 = T.CreateBigText(options, 630, -750, L["萨格拉斯的判决"], "Argus_text_4", 1, 1, 0, 16, events_4)

text_4.update_onevent = function(self, event, ...)
    if event == "CHAT_MSG_ADDON" then
		local prefix, message, channel, sender = ...
			
		if prefix == "arm_sent" then
			local count, cd = strsplit("_", message)
			self.text:SetText(L["锁链"].." ("..count..") "..cd.."s")
			self.exp = time() + 1.5
			self:Show()
		end
	end
end

text_4.update_onframe = function(self)
	self.remain = self.exp - time()
	if self.remain <= 0 then
		self:Hide()
	end
end


-- 灵魂凋零/灵魂爆发/灵魂炸弹/萨格拉斯的判决
local DebuffBars = CreateFrame("Frame", G.addon_name.."Argus_DebuffBars", G.FrameHolder)
DebuffBars:SetSize(220, 180)

DebuffBars.movingname = string.format(L["阿古斯重要点名监视"])
DebuffBars.point = { a1 = "TOPLEFT", parent = "UIParent", a2 = "CENTER", x = 300, y = 450 }
T.CreateDragFrame(DebuffBars)

local Bars = {}
local function LineUpBars()
	local t = {}
	for unit, bar in pairs(Bars) do
		if bar:IsShown() then
			table.insert(t, bar)
		else
			bar:ClearAllPoints()
		end
	end
	
	if #t > 0 then
		table.sort(t, function(a,b) return a.exp < b.exp end)
		for i = 1, #t do	
			t[i]:SetPoint("TOP", DebuffBars, "TOP", 0, -45*(i-1))
		end
	end
end

local Debuffs = {
	[GetSpellInfo(248396)] = "_1", 
	[GetSpellInfo(250669)] = "_2", 
	[GetSpellInfo(251570)] = "_3", 
	[GetSpellInfo(257966)] = "_4",
}

local debuff_1 = GetSpellInfo(257931) -- 萨格拉斯的恐惧
local debuff_2 = GetSpellInfo(257869) -- 萨格拉斯的狂怒

local function CreateDebuffBar()
	local f = T.createStatusbar(DebuffBars, "ARTWORK", 40, 220, 1, 1, 1, 1)
	f:Hide()
	f.t = 0
	T.createborder(f)
	
	f.icon = f:CreateTexture(nil, "OVERLAY")	
	f.icon:SetSize(40, 40)
	f.icon:SetPoint("RIGHT", f, "LEFT", -5, 0)
	f.icon:SetTexCoord( .1, .9, .1, .9)
	T.CreateIconBD(f, f.icon)

	f.name = T.createtext(f, "OVERLAY", 18, "OUTLINE", "LEFT")
	f.name:SetPoint("LEFT", f, "LEFT", 10, 0)
	
	f.tag = T.createtext(f, "OVERLAY", 18, "OUTLINE", "LEFT")
	f.tag:SetPoint("LEFT", f.name, "RIGHT", 10, 0)
	
	f.dur = T.createtext(f, "OVERLAY", 18, "OUTLINE", "RIGHT")
	f.dur:SetPoint("RIGHT", f, "RIGHT", -10, 0)
	
	f.spell_1 = CreateFrame("Frame", nil, f)
	f.spell_1:SetSize(40, 40)
	f.spell_1:SetPoint("LEFT", f, "RIGHT", 5, 0)
	T.createborder(f.spell_1)
	
	f.spell_1.cd = CreateFrame("Cooldown", nil, f.spell_1, "CooldownFrameTemplate")
	f.spell_1.cd:SetAllPoints(f.spell_1)
	
	f.spell_1.icon = f.spell_1:CreateTexture(nil, "OVERLAY")
	f.spell_1.icon:SetAllPoints(f.spell_1)
	f.spell_1.icon:SetTexCoord( .1, .9, .1, .9)
	
	f.spell_2 = CreateFrame("Frame", nil, f)
	f.spell_2:SetSize(40, 40)
	f.spell_2:SetPoint("LEFT", f.spell_1, "RIGHT", 5, 0)
	T.createborder(f.spell_2)
	
	f.spell_2.cd = CreateFrame("Cooldown", nil, f.spell_2, "CooldownFrameTemplate")
	f.spell_2.cd:SetAllPoints(f.spell_2)
	
	f.spell_2.icon = f.spell_1:CreateTexture(nil, "OVERLAY")
	f.spell_2.icon:SetAllPoints(f.spell_2)
	f.spell_2.icon:SetTexCoord( .1, .9, .1, .9)
	
	f:SetScript("OnShow", function()
		LineUpBars()
	end)
	
	f:SetScript("OnHide", function()
		LineUpBars()
	end)
	
	return f
end

local function UpdateDebuffBar(f, icon, dur, exp, name, r, g, b)
	
	f:SetMinMaxValues(0, dur)
	f.icon:SetTexture(icon)
	f.name:SetText(T.ColorName(name))
	f.exp = exp
	
	f.spell_1:Hide()
	f.spell_2:Hide()
	local spell_num = 0
	if AntorusRaidMods['RaidRoster'][name] then
		for spellid, info in pairs(AntorusRaidMods['RaidRoster'][name]) do
			spell_num = spell_num + 1
			if spell_num == 1 then
				f.spell_1.icon:SetTexture(select(3, GetSpellInfo(spellid)))
				if info.start and info.start + info.dur > GetTime() then
					f.spell_1.cd:SetCooldown(info.start, info.dur)
				end
				f.spell_1:Show()
			elseif spell_num == 2 then
				f.spell_2.icon:SetTexture(select(3, GetSpellInfo(spellid)))
				if info.start and info.start + info.dur > GetTime() then
					f.spell_2.cd:SetCooldown(info.start, info.dur)
				end
				f.spell_2:Show()
			end
		end
	end
	
	f:SetScript("OnUpdate", function(f, e)
		f.t = f.t - e
		if f.t <= 0 then
			local remain = exp - GetTime()
			if remain > 0 then
				f.dur:SetText(format("%d", remain))
				f:SetValue(dur-remain)
			else
				f:Hide()
			end
			f.t = .1
		end
	end)
end

DebuffBars.Visibility = function(event, ...)
	DebuffBars.show = false
	
	if DebuffBars.enable then
		if event == "ENCOUNTER_START" then
			local encounterID, encounterName, difficultyID, groupSize = ...
			if encounterID == 2092 then
				DebuffBars.show = true
			end
		elseif event == "ENCOUNTER_END" then
			DebuffBars.show = false
		else
			local guid = UnitGUID("boss1")
			if guid then
				local NPC_ID = select(6, strsplit("-", UnitGUID("boss1")))
				if NPC_ID == "124828" then
					DebuffBars.show = true
				end
			end
		end
	end
	
	if DebuffBars.show then
		DebuffBars:Show()
		DebuffBars:RegisterEvent("UNIT_AURA")
	else
		DebuffBars:Hide()
		DebuffBars:UnregisterEvent("UNIT_AURA")
	end
end

DebuffBars.Edit = function()
	if not ARM_CDB["General"]["disable_all"] and ARM_CDB["BossMod"]["Argus_Debuff_Alert"] then
		DebuffBars:RegisterEvent("ENCOUNTER_START")
		DebuffBars:RegisterEvent("ENCOUNTER_END")
		DebuffBars.enable = true
	else
		DebuffBars:UnregisterEvent("ENCOUNTER_START")
		DebuffBars:UnregisterEvent("ENCOUNTER_END")
		DebuffBars.enable = false
	end
	DebuffBars.Visibility()
end

DebuffBars:RegisterEvent("PLAYER_ENTERING_WORLD")
DebuffBars:SetScript("OnEvent", function(self, event, ...)
	if event == "PLAYER_ENTERING_WORLD" then
		DebuffBars.Edit()
		DebuffBars:UnregisterEvent("PLAYER_ENTERING_WORLD")
	elseif event == "UNIT_AURA" then
		local unit = ...
		if unit:find("raid") then
			local player = UnitName(unit)
			for debuff, v in pairs(Debuffs) do
				if UnitDebuff(unit, debuff) then
					local name, rank, icon, count, debuffType, duration, expirationTime = UnitDebuff(unit, debuff)
					if not Bars[unit..v] then
						Bars[unit..v] = CreateDebuffBar()
					end
					
					UpdateDebuffBar(Bars[unit..v], icon, duration, expirationTime, player, 1, 1, 1)
					
					if UnitDebuff(unit, debuff_1) then -- 萨格拉斯的恐惧
						Bars[unit..v]:SetStatusBarColor(.6, .4, 1)
						Bars[unit..v].tag:SetText(L["朋友圈"])
					elseif UnitDebuff(unit, debuff_1) then -- 萨格拉斯的狂怒
						Bars[unit..v]:SetStatusBarColor(1, .5, .1)
						Bars[unit..v].tag:SetText(L["孤儿圈"])
					else
						Bars[unit..v]:SetStatusBarColor(.5, .5, .5)
						Bars[unit..v].tag:SetText("")
					end
					
					Bars[unit..v]:Show()
				elseif Bars[unit..v] and Bars[unit..v]:IsShown() then			
					Bars[unit..v]:Hide()
				end
			end
		end
	elseif event == "ENCOUNTER_START" or event == "ENCOUNTER_END" then
		DebuffBars.Visibility(event, ...)
	end
end)

local bu = T.Create_BossMod_Options(options, L["阿古斯重要点名监视"], "Argus_Debuff_Alert", 830, -630)
bu.apply = DebuffBars.Edit
table.insert(G.RM_Frames, DebuffBars)

-- 树和卡兹格罗斯的能量
local Frame = CreateFrame("Frame", G.addon_name.."Argus_Alert", G.FrameHolder)
Frame:SetSize(150, 60)

Frame.movingname = string.format(L["提示框"] , EJ_GetEncounterInfo(2031))
Frame.point = { a1 = "TOPLEFT", parent = "UIParent", a2 = "CENTER", x = 300, y = -270 }
T.CreateDragFrame(Frame)
T.createborder(Frame)

Frame.treeicon = Frame:CreateTexture(nil, "OVERLAY")	
Frame.treeicon:SetSize(28, 28)
Frame.treeicon:SetPoint("TOPLEFT", Frame, "TOPLEFT", 0, 0)
Frame.treeicon:SetTexCoord( .1, .9, .1, .9)
Frame.treeicon:SetTexture(463540) -- 绿色树叶

Frame.treeiconbd = Frame:CreateTexture(nil, "BORDER")
Frame.treeiconbd:SetColorTexture(0, 0, 0)
Frame.treeiconbd:SetPoint("TOPLEFT", Frame.treeicon, "TOPLEFT", -1, 1)
Frame.treeiconbd:SetPoint("BOTTOMRIGHT", Frame.treeicon, "BOTTOMRIGHT", 1, -1)

Frame.treeicon_stack = T.createtext(Frame, "OVERLAY", 16, "OUTLINE", "CENTER")
Frame.treeicon_stack:SetPoint("CENTER", Frame.treeicon, "CENTER", 0, 0)

Frame.treetext = T.createtext(Frame, "OVERLAY", 16, "OUTLINE", "CENTER")
Frame.treetext:SetPoint("LEFT", Frame.treeicon, "RIGHT", 10, 0)

Frame.kzgicon = Frame:CreateTexture(nil, "OVERLAY")	
Frame.kzgicon:SetSize(28, 28)
Frame.kzgicon:SetPoint("TOPLEFT", Frame, "TOPLEFT", 0, -32)
Frame.kzgicon:SetTexCoord( .1, .9, .1, .9)
Frame.kzgicon:SetTexture(select(3, GetSpellInfo(257215))) -- 泰坦造物

Frame.kzgtext = T.createtext(Frame, "OVERLAY", 16, "OUTLINE", "CENTER")
Frame.kzgtext:SetPoint("LEFT", Frame.kzgicon, "RIGHT", 10, 0)

local function Reset()
	Frame.treeicon:SetTexture(463540)
	Frame.treeicon:SetDesaturated(false)
	Frame.treeicon_stack:SetText("")
	Frame.treetext:SetText("")
	Frame.kzgtext:SetText("")
end

local function GetUnitHealthPerc(unit)
	local max = UnitHealthMax(unit)
	local cur = UnitHealth(unit)
	local perc = cur/max*100

	return perc
end

local function UpdateStats(unit)
	if (unit == "boss1" or not unit) then
		if GetUnitHealthPerc("boss1") < 40 and Frame.show then
			Frame:Show()
		else
			Frame:Hide()
		end
	elseif (unit == "boss3" or not unit) and Frame:IsShown() then
		local pp = UnitPower("boss3")
		local hp = UnitHealth("boss3")
		if pp > 0 then
			Frame.treetext:SetText(string.format(L["树能量"], pp))
			Frame.treeicon:SetTexture(463540)
			Frame.treeicon:SetDesaturated(false)
			Frame.treeicon_stack:SetText("")
		else
			if hp > 0 then
				if UnitBuff("boss3", GetSpellInfo(256399)) then -- 有凋零之根
					Frame.treetext:SetText(string.format("%d", GetUnitHealthPerc("boss3")))
					Frame.treeicon:SetTexture(960680)
					Frame.treeicon:SetDesaturated(false)
					Frame.treeicon_stack:SetText(select(4, UnitBuff("boss3", GetSpellInfo(256399))))
				else
					Frame.treetext:SetText(string.format("%d", GetUnitHealthPerc("boss3")))
					Frame.treeicon:SetTexture(463540)
					Frame.treeicon:SetDesaturated(true)
					Frame.treeicon_stack:SetText("")
				end
			else
				Frame.treetext:SetText(L["树死亡"])
				Frame.treeicon:SetTexture(132094)
				Frame.treeicon:SetDesaturated(false)
				Frame.treeicon_stack:SetText("")
			end
		end
	elseif (unit == "boss2" or not unit) and Frame:IsShown() then
		local pp = UnitPower("boss2")
		Frame.kzgtext:SetText(string.format(L["卡兹格罗斯能量"], pp))			
	end
end

local function Update(event, ...)
	if event == "UNIT_HEALTH_FREQUENT" or event == "UNIT_POWER_FREQUENT" or event == "UNIT_AURA" then
		local unit = ...
		UpdateStats(unit)
	elseif event == "ENCOUNTER_START" or event == "ENCOUNTER_END" then
		Reset()
	else
		UpdateStats()
	end
end

Frame.Visibility = function(event, ...)
	Frame.show = false
	
	if Frame.enable then
		if event == "ENCOUNTER_START" then
			local encounterID, encounterName, difficultyID, groupSize = ...
			if encounterID == 2092 then
				Frame.show = true
			end
		elseif event == "ENCOUNTER_END" then
			Frame.show = false
		else
			local guid = UnitGUID("boss1")
			if guid then
				local NPC_ID = select(6, strsplit("-", UnitGUID("boss1")))
				if NPC_ID == "124828" then
					Frame.show = true
				end
			end
		end
	end
	
	if Frame.show then
		Frame:RegisterEvent("UNIT_POWER_FREQUENT")
		Frame:RegisterEvent("UNIT_HEALTH_FREQUENT")
		Frame:RegisterEvent("UNIT_AURA")
	else
		Frame:Hide()
		Frame:UnregisterEvent("UNIT_POWER_FREQUENT")
		Frame:UnregisterEvent("UNIT_HEALTH_FREQUENT")
		Frame:UnregisterEvent("UNIT_AURA")
	end
	
	Update(event)
end

Frame.Edit = function()
	if not ARM_CDB["General"]["disable_all"] and ARM_CDB["BossMod"]["Argus_Alert"] then
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
	elseif event == "UNIT_POWER_FREQUENT" then
		Update(event, ...)
	elseif event == "UNIT_HEALTH_FREQUENT" then
		Update(event, ...)
	elseif event == "UNIT_AURA" then
		Update(event, ...)
	elseif event == "ENCOUNTER_START" or event == "ENCOUNTER_END" then
		Frame.Visibility(event, ...)
	end
end)

Frame.StartTest = function()

	Frame.treetext:SetText(string.format(L["树能量"], 50))
	Frame.treeicon:SetTexture(463540)
	Frame.treeicon:SetDesaturated(false)
	Frame.treeicon_stack:SetText("")
	Frame.kzgtext:SetText(string.format(L["卡兹格罗斯能量"], 25))
	
	Frame:Show()
	
	C_Timer.After(10, function()
		Frame:Hide()
		Reset()
	end)
end
G.Test["bossmod_11"] = Frame

local bu = T.Create_BossMod_Options(options, L["技能提示"], "Argus_Alert", 830, -660)
bu.apply = Frame.Edit
table.insert(G.RM_Frames, Frame)
