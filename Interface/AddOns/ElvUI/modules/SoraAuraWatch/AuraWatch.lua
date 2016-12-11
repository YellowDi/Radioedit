﻿local E, L, V, P, G, _ = unpack(select(2, ...)); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB
local Module = E:NewModule("AuraWatch", "AceTimer-3.0")
local MaxFrame, Index = 12, 1
local LSM = LibStub("LibSharedMedia-3.0")
Module.Aura = {}

local CreateFrame = CreateFrame
local RAID_CLASS_COLORS = RAID_CLASS_COLORS
local pairs = pairs
local CooldownFrame_SetTimer = CooldownFrame_Set
local UnitBuff = UnitBuff
local UnitDebuff = UnitDebuff
local GetSpellCooldown = GetSpellCooldown
local GetSpellInfo = GetSpellInfo
local GetItemInfo = GetItemInfo
local GetItemCooldown = GetItemCooldown
local twipe, tinsert= table.wipe, tinsert

function Module:LoadSettings()
local Default = {
		["DEMONHUNTER"] = {
			{
				Name = "玩家增益",
				Direction = "RIGHT",
				Mode = "ICON",
				Interval = 6,
				Alpha = 1,
				IconSize = 42,
				Pos = {"BOTTOMLEFT", "ElvUF_Player", "TOPLEFT", 0, 12}, 
				List = {
				-- Metamorphosis
				{AuraID = 187827, UnitID = "player", Caster = "player", filter = "BUFF"},
				-- Empower Wards
				{AuraID = 218256, UnitID = "player", Caster = "player", filter = "BUFF"},
				-- Darkness
				{AuraID = 196718, UnitID = "player", Caster = "player", filter = "BUFF"},
				-- Immolation Aura
				{AuraID = 178470, UnitID = "player", Caster = "player", filter = "BUFF"},
				-- Demon Spikes
				{AuraID = 203720, UnitID = "player", Caster = "player", filter = "BUFF"},
				-- Soul Barrier (Talent)
				{AuraID = 227225, UnitID = "player", Caster = "player", filter = "BUFF"},
				-- Netherwalk (Talent)
				{AuraID = 196555, UnitID = "player", Caster = "player", filter = "BUFF"},
				-- Nether Bond (Talent)
				{AuraID = 207810, UnitID = "player", Caster = "player", filter = "BUFF"},
				},
			},
			{
				Name = "玩家重要增益",
				Direction = "RIGHT",
				Mode = "ICON",
				Interval = 6,
				Alpha = 1,
				IconSize = 42,
				Pos = {"BOTTOMLEFT", "ElvUF_Player", "TOPLEFT", 0, 55},
				List = {
				-- Buffs
				-- Soul Fragments
				{AuraID = 203981, UnitID = "player", Caster = "player", filter = "BUFF"},
				-- Painbringer (Vengeance Artifact)
				{AuraID = 212988, UnitID = "player", Caster = "player", filter = "BUFF"},
				-- Momentum (Talent)
				{AuraID = 208628, UnitID = "player", Caster = "player", filter = "BUFF"},

				-- Trinkets
				-- 1.0: Darkmoon Cards
				-- Nightmare Fire (Crit, Proc)
				{AuraID = 162919, UnitID = "player", Caster = "player", filter = "BUFF"},
				-- Visions of the Future (Spirit, Proc)
				{AuraID = 162913, UnitID = "player", Caster = "player", filter = "BUFF"},
				-- Spirit of the Warlords (Crit, Proc)
				{AuraID = 162915, UnitID = "player", Caster = "player", filter = "BUFF"},
				-- Strength of Steel (Crit, Proc)
				{AuraID = 162917, UnitID = "player", Caster = "player", filter = "BUFF"},
				-- 1.1: Alchemy Stones
				-- Agility
				{AuraID = 60233, UnitID = "player", Caster = "player", filter = "BUFF"},
				-- 1.2: Hallow's End
				-- Brawler's Statue (Bonus Armor, Use)
				{AuraID = 127967, UnitID = "player", Caster = "player", filter = "BUFF"},
				-- Coren's Cold Chromium (Attack Power, Proc)
				{AuraID = 127926, UnitID = "player", Caster = "player", filter = "BUFF"},
				-- Mithril Wristwatch (Spell Power, Proc)
				{AuraID = 127924, UnitID = "player", Caster = "player", filter = "BUFF"},
				-- Thousand-Year Pickled Egg (Haste, Proc)
				{AuraID = 127914, UnitID = "player", Caster = "player", filter = "BUFF"},
				-- 3.0: Heirlooms
				-- Infallible Tracking Charm [Damage, Proc]
				{AuraID = 201408, UnitID = "player", Caster = "player", filter = "BUFF"},
				-- Orb Of Voidsight (Haste, Proc)
				{AuraID = 201410, UnitID = "player", Caster = "player", filter = "BUFF"},
				-- 2.0: PvP Trinkets
				-- Battlemaster (Health, Use)
				{AuraID = 181706, UnitID = "player", Caster = "player", filter = "BUFF"},
				-- Damage [Agility] (Versatility, Proc)
				{AuraID = 182060, UnitID = "player", Caster = "player", filter = "BUFF"},
				-- Tanking
				-- Battering Talisman (Haste, Proc)
				{AuraID = 177102, UnitID = "player", Caster = "player", filter = "BUFF"},
				-- Blast Furnace Door (Mastery, Proc)
				{AuraID = 177056, UnitID = "player", Caster = "player", filter = "BUFF"},
				-- Evergaze Arcane Eidolon (Bonus Armor, Proc)
				{AuraID = 177053, UnitID = "player", Caster = "player", filter = "BUFF"},
				-- Formidable Relic of Blood (Haste, Proc)
				{AuraID = 176937, UnitID = "player", Caster = "player", filter = "BUFF"},
				-- Kyb's Foolish Perseverance (Health, Use)
				{AuraID = 176460, UnitID = "player", Caster = "player", filter = "BUFF"},
				-- Pol's Blinded Eye (Mastery, Use)
				{AuraID = 176876, UnitID = "player", Caster = "player", filter = "BUFF"},
				-- Stoneheart Idol (Crit, Proc)
				{AuraID = 176982, UnitID = "player", Caster = "player", filter = "BUFF"},
				-- Tablet of Turnbuckle Teamwork (Bonus Armor, Use)
				{AuraID = 176873, UnitID = "player", Caster = "player", filter = "BUFF"},
				-- Anzu's Cursed Plume (Mastery, Proc)
				{AuraID = 183931, UnitID = "player", Caster = "player", filter = "BUFF"},
				-- Enforcer's Stun Grenade (Versatility, Use)
				{AuraID = 165534, UnitID = "player", Caster = "player", filter = "BUFF"},
				-- Tyrant's Decree (Stamina, Proc)
				{AuraID = 184770, UnitID = "player", Caster = "player", filter = "BUFF"},
				-- Xeri'tac's Unhatched Egg Sac (Mastery, Proc)
				{AuraID = 165824, UnitID = "player", Caster = "player", filter = "BUFF"},
				-- Damage [Agility]
				-- Beating Heart of the Mountain (Multistrike, Use)
				{AuraID = 176878, UnitID = "player", Caster = "player", filter = "BUFF"},
				-- Blackheart Enforcer's Medallion (Multistrike, Proc)
				{AuraID = 176984, UnitID = "player", Caster = "player", filter = "BUFF"},
				-- Formidable Jar of Doom (Mastery, Proc)
				{AuraID = 176939, UnitID = "player", Caster = "player", filter = "BUFF"},
				-- Humming Blackiron Trigger (Crit, Proc)
				{AuraID = 177067, UnitID = "player", Caster = "player", filter = "BUFF"},
				-- Lucky Double-Sided Coin (Agility, Use)
				{AuraID = 177597, UnitID = "player", Caster = "player", filter = "BUFF"},
				-- Meaty Dragonspine Trophy (Haste, Proc)
				{AuraID = 177035, UnitID = "player", Caster = "player", filter = "BUFF"},
				-- Scales of Doom (Multistrike, Proc)
				{AuraID = 177038, UnitID = "player", Caster = "player", filter = "BUFF"},
				-- Gor'ashan's Lodestone Spike (Multistrike, Use)
				{AuraID = 165542, UnitID = "player", Caster = "player", filter = "BUFF"},
				-- Kihra's Adrenaline Injector (Mastery, Use)
				{AuraID = 165485, UnitID = "player", Caster = "player", filter = "BUFF"},
				-- Malicious Censer (Agility, Proc)
				{AuraID = 183926, UnitID = "player", Caster = "player", filter = "BUFF"},
				-- Mirror of the Blademaster (Images, Proc)
				{AuraID = 184270, UnitID = "player", Caster = "player", filter = "BUFF"},
				-- Soul Capacitator (Damage, Proc)
				{AuraID = 184293, UnitID = "player", Caster = "player", filter = "BUFF"},
				-- Witherbark's Branch (Haste, Proc)
				{AuraID = 165822, UnitID = "player", Caster = "player", filter = "BUFF"},

				-- Enchants
				-- Mark of Blackrock (Bonus Armor)
				{AuraID = 159679, UnitID = "player", Caster = "all", filter = "BUFF"},
				-- Mark of Bleeding Hollow (Mastery)
				{AuraID = 173322, UnitID = "player", Caster = "all", filter = "BUFF"},
				-- Mark of Shadowmoon (Spirit)
				{AuraID = 159678, UnitID = "player", Caster = "all", filter = "BUFF"},
				-- Mark of the Frostwolf (Multistrike)
				{AuraID = 159676, UnitID = "player", Caster = "all", filter = "BUFF"},
				-- Mark of the Thunderlord (Crit)
				{AuraID = 159234, UnitID = "player", Caster = "all", filter = "BUFF"},
				-- Mark of Warsong (Haste)
				{AuraID = 159675, UnitID = "player", Caster = "all", filter = "BUFF"},
				},
			},
			{
				Name = "目标减益",
				Direction = "RIGHT",
				Mode = "ICON",
				Interval = 4,
				Alpha = 1,
				IconSize = 48,
				Pos = {"BOTTOMLEFT", "ElvUF_Target", "TOPLEFT", 0, 68}, 
				List = {

				-- Sigil of Flame
				{AuraID = 204598, UnitID = "target", Caster = "player", filter = "DEBUFF"},
				-- Sigil of Silence
				{AuraID = 204490, UnitID = "target", Caster = "player", filter = "DEBUFF"},
				-- Sigil of Misery
				{AuraID = 207685, UnitID = "target", Caster = "player", filter = "DEBUFF"},
				-- Sigil of Grasp
				{AuraID = 204843, UnitID = "target", Caster = "player", filter = "DEBUFF"},
				-- Fiery Brand
				{AuraID = 207744, UnitID = "target", Caster = "player", filter = "DEBUFF"},
				-- Frailty (Spirit Bomb Talent)
				{AuraID = 224509, UnitID = "target", Caster = "player", filter = "DEBUFF"},
				-- Nemesis (Talent)
				{AuraID = 206491, UnitID = "target", Caster = "player", filter = "DEBUFF"},
				},
			},
		},
		-- 德鲁伊
		["DRUID"] = {
			{
				Name = "玩家减益", 
				Direction = "RIGHT", Interval = 10, 
				Mode = "ICON", IconSize = 48, 
				Pos = {"CENTER", "UIParent", "CENTER", -200, 200}, 
				List = {
					-- 变形术
					{AuraID =   118, UnitID = "player"},
				},
			},
			{
				Name = "玩家重要增益",
				Direction = "RIGHT", Interval = 6, 
				Mode = "ICON", IconSize = 42, 
				Pos = {"BOTTOMLEFT", "ElvUF_Player", "TOPLEFT", 0, 55},
				List = {
					-- Shooting Stars
					{AuraID = 93400, UnitID = "player"},
					-- Lunar Shower
					{AuraID = 81192, UnitID = "player"},
					-- Nature's Grace
					{AuraID = 16886, UnitID = "player"},
					-- Glyph of Rejuvenation
					{AuraID = 96206, UnitID = "player"},
					-- Clearcasting
					{AuraID = 16870, UnitID = "player"},
					-- Predator's Swiftness
					{AuraID = 69369, UnitID = "player"},

					-- Trinkets
					-- General
					-- PvP Trinkets (Health, Use)
					{AuraID = 126697, UnitID = "player"},
					-- Tank
					-- Stuff of Nightmares (Dodge, Proc)
					{AuraID = 126646, UnitID = "player"},
					-- Vial of Dragon's Blood (Dodge, Proc)
					{AuraID = 126533, UnitID = "player"},
					-- Jade Warlord Figurine (Mastery, Use)
					{AuraID = 126597, UnitID = "player"},
					-- Physical Agility DPS
					-- Terror in the Mists (Crit, Proc)
					{AuraID = 126649, UnitID = "player"},
					-- Jade Bandit Figurine (Haste, Use)
					{AuraID = 126599, UnitID = "player"},
					-- Bottle of Infinite Stars (Agility, Proc)
					{AuraID = 126554, UnitID = "player"},
					-- PvP Trinkets (Agility, Use)
					{AuraID = 126690, UnitID = "player"},
					-- PvP Trinkets (Agility, Proc)
					{AuraID = 126707, UnitID = "player"},
					-- Caster General
					-- Jade Magistrate Figurine (Crit, Use)
					{AuraID = 126605, UnitID = "player"},
					-- PvP Trinkets (Spell Power, Use)
					{AuraID = 126683, UnitID = "player"},
					-- PvP Trinkets (Spell Power, Proc)
					{AuraID = 126705, UnitID = "player"},
					-- Caster DPS
					-- Essence of Terror (Haste, Proc)
					{AuraID = 126659, UnitID = "player"},
					-- Light of the Cosmos (Intellect, Proc)
					{AuraID = 126577, UnitID = "player"},
					-- Caster Heal
					-- Qin-xi's Polarizing Seal (Intellect, Proc)
					{AuraID = 126588, UnitID = "player"},

					-- Enchants
					-- General
					-- Tank
					-- River's Song (Dodge)
					{AuraID = 116660, UnitID = "player"},
					-- Physical General
					-- Swordguard Embroidery (AP)
					{AuraID = 125489, UnitID = "player"},
					-- Physical Melee
					-- Dancing Steel (Agility)
					{AuraID = 118334, UnitID = "player"},
					-- Caster General
					-- Jade Spirit (Intellect + Spirit)
					{AuraID = 104993, UnitID = "player"},
					-- Lightweave (Intellect)
					{AuraID = 125487, UnitID = "player"},
					-- Caster Heal
				},
			},
			{
				Name = "玩家增益", 
				Direction = "RIGHT", Interval = 6, 
				Mode = "ICON", IconSize = 42, 
				Pos = {"BOTTOMLEFT", "ElvUF_Player", "TOPLEFT", 0, 12}, 
				List = {
					-- Lifebloom
					{AuraID = 33763, UnitID = "player"},
					-- Rejuvenation
					{AuraID = 774, UnitID = "player"},
					-- Regrowth
					{AuraID = 8936, UnitID = "player"},
					-- Incarnation: Tree of Life
					{AuraID = 117679, UnitID = "player"},
					-- Incarnation: Chosen of Elunee
					{AuraID = 102560, UnitID = "player"},
					-- Incarnation: King of the Jungle
					{AuraID = 102543, UnitID = "player"},
					-- Incarnation: Son of Ursoc
					{AuraID = 102558, UnitID = "player"},
					-- Survival Instincts
					{AuraID = 61336, UnitID = "player"},
					-- Might of Ursoc
					{AuraID = 106922, UnitID = "player"},
					-- Barkskin
					{AuraID = 22812, UnitID = "player"},
					-- Ironbark
					{AuraID = 102342, UnitID = "player"},
					-- Savage Defense
					{AuraID = 62606, UnitID = "player"},
					-- Glyph of Frenzied Regeneration
					{AuraID = 124769, UnitID = "player"},
					-- Savage Roar
					{AuraID = 52610, UnitID = "player"},
					-- Berserk
					{AuraID = 50334, UnitID = "player"},
					-- Tiger's Fury
					{AuraID = 5217, UnitID = "player"},
					-- Celestial Alignment
					{AuraID = 112071, UnitID = "player"},
					-- Starfall
					{AuraID = 48505, UnitID = "player"},
					-- Nature's Grasp
					{AuraID = 16689, UnitID = "player"},
					-- Owlkin Frenzy
					{AuraID = 48391, UnitID = "player"},
					-- Dash
					{AuraID = 1850, UnitID = "player"},
					-- Enrage
					{AuraID = 5229, UnitID = "player"},
				}, 
			}, 
			{
				Name = "目标减益", 
				Direction = "RIGHT", Interval = 4, 
				Mode = "ICON", IconSize = 48,  
				Pos = {"BOTTOMLEFT", "ElvUF_Target", "TOPLEFT", 0, 68}, 
				List = {	
					-- Moonfire
					{AuraID = 8921, UnitID = "target", Caster = "player"},
					-- Sunfire
					{AuraID = 93402, UnitID = "target", Caster = "player"},
					-- Rake
					{AuraID = 1822, UnitID = "target", Caster = "player"},
					-- Rip
					{AuraID = 1079, UnitID = "target", Caster = "player"},
					-- Pounce Bleed
					{AuraID = 9007, UnitID = "target", Caster = "player"},
					-- Lacerate
					{AuraID = 33745, UnitID = "target", Caster = "player"},
					-- Thrash
					{AuraID = 77758, UnitID = "target", Caster = "player"},
					-- Skull Bash
					{AuraID = 82365, UnitID = "target", Caster = "player"},
					-- Immobilized
					{AuraID = 45334, UnitID = "target", Caster = "player"},
					-- Infected Wounds
					{AuraID = 58180, UnitID = "target", Caster = "player"},
				}, 
			}, 
		}, 
		-- 猎人
		["HUNTER"] = {
			{
				Name = "玩家减益", 
				Direction = "RIGHT", Interval = 10, 
				Mode = "ICON", IconSize = 48, 
				Pos = {"CENTER", "UIParent", "CENTER", -200, 200}, 
				List = {
					-- 变形术
					{AuraID =   118, UnitID = "player"},
				},
			},
			{
				Name = "玩家重要增益",
				Direction = "RIGHT", Interval = 6, 
				Mode = "ICON", IconSize = 42, 
				Pos = {"BOTTOMLEFT", "ElvUF_Player", "TOPLEFT", 0, 55},
				List = {
					-- Buffs
					-- Ready, Set, Aim...
					{AuraID = 82925, UnitID = "player"},
					-- Fire!
					{AuraID = 82926, UnitID = "player"},
					-- Steady Focus
					{AuraID = 53220, UnitID = "player"},
					-- Lock and Load
					{AuraID = 56453, UnitID = "player"},
					-- Thrill of the Hunt
					{AuraID = 34720, UnitID = "player"},
					-- Frenzy
					{AuraID = 19623, UnitID = "player"},
					-- Mend Pet
					{AuraID = 136, UnitID = "pet"},

					-- Trinkets
					-- General
					-- PvP Trinkets (Health, Use)
					{AuraID = 126697, UnitID = "player"},
					-- Physical Agility DPS
					-- Terror in the Mists (Crit, Proc)
					{AuraID = 126649, UnitID = "player"},
					-- Jade Bandit Figurine (Haste, Use)
					{AuraID = 126599, UnitID = "player"},
					-- Bottle of Infinite Stars (Agility, Proc)
					{AuraID = 126554, UnitID = "player"},
					-- PvP Trinkets (Agility, Use)
					{AuraID = 126690, UnitID = "player"},
					-- PvP Trinkets (Agility, Proc)
					{AuraID = 126707, UnitID = "player"},

					-- Enchants
					-- General
					-- Physical General
					-- Swordguard Embroidery (AP)
					{AuraID = 125489, UnitID = "player"},
					-- Physical Ranged
					-- Mirror Scope (Crit)
					{AuraID = 109092, UnitID = "player"},
					-- Lord Blastington's Scope of Doom (Agility)
					{AuraID = 109085, UnitID = "player"},
				},
			},
			{
				Name = "玩家增益", 
				Direction = "RIGHT", Interval = 6, 
				Mode = "ICON", IconSize = 42, 
				Pos = {"BOTTOMLEFT", "ElvUF_Player", "TOPLEFT", 0, 12}, 
				List = {
					-- Deterrence
					{AuraID = 19263, UnitID = "player"},
					-- Rapid Fire
					{AuraID = 3045, UnitID = "player"},
					-- The Beast Within
					{AuraID = 34471, UnitID = "player"},
					-- Focus Fire
					{AuraID = 82692, UnitID = "player"},
					-- Spirit Mend
					{AuraID = 90361, UnitID = "player"},
				}, 
			}, 
			{
				Name = "目标减益", 
				Direction = "RIGHT", Interval = 4, 
				Mode = "ICON", IconSize = 48, 
				Pos = {"BOTTOMLEFT", "ElvUF_Target", "TOPLEFT", 0, 68}, 
				List = {
					-- Hunter's Mark
					{AuraID = 1130, UnitID = "target", Caster = "all"},
					-- Serpent Sting
					{AuraID = 1978, UnitID = "target", Caster = "player"},
					-- Black Arrow
					{AuraID = 3674, UnitID = "target", Caster = "player"},
					-- Explosive Shot
					{AuraID = 53301, UnitID = "target", Caster = "player"},					
				}, 
			}, 
		}, 
		-- 法师
		["MAGE"] = {
			{
				Name = "玩家减益", 
				Direction = "RIGHT", Interval = 10, 
				Mode = "ICON", IconSize = 48, 
				Pos = {"CENTER", "UIParent", "CENTER", -200, 200}, 
				List = {
					-- 变形术
					{AuraID =   118, UnitID = "player"},
				},
			},
			{
				Name = "玩家重要增益",
				Direction = "RIGHT", Interval = 6, 
				Mode = "ICON", IconSize = 42, 
				Pos = {"BOTTOMLEFT", "ElvUF_Player", "TOPLEFT", 0, 55},
				List = {
					-- Buffs
					-- Fingers of Frost
					{AuraID = 44544, UnitID = "player"},
					-- Brain Freeze
					{AuraID = 57761, UnitID = "player"},
					-- Arcane Missiles!
					{AuraID = 79683, UnitID = "player"},
					-- Heating Up
					{AuraID = 48107, UnitID = "player"},
					-- Pyroblast!
					{AuraID = 48108, UnitID = "player"},

					-- Trinkets
					-- General
					-- PvP Trinkets (Health, Use)
					{AuraID = 126697, UnitID = "player"},
					-- Caster General
					-- Jade Magistrate Figurine (Crit, Use)
					{AuraID = 126605, UnitID = "player"},
					-- PvP Trinkets (Spell Power, Use)
					{AuraID = 126683, UnitID = "player"},
					-- PvP Trinkets (Spell Power, Proc)
					{AuraID = 126705, UnitID = "player"},
					-- Caster DPS
					-- Essence of Terror (Haste, Proc)
					{AuraID = 126659, UnitID = "player"},
					-- Light of the Cosmos (Intellect, Proc)
					{AuraID = 126577, UnitID = "player"},

					-- Enchants
					-- General
					-- Caster General
					-- Jade Spirit (Intellect + Spirit)
					{AuraID = 104993, UnitID = "player"},
					-- Lightweave (Intellect)
					{AuraID = 125487, UnitID = "player"},
				},
			},
			{
				Name = "玩家增益", 
				Direction = "RIGHT", Interval = 6, 
				Mode = "ICON", IconSize = 42, 
				Pos = {"BOTTOMLEFT", "ElvUF_Player", "TOPLEFT", 0, 12}, 
				List = {
					-- Evanesce
					{AuraID = 157913, UnitID = "target"},
					-- Ice Block
					{AuraID = 45438, UnitID = "target"},
					-- Ice Ward
					{AuraID = 111264, UnitID = "target"},
					-- Invisibility
					{AuraID = 32612, UnitID = "player"},
					-- Greater Invisibility
					{AuraID = 110960, UnitID = "player"},
					-- Icy Veins
					{AuraID = 12472, UnitID = "player"},
					-- Incanter's Ward
					{AuraID = 1463, UnitID = "player"},
					-- Temporal Shield
					{AuraID = 115610, UnitID = "player"},
					-- Ice Barrier
					{AuraID = 11426, UnitID = "player"},
					-- Ice Floes
					{AuraID = 108839, UnitID = "player"},
					-- Arcane Power
					{AuraID = 12042, UnitID = "player"},
				}, 
			}, 
			{
				Name = "目标减益", 
				Direction = "RIGHT", Interval = 4, 
				Mode = "ICON", IconSize = 48,  
				Pos = {"BOTTOMLEFT", "ElvUF_Target", "TOPLEFT", 0, 68}, 
				List = {		
					-- Arcane Blast
					{AuraID = 36032, UnitID = "player", Caster = "player"},
					-- Slow
					{AuraID = 31589, UnitID = "target", Caster = "player"},
					-- Ignite
					{AuraID = 12654, UnitID = "target", Caster = "player"},
					-- Living Bomb
					{AuraID = 44457, UnitID = "target", Caster = "player"},
					-- Nether Tempest
					{AuraID = 114923, UnitID = "target", Caster = "player"},
					-- Pyroblast
					{AuraID = 11366, UnitID = "target", Caster = "player"},
					-- Combustion
					{AuraID = 83853, UnitID = "target", Caster = "player"},
					-- Freeze (Pet)
					{AuraID = 33395, UnitID = "target", Caster = "player"},
					-- Frost Nova
					{AuraID = 122, UnitID = "target", Caster = "player"},
					-- Ice Ward
					{AuraID = 111340, UnitID = "target", Caster = "player"},
					-- Cone of Cold
					{AuraID = 120, UnitID = "target", Caster = "player"},
					-- Frostfire Bolt
					{AuraID = 44614, UnitID = "target", Caster = "player"},
				}, 
			}, 
		}, 
		-- 术士
		["WARLOCK"] = {
			{
				Name = "玩家减益", 
				Direction = "RIGHT", Interval = 10, 
				Mode = "ICON", IconSize = 48, 
				Pos = {"CENTER", "UIParent", "CENTER", -200, 200}, 
				List = {
					-- 变形术
					{AuraID =   118, UnitID = "player"},
				},
			},
			{
				Name = "玩家重要增益",
				Direction = "RIGHT", Interval = 6, 
				Mode = "ICON", IconSize = 42, 
				Pos = {"BOTTOMLEFT", "ElvUF_Player", "TOPLEFT", 0, 55},
				List = {
					-- Buffs
					-- Molten Core
					{AuraID = 122355, UnitID = "player"},
					-- Backdraft
					{AuraID = 117828, UnitID = "player"},
					-- Backlash
					{AuraID = 34936, UnitID = "player"},
					-- Demonic Rebirth
					{AuraID = 108559, UnitID = "player"},
					-- Shadow Trance
					{AuraID = 17941, UnitID = "player"},

					-- Trinkets
					-- General
					-- PvP Trinkets (Health, Use)
					{AuraID = 126697, UnitID = "player"},
					-- Caster General
					-- Jade Magistrate Figurine (Crit, Use)
					{AuraID = 126605, UnitID = "player"},
					-- PvP Trinkets (Spell Power, Use)
					{AuraID = 126683, UnitID = "player"},
					-- PvP Trinkets (Spell Power, Proc)
					{AuraID = 126705, UnitID = "player"},
					-- Caster DPS
					-- Essence of Terror (Haste, Proc)
					{AuraID = 126659, UnitID = "player"},
					-- Light of the Cosmos (Intellect, Proc)
					{AuraID = 126577, UnitID = "player"},

					-- Enchants
					-- General
					-- Caster General
					-- Jade Spirit (Intellect + Spirit)
					{AuraID = 104993, UnitID = "player"},
					-- Lightweave (Intellect)
					{AuraID = 125487, UnitID = "player"},
				},
			},
			{
				Name = "玩家增益", 
				Direction = "RIGHT", Interval = 6, 
				Mode = "ICON", IconSize = 42, 
				Pos = {"BOTTOMLEFT", "ElvUF_Player", "TOPLEFT", 0, 12}, 
				List = {
					-- Burning Soul
					{AuraID = 74434, UnitID = "player"},
					-- Dark Soul: Knowledge
					{AuraID = 113861, UnitID = "player"},
					-- Dark Soul: Misery
					{AuraID = 113860, UnitID = "player"},
					-- Dark Soul: Instability
					{AuraID = 113858, UnitID = "player"},
					-- Unending Resolve
					{AuraID = 104773, UnitID = "player"},
					-- Blood Horror
					{AuraID = 111397, UnitID = "target"},
					-- Dark Bargain
					{AuraID = 110913, UnitID = "player"},
					-- Twilight Ward
					{AuraID = 6229, UnitID = "player"},
					-- Soul Swap
					{AuraID = 86211, UnitID = "player"},
					-- Kiljaeden's Cunning
					{AuraID = 137587, UnitID = "player"},					
					-- Burning Rush
					{AuraID = 111400, UnitID = "player"},
					-- Blood Horror
					{AuraID = 111397, UnitID = "player"},
				}, 
			}, 	
			{
				Name = "目标减益", 
				Direction = "RIGHT", Interval = 4, 
				Mode = "ICON", IconSize = 48,  
				Pos = {"BOTTOMLEFT", "ElvUF_Target", "TOPLEFT", 0, 68}, 
				List = {
					-- Self
					-- Curse of the Elements
					{AuraID = 1490, UnitID = "target", Caster = "all"},
					-- Curse of Exhaustion
					{AuraID = 18223, UnitID = "target", Caster = "all"},
					-- Curse of Enfeeblement
					{AuraID = 109466, UnitID = "target", Caster = "all"},
					-- Enslave Demon
					{AuraID = 1098, UnitID = "target", Caster = "player"},
					-- Shadowsnare
					{AuraID = 63311, UnitID = "target", Caster = "player"},

					-- CoE group
					-- Master poisoner (Rogue)
					{AuraID = 93068, UnitID = "target", Caster = "all"},
					-- Lightning Breath (Wind Serpent)
					{AuraID = 24844, UnitID = "target", Caster = "all"},
					-- Fire Breath (Dragonhawk)
					{AuraID = 34889, UnitID = "target", Caster = "all"},
					-- Doom
					{AuraID = 603, UnitID = "target", Caster = "player"},
					-- Agony
					{AuraID = 980, UnitID = "target", Caster = "player"},
					-- Corruption
					{AuraID = 172, UnitID = "target", Caster = "player"},
					-- Seed of Corruption
					{AuraID = 27243, UnitID = "target", Caster = "player"},
					-- Immolate
					{AuraID = 348, UnitID = "target", Caster = "player"},
					-- Unstable Affliction
					{AuraID = 30108, UnitID = "target", Caster = "player"},
					-- Haunt
					{AuraID = 48181, UnitID = "target", Caster = "player"},					
				}, 
			}, 
		}, 
		-- 萨满
		["SHAMAN"] = {
			{
				Name = "玩家减益", 
				Direction = "RIGHT", Interval = 10, 
				Mode = "ICON", IconSize = 48, 
				Pos = {"CENTER", "UIParent", "CENTER", -200, 200}, 
				List = {
					-- 变形术
					{AuraID =   118, UnitID = "player"},
				},
			},
			{
				Name = "玩家重要增益",
				Direction = "RIGHT", Interval = 6, 
				Mode = "ICON", IconSize = 42, 
				Pos = {"BOTTOMLEFT", "ElvUF_Player", "TOPLEFT", 0, 55},
				List = {
					-- Buffs
					-- Clearcasting
					{AuraID = 16246, UnitID = "player"},
					-- Lava Surge
					{AuraID = 77762, UnitID = "player"},
					-- Elemental Blast
					{AuraID = 118522, UnitID = "player"},
					-- Tidal Waves
					{AuraID = 53390, UnitID = "player"},

					-- Trinkets
					-- General
					-- General
					-- PvP Trinkets (Health, Use)
					{AuraID = 126697, UnitID = "player"},
					-- Physical Agility DPS
					-- Terror in the Mists (Crit, Proc)
					{AuraID = 126649, UnitID = "player"},
					-- Jade Bandit Figurine (Haste, Use)
					{AuraID = 126599, UnitID = "player"},
					-- Bottle of Infinite Stars (Agility, Proc)
					{AuraID = 126554, UnitID = "player"},
					-- PvP Trinkets (Agility, Use)
					{AuraID = 126690, UnitID = "player"},
					-- PvP Trinkets (Agility, Proc)
					{AuraID = 126707, UnitID = "player"},
					-- Caster General
					-- Jade Magistrate Figurine (Crit, Use)
					{AuraID = 126605, UnitID = "player"},
					-- PvP Trinkets (Spell Power, Use)
					{AuraID = 126683, UnitID = "player"},
					-- PvP Trinkets (Spell Power, Proc)
					{AuraID = 126705, UnitID = "player"},
					-- Caster DPS
					-- Essence of Terror (Haste, Proc)
					{AuraID = 126659, UnitID = "player"},
					-- Light of the Cosmos (Intellect, Proc)
					{AuraID = 126577, UnitID = "player"},
					-- Caster Heal
					-- Qin-xi's Polarizing Seal (Intellect, Proc)
					{AuraID = 126588, UnitID = "player"},

					-- Enchants
					-- General
					-- Physical General
					-- Swordguard Embroidery (AP)
					{AuraID = 125489, UnitID = "player"},
					-- Physical Melee
					-- Dancing Steel (Agility)
					{AuraID = 118334, UnitID = "player"},
					-- Caster General
					-- Jade Spirit (Intellect + Spirit)
					{AuraID = 104993, UnitID = "player"},
					-- Lightweave (Intellect)
					{AuraID = 125487, UnitID = "player"},
				},
			},
			{
				Name = "玩家增益", 
				Direction = "RIGHT", Interval = 6, 
				Mode = "ICON", IconSize = 42, 
				Pos = {"BOTTOMLEFT", "ElvUF_Player", "TOPLEFT", 0, 12}, 
				List = {
					-- Maelstorm Weapon
					{AuraID = 53817, UnitID = "player"},
					-- Shamanistic rage
					{AuraID = 30823, UnitID = "player"},
					-- Lightning Shield
					{AuraID = 324, UnitID = "player"},
					-- Elemental mastery
					{AuraID = 16166, UnitID = "player"},
					-- Ascendance
					{AuraID = 114050, UnitID = "player"},
					-- Spiritwalker's grace
					{AuraID = 79206, UnitID = "player"},
					-- Unleash Flame
					{AuraID = 73683, UnitID = "player"},
					-- Unleash Life
					{AuraID = 73685, UnitID = "player"},
					-- Nature Guardian
					{AuraID = 31616, UnitID = "player"},
					-- Stone Bulwark
					{AuraID = 114893, UnitID = "player"},
					-- Ancestral Guidance
					{AuraID = 108281, UnitID = "player"},
					-- Astral Shift
					{AuraID = 108271, UnitID = "player"},
				}, 
			}, 
			{
				Name = "目标减益", 
				Direction = "RIGHT", Interval = 4, 
				Mode = "ICON", IconSize = 48,  
				Pos = {"BOTTOMLEFT", "ElvUF_Target", "TOPLEFT", 0, 68}, 
				List = {
					-- Storm Strike
					{AuraID = 17364, UnitID = "target", Caster = "player"},
					-- Frost Shock
					{AuraID = 8056, UnitID = "target", Caster = "player"},
					-- Flame Shock
					{AuraID = 8050, UnitID = "target", Caster = "player"},
					-- Searing Flames
					{AuraID = 77661, UnitID = "target", Caster = "player"},
					-- Earthgrab
					{AuraID = 64695, UnitID = "target", Caster = "player"},
					-- Bind Elemental
					{AuraID = 76780, UnitID = "target", Caster = "player"},
				}, 
			}, 
		}, 
		-- 圣骑士
		["PALADIN"] = {
			{
				Name = "玩家减益", 
				Direction = "RIGHT", Interval = 10, 
				Mode = "ICON", IconSize = 48, 
				Pos = {"CENTER", "UIParent", "CENTER", -200, 200}, 
				List = {
					-- 变形术
					{AuraID =   118, UnitID = "player"},
				},
			},
			{
				Name = "玩家重要增益",
				Direction = "RIGHT", Interval = 6, 
				Mode = "ICON", IconSize = 42, 
				Pos = {"BOTTOMLEFT", "ElvUF_Player", "TOPLEFT", 0, 55},
				List = {
					-- Buffs
					-- Infusion of Light
					{AuraID = 54149, UnitID = "player"},
					-- Daybreak
					{AuraID = 88819, UnitID = "player"},
					-- Light of the Ancient Kings
					{AuraID = 86678, UnitID = "player"},
					-- Bastion of Glory
					{AuraID = 114637, UnitID = "player"},
					-- Selfless Healer
					{AuraID = 114250, UnitID = "player"},
					-- Grand Crusader
					{AuraID = 85416, UnitID = "player"},
					-- Divine Purpose
					{AuraID = 90174, UnitID = "player"},
					-- Long Arm of the Law
					{AuraID = 87173, UnitID = "player"},
					-- Ancient Power
					{AuraID = 86700, UnitID = "player"},

					-- Trinkets
					-- General
					-- PvP Trinkets (Health, Use)
					{AuraID = 126697, UnitID = "player"},
					-- Tank
					-- Stuff of Nightmares (Dodge, Proc)
					{AuraID = 126646, UnitID = "player"},
					-- Vial of Dragon's Blood (Dodge, Proc)
					{AuraID = 126533, UnitID = "player"},
					-- Jade Warlord Figurine (Mastery, Use)
					{AuraID = 126597, UnitID = "player"},
					-- Physical Strength DPS
					-- Darkmist Vortex (Haste, Proc)
					{AuraID = 126657, UnitID = "player"},
					-- Lei Shin's Final Orders (Strength, Proc)
					{AuraID = 126657, UnitID = "player"},
					-- Jade Charioteer Figurine (Strength, Use)
					{AuraID = 126599, UnitID = "player"},
					-- PvP Trinkets (Strength, Use)
					{AuraID = 126679, UnitID = "player"},
					-- PvP Trinkets (Strength, Proc)
					{AuraID = 126700, UnitID = "player"},
					-- Caster General
					-- Jade Magistrate Figurine (Crit, Use)
					{AuraID = 126605, UnitID = "player"},
					-- PvP Trinkets (Spell Power, Use)
					{AuraID = 126683, UnitID = "player"},
					-- PvP Trinkets (Spell Power, Proc)
					{AuraID = 126705, UnitID = "player"},
					-- Caster Heal
					-- Qin-xi's Polarizing Seal (Intellect, Proc)
					{AuraID = 126588, UnitID = "player"},

					-- Enchants
					-- General
					-- Tank
					-- River's Song (Dodge)
					{AuraID = 116660, UnitID = "player"},
					-- Physical General
					-- Swordguard Embroidery (AP)
					{AuraID = 125489, UnitID = "player"},
					-- Physical Melee
					-- Dancing Steel (Strength)
					{AuraID = 118335, UnitID = "player"},
					-- Caster General
					-- Jade Spirit (Intellect + Spirit)
					{AuraID = 104993, UnitID = "player"},
					-- Lightweave (Intellect)
					{AuraID = 125487, UnitID = "player"},
				},
			},
			{
				Name = "玩家增益", 
				Direction = "RIGHT", Interval = 6, 
				Mode = "ICON", IconSize = 42, 
				Pos = {"BOTTOMLEFT", "ElvUF_Player", "TOPLEFT", 0, 12}, 
				List = {
					-- Divine Shield
					{AuraID = 642, UnitID = "player"},
					-- Inquisition
					{AuraID = 84963, UnitID = "player"},
					-- Guardian of Ancient Kings
					{AuraID = 86698, UnitID = "player"},
					-- Holy Avenger
					{AuraID = 105809, UnitID = "player"},
					-- Avenging Wrath
					{AuraID = 31884, UnitID = "player"},
					-- Divine Favor
					{AuraID = 31842, UnitID = "player"},
					-- Argent Defender
					{AuraID = 31850, UnitID = "player"},
					-- Divine Protection
					{AuraID = 498, UnitID = "player"},
					-- Divine Plea
					{AuraID = 54428, UnitID = "player"},
					-- Speed of Light
					{AuraID = 85499, UnitID = "player"},
					-- Eternal Flame
					{AuraID = 114163, UnitID = "player"},
					-- Sacred Shield
					{AuraID = 20925, UnitID = "player"},
				}, 
			}, 
			{
				Name = "目标减益", 
				Direction = "RIGHT", Interval = 4, 
				Mode = "ICON", IconSize = 48,  
				Pos = {"BOTTOMLEFT", "ElvUF_Target", "TOPLEFT", 0, 68}, 
				List = {
					-- Forbearance
					{AuraID = 25771, UnitID = "player", Caster = "all"},
					-- Censure
					{AuraID = 31803, UnitID = "target", Caster = "player"},
					-- Seal of Justice
					{AuraID = 20170, UnitID = "target", Caster = "player"},
					-- Denounce
					{AuraID = 2812, UnitID = "target", Caster = "player"},
					-- Avenger's Shield with Glyph
					{AuraID = 63529, UnitID = "target", Caster = "player"},
					-- Burden of Guilt
					{AuraID = 110300, UnitID = "target", Caster = "player"},
				}, 
			}, 
		}, 
		-- 牧师
		["PRIEST"] = {
			{
				Name = "玩家减益", 
				Direction = "RIGHT", Interval = 10, 
				Mode = "ICON", IconSize = 48, 
				Pos = {"CENTER", "UIParent", "CENTER", -200, 200}, 
				List = {
					-- 变形术
					{AuraID =   118, UnitID = "player"},
				},
			},
			{
				Name = "玩家重要增益",
				Direction = "RIGHT", Interval = 6, 
				Mode = "ICON", IconSize = 42, 
				Pos = {"BOTTOMLEFT", "ElvUF_Player", "TOPLEFT", 0, 55},
				List = {
					-- Buffs
					-- Surge of Light
					{AuraID = 114255, UnitID = "player"},
					-- Surge of Darkness
					{AuraID = 87160, UnitID = "player"},
					-- Serendipity
					{AuraID = 63735, UnitID = "player"},
					-- Divine Insight
					{AuraID = 124430, UnitID = "player"},
					-- Twist of Fate
					{AuraID = 123254, UnitID = "player"},
					-- Glyph of Mind Spike
					{AuraID = 81292, UnitID = "player"},
					-- Evangelism
					{AuraID = 81661, UnitID = "player"},
					-- Chakra: Sanctuary
					{AuraID = 81206, UnitID = "player"},
					-- Chakra: Serenity
					{AuraID = 81208, UnitID = "player"},
					-- Chakra: Chastise
					{AuraID = 81209, UnitID = "player"},

					-- Trinkets
					-- General
					-- PvP Trinkets (Health, Use)
					{AuraID = 126697, UnitID = "player"},
					-- Caster General
					-- Jade Magistrate Figurine (Crit, Use)
					{AuraID = 126605, UnitID = "player"},
					-- PvP Trinkets (Spell Power, Use)
					{AuraID = 126683, UnitID = "player"},
					-- PvP Trinkets (Spell Power, Proc)
					{AuraID = 126705, UnitID = "player"},
					-- Caster DPS
					-- Essence of Terror (Haste, Proc)
					{AuraID = 126659, UnitID = "player"},
					-- Light of the Cosmos (Intellect, Proc)
					{AuraID = 126577, UnitID = "player"},
					-- Caster Heal
					-- Qin-xi's Polarizing Seal (Intellect, Proc)
					{AuraID = 126588, UnitID = "player"},

					-- Enchants
					-- General
					-- Caster General
					-- Jade Spirit (Intellect + Spirit)
					{AuraID = 104993, UnitID = "player"},
					-- Lightweave (Intellect)
					{AuraID = 125487, UnitID = "player"},
				},
			},
			{
				Name = "玩家增益", 
				Direction = "RIGHT", Interval = 6, 
				Mode = "ICON", IconSize = 42, 
				Pos = {"BOTTOMLEFT", "ElvUF_Player", "TOPLEFT", 0, 12}, 
				List = {
					-- Power Word: Shield
					{AuraID = 17, UnitID = "player", Caster = "all", filter = "BUFF"},
					-- Renew
					{AuraID = 139, UnitID = "player"},
					-- Dispersion
					{AuraID = 47585, UnitID = "player"},
					-- Power Infusion
					{AuraID = 10060, UnitID = "player"},
					-- Fear Ward
					{AuraID = 6346, UnitID = "player"},
					-- Borrowed Time
					{AuraID = 59889, UnitID = "player"},
					-- Inner Fire
					--OLD{AuraID = 588, UnitID = "player"},
					-- Inner Will
					--OLD{AuraID = 73413, UnitID = "player"},
					-- Archangel
					{AuraID = 81700, UnitID = "player"},
					-- Dark Archangel
					{AuraID = 87153, UnitID = "player"},
					-- Glyph of Inner Focus
					{AuraID = 96267, UnitID = "player"},
					-- Prayer of Mending
					{AuraID = 41635, UnitID = "player"},
					-- Fade
					{AuraID = 586, UnitID = "player"},
					-- Holy Walk
					{AuraID = 96219, UnitID = "player"},
				}, 
			}, 
			{
				Name = "目标减益", 
				Direction = "RIGHT", Interval = 4, 
				Mode = "ICON", IconSize = 48,  
				Pos = {"BOTTOMLEFT", "ElvUF_Target", "TOPLEFT", 0, 68}, 
				List = {
					-- Mind spike
					{AuraID = 87178, UnitID = "target", Caster = "player"},
					-- Renew
					{AuraID = 139, UnitID = "target"},
					-- Prayer of Mending
					{AuraID = 41635, UnitID = "target"},
					-- Guardian spirit
					{AuraID = 47788, UnitID = "target"},
					-- Pain Suppression
					{AuraID = 33206, UnitID = "target"},
					-- Grace
					{AuraID = 77613, UnitID = "target"},
					-- Shadow Word: Pain
					{AuraID = 589, UnitID = "target", Caster = "player"},
					-- Vampiric Touch
					{AuraID = 34914, UnitID = "target", Caster = "player"},
					-- Devouring Plague
					{AuraID = 2944, UnitID = "target", Caster = "player"},			
				}, 
			}, 			
		}, 
		-- 战士
		["WARRIOR"] = {
			{
				Name = "玩家减益", 
				Direction = "RIGHT", Interval = 10, 
				Mode = "ICON", IconSize = 48, 
				Pos = {"CENTER", "UIParent", "CENTER", -200, 200}, 
				List = {
					-- 变形术
					{AuraID =   118, UnitID = "player"},
				},
			},
			{
				Name = "玩家重要增益",
				Direction = "RIGHT", Interval = 6, 
				Mode = "ICON", IconSize = 42, 
				Pos = {"BOTTOMLEFT", "ElvUF_Player", "TOPLEFT", 0, 55},
				List = {
					-- Bloodsurge
					{AuraID = 46916, UnitID = "player"},
					-- Sword and Board
					{AuraID = 50227, UnitID = "player"},
					-- Ultimatum
					{AuraID = 122510, UnitID = "player"},
					-- Taste for Blood
					{AuraID = 125831, UnitID = "player"},
					-- Enrage
					{AuraID = 12880, UnitID = "player"},
					-- Meat Cleaver
					{AuraID = 85739, UnitID = "player"},
					-- Rude Interruption
					{AuraID = 86663, UnitID = "player"},

					-- Trinkets
					-- General
					-- PvP Trinkets (Health, Use)
					{AuraID = 126697, UnitID = "player"},
					-- Tank
					-- Stuff of Nightmares (Dodge, Proc)
					{AuraID = 126646, UnitID = "player"},
					-- Vial of Dragon's Blood (Dodge, Proc)
					{AuraID = 126533, UnitID = "player"},
					-- Jade Warlord Figurine (Mastery, Use)
					{AuraID = 126597, UnitID = "player"},
					-- Physical Strength DPS
					-- Darkmist Vortex (Haste, Proc)
					{AuraID = 126657, UnitID = "player"},
					-- Lei Shin's Final Orders (Strength, Proc)
					{AuraID = 126657, UnitID = "player"},
					-- Jade Charioteer Figurine (Strength, Use)
					{AuraID = 126599, UnitID = "player"},
					-- PvP Trinkets (Strength, Use)
					{AuraID = 126679, UnitID = "player"},
					-- PvP Trinkets (Strength, Proc)
					{AuraID = 126700, UnitID = "player"},

					-- Enchants
					-- General
					-- Tank
					-- River's Song (Dodge)
					{AuraID = 116660, UnitID = "player"},
					-- Physical General
					-- Swordguard Embroidery (AP)
					{AuraID = 125489, UnitID = "player"},
					-- Physical Melee
					-- Dancing Steel (Strength)
					{AuraID = 118335, UnitID = "player"},
				},
			},
			{
				Name = "玩家增益", 
				Direction = "RIGHT", Interval = 6, 
				Mode = "ICON", IconSize = 42, 
				Pos = {"BOTTOMLEFT", "ElvUF_Player", "TOPLEFT", 0, 12}, 
				List = {
					-- Shield Wall
					{AuraID = 871, UnitID = "player"},
					-- Last Stand
					{AuraID = 12975, UnitID = "player"},
					-- Enraged Regeneration
					{AuraID = 55694, UnitID = "player"},
					-- Shield Block
					{AuraID = 2565, UnitID = "player"},
					-- Shield Barrier
					{AuraID = 112048, UnitID = "player"},
					-- Spell Reflection
					{AuraID = 23920, UnitID = "player"},
					-- Berserker Rage
					{AuraID = 18499, UnitID = "player"},
					-- Bloodbath
					{AuraID = 12292, UnitID = "player"},
					-- Recklesness
					{AuraID = 1719, UnitID = "player"},
					-- Deadly Calm
					{AuraID = 85730, UnitID = "player"},
					-- Sweeping Strikes
					{AuraID = 12328, UnitID = "player"},
					-- Victorious
					{AuraID = 32216, UnitID = "player"},
				}, 
			}, 
			{
				Name = "目标减益", 
				Direction = "RIGHT", Interval = 4, 
				Mode = "ICON", IconSize = 48,  
				Pos = {"BOTTOMLEFT", "ElvUF_Target", "TOPLEFT", 0, 68}, 
				List = {
					-- Colossus Smash
					{AuraID = 86346, UnitID = "target", Caster = "player"},
					-- Hamstring
					{AuraID = 1715, UnitID = "target", Caster = "all"},
					-- Demoralizing Shout
					{AuraID = 1160, UnitID = "target", Caster = "all"},
					-- Weakened Armor
					{AuraID = 113746, UnitID = "target", Caster = "all"},
					-- Weakened Blows
					{AuraID = 115798, UnitID = "target", Caster = "all"},
				}, 
			}, 	
		}, 
		-- 盗贼
		["ROGUE"] = {
			{
				Name = "玩家减益", 
				Direction = "RIGHT", Interval = 10, 
				Mode = "ICON", IconSize = 48, 
				Pos = {"CENTER", "UIParent", "CENTER", -200, 200}, 
				List = {
					-- 变形术
					{AuraID =   118, UnitID = "player"},
				},
			},
			{
				Name = "玩家重要增益",
				Direction = "RIGHT", Interval = 6, 
				Mode = "ICON", IconSize = 42, 
				Pos = {"BOTTOMLEFT", "ElvUF_Player", "TOPLEFT", 0, 55},
				List = {
					-- Buffs
					-- Combat Readiness
					{AuraID = 74001, UnitID = "player"},
					-- Combat Insight
					{AuraID = 74002, UnitID = "player"},

					-- Trinkets
					-- General
					-- PvP Trinkets (Health, Use)
					{AuraID = 126697, UnitID = "player"},
					-- Physical Agility DPS
					-- Terror in the Mists (Crit, Proc)
					{AuraID = 126649, UnitID = "player"},
					-- Jade Bandit Figurine (Haste, Use)
					{AuraID = 126599, UnitID = "player"},
					-- Bottle of Infinite Stars (Agility, Proc)
					{AuraID = 126554, UnitID = "player"},
					-- PvP Trinkets (Agility, Use)
					{AuraID = 126690, UnitID = "player"},
					-- PvP Trinkets (Agility, Proc)
					{AuraID = 126707, UnitID = "player"},

					-- Enchants
					-- General
					-- Physical General
					-- Swordguard Embroidery (AP)
					{AuraID = 125489, UnitID = "player"},
					-- Physical Melee
					-- Dancing Steel (Agility)
					{AuraID = 118334, UnitID = "player"},
				},
			},
			{
				Name = "玩家增益", 
				Direction = "RIGHT", Interval = 6, 
				Mode = "ICON", IconSize = 42, 
				Pos = {"BOTTOMLEFT", "ElvUF_Player", "TOPLEFT", 0, 12}, 
				List = {
					-- Sprint
					{AuraID = 2983, UnitID = "player"},
					-- Adrenaline Rush
					{AuraID = 13750, UnitID = "player"},
					-- Evasion
					{AuraID = 5277, UnitID = "player"},
					-- Envenom
					{AuraID = 32645, UnitID = "player"},
					-- Overkill
					{AuraID = 58426, UnitID = "player"},
					-- Slice and Dice
					{AuraID = 5171, UnitID = "player"},
					-- Shadow dance
					{AuraID = 51713, UnitID = "player"},
					-- Recuperate
					{AuraID = 73651, UnitID = "player"},
					-- Shadowstep
					{AuraID = 36563, UnitID = "player"},
					-- Master of subtlety
					{AuraID = 31665, UnitID = "player"},
					-- Cloak of Shadows
					{AuraID = 31224, UnitID = "player"},
					-- Vanish
					{AuraID = 1856, UnitID = "player"},
					-- Cheating death
					{AuraID = 45182, UnitID = "player"},
					-- Blade Flurry
					{AuraID = 13877, UnitID = "player"},
					-- Shallow Insight
					{AuraID = 84745, UnitID = "player"},
					-- Moderate Insight
					{AuraID = 84746, UnitID = "player"},
					-- Deep Insight
					{AuraID = 84747, UnitID = "player"},
				}
			}, 
			{
				Name = "目标减益", 
				Direction = "RIGHT", Interval = 4, 
				Mode = "ICON", IconSize = 48,  
				Pos = {"BOTTOMLEFT", "ElvUF_Target", "TOPLEFT", 0, 68}, 
				List = {
					-- Rupture
					{AuraID = 1943, UnitID = "target", Caster = "player"},
					-- Garrote
					{AuraID = 703, UnitID = "target", Caster = "player"},
					-- Gouge
					{AuraID = 1776, UnitID = "target", Caster = "player"},
					-- Expose Armor
					{AuraID = 8647, UnitID = "target", Caster = "player"},
					-- Dismantle
					{AuraID = 51722, UnitID = "target", Caster = "player"},
					-- Revealing Strike
					{AuraID = 84617, UnitID = "target", Caster = "player"},
					-- Vendetta
					{AuraID = 79140, UnitID = "target", Caster = "player"},
					-- Hemorrhage
					{AuraID = 16511, UnitID = "target", Caster = "player"},
					-- Glyph of Hemorrhage
					{AuraID = 89775, UnitID = "target", Caster = "player"},
					-- Find Weakness
					{AuraID = 91021, UnitID = "target", Caster = "player"},
					-- Deadly Poison
					{AuraID = 2818, UnitID = "target", Caster = "player"},
					-- Mind-numbing Poison
					{AuraID = 5760, UnitID = "target", Caster = "player"},
					-- Crippling Poison
					{AuraID = 3409, UnitID = "target", Caster = "player"},
					-- Wound Poison
					{AuraID = 8680, UnitID = "target", Caster = "player"},
				}
			}, 
				
		}, 
		-- 死亡骑士
		["DEATHKNIGHT"] = {
			{
				Name = "玩家减益", 
				Direction = "RIGHT", Interval = 10, 
				Mode = "ICON", IconSize = 48, 
				Pos = {"CENTER", "UIParent", "CENTER", -200, 200}, 
				List = {
					-- 变形术
					{AuraID =   118, UnitID = "player"},
				},
			},
			{
				Name = "玩家重要增益",
				Direction = "RIGHT", Interval = 6, 
				Mode = "ICON", IconSize = 42, 
				Pos = {"BOTTOMLEFT", "ElvUF_Player", "TOPLEFT", 0, 55},
				List = {
					-- Buffs
					-- Scent of Blood
					{AuraID = 50421, UnitID = "player"},
					-- Crimson Scourge
					{AuraID = 81141, UnitID = "player"},
					-- Freezing Fog
					{AuraID = 59052, UnitID = "player"},
					-- Killing Machine
					{AuraID = 51124, UnitID = "player"},
					-- Sudden Doom
					{AuraID = 81340, UnitID = "player"},
					-- Unholy Strength
					{AuraID = 53365, UnitID = "player"},
					-- Dark Transformation
					{AuraID = 63560, UnitID = "pet"},

					-- Trinkets
					-- General
					-- PvP Trinkets (Health, Use)
					{AuraID = 126697, UnitID = "player"},
					-- Tank
					-- Stuff of Nightmares (Dodge, Proc)
					{AuraID = 126646, UnitID = "player"},
					-- Vial of Dragon's Blood (Dodge, Proc)
					{AuraID = 126533, UnitID = "player"},
					-- Jade Warlord Figurine (Mastery, Use)
					{AuraID = 126597, UnitID = "player"},
					-- Physical Strength DPS
					-- Darkmist Vortex (Haste, Proc)
					{AuraID = 126657, UnitID = "player"},
					-- Lei Shin's Final Orders (Strength, Proc)
					{AuraID = 126657, UnitID = "player"},
					-- Jade Charioteer Figurine (Strength, Use)
					{AuraID = 126599, UnitID = "player"},
					-- PvP Trinkets (Strength, Use)
					{AuraID = 126679, UnitID = "player"},
					-- PvP Trinkets (Strength, Proc)
					{AuraID = 126700, UnitID = "player"},

					-- Enchants
					-- General
					-- Tank
					-- River's Song (Dodge)
					{AuraID = 116660, UnitID = "player"},
					-- Physical General
					-- Swordguard Embroidery (AP)
					{AuraID = 125489, UnitID = "player"},
					-- Physical Melee
					-- Dancing Steel (Strength)
					{AuraID = 118335, UnitID = "player"},
				},
			},
			{
				Name = "玩家增益", 
				Direction = "RIGHT", Interval = 6, 
				Mode = "ICON", IconSize = 42, 
				Pos = {"BOTTOMLEFT", "ElvUF_Player", "TOPLEFT", 0, 12}, 
				List = {
					-- Bone Shield
					{AuraID = 49222, UnitID = "player"},
					-- Vampiric Blood
					{AuraID = 55233, UnitID = "player"},
					-- Icebound Fortitude
					{AuraID = 48792, UnitID = "player"},
					-- Anti-Magic Shell
					{AuraID = 48707, UnitID = "player"},
					-- Dancing Rune Weapon
					{AuraID = 49028, UnitID = "player"},
					-- Lichborne
					{AuraID = 49039, UnitID = "player"},
					-- Pillar of Frost
					{AuraID = 51271, UnitID = "player"},
					-- Death's Advance
					{AuraID = 96268, UnitID = "player"},
					-- Unholy Blight
					{AuraID = 115989, UnitID = "player"},
				}, 
			}, 	
			{
				Name = "目标减益", 
				Direction = "RIGHT", Interval = 4, 
				Mode = "ICON", IconSize = 48,  
				Pos = {"BOTTOMLEFT", "ElvUF_Target", "TOPLEFT", 0, 68}, 
				List = {
					-- Blood Plague
					{AuraID = 55095, UnitID = "target", Caster = "player"},
					-- Frost Fever
					{AuraID = 55078, UnitID = "target", Caster = "player"},
					{AuraID = 155159, UnitID = "target", Caster = "player"},					
				}, 
			}, 	
		}, 
		-- 武僧
		["MONK"] = {
			{
				Name = "玩家减益", 
				Direction = "RIGHT", Interval = 10, 
				Mode = "ICON", IconSize = 48, 
				Pos = {"CENTER", "UIParent", "CENTER", -200, 200}, 
				List = {
					-- 变形术
					{AuraID =   118, UnitID = "player"},
				},
			},
			{
				Name = "玩家重要增益",
				Direction = "RIGHT", Interval = 6, 
				Mode = "ICON", IconSize = 42, 
				Pos = {"BOTTOMLEFT", "ElvUF_Player", "TOPLEFT", 0, 55},
				List = {
					-- Buffs
					-- Tiger Power
					{AuraID = 125359, UnitID = "player"},
					-- Combo Breaker: Blackout Kick
					{AuraID = 116768, UnitID = "player"},
					-- Combo Breaker: Tiger Palm
					{AuraID = 118864, UnitID = "player"},
					-- Shuffle
					{AuraID = 115307, UnitID = "player"},

					-- Trinkets
					-- General
					-- PvP Trinkets (Health, Use)
					{AuraID = 126697, UnitID = "player"},
					-- Tank
					-- Stuff of Nightmares (Dodge, Proc)
					{AuraID = 126646, UnitID = "player"},
					-- Vial of Dragon's Blood (Dodge, Proc)
					{AuraID = 126533, UnitID = "player"},
					-- Jade Warlord Figurine (Mastery, Use)
					{AuraID = 126597, UnitID = "player"},
					-- Physical Agility DPS
					-- Terror in the Mists (Crit, Proc)
					{AuraID = 126649, UnitID = "player"},
					-- Jade Bandit Figurine (Haste, Use)
					{AuraID = 126599, UnitID = "player"},
					-- Bottle of Infinite Stars (Agility, Proc)
					{AuraID = 126554, UnitID = "player"},
					-- PvP Trinkets (Agility, Use)
					{AuraID = 126690, UnitID = "player"},
					-- PvP Trinkets (Agility, Proc)
					{AuraID = 126707, UnitID = "player"},
					-- Caster General
					-- Jade Magistrate Figurine (Crit, Use)
					{AuraID = 126605, UnitID = "player"},
					-- PvP Trinkets (Spell Power, Use)
					{AuraID = 126683, UnitID = "player"},
					-- PvP Trinkets (Spell Power, Proc)
					{AuraID = 126705, UnitID = "player"},
					-- Caster Heal
					-- Qin-xi's Polarizing Seal (Intellect, Proc)
					{AuraID = 126588, UnitID = "player"},

					-- Enchants
					-- General
					-- Tank
					-- River's Song (Dodge)
					{AuraID = 116660, UnitID = "player"},
					-- Physical General
					-- Swordguard Embroidery (AP)
					{AuraID = 125489, UnitID = "player"},
					-- Physical Melee
					-- Dancing Steel (Agility)
					{AuraID = 118334, UnitID = "player"},
					-- Caster General
					-- Jade Spirit (Intellect + Spirit)
					{AuraID = 104993, UnitID = "player"},
					-- Lightweave (Intellect)
					{AuraID = 125487, UnitID = "player"},
				},
			},
			{
				Name = "玩家增益", 
				Direction = "RIGHT", Interval = 6, 
				Mode = "ICON", IconSize = 42, 
				Pos = {"BOTTOMLEFT", "ElvUF_Player", "TOPLEFT", 0, 12}, 
				List = {
					-- Fortifying Brew
					{AuraID = 120954, UnitID = "player"},
					-- Energizing Brew
					{AuraID = 115288, UnitID = "player"},
					-- Elusive Brew
					{AuraID = 115308, UnitID = "player"},
					-- Tigereye Brew
					{AuraID = 116740, UnitID = "player"},
					-- Touch of Karma
					{AuraID = 125174, UnitID = "player"},
					-- Avert Harm
					{AuraID = 115213, UnitID = "player"},
					-- Diffuse Magic
					{AuraID = 122783, UnitID = "player"},
					-- Momentum
					{AuraID = 119085, UnitID = "player"},
				}, 
			}, 	
			{
				Name = "目标减益", 
				Direction = "RIGHT", Interval = 4, 
				Mode = "ICON", IconSize = 48,  
				Pos = {"BOTTOMLEFT", "ElvUF_Target", "TOPLEFT", 0, 68}, 
				List = {
					-- Breath of Fire
					{AuraID = 123725, UnitID = "target", Caster = "player"},
					-- Dizzying Haze
					{AuraID = 116330, UnitID = "target", Caster = "player"},
				}, 
			}, 	
		}, 		
	}
	if E.db.AuraWatch.loadDefault ~= true then
		for key, value in pairs(Default[E.myclass]) do
			if E.db.AuraWatch.DB[key] == nil then E.db.AuraWatch.DB[key] = value end
		end
		E.db.AuraWatch.loadDefault = true
		E.db.AuraWatch.myclass = E.myclass
	end
	twipe(Default)
