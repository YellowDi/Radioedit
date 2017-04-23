
SkadaDB = {
	["namespaces"] = {
		["LibDualSpec-1.0"] = {
		},
	},
	["profileKeys"] = {
		["Lullatone - 主宰之剑"] = "Default",
		["Radioedit - 主宰之剑"] = "Default",
		["Radioedit - 格瑞姆巴托"] = "Radioedit - 格瑞姆巴托",
	},
	["profiles"] = {
		["Default"] = {
			["showself"] = true,
			["windows"] = {
				{
					["barslocked"] = true,
					["y"] = 4,
					["name"] = "伤害",
					["strata"] = "MEDIUM",
					["point"] = "TOPRIGHT",
					["mode"] = "伤害",
					["spark"] = false,
					["barwidth"] = 396.000152587891,
					["background"] = {
						["strata"] = "MEDIUM",
						["height"] = 126,
						["bordertexture"] = "None",
					},
					["x"] = 1190.99984741211,
				}, -- [1]
			},
			["report"] = {
				["channel"] = "guild",
				["mode"] = "伤害",
			},
			["versions"] = {
				["1.6.4"] = true,
				["1.6.3"] = true,
			},
			["modeclicks"] = {
				["治疗"] = 10,
				["伤害"] = 9,
			},
		},
		["Radioedit - 格瑞姆巴托"] = {
			["showself"] = true,
			["versions"] = {
				["1.6.4"] = true,
				["1.6.3"] = true,
			},
			["modeclicks"] = {
				["治疗"] = 8,
				["伤害"] = 5,
				["过量治疗"] = 1,
			},
			["windows"] = {
				{
					["strata"] = "MEDIUM",
					["point"] = "TOPRIGHT",
					["barwidth"] = 395.999969482422,
					["smoothing"] = true,
					["y"] = 4.00004577636719,
					["x"] = 1511.00003051758,
					["barslocked"] = true,
					["mode"] = "治疗",
					["background"] = {
						["height"] = 126,
						["strata"] = "MEDIUM",
						["borderthickness"] = 2,
						["bordertexture"] = "None",
					},
					["spark"] = false,
				}, -- [1]
			},
		},
	},
}
