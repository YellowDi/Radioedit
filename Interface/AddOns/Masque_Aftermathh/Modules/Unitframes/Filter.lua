local A, C, M, L = select(2, ...):unpack()

local parent, ns = ...
local oUF = ns.oUF or oUF

local UnitFrames = A["UnitFrames"]
local Class = select(2, UnitClass("player"))

UnitFrames.CustomAuraFilter = {
	DEMONHUNTER = {
		Buffs = {
			-- Havoc
			[GetSpellInfo(208628)] = true, -- Momentum
			[GetSpellInfo(211048)] = true, -- Chaos Blades
			[GetSpellInfo(162264)] = true, -- Metamorphosis
			[GetSpellInfo(212800)] = true, -- Blur
		},	
	},
	
	DEATHKNIGHT = {
		Buffs = {
		    -- Unholy
			[GetSpellInfo(53365)] = true,  -- Unholy Strength
			[GetSpellInfo(81340)] = true,  -- Sudden Doom
			[GetSpellInfo(207290)] = true, -- Unholy Frenzy
			[GetSpellInfo(51460)] = true,  -- Runic Corruption
			[GetSpellInfo(242583)] = true, -- Concordance of the Legionfall
			[GetSpellInfo(246995)] = true, -- Master Of Gouls
			[GetSpellInfo(235599)] = true, -- Cold Heart (Legendary)
		
		},
		
		Debuffs = {
			-- Unholy
			[GetSpellInfo(191587)] = true, -- Outbreak
			[GetSpellInfo(196782)] = true, -- Outbreak
			[GetSpellInfo(194310)] = true, -- Festering Wound
			[GetSpellInfo(45524)] = true, --  Chain Of Ice

		},
	},

	DRUID = {
		Buffs = {
	
		},
		
		Debuffs = {

		},
	},
	
	HUNTER = {
		Buffs = {
		    -- Beast Mastery
		    [GetSpellInfo(246152)] = true, -- Dire Frenzy
			[GetSpellInfo(120694)] = true, -- Dire Beast
			[GetSpellInfo(19574)] = true,  -- Beastial Wrath
			[GetSpellInfo(242584)] = true, -- Concordance of the Legionfall
			[GetSpellInfo(193530)] = true, -- Aspect Of The Wild
			-- Survival
			[GetSpellInfo(201081)] = true, -- Way of the Mok'Nathal
			[GetSpellInfo(190931)] = true, -- Mongoose Fury
			[GetSpellInfo(194407)] = true, -- Spitting Cobra
			[GetSpellInfo(186289)] = true, -- Aspect of the Eagle
			[GetSpellInfo(203927)] = true, -- Aspect of the Skylord
		},
		
		Debuffs = {

		},
	},

	MAGE = {
		Buffs = {
		
		},
		
		Debuffs = {

		},
	},

	MONK = {
		Buffs = {
			-- All
			[GetSpellInfo(119085)] = true, -- Chi Torpedo
			-- Mistweaver 
			[GetSpellInfo(197206)] = true, -- Uplifting Trance
			[GetSpellInfo(197908)] = true, -- Mana Tea
			[GetSpellInfo(116680)] = true, -- Thunder Focus Tea
			[GetSpellInfo(199407)] = true, -- Light on Your Feet
			[GetSpellInfo(199888)] = true, -- The Mists of Sheilun
			-- Windwalker
			[GetSpellInfo(195321)] = true, -- Transfer The Power
			[GetSpellInfo(129914)] = true, -- Power Strikes
			[GetSpellInfo(211432)] = true, -- Storm, Earth and Fire
			[GetSpellInfo(137639)] = true, -- Combo Master
			[GetSpellInfo(116768)] = true, -- Blackout Kick
			[GetSpellInfo(152173)] = true, -- Serenity
			[GetSpellInfo(196741)] = true, -- Hit Combo
			[GetSpellInfo(125174)] = true, -- Karma
			-- Brewmaster
			[GetSpellInfo(213177)] = true, -- Swift as a Coursing River
			[GetSpellInfo(215479)] = true, -- Ironskin Brew
			[GetSpellInfo(196608)] = true, -- Eye of the tiger
			[GetSpellInfo(213341)] = true, -- Fortification
		},
		
		Debuffs = {

		},
	},

	PALADIN = {
		Buffs = {
			-- Holy
			[GetSpellInfo(498)] = true,    -- Divine Protection
			[GetSpellInfo(54149)] = true,  -- Infusion of Light
			[GetSpellInfo(31842)] = true,  -- Avenging Wrath
			[GetSpellInfo(207589)] = true, -- Ilterendi, Crown Jewel of Silvermoon
			[GetSpellInfo(200376)] = true, -- Vindicator
			[GetSpellInfo(105809)] = true, -- Holy Avenger
			[GetSpellInfo(200656)] = true, -- Power of the Silver Hand
			[GetSpellInfo(200657)] = true, -- Power of the Silver Hand
			[GetSpellInfo(200423)] = true, -- The Light Saves
			-- Protection
			[GetSpellInfo(132403)] = true, -- Shield of the Righteous
			[GetSpellInfo(209540)] = true, -- Light of the Titans
			[GetSpellInfo(188370)] = true, -- Consecration
			[GetSpellInfo(209388)] = true, -- Bulwark of Order
			[GetSpellInfo(120954)] = true, -- Fortifying Brew
		},
		
		Debuffs = {

		},
	},

	PRIEST = {
		Buffs = {
		    --Shadow
		    [GetSpellInfo(197937)] = true, -- Lingering Insanity
			[GetSpellInfo(240673)] = true, -- Mind Quickening
			[GetSpellInfo(194249)] = true, -- Void Form
			[GetSpellInfo(205065)] = true, -- Void Torrent
			[GetSpellInfo(194022)] = true, -- Mental Fortitude
			[GetSpellInfo(215210)] = true, -- Anund's Seared Shackles
			[GetSpellInfo(123254)] = true, -- Twist of Fate
			[GetSpellInfo(10060)] = true,  -- Power Infusion
		},
		
		Debuffs = {

		},
	},

	ROGUE = {
		Buffs = {
		    [GetSpellInfo(5277)] = true,   -- Evasion
			[GetSpellInfo(31224)] = true,  -- Cloak Of Shadows
			[GetSpellInfo(2983)] = true,   -- Sprint
			[GetSpellInfo(1966)] = true,   -- Feint
			[GetSpellInfo(185311)] = true, -- Crimson Vial
		},
		
		Debuffs = {

		},
	},

	SHAMAN = {
		Buffs = {
		    -- All
			[GetSpellInfo(108271)] = true, -- Astral Shift
		    -- Resto
			[GetSpellInfo(53390)] = true,  -- Tidal Waves
			[GetSpellInfo(73920)] = true,  -- Healing Rain
			[GetSpellInfo(207288)] = true, -- Queen Ascendant
			[GetSpellInfo(208416)] = true, -- Sense of Urgency
			[GetSpellInfo(114052)] = true, -- Ascendance
			[GetSpellInfo(79206)] = true,  -- Spiritwalker's Grace
			[GetSpellInfo(108281)] = true, -- Ancestral Guidance
			[GetSpellInfo(242586)] = true, -- Concordance of the Legionfall (Resto)
			[GetSpellInfo(210607)] = true, -- Focuser of Jonat, the Elder (Resto Legendary)
			[GetSpellInfo(208764)] = true, -- Nobundo's Redemption (Resto Legendary)
			-- Enhancement
			[GetSpellInfo(202004)] = true, -- Landslide
			[GetSpellInfo(198300)] = true, -- Gathering Storms
			[GetSpellInfo(201846)] = true, -- Stormbringer
			[GetSpellInfo(194084)] = true, -- Flametounge
			[GetSpellInfo(204945)] = true, -- Doom Winds
			[GetSpellInfo(195222)] = true, -- Stormlash
			[GetSpellInfo(198293)] = true, -- Wind Strikes
		},
		
		Debuffs = {

		},
	},

	WARLOCK = {
		Buffs = {
		
		},
		
		Debuffs = {

		},
	},

	WARRIOR = {
		Buffs = {
		
		},
		
		Debuffs = {

		},
	},
}