end

-- BuildICON
local function BuildICON(IconSize, i)
	local Frame = CreateFrame("Frame", "AuraWatchIcon".. i, UIParent)
	Frame:SetSize(IconSize, IconSize)
	
	Frame.Icon = Frame:CreateTexture(nil, "ARTWORK") 
	Frame.Icon:Point("TOPLEFT", 2, -2)
	Frame.Icon:Point("BOTTOMRIGHT", -2, 2)
	Frame.Icon:SetTexCoord(0.08, 0.92, 0.08, 0.92)
	
	Frame:SetTemplate("Default")
	Frame:CreateShadow("Default")
	
	Frame.Count = Frame:CreateFontString(nil, 'OVERLAY')
	Frame.Count:FontTemplate(LSM:Fetch("font", Module.db.font), Module.db.fontSize, Module.db.fontOutline)
	Frame.Count:SetPoint("BOTTOMRIGHT", 3, -1)
	
	if E.db.AuraWatch.Spellname then
		Frame.Spellname = Frame:CreateFontString(nil, 'OVERLAY')
		Frame.Spellname:FontTemplate(LSM:Fetch("font", Module.db.font), Module.db.fontSize2, Module.db.fontOutline)
		Frame.Spellname:SetPoint("TOP", Frame, "BOTTOM", 0, -2)
		Frame.Spellname:SetTextColor(1,1,0)
	end
	
	Frame.Cooldown = CreateFrame("Cooldown", nil, Frame, 'CooldownFrameTemplate')  
	Frame.Cooldown:SetAllPoints() 
	Frame.Cooldown:SetReverse(true)
	E:RegisterCooldown(Frame.Cooldown)
	Frame:Hide()
	return Frame
