
ElvDB = {
	["profileKeys"] = {
		["Radioedit - 奥蕾莉亚"] = "Radioedit - 奥蕾莉亚",
		["Geronimo - 奥蕾莉亚"] = "Geronimo - 奥蕾莉亚",
	},
	["gold"] = {
		["奥蕾莉亚"] = {
			["Radioedit"] = 1851519151,
			["Geronimo"] = 94963713,
		},
	},
	["namespaces"] = {
		["LibDualSpec-1.0"] = {
		},
	},
	["global"] = {
		["general"] = {
			["autoScale"] = false,
		},
		["uiScale"] = "0.75",
		["dtbars"] = {
			["DTB2_右下角"] = {
				["strata"] = "LOW",
				["point"] = "CENTER",
				["anchor"] = "CENTER",
				["slots"] = 3,
				["hide"] = true,
			},
		},
		["dtbarsSetup"] = {
			["name"] = "右下角",
		},
	},
	["profiles"] = {
		["Geronimo - 奥蕾莉亚"] = {
			["databars"] = {
				["reputation"] = {
					["enable"] = true,
					["height"] = 220,
				},
				["artifact"] = {
					["height"] = 220,
				},
				["experience"] = {
					["enable"] = false,
				},
				["honor"] = {
					["enable"] = false,
				},
			},
			["currentTutorial"] = 4,
			["general"] = {
				["autoRepair"] = "GUILD",
				["bottomPanel"] = false,
				["backdropfadecolor"] = {
					["r"] = 0.054,
					["g"] = 0.054,
					["b"] = 0.054,
				},
				["valuecolor"] = {
					["r"] = 0.09,
					["g"] = 0.513,
					["b"] = 0.819,
				},
				["vendorGrays"] = true,
				["font"] = "默认",
				["numberPrefixStyle"] = "CHINESE",
			},
			["bags"] = {
				["countFontSize"] = 12,
				["itemLevelFont"] = "默认",
				["itemLevelFontSize"] = 12,
				["countFont"] = "默认",
			},
			["hideTutorial"] = true,
			["auras"] = {
				["debuffs"] = {
					["size"] = 50,
				},
				["font"] = "默认",
				["fontSize"] = 12,
			},
			["layoutSet"] = "tank",
			["movers"] = {
				["ElvUF_Raid40Mover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,5,465",
				["PetAB"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,0,-367",
				["ElvUF_RaidMover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,5,461",
				["ElvAB_2"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-510,27",
				["ElvAB_4"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,510,27",
				["AltPowerBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,208",
				["ElvAB_3"] = "BOTTOM,ElvUIParent,BOTTOM,0,50",
				["ElvUF_TargetMover"] = "BOTTOM,ElvUIParent,BOTTOM,316,156",
				["BossButton"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-339,226",
				["DTB2_右下角_Mover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-408,4",
				["ElvUF_RaidpetMover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,5,736",
				["ShiftAB"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,509,151",
				["ElvUF_PlayerCastbarMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,162",
				["ElvUF_FocusMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-449,474",
				["ElvUF_TargetCastbarMover"] = "TOP,ElvUIParent,TOP,0,-192",
				["PlayerPowerBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,182",
				["TotemBarMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,408,4",
				["MicrobarMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-4,371",
				["ElvUF_PlayerMover"] = "BOTTOM,ElvUIParent,BOTTOM,-316,156",
				["ElvUF_PetMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,422,208",
				["ElvUF_PartyMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,5,399",
				["ElvAB_1"] = "BOTTOM,ElvUIParent,BOTTOM,0,5",
				["DebuffsMover"] = "BOTTOM,ElvUIParent,BOTTOM,218,507",
				["ElvUF_TargetTargetMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,102",
			},
			["tooltip"] = {
				["healthBar"] = {
					["font"] = "默认",
				},
				["font"] = "默认",
				["fontSize"] = 12,
			},
			["chat"] = {
				["tabFontOutline"] = "OUTLINE",
				["tabFont"] = "默认",
				["fontOutline"] = "OUTLINE",
				["separateSizes"] = true,
				["panelHeightRight"] = 220,
				["font"] = "默认",
				["tapFontSize"] = 12,
				["panelWidth"] = 400,
				["fontSize"] = 12,
				["panelWidthRight"] = 400,
				["panelHeight"] = 220,
			},
			["unitframe"] = {
				["fontSize"] = 14,
				["smoothbars"] = true,
				["units"] = {
					["party"] = {
						["rdebuffs"] = {
							["font"] = "默认",
						},
					},
					["raid40"] = {
						["rdebuffs"] = {
							["font"] = "默认",
						},
					},
					["raid"] = {
						["rdebuffs"] = {
							["font"] = "默认",
						},
					},
					["player"] = {
						["portrait"] = {
							["overlay"] = true,
							["enable"] = true,
							["camDistanceScale"] = 4,
						},
						["castbar"] = {
							["width"] = 250,
							["height"] = 20,
						},
						["power"] = {
							["height"] = 20,
							["detachFromFrame"] = true,
						},
					},
					["target"] = {
						["portrait"] = {
							["overlay"] = true,
							["enable"] = true,
							["camDistanceScale"] = 4,
						},
						["castbar"] = {
							["width"] = 400,
							["height"] = 40,
						},
					},
				},
				["font"] = "默认",
				["colors"] = {
					["auraBarBuff"] = {
						["r"] = 0.1,
						["g"] = 0.1,
						["b"] = 0.1,
					},
					["castColor"] = {
						["r"] = 0.1,
						["g"] = 0.1,
						["b"] = 0.1,
					},
					["health"] = {
						["r"] = 0.1,
						["g"] = 0.1,
						["b"] = 0.1,
					},
				},
				["fontOutline"] = "OUTLINE",
			},
			["datatexts"] = {
				["font"] = "默认",
			},
			["actionbar"] = {
				["bar3"] = {
					["buttons"] = 12,
					["buttonsPerRow"] = 12,
					["buttonsize"] = 40,
				},
				["fontOutline"] = "OUTLINE",
				["microbar"] = {
					["enabled"] = true,
					["buttonsPerRow"] = 1,
				},
				["backdropSpacingConverted"] = true,
				["bar2"] = {
					["enabled"] = true,
					["buttonsPerRow"] = 6,
					["buttonsize"] = 30,
				},
				["bar1"] = {
					["buttonsize"] = 40,
				},
				["bar5"] = {
					["enabled"] = false,
				},
				["font"] = "默认",
				["bar4"] = {
					["point"] = "BOTTOMLEFT",
					["backdrop"] = false,
					["buttonsPerRow"] = 6,
					["buttonsize"] = 30,
				},
			},
			["dtbars"] = {
				["DTB2_右下角"] = {
					["height"] = 22,
					["mouseover"] = false,
					["transparent"] = true,
					["enable"] = true,
					["pethide"] = true,
					["growth"] = "HORIZONTAL",
					["width"] = 300,
				},
			},
			["nameplates"] = {
				["fontSize"] = 14,
				["fontOutline"] = "OUTLINE",
				["targetcount"] = true,
				["units"] = {
					["ENEMY_NPC"] = {
						["debuffs"] = {
							["baseHeight"] = 20,
							["numAuras"] = 6,
						},
						["healthbar"] = {
							["text"] = {
								["enable"] = true,
								["format"] = "CURRENT_PERCENT",
							},
						},
						["powerbar"] = {
							["enable"] = true,
						},
						["eliteIcon"] = {
							["enable"] = true,
						},
					},
				},
				["font"] = "默认",
				["clampToScreen"] = true,
			},
		},
		["Minimalistic"] = {
			["currentTutorial"] = 2,
			["general"] = {
				["font"] = "Expressway",
				["bottomPanel"] = false,
				["backdropfadecolor"] = {
					["a"] = 0.80000001192093,
					["b"] = 0.058823529411765,
					["g"] = 0.058823529411765,
					["r"] = 0.058823529411765,
				},
				["reputation"] = {
					["orientation"] = "HORIZONTAL",
					["textFormat"] = "PERCENT",
					["height"] = 16,
					["width"] = 200,
				},
				["bordercolor"] = {
					["b"] = 0.30588235294118,
					["g"] = 0.30588235294118,
					["r"] = 0.30588235294118,
				},
				["fontSize"] = 11,
				["valuecolor"] = {
					["a"] = 1,
					["b"] = 1,
					["g"] = 1,
					["r"] = 1,
				},
			},
			["movers"] = {
				["PetAB"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-50,-428",
				["ElvUF_RaidMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,51,120",
				["LeftChatMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,50,50",
				["GMMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,250,-50",
				["BossButton"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-117,-298",
				["LootFrameMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,249,-216",
				["ElvUF_RaidpetMover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,50,827",
				["MicrobarMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,4,-52",
				["VehicleSeatMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,51,-87",
				["ElvUF_TargetTargetMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,143",
				["ElvUF_Raid40Mover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,392,1073",
				["ElvAB_1"] = "BOTTOM,ElvUIParent,BOTTOM,0,50",
				["ElvAB_2"] = "BOTTOM,ElvUIParent,BOTTOM,0,90",
				["ElvAB_4"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-50,-394",
				["AltPowerBarMover"] = "TOP,ElvUIParent,TOP,0,-186",
				["ElvAB_3"] = "BOTTOM,ElvUIParent,BOTTOM,305,50",
				["ElvAB_5"] = "BOTTOM,ElvUIParent,BOTTOM,-305,50",
				["ElvUF_AssistMover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,51,937",
				["ReputationBarMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-50,-228",
				["ObjectiveFrameMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-122,-393",
				["BNETMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,50,232",
				["ShiftAB"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,50,1150",
				["ElvUF_PlayerCastbarMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,133",
				["RightChatMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-50,50",
				["ElvAB_6"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-488,330",
				["TooltipMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-50,50",
				["ElvUF_TankMover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,50,995",
				["ElvUF_PetMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,200",
				["ElvUF_PlayerMover"] = "BOTTOM,ElvUIParent,BOTTOM,-230,140",
				["TotemBarMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,463,50",
				["ElvUF_PartyMover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,184,773",
				["AlertFrameMover"] = "TOP,ElvUIParent,TOP,0,-50",
				["ElvUF_TargetMover"] = "BOTTOM,ElvUIParent,BOTTOM,230,140",
				["MinimapMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-50,-50",
			},
			["bossAuraFiltersConverted"] = true,
			["hideTutorial"] = true,
			["auras"] = {
				["font"] = "Expressway",
				["fontSize"] = 11,
				["buffs"] = {
					["maxWraps"] = 2,
				},
			},
			["layoutSet"] = "dpsMelee",
			["unitframe"] = {
				["statusbar"] = "ElvUI Blank",
				["fontOutline"] = "THICKOUTLINE",
				["smoothbars"] = true,
				["fontSize"] = 9,
				["font"] = "Expressway",
				["units"] = {
					["tank"] = {
						["enable"] = false,
					},
					["targettarget"] = {
						["infoPanel"] = {
							["enable"] = true,
						},
						["debuffs"] = {
							["enable"] = false,
						},
						["name"] = {
							["attachTextTo"] = "InfoPanel",
							["position"] = "TOP",
							["yOffset"] = -2,
						},
						["height"] = 50,
						["width"] = 122,
					},
					["target"] = {
						["debuffs"] = {
							["perrow"] = 7,
						},
						["power"] = {
							["attachTextTo"] = "InfoPanel",
							["hideonnpc"] = false,
							["text_format"] = "[powercolor][power:current-max]",
							["height"] = 15,
						},
						["infoPanel"] = {
							["enable"] = true,
						},
						["name"] = {
							["attachTextTo"] = "InfoPanel",
							["text_format"] = "[namecolor][name]",
						},
						["health"] = {
							["attachTextTo"] = "InfoPanel",
							["text_format"] = "[healthcolor][health:current-max]",
						},
						["height"] = 80,
						["buffs"] = {
							["perrow"] = 7,
						},
						["smartAuraPosition"] = "DEBUFFS_ON_BUFFS",
						["castbar"] = {
							["iconSize"] = 54,
							["iconAttached"] = false,
						},
					},
					["raid"] = {
						["roleIcon"] = {
							["position"] = "RIGHT",
						},
						["debuffs"] = {
							["enable"] = true,
							["sizeOverride"] = 27,
							["perrow"] = 4,
						},
						["rdebuffs"] = {
							["enable"] = false,
							["font"] = "Expressway",
						},
						["growthDirection"] = "UP_RIGHT",
						["health"] = {
							["yOffset"] = -6,
						},
						["groupsPerRowCol"] = 5,
						["height"] = 28,
						["name"] = {
							["position"] = "LEFT",
						},
						["visibility"] = "[nogroup] hide;show",
						["width"] = 140,
					},
					["player"] = {
						["debuffs"] = {
							["perrow"] = 7,
						},
						["power"] = {
							["attachTextTo"] = "InfoPanel",
							["text_format"] = "[powercolor][power:current-max]",
							["height"] = 15,
						},
						["combatfade"] = true,
						["infoPanel"] = {
							["enable"] = true,
						},
						["health"] = {
							["attachTextTo"] = "InfoPanel",
							["text_format"] = "[healthcolor][health:current-max]",
						},
						["height"] = 80,
						["name"] = {
							["attachTextTo"] = "InfoPanel",
							["text_format"] = "[namecolor][name]",
						},
						["classbar"] = {
							["height"] = 15,
							["autoHide"] = true,
						},
						["castbar"] = {
							["iconAttached"] = false,
							["iconSize"] = 54,
							["height"] = 35,
							["width"] = 478,
						},
					},
					["raid40"] = {
						["enable"] = false,
						["rdebuffs"] = {
							["font"] = "Expressway",
						},
					},
					["focus"] = {
						["infoPanel"] = {
							["height"] = 17,
							["enable"] = true,
						},
						["threatStyle"] = "NONE",
						["castbar"] = {
							["iconSize"] = 26,
							["width"] = 122,
						},
						["height"] = 56,
						["name"] = {
							["attachTextTo"] = "InfoPanel",
							["position"] = "LEFT",
						},
						["health"] = {
							["attachTextTo"] = "InfoPanel",
							["text_format"] = "[healthcolor][health:current]",
						},
						["width"] = 189,
					},
					["assist"] = {
						["enable"] = false,
					},
					["arena"] = {
						["spacing"] = 26,
						["castbar"] = {
							["width"] = 246,
						},
					},
					["party"] = {
						["horizontalSpacing"] = 3,
						["debuffs"] = {
							["numrows"] = 4,
							["anchorPoint"] = "BOTTOM",
							["perrow"] = 1,
						},
						["power"] = {
							["text_format"] = "",
							["height"] = 5,
						},
						["enable"] = false,
						["rdebuffs"] = {
							["font"] = "Expressway",
						},
						["growthDirection"] = "RIGHT_DOWN",
						["infoPanel"] = {
							["enable"] = true,
						},
						["width"] = 110,
						["health"] = {
							["attachTextTo"] = "InfoPanel",
							["orientation"] = "VERTICAL",
							["text_format"] = "[healthcolor][health:current]",
							["position"] = "RIGHT",
						},
						["name"] = {
							["attachTextTo"] = "InfoPanel",
							["text_format"] = "[namecolor][name:short]",
							["position"] = "LEFT",
						},
						["height"] = 59,
						["verticalSpacing"] = 0,
						["healPrediction"] = true,
						["roleIcon"] = {
							["position"] = "TOPRIGHT",
						},
					},
					["pet"] = {
						["infoPanel"] = {
							["enable"] = true,
							["height"] = 14,
						},
						["debuffs"] = {
							["enable"] = true,
						},
						["threatStyle"] = "NONE",
						["castbar"] = {
							["width"] = 122,
						},
						["height"] = 50,
						["portrait"] = {
							["camDistanceScale"] = 2,
						},
						["width"] = 122,
					},
				},
			},
			["datatexts"] = {
				["minimapPanels"] = false,
				["fontSize"] = 11,
				["panelTransparency"] = true,
				["goldFormat"] = "SHORT",
				["leftChatPanel"] = false,
				["font"] = "Expressway",
				["panels"] = {
					["BottomMiniPanel"] = "Time",
					["RightMiniPanel"] = "",
					["RightChatDataPanel"] = {
						["right"] = "",
						["left"] = "",
						["middle"] = "",
					},
					["LeftMiniPanel"] = "",
					["LeftChatDataPanel"] = {
						["right"] = "",
						["left"] = "",
						["middle"] = "",
					},
				},
				["rightChatPanel"] = false,
			},
			["actionbar"] = {
				["bar3"] = {
					["inheritGlobalFade"] = true,
					["buttonsize"] = 38,
					["buttonsPerRow"] = 3,
				},
				["fontSize"] = 9,
				["bar2"] = {
					["enabled"] = true,
					["inheritGlobalFade"] = true,
					["buttonsize"] = 38,
				},
				["bar1"] = {
					["heightMult"] = 2,
					["inheritGlobalFade"] = true,
					["buttonsize"] = 38,
				},
				["bar5"] = {
					["inheritGlobalFade"] = true,
					["buttonsize"] = 38,
					["buttonsPerRow"] = 3,
				},
				["globalFadeAlpha"] = 0.87,
				["stanceBar"] = {
					["inheritGlobalFade"] = true,
				},
				["bar6"] = {
					["buttonsize"] = 38,
				},
				["bar4"] = {
					["enabled"] = false,
					["backdrop"] = false,
					["buttonsize"] = 38,
				},
			},
			["dtbars"] = {
				["DTB2_右下角"] = {
					["transparent"] = false,
					["enable"] = true,
					["pethide"] = true,
					["growth"] = "HORIZONTAL",
					["width"] = 300,
				},
			},
			["tooltip"] = {
				["textFontSize"] = 11,
				["font"] = "Expressway",
				["healthBar"] = {
					["font"] = "Expressway",
				},
				["headerFontSize"] = 11,
				["fontSize"] = 11,
				["smallTextFontSize"] = 11,
			},
			["chat"] = {
				["chatHistory"] = false,
				["fontSize"] = 11,
				["tabFont"] = "Expressway",
				["fadeUndockedTabs"] = false,
				["editBoxPosition"] = "ABOVE_CHAT",
				["fadeTabsNoBackdrop"] = false,
				["font"] = "Expressway",
				["tapFontSize"] = 11,
				["panelBackdrop"] = "HIDEBOTH",
			},
			["bags"] = {
				["itemLevelFontSize"] = 9,
				["countFontSize"] = 9,
			},
		},
		["Radioedit - 奥蕾莉亚"] = {
			["databars"] = {
				["artifact"] = {
					["height"] = 220,
				},
				["reputation"] = {
					["enable"] = true,
					["height"] = 220,
				},
				["experience"] = {
					["enable"] = false,
				},
				["honor"] = {
					["enable"] = false,
				},
			},
			["currentTutorial"] = 4,
			["general"] = {
				["font"] = "默认",
				["bottomPanel"] = false,
				["backdropfadecolor"] = {
					["r"] = 0.054,
					["g"] = 0.054,
					["b"] = 0.054,
				},
				["valuecolor"] = {
					["r"] = 0.09,
					["g"] = 0.513,
					["b"] = 0.819,
				},
				["vendorGrays"] = true,
				["autoRepair"] = "GUILD",
				["numberPrefixStyle"] = "CHINESE",
			},
			["movers"] = {
				["ElvUF_Raid40Mover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,5,465",
				["PetAB"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,0,-367",
				["ElvUF_RaidMover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,5,461",
				["ElvAB_2"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-510,27",
				["ElvAB_4"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,510,27",
				["AltPowerBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,208",
				["BossButton"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-339,226",
				["ElvUF_TargetTargetMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,102",
				["ElvAB_3"] = "BOTTOM,ElvUIParent,BOTTOM,0,50",
				["DTB2_右下角_Mover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-408,4",
				["ElvUF_RaidpetMover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,5,736",
				["ShiftAB"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,509,151",
				["ElvAB_1"] = "BOTTOM,ElvUIParent,BOTTOM,0,5",
				["ElvUF_FocusMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-449,474",
				["ElvUF_TargetCastbarMover"] = "TOP,ElvUIParent,TOP,0,-192",
				["TotemBarMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,408,4",
				["ElvUF_PetMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,422,208",
				["MicrobarMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-4,371",
				["PlayerPowerBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,182",
				["ElvUF_PlayerMover"] = "BOTTOM,ElvUIParent,BOTTOM,-316,156",
				["ElvUF_PartyMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,5,399",
				["ElvUF_PlayerCastbarMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,162",
				["DebuffsMover"] = "BOTTOM,ElvUIParent,BOTTOM,218,507",
				["ElvUF_TargetMover"] = "BOTTOM,ElvUIParent,BOTTOM,316,156",
			},
			["bags"] = {
				["countFontSize"] = 12,
				["countFont"] = "默认",
				["itemLevelFont"] = "默认",
				["itemLevelFontSize"] = 12,
			},
			["hideTutorial"] = true,
			["auras"] = {
				["fontSize"] = 12,
				["font"] = "默认",
				["debuffs"] = {
					["size"] = 50,
				},
			},
			["tooltip"] = {
				["font"] = "默认",
				["healthBar"] = {
					["font"] = "默认",
				},
				["fontSize"] = 12,
			},
			["unitframe"] = {
				["fontSize"] = 14,
				["colors"] = {
					["castColor"] = {
						["r"] = 0.1,
						["g"] = 0.1,
						["b"] = 0.1,
					},
					["auraBarBuff"] = {
						["r"] = 0.1,
						["g"] = 0.1,
						["b"] = 0.1,
					},
					["health"] = {
						["r"] = 0.1,
						["g"] = 0.1,
						["b"] = 0.1,
					},
				},
				["fontOutline"] = "OUTLINE",
				["font"] = "默认",
				["smoothbars"] = true,
				["units"] = {
					["player"] = {
						["castbar"] = {
							["height"] = 20,
							["width"] = 250,
						},
						["portrait"] = {
							["overlay"] = true,
							["camDistanceScale"] = 4,
							["enable"] = true,
						},
						["power"] = {
							["height"] = 20,
							["detachFromFrame"] = true,
						},
					},
					["raid40"] = {
						["rdebuffs"] = {
							["font"] = "默认",
						},
					},
					["target"] = {
						["portrait"] = {
							["overlay"] = true,
							["camDistanceScale"] = 4,
							["enable"] = true,
						},
						["castbar"] = {
							["height"] = 40,
							["width"] = 400,
						},
					},
					["raid"] = {
						["rdebuffs"] = {
							["font"] = "默认",
						},
					},
					["party"] = {
						["rdebuffs"] = {
							["font"] = "默认",
						},
					},
				},
			},
			["datatexts"] = {
				["font"] = "默认",
			},
			["actionbar"] = {
				["bar3"] = {
					["buttonsPerRow"] = 12,
					["buttonsize"] = 40,
					["buttons"] = 12,
				},
				["bar2"] = {
					["enabled"] = true,
					["buttonsPerRow"] = 6,
					["buttonsize"] = 30,
				},
				["bar1"] = {
					["buttonsize"] = 40,
				},
				["bar5"] = {
					["enabled"] = false,
				},
				["font"] = "默认",
				["fontOutline"] = "OUTLINE",
				["backdropSpacingConverted"] = true,
				["microbar"] = {
					["enabled"] = true,
					["buttonsPerRow"] = 1,
				},
				["bar4"] = {
					["backdrop"] = false,
					["buttonsPerRow"] = 6,
					["buttonsize"] = 30,
					["point"] = "BOTTOMLEFT",
				},
			},
			["dtbars"] = {
				["DTB2_右下角"] = {
					["height"] = 22,
					["growth"] = "HORIZONTAL",
					["transparent"] = true,
					["enable"] = true,
					["pethide"] = true,
					["mouseover"] = false,
					["width"] = 300,
				},
			},
			["chat"] = {
				["fontSize"] = 12,
				["tabFontOutline"] = "OUTLINE",
				["tabFont"] = "默认",
				["separateSizes"] = true,
				["panelHeightRight"] = 220,
				["font"] = "默认",
				["fontOutline"] = "OUTLINE",
				["panelHeight"] = 220,
				["panelWidthRight"] = 400,
				["tapFontSize"] = 12,
				["panelWidth"] = 400,
			},
			["nameplates"] = {
				["fontSize"] = 14,
				["fontOutline"] = "OUTLINE",
				["clampToScreen"] = true,
				["font"] = "默认",
				["targetcount"] = true,
				["units"] = {
					["ENEMY_NPC"] = {
						["powerbar"] = {
							["enable"] = true,
						},
						["debuffs"] = {
							["numAuras"] = 6,
							["baseHeight"] = 20,
						},
						["healthbar"] = {
							["text"] = {
								["enable"] = true,
								["format"] = "CURRENT_PERCENT",
							},
						},
						["eliteIcon"] = {
							["enable"] = true,
						},
					},
				},
			},
			["layoutSet"] = "tank",
		},
	},
}
ElvPrivateDB = {
	["profileKeys"] = {
		["Radioedit - 奥蕾莉亚"] = "Radioedit - 奥蕾莉亚",
		["Geronimo - 奥蕾莉亚"] = "Geronimo - 奥蕾莉亚",
	},
	["profiles"] = {
		["Radioedit - 奥蕾莉亚"] = {
			["nameplates"] = {
				["enable"] = false,
			},
		},
		["Geronimo - 奥蕾莉亚"] = {
			["general"] = {
				["dmgfont"] = "默认",
				["namefont"] = "默认",
			},
			["auras"] = {
				["masque"] = {
					["debuffs"] = true,
					["buffs"] = true,
				},
			},
			["actionbar"] = {
				["masque"] = {
					["stanceBar"] = true,
					["petBar"] = true,
					["actionbars"] = true,
				},
			},
			["nameplates"] = {
				["enable"] = false,
			},
			["theme"] = "default",
			["install_complete"] = "10.31",
		},
	},
}
