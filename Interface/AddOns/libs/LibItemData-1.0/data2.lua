﻿--------------------------------------------------------------------------------
-- 文件名: data.lua
-- 作   者: 盒子哥
-- 日	  期: 2012-03-01
-- 描	  述: 幻化装备数据
-- 版权所有 (c) 多玩游戏网
--------------------------------------------------------------------------------
if (GetLocale() ~= 'zhTW') then return; end

HuanhuaItemData = {};

--------------------------------

local ItemData = HuanhuaItemData;

--------------------------------
-- 偽套裝
ItemData["偽套裝"] = {
	-- 布甲套裝
	["布甲"] = {
		["土著套裝"] = {14120,14121,14117,14119,14114,14113},
		["血紋套裝"] = {14263,14266,14265,14262,14264,14259,14260,14258},
		["海盜套裝"] = {14172,14175,14168,14171,14174,14166,14173},
		["灰布套裝"] = {14042,10042,14043,14045,10044},
		["星界財團套裝"] = {24657,24659,24655,24656,24658,24654,24660,24653},
		["深紅絲質套裝"] = {7059,7063,7058,7064,7062,7055},
		["燼絲套裝"] = {14228,14232,14230,14231,14233,14236,14226,14235},
		["惡魔布套裝"] = {14111,14112,14106,18407,14107,14108},
		["帝王紅色套裝"] = {8254,8250,8245,8249,8251,8246,8247,8253},
		["紅色魔紋套裝"] = {10033,10029,10007,10018,10009},
		["禮節套裝"] = {14127,14133,14124,14125,14129,14122,14131},
		["血紅套裝"] = {14378,14372,14380,14377,14379,14373,14374,14375},
		["簡易套裝"] = {9748,9749,9747},
		["沾油套裝"] = {67172,67171,53592,59368,67173,59376,59372,67170},
		["誓言套裝"] = {9940,9941,9943,9939,9942,9936,9937,9945},
		["碧藍絲質套裝"] = {7048,7060,4324,4319,7046,7052},
		["甲殼套裝"] = {55902,55960,59265,55956,55894,62165},
		["天國套裝"] = {14312,14316,14317,14314,14315,14310,14311,14309},
		["晶網套裝"] = {63635,62999,63209,65289,63652},
		["旅者套裝"] = {2957,6511,2958},
		["嘲顱套裝"] = {24609,24611,24607,24608,24610,24606,24612,24605},
		["霧紋套裝"] = {6429,4734,6427,6428,4046,4047,4045,4736},
		["喚雨者套裝"] = {14189,14186,14190,14191,14193,14195,14187,14194},
		["皇家套裝"] = {9915,9912,9913,9910,9911,9907,9909,9906},
		["賢者套裝"] = {10288,6617,6610,6615,6616,6612,6613,6611},
		["先知套裝"] = {2981,6561,2984,2982,2983,3645,4699,6378},
		["女巫套裝"] = {9878,9881,9874,9880,9883,9876,9879,9875},
		["藍色沼澤套裝"] = {55747,55765,55720,55738,55756,55729,55711,55774},
		["亮木套裝"] = {55744,55762,55717,55735,55763,55726,55708,55771},
		["達隆米爾套裝"] = {55743,55761,55716,55734,55752,55725,55707,55770},
		["加拉德爾套裝"] = {55748,55766,55721,55739,55757,55730,55712,55775},
		["密斯特拉套裝"] = {55746,55719,55737,55755,55728,55710,55773},
		["蠻族布質套裝"] = {3310,6531,3308,3309,3307},
		["白骨法師套裝"] = {14307,14298,14303,14302,14305,14299,14301,14304},
		["黑霧套裝"] = {14246,14243,14244,14241,14242,14238,14240,14245},
		["逝亡之絲套裝"] = {54476,54474,54475,54478,54472,54477,54473,54471},
		["永恆套裝"] = {14332,14335,14336,14333,14334,14329,14330,14337},
		["火辣套裝"] = {62951,63624,56871,33233,62972,62944,62939},
		["霜紋套裝"] = {41521,41513,41515,44211,41519,41520,41512,41522},
		["高級議員套裝"] = {10139,10142,1135,10140,10141,10137,10136,10144},
		["上層精靈套裝"] = {14449,14452,14453,14451,15119,14447,14448,14454},
		["大師套裝"] = {10250,10253,10254,10251,10252,10247,10248,10255},
		["秘術師套裝"] = {14369,14371,14367,14370,14364,14366,14025},
		["光輝套裝"] = {14322,14325,14326,14323,14324,14319,14320,14327},
		["符文布套裝"] = {13866,13867,13857,13858,13863,13865,13864,13856},
		["君主套裝"] = {7470,7473,7468,7471,7469,7472,7475,7476},
		["暗紋套裝"] = {10025,10028,10004,10023,10002,10031},
		["星火套裝"] = {24601,24603,24599,24600,24602,24598,24604,24597},
		["守備官套裝"] = {24617,24619,24616,24618,24614,24620,24613,24615},
		["奧法套裝"] = {8292,8288,8290,8287,8289,8284,8285,8291},
		["阿斯塔蘭套裝"] = {24649,24651,24647,24648,24650,24646,24652,24645},
		["極光套裝"] = {4041,4729,6415,4042,4044,6416,4043,6418},
		["黑色魔紋套裝"] = {10024,10027,10001,10003,9999,10026},
		["夜紋套裝"] = {10061,10063,10062,10064,10059,10066},
		["鬼紋套裝"] = {14141,14142,14143,14144},
		["奧秘套裝"] = {10175,10172,10178,10176,10177,10179,10173,10180},
		["靈紋套裝"] = {21854,21855,21851,21853,21849,21850},
		["夜空套裝"] = {4039,4718,4038,4040,6405,6406,6407,4720},
		["暗影議會套裝"] = {24665,24667,24663,24664,24666,24662,24668,24661},
		["銀絲套裝"] = {6395,4035,7110,6393,4037,6394,4036,4714},
		["法師套裝"] = {2969,6528,2970},
		["愈心套裝"] = {54485,54479,54486,54484,54483,54482,54480,54481},
	},

	-- 皮甲套裝
	["皮甲"] = {
		["蒼白套裝"] = {14641,14640,14638,14637,14636},
		["刺殺套裝"] = {27908,28204,28414,27908,27509,27776},
		["迪菲亞套裝"] = {10403,10401,10402,10400,10399},
		["尖牙套裝"] = {10411,10412,10413,10410,6473},
		["雷暴套裝"] = {15058,15056,21278,15057},
		["嗜血皮革套裝"] = {70023,70027,70022,70024,70020,70026,70021,70025},
		["剔骨者套裝"] = {43434,43433,43437,43436,43435,43439,43438,43260},
		["天行者套裝"] = {31561,31564,31566,31563,31562,31560,31567,31565},
		["投機者的皮甲外套"] = {35366,35369,35367,35368,35370},
		["迅影套裝"] = {16721,16707,16709,16708,16712,16711,16713,54724},
		["野性之心套裝"] = {16706,16720,16719,16718,16715,16717,16716,16714},
		["勇士的套裝"] = {22864,22856,22879,22880,23257,23258},
		["月光林地套裝"] = {28348,28202,27873,27737,27468},
		["野人套裝"] = {5964,5739,4264,5963,4254},
		["北風的擁抱"] = {38402,3843,38404,38405,38591,38433,38437,38400},
		["紅色皮衣套裝"] = {2961,2962},
		["阿博拉茲套裝"] = {55698,55689,55680,55671,55662,55653,55644,55635},
		["邪惡皮甲套裝"] = {15085,15088,15087,15086,15084,15083},
		["吟遊詩人套裝"] = {6552,6558,6553,6557,6556,6554},
		["噬骨套裝"] = {24699,24697,24695,24693,24700,24696,24698,24694},
		["秘術套裝"] = {7527,7532,7527,7528,7531,7534,7530},
		["典禮套裝"] = {3313,3315,54708},
		["裂蹄套裝"] = {2476,24771,24770,24769,24768,24767,24766,24772},
		["兇殘與切喉者搭配套裝"] = {15134,15131,15136,15132,15140,15130,15139,15137},
		["妖鬼套裝"] = {14584,14581,14587,14585,14583,14579,14578,14580},
		["野性套裝"] = {15306,15308,15310,15305,15312,15311},
		["勘察員套裝"] = {14566,14562,14565,14560,14564,-14559,14561},
		["狼騎兵套裝"] = {15373,15376,15374,15370,15375,15372,15369,15377},
		["獵頭者套裝"] = {15353,15356,15357,15358,15350,15355,15349,15351},
		["迪菲亞盜賊"] = {10399,10400,10403,10402,10401,22718},
		["黑暗遊俠"] = {28732,10228,28204,27908,29248,29246,27509,10249},
		["盜賊偽T0"] = {27415,24396,24398,24063,24466,25946,24023,24365},
		["盜賊偽T1"] = {27467,27995,27461,27911,27545,27825,27938},
		["盜賊偽T2（褐色）"] = {28732,28755,28601,28828,28741,28545,28506},
		["盜賊偽T2（藍色）"] = {28206,27831,27787,28124,27514,27867,27765,28396},
		["盜賊偽T8（橙黑）"] = {45893,45677,45940,45709,45324,45302,45869,45312},
		["盜賊偽T8（綠黑）"] = {45523,45453,45265,45491,45141,45232,45108,45325},
		["盜賊偽T10（灰）"] = {51013,51565,50780,50778,51550,51023,51783,50799},
		["盜賊偽T10（暗紅）"] = {50713,50646,50656,50697,50707,50607,50670,50675},
		["盜賊偽T12（橙）"] = {71003,71345,71314,71131,71031,69951,70735,71020},
		["盜賊偽T12（紫）"] = {71416,71456,71455,71641,71402,71467,71428,71440},
		["小德偽T0"] = {27409,27417,24455,24391,24452},
		["小德偽T1"] = {27763,28340,27456,28398,27800,28752,27827,28268},
		["小德偽T2"] = {28220,28255,27818,27783,27492,27914,27483,28214},
		["小德偽T8（紅）"] = {45864,45974,45686,45455,46049,45378,46009,45293},
		["小德偽T8（綠）"] = {45439,45492,45237,45185,45482,45260,45149,45512},
		["小德偽T10"] = {51825,51839,51870,51908,51897,51920,51885,51814},
	},

	-- 鎖甲套裝
	["鎖甲"] = {
		["巨獸之王套裝"] = {28275,27801,28228,27874,27474},
		["野獸追獵者套裝"] = {16677,16679,16674,16680,16681,16676,16678,16675},
		["潮汐之怒套裝"] = {28349,27802,28231,27510,27909},
		["野蠻角斗士套裝"] = {11729,11730,11731,11728,11726},
		["塵霧套裝"] = {16959,16966,16964,16963,16962,16961,16965,16960},
		["勇士套裝-獵人"] = {23251,23252,22874,22875,22843,22862},
		["勇士套裝-薩滿"] = {23259,23260,22876,22887,22857,22867},
		["少校套裝-獵人"] = {23306,23307,23292,23293,23278,23279},
		["少校套裝-薩滿"] = {29598,29599,29595,29594,29597,29596},
		["高階督軍的鏈甲套裝"] = {28807,28809,28805,28806,28808},
		["高階督軍的鱗甲套裝"] = {28843,28845,28841,28844,28842},
		["大元帥的鏈甲套裝"] = {28615,28613,28617,28614,28616},
		["大元帥的鱗甲套裝"] = {28691,28693,28689,28690,28692},
		["嗜血套裝"] = {14804,14798,14799,14805,14806,14803,14802,14807},
		["琥珀松木套裝"] = {36223,36225,36221,36219,36224,36220,36226,36222},
		["鑄鐵套裝"] = {6597,6592,6594,6596,6590,6591,6595},
		["黑爐套裝"] = {6426,4083,6425,4080,6423,4733,4084,4082},
		["血騎士套裝"] = {24865,24866,24862,24869,24867,24864,24863,24868},
		["上尉套裝"] = {7486,7491,7487,7490,7488,7494,7489,7493},
		["獅鷲鎖甲套裝"] = {15622,15627,15623,15628,15619,15625,15620,15626},
		["步兵套裝"] = {15513,15514,15510,15511,15506,15507,15509},
		["硬化蠍殼套裝"] = {8208,8206,8207,8209,8204,8205,8203},
		["厚鱗套裝"] = {15546,15550,15551,15553,15548,15544,15549,15545},
		["散件組成套裝1"] = {27759,27826,27912,27835,27458,27549,28194,27806},
		["散件組成套裝2"] = {25955,25947,24357,24388,24046,25941,27428},
		["散件組成套裝3"] = {28215,28306,28186,27521,27773,27450,27865,30951},
		["散件組成套裝4"] = {27888,28344,27823,27541,28219,27915,27494,27745},
	},

	-- 板甲套裝
	["板甲"] = {
		["巨神"] = {10390,10389,10388,10387,10386,10385,10391,10384},
		["大酋長"] = {14958,14959,14960,14961,14962,14963,14964,14957,14965},
		["霸主"] = {10207,10201,10206,10209,10208,10205,10203,10202,9974},
		["惡魔板甲"] = {10379,10378,10376,10383,10380,10382},
		["暴君"] = {14833,14838,14835,14834,14840,14839,14842,14841,13359},
		["陽麟"] = {14849,14850,14853,14851,14848,14847,14846,14844,59549},
		["翡翠一套"] = {25715,10275,10282,10276,14919,10278,10280},
		["翡翠二套"] = {14919,14921,14915,14918,14920,14913,14914,14917},
		["符記"] = {14821,14832,14831,14830,14828,14827,14826,14829},
		["領軍"] = {14869,14868,14867,14866,14865,14864,14863,14862},
		["矛騎兵"] = {8159,8163,8162,8161,8160,8158,8157,8156},
		["哥特"] = {10090,10094,10092,10088,10087,10089,10086,10091},
		["聖殿騎士"] = {10166,10165,10168,10169,10364,10170,10167,10164,10171},
		["君王"] = {12425,12424,12429,12422,12427,12426,12428},
		["前鋒"] = {14861,15890,14860,14859,14858,14857,14856,14855,14854},
		["崇高"] = {14922,14929,14927,14926,14925,14924,14923,14928},
		["光榮"] = {14967,14972,14973,14971,14970,14969,14968,14966,14974},
		["戰爭使者"] = {14944,14946,14939,14943,14945,14940,14941,14942},
		["光鑄"] = {16727,16729,16726,16723,16728,16725,16722,16724},
		["野蠻薩隆"] = {41349,41347,41352,41354,41348,41353,41351,41350},
		["精飾薩隆"] = {42730,42727,42728,42724,42726,42723,42729,42725},
		["黑鐵"] = {11604,11605,19164,19148,17014,17013},
		["少校"] = {23276,23277,23272,23273,23275,23274},
		["護衛騎士"] = {16429,16406,16405,16431,16430,16432},
		["高階督軍（戰士）"] = {28853,28855,28851,28854,28852},
		["高階督軍（聖騎士）"] = {31639,31638,31637,31636,31635},
		["勇士"] = {23244,23243,22872,22873,22858,22868},
		["山寨光鑄"] = {27408,24457,24021,24458,24364,27420,25942},
		["山寨騎士T1"] = {27505,27844,28337,27755,27893,27884,27447,27798},
		["薩爾酋長"] = {13006,32868,25979,13068,13539,14943,14939},
		["山寨審判"] = {27790,27539,27897,27548,27748,28221,27489,27457},
		["山寨勇氣"] = {24463,24363,24091,24456,24064,25956,24387},
		["山寨力量"] = {27455,28207,27906,28375,27487,27788,27918,28324},
		["山寨憤怒"] = {27520,27847,28262,27672,27527,27813,27459,28390},
		["奧格瑞瑪士兵"] = {7440,7447,7443,7439,7448,7446,7444,9476},
		},
	};


