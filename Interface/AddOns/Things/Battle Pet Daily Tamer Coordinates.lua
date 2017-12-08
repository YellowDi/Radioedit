--------------------------
-- Battle Pet Daily Tamer Coordinates.lua
-- Author: CN-阿曼尼-DeathKnight-仁者無敵:YY132359
-- Date: 2017/8/30
-- 宠物对战日常
--------------------------
local _,tamer = ...

--[[	DailyInfo describes the dailies. It's indexed by the questID of each daily quest.

   [questID] = {
      [1] = tamer numeric npcID or name of event like "Celestial Tournament"
      [2] = text about daily ("Darkmoon Faire", "Beasts of Fable Book II", etc)
      [3] = continent (1=kalimdor, 2=EK, 3=outland, 4=northrend, 5=maelstrom, 6=pandaria, 7=draenor, 8=broken isles, 9=argus, 0=other)
      [4] = worldY continent-level y coordinate
      [5] = worldX continent-level x coordinate
      [6] = mapID
      [7] = mapX zone-level x map coordinate
      [8] = mapY zone-level y map coordinate
      [9] = daily type, 1=satchel, 2=non-satchel, 3=legendary; this is an index to tamer.PawInfo above
      [10] = level of pets for this tamer
      [11] = speciesID of tamer's first pet
      [12] = speciesID of tamer's second pet
      [13] = speciesID of tamer's third pet
   }

   When a questID is Number1:Number2, Number1 is the questID and Number2 is the objective number.
   When a questID is Unknown:Number1, Number1 is the npcID of an unknown questID.
]]

