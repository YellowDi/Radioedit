local T, C, L, G = unpack(select(2, ...))

local addon_name = G.addon_name
local options = T.CreateOptions(EJ_GetEncounterInfo(1997), G.gui, -20, -390, -550)

-- icons
T.CreateAuras(options, "HARMFUL", 244892, "HighCommand_auras_244892", 1, 1, 1, true, false, "all", "TOPLEFT", 30, -50) -- 弱点攻击
T.CreateAura(options, "HARMFUL", "player", 257974, "HighCommand_aura_257974",  0, 1, 0, true, true, "", "all", "TOPLEFT", 30, -85)  -- 混乱脉冲
T.CreateAura(options, "HARMFUL", "player", 244737, "HighCommand_aura_244737",  0, 1, 1, true, false, L["减伤"], 16, "TOPLEFT", 30, -120)  -- 震荡手雷
T.CreateAura(options, "HARMFUL", "player", 244748, "HighCommand_aura_244748",  0, 1, 1, true, false, "", 16, "TOPLEFT", 30, -155) -- 震晕
T.CreateAura(options, "HARMFUL", "player", 253290, "HighCommand_aura_253290",  1, 1, 0, true, true, "", "all", "TOPLEFT", 30, -190) -- 熵能爆裂		
T.CreateAura(options, "HARMFUL", "player", 244910, "HighCommand_aura_244910",  1, 1, 1, false, false, "", "all", "TOPLEFT", 30, -225)  -- 邪能护盾
T.CreateAura(options, "HARMFUL", "player", 244172, "HighCommand_aura_244172",  1, 1, 0, false, true, "", "all", "TOPLEFT", 30, -260)  -- 灵能突袭
T.CreateLog(options, "SPELL_CAST_START", 244625, nil, 5, "HighCommand_logs_244625", 1, 0, 0, "", "all", "TOPLEFT", 30, -295) -- 齐射
T.CreateLog(options, "SPELL_DAMAGE", 253039, "player", 2, "HighCommand_logs_253039", 1, 0.5, 0, L["快走开"], "all", "TOPLEFT", 30, -330) -- 恶魔冲锋

-- sounds
T.CreateSoundFrame(options, 30, -420, nil, "3_244722", "COMBAT_LOG_EVENT_UNFILTERED", 244722, "SPELL_CAST_START") --震荡手雷
T.CreateSoundFrame(options, 30, -450, nil, "3_244892", "COMBAT_LOG_EVENT_UNFILTERED", 244892, "SPELL_CAST_SUCCESS") --弱点攻击
T.CreateSoundFrame(options, 30, -480, nil, "3_244625", "COMBAT_LOG_EVENT_UNFILTERED", 244625, "SPELL_CAST_START") --齐射
T.CreateSoundFrame(options, 30, -510, nil, "3_244947", "COMBAT_LOG_EVENT_UNFILTERED", 244947, "SPELL_SUMMON") --召唤防御者
T.CreateSoundFrame(options, 230, -420, nil, "3_245304", "UNIT_SPELLCAST_SUCCEEDED", 245304) --熵能地雷
T.CreateSoundFrame(options, 230, -450, nil, "3_246505", "COMBAT_LOG_EVENT_UNFILTERED", 246505, "SPELL_CAST_START") --炎爆术
T.CreateSoundFrame(options, 230, -480, nil, "3_253039", "COMBAT_LOG_EVENT_UNFILTERED", 253039, "SPELL_DAMAGE", G.PlayerName) -- 恶魔冲锋
T.CreateSoundFrame(options, 230, -510, nil, "3_244910", "COMBAT_LOG_EVENT_UNFILTERED", 244910, "SPELL_AURA_APPLIED", G.PlayerName) --邪能护盾
T.CreateSoundFrame(options, 430, -420, nil, "3_245227", "COMBAT_LOG_EVENT_UNFILTERED", 245227, "SPELL_CAST_START") --重夺指挥
T.CreateSoundFrame(options, 430, -450, nil, "3_254130", "COMBAT_LOG_EVENT_UNFILTERED", 254130, "SPELL_CAST_SUCCESS") --排除闯入者

-- hl icon on raid
T.Create_HL_EventFrame(options, "hl_244737_d", 30, -580, nil, "COMBAT_LOG_EVENT_UNFILTERED", 244737, "SPELL_AURA_APPLIED")    -- 震荡手雷 
T.Create_HL_EventFrame(options, "hl_244172_i", 30, -610, nil, "COMBAT_LOG_EVENT_UNFILTERED", 244172, "SPELL_AURA_APPLIED", true) -- 灵能突袭  

-- chat msg
T.Create_ChatMsgSpells_Options(options, 244737, 30, -640) -- 震荡手雷

-- 进仓提示
local f_index