end

-- BuildBAR
local function BuildBAR(BarWidth, IconSize, i)
	local Frame = CreateFrame("Frame", "AuraWatchBar".. i, UIParent)
	Frame:SetSize(BarWidth, IconSize)
	
	Frame.Icon = Frame:CreateTexture(nil, "ARTWORK")
	Frame.Icon:SetTexCoord(0.08, 0.92, 0.08, 0.92)
	Frame.Icon:SetSize(IconSize, IconSize)
	Frame.Icon:SetPoint("LEFT", -2, 0)
	Frame.Icon.bg = CreateFrame("Frame", nil, Frame)
	Frame.Icon.bg:SetTemplate("Default")
	Frame.Icon.bg:SetFrameLevel(Frame:GetFrameLevel()-1)
	Frame.Icon.bg:Point("TOPLEFT", Frame.Icon, "TOPLEFT", -2, 2)
	Frame.Icon.bg:Point("BOTTOMRIGHT", Frame.Icon, "BOTTOMRIGHT", 2, -2)

	Frame.Statusbar = CreateFrame("StatusBar", nil, Frame)
	Frame.Statusbar:SetSize(Frame:GetWidth()-Frame:GetHeight()-5, IconSize)
	Frame.Statusbar:SetPoint("BOTTOMRIGHT") 
	Frame.Statusbar:SetStatusBarTexture(E["media"].normTex) 
	Frame.Statusbar:SetStatusBarColor(RAID_CLASS_COLORS[E.myclass].r, RAID_CLASS_COLORS[E.myclass].g, RAID_CLASS_COLORS[E.myclass].b, 0.9)
	Frame.Statusbar:SetMinMaxValues(0, 1) 
	Frame.Statusbar:SetValue(0) 	
	Frame.Statusbar:CreateBackdrop("Transparent")
	if E.db.general.transparent and E.db.general.transparentStyle == 1 then Frame.Statusbar.backdrop:SetAlpha(E.db.general.backdropfadecolor.a or 0.4) end

	Frame.Count = Frame:CreateFontString(nil, 'OVERLAY')
	Frame.Count:FontTemplate(LSM:Fetch("font", Module.db.font), Module.db.fontSize, Module.db.fontOutline)
	Frame.Count:SetShadowColor(0, 0, 0)
	Frame.Count:SetShadowOffset(E.mult, -E.mult)
	Frame.Count:SetPoint("BOTTOMRIGHT", Frame.Icon, "BOTTOMRIGHT", 3, -1) 

	Frame.Time = Frame.Statusbar:CreateFontString(nil, 'OVERLAY')
	Frame.Time:FontTemplate(LSM:Fetch("font", Module.db.font), Module.db.fontSize, Module.db.fontOutline)
	Frame.Time:SetShadowColor(0, 0, 0, 0)
	Frame.Time:SetShadowOffset(E.mult, -E.mult)
	Frame.Time:SetPoint("RIGHT", -2, 0) 

	Frame.Spellname = Frame.Statusbar:CreateFontString(nil, 'OVERLAY')
	Frame.Spellname:FontTemplate(LSM:Fetch("font", Module.db.font), Module.db.fontSize2, Module.db.fontOutline)
	Frame.Spellname:SetShadowOffset(E.mult, -E.mult)
	Frame.Spellname:SetShadowColor(0, 0, 0)
	Frame.Spellname:SetPoint("LEFT", 5, 0)
	
	Frame:Hide()
	return Frame