tamer.DailyInfo = {
   -- Satchel dailies (green paws)
   [31916]={66522,nil,2,-11141.66602,-1835.83325,32,0.401,0.765,1,19,948,949,947}, -- Lydia Accoste
   [31909]={66466,nil,1,6149.25000,-5026.06689,281,0.656,0.645,1,19,928,927,929}, -- Stone Cold Trixxy
   [31926]={66557,nil,3,-3480.58325,2547.50000,473,0.305,0.418,1,24,964,963,962}, -- Bloodknight Antari
   [31935]={66675,nil,4,8607.55762,590.12500,492,0.774,0.196,1,25,978,977,979}, -- Major Payne
   [31971]={66824,nil,1,-9763.41602,-1063.99585,720,0.566,0.420,1,25,989,991,990}, -- Obalis
   [31955]={66734,nil,6,-47.65051,869.74158,807,0.461,0.437,1,25,995,997,996}, -- Farmer Nishi
   [31991]={66918,nil,6,2559.50830,4994.18506,810,0.363,0.522,1,25,1006,1005,1004}, -- Seeker Zusshi
   [31957]={66739,nil,6,74.81665,3190.58521,858,0.551,0.376,1,25,1009,1007,1008}, -- Wastewalker Shu
   [31953]={66730,nil,6,1134.17871,-1899.91675,806,0.480,0.541,1,25,992,993,994}, -- Hyuna of the Shrines
   [31954]={66733,nil,6,-1544.79102,32.29150,857,0.622,0.459,1,25,1000,999,998}, -- Mo'ruk
   [31958]={66741,nil,6,697.29309,1689.17773,811,0.313,0.741,1,25,1012,1011,1010}, -- Aki the Chosen
   [31956]={66738,nil,6,2547.48315,2599.09961,809,0.358,0.736,1,25,1001,1002,1003}, -- Courageous Yon
   [32434]={68463,"Pandarian Spirits",6,2946.25415,3799.48535,810,0.571,0.421,1,25,1130,1131,1139}, -- Burning Pandaren Spirit
   [32441]={68465,"Pandarian Spirits",6,1704.91687,776.31628,811,0.673,0.144,1,25,1137,1141,1134}, -- Thundering Pandaren Spirit
   [32439]={68462,"Pandarian Spirits",6,-1705.99023,2869.46021,858,0.611,0.875,1,25,1132,1138,1133}, -- Flowing Pandaren Spirit
   [32440]={68464,"Pandarian Spirits",6,1976.58276,-566.10022,806,0.289,0.360,1,25,1135,1140,1136}, -- Whispering Pandaren Spirit
   [33222]={73626,"Lil' Oondasta",6,-732.74603,-4913.56592,951,0.346,0.604,2,25,1339}, -- Little Tommy Newcomer
   [33137]={"Celestial Tournament",nil,6,-720.93799,-4916.58984,951,0.347,0.596,1}, -- Celestial Tournament
   [32604]={64572,"Beasts of Fable Book I",6,935.61896,287.66138,811,0.866,0.600,1}, -- Sara Finkleswitch (Alliance only)
   [32868]={64572,"Beasts of Fable Book II",6,935.61896,287.66138,811,0.866,0.600,1}, -- Sara Finkleswitch (Alliance only)
   [32869]={64572,"Beasts of Fable Book III",6,935.61896,287.66138,811,0.866,0.600,1}, -- Sara Finkleswitch (Alliance only)
   [32604]={64582,"Beasts of Fable Book I",6,1547.01733,944.17493,811,0.607,0.238,1}, -- Gentle San (Horde only)
   [32868]={64582,"Beasts of Fable Book II",6,1547.01733,944.17493,811,0.607,0.238,1}, -- Gentle San (Horde only)
   [32869]={64582,"Beasts of Fable Book III",6,1547.01733,944.17493,811,0.607,0.238,1}, -- Gentle San (Horde only)
   [45083]={115286,nil,1,438.3999,-3451.4001,11,0.636,0.358,1,25,1983,1981,1982}, -- Crysa (added patch 7.1)
   [47895]={124617,nil,2,-5144.8003,825.6000,27,0.268,0.369,1,25,2068,2067,2066}, -- Environeer Bert (added patch 7.3)
   -- Non-satchel dailies (blue paws)
   [31922]={66550,nil,3,-216.51880,2218.75610,465,0.643,0.493,2,20,952,951,950}, -- Nicki Tinytech
   [31923]={66551,nil,3,242.61462,8610.34180,467,0.172,0.505,2,21,953,955,954}, -- Ras'an
   [31924]={66552,nil,3,-1777.89990,6925.58301,477,0.610,0.494,2,22,957,958,956}, -- Narrok
   [31925]={66553,nil,3,-2083.50000,5368.20020,481,0.587,0.700,2,23,961,959,960}, -- Morulu The Elder
   [31934]={66639,nil,4,5444.86621,-1259.17505,496,0.132,0.668,2,25,976,974,975}, -- Gutretch
   [31931]={66635,nil,4,1750.07288,-3127.02490,491,0.286,0.339,2,25,967,966,965}, -- Beegle Blastfuse
   [31932]={66636,nil,4,5431.47900,79.56885,510,0.501,0.590,2,25,968,970,969}, -- Nearly Headless Jacob
   [31933]={66638,nil,4,2691.78101,318.16699,488,0.590,0.771,2,25,973,971,972}, -- Okrut Dragonwaste
   [31972]={66819,nil,1,5270.01416,-3536.10840,606,0.614,0.327,2,25,982,980,981}, -- Brok
   [31974]={66822,nil,2,-4152.53320,-5420.79150,700,0.566,0.568,2,25,987,986,988}, -- Goz Banefury
   [31973]={66815,nil,5,857.83325,507.18311,640,0.499,0.570,2,25,984,983,985}, -- Bordin Steadyfist
   -- Alliance non-satchel dailies (blue paws)
   [31693]={64330,nil,2,-9876.88867,88.07922,30,0.417,0.837,2,2,873,872}, -- Julia Stevens
   [31780]={65648,nil,2,-9831.66699,885.16650,39,0.609,0.185,2,3,875,876,874}, -- Old MacDonald
   [31781]={65651,nil,2,-9415.35840,-2334.56030,36,0.333,0.526,2,5,878,877,879}, -- Lindsay
   [31850]={65655,nil,2,-10519.46582,296.03333,34,0.199,0.446,2,7,881,880,882}, -- Eric Davidson
   [31852]={63194,nil,2,-12120.93262,-142.25012,37,0.460,0.404,2,9,885,884,883}, -- Steven Lisbane
   [31851]={65656,nil,2,-14448.00391,76.22937,673,0.515,0.734,2,11,887,886,888}, -- Bill Buckler
   [31910]={66478,nil,2,65.26672,-4000.50000,26,0.630,0.546,2,13,932,931,933}, -- David Kosse
   [31911]={66512,nil,2,2295.91650,-4988.43750,23,0.670,0.524,2,14,935,936,934}, -- Deiza Plaguehorn
   [31912]={66515,nil,2,-6512.03760,-1110.54773,28,0.353,0.277,2,15,939,937,938}, -- Kortas Darkhammer
   [31913]={66518,nil,2,-10229.67676,-4007.64990,38,0.768,0.415,2,16,941,943,942}, -- Everessa
   [31914]={66520,nil,2,-7982.91602,-1268.36450,29,0.255,0.475,2,17,946,945,944}, -- Durin Darkhammer
   -- Horde non-satchel dailies (blue paws)
   [31818]={66126,nil,1,789.60822,-4283.71240,4,0.439,0.289,2,2,889,890}, -- Zunta
   [31854]={66136,nil,1,3539.01025,535.13318,43,0.202,0.295,2,5,894,896,895}, -- Analynn
   [31872]={66372,nil,1,-917.96454,1666.21240,101,0.571,0.457,2,9,901,902,900}, -- Merda Stronghoof
   [31862]={66137,nil,1,587.89990,379.78320,81,0.597,0.716,2,7,897,899,898}, -- Zonya the Sadist
   [31819]={66135,nil,1,-223.97717,-3164.97534,11,0.586,0.531,2,3,891,893,892}, -- Dagra the Fierce
   [31871]={66352,nil,1,-4664.79980,1292.51660,121,0.597,0.496,2,13,906,904,905}, -- Traitor Gluk
   [31904]={66422,nil,1,-3704.69141,-1579.10010,607,0.396,0.791,2,11,908,909,907}, -- Cassandra Kaboom
   [31908]={66412,nil,1,7563.29736,-2445.39160,241,0.461,0.603,2,17,924,925,926}, -- Elena Flutterfly
   [31905]={66436,nil,1,-4654.83398,-3804.74976,141,0.539,0.749,2,14,913,911,912}, -- Grazzle the Great
   [31906]={66452,nil,1,-4931.73291,-1836.93311,61,0.319,0.329,2,15,915,917,916}, -- Kela Grimtotem
   [31907]={66442,nil,1,4949.91650,-627.08313,182,0.400,0.566,2,16,922,923,921}, -- Zoltan
   -- Beasts of Fable (orange paws)
   ["32604:1"]={68555,"Beasts of Fable Book I",6,348.97412,-1929.52612,806,0.484,0.710,3,25,1129}, -- Ka'wi the Gorger
   ["32604:2"]={68563,"Beasts of Fable Book I",6,3274.94775,2637.15039,809,0.352,0.562,3,25,1192}, -- Kafi
   ["32604:3"]={68564,"Beasts of Fable Book I",6,2084.66479,592.42773,809,0.679,0.847,3,25,1193}, -- Dos-Ryga
   ["32604:4"]={68565,"Beasts of Fable Book I",6,2296.97583,-2531.62939,806,0.570,0.291,3,25,1194}, -- Nitun
   ["32868:1"]={68560,"Beasts of Fable Book II",6,-959.08789, 1686.41650,807,0.253,0.785,3,25,1189}, -- Greyhoof
   ["32868:2"]={68561,"Beasts of Fable Book II",6,-46.65613,1088.71741,807,0.405,0.437,3,25,1190}, -- Lucky Yi
   ["32868:3"]={68566,"Beasts of Fable Book II",6,-1277.22852,1248.79163,857,0.362,0.373,3,25,1195}, -- Skitterer Xi'a
   ["32869:1"]={68558,"Beasts of Fable Book III",6,-378.52185,4738.46094,858,0.262,0.503,3,25,1187}, -- Gorespine
   ["32869:2"]={68559,"Beasts of Fable Book III",6,751.22571,2202.00049,811,0.110,0.709,3,25,1188}, -- No-No
   ["32869:3"]={68562,"Beasts of Fable Book III",6,1503.73071,2929.30713,810,0.723,0.798,3,25,1191}, -- Ti'un the Wanderer
   -- Draenor dailies (green paws)
   [37201]={83837,nil,7,5743.67871,890.87549,949,0.511,0.706,1,25,1424,1443,1444}, -- Cymre Brightblade
   [37205]={87122,nil,7,5634.64209,3312.50439,941,0.686,0.648,1,25,1552,1553,1550}, -- Gargra
   [37206]={87110,nil,7,4551.96338,6117.27734,950,0.562,0.098,1,25,1554,1555,1556}, -- Tarr the Terrible
   [37208]={87125,nil,7,1234.73755,2905.98291,946,0.491,0.804,1,25,1562,1561,1560}, -- Taralune
   [37207]={87123,nil,7,-447.32690,1875.76025,948,0.463,0.453,1,25,1559,1557,1558}, -- Vesharr
   [37203]={87124,nil,7,1264.13892,-1083.52783,947,0.500,0.313,1,25,1548,1547,1549}, -- Ashlei
   -- Tanaan Jungle (orange paws)
   [39160]={94637,nil,7,3651.500000,-1074.900024,945,0.530,0.652,3,25,1673}, -- Corrupted Thundertail
   [39170]={94647,nil,7,4085.100098,-776.100037,945,0.473,0.528,3,25,1683}, -- Dreadwalker
   [39169]={94646,nil,7,4333.000000,-603.299988,945,0.440,0.457,3,25,1682}, -- Vile Blood of Draenor
   [39171]={94648,nil,7,4692.700195,-831.200012,945,0.484,0.355,3,25,1684}, -- Netherfist
   [39172]={94649,nil,7,4839.100098,-841.000000,945,0.486,0.313,3,25,1685}, -- Skrillix
   [39165]={94642,nil,7,4625.899902,-1323.200073,945,0.577,0.374,3,25,1678}, -- Direflame
   [39173]={94650,nil,7,4625.899902,-2253.100098,945,0.755,0.374,3,25,1686}, -- Defiled Earth
   [39163]={94640,nil,7,3105.400146,-1226.500000,945,0.559,0.808,3,25,1676}, -- Felfly
   [39164]={94641,nil,7,2977.600098,-568.400024,945,0.434,0.845,3,25,1677}, -- Tainted Maulclaw
   [39166]={94643,nil,7,3419.800049,-508.399994,945,0.422,0.718,3,25,1679}, -- Mirecroak
   [39161]={94638,nil,7,3265.199951,394.200012,945,0.250,0.762,3,25,1674}, -- Chaos Pup
   [39162]={94639,nil,7,4600.100098,61.200001,945,0.314,0.381,3,25,1675}, -- Cursed Spirit
   [39157]={94601,nil,7,4827.500000,336.000000,945,0.261,0.316,3,25,1671}, -- Felsworn Sentry
   [39168]={94645,nil,7,4366.700195,868.400024,945,0.160,0.447,3,25,1681}, -- Bleakclaw
   [39167]={94644,nil,7,4889.100098,-1130.200073,945,0.541,0.298,3,25,1680}, -- Dark Gazer
   -- Azsuna (green paws)
   [42063]={105898,nil,8,48.75000,5548.02100,1015,0.650,0.400,1,25,1883}, -- Size Doesn't Matter (Blottis)
   [42165]={nil,nil,8,-35.60000,6709.39990,1015,0.474,0.419,1,25,1729,1728,1731}, -- Azsuna Specimens
   [42146]={106476,nil,8,-12.76257,6536.45850,1015,0.500,0.414,1,25,1893,1894,1892}, -- Dazed and Confused and Adorable (Beguiling Orb)
   [42159]={106552,nil,8,48.75000,6800.04199,1015,0.460,0.400,1,25,1897,1898,1899}, -- Training with the Nightwatchers (Nightwatcher Merayl)
   [42148]={106417,nil,8,1454.75000,6997.72949,1015,0.430,0.080,1,25,1891}, -- The Wine's Gone Bad (Vinu)
   [42154]={106542,nil,8,1103.25000,6338.77148,1015,0.530,0.160,1,25,1895, 1896}, -- Help a Whelp (Wounded Azurewing Whelpling)
   -- Dalaran (green paws)
   [42442]={107489,nil,8,-714.50000,4641.30029,1014,0.282,0.239,1,25,1904,1905,1906}, -- Fight Night: Amalia
   [40299]={99210,nil,8,-714.50000,4641.30029,1014,0.282,0.239,1,25,1800,1801,1799}, -- Fight Night: Bodhi Sunwayver
   [41881]={99742,nil,8,-714.50000,4641.30029,1014,0.282,0.239,1,25,1815}, -- Fight Night: Heliosus
   [40298]={99182,nil,8,-714.50000,4641.30029,1014,0.282,0.239,1,25,1795,1797,1796}, -- Fight Night: Sir Galveston
   [41886]={105241,nil,8,-714.50000,4641.30029,1014,0.282,0.239,1,25,1855}, -- Fight Night: Rats! (Splint Jr.)
   [42062]={105840,nil,8,-714.50000,4641.30029,1014,0.282,0.239,1,25,1880}, -- Fight Night: Stitches Jr. Jr.
   [40277]={97804,nil,8,-714.50000,4641.30029,1014,0.282,0.239,1,25,1748,1746,1745}, -- Fight Night: Tiffany Nelson
   -- Highmountain (green paws)
   [40280]={99077,nil,8,3708.00000,4315.00000,1024,0.477,0.691,1,25,1790,1791,1792}, -- Training with Bredda (Bredda Tenderhide)
   [40282]={99150,nil,8,5313.12500,4790.54150,1024,0.410,0.350,1,25,1798,1793, 1794}, -- Tiny Poacher, Tiny Animals (Grixis Tinypop)
   [41766]={104782,nil,8,4464.87500,3729.91650,1024,0.560,0.530,1,25,1843}, -- Wildlife Protection Force (Hungry Icefang)
   [42064]={105841,nil,8,6606.30029,4634.00000,1024,0.000,0.000,1,25,1881}, -- It's Illid... Wait (Lil'idan)
   [41687]={104553,nil,8,5898.89990,4538.39990,1024,0.446,0.226,1,25,1842,1841, 1840}, -- Snail Fight (Odrogg)
   [41624]={98572,nil,8,4242.00000,5050.00000,1024,0.373,0.577,1,25,1811}, -- Rocko Needs a Shave (Rocko)
   -- Stormheim (green paws)
   [42067]={105842,nil,8,4120.60010,2804.90015,1017,0.384,0.273,1,25,1882}, -- All Howl, No Bite (Chromadon)
   [41944]={105455,nil,8,3396.80005,1774.09998,1017,0.560,0.460,1,25,1868,1869,1870}, -- Jarrun's Ladder (Trapper Jarrun)
   [41958]={99878,nil,8,3443.90015,2228.40015,1017,0.446,0.448,1,25,1816,1817,1818}, -- Oh, Ominitron (need npcID for Mini Magmatron)
   [40278]={98270,nil,8,2971.89258,507.70801,1017,0.780,0.570,1,25,1770,1772,1771}, -- My Beast's Bidding (Robert Craig)
   [41948]={105512,nil,8,2572.00000,1394.00000,1017,0.620,0.670,1,25,1871,1872}, -- All Pets Go to Heaven (Envoy of the Hunt)
   [41935]={nil,nil,8,3165.33008,1436.04028,1017,0.620,0.520,1,25,1867,1866}, -- Beasts of Burden (Andurs and Rydyr)
   -- Suramar (green paws)
   [41895]={105250,nil,8,1409.68604,3826.76929,1033,0.510,0.550,1,25,1857,1858,1859}, -- The Master of Pets (Aulier)
   [41914]={105323,nil,8,1890.95654,3382.60303,1033,0.590,0.420,1,25,1860,1861,1862}, -- Clear the Catacombs (Ancient Catacomb Eggs)
   [41990]={105674,nil,8,1224.58203,3216.04028,1033,0.620,0.600,1,25,1873,1874,1875}, -- Chopped (Varenne)
   [40337]={97709,nil,8,1150.54053,5270.31006,1033,0.250,0.620,1,25,1742}, -- Flummoxed (Master Tamer Flummox)
   [42015]={105779,nil,8,368.00000,4788.00000,1033,0.337,0.831,1,25,1877,1878,1879}, -- Threads of Fate (Felsoul Seer)
   [41931]={105352,nil,8,2150.10205,5603.43506,1033,0.190,0.350,1,25,1863,1864,1865}, -- Mana Tap (Surging Mana Crystal)
   -- Val'sharah (green paws)
   [40279]={99035,nil,8,3506.19995,7019.70020,1018,0.469,0.397,1,25,1789,1787,1788}, -- Training with Durian (Durian Strongfruit)
   [41862]={105093,nil,8,2577.18774,6520.41650,1018,0.560,0.650,1,25,1851,1852,1853}, -- Only Pets can Prevent Forest Fires (Fragment of Fire)
   [41861]={104992,nil,8,3526.80005,5968.10010,1018,0.660,0.391,1,25,1849}, -- Meet The Maw (The Maw)
   [41855]={105009,nil,8,1705.00000,6527.00000,1018,0.550,0.880,1,25,1850}, -- Stand Up to Bullies (Thistleleaf Bully)
   [42190]={nil,nil,8,3185.40015,6508.39990,1018,0.562,0.484,1,25,1734,1737,1739}, -- Wildlife Conservationist
   [41860]={104970,nil,8,2732.00000,6095.00000,1018,0.630,0.600,1,25,1847,1846,1848}, -- Dealing with Satyrs (Xorvasc)
   -- Broken Isle
   [46111]={117934,nil,8,-1226.20007,2222.19995,1201,0.700,0.476,1,25,2014,2015,2016}, -- Illidari Masters: Sissix
   [46112]={117950,nil,8,-534.70001,3130.00000,1201,0.464,0.207,1,25,2011,2012,2013}, -- Illidari Masters: Madam Viciosa
   [46113]={117951,nil,8,-1850.90002,3396.40015,1201,0.395,0.720,1,25,2008,2009,2010}, -- Illidari Masters: Nameless Mystic
   [45539]={"Challenge: Wailing Caverns",nil,1,-798.90002,-2036.50000,11,0.390,0.681,1,25,1996}, -- Pet Battle Challenge: Wailing Caverns
   [46292]={"Challenge: Deadmines",nil,2,-11059.5,1562.3,39,0.416,0.711,1,25,2023}, -- Pet Battle Challenge: Deadmines
   -- Antorian Wastes
   ["Unknown:128020"] = {128020,nil,9,-3018.115,9354.783,1171,0.566,0.542,3,25,2108}, -- Bloat
   ["Unknown:128021"] = {128021,nil,9,-2440.114,9371.783,1171,0.561,0.287,3,25,2109}, -- Earseeker
   [49057] = {128023,nil,9,-3464.649,8671.377,1171,0.767,0.739,3,25,2111}, -- Minixis
   [49058] = {128024,nil,9,-2703.048,9245.982,1171,0.598,0.403,3,25,2110}, -- One-of-Many   
   ["Unknown:128022"] = {128022,nil,9,-3285.582,9099.781,1171,0.641,0.660,3,25,2112}, -- Pilfer
   [49053] = {128019,nil,9,-2727.981,9524.785,1171,0.516,0.414,3,25,2107}, -- Watcher
   -- Krokuun
   ["Unknown:128009"] = {128009,nil,9,1366.085,2175.648,1135,0.430,0.520,3,25,2092}, -- Baneglow
   [49045] = {128011,nil,9,1219.937,2673.402,1135,0.296,0.579,3,25,2099}, -- Deathscreech
   [49042] = {128008,nil,9,1073.789,1859.908,1135,0.515,0.638,3,25,2096}, -- Foulclaw
   ["Unknown:128012"] = {128012,nil,9,1006.908,2301.944,1135,0.396,0.665,3,25,2100}, -- Gnasher
   [49044] = {128010,nil,9,1918.475,1607.316,1135,0.583,0.297,3,25,2098}, -- Retch
   [49041] = {128007,nil,9,855.806,1295.291,1135,0.667,0.726,3,25,2095}, -- Ruinhoof
   -- Mac'Aree
   ["Unknown:128013"] = {128013,nil,9,5669.008,9343.189,1170,0.676,0.439,3,25,2101}, -- Bucky
   [49051] = {128017,nil,9,5944.969,10506.402,1170,0.319,0.312,3,25,2105}, -- Corrupted Blood of Argus
   ["Unknown:128015"] = {128015,nil,9,5077.974,9590.820,1170,0.600,0.711,3,25,2103}, -- Gloamwing
   [49052] = {128018,nil,9,5836.323,9111.850,1170,0.747,0.362,3,25,2106}, -- Mar'cuus
   ["Unknown:128016"] = {128016,nil,9,5447.370,10372.812,1170,0.360,0.541,3,25,2104}, -- Shadeflicker
   ["Unknown:128014"] = {128014,nil,9,5495.174,9274.765,1170,0.697,0.519,3,25,2102}, -- Snozz
}

