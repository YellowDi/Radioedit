local T, C, L, G = unpack(select(2, ...))

local addon_name = G.addon_name
local font = G.Font

G.Test = {}
G.Icons = {}
G.Texts = {}
G.HP_frames = {}
G.PP_frames = {}
G.RM_Frames = {}
local WHISPER = {}

local Boss = {
	["Test"]			 = {engageID = 1810, boss1 = "91784"},
	["Worldbreaker"]	 = {engageID = 2076, boss1 = "122450"},
	["Felhounds"]   	 = {engageID = 2074, boss1 = "122477"},
	["HighCommand"]		 = {engageID = 2070, boss1 = "122367"},
	["Hasabel"]			 = {engageID = 2064, boss1 = "122104"},
	["Eonar"] 			 = {engageID = 2075, boss1 = "122500"},
	["Imonar"]			 = {engageID = 2082, boss1 = "124158"},
	["Kingaroth"]		 = {engageID = 2088, boss1 = "122578"},
	["Varimathras"] 	 = {engageID = 2069, boss1 = "122366"},
	["CovenofShivarra"]  = {engageID = 2073, boss1 = "122468"},
	["Aggramar"]	     = {engageID = 2063, boss1 = "121975"},
	["Argus"]			 = {engageID = 2092, boss1 = "124828"},
}

----------------------------------------------------------
-----------------[[    Frame Holder    ]]------------------
----------------------------------------------------------
local FrameHolder = CreateFrame("Frame", addon_name.."FrameHolder", UIParent)
G.FrameHolder = FrameHolder

local update_rate = 0.3
local glow_updaterate = 0.05
local glow_value = 0
G.glow_value = glow_value

FrameHolder:SetScript("OnUpdate", function(self, e)
	glow_updaterate = glow_updaterate - e
	if glow_updaterate <= 0 then
		glow_value = glow_value + 0.05
		if glow_value >= .5 then
			glow_value = -.5
		end
		glow_updaterate = 0.05
	end
end)

T.UpdateAll = function()
	if ARM_CDB["General"]["disable_all"] then
		FrameHolder:Hide()
	else
		FrameHolder:Show()
	end
	-- update
	T.EditAlertFrame("all")
	T.EditTextFrame("all")
	T.EditPowerFrame("all")
	T.EditHealthPercFrame("all")
	--T.EditGroupSharingFrame("all")
	T.Edit_BossMods()
end

FrameHolder:RegisterEvent("RAID_BOSS_WHISPER")
FrameHolder:RegisterEvent("PLAYER_ENTERING_WORLD")
FrameHolder:SetScript("OnEvent", function(self, event, ...)
	if event == "PLAYER_ENTERING_WORLD" then
		T.UpdateAll()
		FrameHolder:UnregisterEvent("PLAYER_ENTERING_WORLD")
	elseif event == "RAID_BOSS_WHISPER" then
		local Msg = ...
		for i = 1, #WHISPER do
			if Msg and Msg:find(WHISPER[i]) then
				SendAddonMessage("arm_hl_raid", WHISPER[i], "RAID")
				break
			end
		end
	end
end)

----------------------------------------------------------
-----------------[[    Alert Frame    ]]------------------
----------------------------------------------------------

local AlertFrame = CreateFrame("Frame", addon_name.."AlertFrame", FrameHolder)
AlertFrame:SetSize(70,70)

AlertFrame.movingname = L["图标提示"]
AlertFrame.point = { a1 = "BOTTOMRIGHT", parent = "UIParent", a2 = "CENTER", x = -300, y = 60 }
T.CreateDragFrame(AlertFrame)

T.EditAlertFrame = function(option)
	if option == "all" or option == "icon_size" then
		AlertFrame:SetSize(ARM_CDB["AlertFrame"]["icon_size"], ARM_CDB["AlertFrame"]["icon_size"])
	end
	for k, frame in pairs(G.Icons) do
		frame.update_onedit(option)
	end
end

AlertFrame.ActiveIcons = {}
AlertFrame.LineUpIcons = function()
	local lastframe
	local grow_dir = ARM_CDB["AlertFrame"]["grow_dir"]
	local space = ARM_CDB["AlertFrame"]["icon_space"]
	for v, frame in T.pairsByKeys(AlertFrame.ActiveIcons) do
		frame:ClearAllPoints()
		if not lastframe then
			frame:SetPoint(grow_dir, AlertFrame, grow_dir)
		elseif grow_dir == "BOTTOM" then
			frame:SetPoint(grow_dir, lastframe, "TOP", 0, space)
		else
			frame:SetPoint(grow_dir, lastframe, "BOTTOM", 0, -space)
		end
		lastframe = frame
	end
end

AlertFrame.QueueIcon = function(frame)
	frame:HookScript("OnShow", function()
		AlertFrame.ActiveIcons[frame.v] = frame
		AlertFrame.LineUpIcons()
	end)
	
	frame:HookScript("OnHide", function()
		AlertFrame.ActiveIcons[frame.v] = nil
		AlertFrame.LineUpIcons()
	end)
end

T.CreateAlertIcon = function(spellID, r, g, b, v)
	local frame = CreateFrame("Frame", nil, AlertFrame)
	frame:SetSize(70,70)
	frame:Hide()
	T.createborder(frame)
	
	frame.spell_name, _, frame.spell_icon = GetSpellInfo(spellID)
	frame.v = v
	frame.t = 0
	
	local boss_name = strsplit("_", v)
	if Boss[boss_name] then
		frame.engageID = Boss[boss_name]["engageID"]
		frame.npcID = Boss[boss_name]["boss1"]
	end
	
	frame.glow = frame:CreateTexture(nil, "OVERLAY")
	frame.glow:SetPoint("TOPLEFT", -25, 25)
	frame.glow:SetPoint("BOTTOMRIGHT", 25, -25)
	frame.glow:SetAlpha(1)
	frame.glow:SetTexture([[Interface\SpellActivationOverlay\IconAlert]])
	frame.glow:SetTexCoord(0.00781250, 0.50781250, 0.27734375, 0.52734375)

	frame.texture = frame:CreateTexture(nil, "ARTWORK")
	frame.texture:SetTexCoord( .1, .9, .1, .9)
	frame.texture:SetAllPoints()
	frame.texture:SetTexture(frame.spell_icon)
	
	frame.bottomtext = T.createtext(frame, "OVERLAY", 12, "OUTLINE", "CENTER")
	frame.bottomtext:SetPoint("BOTTOM", frame, "BOTTOM", 0, 10)
	frame.bottomtext:SetWidth(60)
	frame.bottomtext:SetTextColor(1, 1, 0)
	frame.bottomtext:SetText(frame.spell_name)
	
	frame.text = T.createtext(frame, "OVERLAY", 40, "OUTLINE", "LEFT")
	frame.text:SetPoint("LEFT", frame, "RIGHT", 10, 0)
	frame.text:SetTextColor(r, g, b)
	frame.text:SetWidth(500)
	
	return frame
end

T.CreateTestIcon = function(spellID, v, dur, count, hl, r, g, b, tip)

	local frame = T.CreateAlertIcon(spellID, r, g, b, v)

	frame.reset = function()
		frame:Hide()
		frame.exp = false
		frame.remain = false
	end
	
	frame.update_onedit = function()
		frame.enable = ARM_CDB["AlertFrame"]["enable"]
		if frame.enable then
			frame:RegisterEvent("CHAT_MSG_ADDON")
		else
			frame:UnregisterEvent("CHAT_MSG_ADDON")
		end		
		
		frame.hl = hl
		if frame.hl then
			frame.glow:Show()
		else
			frame.glow:Hide()
		end			
		
		frame:SetSize(ARM_CDB["AlertFrame"]["icon_size"], ARM_CDB["AlertFrame"]["icon_size"])
		frame.glow:SetPoint("TOPLEFT", -ARM_CDB["AlertFrame"]["icon_size"]/3, ARM_CDB["AlertFrame"]["icon_size"]/3)
		frame.glow:SetPoint("BOTTOMRIGHT", ARM_CDB["AlertFrame"]["icon_size"]/3, -ARM_CDB["AlertFrame"]["icon_size"]/3)					
		
	
		frame.text:SetFont(G.Font, ARM_CDB["AlertFrame"]["font_size"], "OUTLINE")
		frame.bottomtext:SetFont(G.Font, ARM_CDB["AlertFrame"]["ifont_size"], "OUTLINE")
		
		AlertFrame.LineUpIcons()
	end
	
	frame.update_onevent = function()
		if frame.enable then
			frame.exp = time() + dur
			frame.remain = dur
			frame:Show()	
		else
			frame.reset()
		end
	end
	
	frame.update_onframe = function()
		if frame.enable and frame.remain and frame.exp then	
			frame.remain = frame.exp - time()
			if count then
				frame.text:SetText("[".. count .."] "..T.FormatTime(frame.remain) or ""..tip)
			else
				frame.text:SetText(T.FormatTime(frame.remain) or ""..tip)
			end
			
			if frame.hl then
				frame.glow:SetAlpha(1-math.abs(glow_value))
			end
			if frame.remain <= 0 then
				frame.reset()
			end
		else
			frame.reset()
		end
	end
	
	frame.StartTest = function()
		frame.update_onevent()
	end
	
	frame:SetScript("OnUpdate", function(self, e)
		frame.t = frame.t + e
		if frame.t > update_rate then	
			frame.update_onframe()
			frame.t = 0
		end
	end)
	
	AlertFrame.QueueIcon(frame)	
	
	G.Icons[v] = frame
	G.Test[v] = frame
	
	return frame
end

