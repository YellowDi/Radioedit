﻿-- Author      : Kaminari
-- Create Date : 10/27/2014 6:47:46 PM
local myclass = select(2, UnitClass("player"));
if myclass ~= 'WARLOCK' then return; end

-- SPELLS
local _Corruption			= 172;
local _ShadowBolt			= 686;
local _Metamorphosis		= 103958;
local _HandOfGuldan			= 105174;
local _SoulFire				= 104027;
local _Doom					= 603;
local _TouchOfChaos			= 103964;
local _ChaosWave			= 124916
local _DarkSoulKnowledge	= 113861;
local _DarkSoulMisery		= 113860;
local _DarkSoulInstability	= 113858;
local _FireAndBrimstone		= 108683;
local _GrimoireDoomguard	= 157900;
local _Cataclysm			= 152108;
local _Felstorm				= 119914;
local _Havoc				= 80240;
local _Agony				= 980;
local _Conflagrate			= 17962;
local _Incinerate			= 29722;
local _Immolate				= 348;
local _ChaosBolt			= 116858;
local _Shadowburn			= 17877;
local _UnstableAffliction	= 30108;
local _Soulburn				= 74434;
local _Haunt				= 48181;
local _DrainSoul			= 103103;
local _SoulSwap				= 86121;
local _SummonDoomguard		= 18540;

-- AURAS
local _MoltenCore = 140074;
local _HauntingSpirits = 157698;

local isCataclysm = false;
local isGrimoireOfService = false;
local isDemonbolt = false;
local isSoulburnHaunt = false;
local isCharredRemains = false;
local isDemonicServitude = false;

local Soul_Fire = GetSpellInfo(6353) --'Soul Fire'
local Chaos_Bolt = GetSpellInfo(116858) --'Chaos Bolt'
local Immolate = GetSpellInfo(348) --'Immolate'
local Molten_Core = GetSpellInfo(122351) --'Molten Core'
local Metamorphosis = GetSpellInfo(103958) --'Metamorphosis'

----------------------------------------------
-- Pre enable, checking talents
----------------------------------------------
TDDps_Warlock_CheckTalents = function()
	isCataclysm = TD_TalentEnabledByCoord(7,2) --TD_TalentEnabled('Cataclysm');
	isDemonbolt = TD_TalentEnabledByCoord(7,1) --TD_TalentEnabled('Demonbolt');
	isGrimoireOfService = TD_TalentEnabledByCoord(5,2) --TD_TalentEnabled('Grimoire of Service');
	isSoulburnHaunt = TD_TalentEnabledByCoord(7,1) --TD_TalentEnabled('Soulburn: Haunt');
	isCharredRemains = TD_TalentEnabledByCoord(7,1) --TD_TalentEnabled('Charred Remains');
	isDemonicServitude = TD_TalentEnabledByCoord(7,3) --TD_TalentEnabled('Demonic Servitude');
end

----------------------------------------------
-- Enabling Addon
----------------------------------------------
function TDDps_Warlock_EnableAddon(mode)
	mode = mode or 1;
	_TD['DPS_Description'] = 'TD Warlock DPS supports: Affliction, Demonology, Destruction';
	_TD['DPS_OnEnable'] = TDDps_Warlock_CheckTalents;
	if mode == 1 then
		_TD['DPS_NextSpell'] = TDDps_Warlock_Affliction
	end;
	if mode == 2 then
		_TD['DPS_NextSpell'] = TDDps_Warlock_Demonology
	end;
	if mode == 3 then
		_TD['DPS_NextSpell'] = TDDps_Warlock_Destruction
	end;
	TDDps_EnableAddon();
end

