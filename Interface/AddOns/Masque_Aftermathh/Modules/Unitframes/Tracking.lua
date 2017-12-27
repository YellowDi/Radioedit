local A, C, M, L = select(2, ...):unpack()

local UnitFrames = A["UnitFrames"]

do
	UnitFrames.BuffsTracking = {
	    PRIEST = {
		    {6788, "TOPRIGHT", {1, 0, 0}, true},	             -- Weakened Soul
		    {33076, "BOTTOMRIGHT", {0.2, 0.7, 0.2}},             -- Prayer of Mending
		    {139, "BOTTOMLEFT", {0.4, 0.7, 0.2}},                -- Renew
		    {152118, "BOTTOMLEFT", {0.4, 0.7, 0.2}},             -- Renew
		    {17, "TOPLEFT", {0.81, 0.85, 0.1}, true},            -- Power Word: Shield
	    },
	
	    DRUID = {
		    {774, "TOPLEFT", {0.8, 0.4, 0.8}},                   -- Rejuvenation
		    {155777, "LEFT", {0.8, 0.4, 0.8}},                   -- Germination
		    {8936, "TOPRIGHT", {0.2, 0.8, 0.2}},                 -- Regrowth
		    {33763, "BOTTOMLEFT", {0.4, 0.8, 0.2}},              -- Lifebloom
		    {48438, "BOTTOMRIGHT", {0.8, 0.4, 0}},               -- Wild Growth
	    },
	
	    PALADIN = {
		    {53563, "TOPLEFT", {0.7, 0.3, 0.7}},	             -- Beacon of Light
		    {156910, "TOPLEFT", {0.7, 0.3, 0.7}},	             -- Beacon of Faith
		    {1022, "BOTTOMRIGHT", {0.2, 0.2, 1}, true}, 	     -- Hand of Protection
		    {1044, "BOTTOMRIGHT", {0.89, 0.45, 0}, true},	     -- Hand of Freedom
		    {6940, "BOTTOMRIGHT", {0.89, 0.1, 0.1}, true},	     -- Hand of Sacrifice
		    {114163, "BOTTOMLEFT", {0.81, 0.85, 0.1}},	         -- Eternal Flame
		    {223306, "BOTTOMLEFT", {0.81, 0.85, 0.1}},	         -- Sacred Shield
	    },
	
	    SHAMAN = {
		    {61295, "TOPLEFT", {0.7, 0.3, 0.7}},                 -- Riptide
			{207778, "BOTTOMLEFT", {0.2, 0.8, 0.2}},             -- Gift Of The Queen
			{204288, "TOPRIGHT", {0.4, 0.8, 0.2}},               -- Earth Shield (PvP)
			{207400, "BOTTOMRIGHT", {0.7, 0.4, 0}},              -- Ancestral Vigor
	    },
	
	    MONK = {
		    {119611, "TOPLEFT", {0.8, 0.4, 0.8}},	             -- Renewing Mist
		    {116849, "TOPRIGHT", {0.2, 0.8, 0.2}},	             -- Life Cocoon
		    {191840, "TOPRIGHT", {0.2, 0.8, 0.2}},	             -- Essence Font
			{216915, "TOPRIGHT", {0.2, 0.8, 0.2}},	             -- Fortuned Turned PvP
		    {124682, "BOTTOMLEFT", {0.4, 0.8, 0.2}},             -- Enveloping Mist
		    {227345, "BOTTOMLEFT", {0.4, 0.8, 0.2}},             -- Enveloping Mist PvP
		    {115175, "BOTTOMRIGHT", {0.7, 0.4, 0}},              -- Snoothing Mist
		    {209525, "BOTTOMRIGHT", {0.7, 0.4, 0}},              -- Snoothing Mist PvP
	    },
	
	    ALL = {
	    },
	}
end