T.CreateAura = function(option_page, aura_type, unit, spellID, v, r, g, b, show_time, show_count, tip, difficulty, ...)
	local frame = T.CreateAlertIcon(spellID, r, g, b, v)
	
	frame.reset = function()
		frame:Hide()
		frame.count = false
		frame.dur = false
		frame.exp = false
		frame.remain = false
	end
	
	frame.update_onedit = function(option)
		if option == "all" or option == "enable" then
		
			frame.enable = ARM_CDB["Icons"][v]["enable"] and ARM_CDB["AlertFrame"]["enable"]
			if frame.enable then		
				frame:RegisterEvent("ENCOUNTER_START")
				frame:RegisterEvent("ENCOUNTER_END")				
			else
				frame:UnregisterEvent("ENCOUNTER_START")
				frame:UnregisterEvent("ENCOUNTER_END")		
			end
			
			frame.update_onevent("INIT")
		end
		
		if option == "all" or option == "hl" then
			frame.hl = ARM_CDB["Icons"][v]["hl"]
			if frame.hl then
				frame.glow:Show()
			else
				frame.glow:Hide()
			end			
		end
		
		if option == "all" or option == "icon_size" then
			frame:SetSize(ARM_CDB["AlertFrame"]["icon_size"], ARM_CDB["AlertFrame"]["icon_size"])
			frame.glow:SetPoint("TOPLEFT", -ARM_CDB["AlertFrame"]["icon_size"]/3, ARM_CDB["AlertFrame"]["icon_size"]/3)
			frame.glow:SetPoint("BOTTOMRIGHT", ARM_CDB["AlertFrame"]["icon_size"]/3, -ARM_CDB["AlertFrame"]["icon_size"]/3)
		end
		
		if option == "all" or option == "font_size" then
			frame.text:SetFont(G.Font, ARM_CDB["AlertFrame"]["font_size"], "OUTLINE")
		end
		
		if option == "all" or option == "ifont_size" then
			frame.bottomtext:SetFont(G.Font, ARM_CDB["AlertFrame"]["ifont_size"], "OUTLINE")
		end
		
		if option == "all" or option == "grow_dir" or option == "icon_space" then
			AlertFrame.LineUpIcons()
		end
	end
	
	frame.Update = function()
		if frame.enable and UnitAura(unit, frame.spell_name, nil, aura_type) then 
			frame.count, _, frame.dur, frame.exp = select(4, UnitAura(unit, frame.spell_name, nil, aura_type))
			
			if frame.dur == 0 then -- infinite
				frame.remain = "inf"
			elseif frame.dur and frame.exp then
				frame.remain = frame.exp - GetTime()
			else
				frame.remain = 0
			end
			
			frame:Show()
		else
			frame.reset()
		end
	end
	
	frame.update_onevent = function(event, ...)
		if event == "INIT" then
			local guid = UnitGUID("boss1")
			if guid then
				local NPC_ID = select(6, strsplit("-", UnitGUID("boss1")))
				local difficultyID = select(3, GetInstanceInfo())
				if NPC_ID == frame.npcID and (difficulty == "all" or difficulty == difficultyID) then
					frame:RegisterEvent("UNIT_AURA")
					if unit == "target" then
						frame:RegisterEvent("PLAYER_TARGET_CHANGED")
					end		
				end
				frame.Update()
			end
		elseif event == "ENCOUNTER_START" then
			local encounterID, encounterName, difficultyID, groupSize = ...
			if encounterID == frame.engageID and (difficulty == "all" or difficulty == difficultyID) then
				frame:RegisterEvent("UNIT_AURA")
				if unit == "target" then
					frame:RegisterEvent("PLAYER_TARGET_CHANGED")
				end
			end
		elseif event == "ENCOUNTER_END" then
			local encounterID, encounterName, difficultyID, groupSize = ...
			if encounterID == frame.engageID then
				frame:UnregisterEvent("UNIT_AURA")
				if unit == "target" then
					frame:UnregisterEvent("PLAYER_TARGET_CHANGED")	
				end
				frame.reset()
			end
		elseif event == "UNIT_AURA" then
			local u = ...
			if u == unit then
				frame.Update()
			end
		end
	end
	
	frame.update_onframe = function()
		if frame.enable and frame.remain and frame.exp then
			if frame.remain ~= "inf" then
				frame.remain = frame.exp - GetTime()
				local count = show_count and ("["..frame.count.."] ") or ""
				local time = show_time and (frame.remain == "inf" and "…" or (T.FormatTime(frame.remain).." ")) or ""
				frame.text:SetText(count..time..tip or "")
				
				if frame.hl then
					frame.glow:SetAlpha(1-math.abs(glow_value))
				end
				if frame.remain <= 0 then
					frame.reset()
				end
			end
		else
			frame.reset()
		end
	end

	frame:SetScript("OnEvent", function(self, event, ...)	
		frame.update_onevent(event, ...)	
	end)
	
	frame:SetScript("OnUpdate", function(self, e)
		frame.t = frame.t + e
		if frame.t > update_rate then	
			frame.update_onframe()
			frame.t = 0
		end
	end)
	
	AlertFrame.QueueIcon(frame)	
	
	G.Icons[v] = frame
	
	local options = T.CreateAlertIconOptions(option_page, spellID, v, difficulty, ...)
	options.tip = tip
	
	return frame, options
end

T.CreateAuras = function(option_page, aura_type, spellID, v, r, g, b, show_time, show_count, difficulty, ...)
	local frame = T.CreateAlertIcon(spellID, r, g, b, v)
	frame.text:SetFont(G.Font, 20, "OUTLINE")
	frame.num = 0
	
	frame.reset = function()
		frame:Hide()
		frame.num = 0
		frame.str = ""
	end
	
	frame.update_onedit = function(option)
		if option == "all" or option == "enable" then
		
			frame.enable = ARM_CDB["Icons"][v]["enable"] and ARM_CDB["AlertFrame"]["enable"]
			if frame.enable then		
				frame:RegisterEvent("ENCOUNTER_START")
				frame:RegisterEvent("ENCOUNTER_END")				
			else
				frame:UnregisterEvent("ENCOUNTER_START")
				frame:UnregisterEvent("ENCOUNTER_END")		
			end
			
			frame.update_onevent("INIT")		
		end
		
		if option == "all" or option == "hl" then
			frame.hl = ARM_CDB["Icons"][v]["hl"]
			if frame.hl then
				frame.glow:Show()
			else
				frame.glow:Hide()
			end			
		end
		
		if option == "all" or option == "icon_size" then
			frame:SetSize(ARM_CDB["AlertFrame"]["icon_size"], ARM_CDB["AlertFrame"]["icon_size"])
			frame.glow:SetPoint("TOPLEFT", -ARM_CDB["AlertFrame"]["icon_size"]/3, ARM_CDB["AlertFrame"]["icon_size"]/3)
			frame.glow:SetPoint("BOTTOMRIGHT", ARM_CDB["AlertFrame"]["icon_size"]/3, -ARM_CDB["AlertFrame"]["icon_size"]/3)			
		end
		
		if option == "all" or option == "font_size" then
			frame.text:SetFont(G.Font, ARM_CDB["AlertFrame"]["font_size"]/2, "OUTLINE")
		end
		
		if option == "all" or option == "ifont_size" then
			frame.bottomtext:SetFont(G.Font, ARM_CDB["AlertFrame"]["ifont_size"], "OUTLINE")
		end
		
		if option == "all" or option == "grow_dir" or option == "icon_space" then
			AlertFrame.LineUpIcons()
		end
	end
	
	frame.players = {}
	frame.update_onevent = function(event, ...)
		if event == "INIT" then
			local guid = UnitGUID("boss1")
			if guid then
				local NPC_ID = select(6, strsplit("-", UnitGUID("boss1")))
				local difficultyID = select(3, GetInstanceInfo())
				if NPC_ID == frame.npcID and (difficulty == "all" or difficulty == difficultyID) then
					frame:RegisterEvent("UNIT_AURA")
				end
			end
		elseif event == "ENCOUNTER_START" then
			local encounterID, encounterName, difficultyID, groupSize = ...
			if encounterID == frame.engageID and (difficulty == "all" or difficulty == difficultyID) then
				frame:RegisterEvent("UNIT_AURA")
			end
		elseif event == "ENCOUNTER_END" then
			local encounterID, encounterName, difficultyID, groupSize = ...
			if encounterID == frame.engageID then
				frame:UnregisterEvent("UNIT_AURA")
				frame.reset()
			end	
		elseif event == "UNIT_AURA" then
			if frame.enable then
				local unitID = ...
				if unitID and unitID:find("raid") then	
					local player = UnitName(unitID)
					if UnitAura(unitID, frame.spell_name, nil, aura_type) then
						if not frame.players[player] then
							frame.players[player] = {}
							frame.players[player].dur, frame.players[player].exp = select(6, UnitAura(unitID, frame.spell_name, nil, aura_type))
							
							if frame.players[player].dur == 0 then -- infinite
								frame.players[player].remain = "inf"
							elseif frame.players[player].dur and frame.players[player].exp then
								frame.players[player].remain = frame.players[player].exp - GetTime()
							else
								frame.players[player].remain = 0
							end
							frame.num = frame.num + 1
						end					
					else
						if frame.players[player] then
							frame.players[player] = nil
							frame.num = frame.num - 1
						end
					end
				
					if frame.num > 0 then
						frame:Show()
					else
						frame.reset()
					end
				end
			else
				frame.reset()
			end
		end
	end
	
	frame.update_onframe = function()
		if frame.enable and frame.num > 0 then
			frame.str = ""
			
			for player, info in pairs(frame.players) do
			
				frame.players[player].count = select(4, UnitAura(player, frame.spell_name, nil, aura_type))
				
				if frame.players[player].remain ~= "inf" then					
					frame.players[player].remain = frame.players[player].exp - GetTime()
					if frame.players[player].remain <= 0 then
						frame.players[player] = nil
						frame.num = frame.num - 1
					end
				end
				
				if frame.players[player] then
					if frame.players[player].remain == "inf" or frame.players[player].remain > 0 then
						local n, c, t
						
						n = T.ColorName(player).." "
						
						if show_count and frame.players[player].count then
							c = "["..frame.players[player].count.."] "
						else
							c = ""
						end
						if show_time and frame.players[player].remain then
							if frame.players[player].remain == "inf" then
								t = "…" 
							else
								t = T.FormatTime(frame.players[player].remain).." "
							end
						else
							t = ""
						end

						if frame.str == "" then
							frame.str = n..c..t
						else
							frame.str = frame.str.."\n"..n..c..t
						end
					end
				end
			end
			
			frame.text:SetText(frame.str)
			
			if frame.hl then
				frame.glow:SetAlpha(1-math.abs(glow_value))
			end
			
		else
			frame.reset()
		end
	end
	
	frame:SetScript("OnEvent", function(self, event, ...)
		frame.update_onevent(event, ...)
	end)
	
	frame:SetScript("OnUpdate", function(self, e)
		frame.t = frame.t + e
		if frame.t > update_rate then	
			frame.update_onframe()
			frame.t = 0
		end
	end)
	
	AlertFrame.QueueIcon(frame)	
	
	G.Icons[v] = frame
	
	local options = T.CreateAlertIconOptions(option_page, spellID, v, difficulty, ...)
	
	return frame, options
end