end

function Module:BuildAura()
	for key, value in pairs(E.db.AuraWatch.DB) do
		local FrameTable = {}
		for i = 1, MaxFrame do
			local Frame = nil
			if value.Mode:lower() == "icon" then
				Frame = BuildICON(value.IconSize, i)
			elseif value.Mode:lower() == "bar" then
				Frame = BuildBAR(value.BarWidth, value.IconSize, i)
			end
			if i == 1 then
				Frame:SetPoint(unpack(value.Pos))
				if value.Name ~= L["New Group"] then E:CreateMover(Frame, value.Name, value.Name, nil, nil, nil, 'ALL,EUI', function() return E.private.AuraWatch.enable; end) end
			end
			tinsert(FrameTable, Frame)
		end
		tinsert(Module.Aura, FrameTable)
	end
end

function Module:UpdatePos()
	for key, value in pairs(Module.Aura) do
		local Direction, Interval = E.db.AuraWatch.DB[key].Direction, E.db.AuraWatch.DB[key].Interval
		for i = 1, MaxFrame do
			if i ~= 1 then value[i]:ClearAllPoints() end
			if i == 1 then
				value[i]:SetPoint("CENTER", value[i].mover)
			elseif Direction:lower() == "right" then
				value[i]:SetPoint("LEFT", value[i-1], "RIGHT", Interval, 0)
			elseif Direction:lower() == "left" then
				value[i]:SetPoint("RIGHT", value[i-1], "LEFT", -Interval, 0)
			elseif Direction:lower() == "up" then
				value[i]:SetPoint("BOTTOM", value[i-1], "TOP", 0, Interval)
			elseif Direction:lower() == "down" then
				value[i]:SetPoint("TOP", value[i-1], "BOTTOM", 0, -Interval)
			end
		end
	end
