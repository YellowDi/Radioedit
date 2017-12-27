local T, C, L, G = unpack(select(2, ...))

local addon_name = G.addon_name
local options = T.CreateOptions(EJ_GetEncounterInfo(2025), G.gui, -20, -390, -550)

-- icons
T.CreateAura(options, "HARMFUL", "player", 248332, "Eonar_aura_248332",  0, 1, 0, true, false, L["靠边"], "all", "TOPLEFT", 30, -50) -- 邪能之雨
T.CreateAura(options, "HARMFUL", "player", 249017, "Eonar_aura_249017",  1, 0, 1, true, false, "", 16, "TOPLEFT", 30, -85) -- 反馈-奥术奇点
T.CreateAura(options, "HARMFUL", "player", 250693, "Eonar_aura_250693",  1, 0, 1, true, false, "", 16, "TOPLEFT", 30, -120) -- 奥术奇点
T.CreateAura(options, "HARMFUL", "player", 249014, "Eonar_aura_249014",  1, 1, 0, true, false, "", 16, "TOPLEFT", 30, -155) -- 反馈-邪污足迹
T.CreateAura(options, "HARMFUL", "player", 250140, "Eonar_aura_250140",  1, 1, 0, false, true, "", 16, "TOPLEFT", 30, -190) -- 邪污足迹
T.CreateAura(options, "HARMFUL", "player", 249016, "Eonar_aura_249016",  0, .5, 0, true, false, "", 16, "TOPLEFT", 30, -225) -- 反馈-目标锁定
T.CreateAura(options, "HARMFUL", "player", 249015, "Eonar_aura_249015",  1, .5, 0, true, false, "", 16, "TOPLEFT", 30, -260) -- 反馈-燃烧的余烬
T.CreateAura(options, "HARMFUL", "player", 250691, "Eonar_aura_250691",  1, .5, 0, true, false, "", 16, "TOPLEFT", 30, -295) -- 燃烧的余烬
T.CreateLog(options, "SPELL_AURA_APPLIED", 248795, "player", 2, "Eonar_logs_248795", 1, 0.5, 0, L["快走开"], "all", "TOPLEFT", 30, -330) -- 邪能尾迹

T.CreateCasting(options, "CASTING", 249121, 50, "Eonar_cast_249121", 1, 1, 1, L["限时"], 16, "TOPLEFT", 430, -50) -- 终极毁灭


-- sounds
T.CreateSoundFrame(options, 30, -420, nil, "5_250030", "COMBAT_LOG_EVENT_UNFILTERED", 250048, "SPELL_CAST_START") -- 生命之力
T.CreateSoundFrame(options, 30, -450, nil, "5_249121", "COMBAT_LOG_EVENT_UNFILTERED", 249121, "SPELL_CAST_START") -- 终极毁灭
T.CreateSoundFrame(options, 30, -480, nil, "5_248332", "COMBAT_LOG_EVENT_UNFILTERED", 248332, "SPELL_AURA_APPLIED") -- 邪能之雨
T.CreateSoundFrame(options, 30, -510, nil, "5_248861", "CHAT_MSG_RAID_BOSS_EMOTE", 248861) -- 末日之矛
T.CreateSoundFrame(options, 230, -420, nil, "5_249015", "COMBAT_LOG_EVENT_UNFILTERED", 249015, "SPELL_AURA_APPLIED", G.PlayerName) -- 反馈燃烧的余烬
T.CreateSoundFrame(options, 230, -450, nil, "5_249014", "COMBAT_LOG_EVENT_UNFILTERED", 249014, "SPELL_AURA_APPLIED", G.PlayerName) -- 反馈邪污足迹
T.CreateSoundFrame(options, 230, -480, nil, "5_249016", "COMBAT_LOG_EVENT_UNFILTERED", 249016, "SPELL_AURA_APPLIED", G.PlayerName) -- 反馈目标锁定
T.CreateSoundFrame(options, 230, -510, nil, "5_249017", "COMBAT_LOG_EVENT_UNFILTERED", 249017, "SPELL_AURA_APPLIED", G.PlayerName) -- 反馈奥术奇点
T.CreateSoundFrame(options, 430, -420, nil, "5_250691", "COMBAT_LOG_EVENT_UNFILTERED", 250691, "SPELL_AURA_APPLIED", G.PlayerName) -- 燃烧的余烬
T.CreateSoundFrame(options, 430, -450, nil, "5_250693", "COMBAT_LOG_EVENT_UNFILTERED", 250693, "SPELL_AURA_APPLIED", G.PlayerName) -- 奥能累积
T.CreateSoundFrame(options, 430, -480, nil, "5_248795", "COMBAT_LOG_EVENT_UNFILTERED", 248795, "SPELL_AURA_APPLIED", G.PlayerName) -- 邪能尾迹
T.CreateSoundFrame(options, 430, -510, nil, "5_250701", "COMBAT_LOG_EVENT_UNFILTERED", 250701, "SPELL_CAST_START") -- 邪能横扫


