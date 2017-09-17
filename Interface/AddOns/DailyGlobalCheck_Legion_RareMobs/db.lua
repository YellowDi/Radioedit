-- Daily Global Check - WoD Rare Mobs plugin
-- Vildiesel EU-Well of Eternity

local _, addonTable = ...

local nt       = { [518] = 100, [519] = 80, [520] = 60, [521] = 30, [522] = 15 }
local pt       = { [622] = 3, [623] = 6, [624] = 9, [625] = 12, [626] = 15, [627] = 18, [591] = 20, [628] = 21, [629] = 24,
                   [630] = 27, [631] = 30, [632] = 33, [553] = 35, [633] = 36, [634] = 39, [609] = 40, [635] = 42, [636] = 45,
                   [637] = 48, [638] = 51, [639] = 54, [640] = 57, [641] = 60, [556] = 65, [557] = 70 }
local adjust_t = { [-2] = {519, 609, 635}, [-1] = {519, 632, 637}, [1]  = {520, 634, 591}, [2]  = {520, 609, 627},
                   [3]  = {522, 625}, [4]  = {521, 591, 623}, [5]  = {520, 553, 591}, [6]  = {522, 624}, [7]  = {521, 591, 622},
                   [8]  = {520, 609, 625}, [9]  = {522, 623}, [10] = {521, 591}, [11] = {520, 609, 624}, [12] = {522, 622},
                   [13] = {520, 591, 630}, [14] = {520, 609, 623} }

local counter = 0
local function adjustResult(s, diff, maxBonuses)
 if adjust_t[diff] then
  for k,v in pairs(adjust_t[diff]) do
   if counter < maxBonuses then
    s = s..":"..v
    counter = counter + 1
   end
  end
 end
 
 return s
end

local function getNear(a, b, t, maxBonuses)
 local s = ""

 if (a - b < 15 and a - b > -3) then
  s = adjustResult(s, a - b, maxBonuses)
 else 
  local remaining = -math.abs(a - b)
  while counter < maxBonuses do
   local index
   local last_diff = -10000

   for k,v in pairs(t) do
    local diff = remaining + v
    if diff <= 0 and diff > last_diff then
     index = k
     last_diff = diff
    end
   end

   if index then
    remaining = remaining + t[index]
    s = s..":"..index
   else
    break
   end

   local real_diff = t == pt and last_diff or -last_diff
   if real_diff < 15 and real_diff > -3 then
    s = adjustResult(s, real_diff, maxBonuses)
    break
   end
  
   counter = counter + 1
  end
 end

 return s
end

function addonTable:setItemlevel(a, b)
 local s
 counter = 1
 
 if a > b then
  s = getNear(a, b, nt, 15)
 elseif a < b then
  s = getNear(a, b, pt, 15)
 end
 
 if not s then counter = 0 end
 
 return s, counter
end