UnitFrames.CustomAuraFilterAll = {
	Buffs = {
		[GetSpellInfo(207472)] = true, -- Prydaz
		[GetSpellInfo(235966)] = true, -- Velen's Future Sight
		[GetSpellInfo(221796)] = true, -- Bloodthirsty Instinct
		[GetSpellInfo(230152)] = true, -- Legion's Gaze (Eye of Command)
		[GetSpellInfo(228461)] = true, -- Taste of Mana (Gnawed Thumb Ring)
		[GetSpellInfo(221752)] = true, -- Heightened Senses
		[GetSpellInfo(225749)] = true, -- Sign Of The Hippo (Etraeus' Celestial Map)
		[GetSpellInfo(225752)] = true, -- Sign Of The Hare (Etraeus' Celestial Map)
		[GetSpellInfo(225753)] = true, -- Sign Of The Dragon (Etraeus' Celestial Map)
		[GetSpellInfo(229206)] = true, -- Prolonged Power
		[GetSpellInfo(224347)] = true, -- Flask of the Solemn Night
		[GetSpellInfo(65116)] = true,  -- Stoneform (Dwarf Racial)
		[GetSpellInfo(225719)] = true, -- Erratic Metronome
		[GetSpellInfo(190909)] = true, -- Mark Of Claw (Neck Enchant)
		--[GetSpellInfo(242642)] = true, -- Cradle of Anguish
		[GetSpellInfo(242612)] = true, -- Engine of Eradication
	},
	
	Debuffs = {
        --[GetSpellInfo(26013)] = true,  -- Test
        -- Boss Debuffs
        [GetSpellInfo(206617)] = true, -- Time Bomb
	    [GetSpellInfo(206618)] = true, -- Time Bomb
		[GetSpellInfo(212587)] = true, -- Mark of Frost
		[GetSpellInfo(205344)] = true, -- Orb of Destruction
		[GetSpellInfo(218809)] = true, -- Call of Night
		[GetSpellInfo(218342)] = true, -- Parasitic Fixate
		[GetSpellInfo(205649)] = true, -- Fel Ejection
		[GetSpellInfo(206936)] = true, -- Icy Ejection
		[GetSpellInfo(212686)] = true, -- Flames of Sargeras
		-- Trinkets
		[GetSpellInfo(242497)] = true, -- Vial of Ceaseless Toxins
	},
}

function UnitFrames:CustomBuffFilter(unit, icon, name)
	return UnitFrames.CustomAuraFilter[Class].Buffs[name] or UnitFrames.CustomAuraFilterAll.Buffs[name]
end

function UnitFrames:CustomDebuffFilter(unit, icon, name)
	return UnitFrames.CustomAuraFilter[Class].Debuffs[name] or UnitFrames.CustomAuraFilterAll.Debuffs[name]
end