-- power
pp_range = {
	{ ul = 100, ll = 75, tip = L["生命能量"]},
}

T.CreatePPAlertframe(options, 2075, "122500", "boss_2025", "altpower", "122500", pp_range, 30, -580)

-- hl icon on raid
T.Create_HL_EventFrame(options, "hl_248332_d", 30, -610, nil, "COMBAT_LOG_EVENT_UNFILTERED", 248332, "SPELL_AURA_APPLIED")   -- 邪能之雨

-- chat msg
T.Create_ChatMsgSpells_Options(options, 248332, 30, -640) -- 邪能之雨
 
-- 刷怪计时器
local start = 0

local timersHeroic = {
	["top"] = {
		{70, L["恶魔卫士"].." "..L["干扰器"].." "..L["净化者"]},
		{200, L["恶魔卫士"]},
		{320, L["恶魔卫士"].." "..L["毁灭者"]},
	},
	
	["mid"] = {	
		{5, L["恶魔卫士"].." "..L["毁灭者"]},
		{120, L["恶魔卫士"].." "..L["净化者"]},
		{225, L["净化者"].." "..L["恶魔卫士"].." "..L["干扰器"].." "..L["恶魔犬"]},
		{330, L["恶魔卫士"].." "..L["毁灭者"]},
	},
	
	["bot"] = {
		{35, L["恶魔犬"].." "..L["净化者"]},
		{190, L["毁灭者"].." "..L["净化者"].." "..L["恶魔卫士"]},
		{320, L["恶魔卫士"].." "..L["干扰器"]},
	},
	
	["air"] = {
		{180, L["科拉佩特隆"]},
		{300, L["科拉佩特隆"]},
	}
}

local icons = {
	"|T460954:12:12:0:0:64:64:4:60:4:60|t", -- 邪污足迹
	"|T463281:12:12:0:0:64:64:4:60:4:60|t", -- 目标锁定
	"|T463280:12:12:0:0:64:64:4:60:4:60|t", -- 奥术
	"|T463282:12:12:0:0:64:64:4:60:4:60|t", -- 燃烧
}
local str = icons[1].."%s  "..icons[2].."%s  "..icons[3].."%s  "..icons[4].."%s"