UnitFrames.RaidDebuffsTracking = {

    -- Legion --
    [GetSpellInfo(221772)] = 6, -- Overflow

	---------------------------
	-- The Emerald Nightmare --
    ---------------------------
	
    -- Nythendra
	[GetSpellInfo(204504)] = 6, -- Infested
	[GetSpellInfo(205043)] = 6, -- Infested mind
	[GetSpellInfo(203096)] = 6, -- Rot
	[GetSpellInfo(204463)] = 6, -- Volatile Rot
	[GetSpellInfo(203045)] = 6, -- Infested Ground
	[GetSpellInfo(203646)] = 6, -- Burst of Corruption

    -- Elerethe Renferal
	[GetSpellInfo(210228)] = 6, -- Dripping Fangs
	[GetSpellInfo(215307)] = 6, -- Web of Pain
	[GetSpellInfo(215300)] = 6, -- Web of Pain
	[GetSpellInfo(215460)] = 6, -- Necrotic Venom
	[GetSpellInfo(213124)] = 6, -- Venomous Pool
	[GetSpellInfo(210850)] = 6, -- Twisting Shadows
	[GetSpellInfo(215489)] = 6, -- Venomous Pool

    -- Il'gynoth, Heart of the Corruption
	[GetSpellInfo(208929)] = 6, -- Spew Corruption
	[GetSpellInfo(210984)] = 6, -- Eye of Fate
	[GetSpellInfo(209469)] = 7, -- Touch of Corruption
	[GetSpellInfo(208697)] = 6, -- Mind Flay

    -- Ursoc
	[GetSpellInfo(198108)] = 6, -- Unbalanced
	[GetSpellInfo(197943)] = 6, -- Overwhelm
	[GetSpellInfo(204859)] = 6, -- Rend Flesh
	[GetSpellInfo(205611)] = 6, -- Miasma
	[GetSpellInfo(198006)] = 6, -- Focused Gaze
	[GetSpellInfo(197980)] = 6, -- Nightmarish Cacophony

    -- Dragons of Nightmare
	[GetSpellInfo(203102)] = 6, -- Mark of Ysondre
	[GetSpellInfo(203121)] = 6, -- Mark of Taerar
	[GetSpellInfo(203125)] = 6, -- Mark of Emeriss
	[GetSpellInfo(203124)] = 6, -- Mark of Lethon
	[GetSpellInfo(204731)] = 7, -- Wasting Dread
	[GetSpellInfo(203110)] = 7, -- Slumbering Nightmare
	[GetSpellInfo(207681)] = 7, -- Nightmare Bloom
	[GetSpellInfo(205341)] = 7, -- Sleeping Fog
	[GetSpellInfo(203770)] = 7, -- Defiled Vines
	[GetSpellInfo(203787)] = 7, -- Volatile Infection

    -- Cenarius
	[GetSpellInfo(210279)] = 5, -- Creeping Nightmares
	[GetSpellInfo(213162)] = 6, -- Nightmare Blast
	[GetSpellInfo(210315)] = 6, -- Nightmare Brambles
	[GetSpellInfo(212681)] = 6, -- Cleansed Ground
	[GetSpellInfo(211507)] = 6, -- Nightmare Javelin
	[GetSpellInfo(211471)] = 6, -- Scorned Touch
	[GetSpellInfo(211612)] = 6, -- Replenishing Roots
	[GetSpellInfo(216516)] = 6, -- Ancient Dream

    -- Xavius
	[GetSpellInfo(206005)] = 5, -- Dream Simulacrum
	[GetSpellInfo(206651)] = 7, -- Darkening Soul
	[GetSpellInfo(209158)] = 7, -- Blackening Soul
	[GetSpellInfo(211802)] = 6, -- Nightmare Blades
	[GetSpellInfo(206109)] = 6, -- Awakening to the Nightmare
	[GetSpellInfo(209034)] = 6, -- Bonds of Terror
	[GetSpellInfo(210451)] = 6, -- Bonds of Terror
	[GetSpellInfo(208431)] = 6, -- Corruption: Descent into Madness
	[GetSpellInfo(207409)] = 6, -- Madness
	[GetSpellInfo(211634)] = 6, -- The Infinite Dark
	[GetSpellInfo(208385)] = 6, -- Tainted Discharge
	
	-------------------
    -- The Nighthold --
	-------------------
	
    -- Skorpyron
	[GetSpellInfo(204766)] = 6, -- Energy Surge
	[GetSpellInfo(214718)] = 6, -- Acidic Fragments
	[GetSpellInfo(211801)] = 6, -- Volatile Fragments
	[GetSpellInfo(204284)] = 6, -- Broken Shard (Protection)
	[GetSpellInfo(204275)] = 6, -- Arcanoslash (Tank)
	[GetSpellInfo(211659)] = 6, -- Arcane Tether (Tank debuff)
	[GetSpellInfo(204483)] = 6, -- Focused Blast (Stun)

    -- Chronomatic Anomaly
	[GetSpellInfo(206607)] = 6, -- Chronometric Particles (Tank stack debuff)
	[GetSpellInfo(206609)] = 6, -- Time Release (Heal buff/debuff)
	[GetSpellInfo(205653)] = 6, -- Passage of Time
	[GetSpellInfo(206617)] = 6, -- Time Bomb
	[GetSpellInfo(206618)] = 6, -- Time Bomb
	[GetSpellInfo(207871)] = 6, -- Vortex (Mythic)
	[GetSpellInfo(212099)] = 6, -- Temporal Charge

    -- Trilliax
	[GetSpellInfo(206488)] = 6, -- Arcane Seepage
	[GetSpellInfo(206641)] = 6, -- Arcane Spear (Tank)
	[GetSpellInfo(206798)] = 6, -- Toxic Slice
	[GetSpellInfo(214672)] = 6, -- Annihilation
	[GetSpellInfo(214573)] = 6, -- Stuffed
	[GetSpellInfo(214583)] = 6, -- Sterilize
	[GetSpellInfo(208910)] = 6, -- Arcing Bonds
	[GetSpellInfo(206838)] = 6, -- Succulent Feast

    -- Spellblade Aluriel
	[GetSpellInfo(212492)] = 6, -- Annihilate (Tank)
	[GetSpellInfo(212494)] = 6, -- Annihilated (Main Tank debuff)
	[GetSpellInfo(212587)] = 6, -- Mark of Frost
	[GetSpellInfo(212531)] = 6, -- Mark of Frost (marked)
	[GetSpellInfo(212530)] = 6, -- Replicate: Mark of Frost
	[GetSpellInfo(212647)] = 6, -- Frostbitten
	[GetSpellInfo(212736)] = 6, -- Pool of Frost
	[GetSpellInfo(213085)] = 6, -- Frozen Tempest
	[GetSpellInfo(213621)] = 6, -- Entombed in Ice
	[GetSpellInfo(213148)] = 6, -- Searing Brand Chosen
	[GetSpellInfo(213181)] = 6, -- Searing Brand Stunned
	[GetSpellInfo(213166)] = 6, -- Searing Brand
	[GetSpellInfo(213278)] = 6, -- Burning Ground
	[GetSpellInfo(213504)] = 6, -- Arcane Fog

    -- Tichondrius
	[GetSpellInfo(206480)] = 6, -- Carrion Plague
	[GetSpellInfo(215988)] = 6, -- Carrion Nightmare
	[GetSpellInfo(208230)] = 6, -- Feast of Blood
	[GetSpellInfo(212794)] = 6, -- Brand of Argus
	[GetSpellInfo(216685)] = 6, -- Flames of Argus
	[GetSpellInfo(206311)] = 6, -- Illusionary Night
	[GetSpellInfo(206466)] = 6, -- Essence of Night
	[GetSpellInfo(216024)] = 6, -- Volatile Wound
	[GetSpellInfo(216027)] = 6, -- Nether Zone
	[GetSpellInfo(216039)] = 6, -- Fel Storm
	[GetSpellInfo(216726)] = 6, -- Ring of Shadows
	[GetSpellInfo(216040)] = 6, -- Burning Soul

    -- Krosus
	[GetSpellInfo(206677)] = 6, -- Searing Brand
	[GetSpellInfo(205344)] = 6, -- Orb of Destruction

    -- High Botanist Tel'arn
	[GetSpellInfo(218503)] = 6, -- Recursive Strikes (Tank)
	[GetSpellInfo(219235)] = 6, -- Toxic Spores
	[GetSpellInfo(218809)] = 6, -- Call of Night
	[GetSpellInfo(218342)] = 6, -- Parasitic Fixate
	[GetSpellInfo(218304)] = 6, -- Parasitic Fetter
	[GetSpellInfo(218780)] = 6, -- Plasma Explosion

    -- Star Augur Etraeus
	[GetSpellInfo(205984)] = 6, -- Gravitaional Pull
	[GetSpellInfo(214167)] = 6, -- Gravitaional Pull
	[GetSpellInfo(214335)] = 6, -- Gravitaional Pull
	[GetSpellInfo(206936)] = 6, -- Icy Ejection
	[GetSpellInfo(206388)] = 6, -- Felburst
	[GetSpellInfo(206585)] = 6, -- Absolute Zero
	[GetSpellInfo(206398)] = 6, -- Felflame
	[GetSpellInfo(206589)] = 6, -- Chilled
	[GetSpellInfo(205649)] = 6, -- Fel Ejection
	[GetSpellInfo(206965)] = 6, -- Voidburst
	[GetSpellInfo(206464)] = 6, -- Coronal Ejection
	[GetSpellInfo(207143)] = 6, -- Void Ejection
	[GetSpellInfo(206603)] = 6, -- Frozen Solid
	[GetSpellInfo(207720)] = 6, -- Witness the Void
	[GetSpellInfo(216697)] = 6, -- Frigid Pulse

    -- Grand Magistrix Elisande
	[GetSpellInfo(209166)] = 6, -- Fast Time
	[GetSpellInfo(211887)] = 6, -- Ablated
	[GetSpellInfo(209615)] = 6, -- Ablation
	[GetSpellInfo(209244)] = 6, -- Delphuric Beam
	[GetSpellInfo(209165)] = 6, -- Slow Time
	[GetSpellInfo(209598)] = 6, -- Conflexive Burst
	[GetSpellInfo(209433)] = 6, -- Spanning Singularity
	[GetSpellInfo(209973)] = 6, -- Ablating Explosion
	[GetSpellInfo(209549)] = 6, -- Lingering Burn
	[GetSpellInfo(211261)] = 6, -- Permaliative Torment
	[GetSpellInfo(208659)] = 6, -- Arcanetic Ring

    -- Gul'dan
	[GetSpellInfo(210339)] = 6, -- Time Dilation
	[GetSpellInfo(180079)] = 6, -- Felfire Munitions
	[GetSpellInfo(206875)] = 6, -- Fel Obelisk (Tank)
	[GetSpellInfo(206840)] = 6, -- Gaze of Vethriz
	[GetSpellInfo(206896)] = 6, -- Torn Soul
	[GetSpellInfo(206221)] = 6, -- Empowered Bonds of Fel
	[GetSpellInfo(208802)] = 6, -- Soul Corrosion
	[GetSpellInfo(212686)] = 6, -- Flames of Sargeras
	
	--------------------
	-- Trial of Valor --
	--------------------
	
	-- Odyn
	[GetSpellInfo(228030)] = 6, -- Expel Light (need aura)
	[GetSpellInfo(227807)] = 6, -- Storm of Justice
	[GetSpellInfo(228918)] = 6, -- Stormforged Spear
	[GetSpellInfo(227490)] = 6, -- Branded
	[GetSpellInfo(227491)] = 6, -- Branded
	[GetSpellInfo(227498)] = 6, -- Branded
	[GetSpellInfo(227499)] = 6, -- Branded
	[GetSpellInfo(227500)] = 6, -- Branded
	[GetSpellInfo(231297)] = 6, -- Runic Brand (Mythic Only)

	-- Guarm
	[GetSpellInfo(228228)] = 5, -- Flame Lick
	[GetSpellInfo(228248)] = 7, -- Frost Lick
	[GetSpellInfo(228253)] = 6, -- Shadow Lick

	-- Helya
	[GetSpellInfo(228883)] = 6, -- Unholy Reckoning (Trash)
	[GetSpellInfo(228054)] = 7, -- Taint of the Sea
	[GetSpellInfo(229119)] = 6, -- Orb of Corruption
	[GetSpellInfo(228058)] = 6, -- Orb of Corrosion
	[GetSpellInfo(193367)] = 6, -- Fetid Rot
	[GetSpellInfo(227982)] = 6, -- Bilewater Redox
}