T.CreateLog = function(option_page, event_type, spellID, targetID, dur, v, r, g, b, tip, difficulty, ...)
	local frame = T.CreateAlertIcon(spellID, r, g, b, v)
	
	frame.dur = dur
	
	frame.reset = function()
		frame:Hide()
		frame.exp = false
		frame.remain = false
		frame.target = false
	end
	
	frame.update_onedit = function(option)
		if option == "all" or option == "enable" then
		
			frame.enable = ARM_CDB["Icons"][v]["enable"] and ARM_CDB["AlertFrame"]["enable"]
			if frame.enable then		
				frame:RegisterEvent("ENCOUNTER_START")
				frame:RegisterEvent("ENCOUNTER_END")				
			else
				frame:UnregisterEvent("ENCOUNTER_START")
				frame:UnregisterEvent("ENCOUNTER_END")		
			end			
			
			frame.update_onevent("INIT")
		end
		
		if option == "all" or option == "hl" then
			frame.hl = ARM_CDB["Icons"][v]["hl"]
			if frame.hl then
				frame.glow:Show()
			else
				frame.glow:Hide()
			end			
		end
		
		if option == "all" or option == "icon_size" then
			frame:SetSize(ARM_CDB["AlertFrame"]["icon_size"], ARM_CDB["AlertFrame"]["icon_size"])
			frame.glow:SetPoint("TOPLEFT", -ARM_CDB["AlertFrame"]["icon_size"]/3, ARM_CDB["AlertFrame"]["icon_size"]/3)
			frame.glow:SetPoint("BOTTOMRIGHT", ARM_CDB["AlertFrame"]["icon_size"]/3, -ARM_CDB["AlertFrame"]["icon_size"]/3)
		end
		
		if option == "all" or option == "font_size" then
			frame.text:SetFont(G.Font, ARM_CDB["AlertFrame"]["font_size"], "OUTLINE")
		end
		
		if option == "all" or option == "ifont_size" then
			frame.bottomtext:SetFont(G.Font, ARM_CDB["AlertFrame"]["ifont_size"], "OUTLINE")
		end
		
		if option == "all" or option == "grow_dir" or option == "icon_space" then
			AlertFrame.LineUpIcons()
		end
	end
	
	frame.update_onevent = function(event, ...)
		if event == "INIT" then
			local guid = UnitGUID("boss1")
			if guid then
				local NPC_ID = select(6, strsplit("-", UnitGUID("boss1")))
				local difficultyID = select(3, GetInstanceInfo())
				if NPC_ID == frame.npcID and (difficulty == "all" or difficulty == difficultyID) then
					frame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
				end
			end
		elseif event == "ENCOUNTER_START" then
			local encounterID, encounterName, difficultyID, groupSize = ...
			if encounterID == frame.engageID and (difficulty == "all" or difficulty == difficultyID) then
				frame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
			end
		elseif event == "ENCOUNTER_END" then
			local encounterID, encounterName, difficultyID, groupSize = ...
			if encounterID == frame.engageID then
				frame:UnregisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
				frame.reset()
			end
		elseif event == "COMBAT_LOG_EVENT_UNFILTERED" then
			if frame.enable then
				local Time_stamp, Event_type, _, SourceGUID, SourceName, _, _, DestGUID, DestName, _, _, SpellID, SpellName = ...
				if Event_type == event_type and SpellID == spellID then
					if not targetID then
						frame.exp = Time_stamp + frame.dur
						frame.remain = frame.dur
						frame:Show()	
					elseif UnitIsUnit(targetID, DestName) then -- 这里targetID只用于玩家
						frame.target = DestName
						frame.exp = Time_stamp + frame.dur
						frame.remain = frame.dur
						frame:Show()	
					end
				end
			else
				frame.reset()
			end
		end
	end
	
	frame.update_onframe = function()
		if frame.enable and frame.remain and frame.exp then		
			frame.remain = frame.exp - time()
			local time = (T.FormatTime(frame.remain).." ") or ""
			frame.text:SetText(time..tip or "")
			
			if frame.hl then
				frame.glow:SetAlpha(1-math.abs(glow_value))
			end
			if frame.remain <= 0 then
				frame.reset()
			end
		else
			frame.reset()
		end
	end
	
	frame:SetScript("OnEvent", function(self, event, ...)
		frame.update_onevent(event, ...)
	end)
	
	frame:SetScript("OnUpdate", function(self, e)
		frame.t = frame.t + e
		if frame.t > update_rate then	
			frame.update_onframe()
			frame.t = 0
		end
	end)
	
	AlertFrame.QueueIcon(frame)	
	
	G.Icons[v] = frame
	
	local options = T.CreateAlertIconOptions(option_page, spellID, v, difficulty, ...)
	options.tip = tip
		
	return frame, options
end

T.StopLog = function(frame, event, ...)
	frame:HookScript("OnEvent", function(self, event, ...)
		local _, Event_type, _, _, _, _, _, DestGUID = ...
		if Event_type == event then
			if event == "UNIT_DIED" then
				local NPCID = ...
				local npc_id = select(6, strsplit("-", DestGUID))
				if npc_id == NPCID then
					frame.reset()
				end
			end
		end
	end)
end

local CastingEvents = {
	["UNIT_SPELLCAST_START"] = true,
	["UNIT_SPELLCAST_SUCCEEDED"] = true,
	["UNIT_SPELLCAST_FAILED"] = true,
	["UNIT_SPELLCAST_STOP"] = true,
	["UNIT_SPELLCAST_INTERRUPTED"] = true,
	["UNIT_SPELLCAST_CHANNEL_START"] = true,
	["UNIT_SPELLCAST_CHANNEL_STOP"] = true,
}

T.CreateCasting = function(option_page, event, spellID, dur, v, r, g, b, tip, difficulty, ...)
	local frame = T.CreateAlertIcon(spellID, r, g, b, v)
	
	frame.dur = dur
	
	frame.reset = function()
		frame:Hide()
		frame.exp = false
		frame.remain = false
		frame.target = false
	end
	
	frame.update_onedit = function(option)
		if option == "all" or option == "enable" then	
			frame.enable = ARM_CDB["Icons"][v]["enable"] and ARM_CDB["AlertFrame"]["enable"]
			if frame.enable then		
				frame:RegisterEvent("ENCOUNTER_START")
				frame:RegisterEvent("ENCOUNTER_END")				
			else
				frame:UnregisterEvent("ENCOUNTER_START")
				frame:UnregisterEvent("ENCOUNTER_END")		
			end
			
			frame.update_onevent("INIT")
		end
		
		if option == "all" or option == "hl" then
			frame.hl = ARM_CDB["Icons"][v]["hl"]
			if frame.hl then
				frame.glow:Show()
			else
				frame.glow:Hide()
			end			
		end
		
		if option == "all" or option == "icon_size" then
			frame:SetSize(ARM_CDB["AlertFrame"]["icon_size"], ARM_CDB["AlertFrame"]["icon_size"])
			frame.glow:SetPoint("TOPLEFT", -ARM_CDB["AlertFrame"]["icon_size"]/3, ARM_CDB["AlertFrame"]["icon_size"]/3)
			frame.glow:SetPoint("BOTTOMRIGHT", ARM_CDB["AlertFrame"]["icon_size"]/3, -ARM_CDB["AlertFrame"]["icon_size"]/3)			
		end
		
		if option == "all" or option == "font_size" then
			frame.text:SetFont(G.Font, ARM_CDB["AlertFrame"]["font_size"], "OUTLINE")
		end
		
		if option == "all" or option == "ifont_size" then
			frame.bottomtext:SetFont(G.Font, ARM_CDB["AlertFrame"]["ifont_size"], "OUTLINE")
		end
		
		if option == "all" or option == "grow_dir" or option == "icon_space" then
			AlertFrame.LineUpIcons()
		end
	end
	
	frame.update_onevent = function(e, ...)
		if e == "INIT" then
			local guid = UnitGUID("boss1")
			if guid then
				local NPC_ID = select(6, strsplit("-", UnitGUID("boss1")))
				local difficultyID = select(3, GetInstanceInfo())
				if NPC_ID == frame.npcID and (difficulty == "all" or difficulty == difficultyID) then
					if event == "CASTING" then
					for k, j in pairs(CastingEvents) do
						frame:RegisterEvent(k)
						end
					else
						frame:RegisterEvent(event)
					end
				end
			end
		elseif e == "ENCOUNTER_START" then
			local encounterID, encounterName, difficultyID, groupSize = ...
			if encounterID == frame.engageID and (difficulty == "all" or difficulty == difficultyID) then
				if event == "CASTING" then
					for k, j in pairs(CastingEvents) do
						frame:RegisterEvent(k)
					end
				else
					frame:RegisterEvent(event)
				end
			end
		elseif e == "ENCOUNTER_END" then
			local encounterID, encounterName, difficultyID, groupSize = ...
			if encounterID == frame.engageID then
				if event == "CASTING" then
					for k, j in pairs(CastingEvents) do
						frame:UnregisterEvent(k)
					end
				else
					frame:UnregisterEvent(event)
				end	
				frame.reset()
			end
		elseif frame.enable then
			if event == "CASTING" then
				local SpellID = select(5, ...)
				if SpellID == spellID then
					if e == "UNIT_SPELLCAST_START" or e == "UNIT_SPELLCAST_CHANNEL_START" then
						frame.exp = time() + frame.dur
						frame.remain = frame.dur
						frame:Show()
					else
						frame.reset()
					end
				end
			else
				local SpellID = select(5, ...)
				if SpellID == spellID then
					frame.exp = time() + frame.dur
					frame.remain = frame.dur
					frame:Show()
				end
			end
		else
			frame.reset()
		end
	end
	
	frame.update_onframe = function()
		if frame.enable and frame.remain and frame.exp then	
			frame.remain = frame.exp - time()
			local time = (T.FormatTime(frame.remain).." ") or ""
			
			frame.text:SetText(time..tip or "")
			
			if frame.hl then
				frame.glow:SetAlpha(1-math.abs(glow_value))
			end
			
			if frame.remain <= 0 then
				frame.reset()
			end
		else
			frame.reset()
		end
	end
	
	frame:SetScript("OnEvent", function(self, e, ...)
		frame.update_onevent(e, ...)
	end)
	
	frame:SetScript("OnUpdate", function(self, e)
		frame.t = frame.t + e
		if frame.t > update_rate then	
			frame.update_onframe()
			frame.t = 0
		end
	end)
	
	AlertFrame.QueueIcon(frame)	
	
	G.Icons[v] = frame
	
	local options = T.CreateAlertIconOptions(option_page, spellID, v, difficulty, ...)
	options.tip = tip
	
	return frame, options
end

T.CreateBossMsg = function(option_page, event, spellID, msg, dur, v, r, g, b, tip, difficulty, ...)
	local frame = T.CreateAlertIcon(spellID, r, g, b, v)
	
	frame.dur = dur
	
	frame.reset = function()
		frame:Hide()
		frame.exp = false
		frame.remain = false
		frame.target = false
	end
	
	frame.update_onedit = function(option)
		if option == "all" or option == "enable" then	
			frame.enable = ARM_CDB["Icons"][v]["enable"] and ARM_CDB["AlertFrame"]["enable"]
			if frame.enable then		
				frame:RegisterEvent("ENCOUNTER_START")
				frame:RegisterEvent("ENCOUNTER_END")				
			else
				frame:UnregisterEvent("ENCOUNTER_START")
				frame:UnregisterEvent("ENCOUNTER_END")		
			end			
			
			frame.update_onevent("INIT")
		end
		
		if option == "all" or option == "hl" then
			frame.hl = ARM_CDB["Icons"][v]["hl"]
			if frame.hl then
				frame.glow:Show()
			else
				frame.glow:Hide()
			end			
		end
		
		if option == "all" or option == "icon_size" then
			frame:SetSize(ARM_CDB["AlertFrame"]["icon_size"], ARM_CDB["AlertFrame"]["icon_size"])
			frame.glow:SetPoint("TOPLEFT", -ARM_CDB["AlertFrame"]["icon_size"]/3, ARM_CDB["AlertFrame"]["icon_size"]/3)
			frame.glow:SetPoint("BOTTOMRIGHT", ARM_CDB["AlertFrame"]["icon_size"]/3, -ARM_CDB["AlertFrame"]["icon_size"]/3)					
		end
		
		if option == "all" or option == "font_size" then
			frame.text:SetFont(G.Font, ARM_CDB["AlertFrame"]["font_size"], "OUTLINE")
		end
		
		if option == "all" or option == "ifont_size" then
			frame.bottomtext:SetFont(G.Font, ARM_CDB["AlertFrame"]["ifont_size"], "OUTLINE")
		end
		
		if option == "all" or option == "grow_dir" or option == "icon_space" then
			AlertFrame.LineUpIcons()
		end
	end
	
	frame.update_onevent = function(e, ...)
		if e == "INIT" then
			local guid = UnitGUID("boss1")
			if guid then
				local NPC_ID = select(6, strsplit("-", UnitGUID("boss1")))
				local difficultyID = select(3, GetInstanceInfo())
				if NPC_ID == frame.npcID and (difficulty == "all" or difficulty == difficultyID) then
					frame:RegisterEvent(event)
				end
			end
		elseif e == "ENCOUNTER_START" then
			local encounterID, encounterName, difficultyID, groupSize = ...
			if encounterID == frame.engageID and (difficulty == "all" or difficulty == difficultyID) then			
				frame:RegisterEvent(event)
			end
		elseif e == "ENCOUNTER_END" then
			local encounterID, encounterName, difficultyID, groupSize = ...
			if encounterID == frame.engageID then
				frame:UnregisterEvent(event)
				frame.reset()
			end
		elseif e == event then
			local Msg = ...
			if Msg and Msg:find(msg) then
				frame.exp = time() + frame.dur
				frame.remain = frame.dur
				frame:Show()
			end
		end
	end
	
	frame.update_onframe = function()
		if frame.enable and frame.remain and frame.exp then
		
			frame.remain = frame.exp - time()
			local time = (T.FormatTime(frame.remain).." ") or ""			
			frame.text:SetText(time..tip or "")			
			if frame.hl then
				frame.glow:SetAlpha(1-math.abs(glow_value))
			end
			
			if frame.remain <= 0 then
				frame.reset()
			end
		else
			frame.reset()
		end
	end
	
	frame:SetScript("OnEvent", function(self, e, ...)
		frame.update_onevent(e, ...)
	end)
	
	frame:SetScript("OnUpdate", function(self, e)
		frame.t = frame.t + e
		if frame.t > update_rate then	
			frame.update_onframe()	
			frame.t = 0
		end
	end)
	
	AlertFrame.QueueIcon(frame)	
	
	G.Icons[v] = frame
	
	local options = T.CreateAlertIconOptions(option_page, spellID, v, difficulty, ...)
	options.tip = tip
	
	return frame, options
