local LookingForGroup = LibStub("AceAddon-3.0"):GetAddon("LookingForGroup")
local LookingForGroup_AV = LibStub("AceAddon-3.0"):GetAddon("LookingForGroup_AV")
local string_find = string.find

local raider = {}

local rl_tb = {}

raider[1] = function(rl) -- raider.accept(rl)
	local id = rl_tb[rl]
	if id then
		wipe(rl_tb)
		LookingForGroup_AV.db.profile.raid_leader = rl
	end
end

raider[2] = function(rl) -- raider.party_accept(rl)
	local id = rl_tb[rl]
	if id then
		wipe(rl_tb)
		local profile = LookingForGroup_AV.db.profile
		profile.role = 1
		profile.raid_leader = rl
		C_LFGList.CancelApplication(id)
		LookingForGroup_AV:GROUP_ROSTER_UPDATE()
	end
end

raider[3] = function(pl,nm,msg) -- raider.print_chat_message(pl,nm,msg)
	if UnitIsGroupLeader(pl) then
		print("[V]["..nm.."]:",msg)
	end
end

raider[4] = function(pl) -- raider.roleconfirm(pl)
	if UnitIsGroupLeader(pl) then
		CompleteLFGRoleCheck(true)
	end
end

raider[5] = function(pl) -- raider.leavebg(pl)
	if UnitIsGroupLeader(pl) then
		local GetBattlefieldStatus = GetBattlefieldStatus
		for i=1,GetMaxBattlefieldID() do
			local status, bg = GetBattlefieldStatus(i)
			if status ~= "none" then
				LookingForGroup:Print(LEAVE_QUEUE,bg)
				return
			end
		end
	end
end

function LookingForGroup_AV:ChatCommand(msg)
	LookingForGroup_AV:SendCommand(LookingForGroup_AV:Serialize(2,4,msg),"PARTY")
end

function LookingForGroup_AV.ApplyToGroup(resultID, ...)
	LookingForGroup_AV.SetRole(0)
	LookingForGroup_AV.db.profile.raid_leader = nil
	local leadername = select(13,C_LFGList.GetSearchResultInfo(resultID))
	if not string_find(leadername,'-') then
		rl_tb[leadername] = resultID
	end
	C_LFGList.ApplyToGroup(resultID, ...)
end

LookingForGroup_AV.member[1] = raider