--------------------------------
-- 角色扮演
ItemData["角色扮演"] = {
	-- 名人cosplay
	["名人"] = {
		["梵妮莎·范克里夫"] = {31030,7997,30891,31026,23705,9999,18816},
		["艾德溫·范克里夫"] = {15056,15057,15058,21278,38404,5191,7997,5192},
		["女伯爵莉亞德琳"] = {22427,22431,22425,22429,22424,22430,22426,25549},
		["珊蒂斯·羽月"] = {29046,29045,29047,29044,36390,10131,48711},
		["大檢察官懷特邁恩"] = {7720,14266,14042,14045,30926,30927,30924,25935,23705},
		["大領主達里安·莫格萊尼"] = {46119,46117,46121,46120,46111,43155,39344},
		["奈法利安（人形態）"] = {14623,14624,18722,14537,18547,11840,18817,19360},
		["阿格拉"] = {50830,50844,50842,51006},
		["泰蘭德·語風"] = {18486,13021,24681,3311,4043},
		["佐拉多爾米"] = {29978,7523,19597,23323},
		["女伯爵卡特拉娜·普瑞斯托"] = {19145,943},
		["羅寧"] = {46130,46132,46133,46134,49793},
		["溫蕾薩·風行者"] = {35036,35034,35032,35035,46817},
		["哈繆爾·符文圖騰"] = {44694,70554,51425,48162,47690,45256},
		["大法師瓦格斯"] = {22062,29988,22068,22067,22066,22064,22069,7470},
	},

	-- 主城衛兵
	["衛兵"] = {
		["奧格瑞瑪步兵"] = {7532,14601,7443,7448,7440,7444,2523},
		["雷霆崖守衛"] = {15311,15312,15308,15305,7482,3210},
		["鐵爐堡守衛"] = {33435,24924,6796,24920,24921,24918,24923,24919,24925,4825,6187},
		["暴風城衛兵"] = {12427,12428,12422,24969,39087,12429,12426,15210,53598,45574},
		["鐵爐堡巡山人"] = {24673,17742,9455,1304,23828,9291,7522,15263,25278},
		["暗夜哨兵"] = {15602,8138,31164,27430,9601,25148},
		["暗夜飛行管理員"] = {14858,15513,8349,6628,31228,10045,28493,7956},
		["精英亡靈衛兵"] = {4323,42952,54757,1853,286,31214,31164,853},
		["女獵手萊維·烏木"] = {4058,4731,6419,6420,6421,24899,7432},
		["銀月城守衛"] = {34666,34185,13369,34399,14232},
	},

	-- 種族軍需官
	["軍需官"] = {
		["月之女祭司娜薩拉"] = {21874,21875,21873,45439,45579},
		["騎士隊長蘭希·萊薇森"] = {45574,16483,16479,16484,16480,16477},
		["卡杜"] = {29064,45580,29072,29071,29074},
		["石盔上尉"] = {40778,40836,40797,40856,45577},
		["勇士烏拉金"] = {69573,69562,69557,69619,69593,12587},
		["弗里茲·維拉馬爾"] = {15053,14111,19139,15054,64884},
		["梅姬思·妮薩拉"] = {14042,34405,34393,34406,34386,34574,45585,34337},
	},

	-- 陣營成員
	["陣營成員"] = {
		["狂怒的海加爾守望者"] = {30116,30118,30119,30122,29171,65906,30081},
		["肯瑞託法師"] = {44647,4661,5766,7526,37942,43157,28269},
		["血騎士"] = {15640,15646,15644,15647,15641,15642,15639,29362,27449,25549,29937},
		["火焰德魯伊"] = {50725,65211,65212,65213,65209,65069},
		["猛禽德魯伊"] = {62941,62936,62954,15513,22109,62945,47384},
		["補給官阿羅克"] = {25999,26000,25997,26001},
		["克勞·麥克格羅"] = {15513,65908,15507,15510,15511,5739,11684},
		["魯娜·怒藤"] = {51920,31546,51908,51814,51870,51839,28604},
		["海加爾德魯伊"] = {31989,31988,31991,31987,31990,59205},
	},

	-- 敵對勢力
	["敵對勢力"] = {
		["贊達拉聖職者"] = {29050,29053,29057,28604},
		["贊達拉主宰"] = {29022,29016,29020,29012,28754,28729},
		["尖牙德魯伊"] = {10140,22225,10412,6473,10413,10411},
		["鐵怒隊長"] = {8082,63243,8083,8086,8085,8084,8081,8080},
		["血色追隨者"] = {4313,2527,7062,23192,33228,10033},
		["暮光預言者"] = {42985,34828,20407,13937,32235},
		["辛德拉靈魂"] = {19597,10041,21671,1155},
		["辛德拉狂熱者"] = {14421,19438,9826},
		["上層精靈騙術師"] = {19145,13185,2847,18808,19438},
		["裂盾軍團戰士"] = {10203,10208,10209,10205,10206,10201,28166,25211},
		["贊達拉執政官"] = {29079,29077,29080,29078,33283},
	},
};

