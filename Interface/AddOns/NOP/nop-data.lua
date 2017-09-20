--[[ Data tables ]]
local _
local ADDON, private = ...
NOP = LibStub("AceAddon-3.0"):NewAddon(ADDON,"AceConsole-3.0","AceEvent-3.0","AceTimer-3.0") -- load core libs
NOP.T_SPELL_BY_NAME = { -- [itemID] = count_to_use, table to fetch via GetItemSpell(itemID) for group of items where spell-name is the same
  [  7973] = 1, -- Open the clam!, Big-Mouth Clam
  [113355] = 1, -- Flip Card, Card of Omens
  [112023] = 1, -- Learning, Recipe: Draenic Philosopher's Stone, all learnable, it should replace most items in table T_RECIPES
  [114171] = 1, -- Crate Restored Artifact, common for all
  [113271] = 1, -- Convert to garrison resources, Giant Kaliri Egg, Gain xxx Garrison Resources, common for all
  [128316] = 1, -- Convert to Oil, Bulging Barrel of Oil,
  [139669] = 1, -- Toss the fish back into the water, granting 50 Artifact Power to your fishing artifact.
  [129097] = 1, -- 30 Ancient Mana, Ancient Mana Gem
  [140401] = 1, -- 75 Ancient Mana, Blue Or'ligai Egg
  [140236] = 1, -- 100 Ancient Mana, 
  [140240] = 1, -- 150 Ancient Mana
  [140242] = 1, -- 200 Ancient Mana
  [140239] = 1, -- 300 Ancient Mana
  [140526] = 1, -- Eredar Signet, Use: Provides a significant increase to character experience.
  [141028] = 1, -- Grimoire of Knowledge, Use: Open your Followers page and use this item to grant 4000 XP directly to a Champion.
  [146663] = 1, -- Empowering, Soggy Tapestry, 150 artifact power
}
NOP.T_SPELL_BY_USE_TEXT = { -- [spellID] = {count_to_use,itemID,{"sub-Zone",...},{[mapID]=true,...}}, table for opening via spell, used for multiple items with same spell text
  [243074] = {1,147837,nil,nil}, -- Create a Broken Isles relic appropriate for your loot specialization. Relinquished Relic
  [242864] = {1,147801,nil,nil}, -- Create a Broken Isles item appropriate for your loot specialization. Relinquished Trinket
  [168701] = {1,114105,nil,nil}, -- Create a soulbound item appropriate for your loot specialization, Tormented Trinket
  [168178] = {1,114116,{private.SALVAGE_YARD},{[private.FROSTWALL]=true,[private.LUNARFALL]=true}}, -- Salvage, Bag of Salvaged Goods, can be used only in salvage-yard shown on button only in garrison even if disabled zone-lock
  [ 58165] = {1,  7973,nil,nil},  -- Open the clam!, Big-Mouth Clam
  [166550] = {1,113355,nil,nil},  -- Flip Card, Card of Omens
  [163769] = {1,116158,nil,{[private.FROSTWALL]=true,[private.LUNARFALL]=true}}, -- Toss Fish, Lunarfall Carp, can be used only in garrison shown on button only in garrison.
  [233232] = {1,143748,nil,nil}, -- 25 mana
  [193080] = {1,129097,nil,nil}, -- 30 mana
  [222333] = {1,139786,nil,nil}, -- 50 mana
  [223677] = {1,140401,nil,nil}, -- 75 mana
  [222942] = {1,140236,nil,nil}, -- 100 mana
  [222947] = {1,140240,nil,nil}, -- 150 mana
  [222950] = {1,140242,nil,nil}, -- 200 mana
  [222945] = {1,140239,nil,nil}, -- 300 mana
}
NOP.T_RECIPES = { -- [ItemId] = {count_to_use, "gsub regex" | tooltip-line-number,{"sub-Zone",...},{[mapID]=true,...}}, item tooltip template only text to 1st match is compared, that mean all items of same school would be looked up.
  [ 82800] = {1,1,nil}, -- Pet Cage
  [140744] = {1,"(.+:).*",nil,nil}, -- Treasure Map: Azsuna
  [122219] = {1,"(.+:).*",nil,nil}, -- Music Roll: Way of the Monk
  [122594] = {1,"(.+:).*",nil,{[private.FROSTWALL]=true,[private.LUNARFALL]=true}}, -- Rush Order: Tailoring Emporium, can be used only in garrison shown on button only in garrison.
  [100865] = {1,"(.+:).*",nil,nil}, -- Plans: Balanced Trillium Ingot and Its Uses, some old recipes has no learning spell
  [118592] = {2,"(.+:).*",nil,nil}, -- Partial Receipt: Gizmothingies
  [128440] = {1,"(.+:).*",nil,nil}, -- Contract: Dowser Goodwell
  [100863] = {1,"(.+:).*",nil,nil}, -- Pattern: Celestial Cloth and Its Uses, some old recipes has no learning spell
  [138865] = {1,2,nil,nil}, -- Gladiator's Triumph 2nd line contains "Artifact Power"
  [138883] = {1,4,nil,nil}, -- 4th line contains Use: Target one of your troops to restore 1 vitality.
  [111972] = {1,2,nil,nil}, -- Enchanter's Study, Level 2, 2nd line contains "Garrison Blueprint"
  [128315] = {1,2,nil,nil}, -- Medallion of the Legion, 2nd line contains "Use: Crush the medallion, increasing reputation with the denizens of Draenor by 1,000. (1 Sec Cooldown)"
  [127751] = {1,3,nil,nil}, -- Fel-Touched Pet Supplies, 3rd line Use: Open the bag. (1 Sec Cooldown)
  [44983]  = {1,3,nil,nil}, -- Strand Crawler, 3rd line contains "Use: Teaches you how to summon this companion."
  [104165] = {1,3,nil,nil}, -- Kovok, 3rd line contains "Use: Teaches you how to summon and dismiss this companion."
  [118427] = {1,3,nil,nil}, -- Autographed Hearthstone Card, 3rd line contains "Use: Adds this toy to your toy box."
  [127413] = {1,3,nil,nil}, -- Jeweled Arakkoa Effigy, 3rd line contains "Use: Pry out the eyes of the statue."
  [146748] = {1,3,nil,nil}, -- Highmountain Tribute open containers
  [152958] = {1,1,nil}, -- Army of the Light Insignia
  [152959] = {1,1,nil}, -- Argussian Reach Insignia
  [139023] = {1,1,nil}, -- Court of Farondis Insignia 
  [139021] = {1,1,nil}, -- Dreamweaver Insignia 
  [139024] = {1,1,nil}, -- Highmountain Tribe Insignia 
  [139026] = {1,1,nil}, -- Nightfallen Insignia 
  [139020] = {1,1,nil}, -- Valarjar Insignia 
  [141340] = {1,1,nil}, -- Court of Farondis Insignia BoA
  [141339] = {1,1,nil}, -- Dreamweaver Insignia BoA
  [141341] = {1,1,nil}, -- Highmountain Tribe Insignia BoA
  [141343] = {1,1,nil}, -- Nightfallen Insignia BoA
  [141338] = {1,1,nil}, -- Valarjar Insignia BoA
  [141342] = {1,1,nil}, -- Wardens Insignia BoA
  [141989] = {1,1,nil}, -- Greater Court of Farondis Insignia 
  [141988] = {1,1,nil}, -- Greater Dreamweaver Insignia 
  [141990] = {1,1,nil}, -- Greater Highmountain Tribe Insignia 
  [141992] = {1,1,nil}, -- Greater Nightfallen Insignia 
  [141987] = {1,1,nil}, -- Greater Valarjar Insignia 
  [141991] = {1,1,nil}, -- Greater Wardens Insignia
  [147727] = {1,1,nil}, -- Greater Legionfall Insignia
}
NOP.T_ITEMS = { -- [itemID] = {count_to_use,{"sub-Zone",...},{[mapID]=true,...},auraID}, table for opening/use item by itemID, is no possible to check any common text
  [152096] = {1,nil,nil}, -- Void-Purged Krokul
  [152095] = {1,nil,nil}, -- Krokul Ridgestalker
  [140760] = {1,nil,nil}, -- Libram of Truth
  [151653] = {10,nil,nil}, -- Broken Isles Recipe Scrap
  [ 94223] = {1,nil,nil}, -- Stolen Shado-Pan Insignia
  [151423] = {1,nil,nil}, -- Stabilized Titan Essence
  [150737] = {1,nil,nil}, -- Abundant Order Resources Cache
  [142363] = {1,nil,nil}, -- Mark of Prey
  [139591] = {1,nil,nil}, -- Stolen Tome of Artifact Lore
  [139428] = {1,nil,nil}, -- A Master Plan
  [140749] = {1,nil,nil}, -- Horn of Winter
  [140767] = {5,nil,nil}, -- Pile of Bits and Bones
  [144433] = {1,nil,nil}, -- Artifact Research Compendium: Volumes I
  [144434] = {1,nil,nil}, -- Artifact Research Compendium: Volumes I-II
  [144431] = {1,nil,nil}, -- Artifact Research Compendium: Volumes I-III
  [144435] = {1,nil,nil}, -- Artifact Research Compendium: Volumes I-IV
  [147852] = {1,nil,nil}, -- Artifact Research Compendium: Volumes I-V
  [147853] = {1,nil,nil}, -- Artifact Research Compendium: Volumes I-VI
  [147854] = {1,nil,nil}, -- Artifact Research Compendium: Volumes I-VII
  [147855] = {1,nil,nil}, -- Artifact Research Compendium: Volumes I-VIII
  [147856] = {1,nil,nil}, -- Artifact Research Compendium: Volumes I-IX
  [128373] = {1,{private.SHIPYARD_HORDE,private.SHIPYARD_ALLIANCE},{[private.FROSTFIRE_RIDGE]=true,[private.SHADOWMOON_VALLEY]=true}}, -- Rush Order: Shipyard, special handling for sub-zone
  [136806] = {1,nil,nil}, -- Glass of Arcwine
  [147729] = {1,nil,nil}, -- Netherchunk
  [136342] = {100,nil,nil},-- Obliterum Ash
  [146757] = {10,nil,nil},-- Prepared Ingredients
  [146949] = {1,nil,nil}, -- Legionfall Insignia
  [146950] = {1,nil,nil}, -- Legionfall Insignia
  [147350] = {1,nil,nil}, -- Invincible Armor Set
  [147349] = {1,nil,nil}, -- Spiked Armor Set
  [147348] = {1,nil,nil}, -- Bulky Armor Set
  [147384] = {1,nil,nil}, -- Legionfall Recompense
  [147860] = {1,nil,nil}, -- Empowered Elven Tome
  [146745] = {1,nil,nil}, -- Artifacet Research Notes
  [140327] = {1,nil,nil}, -- Kyrtos's Research Notes
  [136269] = {1,nil,nil}, -- Kel'danath's Manaflask
  [140448] = {1,nil,nil}, -- Lens of Qin'dera
  [139025] = {1,nil,nil}, -- Wardens Insignia
  [139028] = {1,nil,nil}, -- Disc of the Starcaller
  [ 69838] = {1,nil,nil}, -- Chirping Box
  [ 89125] = {1,nil,nil}, -- Sack of Pet Supplies
  [ 16885] = {1,nil,nil}, -- Heavy Junkbox
  [ 78890] = {1,nil,nil}, -- Crystalline Geode
  [ 78891] = {1,nil,nil}, -- Elementium-Coated Geode
  [ 98134] = {1,nil,nil}, -- Scenario Loot
  [ 98546] = {1,nil,nil}, -- Scenario Loot
  [ 93146] = {1,nil,nil}, -- Pet Supplies
  [ 93147] = {1,nil,nil}, -- Pet Supplies
  [ 93148] = {1,nil,nil}, -- Pet Supplies
  [ 93149] = {1,nil,nil}, -- Pet Supplies
  [ 94207] = {1,nil,nil}, -- Pet Supplies
  [118697] = {1,nil,nil}, -- Pet Supplies
  [ 98095] = {1,nil,nil}, -- Pet Supplies
  [ 91085] = {1,nil,nil}, -- Pet Supplies
  [ 91086] = {1,nil,nil}, -- Pet Supplies
  [ 89112] = {10,nil,nil}, -- Motes of Harmony
  [  2934] = {3,nil,nil}, -- Ruined Leather Scraps
  [ 25649] = {5,nil,nil}, -- Knothide Leather Scraps
  [ 33567] = {5,nil,nil}, -- Borean Leather Scraps
  [ 52977] = {5,nil,nil}, -- Savage Leather Scraps
  [ 72162] = {5,nil,nil}, -- Sha-Touched Leather
  [ 97512] = {10,nil,nil}, -- Ghost Iron Nugget
  [ 97546] = {10,nil,nil}, -- Kyparite Fragment
  [115504] = {10,nil,nil}, -- Fractured Temporal Crystal
  [108294] = {10,nil,nil}, -- Silver Ore Nugget
  [108295] = {10,nil,nil}, -- Tin Ore Nugget
  [108296] = {10,nil,nil}, -- Gold Ore Nugget
  [108297] = {10,nil,nil}, -- Iron Ore Nugget
  [108298] = {10,nil,nil}, -- Thorium Ore Nugget
  [108299] = {10,nil,nil}, -- Truesilver Ore Nugget
  [108300] = {10,nil,nil}, -- Mithril Ore Nugget
  [108301] = {10,nil,nil}, -- Fel Iron Ore Nugget
  [108302] = {10,nil,nil}, -- Adamantite Ore Nugget
  [108303] = {10,nil,nil}, -- Eternium Ore Nugget
  [108304] = {10,nil,nil}, -- Khorium Ore Nugget
  [108305] = {10,nil,nil}, -- Cobalt Ore Nugget
  [108306] = {10,nil,nil}, -- Saronite Ore Nugget
  [108307] = {10,nil,nil}, -- Obsidium Ore Nugget
  [108308] = {10,nil,nil}, -- Elementium Ore Nugget
  [108309] = {10,nil,nil}, -- Pyrite Ore Nugget
  [108391] = {10,nil,nil}, -- Titanium Ore Nugget
  [109991] = {10,nil,nil}, -- True Iron Nugget
  [109992] = {10,nil,nil}, -- Blackrock Fragment
  [110610] = {10,nil,nil}, -- Raw Beast Hide Scraps
  [112158] = {10,nil,nil}, -- Icy Dragonscale Fragment
  [112177] = {10,nil,nil}, -- Nerubian Chitin Fragment
  [112178] = {10,nil,nil}, -- Jormungar Scale Fragment
  [112179] = {10,nil,nil}, -- Patch of Thick Clefthoof Leather
  [112180] = {10,nil,nil}, -- Patch of Crystal Infused Leather
  [112181] = {10,nil,nil}, -- Fel Scale Fragment
  [112182] = {10,nil,nil}, -- Patch of Fel Hide
  [112183] = {10,nil,nil}, -- Nether Dragonscale Fragment
  [112184] = {10,nil,nil}, -- Cobra Scale Fragment
  [112185] = {10,nil,nil}, -- Wind Scale Fragment
  [111589] = {5,nil,nil}, [111595] = {5,nil,nil}, [111601] = {5,nil,nil}, -- Crescent Saberfish
  [111659] = {5,nil,nil}, [111664] = {5,nil,nil}, [111671] = {5,nil,nil}, -- Abyssal Gulper Eel
  [111652] = {5,nil,nil}, [111667] = {5,nil,nil}, [111674] = {5,nil,nil}, -- Blind Lake Sturgeon
  [111662] = {5,nil,nil}, [111663] = {5,nil,nil}, [111670] = {5,nil,nil}, -- Blackwater Whiptail
  [111658] = {5,nil,nil}, [111665] = {5,nil,nil}, [111672] = {5,nil,nil}, -- Sea Scorpion
  [111651] = {5,nil,nil}, [111668] = {5,nil,nil}, [111675] = {5,nil,nil}, -- Fat Sleeper
  [111656] = {5,nil,nil}, [111666] = {5,nil,nil}, [111673] = {5,nil,nil}, -- Fire Ammonite
  [111650] = {5,nil,nil}, [111669] = {5,nil,nil}, [111676] = {5,nil,nil}, -- Jawless Skulker
  [118267] = {1,nil,nil}, -- Ravenmother Offering
  [120301] = {1,nil,nil}, [120302] = {1,nil,nil}, -- Create Armor Enhancement, Weapon Boost
  [113992] = {1,nil,nil}, -- Scribe's Research Notes
  [115981] = {1,nil,nil}, -- Abrogator Stone Cluster
  [118897] = {1,{private.MINE_HORDE,private.MINE_ALLIANCE},nil,176049}, -- Miner's Coffee
  [118903] = {1,{private.MINE_HORDE,private.MINE_ALLIANCE},nil,176061}, -- Preserved Mining Pick
  [111356] = {1,nil,nil},
  [111364] = {1,nil,nil},
  [111387] = {1,nil,nil},
  [111350] = {1,nil,nil},
  [111349] = {1,nil,nil},
  [111351] = {1,nil,nil},
  [115357] = {1,nil,nil},
  [109558] = {1,nil,nil}, -- Draenor 700 skills
  [111923] = {1,nil,nil},
  [115358] = {1,nil,nil},
  [115356] = {1,nil,nil},
  [115359] = {1,nil,nil},
  [111921] = {1,nil,nil},
  [111922] = {1,nil,nil},
  [109586] = {1,nil,nil}, -- Draenor 700 skills
  [120321] = {1,nil,nil}, -- Mystery Bag
  [122535] = {1,nil,nil}, -- Traveler's Pet Supplies
  [ 97619] = {10,nil,nil}, -- Torn Green Tea Leaf
  [ 97620] = {10,nil,nil}, -- Rain Poppy Petal
  [ 97621] = {10,nil,nil}, -- Silkweed Stem
  [ 97622] = {10,nil,nil}, -- Snow Lily Petal
  [ 97623] = {10,nil,nil}, -- Fool's Cap Spores
  [108318] = {10,nil,nil}, -- Mageroyal Petal
  [108319] = {10,nil,nil}, -- Earthroot Stem
  [108320] = {10,nil,nil}, -- Briarthorn Bramble
  [108321] = {10,nil,nil}, -- Swiftthistle Leaf
  [108322] = {10,nil,nil}, -- Bruiseweed Stem
  [108323] = {10,nil,nil}, -- Wild Steelbloom Petal
  [108324] = {10,nil,nil}, -- Kingsblood Petal
  [108325] = {10,nil,nil}, -- Liferoot Stem
  [108326] = {10,nil,nil}, -- Khadgar's Whisker Stem
  [108327] = {10,nil,nil}, -- Grave Moss Leaf
  [108328] = {10,nil,nil}, -- Fadeleaf Petal
  [108329] = {10,nil,nil}, -- Dragon's Teeth Stem
  [108330] = {10,nil,nil}, -- Stranglekelp Blade
  [108331] = {10,nil,nil}, -- Goldthorn Bramble
  [108332] = {10,nil,nil}, -- Firebloom Petal
  [108333] = {10,nil,nil}, -- Purple Lotus Petal
  [108334] = {10,nil,nil}, -- Arthas' Tears Petal
  [108335] = {10,nil,nil}, -- Sungrass Stalk
  [108336] = {10,nil,nil}, -- Blindweed Stem
  [108337] = {10,nil,nil}, -- Ghost Mushroom Cap
  [108338] = {10,nil,nil}, -- Gromsblood Leaf
  [108339] = {10,nil,nil}, -- Dreamfoil Blade
  [108340] = {10,nil,nil}, -- Golden Sansam Leaf
  [108341] = {10,nil,nil}, -- Mountain Silversage Stalk
  [108342] = {10,nil,nil}, -- Sorrowmoss Leaf
  [108343] = {10,nil,nil}, -- Icecap Petal
  [108344] = {10,nil,nil}, -- Felweed Stalk
  [108345] = {10,nil,nil}, -- Dreaming Glory Petal
  [108346] = {10,nil,nil}, -- Ragveil Cap
  [108347] = {10,nil,nil}, -- Terocone Leaf
  [108348] = {10,nil,nil}, -- Ancient Lichen Petal
  [108349] = {10,nil,nil}, -- Netherbloom Leaf
  [108350] = {10,nil,nil}, -- Nightmare Vine Stem
  [108351] = {10,nil,nil}, -- Mana Thistle Leaf
  [108352] = {10,nil,nil}, -- Goldclover Leaf
  [108353] = {10,nil,nil}, -- Adder's Tongue Stem
  [108354] = {10,nil,nil}, -- Tiger Lily Petal
  [108355] = {10,nil,nil}, -- Lichbloom Stalk
  [108356] = {10,nil,nil}, -- Icethorn Bramble
  [108357] = {10,nil,nil}, -- Talandra's Rose Petal
  [108358] = {10,nil,nil}, -- Deadnettle Bramble
  [108359] = {10,nil,nil}, -- Fire Leaf Bramble
  [108360] = {10,nil,nil}, -- Cinderbloom Petal
  [108361] = {10,nil,nil}, -- Stormvine Stalk
  [108362] = {10,nil,nil}, -- Azshara's Veil Stem
  [108363] = {10,nil,nil}, -- Heartblossom Petal
  [108364] = {10,nil,nil}, -- Twilight Jasmine Petal
  [108365] = {10,nil,nil}, -- Whiptail Stem
  [109624] = {10,nil,nil}, -- Broken Frostweed Stem
  [109625] = {10,nil,nil}, -- Broken Fireweed Stem
  [109626] = {10,nil,nil}, -- Gorgrond Flytrap Ichor
  [109627] = {10,nil,nil}, -- Starflower Petal
  [109628] = {10,nil,nil}, -- Nagrand Arrowbloom Petal
  [109629] = {10,nil,nil}, -- Talador Orchid Petal
  [115510] = {300,nil,nil}, -- Elemental Rune
  [128490] = {1,nil,nil}, -- Blueprint: Oil Rig
  [128446] = {1,nil,nil}, -- Saberstalker Teachings: Trailblazer
  [122514] = {1,nil,nil}, -- Mission Completion Orders
  [112087] = {1,nil,nil}, -- Obsidian Frostwolf Petroglyph
  [128488] = {1,nil,nil}, -- Ship: The Awakener
  [128225] = {1,nil,nil}, -- Empowered Apexis Fragment
  [110508] = {1,nil,nil}, -- "Fragrant" Pheromone Fish
   [32971] = {1,nil,nil}, -- Water Bucket
  [128294] = {1,nil,nil}, -- Trade Agreement: Arakkoa Outcasts
  [114002] = {1,nil,nil}, -- Encoded Message
  [103641] = {1,nil,{[private.TIMELESS_ISLE]=true},147055}, -- Singing Crystal
  [103642] = {1,nil,{[private.TIMELESS_ISLE]=true},147226}, -- Book of the Ages
  [103643] = {1,nil,{[private.TIMELESS_ISLE]=true},147476}, -- Dew of Eternal Morning
  [104287] = {1,nil,{[private.TIMELESS_ISLE]=true},148521}, -- Windfeather Plume
  [122599] = {1,nil,nil}, -- Tome of Sorcerous Elements
  [122605] = {1,nil,nil}, -- Tome of the Stones
  [140397] = {1,nil,nil,223670}, -- G'Hanir's Blossom
  [140439] = {1,nil,nil,223722}, -- Sunblossom Pollen
  [140260] = {1,nil,nil}, -- Arcane Remnant of Falanaar
  [141870] = {1,nil,nil}, -- Arcane Tablet of Falanaar
  [147418] = {1,nil,nil}, -- Arcane Remnant of Falanaar
  [147416] = {1,nil,nil}, -- Arcane Tablet of Falanaar
  [139010] = {1,nil,nil}, -- Petrified Silkweave
  [139017] = {1,nil,nil}, -- Soothing Leystone Shard
  [136412] = {1,nil,nil}, -- Heavy Armor Set
  [137207] = {1,nil,nil}, -- Fortified Armor Set
  [137208] = {1,nil,nil}, -- Indestructible Armor Set
  [142156] = {1,nil,nil}, -- Order Resources Cache
  [140451] = {1,nil,nil}, -- Spellmask of Azsylla
  [140329] = {1,nil,nil}, -- Infinite Stone
  [139027] = {1,nil,nil}, -- Lenses of Spellseer Dellian
  [139011] = {1,nil,nil}, -- Berserking Helm of Ondry'el
  [140450] = {1,nil,nil}, -- Berserking Helm of Taenna
  [142447] = {1,nil,nil}, -- Torn Sack of Pet Supplies
  [142156] = {1,nil,nil}, -- Order Resources Cache
  [140326] = {1,nil,nil}, -- Enchanted Burial Urn
  [140328] = {1,nil,nil}, -- Volatile Leyline Crystal
  [139018] = {1,nil,nil}, -- Box of Calming Whispers
  [140156] = {1,nil,nil}, -- Blessing of the Order
  [139019] = {1,nil,nil}, -- Spellmask of Alla'onus
}
NOP.T_SPELL_FIND = {} -- ["spell"] = count_to_use
NOP.T_RECIPES_FIND = {} --  [itemID] = {count_to_use,"pattern",{"sub-ZoneName","sub-ZoneName"},{[mapID]=true,[mapID]=true}} it will be filled with paterns
NOP.T_OPEN = {} -- ["tooltip-string"] = {count_to_use,{"sub-ZoneName","sub-ZoneName"},{[mapID]=true,[mapID]=true}}, items by open-spell in tooltip
NOP.T_BLACKLIST = {} -- [itemID] = true, items blacklisted from right-click
NOP.T_BLACKLIST_Q = {} -- [itemID] = true, items blacklisted from right-click
NOP.T_USE = {} -- [itemID] = {count_to_use,priority,{"sub-zone",...},{[mapID]=true,...},aura,stamp,count_in_bags} /run foreach(NOP.T_USE,print)
NOP.T_CHECK = {} -- already checked items [itemID] = true