----------------------------------------------
-- Main rotation: Affliction
----------------------------------------------
TDDps_Warlock_Affliction = function()
	local timeShift, currentSpell, gcd = TD_EndCast();

	local shards = UnitPower('player', SPELL_POWER_SOUL_SHARDS);
	local dsCD, dsCharges, dsMax = TD_SpellCharges(_DarkSoulMisery, timeShift);

	local corruption = TD_TargetAura(_Corruption, timeShift + 5);
	local agony = TD_TargetAura(_Agony, timeShift + 7);
	local ua = TD_TargetAura(_UnstableAffliction, timeShift + 4);

	local dsm = TD_Aura(_DarkSoulMisery, timeShift);
	local haunting = TD_Aura(_HauntingSpirits, timeShift + 9);
	local sb = TD_Aura(_Soulburn, timeShift);
	local bl = TD_Bloodlust(timeShift);

	local gd = TD_SpellAvailable(_GrimoireDoomguard, timeShift);
	local doomguard = TD_SpellAvailable(_SummonDoomguard, timeShift);
	local felstorm = TD_SpellAvailable(_Felstorm);

	local targetPh = TD_TargetPercentHealth();

	local cata = TD_SpellAvailable(_Cataclysm, timeShift);

	TDButton_GlowCooldown(_GrimoireDoomguard, gd);

	if isDemonicServitude then
		TDButton_GlowCooldown(_SummonDoomguard, doomguard);
	end

	TDButton_GlowCooldown(_DarkSoulMisery, dsCharges > 0 and not dsm);

	if isCataclysm then
		TDButton_GlowCooldown(_Cataclysm, cata);
	end

	-- keep and apply all 3 dots
	if not agony then
		return _Agony;
	end

	if not corruption then
		return _Corruption;
	end

	if not ua then
		return _UnstableAffliction;
	end

	if isSoulburnHaunt and not haunting and not sb and shards > 1 then
		return _Soulburn;
	end

	if isSoulburnHaunt and sb and shards > 0 then
		return _Haunt;
	end

	if shards >= 4 then
		return _Haunt;
	end

	if (bl or dsm) and ((isSoulburnHaunt and shards >= 3) or (not isSoulburnHaunt and shards > 0)) then
		return _Haunt;
	end;

	return _DrainSoul;
end

----------------------------------------------
-- Main rotation: Demonology
----------------------------------------------
TDDps_Warlock_Demonology = function()
	local timeShift, currentSpell, gcd = TD_EndCast();

	local meta = TDDps_Warlock_Metamorphosis();
	local fury = UnitPower('player', 15);
	local corruption = TD_TargetAura(_Corruption, timeShift + 4);
	local dsk = TD_TargetAura(_DarkSoulKnowledge, timeShift);
	local dsCD, dsCharges, dsMax = TD_SpellCharges(_DarkSoulKnowledge);
	local gd = TD_SpellAvailable(_GrimoireDoomguard, timeShift);
	local felstorm = TD_SpellAvailable(_Felstorm);
	local moltenCore = TDDps_Warlock_MoltenCore();
	local targetPh = TD_TargetPercentHealth();
	local doom = TD_TargetAura('Doom', timeShift + 18);
	local hogCD, hogCharges, hogMax = TD_SpellCharges(_HandOfGuldan);
	local cata = TD_SpellAvailable(_Cataclysm, timeShift);
	if currentSpell == Soul_Fire and moltenCore > 0 then
		moltenCore = moltenCore - 1;
	end

	if isCataclysm then
		TDButton_GlowCooldown(_Cataclysm, cata);
	end

	TDButton_GlowCooldown(_GrimoireDoomguard, gd);
	TDButton_GlowCooldown(_Felstorm, felstorm);
	TDButton_GlowCooldown(_DarkSoulKnowledge, dsCharges > 0 and not dsk);

	if meta then
	
		if fury <= 40 then
			return _Metamorphosis;
		end
		
		if fury < 100 and fury >= 60 then
			return _Corruption; -- same slot as Doom
		end
	
		if not TD_TargetAura(_Corruption, timeShift + 8) then
			return _ShadowBolt; -- same slot as Touch of Chaos 
		end
		
		if not doom then
			return _Corruption; -- same slot as Doom
		end
		
		if hogCharges >= hogMax then
			return _HandOfGuldan;
		end
		
		if hogCharges >= (hogMax - 1) and hogCD < 6 + timeShift then
			return _HandOfGuldan;
		end
		
		if moltenCore > 0 then
			return _SoulFire;
		end
	else
		-- Not in metamorphosis
		local hogDot = TD_TargetAura(_HandOfGuldan, 3);
		
		if not corruption then
			return _Corruption;
		end
		
		if hogCharges >= hogMax then
			return _HandOfGuldan;
		end
		
		if hogCharges >= (hogMax - 1) and hogCD < 6 + timeShift then
			return _HandOfGuldan;
		end
		
		if fury >= 200 and not doom then
			return _Metamorphosis;
		end
		
		if moltenCore > 8 then
			return _SoulFire;
		end
		
		if moltenCore > 0 and targetPh < 0.25 then
			return _SoulFire;
		end
		
		if fury > 850 then
			return _Metamorphosis;
		end
		
	end
	
	return _ShadowBolt;
