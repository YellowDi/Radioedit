
EncounterDetailsDB = {
	["emotes"] = {
		{
			["boss"] = "萨格拉斯的恶犬",
		}, -- [1]
		{
			{
				7.52699999999459, -- [1]
				"|TInterface\\ICONS\\ABILITY_MAGE_FIRESTARTER.BLP:20|t你已成为了|cFFF00000|Hspell:244410|h[屠戮]|h|r的目标！", -- [2]
				"屠戮者", -- [3]
				2, -- [4]
			}, -- [1]
			{
				7.52699999999459, -- [1]
				"武器装填完毕，目标已锁定。", -- [2]
				"加洛西灭世者", -- [3]
				7, -- [4]
			}, -- [2]
			{
				23.4320000000007, -- [1]
				"一个不留。", -- [2]
				"加洛西灭世者", -- [3]
				7, -- [4]
			}, -- [3]
			{
				39.1109999999972, -- [1]
				"需要消灭目标。", -- [2]
				"加洛西灭世者", -- [3]
				7, -- [4]
			}, -- [4]
			{
				53.8470000000016, -- [1]
				"|TInterface\\ICONS\\Ability_BossFelMagnaron_HandEmpowered.blp:20|t%s正在为|cFFF00000|Hspell:244152|h[天启引擎]|h|r积蓄能量！", -- [2]
				"加洛西灭世者", -- [3]
				1, -- [4]
			}, -- [5]
			{
				53.8470000000016, -- [1]
				"天启引擎启动。", -- [2]
				"加洛西灭世者", -- [3]
				7, -- [4]
			}, -- [6]
			{
				72.0970000000016, -- [1]
				"|TInterface\\ICONS\\ABILITY_WARRIOR_COLOSSUSSMASH.BLP:20|t加洛西灭世者往后一倾，准备施放|cFFF00000|Hspell:244969|h[根除]|h|r！快跑！", -- [2]
				"加洛西灭世者", -- [3]
				1, -- [4]
			}, -- [7]
			{
				72.0970000000016, -- [1]
				"系统重启，能量改道。武器装填完毕。", -- [2]
				"加洛西灭世者", -- [3]
				7, -- [4]
			}, -- [8]
			{
				90.3159999999989, -- [1]
				"|TInterface\\ICONS\\ABILITY_MAGE_FIRESTARTER.BLP:20|t你已成为了|cFFF00000|Hspell:244410|h[屠戮]|h|r的目标！", -- [2]
				"屠戮者", -- [3]
				2, -- [4]
			}, -- [9]
			{
				90.3159999999989, -- [1]
				"发现目标。", -- [2]
				"加洛西灭世者", -- [3]
				7, -- [4]
			}, -- [10]
			{
				106.159999999996, -- [1]
				"武器装填完毕，目标已锁定。", -- [2]
				"加洛西灭世者", -- [3]
				7, -- [4]
			}, -- [11]
			{
				121.978999999999, -- [1]
				"|TInterface\\ICONS\\ABILITY_MAGE_FIRESTARTER.BLP:20|t你已成为了|cFFF00000|Hspell:244410|h[屠戮]|h|r的目标！", -- [2]
				"屠戮者", -- [3]
				2, -- [4]
			}, -- [12]
			{
				121.978999999999, -- [1]
				"武器装填完毕，目标已锁定。", -- [2]
				"加洛西灭世者", -- [3]
				7, -- [4]
			}, -- [13]
			{
				137.805, -- [1]
				"发现目标。", -- [2]
				"加洛西灭世者", -- [3]
				7, -- [4]
			}, -- [14]
			{
				141.386999999995, -- [1]
				"|TInterface\\ICONS\\Ability_BossFelMagnaron_HandEmpowered.blp:20|t%s正在为|cFFF00000|Hspell:244152|h[天启引擎]|h|r积蓄能量！", -- [2]
				"加洛西灭世者", -- [3]
				1, -- [4]
			}, -- [15]
			{
				141.386999999995, -- [1]
				"天启引擎启动。", -- [2]
				"加洛西灭世者", -- [3]
				7, -- [4]
			}, -- [16]
			{
				154.382999999994, -- [1]
				"|TInterface\\ICONS\\ABILITY_WARRIOR_COLOSSUSSMASH.BLP:20|t加洛西灭世者往后一倾，准备施放|cFFF00000|Hspell:244969|h[根除]|h|r！快跑！", -- [2]
				"加洛西灭世者", -- [3]
				1, -- [4]
			}, -- [17]
			{
				154.382999999994, -- [1]
				"系统重启，能量改道。武器装填完毕。", -- [2]
				"加洛西灭世者", -- [3]
				7, -- [4]
			}, -- [18]
			["boss"] = "加洛西灭世者",
		}, -- [2]
	},
	["encounter_spells"] = {
		[246220] = {
			["school"] = 1,
			["type"] = "DEBUFF",
			["token"] = {
				["SPELL_AURA_APPLIED"] = true,
			},
			["source"] = "加洛西灭世者",
		},
		[253300] = {
			["school"] = 4,
			["token"] = {
				["SPELL_DAMAGE"] = true,
			},
			["source"] = "加洛西灭世者",
		},
		[257238] = {
			["school"] = 32,
			["type"] = "BUFF",
			["token"] = {
				["SPELL_AURA_APPLIED"] = true,
				["SPELL_CAST_START"] = true,
				["SPELL_CAST_SUCCESS"] = true,
			},
			["source"] = "沙图格",
		},
		[245024] = {
			["school"] = 32,
			["type"] = "DEBUFF",
			["token"] = {
				["SPELL_AURA_APPLIED"] = true,
			},
			["source"] = "沙图格",
		},
		[244969] = {
			["school"] = 1,
			["token"] = {
				["SPELL_CAST_START"] = true,
				["SPELL_CAST_SUCCESS"] = true,
				["SPELL_DAMAGE"] = true,
			},
			["source"] = "加洛西灭世者",
		},
		[59638] = {
			["school"] = 16,
			["token"] = {
				["SPELL_DAMAGE"] = true,
			},
			["source"] = "镜像",
		},
		[245237] = {
			["school"] = 1,
			["type"] = "BUFF",
			["token"] = {
				["SPELL_AURA_APPLIED"] = true,
				["SPELL_CAST_SUCCESS"] = true,
			},
			["source"] = "加洛西灭世者",
		},
		[251356] = {
			["school"] = 1,
			["type"] = "BUFF",
			["token"] = {
				["SPELL_AURA_APPLIED"] = true,
			},
			["source"] = "沙图格",
		},
		[248230] = {
			["school"] = 1,
			["token"] = {
				["SPELL_DAMAGE"] = true,
			},
			["source"] = "加洛西灭世者",
		},
		[244395] = {
			["school"] = 1,
			["type"] = "BUFF",
			["token"] = {
				["SPELL_AURA_APPLIED"] = true,
				["SPELL_CAST_SUCCESS"] = true,
			},
			["source"] = "加洛西灭世者",
		},
		[246057] = {
			["school"] = 32,
			["type"] = "BUFF",
			["token"] = {
				["SPELL_AURA_APPLIED"] = true,
			},
			["source"] = "法尔格",
		},
		[240277] = {
			["school"] = 4,
			["token"] = {
				["SPELL_CAST_START"] = true,
			},
			["source"] = "加洛西灭世者",
		},
		[257240] = {
			["school"] = 32,
			["token"] = {
				["SPELL_DAMAGE"] = true,
			},
			["source"] = "沙图格",
		},
		[245294] = {
			["school"] = 1,
			["type"] = "DEBUFF",
			["token"] = {
				["SPELL_CAST_SUCCESS"] = true,
				["SPELL_AURA_APPLIED"] = true,
			},
			["source"] = "屠戮者",
		},
		[244294] = {
			["school"] = 4,
			["token"] = {
				["SPELL_CAST_SUCCESS"] = true,
			},
			["source"] = "歼灭者",
		},
		[244050] = {
			["school"] = 32,
			["type"] = "BUFF",
			["token"] = {
				["SPELL_AURA_APPLIED"] = true,
			},
			["source"] = "法尔格",
		},
		[251445] = {
			["school"] = 4,
			["type"] = "DEBUFF",
			["token"] = {
				["SPELL_CAST_SUCCESS"] = true,
				["SPELL_AURA_APPLIED"] = true,
			},
			["source"] = "法尔格",
		},
		[245098] = {
			["school"] = 32,
			["type"] = "DEBUFF",
			["token"] = {
				["SPELL_CAST_SUCCESS"] = true,
				["SPELL_AURA_APPLIED"] = true,
			},
			["source"] = "沙图格",
		},
		[254383] = {
			["school"] = 32,
			["token"] = {
				["SPELL_DAMAGE"] = true,
			},
			["source"] = "沙图格",
		},
		[244768] = {
			["school"] = 1,
			["type"] = "DEBUFF",
			["token"] = {
				["SPELL_AURA_APPLIED"] = true,
			},
			["source"] = "法尔格",
		},
		[244532] = {
			["school"] = 4,
			["token"] = {
				["SPELL_DAMAGE"] = true,
			},
			["source"] = "加洛西灭世者",
		},
		[244051] = {
			["school"] = 32,
			["token"] = {
				["SPELL_DAMAGE"] = true,
			},
			["source"] = "法尔格",
		},
		[244767] = {
			["school"] = 4,
			["token"] = {
				["SPELL_DAMAGE"] = true,
			},
			["source"] = "法尔格",
		},
		[254384] = {
			["school"] = 4,
			["token"] = {
				["SPELL_DAMAGE"] = true,
			},
			["source"] = "法尔格",
		},
		[244825] = {
			["school"] = 4,
			["token"] = {
				["SPELL_CAST_SUCCESS"] = true,
				["SPELL_CAST_START"] = true,
			},
			["source"] = "法尔格",
		},
		[244761] = {
			["school"] = 4,
			["token"] = {
				["SPELL_DAMAGE"] = true,
			},
			["source"] = "歼灭者",
		},
		[251447] = {
			["school"] = 32,
			["type"] = "BUFF",
			["token"] = {
				["SPELL_AURA_APPLIED"] = true,
			},
			["source"] = "沙图格",
		},
		[244399] = {
			["school"] = 1,
			["type"] = "DEBUFF",
			["token"] = {
				["SPELL_CAST_SUCCESS"] = true,
				["SPELL_AURA_APPLIED"] = true,
			},
			["source"] = "屠戮者",
		},
		[114942] = {
			["school"] = 8,
			["token"] = {
				["SPELL_HEAL"] = true,
			},
			["source"] = "治疗之潮图腾",
		},
		[254747] = {
			["school"] = 4,
			["token"] = {
				["SPELL_DAMAGE"] = true,
			},
			["source"] = "法尔格",
		},
		[254403] = {
			["school"] = 32,
			["token"] = {
				["SPELL_DAMAGE"] = true,
			},
			["source"] = "沙图格",
		},
		[244131] = {
			["school"] = 32,
			["type"] = "DEBUFF",
			["token"] = {
				["SPELL_AURA_APPLIED"] = true,
			},
			["source"] = "沙图格",
		},
		[257239] = {
			["school"] = 4,
			["token"] = {
				["SPELL_DAMAGE"] = true,
			},
			["source"] = "法尔格",
		},
		[257236] = {
			["school"] = 4,
			["type"] = "BUFF",
			["token"] = {
				["SPELL_AURA_APPLIED"] = true,
				["SPELL_CAST_START"] = true,
				["SPELL_CAST_SUCCESS"] = true,
			},
			["source"] = "法尔格",
		},
		[52042] = {
			["school"] = 8,
			["token"] = {
				["SPELL_PERIODIC_HEAL"] = true,
			},
			["source"] = "治疗之泉图腾",
		},
		[244400] = {
			["school"] = 4,
			["token"] = {
				["SPELL_DAMAGE"] = true,
			},
			["source"] = "加洛西灭世者",
		},
		[254760] = {
			["school"] = 32,
			["token"] = {
				["SPELL_DAMAGE"] = true,
			},
			["source"] = "沙图格",
		},
		[244410] = {
			["school"] = 4,
			["type"] = "DEBUFF",
			["token"] = {
				["SPELL_AURA_APPLIED"] = true,
			},
			["source"] = "屠戮者",
		},
		[244449] = {
			["school"] = 4,
			["token"] = {
				["SPELL_DAMAGE"] = true,
			},
		},
		[246368] = {
			["school"] = 1,
			["type"] = "BUFF",
			["token"] = {
				["SPELL_AURA_APPLIED"] = true,
				["SPELL_CAST_SUCCESS"] = true,
			},
			["source"] = "加洛西灭世者",
		},
		[55078] = {
			["school"] = 32,
			["token"] = {
				["SPELL_PERIODIC_DAMAGE"] = true,
			},
			["source"] = "符文武器",
		},
		[251448] = {
			["school"] = 4,
			["type"] = "BUFF",
			["token"] = {
				["SPELL_AURA_APPLIED"] = true,
			},
			["source"] = "法尔格",
		},
		[246373] = {
			["school"] = 4,
			["token"] = {
				["SPELL_DAMAGE"] = true,
			},
			["source"] = "加洛西灭世者",
		},
	},
}