--[[
   These are the coordinates for the Battle Pet Daily Tamer paws.

   The primary coordinate system is the "WorldLoc" coordinates that are also
   used by UnitPosition and GetWorldLocFromMapPos.

   In the cases when the world coordinates can't be used (especially for
   Azeroth overview map) then the MapCoordinates are used, which have
   the coordinate for all paws in each affected mapID.

   When a key is "number:number", it means the first number is a questID with multiple parts,
   the second number is the numbered objective of the quest.
]]

-- these are map-specific coordinates for when we can't use WorldCoordinates
tamer.MapCoordinates = {
   [751] = { -- Maelstrom
      {31973,0.52000,0.35000}, -- Bordin Steadyfist
      },
   [1014] = { -- Dalaran
      {42442,0.28182,0.23854}, -- Amalia
      {40299,0.28182,0.23854}, -- Bodhi Sunwayver
      {41881,0.28182,0.23854}, -- Heliosus
      {40298,0.28182,0.23854}, -- Sir Galveston
      {41886,0.28182,0.23854}, -- Splint Jr.
      {42062,0.28182,0.23854}, -- Stitches Jr. Jr.
      {40277,0.28182,0.23854}, -- Tiffany Nelson
   },
   [0] = { -- Azeroth
      -- Both Factions
      {"32604:1",0.53070,0.87062}, -- Ka'wi the Gorger
      {"32604:2",0.44887,0.79198}, -- Kafi
      {"32604:3",0.48553,0.82399}, -- Dos-Ryga
      {"32604:4",0.54148,0.81827}, -- Nitun
      {"32868:1",0.46593,0.90577}, -- Greyhoof
      {"32868:2",0.47663,0.88127}, -- Lucky Yi
      {"32868:3",0.47375,0.91433}, -- Skitterer Xi'a
      {"32869:1",0.41122,0.89017}, -- Gorespine
      {"32869:2",0.45668,0.85979}, -- No-No
      {"32869:3",0.44365,0.83958}, -- Ti'un the Wanderer
      {32175,0.59000,0.65000}, -- Jeremy Feasel
      {36471,0.59000,0.65000}, -- Christoph VonFeasel
      {31973,0.44500,0.51000}, -- Bordin Steadyfist
      {31955,0.48051,0.88128}, -- Farmer Nishi
      {31956,0.44961,0.81156}, -- Courageous Yon
      {31957,0.43897,0.87796}, -- Wastewalker Shu
      {31958,0.46586,0.86127}, -- Aki the Chosen
      {31971,0.19749,0.77819}, -- Obalis
      {31909,0.26048,0.39922}, -- Stone Cold Trixxy
      {31974,0.92159,0.56619}, -- Goz Banefury
      {31916,0.86523,0.73097}, -- Lydia Accoste
      {31991,0.40667,0.81121}, -- Seeker Zusshi
      {32434,0.42810,0.80083}, -- Burning Pandaren Spirit
      {31931,0.56037,0.24636}, -- Beegle Blastfuse
      {31932,0.50659,0.15373}, -- Nearly Headless Jacob
      {31933,0.50259,0.22264}, -- Okrut Dragonwaste
      {31935,0.49801,0.07381}, -- Major Payne
      {32440,0.50627,0.82691}, -- Whispering Pandaren Spirit
      {32441,0.48224,0.83416}, -- Thundering Pandaren Spirit
      {32439,0.44474,0.92586}, -- Flowing Pandaren Spirit
      {31972,0.23676,0.42014}, -- Brok
      {31953,0.53013,0.84960}, -- Hyuna of the Shrines
      {31954,0.49559,0.92152}, -- Mo'ruk
      {31934,0.52905,0.15340}, -- Gutretch
      {33222,0.58418,0.89970}, -- Little Tommy Newcomer
      {33137,0.58423,0.89939}, -- Celestial Tournament
      {45083,0.23547,0.53521}, -- Crysa
      {47895,0.83234,0.58959}, -- Environeer Bert
      -- Broken Isle
      {42442,0.60146,0.47315}, -- Amalia
      {40299,0.60146,0.47315}, -- Bodhi Sunwayver
      {41881,0.60146,0.47315}, -- Heliosus
      {40298,0.60146,0.47315}, -- Sir Galveston
      {41886,0.60146,0.47315}, -- Splint Jr.
      {42062,0.60146,0.47315}, -- Stitches Jr. Jr.
      {40277,0.60146,0.47315}, -- Tiffany Nelson
      {42148,0.57027,0.43003}, -- Vinu
      {41855,0.57622,0.42458}, -- Thistleleaf Bully
      {41860,0.58199,0.40395}, -- Xorvasc
      {41948,0.64490,0.40716}, -- Envoy of the Hunt
      {40280,0.60582,0.38438}, -- Bredda Tenderhide
      {42015,0.59948,0.45141}, -- Felsoul Seer
      {41624,0.59598,0.37365}, -- Rocko
      {42146,0.57612,0.45910}, -- Beguiling Orb
      {42190,0.57647,0.39487}, -- Wildlife Conservationist
      {42067,0.62603,0.37610}, -- Chromadon
      {40278,0.65709,0.39938}, -- Robert Craig
      {41861,0.58370,0.38801}, -- The Maw
      {41958,0.63374,0.38967}, -- Ominitron
      {41687,0.60283,0.34040}, -- Odrogg
      {40279,0.56963,0.38842}, -- Durian Strongfruit
      {42165,0.57378,0.45951}, -- Azsuna Specimens
      {42064,0.60155,0.32620}, -- Lil'idan
      {42063,0.58925,0.45788}, -- Blottis
      {42159,0.57242,0.45775}, -- Nightwatcher Merayl
      {41862,0.57640,0.40739}, -- Fragment of Fire
      {41931,0.58873,0.41603}, -- Surging Mana Crystal
      {40337,0.59319,0.43607}, -- Master Tamer Flummox
      {41914,0.61848,0.42144}, -- Ancient Catacomb Eggs
      {41895,0.61254,0.43082}, -- Aulier
      {41990,0.62048,0.43486}, -- Varenne
      {41766,0.61388,0.36935}, -- Hungry Icefang
      {40282,0.59937,0.35293}, -- Grixis Tinypop
      {41935,0.64408,0.39566}, -- Beasts of Burden
      {42154,0.57890,0.43682}, -- Wounded Azurewing Whelpling
      {41944,0.63982,0.39062}, -- Trapper Jarrun
      {46111,0.63383,0.48342}, -- Sissix
      {46112,0.62168,0.46953}, -- Madam Viciosa
      {46113,0.61811,0.49595}, -- Nameless Mystic
      {45539,0.21298,0.56469}, -- Pet Battle Challenge: Wailing Caverns
      {46292,0.81184,0.72904}, -- Pet Battle Challenge: Deadmines
      -- Alliance Only
      {31693,0.83499,0.70114}, -- Julia Stevens
      {31780,0.82247,0.70009}, -- Old MacDonald
      {31781,0.87307,0.69027}, -- Lindsay
      {31850,0.83173,0.71631}, -- Eric Davidson
      {31852,0.83864,0.75410}, -- Steven Lisbane
      {31851,0.83518,0.80890}, -- Bill Buckler
      {31910,0.89927,0.46674}, -- David Kosse
      {31911,0.91479,0.41417}, -- Deiza Plaguehorn
      {31912,0.85385,0.62185}, -- Kortas Darkhammer
      {31913,0.89939,0.70948}, -- Everessa
      {31914,0.85635,0.65651}, -- Durin Darkhammer
      {32604,0.49098,0.85486}, -- Sara Finkleswitch
      {32868,0.49098,0.85486}, -- Sara Finkleswitch
      {32869,0.49098,0.85486}, -- Sara Finkleswitch
      -- Horde Only
      {31818,0.24862,0.52682}, -- Zunta
      {31854,0.17214,0.46142}, -- Analynn
      {31872,0.15419,0.56751}, -- Merda Stronghoof
      {31862,0.17456,0.53165}, -- Zonya the Sadist
      {31819,0.23090,0.55094}, -- Dagra the Fierce
      {31871,0.16017,0.65680}, -- Traitor Gluk
      {31904,0.20571,0.63394}, -- Cassandra Kaboom
      {31908,0.21948,0.36550}, -- Elena Flutterfly
      {31905,0.24101,0.65651}, -- Grazzle the Great
      {31906,0.20979,0.66314}, -- Kela Grimtotem
      {31907,0.19055,0.42774}, -- Zoltan
      {32604,0.47927,0.83839}, -- Gentle San
      {32868,0.47927,0.83839}, -- Gentle San
      {32869,0.47927,0.83839}, -- Gentle San
  },
}

