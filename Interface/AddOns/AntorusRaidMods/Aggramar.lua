local T, C, L, G = unpack(select(2, ...))

local addon_name = G.addon_name
local options = T.CreateOptions(EJ_GetEncounterInfo(1984), G.gui, -20, -390, -550)

-- icons
T.CreateAuras(options, "HARMFUL", 245990, "Aggramar_auras_245990", 1, 1, 1, true, true, "all", "TOPLEFT", 30, -50) -- 泰沙拉克之触
T.CreateAura(options, "HARMFUL", "player", 245994, "Aggramar_aura_245994",  1, 0, 0, true, false, L["靠边"], 15, "TOPLEFT", 30, -85) -- 灼热之焰（H）
T.CreateAura(options, "HARMFUL", "player", 254452, "Aggramar_aura_254452",  1, 0, 0, true, false, L["靠边"], 16, "TOPLEFT", 30, -120) -- 饕餮烈焰
T.CreateLog(options, "SPELL_CAST_START", 245458, nil, 2.75, "Aggramar_logs_245458", 1, 1, 1, L["施法"], "all", "TOPLEFT", 30, -155)  -- 破敌者
T.CreateLog(options, "SPELL_CAST_START", 255059, nil, 2.75, "Aggramar_logs_255059", 1, 1, 1, L["施法"], 16, "TOPLEFT", 30, -190)  -- 强化破敌者
T.CreateAuras(options, "HARMFUL", 244291, "Aggramar_auras_244291", 1, 1, 1, true, true, "all", "TOPLEFT", 30, -225) -- 破敌者
T.CreateAuras(options, "HARMFUL", 255060, "Aggramar_auras_255060", 1, 1, 1, true, true, 16, "TOPLEFT", 30, -260) -- 强化破敌者
T.CreateLog(options, "SPELL_CAST_START", 245463, nil, 2.75, "Aggramar_logs_245463", 1, 1, 0, L["施法"], "all", "TOPLEFT", 30, -295)  -- 烈焰撕裂
T.CreateLog(options, "SPELL_CAST_START", 255058, nil, 2.75, "Aggramar_logs_255058", 1, 1, 0, 16, "all", "TOPLEFT", 30, -330)  -- 强化烈焰撕裂

T.CreateAura(options, "HARMFUL", "player", 247079, "Aggramar_aura_247079",  1, 1, 0, true, false, L["易伤"], 16, "TOPLEFT", 430, -50) -- 强化烈焰撕裂
T.CreateLog(options, "SPELL_CAST_START", 245301, nil, 6, "Aggramar_logs_245301", 1, .5, 0, L["远离"], "all", "TOPLEFT", 430, -85)  -- 灼热风暴
T.CreateLog(options, "SPELL_CAST_START", 255061, nil, 6, "Aggramar_logs_255061", 1, .5, 0, L["远离"], 16, "TOPLEFT", 430, -120)  -- 强化灼热风暴
T.CreateAura(options, "HARMFUL", "player", 244912, "Aggramar_aura_244912",  0, 1, 0, true, true, "", "all", "TOPLEFT", 430, -155) -- 烈焰喷薄
T.CreateLog(options, "SPELL_AURA_APPLIED", 245916, "player", 2, "Aggramar_logs_245916", 1, 0.5, 0, L["快走开"], "all", "TOPLEFT", 430, -190) -- 熔火残渣
T.CreateAura(options, "HARMFUL", "player", 244736, "Aggramar_aura_244736",  0, 1, 1, true, false, "", "all", "TOPLEFT", 430, -225) -- 烈焰之迹
T.CreateAuras(options, "HARMFUL", 255528, "Aggramar_auras_255528", 1, 1, 0, true, false, 16, "TOPLEFT", 430, -260) -- 烈焰绑带
T.CreateAura(options, "HELPFUL", "boss2", 245631, "Aggramar_aura_245631_boss2",  1, .3, 0, false, false, "<1>", "all", "TOPLEFT", 430, -295) -- 狂野烈焰
T.CreateAura(options, "HELPFUL", "boss3", 245631, "Aggramar_aura_245631_boss3",  1, .3, 0, false, false, "<2>", "all", "TOPLEFT", 430, -330) -- 狂野烈焰

