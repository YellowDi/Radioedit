local T, C, L, G = unpack(select(2, ...))

local addon_name = G.addon_name
local options = T.CreateOptions(EJ_GetEncounterInfo(1987), G.gui, -20, -390, -550)

-- icons
T.CreateAura(options, "HELPFUL", "target", 251448, "Felhounds_aura_251448",  1, 1, 1, true, false, L["减伤"], "all", "TOPLEFT", 30, -50) -- 烈焰之喉
T.CreateAura(options, "HELPFUL", "target", 251447, "Felhounds_aura_251447",  1, 1, 1, true, false, L["减伤"], "all", "TOPLEFT", 30, -85) -- 腐蚀之喉
T.CreateAura(options, "HARMFUL", "player", 251445, "Felhounds_aura_251455",  1, 1, 0, true, true, "", "all", "TOPLEFT", 30, -120) -- 闷烧
T.CreateAura(options, "HARMFUL", "player", 245098, "Felhounds_aura_245098",  1, 1, 0, true, true, "", "all", "TOPLEFT", 30, -155) -- 腐蚀
T.CreateAura(options, "HARMFUL", "player", 244768, "Felhounds_aura_244768",  1, 0, 0, true, false, L["减伤"], "all", "TOPLEFT", 30, -190) -- 荒芜凝视
T.CreateAura(options, "HARMFUL", "player", 244072, "Felhounds_aura_244072",  1, 0.5, 0, true, false, "", "all", "TOPLEFT", 30, -225) -- 熔火之触
T.CreateAura(options, "HARMFUL", "player", 244091, "Felhounds_aura_244091",  1, 0.5, 0, true, true, L["减伤"], "all", "TOPLEFT", 30, -260) -- 烧焦
T.CreateLog(options, "SPELL_AURA_APPLIED", 244057, nil, 15, "Felhounds_logs_244057", 1, 1, 0, L["保持分散"], "all", "TOPLEFT", 30, -295) -- 燃烧腐蚀
T.CreateAura(options, "HARMFUL", "player", 248815, "Felhounds_aura_248815",  1, 1, 0, true, false, L["分散"], "all", "TOPLEFT", 30, -330) -- 燃烧腐蚀-点燃

local ficon, fop = T.CreateCasting(options, "UNIT_SPELLCAST_SUCCEEDED", 244159, 10, "Felhounds_cast_244159", 1, 0, 1, "", 16, "TOPLEFT", 430, -50) -- 吞噬引爆
T.texture_fix(ficon, fop, 244130, true)
T.CreateAura(options, "HARMFUL", "player", 254429, "Felhounds_aura_254429",  1, 0, 0, true, false, L["分担"], "all", "TOPLEFT", 430, -85) -- 黑暗压迫
T.CreateLog(options, "SPELL_AURA_APPLIED", 244056, nil, 15, "Felhounds_logs_244056", 0, 1, 1, L["注意分担"], "all", "TOPLEFT", 430, -120) -- 虹吸腐蚀
T.CreateAura(options, "HARMFUL", "player", 248819, "Felhounds_aura_248819",  0, 1, 1, true, false, L["分担"], "all", "TOPLEFT", 430, -155) -- 虹吸腐蚀-虹吸
T.CreateAura(options, "HARMFUL", "player", 244055, "Felhounds_aura_244055",  1, 1, 1, true, false, "", 16, "TOPLEFT", 430, -190) -- 暗影触痕
T.CreateAura(options, "HARMFUL", "player", 244054, "Felhounds_aura_244054",  1, 1, 1, true, false, "", 16, "TOPLEFT", 430, -225) -- 烈焰触痕
T.CreateLog(options, "SPELL_AURA_APPLIED", 245022, "player", 2, "Felhounds_logs_245022", 1, 0.5, 0, L["快走开"], "all", "TOPLEFT", 430, -260) -- 炽燃
T.CreateLog(options, "SPELL_CAST_START", 249113, nil, 13, "Felhounds_logs_249113", 1, 1, 1, "", "all", "TOPLEFT", 430, -295) -- 黑暗重构