local Frame = CreateFrame("Frame", G.addon_name.."HighCommand_Alert", G.FrameHolder)
Frame:SetSize(300, 30)

Frame.movingname = string.format(L["提示框"] , EJ_GetEncounterInfo(1997))
Frame.point = { a1 = "TOPLEFT", parent = "UIParent", a2 = "CENTER", x = 300, y = 200 }
T.CreateDragFrame(Frame)
T.createborder(Frame)

Frame.icon = Frame:CreateTexture(nil, "OVERLAY")	
Frame.icon:SetSize(30, 30)
Frame.icon:SetPoint("LEFT", Frame, "LEFT", 0, 0)
Frame.icon:SetTexCoord( .1, .9, .1, .9)
Frame.icon:SetTexture(select(3, GetSpellInfo(244172)))

Frame.iconbd = Frame:CreateTexture(nil, "BORDER")
Frame.iconbd:SetColorTexture(0, 0, 0)
Frame.iconbd:SetPoint("TOPLEFT", Frame.icon, "TOPLEFT", -1, 1)
Frame.iconbd:SetPoint("BOTTOMRIGHT", Frame.icon, "BOTTOMRIGHT", 1, -1)

Frame.index = T.createtext(Frame, "OVERLAY", 20, "OUTLINE", "LEFT")
Frame.index:SetPoint("LEFT", Frame.icon, "RIGHT", 10, 0)

Frame.name = T.createtext(Frame, "OVERLAY", 20, "OUTLINE", "LEFT")
Frame.name:SetPoint("LEFT", Frame.index, "RIGHT", 10, 0)

Frame.dur = T.createtext(Frame, "OVERLAY", 20, "OUTLINE", "LEFT")
Frame.dur:SetPoint("LEFT", Frame.name, "RIGHT", 10, 0)

Frame.t = 0
local function UpdateInfo(name, start)
	f_index = f_index + 1
	Frame.index:SetText("["..f_index.."]")
	Frame.name:SetText(T.ColorName(name))
	
	Frame:SetScript("OnUpdate", function(f, e)
		f.t = f.t - e
		if f.t <= 0 then
			local dur = T.FormatTime(time() - start)
			f.dur:SetText(dur)
			f.t = .3
		end
	end)
end

local function Reset()
	Frame.index:SetText("")
	Frame.name:SetText(L["无人"])
	Frame.dur:SetText("")
	Frame:SetScript("OnUpdate", nil)
end

Frame.Update = function(event, ...)
	if event == "COMBAT_LOG_EVENT_UNFILTERED" then
		local Time_stamp, Event_type, _, SourceGUID, SourceName, _, _, DestGUID, DestName, _, _, SpellID, SpellName = ...
		if Event_type == "SPELL_AURA_APPLIED" and SpellID == 244172 then
			UpdateInfo(DestName, Time_stamp)
		elseif Event_type == "SPELL_AURA_REMOVED" and SpellID == 244172 then
			Reset()
		end
	else
		f_index = 0
		
		local found = false
		for i = 1, 40 do
			local unit = "raid"..i
			local name = UnitName(unit)
			if name then
				local Debuff = GetSpellInfo(244172)
				if UnitDebuff(unit, Debuff) then
					UpdateInfo(name, time())
					found = true
				end
			end
		end
		if not found then
			Reset()
		end
	end
end

Frame.Visibility = function(event, ...)
	local show = false
	
	if Frame.enable then
		if event == "ENCOUNTER_START" then
			local encounterID, encounterName, difficultyID, groupSize = ...
			if encounterID == 2070 then
				show = true
			end
		elseif event == "ENCOUNTER_END" then
			show = false
		else
			local guid = UnitGUID("boss1")
			if guid then
				local NPC_ID = select(6, strsplit("-", UnitGUID("boss1")))
				if NPC_ID == "122367" then
					show = true
				end
			end
		end
	end
	
	if show then
		Frame:Show()
		Frame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
		Frame.Update()
	else
		Frame:Hide()	
		Frame:UnregisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
		Reset()
	end
end

Frame.Edit = function()
	if not ARM_CDB["General"]["disable_all"] and ARM_CDB["BossMod"]["HighCommand_Alert"] then
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
		Frame.Update(event, ...)
	elseif event == "ENCOUNTER_START" or event == "ENCOUNTER_END" then
		Frame.Visibility(event, ...)
	end
end)

Frame.StartTest = function()
	Frame.index:SetText("[1]")
	Frame.name:SetText(T.ColorName(G.PlayerName))
	Frame.dur:SetText("5s")
	Frame:Show()
	
	C_Timer.After(10, function()
		Frame:Hide()
	end)
end
G.Test["bossmod_3"] = Frame

local bu = T.Create_BossMod_Options(options, L["技能提示"], "HighCommand_Alert", 30, -670)
bu.apply = Frame.Edit
table.insert(G.RM_Frames, Frame)