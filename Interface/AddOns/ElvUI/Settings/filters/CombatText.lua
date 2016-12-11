local E, L, V, P, G, _ = unpack(select(2, ...)); --Engine
if C.combattext.enable ~= true then return end

----------------------------------------------------------------------------------------
--	The best way to add or delete spell is to go at www.wowhead.com, search for a spell.
--	Example: Blizzard -> http://www.wowhead.com/spell=42208
--	Take the number ID at the end of the URL, and add it to the list
----------------------------------------------------------------------------------------
-- General filter outgoing healing
if C.combattext.healing then
	T.healfilter = {}
end

-- General merge outgoing damage
if C.combattext.merge_aoe_spam then
	T.merge = {}
	T.aoespam = {}
	T.aoespam[6603] = 3				-- Auto Attack
	T.aoespam[148008] = 3			-- Essence of Yu'lon
	T.aoespam[148009] = 3			-- Spirit of Chi-Ji
	T.aoespam[149276] = 3			-- Flurry of Xuen
	T.aoespam[147891] = 3			-- Flurry of Xuen
end

-- Class config
if T.class == "DEATHKNIGHT" then
	if C.combattext.merge_aoe_spam then
		T.aoespam[55095] = 3		-- Frost Fever
		T.aoespam[55078] = 3		-- Blood Plague
		T.aoespam[50842] = 0		-- Blood Boil
		T.aoespam[49184] = 0		-- Howling Blast
		T.aoespam[52212] = 3		-- Death and Decay
		T.aoespam[50401] = 3		-- Razor Frost
		T.aoespam[91776] = 3		-- Claw (Ghoul)
		T.aoespam[49020] = 0		-- Obliterate
		T.aoespam[49143] = 0		-- Frost Strike
		T.aoespam[45462] = 0		-- Plague Strike
		T.aoespam[49998] = 0		-- Death Strike
		T.merge[66198] = 49020		-- Obliterate Off-Hand
		T.merge[66196] = 49143		-- Frost Strike Off-Hand
		T.merge[66216] = 45462		-- Plague Strike Off-Hand
		T.merge[66188] = 49998		-- Death Strike Off-Hand
	end
	if C.combattext.healing then
		T.healfilter[119980] = true	-- Conversion
	end
elseif T.class == "DRUID" then
	if C.combattext.merge_aoe_spam then
		-- Healing spells
		T.aoespam[774] = 3			-- Rejuvenation
		T.aoespam[48438] = 3		-- Wild Growth
		T.aoespam[8936] = 3			-- Regrowth
		T.aoespam[33763] = 3		-- Lifebloom
		T.aoespam[157982] = 3		-- Tranquility
		T.aoespam[81269] = 3		-- Wild Mushroom
		T.aoespam[124988] = 3		-- Nature's Vigil
		T.aoespam[162359] = 3		-- Genesis
		T.aoespam[144876] = 3		-- Spark of Life (T16)
		-- Damaging spells
		T.aoespam[164812] = 3		-- Moonfire
		T.aoespam[164815] = 3		-- Sunfire
		T.aoespam[42231] = 3		-- Hurricane
		T.aoespam[106998] = 3		-- Astral Storm
		T.aoespam[50288] = 3		-- Starfall
		T.aoespam[61391] = 0		-- Typhoon
		T.aoespam[155722] = 3		-- Rake
		T.aoespam[33917] = 0		-- Mangle
		T.aoespam[106785] = 0		-- Swipe
		T.aoespam[33745] = 3		-- Lacerate
		T.aoespam[77758] = 3		-- Thrash (Bear Form)
		T.aoespam[106830] = 3		-- Thrash (Cat Form)
		T.aoespam[1079] = 3			-- Rip
		T.aoespam[124991] = 3		-- Nature's Vigil
	end
	if C.combattext.healing then
		T.healfilter[145109] = true	-- Ysera's Gift (Self)
		T.healfilter[145110] = true	-- Ysera's Gift
		T.healfilter[68285] = true	-- Leader of the Pack
	end
elseif T.class == "HUNTER" then
	if C.combattext.merge_aoe_spam then
		T.aoespam[2643] = 0			-- Multi-Shot
		T.aoespam[118253] = 3		-- Serpent Sting
		T.aoespam[13812] = 3		-- Explosive Trap
		T.aoespam[53301] = 3		-- Explosive Shot
		T.aoespam[118459] = 3		-- Beast Cleave
		T.aoespam[120699] = 3		-- Lynx Rush
		T.aoespam[120361] = 3		-- Barrage
		T.aoespam[131900] = 3		-- A Murder of Crows
		T.aoespam[3674] = 3			-- Black Arrow
		T.aoespam[121414] = 3		-- Glaive Toss
		T.aoespam[162543] = 3		-- Poisoned Ammo
		T.aoespam[162541] = 3		-- Incendiary Ammo
		T.aoespam[34655] = 3		-- Deadly Poison (Trap)
		T.aoespam[93433] = 3		-- Burrow Attack (Worm)
		T.aoespam[92380] = 3		-- Froststorm Breath (Chimaera)
		T.merge[120761] = 121414	-- Glaive Toss
	end
	if C.combattext.healing then
		T.healfilter[51753] = true	-- Camouflage
	end
