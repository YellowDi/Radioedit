-- Author      : Kaminari
-- Create Date : 13:03 2015-04-20
local myclass = select(2, UnitClass("player"));
if myclass ~= 'PALADIN' then return; end

-- Spells
local _ExecutionSentence = 114157;
local _FinalVerdict = 157048;
local _DivineStorm = 53385;
local _HammerofWrath = 24275;
local _CrusaderStrike = 35395;
local _Judgment = 20271;
local _Exorcism = 879;
local _AvengingWrath = 31884;
local _Seraphim = 152262;
local _TemplarVerdict = 85256;
local _HolyWrath = 119072;
local _AvengersShield = 31935;
local _LightsHammer = 114158;
local _HolyPrism = 114165;
local _Consecration = 26573;
local _ShieldoftheRighteous = 53600;
local _SacredShield = 20925;

-- Auras
local _EmpoweredDivineStorm = 174718;
local _DivineCrusader = 144595;

-- Talents
local _isFinalVerdict = false;
local _isSeraphim = false;
local _isSanctifiedWrath = false;
local _isExecutionSentence = false;
local _isLightsHammer = false;
local _isHolyPrism = false;
local _isSacredShield = false;

----------------------------------------------
-- Pre enable, checking talents
----------------------------------------------
TDDps_Paladin_CheckTalents = function()
	_isFinalVerdict = TD_TalentEnabledByCoord(7,3) --TD_TalentEnabled('Final Verdict');
	_isSeraphim = TD_TalentEnabledByCoord(7,2) --TD_TalentEnabled('Seraphim');
	_isSanctifiedWrath = TD_TalentEnabledByCoord(5,2) --TD_TalentEnabled('Sanctified Wrath');
	_isExecutionSentence = TD_TalentEnabledByCoord(6,3) --TD_TalentEnabled('Execution Sentence');
	_isLightsHammer = TD_TalentEnabledByCoord(6,2) --TD_TalentEnabled('Light\'s Hammer');
	_isHolyPrism = TD_TalentEnabledByCoord(6,1) --TD_TalentEnabled('Holy Prism');
	_isSacredShield = TD_TalentEnabledByCoord(3,3) --TD_TalentEnabled('Sacred Shield');
	-- other checking functions
end

----------------------------------------------
-- Enabling Addon
----------------------------------------------
function TDDps_Paladin_EnableAddon(mode)
	mode = mode or 1;
	_TD["DPS_Description"] = "TD Paladin DPS supports: Retribution";
	_TD["DPS_OnEnable"] = TDDps_Paladin_CheckTalents;
	if mode == 1 then
		_TD["DPS_NextSpell"] = TDDps_Paladin_Holy;
	end;
	if mode == 2 then
		_TD["DPS_NextSpell"] = TDDps_Paladin_Protection;
	end;
	if mode == 3 then
		_TD["DPS_NextSpell"] = TDDps_Paladin_Retribution;
	end;
	TDDps_EnableAddon();
end

----------------------------------------------
-- Main rotation: Holy
----------------------------------------------
TDDps_Paladin_Holy = function()
	local timeShift, currentSpell = TD_EndCast();

	return _Spell;
end

