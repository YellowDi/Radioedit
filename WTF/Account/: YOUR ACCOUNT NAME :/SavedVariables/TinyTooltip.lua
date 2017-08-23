
BigTipDB = {
	["spell"] = {
		["background"] = {
			0, -- [1]
			0, -- [2]
			0, -- [3]
			0.8, -- [4]
		},
		["showIcon"] = true,
		["borderColor"] = {
			0.6, -- [1]
			0.6, -- [2]
			0.6, -- [3]
			0.8, -- [4]
		},
	},
	["general"] = {
		["statusbarFontSize"] = 15,
		["scale"] = "1.0",
		["mask"] = true,
		["statusbarText"] = true,
		["headerFont"] = "微软雅黑Myriad",
		["borderSize"] = 1,
		["borderColor"] = {
			0.6, -- [1]
			0.6, -- [2]
			0.6, -- [3]
			0.8, -- [4]
		},
		["anchor"] = {
			["y"] = 260,
			["returnOnUnitFrame"] = true,
			["position"] = "static",
			["x"] = -8,
			["cp"] = "BOTTOM",
			["p"] = "BOTTOMRIGHT",
			["returnInCombat"] = false,
		},
		["background"] = {
			0, -- [1]
			0, -- [2]
			0, -- [3]
			0.8, -- [4]
		},
		["statusbarOffsetY"] = 0,
		["statusbarPosition"] = "bottom",
		["alwaysShowIdInfo"] = false,
		["headerFontSize"] = 15,
		["bodyFontSize"] = 15,
		["bodyFontFlag"] = "OUTLINE",
		["statusbarColor"] = "auto",
		["borderCorner"] = "angular",
		["statusbarOffsetX"] = 0,
		["statusbarFont"] = "微软雅黑Myriad",
		["statusbarHeight"] = 12,
		["skinMoreFrames"] = true,
		["headerFontFlag"] = "OUTLINE",
		["bodyFont"] = "微软雅黑Myriad",
		["statusbarTexture"] = "TukTex",
		["bgfile"] = "marble",
		["statusbarFontFlag"] = "OUTLINE",
	},
	["version"] = 2,
	["item"] = {
		["coloredItemBorder"] = true,
		["showItemIcon"] = false,
	},
	["quest"] = {
		["coloredQuestBorder"] = true,
	},
	["unit"] = {
		["player"] = {
			["elements"] = {
				{
					"moveSpeed", -- [1]
					"roleIcon", -- [2]
					"role", -- [3]
					"raidIcon", -- [4]
					"pvpIcon", -- [5]
					"factionIcon", -- [6]
					"classIcon", -- [7]
					"title", -- [8]
					"name", -- [9]
					"realm", -- [10]
					"statusAFK", -- [11]
					"statusDND", -- [12]
					"statusDC", -- [13]
				}, -- [1]
				{
					"guildName", -- [1]
					"guildIndex", -- [2]
					"guildRank", -- [3]
					"guildRealm", -- [4]
				}, -- [2]
				{
					"levelValue", -- [1]
					"factionName", -- [2]
					"gender", -- [3]
					"raceName", -- [4]
					"className", -- [5]
					"isPlayer", -- [6]
				}, -- [3]
				{
					"zone", -- [1]
				}, -- [4]
				["guildRank"] = {
					["enable"] = true,
					["color"] = "cc88ff",
					["wildcard"] = "%s",
					["filter"] = "none",
				},
				["statusAFK"] = {
					["enable"] = true,
					["color"] = "ffd200",
					["wildcard"] = "(%s)",
					["filter"] = "none",
				},
				["guildIndex"] = {
					["enable"] = true,
					["color"] = "cc88ff",
					["wildcard"] = "-%s-",
					["filter"] = "none",
				},
				["zone"] = {
					["enable"] = true,
					["color"] = "ffffff",
					["wildcard"] = "%s",
					["filter"] = "none",
				},
				["statusDC"] = {
					["enable"] = true,
					["color"] = "999999",
					["wildcard"] = "(%s)",
					["filter"] = "none",
				},
				["raceName"] = {
					["enable"] = true,
					["color"] = "cccccc",
					["wildcard"] = "%s",
					["filter"] = "none",
				},
				["role"] = {
					["enable"] = false,
					["color"] = "ffffff",
					["wildcard"] = "(%s)",
					["filter"] = "none",
				},
				["factionName"] = {
					["enable"] = true,
					["color"] = "faction",
					["wildcard"] = "%s",
					["filter"] = "none",
				},
				["raidIcon"] = {
					["enable"] = true,
					["filter"] = "none",
				},
				["levelValue"] = {
					["enable"] = true,
					["color"] = "level",
					["wildcard"] = "%s",
					["filter"] = "none",
				},
				["realm"] = {
					["enable"] = true,
					["color"] = "00eeee",
					["wildcard"] = "%s",
					["filter"] = "none",
				},
				["factionIcon"] = {
					["enable"] = true,
					["filter"] = "none",
				},
				["pvpIcon"] = {
					["enable"] = true,
					["filter"] = "none",
				},
				["moveSpeed"] = {
					["enable"] = false,
					["color"] = "ffffff",
					["wildcard"] = "%d%%",
					["filter"] = "none",
				},
				["gender"] = {
					["enable"] = false,
					["color"] = "999999",
					["wildcard"] = "%s",
					["filter"] = "none",
				},
				["guildRealm"] = {
					["enable"] = true,
					["color"] = "00cccc",
					["wildcard"] = "%s",
					["filter"] = "none",
				},
				["statusDND"] = {
					["enable"] = true,
					["color"] = "ffd200",
					["wildcard"] = "(%s)",
					["filter"] = "none",
				},
				["roleIcon"] = {
					["enable"] = true,
					["filter"] = "none",
				},
				["title"] = {
					["enable"] = true,
					["color"] = "ccffff",
					["wildcard"] = "%s",
					["filter"] = "none",
				},
				["guildName"] = {
					["enable"] = true,
					["color"] = "ff00ff",
					["wildcard"] = "<%s>",
					["filter"] = "none",
				},
				["isPlayer"] = {
					["enable"] = false,
					["color"] = "ffffff",
					["wildcard"] = "(%s)",
					["filter"] = "none",
				},
				["name"] = {
					["enable"] = true,
					["color"] = "class",
					["wildcard"] = "%s",
					["filter"] = "none",
				},
				["className"] = {
					["enable"] = true,
					["color"] = "ffffff",
					["wildcard"] = "%s",
					["filter"] = "none",
				},
				["classIcon"] = {
					["enable"] = true,
					["filter"] = "none",
				},
			},
			["showModel"] = false,
			["showTargetBy"] = true,
			["coloredBorder"] = "class",
			["anchor"] = {
				["returnOnUnitFrame"] = false,
				["position"] = "inherit",
				["cp"] = "BOTTOM",
				["p"] = "BOTTOMRIGHT",
				["returnInCombat"] = true,
			},
			["background"] = {
				["colorfunc"] = "default",
				["alpha"] = 0.5,
			},
			["showTarget"] = true,
			["grayForDead"] = false,
		},
		["npc"] = {
			["elements"] = {
				{
					"moveSpeed", -- [1]
					"raidIcon", -- [2]
					"classIcon", -- [3]
					"questIcon", -- [4]
					"name", -- [5]
				}, -- [1]
				{
					"levelValue", -- [1]
					"classifBoss", -- [2]
					"classifElite", -- [3]
					"classifRare", -- [4]
					"creature", -- [5]
					"reactionName", -- [6]
				}, -- [2]
				["creature"] = {
					["enable"] = true,
					["color"] = "selection",
					["wildcard"] = "%s",
					["filter"] = "none",
				},
				["classifElite"] = {
					["enable"] = true,
					["color"] = "ffff33",
					["wildcard"] = "(%s)",
					["filter"] = "none",
				},
				["npcTitle"] = {
					["enable"] = true,
					["color"] = "99e8e8",
					["wildcard"] = "<%s>",
					["filter"] = "none",
				},
				["questIcon"] = {
					["enable"] = true,
					["filter"] = "none",
				},
				["classifBoss"] = {
					["enable"] = true,
					["color"] = "ff0000",
					["wildcard"] = "(%s)",
					["filter"] = "none",
				},
				["moveSpeed"] = {
					["enable"] = false,
					["color"] = "ffffff",
					["wildcard"] = "%d%%",
					["filter"] = "none",
				},
				["name"] = {
					["enable"] = true,
					["color"] = "default",
					["wildcard"] = "%s",
					["filter"] = "none",
				},
				["reactionName"] = {
					["enable"] = true,
					["color"] = "33ffff",
					["wildcard"] = "<%s>",
					["filter"] = "reaction6",
				},
				["classifRare"] = {
					["enable"] = true,
					["color"] = "ffaaff",
					["wildcard"] = "(%s)",
					["filter"] = "none",
				},
				["raidIcon"] = {
					["enable"] = true,
					["filter"] = "none",
				},
				["levelValue"] = {
					["enable"] = true,
					["color"] = "level",
					["wildcard"] = "%s",
					["filter"] = "none",
				},
				["classIcon"] = {
					["enable"] = false,
					["filter"] = "none",
				},
			},
			["coloredBorder"] = "reaction",
			["anchor"] = {
				["returnOnUnitFrame"] = false,
				["position"] = "inherit",
				["cp"] = "BOTTOM",
				["p"] = "BOTTOMRIGHT",
				["returnInCombat"] = true,
			},
			["showTarget"] = true,
			["background"] = {
				["colorfunc"] = "default",
				["alpha"] = 0.5,
			},
			["showTargetBy"] = true,
			["grayForDead"] = false,
		},
	},
}