-- sounds
T.CreateSoundFrame(options, 30, -420, nil, "10_243431", "UNIT_SPELLCAST_SUCCEEDED", 243431) -- 泰沙拉克之触
T.CreateSoundFrame(options, 30, -450, nil, "10_245994", "COMBAT_LOG_EVENT_UNFILTERED", 245994, "SPELL_AURA_APPLIED", G.PlayerName) -- 灼热之焰（H）
T.CreateSoundFrame(options, 30, -480, nil, "10_254452", "COMBAT_LOG_EVENT_UNFILTERED", 254452, "SPELL_AURA_APPLIED", G.PlayerName) -- 饕餮烈焰
T.CreateSoundFrame(options, 30, -510, nil, "10_244912", "COMBAT_LOG_EVENT_UNFILTERED", 244912, "SPELL_AURA_APPLIED", G.PlayerName) -- 烈焰喷薄
T.CreateSoundFrame(options, 230, -420, nil, "10_244693", "COMBAT_LOG_EVENT_UNFILTERED", 244693, "SPELL_CAST_START") -- 烈焰之迹
T.CreateSoundFrame(options, 230, -450, nil, "10_245458", "COMBAT_LOG_EVENT_UNFILTERED", 245458, "SPELL_CAST_START") -- 破敌者
T.CreateSoundFrame(options, 230, -480, nil, "10_255059", "COMBAT_LOG_EVENT_UNFILTERED", 255059, "SPELL_CAST_START") -- 强化破敌者
T.CreateSoundFrame(options, 230, -510, nil, "10_245463", "COMBAT_LOG_EVENT_UNFILTERED", 245463, "SPELL_CAST_START") -- 烈焰撕裂
T.CreateSoundFrame(options, 430, -420, nil, "10_247079", "COMBAT_LOG_EVENT_UNFILTERED", 255058, "SPELL_CAST_START") -- 强化烈焰撕裂
T.CreateSoundFrame(options, 430, -450, nil, "10_245301", "COMBAT_LOG_EVENT_UNFILTERED", 245301, "SPELL_CAST_START") -- 灼热风暴
T.CreateSoundFrame(options, 430, -480, nil, "10_255061", "COMBAT_LOG_EVENT_UNFILTERED", 255061, "SPELL_CAST_START") -- 强化灼热风暴
T.CreateSoundFrame(options, 430, -510, nil, "10_245983", "UNIT_SPELLCAST_SUCCEEDED", 245983) -- 炙焰
T.CreateSoundFrame(options, 630, -420, nil, "10_246037", "UNIT_SPELLCAST_SUCCEEDED", 246037) -- 强能炙焰
T.CreateSoundFrame(options, 630, -450, nil, "10_245916", "COMBAT_LOG_EVENT_UNFILTERED", 245916, "SPELL_AURA_APPLIED", G.PlayerName) -- 熔火残渣
T.CreateSoundFrame(options, 630, -480, nil, "10_245631", "COMBAT_LOG_EVENT_UNFILTERED", 245631, "SPELL_AURA_APPLIED") -- 狂野烈焰

-- health
hp_range = {
	All = {
		{ ul = 83, ll = 80, tip = L["阶段转换"]},
		{ ul = 43, ll = 40, tip = L["阶段转换"]},
	},
}

T.CreateHPAlertframe(options, 2063, "121975", "boss_1984", "boss1", "121975", hp_range, 30, -580)

-- power
pp_range = {
	{ ul = 100, ll = 85, tip = L["准备连击"]},
}

T.CreatePPAlertframe(options, 2063, "121975", "boss_1984", "boss1", "121975", pp_range, 30, -610)

-- hl icon on raid
T.Create_HL_EventFrame(options, "hl_254452_d", 30, -640, nil, "COMBAT_LOG_EVENT_UNFILTERED", 254452, "SPELL_AURA_APPLIED")   -- 饕餮烈焰


-- Nameplate buffs
T.Create_PlateAlerts_Options(options, 244901, 30, -670) -- 催化作用
T.Create_PlateAlerts_Options(options, 244903, 30, -700) -- 催化作用
T.Create_PlateAlerts_Options(options, 247091, 230, -580) -- 催化
T.Create_PlateAlerts_Options(options, 245905, 230, -610) -- 融火残渣
T.Create_PlateAlerts_Options(options, 245631, 230, -640) -- 狂野烈焰
T.Create_PlateAlerts_Power_Options(options, "122532", L["余烬"], 230, -670) -- 余烬能量 > 80

-- chat msg
T.Create_ChatMsgSpells_Options(options, 254452, 230, -700) -- 饕餮烈焰
T.Create_ChatMsgSpells_Options(options, 245994, 430, -580) -- 炽热之焰

-- 信息框
local Embar_num = 0
local Sleep_num = 0
local stage = 1
local index = 1

local Frame = CreateFrame("Frame", G.addon_name.."Aggramar_Alert", G.FrameHolder)
Frame:SetSize(180, 160)

Frame.movingname = string.format(L["提示框"] , EJ_GetEncounterInfo(1984))
Frame.point = { a1 = "TOPLEFT", parent = "UIParent", a2 = "CENTER", x = 300, y = -90 }
T.CreateDragFrame(Frame)
T.createborder(Frame)