end

T.texture_fix = function(frame, options, spellID, fixspell)
	local name, _, icon = GetSpellInfo(spellID)
	frame.texture:SetTexture(icon)
	options.spell.icon:SetTexture(icon)
	
	if fixspell then
		options.spell.text:SetText(name)
		frame.bottomtext:SetText(name)
		
		options.spell:SetScript("OnEnter", function(self) 
			GameTooltip:SetOwner(self, "ANCHOR_RIGHT",  -20, 10)
			GameTooltip:SetSpellByID(spellID)
			if options.tip then
				GameTooltip:AddLine(" ")
				GameTooltip:AddLine(G.addon_c..options.tip.."|r")
			end
			GameTooltip:Show() 
		end)
	end
end

----------------------------------------------------------
--------------------[[    Text Alert    ]]----------------
----------------------------------------------------------

local TextFrame = CreateFrame("Frame", G.addon_name.."Text_Alert", G.FrameHolder)
TextFrame:SetSize(300,50)
TextFrame.t = 0

TextFrame.movingname = L["醒目文字提示"]
TextFrame.point = { a1 = "CENTER", parent = "UIParent", a2 = "CENTER", x = 0, y = 250 }
T.CreateDragFrame(TextFrame)

T.EditTextFrame = function(option)
	if option == "all" or option == "font_size" then
		TextFrame:SetSize(ARM_CDB["AlertFrame"]["font_size"]*8, ARM_CDB["AlertFrame"]["font_size"])
	end
	
	if option == "all" or option == "flash" then
		if ARM_CDB["TextFrame"]["flash"] then 
			TextFrame:SetScript("OnUpdate", function(self, e)
				self.t = self.t + e
				if self.t > update_rate then	
					self:SetAlpha(1-math.abs(glow_value))
					self.t = 0
				end
			end)
		else
			TextFrame:SetAlpha(1)
			TextFrame:SetScript("OnUpdate", nil)
		end
	end
	
	for k, frame in pairs(G.Texts) do
		frame.update_onedit(option)
	end	
end

TextFrame.ActiveTexts = {}
TextFrame.LineUpTexts = function()
	local lastframe
	for v, frame in T.pairsByKeys(TextFrame.ActiveTexts) do
		frame:ClearAllPoints()
		if not lastframe then
			frame:SetPoint("TOP", TextFrame, "TOP")
		else
			frame:SetPoint("TOP", lastframe, "BOTTOM", 0, -5)
		end
		lastframe = frame
	end
end

TextFrame.QueueText = function(frame)
	frame:HookScript("OnShow", function()
		TextFrame.ActiveTexts[frame.v] = frame
		TextFrame.LineUpTexts()
	end)
	
	frame:HookScript("OnHide", function()
		TextFrame.ActiveTexts[frame.v] = nil
		TextFrame.LineUpTexts()
	end)
end

T.CreateAlertText = function(r, g, b, v)
	local frame = CreateFrame("Frame", nil, TextFrame)
	frame:SetSize(300,50)
	frame:Hide()
	
	local boss_name = strsplit("_", v)
	if Boss[boss_name] then
		frame.engageID = Boss[boss_name]["engageID"]
		frame.npcID = Boss[boss_name]["boss1"]
	end
	
	frame.v = v
	frame.t = 0
	
	frame.text = T.createtext(frame, "OVERLAY", 50, "OUTLINE", "LEFT")
	frame.text:SetPoint("CENTER", frame, "CENTER", 0, 0)
	frame.text:SetTextColor(r, g, b)	
	
	return frame
end

T.CreateBigText = function(option_page, x, y, option_text, v, r, g, b, difficulty, events)

	local frame = T.CreateAlertText(r, g, b, v)
	
	frame.update_onedit = function(option)
		if option == "all" or option == "enable" then
			frame.enable = ARM_CDB["TextFrame"]["enable"]
			if frame.enable then		
				frame:RegisterEvent("ENCOUNTER_START")
				frame:RegisterEvent("ENCOUNTER_END")			
			else
				frame:UnregisterEvent("ENCOUNTER_START")
				frame:UnregisterEvent("ENCOUNTER_END")		
			end
			
			frame.Update_onevent(frame, "INIT")
		end
		
		if option == "all" or option == "font_size" then	
			frame:SetSize(ARM_CDB["AlertFrame"]["font_size"]*8, ARM_CDB["TextFrame"]["font_size"])
			frame.text:SetFont(G.Font, ARM_CDB["TextFrame"]["font_size"], "OUTLINE")
		end
		
		TextFrame.LineUpTexts()
	end
	
	frame.Update_onevent = function(self, event, ...)
		if event == "INIT" then
			local guid = UnitGUID("boss1")
			if guid then
				local NPC_ID = select(6, strsplit("-", UnitGUID("boss1")))
				local difficultyID = select(3, GetInstanceInfo())
				if NPC_ID == frame.npcID and (difficulty == "all" or difficulty == difficultyID) then
					for i, j in pairs(events) do
						frame:RegisterEvent(j)
					end
				end
			end
		elseif event == "ENCOUNTER_START" then
			local encounterID, encounterName, difficultyID, groupSize = ...
			if encounterID == frame.engageID and (difficulty == "all" or difficulty == difficultyID) then			
				for i, j in pairs(events) do
					frame:RegisterEvent(j)
				end
			end
		elseif event == "ENCOUNTER_END" then
			local encounterID, encounterName, difficultyID, groupSize = ...
			if encounterID == frame.engageID then
				for i, j in pairs(events) do
					frame:UnregisterEvent(j)
				end
			end
		else
			frame.update_onevent(self, event, ...)
		end
	end
	
	frame:SetScript("OnEvent", function(self, event, ...)
		frame.Update_onevent(self, event, ...)
	end)
	
	frame:SetScript("OnUpdate", function(self, e)
		frame.t = frame.t + e
		if frame.t > update_rate then	
			frame.update_onframe(self)
			frame.t = 0
		end
	end)
	
	TextFrame.QueueText(frame)	
	
	G.Texts[v] = frame
	
	T.CreateTextAlertOptions(option_text, "Texts", option_page, v, x, y, difficulty)
	
	return frame
end

T.CreateTestText = function(v, dur, r, g, b, text)

	local frame = T.CreateAlertText(r, g, b, v)

	frame.reset = function()
		frame:Hide()
		frame.exp = false
		frame.remain = false
	end
	
	frame.update_onedit = function()
		frame.enable = ARM_CDB["TextFrame"]["enable"]
		if frame.enable then
			frame:RegisterEvent("CHAT_MSG_ADDON")
		else
			frame:UnregisterEvent("CHAT_MSG_ADDON")
		end
		
		frame:SetSize(ARM_CDB["AlertFrame"]["font_size"]*8, ARM_CDB["TextFrame"]["font_size"])
		frame.text:SetFont(G.Font, ARM_CDB["TextFrame"]["font_size"], "OUTLINE")

		TextFrame.LineUpTexts()
	end
	
	frame.update_onevent = function()
		if frame.enable then
			frame.exp = time() + dur
			frame.remain = dur
			frame:Show()
		else
			frame.reset()
		end
	end
	
	frame.update_onframe = function()
		if frame.enable and frame.remain and frame.exp then	
			frame.remain = frame.exp - time()
			frame.text:SetText(text.." "..T.FormatTime(frame.remain))
			if frame.remain <= 0 then
				frame.reset()
			end
		else
			frame.reset()
		end
	end
	
	frame.StartTest = function()
		frame.update_onevent()
	end
	
	frame:SetScript("OnUpdate", function(self, e)
		frame.t = frame.t + e
		if frame.t > update_rate then	
			frame.update_onframe()	
			frame.t = 0
		end
	end)
	
	TextFrame.QueueText(frame)	
	
	G.Texts[v] = frame
	G.Test[v] = frame
	
	return frame
end
----------------------------------------------------------
-----------------[[    Health Perc    ]]------------------
----------------------------------------------------------

local HealthPercFrame = CreateFrame("Frame", addon_name.."HealthPercFrame", FrameHolder)
HealthPercFrame:SetSize(300,50)
HealthPercFrame.t = 0
 
HealthPercFrame.movingname = L["血量提示"]
HealthPercFrame.point = { a1 = "CENTER", parent = "UIParent", a2 = "CENTER", x = 0, y = 350 }
T.CreateDragFrame(HealthPercFrame)

HealthPercFrame.Text = T.createtext(HealthPercFrame, "OVERLAY", 50, "OUTLINE", "CENTER")
HealthPercFrame.Text:SetPoint("CENTER")
HealthPercFrame.Text:SetTextColor(1, 1, 0)
	
HealthPercFrame.StartTest = function()
	HealthPercFrame.Text:SetText(L["血量提示"])
	HealthPercFrame.Text:Show()
	C_Timer.After(10, function() HealthPercFrame.Text:Hide() end)
end
G.Test["hptest"] = HealthPercFrame

T.EditHealthPercFrame = function(option)
	if option == "all" or option == "enable" then
		if ARM_CDB["HealthPercFrame"]["enable"] then
			HealthPercFrame:Show()
		else
			HealthPercFrame:Hide()
		end
		for k, frame in pairs(G.HP_frames) do
			frame.update_onedit(option)
		end
	end
	
	if option == "all" or option == "font_size" then
		for k, frame in pairs(G.HP_frames) do
			frame.text:SetFont(G.Font, ARM_CDB["HealthPercFrame"]["font_size"], "OUTLINE")
		end
		HealthPercFrame.Text:SetFont(G.Font, ARM_CDB["HealthPercFrame"]["font_size"], "OUTLINE")
		HealthPercFrame:SetSize(ARM_CDB["HealthPercFrame"]["font_size"]*6, ARM_CDB["HealthPercFrame"]["font_size"])
	end
	
	if option == "all" or option == "flash" then
		if ARM_CDB["HealthPercFrame"]["flash"] then 
			HealthPercFrame:SetScript("OnUpdate", function(self, e)
				self.t = self.t + e
				if self.t > update_rate then	
					self:SetAlpha(1-math.abs(glow_value))
					self.t = 0
				end
			end)
		else
			HealthPercFrame:SetAlpha(1)
			HealthPercFrame:SetScript("OnUpdate", nil)
		end
	end
