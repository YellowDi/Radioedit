LoadAddOn("LookingForGroup_Locale")
local LookingForGroup = LibStub("AceAddon-3.0"):GetAddon("LookingForGroup")
local LookingForGroup_MS = LibStub("AceAddon-3.0"):NewAddon("LookingForGroup_MS","AceSerializer-3.0")

local L = LibStub("AceLocale-3.0"):GetLocale("LookingForGroup")

function LookingForGroup_MS:OnInitialize()
end

function LookingForGroup_MS:OnEnable()
end

local instance_tb = {}

local function instance(groupid)
	if groupid then
		local igp = instance_tb[groupid]
		if igp then
			return igp
		else
			local name = C_LFGList.GetActivityGroupInfo(groupid)
			local num = GetNumSavedInstances()
			local string_find = string.find
			local i
			for i=1,num do
				local instanceName, instanceID, _, instanceDifficulty, locked, _, instanceIDMostSig, isRaid, maxPlayers, difficultyName, maxBosses, _ = GetSavedInstanceInfo(i)
				if (string_find(name,instanceName) or string_find(instanceName,name)) then
					local encounters_tb = {}
					for j = 1, maxBosses do
						encounters_tb[j] = GetSavedInstanceEncounterInfo(i,j)
					end
					instance_tb[groupid] = encounters_tb
					return encounters_tb
				end
			end
		end
	end
end

local concat_tb = {}
local wipe = wipe
local tconcat = table.concat
local RAID_CLASS_COLORS = RAID_CLASS_COLORS
local class_table = FillLocalizedClassList({})
local loot_mode_tb = {LOOT_FREE_FOR_ALL,LOOT_ROUND_ROBIN,LOOT_MASTER_LOOTER,LOOT_GROUP_LOOT,LOOT_NEED_BEFORE_GREED,LOOT_PERSONAL_LOOT,[0]=ALL}

local mode_tb = {GARRISON_SHIPYARD_MSSION_INPROGRESS_TOOLTIP,"Carry",ACHIEVEMENTS,APPEARANCE_LABEL,"Yolo","MMR",HONOR,"GG",TRANSMOG_SOURCE_2,DAILY,LEVELING,"LOL","Farm",WORLD,[0]=ALL,[255]=UNKNOWN,[99]=OTHER}

