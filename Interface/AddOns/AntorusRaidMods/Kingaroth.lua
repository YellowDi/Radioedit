local T, C, L, G = unpack(select(2, ...))

local addon_name = G.addon_name
local options = T.CreateOptions(EJ_GetEncounterInfo(2004), G.gui, -20, -390, -550)

-- icons
T.CreateAuras(options, "HARMFUL", 254919, "Kingaroth_auras_254919", 1, 1, 1, true, true, "all", "TOPLEFT", 30, -50) -- 熔铸之击
T.CreateLog(options, "SPELL_CAST_START", 246833, nil, 3, "Kingaroth_logs_246833", 0, 1, 1, "", "all", "TOPLEFT", 30, -85)  -- 毁灭者
T.CreateAura(options, "HARMFUL", "player", 249535, "Kingaroth_aura_249535", 1, 0, 1, true, false, "", 16, "TOPLEFT", 30, -120) -- 破坏术
T.CreateAura(options, "HARMFUL", "player", 249680, "Kingaroth_aura_249680",  1, 0, 1, true, false, "", 16, "TOPLEFT", 30, -155) -- 轰鸣屠戮
local ficon, fop = T.CreateCasting(options, "UNIT_SPELLCAST_SUCCEEDED", 246657, 5, "Kingaroth_cast_246657", 1, 0, 0, "", "all", "TOPLEFT", 30, -190) -- 歼灭
T.texture_fix(ficon, fop, 246664)
T.CreateAura(options, "HARMFUL", "player", 246698, "Kingaroth_aura_246698", 1, 0, 1, true, false, "", "all", "TOPLEFT", 30, -225) -- 破坏
T.CreateAura(options, "HARMFUL", "player", 246687, "Kingaroth_aura_246687",  1, 0, 1, true, false, "", "all", "TOPLEFT", 30, -260) -- 屠戮
T.CreateLog(options, "SPELL_CAST_START", 246516, nil, 43, "Kingaroth_logs_246516", 0, 1, 0, "", "all", "TOPLEFT", 30, -295)  -- 天启协议

-- sounds
T.CreateSoundFrame(options, 30, -420, nil, "7_254919", "COMBAT_LOG_EVENT_UNFILTERED", 254919, "SPELL_CAST_START") -- 熔铸之击
T.CreateSoundFrame(options, 30, -450, nil, "7_254926", "COMBAT_LOG_EVENT_UNFILTERED", 254926, "SPELL_CAST_START") -- 轰鸣之击
T.CreateSoundFrame(options, 30, -480, nil, "7_246833", "COMBAT_LOG_EVENT_UNFILTERED", 246833, "SPELL_CAST_START") -- 毁灭者
T.CreateSoundFrame(options, 30, -510, nil, "7_248214", "COMBAT_LOG_EVENT_UNFILTERED", 248214, "SPELL_CAST_SUCCESS") -- 恶魔炸弹
T.CreateSoundFrame(options, 230, -420, nil, "7_248375", "UNIT_SPELLCAST_SUCCEEDED", 248375) -- 粉碎打击
T.CreateSoundFrame(options, 230, -450, nil, "7_246657", "UNIT_SPELLCAST_SUCCEEDED", 246657) -- 歼灭
T.CreateSoundFrame(options, 230, -480, nil, "7_246687", "COMBAT_LOG_EVENT_UNFILTERED", 246687, "SPELL_AURA_APPLIED", G.PlayerName) -- 屠戮
T.CreateSoundFrame(options, 230, -510, nil, "7_249680", "COMBAT_LOG_EVENT_UNFILTERED", 249680, "SPELL_AURA_APPLIED", G.PlayerName) -- 轰鸣屠戮
T.CreateSoundFrame(options, 430, -420, nil, "7_246698", "COMBAT_LOG_EVENT_UNFILTERED", 246692, "SPELL_CAST_START") -- 破坏
T.CreateSoundFrame(options, 430, -450, nil, "7_246516", "COMBAT_LOG_EVENT_UNFILTERED", 246516, "SPELL_CAST_START") -- 天启协议

-- power
pp_range = {
	{ ul = 100, ll = 85, tip = L["阶段转换"]},
}

T.CreatePPAlertframe(options, 2088, "122578", "boss_2004", "boss1", "122578", pp_range, 30, -580)


-- hl icon on raid
T.Create_HL_EventFrame(options, "hl_246687_d", 30, -610, nil, "COMBAT_LOG_EVENT_UNFILTERED", 246687, "SPELL_AURA_APPLIED")   -- 屠戮 
T.Create_HL_EventFrame(options, "hl_249680_d", 30, -640, nil, "COMBAT_LOG_EVENT_UNFILTERED", 249680, "SPELL_AURA_APPLIED")   -- 轰鸣屠戮 

-- group share
--T.Create_GS_Options(options, "gs_246698", 30, -670)

-- chat msg
T.Create_ChatMsgSpells_Options(options, 249680, 30, -670) -- 轰鸣屠戮
T.Create_ChatMsgSpells_Options(options, 246687, 30, -700) -- 屠戮
T.Create_ChatMsgSpells_Options(options, 246698, 230, -580) -- 破坏

-- 刷怪提示
local difficulty = 0
local spell_index = 1

-- 进门 左菱形 右叉叉 BOSS身后三角
local rt1 = "|TInterface\\TargetingFrame\\UI-RaidTargetingIcon_3:0|t "	 -- 菱形
local rt2 = "|TInterface\\TargetingFrame\\UI-RaidTargetingIcon_7:0|t "	 -- 叉叉
local rt3 = "|TInterface\\TargetingFrame\\UI-RaidTargetingIcon_4:0|t "	 -- 三角