end

T.CreateHPAlertframe = function(option_page, EncounterID, bossID, v, unit, npcid, hp_range, x, y)
	local frame = CreateFrame("Frame", nil, HealthPercFrame)
	frame:SetAllPoints(HealthPercFrame)
	
	frame.text = T.createtext(frame, "OVERLAY", 50, "OUTLINE", "CENTER")
	frame.text:SetPoint("CENTER")
	frame.text:SetTextColor(1, 1, 0)
	
	frame.update_onedit = function(option)
		if option == "all" or option == "enable" then
			frame.enable = ARM_CDB["HealthPercFrame"]["enable"] and ARM_CDB["HealthPercAlerts"][v]
			if frame.enable then
				frame:RegisterEvent("ENCOUNTER_START")
				frame:RegisterEvent("ENCOUNTER_END")
				frame:RegisterEvent("PLAYER_ENTERING_WORLD")
			else
				frame:UnregisterEvent("ENCOUNTER_START")
				frame:UnregisterEvent("ENCOUNTER_END")
				frame:UnregisterEvent("PLAYER_ENTERING_WORLD")
			end
			frame.Update()
		end
	end
	
	frame.Update = function()
		local guid = UnitGUID(unit)
		if not guid then
			frame:Hide()
		else
			local NPC_ID = select(6, strsplit("-", UnitGUID(unit)))
			if NPC_ID ~= npcid then
				frame:Hide()
			else
				local hp = UnitHealth(unit)
				local hp_max = UnitHealthMax(unit)
				local hp_perc

				if hp and hp_max then
					hp_perc = hp/hp_max*100
				end
				local show = false
				
				for diff, t in pairs(hp_range) do
					if diff == "All" or (diff == "Heroic" and select(3, GetInstanceInfo()) == 15) or (diff == "Mythic" and select(3, GetInstanceInfo()) == 16) then
						for i, info in pairs(t) do
							if hp_perc and (hp_perc <= info["ul"]) and (hp_perc >= info["ll"]) then
								frame.text:SetText(string.format("%.1f", hp_perc).." "..info["tip"])
								frame:Show()
								show = true
								break
							end
						end
					end
				end
				
				if UnitGUID("boss2") then
					local NPC_ID = select(6, strsplit("-", UnitGUID("boss2")))
					local difficultyID = select(3, GetInstanceInfo())
				
					if NPC_ID == "125886" and difficultyID == 16 then -- M阿古斯P4不再提示血量
						show = false
					end
				end
				
				if not show then
					frame:Hide()
				end
			end
		end
	end
	
	frame.Visibility = function(event, ...)
		if frame.enable then
			if event == "ENCOUNTER_START" then
				local encounterID, encounterName, difficultyID, groupSize = ...
				if encounterID == EncounterID then
					frame:RegisterEvent("UNIT_HEALTH_FREQUENT")
					frame.Update()
				end
			elseif event == "ENCOUNTER_END" then
				local encounterID, encounterName, difficultyID, groupSize = ...
				if encounterID == EncounterID then
					frame:UnregisterEvent("UNIT_HEALTH_FREQUENT")
					frame:Hide()	
				end
			else
				local guid = UnitGUID("boss1")
				if guid then
					local NPC_ID = select(6, strsplit("-", UnitGUID("boss1")))
					if NPC_ID == bossID then
						frame:RegisterEvent("UNIT_HEALTH_FREQUENT")
						frame.Update()
					end
				end
			end
		end
	end
	
	frame:SetScript("OnEvent", function(self, event, ...)
		if frame.enable then
			if event == "UNIT_HEALTH_FREQUENT" then
				local unitID = ...
				if unitID == unit then
					frame.Update()
				end
			elseif event == "ENCOUNTER_START" or event == "ENCOUNTER_END" then
				frame.Visibility(event, ...)
			elseif event == "PLAYER_ENTERING_WORLD" then
				frame.Visibility(event, ...)
				frame:UnregisterEvent("PLAYER_ENTERING_WORLD")
			end
		else
			frame:Hide()
		end
	end)
	
	G.HP_frames[v] = frame
	
	T.CreateTextAlertOptions(L["血量提示"], "HealthPercAlerts", option_page, v, x, y)
	
	return frame
end

----------------------------------------------------------
--------------------[[    Power    ]]---------------------
----------------------------------------------------------

local PowerFrame = CreateFrame("Frame", addon_name.."PowerFrame", FrameHolder)
PowerFrame:SetSize(300,50)
PowerFrame.t = 0
 
PowerFrame.movingname = L["能量提示"]
PowerFrame.point = { a1 = "CENTER", parent = "UIParent", a2 = "CENTER", x = 0, y = 300 }
T.CreateDragFrame(PowerFrame)

PowerFrame.Text = T.createtext(PowerFrame, "OVERLAY", 50, "OUTLINE", "CENTER")
PowerFrame.Text:SetPoint("CENTER")
PowerFrame.Text:SetTextColor(0, 1, 1)
	
PowerFrame.StartTest = function()
	PowerFrame.Text:SetText(L["能量提示"])
	PowerFrame.Text:Show()
	C_Timer.After(10, function() PowerFrame.Text:Hide() end)
end
G.Test["pptest"] = PowerFrame

T.EditPowerFrame = function(option)
	if option == "all" or option == "enable" then
		if ARM_CDB["PowerFrame"]["enable"] then
			PowerFrame:Show()
		else
			PowerFrame:Hide()
		end
		for k, frame in pairs(G.PP_frames) do
			frame.update_onedit(option)
		end
	end
	
	if option == "all" or option == "font_size" then
		for k, frame in pairs(G.PP_frames) do
			frame.text:SetFont(G.Font, ARM_CDB["PowerFrame"]["font_size"], "OUTLINE")
		end
		PowerFrame.Text:SetFont(G.Font, ARM_CDB["PowerFrame"]["font_size"], "OUTLINE")
		PowerFrame:SetSize(ARM_CDB["PowerFrame"]["font_size"]*6, ARM_CDB["PowerFrame"]["font_size"])
	end
	
	if option == "all" or option == "flash" then
		if ARM_CDB["PowerFrame"]["flash"] then 
			PowerFrame:SetScript("OnUpdate", function(self, e)
				self.t = self.t + e
				if self.t > update_rate then	
					self:SetAlpha(1-math.abs(glow_value))
					self.t = 0
				end
			end)
		else
			PowerFrame:SetAlpha(1)
			PowerFrame:SetScript("OnUpdate", nil)
		end
	end
end

T.CreatePPAlertframe = function(option_page, EncounterID, bossID, v, unit, npcid, pp_range, x, y)
	local frame = CreateFrame("Frame", nil, PowerFrame)
	frame:SetAllPoints(PowerFrame)
	
	frame.text = T.createtext(frame, "OVERLAY", 50, "OUTLINE", "CENTER")
	frame.text:SetPoint("CENTER")
	frame.text:SetTextColor(0, 1, 1)
	
	frame.update_onedit = function(option)
		if option == "all" or option == "enable" then
			frame.enable = ARM_CDB["PowerFrame"]["enable"] and ARM_CDB["PowerAlerts"][v]
			if frame.enable then
				frame:RegisterEvent("ENCOUNTER_START")
				frame:RegisterEvent("ENCOUNTER_END")
				frame:RegisterEvent("PLAYER_ENTERING_WORLD")	
			else
				frame:UnregisterEvent("ENCOUNTER_START")
				frame:UnregisterEvent("ENCOUNTER_END")
				frame:UnregisterEvent("PLAYER_ENTERING_WORLD")
			end
		end
	end
	
	frame.Update = function()	
		if unit == "altpower" then
			local pp = UnitPower("boss1", 10)
			
			local show = false
			
			for i, t in pairs(pp_range) do
				if pp and (pp <= t["ul"]) and (pp >= t["ll"]) then
					frame.text:SetText(pp.." "..t["tip"])
					frame:Show()
					show = true
					break
				end
			end
			
			if UnitGUID("boss2") then
				local NPC_ID = select(6, strsplit("-", UnitGUID("boss2")))
				local difficultyID = select(3, GetInstanceInfo())
				
				if NPC_ID == "125886" and difficultyID == 16 then -- M阿古斯P4不再提示能量
					show = false
				end
			end
			 
			if not show then
				frame:Hide()
			end
		else
			local guid = UnitGUID(unit)
			if not guid then
				frame:Hide()
			else
				local NPC_ID = select(6, strsplit("-", UnitGUID(unit)))
				if NPC_ID ~= npcid then
					frame:Hide()
				else			
					local pp = UnitPower(unit)
					
					local show = false
					
					for i, t in pairs(pp_range) do
						if pp and (pp <= t["ul"]) and (pp >= t["ll"]) then
							frame.text:SetText(pp.." "..t["tip"])
							frame:Show()
							show = true
							break
						end
					end
					
					if not show then
						frame:Hide()
					end
				end
			end
		end
	end
	
	frame.Visibility = function(event, ...)
		if frame.enable then
			if event == "ENCOUNTER_START" then
				local encounterID, encounterName, difficultyID, groupSize = ...
				if encounterID == EncounterID then
					frame:RegisterEvent("UNIT_POWER_FREQUENT")
					frame.Update()
				end
			elseif event == "ENCOUNTER_END" then
				local encounterID, encounterName, difficultyID, groupSize = ...
				if encounterID == EncounterID then
					frame:UnregisterEvent("UNIT_POWER_FREQUENT")
					frame:Hide()	
				end
			else
				local guid = UnitGUID("boss1")
				if guid then
					local NPC_ID = select(6, strsplit("-", UnitGUID("boss1")))
					if NPC_ID == bossID then
						frame:RegisterEvent("UNIT_POWER_FREQUENT")
						frame.Update()
					end
				end
			end
		end
	end
	
	frame:SetScript("OnEvent", function(self, event, ...)
		if frame.enable then
			if event == "UNIT_POWER_FREQUENT" then
				local unitID = ...
				if unitID == unit or (unit == "altpower" and unitID == "boss1") then
					frame.Update()
				end
			elseif event == "ENCOUNTER_START" or event == "ENCOUNTER_END" then
				frame.Visibility(event, ...)
			elseif event == "PLAYER_ENTERING_WORLD" then
				frame.Visibility(event, ...)
				frame:UnregisterEvent("PLAYER_ENTERING_WORLD")
			end
		else
			frame:Hide()
		end
	end)
	
	G.PP_frames[v] = frame
	
	T.CreateTextAlertOptions(L["能量提示"], "PowerAlerts", option_page, v, x, y)
	
	return frame
end

----------------------------------------------------------
--------------------[[    Sound    ]]---------------------
----------------------------------------------------------
G.shared = {
	["2_245024"] = "move", -- 被吞噬
	["2_245022"] = "move", -- 炽燃
	["3_253039"] = "move", -- 恶魔冲锋
	["4_246208"] = "move", -- 酸性之网
	["5_248795"] = "move", -- 邪能池
	["6_254183"] = "move", -- 灼伤皮肤
	["8_244005"] = "move", -- 黑暗裂隙(踩水)
	["8_248740"] = "move", -- 毁灭回响(踩水)
	["10_245916"] = "move", -- 熔火残渣
	["11_248167"] = "move", -- 死亡之雾
}