local timersMythic = {
	["top"] = {
		{40, L["毁灭者"].." "..L["邪能领主"]},
		{70, L["恶魔犬"]},
		{160, L["恶魔犬"]},
		{335, L["干扰器"].." "..L["恶魔卫士"].." "..L["恶魔犬"].." "..L["净化者"]},
		{420, L["邪能领主"].." "..L["毁灭者"]},
	},
	
	["mid"] = {
		{5, L["恶魔卫士"].." "..L["毁灭者"].." "..L["恶魔犬"]},
		{65, L["净化者"].." "..L["恶魔卫士"]},
		{135, L["邪能领主"].." "..L["净化者"]},
		{285, L["邪能领主"].." "..L["干扰器"]},
		{415, L["毁灭者"].." "..L["邪能领主"]},
	},
	
	["bot"] = {
		{40, L["恶魔犬"].." "..L["干扰器"]},
		{115, L["邪能领主"].." "..L["毁灭者"].." "..L["恶魔犬"]},
		{210, L["恶魔卫士"].." "..L["净化者"]},
		{310, L["恶魔犬"]},
		{420, L["邪能领主"].." "..L["干扰器"]},
	},
	
	["air"] = {
		{200, L["科拉佩特隆"]},
		{270, L["科拉佩特隆"]},
		{375, L["科拉佩特隆"]},
		{475, L["科拉佩特隆"]},
	},
	
	["doom"] = {
		{60, ""},
		{177, ""}, 
		{277, ""},
		{380, ""},
		{480, ""},
	},
}

local Frame = CreateFrame("Frame", G.addon_name.."Eonar_Alert", G.FrameHolder)
Frame:SetSize(400, 120)
Frame.t = 0

Frame.movingname = string.format(L["提示框"] , EJ_GetEncounterInfo(2025))
Frame.point = { a1 = "TOPLEFT", parent = "UIParent", a2 = "CENTER", x = 300, y = 150 }
T.CreateDragFrame(Frame)

local function CreateAddFrame(icon, index, tag, r, g, b)
	local f = T.createStatusbar(Frame, "ARTWORK", 20, 375, r, g, b, 1)
	f:SetPoint("TOPLEFT", Frame, "TOPLEFT", 25, -(index-1)*24)
	T.createborder(f)
	
	f.icon = f:CreateTexture(nil, "OVERLAY")	
	f.icon:SetSize(20, 20)
	f.icon:SetPoint("RIGHT", f, "LEFT", -5, 0)
	f.icon:SetTexCoord( .1, .9, .1, .9)
	f.icon:SetTexture(icon)

	f.iconbd = f:CreateTexture(nil, "BORDER")
	f.iconbd:SetColorTexture(0, 0, 0)
	f.iconbd:SetPoint("TOPLEFT", f.icon, "TOPLEFT", -1, 1)
	f.iconbd:SetPoint("BOTTOMRIGHT", f.icon, "BOTTOMRIGHT", 1, -1)
	
	f.index = T.createtext(f, "OVERLAY", 14, "OUTLINE", "LEFT")
	f.index:SetPoint("LEFT", f.icon, "RIGHT", 10, 0)
	
	f.name = T.createtext(f, "OVERLAY", 14, "OUTLINE", "LEFT")
	f.name:SetPoint("LEFT", f.index, "RIGHT", 10, 0)
	
	f.dur = T.createtext(f, "OVERLAY", 14, "OUTLINE", "RIGHT")
	f.dur:SetPoint("RIGHT", f, "RIGHT", -10, 0)
	
	f.old_wave = 0
	Frame[tag] = f
end

CreateAddFrame(450907, 1, "top", 1, 1, 0)
CreateAddFrame(450908, 2, "mid", 1, 1, 0)
CreateAddFrame(450905, 3, "bot", 1, 1, 0)
CreateAddFrame(1321546, 4, "air", 0, 1, 1)
CreateAddFrame(132097, 5, "doom", .5, .5, .5)

