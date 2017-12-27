local T, C, L, G = unpack(select(2, ...))

local addon_name = G.addon_name
local options = T.CreateOptions(EJ_GetEncounterInfo(1983), G.gui, -20, -390, -550)

-- icons
T.CreateAura(options, "HARMFUL", "player", 243968, "Varimathras_aura_243968", 1, 0, 0, false, false, "", "all", "TOPLEFT", 30, -50) -- 烈焰折磨
T.CreateAura(options, "HARMFUL", "player", 243977, "Varimathras_aura_243977", 0, 1, 1, false, false, "", "all", "TOPLEFT", 30, -85) -- 冰霜折磨
T.CreateAura(options, "HARMFUL", "player", 243980, "Varimathras_aura_243980", 0, 1, 0, false, false, "", "all", "TOPLEFT", 30, -120) -- 邪能折磨
T.CreateAura(options, "HARMFUL", "player", 243973, "Varimathras_aura_243973", .5, 0, .5, false, false, "", "all", "TOPLEFT", 30, -155) -- 暗影折磨
T.CreateAura(options, "HARMFUL", "player", 243961, "Varimathras_aura_243961", 1, 0, 1, true, false, "", "all", "TOPLEFT", 30, -190) -- 哀难
T.CreateAura(options, "HARMFUL", "player", 244094, "Varimathras_aura_244094", 1, 1, 0, true, false, L["出人群"], "all", "TOPLEFT", 30, -225) -- 冥魂之拥
T.CreateAuras(options, "HARMFUL", 244094, "Varimathras_auras_244094", 1, 1, 1, true, false, "all", "TOPLEFT", 30, -260) -- 冥魂之拥
T.CreateAura(options, "HARMFUL", "player", 248732, "Varimathras_aura_248732", 1, 1, 1, true, false, "", 16, "TOPLEFT", 30, -295) -- 毁灭回响
T.CreateLog(options, "SPELL_AURA_APPLIED", 248740, "player", 2, "Varimathras_logs_248740", 1, 0.5, 0, L["快走开"], 16, "TOPLEFT", 30, -330) -- 毁灭回响

T.CreateLog(options, "SPELL_AURA_APPLIED", 244005, "player", 2, "Varimathras_logs_244005", 1, 0.5, 0, L["快走开"], "all", "TOPLEFT", 430, -50) -- 黑暗裂隙
T.CreateAura(options, "HARMFUL", "player", 244042, "Varimathras_aura_244042",  1, 0, 1, true, false, "", "all", "TOPLEFT", 430, -85) -- 被标记的猎物

-- sounds
T.CreateSoundFrame(options, 30, -420, nil, "8_243968", "COMBAT_LOG_EVENT_UNFILTERED", 243968, "SPELL_AURA_APPLIED", G.PlayerName) -- 烈焰折磨
T.CreateSoundFrame(options, 30, -450, nil, "8_243977", "COMBAT_LOG_EVENT_UNFILTERED", 243977, "SPELL_AURA_APPLIED", G.PlayerName) -- 冰霜折磨
T.CreateSoundFrame(options, 30, -480, nil, "8_243980", "COMBAT_LOG_EVENT_UNFILTERED", 243980, "SPELL_AURA_APPLIED", G.PlayerName) -- 邪能折磨
T.CreateSoundFrame(options, 30, -510, nil, "8_243973", "COMBAT_LOG_EVENT_UNFILTERED", 243973, "SPELL_AURA_APPLIED", G.PlayerName) -- 暗影折磨
T.CreateSoundFrame(options, 230, -420, nil, "8_243961", "COMBAT_LOG_EVENT_UNFILTERED", 243961, "SPELL_AURA_APPLIED", G.PlayerName) -- 哀难
T.CreateSoundFrame(options, 230, -450, nil, "8_243960", "COMBAT_LOG_EVENT_UNFILTERED", 243960, "SPELL_CAST_SUCCESS") -- 暗影突击
T.CreateSoundFrame(options, 230, -480, nil, "8_244093", "COMBAT_LOG_EVENT_UNFILTERED", 244093, "SPELL_CAST_START") -- 冥魂之拥
T.CreateSoundFrame(options, 230, -510, nil, "8_244094", "COMBAT_LOG_EVENT_UNFILTERED", 244094, "SPELL_AURA_REMOVED", G.PlayerName) -- 冥魂之拥消失
T.CreateSoundFrame(options, 430, -420, nil, "8_244042", "COMBAT_LOG_EVENT_UNFILTERED", 244042, "SPELL_CAST_SUCCESS") -- 被标记的猎物
T.CreateSoundFrame(options, 430, -450, nil, "8_248732", "COMBAT_LOG_EVENT_UNFILTERED", 248732, "SPELL_AURA_APPLIED", G.PlayerName) -- 毁灭回响
T.CreateSoundFrame(options, 430, -480, nil, "8_248740", "COMBAT_LOG_EVENT_UNFILTERED", 248740, "SPELL_AURA_APPLIED", G.PlayerName) -- 毁灭回响(踩水)
T.CreateSoundFrame(options, 430, -510, nil, "8_243999", "COMBAT_LOG_EVENT_UNFILTERED", 243999, "SPELL_CAST_START") -- 黑暗裂隙
T.CreateSoundFrame(options, 630, -420, nil, "8_244005", "COMBAT_LOG_EVENT_UNFILTERED", 244005, "SPELL_AURA_APPLIED", G.PlayerName) -- 黑暗裂隙(踩水)


