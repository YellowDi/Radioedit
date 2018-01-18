------------------------------------------------------------
-- Core.lua
--
-- Abin
-- 2017/6/22
------------------------------------------------------------

local UnitDebuff = UnitDebuff
local UnitBuff = UnitBuff
local UnitCastingInfo = UnitCastingInfo
local UnitChannelInfo = UnitChannelInfo
local PlaySoundFile = PlaySoundFile
local GetTime = GetTime

local addon = LibAddonManager:CreateAddon(...)
local L = addon.L

addon.title = L["title"]
addon:RegisterDB("QuakeAssistDB")
addon:RegisterSlashCmd("quakeassist", "qa")

--addon.debug = 1 -- debug

local AFFIX_ID = 14 -- Quaking
local QUAKE_SPELL = GetSpellInfo(240447) -- Quake
local DEBUG_SPELL = GetSpellInfo(236298) -- debug spell, arcane mages
local WARNING_SOUND = addon.path.."\\Alert.ogg" -- Replace Alert.ogg with your own sound file if preferred
local WARNING_QUAKE_APPLIED = "Sound\\Interface\\UI_RaidBossWhisperWarning.ogg"

function addon:OnInitialize(db, isNew)
	self:BroadcastEvent("OnInitialize", db, isNew)

	if self.debug then
		self:Enable()
	else
		self:RegisterEvent("CHALLENGE_MODE_START")
		self:RegisterEvent("PLAYER_ENTERING_WORLD", "CHALLENGE_MODE_START")
		self:CHALLENGE_MODE_START()
	end
end

function addon:CHALLENGE_MODE_START()
	if self:FindAffix(AFFIX_ID) then
		self:Enable()
	else
		self:Disable()
	end
end

function addon:Enable()
	if self:IsEventRegistered("UNIT_AURA") then
		return
	end

	self.lastQuakeTime = GetTime()

	self:Print(L["enabled prompt"])
	self:BroadcastEvent("OnEnable")

	self:RegisterEvent("UNIT_AURA")
	self:RegisterEvent("UNIT_SPELLCAST_START", "CheckCasting")
	self:RegisterEvent("UNIT_SPELLCAST_STOP", "CheckCasting")
	self:RegisterEvent("UNIT_SPELLCAST_CHANNEL_START", "CheckCasting")
	self:RegisterEvent("UNIT_SPELLCAST_CHANNEL_STOP", "CheckCasting")
	self:UNIT_AURA("player")
end

function addon:Disable()
	if not self:IsEventRegistered("UNIT_AURA") then
		return
	end

	self:UnregisterEvent("UNIT_AURA")
	self:UnregisterEvent("UNIT_SPELLCAST_START")
	self:UnregisterEvent("UNIT_SPELLCAST_STOP")
	self:UnregisterEvent("UNIT_SPELLCAST_CHANNEL_START")
	self:UnregisterEvent("UNIT_SPELLCAST_CHANNEL_STOP")

	self:Print(L["disabled prompt"])
	self:BroadcastEvent("OnDisable")
end

function addon:FindAffix(affix)
	if not affix then
		return
	end

	local level, affixes = C_ChallengeMode.GetActiveKeystoneInfo()
	if type(level) ~= "number" or level < 4 or type(affixes) ~= "table" then
		return
	end

	local i
	for i = 1, 3 do
		if affixes[i] == affix then
			return i
		end
	end
end

function addon:VoiceAlert()
	PlaySoundFile(WARNING_SOUND, "Master")
end

function addon:CheckAlert()
	local dangerous = self.quakeEndTime and self.castingEndTime and (self.quakeEndTime --[[+ self.db.tolerance / 100--]] < self.castingEndTime)
	if dangerous == self.dangerous then
		return
	end

	self.dangerous = dangerous
	self:BroadcastEvent("OnAlert", dangerous)

	if dangerous and self.db.voice then
		self:VoiceAlert()
	end
end

function addon:UNIT_AURA(unit)
	if unit ~= "player" then
		return
	end

	local name, _, _, _, _, duration, expires
	if self.debug then
		name, _, _, _, _, duration, expires = UnitBuff("player", DEBUG_SPELL)
		if name then
			local diff = duration - 2.5
			duration = 2.5
			expires = expires - diff
		end
	else
		name, _, _, _, _, duration, expires = UnitDebuff("player", QUAKE_SPELL)
	end

	if expires == 0 then
		expires = nil
	end

	if expires == self.quakeEndTime then
		return
	end

	if expires then
		self.lastQuakeTime = expires - duration
		--PlaySoundFile(WARNING_QUAKE_APPLIED, "Master")
	end

	self.quakeEndTime = expires
	self:BroadcastEvent("OnQuake", duration, expires)
	self:CheckAlert()
end

function addon:CheckCasting(unit)
	if unit ~= "player" then
		return
	end

	local name, _, _, texture, startTime, endTime = UnitCastingInfo("player")
	if not name then
		name, _, _, texture, startTime, endTime = UnitChannelInfo("player")
	end

	if endTime == 0 then
		name, startTime, endTime = nil
	end

	if startTime then
		startTime = startTime / 1000
	end

	if endTime then
		endTime = endTime / 1000
	end

	if self.castingEndTime == endTime then
		return
	end

	self.castingEndTime = endTime
	self:BroadcastEvent("OnCasting", name, texture, startTime, endTime)
	self:CheckAlert()
end