----------------------------------------------
-- Main rotation: Protection
----------------------------------------------
TDDps_Paladin_Protection = function()
	local timeShift, currentSpell = TD_EndCast();

	local holyPower = UnitPower('player', SPELL_POWER_HOLY_POWER);
	local cs, csCD = TD_SpellAvailable(_CrusaderStrike, timeShift);
	local j, jCD = TD_SpellAvailable(_Judgment, timeShift);
	local hw = TD_SpellAvailable(_HolyWrath, timeShift);
	local as = TD_SpellAvailable(_AvengersShield, timeShift);
	local es = TD_SpellAvailable(_ExecutionSentence, timeShift);
	local lh = TD_SpellAvailable(_LightsHammer, timeShift);
	local hp = TD_SpellAvailable(_HolyPrism, timeShift);
	local sera, seraCd = TD_SpellAvailable(_Seraphim, timeShift);
	local how = TD_SpellAvailable(_HammerofWrath, timeShift);
	local con = TD_SpellAvailable(_Consecration, timeShift);
	local ssCD = TD_SpellAvailable(_SacredShield, timeShift);
	local sotr = TD_SpellAvailable(_ShieldoftheRighteous); --not on gcd

	local avAura = TD_Aura(_AvengingWrath, timeShift);
	local ss = TD_Aura(_SacredShield, timeShift + 7);

	local targetPh = TD_TargetPercentHealth();

	TDButton_GlowCooldown(_ShieldoftheRighteous, holyPower >= 3 and sotr);
	TDButton_GlowCooldown(_SacredShield, not ss and ssCD);

	if cs then
		return _CrusaderStrike;
	end

	if j then
		return _Judgment;
	end

	if _isSanctifiedWrath and hw then
		return _HolyWrath;
	end

	if as then
		return _AvengersShield;
	end

	if not _isSeraphim or seraCd < 2 then
		if _isExecutionSentence and es then
			return _ExecutionSentence;
		end

		if _isLightsHammer and lh then
			return _LightsHammer;
		end

		if _isHolyPrism and hp then
			return _HolyPrism;
		end
	end

	if (targetPh <= 0.2 or avAura) and how then
		return _HammerofWrath;
	end

	if con then
		return _Consecration;
	end

	if not _isSanctifiedWrath and hw then
		return _HolyWrath;
	end

	if csCD < jCD then
		return _CrusaderStrike;
	else
		return _Judgment;
	end
end

----------------------------------------------
-- Main rotation: Retribution
----------------------------------------------
TDDps_Paladin_Retribution = function()
	local timeShift, currentSpell = TD_EndCast();
	local gcd = TD_GlobalCooldown();

	local holyPower = UnitPower('player', SPELL_POWER_HOLY_POWER);
	local finalVerdict = TD_Aura(_FinalVerdict, timeShift);
	local avAura = TD_Aura(_AvengingWrath, timeShift);
	local eds = TD_Aura(_EmpoweredDivineStorm, timeShift);
	local ds = TD_Aura(_DivineCrusader, timeShift);
	local es = TD_SpellAvailable(_ExecutionSentence, timeShift);
	local how = TD_SpellAvailable(_HammerofWrath, timeShift);
	local av = TD_SpellAvailable(_AvengingWrath, timeShift);
	local cs, csCD = TD_SpellAvailable(_CrusaderStrike, timeShift);
	local j, jCD = TD_SpellAvailable(_Judgment, timeShift);
	local e, eCD = TD_SpellAvailable(_Exorcism, timeShift);
	local targetPh = TD_TargetPercentHealth();
	local sera, seraCd = TD_SpellAvailable(_Seraphim, timeShift);
	TDButton_GlowCooldown(_AvengingWrath, av);

	if _isSeraphim then
		if seraCd < gcd and holyPower >= 5 then
			return _Seraphim;
		end
	end

	if finalVerdict and holyPower >= 4 and (eds or ds) then
		return _DivineStorm;
	end

	if holyPower >= 5 then
		if _isSeraphim then
			if seraCd > 4 * gcd then
			return _TemplarVerdict;
			end
		else
			return _TemplarVerdict;
		end
	end

	if es then
		return _ExecutionSentence;
	end

	if (targetPh <= 0.35 or avAura) and how then
		return _HammerofWrath;
	end

	if cs then
		return _CrusaderStrike;
	end

	if j then
		return _Judgment;
	end

	if e then
		return _Exorcism;
	end

	if holyPower >= 3 then
		if _isSeraphim then
			if seraCd > 8 * gcd then
				return _TemplarVerdict;
			end
		else
			return _TemplarVerdict;
		end
	end

	if eds or ds then
		return _DivineStorm;
	end

	if csCD < jCD and csCD < eCD then
		return _CrusaderStrike;
	end

	if jCD < csCD and jCD < eCD then
		return _Judgment;
	end

	if eCD < csCD and eCD < jCD then
		return _Exorcism;
	end

	return _CrusaderStrike;
end