local function Update(passed, t)
	for tag, waves in pairs(t) do
		local found = false
		for i = 1, #waves do
			if not found then
				if passed < waves[i][1] then
					local add = waves[i][2]
					local dur, v
					
					if i == 1 then
						dur = waves[i][1]
						v = passed
					else
						dur = waves[i][1] - waves[i-1][1]
						v = passed - waves[i-1][1]
					end
					
					if Frame[tag].old_wave ~= i then
						Frame[tag]:SetMinMaxValues(0, dur)
						Frame[tag].index:SetText("["..i.."]")
						if tag == "doom" then
							Frame[tag].name:SetText(string.format(str, ARM_CDB["Eonar_Texts"][i][1],ARM_CDB["Eonar_Texts"][i][2],ARM_CDB["Eonar_Texts"][i][3],ARM_CDB["Eonar_Texts"][i][4]))
						else
							Frame[tag].name:SetText(add)
						end
						Frame[tag].old_wave = i	
					end
					
					Frame[tag].dur:SetText(format("%d", dur-v))
					Frame[tag]:SetValue(v)

					found = true
				end
			end
		end		
	end
end

local function Start(difficultyID)
	start = time()
	
	Frame:SetScript("OnUpdate", function(f, e)
		f.t = f.t - e
		if f.t <= 0 then
		
			local passed = time() - start
			
			if difficultyID == 15 then -- Heroic
				Update(passed, timersHeroic)
			elseif difficultyID == 16 then -- Mythic
				Update(passed, timersMythic)
			end
			
			f.t = .3
		end
	end)
	
	Frame:Show()
end

local function Stop()
	Frame:Hide()
	Frame["top"].old_wave = 0
	Frame["mid"].old_wave = 0
	Frame["bot"].old_wave = 0
	Frame["air"].old_wave = 0
	Frame["doom"].old_wave = 0
	Frame:SetScript("OnUpdate", nil)
end

Frame.Visibility = function(event, ...)
	if Frame.enable then
		if event == "ENCOUNTER_START" then
			local encounterID, encounterName, difficultyID, groupSize = ...
			if encounterID == 2075 then
				if difficultyID == 16 then
					Frame["doom"]:Show()
					Start(difficultyID)
				else
					Frame["doom"]:Hide()
					Start(difficultyID)
				end
			end
		elseif event == "ENCOUNTER_END" then
			Stop()
		end
	end
end

Frame.Edit = function()
	if not ARM_CDB["General"]["disable_all"] and ARM_CDB["BossMod"]["Eonar_Alert"] then
		Frame:RegisterEvent("ENCOUNTER_START")
		Frame:RegisterEvent("ENCOUNTER_END")
		Frame.enable = true
	else
		Frame:UnregisterEvent("ENCOUNTER_START")
		Frame:UnregisterEvent("ENCOUNTER_END")
		Frame.enable = false
		Stop()
	end
end

Frame:RegisterEvent("PLAYER_ENTERING_WORLD")
Frame:SetScript("OnEvent", function(self, event, ...)
	if event == "PLAYER_ENTERING_WORLD" then
		Frame.Edit()
		Frame:Hide()
		Frame:UnregisterEvent("PLAYER_ENTERING_WORLD")
	elseif event == "ENCOUNTER_START" or event == "ENCOUNTER_END" then
		Frame.Visibility(event, ...)
	end
end)

Frame.StartTest = function()
	Frame["doom"]:Show()
	Start(16)	
	C_Timer.After(10, function()
		Stop()
	end)
end
G.Test["bossmod_5"] = Frame

local bu = T.Create_BossMod_Options(options, L["技能提示"], "Eonar_Alert", 30, -670)
bu.apply = Frame.Edit
table.insert(G.RM_Frames, Frame)

local Config = CreateFrame("Frame", nil, options)
Config:SetPoint("TOPLEFT", G.gui, "TOPLEFT", -255, 0)
Config:SetPoint("BOTTOMRIGHT", G.gui, "BOTTOMLEFT", -5, 0)
T.createborder(Config)

T.CreateTitle(Config, L["上船安排"], -20)

for j = 1, 4 do
	T.CreateTitle(Config, string.format(L["上船"], j), 110-j*160)
	for i = 1, 4 do
		T.createeditbox(Config, 20, 110-j*160-30*i, icons[i], "Eonar_Texts", j, i)
	end
end

T.createbu(Config, "Eonar_Texts", L["上船安排"])