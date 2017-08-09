local LookingForGroup = LibStub("AceAddon-3.0"):GetAddon("LookingForGroup")
local LookingForGroup_Kicker = LibStub("AceAddon-3.0"):NewAddon("LookingForGroup_Kicker","AceEvent-3.0","AceTimer-3.0","AceTimer-3.0")

local kick_tb

function LookingForGroup_Kicker.UninviteUnit(unit)
	if unit then
		local guid = UnitGUID(unit)
		if guid then
			kick_tb[guid] = unit
		end
	end
end

function LookingForGroup_Kicker:OnInitialize()
end

function LookingForGroup_Kicker:OnEnable()
	kick_tb = {}
	self:RegisterEvent("PLAYER_REGEN_ENABLED")
	self:RegisterEvent("PLAYER_REGEN_DISABLED")
end

function LookingForGroup_Kicker:OnDisable()
	kick_tb = nil
	self:PLAYER_REGEN_ENABLED()
	self:UnregisterAllEvents()
end

function LookingForGroup_Kicker.Kick()
	if not InCombatLockdown() then
		local guid_tb = {}
		local num = GetNumGroupMembers()
		if UnitInRaid("player") then
			format_str = "raid"
		elseif UnitInParty("player") then
			format_str = "party"
		else
			return
		end
		local playerguid = UnitGUID("player")
		for i=1,GetNumGroupMembers() do
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
				UninviteUnit(p)
			else
				kick_tb[k] = nil
			end
		end
	end
end

function LookingForGroup_Kicker:PLAYER_REGEN_ENABLED()
	if self.button then
		LibStub("AceGUI-3.0"):Release(self.button)
		self.button = nil
	end
end

function LookingForGroup_Kicker:PLAYER_REGEN_DISABLED()
	if UnitAffectingCombat("player") or next(kick_tb) == nil then
		self:PLAYER_REGEN_ENABLED()
		return
	end
	if self.button == nil then
		local button = LibStub("AceGUI-3.0"):Create("Button")
		button:SetText(CHAT_KICK)
		button:SetCallback("OnClick",function()
			LookingForGroup_Kicker:Kick()
			if next(kick_tb) == nil then
				LookingForGroup_Kicker:PLAYER_REGEN_ENABLED()
			end
		end)
		button.frame:SetParent("UIParent")
		button:SetPoint("CENTER",0,200)
		button.frame:Show()
		self.button = button
	end
end

function LookingForGroup_Kicker.Check(mindps,allroles,isencounter,vote_to_kick)
	if (not SkadaPerCharDB) or (not vote_to_kick and not UnitIsGroupLeader("player")) then
		if kick_tb then
			wipe(kick_tb)
		end
		LookingForGroup_Kicker:PLAYER_REGEN_ENABLED()
		return
	end
	if not isencounter then
		if kick_tb then
			wipe(kick_tb)
		else
			return
		end
	end
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
	local uninvite_unit = LookingForGroup_Kicker.UninviteUnit
	for i=1,GetNumGroupMembers() do
		local unit = format_str..i
		local uid = UnitGUID(unit)
		if uid and uid ~= player_guid then
			if UnitIsConnected(unit) then
				if allroles then
					guid_tb[uid] = unit
				else
					local role = UnitGroupRolesAssigned(unit)
					if role == "NONE" or role == "DAMAGER" then
						guid_tb[uid] = unit
					end
				end
			else
				uninvite_unit(unit)
			end	
		end
	end
	local set
	if isencounter then
		set = SkadaPerCharDB.sets[1]
	else
		set = SkadaPerCharDB.total
	end
	local players = set.players
	for i=1,#players do
		local ele = players[i]
		local id = ele.id
		if guid_tb[id] then
			local tm = ele.time
			if tm ~= 0 then
				local unitdps = ele.damage/tm
				if allroles then
					local unit = guid_tb[id]
					local role = UnitGroupRolesAssigned(unit)
					if role == "HEALER" then
						if mindps < unitdps * 3 then
							guid_tb[id] = nil
						end
					else
						if mindps < unitdps then
							guid_tb[id] = nil
						end
					end
				else
					if mindps < unitdps then
						guid_tb[id] = nil
					end
				end
			end
		end
	end
	for k,v in pairs(guid_tb) do
		uninvite_unit(v)
	end
	LookingForGroup_Kicker:PLAYER_REGEN_DISABLED()
end

function LookingForGroup_Kicker.ScheduleCheck(period,stopfunc,mindps,allroles,isencounter,vote_to_kick)
	local timer
	timer = LookingForGroup_Kicker:ScheduleRepeatingTimer(function()
		if stopfunc() then
			LookingForGroup_Kicker:CancelTimer(timer)
		else
			LookingForGroup_Kicker.Check(mindps,allroles,isencounter,vote_to_kick)
		end
	end,period)
end

function LookingForGroup_Kicker:ENCOUNTER_END(event,encounterID, encounterName, difficultyID, raidSize, endStatus)
	local mapid = select(8,GetInstanceInfo())
	local pug = LookingForGroup.db.profile.pug_kick
	if mapid == 1530 then
		if pug and (difficultyID == 14 or difficultyID == 15) then
			LookingForGroup_Kicker.Check(pug,nil,true)
		end
		if difficultyID == 17 then
			LookingForGroup_Kicker.Check(350000,nil,true,true)
		end
	elseif mapid == 1676 then
		if pug and (difficultyID == 14 or difficultyID == 15) then
			LookingForGroup_Kicker.Check(pug,nil,true)
		end
		if difficultyID == 17 then
			LookingForGroup_Kicker.Check(700000,nil,true,true)
		end
	end
end