--[[

   Stable Coordinates

   Stables are only displayed on zone-level maps and have no quest or NPC associated with them.

]]
if UnitFactionGroup("player")=="Alliance" then
   tamer.Stables = {
     [11] = {{676,742}}, -- Northern Barrens
     [16] = {{400,490}}, -- Arathi Highlands
     [17] = {{656,364},{210,566}}, -- Badlands
     [19] = {{602,160},{460,854}}, -- Blasted Lands
     [22] = {{472,318}}, -- Western Plaguelands
     [26] = {{144,452},{664,450}}, -- The Hinterlands
     [27] = {{540,510}}, -- Dun Morogh
     [28] = {{406,686}}, -- Searing Gorge
     [30] = {{428,658}}, -- Elwynn Forest
     [34] = {{740,462}}, -- Duskwood
     [35] = {{840,628},{346,480}}, -- Loch Modan
     [36] = {{262,430}}, -- Redridge Mountains
     [38] = {{286,336},{720,148}}, -- Swamp of Sorrows
     [39] = {{530,530}}, -- Westfall
     [40] = {{106,596},{576,402},{262,258}}, -- Wetlands
     [41] = {{562,520}}, -- Teldrassil
     [42] = {{504,192}}, -- Darkshore
     [43] = {{364,504}}, -- Ashenvale
     [81] = {{586,566},{398,322},{318,616}}, -- Stonetalon Mountains
     [101] = {{570,496},{656,78}}, -- Desolace
     [121] = {{468,456},{510,180}}, -- Feralas
     [141] = {{658,454}}, -- Dustwallow Marsh
     [161] = {{526,274}}, -- Tanaris
     [182] = {{444,286},{616,254}}, -- Felwood
     [261] = {{532,346}}, -- Silithus
     [281] = {{586,502}}, -- Winterspring
     [301] = {{670,376},{778,672}}, -- Stormwind City
     [341] = {{690,846}}, -- Ironforge
     [381] = {{436,296}}, -- Darnassus
     [464] = {{490,498}}, -- Azuremyst Isle
     [465] = {{544,626}}, -- Hellfire Peninsula
     [467] = {{676,496},{788,642}}, -- Zangarmarsh
     [471] = {{600,256}}, -- The Exodar
     [473] = {{376,560}}, -- Shadowmoon Valley
     [475] = {{360,646},{276,526}}, -- Blade's Edge Mountains
     [476] = {{550,598}}, -- Bloodmyst Isle
     [477] = {{558,746}}, -- Nagrand
     [478] = {{568,538}}, -- Terokkar Forest
     [479] = {{320,648}}, -- Netherstorm
     [481] = {{566,796},{286,476}}, -- Shattrath City
     [486] = {{584,686},{566,730},{570,190},{780,490}}, -- Borean Tundra
     [488] = {{616,534},{288,560},{484,746},{774,508}}, -- Dragonblight
     [490] = {{326,596},{590,264},{138,846}}, -- Grizzly Hills
     [491] = {{606,160},{316,414},{586,630},{254,590}}, -- Howling Fjord
     [492] = {{696,220},{442,224},{758,202},{718,224}}, -- Icecrown
     [493] = {{272,596}}, -- Sholazar Basin
     [495] = {{306,368},{286,744},{408,860}}, -- The Storm Peaks
     [496] = {{590,576},{402,652}}, -- Zul'Drak
     [499] = {{502,354}}, -- Isle of Quel'Danas
     [606] = {{632,230},{194,362},{418,450}}, -- Mount Hyjal
     [607] = {{390,112},{660,468},{490,682}}, -- Southern Barrens
     [614] = {{560,730}}, -- Abyssal Depths
     [615] = {{490,576},{494,420}}, -- Shimmering Expanse
     [640] = {{474,516}}, -- Deepholm
     [673] = {{414,736}}, -- The Cape of Stranglethorn
     [700] = {{556,148},{806,774},{602,580},{436,574},{486,296}}, -- Twilight Highlands
     [720] = {{546,338},{270,76}}, -- Uldum
     [806] = {{446,848},{464,438},{548,630}}, -- The Jade Forest
     [807] = {{552,496}}, -- Valley of the Four Winds
     [809] = {{422,692},{654,616}}, -- Kun-Lai Summit
     [810] = {{714,576},{748,812},{500,714}}, -- Townlong Steppes
     [811] = {{846,632},{360,752}}, -- Vale of Eternal Blossoms
     [857] = {{672,322}}, -- Krasarang Wilds
     [858] = {{536,324},{558,696}}, -- Dread Wastes
     [873] = {{558,758}}, -- The Veiled Stair
     [928] = {{632,738}}, -- Isle of Thunder
     [951] = {{372,468}}, -- Timeless Isle
     [971] = {{288,385}}, -- Alliance Garrison
     [947] = {{252,070},{592,266}}, -- Shadowmoon Valley (Draenor)
     [949] = {{526,596}}, -- Gorgrond
     [948] = {{608,718}}, -- Spires of Arak
     [1009] = {{340,642}}, -- Stormshield
     [946] = {{694,212}}, -- Talador
   }
