local AceAddon = LibStub("AceAddon-3.0")
local LookingForGroup = LibStub("AceAddon-3.0"):GetAddon("LookingForGroup")
local LookingForGroup_Kicker = LibStub("AceAddon-3.0"):NewAddon("LookingForGroup_Kicker","AceEvent-3.0")

local kick_tb = {}
local UnitGUID = UnitGUID

local function uninvite_unit(unit)
	if unit then
		local guid = UnitGUID(unit)
		if guid then
			kick_tb[guid] = unit
		end
	end
end

local function kick()
	local format_str
	local num = GetNumGroupMembers()
	if UnitInRaid("player") then
		format_str = "raid"
	elseif UnitInParty("player") then
		format_str = "party"
	else
		return
	end
	local guid_tb = {}
	local playerguid = UnitGUID("player")
	for i=1,num do
		local unit = format_str..i
		local guid = UnitGUID(unit)
		if guid and guid ~= playerguid then
			guid_tb[guid] = unit
		end
	end
	for k,v in pairs(kick_tb) do
		local p = guid_tb[k]
		if p then
			kick_tb[k] = p
			UninviteUnit(p,"AFK")
		else
			kick_tb[k] = nil
		end
	end
	if next(kick_tb) == nil and LookingForGroup_Kicker.button then
		LibStub("AceGUI-3.0"):Release(LookingForGroup_Kicker.button)
		LookingForGroup_Kicker.button = nil
	end
end

function LookingForGroup_Kicker:OnInitialize()
end

function LookingForGroup_Kicker:OnEnable()
	wipe(kick_tb)
	LookingForGroup_Kicker:RegisterEvent("ENCOUNTER_START")
	LookingForGroup_Kicker:RegisterEvent("ENCOUNTER_END")
end

function LookingForGroup_Kicker:OnDisable()
	wipe(kick_tb)
	if self.button then
		LibStub("AceGUI-3.0"):Release(self.button)
		self.button = nil
	end
	self:UnregisterAllEvents()
end

function LookingForGroup_Kicker.Check(mindps,vote_to_kick)
	if (not SkadaPerCharDB) or (not vote_to_kick and not UnitIsGroupLeader("player")) then
		wipe(kick_tb)
		if LookingForGroup_Kicker.button then
			LibStub("AceGUI-3.0"):Release(LookingForGroup_Kicker.button)
			LookingForGroup_Kicker.button = nil
		end
		return
	end
	local Skada = AceAddon:GetAddon("Skada")
	if Skada == nil then
		return
	end
	local set = Skada.current
	if set == nil then
		return
	end
	local tm = set.time
	if tm == 0 then
		tm = (set.endtime or time()) - set.starttime
	end
	if tm < 30 then
		return
	end
	local format_str
	if UnitInRaid("player") then
		format_str = "raid"
	elseif UnitInParty("player") then
		format_str = "party"
	else
		return
	end
	local UnitGroupRolesAssigned = UnitGroupRolesAssigned
	local guid_tb = {}
	local player_guid = UnitGUID("player")
	for i=1,GetNumGroupMembers() do
		local unit = format_str..i
		local uid = UnitGUID(unit)
		if uid and uid ~= player_guid then
			if UnitIsConnected(unit) then
				guid_tb[uid] = unit
			else
				uninvite_unit(unit)
			end
		end
	end
	local players = set.players
	local skada_player_active_time = Skada.PlayerActiveTime
	local active_time_req = tm * 0.9
	for i=1,#players do
		local ele = players[i]
		local id = ele.id
		if id then
			local unit = guid_tb[id]
			if unit then
				local role = UnitGroupRolesAssigned(unit)
				local k
				if role == "NONE" or role == "DAMAGER" then
					local unitdps = ele.damage/tm
					if mindps < unitdps then
						k = true
					end
				else
					k = true
				end
				if k and active_time_req < skada_player_active_time(Skada,set, ele) then
					guid_tb[id] = nil
				end
			end
		end
	end
	local UnitName = UnitName
	LookingForGroup:Print("Kick")
	local ki = 0
	for k,v in pairs(guid_tb) do
		uninvite_unit(v)
		LookingForGroup:Print(ki,UnitName(v))
		ki = ki + 1
	end
	if LookingForGroup_Kicker.button == nil then
		local button = LibStub("AceGUI-3.0"):Create("Button")
		button:SetText("Kick")
		button:SetCallback("OnClick",kick)
		button.frame:SetParent("UIParent")
		button:SetPoint("CENTER",0,200)
		LookingForGroup_Kicker.button = button
	end
	
	if next(kick_tb) then
		LookingForGroup_Kicker.button.frame:Show()	
	end
end

function LookingForGroup_Kicker:ENCOUNTER_START(event,encounterID, encounterName, difficultyID, raidSize)
	wipe(kick_tb)
	if self.button then
		LibStub("AceGUI-3.0"):Release(self.button)
		self.button = nil
	end
end

function LookingForGroup_Kicker:ENCOUNTER_END(event,encounterID, encounterName, difficultyID, raidSize, endStatus)
	local mapid = select(8,GetInstanceInfo())
	local pug = LookingForGroup.db.profile.pug_kick
	if mapid == 1520 or mapid == 1530 or mapid == 1648 then
		if pug and (difficultyID == 14 or difficultyID == 15) then
			LookingForGroup_Kicker.Check(pug/3)
		end
		if difficultyID == 17 then
			LookingForGroup_Kicker.Check(300000,true)
		end
	elseif mapid == 1676 then
		if pug and (difficultyID == 14 or difficultyID == 15) then
			LookingForGroup_Kicker.Check(pug/2)
		end
		if difficultyID == 17 then
			LookingForGroup_Kicker.Check(600000,true)
		end
	elseif mapid == 1712 then
		if pug and (difficultyID == 14 or difficultyID == 15) then
			LookingForGroup_Kicker.Check(pug)
		end
		if difficultyID == 17 then
			LookingForGroup_Kicker.Check(1200000,true)
		end		
	end
end
