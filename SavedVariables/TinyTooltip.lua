
TinyTooltipDB = {
	["AppendLevelToName"] = false,
	["guild"] = {
		["Rank"] = "|cffCC88FF(%s:%s)|r",
		["Guild"] = "|cffFF00FF<%.36s>|r",
		["Realm"] = "|cff00CCCC%s|r",
	},
	["DynamicStatusBarColor"] = false,
	["Scale"] = 1,
	["npc"] = {
		["Elite"] = "|cffffff33(%s)|r",
		["Boss"] = "|cffff0000(%s)|r",
		["Reaction"] = "|cff33ffff<%s>|r",
		["Title"] = "|cff99E8E8<%s>|r",
		["Friendly"] = "|cff99ff66%1|r",
		["Rare"] = "|cffffaaff(%s)|r",
	},
	["BorderSize"] = 1,
	["UseMouseAnchor"] = false,
	["ShowTarget"] = true,
	["OriginalInCombat"] = true,
	["StaticPosition"] = false,
	["ShowAngularBorder"] = true,
	["AnchorCursorRight"] = true,
	["Alpha"] = 0.9,
	["OnlyMouseoverUnit"] = true,
	["HPHeight"] = 12,
	["StatusBarText"] = true,
	["version"] = 1.3,
	["name"] = {
		["DND"] = "|cffFFD200(%s)|r",
		["OFFLINE"] = "|cff999999(%s)|r",
		["PVPIcon"] = true,
		["Race"] = "|cffcccccc%s|r",
		["Title"] = "|cffCCFFFF%s|r",
		["ClassIcon"] = true,
		["Realm"] = "|cff00EEEE%s|r",
		["FactionIcon"] = true,
		["Class"] = "|cffffffff%s|r",
		["AFK"] = "|cffFFD200(%s)|r",
	},
	["ShowColoredItemBorder"] = false,
	["ShowStatusBar"] = true,
	["DisplayStyleMask"] = true,
	["ShowColoredClassBorder"] = true,
}
BigTipDB = {
	["spell"] = {
		["background"] = {
			0, -- [1]
			0, -- [2]
			0, -- [3]
			0.8, -- [4]
		},
		["borderColor"] = {
			0.6, -- [1]
			0.6, -- [2]
			0.6, -- [3]
			0.8, -- [4]
		},
	},
	["general"] = {
		["alwaysShowIdInfo"] = false,
		["statusbarColor"] = "auto",
		["statusbarFontSize"] = 4,
		["scale"] = 1,
		["statusbarOffsetY"] = 0,
		["mask"] = true,
		["statusbarText"] = true,
		["borderCorner"] = "default",
		["statusbarHeight"] = 12,
		["borderColor"] = {
			0.6, -- [1]
			0.6, -- [2]
			0.6, -- [3]
			0.8, -- [4]
		},
		["anchor"] = {
			["returnOnUnitFrame"] = false,
			["position"] = "cursorRight",
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
		["borderSize"] = 1,
		["statusbarPosition"] = "bottom",
	},
	["version"] = 2,
	["item"] = {
		["coloredItemBorder"] = true,
	},
	["quest"] = {
		["coloredQuestBorder"] = true,
	},
	["unit"] = {
		["player"] = {
			["elements"] = {
				{
					"roleIcon", -- [1]
					"role", -- [2]
					"raidIcon", -- [3]
					"pvpIcon", -- [4]
					"factionIcon", -- [5]
					"classIcon", -- [6]
					"title", -- [7]
					"name", -- [8]
					"realm", -- [9]
					"statusAFK", -- [10]
					"statusDND", -- [11]
					"statusDC", -- [12]
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
			["showModel"] = true,
			["showTargetBy"] = true,
			["coloredBorder"] = "class",
			["showTarget"] = true,
			["background"] = {
				["colorfunc"] = "default",
				["alpha"] = 0.5,
			},
			["anchor"] = {
				["returnOnUnitFrame"] = false,
				["position"] = "inherit",
				["cp"] = "BOTTOM",
				["p"] = "BOTTOMRIGHT",
				["returnInCombat"] = true,
			},
			["grayForDead"] = false,
		},
		["npc"] = {
			["elements"] = {
				{
					"raidIcon", -- [1]
					"classIcon", -- [2]
					"questIcon", -- [3]
					"name", -- [4]
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
