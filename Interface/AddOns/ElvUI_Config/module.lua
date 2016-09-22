local E, L, V, P, G, _ = unpack(ElvUI); --Engine
local class = select(2, UnitClass("player"));
local format = string.format

local function GIF(id, noType)
	local name,_,_,_,_,_,mtype = GetItemInfo(id)
	if name then
		if noType then
			return name;
		elseif mtype then
			return '['..mtype..'] '..name;
		else
			return NONE
		end
	else
		return NONE
	end
end

local function GSI(id)
	local name, _ = GetSpellInfo(id)
	if name then
		return name
	else
		return NONE
	end
end

E.Options.args.modules = {
	type = "group",
	name = '|cffFF0000'..L["modules"],
	desc = L["modules_desc"],
	childGroups = "tree",
	get = function(info) return E.db.modules[ info[#info] ] end,
	set = function(info, value) E.db.modules[ info[#info] ] = value end,
	args = {
		readme = {
			order = 0,
			type = 'description',
			fontSize = "medium",
			name = L["modules_desc"],
		},
		spacer1 = {
			order = 1,
			type = 'description',
			name = ' ',
		},		
		moduleTarget = {
			order = 10,
			type = 'select',
			name = L['module target'],
			disabled = function() return not tMorphLoaded; end,
			values = {
				['player'] = PLAYER,
				['target'] = TARGET,
			},
		},
		morph = {
			order = 11,
			type = "select",
			name = L["morph"],
			disabled = function() return not tMorphLoaded; end,
			values = {
				[0] = DEFAULT,
				[44538] = '星界人',
				[7550] = GIF(8529, true),
				[4617] = '男海盗(美味风蛇)',
				[4618] = '女海盗(美味风蛇)',
				[4620] = '男忍者(美味风蛇)',
				[4619] = '女忍者(美味风蛇)',
				[28227] = "阿莱克丝塔萨",
				[38754] = "诺兹多姆",
				[35253] = "伊瑟拉",
				[39450] = "卡雷苟斯",
				[18720] = "麦迪文",
				[28127] = "瓦里安·乌瑞恩国王",
				[50181] = "希尔瓦娜斯·风行者", 
				[51610] = "吉安娜·普罗德摩尔", 
				[36056] = "萨尔", 
				[30721] = "巫妖王",
				[39183] = "伊利丹·怒风",
				[32904] = '脑残吼',
				[38150] = '火猫',
				[43760] = '盔甲熊',
			},
			set = function(info, value)
				E.db.modules.morph = value;
				Morph(E.db.modules.moduleTarget,value);
				UpdateModel(E.db.modules.moduleTarget);
			end,
		},
		scale = {
			order = 12,
			type = 'range',
			name = L['module sacle'],
			min = 0.2, max = 5, step = 0.1,
			disabled = function() return not tMorphLoaded; end,
			set = function(info, value)
				E.db.modules.scale = value;
				SetScale(E.db.modules.moduleTarget, value)
			end,
		},
		mount = {
			order = 13,
			type = "select",
			name = L["mount"],
			disabled = function() return not tMorphLoaded; end,
			values = {
				[0] = DEFAULT,
				[29161] = GSI(64731),
				[28890] = GSI(63796),
				[15676] = GSI(25863),
				[17890] = GSI(40192),
				[25511] = GSI(72807),
				[31007] = GSI(72286),
				[48714] = GSI(142878),
				[55896] = GSI(163024),
				[53038] = GSI(153489),
				[17890] = GSI(44194),
				[21974] = GSI(42777),
				[29344] = GSI(65917),
				[31721] = GSI(74918),
				[46087] = GSI(127170),
				[31958] = GSI(75614),
				[51323] = GSI(147595),
				[53774] = GSI(155741),
				[27567] = GSI(58983),
				[43254] = GSI(124659),
				[22464] = GSI(98204),
				[34955] = GIF(67151, true),
				[43637] = GSI(126507),
				[43638] = GSI(126508),
				[37160] = GSI(92231),
			},
			set = function(info, value)
				E.db.modules.mount = value;
				MorphMount(E.db.modules.moduleTarget,value);
				UpdateModel(E.db.modules.moduleTarget);
			end,
		},
		race = {
			order = 14,
			type = "select",
			name = RACE,
			disabled = function() return not tMorphLoaded; end,
			values = {
				[0] = DEFAULT,
				[1] = '人类',
				[2] = '兽人',
				[3] = '矮人',
				[4] = '暗夜精灵',
				[5] = '亡灵',
				[6] = '牛头人',
				[7] = '矮人',
				[8] = '巨魔',
				[9] = '地精',
				[10] = '血精灵',
				[11] = '德莱尼',
				[14] = '破碎者',			
				[22] = '狼人',
				[24] = '熊猫人',
			},
			set = function(info, value)
				E.db.modules.race = value;
				MorphRace(E.db.modules.moduleTarget,value);
				UpdateModel(E.db.modules.moduleTarget);
			end,
		},
		spacer = {
			order = 15,
			type = 'description',
			name = ' ',
		},
		enchant_1 = {
			order = 16,
			type = "select",
			name = L['Enchant_1'],
			disabled = function() return not tMorphLoaded; end,
			values = {
				[0] = DEFAULT,
				[4717] = GIF(79061, true),
				[4445] = GIF(74727, true),
				[4442] = GIF(74724, true),
				[4441] = GIF(74723, true),
				[4443] = GIF(74725, true),
				[4444] = GIF(74726, true),
				[4446] = GIF(74728, true),
				[4099] = GIF(52776, true),
				[4067] = GIF(52748, true),
				[4074] = GIF(52755, true),
				[4083] = GIF(52760, true),
				[4098] = GIF(52775, true),
				[4097] = GIF(52774, true),
				[2671] = GIF(35462, true),
				[2673] = GIF(38925, true),
				[2674] = GIF(38926, true),
				[2672] = GIF(38924, true),
				[4746] = GIF(38917, true),
				[2668] = GIF(38920, true),
				[2669] = GIF(38921, true),
				[3846] = GIF(38946, true),
			},
			set = function(info, value)
				E.db.modules.enchant_1 = value;
				E:ExecuteChatCommand('.enchant 1 '..value);
			end,
		},
		enchant_2 = {
			order = 17,
			type = "select",
			name = L['Enchant_2'],
			disabled = function() return not tMorphLoaded; end,
			values = {
				[0] = DEFAULT,
				[4717] = GIF(79061, true),
				[4445] = GIF(74727, true),
				[4442] = GIF(74724, true),
				[4441] = GIF(74723, true),
				[4443] = GIF(74725, true),
				[4444] = GIF(74726, true),
				[4446] = GIF(74728, true),
				[4099] = GIF(52776, true),
				[4067] = GIF(52748, true),
				[4074] = GIF(52755, true),
				[4083] = GIF(52760, true),
				[4098] = GIF(52775, true),
				[4097] = GIF(52774, true),
				[2671] = GIF(35462, true),
				[2673] = GIF(38925, true),
				[2674] = GIF(38926, true),
				[2672] = GIF(38924, true),
				[4746] = GIF(38917, true),
				[2668] = GIF(38920, true),
				[2669] = GIF(38921, true),
				[3846] = GIF(38946, true),
			},
			set = function(info, value)
				E.db.modules.enchant_2 = value;
				E:ExecuteChatCommand('.enchant 2 '..value);
			end,
		},
		spacer = {
			order = 18,
			type = 'description',
			name = '',
		},		
		item_1 = {
			order = 19,
			type = "select",
			name = L['item module slot'],
			values = {
				-- [1] = '头部',
				-- [3] = '肩部',
				-- [4] = '衬衣',
				-- [5] = '胸部',
				-- [6] = '腰部',
				-- [7] = '腿部',
				-- [8] = '脚',
				-- [9] = '护腕',
				-- [10] = '手',
				-- [15] = '背部',
				[16] = L['Main Hand'],
				[17] = L['Offhand'],
			},
		},
		item_2 = {
			order = 20,
			type = "select",
			name = L['item module'],
			values = {
				[13262] = GIF(13262),
				[118408] = GIF(118408),
				[118399] = GIF(118399),
				[118398] = GIF(118398),
				[118395] = GIF(118395),
				[118396] = GIF(118396),
				[118397] = GIF(118397),
				[118405] = GIF(118405),
				[118413] = GIF(118413),
				[118409] = GIF(118409),
				[118412] = GIF(118412),
				[118401] = GIF(118401),
				[118402] = GIF(118402),
				[118403] = GIF(118403),
				[118404] = GIF(118404),
				[118411] = GIF(118411),
				[118410] = GIF(118410),
				[118406] = GIF(118406),
				[118407] = GIF(118407),
			},
		},
		appleItem = {
			order = 21,
			type = 'execute',
			name = L['apple item module'],
			disabled = function() return not tMorphLoaded; end,
			func = function()
				E:ExecuteChatCommand('.item '..E.db.modules.item_1..' '..E.db.modules.item_2);
			end,
		},
		ResetModule = {
			order = 100,
			type = 'execute',
			name = L['MODULE RESET'],
			width = 'full',
			disabled = function() return not tMorphLoaded; end,
			func = function()
				E:CopyTable(E.db.modules, P.modules);
				E:ExecuteChatCommand('.reset');
				SetScale(E.db.modules.moduleTarget, 1)
			end,
		},			
	},
}