end

local function CleanUp()
	for _, VALUE in pairs(Module.Aura) do
		for _, value in pairs(VALUE) do
			if value then
				value:Hide()
				value:SetScript("OnUpdate", nil)
			end
			if value.Icon then value.Icon:SetTexture(nil) end
			if value.Count then value.Count:SetText(nil) end
			if valueSpellname then value.Spellname:SetText(nil) end
			if value.Statusbar then
				value.Statusbar:SetMinMaxValues(0, 1) 
				value.Statusbar:SetValue(0)
			end
		end
	end
end

function Module:DeleteAllFrame()
	for _, VALUE in pairs(self.Aura) do
		for _, value in pairs(VALUE) do
			if value.Icon then value.Icon:SetTexture(nil); value.Icon = nil; end
			if value.Count then value.Count:SetText(nil); value.Count = nil; end
			if valueSpellname then value.Spellname:SetText(nil); value.Spellname = nil; end
			if value.Statusbar then
				value.Statusbar:SetMinMaxValues(0, 1) 
				value.Statusbar:SetValue(0)
				value.Statusbar = nil
			end
			if value then
				value:Hide()
				value:SetScript("OnUpdate", nil)
				value = nil
			end
		end
		twipe(VALUE)
	end
	twipe(self.Aura)
end

