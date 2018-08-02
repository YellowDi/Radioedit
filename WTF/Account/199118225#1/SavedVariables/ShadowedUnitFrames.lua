
ShadowedUFDB = {
	["namespaces"] = {
		["LibDualSpec-1.0"] = {
		},
	},
	["profileKeys"] = {
		["Mirvish - 格瑞姆巴托"] = "Default",
		["Geronimo - 奥蕾莉亚"] = "R2",
		["Underdog - 主宰之剑"] = "R2",
		["Friede - 主宰之剑"] = "R2",
		["Geronimo - 格瑞姆巴托"] = "R2",
		["Mirvish - 主宰之剑"] = "R2",
		["Radioedit - 主宰之剑"] = "R2",
		["Elenore - 格瑞姆巴托"] = "R2",
	},
	["global"] = {
		["infoID"] = 3,
	},
	["profiles"] = {
		["Default"] = {
			["revision"] = 59,
			["powerColors"] = {
				["FUEL"] = {
					["b"] = 0.36,
					["g"] = 0.47,
					["r"] = 0.85,
				},
				["ALTERNATE"] = {
					["b"] = 1,
					["g"] = 0.941,
					["r"] = 0.815,
				},
				["FOCUS"] = {
					["b"] = 0.25,
					["g"] = 0.5,
					["r"] = 1,
				},
				["RUNEOFPOWER"] = {
					["b"] = 0.6,
					["g"] = 0.45,
					["r"] = 0.35,
				},
				["STAGGER_RED"] = {
					["b"] = 0.42,
					["g"] = 0.42,
					["r"] = 1,
				},
				["ARCANECHARGES"] = {
					["b"] = 0.98,
					["g"] = 0.1,
					["r"] = 0.1,
				},
				["COMBOPOINTS"] = {
					["b"] = 0,
					["g"] = 0.8,
					["r"] = 1,
				},
				["RUNES"] = {
					["b"] = 0.5,
					["g"] = 0.5,
					["r"] = 0.5,
				},
				["STAGGER_GREEN"] = {
					["b"] = 0.52,
					["g"] = 1,
					["r"] = 0.52,
				},
				["ENERGY"] = {
					["b"] = 0.1,
					["g"] = 0.85,
					["r"] = 1,
				},
				["MANA"] = {
					["b"] = 0.85,
					["g"] = 0.5,
					["r"] = 0.3,
				},
				["CHI"] = {
					["b"] = 0.92,
					["g"] = 1,
					["r"] = 0.71,
				},
				["AURAPOINTS"] = {
					["b"] = 0,
					["g"] = 0.8,
					["r"] = 1,
				},
				["MUSHROOMS"] = {
					["b"] = 0.2,
					["g"] = 0.9,
					["r"] = 0.2,
				},
				["MAELSTROM"] = {
					["b"] = 1,
					["g"] = 0.5,
					["r"] = 0,
				},
				["INSANITY"] = {
					["b"] = 0.8,
					["g"] = 0,
					["r"] = 0.4,
				},
				["SOULSHARDS"] = {
					["b"] = 0.79,
					["g"] = 0.51,
					["r"] = 0.58,
				},
				["FURY"] = {
					["b"] = 0.992,
					["g"] = 0.259,
					["r"] = 0.788,
				},
				["AMMOSLOT"] = {
					["b"] = 0.55,
					["g"] = 0.6,
					["r"] = 0.85,
				},
				["RUNIC_POWER"] = {
					["r"] = 0.35,
					["g"] = 0.45,
					["b"] = 0.6,
				},
				["LUNAR_POWER"] = {
					["b"] = 0.9,
					["g"] = 0.52,
					["r"] = 0.3,
				},
				["STATUE"] = {
					["b"] = 0.6,
					["g"] = 0.45,
					["r"] = 0.35,
				},
				["PAIN"] = {
					["b"] = 0,
					["g"] = 0,
					["r"] = 1,
				},
				["HOLYPOWER"] = {
					["b"] = 0.6,
					["g"] = 0.9,
					["r"] = 0.95,
				},
				["STAGGER_YELLOW"] = {
					["b"] = 0.72,
					["g"] = 0.98,
					["r"] = 1,
				},
				["RAGE"] = {
					["b"] = 0.3,
					["g"] = 0.2,
					["r"] = 0.9,
				},
			},
			["wowBuild"] = 80000,
			["castColors"] = {
				["cast"] = {
					["b"] = 0.3,
					["g"] = 0.7,
					["r"] = 1,
				},
				["finished"] = {
					["b"] = 0.1,
					["g"] = 1,
					["r"] = 0.1,
				},
				["channel"] = {
					["b"] = 1,
					["g"] = 0.25,
					["r"] = 0.25,
				},
				["uninterruptible"] = {
					["b"] = 1,
					["g"] = 0,
					["r"] = 0.71,
				},
				["interrupted"] = {
					["b"] = 0,
					["g"] = 0,
					["r"] = 1,
				},
			},
			["units"] = {
				["arenatarget"] = {
					["healthBar"] = {
						["colorType"] = "class",
						["order"] = 10,
						["background"] = true,
						["reactionType"] = "npc",
						["height"] = 1.2,
					},
					["text"] = {
						nil, -- [1]
						{
							["text"] = "[curhp]",
						}, -- [2]
						{
							["text"] = "",
						}, -- [3]
						{
							["text"] = "",
						}, -- [4]
						{
							["text"] = "[name]",
						}, -- [5]
					},
					["portrait"] = {
						["type"] = "3D",
						["alignment"] = "LEFT",
						["fullAfter"] = 100,
						["height"] = 0.5,
						["fullBefore"] = 0,
						["order"] = 15,
						["width"] = 0.22,
					},
					["width"] = 90,
					["castBar"] = {
						["time"] = {
							["enabled"] = true,
							["x"] = -1,
							["anchorTo"] = "$parent",
							["y"] = 0,
							["anchorPoint"] = "CRI",
							["size"] = 0,
						},
						["order"] = 40,
						["height"] = 0.6,
						["background"] = true,
						["icon"] = "HIDE",
						["name"] = {
							["y"] = 0,
							["x"] = 1,
							["anchorTo"] = "$parent",
							["rank"] = true,
							["anchorPoint"] = "CLI",
							["enabled"] = true,
							["size"] = 0,
						},
					},
					["auras"] = {
						["buffs"] = {
							["anchorPoint"] = "BL",
							["x"] = 0,
							["y"] = 0,
							["size"] = 16,
						},
						["debuffs"] = {
							["anchorPoint"] = "BL",
							["x"] = 0,
							["y"] = 0,
							["size"] = 16,
						},
					},
					["altPowerBar"] = {
						["height"] = 0.4,
						["background"] = true,
						["order"] = 100,
					},
					["emptyBar"] = {
						["reactionType"] = "none",
						["background"] = true,
						["order"] = 0,
						["height"] = 1,
					},
					["height"] = 25,
					["highlight"] = {
						["size"] = 10,
					},
					["powerBar"] = {
						["order"] = 20,
						["colorType"] = "type",
						["height"] = 0.6,
						["background"] = true,
					},
					["indicators"] = {
						["raidTarget"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "C",
							["size"] = 20,
						},
						["class"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "BL",
							["size"] = 16,
						},
					},
				},
				["mainassisttarget"] = {
					["healthBar"] = {
						["colorType"] = "class",
						["order"] = 10,
						["background"] = true,
						["reactionType"] = "npc",
						["height"] = 1.2,
					},
					["text"] = {
						{
							["text"] = "[(()afk() )][name]",
						}, -- [1]
						[3] = {
							["text"] = "[level( )][classification( )][perpp]",
						},
						[5] = {
							["text"] = "[(()afk() )][name]",
						},
					},
					["portrait"] = {
						["type"] = "3D",
						["alignment"] = "LEFT",
						["fullAfter"] = 100,
						["height"] = 0.5,
						["fullBefore"] = 0,
						["order"] = 15,
						["width"] = 0.22,
					},
					["width"] = 150,
					["castBar"] = {
						["time"] = {
							["enabled"] = true,
							["x"] = -1,
							["anchorTo"] = "$parent",
							["y"] = 0,
							["anchorPoint"] = "CRI",
							["size"] = 0,
						},
						["order"] = 40,
						["height"] = 0.6,
						["background"] = true,
						["icon"] = "HIDE",
						["name"] = {
							["y"] = 0,
							["x"] = 1,
							["anchorTo"] = "$parent",
							["rank"] = true,
							["anchorPoint"] = "CLI",
							["enabled"] = true,
							["size"] = 0,
						},
					},
					["auras"] = {
						["buffs"] = {
							["anchorPoint"] = "BL",
							["x"] = 0,
							["y"] = 0,
							["size"] = 16,
						},
						["debuffs"] = {
							["anchorPoint"] = "BL",
							["x"] = 0,
							["y"] = 0,
							["size"] = 16,
						},
					},
					["altPowerBar"] = {
						["height"] = 0.4,
						["background"] = true,
						["order"] = 100,
					},
					["emptyBar"] = {
						["reactionType"] = "none",
						["background"] = true,
						["order"] = 0,
						["height"] = 1,
					},
					["height"] = 40,
					["highlight"] = {
						["size"] = 10,
					},
					["powerBar"] = {
						["order"] = 20,
						["colorType"] = "type",
						["height"] = 1,
						["background"] = true,
					},
					["indicators"] = {
						["raidTarget"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "C",
							["size"] = 20,
						},
						["class"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "BL",
							["size"] = 16,
						},
					},
				},
				["targettargettarget"] = {
					["portrait"] = {
						["type"] = "3D",
						["alignment"] = "RIGHT",
						["fullAfter"] = 100,
						["height"] = 0.5,
						["fullBefore"] = 0,
						["order"] = 15,
						["width"] = 0.22,
					},
					["healthBar"] = {
						["colorType"] = "class",
						["order"] = 10,
						["background"] = true,
						["reactionType"] = "npc",
						["height"] = 1.2,
					},
					["width"] = 80,
					["emptyBar"] = {
						["reactionType"] = "none",
						["background"] = true,
						["order"] = 0,
						["height"] = 1,
					},
					["range"] = {
						["height"] = 0.5,
					},
					["auras"] = {
						["height"] = 0.5,
						["debuffs"] = {
							["anchorPoint"] = "BL",
							["x"] = 0,
							["y"] = 0,
							["size"] = 16,
						},
						["buffs"] = {
							["anchorPoint"] = "BL",
							["x"] = 0,
							["y"] = 0,
							["size"] = 16,
						},
					},
					["castBar"] = {
						["time"] = {
							["enabled"] = true,
							["x"] = -1,
							["anchorTo"] = "$parent",
							["y"] = 0,
							["anchorPoint"] = "CRI",
							["size"] = 0,
						},
						["order"] = 40,
						["height"] = 0.6,
						["background"] = true,
						["icon"] = "HIDE",
						["name"] = {
							["y"] = 0,
							["x"] = 1,
							["anchorTo"] = "$parent",
							["rank"] = true,
							["anchorPoint"] = "CLI",
							["enabled"] = true,
							["size"] = 0,
						},
					},
					["text"] = {
						{
							["width"] = 1,
						}, -- [1]
						{
							["text"] = "",
						}, -- [2]
						{
							["text"] = "",
						}, -- [3]
						{
							["text"] = "",
						}, -- [4]
					},
					["altPowerBar"] = {
						["height"] = 0.4,
						["background"] = true,
						["order"] = 100,
					},
					["indicators"] = {
						["raidTarget"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "C",
							["size"] = 20,
						},
						["class"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "BL",
							["size"] = 16,
						},
						["height"] = 0.5,
					},
					["height"] = 30,
					["auraIndicators"] = {
						["height"] = 0.5,
					},
					["powerBar"] = {
						["order"] = 20,
						["colorType"] = "type",
						["height"] = 0.6,
						["background"] = true,
					},
					["highlight"] = {
						["height"] = 0.5,
						["size"] = 10,
					},
				},
				["partytarget"] = {
					["portrait"] = {
						["type"] = "3D",
						["alignment"] = "LEFT",
						["fullAfter"] = 100,
						["height"] = 0.5,
						["fullBefore"] = 0,
						["order"] = 15,
						["width"] = 0.22,
					},
					["text"] = {
						nil, -- [1]
						{
							["text"] = "[curhp]",
						}, -- [2]
						{
							["text"] = "",
						}, -- [3]
						{
							["text"] = "",
						}, -- [4]
						{
							["text"] = "[name]",
						}, -- [5]
					},
					["emptyBar"] = {
						["reactionType"] = "none",
						["background"] = true,
						["order"] = 0,
						["height"] = 1,
					},
					["auras"] = {
						["buffs"] = {
							["anchorPoint"] = "BL",
							["x"] = 0,
							["y"] = 0,
							["size"] = 16,
						},
						["debuffs"] = {
							["anchorPoint"] = "BL",
							["x"] = 0,
							["y"] = 0,
							["size"] = 16,
						},
					},
					["castBar"] = {
						["time"] = {
							["enabled"] = true,
							["x"] = -1,
							["anchorTo"] = "$parent",
							["y"] = 0,
							["anchorPoint"] = "CRI",
							["size"] = 0,
						},
						["order"] = 40,
						["height"] = 0.6,
						["background"] = true,
						["icon"] = "HIDE",
						["name"] = {
							["y"] = 0,
							["x"] = 1,
							["anchorTo"] = "$parent",
							["rank"] = true,
							["anchorPoint"] = "CLI",
							["enabled"] = true,
							["size"] = 0,
						},
					},
					["indicators"] = {
						["raidTarget"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "C",
							["size"] = 20,
						},
						["class"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "BL",
							["size"] = 16,
						},
					},
					["altPowerBar"] = {
						["height"] = 0.4,
						["background"] = true,
						["order"] = 100,
					},
					["highlight"] = {
						["size"] = 10,
					},
					["height"] = 25,
					["width"] = 90,
					["powerBar"] = {
						["order"] = 20,
						["colorType"] = "type",
						["height"] = 0.6,
						["background"] = true,
					},
					["healthBar"] = {
						["colorType"] = "class",
						["order"] = 10,
						["background"] = true,
						["reactionType"] = "npc",
						["height"] = 1.2,
					},
				},
				["arenatargettarget"] = {
					["healthBar"] = {
						["colorType"] = "class",
						["order"] = 10,
						["background"] = true,
						["reactionType"] = "npc",
						["height"] = 1.2,
					},
					["text"] = {
						nil, -- [1]
						{
							["text"] = "[curhp]",
						}, -- [2]
						{
							["text"] = "",
						}, -- [3]
						{
							["text"] = "",
						}, -- [4]
						{
							["text"] = "[name]",
						}, -- [5]
					},
					["portrait"] = {
						["type"] = "3D",
						["alignment"] = "LEFT",
						["fullAfter"] = 100,
						["height"] = 0.5,
						["fullBefore"] = 0,
						["order"] = 15,
						["width"] = 0.22,
					},
					["width"] = 90,
					["castBar"] = {
						["time"] = {
							["enabled"] = true,
							["x"] = -1,
							["anchorTo"] = "$parent",
							["y"] = 0,
							["anchorPoint"] = "CRI",
							["size"] = 0,
						},
						["order"] = 40,
						["height"] = 0.6,
						["background"] = true,
						["icon"] = "HIDE",
						["name"] = {
							["y"] = 0,
							["x"] = 1,
							["anchorTo"] = "$parent",
							["rank"] = true,
							["anchorPoint"] = "CLI",
							["enabled"] = true,
							["size"] = 0,
						},
					},
					["auras"] = {
						["buffs"] = {
							["anchorPoint"] = "BL",
							["x"] = 0,
							["y"] = 0,
							["size"] = 16,
						},
						["debuffs"] = {
							["anchorPoint"] = "BL",
							["x"] = 0,
							["y"] = 0,
							["size"] = 16,
						},
					},
					["altPowerBar"] = {
						["height"] = 0.4,
						["background"] = true,
						["order"] = 100,
					},
					["emptyBar"] = {
						["reactionType"] = "none",
						["background"] = true,
						["order"] = 0,
						["height"] = 1,
					},
					["height"] = 25,
					["highlight"] = {
						["size"] = 10,
					},
					["powerBar"] = {
						["order"] = 20,
						["colorType"] = "type",
						["height"] = 0.6,
						["background"] = true,
					},
					["indicators"] = {
						["raidTarget"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "C",
							["size"] = 20,
						},
						["class"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "BL",
							["size"] = 16,
						},
					},
				},
				["raid"] = {
					["portrait"] = {
						["type"] = "3D",
						["alignment"] = "LEFT",
						["fullAfter"] = 100,
						["height"] = 0.5,
						["fullBefore"] = 0,
						["order"] = 15,
						["width"] = 0.22,
					},
					["scale"] = 0.85,
					["auras"] = {
						["buffs"] = {
							["anchorPoint"] = "BL",
							["x"] = 0,
							["y"] = 0,
							["size"] = 16,
						},
						["debuffs"] = {
							["anchorPoint"] = "BL",
							["x"] = 0,
							["y"] = 0,
							["size"] = 16,
						},
					},
					["castBar"] = {
						["time"] = {
							["enabled"] = true,
							["x"] = -1,
							["anchorTo"] = "$parent",
							["y"] = 0,
							["anchorPoint"] = "CRI",
							["size"] = 0,
						},
						["order"] = 40,
						["height"] = 0.6,
						["background"] = true,
						["icon"] = "HIDE",
						["name"] = {
							["y"] = 0,
							["x"] = 1,
							["anchorTo"] = "$parent",
							["rank"] = true,
							["anchorPoint"] = "CLI",
							["enabled"] = true,
							["size"] = 0,
						},
					},
					["groupSpacing"] = 0,
					["incAbsorb"] = {
						["cap"] = 1,
					},
					["powerBar"] = {
						["order"] = 20,
						["colorType"] = "type",
						["height"] = 0.3,
						["background"] = true,
					},
					["groupsPerRow"] = 8,
					["healthBar"] = {
						["colorType"] = "class",
						["order"] = 10,
						["background"] = true,
						["reactionType"] = "none",
						["height"] = 1.2,
					},
					["unitsPerColumn"] = 8,
					["text"] = {
						{
							["text"] = "[(()afk() )][name]",
						}, -- [1]
						{
							["text"] = "[missinghp]",
						}, -- [2]
						{
							["text"] = "",
						}, -- [3]
						{
							["text"] = "",
						}, -- [4]
						{
							["text"] = "[(()afk() )][name]",
						}, -- [5]
					},
					["emptyBar"] = {
						["reactionType"] = "none",
						["background"] = true,
						["order"] = 0,
						["height"] = 1,
					},
					["columnSpacing"] = 5,
					["width"] = 100,
					["maxColumns"] = 8,
					["incHeal"] = {
						["cap"] = 1,
					},
					["altPowerBar"] = {
						["height"] = 0.4,
						["background"] = true,
						["order"] = 100,
					},
					["indicators"] = {
						["raidTarget"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "C",
							["size"] = 20,
						},
						["lfdRole"] = {
							["y"] = 14,
							["x"] = 3,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "BR",
							["size"] = 14,
						},
						["resurrect"] = {
							["y"] = -1,
							["x"] = 37,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "LC",
							["size"] = 28,
						},
						["masterLoot"] = {
							["anchorPoint"] = "TR",
							["x"] = -2,
							["anchorTo"] = "$parent",
							["y"] = -10,
							["size"] = 12,
						},
						["leader"] = {
							["y"] = -12,
							["x"] = 2,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "TL",
							["size"] = 14,
						},
						["role"] = {
							["enabled"] = false,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "BR",
							["y"] = 14,
							["size"] = 14,
						},
						["status"] = {
							["y"] = -2,
							["x"] = 12,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "LB",
							["size"] = 16,
						},
						["pvp"] = {
							["anchorPoint"] = "BL",
							["x"] = 0,
							["anchorTo"] = "$parent",
							["y"] = 11,
							["size"] = 22,
						},
						["class"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "BL",
							["size"] = 16,
						},
						["ready"] = {
							["anchorPoint"] = "LC",
							["x"] = 25,
							["anchorTo"] = "$parent",
							["y"] = 0,
							["size"] = 24,
						},
					},
					["height"] = 30,
					["healAbsorb"] = {
						["cap"] = 1,
					},
					["attribAnchorPoint"] = "LEFT",
					["highlight"] = {
						["size"] = 10,
					},
				},
				["arenapet"] = {
					["portrait"] = {
						["type"] = "3D",
						["alignment"] = "LEFT",
						["fullAfter"] = 100,
						["height"] = 0.5,
						["fullBefore"] = 0,
						["order"] = 15,
						["width"] = 0.22,
					},
					["text"] = {
						nil, -- [1]
						{
							["text"] = "[curhp]",
						}, -- [2]
						{
							["text"] = "",
						}, -- [3]
						{
							["text"] = "",
						}, -- [4]
						{
							["text"] = "[name]",
						}, -- [5]
					},
					["emptyBar"] = {
						["reactionType"] = "none",
						["background"] = true,
						["order"] = 0,
						["height"] = 1,
					},
					["auras"] = {
						["buffs"] = {
							["anchorPoint"] = "BL",
							["x"] = 0,
							["y"] = 0,
							["size"] = 16,
						},
						["debuffs"] = {
							["anchorPoint"] = "BL",
							["x"] = 0,
							["y"] = 0,
							["size"] = 16,
						},
					},
					["castBar"] = {
						["time"] = {
							["enabled"] = true,
							["x"] = -1,
							["anchorTo"] = "$parent",
							["y"] = 0,
							["anchorPoint"] = "CRI",
							["size"] = 0,
						},
						["order"] = 40,
						["height"] = 0.6,
						["background"] = true,
						["icon"] = "HIDE",
						["name"] = {
							["y"] = 0,
							["x"] = 1,
							["anchorTo"] = "$parent",
							["rank"] = true,
							["anchorPoint"] = "CLI",
							["enabled"] = true,
							["size"] = 0,
						},
					},
					["highlight"] = {
						["size"] = 10,
					},
					["altPowerBar"] = {
						["height"] = 0.4,
						["background"] = true,
						["order"] = 100,
					},
					["indicators"] = {
						["raidTarget"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "C",
							["size"] = 20,
						},
					},
					["height"] = 25,
					["width"] = 90,
					["powerBar"] = {
						["order"] = 20,
						["colorType"] = "type",
						["height"] = 0.6,
						["background"] = true,
					},
					["healthBar"] = {
						["colorType"] = "class",
						["order"] = 10,
						["background"] = true,
						["reactionType"] = "npc",
						["height"] = 1.2,
					},
				},
				["mainassisttargettarget"] = {
					["healthBar"] = {
						["colorType"] = "class",
						["order"] = 10,
						["background"] = true,
						["reactionType"] = "npc",
						["height"] = 1.2,
					},
					["text"] = {
						{
							["text"] = "[(()afk() )][name]",
						}, -- [1]
						[3] = {
							["text"] = "[level( )][classification( )][perpp]",
						},
						[5] = {
							["text"] = "[(()afk() )][name]",
						},
					},
					["portrait"] = {
						["type"] = "3D",
						["alignment"] = "LEFT",
						["fullAfter"] = 100,
						["height"] = 0.5,
						["fullBefore"] = 0,
						["order"] = 15,
						["width"] = 0.22,
					},
					["width"] = 150,
					["castBar"] = {
						["time"] = {
							["enabled"] = true,
							["x"] = -1,
							["anchorTo"] = "$parent",
							["y"] = 0,
							["anchorPoint"] = "CRI",
							["size"] = 0,
						},
						["order"] = 40,
						["height"] = 0.6,
						["background"] = true,
						["icon"] = "HIDE",
						["name"] = {
							["y"] = 0,
							["x"] = 1,
							["anchorTo"] = "$parent",
							["rank"] = true,
							["anchorPoint"] = "CLI",
							["enabled"] = true,
							["size"] = 0,
						},
					},
					["auras"] = {
						["buffs"] = {
							["anchorPoint"] = "BL",
							["x"] = 0,
							["y"] = 0,
							["size"] = 16,
						},
						["debuffs"] = {
							["anchorPoint"] = "BL",
							["x"] = 0,
							["y"] = 0,
							["size"] = 16,
						},
					},
					["altPowerBar"] = {
						["height"] = 0.4,
						["background"] = true,
						["order"] = 100,
					},
					["emptyBar"] = {
						["reactionType"] = "none",
						["background"] = true,
						["order"] = 0,
						["height"] = 1,
					},
					["height"] = 40,
					["highlight"] = {
						["size"] = 10,
					},
					["powerBar"] = {
						["order"] = 20,
						["colorType"] = "type",
						["height"] = 1,
						["background"] = true,
					},
					["indicators"] = {
						["raidTarget"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "C",
							["size"] = 20,
						},
						["class"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "BL",
							["size"] = 16,
						},
					},
				},
				["party"] = {
					["indicators"] = {
						["raidTarget"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "C",
							["size"] = 20,
						},
						["lfdRole"] = {
							["y"] = 14,
							["x"] = 3,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "BR",
							["size"] = 14,
						},
						["phase"] = {
							["anchorPoint"] = "RC",
							["x"] = -11,
							["size"] = 14,
							["anchorTo"] = "$parent",
						},
						["masterLoot"] = {
							["y"] = -10,
							["x"] = 16,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "TL",
							["size"] = 12,
						},
						["leader"] = {
							["y"] = -12,
							["x"] = 2,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "TL",
							["size"] = 14,
						},
						["role"] = {
							["y"] = -11,
							["x"] = 30,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "TL",
							["size"] = 14,
						},
						["pvp"] = {
							["y"] = -21,
							["x"] = 11,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "TR",
							["size"] = 22,
						},
						["status"] = {
							["y"] = -2,
							["x"] = 12,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "LB",
							["size"] = 16,
						},
						["height"] = 0.5,
						["class"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "BL",
							["size"] = 16,
						},
						["resurrect"] = {
							["y"] = -1,
							["x"] = 37,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "LC",
							["size"] = 28,
						},
						["ready"] = {
							["y"] = 0,
							["x"] = 35,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "LC",
							["size"] = 24,
						},
					},
					["range"] = {
						["height"] = 0.5,
					},
					["auras"] = {
						["height"] = 0.5,
						["debuffs"] = {
							["enabled"] = true,
							["x"] = 0,
							["anchorPoint"] = "BL",
							["y"] = 0,
							["size"] = 16,
						},
						["buffs"] = {
							["enabled"] = true,
							["x"] = 0,
							["y"] = 0,
							["anchorPoint"] = "BL",
							["size"] = 16,
						},
					},
					["castBar"] = {
						["time"] = {
							["enabled"] = true,
							["x"] = -1,
							["anchorTo"] = "$parent",
							["y"] = 0,
							["anchorPoint"] = "CRI",
							["size"] = 0,
						},
						["order"] = 60,
						["height"] = 0.6,
						["background"] = true,
						["icon"] = "HIDE",
						["name"] = {
							["y"] = 0,
							["x"] = 1,
							["anchorTo"] = "$parent",
							["rank"] = true,
							["anchorPoint"] = "CLI",
							["enabled"] = true,
							["size"] = 0,
						},
					},
					["incAbsorb"] = {
						["height"] = 0.5,
						["cap"] = 1,
					},
					["auraIndicators"] = {
						["height"] = 0.5,
					},
					["powerBar"] = {
						["order"] = 20,
						["colorType"] = "type",
						["height"] = 1,
						["background"] = true,
					},
					["highlight"] = {
						["height"] = 0.5,
						["size"] = 10,
					},
					["offset"] = 23,
					["unitsPerColumn"] = 5,
					["healthBar"] = {
						["colorType"] = "class",
						["order"] = 10,
						["background"] = true,
						["reactionType"] = "npc",
						["height"] = 1.2,
					},
					["columnSpacing"] = 30,
					["text"] = {
						{
							["text"] = "[(()afk() )][name]",
						}, -- [1]
						[3] = {
							["text"] = "[level( )][perpp]",
						},
						[5] = {
							["text"] = "[(()afk() )][name]",
						},
					},
					["attribAnchorPoint"] = "LEFT",
					["altPowerBar"] = {
						["height"] = 0.4,
						["background"] = true,
						["order"] = 100,
					},
					["width"] = 190,
					["emptyBar"] = {
						["reactionType"] = "none",
						["background"] = true,
						["order"] = 0,
						["height"] = 1,
					},
					["height"] = 45,
					["fader"] = {
						["height"] = 0.5,
					},
					["combatText"] = {
						["height"] = 0.5,
					},
					["incHeal"] = {
						["height"] = 0.5,
						["cap"] = 1,
					},
					["healAbsorb"] = {
						["height"] = 0.5,
						["cap"] = 1,
					},
					["portrait"] = {
						["enabled"] = true,
						["type"] = "3D",
						["alignment"] = "LEFT",
						["fullAfter"] = 50,
						["height"] = 0.5,
						["fullBefore"] = 0,
						["order"] = 15,
						["width"] = 0.22,
					},
					["attribPoint"] = "TOP",
				},
				["maintanktargettarget"] = {
					["healthBar"] = {
						["colorType"] = "class",
						["order"] = 10,
						["background"] = true,
						["reactionType"] = "npc",
						["height"] = 1.2,
					},
					["text"] = {
						{
							["text"] = "[(()afk() )][name]",
						}, -- [1]
						[3] = {
							["text"] = "[classification( )][perpp]",
						},
						[5] = {
							["text"] = "[(()afk() )][name]",
						},
					},
					["portrait"] = {
						["type"] = "3D",
						["alignment"] = "LEFT",
						["fullAfter"] = 100,
						["height"] = 0.5,
						["fullBefore"] = 0,
						["order"] = 15,
						["width"] = 0.22,
					},
					["width"] = 150,
					["castBar"] = {
						["time"] = {
							["enabled"] = true,
							["x"] = -1,
							["anchorTo"] = "$parent",
							["y"] = 0,
							["anchorPoint"] = "CRI",
							["size"] = 0,
						},
						["order"] = 40,
						["height"] = 0.6,
						["background"] = true,
						["icon"] = "HIDE",
						["name"] = {
							["y"] = 0,
							["x"] = 1,
							["anchorTo"] = "$parent",
							["rank"] = true,
							["anchorPoint"] = "CLI",
							["enabled"] = true,
							["size"] = 0,
						},
					},
					["auras"] = {
						["buffs"] = {
							["anchorPoint"] = "BL",
							["x"] = 0,
							["y"] = 0,
							["size"] = 16,
						},
						["debuffs"] = {
							["anchorPoint"] = "BL",
							["x"] = 0,
							["y"] = 0,
							["size"] = 16,
						},
					},
					["altPowerBar"] = {
						["height"] = 0.4,
						["background"] = true,
						["order"] = 100,
					},
					["emptyBar"] = {
						["reactionType"] = "none",
						["background"] = true,
						["order"] = 0,
						["height"] = 1,
					},
					["height"] = 40,
					["highlight"] = {
						["size"] = 10,
					},
					["powerBar"] = {
						["order"] = 20,
						["colorType"] = "type",
						["height"] = 1,
						["background"] = true,
					},
					["indicators"] = {
						["raidTarget"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "C",
							["size"] = 20,
						},
						["class"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "BL",
							["size"] = 16,
						},
					},
				},
				["focus"] = {
					["indicators"] = {
						["raidTarget"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "C",
							["size"] = 20,
						},
						["lfdRole"] = {
							["y"] = 14,
							["x"] = 3,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "BR",
							["size"] = 14,
						},
						["resurrect"] = {
							["y"] = -1,
							["x"] = 37,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "LC",
							["size"] = 28,
						},
						["masterLoot"] = {
							["y"] = -10,
							["x"] = 16,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "TL",
							["size"] = 12,
						},
						["leader"] = {
							["y"] = -12,
							["x"] = 2,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "TL",
							["size"] = 14,
						},
						["questBoss"] = {
							["y"] = 14,
							["x"] = 7,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "BR",
							["enabled"] = false,
							["size"] = 22,
						},
						["height"] = 0.5,
						["status"] = {
							["y"] = -2,
							["x"] = 12,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "LB",
							["size"] = 16,
						},
						["role"] = {
							["y"] = -11,
							["x"] = 30,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "TL",
							["size"] = 14,
						},
						["class"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "BL",
							["size"] = 16,
						},
						["pvp"] = {
							["y"] = -21,
							["x"] = 11,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "TR",
							["size"] = 22,
						},
					},
					["range"] = {
						["height"] = 0.5,
					},
					["auras"] = {
						["height"] = 0.5,
						["debuffs"] = {
							["anchorPoint"] = "BL",
							["x"] = 0,
							["y"] = 0,
							["size"] = 16,
						},
						["buffs"] = {
							["anchorPoint"] = "BL",
							["x"] = 0,
							["y"] = 0,
							["size"] = 16,
						},
					},
					["castBar"] = {
						["time"] = {
							["enabled"] = true,
							["x"] = -1,
							["anchorTo"] = "$parent",
							["y"] = 0,
							["anchorPoint"] = "CRI",
							["size"] = 0,
						},
						["order"] = 60,
						["height"] = 0.6,
						["background"] = true,
						["icon"] = "HIDE",
						["name"] = {
							["y"] = 0,
							["x"] = 1,
							["anchorTo"] = "$parent",
							["rank"] = true,
							["anchorPoint"] = "CLI",
							["enabled"] = true,
							["size"] = 0,
						},
					},
					["auraIndicators"] = {
						["height"] = 0.5,
					},
					["powerBar"] = {
						["order"] = 20,
						["colorType"] = "type",
						["height"] = 0.6,
						["background"] = true,
					},
					["healthBar"] = {
						["colorType"] = "class",
						["order"] = 10,
						["background"] = true,
						["reactionType"] = "npc",
						["height"] = 1.2,
					},
					["highlight"] = {
						["height"] = 0.5,
						["size"] = 10,
					},
					["text"] = {
						{
							["text"] = "[(()afk() )][name]",
						}, -- [1]
						{
							["text"] = "[curhp]",
						}, -- [2]
						{
							["text"] = "[perpp]",
						}, -- [3]
						{
							["text"] = "[curpp]",
						}, -- [4]
						{
							["text"] = "[(()afk() )][name]",
						}, -- [5]
					},
					["emptyBar"] = {
						["reactionType"] = "none",
						["background"] = true,
						["order"] = 0,
						["height"] = 1,
					},
					["width"] = 120,
					["altPowerBar"] = {
						["height"] = 0.4,
						["background"] = true,
						["order"] = 100,
					},
					["height"] = 28,
					["fader"] = {
						["height"] = 0.5,
					},
					["combatText"] = {
						["height"] = 0.5,
					},
					["incHeal"] = {
						["height"] = 0.5,
					},
					["healAbsorb"] = {
						["height"] = 0.5,
						["cap"] = 1,
					},
					["portrait"] = {
						["type"] = "3D",
						["alignment"] = "LEFT",
						["fullAfter"] = 50,
						["height"] = 0.5,
						["fullBefore"] = 0,
						["order"] = 15,
						["width"] = 0.22,
					},
					["incAbsorb"] = {
						["height"] = 0.5,
					},
				},
				["target"] = {
					["indicators"] = {
						["raidTarget"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "C",
							["size"] = 20,
						},
						["lfdRole"] = {
							["y"] = 14,
							["x"] = 3,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "BR",
							["size"] = 14,
						},
						["resurrect"] = {
							["y"] = -1,
							["x"] = -39,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "RC",
							["size"] = 28,
						},
						["masterLoot"] = {
							["y"] = -10,
							["x"] = 16,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "TL",
							["size"] = 12,
						},
						["leader"] = {
							["y"] = -12,
							["x"] = 2,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "TL",
							["size"] = 14,
						},
						["questBoss"] = {
							["y"] = 24,
							["x"] = 9,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "BR",
							["size"] = 22,
						},
						["height"] = 0.5,
						["status"] = {
							["y"] = -2,
							["x"] = 12,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "LB",
							["size"] = 16,
						},
						["role"] = {
							["y"] = -11,
							["x"] = 30,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "TL",
							["size"] = 14,
						},
						["class"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "BL",
							["size"] = 16,
						},
						["pvp"] = {
							["y"] = -21,
							["x"] = 11,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "TR",
							["size"] = 22,
						},
					},
					["range"] = {
						["height"] = 0.5,
					},
					["auras"] = {
						["height"] = 0.5,
						["debuffs"] = {
							["enabled"] = true,
							["x"] = 0,
							["anchorPoint"] = "BL",
							["y"] = 0,
							["size"] = 16,
						},
						["buffs"] = {
							["enabled"] = true,
							["x"] = 0,
							["anchorPoint"] = "BL",
							["y"] = 0,
							["size"] = 16,
						},
					},
					["castBar"] = {
						["time"] = {
							["enabled"] = true,
							["x"] = -1,
							["anchorTo"] = "$parent",
							["y"] = 0,
							["anchorPoint"] = "CRI",
							["size"] = 0,
						},
						["order"] = 60,
						["height"] = 0.6,
						["background"] = true,
						["icon"] = "HIDE",
						["name"] = {
							["y"] = 0,
							["x"] = 1,
							["anchorTo"] = "$parent",
							["rank"] = true,
							["anchorPoint"] = "CLI",
							["enabled"] = true,
							["size"] = 0,
						},
					},
					["auraIndicators"] = {
						["height"] = 0.5,
					},
					["powerBar"] = {
						["order"] = 20,
						["colorType"] = "type",
						["height"] = 1,
						["background"] = true,
					},
					["healthBar"] = {
						["colorType"] = "class",
						["order"] = 10,
						["background"] = true,
						["reactionType"] = "npc",
						["height"] = 1.2,
					},
					["highlight"] = {
						["height"] = 0.5,
						["size"] = 10,
					},
					["text"] = {
						{
							["text"] = "[(()afk() )][name]",
						}, -- [1]
						[3] = {
							["text"] = "[level( )][classification( )][perpp]",
						},
						[5] = {
							["text"] = "[(()afk() )][name]",
						},
					},
					["emptyBar"] = {
						["reactionType"] = "none",
						["background"] = true,
						["order"] = 0,
						["height"] = 1,
					},
					["width"] = 190,
					["portrait"] = {
						["enabled"] = true,
						["type"] = "3D",
						["alignment"] = "RIGHT",
						["fullAfter"] = 50,
						["height"] = 0.5,
						["fullBefore"] = 0,
						["order"] = 15,
						["width"] = 0.22,
					},
					["height"] = 45,
					["altPowerBar"] = {
						["height"] = 0.4,
						["background"] = true,
						["order"] = 100,
					},
					["combatText"] = {
						["height"] = 0.5,
					},
					["incHeal"] = {
						["height"] = 0.5,
						["cap"] = 1,
					},
					["healAbsorb"] = {
						["height"] = 0.5,
						["cap"] = 1,
					},
					["incAbsorb"] = {
						["height"] = 0.5,
						["cap"] = 1,
					},
					["comboPoints"] = {
						["anchorTo"] = "$parent",
						["order"] = 60,
						["growth"] = "LEFT",
						["anchorPoint"] = "BR",
						["x"] = -3,
						["spacing"] = -4,
						["height"] = 0.4,
						["y"] = 8,
						["size"] = 14,
					},
				},
				["battlegroundtarget"] = {
					["healthBar"] = {
						["colorType"] = "class",
						["order"] = 10,
						["background"] = true,
						["reactionType"] = "npc",
						["height"] = 1.2,
					},
					["text"] = {
						nil, -- [1]
						{
							["text"] = "[curhp]",
						}, -- [2]
						{
							["text"] = "",
						}, -- [3]
						{
							["text"] = "",
						}, -- [4]
						{
							["text"] = "[name]",
						}, -- [5]
					},
					["portrait"] = {
						["type"] = "3D",
						["alignment"] = "LEFT",
						["fullAfter"] = 100,
						["height"] = 0.5,
						["fullBefore"] = 0,
						["order"] = 15,
						["width"] = 0.22,
					},
					["width"] = 90,
					["castBar"] = {
						["time"] = {
							["enabled"] = true,
							["x"] = -1,
							["anchorTo"] = "$parent",
							["y"] = 0,
							["anchorPoint"] = "CRI",
							["size"] = 0,
						},
						["order"] = 40,
						["height"] = 0.6,
						["background"] = true,
						["icon"] = "HIDE",
						["name"] = {
							["y"] = 0,
							["x"] = 1,
							["anchorTo"] = "$parent",
							["rank"] = true,
							["anchorPoint"] = "CLI",
							["enabled"] = true,
							["size"] = 0,
						},
					},
					["auras"] = {
						["buffs"] = {
							["anchorPoint"] = "BL",
							["x"] = 0,
							["y"] = 0,
							["size"] = 16,
						},
						["debuffs"] = {
							["anchorPoint"] = "BL",
							["x"] = 0,
							["y"] = 0,
							["size"] = 16,
						},
					},
					["altPowerBar"] = {
						["height"] = 0.4,
						["background"] = true,
						["order"] = 100,
					},
					["emptyBar"] = {
						["reactionType"] = "none",
						["background"] = true,
						["order"] = 0,
						["height"] = 1,
					},
					["height"] = 25,
					["highlight"] = {
						["size"] = 10,
					},
					["powerBar"] = {
						["order"] = 20,
						["colorType"] = "type",
						["height"] = 0.6,
						["background"] = true,
					},
					["indicators"] = {
						["raidTarget"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "C",
							["size"] = 20,
						},
						["class"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "BL",
							["size"] = 16,
						},
					},
				},
				["boss"] = {
					["highlight"] = {
						["height"] = 0.5,
						["size"] = 10,
					},
					["range"] = {
						["height"] = 0.5,
					},
					["auras"] = {
						["height"] = 0.5,
						["debuffs"] = {
							["enabled"] = true,
							["x"] = 0,
							["anchorPoint"] = "BL",
							["y"] = 0,
							["perRow"] = 8,
							["size"] = 16,
						},
						["buffs"] = {
							["enabled"] = true,
							["x"] = 0,
							["y"] = 0,
							["anchorPoint"] = "BL",
							["perRow"] = 8,
							["size"] = 16,
						},
					},
					["castBar"] = {
						["time"] = {
							["enabled"] = true,
							["x"] = -1,
							["anchorTo"] = "$parent",
							["y"] = 0,
							["anchorPoint"] = "CRI",
							["size"] = 0,
						},
						["order"] = 40,
						["height"] = 0.6,
						["background"] = true,
						["icon"] = "HIDE",
						["name"] = {
							["y"] = 0,
							["x"] = 1,
							["anchorTo"] = "$parent",
							["rank"] = true,
							["anchorPoint"] = "CLI",
							["enabled"] = true,
							["size"] = 0,
						},
					},
					["auraIndicators"] = {
						["height"] = 0.5,
					},
					["powerBar"] = {
						["order"] = 20,
						["colorType"] = "type",
						["height"] = 1,
						["background"] = true,
					},
					["offset"] = 20,
					["healthBar"] = {
						["colorType"] = "class",
						["order"] = 10,
						["background"] = true,
						["reactionType"] = "npc",
						["height"] = 1.2,
					},
					["text"] = {
						[3] = {
							["text"] = "[perpp]",
						},
						[5] = {
							["text"] = "[name]",
						},
					},
					["width"] = 160,
					["emptyBar"] = {
						["reactionType"] = "none",
						["background"] = true,
						["order"] = 0,
						["height"] = 1,
					},
					["altPowerBar"] = {
						["height"] = 0.4,
						["background"] = true,
						["order"] = 100,
					},
					["combatText"] = {
						["height"] = 0.5,
					},
					["height"] = 40,
					["indicators"] = {
						["raidTarget"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "C",
							["size"] = 20,
						},
						["class"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "BL",
							["size"] = 16,
						},
						["height"] = 0.5,
					},
					["enabled"] = true,
					["portrait"] = {
						["type"] = "3D",
						["alignment"] = "LEFT",
						["fullAfter"] = 100,
						["height"] = 0.5,
						["fullBefore"] = 0,
						["order"] = 15,
						["width"] = 0.22,
					},
				},
				["maintank"] = {
					["portrait"] = {
						["type"] = "3D",
						["alignment"] = "LEFT",
						["fullAfter"] = 50,
						["height"] = 0.5,
						["fullBefore"] = 0,
						["order"] = 15,
						["width"] = 0.22,
					},
					["auras"] = {
						["buffs"] = {
							["anchorPoint"] = "BL",
							["x"] = 0,
							["y"] = 0,
							["size"] = 16,
						},
						["debuffs"] = {
							["anchorPoint"] = "BL",
							["x"] = 0,
							["y"] = 0,
							["size"] = 16,
						},
					},
					["castBar"] = {
						["time"] = {
							["enabled"] = true,
							["x"] = -1,
							["anchorTo"] = "$parent",
							["y"] = 0,
							["anchorPoint"] = "CRI",
							["size"] = 0,
						},
						["order"] = 60,
						["height"] = 0.6,
						["background"] = true,
						["icon"] = "HIDE",
						["name"] = {
							["y"] = 0,
							["x"] = 1,
							["anchorTo"] = "$parent",
							["rank"] = true,
							["anchorPoint"] = "CLI",
							["enabled"] = true,
							["size"] = 0,
						},
					},
					["incAbsorb"] = {
						["cap"] = 1,
					},
					["powerBar"] = {
						["order"] = 20,
						["colorType"] = "type",
						["height"] = 1,
						["background"] = true,
					},
					["offset"] = 5,
					["healthBar"] = {
						["colorType"] = "class",
						["order"] = 10,
						["background"] = true,
						["reactionType"] = "npc",
						["height"] = 1.2,
					},
					["indicators"] = {
						["raidTarget"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "C",
							["size"] = 20,
						},
						["resurrect"] = {
							["y"] = -1,
							["x"] = 37,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "LC",
							["size"] = 28,
						},
						["masterLoot"] = {
							["y"] = -10,
							["x"] = 16,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "TL",
							["size"] = 12,
						},
						["leader"] = {
							["y"] = -12,
							["x"] = 2,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "TL",
							["size"] = 14,
						},
						["role"] = {
							["y"] = -11,
							["x"] = 30,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "TL",
							["size"] = 14,
						},
						["status"] = {
							["y"] = -2,
							["x"] = 12,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "LB",
							["size"] = 16,
						},
						["pvp"] = {
							["y"] = -21,
							["x"] = 11,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "TR",
							["size"] = 22,
						},
						["class"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "BL",
							["size"] = 16,
						},
						["ready"] = {
							["y"] = 0,
							["x"] = 35,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "LC",
							["size"] = 24,
						},
					},
					["attribAnchorPoint"] = "LEFT",
					["text"] = {
						{
							["text"] = "[(()afk() )][name]",
						}, -- [1]
						[3] = {
							["text"] = "[perpp]",
						},
						[5] = {
							["text"] = "[(()afk() )][name]",
						},
					},
					["columnSpacing"] = 5,
					["width"] = 150,
					["maxColumns"] = 1,
					["height"] = 40,
					["altPowerBar"] = {
						["height"] = 0.4,
						["background"] = true,
						["order"] = 100,
					},
					["unitsPerColumn"] = 5,
					["incHeal"] = {
						["cap"] = 1,
					},
					["healAbsorb"] = {
						["cap"] = 1,
					},
					["emptyBar"] = {
						["reactionType"] = "none",
						["background"] = true,
						["order"] = 0,
						["height"] = 1,
					},
					["highlight"] = {
						["size"] = 10,
					},
				},
				["raidpet"] = {
					["portrait"] = {
						["type"] = "3D",
						["alignment"] = "LEFT",
						["fullAfter"] = 100,
						["height"] = 0.5,
						["fullBefore"] = 0,
						["order"] = 15,
						["width"] = 0.22,
					},
					["scale"] = 0.85,
					["auras"] = {
						["buffs"] = {
							["anchorPoint"] = "BL",
							["x"] = 0,
							["y"] = 0,
							["size"] = 16,
						},
						["debuffs"] = {
							["anchorPoint"] = "BL",
							["x"] = 0,
							["y"] = 0,
							["size"] = 16,
						},
					},
					["castBar"] = {
						["time"] = {
							["enabled"] = true,
							["x"] = -1,
							["anchorTo"] = "$parent",
							["y"] = 0,
							["anchorPoint"] = "CRI",
							["size"] = 0,
						},
						["order"] = 40,
						["height"] = 0.6,
						["background"] = true,
						["icon"] = "HIDE",
						["name"] = {
							["y"] = 0,
							["x"] = 1,
							["anchorTo"] = "$parent",
							["rank"] = true,
							["anchorPoint"] = "CLI",
							["enabled"] = true,
							["size"] = 0,
						},
					},
					["groupSpacing"] = 0,
					["incAbsorb"] = {
						["cap"] = 1,
					},
					["powerBar"] = {
						["order"] = 20,
						["colorType"] = "type",
						["height"] = 0.3,
						["background"] = true,
					},
					["groupsPerRow"] = 8,
					["healthBar"] = {
						["colorType"] = "class",
						["order"] = 10,
						["background"] = true,
						["reactionType"] = "none",
						["height"] = 1.2,
					},
					["unitsPerColumn"] = 8,
					["text"] = {
						nil, -- [1]
						{
							["text"] = "[missinghp]",
						}, -- [2]
						{
							["text"] = "",
						}, -- [3]
						{
							["text"] = "",
						}, -- [4]
						{
							["text"] = "[name]",
						}, -- [5]
					},
					["emptyBar"] = {
						["reactionType"] = "none",
						["background"] = true,
						["order"] = 0,
						["height"] = 1,
					},
					["columnSpacing"] = 5,
					["width"] = 90,
					["maxColumns"] = 8,
					["incHeal"] = {
						["cap"] = 1,
					},
					["altPowerBar"] = {
						["height"] = 0.4,
						["background"] = true,
						["order"] = 100,
					},
					["indicators"] = {
						["raidTarget"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "C",
							["size"] = 20,
						},
					},
					["height"] = 30,
					["healAbsorb"] = {
						["cap"] = 1,
					},
					["attribAnchorPoint"] = "LEFT",
					["highlight"] = {
						["size"] = 10,
					},
				},
				["battlegroundtargettarget"] = {
					["healthBar"] = {
						["colorType"] = "class",
						["order"] = 10,
						["background"] = true,
						["reactionType"] = "npc",
						["height"] = 1.2,
					},
					["text"] = {
						nil, -- [1]
						{
							["text"] = "[curhp]",
						}, -- [2]
						{
							["text"] = "",
						}, -- [3]
						{
							["text"] = "",
						}, -- [4]
						{
							["text"] = "[name]",
						}, -- [5]
					},
					["portrait"] = {
						["type"] = "3D",
						["alignment"] = "LEFT",
						["fullAfter"] = 100,
						["height"] = 0.5,
						["fullBefore"] = 0,
						["order"] = 15,
						["width"] = 0.22,
					},
					["width"] = 90,
					["castBar"] = {
						["time"] = {
							["enabled"] = true,
							["x"] = -1,
							["anchorTo"] = "$parent",
							["y"] = 0,
							["anchorPoint"] = "CRI",
							["size"] = 0,
						},
						["order"] = 40,
						["height"] = 0.6,
						["background"] = true,
						["icon"] = "HIDE",
						["name"] = {
							["y"] = 0,
							["x"] = 1,
							["anchorTo"] = "$parent",
							["rank"] = true,
							["anchorPoint"] = "CLI",
							["enabled"] = true,
							["size"] = 0,
						},
					},
					["auras"] = {
						["buffs"] = {
							["anchorPoint"] = "BL",
							["x"] = 0,
							["y"] = 0,
							["size"] = 16,
						},
						["debuffs"] = {
							["anchorPoint"] = "BL",
							["x"] = 0,
							["y"] = 0,
							["size"] = 16,
						},
					},
					["altPowerBar"] = {
						["height"] = 0.4,
						["background"] = true,
						["order"] = 100,
					},
					["emptyBar"] = {
						["reactionType"] = "none",
						["background"] = true,
						["order"] = 0,
						["height"] = 1,
					},
					["height"] = 25,
					["highlight"] = {
						["size"] = 10,
					},
					["powerBar"] = {
						["order"] = 20,
						["colorType"] = "type",
						["height"] = 0.6,
						["background"] = true,
					},
					["indicators"] = {
						["raidTarget"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "C",
							["size"] = 20,
						},
						["class"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "BL",
							["size"] = 16,
						},
					},
				},
				["bosstargettarget"] = {
					["healthBar"] = {
						["colorType"] = "class",
						["order"] = 10,
						["background"] = true,
						["reactionType"] = "npc",
						["height"] = 1.2,
					},
					["text"] = {
						nil, -- [1]
						{
							["text"] = "[curhp]",
						}, -- [2]
						{
							["text"] = "",
						}, -- [3]
						{
							["text"] = "",
						}, -- [4]
						{
							["text"] = "[name]",
						}, -- [5]
					},
					["portrait"] = {
						["type"] = "3D",
						["alignment"] = "LEFT",
						["fullAfter"] = 100,
						["height"] = 0.5,
						["fullBefore"] = 0,
						["order"] = 15,
						["width"] = 0.22,
					},
					["width"] = 90,
					["castBar"] = {
						["time"] = {
							["enabled"] = true,
							["x"] = -1,
							["anchorTo"] = "$parent",
							["y"] = 0,
							["anchorPoint"] = "CRI",
							["size"] = 0,
						},
						["order"] = 40,
						["height"] = 0.6,
						["background"] = true,
						["icon"] = "HIDE",
						["name"] = {
							["y"] = 0,
							["x"] = 1,
							["anchorTo"] = "$parent",
							["rank"] = true,
							["anchorPoint"] = "CLI",
							["enabled"] = true,
							["size"] = 0,
						},
					},
					["auras"] = {
						["buffs"] = {
							["anchorPoint"] = "BL",
							["x"] = 0,
							["y"] = 0,
							["size"] = 16,
						},
						["debuffs"] = {
							["anchorPoint"] = "BL",
							["x"] = 0,
							["y"] = 0,
							["size"] = 16,
						},
					},
					["altPowerBar"] = {
						["height"] = 0.4,
						["background"] = true,
						["order"] = 100,
					},
					["emptyBar"] = {
						["reactionType"] = "none",
						["background"] = true,
						["order"] = 0,
						["height"] = 1,
					},
					["height"] = 25,
					["highlight"] = {
						["size"] = 10,
					},
					["powerBar"] = {
						["order"] = 20,
						["colorType"] = "type",
						["height"] = 0.6,
						["background"] = true,
					},
					["indicators"] = {
						["raidTarget"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "C",
							["size"] = 20,
						},
						["class"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "BL",
							["size"] = 16,
						},
					},
				},
				["pet"] = {
					["xpBar"] = {
						["height"] = 0.25,
						["background"] = true,
						["order"] = 55,
					},
					["indicators"] = {
						["raidTarget"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "C",
							["size"] = 20,
						},
						["height"] = 0.5,
					},
					["range"] = {
						["height"] = 0.5,
					},
					["auras"] = {
						["height"] = 0.5,
						["debuffs"] = {
							["anchorPoint"] = "BL",
							["x"] = 0,
							["y"] = 0,
							["size"] = 16,
						},
						["buffs"] = {
							["anchorPoint"] = "BL",
							["x"] = 0,
							["y"] = 0,
							["size"] = 16,
						},
					},
					["castBar"] = {
						["time"] = {
							["enabled"] = true,
							["x"] = -1,
							["anchorTo"] = "$parent",
							["y"] = 0,
							["anchorPoint"] = "CRI",
							["size"] = 0,
						},
						["order"] = 60,
						["height"] = 0.6,
						["background"] = true,
						["icon"] = "HIDE",
						["name"] = {
							["y"] = 0,
							["x"] = 1,
							["anchorTo"] = "$parent",
							["rank"] = true,
							["anchorPoint"] = "CLI",
							["enabled"] = true,
							["size"] = 0,
						},
					},
					["auraIndicators"] = {
						["height"] = 0.5,
					},
					["powerBar"] = {
						["order"] = 20,
						["colorType"] = "type",
						["height"] = 0.7,
						["background"] = true,
					},
					["healthBar"] = {
						["colorType"] = "class",
						["order"] = 10,
						["background"] = true,
						["reactionType"] = "none",
						["height"] = 1.2,
					},
					["highlight"] = {
						["height"] = 0.5,
						["size"] = 10,
					},
					["text"] = {
						[3] = {
							["text"] = "[perpp]",
						},
						[5] = {
							["text"] = "[name]",
						},
					},
					["emptyBar"] = {
						["reactionType"] = "none",
						["background"] = true,
						["order"] = 0,
						["height"] = 1,
					},
					["width"] = 190,
					["altPowerBar"] = {
						["height"] = 0.4,
						["background"] = true,
						["order"] = 100,
					},
					["height"] = 30,
					["fader"] = {
						["height"] = 0.5,
					},
					["combatText"] = {
						["height"] = 0.5,
					},
					["incHeal"] = {
						["height"] = 0.5,
					},
					["healAbsorb"] = {
						["height"] = 0.5,
						["cap"] = 1,
					},
					["incAbsorb"] = {
						["height"] = 0.5,
					},
					["portrait"] = {
						["type"] = "3D",
						["alignment"] = "LEFT",
						["fullAfter"] = 50,
						["height"] = 0.5,
						["fullBefore"] = 0,
						["order"] = 15,
						["width"] = 0.22,
					},
				},
				["bosstarget"] = {
					["healthBar"] = {
						["colorType"] = "class",
						["order"] = 10,
						["background"] = true,
						["reactionType"] = "npc",
						["height"] = 1.2,
					},
					["text"] = {
						nil, -- [1]
						{
							["text"] = "[curhp]",
						}, -- [2]
						{
							["text"] = "",
						}, -- [3]
						{
							["text"] = "",
						}, -- [4]
						{
							["text"] = "[name]",
						}, -- [5]
					},
					["portrait"] = {
						["type"] = "3D",
						["alignment"] = "LEFT",
						["fullAfter"] = 100,
						["height"] = 0.5,
						["fullBefore"] = 0,
						["order"] = 15,
						["width"] = 0.22,
					},
					["width"] = 90,
					["castBar"] = {
						["time"] = {
							["enabled"] = true,
							["x"] = -1,
							["anchorTo"] = "$parent",
							["y"] = 0,
							["anchorPoint"] = "CRI",
							["size"] = 0,
						},
						["order"] = 40,
						["height"] = 0.6,
						["background"] = true,
						["icon"] = "HIDE",
						["name"] = {
							["y"] = 0,
							["x"] = 1,
							["anchorTo"] = "$parent",
							["rank"] = true,
							["anchorPoint"] = "CLI",
							["enabled"] = true,
							["size"] = 0,
						},
					},
					["auras"] = {
						["buffs"] = {
							["anchorPoint"] = "BL",
							["x"] = 0,
							["y"] = 0,
							["size"] = 16,
						},
						["debuffs"] = {
							["anchorPoint"] = "BL",
							["x"] = 0,
							["y"] = 0,
							["size"] = 16,
						},
					},
					["altPowerBar"] = {
						["height"] = 0.4,
						["background"] = true,
						["order"] = 100,
					},
					["emptyBar"] = {
						["reactionType"] = "none",
						["background"] = true,
						["order"] = 0,
						["height"] = 1,
					},
					["height"] = 25,
					["highlight"] = {
						["size"] = 10,
					},
					["powerBar"] = {
						["order"] = 20,
						["colorType"] = "type",
						["height"] = 0.6,
						["background"] = true,
					},
					["indicators"] = {
						["raidTarget"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "C",
							["size"] = 20,
						},
						["class"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "BL",
							["size"] = 16,
						},
					},
				},
				["focustarget"] = {
					["highlight"] = {
						["height"] = 0.5,
						["size"] = 10,
					},
					["portrait"] = {
						["type"] = "3D",
						["alignment"] = "RIGHT",
						["fullAfter"] = 100,
						["height"] = 0.5,
						["fullBefore"] = 0,
						["order"] = 15,
						["width"] = 0.22,
					},
					["text"] = {
						{
							["text"] = "[(()afk() )][name]",
						}, -- [1]
						{
							["text"] = "[curhp]",
						}, -- [2]
						{
							["text"] = "",
						}, -- [3]
						{
							["text"] = "",
						}, -- [4]
						{
							["text"] = "[(()afk() )][name]",
						}, -- [5]
					},
					["auras"] = {
						["height"] = 0.5,
						["debuffs"] = {
							["anchorPoint"] = "BL",
							["x"] = 0,
							["y"] = 0,
							["size"] = 16,
						},
						["buffs"] = {
							["anchorPoint"] = "BL",
							["x"] = 0,
							["y"] = 0,
							["size"] = 16,
						},
					},
					["emptyBar"] = {
						["reactionType"] = "none",
						["background"] = true,
						["order"] = 0,
						["height"] = 1,
					},
					["range"] = {
						["height"] = 0.5,
					},
					["width"] = 120,
					["castBar"] = {
						["time"] = {
							["enabled"] = true,
							["x"] = -1,
							["anchorTo"] = "$parent",
							["y"] = 0,
							["anchorPoint"] = "CRI",
							["size"] = 0,
						},
						["order"] = 40,
						["height"] = 0.6,
						["background"] = true,
						["icon"] = "HIDE",
						["name"] = {
							["y"] = 0,
							["x"] = 1,
							["anchorTo"] = "$parent",
							["rank"] = true,
							["anchorPoint"] = "CLI",
							["enabled"] = true,
							["size"] = 0,
						},
					},
					["altPowerBar"] = {
						["height"] = 0.4,
						["background"] = true,
						["order"] = 100,
					},
					["fader"] = {
						["height"] = 0.5,
					},
					["indicators"] = {
						["raidTarget"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "C",
							["size"] = 20,
						},
						["class"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "BL",
							["size"] = 16,
						},
						["height"] = 0.5,
					},
					["height"] = 25,
					["auraIndicators"] = {
						["height"] = 0.5,
					},
					["powerBar"] = {
						["order"] = 20,
						["colorType"] = "type",
						["height"] = 0.6,
						["background"] = true,
					},
					["healthBar"] = {
						["colorType"] = "class",
						["order"] = 10,
						["background"] = true,
						["reactionType"] = "npc",
						["height"] = 1.2,
					},
				},
				["targettarget"] = {
					["portrait"] = {
						["type"] = "3D",
						["alignment"] = "RIGHT",
						["fullAfter"] = 100,
						["height"] = 0.5,
						["fullBefore"] = 0,
						["order"] = 15,
						["width"] = 0.22,
					},
					["healthBar"] = {
						["colorType"] = "class",
						["order"] = 10,
						["background"] = true,
						["reactionType"] = "npc",
						["height"] = 1.2,
					},
					["width"] = 110,
					["emptyBar"] = {
						["reactionType"] = "none",
						["background"] = true,
						["order"] = 0,
						["height"] = 1,
					},
					["range"] = {
						["height"] = 0.5,
					},
					["auras"] = {
						["height"] = 0.5,
						["debuffs"] = {
							["anchorPoint"] = "BL",
							["x"] = 0,
							["y"] = 0,
							["size"] = 16,
						},
						["buffs"] = {
							["anchorPoint"] = "BL",
							["x"] = 0,
							["y"] = 0,
							["size"] = 16,
						},
					},
					["castBar"] = {
						["time"] = {
							["enabled"] = true,
							["x"] = -1,
							["anchorTo"] = "$parent",
							["y"] = 0,
							["anchorPoint"] = "CRI",
							["size"] = 0,
						},
						["order"] = 40,
						["height"] = 0.6,
						["background"] = true,
						["icon"] = "HIDE",
						["name"] = {
							["y"] = 0,
							["x"] = 1,
							["anchorTo"] = "$parent",
							["rank"] = true,
							["anchorPoint"] = "CLI",
							["enabled"] = true,
							["size"] = 0,
						},
					},
					["text"] = {
						nil, -- [1]
						{
							["text"] = "[curhp]",
						}, -- [2]
						{
							["text"] = "[perpp]",
						}, -- [3]
						{
							["text"] = "[curpp]",
						}, -- [4]
					},
					["altPowerBar"] = {
						["height"] = 0.4,
						["background"] = true,
						["order"] = 100,
					},
					["indicators"] = {
						["raidTarget"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "C",
							["size"] = 20,
						},
						["class"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "BL",
							["size"] = 16,
						},
						["height"] = 0.5,
					},
					["height"] = 30,
					["auraIndicators"] = {
						["height"] = 0.5,
					},
					["powerBar"] = {
						["order"] = 20,
						["colorType"] = "type",
						["height"] = 0.6,
						["background"] = true,
					},
					["highlight"] = {
						["height"] = 0.5,
						["size"] = 10,
					},
				},
				["partypet"] = {
					["portrait"] = {
						["type"] = "3D",
						["alignment"] = "LEFT",
						["fullAfter"] = 100,
						["height"] = 0.5,
						["fullBefore"] = 0,
						["order"] = 15,
						["width"] = 0.22,
					},
					["text"] = {
						nil, -- [1]
						{
							["text"] = "[curhp]",
						}, -- [2]
						{
							["text"] = "",
						}, -- [3]
						{
							["text"] = "",
						}, -- [4]
						{
							["text"] = "[name]",
						}, -- [5]
					},
					["emptyBar"] = {
						["reactionType"] = "none",
						["background"] = true,
						["order"] = 0,
						["height"] = 1,
					},
					["indicators"] = {
						["raidTarget"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "C",
							["size"] = 20,
						},
					},
					["auras"] = {
						["buffs"] = {
							["anchorPoint"] = "BL",
							["x"] = 0,
							["y"] = 0,
							["size"] = 16,
						},
						["debuffs"] = {
							["anchorPoint"] = "BL",
							["x"] = 0,
							["y"] = 0,
							["size"] = 16,
						},
					},
					["castBar"] = {
						["time"] = {
							["enabled"] = true,
							["x"] = -1,
							["anchorTo"] = "$parent",
							["y"] = 0,
							["anchorPoint"] = "CRI",
							["size"] = 0,
						},
						["order"] = 40,
						["height"] = 0.6,
						["background"] = true,
						["icon"] = "HIDE",
						["name"] = {
							["y"] = 0,
							["x"] = 1,
							["anchorTo"] = "$parent",
							["rank"] = true,
							["anchorPoint"] = "CLI",
							["enabled"] = true,
							["size"] = 0,
						},
					},
					["highlight"] = {
						["size"] = 10,
					},
					["altPowerBar"] = {
						["height"] = 0.4,
						["background"] = true,
						["order"] = 100,
					},
					["width"] = 90,
					["height"] = 25,
					["healAbsorb"] = {
						["cap"] = 1,
					},
					["powerBar"] = {
						["order"] = 20,
						["colorType"] = "type",
						["height"] = 0.6,
						["background"] = true,
					},
					["healthBar"] = {
						["colorType"] = "class",
						["order"] = 10,
						["background"] = true,
						["reactionType"] = "npc",
						["height"] = 1.2,
					},
				},
				["maintanktarget"] = {
					["healthBar"] = {
						["colorType"] = "class",
						["order"] = 10,
						["background"] = true,
						["reactionType"] = "npc",
						["height"] = 1.2,
					},
					["text"] = {
						{
							["text"] = "[(()afk() )][name]",
						}, -- [1]
						[3] = {
							["text"] = "[classification( )][perpp]",
						},
						[5] = {
							["text"] = "[(()afk() )][name]",
						},
					},
					["portrait"] = {
						["type"] = "3D",
						["alignment"] = "LEFT",
						["fullAfter"] = 100,
						["height"] = 0.5,
						["fullBefore"] = 0,
						["order"] = 15,
						["width"] = 0.22,
					},
					["width"] = 150,
					["castBar"] = {
						["time"] = {
							["enabled"] = true,
							["x"] = -1,
							["anchorTo"] = "$parent",
							["y"] = 0,
							["anchorPoint"] = "CRI",
							["size"] = 0,
						},
						["order"] = 40,
						["height"] = 0.6,
						["background"] = true,
						["icon"] = "HIDE",
						["name"] = {
							["y"] = 0,
							["x"] = 1,
							["anchorTo"] = "$parent",
							["rank"] = true,
							["anchorPoint"] = "CLI",
							["enabled"] = true,
							["size"] = 0,
						},
					},
					["auras"] = {
						["buffs"] = {
							["anchorPoint"] = "BL",
							["x"] = 0,
							["y"] = 0,
							["size"] = 16,
						},
						["debuffs"] = {
							["anchorPoint"] = "BL",
							["x"] = 0,
							["y"] = 0,
							["size"] = 16,
						},
					},
					["altPowerBar"] = {
						["height"] = 0.4,
						["background"] = true,
						["order"] = 100,
					},
					["emptyBar"] = {
						["reactionType"] = "none",
						["background"] = true,
						["order"] = 0,
						["height"] = 1,
					},
					["height"] = 40,
					["highlight"] = {
						["size"] = 10,
					},
					["powerBar"] = {
						["order"] = 20,
						["colorType"] = "type",
						["height"] = 1,
						["background"] = true,
					},
					["indicators"] = {
						["raidTarget"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "C",
							["size"] = 20,
						},
						["class"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "BL",
							["size"] = 16,
						},
					},
				},
				["player"] = {
					["xpBar"] = {
						["height"] = 0.25,
						["background"] = true,
						["order"] = 55,
					},
					["portrait"] = {
						["enabled"] = true,
						["type"] = "3D",
						["alignment"] = "LEFT",
						["fullAfter"] = 50,
						["height"] = 0.5,
						["fullBefore"] = 0,
						["order"] = 15,
						["width"] = 0.22,
					},
					["highlight"] = {
						["height"] = 0.5,
						["size"] = 10,
					},
					["indicators"] = {
						["raidTarget"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "C",
							["size"] = 20,
						},
						["lfdRole"] = {
							["y"] = 14,
							["x"] = 3,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "BR",
							["size"] = 14,
						},
						["resurrect"] = {
							["y"] = -1,
							["x"] = 37,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "LC",
							["size"] = 28,
						},
						["masterLoot"] = {
							["y"] = -10,
							["x"] = 16,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "TL",
							["size"] = 12,
						},
						["leader"] = {
							["y"] = -12,
							["x"] = 2,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "TL",
							["size"] = 14,
						},
						["role"] = {
							["y"] = -11,
							["x"] = 30,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "TL",
							["size"] = 14,
						},
						["status"] = {
							["y"] = -2,
							["x"] = 12,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "LB",
							["size"] = 16,
						},
						["pvp"] = {
							["y"] = -21,
							["x"] = 11,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "TR",
							["size"] = 22,
						},
						["height"] = 0.5,
						["ready"] = {
							["y"] = 0,
							["x"] = 35,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "LC",
							["size"] = 24,
						},
					},
					["healAbsorb"] = {
						["height"] = 0.5,
						["cap"] = 1,
					},
					["totemBar"] = {
						["enabled"] = true,
						["background"] = false,
						["height"] = 0.4,
						["order"] = 70,
					},
					["auras"] = {
						["height"] = 0.5,
						["debuffs"] = {
							["anchorPoint"] = "BL",
							["maxRows"] = 1,
							["y"] = 0,
							["x"] = 0,
							["size"] = 16,
						},
						["buffs"] = {
							["y"] = 0,
							["maxRows"] = 1,
							["anchorPoint"] = "BL",
							["x"] = 0,
							["size"] = 16,
						},
					},
					["castBar"] = {
						["time"] = {
							["enabled"] = true,
							["x"] = -1,
							["anchorTo"] = "$parent",
							["y"] = 0,
							["anchorPoint"] = "CRI",
							["size"] = 0,
						},
						["order"] = 60,
						["height"] = 0.6,
						["background"] = true,
						["icon"] = "HIDE",
						["name"] = {
							["y"] = 0,
							["x"] = 1,
							["anchorTo"] = "$parent",
							["rank"] = true,
							["anchorPoint"] = "CLI",
							["enabled"] = true,
							["size"] = 0,
						},
					},
					["incHeal"] = {
						["height"] = 0.5,
						["cap"] = 1,
					},
					["fader"] = {
						["inactiveAlpha"] = 0.6,
						["height"] = 0.5,
						["combatAlpha"] = 1,
					},
					["altPowerBar"] = {
						["height"] = 0.4,
						["background"] = true,
						["order"] = 100,
					},
					["incAbsorb"] = {
						["height"] = 0.5,
						["cap"] = 1,
					},
					["auraIndicators"] = {
						["height"] = 0.5,
					},
					["comboPoints"] = {
						["anchorTo"] = "$parent",
						["order"] = 60,
						["growth"] = "LEFT",
						["anchorPoint"] = "BR",
						["x"] = -3,
						["spacing"] = -4,
						["height"] = 0.4,
						["y"] = 8,
						["size"] = 14,
					},
					["staggerBar"] = {
						["height"] = 0.3,
						["background"] = true,
						["order"] = 70,
					},
					["chi"] = {
						["anchorTo"] = "$parent",
						["order"] = 60,
						["showAlways"] = true,
						["growth"] = "LEFT",
						["anchorPoint"] = "BR",
						["x"] = -3,
						["spacing"] = -4,
						["height"] = 0.4,
						["y"] = 6,
						["size"] = 14,
					},
					["soulShards"] = {
						["anchorTo"] = "$parent",
						["order"] = 60,
						["showAlways"] = true,
						["growth"] = "LEFT",
						["anchorPoint"] = "BR",
						["x"] = -8,
						["spacing"] = -2,
						["height"] = 0.4,
						["y"] = 6,
						["size"] = 12,
					},
					["healthBar"] = {
						["colorType"] = "class",
						["reactionType"] = "npc",
						["background"] = true,
						["order"] = 10,
						["height"] = 1.2,
					},
					["text"] = {
						{
							["text"] = "[(()afk() )][name][( ()group())]",
						}, -- [1]
						nil, -- [2]
						{
							["text"] = "[perpp]",
						}, -- [3]
						nil, -- [4]
						{
							["text"] = "[(()afk() )][name][( ()group())]",
						}, -- [5]
						nil, -- [6]
						{
							["name"] = "计时器文字",
							["anchorTo"] = "$totemBar",
							["text"] = "[totem:timer]",
							["block"] = true,
							["width"] = 1,
						}, -- [7]
						{
							["name"] = "计时器文字",
							["anchorTo"] = "$runeBar",
							["text"] = "[rune:timer]",
							["block"] = true,
							["width"] = 1,
						}, -- [8]
						{
							["width"] = 1,
							["text"] = "[monk:abs:stagger]",
							["name"] = "文字",
							["anchorTo"] = "$staggerBar",
						}, -- [9]
					},
					["holyPower"] = {
						["anchorTo"] = "$parent",
						["order"] = 60,
						["showAlways"] = true,
						["growth"] = "LEFT",
						["anchorPoint"] = "BR",
						["x"] = -3,
						["spacing"] = -4,
						["height"] = 0.4,
						["y"] = 6,
						["size"] = 14,
					},
					["emptyBar"] = {
						["reactionType"] = "none",
						["background"] = true,
						["order"] = 0,
						["height"] = 1,
					},
					["druidBar"] = {
						["enabled"] = true,
						["background"] = true,
						["height"] = 0.4,
						["order"] = 70,
					},
					["width"] = 190,
					["runeBar"] = {
						["enabled"] = true,
						["background"] = false,
						["height"] = 0.4,
						["order"] = 70,
					},
					["powerBar"] = {
						["height"] = 1,
						["colorType"] = "type",
						["order"] = 20,
						["background"] = true,
					},
					["priestBar"] = {
						["height"] = 0.4,
						["background"] = true,
						["order"] = 70,
					},
					["combatText"] = {
						["height"] = 0.5,
					},
					["height"] = 45,
					["shamanBar"] = {
						["height"] = 0.4,
						["background"] = true,
						["order"] = 70,
					},
					["arcaneCharges"] = {
						["anchorTo"] = "$parent",
						["order"] = 60,
						["showAlways"] = true,
						["growth"] = "LEFT",
						["anchorPoint"] = "BR",
						["x"] = -8,
						["spacing"] = -2,
						["height"] = 0.4,
						["y"] = 6,
						["size"] = 12,
					},
					["auraPoints"] = {
						["anchorTo"] = "$parent",
						["order"] = 60,
						["showAlways"] = true,
						["growth"] = "LEFT",
						["anchorPoint"] = "BR",
						["x"] = -3,
						["spacing"] = -4,
						["height"] = 0.4,
						["y"] = 8,
						["size"] = 14,
					},
				},
				["mainassist"] = {
					["portrait"] = {
						["type"] = "3D",
						["alignment"] = "LEFT",
						["fullAfter"] = 50,
						["height"] = 0.5,
						["fullBefore"] = 0,
						["order"] = 15,
						["width"] = 0.22,
					},
					["auras"] = {
						["buffs"] = {
							["anchorPoint"] = "BL",
							["x"] = 0,
							["y"] = 0,
							["size"] = 16,
						},
						["debuffs"] = {
							["anchorPoint"] = "BL",
							["x"] = 0,
							["y"] = 0,
							["size"] = 16,
						},
					},
					["castBar"] = {
						["time"] = {
							["enabled"] = true,
							["x"] = -1,
							["anchorTo"] = "$parent",
							["y"] = 0,
							["anchorPoint"] = "CRI",
							["size"] = 0,
						},
						["order"] = 60,
						["height"] = 0.6,
						["background"] = true,
						["icon"] = "HIDE",
						["name"] = {
							["y"] = 0,
							["x"] = 1,
							["anchorTo"] = "$parent",
							["rank"] = true,
							["anchorPoint"] = "CLI",
							["enabled"] = true,
							["size"] = 0,
						},
					},
					["incAbsorb"] = {
						["cap"] = 1,
					},
					["powerBar"] = {
						["order"] = 20,
						["colorType"] = "type",
						["height"] = 1,
						["background"] = true,
					},
					["offset"] = 5,
					["healthBar"] = {
						["colorType"] = "class",
						["order"] = 10,
						["background"] = true,
						["reactionType"] = "npc",
						["height"] = 1.2,
					},
					["indicators"] = {
						["raidTarget"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "C",
							["size"] = 20,
						},
						["resurrect"] = {
							["y"] = -1,
							["x"] = 37,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "LC",
							["size"] = 28,
						},
						["masterLoot"] = {
							["y"] = -10,
							["x"] = 16,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "TL",
							["size"] = 12,
						},
						["leader"] = {
							["y"] = -12,
							["x"] = 2,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "TL",
							["size"] = 14,
						},
						["role"] = {
							["y"] = -11,
							["x"] = 30,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "TL",
							["size"] = 14,
						},
						["status"] = {
							["y"] = -2,
							["x"] = 12,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "LB",
							["size"] = 16,
						},
						["pvp"] = {
							["y"] = -21,
							["x"] = 11,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "TR",
							["size"] = 22,
						},
						["class"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "BL",
							["size"] = 16,
						},
						["ready"] = {
							["y"] = 0,
							["x"] = 35,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "LC",
							["size"] = 24,
						},
					},
					["attribAnchorPoint"] = "LEFT",
					["unitsPerColumn"] = 5,
					["columnSpacing"] = 5,
					["width"] = 150,
					["maxColumns"] = 1,
					["height"] = 40,
					["altPowerBar"] = {
						["height"] = 0.4,
						["background"] = true,
						["order"] = 100,
					},
					["emptyBar"] = {
						["reactionType"] = "none",
						["background"] = true,
						["order"] = 0,
						["height"] = 1,
					},
					["incHeal"] = {
						["cap"] = 1,
					},
					["healAbsorb"] = {
						["cap"] = 1,
					},
					["text"] = {
						{
							["text"] = "[(()afk() )][name]",
						}, -- [1]
						[3] = {
							["text"] = "[level( )][perpp]",
						},
						[5] = {
							["text"] = "[(()afk() )][name]",
						},
					},
					["highlight"] = {
						["size"] = 10,
					},
				},
				["pettarget"] = {
					["healthBar"] = {
						["colorType"] = "class",
						["order"] = 10,
						["background"] = true,
						["reactionType"] = "npc",
						["height"] = 1.2,
					},
					["text"] = {
						[3] = {
							["text"] = "[perpp]",
						},
						[5] = {
							["text"] = "[name]",
						},
					},
					["portrait"] = {
						["type"] = "3D",
						["alignment"] = "LEFT",
						["fullAfter"] = 100,
						["height"] = 0.5,
						["fullBefore"] = 0,
						["order"] = 15,
						["width"] = 0.22,
					},
					["width"] = 190,
					["castBar"] = {
						["time"] = {
							["enabled"] = true,
							["x"] = -1,
							["anchorTo"] = "$parent",
							["y"] = 0,
							["anchorPoint"] = "CRI",
							["size"] = 0,
						},
						["order"] = 40,
						["height"] = 0.6,
						["background"] = true,
						["icon"] = "HIDE",
						["name"] = {
							["y"] = 0,
							["x"] = 1,
							["anchorTo"] = "$parent",
							["rank"] = true,
							["anchorPoint"] = "CLI",
							["enabled"] = true,
							["size"] = 0,
						},
					},
					["auras"] = {
						["buffs"] = {
							["anchorPoint"] = "BL",
							["x"] = 0,
							["y"] = 0,
							["size"] = 16,
						},
						["debuffs"] = {
							["anchorPoint"] = "BL",
							["x"] = 0,
							["y"] = 0,
							["size"] = 16,
						},
					},
					["altPowerBar"] = {
						["height"] = 0.4,
						["background"] = true,
						["order"] = 100,
					},
					["emptyBar"] = {
						["reactionType"] = "none",
						["background"] = true,
						["order"] = 0,
						["height"] = 1,
					},
					["height"] = 30,
					["highlight"] = {
						["size"] = 10,
					},
					["powerBar"] = {
						["order"] = 20,
						["colorType"] = "type",
						["height"] = 0.7,
						["background"] = true,
					},
					["indicators"] = {
						["raidTarget"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "C",
							["size"] = 20,
						},
					},
				},
				["battlegroundpet"] = {
					["portrait"] = {
						["type"] = "3D",
						["alignment"] = "LEFT",
						["fullAfter"] = 100,
						["height"] = 0.5,
						["fullBefore"] = 0,
						["order"] = 15,
						["width"] = 0.22,
					},
					["text"] = {
						nil, -- [1]
						{
							["text"] = "[curhp]",
						}, -- [2]
						{
							["text"] = "",
						}, -- [3]
						{
							["text"] = "",
						}, -- [4]
						{
							["text"] = "[name]",
						}, -- [5]
					},
					["emptyBar"] = {
						["reactionType"] = "none",
						["background"] = true,
						["order"] = 0,
						["height"] = 1,
					},
					["auras"] = {
						["buffs"] = {
							["anchorPoint"] = "BL",
							["x"] = 0,
							["y"] = 0,
							["size"] = 16,
						},
						["debuffs"] = {
							["anchorPoint"] = "BL",
							["x"] = 0,
							["y"] = 0,
							["size"] = 16,
						},
					},
					["castBar"] = {
						["time"] = {
							["enabled"] = true,
							["x"] = -1,
							["anchorTo"] = "$parent",
							["y"] = 0,
							["anchorPoint"] = "CRI",
							["size"] = 0,
						},
						["order"] = 40,
						["height"] = 0.6,
						["background"] = true,
						["icon"] = "HIDE",
						["name"] = {
							["y"] = 0,
							["x"] = 1,
							["anchorTo"] = "$parent",
							["rank"] = true,
							["anchorPoint"] = "CLI",
							["enabled"] = true,
							["size"] = 0,
						},
					},
					["highlight"] = {
						["size"] = 10,
					},
					["altPowerBar"] = {
						["height"] = 0.4,
						["background"] = true,
						["order"] = 100,
					},
					["indicators"] = {
						["raidTarget"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "C",
							["size"] = 20,
						},
					},
					["height"] = 25,
					["width"] = 90,
					["powerBar"] = {
						["order"] = 20,
						["colorType"] = "type",
						["height"] = 0.6,
						["background"] = true,
					},
					["healthBar"] = {
						["colorType"] = "class",
						["order"] = 10,
						["background"] = true,
						["reactionType"] = "npc",
						["height"] = 1.2,
					},
				},
				["arena"] = {
					["highlight"] = {
						["height"] = 0.5,
						["size"] = 10,
					},
					["range"] = {
						["height"] = 0.5,
					},
					["auras"] = {
						["height"] = 0.5,
						["debuffs"] = {
							["enabled"] = true,
							["x"] = 0,
							["anchorPoint"] = "BL",
							["y"] = 0,
							["perRow"] = 9,
							["size"] = 16,
						},
						["buffs"] = {
							["enabled"] = true,
							["x"] = 0,
							["y"] = 0,
							["anchorPoint"] = "BL",
							["perRow"] = 9,
							["size"] = 16,
						},
					},
					["castBar"] = {
						["time"] = {
							["enabled"] = true,
							["x"] = -1,
							["anchorTo"] = "$parent",
							["y"] = 0,
							["anchorPoint"] = "CRI",
							["size"] = 0,
						},
						["order"] = 60,
						["height"] = 0.6,
						["background"] = true,
						["icon"] = "HIDE",
						["name"] = {
							["y"] = 0,
							["x"] = 1,
							["anchorTo"] = "$parent",
							["rank"] = true,
							["anchorPoint"] = "CLI",
							["enabled"] = true,
							["size"] = 0,
						},
					},
					["auraIndicators"] = {
						["height"] = 0.5,
					},
					["powerBar"] = {
						["order"] = 20,
						["colorType"] = "type",
						["height"] = 1,
						["background"] = true,
					},
					["offset"] = 25,
					["healthBar"] = {
						["colorType"] = "class",
						["order"] = 10,
						["background"] = true,
						["reactionType"] = "npc",
						["height"] = 1.2,
					},
					["text"] = {
						[3] = {
							["text"] = "[perpp]",
						},
						[5] = {
							["text"] = "[name]",
						},
					},
					["width"] = 170,
					["emptyBar"] = {
						["reactionType"] = "none",
						["background"] = true,
						["order"] = 0,
						["height"] = 1,
					},
					["altPowerBar"] = {
						["height"] = 0.4,
						["background"] = true,
						["order"] = 100,
					},
					["combatText"] = {
						["height"] = 0.5,
					},
					["height"] = 45,
					["indicators"] = {
						["arenaSpec"] = {
							["anchorPoint"] = "LC",
							["size"] = 28,
							["anchorTo"] = "$parent",
						},
						["lfdRole"] = {
							["y"] = 14,
							["x"] = 3,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "BR",
							["size"] = 14,
						},
						["height"] = 0.5,
						["class"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "BL",
							["size"] = 16,
						},
						["raidTarget"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "C",
							["size"] = 20,
						},
					},
					["enabled"] = true,
					["portrait"] = {
						["enabled"] = true,
						["type"] = "class",
						["alignment"] = "LEFT",
						["fullAfter"] = 50,
						["height"] = 0.5,
						["fullBefore"] = 0,
						["order"] = 15,
						["width"] = 0.22,
					},
				},
				["partytargettarget"] = {
					["healthBar"] = {
						["colorType"] = "class",
						["order"] = 10,
						["background"] = true,
						["reactionType"] = "npc",
						["height"] = 1.2,
					},
					["text"] = {
						nil, -- [1]
						{
							["text"] = "[curhp]",
						}, -- [2]
						{
							["text"] = "",
						}, -- [3]
						{
							["text"] = "",
						}, -- [4]
						{
							["text"] = "[name]",
						}, -- [5]
					},
					["portrait"] = {
						["type"] = "3D",
						["alignment"] = "LEFT",
						["fullAfter"] = 100,
						["height"] = 0.5,
						["fullBefore"] = 0,
						["order"] = 15,
						["width"] = 0.22,
					},
					["width"] = 90,
					["castBar"] = {
						["time"] = {
							["enabled"] = true,
							["x"] = -1,
							["anchorTo"] = "$parent",
							["y"] = 0,
							["anchorPoint"] = "CRI",
							["size"] = 0,
						},
						["order"] = 40,
						["height"] = 0.6,
						["background"] = true,
						["icon"] = "HIDE",
						["name"] = {
							["y"] = 0,
							["x"] = 1,
							["anchorTo"] = "$parent",
							["rank"] = true,
							["anchorPoint"] = "CLI",
							["enabled"] = true,
							["size"] = 0,
						},
					},
					["auras"] = {
						["buffs"] = {
							["anchorPoint"] = "BL",
							["x"] = 0,
							["y"] = 0,
							["size"] = 16,
						},
						["debuffs"] = {
							["anchorPoint"] = "BL",
							["x"] = 0,
							["y"] = 0,
							["size"] = 16,
						},
					},
					["altPowerBar"] = {
						["height"] = 0.4,
						["background"] = true,
						["order"] = 100,
					},
					["emptyBar"] = {
						["reactionType"] = "none",
						["background"] = true,
						["order"] = 0,
						["height"] = 1,
					},
					["height"] = 25,
					["highlight"] = {
						["size"] = 10,
					},
					["powerBar"] = {
						["order"] = 20,
						["colorType"] = "type",
						["height"] = 0.6,
						["background"] = true,
					},
					["indicators"] = {
						["raidTarget"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "C",
							["size"] = 20,
						},
						["class"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "BL",
							["size"] = 16,
						},
					},
				},
				["battleground"] = {
					["enabled"] = true,
					["portrait"] = {
						["type"] = "class",
						["alignment"] = "LEFT",
						["fullAfter"] = 50,
						["height"] = 0.5,
						["fullBefore"] = 0,
						["order"] = 15,
						["width"] = 0.22,
					},
					["indicators"] = {
						["raidTarget"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "C",
							["size"] = 20,
						},
						["class"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "BL",
							["size"] = 16,
						},
						["height"] = 0.5,
						["pvp"] = {
							["anchorPoint"] = "BL",
							["x"] = 0,
							["anchorTo"] = "$parent",
							["y"] = 11,
							["size"] = 22,
						},
					},
					["highlight"] = {
						["height"] = 0.5,
						["size"] = 10,
					},
					["text"] = {
						nil, -- [1]
						nil, -- [2]
						{
							["text"] = "",
						}, -- [3]
						{
							["text"] = "",
						}, -- [4]
						{
							["text"] = "[name]",
						}, -- [5]
					},
					["emptyBar"] = {
						["reactionType"] = "none",
						["background"] = true,
						["order"] = 0,
						["height"] = 1,
					},
					["range"] = {
						["height"] = 0.5,
					},
					["auras"] = {
						["height"] = 0.5,
						["debuffs"] = {
							["anchorPoint"] = "BL",
							["x"] = 0,
							["perRow"] = 9,
							["y"] = 0,
							["size"] = 16,
						},
						["buffs"] = {
							["perRow"] = 9,
							["x"] = 0,
							["y"] = 0,
							["anchorPoint"] = "BL",
							["size"] = 16,
						},
					},
					["castBar"] = {
						["time"] = {
							["enabled"] = true,
							["x"] = -1,
							["anchorTo"] = "$parent",
							["y"] = 0,
							["anchorPoint"] = "CRI",
							["size"] = 0,
						},
						["order"] = 60,
						["height"] = 0.6,
						["background"] = true,
						["icon"] = "HIDE",
						["name"] = {
							["y"] = 0,
							["x"] = 1,
							["anchorTo"] = "$parent",
							["rank"] = true,
							["anchorPoint"] = "CLI",
							["enabled"] = true,
							["size"] = 0,
						},
					},
					["width"] = 140,
					["altPowerBar"] = {
						["height"] = 0.4,
						["background"] = true,
						["order"] = 100,
					},
					["combatText"] = {
						["height"] = 0.5,
					},
					["height"] = 35,
					["auraIndicators"] = {
						["height"] = 0.5,
					},
					["powerBar"] = {
						["order"] = 20,
						["colorType"] = "type",
						["height"] = 0.5,
						["background"] = true,
					},
					["healthBar"] = {
						["colorType"] = "class",
						["order"] = 10,
						["background"] = true,
						["reactionType"] = "npc",
						["height"] = 1.2,
					},
				},
			},
			["loadedLayout"] = true,
			["backdrop"] = {
				["borderTexture"] = "None",
				["edgeSize"] = 5,
				["tileSize"] = 1,
				["borderColor"] = {
					["a"] = 1,
					["b"] = 0.5,
					["g"] = 0.3,
					["r"] = 0.3,
				},
				["backgroundColor"] = {
					["a"] = 0.8,
					["b"] = 0,
					["g"] = 0,
					["r"] = 0,
				},
				["backgroundTexture"] = "Chat Frame",
				["inset"] = 3,
				["clip"] = 1,
			},
			["auras"] = {
				["borderType"] = "light",
			},
			["healthColors"] = {
				["neutral"] = {
					["b"] = 0,
					["g"] = 0.93,
					["r"] = 0.93,
				},
				["offline"] = {
					["b"] = 0.5,
					["g"] = 0.5,
					["r"] = 0.5,
				},
				["aggro"] = {
					["b"] = 0,
					["g"] = 0,
					["r"] = 0.9,
				},
				["static"] = {
					["b"] = 0.9,
					["g"] = 0.2,
					["r"] = 0.7,
				},
				["friendly"] = {
					["b"] = 0.2,
					["g"] = 0.9,
					["r"] = 0.2,
				},
				["healAbsorb"] = {
					["b"] = 1,
					["g"] = 0.47,
					["r"] = 0.68,
				},
				["enemyUnattack"] = {
					["b"] = 0.2,
					["g"] = 0.2,
					["r"] = 0.6,
				},
				["tapped"] = {
					["b"] = 0.5,
					["g"] = 0.5,
					["r"] = 0.5,
				},
				["hostile"] = {
					["b"] = 0,
					["g"] = 0,
					["r"] = 0.9,
				},
				["green"] = {
					["b"] = 0.2,
					["g"] = 0.9,
					["r"] = 0.2,
				},
				["incAbsorb"] = {
					["b"] = 0.09,
					["g"] = 0.75,
					["r"] = 0.93,
				},
				["yellow"] = {
					["b"] = 0,
					["g"] = 0.93,
					["r"] = 0.93,
				},
				["inc"] = {
					["b"] = 0.23,
					["g"] = 0.35,
					["r"] = 0,
				},
				["red"] = {
					["b"] = 0,
					["g"] = 0,
					["r"] = 0.9,
				},
			},
			["xpColors"] = {
				["normal"] = {
					["b"] = 0.55,
					["g"] = 0,
					["r"] = 0.58,
				},
				["rested"] = {
					["b"] = 0.88,
					["g"] = 0.39,
					["r"] = 0,
				},
			},
			["font"] = {
				["shadowColor"] = {
					["a"] = 1,
					["b"] = 0,
					["g"] = 0,
					["r"] = 0,
				},
				["name"] = "默认",
				["extra"] = "",
				["shadowX"] = 0.8,
				["shadowY"] = -0.8,
				["color"] = {
					["a"] = 1,
					["b"] = 1,
					["g"] = 1,
					["r"] = 1,
				},
				["size"] = 11,
			},
			["classColors"] = {
				["HUNTER"] = {
					["b"] = 0.45,
					["g"] = 0.83,
					["r"] = 0.67,
				},
				["WARRIOR"] = {
					["b"] = 0.43,
					["g"] = 0.61,
					["r"] = 0.78,
				},
				["PALADIN"] = {
					["b"] = 0.73,
					["g"] = 0.55,
					["r"] = 0.96,
				},
				["MAGE"] = {
					["b"] = 0.94,
					["g"] = 0.8,
					["r"] = 0.41,
				},
				["VEHICLE"] = {
					["b"] = 0.23,
					["g"] = 0.41,
					["r"] = 0.23,
				},
				["PRIEST"] = {
					["b"] = 1,
					["g"] = 1,
					["r"] = 1,
				},
				["DEATHKNIGHT"] = {
					["b"] = 0.23,
					["g"] = 0.12,
					["r"] = 0.77,
				},
				["SHAMAN"] = {
					["b"] = 1,
					["g"] = 0.35,
					["r"] = 0.14,
				},
				["WARLOCK"] = {
					["b"] = 0.79,
					["g"] = 0.51,
					["r"] = 0.58,
				},
				["DEMONHUNTER"] = {
					["b"] = 0.79,
					["g"] = 0.19,
					["r"] = 0.64,
				},
				["PET"] = {
					["b"] = 0.2,
					["g"] = 0.9,
					["r"] = 0.2,
				},
				["DRUID"] = {
					["b"] = 0.04,
					["g"] = 0.49,
					["r"] = 1,
				},
				["MONK"] = {
					["b"] = 0.59,
					["g"] = 1,
					["r"] = 0,
				},
				["ROGUE"] = {
					["b"] = 0.41,
					["g"] = 0.96,
					["r"] = 1,
				},
			},
			["locked"] = true,
			["bars"] = {
				["spacing"] = -1.25,
				["backgroundAlpha"] = 0.2,
				["alpha"] = 1,
				["texture"] = "Minimalist",
			},
			["positions"] = {
				["arenatarget"] = {
					["anchorPoint"] = "RT",
					["anchorTo"] = "$parent",
				},
				["mainassisttarget"] = {
					["anchorPoint"] = "RT",
					["anchorTo"] = "$parent",
				},
				["targettargettarget"] = {
					["anchorPoint"] = "RC",
					["anchorTo"] = "#SUFUnittargettarget",
				},
				["arenatargettarget"] = {
					["anchorPoint"] = "RT",
					["anchorTo"] = "$parent",
				},
				["arenapet"] = {
					["anchorPoint"] = "RB",
					["anchorTo"] = "$parent",
				},
				["mainassisttargettarget"] = {
					["anchorPoint"] = "RT",
					["x"] = 150,
					["anchorTo"] = "$parent",
				},
				["party"] = {
					["y"] = -60,
					["point"] = "TOPLEFT",
					["anchorTo"] = "#SUFUnitplayer",
					["movedAnchor"] = "TL",
					["relativePoint"] = "TOPLEFT",
				},
				["maintanktarget"] = {
					["anchorPoint"] = "RT",
					["anchorTo"] = "$parent",
				},
				["focus"] = {
					["anchorPoint"] = "RB",
					["x"] = 35,
					["y"] = -4,
					["anchorTo"] = "#SUFUnittarget",
				},
				["target"] = {
					["anchorPoint"] = "RC",
					["x"] = 50,
					["anchorTo"] = "#SUFUnitplayer",
				},
				["raid"] = {
					["anchorPoint"] = "C",
				},
				["partytargettarget"] = {
					["anchorPoint"] = "RT",
					["anchorTo"] = "$parent",
				},
				["battlegroundtarget"] = {
					["anchorPoint"] = "RT",
					["anchorTo"] = "$parent",
				},
				["arena"] = {
					["anchorPoint"] = "C",
				},
				["battlegroundtargettarget"] = {
					["anchorPoint"] = "RT",
					["anchorTo"] = "$parent",
				},
				["bosstargettarget"] = {
					["anchorPoint"] = "RB",
					["anchorTo"] = "$parent",
				},
				["focustarget"] = {
					["anchorPoint"] = "TL",
					["anchorTo"] = "#SUFUnitfocus",
				},
				["bosstarget"] = {
					["anchorPoint"] = "RB",
					["anchorTo"] = "$parent",
				},
				["battlegroundpet"] = {
					["anchorPoint"] = "RB",
					["anchorTo"] = "$parent",
				},
				["pettarget"] = {
					["anchorPoint"] = "C",
				},
				["targettarget"] = {
					["anchorPoint"] = "TL",
					["anchorTo"] = "#SUFUnittarget",
				},
				["mainassist"] = {
					["anchorPoint"] = "C",
				},
				["player"] = {
					["y"] = -25,
					["x"] = 20,
					["point"] = "TOPLEFT",
					["relativePoint"] = "TOPLEFT",
				},
				["maintanktargettarget"] = {
					["anchorPoint"] = "RT",
					["x"] = 150,
					["anchorTo"] = "$parent",
				},
				["pet"] = {
					["anchorPoint"] = "TL",
					["anchorTo"] = "#SUFUnitplayer",
				},
				["raidpet"] = {
					["anchorPoint"] = "C",
				},
				["maintank"] = {
					["anchorPoint"] = "C",
				},
				["boss"] = {
					["anchorPoint"] = "C",
				},
				["battleground"] = {
					["anchorPoint"] = "C",
				},
			},
			["auraColors"] = {
				["removable"] = {
					["b"] = 1,
					["g"] = 1,
					["r"] = 1,
				},
			},
		},
		["R2"] = {
			["powerColors"] = {
				["FUEL"] = {
					["b"] = 0.36,
					["g"] = 0.47,
					["r"] = 0.85,
				},
				["ALTERNATE"] = {
					["b"] = 1,
					["g"] = 0.941,
					["r"] = 0.815,
				},
				["FOCUS"] = {
					["b"] = 0.25,
					["g"] = 0.5,
					["r"] = 1,
				},
				["RUNEOFPOWER"] = {
					["b"] = 0.6,
					["g"] = 0.45,
					["r"] = 0.35,
				},
				["STAGGER_RED"] = {
					["b"] = 0.42,
					["g"] = 0.42,
					["r"] = 1,
				},
				["ARCANECHARGES"] = {
					["b"] = 0.98,
					["g"] = 0.1,
					["r"] = 0.1,
				},
				["COMBOPOINTS"] = {
					["b"] = 0,
					["g"] = 0.8,
					["r"] = 1,
				},
				["RUNES"] = {
					["b"] = 0.5,
					["g"] = 0.5,
					["r"] = 0.5,
				},
				["STAGGER_GREEN"] = {
					["b"] = 0.52,
					["g"] = 1,
					["r"] = 0.52,
				},
				["ENERGY"] = {
					["b"] = 0.1,
					["g"] = 0.85,
					["r"] = 1,
				},
				["MANA"] = {
					["b"] = 0.85,
					["g"] = 0.5,
					["r"] = 0.3,
				},
				["CHI"] = {
					["b"] = 0.92,
					["g"] = 1,
					["r"] = 0.71,
				},
				["AURAPOINTS"] = {
					["b"] = 0,
					["g"] = 0.8,
					["r"] = 1,
				},
				["MUSHROOMS"] = {
					["b"] = 0.2,
					["g"] = 0.9,
					["r"] = 0.2,
				},
				["MAELSTROM"] = {
					["b"] = 1,
					["g"] = 0.5,
					["r"] = 0,
				},
				["INSANITY"] = {
					["b"] = 0.8,
					["g"] = 0,
					["r"] = 0.4,
				},
				["SOULSHARDS"] = {
					["b"] = 0.79,
					["g"] = 0.51,
					["r"] = 0.58,
				},
				["FURY"] = {
					["b"] = 0.992,
					["g"] = 0.259,
					["r"] = 0.788,
				},
				["AMMOSLOT"] = {
					["b"] = 0.55,
					["g"] = 0.6,
					["r"] = 0.85,
				},
				["RUNIC_POWER"] = {
					["r"] = 0.35,
					["g"] = 0.45,
					["b"] = 0.6,
				},
				["LUNAR_POWER"] = {
					["b"] = 0.9,
					["g"] = 0.52,
					["r"] = 0.3,
				},
				["STATUE"] = {
					["b"] = 0.6,
					["g"] = 0.45,
					["r"] = 0.35,
				},
				["PAIN"] = {
					["b"] = 0,
					["g"] = 0,
					["r"] = 1,
				},
				["HOLYPOWER"] = {
					["b"] = 0.6,
					["g"] = 0.9,
					["r"] = 0.95,
				},
				["STAGGER_YELLOW"] = {
					["b"] = 0.72,
					["g"] = 0.98,
					["r"] = 1,
				},
				["RAGE"] = {
					["b"] = 0.3,
					["g"] = 0.2,
					["r"] = 0.9,
				},
			},
			["auras"] = {
				["borderType"] = "dark",
			},
			["healthColors"] = {
				["neutral"] = {
					["b"] = 0,
					["g"] = 0.93,
					["r"] = 0.93,
				},
				["offline"] = {
					["b"] = 0.5,
					["g"] = 0.5,
					["r"] = 0.5,
				},
				["aggro"] = {
					["b"] = 0,
					["g"] = 0,
					["r"] = 0.9,
				},
				["static"] = {
					["b"] = 0.9,
					["g"] = 0.2,
					["r"] = 0.7,
				},
				["friendly"] = {
					["b"] = 0.2,
					["g"] = 0.9,
					["r"] = 0.2,
				},
				["healAbsorb"] = {
					["b"] = 1,
					["g"] = 0.47,
					["r"] = 0.68,
				},
				["enemyUnattack"] = {
					["b"] = 0.2,
					["g"] = 0.2,
					["r"] = 0.6,
				},
				["tapped"] = {
					["b"] = 0.5,
					["g"] = 0.5,
					["r"] = 0.5,
				},
				["hostile"] = {
					["b"] = 0,
					["g"] = 0,
					["r"] = 0.9,
				},
				["green"] = {
					["b"] = 0.2,
					["g"] = 0.9,
					["r"] = 0.2,
				},
				["incAbsorb"] = {
					["b"] = 0.09,
					["g"] = 0.75,
					["r"] = 0.93,
				},
				["yellow"] = {
					["b"] = 0,
					["g"] = 0.93,
					["r"] = 0.93,
				},
				["inc"] = {
					["b"] = 0.23,
					["g"] = 0.35,
					["r"] = 0,
				},
				["red"] = {
					["b"] = 0,
					["g"] = 0,
					["r"] = 0.9,
				},
			},
			["xpColors"] = {
				["normal"] = {
					["b"] = 0.55,
					["g"] = 0,
					["r"] = 0.58,
				},
				["rested"] = {
					["b"] = 0.88,
					["g"] = 0.39,
					["r"] = 0,
				},
			},
			["locked"] = true,
			["positions"] = {
				["arenatarget"] = {
					["anchorPoint"] = "RT",
					["anchorTo"] = "$parent",
				},
				["mainassisttarget"] = {
					["anchorPoint"] = "RT",
					["anchorTo"] = "$parent",
				},
				["targettargettarget"] = {
					["anchorPoint"] = "RC",
					["anchorTo"] = "#SUFUnittargettarget",
				},
				["arenatargettarget"] = {
					["anchorPoint"] = "RT",
					["anchorTo"] = "$parent",
				},
				["pettarget"] = {
					["anchorPoint"] = "C",
				},
				["arenapet"] = {
					["anchorPoint"] = "RB",
					["anchorTo"] = "$parent",
				},
				["mainassisttargettarget"] = {
					["anchorPoint"] = "RT",
					["x"] = 150,
					["anchorTo"] = "$parent",
				},
				["party"] = {
					["y"] = -60,
					["point"] = "TOPLEFT",
					["anchorTo"] = "#SUFUnitplayer",
					["movedAnchor"] = "TL",
					["relativePoint"] = "TOPLEFT",
				},
				["maintanktarget"] = {
					["anchorPoint"] = "RT",
					["anchorTo"] = "$parent",
				},
				["focus"] = {
					["anchorPoint"] = "RB",
					["x"] = 10,
					["anchorTo"] = "#SUFUnittarget",
					["y"] = 10,
				},
				["target"] = {
					["y"] = 133.120003223419,
					["x"] = 204.800004959106,
					["point"] = "BOTTOM",
					["relativePoint"] = "BOTTOM",
				},
				["raid"] = {
					["anchorPoint"] = "C",
				},
				["partytargettarget"] = {
					["anchorPoint"] = "RT",
					["anchorTo"] = "$parent",
				},
				["battlegroundtarget"] = {
					["anchorPoint"] = "RT",
					["anchorTo"] = "$parent",
				},
				["arena"] = {
					["anchorPoint"] = "C",
				},
				["battlegroundtargettarget"] = {
					["anchorPoint"] = "RT",
					["anchorTo"] = "$parent",
				},
				["bosstargettarget"] = {
					["anchorPoint"] = "RB",
					["anchorTo"] = "$parent",
				},
				["focustarget"] = {
					["anchorPoint"] = "TL",
					["anchorTo"] = "#SUFUnitfocus",
				},
				["bosstarget"] = {
					["anchorPoint"] = "RB",
					["anchorTo"] = "$parent",
				},
				["battlegroundpet"] = {
					["anchorPoint"] = "RB",
					["anchorTo"] = "$parent",
				},
				["pet"] = {
					["anchorPoint"] = "TL",
					["anchorTo"] = "#SUFUnitplayer",
				},
				["mainassist"] = {
					["anchorPoint"] = "C",
				},
				["player"] = {
					["y"] = 133.120003223419,
					["x"] = -204.800004959106,
					["point"] = "BOTTOM",
					["relativePoint"] = "BOTTOM",
				},
				["maintanktargettarget"] = {
					["anchorPoint"] = "RT",
					["x"] = 150,
					["anchorTo"] = "$parent",
				},
				["targettarget"] = {
					["anchorPoint"] = "TL",
					["anchorTo"] = "#SUFUnittarget",
				},
				["raidpet"] = {
					["anchorPoint"] = "C",
				},
				["maintank"] = {
					["anchorPoint"] = "C",
				},
				["boss"] = {
					["y"] = 550.000016391277,
					["x"] = 1000.00002980232,
					["point"] = "TOPLEFT",
					["bottom"] = 359.999970038731,
					["relativePoint"] = "BOTTOMLEFT",
					["top"] = 546.666642268498,
				},
				["battleground"] = {
					["anchorPoint"] = "C",
				},
			},
			["revision"] = 59,
			["castColors"] = {
				["cast"] = {
					["b"] = 0.3,
					["g"] = 0.7,
					["r"] = 1,
				},
				["finished"] = {
					["b"] = 0.1,
					["g"] = 1,
					["r"] = 0.1,
				},
				["channel"] = {
					["b"] = 1,
					["g"] = 0.25,
					["r"] = 0.25,
				},
				["uninterruptible"] = {
					["b"] = 1,
					["g"] = 0,
					["r"] = 0.71,
				},
				["interrupted"] = {
					["b"] = 0,
					["g"] = 0,
					["r"] = 1,
				},
			},
			["hidden"] = {
				["buffs"] = true,
			},
			["loadedLayout"] = true,
			["backdrop"] = {
				["borderTexture"] = "None",
				["edgeSize"] = 5,
				["tileSize"] = 1,
				["borderColor"] = {
					["a"] = 1,
					["b"] = 0.5,
					["g"] = 0.3,
					["r"] = 0.3,
				},
				["backgroundColor"] = {
					["a"] = 0.8,
					["b"] = 0,
					["g"] = 0,
					["r"] = 0,
				},
				["backgroundTexture"] = "None",
				["inset"] = 3,
				["clip"] = 1,
			},
			["units"] = {
				["arenatarget"] = {
					["text"] = {
						nil, -- [1]
						{
							["text"] = "[curhp]",
						}, -- [2]
						{
							["text"] = "",
						}, -- [3]
						{
							["text"] = "",
						}, -- [4]
						{
							["text"] = "[name]",
						}, -- [5]
					},
					["portrait"] = {
						["type"] = "3D",
						["alignment"] = "LEFT",
						["fullAfter"] = 100,
						["height"] = 0.5,
						["fullBefore"] = 0,
						["order"] = 15,
						["width"] = 0.22,
					},
					["healthBar"] = {
						["colorType"] = "class",
						["order"] = 10,
						["background"] = true,
						["reactionType"] = "npc",
						["height"] = 1.2,
					},
					["emptyBar"] = {
						["order"] = 0,
						["background"] = true,
						["height"] = 1,
						["reactionType"] = "none",
					},
					["auras"] = {
						["buffs"] = {
							["anchorPoint"] = "BL",
							["y"] = 0,
							["x"] = 0,
							["size"] = 16,
						},
						["debuffs"] = {
							["anchorPoint"] = "BL",
							["y"] = 0,
							["x"] = 0,
							["size"] = 16,
						},
					},
					["castBar"] = {
						["time"] = {
							["enabled"] = true,
							["x"] = -1,
							["anchorTo"] = "$parent",
							["y"] = 0,
							["anchorPoint"] = "CRI",
							["size"] = 0,
						},
						["order"] = 40,
						["height"] = 0.6,
						["background"] = true,
						["icon"] = "HIDE",
						["name"] = {
							["y"] = 0,
							["x"] = 1,
							["anchorTo"] = "$parent",
							["rank"] = true,
							["anchorPoint"] = "CLI",
							["enabled"] = true,
							["size"] = 0,
						},
					},
					["indicators"] = {
						["raidTarget"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "C",
							["size"] = 20,
						},
						["class"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "BL",
							["size"] = 16,
						},
					},
					["altPowerBar"] = {
						["height"] = 0.4,
						["background"] = true,
						["order"] = 100,
					},
					["width"] = 90,
					["height"] = 25,
					["powerBar"] = {
						["colorType"] = "type",
						["order"] = 20,
						["background"] = true,
						["height"] = 0.6,
					},
					["highlight"] = {
						["size"] = 10,
					},
				},
				["mainassisttarget"] = {
					["text"] = {
						{
							["text"] = "[(()afk() )][name]",
						}, -- [1]
						[3] = {
							["text"] = "[level( )][classification( )][perpp]",
						},
						[5] = {
							["text"] = "[(()afk() )][name]",
						},
					},
					["portrait"] = {
						["type"] = "3D",
						["alignment"] = "LEFT",
						["fullAfter"] = 100,
						["height"] = 0.5,
						["fullBefore"] = 0,
						["order"] = 15,
						["width"] = 0.22,
					},
					["healthBar"] = {
						["colorType"] = "class",
						["order"] = 10,
						["background"] = true,
						["reactionType"] = "npc",
						["height"] = 1.2,
					},
					["emptyBar"] = {
						["order"] = 0,
						["background"] = true,
						["height"] = 1,
						["reactionType"] = "none",
					},
					["auras"] = {
						["buffs"] = {
							["anchorPoint"] = "BL",
							["y"] = 0,
							["x"] = 0,
							["size"] = 16,
						},
						["debuffs"] = {
							["anchorPoint"] = "BL",
							["y"] = 0,
							["x"] = 0,
							["size"] = 16,
						},
					},
					["castBar"] = {
						["time"] = {
							["enabled"] = true,
							["x"] = -1,
							["anchorTo"] = "$parent",
							["y"] = 0,
							["anchorPoint"] = "CRI",
							["size"] = 0,
						},
						["order"] = 40,
						["height"] = 0.6,
						["background"] = true,
						["icon"] = "HIDE",
						["name"] = {
							["y"] = 0,
							["x"] = 1,
							["anchorTo"] = "$parent",
							["rank"] = true,
							["anchorPoint"] = "CLI",
							["enabled"] = true,
							["size"] = 0,
						},
					},
					["indicators"] = {
						["raidTarget"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "C",
							["size"] = 20,
						},
						["class"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "BL",
							["size"] = 16,
						},
					},
					["altPowerBar"] = {
						["height"] = 0.4,
						["background"] = true,
						["order"] = 100,
					},
					["width"] = 150,
					["height"] = 40,
					["powerBar"] = {
						["colorType"] = "type",
						["order"] = 20,
						["background"] = true,
						["height"] = 1,
					},
					["highlight"] = {
						["size"] = 10,
					},
				},
				["targettargettarget"] = {
					["enabled"] = false,
					["width"] = 80,
					["portrait"] = {
						["type"] = "3D",
						["alignment"] = "RIGHT",
						["fullAfter"] = 100,
						["height"] = 0.5,
						["fullBefore"] = 0,
						["order"] = 15,
						["width"] = 0.22,
					},
					["healthBar"] = {
						["colorType"] = "class",
						["order"] = 10,
						["background"] = true,
						["reactionType"] = "npc",
						["height"] = 1.2,
					},
					["emptyBar"] = {
						["order"] = 0,
						["background"] = true,
						["height"] = 1,
						["reactionType"] = "none",
					},
					["range"] = {
						["height"] = 0.5,
					},
					["auras"] = {
						["height"] = 0.5,
						["debuffs"] = {
							["anchorPoint"] = "BL",
							["y"] = 0,
							["x"] = 0,
							["size"] = 16,
						},
						["buffs"] = {
							["anchorPoint"] = "BL",
							["y"] = 0,
							["x"] = 0,
							["size"] = 16,
						},
					},
					["castBar"] = {
						["time"] = {
							["enabled"] = true,
							["x"] = -1,
							["anchorTo"] = "$parent",
							["y"] = 0,
							["anchorPoint"] = "CRI",
							["size"] = 0,
						},
						["order"] = 40,
						["height"] = 0.6,
						["background"] = true,
						["icon"] = "HIDE",
						["name"] = {
							["y"] = 0,
							["x"] = 1,
							["anchorTo"] = "$parent",
							["rank"] = true,
							["anchorPoint"] = "CLI",
							["enabled"] = true,
							["size"] = 0,
						},
					},
					["text"] = {
						{
							["width"] = 1,
						}, -- [1]
						{
							["text"] = "",
						}, -- [2]
						{
							["text"] = "",
						}, -- [3]
						{
							["text"] = "",
						}, -- [4]
					},
					["altPowerBar"] = {
						["height"] = 0.4,
						["background"] = true,
						["order"] = 100,
					},
					["indicators"] = {
						["raidTarget"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "C",
							["size"] = 20,
						},
						["class"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "BL",
							["size"] = 16,
						},
						["height"] = 0.5,
					},
					["height"] = 30,
					["auraIndicators"] = {
						["height"] = 0.5,
					},
					["powerBar"] = {
						["colorType"] = "type",
						["order"] = 20,
						["background"] = true,
						["height"] = 0.6,
					},
					["highlight"] = {
						["height"] = 0.5,
						["size"] = 10,
					},
				},
				["partytarget"] = {
					["highlight"] = {
						["size"] = 10,
					},
					["auras"] = {
						["buffs"] = {
							["anchorPoint"] = "BL",
							["y"] = 0,
							["x"] = 0,
							["size"] = 16,
						},
						["debuffs"] = {
							["anchorPoint"] = "BL",
							["y"] = 0,
							["x"] = 0,
							["size"] = 16,
						},
					},
					["castBar"] = {
						["time"] = {
							["enabled"] = true,
							["x"] = -1,
							["anchorTo"] = "$parent",
							["y"] = 0,
							["anchorPoint"] = "CRI",
							["size"] = 0,
						},
						["order"] = 40,
						["height"] = 0.6,
						["background"] = true,
						["icon"] = "HIDE",
						["name"] = {
							["y"] = 0,
							["x"] = 1,
							["anchorTo"] = "$parent",
							["rank"] = true,
							["anchorPoint"] = "CLI",
							["enabled"] = true,
							["size"] = 0,
						},
					},
					["powerBar"] = {
						["colorType"] = "type",
						["order"] = 20,
						["background"] = true,
						["height"] = 0.6,
					},
					["healthBar"] = {
						["colorType"] = "class",
						["order"] = 10,
						["background"] = true,
						["reactionType"] = "npc",
						["height"] = 1.2,
					},
					["text"] = {
						nil, -- [1]
						{
							["text"] = "[curhp]",
						}, -- [2]
						{
							["text"] = "",
						}, -- [3]
						{
							["text"] = "",
						}, -- [4]
						{
							["text"] = "[name]",
						}, -- [5]
					},
					["width"] = 90,
					["altPowerBar"] = {
						["height"] = 0.4,
						["background"] = true,
						["order"] = 100,
					},
					["height"] = 25,
					["indicators"] = {
						["raidTarget"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "C",
							["size"] = 20,
						},
						["class"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "BL",
							["size"] = 16,
						},
					},
					["portrait"] = {
						["type"] = "3D",
						["alignment"] = "LEFT",
						["fullAfter"] = 100,
						["height"] = 0.5,
						["fullBefore"] = 0,
						["order"] = 15,
						["width"] = 0.22,
					},
					["emptyBar"] = {
						["order"] = 0,
						["background"] = true,
						["height"] = 1,
						["reactionType"] = "none",
					},
				},
				["arenatargettarget"] = {
					["text"] = {
						nil, -- [1]
						{
							["text"] = "[curhp]",
						}, -- [2]
						{
							["text"] = "",
						}, -- [3]
						{
							["text"] = "",
						}, -- [4]
						{
							["text"] = "[name]",
						}, -- [5]
					},
					["portrait"] = {
						["type"] = "3D",
						["alignment"] = "LEFT",
						["fullAfter"] = 100,
						["height"] = 0.5,
						["fullBefore"] = 0,
						["order"] = 15,
						["width"] = 0.22,
					},
					["healthBar"] = {
						["colorType"] = "class",
						["order"] = 10,
						["background"] = true,
						["reactionType"] = "npc",
						["height"] = 1.2,
					},
					["emptyBar"] = {
						["order"] = 0,
						["background"] = true,
						["height"] = 1,
						["reactionType"] = "none",
					},
					["auras"] = {
						["buffs"] = {
							["anchorPoint"] = "BL",
							["y"] = 0,
							["x"] = 0,
							["size"] = 16,
						},
						["debuffs"] = {
							["anchorPoint"] = "BL",
							["y"] = 0,
							["x"] = 0,
							["size"] = 16,
						},
					},
					["castBar"] = {
						["time"] = {
							["enabled"] = true,
							["x"] = -1,
							["anchorTo"] = "$parent",
							["y"] = 0,
							["anchorPoint"] = "CRI",
							["size"] = 0,
						},
						["order"] = 40,
						["height"] = 0.6,
						["background"] = true,
						["icon"] = "HIDE",
						["name"] = {
							["y"] = 0,
							["x"] = 1,
							["anchorTo"] = "$parent",
							["rank"] = true,
							["anchorPoint"] = "CLI",
							["enabled"] = true,
							["size"] = 0,
						},
					},
					["indicators"] = {
						["raidTarget"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "C",
							["size"] = 20,
						},
						["class"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "BL",
							["size"] = 16,
						},
					},
					["altPowerBar"] = {
						["height"] = 0.4,
						["background"] = true,
						["order"] = 100,
					},
					["width"] = 90,
					["height"] = 25,
					["powerBar"] = {
						["colorType"] = "type",
						["order"] = 20,
						["background"] = true,
						["height"] = 0.6,
					},
					["highlight"] = {
						["size"] = 10,
					},
				},
				["raid"] = {
					["portrait"] = {
						["type"] = "3D",
						["alignment"] = "LEFT",
						["fullAfter"] = 100,
						["height"] = 0.5,
						["fullBefore"] = 0,
						["order"] = 15,
						["width"] = 0.22,
					},
					["auras"] = {
						["buffs"] = {
							["anchorPoint"] = "BL",
							["y"] = 0,
							["x"] = 0,
							["size"] = 16,
						},
						["debuffs"] = {
							["anchorPoint"] = "BL",
							["y"] = 0,
							["x"] = 0,
							["size"] = 16,
						},
					},
					["castBar"] = {
						["time"] = {
							["enabled"] = true,
							["x"] = -1,
							["anchorTo"] = "$parent",
							["y"] = 0,
							["anchorPoint"] = "CRI",
							["size"] = 0,
						},
						["order"] = 40,
						["height"] = 0.6,
						["background"] = true,
						["icon"] = "HIDE",
						["name"] = {
							["y"] = 0,
							["x"] = 1,
							["anchorTo"] = "$parent",
							["rank"] = true,
							["anchorPoint"] = "CLI",
							["enabled"] = true,
							["size"] = 0,
						},
					},
					["groupSpacing"] = 0,
					["powerBar"] = {
						["colorType"] = "type",
						["order"] = 20,
						["background"] = true,
						["height"] = 0.3,
					},
					["groupsPerRow"] = 8,
					["healthBar"] = {
						["colorType"] = "class",
						["order"] = 10,
						["background"] = true,
						["reactionType"] = "none",
						["height"] = 1.2,
					},
					["text"] = {
						{
							["text"] = "[(()afk() )][name]",
						}, -- [1]
						{
							["text"] = "[missinghp]",
						}, -- [2]
						{
							["text"] = "",
						}, -- [3]
						{
							["text"] = "",
						}, -- [4]
						{
							["text"] = "[(()afk() )][name]",
						}, -- [5]
					},
					["maxColumns"] = 8,
					["altPowerBar"] = {
						["height"] = 0.4,
						["background"] = true,
						["order"] = 100,
					},
					["height"] = 30,
					["indicators"] = {
						["raidTarget"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "C",
							["size"] = 20,
						},
						["lfdRole"] = {
							["y"] = 14,
							["x"] = 3,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "BR",
							["size"] = 14,
						},
						["resurrect"] = {
							["y"] = -1,
							["x"] = 37,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "LC",
							["size"] = 28,
						},
						["masterLoot"] = {
							["anchorPoint"] = "TR",
							["x"] = -2,
							["anchorTo"] = "$parent",
							["y"] = -10,
							["size"] = 12,
						},
						["leader"] = {
							["y"] = -12,
							["x"] = 2,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "TL",
							["size"] = 14,
						},
						["role"] = {
							["enabled"] = false,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "BR",
							["y"] = 14,
							["size"] = 14,
						},
						["status"] = {
							["y"] = -2,
							["x"] = 12,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "LB",
							["size"] = 16,
						},
						["pvp"] = {
							["anchorPoint"] = "BL",
							["x"] = 0,
							["anchorTo"] = "$parent",
							["y"] = 11,
							["size"] = 22,
						},
						["class"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "BL",
							["size"] = 16,
						},
						["ready"] = {
							["anchorPoint"] = "LC",
							["x"] = 25,
							["anchorTo"] = "$parent",
							["y"] = 0,
							["size"] = 24,
						},
					},
					["scale"] = 0.85,
					["incAbsorb"] = {
						["cap"] = 1,
					},
					["columnSpacing"] = 5,
					["unitsPerColumn"] = 8,
					["attribAnchorPoint"] = "LEFT",
					["width"] = 100,
					["incHeal"] = {
						["cap"] = 1,
					},
					["healAbsorb"] = {
						["cap"] = 1,
					},
					["emptyBar"] = {
						["order"] = 0,
						["background"] = true,
						["height"] = 1,
						["reactionType"] = "none",
					},
					["highlight"] = {
						["size"] = 10,
					},
				},
				["arenapet"] = {
					["indicators"] = {
						["raidTarget"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "C",
							["size"] = 20,
						},
					},
					["auras"] = {
						["buffs"] = {
							["anchorPoint"] = "BL",
							["y"] = 0,
							["x"] = 0,
							["size"] = 16,
						},
						["debuffs"] = {
							["anchorPoint"] = "BL",
							["y"] = 0,
							["x"] = 0,
							["size"] = 16,
						},
					},
					["castBar"] = {
						["time"] = {
							["enabled"] = true,
							["x"] = -1,
							["anchorTo"] = "$parent",
							["y"] = 0,
							["anchorPoint"] = "CRI",
							["size"] = 0,
						},
						["order"] = 40,
						["height"] = 0.6,
						["background"] = true,
						["icon"] = "HIDE",
						["name"] = {
							["y"] = 0,
							["x"] = 1,
							["anchorTo"] = "$parent",
							["rank"] = true,
							["anchorPoint"] = "CLI",
							["enabled"] = true,
							["size"] = 0,
						},
					},
					["powerBar"] = {
						["colorType"] = "type",
						["order"] = 20,
						["background"] = true,
						["height"] = 0.6,
					},
					["healthBar"] = {
						["colorType"] = "class",
						["order"] = 10,
						["background"] = true,
						["reactionType"] = "npc",
						["height"] = 1.2,
					},
					["text"] = {
						nil, -- [1]
						{
							["text"] = "[curhp]",
						}, -- [2]
						{
							["text"] = "",
						}, -- [3]
						{
							["text"] = "",
						}, -- [4]
						{
							["text"] = "[name]",
						}, -- [5]
					},
					["width"] = 90,
					["altPowerBar"] = {
						["height"] = 0.4,
						["background"] = true,
						["order"] = 100,
					},
					["height"] = 25,
					["highlight"] = {
						["size"] = 10,
					},
					["portrait"] = {
						["type"] = "3D",
						["alignment"] = "LEFT",
						["fullAfter"] = 100,
						["height"] = 0.5,
						["fullBefore"] = 0,
						["order"] = 15,
						["width"] = 0.22,
					},
					["emptyBar"] = {
						["order"] = 0,
						["background"] = true,
						["height"] = 1,
						["reactionType"] = "none",
					},
				},
				["mainassisttargettarget"] = {
					["text"] = {
						{
							["text"] = "[(()afk() )][name]",
						}, -- [1]
						[3] = {
							["text"] = "[level( )][classification( )][perpp]",
						},
						[5] = {
							["text"] = "[(()afk() )][name]",
						},
					},
					["portrait"] = {
						["type"] = "3D",
						["alignment"] = "LEFT",
						["fullAfter"] = 100,
						["height"] = 0.5,
						["fullBefore"] = 0,
						["order"] = 15,
						["width"] = 0.22,
					},
					["healthBar"] = {
						["colorType"] = "class",
						["order"] = 10,
						["background"] = true,
						["reactionType"] = "npc",
						["height"] = 1.2,
					},
					["emptyBar"] = {
						["order"] = 0,
						["background"] = true,
						["height"] = 1,
						["reactionType"] = "none",
					},
					["auras"] = {
						["buffs"] = {
							["anchorPoint"] = "BL",
							["y"] = 0,
							["x"] = 0,
							["size"] = 16,
						},
						["debuffs"] = {
							["anchorPoint"] = "BL",
							["y"] = 0,
							["x"] = 0,
							["size"] = 16,
						},
					},
					["castBar"] = {
						["time"] = {
							["enabled"] = true,
							["x"] = -1,
							["anchorTo"] = "$parent",
							["y"] = 0,
							["anchorPoint"] = "CRI",
							["size"] = 0,
						},
						["order"] = 40,
						["height"] = 0.6,
						["background"] = true,
						["icon"] = "HIDE",
						["name"] = {
							["y"] = 0,
							["x"] = 1,
							["anchorTo"] = "$parent",
							["rank"] = true,
							["anchorPoint"] = "CLI",
							["enabled"] = true,
							["size"] = 0,
						},
					},
					["indicators"] = {
						["raidTarget"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "C",
							["size"] = 20,
						},
						["class"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "BL",
							["size"] = 16,
						},
					},
					["altPowerBar"] = {
						["height"] = 0.4,
						["background"] = true,
						["order"] = 100,
					},
					["width"] = 150,
					["height"] = 40,
					["powerBar"] = {
						["colorType"] = "type",
						["order"] = 20,
						["background"] = true,
						["height"] = 1,
					},
					["highlight"] = {
						["size"] = 10,
					},
				},
				["party"] = {
					["indicators"] = {
						["raidTarget"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "C",
							["size"] = 20,
						},
						["lfdRole"] = {
							["y"] = 14,
							["x"] = 3,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "BR",
							["size"] = 14,
						},
						["phase"] = {
							["anchorPoint"] = "RC",
							["x"] = -11,
							["anchorTo"] = "$parent",
							["size"] = 14,
						},
						["masterLoot"] = {
							["y"] = -10,
							["x"] = 16,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "TL",
							["size"] = 12,
						},
						["leader"] = {
							["y"] = -12,
							["x"] = 2,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "TL",
							["size"] = 14,
						},
						["role"] = {
							["y"] = -11,
							["x"] = 30,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "TL",
							["size"] = 14,
						},
						["pvp"] = {
							["y"] = -21,
							["x"] = 11,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "TR",
							["size"] = 22,
						},
						["status"] = {
							["y"] = -2,
							["x"] = 12,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "LB",
							["size"] = 16,
						},
						["height"] = 0.5,
						["class"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "BL",
							["size"] = 16,
						},
						["resurrect"] = {
							["y"] = -1,
							["x"] = 37,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "LC",
							["size"] = 28,
						},
						["ready"] = {
							["y"] = 0,
							["x"] = 35,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "LC",
							["size"] = 24,
						},
					},
					["range"] = {
						["height"] = 0.5,
					},
					["auras"] = {
						["height"] = 0.5,
						["debuffs"] = {
							["enabled"] = true,
							["anchorPoint"] = "BL",
							["x"] = 0,
							["y"] = 0,
							["size"] = 16,
						},
						["buffs"] = {
							["enabled"] = true,
							["y"] = 0,
							["x"] = 0,
							["anchorPoint"] = "BL",
							["size"] = 16,
						},
					},
					["castBar"] = {
						["time"] = {
							["enabled"] = true,
							["x"] = -1,
							["anchorTo"] = "$parent",
							["y"] = 0,
							["anchorPoint"] = "CRI",
							["size"] = 0,
						},
						["order"] = 60,
						["height"] = 0.6,
						["background"] = true,
						["icon"] = "HIDE",
						["name"] = {
							["y"] = 0,
							["x"] = 1,
							["anchorTo"] = "$parent",
							["rank"] = true,
							["anchorPoint"] = "CLI",
							["enabled"] = true,
							["size"] = 0,
						},
					},
					["portrait"] = {
						["enabled"] = true,
						["type"] = "3D",
						["alignment"] = "LEFT",
						["fullAfter"] = 50,
						["height"] = 0.5,
						["fullBefore"] = 0,
						["order"] = 15,
						["width"] = 0.22,
					},
					["highlight"] = {
						["height"] = 0.5,
						["size"] = 10,
					},
					["auraIndicators"] = {
						["height"] = 0.5,
					},
					["powerBar"] = {
						["colorType"] = "type",
						["order"] = 20,
						["background"] = true,
						["height"] = 1,
					},
					["offset"] = 23,
					["enabled"] = false,
					["columnSpacing"] = 30,
					["healthBar"] = {
						["colorType"] = "class",
						["order"] = 10,
						["background"] = true,
						["reactionType"] = "npc",
						["height"] = 1.2,
					},
					["attribAnchorPoint"] = "LEFT",
					["altPowerBar"] = {
						["height"] = 0.4,
						["background"] = true,
						["order"] = 100,
					},
					["unitsPerColumn"] = 5,
					["emptyBar"] = {
						["order"] = 0,
						["background"] = true,
						["height"] = 1,
						["reactionType"] = "none",
					},
					["width"] = 190,
					["text"] = {
						{
							["text"] = "[(()afk() )][name]",
						}, -- [1]
						[3] = {
							["text"] = "[level( )][perpp]",
						},
						[5] = {
							["text"] = "[(()afk() )][name]",
						},
					},
					["height"] = 45,
					["fader"] = {
						["height"] = 0.5,
					},
					["combatText"] = {
						["height"] = 0.5,
					},
					["incHeal"] = {
						["height"] = 0.5,
						["cap"] = 1,
					},
					["healAbsorb"] = {
						["height"] = 0.5,
						["cap"] = 1,
					},
					["incAbsorb"] = {
						["height"] = 0.5,
						["cap"] = 1,
					},
					["attribPoint"] = "TOP",
				},
				["maintanktargettarget"] = {
					["text"] = {
						{
							["text"] = "[(()afk() )][name]",
						}, -- [1]
						[3] = {
							["text"] = "[classification( )][perpp]",
						},
						[5] = {
							["text"] = "[(()afk() )][name]",
						},
					},
					["portrait"] = {
						["type"] = "3D",
						["alignment"] = "LEFT",
						["fullAfter"] = 100,
						["height"] = 0.5,
						["fullBefore"] = 0,
						["order"] = 15,
						["width"] = 0.22,
					},
					["healthBar"] = {
						["colorType"] = "class",
						["order"] = 10,
						["background"] = true,
						["reactionType"] = "npc",
						["height"] = 1.2,
					},
					["emptyBar"] = {
						["order"] = 0,
						["background"] = true,
						["height"] = 1,
						["reactionType"] = "none",
					},
					["auras"] = {
						["buffs"] = {
							["anchorPoint"] = "BL",
							["y"] = 0,
							["x"] = 0,
							["size"] = 16,
						},
						["debuffs"] = {
							["anchorPoint"] = "BL",
							["y"] = 0,
							["x"] = 0,
							["size"] = 16,
						},
					},
					["castBar"] = {
						["time"] = {
							["enabled"] = true,
							["x"] = -1,
							["anchorTo"] = "$parent",
							["y"] = 0,
							["anchorPoint"] = "CRI",
							["size"] = 0,
						},
						["order"] = 40,
						["height"] = 0.6,
						["background"] = true,
						["icon"] = "HIDE",
						["name"] = {
							["y"] = 0,
							["x"] = 1,
							["anchorTo"] = "$parent",
							["rank"] = true,
							["anchorPoint"] = "CLI",
							["enabled"] = true,
							["size"] = 0,
						},
					},
					["indicators"] = {
						["raidTarget"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "C",
							["size"] = 20,
						},
						["class"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "BL",
							["size"] = 16,
						},
					},
					["altPowerBar"] = {
						["height"] = 0.4,
						["background"] = true,
						["order"] = 100,
					},
					["width"] = 150,
					["height"] = 40,
					["powerBar"] = {
						["colorType"] = "type",
						["order"] = 20,
						["background"] = true,
						["height"] = 1,
					},
					["highlight"] = {
						["size"] = 10,
					},
				},
				["focus"] = {
					["indicators"] = {
						["raidTarget"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "C",
							["size"] = 20,
						},
						["lfdRole"] = {
							["y"] = 14,
							["x"] = 3,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "BR",
							["size"] = 14,
						},
						["resurrect"] = {
							["y"] = -1,
							["x"] = 37,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "LC",
							["size"] = 28,
						},
						["masterLoot"] = {
							["y"] = -10,
							["x"] = 16,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "TL",
							["size"] = 12,
						},
						["leader"] = {
							["y"] = -12,
							["x"] = 2,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "TL",
							["size"] = 14,
						},
						["questBoss"] = {
							["y"] = 14,
							["x"] = 7,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "BR",
							["enabled"] = false,
							["size"] = 22,
						},
						["height"] = 0.5,
						["status"] = {
							["y"] = -2,
							["x"] = 12,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "LB",
							["size"] = 16,
						},
						["role"] = {
							["y"] = -11,
							["x"] = 30,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "TL",
							["size"] = 14,
						},
						["class"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "BL",
							["size"] = 16,
						},
						["pvp"] = {
							["y"] = -21,
							["x"] = 11,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "TR",
							["size"] = 22,
						},
					},
					["range"] = {
						["height"] = 0.5,
					},
					["auras"] = {
						["height"] = 0.5,
						["debuffs"] = {
							["anchorPoint"] = "BL",
							["y"] = 0,
							["x"] = 0,
							["size"] = 16,
						},
						["buffs"] = {
							["anchorPoint"] = "BL",
							["y"] = 0,
							["x"] = 0,
							["size"] = 16,
						},
					},
					["castBar"] = {
						["time"] = {
							["enabled"] = true,
							["x"] = -1,
							["anchorTo"] = "$parent",
							["y"] = 0,
							["anchorPoint"] = "CRI",
							["size"] = 0,
						},
						["order"] = 60,
						["height"] = 0.6,
						["background"] = true,
						["icon"] = "HIDE",
						["name"] = {
							["y"] = 0,
							["x"] = 1,
							["anchorTo"] = "$parent",
							["rank"] = true,
							["anchorPoint"] = "CLI",
							["enabled"] = true,
							["size"] = 0,
						},
					},
					["auraIndicators"] = {
						["height"] = 0.5,
					},
					["powerBar"] = {
						["colorType"] = "type",
						["order"] = 20,
						["background"] = true,
						["height"] = 0.6,
					},
					["healthBar"] = {
						["colorType"] = "class",
						["order"] = 10,
						["background"] = true,
						["reactionType"] = "npc",
						["height"] = 1.2,
					},
					["highlight"] = {
						["height"] = 0.5,
						["size"] = 10,
					},
					["text"] = {
						{
							["text"] = "[(()afk() )][name]",
						}, -- [1]
						{
							["text"] = "[curhp]",
						}, -- [2]
						{
							["text"] = "[perpp]",
						}, -- [3]
						{
							["text"] = "[curpp]",
						}, -- [4]
						{
							["text"] = "[(()afk() )][name]",
						}, -- [5]
					},
					["emptyBar"] = {
						["order"] = 0,
						["background"] = true,
						["height"] = 1,
						["reactionType"] = "none",
					},
					["width"] = 120,
					["altPowerBar"] = {
						["height"] = 0.4,
						["background"] = true,
						["order"] = 100,
					},
					["height"] = 28,
					["fader"] = {
						["height"] = 0.5,
					},
					["combatText"] = {
						["height"] = 0.5,
					},
					["incHeal"] = {
						["height"] = 0.5,
					},
					["healAbsorb"] = {
						["height"] = 0.5,
						["cap"] = 1,
					},
					["portrait"] = {
						["type"] = "3D",
						["alignment"] = "LEFT",
						["fullAfter"] = 50,
						["height"] = 0.5,
						["fullBefore"] = 0,
						["order"] = 15,
						["width"] = 0.22,
					},
					["incAbsorb"] = {
						["height"] = 0.5,
					},
				},
				["target"] = {
					["indicators"] = {
						["raidTarget"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "C",
							["size"] = 20,
						},
						["lfdRole"] = {
							["y"] = 14,
							["x"] = 3,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "BR",
							["size"] = 14,
						},
						["resurrect"] = {
							["y"] = -1,
							["x"] = -39,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "RC",
							["size"] = 28,
						},
						["masterLoot"] = {
							["y"] = -10,
							["x"] = 16,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "TL",
							["size"] = 12,
						},
						["leader"] = {
							["y"] = -12,
							["x"] = 2,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "TL",
							["size"] = 14,
						},
						["questBoss"] = {
							["y"] = 24,
							["x"] = 9,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "BR",
							["size"] = 22,
						},
						["height"] = 0.5,
						["status"] = {
							["y"] = -2,
							["x"] = 12,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "LB",
							["size"] = 16,
						},
						["role"] = {
							["y"] = -11,
							["x"] = 30,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "TL",
							["size"] = 14,
						},
						["class"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "BL",
							["size"] = 16,
						},
						["pvp"] = {
							["y"] = -21,
							["x"] = 11,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "TR",
							["size"] = 22,
						},
					},
					["scale"] = 1.2,
					["range"] = {
						["height"] = 0.5,
					},
					["auras"] = {
						["height"] = 0.5,
						["debuffs"] = {
							["enabled"] = true,
							["anchorPoint"] = "BL",
							["x"] = 0,
							["y"] = 0,
							["size"] = 16,
						},
						["buffs"] = {
							["enabled"] = true,
							["anchorPoint"] = "BL",
							["x"] = 0,
							["y"] = 0,
							["size"] = 16,
						},
					},
					["castBar"] = {
						["time"] = {
							["enabled"] = true,
							["x"] = -1,
							["anchorTo"] = "$parent",
							["y"] = 0,
							["anchorPoint"] = "CRI",
							["size"] = 0,
						},
						["order"] = 60,
						["height"] = 0.6,
						["background"] = true,
						["icon"] = "HIDE",
						["name"] = {
							["y"] = 0,
							["x"] = 1,
							["anchorTo"] = "$parent",
							["rank"] = true,
							["anchorPoint"] = "CLI",
							["enabled"] = true,
							["size"] = 0,
						},
					},
					["auraIndicators"] = {
						["height"] = 0.5,
					},
					["powerBar"] = {
						["colorType"] = "type",
						["order"] = 20,
						["background"] = true,
						["height"] = 1,
					},
					["healthBar"] = {
						["colorType"] = "class",
						["colorAggro"] = true,
						["order"] = 10,
						["background"] = true,
						["reactionType"] = "npc",
						["height"] = 1.2,
					},
					["highlight"] = {
						["height"] = 0.5,
						["size"] = 10,
					},
					["text"] = {
						{
							["text"] = "[(()afk() )][name]",
						}, -- [1]
						nil, -- [2]
						{
							["text"] = "[level( )][classification( )][perpp]",
						}, -- [3]
						{
							["text"] = "[absolutepp]",
						}, -- [4]
						{
							["text"] = "[(()afk() )][name]",
						}, -- [5]
					},
					["emptyBar"] = {
						["order"] = 0,
						["background"] = true,
						["height"] = 1,
						["reactionType"] = "none",
					},
					["width"] = 190,
					["portrait"] = {
						["enabled"] = true,
						["type"] = "2D",
						["alignment"] = "RIGHT",
						["fullAfter"] = 50,
						["height"] = 0.5,
						["fullBefore"] = 0,
						["order"] = 15,
						["width"] = 0.22,
					},
					["height"] = 45,
					["altPowerBar"] = {
						["height"] = 0.4,
						["background"] = true,
						["order"] = 100,
					},
					["combatText"] = {
						["enabled"] = false,
						["height"] = 0.5,
					},
					["incHeal"] = {
						["height"] = 0.5,
						["cap"] = 1,
					},
					["healAbsorb"] = {
						["height"] = 0.5,
						["cap"] = 1,
					},
					["incAbsorb"] = {
						["height"] = 0.5,
						["cap"] = 1,
					},
					["comboPoints"] = {
						["anchorTo"] = "$parent",
						["order"] = 60,
						["isBar"] = false,
						["growth"] = "LEFT",
						["anchorPoint"] = "BR",
						["x"] = -3,
						["showAlways"] = true,
						["spacing"] = -4,
						["height"] = 0.4,
						["background"] = false,
						["y"] = 8,
						["size"] = 14,
					},
				},
				["battlegroundtarget"] = {
					["text"] = {
						nil, -- [1]
						{
							["text"] = "[curhp]",
						}, -- [2]
						{
							["text"] = "",
						}, -- [3]
						{
							["text"] = "",
						}, -- [4]
						{
							["text"] = "[name]",
						}, -- [5]
					},
					["portrait"] = {
						["type"] = "3D",
						["alignment"] = "LEFT",
						["fullAfter"] = 100,
						["height"] = 0.5,
						["fullBefore"] = 0,
						["order"] = 15,
						["width"] = 0.22,
					},
					["healthBar"] = {
						["colorType"] = "class",
						["order"] = 10,
						["background"] = true,
						["reactionType"] = "npc",
						["height"] = 1.2,
					},
					["emptyBar"] = {
						["order"] = 0,
						["background"] = true,
						["height"] = 1,
						["reactionType"] = "none",
					},
					["auras"] = {
						["buffs"] = {
							["anchorPoint"] = "BL",
							["y"] = 0,
							["x"] = 0,
							["size"] = 16,
						},
						["debuffs"] = {
							["anchorPoint"] = "BL",
							["y"] = 0,
							["x"] = 0,
							["size"] = 16,
						},
					},
					["castBar"] = {
						["time"] = {
							["enabled"] = true,
							["x"] = -1,
							["anchorTo"] = "$parent",
							["y"] = 0,
							["anchorPoint"] = "CRI",
							["size"] = 0,
						},
						["order"] = 40,
						["height"] = 0.6,
						["background"] = true,
						["icon"] = "HIDE",
						["name"] = {
							["y"] = 0,
							["x"] = 1,
							["anchorTo"] = "$parent",
							["rank"] = true,
							["anchorPoint"] = "CLI",
							["enabled"] = true,
							["size"] = 0,
						},
					},
					["indicators"] = {
						["raidTarget"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "C",
							["size"] = 20,
						},
						["class"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "BL",
							["size"] = 16,
						},
					},
					["altPowerBar"] = {
						["height"] = 0.4,
						["background"] = true,
						["order"] = 100,
					},
					["width"] = 90,
					["height"] = 25,
					["powerBar"] = {
						["colorType"] = "type",
						["order"] = 20,
						["background"] = true,
						["height"] = 0.6,
					},
					["highlight"] = {
						["size"] = 10,
					},
				},
				["boss"] = {
					["highlight"] = {
						["height"] = 0.5,
						["size"] = 10,
					},
					["scale"] = 1.5,
					["range"] = {
						["height"] = 0.5,
					},
					["auras"] = {
						["height"] = 0.5,
						["debuffs"] = {
							["enabled"] = true,
							["anchorPoint"] = "BL",
							["perRow"] = 8,
							["x"] = 0,
							["y"] = 0,
							["size"] = 16,
						},
						["buffs"] = {
							["enabled"] = true,
							["anchorPoint"] = "BL",
							["perRow"] = 8,
							["x"] = 0,
							["y"] = 0,
							["size"] = 16,
						},
					},
					["castBar"] = {
						["time"] = {
							["enabled"] = true,
							["x"] = -1,
							["anchorTo"] = "$parent",
							["y"] = 0,
							["anchorPoint"] = "CRI",
							["size"] = 0,
						},
						["order"] = 40,
						["height"] = 0.6,
						["background"] = true,
						["icon"] = "HIDE",
						["name"] = {
							["y"] = 0,
							["x"] = 1,
							["anchorTo"] = "$parent",
							["rank"] = true,
							["anchorPoint"] = "CLI",
							["enabled"] = true,
							["size"] = 0,
						},
					},
					["auraIndicators"] = {
						["height"] = 0.5,
					},
					["powerBar"] = {
						["colorType"] = "type",
						["order"] = 20,
						["background"] = true,
						["height"] = 1,
					},
					["offset"] = 20,
					["healthBar"] = {
						["colorType"] = "class",
						["colorAggro"] = true,
						["order"] = 10,
						["background"] = true,
						["reactionType"] = "npc",
						["height"] = 1.2,
					},
					["text"] = {
						nil, -- [1]
						{
							["text"] = "[absolutehp]",
						}, -- [2]
						{
							["text"] = "[perpp]",
						}, -- [3]
						{
							["text"] = "[absolutepp]",
						}, -- [4]
						{
							["text"] = "[name]",
						}, -- [5]
					},
					["enabled"] = true,
					["width"] = 160,
					["portrait"] = {
						["enabled"] = true,
						["type"] = "2D",
						["alignment"] = "LEFT",
						["fullAfter"] = 100,
						["height"] = 0.5,
						["fullBefore"] = 0,
						["order"] = 15,
						["width"] = 0.22,
					},
					["altPowerBar"] = {
						["height"] = 0.4,
						["background"] = true,
						["order"] = 100,
					},
					["combatText"] = {
						["enabled"] = false,
						["height"] = 0.5,
					},
					["height"] = 40,
					["emptyBar"] = {
						["order"] = 0,
						["background"] = true,
						["height"] = 1,
						["reactionType"] = "none",
					},
					["indicators"] = {
						["raidTarget"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "C",
							["size"] = 20,
						},
						["class"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "BL",
							["size"] = 16,
						},
						["height"] = 0.5,
					},
				},
				["maintank"] = {
					["attribAnchorPoint"] = "LEFT",
					["portrait"] = {
						["type"] = "3D",
						["alignment"] = "LEFT",
						["fullAfter"] = 50,
						["height"] = 0.5,
						["fullBefore"] = 0,
						["order"] = 15,
						["width"] = 0.22,
					},
					["text"] = {
						{
							["text"] = "[(()afk() )][name]",
						}, -- [1]
						[3] = {
							["text"] = "[perpp]",
						},
						[5] = {
							["text"] = "[(()afk() )][name]",
						},
					},
					["auras"] = {
						["buffs"] = {
							["anchorPoint"] = "BL",
							["y"] = 0,
							["x"] = 0,
							["size"] = 16,
						},
						["debuffs"] = {
							["anchorPoint"] = "BL",
							["y"] = 0,
							["x"] = 0,
							["size"] = 16,
						},
					},
					["castBar"] = {
						["time"] = {
							["enabled"] = true,
							["x"] = -1,
							["anchorTo"] = "$parent",
							["y"] = 0,
							["anchorPoint"] = "CRI",
							["size"] = 0,
						},
						["order"] = 60,
						["height"] = 0.6,
						["background"] = true,
						["icon"] = "HIDE",
						["name"] = {
							["y"] = 0,
							["x"] = 1,
							["anchorTo"] = "$parent",
							["rank"] = true,
							["anchorPoint"] = "CLI",
							["enabled"] = true,
							["size"] = 0,
						},
					},
					["incHeal"] = {
						["cap"] = 1,
					},
					["incAbsorb"] = {
						["cap"] = 1,
					},
					["powerBar"] = {
						["colorType"] = "type",
						["order"] = 20,
						["background"] = true,
						["height"] = 1,
					},
					["highlight"] = {
						["size"] = 10,
					},
					["offset"] = 5,
					["healthBar"] = {
						["colorType"] = "class",
						["order"] = 10,
						["background"] = true,
						["reactionType"] = "npc",
						["height"] = 1.2,
					},
					["columnSpacing"] = 5,
					["emptyBar"] = {
						["order"] = 0,
						["background"] = true,
						["height"] = 1,
						["reactionType"] = "none",
					},
					["unitsPerColumn"] = 5,
					["width"] = 150,
					["maxColumns"] = 1,
					["altPowerBar"] = {
						["height"] = 0.4,
						["background"] = true,
						["order"] = 100,
					},
					["height"] = 40,
					["healAbsorb"] = {
						["cap"] = 1,
					},
					["indicators"] = {
						["raidTarget"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "C",
							["size"] = 20,
						},
						["resurrect"] = {
							["y"] = -1,
							["x"] = 37,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "LC",
							["size"] = 28,
						},
						["masterLoot"] = {
							["y"] = -10,
							["x"] = 16,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "TL",
							["size"] = 12,
						},
						["leader"] = {
							["y"] = -12,
							["x"] = 2,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "TL",
							["size"] = 14,
						},
						["role"] = {
							["y"] = -11,
							["x"] = 30,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "TL",
							["size"] = 14,
						},
						["status"] = {
							["y"] = -2,
							["x"] = 12,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "LB",
							["size"] = 16,
						},
						["pvp"] = {
							["y"] = -21,
							["x"] = 11,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "TR",
							["size"] = 22,
						},
						["class"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "BL",
							["size"] = 16,
						},
						["ready"] = {
							["y"] = 0,
							["x"] = 35,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "LC",
							["size"] = 24,
						},
					},
				},
				["raidpet"] = {
					["portrait"] = {
						["type"] = "3D",
						["alignment"] = "LEFT",
						["fullAfter"] = 100,
						["height"] = 0.5,
						["fullBefore"] = 0,
						["order"] = 15,
						["width"] = 0.22,
					},
					["auras"] = {
						["buffs"] = {
							["anchorPoint"] = "BL",
							["y"] = 0,
							["x"] = 0,
							["size"] = 16,
						},
						["debuffs"] = {
							["anchorPoint"] = "BL",
							["y"] = 0,
							["x"] = 0,
							["size"] = 16,
						},
					},
					["castBar"] = {
						["time"] = {
							["enabled"] = true,
							["x"] = -1,
							["anchorTo"] = "$parent",
							["y"] = 0,
							["anchorPoint"] = "CRI",
							["size"] = 0,
						},
						["order"] = 40,
						["height"] = 0.6,
						["background"] = true,
						["icon"] = "HIDE",
						["name"] = {
							["y"] = 0,
							["x"] = 1,
							["anchorTo"] = "$parent",
							["rank"] = true,
							["anchorPoint"] = "CLI",
							["enabled"] = true,
							["size"] = 0,
						},
					},
					["groupSpacing"] = 0,
					["powerBar"] = {
						["colorType"] = "type",
						["order"] = 20,
						["background"] = true,
						["height"] = 0.3,
					},
					["groupsPerRow"] = 8,
					["healthBar"] = {
						["colorType"] = "class",
						["order"] = 10,
						["background"] = true,
						["reactionType"] = "none",
						["height"] = 1.2,
					},
					["text"] = {
						nil, -- [1]
						{
							["text"] = "[missinghp]",
						}, -- [2]
						{
							["text"] = "",
						}, -- [3]
						{
							["text"] = "",
						}, -- [4]
						{
							["text"] = "[name]",
						}, -- [5]
					},
					["maxColumns"] = 8,
					["altPowerBar"] = {
						["height"] = 0.4,
						["background"] = true,
						["order"] = 100,
					},
					["height"] = 30,
					["indicators"] = {
						["raidTarget"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "C",
							["size"] = 20,
						},
					},
					["scale"] = 0.85,
					["incAbsorb"] = {
						["cap"] = 1,
					},
					["columnSpacing"] = 5,
					["unitsPerColumn"] = 8,
					["attribAnchorPoint"] = "LEFT",
					["width"] = 90,
					["incHeal"] = {
						["cap"] = 1,
					},
					["healAbsorb"] = {
						["cap"] = 1,
					},
					["emptyBar"] = {
						["order"] = 0,
						["background"] = true,
						["height"] = 1,
						["reactionType"] = "none",
					},
					["highlight"] = {
						["size"] = 10,
					},
				},
				["battlegroundtargettarget"] = {
					["text"] = {
						nil, -- [1]
						{
							["text"] = "[curhp]",
						}, -- [2]
						{
							["text"] = "",
						}, -- [3]
						{
							["text"] = "",
						}, -- [4]
						{
							["text"] = "[name]",
						}, -- [5]
					},
					["portrait"] = {
						["type"] = "3D",
						["alignment"] = "LEFT",
						["fullAfter"] = 100,
						["height"] = 0.5,
						["fullBefore"] = 0,
						["order"] = 15,
						["width"] = 0.22,
					},
					["healthBar"] = {
						["colorType"] = "class",
						["order"] = 10,
						["background"] = true,
						["reactionType"] = "npc",
						["height"] = 1.2,
					},
					["emptyBar"] = {
						["order"] = 0,
						["background"] = true,
						["height"] = 1,
						["reactionType"] = "none",
					},
					["auras"] = {
						["buffs"] = {
							["anchorPoint"] = "BL",
							["y"] = 0,
							["x"] = 0,
							["size"] = 16,
						},
						["debuffs"] = {
							["anchorPoint"] = "BL",
							["y"] = 0,
							["x"] = 0,
							["size"] = 16,
						},
					},
					["castBar"] = {
						["time"] = {
							["enabled"] = true,
							["x"] = -1,
							["anchorTo"] = "$parent",
							["y"] = 0,
							["anchorPoint"] = "CRI",
							["size"] = 0,
						},
						["order"] = 40,
						["height"] = 0.6,
						["background"] = true,
						["icon"] = "HIDE",
						["name"] = {
							["y"] = 0,
							["x"] = 1,
							["anchorTo"] = "$parent",
							["rank"] = true,
							["anchorPoint"] = "CLI",
							["enabled"] = true,
							["size"] = 0,
						},
					},
					["indicators"] = {
						["raidTarget"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "C",
							["size"] = 20,
						},
						["class"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "BL",
							["size"] = 16,
						},
					},
					["altPowerBar"] = {
						["height"] = 0.4,
						["background"] = true,
						["order"] = 100,
					},
					["width"] = 90,
					["height"] = 25,
					["powerBar"] = {
						["colorType"] = "type",
						["order"] = 20,
						["background"] = true,
						["height"] = 0.6,
					},
					["highlight"] = {
						["size"] = 10,
					},
				},
				["bosstargettarget"] = {
					["text"] = {
						nil, -- [1]
						{
							["text"] = "[curhp]",
						}, -- [2]
						{
							["text"] = "",
						}, -- [3]
						{
							["text"] = "",
						}, -- [4]
						{
							["text"] = "[name]",
						}, -- [5]
					},
					["portrait"] = {
						["type"] = "3D",
						["alignment"] = "LEFT",
						["fullAfter"] = 100,
						["height"] = 0.5,
						["fullBefore"] = 0,
						["order"] = 15,
						["width"] = 0.22,
					},
					["healthBar"] = {
						["colorType"] = "class",
						["order"] = 10,
						["background"] = true,
						["reactionType"] = "npc",
						["height"] = 1.2,
					},
					["emptyBar"] = {
						["order"] = 0,
						["background"] = true,
						["height"] = 1,
						["reactionType"] = "none",
					},
					["auras"] = {
						["buffs"] = {
							["anchorPoint"] = "BL",
							["y"] = 0,
							["x"] = 0,
							["size"] = 16,
						},
						["debuffs"] = {
							["anchorPoint"] = "BL",
							["y"] = 0,
							["x"] = 0,
							["size"] = 16,
						},
					},
					["castBar"] = {
						["time"] = {
							["enabled"] = true,
							["x"] = -1,
							["anchorTo"] = "$parent",
							["y"] = 0,
							["anchorPoint"] = "CRI",
							["size"] = 0,
						},
						["order"] = 40,
						["height"] = 0.6,
						["background"] = true,
						["icon"] = "HIDE",
						["name"] = {
							["y"] = 0,
							["x"] = 1,
							["anchorTo"] = "$parent",
							["rank"] = true,
							["anchorPoint"] = "CLI",
							["enabled"] = true,
							["size"] = 0,
						},
					},
					["indicators"] = {
						["raidTarget"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "C",
							["size"] = 20,
						},
						["class"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "BL",
							["size"] = 16,
						},
					},
					["altPowerBar"] = {
						["height"] = 0.4,
						["background"] = true,
						["order"] = 100,
					},
					["width"] = 90,
					["height"] = 25,
					["powerBar"] = {
						["colorType"] = "type",
						["order"] = 20,
						["background"] = true,
						["height"] = 0.6,
					},
					["highlight"] = {
						["size"] = 10,
					},
				},
				["pet"] = {
					["xpBar"] = {
						["height"] = 0.25,
						["background"] = true,
						["order"] = 55,
					},
					["indicators"] = {
						["raidTarget"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "C",
							["size"] = 20,
						},
						["height"] = 0.5,
					},
					["range"] = {
						["height"] = 0.5,
					},
					["auras"] = {
						["height"] = 0.5,
						["debuffs"] = {
							["anchorPoint"] = "BL",
							["y"] = 0,
							["x"] = 0,
							["size"] = 16,
						},
						["buffs"] = {
							["anchorPoint"] = "BL",
							["y"] = 0,
							["x"] = 0,
							["size"] = 16,
						},
					},
					["castBar"] = {
						["time"] = {
							["enabled"] = true,
							["x"] = -1,
							["anchorTo"] = "$parent",
							["y"] = 0,
							["anchorPoint"] = "CRI",
							["size"] = 0,
						},
						["order"] = 60,
						["height"] = 0.6,
						["background"] = true,
						["icon"] = "HIDE",
						["name"] = {
							["y"] = 0,
							["x"] = 1,
							["anchorTo"] = "$parent",
							["rank"] = true,
							["anchorPoint"] = "CLI",
							["enabled"] = true,
							["size"] = 0,
						},
					},
					["auraIndicators"] = {
						["height"] = 0.5,
					},
					["powerBar"] = {
						["colorType"] = "type",
						["order"] = 20,
						["background"] = true,
						["height"] = 0.7,
					},
					["healthBar"] = {
						["colorType"] = "class",
						["order"] = 10,
						["background"] = true,
						["reactionType"] = "none",
						["height"] = 1.2,
					},
					["highlight"] = {
						["height"] = 0.5,
						["size"] = 10,
					},
					["text"] = {
						[3] = {
							["text"] = "[perpp]",
						},
						[5] = {
							["text"] = "[name]",
						},
					},
					["emptyBar"] = {
						["order"] = 0,
						["background"] = true,
						["height"] = 1,
						["reactionType"] = "none",
					},
					["width"] = 190,
					["altPowerBar"] = {
						["height"] = 0.4,
						["background"] = true,
						["order"] = 100,
					},
					["height"] = 30,
					["fader"] = {
						["height"] = 0.5,
						["enabled"] = true,
					},
					["combatText"] = {
						["height"] = 0.5,
					},
					["incHeal"] = {
						["height"] = 0.5,
					},
					["healAbsorb"] = {
						["height"] = 0.5,
						["cap"] = 1,
					},
					["incAbsorb"] = {
						["height"] = 0.5,
					},
					["portrait"] = {
						["type"] = "3D",
						["alignment"] = "LEFT",
						["fullAfter"] = 50,
						["height"] = 0.5,
						["fullBefore"] = 0,
						["order"] = 15,
						["width"] = 0.22,
					},
				},
				["bosstarget"] = {
					["text"] = {
						nil, -- [1]
						{
							["text"] = "[curhp]",
						}, -- [2]
						{
							["text"] = "",
						}, -- [3]
						{
							["text"] = "",
						}, -- [4]
						{
							["text"] = "[name]",
						}, -- [5]
					},
					["portrait"] = {
						["type"] = "3D",
						["alignment"] = "LEFT",
						["fullAfter"] = 100,
						["height"] = 0.5,
						["fullBefore"] = 0,
						["order"] = 15,
						["width"] = 0.22,
					},
					["healthBar"] = {
						["colorType"] = "class",
						["order"] = 10,
						["background"] = true,
						["reactionType"] = "npc",
						["height"] = 1.2,
					},
					["emptyBar"] = {
						["order"] = 0,
						["background"] = true,
						["height"] = 1,
						["reactionType"] = "none",
					},
					["auras"] = {
						["buffs"] = {
							["anchorPoint"] = "BL",
							["y"] = 0,
							["x"] = 0,
							["size"] = 16,
						},
						["debuffs"] = {
							["anchorPoint"] = "BL",
							["y"] = 0,
							["x"] = 0,
							["size"] = 16,
						},
					},
					["castBar"] = {
						["time"] = {
							["enabled"] = true,
							["x"] = -1,
							["anchorTo"] = "$parent",
							["y"] = 0,
							["anchorPoint"] = "CRI",
							["size"] = 0,
						},
						["order"] = 40,
						["height"] = 0.6,
						["background"] = true,
						["icon"] = "HIDE",
						["name"] = {
							["y"] = 0,
							["x"] = 1,
							["anchorTo"] = "$parent",
							["rank"] = true,
							["anchorPoint"] = "CLI",
							["enabled"] = true,
							["size"] = 0,
						},
					},
					["indicators"] = {
						["raidTarget"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "C",
							["size"] = 20,
						},
						["class"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "BL",
							["size"] = 16,
						},
					},
					["altPowerBar"] = {
						["height"] = 0.4,
						["background"] = true,
						["order"] = 100,
					},
					["width"] = 90,
					["height"] = 25,
					["powerBar"] = {
						["colorType"] = "type",
						["order"] = 20,
						["background"] = true,
						["height"] = 0.6,
					},
					["highlight"] = {
						["size"] = 10,
					},
				},
				["focustarget"] = {
					["indicators"] = {
						["raidTarget"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "C",
							["size"] = 20,
						},
						["class"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "BL",
							["size"] = 16,
						},
						["height"] = 0.5,
					},
					["range"] = {
						["height"] = 0.5,
					},
					["auras"] = {
						["height"] = 0.5,
						["debuffs"] = {
							["anchorPoint"] = "BL",
							["y"] = 0,
							["x"] = 0,
							["size"] = 16,
						},
						["buffs"] = {
							["anchorPoint"] = "BL",
							["y"] = 0,
							["x"] = 0,
							["size"] = 16,
						},
					},
					["castBar"] = {
						["time"] = {
							["enabled"] = true,
							["x"] = -1,
							["anchorTo"] = "$parent",
							["y"] = 0,
							["anchorPoint"] = "CRI",
							["size"] = 0,
						},
						["order"] = 40,
						["height"] = 0.6,
						["background"] = true,
						["icon"] = "HIDE",
						["name"] = {
							["y"] = 0,
							["x"] = 1,
							["anchorTo"] = "$parent",
							["rank"] = true,
							["anchorPoint"] = "CLI",
							["enabled"] = true,
							["size"] = 0,
						},
					},
					["auraIndicators"] = {
						["height"] = 0.5,
					},
					["powerBar"] = {
						["colorType"] = "type",
						["order"] = 20,
						["background"] = true,
						["height"] = 0.6,
					},
					["enabled"] = false,
					["healthBar"] = {
						["colorType"] = "class",
						["order"] = 10,
						["background"] = true,
						["reactionType"] = "npc",
						["height"] = 1.2,
					},
					["text"] = {
						{
							["text"] = "[(()afk() )][name]",
						}, -- [1]
						{
							["text"] = "[curhp]",
						}, -- [2]
						{
							["text"] = "",
						}, -- [3]
						{
							["text"] = "",
						}, -- [4]
						{
							["text"] = "[(()afk() )][name]",
						}, -- [5]
					},
					["width"] = 120,
					["altPowerBar"] = {
						["height"] = 0.4,
						["background"] = true,
						["order"] = 100,
					},
					["emptyBar"] = {
						["order"] = 0,
						["background"] = true,
						["height"] = 1,
						["reactionType"] = "none",
					},
					["height"] = 25,
					["highlight"] = {
						["height"] = 0.5,
						["size"] = 10,
					},
					["fader"] = {
						["height"] = 0.5,
					},
					["portrait"] = {
						["type"] = "3D",
						["alignment"] = "RIGHT",
						["fullAfter"] = 100,
						["height"] = 0.5,
						["fullBefore"] = 0,
						["order"] = 15,
						["width"] = 0.22,
					},
				},
				["targettarget"] = {
					["enabled"] = false,
					["width"] = 110,
					["portrait"] = {
						["type"] = "3D",
						["alignment"] = "RIGHT",
						["fullAfter"] = 100,
						["height"] = 0.5,
						["fullBefore"] = 0,
						["order"] = 15,
						["width"] = 0.22,
					},
					["healthBar"] = {
						["colorType"] = "class",
						["order"] = 10,
						["background"] = true,
						["reactionType"] = "npc",
						["height"] = 1.2,
					},
					["emptyBar"] = {
						["order"] = 0,
						["background"] = true,
						["height"] = 1,
						["reactionType"] = "none",
					},
					["range"] = {
						["height"] = 0.5,
					},
					["auras"] = {
						["height"] = 0.5,
						["debuffs"] = {
							["anchorPoint"] = "BL",
							["y"] = 0,
							["x"] = 0,
							["size"] = 16,
						},
						["buffs"] = {
							["anchorPoint"] = "BL",
							["y"] = 0,
							["x"] = 0,
							["size"] = 16,
						},
					},
					["castBar"] = {
						["time"] = {
							["enabled"] = true,
							["x"] = -1,
							["anchorTo"] = "$parent",
							["y"] = 0,
							["anchorPoint"] = "CRI",
							["size"] = 0,
						},
						["order"] = 40,
						["height"] = 0.6,
						["background"] = true,
						["icon"] = "HIDE",
						["name"] = {
							["y"] = 0,
							["x"] = 1,
							["anchorTo"] = "$parent",
							["rank"] = true,
							["anchorPoint"] = "CLI",
							["enabled"] = true,
							["size"] = 0,
						},
					},
					["text"] = {
						nil, -- [1]
						{
							["text"] = "[curhp]",
						}, -- [2]
						{
							["text"] = "[perpp]",
						}, -- [3]
						{
							["text"] = "[curpp]",
						}, -- [4]
					},
					["altPowerBar"] = {
						["height"] = 0.4,
						["background"] = true,
						["order"] = 100,
					},
					["indicators"] = {
						["raidTarget"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "C",
							["size"] = 20,
						},
						["class"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "BL",
							["size"] = 16,
						},
						["height"] = 0.5,
					},
					["height"] = 30,
					["auraIndicators"] = {
						["height"] = 0.5,
					},
					["powerBar"] = {
						["colorType"] = "type",
						["order"] = 20,
						["background"] = true,
						["height"] = 0.6,
					},
					["highlight"] = {
						["height"] = 0.5,
						["size"] = 10,
					},
				},
				["partypet"] = {
					["highlight"] = {
						["size"] = 10,
					},
					["auras"] = {
						["buffs"] = {
							["anchorPoint"] = "BL",
							["y"] = 0,
							["x"] = 0,
							["size"] = 16,
						},
						["debuffs"] = {
							["anchorPoint"] = "BL",
							["y"] = 0,
							["x"] = 0,
							["size"] = 16,
						},
					},
					["castBar"] = {
						["time"] = {
							["enabled"] = true,
							["x"] = -1,
							["anchorTo"] = "$parent",
							["y"] = 0,
							["anchorPoint"] = "CRI",
							["size"] = 0,
						},
						["order"] = 40,
						["height"] = 0.6,
						["background"] = true,
						["icon"] = "HIDE",
						["name"] = {
							["y"] = 0,
							["x"] = 1,
							["anchorTo"] = "$parent",
							["rank"] = true,
							["anchorPoint"] = "CLI",
							["enabled"] = true,
							["size"] = 0,
						},
					},
					["powerBar"] = {
						["colorType"] = "type",
						["order"] = 20,
						["background"] = true,
						["height"] = 0.6,
					},
					["healthBar"] = {
						["colorType"] = "class",
						["order"] = 10,
						["background"] = true,
						["reactionType"] = "npc",
						["height"] = 1.2,
					},
					["indicators"] = {
						["raidTarget"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "C",
							["size"] = 20,
						},
					},
					["text"] = {
						nil, -- [1]
						{
							["text"] = "[curhp]",
						}, -- [2]
						{
							["text"] = "",
						}, -- [3]
						{
							["text"] = "",
						}, -- [4]
						{
							["text"] = "[name]",
						}, -- [5]
					},
					["width"] = 90,
					["altPowerBar"] = {
						["height"] = 0.4,
						["background"] = true,
						["order"] = 100,
					},
					["height"] = 25,
					["healAbsorb"] = {
						["cap"] = 1,
					},
					["portrait"] = {
						["type"] = "3D",
						["alignment"] = "LEFT",
						["fullAfter"] = 100,
						["height"] = 0.5,
						["fullBefore"] = 0,
						["order"] = 15,
						["width"] = 0.22,
					},
					["emptyBar"] = {
						["order"] = 0,
						["background"] = true,
						["height"] = 1,
						["reactionType"] = "none",
					},
				},
				["maintanktarget"] = {
					["text"] = {
						{
							["text"] = "[(()afk() )][name]",
						}, -- [1]
						[3] = {
							["text"] = "[classification( )][perpp]",
						},
						[5] = {
							["text"] = "[(()afk() )][name]",
						},
					},
					["portrait"] = {
						["type"] = "3D",
						["alignment"] = "LEFT",
						["fullAfter"] = 100,
						["height"] = 0.5,
						["fullBefore"] = 0,
						["order"] = 15,
						["width"] = 0.22,
					},
					["healthBar"] = {
						["colorType"] = "class",
						["order"] = 10,
						["background"] = true,
						["reactionType"] = "npc",
						["height"] = 1.2,
					},
					["emptyBar"] = {
						["order"] = 0,
						["background"] = true,
						["height"] = 1,
						["reactionType"] = "none",
					},
					["auras"] = {
						["buffs"] = {
							["anchorPoint"] = "BL",
							["y"] = 0,
							["x"] = 0,
							["size"] = 16,
						},
						["debuffs"] = {
							["anchorPoint"] = "BL",
							["y"] = 0,
							["x"] = 0,
							["size"] = 16,
						},
					},
					["castBar"] = {
						["time"] = {
							["enabled"] = true,
							["x"] = -1,
							["anchorTo"] = "$parent",
							["y"] = 0,
							["anchorPoint"] = "CRI",
							["size"] = 0,
						},
						["order"] = 40,
						["height"] = 0.6,
						["background"] = true,
						["icon"] = "HIDE",
						["name"] = {
							["y"] = 0,
							["x"] = 1,
							["anchorTo"] = "$parent",
							["rank"] = true,
							["anchorPoint"] = "CLI",
							["enabled"] = true,
							["size"] = 0,
						},
					},
					["indicators"] = {
						["raidTarget"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "C",
							["size"] = 20,
						},
						["class"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "BL",
							["size"] = 16,
						},
					},
					["altPowerBar"] = {
						["height"] = 0.4,
						["background"] = true,
						["order"] = 100,
					},
					["width"] = 150,
					["height"] = 40,
					["powerBar"] = {
						["colorType"] = "type",
						["order"] = 20,
						["background"] = true,
						["height"] = 1,
					},
					["highlight"] = {
						["size"] = 10,
					},
				},
				["player"] = {
					["portrait"] = {
						["enabled"] = true,
						["type"] = "2D",
						["alignment"] = "LEFT",
						["fullAfter"] = 50,
						["height"] = 0.5,
						["fullBefore"] = 0,
						["order"] = 15,
						["width"] = 0.22,
					},
					["auras"] = {
						["height"] = 0.5,
						["debuffs"] = {
							["enabled"] = true,
							["anchorPoint"] = "BL",
							["maxRows"] = 1,
							["x"] = 0,
							["y"] = 0,
							["size"] = 16,
						},
						["buffs"] = {
							["enabled"] = true,
							["y"] = 0,
							["maxRows"] = 1,
							["x"] = 0,
							["anchorPoint"] = "BL",
							["size"] = 16,
						},
					},
					["castBar"] = {
						["time"] = {
							["enabled"] = true,
							["x"] = -1,
							["anchorTo"] = "$parent",
							["y"] = 0,
							["anchorPoint"] = "CRI",
							["size"] = 0,
						},
						["order"] = 60,
						["height"] = 0.6,
						["background"] = true,
						["icon"] = "HIDE",
						["name"] = {
							["y"] = 0,
							["x"] = 1,
							["anchorTo"] = "$parent",
							["rank"] = true,
							["anchorPoint"] = "CLI",
							["enabled"] = true,
							["size"] = 0,
						},
					},
					["powerBar"] = {
						["colorType"] = "type",
						["height"] = 1,
						["background"] = true,
						["order"] = 20,
					},
					["healthBar"] = {
						["colorType"] = "class",
						["colorAggro"] = true,
						["reactionType"] = "npc",
						["background"] = true,
						["order"] = 10,
						["height"] = 1.2,
					},
					["druidBar"] = {
						["height"] = 0.4,
						["background"] = true,
						["order"] = 70,
					},
					["text"] = {
						{
							["text"] = "[(()afk() )][name][( ()group())]",
						}, -- [1]
						{
							["text"] = "[absolutehp]",
						}, -- [2]
						{
							["text"] = "[perpp]",
						}, -- [3]
						{
							["text"] = "[absolutepp]",
						}, -- [4]
						{
							["text"] = "[(()afk() )][name][( ()group())]",
						}, -- [5]
						nil, -- [6]
						{
							["anchorTo"] = "$totemBar",
							["text"] = "[totem:timer]",
							["width"] = 1,
							["name"] = "计时器文字",
							["block"] = true,
						}, -- [7]
						{
							["anchorTo"] = "$runeBar",
							["text"] = "[rune:timer]",
							["width"] = 1,
							["name"] = "计时器文字",
							["block"] = true,
						}, -- [8]
						{
							["anchorTo"] = "$staggerBar",
							["text"] = "[monk:abs:stagger]",
							["width"] = 1,
							["name"] = "文字",
						}, -- [9]
					},
					["priestBar"] = {
						["height"] = 0.4,
						["background"] = true,
						["order"] = 40,
					},
					["staggerBar"] = {
						["height"] = 0.3,
						["background"] = true,
						["order"] = 70,
					},
					["auraPoints"] = {
						["anchorTo"] = "$parent",
						["order"] = 60,
						["showAlways"] = true,
						["growth"] = "LEFT",
						["anchorPoint"] = "BR",
						["x"] = -3,
						["spacing"] = -4,
						["height"] = 0.4,
						["y"] = 8,
						["size"] = 14,
					},
					["xpBar"] = {
						["height"] = 0.25,
						["background"] = true,
						["order"] = 55,
					},
					["highlight"] = {
						["height"] = 0.5,
						["size"] = 10,
					},
					["scale"] = 1.2,
					["totemBar"] = {
						["enabled"] = true,
						["background"] = false,
						["height"] = 0.4,
						["order"] = 70,
					},
					["auraIndicators"] = {
						["height"] = 0.5,
					},
					["comboPoints"] = {
						["anchorTo"] = "$parent",
						["order"] = 25,
						["showAlways"] = true,
						["growth"] = "LEFT",
						["anchorPoint"] = "BC",
						["x"] = -3,
						["spacing"] = -4,
						["height"] = 0.4,
						["background"] = false,
						["y"] = 8,
						["size"] = 14,
					},
					["altPowerBar"] = {
						["height"] = 0.4,
						["background"] = true,
						["order"] = 50,
					},
					["indicators"] = {
						["raidTarget"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "C",
							["size"] = 20,
						},
						["lfdRole"] = {
							["y"] = 14,
							["x"] = 3,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "BR",
							["size"] = 14,
						},
						["resurrect"] = {
							["y"] = -1,
							["x"] = 37,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "LC",
							["size"] = 28,
						},
						["masterLoot"] = {
							["y"] = -10,
							["x"] = 16,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "TL",
							["size"] = 12,
						},
						["leader"] = {
							["y"] = -12,
							["x"] = 2,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "TL",
							["size"] = 14,
						},
						["role"] = {
							["y"] = -11,
							["x"] = 30,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "TL",
							["size"] = 14,
						},
						["status"] = {
							["y"] = -2,
							["x"] = 12,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "LB",
							["size"] = 16,
						},
						["pvp"] = {
							["y"] = -21,
							["x"] = 11,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "TR",
							["size"] = 22,
						},
						["height"] = 0.5,
						["ready"] = {
							["y"] = 0,
							["x"] = 35,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "LC",
							["size"] = 24,
						},
					},
					["healAbsorb"] = {
						["height"] = 0.5,
						["cap"] = 1,
					},
					["runeBar"] = {
						["enabled"] = true,
						["background"] = false,
						["height"] = 0.4,
						["order"] = 70,
					},
					["holyPower"] = {
						["anchorTo"] = "$parent",
						["order"] = 60,
						["showAlways"] = true,
						["growth"] = "LEFT",
						["anchorPoint"] = "BR",
						["x"] = -3,
						["spacing"] = -4,
						["height"] = 0.4,
						["y"] = 6,
						["size"] = 14,
					},
					["soulShards"] = {
						["anchorTo"] = "$parent",
						["order"] = 30,
						["showAlways"] = true,
						["growth"] = "RIGHT",
						["anchorPoint"] = "BR",
						["x"] = -8,
						["spacing"] = -2,
						["height"] = 0.4,
						["background"] = false,
						["y"] = 6,
						["size"] = 12,
					},
					["incAbsorb"] = {
						["height"] = 0.5,
						["cap"] = 1,
					},
					["width"] = 190,
					["height"] = 45,
					["chi"] = {
						["anchorTo"] = "$parent",
						["order"] = 60,
						["showAlways"] = true,
						["growth"] = "LEFT",
						["anchorPoint"] = "BR",
						["x"] = -3,
						["spacing"] = -4,
						["height"] = 0.4,
						["y"] = 6,
						["size"] = 14,
					},
					["fader"] = {
						["inactiveAlpha"] = 0.6,
						["height"] = 0.5,
						["combatAlpha"] = 1,
						["enabled"] = true,
					},
					["combatText"] = {
						["enabled"] = false,
						["height"] = 0.5,
					},
					["incHeal"] = {
						["height"] = 0.5,
						["cap"] = 1,
					},
					["shamanBar"] = {
						["height"] = 0.4,
						["background"] = true,
						["order"] = 70,
					},
					["arcaneCharges"] = {
						["anchorTo"] = "$parent",
						["order"] = 60,
						["showAlways"] = true,
						["growth"] = "LEFT",
						["anchorPoint"] = "BR",
						["x"] = -8,
						["spacing"] = -2,
						["height"] = 0.4,
						["y"] = 6,
						["size"] = 12,
					},
					["emptyBar"] = {
						["order"] = 0,
						["background"] = true,
						["height"] = 1,
						["reactionType"] = "none",
					},
				},
				["mainassist"] = {
					["emptyBar"] = {
						["order"] = 0,
						["background"] = true,
						["height"] = 1,
						["reactionType"] = "none",
					},
					["indicators"] = {
						["raidTarget"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "C",
							["size"] = 20,
						},
						["resurrect"] = {
							["y"] = -1,
							["x"] = 37,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "LC",
							["size"] = 28,
						},
						["masterLoot"] = {
							["y"] = -10,
							["x"] = 16,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "TL",
							["size"] = 12,
						},
						["leader"] = {
							["y"] = -12,
							["x"] = 2,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "TL",
							["size"] = 14,
						},
						["role"] = {
							["y"] = -11,
							["x"] = 30,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "TL",
							["size"] = 14,
						},
						["status"] = {
							["y"] = -2,
							["x"] = 12,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "LB",
							["size"] = 16,
						},
						["pvp"] = {
							["y"] = -21,
							["x"] = 11,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "TR",
							["size"] = 22,
						},
						["class"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "BL",
							["size"] = 16,
						},
						["ready"] = {
							["y"] = 0,
							["x"] = 35,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "LC",
							["size"] = 24,
						},
					},
					["attribAnchorPoint"] = "LEFT",
					["auras"] = {
						["buffs"] = {
							["anchorPoint"] = "BL",
							["y"] = 0,
							["x"] = 0,
							["size"] = 16,
						},
						["debuffs"] = {
							["anchorPoint"] = "BL",
							["y"] = 0,
							["x"] = 0,
							["size"] = 16,
						},
					},
					["castBar"] = {
						["time"] = {
							["enabled"] = true,
							["x"] = -1,
							["anchorTo"] = "$parent",
							["y"] = 0,
							["anchorPoint"] = "CRI",
							["size"] = 0,
						},
						["order"] = 60,
						["height"] = 0.6,
						["background"] = true,
						["icon"] = "HIDE",
						["name"] = {
							["y"] = 0,
							["x"] = 1,
							["anchorTo"] = "$parent",
							["rank"] = true,
							["anchorPoint"] = "CLI",
							["enabled"] = true,
							["size"] = 0,
						},
					},
					["height"] = 40,
					["highlight"] = {
						["size"] = 10,
					},
					["incAbsorb"] = {
						["cap"] = 1,
					},
					["powerBar"] = {
						["colorType"] = "type",
						["order"] = 20,
						["background"] = true,
						["height"] = 1,
					},
					["offset"] = 5,
					["healthBar"] = {
						["colorType"] = "class",
						["order"] = 10,
						["background"] = true,
						["reactionType"] = "npc",
						["height"] = 1.2,
					},
					["columnSpacing"] = 5,
					["text"] = {
						{
							["text"] = "[(()afk() )][name]",
						}, -- [1]
						[3] = {
							["text"] = "[level( )][perpp]",
						},
						[5] = {
							["text"] = "[(()afk() )][name]",
						},
					},
					["unitsPerColumn"] = 5,
					["width"] = 150,
					["maxColumns"] = 1,
					["altPowerBar"] = {
						["height"] = 0.4,
						["background"] = true,
						["order"] = 100,
					},
					["incHeal"] = {
						["cap"] = 1,
					},
					["healAbsorb"] = {
						["cap"] = 1,
					},
					["portrait"] = {
						["type"] = "3D",
						["alignment"] = "LEFT",
						["fullAfter"] = 50,
						["height"] = 0.5,
						["fullBefore"] = 0,
						["order"] = 15,
						["width"] = 0.22,
					},
				},
				["pettarget"] = {
					["text"] = {
						[3] = {
							["text"] = "[perpp]",
						},
						[5] = {
							["text"] = "[name]",
						},
					},
					["portrait"] = {
						["type"] = "3D",
						["alignment"] = "LEFT",
						["fullAfter"] = 100,
						["height"] = 0.5,
						["fullBefore"] = 0,
						["order"] = 15,
						["width"] = 0.22,
					},
					["healthBar"] = {
						["colorType"] = "class",
						["order"] = 10,
						["background"] = true,
						["reactionType"] = "npc",
						["height"] = 1.2,
					},
					["emptyBar"] = {
						["order"] = 0,
						["background"] = true,
						["height"] = 1,
						["reactionType"] = "none",
					},
					["auras"] = {
						["buffs"] = {
							["anchorPoint"] = "BL",
							["y"] = 0,
							["x"] = 0,
							["size"] = 16,
						},
						["debuffs"] = {
							["anchorPoint"] = "BL",
							["y"] = 0,
							["x"] = 0,
							["size"] = 16,
						},
					},
					["castBar"] = {
						["time"] = {
							["enabled"] = true,
							["x"] = -1,
							["anchorTo"] = "$parent",
							["y"] = 0,
							["anchorPoint"] = "CRI",
							["size"] = 0,
						},
						["order"] = 40,
						["height"] = 0.6,
						["background"] = true,
						["icon"] = "HIDE",
						["name"] = {
							["y"] = 0,
							["x"] = 1,
							["anchorTo"] = "$parent",
							["rank"] = true,
							["anchorPoint"] = "CLI",
							["enabled"] = true,
							["size"] = 0,
						},
					},
					["indicators"] = {
						["raidTarget"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "C",
							["size"] = 20,
						},
					},
					["altPowerBar"] = {
						["height"] = 0.4,
						["background"] = true,
						["order"] = 100,
					},
					["width"] = 190,
					["height"] = 30,
					["powerBar"] = {
						["colorType"] = "type",
						["order"] = 20,
						["background"] = true,
						["height"] = 0.7,
					},
					["highlight"] = {
						["size"] = 10,
					},
				},
				["battlegroundpet"] = {
					["indicators"] = {
						["raidTarget"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "C",
							["size"] = 20,
						},
					},
					["auras"] = {
						["buffs"] = {
							["anchorPoint"] = "BL",
							["y"] = 0,
							["x"] = 0,
							["size"] = 16,
						},
						["debuffs"] = {
							["anchorPoint"] = "BL",
							["y"] = 0,
							["x"] = 0,
							["size"] = 16,
						},
					},
					["castBar"] = {
						["time"] = {
							["enabled"] = true,
							["x"] = -1,
							["anchorTo"] = "$parent",
							["y"] = 0,
							["anchorPoint"] = "CRI",
							["size"] = 0,
						},
						["order"] = 40,
						["height"] = 0.6,
						["background"] = true,
						["icon"] = "HIDE",
						["name"] = {
							["y"] = 0,
							["x"] = 1,
							["anchorTo"] = "$parent",
							["rank"] = true,
							["anchorPoint"] = "CLI",
							["enabled"] = true,
							["size"] = 0,
						},
					},
					["powerBar"] = {
						["colorType"] = "type",
						["order"] = 20,
						["background"] = true,
						["height"] = 0.6,
					},
					["healthBar"] = {
						["colorType"] = "class",
						["order"] = 10,
						["background"] = true,
						["reactionType"] = "npc",
						["height"] = 1.2,
					},
					["text"] = {
						nil, -- [1]
						{
							["text"] = "[curhp]",
						}, -- [2]
						{
							["text"] = "",
						}, -- [3]
						{
							["text"] = "",
						}, -- [4]
						{
							["text"] = "[name]",
						}, -- [5]
					},
					["width"] = 90,
					["altPowerBar"] = {
						["height"] = 0.4,
						["background"] = true,
						["order"] = 100,
					},
					["height"] = 25,
					["highlight"] = {
						["size"] = 10,
					},
					["portrait"] = {
						["type"] = "3D",
						["alignment"] = "LEFT",
						["fullAfter"] = 100,
						["height"] = 0.5,
						["fullBefore"] = 0,
						["order"] = 15,
						["width"] = 0.22,
					},
					["emptyBar"] = {
						["order"] = 0,
						["background"] = true,
						["height"] = 1,
						["reactionType"] = "none",
					},
				},
				["arena"] = {
					["highlight"] = {
						["height"] = 0.5,
						["size"] = 10,
					},
					["range"] = {
						["height"] = 0.5,
					},
					["auras"] = {
						["height"] = 0.5,
						["debuffs"] = {
							["enabled"] = true,
							["anchorPoint"] = "BL",
							["perRow"] = 9,
							["x"] = 0,
							["y"] = 0,
							["size"] = 16,
						},
						["buffs"] = {
							["enabled"] = true,
							["anchorPoint"] = "BL",
							["perRow"] = 9,
							["x"] = 0,
							["y"] = 0,
							["size"] = 16,
						},
					},
					["castBar"] = {
						["time"] = {
							["enabled"] = true,
							["x"] = -1,
							["anchorTo"] = "$parent",
							["y"] = 0,
							["anchorPoint"] = "CRI",
							["size"] = 0,
						},
						["order"] = 60,
						["height"] = 0.6,
						["background"] = true,
						["icon"] = "HIDE",
						["name"] = {
							["y"] = 0,
							["x"] = 1,
							["anchorTo"] = "$parent",
							["rank"] = true,
							["anchorPoint"] = "CLI",
							["enabled"] = true,
							["size"] = 0,
						},
					},
					["auraIndicators"] = {
						["height"] = 0.5,
					},
					["powerBar"] = {
						["colorType"] = "type",
						["order"] = 20,
						["background"] = true,
						["height"] = 1,
					},
					["offset"] = 25,
					["healthBar"] = {
						["colorType"] = "class",
						["order"] = 10,
						["background"] = true,
						["reactionType"] = "npc",
						["height"] = 1.2,
					},
					["text"] = {
						[3] = {
							["text"] = "[perpp]",
						},
						[5] = {
							["text"] = "[name]",
						},
					},
					["emptyBar"] = {
						["order"] = 0,
						["background"] = true,
						["height"] = 1,
						["reactionType"] = "none",
					},
					["width"] = 170,
					["altPowerBar"] = {
						["height"] = 0.4,
						["background"] = true,
						["order"] = 100,
					},
					["combatText"] = {
						["height"] = 0.5,
					},
					["height"] = 45,
					["indicators"] = {
						["arenaSpec"] = {
							["anchorTo"] = "$parent",
							["anchorPoint"] = "LC",
							["size"] = 28,
						},
						["lfdRole"] = {
							["y"] = 14,
							["x"] = 3,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "BR",
							["size"] = 14,
						},
						["height"] = 0.5,
						["class"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "BL",
							["size"] = 16,
						},
						["raidTarget"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "C",
							["size"] = 20,
						},
					},
					["portrait"] = {
						["enabled"] = true,
						["type"] = "class",
						["alignment"] = "LEFT",
						["fullAfter"] = 50,
						["height"] = 0.5,
						["fullBefore"] = 0,
						["order"] = 15,
						["width"] = 0.22,
					},
				},
				["partytargettarget"] = {
					["text"] = {
						nil, -- [1]
						{
							["text"] = "[curhp]",
						}, -- [2]
						{
							["text"] = "",
						}, -- [3]
						{
							["text"] = "",
						}, -- [4]
						{
							["text"] = "[name]",
						}, -- [5]
					},
					["portrait"] = {
						["type"] = "3D",
						["alignment"] = "LEFT",
						["fullAfter"] = 100,
						["height"] = 0.5,
						["fullBefore"] = 0,
						["order"] = 15,
						["width"] = 0.22,
					},
					["healthBar"] = {
						["colorType"] = "class",
						["order"] = 10,
						["background"] = true,
						["reactionType"] = "npc",
						["height"] = 1.2,
					},
					["emptyBar"] = {
						["order"] = 0,
						["background"] = true,
						["height"] = 1,
						["reactionType"] = "none",
					},
					["auras"] = {
						["buffs"] = {
							["anchorPoint"] = "BL",
							["y"] = 0,
							["x"] = 0,
							["size"] = 16,
						},
						["debuffs"] = {
							["anchorPoint"] = "BL",
							["y"] = 0,
							["x"] = 0,
							["size"] = 16,
						},
					},
					["castBar"] = {
						["time"] = {
							["enabled"] = true,
							["x"] = -1,
							["anchorTo"] = "$parent",
							["y"] = 0,
							["anchorPoint"] = "CRI",
							["size"] = 0,
						},
						["order"] = 40,
						["height"] = 0.6,
						["background"] = true,
						["icon"] = "HIDE",
						["name"] = {
							["y"] = 0,
							["x"] = 1,
							["anchorTo"] = "$parent",
							["rank"] = true,
							["anchorPoint"] = "CLI",
							["enabled"] = true,
							["size"] = 0,
						},
					},
					["indicators"] = {
						["raidTarget"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "C",
							["size"] = 20,
						},
						["class"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "BL",
							["size"] = 16,
						},
					},
					["altPowerBar"] = {
						["height"] = 0.4,
						["background"] = true,
						["order"] = 100,
					},
					["width"] = 90,
					["height"] = 25,
					["powerBar"] = {
						["colorType"] = "type",
						["order"] = 20,
						["background"] = true,
						["height"] = 0.6,
					},
					["highlight"] = {
						["size"] = 10,
					},
				},
				["battleground"] = {
					["indicators"] = {
						["raidTarget"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "C",
							["size"] = 20,
						},
						["class"] = {
							["y"] = 0,
							["x"] = 0,
							["anchorTo"] = "$parent",
							["anchorPoint"] = "BL",
							["size"] = 16,
						},
						["height"] = 0.5,
						["pvp"] = {
							["anchorPoint"] = "BL",
							["x"] = 0,
							["anchorTo"] = "$parent",
							["y"] = 11,
							["size"] = 22,
						},
					},
					["range"] = {
						["height"] = 0.5,
					},
					["auras"] = {
						["height"] = 0.5,
						["debuffs"] = {
							["anchorPoint"] = "BL",
							["perRow"] = 9,
							["x"] = 0,
							["y"] = 0,
							["size"] = 16,
						},
						["buffs"] = {
							["perRow"] = 9,
							["y"] = 0,
							["anchorPoint"] = "BL",
							["x"] = 0,
							["size"] = 16,
						},
					},
					["castBar"] = {
						["time"] = {
							["enabled"] = true,
							["x"] = -1,
							["anchorTo"] = "$parent",
							["y"] = 0,
							["anchorPoint"] = "CRI",
							["size"] = 0,
						},
						["order"] = 60,
						["height"] = 0.6,
						["background"] = true,
						["icon"] = "HIDE",
						["name"] = {
							["y"] = 0,
							["x"] = 1,
							["anchorTo"] = "$parent",
							["rank"] = true,
							["anchorPoint"] = "CLI",
							["enabled"] = true,
							["size"] = 0,
						},
					},
					["auraIndicators"] = {
						["height"] = 0.5,
					},
					["powerBar"] = {
						["colorType"] = "type",
						["order"] = 20,
						["background"] = true,
						["height"] = 0.5,
					},
					["healthBar"] = {
						["colorType"] = "class",
						["order"] = 10,
						["background"] = true,
						["reactionType"] = "npc",
						["height"] = 1.2,
					},
					["text"] = {
						nil, -- [1]
						nil, -- [2]
						{
							["text"] = "",
						}, -- [3]
						{
							["text"] = "",
						}, -- [4]
						{
							["text"] = "[name]",
						}, -- [5]
					},
					["portrait"] = {
						["type"] = "class",
						["alignment"] = "LEFT",
						["fullAfter"] = 50,
						["height"] = 0.5,
						["fullBefore"] = 0,
						["order"] = 15,
						["width"] = 0.22,
					},
					["width"] = 140,
					["altPowerBar"] = {
						["height"] = 0.4,
						["background"] = true,
						["order"] = 100,
					},
					["combatText"] = {
						["height"] = 0.5,
					},
					["height"] = 35,
					["emptyBar"] = {
						["order"] = 0,
						["background"] = true,
						["height"] = 1,
						["reactionType"] = "none",
					},
					["highlight"] = {
						["height"] = 0.5,
						["size"] = 10,
					},
				},
			},
			["font"] = {
				["shadowColor"] = {
					["a"] = 1,
					["b"] = 0,
					["g"] = 0,
					["r"] = 0,
				},
				["name"] = "默认",
				["extra"] = "",
				["shadowX"] = 0.8,
				["shadowY"] = -0.8,
				["color"] = {
					["a"] = 1,
					["b"] = 1,
					["g"] = 1,
					["r"] = 1,
				},
				["size"] = 11,
			},
			["classColors"] = {
				["HUNTER"] = {
					["b"] = 0.45,
					["g"] = 0.83,
					["r"] = 0.67,
				},
				["WARRIOR"] = {
					["b"] = 0.43,
					["g"] = 0.61,
					["r"] = 0.78,
				},
				["PALADIN"] = {
					["b"] = 0.73,
					["g"] = 0.55,
					["r"] = 0.96,
				},
				["MAGE"] = {
					["b"] = 0.94,
					["g"] = 0.8,
					["r"] = 0.41,
				},
				["VEHICLE"] = {
					["b"] = 0.23,
					["g"] = 0.41,
					["r"] = 0.23,
				},
				["PRIEST"] = {
					["b"] = 1,
					["g"] = 1,
					["r"] = 1,
				},
				["DEATHKNIGHT"] = {
					["b"] = 0.23,
					["g"] = 0.12,
					["r"] = 0.77,
				},
				["SHAMAN"] = {
					["b"] = 1,
					["g"] = 0.35,
					["r"] = 0.14,
				},
				["WARLOCK"] = {
					["b"] = 0.79,
					["g"] = 0.51,
					["r"] = 0.58,
				},
				["DEMONHUNTER"] = {
					["b"] = 0.79,
					["g"] = 0.19,
					["r"] = 0.64,
				},
				["PET"] = {
					["b"] = 0.2,
					["g"] = 0.9,
					["r"] = 0.2,
				},
				["DRUID"] = {
					["b"] = 0.04,
					["g"] = 0.49,
					["r"] = 1,
				},
				["MONK"] = {
					["b"] = 0.59,
					["g"] = 1,
					["r"] = 0,
				},
				["ROGUE"] = {
					["b"] = 0.41,
					["g"] = 0.96,
					["r"] = 1,
				},
			},
			["wowBuild"] = 80000,
			["bars"] = {
				["spacing"] = -1.25,
				["backgroundAlpha"] = 0.2,
				["alpha"] = 1,
				["texture"] = "DGround",
			},
			["auraColors"] = {
				["removable"] = {
					["b"] = 1,
					["g"] = 1,
					["r"] = 1,
				},
			},
		},
	},
}