addonTable.searchTerms = {
 -- krokuun
 [48628] = "talestra^talestra the vile",
 [48666] = "imp mother^laglath^imp mother laglath",
 [48562] = "sathrenael^commander sathrenael",
 [48564] = "endaxis^commander endaxis",
 [48664] = "tereck^selector^tereck the selector",
 [48665] = "tar spitter",
 [48627] = "voraan^siegemaster voraan",
 [48629] = "vagath^vagath betrayed",
 [48565] = "subversia^sister subversia",
 [48667] = "naroua",
 [48561] = "khazaduum",
 [48563] = "vecaya^commander vecaya",

 -- antoran wastes 
 [48821] = "houndmaster^kerrax^houndmaster kerrax",
 [48809] = "puscilla",
 [48970] = "rosula^mother rosula",
 [48865] = "chief alchemist^munculus^chief alchemist munculus",
 [48815] = "vethroz^inquisitor vethroz",
 [49241] = "garzoth^gar'zoth",
 [48817] = "rel'var^relvar^admiral rel'var",
 [48818] = "all-seer^xanarian^all-seer xanarian",
 [49183] = "blistermaw",
 [48810] = "vraxthul^vrax'thul",
 [48811] = "venorn^ven'orn",
 [48812] = "varga",
 [48814] = "yarez^wrath-lord yarez",
 [48820] = "skuul^worldsplitter^worldsplitter skuul",
 [48813] = "xakaar^lieutenant xakaar",
 [48966] = "many faced^the many-faced devourer",
 [49240] = "il'thendra^ilthendra^mistress il'thendra",
 [48968] = "suprax^doomcaster suprax",
 [48967] = "vishax^squadron commander vishax",
 [48824] = "valsuran^void warden valsuran",
 [48816] = "texlaz^commander texlaz",
 [48971] = "rezira^rezira the seer",
 [48822] = "aival^watcher aival",
 
 -- mac'aree
 [48705] = "skyfin^venomtail skyfin",
 [48697] = "kaara^kaara the pale",
 [48707] = "faruq^captain faruq",
 [48721] = "skreeg^skreeg the devourer",
 [48714] = "y'beda^ybeda^overseer y'beda",
 [48935] = "slithon^slithon the last",
 [48713] = "vorsuk^jed'hin champion^jed'hin champion vorsuk",
 [48704] = "kuro^vigilant kuro",
 [48719] = "zul'tan^zultan^ the numerous",
 [48700] = "baruut^baruut the bloodthirsty",
 [48711] = "herald of chaos",
 [48703] = "thanos^vigilant thanos",
 [48718] = "tarahna^instructor tarahna",
 [48695] = "kravos^wrangler kravos",
 [48709] = "ataxon",
 [48706] = "turek^turek the lucid",
 [48717] = "y'morna^ymorna^overseer y'morna",
 [48702] = "feasel^feasel the muffin thief",
 [48693] = "soultwisted^soultwisted monstrosity",
 [48716] = "y'sorna^ysorna^overseer y'sorna",
 [48712] = "sabuul",
 [48720] = "xethgar^commander xethgar",
 [48692] = "voruun^shadowcaster voruun",
 [48708] = "umbraliss",
 [48710] = "sorolis^sorolis the ill-fated",
}