local function SetTime(self)
	if self.Timer < 60 then
		if self.Time then self.Time:SetFormattedText("%.1f", self.Timer) end
		self.Statusbar:SetValue(self.Timer)
	else
		if self.Time then self.Time:SetFormattedText("%d:%.2d", self.Timer/60, self.Timer%60) end
		self.Statusbar:SetValue(self.Timer)
	end
end

local function UpdateAuraFrame(KEY, value, name, icon, count, duration, expires, caster)
	if value.Caster and value.Caster ~= caster then return end
	if value.Stack and count and value.Stack > count then return end
	local Frame = Module.Aura[KEY][Index]
	if Frame then Frame:Show() end
	if Frame.Icon then Frame.Icon:SetTexture(icon) end
	if Frame.Count then Frame.Count:SetText(count > 1 and count or nil) end
	if Frame.Cooldown then
		Frame.Cooldown:SetReverse(true)
		CooldownFrame_SetTimer(Frame.Cooldown, expires-duration, duration, 1)
	end
	if Frame.Spellname then Frame.Spellname:SetText(name) end
	if Frame.Statusbar then
		Frame.Timer = 0
		Frame.Statusbar:SetMinMaxValues(0, duration)
		Frame:SetScript("OnUpdate", function(self, elapsed)
			self.Timer = expires-GetTime()
			if expires == 0 then self.Timer = 0 end
			SetTime(self)
		end)
	end
	Index = Index + 1