local function warning()
	local profile = LookingForGroup.db.profile
	if not profile.ignore_warning then
		concat_tb[#concat_tb+1] = "\n\n|TInterface\\OptionsFrame\\UI-OptionsFrame-NewFeatureIcon:0:0:0:-1|t|c00ff0000"
		concat_tb[#concat_tb+1] = L.warning
		concat_tb[#concat_tb+1] = "|r"
	end
end

function LookingForGroup_MS.hsr(data)
	wipe(concat_tb)
    local isMeetingStone, customId, version, mode, loot,
            class, itemLevel, progression, leaderPvPRating, minLevel, maxLevel, pvpRating, source, creator, savedInstance, _, honorLevel = LookingForGroup_MS:Deserialize(data)
	warning()
	if version and version ~= "" then
		concat_tb[#concat_tb+1] = "\n"
		concat_tb[#concat_tb+1] = version:gsub('(%d)(%d)(%d%d)', '%10%200.%3')
	end
	if mode then
		local v = mode_tb[mode]
		if v then
			concat_tb[#concat_tb+1] = "\n"
			concat_tb[#concat_tb+1] = v
		else
			concat_tb[#concat_tb+1] = "\n"
			concat_tb[#concat_tb+1] = mode
		end
	end
	if loot then
		local lm = loot_mode_tb[loot]
		if lm then
			concat_tb[#concat_tb+1] = "\n"
			concat_tb[#concat_tb+1] = lm
		else
			concat_tb[#concat_tb+1] = "\n"
			concat_tb[#concat_tb+1] = loot
		end
	end
	if pvpRating then
		concat_tb[#concat_tb+1] = "\n"
		concat_tb[#concat_tb+1] = RATING
		concat_tb[#concat_tb+1] = " "
		concat_tb[#concat_tb+1] = pvpRating
	end
	concat_tb[#concat_tb+1] = "\n"
	local c
	if class then
		_,c = GetClassInfoByID(class)
		if c then
			concat_tb[#concat_tb+1] = "|c"
			concat_tb[#concat_tb+1] = RAID_CLASS_COLORS[c].colorStr
		end
	end
	if creator then
		concat_tb[#concat_tb+1] = '\n'
		concat_tb[#concat_tb+1] = CALENDAR_ANNOUNCEMENT_CREATEDBY_PLAYER:format(creator)
	end
	if itemLevel then
		concat_tb[#concat_tb+1] = "\n"
		concat_tb[#concat_tb+1] = LFG_LIST_ITEM_LEVEL_INSTR_SHORT
		concat_tb[#concat_tb+1] = " "
		concat_tb[#concat_tb+1] = itemLevel
	end
	if leaderPvPRating then
		concat_tb[#concat_tb+1] = "\n"
		concat_tb[#concat_tb+1] = RATING
		concat_tb[#concat_tb+1] = " "
		concat_tb[#concat_tb+1] = leaderPvPRating
	end
	if c then
		concat_tb[#concat_tb+1] = "|r"
	end
	if type(progression) ~= "number" then
		progression = nil
	end
	return tconcat(concat_tb),progression
end

local function pgr(groupID,progression,rse)
	if not progression then
		return
	end
	local ib = instance(groupID)
	if not ib then
		return
	end
	local bnd = bit.band
	local bls = bit.lshift
	if rse then
		concat_tb[#concat_tb+1] = "\n\n"
		concat_tb[#concat_tb+1] = #rse
		concat_tb[#concat_tb+1] = "/"
		concat_tb[#concat_tb+1] = #ib
		local j = 1
		for i=1,#ib do
			if bnd(progression,bls(1,i-1)) == 0 then
				if ib[i] == rse[j] then
					concat_tb[#concat_tb+1] = "\n|cffff0000"
					concat_tb[#concat_tb+1] = ib[i]
					concat_tb[#concat_tb+1] = "|r"
					j = j + 1
				else
					concat_tb[#concat_tb+1] = "\n"
					concat_tb[#concat_tb+1] = ib[i]
				end
			else
				if ib[i] == rse[j] then
					concat_tb[#concat_tb+1] = "\n|cffffff00"
					concat_tb[#concat_tb+1] = ib[i]
					concat_tb[#concat_tb+1] = "|r"
					j = j + 1
				else
					concat_tb[#concat_tb+1] = "\n|cff00ff00"
					concat_tb[#concat_tb+1] = ib[i]
					concat_tb[#concat_tb+1] = "|r"
				end
			end
		end
	else
		for i=1,#ib do
			if bnd(progression,bls(1,i-1)) == 0 then
				concat_tb[#concat_tb+1] = "\n"
				concat_tb[#concat_tb+1] = ib[i]
			else
				concat_tb[#concat_tb+1] = "\n|cff00ff00"
				concat_tb[#concat_tb+1] = ib[i]
				concat_tb[#concat_tb+1] = "|r"
			end
		end
	end
	return true
end

function LookingForGroup_MS.hpg(...)
	wipe(concat_tb)
	if pgr(...) then
		return tconcat(concat_tb)
	end
end

function LookingForGroup_MS.hap(data)
	local active, activityID, iLevel, name, comment, voiceChat, expiration, autoAccept = C_LFGList.GetActiveEntryInfo()
	if active == nil or activityID == nil then
		return
	end
	local isMeetingStone, progression, pvpRating, source = LookingForGroup_MS:Deserialize(data)
	wipe(concat_tb)
	warning()
	local fullName, shortName, categoryID, groupID = C_LFGList.GetActivityInfo(activityID)
	if groupID then
		pgr(groupID,progression)
	end
	if pvpRating then
		concat_tb[#concat_tb+1] = "\n"
		concat_tb[#concat_tb+1] = RATING
		concat_tb[#concat_tb+1] = " "
		concat_tb[#concat_tb+1] = pvpRating
	end
	return tconcat(concat_tb)
end