--[[
addonTable.questIDs_to_achi = {
 -- azsuna
 [37726] = {11261, 1}, -- Valyaka the Stormbringer
 [37820] = {11261, 2}, -- Golza the Iron Fin
 [37821] = {11261, 3}, -- Captain Volo'ren
 [37822] = {11261, 4}, -- The Oracle
 [37823] = {11261, 5}, -- Mrrgrl the Tide Reaver
 [37824] = {11261, 6}, -- Flog the Captain-Eater
 [37869] = {11261, 7}, -- Daggerbeak
 [37909] = {11261, 8}, -- Warbringer Mox'na (seek&destroy squad)
 [37928] = {11261, 9}, -- Normantis the Deposed
 [37932] = {11261, 10}, -- Arcavellus
 [37989] = {11261, 11}, -- Syphonus & Leodrath
 [38037] = {11261, 12}, -- Infernal Lord
 [38061] = {11261, 13}, -- Pridelord Meowl
 [38212] = {11261, 14}, -- Brogozog (m&t fel lord)
 [38217] = {11261, 15}, -- Tide Behemoth
 [38238] = {11261, 16}, -- Beacher
 [38352] = {11261, 17}, -- Doomlord Kazrok
 [42069] = {11261, 18}, -- Felwing
 [42221] = {11261, 19}, -- Chief Bitterbrine
 [42450] = {11261, 20}, -- Brawlgoth
 [44108] = {11261, 21}, -- Ragemaw
 [44081] = {11261, 22}, -- Trecherous Stallions
 [42505] = {11261, 23}, -- arcanist shal'iman
 [42280] = {11261, 24}, -- Vorthax
 [42376] = {11261, 25}, -- Inquisitor Tivos
 [37537] = {11261, 26}, -- Ravyn-Drath
 
 -- val'sharah
 [38468] = {11262, 1}, -- Gorebeak
 [38479] = {11262, 2}, -- Seersei
 [38772] = {11262, 3}, -- Theryssia
 [38767] = {11262, 4}, -- Darkshade
 [40080] = {11262, 5}, -- Ironbranch
 [38780] = {11262, 6}, -- Thondrax
 [38887] = {11262, 7}, -- Elindya Featherlight
 [38900] = {11262, 8}, -- antydas nightcaller
 [39121] = {11262, 9}, -- Kiranis Duskwhisper
 [39130] = {11262, 10}, -- Pollous the Fetid (purging the river)
 [40126] = {11262, 11}, -- Grelda the Hag
 [39357] = {11262, 12}, -- Mad Henryk (eileen? old bear trap)
 [39596] = {11262, 13}, -- Perrexx the Corruptor
 [43447] = {11262, 14}, -- Wraithtalon
 [39858] = {11262, 15}, -- Dreadbog
 [40079] = {11262, 16}, -- Lyrath Moonfeather
 [43176] = {11262, 17}, -- Undergrell Ringleader
 [43446] = {11262, 18}, -- Bahagar
 [38466] = {11262, 19}, -- Unguarded Thistleleaf Treasure
 [44070] = {11262, 20}, -- m&t satyr
 
 -- highmountain
 [39435] = {11264, 1}, -- oubdob da smasher
 [39465] = {11264, 2}, -- Skullhat (skywhisker)
 [39646] = {11264, 3}, -- Majestic Elderhorn
 [40347] = {11264, 4}, -- Gurbog da Basher
 [40242] = {11264, 5}, -- Mellok, Son of Torok
 [39762] = {11264, 6}, -- shara
 [39782] = {11264, 7}, -- Tenpak Flametotem (exiled shaman)
 [39784] = {11264, 8}, -- Beastmaster Pao'lek
 [39802] = {11264, 9}, -- Hartli the Snatcher
 [39806] = {11264, 10}, -- crawshuk the hungry 
 [39807] = {11264, 11}, -- the snowbringer
 [40405] = {11264, 12}, -- Bristlemaw (Bristlemaul?)
 [39866] = {11264, 13}, -- Mynta Talonscreech (scout)
 [39872] = {11264, 14}, -- Taurson (the beastly boxer?)
 [39994] = {11264, 15}, -- Crab Rider Grmlrml
 [40406] = {11264, 16}, -- Luggut the Eggeater
 [40096] = {11264, 17}, -- Mrrklr (captured)
 [39766] = {11264, 18}, -- Totally safe treasure chest
 [40175] = {11264, 19}, -- Slumber
 [40413] = {11264, 20}, -- Amateur hunters
 [40414] = {11264, 21}, -- Devouring Darkness
 [40681] = {11264, 22}, -- Sekhan
 [41042] = {11264, 23}, -- champion chomper
 [40423] = {11264, 24}, -- unhetical adventurers
 [40084] = {11264, 25}, -- Bodash the Hoarder
 
 -- stormheim
 [38333] = {11263, 1}, -- Glimar Ironfist
 [38423] = {11263, 2}, -- Stormwing Matriarch
 [38425] = {11263, 3}, -- Fathnyr
 [38431] = {11263, 4}, -- Bladesquall
 [38424] = {11263, 5}, -- Thane Irglov the Merciless (Thane's Mead Hall)
 [38461] = {11263, 6}, -- Fenri
 [38472] = {11263, 7}, -- Whitewater Typhoon
 [38626] = {11263, 8}, -- Bloodstalker Alpha
 [38630] = {11263, 9}, -- Forsaken Deathsquad
 [38642] = {11263, 10}, -- Captain Brvet (Helmouth Raiders)
 [39031] = {11263, 11}, -- Ivory Sentinel
 [38685] = {11263, 12}, -- The Nameless King
 [38774] = {11263, 13}, -- Tiptog the Lost
 [38837] = {11263, 14}, -- Mordvigbjorn
 [38847] = {11263, 15}, -- Urgev the Flayer
 [39120] = {11263, 16}, -- Isel the Hammer
 [39870] = {11263, 17}, -- Soulthirster
 [40068] = {11263, 18}, -- Egyl the Enduring
 [40081] = {11263, 19}, -- Tarben
 [40109] = {11263, 20}, -- Kottr Vondyr
 [40113] = {11263, 21}, -- Grrvrgull the Conqueror
 [42591] = {11263, 22}, -- Hannval the Butcher
 [43342] = {11263, 23}, -- Roteye
 [37908] = {11263, 24}, -- Inquisitor Ernstenbok
 
 [38627] = {11263, 9}, -- Worgen Stalkers

 -- suramar
 [40897] = {11265, 1}, -- Garvrulg
 [41319] = {11265, 2}, -- Elfbane
 [41135] = {11265, 3}, -- Cora'kar
 [40680] = {11265, 4}, -- Rok'nash
 [41136] = {11265, 5}, -- Har'kess the Instatiable
 [43993] = {11265, 6}, -- Hertha Grimdottir
 [44003] = {11265, 7}, -- Reef Lord Raj'his
 [43996] = {11265, 8}, -- Shadowquill
 [43484] = {11265, 9}, -- Rauren
 [43717] = {11265, 10}, -- Artificer Lothaire
 [43968] = {11265, 11}, -- Pinchshank
 [42831] = {11265, 12}, -- Shal'an
 [43348] = {11265, 13}, -- magister phaedris
 [43351] = {11265, 14}, -- Mal'Dreth the Corruptor (corrupter?)
 [43358] = {11265, 15}, -- Myonix
 [43369] = {11265, 16}, -- Siegemaster Aedrin (seigemaster?)
 [43449] = {11265, 17}, -- Oreth the Vile
 [43481] = {11265, 18}, -- arcanist lylandre
 [43495] = {11265, 19}, -- Cadreus (cadraeus?)
 [43542] = {11265, 20}, -- Tideclaw
 [43992] = {11265, 21}, -- gorgroth
 [43580] = {11265, 22}, -- Apothecary Faldren
 [43597] = {11265, 23}, -- Guardian Thor'el
 [43603] = {11265, 24}, -- randril
 [43954] = {11265, 25}, -- Anax
 [43718] = {11265, 26}, -- Matron Hagatha
 [43794] = {11265, 27}, -- ambassador d'vwinn
 [43792] = {11265, 28}, -- Degren (noble)
 [43793] = {11265, 29}, -- miasu
 [44072] = {11265, 30}, -- Maia the White
 [44124] = {11265, 31}, -- Mar'tura
 [40905] = {11265, 32}, -- strathmar
}
]]

function addonTable:GetEligibleItemTypes()
 local _, class = UnitClass("player")
 
 if     class == "ROGUE" then       return {"toy", "pet", "mount", "all", "leather", "agi"}
 elseif class == "DRUID" then       return {"toy", "pet", "mount", "all", "leather", "agi", "int"}
 elseif class == "DEMONHUNTER" then return {"toy", "pet", "mount", "all", "leather", "agi"}
 elseif class == "MONK" then        return {"toy", "pet", "mount", "all", "leather", "agi", "int"}
 elseif class == "MAGE" then        return {"toy", "pet", "mount", "all", "cloth", "int"}
 elseif class == "PRIEST" then      return {"toy", "pet", "mount", "all", "cloth", "int"}
 elseif class == "WARLOCK" then     return {"toy", "pet", "mount", "all", "cloth", "int"}
 elseif class == "SHAMAN" then      return {"toy", "pet", "mount", "all", "mail", "agi", "int"}
 elseif class == "HUNTER" then      return {"toy", "pet", "mount", "all", "mail", "agi"}
 elseif class == "PALADIN" then     return {"toy", "pet", "mount", "all", "plate", "str", "int"}
 elseif class == "DEATHKNIGHT" then return {"toy", "pet", "mount", "all", "plate", "str"}
 elseif class == "WARRIOR" then     return {"toy", "pet", "mount", "all", "plate", "str"}
 else
  return {}
 end
end