T.Play = function(frame, v)
	local enable = ARM_CDB["Sounds"][v] and not (ARM_CDB["General"]["disable_all"] or ARM_CDB["General"]["disable_sound"])
	if enable and not frame.play then
		if G.shared[v] then
			PlaySoundFile(G.media.sounds..G.shared[v]..".ogg", "Master")
		else
			PlaySoundFile(G.media.sounds..v..".ogg", "Master")
		end
		frame.play = true
		C_Timer.After(2, function() frame.play = false end)
	end
end

T.CreateSoundFrame = function(parent, x, y, tip, v, event, arg1, arg2, arg3)
	local frame = CreateFrame("Frame", addon_name.."SoundFrame"..v, FrameHolder)
	frame:RegisterEvent("ENCOUNTER_START")
	frame:RegisterEvent("ENCOUNTER_END")
	
	if event == "COMBAT_LOG_EVENT_UNFILTERED" then
		frame:SetScript("OnEvent", function(self, e, ...)
			if e == "ENCOUNTER_START" then
				frame:RegisterEvent(event)
			elseif e == "ENCOUNTER_END" then
				frame:UnregisterEvent(event)
			else
				local _, Event_type, _, _, _, _, _, _, DestName, _, _, SpellID = ...
				
				if SpellID == arg1 and Event_type == arg2 then
					if arg3 and DestName == arg3 then -- 这里arg用于玩家名字所以无需去除服务器名字了
						T.Play(frame, v)
					elseif not arg3 then
						T.Play(frame, v)
					end
				end
			end
		end)
	elseif event == "UNIT_SPELLCAST_START" or event == "UNIT_SPELLCAST_SUCCEEDED" or event == "UNIT_SPELLCAST_CHANNEL_START" then
		frame:SetScript("OnEvent", function(self, e, ...) 
			if e == "ENCOUNTER_START" then
				frame:RegisterEvent(event)
			elseif e == "ENCOUNTER_END" then
				frame:UnregisterEvent(event)
			else
				local SpellID = select(5, ...)
				if SpellID == arg1 then
					T.Play(frame, v)
				end
			end
		end)
	elseif event == "CHAT_MSG_RAID_BOSS_EMOTE" or event == "RAID_BOSS_WHISPER" then
		frame:SetScript("OnEvent", function(self, e, ...) 
			if e == "ENCOUNTER_START" then
				frame:RegisterEvent(event)
			elseif e == "ENCOUNTER_END" then
				frame:UnregisterEvent(event)
			else
				local Msg = ...
				if Msg and Msg:find(arg1) then
					T.Play(frame, v)
				end
			end
		end)
	end
	
	T.CreateSoundOptions(parent, v, x, y, tip)
	
	return frame
end

----------------------------------------------------------
----------[[    Highlight Icon on Raid UF    ]]-----------
----------------------------------------------------------
T.addIcon = function(f, v, target)
	
	local _, ID_str, DUR_str = strsplit("_" , v)
	local spellID, dur = tonumber(ID_str), tonumber(DUR_str)
	
    local frame = CreateFrame("Frame", nil, f)
	frame:SetPoint(ARM_CDB["HL_Frame"]["position"], 0, 0)
    frame:SetSize(ARM_CDB["HL_Frame"]["iconSize"], ARM_CDB["HL_Frame"]["iconSize"])
    frame:SetAlpha(ARM_CDB["HL_Frame"]["iconAlpha"]/100)
    frame:SetFrameStrata("HIGH")
	
    local texture = frame:CreateTexture(nil,"HIGH")
    texture:SetTexture(select(3, GetSpellInfo(spellID)))
    texture:SetPoint("TOPLEFT", 2, -2)
	texture:SetPoint("BOTTOMRIGHT", -2, 2)
    texture:SetTexCoord(0.1, 0.9, 0.1, 0.9)
   
    ActionButton_ShowOverlayGlow(frame)
		
	if dur then
		local cooldown = CreateFrame("COOLDOWN", nil, frame, "CooldownFrameTemplate")
		cooldown:SetCooldown(GetTime(), dur)
		cooldown:SetPoint("TOPLEFT", 4, -4)
		cooldown:SetPoint("BOTTOMRIGHT", -4, 4)
		cooldown:SetDrawEdge(false)
		cooldown:SetHideCountdownNumbers(true)	
		C_Timer.After(dur, function()
			ActionButton_HideOverlayGlow(frame)
			frame:Hide()
		end)
	elseif DUR_str == "i" then
		frame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
		frame:SetScript("OnEvent", function(self, event, ...) 
			local _, Event_type, _, _, _, _, _, _, DestName, _, _, SpellID = ...
			if Event_type == "SPELL_AURA_REMOVED" and SpellID == spellID and DestName then
				local Tar = string.split("-", DestName)
				if Tar == target then
					ActionButton_HideOverlayGlow(frame)
					frame:Hide()
				end
			end
		end)
	elseif DUR_str == "d" then
		local debuff_dur = select(6, UnitDebuff(target, GetSpellInfo(spellID)))
		
		if debuff_dur then
			local cooldown = CreateFrame("COOLDOWN", nil, frame, "CooldownFrameTemplate")
			cooldown:SetCooldown(GetTime(), debuff_dur)
			cooldown:SetPoint("TOPLEFT", 4, -4)
			cooldown:SetPoint("BOTTOMRIGHT", -4, 4)
			cooldown:SetDrawEdge(false)
			cooldown:SetHideCountdownNumbers(true)	
			C_Timer.After(debuff_dur, function()
				if frame:IsShown() then
					ActionButton_HideOverlayGlow(frame)
					frame:Hide()
				end
			end)
			
			frame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
			frame:SetScript("OnEvent", function(self, event, ...) 
				local _, Event_type, _, _, _, _, _, _, DestName, _, _, SpellID = ...
				if Event_type == "SPELL_AURA_REMOVED" and SpellID == spellID and DestName then
					local Tar = string.split("-", DestName)
					if Tar == target and frame:IsShown() then
						ActionButton_HideOverlayGlow(frame)
						frame:Hide()
					end
				end
			end)
		end
	end
	
end

T.HL_OnRaid = function(v, target)

	if ARM_CDB["General"]["disable_all"] or not ARM_CDB["HL_Frame"]["enable"] or not ARM_CDB["HL_Spells"][v] then return end
	
    local hasGrid = IsAddOnLoaded("Grid")
    local hasGrid2 = IsAddOnLoaded("Grid2")
    local hasCompactRaid = IsAddOnLoaded("CompactRaid")
    local hasVuhDo = IsAddOnLoaded("VuhDo")
    local hasElvUI = _G["ElvUF_Raid"] and _G["ElvUF_Raid"]:IsVisible()
    local hasAltzUI = _G["Altz_HealerRaid"] and _G["Altz_HealerRaid"]:IsVisible()
    
    if hasElvUI then
        for i=1, 8 do
            for j=1, 5 do
                local f = _G["ElvUF_RaidGroup"..i.."UnitButton"..j]
                if f and f.unit and UnitName(f.unit) == target then
                    T.addIcon(f, v, target)
                    return
                end
            end
        end
    elseif hasGrid then
        local layout = GridLayoutFrame
        
        if layout then
            local children = {layout:GetChildren()}
            for _, child in ipairs(children) do
                if child:IsVisible() then
                    local frames = {child:GetChildren()}
                    for _, f in ipairs(frames) do
                        if f.unit and UnitName(f.unit) == target then
                            T.addIcon(f, v, target)
                            return
                        end
                    end
                end
            end
        end
    elseif hasGrid2 then
        local layout = Grid2LayoutFrame
        
        if layout then
            local children = {layout:GetChildren()}
            for _, child in ipairs(children) do
                if child:IsVisible() then
                    local frames = {child:GetChildren()}
                    for _, f in ipairs(frames) do
                        if f.unit and UnitName(f.unit) == target then
                            T.addIcon(f, v, target)
                            return
                        end
                    end
                end
            end
        end
    elseif hasVuhDo then
        for i = 1, 40 do
            local f = _G["Vd1H"..i]
            if f and f.raidid and UnitName(f.raidid) == target then
                T.addIcon(f, v, target)
                return
            end
        end
    elseif hasAltzUI then
        for i = 1, 40 do
            local f = _G["Altz_HealerRaidUnitButton"..i]
            if f and f.unit and UnitName(f.unit) == target then
                T.addIcon(f, v, target)
                return
            end
        end
    elseif hasCompactRaid then
        for i =1, 8 do 
            for j = 1, 5 do
                local f = _G["CompactRaidGroupHeaderSubGroup"..i.."UnitButton"..j]
                if f and f.unit and UnitName(f.unit) == target then
                    T.addIcon(f, v, target)
                    return
                end
            end
        end
    else
        for i=1, 40 do
            local f = _G["CompactRaidFrame"..i]
            if f and f.unitExists and f.unit and UnitName(f.unit) == target then
                T.addIcon(f, v, target)
                return
            end
        end
        for i=1, 4 do
            for j=1, 5 do
                local f = _G["CompactRaidGroup"..i.."Member"..j]
                if f and f.unitExists and f.unit and UnitName(f.unit) == target then
                    T.addIcon(f, v, target)
                    return
                end
            end
        end
    end
	
end

T.Create_HL_EventFrame = function(parent, v, x, y, tip, event, arg1, arg2)
	local frame = CreateFrame("Frame", addon_name.."HL_EventFrame"..v, FrameHolder)
	frame:RegisterEvent("ENCOUNTER_START")
	frame:RegisterEvent("ENCOUNTER_END")
	
	if event == "COMBAT_LOG_EVENT_UNFILTERED" then
		frame:SetScript("OnEvent", function(self, e, ...)
			if e == "ENCOUNTER_START" then
				frame:RegisterEvent(event)
			elseif e == "ENCOUNTER_END" then
				frame:UnregisterEvent(event)
			else
				local _, Event_type, _, _, _, _, _, _, DestName, _, _, SpellID = ...
				if SpellID == arg1 and Event_type == arg2 and DestName then
					local target = string.split("-", DestName)
					T.HL_OnRaid(v, target)
				end
			end
		end)
	elseif event == "CHAT_MSG_ADDON" then
		table.insert(WHISPER, arg1)
		frame:SetScript("OnEvent", function(self, e, ...)
			if e == "ENCOUNTER_START" then
				frame:RegisterEvent(event)
			elseif e == "ENCOUNTER_END" then
				frame:UnregisterEvent(event)
			else
				local prefix, message, channel, sender = ... 
				local target = strsplit("-", sender)
				if prefix == "arm_hl_raid" and message == arg1 then
					T.HL_OnRaid(v, target)
				end
			end
		end)
	end
	
	T.Create_HLOnRaid_Options(parent, v, x, y, tip)
	
	return frame
end
----------------------------------------------------------
-------------[[    Group Sharing Mode    ]]---------------
----------------------------------------------------------