Frame.icon = Frame:CreateTexture(nil, "OVERLAY")	
Frame.icon:SetSize(28, 28)
Frame.icon:SetPoint("TOPLEFT", Frame, "TOPLEFT", 5, -5)
Frame.icon:SetTexCoord( .1, .9, .1, .9)
Frame.icon:SetTexture(135790)

Frame.iconbd = Frame:CreateTexture(nil, "BORDER")
Frame.iconbd:SetColorTexture(0, 0, 0)
Frame.iconbd:SetPoint("TOPLEFT", Frame.icon, "TOPLEFT", -1, 1)
Frame.iconbd:SetPoint("BOTTOMRIGHT", Frame.icon, "BOTTOMRIGHT", 1, -1)

Frame.text = T.createtext(Frame, "OVERLAY", 16, "OUTLINE", "CENTER")
Frame.text:SetPoint("LEFT", Frame.icon, "RIGHT", 10, 0)

local function CreateCdIcon(spell, ...)
	local icon = CreateFrame("Frame", nil, Frame)
	icon:SetSize(60, 60)
	icon:SetPoint(...)
	T.createborder(icon)
	
	local spell_name, _, spell_texture = GetSpellInfo(spell)
	
	icon.tex = icon:CreateTexture(nil, "OVERLAY")	
	icon.tex:SetAllPoints()
	icon.tex:SetTexCoord( .1, .9, .1, .9)
	icon.tex:SetTexture(spell_texture)
	
	icon.text = T.createtext(icon, "OVERLAY", 12, "OUTLINE", "CENTER")
	icon.text:SetPoint("BOTTOM", icon, "BOTTOM", 0, 1)
	icon.text:SetText(spell_name)
	
	icon.cd = T.createtext(icon, "OVERLAY", 30, "OUTLINE", "CENTER")
	icon.cd:SetPoint("TOP", icon, "TOP", 0, 1)
	
	return icon
end

local Cd_icon1 = CreateCdIcon(254452, "TOPRIGHT", Frame, "TOP", -5, -35)
local Cd_icon2 = CreateCdIcon(245983, "TOPLEFT", Frame, "TOP", 5, -35)

local Text1 = T.createtext(Frame, "OVERLAY", 25, "OUTLINE", "CENTER")
Text1:SetPoint("TOPLEFT", Frame, "TOPLEFT", 0, -100)

local Text2 = T.createtext(Frame, "OVERLAY", 25, "OUTLINE", "CENTER")
Text2:SetPoint("TOPLEFT", Text1, "BOTTOMLEFT", 0, -5)

local function UpdateText()
	Frame.text:SetText(string.format(L["余烬数量"], Embar_num, Sleep_num))
	
	local text_1 = ARM_CDB["Aggramar_Texts"][stage][index] or ""
	Text1:SetText("["..index.."] "..text_1)
	
	local text_2 = ARM_CDB["Aggramar_Texts"][stage][index+1] or ""
	Text2:SetText("["..(index+1).."] "..text_2)
end

local function UpdateIcon(icon, grey, cd)
	if grey then
		icon.tex:SetDesaturated(true)
	else
		icon.tex:SetDesaturated(false)
	end
	if cd <= 0 then
		icon.cd:SetText("")
	elseif cd <= 5 then
		icon.cd:SetText(string.format("|cffFF0000%d|r", cd))
	else
		icon.cd:SetText(string.format("%d", cd))
	end
end

local function Reset()
	Embar_num = 0
	Sleep_num = 0
	stage = 1
	index = 1
	UpdateText()
	UpdateIcon(Cd_icon1, true, 0)
	UpdateIcon(Cd_icon2, true, 0)	
end