-- sounds
T.CreateSoundFrame(options, 30, -420, nil, "2_244055", "COMBAT_LOG_EVENT_UNFILTERED", 244055, "SPELL_AURA_APPLIED", G.PlayerName) --暗影触痕
T.CreateSoundFrame(options, 30, -450, nil, "2_244054", "COMBAT_LOG_EVENT_UNFILTERED", 244054, "SPELL_AURA_APPLIED", G.PlayerName) --烈焰触痕
T.CreateSoundFrame(options, 30, -480, nil, "2_251448", "COMBAT_LOG_EVENT_UNFILTERED", 251448, "SPELL_AURA_APPLIED") --烈焰之喉
T.CreateSoundFrame(options, 30, -510, nil, "2_251447", "COMBAT_LOG_EVENT_UNFILTERED", 251447, "SPELL_AURA_APPLIED") --腐蚀之喉
T.CreateSoundFrame(options, 230, -420, nil, "2_244768", "COMBAT_LOG_EVENT_UNFILTERED", 244768, "SPELL_AURA_APPLIED") --荒芜凝视
T.CreateSoundFrame(options, 230, -450, nil, "2_244131", "UNIT_SPELLCAST_SUCCEEDED", 244159) --吞噬之球
T.CreateSoundFrame(options, 230, -480, nil, "2_244072", "COMBAT_LOG_EVENT_UNFILTERED", 244072, "SPELL_AURA_APPLIED") --熔火之触	
T.CreateSoundFrame(options, 230, -510, nil, "2_254429", "COMBAT_LOG_EVENT_UNFILTERED", 254429, "SPELL_AURA_APPLIED") --黑暗压迫		
T.CreateSoundFrame(options, 430, -420, nil, "2_244057", "COMBAT_LOG_EVENT_UNFILTERED", 244057, "SPELL_CAST_START") --燃烧腐蚀
T.CreateSoundFrame(options, 430, -450, nil, "2_244056", "COMBAT_LOG_EVENT_UNFILTERED", 244056, "SPELL_CAST_START") --虹吸腐蚀
T.CreateSoundFrame(options, 430, -480, nil, "2_245024", "COMBAT_LOG_EVENT_UNFILTERED", 245024, "SPELL_AURA_APPLIED", G.PlayerName) -- 被吞噬
T.CreateSoundFrame(options, 430, -510, nil, "2_245022", "COMBAT_LOG_EVENT_UNFILTERED", 245022, "SPELL_AURA_APPLIED", G.PlayerName) -- 炽燃

-- hl icon on raid
T.Create_HL_EventFrame(options, "hl_244072_d", 30, -580, nil, "COMBAT_LOG_EVENT_UNFILTERED", 244072, "SPELL_AURA_APPLIED")    -- 熔火之触  
T.Create_HL_EventFrame(options, "hl_244768_d", 30, -610, nil, "COMBAT_LOG_EVENT_UNFILTERED", 244768, "SPELL_AURA_APPLIED")    -- 荒芜凝视 

-- chat msg
T.Create_ChatMsgSpells_Options(options, 244768, 30, -640) -- 荒芜凝视
T.Create_ChatMsgSpells_Options(options, 248815, 30, -670) -- 点燃
T.Create_ChatMsgSpells_Options(options, 254429, 30, -700) -- 黑暗压迫
T.Create_ChatMsgSpells_Options(options, 248819, 230, -580) -- 虹吸
		
-- 组合技能提示
local Spells = {
	{244768, 244072, 244057},
	{244107, 254429, 244056},
}

local f_index = 1
local s_index = 1

local Frame = CreateFrame("Frame", G.addon_name.."Felhounds_Alert", G.FrameHolder)
Frame:SetSize(300, 30)

Frame.movingname = string.format(L["提示框"] , EJ_GetEncounterInfo(1987))
Frame.point = { a1 = "TOPLEFT", parent = "UIParent", a2 = "CENTER", x = 300, y = 250 }
T.CreateDragFrame(Frame)
T.createborder(Frame)