end

local function UpdateCDFrame(KEY, name, icon, start, duration)
	local Frame = Module.Aura[KEY][Index]
	if Frame then Frame:Show() end
	if Frame.Icon then Frame.Icon:SetTexture(icon) end
	if Frame.Cooldown then
		Frame.Cooldown:SetReverse(false)
		CooldownFrame_SetTimer(Frame.Cooldown, start, duration, 1)
	end
	if Frame.Count then Frame.Count:SetText(nil) end
	if Frame.Spellname then Frame.Spellname:SetText(name) end
	if Frame.Statusbar then
		Frame.Timer = 0
		Frame.Statusbar:SetMinMaxValues(0, duration)
		Frame:SetScript("OnUpdate", function(self, elapsed)
			self.Timer = start+duration-GetTime()
			SetTime(self)
		end)
	end
	Index = Index + 1
end

local function UpdateFrame()
	for KEY, VALUE in pairs(E.db.AuraWatch.DB) do
		Index = 1
		for _, value in pairs(VALUE.List) do
			if value.AuraID then
				local name = GetSpellInfo(value.AuraID)
				if name and UnitBuff(value.UnitID, name) then
					if E.private.AuraWatch.checkSpellid then
						for i = 1, 40 do
							local name, _, icon, count, _, duration, expires, caster, _, _, spellID = UnitBuff(value.UnitID, i)
							if spellID == value.AuraID then
								UpdateAuraFrame(KEY, value, name, icon, count, duration, expires, caster)
							end
						end
					else
						local name, _, icon, count, _, duration, expires, caster = UnitBuff(value.UnitID, name)
						UpdateAuraFrame(KEY, value, name, icon, count, duration, expires, caster)
					end
				elseif name and UnitDebuff(value.UnitID, name) then
					if E.private.AuraWatch.checkSpellid then
						for i = 1, 40 do
							local name, _, icon, count, _, duration, expires, caster, _, _, spellID = UnitDebuff(value.UnitID, i)
							if spellID == value.AuraID then
								UpdateAuraFrame(KEY, value, name, icon, count, duration, expires, caster)
							end
						end
					else					
						local name, _, icon, count, _, duration, expires, caster, _, _, spellID = UnitDebuff(value.UnitID, name)
						UpdateAuraFrame(KEY, value, name, icon, count, duration, expires, caster)
					end
				end
			end
			if value.SpellID then
				if GetSpellCooldown(value.SpellID) and select(2, GetSpellCooldown(value.SpellID)) > 1.5 then
					local name, _, icon = GetSpellInfo(value.SpellID)
					local start, duration = GetSpellCooldown(value.SpellID)
					UpdateCDFrame(KEY, name, icon, start, duration)
				end
			end
			if value.ItemID then
				if GetItemCooldown(value.ItemID) and select(2, GetItemCooldown(value.ItemID)) > 1.5 then
					local name, _, _, _, _, _, _, _, _, icon = GetItemInfo(value.ItemID)
					local start, duration = GetItemCooldown(value.ItemID)
					UpdateCDFrame(KEY, name, icon, start, duration)
				end
			end
		end
	end
end

local function OnUpdate()
	CleanUp()
	UpdateFrame()
end

function Module:Initialize()
	self.db = E.db["AuraWatch"]

	if E.db.AuraWatch.myclass == '' then
		E.db.AuraWatch.myclass = E.myclass
	elseif E.db.AuraWatch.myclass ~= E.myclass then
		E.db.AuraWatch.loadDefault = false
	end		
	
	if E.db.AuraWatch.loadDefault ~= true then self:LoadSettings() end

	if E.private.AuraWatch.enable ~= true then return end
	
	self:BuildAura()
	self:UpdatePos()
	Module:ScheduleRepeatingTimer(OnUpdate, self.db.delay or 0.5)
end

E:RegisterModule(Module:GetName())