elseif T.class == "MAGE" then
	if C.combattext.merge_aoe_spam then
		T.aoespam[44457] = 3		-- Living Bomb
		T.aoespam[44461] = 3		-- Living Bomb (AoE)
		T.aoespam[2120] = 3			-- Flamestrike
		T.aoespam[12654] = 3		-- Ignite
		T.aoespam[11366] = 3		-- Pyroblast
		T.aoespam[31661] = 0		-- Dragon's Breath
		T.aoespam[42208] = 3		-- Blizzard
		T.aoespam[122] = 0			-- Frost Nova
		T.aoespam[1449] = 0			-- Arcane Explosion
		T.aoespam[83853] = 3		-- Combustion
		T.aoespam[120] = 0			-- Cone of Cold
		T.aoespam[114923] = 3		-- Nether Tempest
		T.aoespam[114954] = 3		-- Nether Tempest (AoE)
		T.aoespam[7268] = 3			-- Arcane Missiles
		T.aoespam[113092] = 0		-- Frost Bomb
		T.aoespam[44425] = 0		-- Arcane Barrage
		T.aoespam[84721] = 3		-- Frozen Orb
		T.aoespam[148022] = 3		-- Icicle (Mastery)
		T.aoespam[31707] = 3		-- Waterbolt (Pet)
		T.aoespam[30455] = 0		-- Ice Lance
		T.aoespam[115611] = 6		-- Temporal Ripples
		T.aoespam[157981] = 1		-- Blast Wave
		T.aoespam[157997] = 1		-- Ice Nova
		T.aoespam[157980] = 1		-- Supernova
		T.aoespam[135029] = 3		-- Water Jet (Pet)
	end
elseif T.class == "MONK" then
	if C.combattext.merge_aoe_spam then
		-- Healing spells
		T.aoespam[119611] = 3		-- Renewing Mist
		T.aoespam[132120] = 3		-- Enveloping Mist
		T.aoespam[115175] = 3		-- Soothing Mist
		T.aoespam[125953] = 3		-- Soothing Mist (Statue)
		T.aoespam[126890] = 3		-- Eminence
		T.aoespam[117640] = 3		-- Spinning Crane Kick
		T.aoespam[132463] = 3		-- Chi Wave
		T.aoespam[130654] = 3		-- Chi Burst
		T.aoespam[124081] = 3		-- Zen Sphere
		T.aoespam[124101] = 3		-- Zen Sphere: Detonate
		T.aoespam[116670] = 0		-- Uplift
		T.merge[159621] = 126890	-- Eminence
		-- Damaging spells
		T.aoespam[117952] = 3		-- Crackling Jade Lightning
		T.aoespam[117418] = 3		-- Fists of Fury
		T.aoespam[128531] = 3		-- Blackout Kick (DoT)
		T.aoespam[121253] = 0		-- Keg Smash
		T.aoespam[115181] = 0		-- Breath of Fire
		T.aoespam[123725] = 3		-- Breath of Fire (DoT)
		T.aoespam[107270] = 3		-- Spinning Crane Kick
		T.aoespam[123586] = 3		-- Flying Serpent Kick
		T.aoespam[132467] = 3		-- Chi Wave
		T.aoespam[148135] = 3		-- Chi Burst
		T.aoespam[124098] = 3		-- Zen Sphere
		T.aoespam[125033] = 3		-- Zen Sphere: Detonate
	end