local function CreatePowerbar(r, g, b)
	local bar = T.createStatusbar(Frame, "ARTWORK", 30, 300, 0, 0, 0, 0)
	bar:SetPoint("CENTER")
	bar:SetMinMaxValues(0, 33)
	
	bar.tab = bar:CreateTexture(nil, "OVERLAY")
	bar.tab:SetSize(3, 30)
	bar.tab:SetColorTexture(r, g, b)
	bar.tab:SetPoint("CENTER", bar:GetStatusBarTexture(), "RIGHT", 0, 0)
	
	bar.icon = bar:CreateTexture(nil, "OVERLAY")	
	bar.icon:SetSize(30, 30)
	bar.icon:SetPoint("RIGHT", bar.tab, "LEFT", -1, 0)
	bar.icon:SetTexCoord( .1, .9, .1, .9)
	
	bar.iconbd = bar:CreateTexture(nil, "BORDER")
	bar.iconbd:SetColorTexture(0, 0, 0)
	bar.iconbd:SetPoint("TOPLEFT", bar.icon, "TOPLEFT", -1, 1)
	bar.iconbd:SetPoint("BOTTOMRIGHT", bar.icon, "BOTTOMRIGHT", 1, -1)
	
	bar.text = T.createtext(bar, "OVERLAY", 12, "OUTLINE", "CENTER")
	bar.text:SetPoint("BOTTOM", bar.icon, "TOP", 0, 1)
	
	bar.index = T.createtext(bar, "OVERLAY", 16, "OUTLINE", "CENTER")
	bar.index:SetPoint("CENTER", bar.icon, "CENTER", 0, 0)
	
	return bar
end

Frame.bar1 = CreatePowerbar(1, .8, .1)
Frame.bar2 = CreatePowerbar(.8, .1, 1)

local function UpdateText()
	Frame.bar1.index:SetText(f_index)
	Frame.bar2.index:SetText(s_index)
end

local function ResetText()
	f_index = 1
	s_index = 1
	UpdateText()
end

local function UpdateSpell(i, unit)
	local pp = min(UnitPower(unit), 99)		
	local spell = Spells[i][math.ceil(pp/33)]
	local value = math.fmod(pp, 33)
	Frame["bar"..i]:SetValue(value)

	local spell_name, _, spell_icon = GetSpellInfo(spell)
	Frame["bar"..i].icon:SetTexture(spell_icon)
	Frame["bar"..i].text:SetText(spell_name)
end

local function Update(event, ...)
	if event == "UNIT_POWER_FREQUENT" then
		local unit = ...
		if unit == "boss1" then
			UpdateSpell(1, "boss1")
		elseif unit == "boss2" then
			UpdateSpell(2, "boss2")
		end
	elseif event == "COMBAT_LOG_EVENT_UNFILTERED" then
		local Time_stamp, Event_type, _, _, _, _, _, _, _, _, _, SpellID = ...
		if Event_type == "SPELL_CAST_SUCCESS" then
			if SpellID == 244057 then -- 燃烧腐蚀
				f_index = f_index + 1
				Frame.bar1.index:SetText(f_index)
			elseif SpellID == 244056 then -- 虹吸腐蚀
				s_index = s_index + 1
				Frame.bar2.index:SetText(s_index)
			end
		end
	elseif event == "ENCOUNTER_START" then
		UpdateSpell(1, "boss1")
		UpdateSpell(2, "boss2")
		UpdateText()
	elseif event == "ENCOUNTER_END" then
		ResetText()
	else
		UpdateSpell(1, "boss1")
		UpdateSpell(2, "boss2")
		UpdateText()
	end
end

Frame.Visibility = function(event, ...)
	local show = false
	
	if Frame.enable then
		if event == "ENCOUNTER_START" then
			local encounterID, encounterName, difficultyID, groupSize = ...
			if encounterID == 2074 then
				show = true
			end
		elseif event == "ENCOUNTER_END" then
			show = false
		else
			local guid = UnitGUID("boss1")
			if guid then
				local NPC_ID = select(6, strsplit("-", UnitGUID("boss1")))
				if NPC_ID == "126916" then
					show = true
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
	if not ARM_CDB["General"]["disable_all"] and ARM_CDB["BossMod"]["Felhounds_Alert"] then
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
	ResetText()
	
	Frame.bar1:SetValue(10)
	local name1, _, icon1 = GetSpellInfo(Spells[1][1])
	Frame.bar1.icon:SetTexture(icon1)
	Frame.bar1.text:SetText(name1)
	
	Frame.bar2:SetValue(20)
	local name2, _, icon2 = GetSpellInfo(Spells[2][2])
	Frame.bar2.icon:SetTexture(icon2)
	Frame.bar2.text:SetText(name2)
	
	Frame:Show()
	
	C_Timer.After(10, function()
		Frame:Hide()
	end)
end
G.Test["bossmod_2"] = Frame

local bu = T.Create_BossMod_Options(options, L["技能提示"], "Felhounds_Alert", 230, -610)
bu.apply = Frame.Edit
table.insert(G.RM_Frames, Frame)