local SLE, T, E, L, V, P, G = unpack(select(2, ...)) 
local PvP = SLE:NewModule('PVP','AceHook-3.0', 'AceEvent-3.0')
--GLOBALS: hooksecurefunc, CreateFrame
local RepopMe, HasSoulstone = RepopMe, HasSoulstone
local COMBATLOG_HONORGAIN, COMBATLOG_HONORGAIN_NO_RANK, COMBATLOG_HONORAWARD = COMBATLOG_HONORGAIN, COMBATLOG_HONORGAIN_NO_RANK, COMBATLOG_HONORAWARD
local PVP_RANK_0_0 =PVP_RANK_0_0
local GetCurrencyInfo = GetCurrencyInfo
PvP.HonorStrings = {}
local bit_band = bit.band
local BG_Opponents = {
}
local _G = _G
local CancelDuel = CancelDuel
local StaticPopup_Hide = StaticPopup_Hide
local COMBATLOG_OBJECT_TYPE_PLAYER = COMBATLOG_OBJECT_TYPE_PLAYER
local RAID_CLASS_COLORS = RAID_CLASS_COLORS
local TopBannerManager_Show = TopBannerManager_Show
local BossBanner_BeginAnims = BossBanner_BeginAnims
local PlaySound = PlaySound
local CombatLogGetCurrentEventInfo = CombatLogGetCurrentEventInfo
local GetSortedSelfResurrectOptions = GetSortedSelfResurrectOptions
local CancelPetPVPDuel = C_PetBattles.CancelPVPDuel

local SOUNDKIT = SOUNDKIT

function PvP:Release()
	local resOptions = GetSortedSelfResurrectOptions()
	if (PvP.db.rebirth and not resOptions[1]) or not PvP.db.rebirth then RepopMe() end
end

function PvP:Dead()
	local inInstance, instanceType = T.IsInInstance()
	if not PvP.db.autorelease then return end --Option disabled = do jack shit
	if (inInstance and instanceType == "pvp") then
		PvP:Release()
		return --To prevent the rest of the function from execution when not needed
	end
	-- auto resurrection for world PvP area...when active
	for index = 1, T.GetNumWorldPVPAreas() do
		local _, localizedName, isActive, canQueue = T.GetWorldPVPAreaInfo(index)
		if (T.GetRealZoneText() == localizedName and isActive) or (T.GetRealZoneText() == localizedName and canQueue) then PvP:Release() end
	end
end

--Cancel duels
function PvP:Duels(event, name)
	local cancelled = false
	if event == "DUEL_REQUESTED" and PvP.db.duels.regular then
		CancelDuel()
		StaticPopup_Hide("DUEL_REQUESTED")
		cancelled = "REGULAR"
	elseif event == "PET_BATTLE_PVP_DUEL_REQUESTED" and PvP.db.duels.pet then
		CancelPetPVPDuel()
		StaticPopup_Hide("PET_BATTLE_PVP_DUEL_REQUESTED")
		cancelled = "PET"
	end
	if cancelled then
		SLE:Print(T.format(L["SLE_DuelCancel_"..cancelled], name))
	end
end

--Duilding opponents table for boss banner
function PvP:OpponentsTable()
	T.twipe(BG_Opponents)
	for index = 1, T.GetNumBattlefieldScores() do
		local name, _, _, _, _, faction, _, _, classToken = T.GetBattlefieldScore(index)
		if (E.myfaction == "Horde" and faction == 1) or (E.myfaction == "Alliance" and faction == 0) then
			BG_Opponents[name] = classToken --Saving oponents class to use for coloring
		end
	end
end

--Parse combat log for killing blows
function PvP:LogParse()
	local _, subevent, _, _, Caster, _, _, _, TargetName, TargetFlags = CombatLogGetCurrentEventInfo()
	if subevent == "PARTY_KILL" then
		local mask = bit_band(TargetFlags, COMBATLOG_OBJECT_TYPE_PLAYER) --Don't ask me, it's some dark magic. If bit mask for this is positive, it means a player was killed
		if Caster == E.myname and (BG_Opponents[TargetName] or mask > 0) then --If this is my kill and target is a player (world) or in the oponents table (BGs)
			if mask > 0 and BG_Opponents[TargetName] then TargetName = "|c"..RAID_CLASS_COLORS[BG_Opponents[TargetName]].colorStr..TargetName.."|r" end --Color dat name into class color. Only for BGs
			TopBannerManager_Show(_G["BossBanner"], { name = TargetName, mode = "SLE_PVPKILL" }); --Show boss banner with own mode and a dead person's name instead of boss name
		end
	end
end

function PvP:Initialize()
	if not SLE.initialized then return end
	PvP.db = E.db.sle.pvp

	--AutoRes event
	self:RegisterEvent("PLAYER_DEAD", "Dead");

	if E.db.movers["PvPMover"] then E.db.movers["TopCenterContainerMover"] = E.db.movers["PvPMover"]; E.db.movers["PvPMover"] = nil end

	self:RegisterEvent("DUEL_REQUESTED", "Duels")
	self:RegisterEvent("PET_BATTLE_PVP_DUEL_REQUESTED", "Duels")

	function PvP:ForUpdateAll()
		PvP.db = E.db.sle.pvp
	end

	if E.private.sle.pvp.KBbanner.enable then
		--Hook to blizz function for boss kill banner
		hooksecurefunc(_G["BossBanner"], "PlayBanner", function(self, data)
			if ( data ) then
				if ( data.mode == "SLE_PVPKILL" ) then
					self.Title:SetText(data.name);
					self.Title:Show();
					self.SubTitle:Hide();
					self:Show();
					BossBanner_BeginAnims(self);
					if E.private.sle.pvp.KBbanner.sound then
						PlaySound(SOUNDKIT.UI_RAID_BOSS_DEFEATED)
					end
				end
			end
		end)
		self:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED", "LogParse")
		self:RegisterEvent("UPDATE_BATTLEFIELD_SCORE", "OpponentsTable")
	end
end

SLE:RegisterModule(PvP:GetName())