elseif T.class == "PALADIN" then
	if C.combattext.merge_aoe_spam then
		-- Healing spells
		T.aoespam[20167] = 3		-- Seal of Insight
		T.aoespam[123530] = 3		-- Battle Insight
		T.aoespam[53652] = 3		-- Beacon of Light
		T.aoespam[85222] = 0		-- Light of Dawn
		T.aoespam[82327] = 0		-- Holy Radiance
		T.aoespam[121129] = 0		-- Daybreak
		T.aoespam[114163] = 3		-- Eternal Flame
		T.aoespam[114852] = 0		-- Holy Prism
		T.aoespam[119952] = 3		-- Arcing Light
		T.aoespam[114917] = 3		-- Stay of Execution
		T.aoespam[144581] = 3		-- Blessing of the Guardians (T16)
		-- Damaging spells
		T.aoespam[81297] = 3		-- Consecration
		T.aoespam[119072] = .5		-- Holy Wrath
		T.aoespam[53385] = 0		-- Divine Storm
		T.aoespam[122032] = 0		-- Exorcism (Glyph)
		T.aoespam[31803] = 3		-- Censure
		T.aoespam[42463] = 3		-- Seal of Truth
		T.aoespam[101423] = 3		-- Seal of Righteousness
		T.aoespam[88263] = 0		-- Hammer of the Righteous
		T.aoespam[96172] = 3		-- Hand of Light (Mastery)
		T.aoespam[31935] = .5		-- Avenger's Shield
		T.aoespam[114871] = 0		-- Holy Prism
		T.aoespam[114919] = 3		-- Arcing Light
		T.aoespam[114916] = 3		-- Execution Sentence
		T.aoespam[86704] = 0		-- Ancient Fury
		T.merge[53595] = 88263		-- Hammer of the Righteous
	end
	if C.combattext.healing then
		T.healfilter[115547] = true	-- Glyph of Avenging Wrath
	end
elseif T.class == "PRIEST" then
	if C.combattext.merge_aoe_spam then
		-- Healing spells
		T.aoespam[47750] = 3		-- Penance
		T.aoespam[23455] = 0		-- Holy Nova
		T.aoespam[139] = 3			-- Renew
		T.aoespam[596] = 0			-- Prayer of Healing
		T.aoespam[64844] = 3		-- Divine Hymn
		T.aoespam[32546] = 3		-- Binding Heal
		T.aoespam[77489] = 3		-- Echo of Light
		T.aoespam[34861] = 0		-- Circle of Healing
		T.aoespam[33110] = 3		-- Prayer of Mending
		T.aoespam[88686] = 3		-- Holy Word: Sanctuary
		T.aoespam[81751] = 3		-- Atonement
		T.aoespam[120692] = 3		-- Halo
		T.aoespam[121148] = 3		-- Cascade
		T.aoespam[110745] = 3		-- Divine Star
		T.merge[94472] = 81751		-- Atonement
		-- Damaging spells
		T.aoespam[47666] = 3		-- Penance
		T.aoespam[132157] = 0		-- Holy Nova
		T.aoespam[589] = 3			-- Shadow Word: Pain
		T.aoespam[34914] = 3		-- Vampiric Touch
		T.aoespam[2944] = 3			-- Devouring Plague
		T.aoespam[15407] = 3		-- Mind Flay
		T.aoespam[49821] = 3		-- Mind Sear
		T.aoespam[14914] = 3		-- Holy Fire
		T.aoespam[129250] = 3		-- Power Word: Solace
		T.aoespam[120696] = 3		-- Halo
		T.aoespam[127628] = 3		-- Cascade
		T.aoespam[122128] = 3		-- Divine Star
		T.aoespam[129197] = 3		-- Insanity
		T.aoespam[148859] = 3		-- Shadowy Apparition
		T.merge[158831] = 2944		-- Devouring Plague
	end
	if C.combattext.healing then
		T.healfilter[127626] = true	-- Devouring Plague
		T.healfilter[15290] = true	-- Vampiric Embrace
	end
elseif T.class == "ROGUE" then
	if C.combattext.merge_aoe_spam then
		T.aoespam[51723] = 0		-- Fan of Knives
		T.aoespam[122233] = 3		-- Crimson Tempest (DoT)
		T.aoespam[2818] = 3			-- Deadly Poison
		T.aoespam[8680] = 3			-- Wound Poison
		T.aoespam[22482] = 3		-- Blade Flurry
		T.aoespam[16511] = 3		-- Hemorrhage
		T.aoespam[5374] = 0			-- Mutilate
		T.merge[27576] = 5374		-- Mutilate Off-Hand
		T.merge[113780] = 2818		-- Deadly Poison
		T.merge[168908] = 16511		-- Hemorrhage
		T.merge[121411] = 122233	-- Crimson Tempest
	end
	if C.combattext.healing then
		T.healfilter[112974] = true	-- Leeching Poison
	end