local function Update(event, ...)
	if event == "COMBAT_LOG_EVENT_UNFILTERED" then
		local Time_stamp, Event_type, _, _, _, _, _, _, _, _, _, SpellID = ...
		if Event_type == "SPELL_CAST_SUCCESS" then 
			if SpellID == 244912 then -- 烈焰喷薄
				Embar_num = Embar_num - 1
				UpdateText()
			elseif SpellID == 255058 then -- 强化烈焰撕裂
				index = index + 1
				UpdateText()
			end
		elseif Event_type == "SPELL_AURA_APPLIED" then
			if SpellID == 244894 then -- 烈焰之盾
				Embar_num = Embar_num + 10
				stage = stage + 1
				index = 1
				UpdateText()			
			elseif SpellID == 245905 then -- 熔火残渣 获得
				Sleep_num = Sleep_num + 1	
				UpdateText()
			end
		elseif Event_type == "SPELL_AURA_REMOVED" then
			if SpellID == 245905 then -- 熔火残渣 失去
				Sleep_num = Sleep_num - 1			
			end
			UpdateText()
		elseif Event_type == "SPELL_CAST_START" then
			if SpellID == 255058 then -- 强化烈焰撕裂
				Text1:SetTextColor(1, 1, 0)
				C_Timer.After(2.75, function()
					Text1:SetTextColor(1, 1, 1)
				end)
			end
		end
	elseif event == "UNIT_SPELLCAST_SUCCEEDED" then
		local SpellID = select(5, ...)
		if SpellID == 244912 then -- 强能炙焰
			Embar_num = Embar_num + 3
			UpdateText()
		end
	elseif event == "UNIT_POWER_FREQUENT" then
		local unit = ...
		if unit == "boss1" then
			local hp = UnitHealth("boss1")
			local hp_max = UnitHealthMax("boss1")
			local hp_perc
			
			if hp and hp_max then
				hp_perc = hp/hp_max*100
			end
			
			local power = UnitPower("boss1")
			
			if hp_perc and power then
				if power == 0 then
					UpdateIcon(Cd_icon1, true, 0)
					UpdateIcon(Cd_icon2, true, 0)					
				else	
					if hp_perc > 80 then					
						if power <= 10 then
							UpdateIcon(Cd_icon1, false, (10 - power)/3)
						elseif power <= 70 then
							UpdateIcon(Cd_icon1, false, (70 - power)/3)
						else
							UpdateIcon(Cd_icon1, true, 0)
						end	
						
						UpdateIcon(Cd_icon2, true, 0)
					else
						if power <= 60 then
							UpdateIcon(Cd_icon1, false, (60 - power)/3)
						else
							UpdateIcon(Cd_icon1, true, 0)
						end
						
						if power <= 20 then
							UpdateIcon(Cd_icon2, false, (20 - power)/3)
						else
							UpdateIcon(Cd_icon2, true, 0)
						end
					end
				end
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
			if encounterID == 2063 and difficultyID == 16 then
				show = true
			end
		elseif event == "ENCOUNTER_END" then
			show = false
		else
			local guid = UnitGUID("boss1")
			if guid then
				local NPC_ID = select(6, strsplit("-", UnitGUID("boss1")))
				local difficultyID = select(3, GetInstanceInfo())
				if NPC_ID == "121975" and difficultyID == 16 then
					show = true
				end
			end
		end
	end
	
	if show then
		Frame:Show()
		Frame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
		Frame:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")
		Frame:RegisterEvent("UNIT_POWER_FREQUENT")
	else
		Frame:Hide()
		Frame:UnregisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
		Frame:UnregisterEvent("UNIT_SPELLCAST_SUCCEEDED")
		Frame:UnregisterEvent("UNIT_POWER_FREQUENT")
	end
	
	Update(event)
end

Frame.Edit = function()
	if not ARM_CDB["General"]["disable_all"] and ARM_CDB["BossMod"]["Aggramar_Alert"] then
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
	elseif event == "UNIT_POWER_FREQUENT" then
		Update(event, ...)
	elseif event == "ENCOUNTER_START" or event == "ENCOUNTER_END" then
		Frame.Visibility(event, ...)
	end
end)

Frame.StartTest = function()

	Frame.text:SetText(string.format(L["余烬数量"], 7, 2))
	
	Frame:Show()
	
	C_Timer.After(10, function()
		Frame:Hide()
		Reset()
	end)
end
G.Test["bossmod_10"] = Frame

local bu = T.Create_BossMod_Options(options, L["技能提示"], "Aggramar_Alert", 430, -610)
bu.apply = Frame.Edit
table.insert(G.RM_Frames, Frame)

local Config = CreateFrame("Frame", nil, options)
Config:SetPoint("TOPLEFT", G.gui, "TOPLEFT", -255, 0)
Config:SetPoint("BOTTOMRIGHT", G.gui, "BOTTOMLEFT", -5, 0)
T.createborder(Config)

T.CreateTitle(Config, L["烈焰撕裂分担提示"], -20)

T.CreateTitle(Config, "P1", -50)

for i = 1, 4 do
	T.createeditbox(Config, 20, -60-30*i, i, "Aggramar_Texts", 1, i)
end

T.CreateTitle(Config, "P2", -220)

for i = 1, 7 do
	T.createeditbox(Config, 20, -230-30*i, i, "Aggramar_Texts", 2, i)
end

T.CreateTitle(Config, "P3", -480)

for i = 1, 7 do
	T.createeditbox(Config, 20, -490-30*i, i, "Aggramar_Texts", 3, i)
end

T.createbu(Config, "Aggramar_Texts", L["烈焰撕裂分担提示"])