elseif UnitFactionGroup("player")=="Horde" then
   tamer.Stables = {
     [4] = {{520,418}}, -- Durotar
     [9] = {{470,596}}, -- Mulgore
     [11] = {{566,398},{676,742},{490,576},{624,168}}, -- Northern Barrens
     [16] = {{690,340}}, -- Arathi Highlands
     [17] = {{656,364},{182,422}}, -- Badlands
     [19] = {{416,128}}, -- Blasted Lands
     [20] = {{618,520}}, -- Tirisfal Glades
     [21] = {{446,208},{460,426}}, -- Silverpine Forest
     [22] = {{472,318},{478,640}}, -- Western Plaguelands
     [24] = {{596,648},{362,616},{568,468}}, -- Hillsbrad Foothills
     [26] = {{790,796},{320,576}}, -- The Hinterlands
     [28] = {{406,686}}, -- Searing Gorge
     [37] = {{380,512}}, -- Northern Stranglethorn
     [38] = {{472,552},{720,148}}, -- Swamp of Sorrows
     [43] = {{386,424},{126,338},{732,606},{502,658}}, -- Ashenvale
     [81] = {{662,640},{508,630}}, -- Stonetalon Mountains
     [101] = {{248,688},{570,496}}, -- Desolace
     [121] = {{516,480},{746,432},{414,156}}, -- Feralas
     [161] = {{526,274}}, -- Tanaris
     [181] = {{568,500}}, -- Azshara
     [182] = {{444,286}}, -- Felwood
     [261] = {{532,346}}, -- Silithus
     [281] = {{586,502}}, -- Winterspring
     [321] = {{408,806},{396,492},{626,356},{326,648}}, -- Orgrimmar
     [362] = {{450,596}}, -- Thunder Bluff
     [382] = {{678,386}}, -- Undercity
     [462] = {{476,472}}, -- Eversong Woods
     [463] = {{484,312}}, -- Ghostlands
     [465] = {{544,410}}, -- Hellfire Peninsula
     [467] = {{788,642},{318,498}}, -- Zangarmarsh
     [473] = {{292,294}}, -- Shadowmoon Valley
     [475] = {{536,532},{756,604},{276,526}}, -- Blade's Edge Mountains
     [477] = {{568,408}}, -- Nagrand
     [478] = {{494,446}}, -- Terokkar Forest
     [479] = {{320,648}}, -- Netherstorm
     [480] = {{834,304}}, -- Silvermoon City
     [481] = {{566,796},{286,476}}, -- Shattrath City
     [486] = {{498,106},{402,550},{770,372},{780,490}}, -- Borean Tundra
     [488] = {{768,626},{616,534},{370,486},{484,746}}, -- Dragonblight
     [490] = {{216,640},{138,848},{650,478}}, -- Grizzly Hills
     [491] = {{494,110},{520,666},{790,308},{254,590}}, -- Howling Fjord
     [492] = {{696,220},{442,224},{756,236},{718,224}}, -- Icecrown
     [493] = {{272,596}}, -- Sholazar Basin
     [495] = {{306,368},{408,860},{498,660},{674,502}}, -- The Storm Peaks
     [496] = {{590,576},{402,652}}, -- Zul'Drak
     [499] = {{502,354}}, -- Isle of Quel'Danas
     [606] = {{632,230},{194,362},{418,450}}, -- Mount Hyjal
     [607] = {{408,696},{440,336},{392,198}}, -- Southern Barrens
     [614] = {{530,592}}, -- Abyssal Depths
     [615] = {{514,626},{494,420}}, -- Shimmering Expanse
     [640] = {{512,502}}, -- Deepholm
     [673] = {{348,276},{414,736}}, -- The Cape of Stranglethorn
     [700] = {{756,526},{756,168},{538,430},{452,764}}, -- Twilight Highlands
     [720] = {{546,338},{270,76}}, -- Uldum
     [806] = {{278,468},{464,438},{548,630},{286,130}}, -- The Jade Forest
     [807] = {{552,496}}, -- Valley of the Four Winds
     [809] = {{422,692},{654,616}}, -- Kun-Lai Summit
     [810] = {{714,576},{748,812},{500,714}}, -- Townlong Steppes
     [811] = {{360,752},{604,226}}, -- Vale of Eternal Blossoms
     [857] = {{592,244}}, -- Krasarang Wilds
     [858] = {{536,324},{558,696}}, -- Dread Wastes
     [873] = {{558,758}}, -- The Veiled Stair
     [928] = {{328,326}}, -- Isle of Thunder
     [951] = {{372,468}}, -- Timeless Isle
     [976] = {{328,418}}, -- Horde Garrison
     [941] = {{220,562},{524,402},{388,520}}, -- Frostfire Ridge
     [949] = {{458,698}}, -- Gorgrond
     [948] = {{608,718}}, -- Spires of Arak
     [1011] = {{776,590}}, -- Warspear
     [946] = {{708,296}}, -- Talador
     [945] = {{598,456}}, -- Tanaan Jungle
   }
else
   tamer.Stables = {} -- no idea what faction you are!
end