elseif T.class == "SHAMAN" then
	if C.combattext.merge_aoe_spam then
		-- Healing spells
		T.aoespam[73921] = 3		-- Healing Rain
		T.aoespam[52042] = 3		-- Healing Stream Totem
		T.aoespam[1064] = 3			-- Chain Heal
		T.aoespam[61295] = 3		-- Riptide
		T.aoespam[98021] = 3		-- Spirit Link
		T.aoespam[114911] = 3		-- Ancestral Guidance
		T.aoespam[114942] = 3		-- Healing Tide
		T.aoespam[114083] = 3		-- Restorative Mists
		-- Damaging spells
		T.aoespam[421] = 1			-- Chain Lightning
		T.aoespam[8349] = 0			-- Fire Nova
		T.aoespam[77478] = 3		-- Earhquake
		T.aoespam[51490] = 0		-- Thunderstorm
		T.aoespam[8187] = 3			-- Magma Totem
		T.aoespam[8050] = 3			-- Flame Shock
		T.aoespam[25504] = 3		-- Windfury Attack
		T.aoespam[10444] = 3		-- Flametongue Attack
		T.aoespam[3606] = 3			-- Searing Bolt
		T.aoespam[170379] = 3		-- Molten Earth
		T.aoespam[114074] = 1		-- Lava Beam
		T.aoespam[32175] = 0		-- Stormstrike
		T.aoespam[114089] = 3		-- Windlash
		T.aoespam[115357] = 0		-- Windstrike
		T.merge[168477] = 421		-- Chain Lightning (Multi)
		T.merge[168489] = 114074	-- Lava Beam (Multi)
		T.merge[32176] = 32175		-- Stormstrike Off-Hand
		T.merge[114093] = 114089	-- Windlash Off-Hand
		T.merge[115360] = 115357	-- Windstrike Off-Hand
	end
elseif T.class == "WARLOCK" then
	if C.combattext.merge_aoe_spam then
		T.aoespam[27243] = 3		-- Seed of Corruption
		T.aoespam[27285] = 3		-- Seed of Corruption (AoE)
		T.aoespam[87385] = 3		-- Seed of Corruption (Soulburn)
		T.aoespam[146739] = 3		-- Corruption
		T.aoespam[30108] = 3		-- Unstable Affliction
		T.aoespam[348] = 3			-- Immolate
		T.aoespam[980] = 3			-- Agony
		T.aoespam[80240] = 3		-- Havoc
		T.aoespam[42223] = 3		-- Rain of Fire
		T.aoespam[689] = 3			-- Drain Life
		T.aoespam[5857] = 3			-- Hellfire
		T.aoespam[129476] = 3		-- Immolation Aura
		T.aoespam[103103] = 3		-- Drain Soul
		T.aoespam[86040] = 3		-- Hand of Gul'dan
		T.aoespam[124915] = 3		-- Chaos Wave
		T.aoespam[47960] = 3		-- Shadowflame
		T.aoespam[30213] = 3		-- Legion Strike (Felguard)
		T.aoespam[89753] = 3		-- Felstorm (Felguard)
		T.aoespam[20153] = 3		-- Immolation (Infrenal)
		T.aoespam[114654] = 0		-- Incinerate
		T.aoespam[108685] = 0		-- Conflagrate
		T.aoespam[22703] = 0		-- Infernal Awakening
		T.aoespam[171017] = 0		-- Meteor Strike (Infrenal)
		T.aoespam[104318] = 3		-- Fel Firebolt
		T.aoespam[3110] = 3			-- Firebolt (Imp)
		T.merge[157736] = 348		-- Immolate
		T.merge[108686] = 348		-- Immolate
		T.merge[131737] = 980		-- Agony (Drain Soul)
		T.merge[131740] = 146739	-- Corruption (Drain Soul)
		T.merge[131736] = 30108		-- Unstable Affliction (Drain Soul)
	end
	if C.combattext.healing then
		T.healfilter[63106] = true	-- Siphon Life
		T.healfilter[89653] = true	-- Drain Life
		T.healfilter[108359] = true	-- Dark Regeneration
	end
elseif T.class == "WARRIOR" then
	if C.combattext.merge_aoe_spam then
		T.aoespam[46968] = 0		-- Shockwave
		T.aoespam[6343] = 0			-- Thunder Clap
		T.aoespam[1680] = 0			-- Whirlwind
		T.aoespam[115767] = 3		-- Deep Wounds
		T.aoespam[50622] = 3		-- Bladestorm
		T.aoespam[52174] = 0		-- Heroic Leap
		T.aoespam[118000] = 0		-- Dragon Roar
		T.aoespam[76858] = 3		-- Opportunity Strike
		T.aoespam[113344] = 3		-- Bloodbath
		T.aoespam[96103] = 0		-- Raging Blow
		T.aoespam[6572] = 0			-- Revenge
		T.aoespam[5308] = 0			-- Execute
		T.aoespam[772] = 3			-- Rend
		T.merge[44949] = 1680		-- Whirlwind Off-Hand
		T.merge[85384] = 96103		-- Raging Blow Off-Hand
		T.merge[95738] = 50622		-- Bladestorm Off-Hand
		T.merge[163558] = 5308		-- Execute Off-Hand
		T.merge[94009] = 772		-- Rend
	end
	if C.combattext.healing then
		T.healfilter[117313] = true	-- Bloodthirst Heal
		T.healfilter[55694] = true	-- Enraged Regeneration
		T.healfilter[159363] = true	-- Blood Craze
	end
end