--------------------------------
-- 經典武器
--[[
ItemData["classic"] = {

};
]]
--------------------------------
-- 偽職業套裝
ItemData["偽職業套裝"] = {
	-- 盜賊
	["潛行者"] = {
		["T1 夜幕殺手套裝"] = {16827,16824,16825,16820,16821,16826,16822,16823},
		["T2 血牙套裝"] = {16910,16906,16911,16905,16907,16908,16909,16832},
		["T3 骨鐮套裝"] = {22483,22476,22481,22478,22477,22479,22480,22482,23060},
		["T4 虛空刀鋒套裝"] = {29046,29045,29044,29048,29047},
		["T5 死亡陰影套裝"] = {30144,30145,30146,30148,30149},
		["T6 刺殺者套裝"] = {31028,31026,31027,31029,31030,34575,34448,34558},
		["T7 骨鐮戰甲套裝"] = {39558,39560,39561,39564,39565},
		["T8 恐怖利刃套裝"] = {45396,45397,45398,45399,45400},
		["T9 迦羅娜套裝"] = {48243,48244,48245,48246,48247},
		["T9 范克里夫套裝"] = {48218,48219,48220,48221,48222},
		["T10 影刃套裝"] = {50087,50088,50089,50090,50105},
		["T11 風舞者套裝"] = {60302,60300,60299,60298,60301},
		["T12 黑暗鳳凰套裝"] = {71045,71046,71047,71048,71049},
		["S1 角斗士套裝"] = {25834,25833,25830,25832,25831},
		["S2 殘酷角斗士套裝"] = {16827,16824,16825,16820,16821,16826,16822,16823},
		["S3 復仇角斗士套裝"] = {33700,33701,33702,33703,33704},
		["S4 野蠻角斗士套裝"] = {35032,35033,35034,35035,35036},
		["S5 致命角斗士套裝"] = {30144,30145,30146,30148,30149},
		["S6 狂怒角斗士套裝"] = {41650,41655,41672,41683,41767},
		["S7 無情角斗士套裝"] = {41651,41656,41673,41684,41768},
		["S8 暴怒角斗士套裝"] = {51492,51493,51494,51495,51496},
		["S9 殘忍角斗士套裝"] = {60460,60462,60458,60459,60461},
		["S10 冷酷角斗士套裝"] = {70294,70295,70296,70297,70298},
	},

	-- 德魯伊
	["德魯伊"] = {
		["T1 塞納里奧套裝"] = {16828,16829,16830,16833,16831,16834,16835,16836},
		["T2 怒風套裝"] = {16903,16898,16904,16897,16900,16899,16901,16902},
		["T3 夢遊者套裝"] = {22492,22494,22493,22490,22489,22491,22488,22495,23064},
		["T4 瑪洛恩套裝"] = {29087,29086,29090,29088,29089},
		["T5 諾達希爾套裝"] = {30216,30217,30219,30220,30221},
		["T6 雷霆之心套裝"] = {31041,31032,31037,31045,31047,34571,34445,34554},
		["T7 夢遊者套裝"] = {40460,40461,40462,40463,40465},
		["T8 夜歌套裝"] = {46183,46184,46185,46186,46187},
		["T9 伊哈繆爾的凱旋套裝"] = {48133,48134,48135,48136,48137},
		["T9 瑪法里奧的凱旋套裝"] = {48148,48149,48150,48151,48152},
		["T10 樹紋套裝"] = {50106,50107,50108,50109,50113},
		["T11 風暴套裝"] = {60280,60277,60278,60276,60279},
		["T12 琉璃織木套裝"] = {71107,71108,71109,71110,71111},
		["S1 角斗士套裝"] = {28126,28127,28128,28129,28130},
		["S2 殘酷角斗士套裝"] = {31967,31968,31969,31971,31972},
		["S3 復仇角斗士套裝"] = {33671,33672,33673,33674,33675},
		["S4 野蠻角斗士套裝"] = {34998,34999,35000,35001,35002},
		["S5 致命角斗士套裝"] = {41660,41666,41677,41714,41772},
		["S6 狂怒角斗士套裝"] = {41661,41667,41678,41715,41773},
		["S7 無情角斗士套裝"] = {41662,41668,41679,41716,41774},
		["S8 暴怒角斗士套裝"] = {51419,51420,51421,51422,51424},
		["S9 殘忍角斗士套裝"] = {60449,60452,60451,60448,60450},
		["S10 冷酷角斗士套裝"] = {70284,70285,70286,70287,70288},
	},

	-- 法師
	["法師"] = {
		["T1 奧術師套裝"] = {16802,16799,16795,16800,16801,16796,16797,16798},
		["T2 靈風套裝"] = {16818,16918,16912,16914,16917,16913,16915,16916},
		["T3 霜火套裝"] = {22502,22503,22498,22501,22497,22496,22500,22499,23062},
		["T4 奧爾多套裝"] = {29076,29080,29078,29079,29077},
		["T5 提瑞斯法套裝"] = {30206,30205,30207,30210,30196},
		["T6 風暴套裝"] = {31056,31055,31058,31059,31057,34574,34447,34557},
		["T7 霜火套裝"] = {39491,39492,39493,39494,39495},
		["T8 肯瑞托套裝"] = {45365,45367,45368,45369,46131},
		["T9 卡德加套裝"] = {47748,47749,47750,47751,47752},
		["T9 逐日者套裝"] = {47773,47774,47775,47776,47777},
		["T10 血法套裝"] = {50275,50276,50277,50278,50279},
		["T11 火焰之王套裝"] = {60246,60244,60245,60243,60247},
		["T12 火鷹套裝"] = {71290,71286,71287,71288,71289},
		["S1 角斗士套裝"] = {25854,25855,25857,25856,25858},
		["S2 殘酷角斗士套裝"] = {32047,32048,32049,32050,32051},
		["S3 復仇角斗士套裝"] = {33757,33758,33759,33760,33761},
		["S4 野蠻角斗士套裝"] = {35096,35097,35098,35099,35100},
		["S5 致命角斗士套裝"] = {41945,41951,41958,41964,41970},
		["S6 狂怒角斗士套裝"] = {41946,41953,41959,41965,41971},
		["S7 無情角斗士套裝"] = {41947,41954,41960,41966,41972},
		["S8 暴怒角斗士套裝"] = {51463,51464,51465,51466,51467},
		["S9 殘忍角斗士套裝"] = {60464,60467,60466,60463,60465},
		["S10 冷酷角斗士套裝"] = {70454,70455,70461,70462,70463},
	},

	-- 獵人
	["獵人"] = {
		["T1 巨人追獵者套裝"] = {16851,16849,16850,16845,16848,16852,16846,16847},
		["T2 巨龍追獵者套裝"] = {16936,16935,16942,16940,16941,16939,16938,16937},
		["T3 地穴追獵者套裝"] = {22440,22442,22441,22438,22437,22439,22436,22443,23067},
		["T4 惡魔追獵者套裝"] = {29085,29081,29083,29082,29084},
		["T5 裂隙追獵者套裝"] = {30139,30140,30141,30142,30143},
		["T6 戈隆追獵者套裝"] = {31004,31001,31003,31005,31006,34549,34443,34570},
		["T7 英雄地穴追獵者戰甲"] = {39578,39579,39580,39581,39582},
		["T8 天災追獵者套裝"] = {45360,45361,45362,45363,45364},
		["T9 風行者的戰甲"] = {48250,48251,48252,48253,48254},
		["T9 風行者的獵裝"] = {48270,48271,48272,48273,48274},
		["T10 安卡哈獵血戰甲"] = {50114,50115,50116,50117,50118},
		["T11 閃電充能套裝"] = {60306,60305,60303,60307,60304},
		["T12 火妖套裝"] = {71050,71051,71052,71053,71054},
		["S1 角斗士套裝"] = {28334,28335,28331,28332,28333},
		["S2 殘酷角斗士套裝"] = {31960,31961,31962,31963,31964},
		["S3 復仇角斗士套裝"] = {33664,33665,33666,33667,33668},
		["S4 野蠻角斗士套裝"] = {34990,34991,34992,34993,34994},
		["S5 憎恨角斗士套裝"] = {41085,41141,41155,41203,41215},
		["S6 狂怒角斗士套裝"] = {41087,41143,41157,41205,41217},
		["S7 無情角斗士套裝"] = {41088,41144,41158,41206,41218},
		["S8 暴怒角斗士套裝"] = {51458,51459,51460,51461,51462},
		["S9 殘忍角斗士套裝"] = {60425,60427,60423,60424,60426},
		["S10 冷酷角斗士套裝"] = {70434,70435,70440,70441,70476},
	},

	-- 牧師
	["牧師"] = {
		["T1 預言套裝"] = {16811,16813,16817,16812,16814,16816,16815,16819},
		["T2 卓越套裝"] = {16925,16926,16919,16921,16920,16922,16924,16923},
		["T3 信仰套裝"] = {22518,22519,22514,22517,22513,22512,22516,22515,23061},
		["T4 化身套裝"] = {29057,29059,29056,29058,29060},
		["T5 神使套裝"] = {30160,30161,30162,30159,30163},
		["T6 赦免套裝"] = {31068,31063,31060,31069,31066,34562,34527,34435},
		["T7 英雄信仰套裝"] = {39514,39515,39517,39518,39519},
		["T8 聖靈套裝"] = {45391,45392,45393,45394,45395},
		["T9 薩布拉的法衣"] = {48097,48098,48099,48100,48101},
		["T9 維倫的聖裝"] = {47914,47936,47980,47981,47982},
		["T10 血色侍僧法衣"] = {50391,50392,50393,50394,50396},
		["T11 水銀魔裝"] = {60253,60254,60255,60256,60257},
		["T12 淨化烈焰法衣"] = {71280,71279,71278,71277,71276},
		["督軍的神服"] = {17623,17625,17622,17624,17618,17620},
		["元帥的神服"] = {17604,17603,17605,17608,17607,17602},
		["S1 角斗士的神服"] = {27707,27708,27709,27710,27711},
		["S2 殘酷角斗士套裝"] = {32034,32035,32036,32037,32038},
		["S3 復仇角斗士套裝"] = {33744,33745,33746,33747,33748},
		["S4 野蠻角斗士套裝"] = {35083,35084,35085,35086,35087},
		["S5 致命角斗士套裝"] = {41913,41919,41925,41931,41938},
		["S6 狂怒角斗士套裝"] = {41915,41921,41927,41934,41940},
		["s7 無情角斗士套裝"] = {41916,41922,41928,41935,41941},
		["S8 暴怒角斗士套裝"] = {51487,51488,51489,51490,51491},
		["S9 殘忍角斗士套裝"] = {60474,60477,60473,60476,60475},
		["S10 冷酷角斗士套裝"] = {70309,70310,70311,70312,70313},
	},

	-- 薩滿祭司
	["薩滿祭司"] = {
		["T1 大地之怒套裝"] = {16838,16837,16840,16841,16844,16839,16842,16843},
		["T2 無盡風暴套裝"] = {16944,16943,16950,16945,16948,16949,16947,16946},
		["T3 碎地者套裝"] = {22468,22470,22469,22466,22465,22467,22464,22471,23065},
		["T4 颶風套裝"] = {29032,29029,29028,29030,29031},
		["T5 災難套裝"] = {30164,30165,30166,30167,30168},
		["T6 破天套裝"] = {31016,31007,31012,31019,31022,34543,34438,34565},
		["T7 碎地者套裝"] = {40514,40515,40516,40517,40518},
		["T8 世界擊碎者套裝"] = {46200,46203,46205,46208,46212},
		["T9 努波頓套裝"] = {48290,48291,48292,48293,48294},
		["T9 薩爾套裝"] = {48305,48306,48307,48308,48309},
		["T10 霜巫套裝"] = {51245,51246,51247,51248,51249},
		["T11 狂暴元素套裝"] = {60322,60321,60320,60319,60318},
		["T12 火山套裝"] = {71300,71299,71298,71297,71296},
		["S1 角斗士套"] = {31396,31397,31400,31406,31407},
		["S2 殘酷角斗士套裝"] = {32029,32030,32031,32032,32033},
		["S3 復仇角斗士套裝"] = {33738,33739,33740,33741,33742},
		["S4 野蠻角斗士套裝"] = {35077,35078,35079,35080,35081},
		["S5 致命角斗士套裝"] = {40990,41000,41012,41026,41037},
		["S6 狂怒角斗士套裝"] = {40992,41001,41013,41027,41038},
		["S7 無情角斗士套裝"] = {40994,41002,41014,41028,41039},
		["S8 暴怒角斗士套裝"] = {51497,51498,51499,51500,51502},
		["S9 殘忍角斗士套裝"] = {60432,60430,60428,60429,60431},
		["S10 冷酷角斗士套裝"] = {70264,70265,70266,70267,70268},
	},

	-- 聖騎士
	["聖騎士"] = {
		["T1 秩序之源套裝"] = {16858,16859,16857,16853,16860,16854,16855,16856},
		["T2 審判套裝"] = {16952,16951,16958,16955,16956,16954,16957,16953},
		["T3 救贖套裝"] = {22430,22431,22426,22428,22427,22429,22425,22424,23066},
		["T4 公正套裝"] = {29062,29061,29065,29063,29064},
		["T5 晶鑄套裝"] = {30134,30135,30136,30137,30138},
		["T6 光明使者套裝"] = {30992,30983,30988,30994,30996,34432,34487,34559},
		["T7 救贖套裝"] = {40569,40570,40571,40572,40573},
		["T8 庇護套裝"] = {46152,46153,46154,46155,46156},
		["T9 圖拉揚"] = {48580,48581,48582,48583,48584},
		["T9 莉亞德琳套裝"] = {48585,48586,48587,48588,48589},
		["T10 光誓套裝"] = {51270,51271,51272,51273,51274},
		["T11 鋼化碧晶套裝"] = {60362,60361,60359,60363,60360},
		["T12 神祭套裝"] = {71512,71513,71514,71515,71516},
		["S1 角斗士套裝"] = {27702,27703,27704,27705,27706},
		["S2 殘酷角斗士套裝"] = {31992,31993,31995,31996,31997},
		["S3 復仇角斗士套裝"] = {33695,33696,33697,33698,33699},
		["S4 野蠻角斗士套裝"] = {35027,35028,35029,35030,35031},
		["S5 致命角斗士套裝"] = {40905,40926,40932,40938,40962},
		["S6 狂怒角斗士套裝"] = {40907,40927,40933,40939,40963},
		["S7 無情角斗士套裝"] = {40910,40928,40934,40940,40964},
		["S8 暴怒角斗士套裝"] = {51468,51469,51470,51471,51473},
		["S9 殘忍角斗士套裝"] = {60603,60605,60601,60602,60604},
		["S10 冷酷角斗士套裝"] = {70415,70416,70417,70418,70419},
	},

	-- 術士
	["術士"] = {
		["T1 惡魔之心套裝"] = {16806,16804,16805,16810,16809,16807,16808,16803},
		["T2 復仇套裝"] = {16933,16927,16934,16928,16930,16931,16929,16932},
		["T3 天災之心套裝"] = {22510,22511,22506,22509,22505,22504,22508,22507,23063},
		["T4 虛空之心套裝"] = {28963,28968,28966,28967,28964},
		["T5 腐蝕者套裝"] = {30211,30212,30213,30215,30214},
		["T6 凶星套裝"] = {31050,31051,31053,31054,31052,34564,34436,34541},
		["T7 英雄天災之心套裝"] = {39496,39497,39498,39499,39500},
		["T8 死亡信使套裝"] = {45417,45419,45420,45421,45422},
		["T9 古爾丹的法衣"] = {47783,47784,47785,47786,47787},
		["T9 克爾蘇加德的法衣"] = {47798,47799,47800,47801,47802},
		["T10 黑巫套裝"] = {50240,50241,50242,50243,50244},
		["T11 暗影烈焰魔裝套裝"] = {60252,60251,60250,60249,60248},
		["T12 邪蛛的燃燒法衣"] = {71281,71283,71282,71284,71285},
		["S1 角斗士的魔能套裝"] = {30186,30187,30188,30200,30201},
		["S2 殘酷角斗士套裝"] = {31979,31980,31981,31982,31983},
		["S3 復仇角斗士套裝"] = {33682,33683,33684,33685,33686},
		["S4 野蠻角斗士套裝"] = {35032,35033,35034,35035,35036},
		["S5 致命角斗士套裝"] = {41992,41997,42004,42010,42016},
		["S6 狂怒角斗士套裝"] = {41993,41998,42005,42011,42017},
		["s7 無情角斗士套裝"] = {41994,41999,42006,42012,42018},
		["S8 暴怒角斗士套裝"] = {51536,51537,51538,51539,51540},
		["S9 殘忍角斗士套裝"] = {60479,60482,60481,60478,60480},
		["S10 冷酷角斗士套裝"] = {70425,70426,70427,70468,70469},
	},

	-- 死亡騎士
	["死亡騎士"] = {
		["T7 英雄的天災苦痛戰甲"] = {39617,39618,39619,39620,39621},
		["T8 黑暗符印戰甲套裝"] = {46113,46116,46117,46111,46115},
		["T9 庫爾迪拉的戰甲"] = {48501,48502,48503,48504,48505},
		["T9 薩薩里安的戰甲"] = {48472,48474,48476,48478,48480},
		["T10 天災領主戰鎧"] = {50853,50854,50855,50856,50857},
		["T11 熔岩板甲戰甲套裝"] = {60339,60340,60341,60342,60343},
		["T12 死亡源質套裝"] = {71058,71059,71060,71061,71062},
		["S4 野蠻角斗士的恐怖板甲"] = {40440,40441,40442,40443,40444},
		["S5 致命角斗士的恐怖板甲"] = {40784,40806,40824,40845,40863},
		["S6 狂怒角斗士的恐怖板甲"] = {40787,40809,40827,40848,40868},
		["S7 無情角斗士的恐怖板甲"] = {40791,40811,40830,40851,40871},
		["S8 暴怒角斗士的恐怖板甲"] = {51413,51414,51415,51416,51418},
		["S9 殘忍角斗士的恐怖板甲"] = {60410,60412,60408,60409,60411},
		["S10 冷酷角斗士的恐怖板甲"] = {70244,70245,70246,70247,70248},
	},

	-- 戰士
	["戰士"] = {
		["T1 力量套裝"] = {16864,16861,16865,16863,16866,16867,16868,16862},
		["T2 憤怒套裝"] = {16959,16966,16964,16963,16962,16961,16965,16960},
		["T3 無畏套裝"] = {22423,22416,22421,22422,22418,22417,22419,22420,23059},
		["T4 戰神套裝"] = {29021,29019,29020,29022,29023},
		["T5 毀滅套裝"] = {30120,30118,30119,30121,30122},
		["T6 衝鋒套裝"] = {30972,30975,30969,30977,30979,34546,34441,34569},
		["T7 無畏套裝"] = {40525,40527,40528,40529,40530},
		["T8 突圍套裝"] = {46146,46148,46149,46150,46151},
		["T9 地獄咆哮的凱旋套裝"] = {48391,48392,48393,48394,48395},
		["T9 烏瑞恩的凱旋套裝"] = {48376,48377,48378,48379,48380},
		["T10 伊米亞之王套裝"] = {50078,50079,50080,50081,50082},
		["T11 土靈套裝"] = {60327,60324,60325,60326,60323},
		["T12 力量套裝"] = {71072,71071,71069,71068,71070},
		["S1 角斗士套裝"] = {24544,24549,24545,24547,24546},
		["S2 殘酷角斗士套裝"] = {30486,30487,30488,30489,30490},
		["S3 復仇角斗士套裝"] = {33728,33729,33730,33731,33732},
		["S4 野蠻角斗士套裝"] = {35066,35067,35068,35069,35070},
		["S5 致命角斗士套裝"] = {40786,40804,40823,40844,40862},
		["S6 狂怒角斗士套裝"] = {40789,40807,40826,40847,40866},
		["S7 無情角斗士套裝"] = {41651,41656,41673,41684,41768},
		["S8 暴怒角斗士套裝"] = {51541,51542,51543,51544,51545},
		["S9 殘忍角斗士套裝"] = {60420,60422,60418,60419,60421},
		["S10 冷酷角斗士套裝"] = {70254,70255,70256,70257,70258},
	},
};