--local RTIconsList = {
--	"|TInterface\\TargetingFrame\\UI-RaidTargetingIcon_1:0|t", -- 星星
--	"|TInterface\\TargetingFrame\\UI-RaidTargetingIcon_2:0|t", -- 大饼
--	"|TInterface\\TargetingFrame\\UI-RaidTargetingIcon_3:0|t", -- 菱形
--	"|TInterface\\TargetingFrame\\UI-RaidTargetingIcon_4:0|t", -- 三角
--	"|TInterface\\TargetingFrame\\UI-RaidTargetingIcon_5:0|t", -- 月亮
--	"|TInterface\\TargetingFrame\\UI-RaidTargetingIcon_6:0|t", -- 方块
--	"|TInterface\\TargetingFrame\\UI-RaidTargetingIcon_7:0|t", -- 叉叉
--	"|TInterface\\TargetingFrame\\UI-RaidTargetingIcon_8:0|t", -- 骷髅
--}
--
--local GroupSharingFrame = CreateFrame("Frame", addon_name.."GroupSharingFrame", FrameHolder)
--GroupSharingFrame:SetSize(300,50)
-- 
--GroupSharingFrame.movingname = L["分组分担提示"]
--GroupSharingFrame.point = { a1 = "CENTER", parent = "UIParent", a2 = "CENTER", x = 0, y = 150 }
--T.CreateDragFrame(GroupSharingFrame)
--
--GroupSharingFrame.Text = T.createtext(GroupSharingFrame, "OVERLAY", 35, "OUTLINE", "CENTER")
--GroupSharingFrame.Text:SetPoint("CENTER")
--GroupSharingFrame.Text:SetTextColor(0, 1, 1)
--
--GroupSharingFrame.StartTest = function()
--	GroupSharingFrame.Text:SetText(RTIconsList[1].." "..T.ColorName(G.PlayerName))
--	GroupSharingFrame.Text:Show()
--	C_Timer.After(10, function() GroupSharingFrame.Text:Hide() end)
--end
--G.Test["gstest"] = GroupSharingFrame
--
--T.EditGroupSharingFrame = function(option)
--	if option == "all" or option == "enable" then
--		if ARM_CDB["GroupSharingFrame"]["enable"] then
--			GroupSharingFrame:Show()
--		else
--			GroupSharingFrame:Hide()
--		end
--	end
--	
--	if option == "all" or option == "font_size" then
--		GroupSharingFrame.Text:SetFont(G.Font, ARM_CDB["GroupSharingFrame"]["font_size"], "OUTLINE")
--		GroupSharingFrame:SetSize(ARM_CDB["GroupSharingFrame"]["font_size"]*6, ARM_CDB["GroupSharingFrame"]["font_size"])
--	end
--end
--
--local function GetSharingInfo(SpellID, excludetank)
--	local Debuff = GetSpellInfo(SpellID)
--	local Targets = {}
--	local Players = {}
--	for i = 1, 40 do 
--		local unit = "raid"..i
--		local name = UnitName(unit)
--		if name then
--			if not UnitIsDead(unit) and UnitIsConnected(unit) then
--				if UnitDebuff(unit, Debuff) then
--					table.insert(Targets, name)
--				else
--					if not excludetank or UnitGroupRolesAssigned(unit) ~= "TANK" then
--						table.insert(Players, name)
--					end
--				end
--			end			
--		end
--	end
--	return #Targets, Targets, #Players, Players
--end
--
--G.GS_Spells = {
--	--["gs_48438"] = {CastID = 186263, DebuffID = 194384, Excludetank = false, Expire = 5},-- 测试用	
--	--["gs_246698"] = {CastID = 246692, DebuffID = 246698, Excludetank = false, Expire = 5},
--}
--
--local PlayRT = function(i)
--	if ARM_CDB["GroupSharingFrame"]["sound"] and not ARM_CDB["General"]["disable_sound"] then
--		PlaySoundFile(G.media.sounds.."rt"..i..".ogg", "Master")
--	end
--end
--								
--local lock = false
--GroupSharingFrame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
--GroupSharingFrame:SetScript("OnEvent", function(self, event, ...)
--	if ARM_CDB["General"]["disable_all"] or not ARM_CDB["GroupSharingFrame"]["enable"] then return end
--	local _, Event_type, _, _, _, _, _, _, _, _, _, SpellID = ...
--
--	if Event_type == "SPELL_CAST_SUCCESS" then
--		for index, info in pairs(G.GS_Spells) do	
--			if ARM_CDB["GS_Spells"][index] and SpellID == info.CastID then
--				C_Timer.After(1, function()
--					local target_num, targets, sharing_num, players = GetSharingInfo(info.DebuffID, info.Excludetank)
--					if (not lock) and target_num > 0 and sharing_num > 0 then
--						local group_num, group_num2 = math.floor(sharing_num/target_num),  math.fmod(sharing_num, target_num)
--						
--						local outputstrings = {}
--						
--						for i = 1, target_num do
--							outputstrings[i] = RTIconsList[i]..T.ColorName(targets[i]).."→ "
--							SetRaidTarget(targets[i], i)
--							if targets[i] == G.PlayerName then
--								GroupSharingFrame.Text:SetText(RTIconsList[i].." "..L["你"])
--								GroupSharingFrame.Text:Show()
--								if not ARM_CDB["General"]["disable_chatmsg"] then
--									T.SendChatMsg("{rt"..i.."}{rt"..i.."}{rt"..i.."}","YELL", 3)
--								end
--								PlayRT(i)
--							end
--						end
--						
--						local j = 0
--						local k = 1
--						
--						for i = 1, sharing_num do
--							if j + 1 <= group_num + (group_num2 > 0 and 1 or 0) then
--								j = j + 1
--							else
--								if group_num2 > 0 then
--									group_num2 = group_num2 - 1
--								end			
--								k = k + 1
--								j = 1
--							end
--							
--							outputstrings[k] = outputstrings[k]..T.ColorName(players[i]).." "
--							if players[i] == G.PlayerName then
--								GroupSharingFrame.Text:SetText(RTIconsList[k].." "..T.ColorName(targets[k]))
--								GroupSharingFrame.Text:Show()
--								PlayRT(k)
--							end
--						end
--						
--						for i = 1, target_num do
--							print(outputstrings[i])
--						end
--						
--						lock = true
--						C_Timer.After(info.Expire, function()
--							GroupSharingFrame.Text:SetText("")
--							GroupSharingFrame.Text:Hide()
--							lock = false
--						end)	
--					end
--				end)
--			end
--		end	
--	end
--end)

----------------------------------------------------------
---------------[[    Nameplate Icons    ]]----------------
----------------------------------------------------------

local function CreateAuraIcon(parent)
	local button = CreateFrame("Frame",nil,parent)
	button:SetSize(ARM_CDB["PlateAlerts"]["size"], ARM_CDB["PlateAlerts"]["size"])
	
	button.icon = button:CreateTexture(nil, "OVERLAY", nil, 3)
	button.icon:SetPoint("TOPLEFT",button,"TOPLEFT", 1, -1)
	button.icon:SetPoint("BOTTOMRIGHT",button,"BOTTOMRIGHT",-1, 1)
	button.icon:SetTexCoord(.08, .92, 0.08, 0.92)
	
	button.overlay = button:CreateTexture(nil, "ARTWORK", nil, 7)
	button.overlay:SetTexture("Interface\\Buttons\\WHITE8x8")
	button.overlay:SetAllPoints(button)	
	
	button.bd = button:CreateTexture(nil, "ARTWORK", nil, 6)
	button.bd:SetTexture("Interface\\Buttons\\WHITE8x8")
	button.bd:SetVertexColor(0, 0, 0)
	button.bd:SetPoint("TOPLEFT",button,"TOPLEFT", -1, 1)
	button.bd:SetPoint("BOTTOMRIGHT",button,"BOTTOMRIGHT", 1, -1)
	
	button.text = T.createtext(button, "OVERLAY", ARM_CDB["PlateAlerts"]["fsize"], "OUTLINE", "CENTER")
    button.text:SetPoint("BOTTOM", button, "BOTTOM", 0, -2)
	button.text:SetTextColor(1, 1, 0)
	
	button.count = T.createtext(button, "OVERLAY", ARM_CDB["PlateAlerts"]["fsize"], "OUTLINE", "RIGHT")
	button.count:SetPoint("TOPRIGHT", button, "TOPRIGHT", -1, 2)
	button.count:SetTextColor(.4, .95, 1)
	
	return button
end

local function UpdateAuraIcon(button, unit, index, filter)
	local name, _, icon, count, debuffType, duration, expirationTime, _, _, _, spellID = UnitAura(unit, index, filter)

	button.icon:SetTexture(icon)
	button.expirationTime = expirationTime
	button.duration = duration
	button.spellID = spellID
	
	local color = DebuffTypeColor[debuffType] or DebuffTypeColor.none
	button.overlay:SetVertexColor(color.r, color.g, color.b)

	if count and count > 1 then
		button.count:SetText(count)
	else
		button.count:SetText("")
	end
	
	button:SetScript("OnUpdate", function(self, elapsed)
		if not self.duration then return end
		
		self.elapsed = (self.elapsed or 0) + elapsed

		if self.elapsed < .2 then return end
		self.elapsed = 0

		local timeLeft = self.expirationTime - GetTime()
		if timeLeft <= 0 then
			self.text:SetText(nil)
		else
			self.text:SetText(T.FormatTime(timeLeft))
		end
	end)
	
	button:Show()
end

local function AuraFilter(caster, spellid)
	if not ARM_CDB["General"]["disable_all"] and ARM_CDB["PlateAlerts"]["enable"] and ARM_CDB["PlateAuras"][spellid] then
		return true
	end
end

local function UpdateAuras(unitFrame)
	if not unitFrame.unit then return end
	local unit = unitFrame.unit
	local i = 1
	
	for index = 1, 15 do
		if i <= 5 then			
			local bname, _, _, _, _, bduration, _, bcaster, _, _, bspellid = UnitAura(unit, index, 'HELPFUL')
			local matchbuff = AuraFilter(bcaster, bspellid)
				
			if bname and matchbuff then
				if not unitFrame.icons[i] then
					unitFrame.icons[i] = CreateAuraIcon(unitFrame)
				end
				UpdateAuraIcon(unitFrame.icons[i], unit, index, 'HELPFUL')
				if i ~= 1 then
					unitFrame.icons[i]:SetPoint("LEFT", unitFrame.icons[i-1], "RIGHT", 4, 0)
				end
				i = i + 1
			end
		end
	end
	
	for index = 1, 20 do
		if i <= 5 then
			local dname, _, _, _, _, dduration, _, dcaster, _, _, dspellid = UnitAura(unit, index, 'HARMFUL')
			local matchdebuff = AuraFilter(dcaster, dspellid)
			
			if dname and matchdebuff then
				if not unitFrame.icons[i] then
					unitFrame.icons[i] = CreateAuraIcon(unitFrame)
				end
				UpdateAuraIcon(unitFrame.icons[i], unit, index, 'HARMFUL')
				if i ~= 1 then
					unitFrame.icons[i]:SetPoint("LEFT", unitFrame.icons[i-1], "RIGHT", 4, 0)
				end
				i = i + 1
			end
		end
	end
	
	unitFrame.iconnumber = i - 1
	
	if unitFrame.powericon:IsShown() then
		if unitFrame.iconnumber == 0 then
			unitFrame.powericon:SetPoint("LEFT", unitFrame.icons, "CENTER", -ARM_CDB["PlateAlerts"]["size"]/2, 0)
		else
			unitFrame.powericon:SetPoint("LEFT", unitFrame.icons[unitFrame.iconnumber], "RIGHT", 4, 0)
			unitFrame.iconnumber = unitFrame.iconnumber + 1
		end
	end
	
	if i > 1 then
		unitFrame.icons[1]:SetPoint("LEFT", unitFrame.icons, "CENTER", -((ARM_CDB["PlateAlerts"]["size"]+4)*(unitFrame.iconnumber)-4)/2,0)
	end
	
	for index = i, #unitFrame.icons do unitFrame.icons[index]:Hide() end
end

