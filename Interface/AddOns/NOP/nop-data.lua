--[[ Data tables ]]
local _
-- [[
local assert = _G.assert
local LibStub = _G.LibStub; assert(LibStub ~= nil,'LibStub')
-- ]]
local ADDON, P = ...
local NOP = LibStub("AceAddon-3.0"):NewAddon(ADDON,"AceConsole-3.0","AceEvent-3.0","AceTimer-3.0") -- load core libs
_G.NOP = NOP
NOP.private = P -- reference to private store
P.PRI_POPUP =  1 -- highlit item
P.PRI_OPEN  =  2 -- open boxes, top priority
P.PRI_POWER =  3 -- artefact power
P.PRI_TOKEN =  4 -- tokens, tribute
P.PRI_REP   =  5 -- reputation tokens
P.PRI_REST  =  6 -- all remaining items
P.PRI_SKIP  = 10 -- all other locked items get this to theirs priority
NOP.T_INSTA_WQ = { -- [spellID] = itemID, list of OH advancements and spells for instant completion non-elite WQ
  [221602] = 140038, -- Might of Dalaran
  [221587] = 140155, -- Vanguard of the Silver Hand
  [221561] = 140158, -- Rift Cannon
}
NOP.T_SPELL_BY_NAME = { -- [itemID] = {{count_to_use,priority},{"sub-Zone",...},{[mapID]=true,...}} table to fetch via GetItemSpell(itemID) for group of items where spell-name is the same
  [137908] = {{1,P.PRI_OPEN},nil,nil}, -- Recipe: Battlebound Armbands, produce spell Learning
  [ 99726] = {{1,P.PRI_OPEN},nil,nil}, -- Create Item, Leggings of the Cursed Vanquisher
  [113355] = {{1,P.PRI_OPEN},nil,nil}, -- Flip Card, Card of Omens
  [112023] = {{1,P.PRI_OPEN},nil,nil}, -- Learning, Recipe: Draenic Philosopher's Stone, all learnable, it should replace most items in table T_RECIPES
  [114171] = {{1,P.PRI_OPEN},nil,nil}, -- Crate Restored Artifact, common for all
  [113271] = {{1,P.PRI_OPEN},nil,nil}, -- Convert to garrison resources, Giant Kaliri Egg, Gain xxx Garrison Resources, common for all
  [128316] = {{1,P.PRI_OPEN},nil,nil}, -- Convert to Oil, Bulging Barrel of Oil,
  [139669] = {{1,P.PRI_POWER},nil,nil}, -- Throw Back, Toss the fish back into the water, granting 50 Artifact Power to your fishing artifact.
  [129097] = {{1,P.PRI_OPEN},nil,nil}, -- 30 Ancient Mana, Ancient Mana Gem
  [140401] = {{1,P.PRI_OPEN},nil,nil}, -- 75 Ancient Mana, Blue Or'ligai Egg
  [140236] = {{1,P.PRI_OPEN},nil,nil}, -- 100 Ancient Mana, 
  [143733] = {{1,P.PRI_OPEN},nil,nil}, -- Ancient Mana Shards
  [143734] = {{1,P.PRI_OPEN},nil,nil}, -- Ancient Mana Crystal Cluster
  [141655] = {{1,P.PRI_OPEN},nil,nil}, -- Shimmering Ancient Mana Cluster
  [140240] = {{1,P.PRI_OPEN},nil,nil}, -- 150 Ancient Mana
  [140242] = {{1,P.PRI_OPEN},nil,nil}, -- 200 Ancient Mana
  [140239] = {{1,P.PRI_OPEN},nil,nil}, -- 300 Ancient Mana
  [140526] = {{1,P.PRI_OPEN},nil,nil}, -- Eredar Signet, Use: Provides a significant increase to character experience.
  [141028] = {{1,P.PRI_OPEN},nil,nil}, -- Grimoire of Knowledge, Use: Open your Followers page and use this item to grant 4000 XP directly to a Champion.
  [146663] = {{1,P.PRI_POWER},nil,nil}, -- Empowering, Soggy Tapestry, 150 artifact power
  [147837] = {{1,P.PRI_TOKEN},nil,nil}, -- Create Relic, Relinquished Life Relic
  [114116] = {{1,P.PRI_REST},{P.SALVAGE_YARD},{[P.FROSTWALL]=true,[P.LUNARFALL]=true}}, -- Create Relic, Relinquished Life Relic
  [116158] = {{1,P.PRI_REST},nil,{[P.FROSTWALL]=true,[P.LUNARFALL]=true}}, -- Toss Fish, Lunarfall Carp, can be used only in garrison shown on button only in garrison.
}
NOP.T_SPELL_BY_USE_TEXT = { -- [spellID] = {{count_to_use,priotity},itemID,{"sub-Zone",...},{[mapID]=true,...}}, table for opening via spell, used for multiple items with same spell text
  [168178] = {{1,P.PRI_REST},114116,{P.SALVAGE_YARD},{[P.FROSTWALL]=true,[P.LUNARFALL]=true}}, -- Salvage, Bag of Salvaged Goods, can be used only in salvage-yard shown on button only in garrison even if disabled zone-lock
  [163769] = {{1,P.PRI_REST},116158,nil,{[P.FROSTWALL]=true,[P.LUNARFALL]=true}}, -- Toss Fish, Lunarfall Carp, can be used only in garrison shown on button only in garrison.
  [233232] = {{1,P.PRI_REST},143748,nil,nil}, -- 25 mana
  [222333] = {{1,P.PRI_REST},139786,nil,nil}, -- 50 mana
}
NOP.T_RECIPES = { -- [ItemId] = {{count_to_use,priority}, "gsub regex" | tooltip-line-number,{"sub-Zone",...},{[mapID]=true,...}, factionID}, item tooltip template only text to 1st match is compared, that mean all items of same school would be looked up.
  [153135] = {{1,P.PRI_TOKEN},4,nil,nil}, -- Unsullied Cloth Robes, why Blizzard did put in type of armor?
  [153143] = {{1,P.PRI_TOKEN},4,nil,nil}, -- Unsullied Plate Breastplate, why Blizzard did put in type of armor?
  [152741] = {{1,P.PRI_TOKEN},4,nil,nil}, -- Unsullied Mail Chestguard, why Blizzard did put in type of armor?
  [153151] = {{1,P.PRI_TOKEN},4,nil,nil}, -- Unsullied Leather Tunic, why Blizzard did put in type of armor?
  [127799] = {{1,P.PRI_TOKEN},4,nil,nil}, -- Baleful Pendant, for another slots than armor.
  [139879] = {{1,P.PRI_OPEN},4,nil,nil}, -- Crate of Champion Equipment, <Right Click to Open>, again new text for open
  [ 82800] = {{1,P.PRI_OPEN},1,nil,nil}, -- Pet Cage
  [140744] = {{1,P.PRI_REST},"(.+:).*",nil,nil}, -- Treasure Map: Azsuna
  [138797] = {{1,P.PRI_REST},"(.+:).*",nil,nil}, -- Illusion: Mongoose
  [122219] = {{1,P.PRI_OPEN},"(.+:).*",nil,nil}, -- Music Roll: Way of the Monk
  [122594] = {{1,P.PRI_OPEN},"(.+:).*",nil,{[P.FROSTWALL]=true,[P.LUNARFALL]=true}}, -- Rush Order: Tailoring Emporium, can be used only in garrison shown on button only in garrison.
  [100865] = {{1,P.PRI_OPEN},"(.+:).*",nil,nil}, -- Plans: Balanced Trillium Ingot and Its Uses, some old recipes has no learning spell
  [118592] = {{2,P.PRI_OPEN},"(.+:).*",nil,nil}, -- Partial Receipt: Gizmothingies
  [128440] = {{1,P.PRI_OPEN},"(.+:).*",nil,nil}, -- Contract: Dowser Goodwell
  [100863] = {{1,P.PRI_OPEN},"(.+:).*",nil,nil}, -- Pattern: Celestial Cloth and Its Uses, some old recipes has no learning spell
  [141064] = {{1,P.PRI_OPEN},"(.+:).*",nil,nil}, -- Technique: Glyph of the Shivarra
  [138865] = {{1,P.PRI_POWER},2,nil,nil}, -- Gladiator's Triumph 2nd line contains "Artifact Power"
  [138883] = {{1,P.PRI_REST},4,nil,nil}, -- 4th line contains Use: Target one of your troops to restore 1 vitality.
  [111972] = {{1,P.PRI_OPEN},2,nil,nil}, -- Enchanter's Study, Level 2, 2nd line contains "Garrison Blueprint"
  [128315] = {{1,P.PRI_REST},2,nil,nil}, -- Medallion of the Legion, 2nd line contains "Use: Crush the medallion, increasing reputation with the denizens of Draenor by 1,000. (1 Sec Cooldown)"
  [127751] = {{1,P.PRI_OPEN},3,nil,nil}, -- Fel-Touched Pet Supplies, 3rd line Use: Open the bag. (1 Sec Cooldown)
  [151638] = {{1,P.PRI_OPEN},2,nil,nil}, -- Leprous Sack of Pet Supplies, 3rd line in german translation is different from Fel-Touched Pet Supplies, so creative ...
  [ 44983] = {{1,P.PRI_OPEN},3,nil,nil}, -- Strand Crawler, 3rd line contains "Use: Teaches you how to summon this companion."
  [104165] = {{1,P.PRI_OPEN},3,nil,nil}, -- Kovok, 3rd line contains "Use: Teaches you how to summon and dismiss this companion."
  [118427] = {{1,P.PRI_OPEN},3,nil,nil}, -- Autographed Hearthstone Card, 3rd line contains "Use: Adds this toy to your toy box."
  [127413] = {{1,P.PRI_OPEN},3,nil,nil}, -- Jeweled Arakkoa Effigy, 3rd line contains "Use: Pry out the eyes of the statue."
  [146748] = {{1,P.PRI_OPEN},3,nil,nil}, -- Highmountain Tribute open containers
  [152958] = {{1,P.PRI_REP},1,nil,nil,2165}, -- Army of the Light Insignia
  [152955] = {{1,P.PRI_REP},1,nil,nil,2165}, -- Greater Army of the Light Insignia
  [152959] = {{1,P.PRI_REP},1,nil,nil,2170}, -- Argussian Reach Insignia
  [152961] = {{1,P.PRI_REP},1,nil,nil,2170}, -- Greater Argussian Reach Insignia
  [141340] = {{1,P.PRI_REP},1,nil,nil,1900}, -- Court of Farondis Insignia
  [141989] = {{1,P.PRI_REP},1,nil,nil,1900}, -- Greater Court of Farondis Insignia 
  [139021] = {{1,P.PRI_REP},1,nil,nil,1883}, -- Dreamweaver Insignia 
  [141988] = {{1,P.PRI_REP},1,nil,nil,1883}, -- Greater Dreamweaver Insignia 
  [139024] = {{1,P.PRI_REP},1,nil,nil,1828}, -- Highmountain Tribe Insignia 
  [141990] = {{1,P.PRI_REP},1,nil,nil,1828}, -- Greater Highmountain Tribe Insignia 
  [146949] = {{1,P.PRI_REP},1,nil,nil,2045}, -- Legionfall Insignia
  [147727] = {{1,P.PRI_REP},1,nil,nil,2045}, -- Greater Legionfall Insignia
  [139026] = {{1,P.PRI_REP},1,nil,nil,1859}, -- Nightfallen Insignia 
  [141992] = {{1,P.PRI_REP},1,nil,nil,1859}, -- Greater Nightfallen Insignia 
  [139020] = {{1,P.PRI_REP},1,nil,nil,1948}, -- Valarjar Insignia 
  [141987] = {{1,P.PRI_REP},1,nil,nil,1948}, -- Greater Valarjar Insignia 
  [141342] = {{1,P.PRI_REP},1,nil,nil,1894}, -- Wardens Insignia
  [141991] = {{1,P.PRI_REP},1,nil,nil,1894}, -- Greater Wardens Insignia
}
NOP.T_ITEMS = { -- [itemID] = {{count_to_use,priority},{"sub-Zone",...},{[mapID]=true,...},auraID}, table for opening/use item by itemID, when is no possible to check for any common text
  [  5523] = {{1,P.PRI_OPEN},nil,nil}, -- Small Barnacled clam
  [  5524] = {{1,P.PRI_OPEN},nil,nil}, -- Thick-shelled clam
  [141071] = {{1,P.PRI_REP},nil,nil}, -- Badge of Honor
  [154879] = {{1,P.PRI_OPEN},nil,nil}, -- Awoken Titan Essence
  [  2934] = {{3,P.PRI_OPEN},nil,nil}, -- Ruined Leather Scraps
  [  7973] = {{1,P.PRI_OPEN},nil,nil}, -- Big-Mouth Clam
  [ 16885] = {{1,P.PRI_OPEN},nil,nil}, -- Heavy Junkbox
  [ 25649] = {{5,P.PRI_OPEN},nil,nil}, -- Knothide Leather Scraps
  [ 32971] = {{1,P.PRI_OPEN},nil,nil}, -- Water Bucket
  [ 33567] = {{5,P.PRI_OPEN},nil,nil}, -- Borean Leather Scraps
  [ 52977] = {{5,P.PRI_OPEN},nil,nil}, -- Savage Leather Scraps
  [ 69838] = {{1,P.PRI_OPEN},nil,nil}, -- Chirping Box
  [ 72162] = {{5,P.PRI_OPEN},nil,nil}, -- Sha-Touched Leather
  [ 78890] = {{1,P.PRI_OPEN},nil,nil}, -- Crystalline Geode
  [ 78891] = {{1,P.PRI_OPEN},nil,nil}, -- Elementium-Coated Geode
  [ 89112] = {{10,P.PRI_REST},nil,nil}, -- Motes of Harmony
  [ 89125] = {{1,P.PRI_OPEN},nil,nil}, -- Sack of Pet Supplies
  [ 91085] = {{1,P.PRI_OPEN},nil,nil}, -- Pet Supplies
  [ 91086] = {{1,P.PRI_OPEN},nil,nil}, -- Pet Supplies
  [ 93146] = {{1,P.PRI_OPEN},nil,nil}, -- Pet Supplies
  [ 93147] = {{1,P.PRI_OPEN},nil,nil}, -- Pet Supplies
  [ 93148] = {{1,P.PRI_OPEN},nil,nil}, -- Pet Supplies
  [ 93149] = {{1,P.PRI_OPEN},nil,nil}, -- Pet Supplies
  [ 94207] = {{1,P.PRI_OPEN},nil,nil}, -- Pet Supplies
  [ 94223] = {{1,P.PRI_REP},nil,nil}, -- Stolen Shado-Pan Insignia
  [ 97512] = {{10,P.PRI_OPEN},nil,nil}, -- Ghost Iron Nugget
  [ 97546] = {{10,P.PRI_OPEN},nil,nil}, -- Kyparite Fragment
  [ 97619] = {{10,P.PRI_OPEN},nil,nil}, -- Torn Green Tea Leaf
  [ 97620] = {{10,P.PRI_OPEN},nil,nil}, -- Rain Poppy Petal
  [ 97621] = {{10,P.PRI_OPEN},nil,nil}, -- Silkweed Stem
  [ 97622] = {{10,P.PRI_OPEN},nil,nil}, -- Snow Lily Petal
  [ 97623] = {{10,P.PRI_OPEN},nil,nil}, -- Fool's Cap Spores
  [ 98095] = {{1,P.PRI_OPEN},nil,nil}, -- Pet Supplies
  [ 98134] = {{1,P.PRI_OPEN},nil,nil}, -- Scenario Loot
  [ 98546] = {{1,P.PRI_OPEN},nil,nil}, -- Scenario Loot
  [103641] = {{1,P.PRI_REST},nil,{[P.TIMELESS_ISLE]=true},147055}, -- Singing Crystal
  [103642] = {{1,P.PRI_REST},nil,{[P.TIMELESS_ISLE]=true},147226}, -- Book of the Ages
  [103643] = {{1,P.PRI_REST},nil,{[P.TIMELESS_ISLE]=true},147476}, -- Dew of Eternal Morning
  [104287] = {{1,P.PRI_REST},nil,{[P.TIMELESS_ISLE]=true},148521}, -- Windfeather Plume
  [108294] = {{10,P.PRI_OPEN},nil,nil}, -- Silver Ore Nugget
  [108295] = {{10,P.PRI_OPEN},nil,nil}, -- Tin Ore Nugget
  [108296] = {{10,P.PRI_OPEN},nil,nil}, -- Gold Ore Nugget
  [108297] = {{10,P.PRI_OPEN},nil,nil}, -- Iron Ore Nugget
  [108298] = {{10,P.PRI_OPEN},nil,nil}, -- Thorium Ore Nugget
  [108299] = {{10,P.PRI_OPEN},nil,nil}, -- Truesilver Ore Nugget
  [108300] = {{10,P.PRI_OPEN},nil,nil}, -- Mithril Ore Nugget
  [108301] = {{10,P.PRI_OPEN},nil,nil}, -- Fel Iron Ore Nugget
  [108302] = {{10,P.PRI_OPEN},nil,nil}, -- Adamantite Ore Nugget
  [108303] = {{10,P.PRI_OPEN},nil,nil}, -- Eternium Ore Nugget
  [108304] = {{10,P.PRI_OPEN},nil,nil}, -- Khorium Ore Nugget
  [108305] = {{10,P.PRI_OPEN},nil,nil}, -- Cobalt Ore Nugget
  [108306] = {{10,P.PRI_OPEN},nil,nil}, -- Saronite Ore Nugget
  [108307] = {{10,P.PRI_OPEN},nil,nil}, -- Obsidium Ore Nugget
  [108308] = {{10,P.PRI_OPEN},nil,nil}, -- Elementium Ore Nugget
  [108309] = {{10,P.PRI_OPEN},nil,nil}, -- Pyrite Ore Nugget
  [108318] = {{10,P.PRI_OPEN},nil,nil}, -- Mageroyal Petal
  [108319] = {{10,P.PRI_OPEN},nil,nil}, -- Earthroot Stem
  [108320] = {{10,P.PRI_OPEN},nil,nil}, -- Briarthorn Bramble
  [108321] = {{10,P.PRI_OPEN},nil,nil}, -- Swiftthistle Leaf
  [108322] = {{10,P.PRI_OPEN},nil,nil}, -- Bruiseweed Stem
  [108323] = {{10,P.PRI_OPEN},nil,nil}, -- Wild Steelbloom Petal
  [108324] = {{10,P.PRI_OPEN},nil,nil}, -- Kingsblood Petal
  [108325] = {{10,P.PRI_OPEN},nil,nil}, -- Liferoot Stem
  [108326] = {{10,P.PRI_OPEN},nil,nil}, -- Khadgar's Whisker Stem
  [108327] = {{10,P.PRI_OPEN},nil,nil}, -- Grave Moss Leaf
  [108328] = {{10,P.PRI_OPEN},nil,nil}, -- Fadeleaf Petal
  [108329] = {{10,P.PRI_OPEN},nil,nil}, -- Dragon's Teeth Stem
  [108330] = {{10,P.PRI_OPEN},nil,nil}, -- Stranglekelp Blade
  [108331] = {{10,P.PRI_OPEN},nil,nil}, -- Goldthorn Bramble
  [108332] = {{10,P.PRI_OPEN},nil,nil}, -- Firebloom Petal
  [108333] = {{10,P.PRI_OPEN},nil,nil}, -- Purple Lotus Petal
  [108334] = {{10,P.PRI_OPEN},nil,nil}, -- Arthas' Tears Petal
  [108335] = {{10,P.PRI_OPEN},nil,nil}, -- Sungrass Stalk
  [108336] = {{10,P.PRI_OPEN},nil,nil}, -- Blindweed Stem
  [108337] = {{10,P.PRI_OPEN},nil,nil}, -- Ghost Mushroom Cap
  [108338] = {{10,P.PRI_OPEN},nil,nil}, -- Gromsblood Leaf
  [108339] = {{10,P.PRI_OPEN},nil,nil}, -- Dreamfoil Blade
  [108340] = {{10,P.PRI_OPEN},nil,nil}, -- Golden Sansam Leaf
  [108341] = {{10,P.PRI_OPEN},nil,nil}, -- Mountain Silversage Stalk
  [108342] = {{10,P.PRI_OPEN},nil,nil}, -- Sorrowmoss Leaf
  [108343] = {{10,P.PRI_OPEN},nil,nil}, -- Icecap Petal
  [108344] = {{10,P.PRI_OPEN},nil,nil}, -- Felweed Stalk
  [108345] = {{10,P.PRI_OPEN},nil,nil}, -- Dreaming Glory Petal
  [108346] = {{10,P.PRI_OPEN},nil,nil}, -- Ragveil Cap
  [108347] = {{10,P.PRI_OPEN},nil,nil}, -- Terocone Leaf
  [108348] = {{10,P.PRI_OPEN},nil,nil}, -- Ancient Lichen Petal
  [108349] = {{10,P.PRI_OPEN},nil,nil}, -- Netherbloom Leaf
  [108350] = {{10,P.PRI_OPEN},nil,nil}, -- Nightmare Vine Stem
  [108351] = {{10,P.PRI_OPEN},nil,nil}, -- Mana Thistle Leaf
  [108352] = {{10,P.PRI_OPEN},nil,nil}, -- Goldclover Leaf
  [108353] = {{10,P.PRI_OPEN},nil,nil}, -- Adder's Tongue Stem
  [108354] = {{10,P.PRI_OPEN},nil,nil}, -- Tiger Lily Petal
  [108355] = {{10,P.PRI_OPEN},nil,nil}, -- Lichbloom Stalk
  [108356] = {{10,P.PRI_OPEN},nil,nil}, -- Icethorn Bramble
  [108357] = {{10,P.PRI_OPEN},nil,nil}, -- Talandra's Rose Petal
  [108358] = {{10,P.PRI_OPEN},nil,nil}, -- Deadnettle Bramble
  [108359] = {{10,P.PRI_OPEN},nil,nil}, -- Fire Leaf Bramble
  [108360] = {{10,P.PRI_OPEN},nil,nil}, -- Cinderbloom Petal
  [108361] = {{10,P.PRI_OPEN},nil,nil}, -- Stormvine Stalk
  [108362] = {{10,P.PRI_OPEN},nil,nil}, -- Azshara's Veil Stem
  [108363] = {{10,P.PRI_OPEN},nil,nil}, -- Heartblossom Petal
  [108364] = {{10,P.PRI_OPEN},nil,nil}, -- Twilight Jasmine Petal
  [108365] = {{10,P.PRI_OPEN},nil,nil}, -- Whiptail Stem
  [108391] = {{10,P.PRI_OPEN},nil,nil}, -- Titanium Ore Nugget
  [109558] = {{1,P.PRI_OPEN},nil,nil}, -- Draenor 700 skills
  [109586] = {{1,P.PRI_OPEN},nil,nil}, -- Draenor 700 skills
  [109624] = {{10,P.PRI_OPEN},nil,nil}, -- Broken Frostweed Stem
  [109625] = {{10,P.PRI_OPEN},nil,nil}, -- Broken Fireweed Stem
  [109626] = {{10,P.PRI_OPEN},nil,nil}, -- Gorgrond Flytrap Ichor
  [109627] = {{10,P.PRI_OPEN},nil,nil}, -- Starflower Petal
  [109628] = {{10,P.PRI_OPEN},nil,nil}, -- Nagrand Arrowbloom Petal
  [109629] = {{10,P.PRI_OPEN},nil,nil}, -- Talador Orchid Petal
  [109991] = {{10,P.PRI_OPEN},nil,nil}, -- True Iron Nugget
  [109992] = {{10,P.PRI_OPEN},nil,nil}, -- Blackrock Fragment
  [110508] = {{1,P.PRI_REST},nil,nil}, -- "Fragrant" Pheromone Fish
  [110610] = {{10,P.PRI_OPEN},nil,nil}, -- Raw Beast Hide Scraps
  [111349] = {{1,P.PRI_OPEN},nil,nil},
  [111350] = {{1,P.PRI_OPEN},nil,nil},
  [111351] = {{1,P.PRI_OPEN},nil,nil},
  [111356] = {{1,P.PRI_OPEN},nil,nil},
  [111364] = {{1,P.PRI_OPEN},nil,nil},
  [111387] = {{1,P.PRI_OPEN},nil,nil},
  [111589] = {{5,P.PRI_OPEN},nil,nil}, [111595] = {{5,P.PRI_OPEN},nil,nil}, [111601] = {{5,P.PRI_OPEN},nil,nil}, -- Crescent Saberfish
  [111650] = {{5,P.PRI_OPEN},nil,nil}, [111669] = {{5,P.PRI_OPEN},nil,nil}, [111676] = {{5,P.PRI_OPEN},nil,nil}, -- Jawless Skulker
  [111651] = {{5,P.PRI_OPEN},nil,nil}, [111668] = {{5,P.PRI_OPEN},nil,nil}, [111675] = {{5,P.PRI_OPEN},nil,nil}, -- Fat Sleeper
  [111652] = {{5,P.PRI_OPEN},nil,nil}, [111667] = {{5,P.PRI_OPEN},nil,nil}, [111674] = {{5,P.PRI_OPEN},nil,nil}, -- Blind Lake Sturgeon
  [111656] = {{5,P.PRI_OPEN},nil,nil}, [111666] = {{5,P.PRI_OPEN},nil,nil}, [111673] = {{5,P.PRI_OPEN},nil,nil}, -- Fire Ammonite
  [111658] = {{5,P.PRI_OPEN},nil,nil}, [111665] = {{5,P.PRI_OPEN},nil,nil}, [111672] = {{5,P.PRI_OPEN},nil,nil}, -- Sea Scorpion
  [111659] = {{5,P.PRI_OPEN},nil,nil}, [111664] = {{5,P.PRI_OPEN},nil,nil}, [111671] = {{5,P.PRI_OPEN},nil,nil}, -- Abyssal Gulper Eel
  [111662] = {{5,P.PRI_OPEN},nil,nil}, [111663] = {{5,P.PRI_OPEN},nil,nil}, [111670] = {{5,P.PRI_OPEN},nil,nil}, -- Blackwater Whiptail
  [111921] = {{1,P.PRI_OPEN},nil,nil},
  [111922] = {{1,P.PRI_OPEN},nil,nil},
  [111923] = {{1,P.PRI_OPEN},nil,nil},
  [112087] = {{1,P.PRI_OPEN},nil,nil}, -- Obsidian Frostwolf Petroglyph
  [112158] = {{10,P.PRI_OPEN},nil,nil}, -- Icy Dragonscale Fragment
  [112177] = {{10,P.PRI_OPEN},nil,nil}, -- Nerubian Chitin Fragment
  [112178] = {{10,P.PRI_OPEN},nil,nil}, -- Jormungar Scale Fragment
  [112179] = {{10,P.PRI_OPEN},nil,nil}, -- Patch of Thick Clefthoof Leather
  [112180] = {{10,P.PRI_OPEN},nil,nil}, -- Patch of Crystal Infused Leather
  [112181] = {{10,P.PRI_OPEN},nil,nil}, -- Fel Scale Fragment
  [112182] = {{10,P.PRI_OPEN},nil,nil}, -- Patch of Fel Hide
  [112183] = {{10,P.PRI_OPEN},nil,nil}, -- Nether Dragonscale Fragment
  [112184] = {{10,P.PRI_OPEN},nil,nil}, -- Cobra Scale Fragment
  [112185] = {{10,P.PRI_OPEN},nil,nil}, -- Wind Scale Fragment
  [113992] = {{1,P.PRI_OPEN},nil,nil}, -- Scribe's Research Notes
  [114002] = {{1,P.PRI_OPEN},nil,nil}, -- Encoded Message
  [115356] = {{1,P.PRI_OPEN},nil,nil},
  [115357] = {{1,P.PRI_OPEN},nil,nil},
  [115358] = {{1,P.PRI_OPEN},nil,nil},
  [115359] = {{1,P.PRI_OPEN},nil,nil},
  [115504] = {{10,P.PRI_OPEN},nil,nil}, -- Fractured Temporal Crystal
  [115510] = {{300,P.PRI_OPEN},nil,nil}, -- Elemental Rune
  [115981] = {{1,P.PRI_OPEN},nil,nil}, -- Abrogator Stone Cluster
  [118267] = {{1,P.PRI_OPEN},nil,nil}, -- Ravenmother Offering
  [118697] = {{1,P.PRI_OPEN},nil,nil}, -- Pet Supplies
  [118897] = {{1,P.PRI_REST},{P.MINE_HORDE,P.MINE_ALLIANCE},nil,176049}, -- Miner's Coffee
  [118903] = {{1,P.PRI_REST},{P.MINE_HORDE,P.MINE_ALLIANCE},nil,176061}, -- Preserved Mining Pick
  [120301] = {{1,P.PRI_OPEN},nil,nil}, [120302] = {{1,P.PRI_OPEN},nil,nil}, -- Create Armor Enhancement, Weapon Boost
  [120321] = {{1,P.PRI_OPEN},nil,nil}, -- Mystery Bag
  [122514] = {{1,P.PRI_OPEN},nil,nil}, -- Mission Completion Orders
  [122535] = {{1,P.PRI_OPEN},nil,nil}, -- Traveler's Pet Supplies
  [122599] = {{1,P.PRI_OPEN},nil,nil}, -- Tome of Sorcerous Elements
  [122605] = {{1,P.PRI_OPEN},nil,nil}, -- Tome of the Stones
  [128225] = {{1,P.PRI_OPEN},nil,nil}, -- Empowered Apexis Fragment
  [128294] = {{1,P.PRI_OPEN},nil,nil}, -- Trade Agreement: Arakkoa Outcasts
  [128373] = {{1,P.PRI_OPEN},{P.SHIPYARD_HORDE,P.SHIPYARD_ALLIANCE},{[P.FROSTFIRE_RIDGE]=true,[P.SHADOWMOON_VALLEY]=true}}, -- Rush Order: Shipyard, special handling for sub-zone
  [128446] = {{1,P.PRI_OPEN},nil,nil}, -- Saberstalker Teachings: Trailblazer
  [128488] = {{1,P.PRI_OPEN},nil,nil}, -- Ship: The Awakener
  [128490] = {{1,P.PRI_OPEN},nil,nil}, -- Blueprint: Oil Rig
  [128980] = {{1,P.PRI_OPEN},nil,nil}, -- Scroll of Forgotten Knowledge
  [132523] = {{1,P.PRI_REST},nil,nil}, -- Reaves Battery
  [136269] = {{1,P.PRI_OPEN},nil,nil}, -- Kel'danath's Manaflask
  [136342] = {{100,P.PRI_OPEN},nil,nil},-- Obliterum Ash
  [136412] = {{1,P.PRI_OPEN},nil,nil}, -- Heavy Armor Set
  [136806] = {{1,P.PRI_OPEN},nil,nil}, -- Glass of Arcwine
  [137207] = {{1,P.PRI_OPEN},nil,nil}, -- Fortified Armor Set
  [137208] = {{1,P.PRI_OPEN},nil,nil}, -- Indestructible Armor Set
  [138410] = {{1,P.PRI_REST},nil,nil}, -- Summoning Portal
  [139010] = {{1,P.PRI_OPEN},nil,nil}, -- Petrified Silkweave
  [139011] = {{1,P.PRI_OPEN},nil,nil}, -- Berserking Helm of Ondry'el
  [139017] = {{1,P.PRI_OPEN},nil,nil}, -- Soothing Leystone Shard
  [139018] = {{1,P.PRI_OPEN},nil,nil}, -- Box of Calming Whispers
  [139019] = {{1,P.PRI_OPEN},nil,nil}, -- Spellmask of Alla'onus
  [139027] = {{1,P.PRI_OPEN},nil,nil}, -- Lenses of Spellseer Dellian
  [139028] = {{1,P.PRI_REST},nil,nil}, -- Disc of the Starcaller
  [139177] = {{1,P.PRI_REST},nil,nil}, -- Shattered Soul
  [139419] = {{1,P.PRI_REST},nil,nil}, -- Golden Banana
  [139428] = {{1,P.PRI_REST},nil,nil}, -- A Master Plan
  [139591] = {{1,P.PRI_REST},nil,nil}, -- Stolen Tome of Artifact Lore
  [139670] = {{1,P.PRI_REST},nil,nil}, -- Scream of the Dead
  [139786] = {{1,P.PRI_OPEN},nil,nil}, -- 25 mana
  [140156] = {{1,P.PRI_REST},nil,nil}, -- Blessing of the Order
  [140260] = {{1,P.PRI_OPEN},nil,nil}, -- Arcane Remnant of Falanaar
  [140326] = {{1,P.PRI_OPEN},nil,nil}, -- Enchanted Burial Urn
  [140327] = {{1,P.PRI_OPEN},nil,nil}, -- Kyrtos's Research Notes
  [140328] = {{1,P.PRI_OPEN},nil,nil}, -- Volatile Leyline Crystal
  [140329] = {{1,P.PRI_OPEN},nil,nil}, -- Infinite Stone
  [140397] = {{1,P.PRI_OPEN},nil,nil,223670}, -- G'Hanir's Blossom
  [140439] = {{1,P.PRI_OPEN},nil,nil,223722}, -- Sunblossom Pollen
  [140448] = {{1,P.PRI_REST},nil,nil}, -- Lens of Qin'dera
  [140450] = {{1,P.PRI_OPEN},nil,nil}, -- Berserking Helm of Taenna
  [140451] = {{1,P.PRI_OPEN},nil,nil}, -- Spellmask of Azsylla
  [140749] = {{1,P.PRI_REST},nil,nil}, -- Horn of Winter
  [140760] = {{1,P.PRI_REST},nil,nil}, -- Libram of Truth
  [140767] = {{5,P.PRI_REST},nil,nil}, -- Pile of Bits and Bones
  [140922] = {{1,P.PRI_REST},nil,nil}, -- Imp Pact
  [140924] = {{1,P.PRI_REST},nil,nil}, -- Ashtongue Beacon
  [140925] = {{1,P.PRI_REST},nil,nil}, -- Enchanted Bark
  [140926] = {{1,P.PRI_REST},nil,nil}, -- Bowmen's Orders
  [140927] = {{1,P.PRI_REST},nil,nil}, -- Water Globe
  [140928] = {{1,P.PRI_REST},nil,nil}, -- Ox Initiate's Pledge
  [140929] = {{1,P.PRI_REST},nil,nil}, -- Squire's Oath
  [140932] = {{1,P.PRI_REST},nil,nil}, -- Earthen Mark
  [140933] = {{1,P.PRI_REST},nil,nil}, -- Runed Aspirant's Band
  [141870] = {{1,P.PRI_OPEN},nil,nil}, -- Arcane Tablet of Falanaar
  [142156] = {{1,P.PRI_OPEN},nil,nil}, -- Order Resources Cache
  [142156] = {{1,P.PRI_OPEN},nil,nil}, -- Order Resources Cache
  [142363] = {{1,P.PRI_REST},nil,nil}, -- Mark of Prey
  [142447] = {{1,P.PRI_OPEN},nil,nil}, -- Torn Sack of Pet Supplies
  [143605] = {{1,P.PRI_REST},nil,nil}, -- Strange Ball of Energy
  [143748] = {{1,P.PRI_OPEN},nil,nil}, -- Ancient Mana Crystal
  [143849] = {{1,P.PRI_REST},nil,nil}, -- Summon Royal Guard
  [143850] = {{1,P.PRI_REST},nil,nil}, -- Summon Grimtotem Warrior
  [143852] = {{1,P.PRI_REST},nil,nil}, -- Lucky Rabbit's Foot
  [146757] = {{10,P.PRI_OPEN},nil,nil},-- Prepared Ingredients
  [147348] = {{1,P.PRI_REST},nil,nil}, -- Bulky Armor Set
  [147349] = {{1,P.PRI_REST},nil,nil}, -- Spiked Armor Set
  [147350] = {{1,P.PRI_REST},nil,nil}, -- Invincible Armor Set
  [147351] = {{1,P.PRI_REST},nil,nil}, -- Fel Armor Enhancement Token
  [147384] = {{1,P.PRI_REST},nil,nil}, -- Legionfall Recompense
  [147416] = {{1,P.PRI_OPEN},nil,nil}, -- Arcane Tablet of Falanaar
  [147418] = {{1,P.PRI_OPEN},nil,nil}, -- Arcane Remnant of Falanaar
  [147729] = {{1,P.PRI_OPEN},nil,nil}, -- Netherchunk
  [147860] = {{1,P.PRI_REST},nil,nil}, -- Empowered Elven Tome
  [150737] = {{1,P.PRI_OPEN},nil,nil}, -- Abundant Order Resources Cache
  [151653] = {{10,P.PRI_OPEN},nil,nil}, -- Broken Isles Recipe Scrap
  [151842] = {{1,P.PRI_REST},nil,nil}, -- Krokul Armor Set
  [151843] = {{1,P.PRI_REST},nil,nil}, -- Mac'Aree Armor Set
  [151844] = {{1,P.PRI_REST},nil,nil}, -- Xenedar Armor Set
  [152095] = {{1,P.PRI_REST},nil,nil}, -- Krokul Ridgestalker
  [152096] = {{1,P.PRI_REST},nil,nil}, -- Void-Purged Krokul
  [152097] = {{1,P.PRI_REST},nil,nil}, -- Lightforged Bulwark
  [152998] = {{1,P.PRI_OPEN},nil,nil}, -- Carefully Hidden Muffin
  [153113] = {{1,P.PRI_REP},nil,{[1135] = true, [1170] = true, [1171] = true}}, -- Demon's Soulstone, usable on Argus maps
  [153114] = {{1,P.PRI_REST},nil,nil}, -- Nathrezim Tome of Manipulation
}
NOP.T_SPELL_FIND = {} -- ["spell"] = {count_to_use,priority}
NOP.T_RECIPES_FIND = {} --  [itemID] = {{count_to_use,priority},"pattern",{"sub-ZoneName","sub-ZoneName"},{[mapID]=true,[mapID]=true}} it will be filled with paterns
NOP.T_OPEN = nil -- ["tooltip-string"] = {{count_to_use,priority},{"sub-ZoneName","sub-ZoneName"},{[mapID]=true,[mapID]=true}}, items by open-spell in tooltip
NOP.T_BLACKLIST = {} -- [itemID] = true, items blacklisted from right-click
NOP.T_BLACKLIST_Q = {} -- [itemID] = true, items blacklisted from right-click
NOP.T_USE = {} -- [itemID] = {{count_to_use,priority},{"sub-zone",...},{[mapID]=true,...},aura,stamp,count_in_bags} /run foreach(NOP.T_USE,print)
NOP.T_CHECK = {} -- already checked items [itemID] = true
NOP.T_REPS = {} -- [item.name] = factionID, item names and factionID hash table to show them in tooltip
P.T_BAGS = {} -- bags cache
P.T_PICK = {} -- lockpicking cache