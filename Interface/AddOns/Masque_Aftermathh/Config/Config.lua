local A, C, L = select(2, ...):unpack()

--------------------------------------
-- Default settings of AftermathhUI --
--------------------------------------

local Class = select(2, UnitClass("player"))
local CustomClassColor = A.Colors.class[Class]

C["General"] = {
	["WelcomeLoading"] = true,
	["AutoScale"] = true,
	["UIScale"] = 0.80,
	["PanelColor"] = { 0.250, 0.250, 0.250 },
	["BorderColor"] = { 0.125, 0.125, 0.125 },
	["BackdropColor"] = { 0.050, 0.050, 0.050, 0.80 },
	["ShadowAlpha"] = { 0, 0, 0, 0.9 },
}

C["ActionBars"] = {
	["ActionBarsMod"] = true,
	["SwitchBarOnStance"] = true,
	["HideMacroText"] = true,
	["HideHotKeyText"] = true,
	["PushedColor"] = { 1, 0.8, 0,  0.25 },
	["CheckedColor"] = { 0, 1, 0, 0.25},
	["HighlightColor"] = { 1, 1, 1, 0.1 },
	["EquipColor"] = { 0.64, 0.19, 0.79, 0.50 },
	["ProcColor"] = { 0.65, 0.84, 1 },
	["ActionBar1Point"] = {"BOTTOM", UIParent, 1, 6}, 
	["ActionBar2Point"] = {"BOTTOM", UIParent, 1, 6}, 
	["ActionBar5Point"] = {"LEFT", UIParent, 6, 0},
	["StanceBarPoint"]  = {"TOPLEFT", UIParent, 3.5, -196},
	["PetBarPoint"]     = {"TOPRIGHT", Minimap, 292, 0},
}

C["Auras"] = {
	["AuraMod"] = true,
	["Flash"] = true,
}

C["Bags"] = {
	["InventoryMod"] = true,
}

C["Chat"] = {
	["ChatMod"] = true,
	["TabNoFade"] = true,
	["TabTextColor"] = { 1, 1, 1 },
	["TabTextSelectedColor"] = {unpack(CustomClassColor)},
	["EditBoxChatColor"] = false,
}

C["Cooldowns"] = {
	["CooldownMod"] = true,
	["NormalColor"] = { 1, 1, 1 },
	["ExpireColor"] = { 1, 0, 0 },
	["SecondsColor"] = { 1, 0.42, 0 },
	["SecondsColor2"] = { 1, 0.82, 0 },
	["FontSize"] = 16,
}

C["DataBars"] = {
	["AltPowerBar"] = true,
	["ArtifactBar"] = true,
	["ExperienceBar"] = true,
	["HonorBar"] = true,
	["ReputationBar"] = true,
	["PowerBar"] = true,
	["ThreatBar"] = true,
}

C["DataTexts"] = {
	["Date"] = false,
	["Durability"] = true,
	["Coords"] = true, 
	["System"] = true,
	["Time"] = true,
	["Talent"] = true,
	["Zone"] = false,
	["FontSize"] = 12,
	["TextColor"] = {unpack(CustomClassColor)},
	["DatePoint"] = {"BOTTOMRIGHT", UIParent, -16, -16.5},
	["DurabilityPoint"] = {"BOTTOMLEFT", UIParent, 32*9, -16.5},
	["CoordsPoint"] = {"BOTTOMRIGHT", UIParent, -16, -16.5},
	["SystemPoint"] = {"BOTTOMLEFT", UIParent, 32*2, -16.5},
	["TimePoint"] = {"BOTTOM", Minimap, 0, -12},
	["TalentPoint"] = {"BOTTOMRIGHT", UIParent, -32*9, -16.5},
	["ZonePoint"] = {"TOP", UIParent, 0, 16}
}

C["ErrorsFrame"] = {
	["ErrorsMod"] = true,
	["FontSize"] = 16,
	["TextColor"] = { 1, 1, 1 },
}

C["Fonts"] = {
	["FontMod"] = true,
}

C["Misc"] = {
	["AutoAccpectInvites"] = true,
	["AutoRepairSell"] = true,
}

C["Nameplates"] = {
	["NameplateMod"] = true,
}																																																		

C["ObjectiveTracker"] = {
	["ObjectiveTrackerMod"] = true,
}

C["Theme"] = {
	["ThemeMod"] = true,
}

C["Tooltip"] = {
	["TooltipMod"] = true, 
	["TooltipOnMouseOver"] = false,
	--["HideTooltipInCombat"] = true,
}

C["UnitFrames"] = {
	-- Health
	["CustomHealtBarColor"] = true,
	["HealthBarColor"] = { 0.10, 0.10, 0.10 },
	["HealthBackdropColor"] = { 0.050, 0.050, 0.050, 0.90 },
	
	-- Power
	["PowerColoring"] = false,
	["PowerBackdropMultiplier"] = { 0.5 },
	
	-- Castbar
	["CastBarMod"] = true,
	["CastBarIconPlayer"] = false,
	["CastBarLatecy"] = true,
	["CastBarColor"] = { 0.10, 0.13, 0.15 },
	["InterruptColor"] = { 170/255, 10/255, 10/255, 0.8 },
	
	-- Buffs/Debuffs
	["OnlyShowPlayerDebuffs"] = false,
	["TargetDebuffFilter"] = true,
	
	-- Raid Frames
	["AuraWatch"] = false,
	["RaidDebuffs"] = true,
	["ShowRaidSolo"] = true,

	["CustomBarColorRaid"] = true,
	["HealthBarColorRaid"] = { 0.10, 0.10, 0.10 },

	-- General Stuff
	["Portraits"] = true,
	["CombatFeedback"] = false,
	["AdditionalPower"] = true,
	["HealthPrediction"] = true,
	["Smooth"] = true,
	
	-- Icons
	["ShowRoleIcon"] = false,
	["TankIcon"] = false,

	-- Totems
	["Totems"] = true,

	-- Positions of the UnitFrames
	["PlayerPoint"]         = { "BOTTOMLEFT", UIParent, 488, 188 },
	["TargetPoint"]         = { "BOTTOMRIGHT", UIParent, -488, 188 },
	["TargetTargetPoint"]   = { "RIGHT", UIParent, -319, -253 },
	["FocusPoint"]          = { "RIGHT", UIParent, -182, -218 },
	["PetPoint"]            = { "LEFT", UIParent, 467.5, -328 },
	["RaidPoint"]           = { "LEFT", UIParent, 221, 28 },
}