-- power
pp_range = {
	{ ul = 100, ll = 85, tip = L["准备暗影突袭"]},
}

T.CreatePPAlertframe(options, 2069, "122366", "boss_1983", "boss1", "122366", pp_range, 30, -580)

-- hl icon on raid
T.Create_HL_EventFrame(options, "hl_244094_d", 30, -610, nil, "COMBAT_LOG_EVENT_UNFILTERED", 244094, "SPELL_AURA_APPLIED")   -- 冥魂之拥

-- chat msg
T.Create_ChatMsgSpells_Options(options, 244042, 30, -640) -- 被标记的猎物
T.Create_ChatMsgSpells_Options(options, 244094, 30, -670) -- 冥魂之拥
T.Create_ChatMsgSpells_Options(options, 248732, 30, -700) -- 毁灭回响

-- 冥魂之拥
local difficulty = 0
local debuff_i = 0

local Frame = CreateFrame("Frame", G.addon_name.."Varimathras_Alert", G.FrameHolder)
Frame:SetSize(80, 80)

Frame.movingname = string.format(L["提示框"] , EJ_GetEncounterInfo(1983))
Frame.point = { a1 = "CENTER", parent = "UIParent", a2 = "CENTER", x = 0, y = 100 }
T.CreateDragFrame(Frame)

Frame.icon = Frame:CreateTexture(nil, "OVERLAY")	
Frame.icon:SetAllPoints()
Frame.icon:SetTexture("Interface\\TargetingFrame\\UI-RaidTargetingIcons")
SetRaidTargetIconTexture(Frame.icon, 0)

local function Reset()
	debuff_i = 0
	SetRaidTargetIconTexture(Frame.icon, 0)
end

local function Update(event, ...)
	if event == "COMBAT_LOG_EVENT_UNFILTERED" then
		local _, Event_type, _, _, _, _, _, _, DestName, _, _, SpellID = ...
		if Event_type == "SPELL_AURA_APPLIED" and SpellID == 244094 then
			local num

			
			if difficulty == 16 then
				num = 2
			else
				num = 1
			end
			
			if debuff_i < num then
				debuff_i = debuff_i + 1
				local targeticon
				if debuff_i == 1 then
					targeticon = 3
				else
					targeticon = 6
				end
				
				if UnitIsGroupLeader("player") then
					SetRaidTarget(DestName, targeticon) 
				end
				
				if DestName == G.PlayerName then
					C_Timer.After(.2, function()
						local myicon = GetRaidTargetIndex("player")
						T.SendChatMsg("{rt"..myicon.."}{rt"..myicon.."}{rt"..myicon.."}","YELL", 3)
						SetRaidTargetIconTexture(Frame.icon, myicon)
					end)
					C_Timer.After(10, function() SetRaidTargetIconTexture(Frame.icon, 0) end)
				end		
			end
		elseif Event_type == "SPELL_CAST_START" and SpellID == 244093 then
			debuff_i = 0
		end
	elseif event == "ENCOUNTER_START" then
		Reset()
	elseif event == "ENCOUNTER_END" then
		Reset()
	end
end

Frame.Visibility = function(event, ...)
	local show = false
	
	if Frame.enable then
		if event == "ENCOUNTER_START" then
			local encounterID, encounterName, difficultyID, groupSize = ...
			if encounterID == 2069 then
				show = true
				difficulty = difficultyID
			end
		elseif event == "ENCOUNTER_END" then
			show = false
		else
			local guid = UnitGUID("boss1")
			if guid then
				local NPC_ID = select(6, strsplit("-", UnitGUID("boss1")))
				if NPC_ID == "122366" then
					show = true
					difficulty = select(3, GetInstanceInfo())
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
	if not ARM_CDB["General"]["disable_all"] and ARM_CDB["BossMod"]["Varimathras_Alert"] then
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
	SetRaidTargetIconTexture(Frame.icon, 1)
	C_Timer.After(10, function()
		SetRaidTargetIconTexture(Frame.icon, 0)
	end)
end
G.Test["bossmod_8"] = Frame

local bu = T.Create_BossMod_Options(options, L["技能提示"], "Varimathras_Alert", 230, -580)
bu.apply = Frame.Edit
table.insert(G.RM_Frames, Frame)