end

----------------------------------------------
-- Main rotation: Destruction
----------------------------------------------
TDDps_Warlock_Destruction = function()
	local timeShift, currentSpell, gcd = TD_EndCast();

	local embers = UnitPower('player', SPELL_POWER_BURNING_EMBERS, true);

	local dsCD, dsCharges, dsMax = TD_SpellCharges(_DarkSoulInstability, timeShift);
	local conCD, conCharges, conMax = TD_SpellCharges(_Conflagrate, timeShift);

	local immo = TD_TargetAura(_Immolate, timeShift + 5);

	local dsi = TD_Aura(_DarkSoulInstability, timeShift);
	local fab = TD_Aura(_FireAndBrimstone, timeShift);

	local gd = TD_SpellAvailable(_GrimoireDoomguard, timeShift);
	local doomguard = TD_SpellAvailable(_SummonDoomguard, timeShift);
	local havoc = TD_SpellAvailable(_Havoc, timeShift);
	local felstorm = TD_SpellAvailable(_Felstorm);

	local cbCost = 10;
	if currentSpell == Chaos_Bolt then
		if fab then
			cbCost = 20;
		end
		embers = embers - cbCost;
	end

	local targetPh = TD_TargetPercentHealth();
	local cata = TD_SpellAvailable(_Cataclysm, timeShift);

	if not isDemonicServitude then
		TDButton_GlowCooldown(_SummonDoomguard, doomguard);
	end

	TDButton_GlowCooldown(_GrimoireDoomguard, gd);
	TDButton_GlowCooldown(_DarkSoulInstability, dsCharges > 0 and not dsi);
	TDButton_GlowCooldown(_Havoc, havoc);

	local chaosFlag = (embers >= 35 or (isCharredRemains and embers > 25)) or (dsi and embers >= 10);

	if targetPh < 0.2 and chaosFlag then
		return _Shadowburn;
	end

	if not immo and currentSpell ~= Immolate then
		return _Immolate;
	end

	if conCharges >=2 then
		return _Conflagrate;
	end

	if isCataclysm and cata then
		return _Cataclysm;
	end

	if chaosFlag then
		return _ChaosBolt;
	end

	if conCharges >=1 then
		return _Conflagrate;
	end

	return _Incinerate;
end

----------------------------------------------
-- Molten Core stacks
----------------------------------------------
function TDDps_Warlock_MoltenCore()
	local _, _, _, count, _, _, expirationTime = UnitAura('player', Molten_Core); 
	if expirationTime ~= nil and (expirationTime - GetTime()) > 0.2 then
		return count;
	end
	return 0;
end

----------------------------------------------
-- Is in Metamorphosis
----------------------------------------------
function TDDps_Warlock_Metamorphosis()
	local is = UnitAura('player', Metamorphosis);
	return is == 'Metamorphosis';
end