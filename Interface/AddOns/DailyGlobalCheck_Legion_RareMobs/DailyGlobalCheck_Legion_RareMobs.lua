-- Daily Global Check - Legion Rare Mobs plugin
-- Vildiesel EU-Well of Eternity

local addonName, addonTable = ...

local Z = DailyGlobalCheck.Z

local questsdata = {}
local questIDs_to_achi = {}
--local questIDs_to_achi = addonTable.questIDs_to_achi

local mobs_icon = "Interface\\WorldMap\\Skull_64Red"

local list = {
 ["Title"] = "Legion Rare Mobs",
 ["Icon"]  = "Interface\\Icons\\Ability_Hunter_Camouflage",
 ["Options"] = {{"Radiobutton","Show every Argus rare",true},
                {"Radiobutton","Only Argus rares with toy, pet or mount",false}},
 ["Version"] = 1004,
 ["Order"] = {
			    -- Azsuna
				{
				{Z[1015],37537,38037,44108,37726,37869,37989,37823,37821,42450,37820,37932,37824,42221,38217,37822,42069,42825,38061,38212,38238,38352,37928,38268,37909,44081,42417,44670,42286,42280,42376,42505,38365,44671,42699},
				},
                -- Val'Sharah
			    {
				{Z[1018],38887,38468,38889,39596,38479,38772,40126,39130,38780,39858,38767,43176,39357,43446,43447,40079,40080,42816,39121,38900,38466,44070,42575},
				},
				-- Highmountain
   			    {
				{Z[1024],39435,39963,40681,39802,40414,39872,39465,39782,39784,40405,39994,40096,40347,40175,39646,40242,40413,39866,40773,39235,40406,40084,39766,39762,39806,40423},
				},
                -- Stormheim
			    {
				{Z[1017],38472,38774,38333,38423,42591,38431,38425,38847,40081,38642,43342,38837,38685,39120,39031,38626,40068,42437,40113,38424,37908,40109,38630,38627,38625,43343,38712,39048,40398},
				{Z[1022],39870,38461},
				},
                -- Suramar
			    {
				{Z[1033],41786,44003,43369,44072,43792,43580,43993,43597,43495,43954,42831,43449,40680,41319,40897,43542,43996,43717,43484,41135,41136,43968,43718,43351,43358,44124,43348,44675,43603,43794,40905,43481,43793,43992,44669,44676},
				},
                -- Broken Shore
                {
                {Z[1021],47133,46202,46092,46096,46098,46304,46093,46100,46099,46094,46313,46095,47001,47036,46951,47028,46090,46102,46091,46101,47068,46097,46953,46965,47026,46995}
                },
                -- Argus 1 (Krokuun, Antoraan Wastes)
                {
                {Z[1135]},
                {Z[1171]},
                },
                -- Argus 2 (Mac'Aree)
                {
                {Z[1170]}
                },
			 },
 }
 
 
-- argus only
local argus_order_cache = {{Z[1135],48628,48666,48562,48564,48664,48665,48627,48629,48565,48667,48561,48563},
                           {Z[1171],48821,48809,48970,48865,48815,49241,48817,48818,49183,48810,48811,48812,48814,48820,48813,48966,49240,48968,48967,48824,48816,48971,48822},
                           {Z[1170],48705,48697,48707,48721,48714,48935,48713,48704,48719,48700,48711,48703,48718,48695,48709,48706,48717,48702,48693,48716,48712,48720,48692,48708,48710},}
                          
local function onOptionChanged(i)
 local svar = DailyGlobalCheck_PluginData["Legion Rare Mobs"]
 local o = list.Order
 local maps = DailyGlobalCheck.MapFunctions
 local showall

 if not svar or not svar.options or svar.options[1] == nil then
  showall = true
 else
  showall = svar.options[1]
 end

 local t
 for k,data in pairs(argus_order_cache) do
  -- moved mac'aree to another page to avoid cluttering
  t = k == 3 and o[8][1] or o[7][k]
  wipe(t)
  t[1] = data[1]
  for j = 2, #data do
   if showall then
    t[#t + 1] = data[j]
   elseif questsdata[data[j]].t_type then
    if questsdata[data[j]].t_type == "toy" or questsdata[data[j]].t_type == "mount" or questsdata[data[j]].t_type == "pet" then
     t[#t + 1] = data[j]
    end
   end 
  end
 end
 
 maps:UpdateList("worldmap", list, true)
 maps:UpdateList("minimap", list, true)
end
 
local eligible_item_types
local itemlevels = {[98] = 675, [99] = 685, [100] = 695, [101] = 705, [102] = 715, [103] = 725, [104] = 735, [105] = 745,
                    [106] = 755, [107] = 765, [108] = 775, [109] = 785, [110] = 785}    

local function update_overlay_info(_, _, newlevel)
 local itemlevel, timerset
 local function scaleItem(itemID, t, suff, fixedilvl, try)
  
  if not tContains(eligible_item_types, t) then
   return suff
  end
  
  local name, _, _, ilvl = GetItemInfo(itemID)
  if name then
   local bonuses, numBonuses = addonTable:setItemlevel(ilvl, fixedilvl or itemlevel)
   if suff then
    return "|Hitem:"..itemID.."::::::::96:70::3:"..numBonuses..(bonuses or "").."|h["..name.."]|h~"..suff
   else
    return "|Hitem:"..itemID.."::::::::96:70::3:"..numBonuses..(bonuses or "").."|h["..name.."]|h"
   end
  else
   if (try or 0) < 3 and not timerset then
    timerset = true
    C_Timer.After(1, function() timerset = false update_overlay_info() end)
   end
   return suff
  end
 end

 eligible_item_types = addonTable:GetEligibleItemTypes()
 itemlevel = itemlevels[newlevel or UnitLevel("player")] or 660
 for k,v in pairs(questsdata) do
  if v.t_itemid then
   v[13] = scaleItem(v.t_itemid, v.t_type, v.t_info, v.t_fixedilvl)
  else
   v[13] = v.t_info
  end
 end
end

local function GenerateData()

 local function setup_localization()
  for k,achi_info in pairs(questIDs_to_achi) do
   local data = questsdata[k]
   local name = data[2]
   local icon = data[8]

   local achiID, criteria = unpack(achi_info)
   if GetAchievementInfo(achiID) then
    local description, _, completed = GetAchievementCriteriaInfo(achiID, criteria)
    name = description
    --icon = completed and mobs_icon_d or mobs_icon_g
   end
   --if name ~= data[2] then print("nome diverso da achi, confrontare", k, "|cffff0000", data[2], "|cff00ff00", name, "|r", criteria) end
   data[2] = name
   data[8] = mobs_icon
  end
 end

 local faction = DailyGlobalCheck.player_faction or UnitFactionGroup("player")
 local function showally()
  return faction == "Alliance"
 end
 
 local function showhorde()
  return faction == "Horde"
 end
 
 local function showshaman()
  local _, class = UnitClass("player")
  return class == "SHAMAN"
 end
 
 local q = questsdata

 local azs = Z[1015]
 local val = Z[1018]
 local high= Z[1024]
 local dal = Z[1014]
 local sur = Z[1033]
 local sto = Z[1017]
 local hel = Z[1022]
 local bro = Z[1021]
 -- argus
 local kro = Z[1135]
 local ant = Z[1171]
 local mac = Z[1170]

 local arrowup = "Interface\\Minimap\\Vehicle-SilvershardMines-Arrow"
 local missing_icon = "interface\\worldmap\\SkullGear_64Grey"
 local bone_icon = "interface\\icons\\INV_Misc_Bone_01"
 
 local cave_entrance = DailyGlobalCheck.template_cave_entrance
 
 -- Argus
 -- Krokuun
 q[48628] = {kro,"Talestra the Vile"        ,nil,nil,{1135, 54.8 , 81.31},nil,nil,mobs_icon}
 q[48666] = {kro,"Imp Mother Laglath"       ,nil,nil,{1135, 42.34, 69.83},nil,nil,mobs_icon}
 q[48562] = {kro,"Commander Sathrenael"     ,nil,nil,{1135, 33.19, 76.12},nil,nil,mobs_icon}
 q[48564] = {kro,"Commander Endaxis"        ,nil,nil,{1135, 45.39, 58.77},nil,nil,mobs_icon}
 q[48664] = {kro,"Tereck the Selector"      ,nil,nil,{1135, 69.29, 59.47},nil,nil,mobs_icon, t_info = "In the cave"}
 q[48665] = {kro,"Tar Spitter"              ,nil,nil,{1135, 70.18, 81.24},nil,nil,mobs_icon}
 q[48627] = {kro,"Siegemaster Voraan"       ,nil,nil,{1135, 58.31, 75.69},nil,nil,mobs_icon}
 q[48629] = {kro,"Vagath the Betrayed"      ,nil,nil,{1135, 60.89, 19.6 },nil,nil,mobs_icon}
 q[48565] = {kro,"Sister Subversia"         ,nil,nil,{1135, 52.87, 31.08},nil,nil,mobs_icon, t_itemid = 153124, t_type = "toy"}
 q[48667] = {kro,"Naroua"                   ,nil,nil,{1135, 71.06, 32.72},nil,nil,mobs_icon, t_itemid = 153190, t_type = "pet"}
 q[48561] = {kro,"Khazaduum"                ,nil,nil,{1135, 50.58, 17.71},nil,nil,mobs_icon, t_info = "At the end of the hallway"}
 q[48563] = {kro,"Commander Vecaya"         ,nil,nil,{1135, 38.36, 59.52, nil, 1135, 41.2, 56.76, {icon=arrowup, desc="Up here"}},nil,nil,mobs_icon, t_info = "On the Xenedar"}
 
 -- Antoran Wastes 
 q[48821] = {ant,"Houndmaster Kerrax"       ,nil,nil,{1171, 62.9 , 24.99},nil,nil,mobs_icon, t_itemid = 152790, t_type = "mount", t_info = "In the cave"}
 q[48809] = {ant,"Puscilla"                 ,nil,nil,{1171, 63.85, 21.08, nil, 1171, 65.57, 27.48, cave_entrance},nil,nil,mobs_icon, t_info = "Entrance on the bridge"}
 q[48970] = {ant,"Mother Rosula"            ,nil,nil,{1171, 66.71, 17.99, nil, 1171, 65.57, 27.48, cave_entrance},nil,nil,mobs_icon, t_itemid = 153252, t_type = "pet", t_info = "Entrance on the bridge@Collect 100 Imp meat and create a feast to summon her"}
 q[48865] = {ant,"Chief Alchemist Munculus" ,nil,nil,{1171, 61.44, 21.02},nil,nil,mobs_icon}
 q[48815] = {ant,"Inquisitor Vethroz"       ,nil,nil,{1171, 60.63, 48.38},nil,nil,mobs_icon}
 q[49241] = {ant,"Gar'zoth"                 ,nil,nil,{1171, 55.76, 45.95},nil,nil,mobs_icon}
 q[48817] = {ant,"Admiral Rel'var"          ,nil,nil,{1171, 73.58, 72.09},nil,nil,mobs_icon}
 q[48818] = {ant,"All-Seer Xanarian"        ,nil,nil,{1171, 74.98, 57.07},nil,nil,mobs_icon, t_info = "In the cave"}
 q[49183] = {ant,"Blistermaw"               ,nil,nil,{1171, 61.78, 36.96},nil,nil,mobs_icon, t_itemid = 152905, t_type = "mount"}
 q[48810] = {ant,"Vrax'thul"                ,nil,nil,{1171, 53.03, 36.08},nil,nil,mobs_icon}
 q[48811] = {ant,"Ven'orn"                  ,nil,nil,{1171, 66.38, 54.24},nil,nil,mobs_icon, t_info = "In the cave"}
 q[48812] = {ant,"Varga"                    ,nil,nil,{1171, 64.29, 48.09},nil,nil,mobs_icon, t_itemid = 153190, t_type = "pet", t_info = "In the cave, at river level"}
 q[48814] = {ant,"Wrath-Lord Yarez"         ,nil,nil,{1171, 61.33, 65.15},nil,nil,mobs_icon, t_itemid = 153126, t_type = "toy"}
 q[48820] = {ant,"WorldSplitter Skuul"      ,nil,nil,{1171, 50.9 , 55.3 },nil,nil,mobs_icon, t_info = "Patrolling the skies"}
 q[48813] = {ant,"Lieutenant Xakaar"        ,nil,nil,{1171, 62.21, 53.52},nil,nil,mobs_icon}
 
 if IsQuestFlaggedCompleted(48870) then
  q[48966] = {ant,"The Many-Faced Devourer"  ,nil,nil,{1171, 54.8 , 39.15},nil,nil,mobs_icon, t_itemid = 153195, t_type = "pet", t_info = "Use the Bone Effigy"}
 else
  q[48966] = {ant,"The Many-Faced Devourer"  ,nil,nil,{1171, 54.8 , 39.15},nil,nil,mobs_icon, t_itemid = 153195, t_type = "pet", t_info = "Drop Call of the Devourer from mobs around,@collect the three bones and summon him using the Bone Effigy twice@Bones at:@|cff00ffff50.4 56.1@|cff00ffff52.4 35.3@|cff00ffff65.8 19.4|r (in the imps' cave)"}
 end
--                                                      1171, 50.4 , 56.1 , {icon = bone_icon, desc = "Requires Call of the Devourer in bags"},
--                                                      1171, 65.89, 19.42, {icon = bone_icon, desc = "In the imps' cave, requires Call of the Devourer in bags"},
--                                                      1171, 52.4 , 35.3 , {icon = bone_icon, desc = "Requires Call of the Devourer in bags"}},nil,nil,mobs_icon, t_itemid = 153195, t_type = "all"}
 q[49240] = {ant,"Mistress Il'thendra"      ,nil,nil,{1171, 57.32, 33.57},nil,nil,mobs_icon}
 q[48968] = {ant,"Doomcaster Suprax"        ,nil,nil,{1171, 58, 12},nil,nil,mobs_icon, t_itemid = 153194, t_type = "toy", t_info = "Needs three players to stand over runes"}
 
 if IsQuestFlaggedCompleted(49007) then
  q[48967] = {ant,"Squadron Commander Vishax",nil,nil,{1171, 84.6, 81  , nil, 1171,77.46, 74.61,cave_entrance},nil,nil,mobs_icon, t_itemid = 153253, t_type = "toy", t_info = "Use the portal"}
 else
  q[48967] = {ant,"Squadron Commander Vishax",nil,nil,{1171, 84.6, 81  , nil, 1171,77.46, 74.61,cave_entrance},nil,nil,mobs_icon, t_itemid = 153253, t_type = "toy", t_info = "Requires Vishax's Portal Generator, loot mobs in the area"}
 end
 
 q[48824] = {ant,"Void Warden Valsuran"     ,nil,nil,{1171, 55.39, 21.64},nil,nil,mobs_icon}
 q[48816] = {ant,"Commander Texlaz"         ,nil,nil,{1171, 82.66, 65.63, nil, 1171, 80.5, 62.69, cave_entrance},nil,nil,mobs_icon}
 q[48971] = {ant,"Rezira the Seer"          ,nil,nil,{1171, 64.92, 82.88},nil,nil,mobs_icon, t_itemid = 153293, t_type = "toy", t_info = "Portal to get here can be opened using Observer's Locus Resonator"}
 q[48822] = {ant,"Watcher Aival"            ,nil,nil,{1171, 52.7 , 29.5 },nil,nil,mobs_icon}
 
 -- Mac'aree
 q[48705] = {mac,"Venomtail Skyfin"        ,nil,nil,{1170, 33.65, 48.10},nil,nil,mobs_icon, t_itemid = 152844, t_type = "mount"}
 q[48697] = {mac,"Kaara The pale"          ,nil,nil,{1170, 38.64, 55.58},nil,nil,mobs_icon, t_itemid = 153190, t_type = "pet"}
 q[48707] = {mac,"Captain Faruq"           ,nil,nil,{1170, 27.16, 30   },nil,nil,mobs_icon}
 q[48721] = {mac,"Skreeg the Devourer"     ,nil,nil,{1170, 49.79, 9.58 },nil,nil,mobs_icon, t_itemid = 152904, t_type = "mount"} --
 q[48714] = {mac,"Overseer Y'Beda"         ,nil,nil,{1170, 58.73, 37.60},nil,nil,mobs_icon}
 q[48935] = {mac,"Slithon the last"        ,nil,nil,{1170, 48.79, 52.35},nil,nil,mobs_icon}
 q[48713] = {mac,"Jed'hin Champion Vorsuk" ,nil,nil,{1170, 48.1 , 40.63},nil,nil,mobs_icon} -- 48741?
 q[48704] = {mac,"Vigilant Kuro"           ,nil,nil,{1170, 63.89, 64.42},nil,nil,mobs_icon, t_itemid = 153183, t_type = "toy"} --
 q[48719] = {mac,"Zul'tan the Numerous"    ,nil,nil,{1170, 64.03, 29.52},nil,nil,mobs_icon}
 q[48700] = {mac,"Baruut the Bloodthirsty" ,nil,nil,{1170, 43.81, 60.63},nil,nil,mobs_icon, t_itemid = 153193, t_type = "toy"}
 q[48711] = {mac,"Herald of Chaos"         ,nil,nil,{1170, 35.95, 58.97},nil,nil,mobs_icon, t_info = "Second floor"} --
 q[48703] = {mac,"Vigilant Thanos"         ,nil,nil,{1170, 36.73, 23.88},nil,nil,mobs_icon}
 q[48718] = {mac,"Instructor Tarahna"      ,nil,nil,{1170, 61.89, 50.37},nil,nil,mobs_icon, t_itemid = 153179, t_type = "toy", t_info = "Drops three different colored versions of the toy"} --
 q[48695] = {mac,"Wrangler Kravos"         ,nil,nil,{1170, 55.6 , 60.15},nil,nil,mobs_icon, t_itemid = 152814, t_type = "mount"}
 q[48709] = {mac,"Ataxon"                  ,nil,nil,{1170, 30.13, 40.21},nil,nil,mobs_icon, t_itemid = 153056, t_type = "pet"}
 q[48706] = {mac,"Turek the Lucid"         ,nil,nil,{1170, 39.19, 66.79},nil,nil,mobs_icon, t_info = "In the house"} --
 q[48717] = {mac,"Overseer Y'Morna"        ,nil,nil,{1170, 60.86, 29.76},nil,nil,mobs_icon} --
 q[48702] = {mac,"Feasel the Muffin Thief" ,nil,nil,{1170, 41.15, 11.49},nil,nil,mobs_icon}
 q[48693] = {mac,"Soultwisted Monstrosity" ,nil,nil,{1170, 52.92, 66.67},nil,nil,mobs_icon}
 q[48716] = {mac,"Overseer Y'Sorna"        ,nil,nil,{1170, 57.03, 29.19},nil,nil,mobs_icon}
 q[48712] = {mac,"Sabuul"                  ,nil,nil,{1170, 44.16, 48.96},nil,nil,mobs_icon, t_itemid = 153190, t_type = "pet"}
 q[48720] = {mac,"Commander Xethgar"       ,nil,nil,{1170, 56.84, 14.63},nil,nil,mobs_icon}
 q[48692] = {mac,"Shadowcaster Voruun"     ,nil,nil,{1170, 44.6 , 71.6 },nil,nil,mobs_icon}
 q[48708] = {mac,"Umbraliss"               ,nil,nil,{1170, 35.2 , 37.2 },nil,nil,mobs_icon}
 q[48710] = {mac,"Sorolis the Ill-Fated"   ,nil,nil,{1170, 70.4 , 46.7 },nil,nil,mobs_icon}

           -------- Broken Shore ---------
 q[47133] = {bro,DailyGlobalCheck.LocalizeSection(q, 47133, 2, "Rare Mob Daily Bonus", "quest", 47133)}
 
 q[46202] = {bro,"Dreadeye"                 ,nil,nil,{1021, 45.67, 79.75 },nil,nil,mobs_icon}
 q[46092] = {bro,"Malorus the Soulkeeper"   ,nil,nil,{1021, 42.33, 42.73 },nil,nil,mobs_icon}
 q[46096] = {bro,"Inquisitor Chillbane"     ,nil,nil,{1021, 62.08, 38.4  },nil,nil,mobs_icon}
 q[46098] = {bro,"Dreadblade Annihilator"   ,nil,nil,{1021, 57.27, 30.49 },nil,nil,mobs_icon}
 q[46304] = {bro,"Lord Hel'Nurath"          ,nil,nil,{1021, 44.64, 53.2  },nil,nil,mobs_icon}
 q[46093] = {bro,"Emberfire"                ,nil,nil,{1021, 52.87, 45.16 },nil,nil,mobs_icon}
 q[46100] = {bro,"Xorogun the Flamecarver"  ,nil,nil,{1021, 49.13, 47.93 },nil,nil,mobs_icon}
 q[46099] = {bro,"Felbringer Xar'thok"      ,nil,nil,{1021, 57.14, 49.43 },nil,nil,mobs_icon}
 q[46094] = {bro,"Potionmaster Gloop"       ,nil,nil,{1021, 57   , 56.5  },nil,nil,mobs_icon, t_info = "Use the ladder on the right to climb up"}
 q[46313] = {bro,"Imp Mother Bruva"         ,nil,nil,{1021, 60.39, 45.03 },nil,nil,mobs_icon}
 q[46095] = {bro,"Felmaw Emberfiend"        ,nil,nil,{1021, 39.17, 42.08 },nil,nil,mobs_icon}
 q[47001] = {bro,"Brother Badatin"          ,nil,nil,{1021, 78.05, 39.48 },nil,nil,mobs_icon}
 q[47036] = {bro,"Duke Sithizi"             ,nil,nil,{1021, 78.15, 27.93 },nil,nil,mobs_icon}
 q[46951] = {bro,"Fllurlokkr"               ,nil,nil,{1021, 38.96, 59.87 },nil,nil,mobs_icon}
 q[47028] = {bro,"Somber Dawn"              ,nil,nil,{1021, 30.91, 59.07 },nil,nil,mobs_icon}
 q[46090] = {bro,"Malgrazoth"               ,nil,nil,{1021, 59.62, 27.28 },nil,nil,mobs_icon}
 q[46102] = {bro,"Felcaller Zelthae"        ,nil,nil,{1021, 88.69, 31.19 },nil,nil,mobs_icon}
 q[46091] = {bro,"Salethan the Broodwalker" ,nil,nil,{1021, 65.16, 31.87 },nil,nil,mobs_icon}
 q[46101] = {bro,"Corrupted Bonebreaker"    ,nil,nil,{1021, 60.8 , 53.44 },nil,nil,mobs_icon}
 q[47068] = {bro,"Eye of Gurgh"             ,nil,nil,{1021, 64.45, 30.23, nil, 1021, 66.73, 34.69, cave_entrance },nil,nil,mobs_icon}
 q[46097] = {bro,"Doombringer Zar'thoz"     ,nil,nil,{1021, 49.76, 37.63 },nil,nil,mobs_icon}
 q[46953] = {bro,"Aqueux"                   ,nil,nil,{1021, 53.66, 79.19 },nil,nil,mobs_icon}
 q[46965] = {bro,"Brood Mother Nix"         ,nil,nil,{1021, 40.02, 33.96, nil, 1021, 39.65, 28.98, cave_entrance},nil,nil,mobs_icon}
 q[47026] = {bro,"Lady Eldrathe"            ,nil,nil,{1021, 42.76, 17.06 },nil,nil,mobs_icon}
 q[46995] = {bro,"Grossir"                  ,nil,nil,{1021, 77.77, 23.6  },nil,nil,mobs_icon}
 
           -------- Azsuna ---------
 q[37537] = {azs,"Ravyn-Drath"              ,nil,nil,{1015, 41   , 41.8 },nil,1,mobs_icon, t_itemid = 129080, t_type = "leather"}
 q[38037] = {azs,"Infernal Lord"            ,nil,nil,{1015, 35.3 , 50.3 },nil,1,mobs_icon, t_itemid = 129083, t_type = "plate", t_info = "Click on Cache of Infernals"}
 q[44108] = {azs,"Ragemaw"                  ,nil,nil,{1015, 32.6 , 48.8 },nil,1,mobs_icon, t_itemid = 129075, t_type = "all"}
 q[37726] = {azs,"Valyaka the Stormbringer" ,nil,nil,{1015, 47.3 , 34.6 },nil,1,mobs_icon, t_itemid = 129082, t_type = "cloth"}
 q[37869] = {azs,"Daggerbeak"               ,nil,nil,{1015, 50.8 , 31.6 },nil,1,mobs_icon, t_itemid = 129084, t_type = "mail"}
 q[37989] = {azs,"Syphonus & Leodrath"      ,nil,nil,{1015, 67.1 , 51.4 },nil,1,mobs_icon, t_itemid = 129064, t_type = "plate"}
 q[37823] = {azs,"Mrrgrl the Tide Reaver"   ,nil,nil,{1015, 50   , 34.4 },nil,1,mobs_icon, t_itemid = 129072, t_type = "all"}
 q[37821] = {azs,"Captain Volo'ren"         ,nil,nil,{1015, 53.4 , 44   },nil,1,mobs_icon, t_itemid = 129066, t_type = "leather"}
 q[42450] = {azs,"Brawlgoth"                ,nil,nil,{1015, 55.1 , 45.9 },nil,1,mobs_icon, t_itemid = 129086, t_type = "plate"}
 q[37820] = {azs,"Golza the Iron Fin"       ,nil,nil,{1015, 65.16, 40   },nil,1,mobs_icon, t_itemid = 129091, t_type = "agi"}
 q[37932] = {azs,"Arcavellus"               ,nil,nil,{1015, 59.6 , 12.3 },nil,1,mobs_icon, t_itemid = 129085, t_type = "cloth", t_info = "Defeat waves at Unbound Rift"}
 q[37824] = {azs,"Flog the Captain-Eater"   ,nil,nil,{1015, 45.3 , 57.8 },nil,1,mobs_icon, t_itemid = 129090, t_type = "all"}
 q[42221] = {azs,"Chief Bitterbrine"        ,nil,nil,{1015, 65.54, 56.79},nil,1,mobs_icon, t_itemid = 129073, t_type = "all"}
 q[38217] = {azs,"Tide Behemoth"            ,nil,nil,{1015, 61.3 , 62   },nil,1,mobs_icon, t_itemid = 129062, t_type = "mail"}
 q[37822] = {azs,"The Oracle"               ,nil,nil,{1015, 59.7 , 55.2 },nil,1,mobs_icon, t_itemid = 129065, t_type = "cloth"}
 q[42069] = {azs,"Felwing"                  ,nil,nil,{1015, 43.54, 24.55},nil,1,mobs_icon, t_itemid = 129087, t_type = "leather"}
 q[42825] = {azs,"Horkus"                   ,nil,nil,{1015, 56.28, 59.6 },nil,1,mobs_icon, t_info = "Speak with Npc while using Spectral Sight"}
 q[38061] = {azs,"Pridelord Meowl"          ,nil,nil,{1015, 56.04, 29.07},nil,1,mobs_icon, t_itemid = 138395, t_type = "leather"}
 q[38212] = {azs,"Brogozog"                 ,nil,nil,{1015, 59.15, 46.49},nil,1,mobs_icon, t_itemid = 129068, t_type = "mail", t_info = "Speak with Npc"}
 q[38238] = {azs,"Beacher"                  ,nil,nil,{1015, 32.9 , 29.47},nil,1,mobs_icon, t_itemid = 129067, t_type = "plate", t_info = "Patrols"}
 q[38352] = {azs,"Doomlord Kazrok"          ,nil,nil,{1015, 43.21, 28.31},nil,1,mobs_icon, t_itemid = 129056, t_type = "int", t_info = "Speak with NPC"}
 q[37928] = {azs,"Normantis the Deposed"    ,nil,nil,{1015, 49.51, 8.76 },nil,1,mobs_icon, t_itemid = 129061, t_type = "cloth"}
 q[38268] = {azs,"Cailyn Paledoom"          ,nil,nil,{1015, 52.47, 22.88},nil,1,mobs_icon, t_itemid = 129063, t_type = "leather"}
 q[37909] = {azs,"Warbringer Mox'na"        ,nil,nil,{1015, 49   , 55.12},nil,1,mobs_icon, t_itemid = 129069, t_type = "mail"}
 q[44081] = {azs,"Trecherous Stallions"     ,nil,nil,{1015, 50.51, 52.04, {desc="Cave Entrance at 60.4, 46.4"}, 1015, 60.4, 46.4, cave_entrance},nil,1,mobs_icon}
 q[42417] = {azs,"Bilebrain"                ,nil,nil,{1015, 29.28, 53.65},nil,1,mobs_icon, t_itemid = 129079, t_type = "leather"}
 q[44670] = {azs,"Broodmother Lizax"        ,nil,nil,{1015, 33.31, 42.57},nil,1,mobs_icon, t_itemid = 141869, t_type = "leather"}
 q[42286] = {azs,"Houndmaster Stroxis"      ,nil,nil,{1015, 30.85, 47.74},nil,1,mobs_icon, t_itemid = 141873, t_type = "mail", t_info = "Patrols"}
 q[42280] = {azs,"Vorthax"                  ,nil,nil,{1015, 37.23, 43.28},nil,1,mobs_icon}
 q[42376] = {azs,"Inquisitor Tivos"         ,nil,nil,{1015, 26.82, 49.07},nil,1,mobs_icon, t_itemid = 141874, t_type = "cloth", t_info = "Use Legion Portal"}
 q[42505] = {azs,"Arcanist Shal'Iman"       ,nil,nil,{1015, 34.9 , 33.7 },nil,1,mobs_icon, t_itemid = 141868, t_type = "cloth"}
 q[38365] = {azs,"Gilblin Standoff"         ,nil,nil,{1015, 55.9 , 56.8 },nil,1,mobs_icon}
 q[44671] = {azs,"The Muscle"               ,nil,nil,{1015, 58.7 , 79.8 },nil,1,mobs_icon, t_itemid = 129081, t_type = "plate", t_info = "Level 110"}
 q[42699] = {azs,"Coura, Mistress of Arcana",nil,nil,{1015, 55.6, 70.14, {level=19}, 1015, 56.07, 68.52, cave_entrance },nil,1,mobs_icon,nil,nil,nil,nil,"Level 110"}
 --q[45495] = {azs,"Immolian"                 ,nil,nil,{1015, 28.72, 49.47 },nil,1,mobs_icon, t_info = "Elite 112"}

			 -------- Val'Sharah ---------
 q[38887] = {val,"Elindya Featherlight"          ,nil,nil,{1018, 60.35, 90.65},nil,1,mobs_icon, t_itemid = 130115, t_type = "cloth"}
 q[38468] = {val,"Gorebeak"                      ,nil,nil,{1018, 59.7 , 77.4 },nil,1,mobs_icon, t_itemid = 130154, t_type = "all"}
 q[38889] = {val,"Shivering Ashmaw Cub"          ,nil,nil,{1018, 52.78, 87.5 },nil,1,mobs_icon, t_itemid = 128690, t_type = "all"}
 q[39596] = {val,"Perrexx the Corruptor"         ,nil,nil,{1018, 61.05, 69.4 },nil,1,mobs_icon}
 q[38479] = {val,"Seersei"                       ,nil,nil,{1018, 41.9 , 78.1 },nil,1,mobs_icon, t_itemid = 130171, t_type = "all"}
 q[38772] = {val,"Theryssia"                     ,nil,nil,{1018, 38   , 52.8 },nil,1,mobs_icon, t_itemid = 130136, t_type = "cloth"}
 q[40126] = {val,"Grelda the Hag"                ,nil,nil,{1018, 65.83, 53.5 },nil,1,mobs_icon, t_itemid = 130122, t_type = "all"}
 q[39130] = {val,"Pollous the Fetid"             ,nil,nil,{1018, 67.5 , 44.95},nil,1,mobs_icon, t_itemid = 130168, t_type = "all", t_info = "Speak with Npc"}
 q[38780] = {val,"Thondrax"                      ,nil,nil,{1018, 62.6 , 47.5 },nil,1,mobs_icon, t_itemid = 130121, t_type = "mail"}
 q[39858] = {val,"Dreadbog"                      ,nil,nil,{1018, 60.18, 44.22},nil,1,mobs_icon, t_itemid = 130125, t_type = "all"}
 q[38767] = {val,"Darkshade"                     ,nil,nil,{1018, 44.23, 52   },nil,1,mobs_icon, t_itemid = 130166, t_type = "all"}
 q[43176] = {val,"Undergrell Ringleader"         ,nil,nil,{1018, 67.04, 69.52},nil,1,mobs_icon, t_itemid = 130133, t_type = "plate"}
 q[39357] = {val,"Mad Henryk"                    ,nil,nil,{1018, 47.22, 58.01},nil,1,mobs_icon, t_itemid = 130214, t_type = "all"}
 q[43446] = {val,"Bahagar"                       ,nil,nil,{1018, 45.54, 88.8 },nil,1,mobs_icon, t_itemid = 130135, t_type = "leather"}
 q[43447] = {val,"Wraithtalon"                   ,nil,nil,{1018, 66.67, 36.89},nil,1,mobs_icon, t_itemid = 130116, t_type = "leather"}
 q[40079] = {val,"Lyrath Moonfeather"            ,nil,nil,{1018, 61.84, 29.68},nil,1,mobs_icon, t_itemid = 130118, t_type = "cloth"}
 q[40080] = {val,"Ironbranch"                    ,nil,nil,{1018, 58.94, 34.05},nil,1,mobs_icon}
 q[42816] = {val,"Maxwell Caprina"               ,nil,nil,{1018, 41.92, 59.98},nil,1,mobs_icon, t_info = "Speak with Npc while using Spectral Sight"}
 q[39121] = {val,"Kiranis Duskwhisper"           ,nil,nil,{1018, 34.39, 58.29},nil,1,mobs_icon, t_info = "Use object"}
 q[38900] = {val,"Antydas Nightcaller's Hideaway",nil,nil,{1018, 64.6 , 85.2 },nil,1,mobs_icon, t_info = "Click on the sleeping druid, then loot chest"}
 q[38466] = {val,"Unguarded Thistleleaf Treasure",nil,nil,{1018, 55.55, 77.62},nil,1,mobs_icon, t_itemid = 130147, t_type = "all"}
 q[44070] = {val,"Gathenak the Subjugator"       ,nil,nil,{1018, 49.1 , 47.5 },nil,1,mobs_icon, t_itemid = 132359, t_type = "plate"}

 -- shaman only
 q[42575] = {val,"Tormented Earth (Shaman)"      ,nil,nil,{1018, 58.55, 73.44},nil,1,mobs_icon, [9] = showshaman}
 
			 -------- Highmountain ---------
 q[39435] = {high,"Oubdob da Smasher"    ,nil,nil,{1024, 47.7 , 73.9 },nil,1,mobs_icon}
 q[39963] = {high,"Flamescale"           ,nil,nil,{1024, 41   , 57.7 },nil,1,mobs_icon, t_itemid = 131773, t_type = "mail"}
 q[40681] = {high,"Sekhan"               ,nil,nil,{1024, 45.7 , 55   },nil,1,mobs_icon, t_itemid = 131730, t_type = "leather"}
 q[39802] = {high,"Hartli the Snatcher"  ,nil,nil,{1024, 51.07, 48.25},nil,1,mobs_icon} -- , t_itemid = 129190, t_type = "all" -- rope of friendship?
 q[40414] = {high,"Devouring Darkness"   ,nil,nil,{1024, 54.39, 41.12, nil, 1024, 55.13, 44.3, cave_entrance},nil,1,mobs_icon, t_itemid = 131780, t_type = "cloth", t_info = "Blow the candles out"}
 q[39872] = {high,"Taurson"              ,nil,nil,{1024, 53.75, 51.23},nil,1,mobs_icon, t_info = "Loot chest after defeating him"}
 q[39465] = {high,"Skullhat"             ,nil,nil,{1024, 51.46, 31.89},nil,1,mobs_icon, t_itemid = 131769, t_type = "cloth"}
 q[39782] = {high,"Tenpak Flametotem"    ,nil,nil,{1024, 41.94, 41.49},nil,1,mobs_icon, t_itemid = 129175, t_type = "all"}
 q[39784] = {high,"Beastmaster Pao'lek"  ,nil,nil,{1024, 48.6 , 50   },nil,1,mobs_icon, t_itemid = 131756, t_type = "mail", t_info = "Loot Stolen Goods after defeating Aru"}
 q[40405] = {high,"Bristlemaul"          ,nil,nil,{1024, 37.7 , 45.7 },nil,1,mobs_icon, t_itemid = 131761, t_type = "leather"}
 q[39994] = {high,"Crab Rider Grmlrml"   ,nil,nil,{1024, 44.2 , 12.1 },nil,1,mobs_icon, t_itemid = 131798, t_type = "leather"}
 q[40096] = {high,"Mrrklr"               ,nil,nil,{1024, 46.5 , 7.44 },nil,1,mobs_icon, t_itemid = 131797, t_type = "all"}
 q[40347] = {high,"Gurbog da Basher"     ,nil,nil,{1024, 56.4 , 60.5 },nil,1,mobs_icon, t_itemid = 131775, t_type = "plate", t_info = "Patrols"}
 q[40175] = {high,"Slumber"              ,nil,nil,{1024, 41.51, 31.84},nil,1,mobs_icon, t_itemid = 131921, t_type = "all"}
 q[39646] = {high,"Majestic Elderhorn"   ,nil,nil,{1024, 46.64, 31.44},nil,1,mobs_icon, t_itemid = 131900, t_type = "all"}
 q[40242] = {high,"Mellok, Son of Torok" ,nil,nil,{1024, 49.2 , 27.09},nil,1,mobs_icon}
 q[40413] = {high,"Amateur hunters"      ,nil,nil,{1024, 43.16, 48   },nil,1,mobs_icon, t_itemid = 131781, t_type = "plate", t_info = "Loot chest after defeating them"}
 q[39866] = {high,"Mynta Talonscreech"   ,nil,nil,{1024, 54.55, 40.6 },nil,1,mobs_icon, t_itemid = 131792, t_type = "all"}
 q[40773] = {high,"Frostshard"           ,nil,nil,{1024, 54.44, 74.54},nil,1,mobs_icon, t_info = "Elite 110"}
 q[39235] = {high,"Brogrul the Mighty"   ,nil,nil,{1024, 56.34, 72.53},nil,1,mobs_icon}
 q[40406] = {high,"Luggut the Eggeater"  ,nil,nil,{1024, 50.83, 34.65},nil,1,mobs_icon, t_itemid = 131776, t_type = "mail"}
 q[40084] = {high,"Bodash the Hoarder"   ,nil,nil,{1024, 36.7 , 16.36},nil,1,mobs_icon, t_itemid = 131799, t_type = "str"}
 q[39766] = {high,"Ram'pag"              ,nil,nil,{1024, 52.31, 51.38},nil,1,mobs_icon, t_info = "Open Totally Safe Treasure Chest"}
 q[39762] = {high,"Shara Felbreath"      ,nil,nil,{1024, 51.02, 25.7 },nil,1,mobs_icon, t_itemid = 131791, t_type = "cloth"}
 q[39806] = {high,"Crawshuk the Hungry"  ,nil,nil,{1024, 48.36, 40.19},nil,1,mobs_icon, t_itemid = 131809, t_type = "all"}
 q[40423] = {high,"Unethical Adventurers",nil,nil,{1024, 52.3 , 58.6 },nil,1,mobs_icon, t_itemid = 140683, t_type = "cloth", t_info = "Loot Treasure in the cave"}
 q[39807] = {high,"The Snowbringer"      ,nil,nil,{1024, 0, 0 },nil,1,mobs_icon}
 q[41042] = {high,"Champion Chomper"     ,nil,nil,{1024, 0, 0 },nil,1,mobs_icon}
 
 q[45510] = {high,"Ormagrogg"     ,nil,nil,{1024, 52.23, 58.61},nil,1,mobs_icon,nil,nil,nil,nil,"Only available during Legion Assault"}
 
 
			 -------- Stormheim ---------
 q[38472] = {sto,"Whitewater Typhoon"        ,nil,nil,{1017, 36.5 , 52.5 },nil,1,mobs_icon, t_itemid = 138418, t_type = "mail"}
 q[38774] = {sto,"Tiptog the Lost"           ,nil,nil,{1017, 47.17, 49.83},nil,1,mobs_icon, t_itemid = 129163, t_type = "str"}
 q[38333] = {sto,"Glimar Ironfist"           ,nil,nil,{1017, 41.47, 67.02},nil,1,mobs_icon, t_itemid = 129291, t_type = "plate"}
 q[38423] = {sto,"Stormwing Matriarch"       ,nil,nil,{1017, 49.5 , 71.75},nil,1,mobs_icon, t_itemid = 129208, t_type = "all"}
 q[42591] = {sto,"Hannval the Butcher"       ,nil,nil,{1017, 51.6 , 74.65},nil,1,mobs_icon, t_itemid = 138417, t_type = "leather"}
 q[38431] = {sto,"Bladesquall"               ,nil,nil,{1017, 45.87, 77.36},nil,1,mobs_icon, t_itemid = 129048, t_type = "cloth"}
 q[38425] = {sto,"Fathnyr"                   ,nil,nil,{1017, 46.82, 84.06},nil,1,mobs_icon, t_itemid = 129206, t_type = "all"}
 q[38847] = {sto,"Urgev the Flayer"          ,nil,nil,{1017, 64.8 , 51.76},nil,1,mobs_icon, t_itemid = 129219, t_type = "cloth"}
 q[40081] = {sto,"Tarben"                    ,nil,nil,{1017, 61.53, 43.33},nil,1,mobs_icon, t_itemid = 129199, t_type = "all"}
 q[38642] = {sto,"Captain Brvet"             ,nil,nil,{1017, 58   , 45.16},nil,1,mobs_icon, t_itemid = 129123, t_type = "mail", t_info = "Use Horn of the Helmouth"}
 q[43342] = {sto,"Roteye"                    ,nil,nil,{1017, 58.35, 33.92},nil,1,mobs_icon, t_itemid = 139387, t_type = "mail"}
 q[38837] = {sto,"Mordvigbjorn"              ,nil,nil,{1017, 72.5 , 49.91},nil,1,mobs_icon, t_itemid = 129035, t_type = "all"}
 q[38685] = {sto,"The Nameless King"         ,nil,nil,{1017, 67.3 , 39.9 },nil,1,mobs_icon, t_itemid = 129041, t_type = "cloth"}
 q[39120] = {sto,"Isel the Hammer"           ,nil,nil,{1017, 62.03, 60.49},nil,1,mobs_icon, t_itemid = 129133, t_type = "mail"}
 q[39031] = {sto,"Ivory Sentinel"            ,nil,nil,{1017, 59.82, 68.07},nil,1,mobs_icon, t_itemid = 132895, t_type = "int"}
 q[38626] = {sto,"Bloodstalker Alpha"        ,nil,nil,{1017, 37.95, 40.15},nil,1,mobs_icon, t_itemid = 129101, t_type = "all", t_info = "Patrols"}
 q[40068] = {sto,"Egyl the Enduring"         ,nil,nil,{1017, 41.78, 34.12},nil,1,mobs_icon, t_itemid = 132898, t_type = "plate"}
 q[42437] = {sto,"Starbuck"                  ,nil,nil,{1017, 54.76, 29.36},nil,1,mobs_icon, t_itemid = 130132, t_type = "leather"}
 q[40113] = {sto,"Grrvrgull the Conqueror"   ,nil,nil,{1017, 78.67, 61.16},nil,1,mobs_icon, t_itemid = 138421, t_type = "mail"}
 q[38424] = {sto,"Thane Irglov the Merciless",nil,nil,{1017, 41.06, 72   },nil,1,mobs_icon, t_itemid = 129113, t_type = "all"}
 q[37908] = {sto,"Inquisitor Ernstenbok"     ,nil,nil,{1017, 63.67, 74.3 },nil,1,mobs_icon, t_itemid = 140686, t_type = "leather"}
 q[40109] = {sto,"Kottr Vondyr"              ,nil,nil,{1017, 73.46, 47.63},nil,1,mobs_icon, t_itemid = 138419, t_type = "leather"}
 
 -- alliance only
 q[38625] = {sto,"Hook"                      ,nil,nil,{1017, 42   , 57.75},nil,1,mobs_icon, [9] = showally, t_itemid = 129109, t_type = "cloth"}
 q[43343] = {sto,"Dread-Rider Cortis"        ,nil,nil,{1017, 73.9 , 60.6 },nil,1,mobs_icon, [9] = showally, t_itemid = 130134, t_type = "mail"}
 q[38630] = {sto,"Forsaken Deathsquad"       ,nil,nil,{1017, 44.28, 22.83},nil,1,mobs_icon, [9] = showally, t_itemid = 129264, t_type = "plate"}

 -- horde only
 q[38712] = {sto,"Houndmaster Ely"           ,nil,nil,{1017, 47.1 , 57.2 },nil,1,mobs_icon, [9] = showhorde, t_itemid = 129037, t_type = "cloth"}
 q[39048] = {sto,"Sapper Vorick"             ,nil,nil,{1017, 58.4 , 75.7 },nil,1,mobs_icon, [9] = showhorde, t_itemid = 129144, t_type = "leather"}
 q[38627] = {sto,"Worgen Stalkers"           ,nil,nil,{1017, 44.28, 22.83},nil,1,mobs_icon, [9] = showhorde, t_itemid = 129264, t_type = "plate"}

  
 -- shaman only
 q[40398] = {sto,"Hydrannon (Shaman)"        ,nil,nil,{1017, 64  , 32.7 },nil,1,mobs_icon, [9] = showshaman}
 
 -- Helheim
 q[39870] = {hel,"Soulthirster",nil,nil,{1022, 28.11, 63.39},nil,1,mobs_icon, t_itemid = 129188, t_type = "all"}
 q[38461] = {hel,"Fenri"       ,nil,nil,{1022, 81.64, 42.86},nil,1,mobs_icon, t_itemid = 129044, t_type = "all"}

			 -------- Suramar ---------                
 q[41786] = {sur,"King Morgalash"          ,nil,nil,{1033, 88.2 , 62.6 },nil,1,mobs_icon, t_info = "Use object", t_fixedilvl = 800}
 q[44003] = {sur,"Reef Lord Raj'his"       ,nil,nil,{1033, 76.83, 58.49},nil,1,mobs_icon, t_itemid = 121801, t_type = "all", t_fixedilvl = 800, t_info = "Patrols"}
 q[43369] = {sur,"Siegemaster Aedrin"      ,nil,nil,{1033, 38.87, 24.12},nil,1,mobs_icon}
 q[44072] = {sur,"Maia the White"          ,nil,nil,{1033, 24.35, 35.19},nil,1,mobs_icon, t_itemid = 139897, t_type = "all", t_fixedilvl = 800}
 q[43792] = {sur,"Degren"                  ,nil,nil,{1033, 54.41, 56.13},nil,1,mobs_icon, t_itemid = 121808, t_type = "agi", t_fixedilvl = 800}
 q[43580] = {sur,"Apothecary Faldren"      ,nil,nil,{1033, 42.2 , 56.33},nil,1,mobs_icon, t_itemid = 121754, t_type = "cloth", t_fixedilvl = 800}
 q[43993] = {sur,"Hertha Grimdottir"       ,nil,nil,{1033, 61.3 , 39.6 },nil,1,mobs_icon, t_itemid = 121737, t_type = "mail", t_fixedilvl = 800}
 q[43597] = {sur,"Guardian Thor'el"        ,nil,nil,{1033, 56.44, 50.42},nil,1,mobs_icon, t_info = "Patrols"}
 q[43495] = {sur,"Cadraeus"                ,nil,nil,{1033, 63   , 48   },nil,1,mobs_icon, t_itemid = 139969, t_type = "mail", t_fixedilvl = 800}
 q[43954] = {sur,"Anax"                    ,nil,nil,{1033, 33.63, 51.83},nil,1,mobs_icon, t_itemid = 140934, t_type = "all", t_fixedilvl = 800}
 q[42831] = {sur,"Shal'an"                 ,nil,nil,{1033, 26.24, 41.17},nil,1,mobs_icon, t_itemid = 139926, t_type = "cloth", t_fixedilvl = 800}
 q[43449] = {sur,"Oreth the Vile"          ,nil,nil,{1033, 24.51, 47.28},nil,1,mobs_icon}
 q[40680] = {sur,"Rok'nash"                ,nil,nil,{1033, 80.07, 69.9 },nil,1,mobs_icon, t_itemid = 140019, t_type = "plate", t_fixedilvl = 800}
 q[41319] = {sur,"Elfbane"                 ,nil,nil,{1033, 22.17, 51.79},nil,1,mobs_icon, t_itemid = 121806, t_type = "str", t_fixedilvl = 800}
 q[40897] = {sur,"Garvrulg"                ,nil,nil,{1033, 53.19, 30.02, nil, 1033, 49.5, 33.93, cave_entrance},nil,1,mobs_icon, t_itemid = 121755, t_type = "mail", t_fixedilvl = 800}
 q[43542] = {sur,"Tideclaw"                ,nil,nil,{1033, 18.56, 61.1 },nil,1,mobs_icon}
 q[43996] = {sur,"Shadowquill"             ,nil,nil,{1033, 16.68, 26.85},nil,1,mobs_icon}
 q[43717] = {sur,"Artificer Lothaire"      ,nil,nil,{1033, 33.68, 15.03},nil,1,mobs_icon}
 q[43484] = {sur,"Rauren"                  ,nil,nil,{1033, 23.94, 25.55},nil,1,mobs_icon, t_itemid = 121759, t_type = "leather", t_fixedilvl = 800}
 q[41135] = {sur,"Cora'kar"                ,nil,nil,{1033, 70.03, 56.78},nil,1,mobs_icon, t_itemid = 139952, t_type = "leather", t_info = "In the cave", t_fixedilvl = 800}
 q[41136] = {sur,"Har'kess the Insatiable" ,nil,nil,{1033, 67.7 , 70.9, nil, 1033, 73.43, 67.77, cave_entrance},nil,1,mobs_icon, t_info = "In the cave", t_fixedilvl = 800}
 q[43968] = {sur,"Pinchshank"              ,nil,nil,{1033, 66.61, 67.07},nil,1,mobs_icon, t_itemid = 140314, t_type = "all", t_fixedilvl = 800}
 q[43718] = {sur,"Matron Hagatha"          ,nil,nil,{1033, 35.78, 34.68},nil,1,mobs_icon}
 q[43351] = {sur,"Mal'Dreth the Corruptor" ,nil,nil,{1033, 34.2 , 60.97},nil,1,mobs_icon}
 q[43358] = {sur,"Myonix"                  ,nil,nil,{1033, 40.91, 32.77},nil,1,mobs_icon, t_itemid = 121739, t_type = "leather", t_fixedilvl = 800}
 q[44124] = {sur,"Mar'tura"                ,nil,nil,{1033, 13.44, 53.55},nil,1,mobs_icon}
 q[43348] = {sur,"Magister Phaedris"       ,nil,nil,{1033, 42.04, 80.06},nil,1,mobs_icon}
 q[44675] = {sur,"Lady Rivantas"           ,nil,nil,{1033, 35.35, 67.04},nil,1,mobs_icon}
 q[43603] = {sur,"Randril"                 ,nil,nil,{1033, 49.62, 78.99},nil,1,mobs_icon}
 q[43794] = {sur,"Ambassador D'vwinn"      ,nil,nil,{1033, 54.8 , 63.78},nil,1,mobs_icon}
 q[40905] = {sur,"Lieutenant Strathmar"    ,nil,nil,{1033, 48.53, 56.66},nil,1,mobs_icon, t_itemid = 121735, t_type = "plate", t_fixedilvl = 800}
 q[43481] = {sur,"Arcanist Lylandre"       ,nil,nil,{1033, 65.58, 59.13},nil,1,mobs_icon}
 q[43793] = {sur,"Miasu"                   ,nil,nil,{1033, 62.48, 63.66},nil,1,mobs_icon, t_itemid = 121810, t_type = "all", t_fixedilvl = 800}
 q[43992] = {sur,"Gorgroth"                ,nil,nil,{1033, 27.3 , 65.7 },nil,1,mobs_icon, t_itemid = 121747, t_type = "plate", t_info = "Use portal key", t_fixedilvl = 800}
 q[44669] = {sur,"Vicious Whale Shark"     ,nil,nil,{1033, 78.2 , 58   },nil,1,mobs_icon}
 q[44676] = {sur,"Llorian"                 ,nil,nil,{1033, 29.44, 53.32,nil,1033,29.24,50.58,cave_entrance},nil,1,mobs_icon, t_itemid = 141867, t_type = "leather", t_info = "Feed him, defeat waves then loot chest in front of Llorian", t_fixedilvl = 800}
 --q[] = {sur,"Broodmother Shu'malis",nil,nil,{1033, 66.82, 51.6},nil,1,mobs_icon}

 setup_localization()
 update_overlay_info()
 
 local eventframe = CreateFrame("Frame")
 eventframe:RegisterEvent("PLAYER_LEVEL_UP")
 eventframe:SetScript("OnEvent", update_overlay_info)
 
 local svar = DailyGlobalCheck_PluginData["Legion Rare Mobs"]
 if not svar or not svar.options or svar.options[1] == nil then
  onOptionChanged(1)
 else
  onOptionChanged(svar.options[1] and 1 or 2)
 end
 DGCEventFrame:Hook("OPTION_CHANGED_PLUGIN", onOptionChanged)
end

list.GenerateData = GenerateData
DailyGlobalCheck:LoadPlugin(list, questsdata)