local timersHeroic = {
	rt1..L["破坏者"].."  "..rt2..L["屠戮者"].."  "..rt3..L["歼灭者"],
	rt1..L["破坏者"].."  "..rt2..L["歼灭者"].."  "..rt3..L["歼灭者"],	
	rt1..L["屠戮者"].."  "..rt2..L["屠戮者"].."  "..rt3..L["歼灭者"],
	rt1..L["破坏者"].."  "..rt2..L["屠戮者"].."  "..rt3..L["破坏者"],
	rt1..L["破坏者"].."  "..rt2..L["屠戮者"].."  "..rt3..L["歼灭者"],
	rt1..L["破坏者"].."  "..rt2..L["歼灭者"].."  "..rt3..L["歼灭者"],	
	rt1..L["屠戮者"].."  "..rt2..L["屠戮者"].."  "..rt3..L["歼灭者"],
}

local timersMythic = {
	rt1..L["破坏者"].."  "..rt2..L["屠戮者"].."  "..rt3..L["歼灭者"],
	rt1..L["破坏者"].."  "..rt2..L["屠戮者"].."  "..rt3..L["歼灭者"],	
	rt1..L["破坏者"].."  "..rt2..L["屠戮者"].."  "..rt3..L["歼灭者"],
	rt1..L["破坏者"].."  "..rt2..L["屠戮者"].."  "..rt3..L["歼灭者"],	
	rt1..L["破坏者"].."  "..rt2..L["屠戮者"].."  "..rt3..L["歼灭者"],
	rt1..L["破坏者"].."  "..rt2..L["屠戮者"].."  "..rt3..L["歼灭者"],	
}

local Frame = CreateFrame("Frame", G.addon_name.."Kingaroth_Alert", G.FrameHolder)
Frame:SetSize(300, 30)

Frame.movingname = string.format(L["提示框"] , EJ_GetEncounterInfo(2004))
Frame.point = { a1 = "TOPLEFT", parent = "UIParent", a2 = "CENTER", x = 300, y = 10 }
T.CreateDragFrame(Frame)
T.createborder(Frame)

Frame.bar = T.createStatusbar(Frame, "ARTWORK", 30, 300, 1, 1, 0, 1)
Frame.bar:SetPoint("CENTER")
Frame.bar:SetMinMaxValues(0, 100)

Frame.text = T.createtext(Frame.bar, "OVERLAY", 14, "OUTLINE", "CENTER")
Frame.text:SetPoint("CENTER")

local function UpdateText(i)
	if difficulty == 16 and timersMythic[i] then
		Frame.text:SetText("["..i.."]"..timersMythic[i])
	elseif timersHeroic[i] then
		Frame.text:SetText("["..i.."]"..timersHeroic[i])
	end
end

local function Reset()
	spell_index = 1
	UpdateText(spell_index)
end

local function Update(event, ...)
	if event == "UNIT_POWER_FREQUENT" then
		local unit = ...
		if unit == "boss1" then
			local pp = UnitPower("boss1")
			Frame.bar:SetValue(pp)
		end
	elseif event == "COMBAT_LOG_EVENT_UNFILTERED" then
		local Time_stamp, Event_type, _, _, _, _, _, _, _, _, _, SpellID = ...
		if Event_type == "SPELL_AURA_REMOVED" then
			if SpellID == 246516 then -- 天启协议		
				spell_index = spell_index + 1
				UpdateText(spell_index)
			end
		end
	elseif event == "ENCOUNTER_START" then
		Reset()
	elseif event == "ENCOUNTER_END" then
		Reset()
	else
		local pp = UnitPower("boss1")
		Frame.bar:SetValue(pp)
		Reset()
	end

end

Frame.Visibility = function(event, ...)
	local show = false
	
	if Frame.enable then
		if event == "ENCOUNTER_START" then
			local encounterID, encounterName, difficultyID, groupSize = ...
			if encounterID == 2088 then
				show = true
				difficulty = difficultyID
			end
		elseif event == "ENCOUNTER_END" then
			show = false
		else
			local guid = UnitGUID("boss1")
			if guid then
				local NPC_ID = select(6, strsplit("-", UnitGUID("boss1")))
				if NPC_ID == "122578" then
					show = true
					difficulty = select(3, GetInstanceInfo())
				end
			end
		end
	end
	
	if show then
		Frame:Show()
		Frame:RegisterEvent("UNIT_POWER_FREQUENT")	
		Frame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")		
	else
		Frame:Hide()
		Frame:UnregisterEvent("UNIT_POWER_FREQUENT")	
		Frame:UnregisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
	end
	
	Update(event)
end

Frame.Edit = function()
	if not ARM_CDB["General"]["disable_all"] and ARM_CDB["BossMod"]["Kingaroth_Alert"] then
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
	elseif event == "COMBAT_LOG_EVENT_UNFILTERED" then
		Update(event, ...)
	elseif event == "ENCOUNTER_START" or event == "ENCOUNTER_END" then
		Frame.Visibility(event, ...)
	end
end)

Frame.StartTest = function()

	Frame.bar:SetValue(50)
	Reset()
	Frame:Show()
	
	C_Timer.After(10, function()
		Frame.bar:SetValue(0)
		Frame:Hide()
	end)
end
G.Test["bossmod_7"] = Frame

local bu = T.Create_BossMod_Options(options, L["技能提示"], "Kingaroth_Alert", 230, -610)
bu.apply = Frame.Edit
table.insert(G.RM_Frames, Frame)