local function CreatePowerIcon(parent)
	local button = CreateFrame("Frame",nil,parent)
	button:SetSize(ARM_CDB["PlateAlerts"]["size"], ARM_CDB["PlateAlerts"]["size"])
	
	button.icon = button:CreateTexture(nil, "OVERLAY", nil, 3)
	button.icon:SetPoint("TOPLEFT",button,"TOPLEFT", 1, -1)
	button.icon:SetPoint("BOTTOMRIGHT",button,"BOTTOMRIGHT",-1, 1)
	button.icon:SetTexCoord(.08, .92, 0.08, 0.92)	
	
	button.overlay = button:CreateTexture(nil, "ARTWORK", nil, 7)
	button.overlay:SetTexture("Interface\\Buttons\\WHITE8x8")
	button.overlay:SetAllPoints(button)	
	button.overlay:SetVertexColor(1, 1, 1)
	
	button.bd = button:CreateTexture(nil, "ARTWORK", nil, 6)
	button.bd:SetTexture("Interface\\Buttons\\WHITE8x8")
	button.bd:SetVertexColor(0, 0, 0)
	button.bd:SetPoint("TOPLEFT",button,"TOPLEFT", -1, 1)
	button.bd:SetPoint("BOTTOMRIGHT",button,"BOTTOMRIGHT", 1, -1)
	
	button.count = T.createtext(button, "OVERLAY", ARM_CDB["PlateAlerts"]["fsize"], "OUTLINE", "RIGHT")
	button.count:SetPoint("CENTER")
	button.count:SetTextColor(1, 1, 0)
	
	return button
end

local function UpdatePowerIcon(button, pp)
	if pp > 85 then
		button.icon:SetTexture(531771)
	elseif pp > 45 then
		button.icon:SetTexture(531773)
	else
		button.icon:SetTexture(531776)
	end
	button.count:SetText(pp)
	button:Show()
end

local CreaturesShowPowerIcon = {
	["122532"] = 5,
}

local function UpdatePower(unitFrame)
	if not unitFrame.unit or ARM_CDB["General"]["disable_all"] or not ARM_CDB["PlateAlerts"]["enable"] or not ARM_CDB["PlatePower"][unitFrame.npcID] then
		if unitFrame.powericon and unitFrame.powericon:IsShown() then
			unitFrame.powericon:Hide()
		end
		return
	end
	
	local unit = unitFrame.unit
	local pp = UnitPower(unit)
	local value = CreaturesShowPowerIcon[unitFrame.npcID]
		
	if pp >= value then
		UpdatePowerIcon(unitFrame.powericon, pp)
		if unitFrame.iconnumber == 0 then
			unitFrame.powericon:SetPoint("LEFT", unitFrame.icons, "CENTER", -ARM_CDB["PlateAlerts"]["size"]/2, 0)
		else
			unitFrame.powericon:SetPoint("LEFT", unitFrame.icons[unitFrame.iconnumber], "RIGHT", 4, 0)
		end
	elseif unitFrame.powericon:IsShown() then
		unitFrame.powericon:Hide()		
	end
end

local function NamePlate_OnEvent(self, event, arg1)
	if event == "PLAYER_ENTERING_WORLD" then
		UpdateAuras(self)
		UpdatePower(self)		
	elseif event == "UNIT_AURA" and arg1 == self.unit then
		UpdateAuras(self)
	elseif event == "UNIT_POWER_FREQUENT" and arg1 == self.unit then
		UpdatePower(self)
	end
end

local function SetUnit(unitFrame, unit)
	unitFrame.unit = unit
	if unit then
		unitFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
		unitFrame:RegisterUnitEvent("UNIT_AURA", unitFrame.unit)
		unitFrame:RegisterUnitEvent("UNIT_POWER_FREQUENT", unitFrame.unit)
		unitFrame:SetScript("OnEvent", NamePlate_OnEvent)
		unitFrame.npcID = select(6, strsplit("-", UnitGUID(unit)))
	else
		unitFrame:UnregisterAllEvents()
		unitFrame:SetScript("OnEvent", nil)
		unitFrame.npcID = nil
	end
end

function NamePlates_UpdateAllNamePlates()
	for i, namePlate in ipairs(C_NamePlate.GetNamePlates()) do
		local unitFrame = namePlate.uf
		UpdateAuras(unitFrame)
		UpdatePower(unitFrame)
	end
end

local function OnNamePlateCreated(namePlate)
	namePlate.uf = CreateFrame("Button", "$parentUnitFrame", namePlate)
	namePlate.uf:SetAllPoints(namePlate)
	namePlate.uf:SetFrameLevel(namePlate:GetFrameLevel())
	
	namePlate.uf.icons = CreateFrame("Frame", nil, namePlate.uf)
	namePlate.uf.icons:SetPoint("BOTTOM", namePlate, "TOP", 0, ARM_CDB["PlateAlerts"]["y"])
	namePlate.uf.icons:SetWidth(50)
	namePlate.uf.icons:SetHeight(50)
	namePlate.uf.icons:SetFrameLevel(namePlate:GetFrameLevel()+1)
	
	namePlate.uf.powericon = CreatePowerIcon(namePlate.uf)
	namePlate.uf.powericon:Hide()
	
	namePlate.uf.iconnumber = 0
	
	namePlate.uf:EnableMouse(false)
end

local function OnNamePlateAdded(unit)
	local namePlate = C_NamePlate.GetNamePlateForUnit(unit)
	local unitFrame = namePlate.uf
	SetUnit(unitFrame, unit)
	UpdateAuras(unitFrame)
	UpdatePower(unitFrame)
end

local function OnNamePlateRemoved(unit)
	local namePlate = C_NamePlate.GetNamePlateForUnit(unit)
	SetUnit(namePlate.uf, nil)
end

local function NamePlates_OnEvent(self, event, ...) 
	if ( event == "VARIABLES_LOADED" ) then
		NamePlates_UpdateAllNamePlates()
	elseif ( event == "NAME_PLATE_CREATED" ) then
		local namePlate = ...
		OnNamePlateCreated(namePlate)
	elseif ( event == "NAME_PLATE_UNIT_ADDED" ) then 
		local unit = ...
		OnNamePlateAdded(unit)
	elseif ( event == "NAME_PLATE_UNIT_REMOVED" ) then 
		local unit = ...
		OnNamePlateRemoved(unit)
	end
end

local NamePlatesFrame = CreateFrame("Frame", G.addon_name.."NamePlatesFrame", UIParent) 
NamePlatesFrame:SetScript("OnEvent", NamePlates_OnEvent)
NamePlatesFrame:RegisterEvent("VARIABLES_LOADED")
NamePlatesFrame:RegisterEvent("NAME_PLATE_CREATED")
NamePlatesFrame:RegisterEvent("NAME_PLATE_UNIT_ADDED")
NamePlatesFrame:RegisterEvent("NAME_PLATE_UNIT_REMOVED")

----------------------------------------------------------
----------------[[    Chat Message    ]]------------------
----------------------------------------------------------
local ChatMsgSpells_debuffs = {
	--[774] = 18,-- 测试用		
	--[48438] = 7,-- 测试用	
	[244410] = 6, -- 屠戮
	[246919] = 6, -- 错乱屠戮
	[244768] = 8, -- 荒芜凝视
	[248815] = 4, -- 点燃
	[254429] = 5, -- 黑暗压迫
	[248819] = 4, -- 虹吸
	[244737] = 5, -- 震荡手雷
	[248332] = 5, -- 邪能之雨
	[249680] = 5, -- 轰鸣屠戮
	[246687] = 6, -- 屠戮
	[246698] = 6, -- 破坏
	[244042] = 5, -- 被标记的猎物
	[244094] = 6, -- 冥魂之拥
	[248732] = 3.5, -- 毁灭回响
	[253520] = 10, -- 爆裂脉冲
	[250757] = 4, -- 宇宙之光
	[254452] = 8, -- 饕餮烈焰
	[245994] = 1.5, -- 炽热之焰
	[258646] = 10, -- 天空之赐
	[258647] = 10, -- 海洋之赐
	[250669] = 15, -- 灵魂爆发
	[251570] = 12, -- 灵魂炸弹
	[252729] = 6, -- 宇宙射线
	[252616] = 4, -- 宇宙道标
}

local ChatMsgSpells_whispers = {
	["254244"] = 3, -- 催眠气罐
}

local ChatMsgEventFrame = CreateFrame("Frame", G.addon_name.."ChatMsgEventFrame", G.FrameHolder) 


ChatMsgEventFrame:SetScript("OnEvent", function(self, event, ...)
	if ARM_CDB["General"]["disable_all"] or ARM_CDB["General"]["disable_chatmsg"] then return end
	
	if event == "COMBAT_LOG_EVENT_UNFILTERED" then
		local _, Event_type, _, _, _, _, _, _, DestName, _, _, SpellID = ...
		if Event_type == "SPELL_AURA_APPLIED" and DestName == G.PlayerName then
			local dur = ChatMsgSpells_debuffs[SpellID]
			if dur and ARM_CDB["ChatMsgSpells"][SpellID] then
				local spell_name = GetSpellInfo(SpellID)
				T.SendChatMsg(G.PlayerName.." "..spell_name, "SAY")
				local countdown = min(dur-1, 5)
				for i = 1, countdown do		
					C_Timer.After(dur-i+1, function() 
						if UnitDebuff("player", spell_name) then
							SendChatMessage(spell_name.." "..i, "SAY")
						end
					end)		
				end
			end
		end
	elseif event == "RAID_BOSS_WHISPER" then
		local Msg = ...
		for spell, dur in pairs(ChatMsgSpells_whispers) do
			if Msg and Msg:find(spell) then
				local spellID = tonumber(spell)
				if ARM_CDB["ChatMsgSpells"][SpellID] then
					local spell_name = GetSpellInfo(SpellID)
					T.SendChatMsg(G.PlayerName.." "..spell_name, "SAY")
					local countdown = min(dur-1, 5)
					for i = 1, countdown do
						C_Timer.After(dur-i, function() SendChatMessage(spell_name.." "..i, "SAY") end)
					end
				end
				
				break
			end
		end
	elseif event == "ENCOUNTER_START" then
		ChatMsgEventFrame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
		ChatMsgEventFrame:RegisterEvent("RAID_BOSS_WHISPER")
	elseif event == "ENCOUNTER_END" then
		ChatMsgEventFrame:UnregisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
		ChatMsgEventFrame:UnregisterEvent("RAID_BOSS_WHISPER")
	end
end)

ChatMsgEventFrame:RegisterEvent("ENCOUNTER_START")
ChatMsgEventFrame:RegisterEvent("ENCOUNTER_END")
----------------------------------------------------------
---------------[[    BossMod Layout    ]]-----------------
----------------------------------------------------------
T.Edit_BossMods = function()
	for k, frame in pairs(G.RM_Frames) do
		frame:SetScale(ARM_CDB["BossMod_Layout"]["scale"]/100)
	end
end
----------------------------------------------------------
-----------------[[    Test Frame    ]]-------------------
----------------------------------------------------------
T.CreateTestIcon(248369, "testa", 5, nil, false, 1, 1, 1)
T.CreateTestIcon(244291, "testb", 7, 3, true, 1, 1, .2)
T.CreateTestIcon(245990, "testc", 10, nil, true, 1, 0, 0)

T.CreateTestText("textd", 5, 1, 1, 0, L["醒目文字提示"])
T.CreateTestText("texte", 10, 1, 0, 0, L["醒目文字提示"])