
WeakAurasSaved = {
	["dynamicIconCache"] = {
		["献祭光环"] = {
			[258920] = 1344649,
		},
		["恶魔变形"] = {
			[162264] = 1247262,
		},
	},
	["login_squelch_time"] = 10,
	["registered"] = {
	},
	["displays"] = {
		["变身 特效 左"] = {
			["modelIsUnit"] = false,
			["borderBackdrop"] = "Blizzard Tooltip",
			["api"] = false,
			["xOffset"] = -50,
			["untrigger"] = {
			},
			["anchorPoint"] = "CENTER",
			["model_x"] = 0,
			["borderColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0.5, -- [4]
			},
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["portraitZoom"] = false,
			["internalVersion"] = 5,
			["advance"] = true,
			["model_path"] = "spells/7fx_legioninvasion_electricchest.m2",
			["trigger"] = {
				["type"] = "aura",
				["subeventSuffix"] = "_CAST_START",
				["ownOnly"] = true,
				["event"] = "Health",
				["names"] = {
					"恶魔变形", -- [1]
				},
				["spellIds"] = {
					162264, -- [1]
				},
				["custom_hide"] = "timed",
				["showOn"] = "showOnActive",
				["unit"] = "player",
				["subeventPrefix"] = "SPELL",
				["debuffType"] = "HELPFUL",
			},
			["rotation"] = 0,
			["model_st_tx"] = -20,
			["height"] = 180,
			["load"] = {
				["use_petbattle"] = false,
				["talent2"] = {
					["multi"] = {
					},
				},
				["use_never"] = false,
				["talent"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["single"] = "DEMONHUNTER",
					["multi"] = {
					},
				},
				["spec"] = {
					["single"] = 1,
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["role"] = {
					["multi"] = {
					},
				},
				["use_class"] = true,
				["race"] = {
					["multi"] = {
					},
				},
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["use_spec"] = true,
				["faction"] = {
					["multi"] = {
					},
				},
				["use_combat"] = true,
				["ingroup"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["backdropColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0.5, -- [4]
			},
			["model_st_ty"] = 0,
			["sequence"] = 1,
			["parent"] = "8.0浩劫DH_180725A",
			["scale"] = 1,
			["activeTriggerMode"] = -10,
			["border"] = false,
			["borderEdge"] = "None",
			["regionType"] = "model",
			["borderSize"] = 16,
			["model_st_us"] = 80,
			["disjunctive"] = "all",
			["model_st_rz"] = 0,
			["init_completed"] = 1,
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["main"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["finish"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
			},
			["model_st_ry"] = 0,
			["borderOffset"] = 5,
			["model_z"] = 0,
			["id"] = "变身 特效 左",
			["width"] = 300,
			["additional_triggers"] = {
			},
			["model_y"] = 0,
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["model_st_rx"] = 270,
			["borderInset"] = 11,
			["numTriggers"] = 1,
			["selfPoint"] = "CENTER",
			["conditions"] = {
			},
			["model_st_tz"] = 0,
			["yOffset"] = 5,
		},
		["混乱新星 发光"] = {
			["glow"] = true,
			["text1FontSize"] = 14,
			["cooldownTextEnabled"] = true,
			["untrigger"] = {
				["showOn"] = "showAlways",
				["spellName"] = 179057,
			},
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = 0,
			["customTextUpdate"] = "update",
			["icon"] = true,
			["internalVersion"] = 5,
			["keepAspectRatio"] = false,
			["selfPoint"] = "CENTER",
			["trigger"] = {
				["spellName"] = 179057,
				["type"] = "event",
				["use_showgcd"] = false,
				["unevent"] = "timed",
				["use_showOn"] = true,
				["duration"] = "3",
				["event"] = "Cooldown Ready (Spell)",
				["subeventPrefix"] = "SPELL",
				["realSpellName"] = "邪能弹幕",
				["use_spellName"] = true,
				["spellIds"] = {
				},
				["subeventSuffix"] = "_CAST_START",
				["showOn"] = "showAlways",
				["names"] = {
				},
				["unit"] = "player",
				["debuffType"] = "HELPFUL",
			},
			["desaturate"] = false,
			["progressPrecision"] = 0,
			["text1Point"] = "CENTER",
			["text2FontFlags"] = "OUTLINE",
			["height"] = 32,
			["load"] = {
				["ingroup"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["single"] = 9,
					["multi"] = {
						[9] = true,
					},
				},
				["spec"] = {
					["single"] = 1,
					["multi"] = {
					},
				},
				["class"] = {
					["single"] = "DEMONHUNTER",
					["multi"] = {
					},
				},
				["talent2"] = {
					["multi"] = {
					},
				},
				["role"] = {
					["multi"] = {
					},
				},
				["use_class"] = true,
				["race"] = {
					["multi"] = {
					},
				},
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["faction"] = {
					["multi"] = {
					},
				},
				["use_spec"] = true,
				["use_combat"] = true,
				["difficulty"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["parent"] = "8.0浩劫DH_180725A",
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["text1Enabled"] = true,
			["text2Containment"] = "INSIDE",
			["yOffset"] = -16,
			["text1Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["xOffset"] = -80,
			["numTriggers"] = 2,
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["regionType"] = "icon",
			["text1Containment"] = "INSIDE",
			["text1Font"] = "Friz Quadrata TT",
			["text2FontSize"] = 24,
			["width"] = 32,
			["frameStrata"] = 1,
			["text1"] = "%p",
			["text2"] = "%p",
			["additional_triggers"] = {
				{
					["trigger"] = {
						["type"] = "status",
						["subeventSuffix"] = "_CAST_START",
						["use_showOn"] = true,
						["use_absorbMode"] = true,
						["event"] = "Cooldown Progress (Spell)",
						["unit"] = "player",
						["realSpellName"] = "混乱新星",
						["use_spellName"] = true,
						["unevent"] = "auto",
						["showOn"] = "showOnReady",
						["subeventPrefix"] = "SPELL",
						["use_unit"] = true,
						["spellName"] = 179057,
					},
					["untrigger"] = {
						["showOn"] = "showOnReady",
						["spellName"] = 179057,
					},
				}, -- [1]
			},
			["zoom"] = 0,
			["auto"] = true,
			["text1FontFlags"] = "OUTLINE",
			["id"] = "混乱新星 发光",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text2Enabled"] = false,
			["anchorFrameType"] = "SCREEN",
			["text2Font"] = "Friz Quadrata TT",
			["stickyDuration"] = false,
			["inverse"] = false,
			["text2Point"] = "CENTER",
			["conditions"] = {
			},
			["cooldown"] = false,
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["main"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["finish"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
			},
		},
		["眼棱 魔化食欲"] = {
			["glow"] = false,
			["text1FontSize"] = 24,
			["cooldownTextEnabled"] = true,
			["untrigger"] = {
				["showOn"] = "showAlways",
				["spellName"] = 198013,
			},
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = 0,
			["customTextUpdate"] = "update",
			["icon"] = true,
			["text1Enabled"] = true,
			["keepAspectRatio"] = false,
			["selfPoint"] = "CENTER",
			["trigger"] = {
				["remaining_operator"] = "<",
				["unit"] = "player",
				["use_showgcd"] = true,
				["remaining"] = "1",
				["spellName"] = 198013,
				["type"] = "status",
				["unevent"] = "auto",
				["use_showOn"] = true,
				["event"] = "Action Usable",
				["subeventSuffix"] = "_CAST_START",
				["realSpellName"] = "眼棱",
				["use_spellName"] = true,
				["spellIds"] = {
				},
				["use_remaining"] = true,
				["showOn"] = "showAlways",
				["debuffType"] = "HELPFUL",
				["names"] = {
				},
				["subeventPrefix"] = "SPELL",
			},
			["desaturate"] = false,
			["text1Point"] = "CENTER",
			["text2FontFlags"] = "OUTLINE",
			["height"] = 64,
			["load"] = {
				["talent2"] = {
					["single"] = 2,
					["multi"] = {
						[19] = true,
					},
				},
				["ingroup"] = {
					["multi"] = {
					},
				},
				["use_talent"] = true,
				["talent"] = {
					["single"] = 19,
					["multi"] = {
					},
				},
				["use_class"] = true,
				["class"] = {
					["single"] = "DEMONHUNTER",
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["use_talent2"] = true,
				["difficulty"] = {
					["multi"] = {
					},
				},
				["role"] = {
					["multi"] = {
					},
				},
				["faction"] = {
					["multi"] = {
					},
				},
				["use_spec"] = true,
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["use_combat"] = true,
				["spec"] = {
					["single"] = 1,
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["internalVersion"] = 5,
			["yOffset"] = 0,
			["text2Containment"] = "INSIDE",
			["animation"] = {
				["start"] = {
					["preset"] = "shrink",
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["main"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["finish"] = {
					["type"] = "preset",
					["preset"] = "fade",
					["duration_type"] = "seconds",
				},
			},
			["text1Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text1Containment"] = "INSIDE",
			["numTriggers"] = 2,
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["regionType"] = "icon",
			["xOffset"] = 0,
			["text1FontFlags"] = "OUTLINE",
			["text2FontSize"] = 24,
			["anchorFrameType"] = "SCREEN",
			["frameStrata"] = 1,
			["text1"] = "%p",
			["text2"] = "%p",
			["id"] = "眼棱 魔化食欲",
			["zoom"] = 0,
			["auto"] = true,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["additional_triggers"] = {
				{
					["trigger"] = {
						["type"] = "status",
						["subeventSuffix"] = "_CAST_START",
						["power_operator"] = ">=",
						["use_power"] = true,
						["event"] = "Power",
						["unit"] = "player",
						["powertype"] = 17,
						["unevent"] = "auto",
						["power"] = "80",
						["use_absorbMode"] = true,
						["subeventPrefix"] = "SPELL",
						["use_powertype"] = true,
						["use_unit"] = true,
					},
					["untrigger"] = {
					},
				}, -- [1]
			},
			["text2Font"] = "Friz Quadrata TT",
			["text2Enabled"] = false,
			["width"] = 64,
			["stickyDuration"] = false,
			["text1Font"] = "Friz Quadrata TT",
			["inverse"] = false,
			["text2Point"] = "CENTER",
			["init_started"] = 1,
			["conditions"] = {
			},
			["cooldown"] = true,
			["parent"] = "8.0浩劫DH_180725A",
		},
		["献祭光环 增益"] = {
			["glow"] = true,
			["text1FontSize"] = 14,
			["cooldownTextEnabled"] = true,
			["untrigger"] = {
			},
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = 0,
			["customTextUpdate"] = "update",
			["icon"] = true,
			["internalVersion"] = 5,
			["keepAspectRatio"] = false,
			["selfPoint"] = "CENTER",
			["trigger"] = {
				["type"] = "aura",
				["subeventSuffix"] = "_CAST_START",
				["ownOnly"] = true,
				["event"] = "Health",
				["names"] = {
					"献祭光环", -- [1]
				},
				["spellIds"] = {
					258920, -- [1]
				},
				["showOn"] = "showOnActive",
				["subeventPrefix"] = "SPELL",
				["unit"] = "player",
				["debuffType"] = "HELPFUL",
			},
			["desaturate"] = false,
			["progressPrecision"] = 0,
			["text1Point"] = "CENTER",
			["text2FontFlags"] = "OUTLINE",
			["height"] = 32,
			["load"] = {
				["talent2"] = {
					["multi"] = {
					},
				},
				["ingroup"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["single"] = 6,
					["multi"] = {
					},
				},
				["use_class"] = true,
				["class"] = {
					["single"] = "DEMONHUNTER",
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["use_talent"] = true,
				["difficulty"] = {
					["multi"] = {
					},
				},
				["role"] = {
					["multi"] = {
					},
				},
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["faction"] = {
					["multi"] = {
					},
				},
				["use_spec"] = true,
				["use_combat"] = true,
				["spec"] = {
					["single"] = 1,
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["text1Enabled"] = true,
			["parent"] = "8.0浩劫DH_180725A",
			["text2Containment"] = "INSIDE",
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["main"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["finish"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
			},
			["text1Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["xOffset"] = 80,
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["regionType"] = "icon",
			["numTriggers"] = 1,
			["text1Containment"] = "INSIDE",
			["text2FontSize"] = 24,
			["text2Font"] = "Friz Quadrata TT",
			["anchorFrameType"] = "SCREEN",
			["text1"] = "%p",
			["frameStrata"] = 1,
			["text1FontFlags"] = "OUTLINE",
			["zoom"] = 0,
			["auto"] = true,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["id"] = "献祭光环 增益",
			["text2"] = "%p",
			["text2Enabled"] = false,
			["width"] = 32,
			["stickyDuration"] = false,
			["text1Font"] = "Friz Quadrata TT",
			["inverse"] = false,
			["text2Point"] = "CENTER",
			["conditions"] = {
			},
			["cooldown"] = true,
			["yOffset"] = -16,
		},
		["GCD"] = {
			["glow"] = false,
			["text1FontSize"] = 12,
			["cooldownTextEnabled"] = true,
			["untrigger"] = {
			},
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = -10,
			["customTextUpdate"] = "update",
			["icon"] = true,
			["internalVersion"] = 5,
			["keepAspectRatio"] = false,
			["selfPoint"] = "CENTER",
			["trigger"] = {
				["type"] = "status",
				["unevent"] = "auto",
				["use_absorbMode"] = true,
				["event"] = "Global Cooldown",
				["use_unit"] = true,
				["subeventPrefix"] = "SPELL",
				["spellIds"] = {
				},
				["subeventSuffix"] = "_CAST_START",
				["showOn"] = "showOnActive",
				["unit"] = "player",
				["names"] = {
				},
				["debuffType"] = "HELPFUL",
			},
			["desaturate"] = false,
			["text1Point"] = "BOTTOMRIGHT",
			["text2FontFlags"] = "OUTLINE",
			["height"] = 64,
			["load"] = {
				["talent2"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["ingroup"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["single"] = "DEMONHUNTER",
					["multi"] = {
					},
				},
				["spec"] = {
					["single"] = 1,
					["multi"] = {
					},
				},
				["role"] = {
					["multi"] = {
					},
				},
				["use_class"] = true,
				["race"] = {
					["multi"] = {
					},
				},
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["use_spec"] = true,
				["faction"] = {
					["multi"] = {
					},
				},
				["use_combat"] = true,
				["difficulty"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["parent"] = "8.0浩劫DH_180725A",
			["disjunctive"] = "all",
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["main"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["finish"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
			},
			["text2Containment"] = "INSIDE",
			["text1Enabled"] = false,
			["text1Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text2Point"] = "CENTER",
			["inverse"] = true,
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["regionType"] = "icon",
			["text1Containment"] = "INSIDE",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0, -- [4]
			},
			["text2FontSize"] = 24,
			["anchorFrameType"] = "SCREEN",
			["frameStrata"] = 1,
			["text1"] = "%s",
			["text1Font"] = "Friz Quadrata TT",
			["text2"] = "%p",
			["zoom"] = 0,
			["auto"] = false,
			["text1FontFlags"] = "OUTLINE",
			["id"] = "GCD",
			["text2Font"] = "Friz Quadrata TT",
			["text2Enabled"] = false,
			["width"] = 64,
			["stickyDuration"] = false,
			["xOffset"] = 0,
			["numTriggers"] = 1,
			["yOffset"] = 0,
			["conditions"] = {
			},
			["cooldown"] = true,
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
		},
		["恶魔之咬 魔化"] = {
			["glow"] = false,
			["text1FontSize"] = 24,
			["cooldownTextEnabled"] = true,
			["untrigger"] = {
				["showOn"] = "showAlways",
				["spellName"] = 162243,
			},
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = 0,
			["customTextUpdate"] = "update",
			["icon"] = true,
			["text1Enabled"] = true,
			["keepAspectRatio"] = false,
			["selfPoint"] = "CENTER",
			["trigger"] = {
				["remaining_operator"] = "<",
				["unit"] = "player",
				["use_showgcd"] = true,
				["remaining"] = "1",
				["spellName"] = 162243,
				["type"] = "status",
				["unevent"] = "auto",
				["use_showOn"] = true,
				["event"] = "Action Usable",
				["subeventSuffix"] = "_CAST_START",
				["realSpellName"] = "恶魔之咬",
				["use_spellName"] = true,
				["spellIds"] = {
				},
				["use_remaining"] = true,
				["showOn"] = "showAlways",
				["debuffType"] = "HELPFUL",
				["names"] = {
				},
				["subeventPrefix"] = "SPELL",
			},
			["desaturate"] = false,
			["text1Point"] = "CENTER",
			["text2FontFlags"] = "OUTLINE",
			["height"] = 64,
			["load"] = {
				["ingroup"] = {
					["multi"] = {
					},
				},
				["talent2"] = {
					["single"] = 2,
					["multi"] = {
						[19] = true,
					},
				},
				["class"] = {
					["single"] = "DEMONHUNTER",
					["multi"] = {
					},
				},
				["talent"] = {
					["single"] = 19,
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["single"] = 1,
					["multi"] = {
					},
				},
				["role"] = {
					["multi"] = {
					},
				},
				["use_talent2"] = true,
				["use_class"] = true,
				["race"] = {
					["multi"] = {
					},
				},
				["use_spec"] = true,
				["faction"] = {
					["multi"] = {
					},
				},
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["use_combat"] = true,
				["use_talent"] = true,
				["size"] = {
					["multi"] = {
					},
				},
			},
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["internalVersion"] = 5,
			["yOffset"] = 0,
			["text2Containment"] = "INSIDE",
			["animation"] = {
				["start"] = {
					["preset"] = "shrink",
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["main"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["finish"] = {
					["type"] = "preset",
					["preset"] = "fade",
					["duration_type"] = "seconds",
				},
			},
			["text1Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text1Containment"] = "INSIDE",
			["numTriggers"] = 3,
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["regionType"] = "icon",
			["xOffset"] = 0,
			["text1FontFlags"] = "OUTLINE",
			["text2FontSize"] = 24,
			["anchorFrameType"] = "SCREEN",
			["frameStrata"] = 1,
			["text1"] = "%p",
			["text2"] = "%p",
			["id"] = "恶魔之咬 魔化",
			["zoom"] = 0,
			["auto"] = true,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["additional_triggers"] = {
				{
					["trigger"] = {
						["remaining_operator"] = "<=",
						["type"] = "status",
						["unit"] = "player",
						["unevent"] = "auto",
						["use_showOn"] = true,
						["use_absorbMode"] = true,
						["event"] = "Cooldown Progress (Spell)",
						["use_unit"] = true,
						["realSpellName"] = "眼棱",
						["remaining"] = "3.5",
						["use_spellName"] = true,
						["use_remaining"] = true,
						["showOn"] = "showAlways",
						["subeventSuffix"] = "_CAST_START",
						["subeventPrefix"] = "SPELL",
						["spellName"] = 198013,
					},
					["untrigger"] = {
						["showOn"] = "showAlways",
						["spellName"] = 198013,
					},
				}, -- [1]
				{
					["trigger"] = {
						["type"] = "status",
						["subeventSuffix"] = "_CAST_START",
						["power_operator"] = "<=",
						["use_power"] = true,
						["event"] = "Power",
						["unit"] = "player",
						["powertype"] = 17,
						["unevent"] = "auto",
						["power"] = "80",
						["use_absorbMode"] = true,
						["subeventPrefix"] = "SPELL",
						["use_powertype"] = true,
						["use_unit"] = true,
					},
					["untrigger"] = {
					},
				}, -- [2]
			},
			["text2Font"] = "Friz Quadrata TT",
			["text2Enabled"] = false,
			["width"] = 64,
			["stickyDuration"] = false,
			["text1Font"] = "Friz Quadrata TT",
			["inverse"] = false,
			["text2Point"] = "CENTER",
			["init_started"] = 1,
			["conditions"] = {
			},
			["cooldown"] = true,
			["parent"] = "8.0浩劫DH_180725A",
		},
		["瓦解 冷却"] = {
			["glow"] = false,
			["text1FontSize"] = 14,
			["cooldownTextEnabled"] = true,
			["yOffset"] = -16,
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = 0,
			["customTextUpdate"] = "update",
			["icon"] = true,
			["internalVersion"] = 5,
			["keepAspectRatio"] = false,
			["selfPoint"] = "CENTER",
			["trigger"] = {
				["type"] = "status",
				["spellName"] = 183752,
				["unevent"] = "auto",
				["use_showOn"] = true,
				["realSpellName"] = "瓦解",
				["event"] = "Cooldown Progress (Spell)",
				["subeventPrefix"] = "SPELL",
				["use_showgcd"] = false,
				["use_spellName"] = true,
				["spellIds"] = {
				},
				["subeventSuffix"] = "_CAST_START",
				["showOn"] = "showAlways",
				["names"] = {
				},
				["unit"] = "player",
				["debuffType"] = "HELPFUL",
			},
			["desaturate"] = false,
			["progressPrecision"] = 0,
			["text1Point"] = "CENTER",
			["text2FontFlags"] = "OUTLINE",
			["height"] = 32,
			["load"] = {
				["talent2"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["single"] = 1,
					["multi"] = {
					},
				},
				["class"] = {
					["single"] = "DEMONHUNTER",
					["multi"] = {
					},
				},
				["ingroup"] = {
					["multi"] = {
					},
				},
				["role"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["faction"] = {
					["multi"] = {
					},
				},
				["use_spec"] = true,
				["use_combat"] = true,
				["use_class"] = true,
				["size"] = {
					["multi"] = {
					},
				},
			},
			["parent"] = "8.0浩劫DH_180725A",
			["actions"] = {
				["start"] = {
					["do_glow"] = false,
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["text2Containment"] = "INSIDE",
			["text1Enabled"] = true,
			["text1Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text2Point"] = "CENTER",
			["untrigger"] = {
				["showOn"] = "showAlways",
				["spellName"] = 183752,
			},
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["regionType"] = "icon",
			["numTriggers"] = 1,
			["xOffset"] = 80,
			["text2FontSize"] = 24,
			["text1Containment"] = "INSIDE",
			["width"] = 32,
			["text1"] = "%p",
			["frameStrata"] = 1,
			["text1Font"] = "Friz Quadrata TT",
			["zoom"] = 0,
			["auto"] = true,
			["text1FontFlags"] = "OUTLINE",
			["id"] = "瓦解 冷却",
			["text2"] = "%p",
			["text2Enabled"] = false,
			["anchorFrameType"] = "SCREEN",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text2Font"] = "Friz Quadrata TT",
			["inverse"] = false,
			["stickyDuration"] = false,
			["conditions"] = {
			},
			["cooldown"] = true,
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["main"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["finish"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
			},
		},
		["邪能冲撞 冷却"] = {
			["glow"] = false,
			["text1FontSize"] = 12,
			["cooldownTextEnabled"] = true,
			["untrigger"] = {
				["showOn"] = "showAlways",
				["spellName"] = 195072,
			},
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = 0,
			["customTextUpdate"] = "update",
			["actions"] = {
				["start"] = {
				},
				["init"] = {
					["do_custom"] = false,
				},
				["finish"] = {
				},
			},
			["internalVersion"] = 5,
			["keepAspectRatio"] = false,
			["selfPoint"] = "CENTER",
			["trigger"] = {
				["type"] = "status",
				["spellName"] = 195072,
				["unevent"] = "auto",
				["use_showOn"] = true,
				["realSpellName"] = "邪能冲撞",
				["event"] = "Cooldown Progress (Spell)",
				["subeventPrefix"] = "SPELL",
				["use_showgcd"] = false,
				["use_spellName"] = true,
				["spellIds"] = {
				},
				["subeventSuffix"] = "_CAST_START",
				["showOn"] = "showAlways",
				["names"] = {
				},
				["unit"] = "player",
				["debuffType"] = "HELPFUL",
			},
			["desaturate"] = false,
			["progressPrecision"] = 0,
			["text1Point"] = "TOPLEFT",
			["text2FontFlags"] = "OUTLINE",
			["height"] = 32,
			["load"] = {
				["talent2"] = {
					["multi"] = {
					},
				},
				["ingroup"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["single"] = 20,
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["single"] = 1,
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["use_talent"] = true,
				["use_class"] = true,
				["role"] = {
					["multi"] = {
					},
				},
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["faction"] = {
					["multi"] = {
					},
				},
				["use_spec"] = true,
				["use_combat"] = true,
				["class"] = {
					["single"] = "DEMONHUNTER",
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["main"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["finish"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
			},
			["text1Enabled"] = true,
			["text2Containment"] = "INSIDE",
			["icon"] = true,
			["text1Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["parent"] = "8.0浩劫DH_180725A",
			["xOffset"] = 48,
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["regionType"] = "icon",
			["numTriggers"] = 1,
			["text2Point"] = "BOTTOMRIGHT",
			["text2FontSize"] = 12,
			["text1Containment"] = "INSIDE",
			["width"] = 32,
			["text1"] = "%p",
			["text2Enabled"] = true,
			["text1FontFlags"] = "OUTLINE",
			["zoom"] = 0,
			["auto"] = true,
			["text1Font"] = "Friz Quadrata TT",
			["id"] = "邪能冲撞 冷却",
			["text2"] = "%s",
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text2Font"] = "Friz Quadrata TT",
			["inverse"] = false,
			["stickyDuration"] = false,
			["conditions"] = {
			},
			["cooldown"] = true,
			["yOffset"] = -16,
		},
		["恶魔变形 增益"] = {
			["glow"] = true,
			["text1FontSize"] = 24,
			["cooldownTextEnabled"] = true,
			["untrigger"] = {
			},
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = 0,
			["customTextUpdate"] = "update",
			["actions"] = {
				["start"] = {
					["do_glow"] = false,
					["glow_action"] = "show",
					["do_custom"] = false,
					["glow_frame"] = "WeakAuras:涅墨西斯 Buff",
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["internalVersion"] = 5,
			["keepAspectRatio"] = false,
			["animation"] = {
				["start"] = {
					["preset"] = "fade",
					["type"] = "preset",
					["duration_type"] = "seconds",
				},
				["main"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["finish"] = {
					["preset"] = "fade",
					["type"] = "preset",
					["duration_type"] = "seconds",
				},
			},
			["trigger"] = {
				["type"] = "aura",
				["subeventSuffix"] = "_CAST_START",
				["ownOnly"] = true,
				["event"] = "Health",
				["names"] = {
					"恶魔变形", -- [1]
				},
				["spellIds"] = {
					162264, -- [1]
				},
				["showOn"] = "showOnActive",
				["subeventPrefix"] = "SPELL",
				["unit"] = "player",
				["debuffType"] = "HELPFUL",
			},
			["text1Containment"] = "OUTSIDE",
			["progressPrecision"] = 1,
			["text1Point"] = "TOP",
			["text2FontFlags"] = "OUTLINE",
			["height"] = 64,
			["icon"] = true,
			["load"] = {
				["talent2"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["single"] = 20,
					["multi"] = {
						[20] = true,
					},
				},
				["class"] = {
					["single"] = "DEMONHUNTER",
					["multi"] = {
					},
				},
				["spec"] = {
					["single"] = 1,
					["multi"] = {
					},
				},
				["use_class"] = true,
				["race"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["role"] = {
					["multi"] = {
					},
				},
				["use_spec"] = true,
				["faction"] = {
					["multi"] = {
					},
				},
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["use_combat"] = true,
				["ingroup"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["yOffset"] = 0,
			["text2Point"] = "CENTER",
			["text1Enabled"] = true,
			["text2Containment"] = "INSIDE",
			["selfPoint"] = "CENTER",
			["text1Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["numTriggers"] = 1,
			["desaturate"] = false,
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["regionType"] = "icon",
			["disjunctive"] = "any",
			["anchorFrameType"] = "SCREEN",
			["text2FontSize"] = 24,
			["frameStrata"] = 1,
			["text1FontFlags"] = "OUTLINE",
			["text1"] = "%p",
			["id"] = "恶魔变形 增益",
			["xOffset"] = 0,
			["zoom"] = 0,
			["auto"] = false,
			["text2"] = "%p",
			["additional_triggers"] = {
			},
			["text1Font"] = "Friz Quadrata TT",
			["text2Enabled"] = false,
			["width"] = 64,
			["text2Font"] = "Friz Quadrata TT",
			["stickyDuration"] = false,
			["inverse"] = false,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0, -- [4]
			},
			["init_started"] = 1,
			["conditions"] = {
			},
			["cooldown"] = false,
			["parent"] = "8.0浩劫DH_180725A",
		},
		["涅墨西斯 发光"] = {
			["glow"] = true,
			["text1FontSize"] = 14,
			["cooldownTextEnabled"] = true,
			["yOffset"] = -16,
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = 0,
			["customTextUpdate"] = "update",
			["actions"] = {
				["start"] = {
					["do_glow"] = false,
					["glow_frame"] = "WeakAuras:涅墨西斯 发光",
					["glow_action"] = "show",
				},
				["init"] = {
					["do_custom"] = false,
				},
				["finish"] = {
				},
			},
			["internalVersion"] = 5,
			["keepAspectRatio"] = false,
			["selfPoint"] = "CENTER",
			["trigger"] = {
				["spellName"] = 206491,
				["type"] = "event",
				["use_showgcd"] = false,
				["unevent"] = "timed",
				["use_showOn"] = true,
				["duration"] = "3",
				["event"] = "Cooldown Ready (Spell)",
				["subeventPrefix"] = "SPELL",
				["realSpellName"] = "涅墨西斯",
				["use_spellName"] = true,
				["spellIds"] = {
				},
				["subeventSuffix"] = "_CAST_START",
				["showOn"] = "showAlways",
				["names"] = {
				},
				["unit"] = "player",
				["debuffType"] = "HELPFUL",
			},
			["desaturate"] = false,
			["progressPrecision"] = 0,
			["text1Point"] = "CENTER",
			["text2FontFlags"] = "OUTLINE",
			["height"] = 32,
			["load"] = {
				["talent2"] = {
					["multi"] = {
					},
				},
				["ingroup"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["single"] = 21,
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["single"] = 1,
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["use_talent"] = true,
				["use_class"] = true,
				["role"] = {
					["multi"] = {
					},
				},
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["faction"] = {
					["multi"] = {
					},
				},
				["use_spec"] = true,
				["use_combat"] = true,
				["class"] = {
					["single"] = "DEMONHUNTER",
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["main"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["finish"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
			},
			["untrigger"] = {
				["showOn"] = "showAlways",
				["spellName"] = 206491,
			},
			["icon"] = true,
			["text2Containment"] = "INSIDE",
			["parent"] = "8.0浩劫DH_180725A",
			["text1Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["xOffset"] = 48.0001220703125,
			["numTriggers"] = 2,
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["regionType"] = "icon",
			["text1Containment"] = "INSIDE",
			["text1Font"] = "Friz Quadrata TT",
			["text2FontSize"] = 24,
			["width"] = 32,
			["frameStrata"] = 1,
			["text1"] = "%c",
			["text2"] = "%p",
			["id"] = "涅墨西斯 发光",
			["zoom"] = 0,
			["auto"] = true,
			["text1FontFlags"] = "OUTLINE",
			["additional_triggers"] = {
				{
					["trigger"] = {
						["type"] = "status",
						["subeventSuffix"] = "_CAST_START",
						["use_showOn"] = true,
						["use_absorbMode"] = true,
						["event"] = "Cooldown Progress (Spell)",
						["use_unit"] = true,
						["realSpellName"] = "涅墨西斯",
						["use_spellName"] = true,
						["unevent"] = "auto",
						["showOn"] = "showOnReady",
						["subeventPrefix"] = "SPELL",
						["unit"] = "player",
						["spellName"] = 206491,
					},
					["untrigger"] = {
						["showOn"] = "showOnReady",
						["spellName"] = 206491,
					},
				}, -- [1]
			},
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text2Enabled"] = false,
			["anchorFrameType"] = "SCREEN",
			["text2Font"] = "Friz Quadrata TT",
			["stickyDuration"] = false,
			["inverse"] = false,
			["text2Point"] = "CENTER",
			["conditions"] = {
			},
			["cooldown"] = false,
			["text1Enabled"] = true,
		},
		["怒气背景"] = {
			["user_y"] = 0,
			["user_x"] = 0,
			["color"] = {
			},
			["untrigger"] = {
			},
			["foregroundColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["desaturateBackground"] = false,
			["activeTriggerMode"] = -10,
			["sameTexture"] = true,
			["desaturateForeground"] = false,
			["endAngle"] = 360,
			["internalVersion"] = 5,
			["selfPoint"] = "CENTER",
			["trigger"] = {
				["names"] = {
				},
				["type"] = "status",
				["class"] = "DEMONHUNTER",
				["unevent"] = "auto",
				["unit"] = "player",
				["use_absorbMode"] = true,
				["event"] = "Unit Characteristics",
				["subeventPrefix"] = "SPELL",
				["use_class"] = true,
				["powertype"] = 17,
				["spellIds"] = {
				},
				["subeventSuffix"] = "_CAST_START",
				["showOn"] = "showOnActive",
				["use_unit"] = true,
				["use_powertype"] = true,
				["debuffType"] = "HELPFUL",
			},
			["stickyDuration"] = false,
			["rotation"] = 0,
			["font"] = "Friz Quadrata TT",
			["version"] = 2,
			["height"] = 18,
			["load"] = {
				["ingroup"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["talent2"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["single"] = "DEMONHUNTER",
					["multi"] = {
					},
				},
				["spec"] = {
					["single"] = 1,
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["use_class"] = true,
				["role"] = {
					["multi"] = {
					},
				},
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["use_spec"] = true,
				["faction"] = {
					["multi"] = {
					},
				},
				["use_combat"] = true,
				["difficulty"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["parent"] = "8.0浩劫DH_180725A",
			["useAdjustededMax"] = false,
			["fontSize"] = 12,
			["xOffset"] = 0,
			["foregroundTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",
			["crop_x"] = 0.41,
			["yOffset"] = -61,
			["mirror"] = false,
			["useAdjustededMin"] = false,
			["regionType"] = "progresstexture",
			["anchorPoint"] = "CENTER",
			["blendMode"] = "BLEND",
			["numTriggers"] = 1,
			["disjunctive"] = "all",
			["slantMode"] = "INSIDE",
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["main"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["finish"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
			},
			["width"] = 192,
			["frameStrata"] = 1,
			["crop_y"] = 0.41,
			["backgroundColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				0, -- [4]
			},
			["compress"] = false,
			["id"] = "怒气背景",
			["startAngle"] = 0,
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["backgroundTexture"] = "Textures\\SpellActivationOverlays\\Eclipse_Sun",
			["textureWrapMode"] = "CLAMP",
			["inverse"] = true,
			["crop"] = 0.41,
			["orientation"] = "HORIZONTAL_INVERSE",
			["conditions"] = {
			},
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["backgroundOffset"] = 2,
		},
		["混乱打击"] = {
			["glow"] = false,
			["text1FontSize"] = 24,
			["cooldownTextEnabled"] = true,
			["untrigger"] = {
				["showOn"] = "showAlways",
				["spellName"] = 162794,
			},
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = 0,
			["customTextUpdate"] = "update",
			["icon"] = true,
			["text1Enabled"] = true,
			["keepAspectRatio"] = false,
			["selfPoint"] = "CENTER",
			["trigger"] = {
				["remaining_operator"] = "<",
				["unit"] = "player",
				["use_showgcd"] = true,
				["remaining"] = "1",
				["spellName"] = 162794,
				["type"] = "status",
				["unevent"] = "auto",
				["use_showOn"] = true,
				["event"] = "Action Usable",
				["subeventSuffix"] = "_CAST_START",
				["realSpellName"] = "混乱打击",
				["use_spellName"] = true,
				["spellIds"] = {
				},
				["use_remaining"] = true,
				["showOn"] = "showAlways",
				["debuffType"] = "HELPFUL",
				["names"] = {
				},
				["subeventPrefix"] = "SPELL",
			},
			["desaturate"] = false,
			["text1Point"] = "CENTER",
			["text2FontFlags"] = "OUTLINE",
			["height"] = 64,
			["load"] = {
				["ingroup"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["single"] = 14,
					["multi"] = {
						[14] = true,
					},
				},
				["spec"] = {
					["single"] = 1,
					["multi"] = {
					},
				},
				["class"] = {
					["single"] = "DEMONHUNTER",
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["use_class"] = true,
				["role"] = {
					["multi"] = {
					},
				},
				["use_spec"] = true,
				["faction"] = {
					["multi"] = {
					},
				},
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["use_combat"] = true,
				["talent2"] = {
					["single"] = 19,
					["multi"] = {
						[19] = true,
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["internalVersion"] = 5,
			["yOffset"] = 0,
			["text2Containment"] = "INSIDE",
			["animation"] = {
				["start"] = {
					["preset"] = "shrink",
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["main"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["finish"] = {
					["type"] = "preset",
					["preset"] = "fade",
					["duration_type"] = "seconds",
				},
			},
			["text1Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text1Containment"] = "INSIDE",
			["numTriggers"] = 2,
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["regionType"] = "icon",
			["xOffset"] = 0,
			["text1FontFlags"] = "OUTLINE",
			["text2FontSize"] = 24,
			["anchorFrameType"] = "SCREEN",
			["frameStrata"] = 1,
			["text1"] = "%p",
			["text2"] = "%p",
			["id"] = "混乱打击",
			["zoom"] = 0,
			["auto"] = true,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["additional_triggers"] = {
				{
					["trigger"] = {
						["type"] = "status",
						["power"] = "40",
						["power_operator"] = ">=",
						["use_absorbMode"] = true,
						["event"] = "Power",
						["subeventPrefix"] = "SPELL",
						["unevent"] = "auto",
						["use_power"] = true,
						["unit"] = "player",
						["use_unit"] = true,
						["subeventSuffix"] = "_CAST_START",
					},
					["untrigger"] = {
					},
				}, -- [1]
			},
			["text2Font"] = "Friz Quadrata TT",
			["text2Enabled"] = false,
			["width"] = 64,
			["stickyDuration"] = false,
			["text1Font"] = "Friz Quadrata TT",
			["inverse"] = false,
			["text2Point"] = "CENTER",
			["init_started"] = 1,
			["conditions"] = {
			},
			["cooldown"] = true,
			["parent"] = "8.0浩劫DH_180725A",
		},
		["眼棱 邪能"] = {
			["glow"] = false,
			["text1FontSize"] = 24,
			["cooldownTextEnabled"] = true,
			["untrigger"] = {
				["showOn"] = "showAlways",
				["spellName"] = 198013,
			},
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = 0,
			["customTextUpdate"] = "update",
			["icon"] = true,
			["text1Enabled"] = true,
			["keepAspectRatio"] = false,
			["selfPoint"] = "CENTER",
			["trigger"] = {
				["remaining_operator"] = "<",
				["unit"] = "player",
				["use_showgcd"] = true,
				["remaining"] = "1",
				["spellName"] = 198013,
				["type"] = "status",
				["unevent"] = "auto",
				["use_showOn"] = true,
				["event"] = "Action Usable",
				["subeventSuffix"] = "_CAST_START",
				["realSpellName"] = "眼棱",
				["use_spellName"] = true,
				["spellIds"] = {
				},
				["use_remaining"] = true,
				["showOn"] = "showAlways",
				["debuffType"] = "HELPFUL",
				["names"] = {
				},
				["subeventPrefix"] = "SPELL",
			},
			["desaturate"] = false,
			["text1Point"] = "CENTER",
			["text2FontFlags"] = "OUTLINE",
			["height"] = 64,
			["load"] = {
				["ingroup"] = {
					["multi"] = {
					},
				},
				["talent2"] = {
					["single"] = 19,
					["multi"] = {
						[19] = true,
					},
				},
				["talent"] = {
					["single"] = 3,
					["multi"] = {
					},
				},
				["use_class"] = true,
				["class"] = {
					["single"] = "DEMONHUNTER",
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["use_talent"] = true,
				["difficulty"] = {
					["multi"] = {
					},
				},
				["role"] = {
					["multi"] = {
					},
				},
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["faction"] = {
					["multi"] = {
					},
				},
				["use_spec"] = true,
				["use_combat"] = true,
				["spec"] = {
					["single"] = 1,
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["internalVersion"] = 5,
			["yOffset"] = 0,
			["text2Containment"] = "INSIDE",
			["animation"] = {
				["start"] = {
					["preset"] = "shrink",
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["main"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["finish"] = {
					["type"] = "preset",
					["preset"] = "fade",
					["duration_type"] = "seconds",
				},
			},
			["text1Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text1Containment"] = "INSIDE",
			["numTriggers"] = 2,
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["regionType"] = "icon",
			["xOffset"] = 0,
			["text1FontFlags"] = "OUTLINE",
			["text2FontSize"] = 24,
			["anchorFrameType"] = "SCREEN",
			["frameStrata"] = 1,
			["text1"] = "%p",
			["text2"] = "%p",
			["id"] = "眼棱 邪能",
			["zoom"] = 0,
			["auto"] = true,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["additional_triggers"] = {
				{
					["trigger"] = {
						["type"] = "status",
						["subeventSuffix"] = "_CAST_START",
						["power_operator"] = ">=",
						["use_power"] = true,
						["event"] = "Power",
						["unit"] = "player",
						["powertype"] = 17,
						["unevent"] = "auto",
						["power"] = "30",
						["use_absorbMode"] = true,
						["subeventPrefix"] = "SPELL",
						["use_powertype"] = true,
						["use_unit"] = true,
					},
					["untrigger"] = {
					},
				}, -- [1]
			},
			["text2Font"] = "Friz Quadrata TT",
			["text2Enabled"] = false,
			["width"] = 64,
			["stickyDuration"] = false,
			["text1Font"] = "Friz Quadrata TT",
			["inverse"] = false,
			["text2Point"] = "CENTER",
			["init_started"] = 1,
			["conditions"] = {
			},
			["cooldown"] = true,
			["parent"] = "8.0浩劫DH_180725A",
		},
		["邪能弹幕 发光"] = {
			["glow"] = true,
			["text1FontSize"] = 14,
			["cooldownTextEnabled"] = true,
			["yOffset"] = -16,
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = 0,
			["customTextUpdate"] = "update",
			["icon"] = true,
			["internalVersion"] = 5,
			["keepAspectRatio"] = false,
			["selfPoint"] = "CENTER",
			["trigger"] = {
				["spellName"] = 258925,
				["type"] = "event",
				["use_showgcd"] = false,
				["unevent"] = "timed",
				["use_showOn"] = true,
				["duration"] = "3",
				["event"] = "Cooldown Ready (Spell)",
				["subeventPrefix"] = "SPELL",
				["realSpellName"] = "邪能弹幕",
				["use_spellName"] = true,
				["spellIds"] = {
				},
				["subeventSuffix"] = "_CAST_START",
				["showOn"] = "showAlways",
				["names"] = {
				},
				["unit"] = "player",
				["debuffType"] = "HELPFUL",
			},
			["desaturate"] = false,
			["progressPrecision"] = 0,
			["text1Point"] = "CENTER",
			["text2FontFlags"] = "OUTLINE",
			["height"] = 32,
			["load"] = {
				["ingroup"] = {
					["multi"] = {
					},
				},
				["talent2"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["single"] = 9,
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["single"] = "DEMONHUNTER",
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["use_talent"] = true,
				["use_class"] = true,
				["role"] = {
					["multi"] = {
					},
				},
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["faction"] = {
					["multi"] = {
					},
				},
				["use_spec"] = true,
				["use_combat"] = true,
				["spec"] = {
					["single"] = 1,
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["parent"] = "8.0浩劫DH_180725A",
			["text1Enabled"] = true,
			["text2Containment"] = "INSIDE",
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["main"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["finish"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
			},
			["text1Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["xOffset"] = -80,
			["numTriggers"] = 2,
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["regionType"] = "icon",
			["text1Containment"] = "INSIDE",
			["text1Font"] = "Friz Quadrata TT",
			["text2FontSize"] = 24,
			["width"] = 32,
			["frameStrata"] = 1,
			["text1"] = "%p",
			["text2"] = "%p",
			["id"] = "邪能弹幕 发光",
			["zoom"] = 0,
			["auto"] = true,
			["text1FontFlags"] = "OUTLINE",
			["additional_triggers"] = {
				{
					["trigger"] = {
						["type"] = "status",
						["subeventSuffix"] = "_CAST_START",
						["use_showOn"] = true,
						["use_absorbMode"] = true,
						["event"] = "Cooldown Progress (Spell)",
						["use_unit"] = true,
						["realSpellName"] = "邪能弹幕",
						["use_spellName"] = true,
						["unevent"] = "auto",
						["showOn"] = "showOnReady",
						["subeventPrefix"] = "SPELL",
						["unit"] = "player",
						["spellName"] = 258925,
					},
					["untrigger"] = {
						["showOn"] = "showOnReady",
						["spellName"] = 258925,
					},
				}, -- [1]
			},
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text2Enabled"] = false,
			["anchorFrameType"] = "SCREEN",
			["text2Font"] = "Friz Quadrata TT",
			["stickyDuration"] = false,
			["inverse"] = false,
			["text2Point"] = "CENTER",
			["conditions"] = {
			},
			["cooldown"] = false,
			["untrigger"] = {
				["showOn"] = "showAlways",
				["spellName"] = 258925,
			},
		},
		["涅墨西斯 冷却"] = {
			["glow"] = false,
			["text1FontSize"] = 14,
			["cooldownTextEnabled"] = true,
			["yOffset"] = -16,
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = 0,
			["customTextUpdate"] = "update",
			["icon"] = true,
			["internalVersion"] = 5,
			["keepAspectRatio"] = false,
			["selfPoint"] = "CENTER",
			["trigger"] = {
				["type"] = "status",
				["spellName"] = 206491,
				["unevent"] = "auto",
				["use_showOn"] = true,
				["realSpellName"] = "涅墨西斯",
				["event"] = "Cooldown Progress (Spell)",
				["subeventPrefix"] = "SPELL",
				["use_showgcd"] = false,
				["use_spellName"] = true,
				["spellIds"] = {
				},
				["subeventSuffix"] = "_CAST_START",
				["showOn"] = "showAlways",
				["names"] = {
				},
				["unit"] = "player",
				["debuffType"] = "HELPFUL",
			},
			["desaturate"] = false,
			["progressPrecision"] = 0,
			["text1Point"] = "CENTER",
			["text2FontFlags"] = "OUTLINE",
			["height"] = 32,
			["load"] = {
				["ingroup"] = {
					["multi"] = {
					},
				},
				["talent2"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["single"] = 21,
					["multi"] = {
					},
				},
				["spec"] = {
					["single"] = 1,
					["multi"] = {
					},
				},
				["class"] = {
					["single"] = "DEMONHUNTER",
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["use_talent"] = true,
				["difficulty"] = {
					["multi"] = {
					},
				},
				["role"] = {
					["multi"] = {
					},
				},
				["use_spec"] = true,
				["faction"] = {
					["multi"] = {
					},
				},
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["use_combat"] = true,
				["use_class"] = true,
				["size"] = {
					["multi"] = {
					},
				},
			},
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["main"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["finish"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
			},
			["untrigger"] = {
				["showOn"] = "showAlways",
				["spellName"] = 206491,
			},
			["text2Containment"] = "INSIDE",
			["text1Enabled"] = true,
			["text1Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["parent"] = "8.0浩劫DH_180725A",
			["xOffset"] = 48,
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["regionType"] = "icon",
			["numTriggers"] = 1,
			["text1Containment"] = "INSIDE",
			["text2FontSize"] = 24,
			["text2Font"] = "Friz Quadrata TT",
			["anchorFrameType"] = "SCREEN",
			["text1"] = "%p",
			["frameStrata"] = 1,
			["text1FontFlags"] = "OUTLINE",
			["zoom"] = 0,
			["auto"] = true,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["id"] = "涅墨西斯 冷却",
			["text2"] = "%p",
			["text2Enabled"] = false,
			["width"] = 32,
			["stickyDuration"] = false,
			["text1Font"] = "Friz Quadrata TT",
			["inverse"] = false,
			["text2Point"] = "CENTER",
			["conditions"] = {
			},
			["cooldown"] = true,
			["actions"] = {
				["start"] = {
				},
				["init"] = {
					["do_custom"] = false,
				},
				["finish"] = {
				},
			},
		},
		["瓦解 发光"] = {
			["glow"] = true,
			["text1FontSize"] = 14,
			["cooldownTextEnabled"] = true,
			["untrigger"] = {
				["showOn"] = "showAlways",
				["spellName"] = 183752,
			},
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = 0,
			["customTextUpdate"] = "update",
			["icon"] = true,
			["internalVersion"] = 5,
			["keepAspectRatio"] = false,
			["selfPoint"] = "CENTER",
			["trigger"] = {
				["spellName"] = 183752,
				["type"] = "event",
				["use_showgcd"] = false,
				["unevent"] = "timed",
				["use_showOn"] = true,
				["duration"] = "3",
				["event"] = "Cooldown Ready (Spell)",
				["subeventPrefix"] = "SPELL",
				["realSpellName"] = "献祭光环",
				["use_spellName"] = true,
				["spellIds"] = {
				},
				["subeventSuffix"] = "_CAST_START",
				["showOn"] = "showAlways",
				["names"] = {
				},
				["unit"] = "player",
				["debuffType"] = "HELPFUL",
			},
			["desaturate"] = false,
			["progressPrecision"] = 0,
			["text1Point"] = "CENTER",
			["text2FontFlags"] = "OUTLINE",
			["height"] = 32,
			["load"] = {
				["ingroup"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["single"] = "DEMONHUNTER",
					["multi"] = {
					},
				},
				["spec"] = {
					["single"] = 1,
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["role"] = {
					["multi"] = {
					},
				},
				["use_class"] = true,
				["race"] = {
					["multi"] = {
					},
				},
				["use_spec"] = true,
				["faction"] = {
					["multi"] = {
					},
				},
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["use_combat"] = true,
				["talent2"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["parent"] = "8.0浩劫DH_180725A",
			["text1Enabled"] = true,
			["actions"] = {
				["start"] = {
					["do_glow"] = false,
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["text2Containment"] = "INSIDE",
			["text2Point"] = "CENTER",
			["text1Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["yOffset"] = -16,
			["numTriggers"] = 2,
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["regionType"] = "icon",
			["xOffset"] = 80,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text2FontSize"] = 24,
			["width"] = 32,
			["frameStrata"] = 1,
			["text1"] = "%c",
			["text2"] = "%p",
			["id"] = "瓦解 发光",
			["zoom"] = 0,
			["auto"] = true,
			["text1Font"] = "Friz Quadrata TT",
			["additional_triggers"] = {
				{
					["trigger"] = {
						["type"] = "status",
						["subeventSuffix"] = "_CAST_START",
						["use_showOn"] = true,
						["use_absorbMode"] = true,
						["event"] = "Cooldown Progress (Spell)",
						["unit"] = "player",
						["realSpellName"] = "瓦解",
						["use_spellName"] = true,
						["unevent"] = "auto",
						["showOn"] = "showOnReady",
						["subeventPrefix"] = "SPELL",
						["use_unit"] = true,
						["spellName"] = 183752,
					},
					["untrigger"] = {
						["showOn"] = "showOnReady",
						["spellName"] = 183752,
					},
				}, -- [1]
			},
			["text1FontFlags"] = "OUTLINE",
			["text2Enabled"] = false,
			["anchorFrameType"] = "SCREEN",
			["text2Font"] = "Friz Quadrata TT",
			["stickyDuration"] = false,
			["inverse"] = false,
			["text1Containment"] = "INSIDE",
			["conditions"] = {
			},
			["cooldown"] = false,
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["main"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["finish"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
			},
		},
		["势如破竹 增益"] = {
			["glow"] = true,
			["text1FontSize"] = 14,
			["cooldownTextEnabled"] = true,
			["untrigger"] = {
			},
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = 0,
			["customTextUpdate"] = "update",
			["actions"] = {
				["start"] = {
					["do_glow"] = true,
					["glow_frame"] = "WeakAuras:涅墨西斯 Buff",
					["do_custom"] = false,
					["glow_action"] = "show",
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["internalVersion"] = 5,
			["keepAspectRatio"] = false,
			["selfPoint"] = "CENTER",
			["trigger"] = {
				["type"] = "aura",
				["subeventSuffix"] = "_CAST_START",
				["ownOnly"] = true,
				["event"] = "Health",
				["names"] = {
					"势如破竹", -- [1]
				},
				["spellIds"] = {
					208628, -- [1]
				},
				["showOn"] = "showOnActive",
				["subeventPrefix"] = "SPELL",
				["unit"] = "player",
				["debuffType"] = "HELPFUL",
			},
			["desaturate"] = false,
			["progressPrecision"] = 0,
			["text1Point"] = "CENTER",
			["text2FontFlags"] = "OUTLINE",
			["height"] = 32,
			["yOffset"] = -16,
			["load"] = {
				["ingroup"] = {
					["multi"] = {
					},
				},
				["talent2"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["single"] = 20,
					["multi"] = {
					},
				},
				["use_class"] = true,
				["class"] = {
					["single"] = "DEMONHUNTER",
					["multi"] = {
					},
				},
				["role"] = {
					["multi"] = {
					},
				},
				["use_talent"] = true,
				["difficulty"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["use_spec"] = true,
				["faction"] = {
					["multi"] = {
					},
				},
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["use_combat"] = true,
				["spec"] = {
					["single"] = 1,
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["text1Enabled"] = true,
			["parent"] = "8.0浩劫DH_180725A",
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["main"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["finish"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
			},
			["text2Containment"] = "INSIDE",
			["xOffset"] = 48,
			["text1Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["numTriggers"] = 1,
			["disjunctive"] = "any",
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["regionType"] = "icon",
			["text2Font"] = "Friz Quadrata TT",
			["width"] = 32,
			["text2FontSize"] = 24,
			["frameStrata"] = 1,
			["text1FontFlags"] = "OUTLINE",
			["text1"] = "%p",
			["id"] = "势如破竹 增益",
			["text1Font"] = "Friz Quadrata TT",
			["zoom"] = 0,
			["auto"] = true,
			["text2"] = "%p",
			["additional_triggers"] = {
			},
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text2Enabled"] = false,
			["anchorFrameType"] = "SCREEN",
			["stickyDuration"] = false,
			["text1Containment"] = "INSIDE",
			["inverse"] = false,
			["text2Point"] = "CENTER",
			["conditions"] = {
			},
			["cooldown"] = true,
			["icon"] = true,
		},
		["恶魔变形 冷却"] = {
			["glow"] = false,
			["text1FontSize"] = 14,
			["cooldownTextEnabled"] = true,
			["yOffset"] = -16,
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = 0,
			["customTextUpdate"] = "update",
			["icon"] = true,
			["internalVersion"] = 5,
			["keepAspectRatio"] = false,
			["selfPoint"] = "CENTER",
			["trigger"] = {
				["type"] = "status",
				["spellName"] = 191427,
				["unevent"] = "auto",
				["use_showOn"] = true,
				["realSpellName"] = "恶魔变形",
				["event"] = "Cooldown Progress (Spell)",
				["subeventPrefix"] = "SPELL",
				["use_showgcd"] = false,
				["use_spellName"] = true,
				["spellIds"] = {
				},
				["subeventSuffix"] = "_CAST_START",
				["showOn"] = "showAlways",
				["names"] = {
				},
				["unit"] = "player",
				["debuffType"] = "HELPFUL",
			},
			["desaturate"] = false,
			["progressPrecision"] = 0,
			["text1Point"] = "CENTER",
			["text2FontFlags"] = "OUTLINE",
			["height"] = 32,
			["load"] = {
				["talent2"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["single"] = "DEMONHUNTER",
					["multi"] = {
					},
				},
				["spec"] = {
					["single"] = 1,
					["multi"] = {
					},
				},
				["use_class"] = true,
				["role"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["use_spec"] = true,
				["faction"] = {
					["multi"] = {
					},
				},
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["use_combat"] = true,
				["ingroup"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["parent"] = "8.0浩劫DH_180725A",
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["text2Containment"] = "INSIDE",
			["text1Enabled"] = true,
			["text1Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["untrigger"] = {
				["showOn"] = "showAlways",
			},
			["xOffset"] = -48,
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["regionType"] = "icon",
			["numTriggers"] = 1,
			["text1Containment"] = "INSIDE",
			["text2FontSize"] = 24,
			["text2Font"] = "Friz Quadrata TT",
			["anchorFrameType"] = "SCREEN",
			["text1"] = "%p",
			["frameStrata"] = 1,
			["text1FontFlags"] = "OUTLINE",
			["zoom"] = 0,
			["auto"] = true,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["id"] = "恶魔变形 冷却",
			["text2"] = "%p",
			["text2Enabled"] = false,
			["width"] = 32,
			["stickyDuration"] = false,
			["text1Font"] = "Friz Quadrata TT",
			["inverse"] = false,
			["text2Point"] = "CENTER",
			["conditions"] = {
			},
			["cooldown"] = true,
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["main"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["finish"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
			},
		},
		["混乱新星 冷却"] = {
			["glow"] = false,
			["text1FontSize"] = 14,
			["cooldownTextEnabled"] = true,
			["yOffset"] = -16,
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = 0,
			["customTextUpdate"] = "update",
			["icon"] = true,
			["internalVersion"] = 5,
			["keepAspectRatio"] = false,
			["selfPoint"] = "CENTER",
			["trigger"] = {
				["type"] = "status",
				["spellName"] = 179057,
				["unevent"] = "auto",
				["use_showOn"] = true,
				["realSpellName"] = "混乱新星",
				["event"] = "Cooldown Progress (Spell)",
				["subeventPrefix"] = "SPELL",
				["use_showgcd"] = false,
				["use_spellName"] = true,
				["spellIds"] = {
				},
				["subeventSuffix"] = "_CAST_START",
				["showOn"] = "showAlways",
				["names"] = {
				},
				["unit"] = "player",
				["debuffType"] = "HELPFUL",
			},
			["desaturate"] = false,
			["progressPrecision"] = 0,
			["text1Point"] = "CENTER",
			["text2FontFlags"] = "OUTLINE",
			["height"] = 32,
			["load"] = {
				["ingroup"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["single"] = 9,
					["multi"] = {
						[9] = true,
					},
				},
				["class"] = {
					["single"] = "DEMONHUNTER",
					["multi"] = {
					},
				},
				["spec"] = {
					["single"] = 1,
					["multi"] = {
					},
				},
				["use_class"] = true,
				["race"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["role"] = {
					["multi"] = {
					},
				},
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["faction"] = {
					["multi"] = {
					},
				},
				["use_spec"] = true,
				["use_combat"] = true,
				["talent2"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["parent"] = "8.0浩劫DH_180725A",
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["text2Containment"] = "INSIDE",
			["text1Enabled"] = true,
			["text1Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["untrigger"] = {
				["showOn"] = "showAlways",
				["spellName"] = 179057,
			},
			["xOffset"] = -80,
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["regionType"] = "icon",
			["numTriggers"] = 1,
			["text1Containment"] = "INSIDE",
			["text2FontSize"] = 24,
			["text2Font"] = "Friz Quadrata TT",
			["anchorFrameType"] = "SCREEN",
			["text1"] = "%p",
			["frameStrata"] = 1,
			["text1FontFlags"] = "OUTLINE",
			["zoom"] = 0,
			["auto"] = true,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["id"] = "混乱新星 冷却",
			["text2"] = "%p",
			["text2Enabled"] = false,
			["width"] = 32,
			["stickyDuration"] = false,
			["text1Font"] = "Friz Quadrata TT",
			["inverse"] = false,
			["text2Point"] = "CENTER",
			["conditions"] = {
			},
			["cooldown"] = true,
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["main"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["finish"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
			},
		},
		["变身 特效 右"] = {
			["modelIsUnit"] = false,
			["borderBackdrop"] = "Blizzard Tooltip",
			["api"] = false,
			["disjunctive"] = "all",
			["untrigger"] = {
			},
			["anchorPoint"] = "CENTER",
			["model_x"] = 0,
			["borderColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0.5, -- [4]
			},
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["portraitZoom"] = false,
			["internalVersion"] = 5,
			["advance"] = true,
			["model_path"] = "spells/7fx_legioninvasion_electricchest.m2",
			["trigger"] = {
				["type"] = "aura",
				["subeventSuffix"] = "_CAST_START",
				["ownOnly"] = true,
				["event"] = "Health",
				["names"] = {
					"恶魔变形", -- [1]
				},
				["spellIds"] = {
					162264, -- [1]
				},
				["custom_hide"] = "timed",
				["showOn"] = "showOnActive",
				["unit"] = "player",
				["subeventPrefix"] = "SPELL",
				["debuffType"] = "HELPFUL",
			},
			["rotation"] = 0,
			["model_st_tx"] = -20,
			["height"] = 180,
			["load"] = {
				["ingroup"] = {
					["multi"] = {
					},
				},
				["talent2"] = {
					["multi"] = {
					},
				},
				["use_never"] = false,
				["talent"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["single"] = "DEMONHUNTER",
					["multi"] = {
					},
				},
				["spec"] = {
					["single"] = 1,
					["multi"] = {
					},
				},
				["use_class"] = true,
				["role"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["faction"] = {
					["multi"] = {
					},
				},
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["use_spec"] = true,
				["use_combat"] = true,
				["use_petbattle"] = false,
				["size"] = {
					["multi"] = {
					},
				},
			},
			["backdropColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0.5, -- [4]
			},
			["model_st_ty"] = 0,
			["sequence"] = 1,
			["parent"] = "8.0浩劫DH_180725A",
			["scale"] = 1,
			["activeTriggerMode"] = -10,
			["border"] = false,
			["borderEdge"] = "None",
			["regionType"] = "model",
			["borderSize"] = 16,
			["model_st_us"] = 80,
			["xOffset"] = 50,
			["model_st_rz"] = 0,
			["init_completed"] = 1,
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["main"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["finish"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
			},
			["model_st_ry"] = 0,
			["borderOffset"] = 5,
			["model_z"] = 0,
			["id"] = "变身 特效 右",
			["width"] = 300,
			["additional_triggers"] = {
			},
			["model_y"] = 0,
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["model_st_rx"] = 270,
			["borderInset"] = 11,
			["numTriggers"] = 1,
			["selfPoint"] = "CENTER",
			["conditions"] = {
			},
			["model_st_tz"] = 0,
			["yOffset"] = 5,
		},
		["恶魔变形 发光"] = {
			["glow"] = true,
			["text1FontSize"] = 14,
			["cooldownTextEnabled"] = true,
			["yOffset"] = -16,
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = 0,
			["customTextUpdate"] = "update",
			["icon"] = true,
			["internalVersion"] = 5,
			["keepAspectRatio"] = false,
			["selfPoint"] = "CENTER",
			["trigger"] = {
				["type"] = "status",
				["spellName"] = 191427,
				["unevent"] = "auto",
				["use_showOn"] = true,
				["realSpellName"] = "恶魔变形",
				["event"] = "Cooldown Progress (Spell)",
				["subeventPrefix"] = "SPELL",
				["use_showgcd"] = false,
				["use_spellName"] = true,
				["spellIds"] = {
				},
				["subeventSuffix"] = "_CAST_START",
				["showOn"] = "showOnReady",
				["names"] = {
				},
				["unit"] = "player",
				["debuffType"] = "HELPFUL",
			},
			["desaturate"] = false,
			["progressPrecision"] = 0,
			["text1Point"] = "CENTER",
			["text2FontFlags"] = "OUTLINE",
			["height"] = 32,
			["load"] = {
				["ingroup"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["single"] = "DEMONHUNTER",
					["multi"] = {
					},
				},
				["spec"] = {
					["single"] = 1,
					["multi"] = {
					},
				},
				["use_class"] = true,
				["race"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["role"] = {
					["multi"] = {
					},
				},
				["use_spec"] = true,
				["faction"] = {
					["multi"] = {
					},
				},
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["use_combat"] = true,
				["talent2"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["parent"] = "8.0浩劫DH_180725A",
			["text1Enabled"] = true,
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["main"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["finish"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
			},
			["text2Containment"] = "INSIDE",
			["untrigger"] = {
				["showOn"] = "showOnReady",
			},
			["text1Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["xOffset"] = -48,
			["numTriggers"] = 2,
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["regionType"] = "icon",
			["text1Containment"] = "INSIDE",
			["text1Font"] = "Friz Quadrata TT",
			["text2FontSize"] = 24,
			["width"] = 32,
			["frameStrata"] = 1,
			["text1"] = "%p",
			["text2"] = "%p",
			["additional_triggers"] = {
				{
					["trigger"] = {
						["subeventPrefix"] = "SPELL",
						["type"] = "event",
						["subeventSuffix"] = "_CAST_START",
						["unevent"] = "timed",
						["use_spellName"] = true,
						["duration"] = "3",
						["event"] = "Cooldown Ready (Spell)",
						["spellName"] = 191427,
					},
					["untrigger"] = {
						["spellName"] = 191427,
					},
				}, -- [1]
			},
			["zoom"] = 0,
			["auto"] = true,
			["text1FontFlags"] = "OUTLINE",
			["id"] = "恶魔变形 发光",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text2Enabled"] = false,
			["anchorFrameType"] = "SCREEN",
			["text2Font"] = "Friz Quadrata TT",
			["stickyDuration"] = false,
			["inverse"] = false,
			["text2Point"] = "CENTER",
			["conditions"] = {
			},
			["cooldown"] = false,
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
		},
		["邪能之刃"] = {
			["glow"] = false,
			["text1FontSize"] = 24,
			["cooldownTextEnabled"] = true,
			["untrigger"] = {
				["showOn"] = "showAlways",
				["spellName"] = 232893,
			},
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = 0,
			["customTextUpdate"] = "update",
			["icon"] = true,
			["text1Enabled"] = true,
			["keepAspectRatio"] = false,
			["selfPoint"] = "CENTER",
			["trigger"] = {
				["remaining_operator"] = "<",
				["unit"] = "player",
				["use_showgcd"] = true,
				["remaining"] = "1",
				["spellName"] = 232893,
				["type"] = "status",
				["unevent"] = "auto",
				["use_showOn"] = true,
				["event"] = "Action Usable",
				["subeventSuffix"] = "_CAST_START",
				["realSpellName"] = "邪能之刃",
				["use_spellName"] = true,
				["spellIds"] = {
				},
				["use_remaining"] = true,
				["showOn"] = "showAlways",
				["debuffType"] = "HELPFUL",
				["names"] = {
				},
				["subeventPrefix"] = "SPELL",
			},
			["desaturate"] = false,
			["text1Point"] = "CENTER",
			["text2FontFlags"] = "OUTLINE",
			["height"] = 64,
			["load"] = {
				["talent2"] = {
					["multi"] = {
					},
				},
				["ingroup"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["single"] = 3,
					["multi"] = {
					},
				},
				["class"] = {
					["single"] = "DEMONHUNTER",
					["multi"] = {
					},
				},
				["spec"] = {
					["single"] = 1,
					["multi"] = {
					},
				},
				["role"] = {
					["multi"] = {
					},
				},
				["use_talent"] = true,
				["use_class"] = true,
				["race"] = {
					["multi"] = {
					},
				},
				["use_spec"] = true,
				["faction"] = {
					["multi"] = {
					},
				},
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["use_combat"] = true,
				["difficulty"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["internalVersion"] = 5,
			["yOffset"] = 0,
			["text2Containment"] = "INSIDE",
			["animation"] = {
				["start"] = {
					["preset"] = "shrink",
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["main"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["finish"] = {
					["colorR"] = 1,
					["scalex"] = 1,
					["alphaType"] = "straight",
					["colorB"] = 1,
					["colorG"] = 1,
					["alphaFunc"] = "    function()\n    return 0\n    end\n  ",
					["use_translate"] = true,
					["use_alpha"] = false,
					["type"] = "preset",
					["translateFunc"] = "    function(progress, startX, startY, deltaX, deltaY)\n      return startX + (progress * deltaX), startY + (progress * deltaY)\n    end\n  ",
					["scaley"] = 1,
					["alpha"] = 0,
					["y"] = 0,
					["x"] = 0,
					["colorA"] = 1,
					["translateType"] = "straightTranslate",
					["rotate"] = 0,
					["preset"] = "fade",
					["duration_type"] = "seconds",
				},
			},
			["text1Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text1Containment"] = "INSIDE",
			["numTriggers"] = 2,
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["regionType"] = "icon",
			["xOffset"] = 0,
			["text1FontFlags"] = "OUTLINE",
			["text2FontSize"] = 24,
			["anchorFrameType"] = "SCREEN",
			["frameStrata"] = 1,
			["text1"] = "%p",
			["text2"] = "%p",
			["additional_triggers"] = {
				{
					["trigger"] = {
						["type"] = "status",
						["power"] = "80",
						["power_operator"] = "<=",
						["use_power"] = true,
						["event"] = "Power",
						["use_unit"] = true,
						["powertype"] = 17,
						["unevent"] = "auto",
						["subeventSuffix"] = "_CAST_START",
						["use_absorbMode"] = true,
						["subeventPrefix"] = "SPELL",
						["use_powertype"] = true,
						["unit"] = "player",
					},
					["untrigger"] = {
					},
				}, -- [1]
			},
			["zoom"] = 0,
			["auto"] = true,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["id"] = "邪能之刃",
			["text2Font"] = "Friz Quadrata TT",
			["text2Enabled"] = false,
			["width"] = 64,
			["stickyDuration"] = false,
			["text1Font"] = "Friz Quadrata TT",
			["inverse"] = false,
			["text2Point"] = "CENTER",
			["init_started"] = 1,
			["conditions"] = {
			},
			["cooldown"] = true,
			["parent"] = "8.0浩劫DH_180725A",
		},
		["刃舞"] = {
			["glow"] = false,
			["text1FontSize"] = 24,
			["cooldownTextEnabled"] = true,
			["untrigger"] = {
				["showOn"] = "showAlways",
				["spellName"] = 188499,
			},
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = 0,
			["customTextUpdate"] = "update",
			["icon"] = true,
			["text1Enabled"] = true,
			["keepAspectRatio"] = false,
			["selfPoint"] = "CENTER",
			["trigger"] = {
				["remaining_operator"] = "<",
				["unit"] = "player",
				["use_showgcd"] = true,
				["remaining"] = "1",
				["spellName"] = 188499,
				["type"] = "status",
				["unevent"] = "auto",
				["use_showOn"] = true,
				["event"] = "Action Usable",
				["subeventSuffix"] = "_CAST_START",
				["realSpellName"] = "刃舞",
				["use_spellName"] = true,
				["spellIds"] = {
				},
				["use_remaining"] = true,
				["showOn"] = "showAlways",
				["debuffType"] = "HELPFUL",
				["names"] = {
				},
				["subeventPrefix"] = "SPELL",
			},
			["desaturate"] = false,
			["text1Point"] = "CENTER",
			["text2FontFlags"] = "OUTLINE",
			["height"] = 64,
			["load"] = {
				["ingroup"] = {
					["multi"] = {
					},
				},
				["talent2"] = {
					["single"] = 19,
					["multi"] = {
						[19] = true,
					},
				},
				["talent"] = {
					["single"] = 14,
					["multi"] = {
					},
				},
				["class"] = {
					["single"] = "DEMONHUNTER",
					["multi"] = {
					},
				},
				["spec"] = {
					["single"] = 1,
					["multi"] = {
					},
				},
				["role"] = {
					["multi"] = {
					},
				},
				["use_talent"] = true,
				["use_class"] = true,
				["race"] = {
					["multi"] = {
					},
				},
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["faction"] = {
					["multi"] = {
					},
				},
				["use_spec"] = true,
				["use_combat"] = true,
				["difficulty"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["internalVersion"] = 5,
			["yOffset"] = 0,
			["text2Containment"] = "INSIDE",
			["animation"] = {
				["start"] = {
					["preset"] = "shrink",
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["main"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["finish"] = {
					["preset"] = "fade",
					["type"] = "preset",
					["duration_type"] = "seconds",
				},
			},
			["text1Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text1Containment"] = "INSIDE",
			["numTriggers"] = 3,
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["regionType"] = "icon",
			["xOffset"] = 0,
			["text1FontFlags"] = "OUTLINE",
			["text2FontSize"] = 24,
			["anchorFrameType"] = "SCREEN",
			["frameStrata"] = 1,
			["text1"] = "%p",
			["text2"] = "%p",
			["additional_triggers"] = {
				{
					["trigger"] = {
						["type"] = "status",
						["subeventSuffix"] = "_CAST_START",
						["power_operator"] = ">=",
						["use_power"] = true,
						["event"] = "Power",
						["unit"] = "player",
						["powertype"] = 17,
						["unevent"] = "auto",
						["power"] = "15",
						["use_absorbMode"] = true,
						["subeventPrefix"] = "SPELL",
						["use_powertype"] = true,
						["use_unit"] = true,
					},
					["untrigger"] = {
					},
				}, -- [1]
				{
					["trigger"] = {
						["subeventSuffix"] = "_CAST_START",
						["use_remaining"] = true,
						["use_absorbMode"] = true,
						["unevent"] = "auto",
						["use_showOn"] = true,
						["remaining_operator"] = ">=",
						["event"] = "Cooldown Progress (Spell)",
						["subeventPrefix"] = "SPELL",
						["realSpellName"] = "眼棱",
						["remaining"] = "3",
						["use_spellName"] = true,
						["type"] = "status",
						["showOn"] = "showOnCooldown",
						["use_unit"] = true,
						["unit"] = "player",
						["spellName"] = 198013,
					},
					["untrigger"] = {
						["spellName"] = 198013,
					},
				}, -- [2]
			},
			["zoom"] = 0,
			["auto"] = true,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["id"] = "刃舞",
			["text2Font"] = "Friz Quadrata TT",
			["text2Enabled"] = false,
			["width"] = 64,
			["stickyDuration"] = false,
			["text1Font"] = "Friz Quadrata TT",
			["inverse"] = false,
			["text2Point"] = "CENTER",
			["init_started"] = 1,
			["conditions"] = {
			},
			["cooldown"] = true,
			["parent"] = "8.0浩劫DH_180725A",
		},
		["投掷利刃"] = {
			["glow"] = false,
			["text1FontSize"] = 24,
			["cooldownTextEnabled"] = true,
			["untrigger"] = {
				["showOn"] = "showAlways",
				["spellName"] = 185123,
			},
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = 0,
			["customTextUpdate"] = "update",
			["icon"] = true,
			["text1Enabled"] = true,
			["keepAspectRatio"] = false,
			["selfPoint"] = "CENTER",
			["trigger"] = {
				["remaining_operator"] = "<",
				["unit"] = "player",
				["use_showgcd"] = true,
				["remaining"] = "1",
				["spellName"] = 185123,
				["type"] = "status",
				["unevent"] = "auto",
				["use_showOn"] = true,
				["event"] = "Action Usable",
				["subeventSuffix"] = "_CAST_START",
				["realSpellName"] = "投掷利刃",
				["use_spellName"] = true,
				["spellIds"] = {
				},
				["use_remaining"] = true,
				["showOn"] = "showAlways",
				["debuffType"] = "HELPFUL",
				["names"] = {
				},
				["subeventPrefix"] = "SPELL",
			},
			["desaturate"] = false,
			["text1Point"] = "CENTER",
			["text2FontFlags"] = "OUTLINE",
			["height"] = 64,
			["load"] = {
				["ingroup"] = {
					["multi"] = {
					},
				},
				["talent2"] = {
					["single"] = 19,
					["multi"] = {
						[19] = true,
					},
				},
				["talent"] = {
					["single"] = 3,
					["multi"] = {
						[14] = true,
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["single"] = "DEMONHUNTER",
					["multi"] = {
					},
				},
				["role"] = {
					["multi"] = {
					},
				},
				["use_talent"] = true,
				["use_class"] = true,
				["race"] = {
					["multi"] = {
					},
				},
				["use_spec"] = true,
				["faction"] = {
					["multi"] = {
					},
				},
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["use_combat"] = true,
				["spec"] = {
					["single"] = 1,
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["internalVersion"] = 5,
			["yOffset"] = 0,
			["text2Containment"] = "INSIDE",
			["animation"] = {
				["start"] = {
					["preset"] = "shrink",
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["main"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["finish"] = {
					["preset"] = "fade",
					["type"] = "preset",
					["duration_type"] = "seconds",
				},
			},
			["text1Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text1Containment"] = "INSIDE",
			["numTriggers"] = 1,
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["regionType"] = "icon",
			["xOffset"] = 0,
			["text1FontFlags"] = "OUTLINE",
			["text2FontSize"] = 24,
			["anchorFrameType"] = "SCREEN",
			["frameStrata"] = 1,
			["text1"] = "%p",
			["text2"] = "%p",
			["additional_triggers"] = {
			},
			["zoom"] = 0,
			["auto"] = true,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["id"] = "投掷利刃",
			["text2Font"] = "Friz Quadrata TT",
			["text2Enabled"] = false,
			["width"] = 64,
			["stickyDuration"] = false,
			["text1Font"] = "Friz Quadrata TT",
			["inverse"] = false,
			["text2Point"] = "CENTER",
			["init_started"] = 1,
			["conditions"] = {
			},
			["cooldown"] = true,
			["parent"] = "8.0浩劫DH_180725A",
		},
		["邪能弹幕 冷却"] = {
			["glow"] = false,
			["text1FontSize"] = 14,
			["cooldownTextEnabled"] = true,
			["yOffset"] = -16,
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = 0,
			["customTextUpdate"] = "update",
			["icon"] = true,
			["internalVersion"] = 5,
			["keepAspectRatio"] = false,
			["selfPoint"] = "CENTER",
			["trigger"] = {
				["type"] = "status",
				["spellName"] = 258925,
				["unevent"] = "auto",
				["use_showOn"] = true,
				["realSpellName"] = "邪能弹幕",
				["event"] = "Cooldown Progress (Spell)",
				["subeventPrefix"] = "SPELL",
				["use_showgcd"] = false,
				["use_spellName"] = true,
				["spellIds"] = {
				},
				["subeventSuffix"] = "_CAST_START",
				["showOn"] = "showAlways",
				["names"] = {
				},
				["unit"] = "player",
				["debuffType"] = "HELPFUL",
			},
			["desaturate"] = false,
			["progressPrecision"] = 0,
			["text1Point"] = "CENTER",
			["text2FontFlags"] = "OUTLINE",
			["height"] = 32,
			["load"] = {
				["talent2"] = {
					["multi"] = {
					},
				},
				["ingroup"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["single"] = 9,
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["single"] = 1,
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["use_talent"] = true,
				["use_class"] = true,
				["role"] = {
					["multi"] = {
					},
				},
				["use_spec"] = true,
				["faction"] = {
					["multi"] = {
					},
				},
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["use_combat"] = true,
				["class"] = {
					["single"] = "DEMONHUNTER",
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["parent"] = "8.0浩劫DH_180725A",
			["text2Containment"] = "INSIDE",
			["text1Enabled"] = true,
			["text1Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["main"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["finish"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
			},
			["xOffset"] = -80,
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["regionType"] = "icon",
			["numTriggers"] = 1,
			["text1Containment"] = "INSIDE",
			["text2FontSize"] = 24,
			["text2Font"] = "Friz Quadrata TT",
			["anchorFrameType"] = "SCREEN",
			["text1"] = "%p",
			["frameStrata"] = 1,
			["text1FontFlags"] = "OUTLINE",
			["zoom"] = 0,
			["auto"] = true,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["id"] = "邪能弹幕 冷却",
			["text2"] = "%p",
			["text2Enabled"] = false,
			["width"] = 32,
			["stickyDuration"] = false,
			["text1Font"] = "Friz Quadrata TT",
			["inverse"] = false,
			["text2Point"] = "CENTER",
			["conditions"] = {
			},
			["cooldown"] = true,
			["untrigger"] = {
				["showOn"] = "showAlways",
				["spellName"] = 258925,
			},
		},
		["邪能冲撞"] = {
			["glow"] = false,
			["text1FontSize"] = 24,
			["cooldownTextEnabled"] = true,
			["untrigger"] = {
				["showOn"] = "showAlways",
				["spellName"] = 195072,
			},
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = 0,
			["customTextUpdate"] = "update",
			["icon"] = true,
			["text1Enabled"] = true,
			["keepAspectRatio"] = false,
			["selfPoint"] = "CENTER",
			["trigger"] = {
				["remaining_operator"] = "<",
				["unit"] = "player",
				["use_showgcd"] = true,
				["remaining"] = "1",
				["spellName"] = 195072,
				["type"] = "status",
				["unevent"] = "auto",
				["use_showOn"] = true,
				["event"] = "Action Usable",
				["subeventSuffix"] = "_CAST_START",
				["realSpellName"] = "邪能冲撞",
				["use_spellName"] = true,
				["spellIds"] = {
				},
				["use_remaining"] = true,
				["showOn"] = "showAlways",
				["debuffType"] = "HELPFUL",
				["names"] = {
				},
				["subeventPrefix"] = "SPELL",
			},
			["desaturate"] = false,
			["text1Point"] = "CENTER",
			["text2FontFlags"] = "OUTLINE",
			["height"] = 64,
			["load"] = {
				["ingroup"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["single"] = 15,
					["multi"] = {
						[15] = true,
					},
				},
				["spec"] = {
					["single"] = 1,
					["multi"] = {
					},
				},
				["class"] = {
					["single"] = "DEMONHUNTER",
					["multi"] = {
					},
				},
				["talent2"] = {
					["single"] = 19,
					["multi"] = {
						[19] = true,
					},
				},
				["role"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["use_spec"] = true,
				["faction"] = {
					["multi"] = {
					},
				},
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["use_combat"] = true,
				["use_class"] = true,
				["size"] = {
					["multi"] = {
					},
				},
			},
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["internalVersion"] = 5,
			["yOffset"] = 0,
			["text2Containment"] = "INSIDE",
			["animation"] = {
				["start"] = {
					["preset"] = "shrink",
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["main"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["finish"] = {
					["type"] = "preset",
					["preset"] = "fade",
					["duration_type"] = "seconds",
				},
			},
			["text1Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text1Containment"] = "INSIDE",
			["numTriggers"] = 1,
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["regionType"] = "icon",
			["xOffset"] = 0,
			["text1FontFlags"] = "OUTLINE",
			["text2FontSize"] = 24,
			["anchorFrameType"] = "SCREEN",
			["frameStrata"] = 1,
			["text1"] = "%p",
			["text2"] = "%p",
			["id"] = "邪能冲撞",
			["zoom"] = 0,
			["auto"] = true,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["additional_triggers"] = {
			},
			["text2Font"] = "Friz Quadrata TT",
			["text2Enabled"] = false,
			["width"] = 64,
			["stickyDuration"] = false,
			["text1Font"] = "Friz Quadrata TT",
			["inverse"] = false,
			["text2Point"] = "CENTER",
			["init_started"] = 1,
			["conditions"] = {
			},
			["cooldown"] = true,
			["parent"] = "8.0浩劫DH_180725A",
		},
		["眼棱 魔化盲目"] = {
			["glow"] = false,
			["text1FontSize"] = 24,
			["cooldownTextEnabled"] = true,
			["untrigger"] = {
				["showOn"] = "showAlways",
				["spellName"] = 198013,
			},
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = 0,
			["customTextUpdate"] = "update",
			["icon"] = true,
			["text1Enabled"] = true,
			["keepAspectRatio"] = false,
			["selfPoint"] = "CENTER",
			["trigger"] = {
				["remaining_operator"] = "<",
				["unit"] = "player",
				["use_showgcd"] = true,
				["remaining"] = "1",
				["spellName"] = 198013,
				["type"] = "status",
				["unevent"] = "auto",
				["use_showOn"] = true,
				["event"] = "Action Usable",
				["subeventSuffix"] = "_CAST_START",
				["realSpellName"] = "眼棱",
				["use_spellName"] = true,
				["spellIds"] = {
				},
				["use_remaining"] = true,
				["showOn"] = "showAlways",
				["debuffType"] = "HELPFUL",
				["names"] = {
				},
				["subeventPrefix"] = "SPELL",
			},
			["desaturate"] = false,
			["text1Point"] = "CENTER",
			["text2FontFlags"] = "OUTLINE",
			["height"] = 64,
			["load"] = {
				["ingroup"] = {
					["multi"] = {
					},
				},
				["talent2"] = {
					["single"] = 1,
					["multi"] = {
						[19] = true,
					},
				},
				["use_talent2"] = true,
				["talent"] = {
					["single"] = 19,
					["multi"] = {
					},
				},
				["use_class"] = true,
				["spec"] = {
					["single"] = 1,
					["multi"] = {
					},
				},
				["role"] = {
					["multi"] = {
					},
				},
				["use_talent"] = true,
				["difficulty"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["use_spec"] = true,
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["faction"] = {
					["multi"] = {
					},
				},
				["use_combat"] = true,
				["class"] = {
					["single"] = "DEMONHUNTER",
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["internalVersion"] = 5,
			["yOffset"] = 0,
			["text2Containment"] = "INSIDE",
			["animation"] = {
				["start"] = {
					["preset"] = "shrink",
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["main"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["finish"] = {
					["preset"] = "fade",
					["type"] = "preset",
					["duration_type"] = "seconds",
				},
			},
			["text1Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text1Containment"] = "INSIDE",
			["numTriggers"] = 3,
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["regionType"] = "icon",
			["xOffset"] = 0,
			["text1FontFlags"] = "OUTLINE",
			["text2FontSize"] = 24,
			["anchorFrameType"] = "SCREEN",
			["frameStrata"] = 1,
			["text1"] = "%p",
			["text2"] = "%p",
			["additional_triggers"] = {
				{
					["trigger"] = {
						["type"] = "status",
						["power"] = "30",
						["power_operator"] = ">=",
						["use_power"] = true,
						["event"] = "Power",
						["unit"] = "player",
						["powertype"] = 17,
						["unevent"] = "auto",
						["subeventSuffix"] = "_CAST_START",
						["use_absorbMode"] = true,
						["subeventPrefix"] = "SPELL",
						["use_powertype"] = true,
						["use_unit"] = true,
					},
					["untrigger"] = {
					},
				}, -- [1]
				{
					["trigger"] = {
						["type"] = "status",
						["subeventSuffix"] = "_CAST_START",
						["power_operator"] = "<=",
						["use_power"] = true,
						["event"] = "Power",
						["unit"] = "player",
						["powertype"] = 17,
						["unevent"] = "auto",
						["power"] = "60",
						["use_absorbMode"] = true,
						["subeventPrefix"] = "SPELL",
						["use_powertype"] = true,
						["use_unit"] = true,
					},
					["untrigger"] = {
					},
				}, -- [2]
			},
			["zoom"] = 0,
			["auto"] = true,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["id"] = "眼棱 魔化盲目",
			["text2Font"] = "Friz Quadrata TT",
			["text2Enabled"] = false,
			["width"] = 64,
			["stickyDuration"] = false,
			["text1Font"] = "Friz Quadrata TT",
			["inverse"] = false,
			["text2Point"] = "CENTER",
			["init_started"] = 1,
			["conditions"] = {
			},
			["cooldown"] = true,
			["parent"] = "8.0浩劫DH_180725A",
		},
		["怒气进度"] = {
			["sparkWidth"] = 10,
			["stacksSize"] = 12,
			["xOffset"] = 1,
			["stacksFlags"] = "None",
			["yOffset"] = -61,
			["anchorPoint"] = "CENTER",
			["borderColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["rotateText"] = "NONE",
			["icon"] = false,
			["fontFlags"] = "OUTLINE",
			["icon_color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["selfPoint"] = "CENTER",
			["barColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["desaturate"] = false,
			["sparkOffsetY"] = 0,
			["load"] = {
				["talent2"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["ingroup"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["single"] = "DEMONHUNTER",
					["multi"] = {
					},
				},
				["spec"] = {
					["single"] = 1,
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["role"] = {
					["multi"] = {
					},
				},
				["use_spec"] = true,
				["faction"] = {
					["multi"] = {
					},
				},
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["use_combat"] = true,
				["use_class"] = true,
				["size"] = {
					["multi"] = {
					},
				},
			},
			["timerColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["useAdjustededMin"] = false,
			["regionType"] = "aurabar",
			["stacks"] = true,
			["texture"] = "Blizzard",
			["textFont"] = "Friz Quadrata TT",
			["borderOffset"] = 2,
			["spark"] = true,
			["timerFont"] = "Friz Quadrata TT",
			["alpha"] = 1,
			["borderInset"] = 1,
			["textColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["sparkOffsetX"] = 0,
			["disjunctive"] = "all",
			["untrigger"] = {
			},
			["activeTriggerMode"] = -10,
			["customTextUpdate"] = "update",
			["displayTextLeft"] = "%c",
			["internalVersion"] = 5,
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["main"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["finish"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
			},
			["backdropInFront"] = false,
			["text"] = true,
			["stickyDuration"] = false,
			["backgroundColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				0, -- [4]
			},
			["sparkTexture"] = "GarrMission_EncounterBar-Spark",
			["auto"] = true,
			["trigger"] = {
				["names"] = {
				},
				["type"] = "status",
				["class"] = "DEMONHUNTER",
				["unevent"] = "auto",
				["unit"] = "player",
				["use_absorbMode"] = true,
				["event"] = "Power",
				["subeventPrefix"] = "SPELL",
				["use_class"] = true,
				["powertype"] = 17,
				["spellIds"] = {
				},
				["subeventSuffix"] = "_CAST_START",
				["showOn"] = "showOnActive",
				["use_unit"] = true,
				["use_powertype"] = true,
				["debuffType"] = "HELPFUL",
			},
			["height"] = 18,
			["timerFlags"] = "OUTLINE",
			["zoom"] = 0,
			["sparkBlendMode"] = "ADD",
			["backdropColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0, -- [4]
			},
			["inverse"] = true,
			["borderBackdrop"] = "None",
			["timer"] = true,
			["width"] = 192,
			["stacksFont"] = "Friz Quadrata TT",
			["border"] = false,
			["borderEdge"] = "Blizzard Tooltip",
			["sparkColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["borderInFront"] = true,
			["id"] = "怒气进度",
			["icon_side"] = "LEFT",
			["textFlags"] = "None",
			["displayTextRight"] = "%c",
			["sparkHeight"] = 30,
			["color"] = {
			},
			["useAdjustededMax"] = false,
			["stacksColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["timerSize"] = 13,
			["sparkRotation"] = 0,
			["sparkHidden"] = "NEVER",
			["borderSize"] = 12,
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["sparkRotationMode"] = "AUTO",
			["textSize"] = 12,
			["numTriggers"] = 1,
			["sparkDesature"] = false,
			["orientation"] = "HORIZONTAL_INVERSE",
			["conditions"] = {
			},
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["parent"] = "8.0浩劫DH_180725A",
		},
		["血条背景"] = {
			["user_y"] = 0,
			["user_x"] = 0,
			["xOffset"] = 0,
			["untrigger"] = {
			},
			["foregroundColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["desaturateBackground"] = false,
			["activeTriggerMode"] = -10,
			["sameTexture"] = true,
			["desaturateForeground"] = false,
			["endAngle"] = 360,
			["internalVersion"] = 5,
			["selfPoint"] = "CENTER",
			["trigger"] = {
				["names"] = {
				},
				["type"] = "status",
				["use_absorbMode"] = true,
				["unevent"] = "auto",
				["unit"] = "player",
				["class"] = "DEMONHUNTER",
				["event"] = "Unit Characteristics",
				["subeventPrefix"] = "SPELL",
				["use_class"] = true,
				["powertype"] = 17,
				["spellIds"] = {
				},
				["subeventSuffix"] = "_CAST_START",
				["showOn"] = "showOnActive",
				["use_unit"] = true,
				["use_powertype"] = true,
				["debuffType"] = "HELPFUL",
			},
			["stickyDuration"] = false,
			["rotation"] = 0,
			["font"] = "Friz Quadrata TT",
			["version"] = 2,
			["height"] = 18,
			["load"] = {
				["talent2"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["ingroup"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["single"] = "DEMONHUNTER",
					["multi"] = {
					},
				},
				["spec"] = {
					["single"] = 1,
					["multi"] = {
					},
				},
				["role"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["use_spec"] = true,
				["faction"] = {
					["multi"] = {
					},
				},
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["use_combat"] = true,
				["use_class"] = true,
				["size"] = {
					["multi"] = {
					},
				},
			},
			["parent"] = "8.0浩劫DH_180725A",
			["useAdjustededMax"] = false,
			["fontSize"] = 12,
			["backgroundColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				0, -- [4]
			},
			["foregroundTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",
			["crop_x"] = 0.41,
			["regionType"] = "progresstexture",
			["mirror"] = false,
			["useAdjustededMin"] = false,
			["crop"] = 0.41,
			["anchorPoint"] = "CENTER",
			["blendMode"] = "BLEND",
			["inverse"] = true,
			["color"] = {
			},
			["slantMode"] = "INSIDE",
			["disjunctive"] = "all",
			["width"] = 192,
			["frameStrata"] = 1,
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["main"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["finish"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
			},
			["yOffset"] = -42,
			["compress"] = false,
			["id"] = "血条背景",
			["crop_y"] = 0.41,
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["startAngle"] = 0,
			["backgroundTexture"] = "Textures\\SpellActivationOverlays\\Eclipse_Sun",
			["numTriggers"] = 1,
			["textureWrapMode"] = "CLAMP",
			["orientation"] = "HORIZONTAL_INVERSE",
			["conditions"] = {
			},
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["backgroundOffset"] = 2,
		},
		["眼棱 冷却"] = {
			["glow"] = false,
			["text1FontSize"] = 14,
			["cooldownTextEnabled"] = true,
			["yOffset"] = -16,
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = 0,
			["customTextUpdate"] = "update",
			["icon"] = true,
			["internalVersion"] = 5,
			["keepAspectRatio"] = false,
			["selfPoint"] = "CENTER",
			["trigger"] = {
				["type"] = "status",
				["spellName"] = 198013,
				["unevent"] = "auto",
				["use_showOn"] = true,
				["realSpellName"] = "眼棱",
				["event"] = "Cooldown Progress (Spell)",
				["subeventPrefix"] = "SPELL",
				["use_showgcd"] = false,
				["use_spellName"] = true,
				["spellIds"] = {
				},
				["subeventSuffix"] = "_CAST_START",
				["showOn"] = "showAlways",
				["names"] = {
				},
				["unit"] = "player",
				["debuffType"] = "HELPFUL",
			},
			["desaturate"] = false,
			["progressPrecision"] = 0,
			["text1Point"] = "CENTER",
			["text2FontFlags"] = "OUTLINE",
			["height"] = 32,
			["load"] = {
				["talent2"] = {
					["multi"] = {
					},
				},
				["ingroup"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["single"] = 19,
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["single"] = 1,
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["use_talent"] = true,
				["use_class"] = true,
				["role"] = {
					["multi"] = {
					},
				},
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["faction"] = {
					["multi"] = {
					},
				},
				["use_spec"] = true,
				["use_combat"] = true,
				["class"] = {
					["single"] = "DEMONHUNTER",
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["parent"] = "8.0浩劫DH_180725A",
			["actions"] = {
				["start"] = {
				},
				["init"] = {
					["do_custom"] = false,
				},
				["finish"] = {
				},
			},
			["text2Containment"] = "INSIDE",
			["text1Enabled"] = true,
			["text1Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text2Point"] = "CENTER",
			["untrigger"] = {
				["showOn"] = "showAlways",
				["spellName"] = 198013,
			},
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["regionType"] = "icon",
			["numTriggers"] = 1,
			["xOffset"] = 48,
			["text2FontSize"] = 24,
			["text1Containment"] = "INSIDE",
			["width"] = 32,
			["text1"] = "%p",
			["frameStrata"] = 1,
			["text1Font"] = "Friz Quadrata TT",
			["zoom"] = 0,
			["auto"] = true,
			["text1FontFlags"] = "OUTLINE",
			["id"] = "眼棱 冷却",
			["text2"] = "%p",
			["text2Enabled"] = false,
			["anchorFrameType"] = "SCREEN",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text2Font"] = "Friz Quadrata TT",
			["inverse"] = false,
			["stickyDuration"] = false,
			["conditions"] = {
			},
			["cooldown"] = true,
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["main"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["finish"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
			},
		},
		["眼棱 发光"] = {
			["glow"] = true,
			["text1FontSize"] = 14,
			["cooldownTextEnabled"] = true,
			["untrigger"] = {
				["showOn"] = "showAlways",
				["spellName"] = 198013,
			},
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = 0,
			["customTextUpdate"] = "update",
			["icon"] = true,
			["internalVersion"] = 5,
			["keepAspectRatio"] = false,
			["selfPoint"] = "CENTER",
			["trigger"] = {
				["spellName"] = 198013,
				["type"] = "event",
				["use_showgcd"] = false,
				["unevent"] = "timed",
				["use_showOn"] = true,
				["duration"] = "3",
				["event"] = "Cooldown Ready (Spell)",
				["subeventPrefix"] = "SPELL",
				["realSpellName"] = "涅墨西斯",
				["use_spellName"] = true,
				["spellIds"] = {
				},
				["subeventSuffix"] = "_CAST_START",
				["showOn"] = "showAlways",
				["names"] = {
				},
				["unit"] = "player",
				["debuffType"] = "HELPFUL",
			},
			["desaturate"] = false,
			["progressPrecision"] = 0,
			["text1Point"] = "CENTER",
			["text2FontFlags"] = "OUTLINE",
			["height"] = 32,
			["load"] = {
				["talent2"] = {
					["multi"] = {
					},
				},
				["ingroup"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["single"] = 19,
					["multi"] = {
					},
				},
				["spec"] = {
					["single"] = 1,
					["multi"] = {
					},
				},
				["class"] = {
					["single"] = "DEMONHUNTER",
					["multi"] = {
					},
				},
				["role"] = {
					["multi"] = {
					},
				},
				["use_talent"] = true,
				["difficulty"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["faction"] = {
					["multi"] = {
					},
				},
				["use_spec"] = true,
				["use_combat"] = true,
				["use_class"] = true,
				["size"] = {
					["multi"] = {
					},
				},
			},
			["parent"] = "8.0浩劫DH_180725A",
			["text1Enabled"] = true,
			["actions"] = {
				["start"] = {
					["do_glow"] = false,
					["glow_action"] = "show",
					["glow_frame"] = "WeakAuras:涅墨西斯 发光",
				},
				["init"] = {
					["do_custom"] = false,
				},
				["finish"] = {
				},
			},
			["text2Containment"] = "INSIDE",
			["text2Point"] = "CENTER",
			["text1Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["yOffset"] = -16,
			["numTriggers"] = 2,
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["regionType"] = "icon",
			["xOffset"] = 48.0001220703125,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text2FontSize"] = 24,
			["width"] = 32,
			["frameStrata"] = 1,
			["text1"] = "%c",
			["text2"] = "%p",
			["id"] = "眼棱 发光",
			["zoom"] = 0,
			["auto"] = true,
			["text1Font"] = "Friz Quadrata TT",
			["additional_triggers"] = {
				{
					["trigger"] = {
						["type"] = "status",
						["subeventSuffix"] = "_CAST_START",
						["use_showOn"] = true,
						["use_absorbMode"] = true,
						["event"] = "Cooldown Progress (Spell)",
						["use_unit"] = true,
						["realSpellName"] = "眼棱",
						["use_spellName"] = true,
						["unevent"] = "auto",
						["showOn"] = "showOnReady",
						["subeventPrefix"] = "SPELL",
						["unit"] = "player",
						["spellName"] = 198013,
					},
					["untrigger"] = {
						["showOn"] = "showOnReady",
						["spellName"] = 198013,
					},
				}, -- [1]
			},
			["text1FontFlags"] = "OUTLINE",
			["text2Enabled"] = false,
			["anchorFrameType"] = "SCREEN",
			["text2Font"] = "Friz Quadrata TT",
			["stickyDuration"] = false,
			["inverse"] = false,
			["text1Containment"] = "INSIDE",
			["conditions"] = {
			},
			["cooldown"] = false,
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["main"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["finish"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
			},
		},
		["黑暗鞭笞"] = {
			["glow"] = false,
			["text1FontSize"] = 24,
			["cooldownTextEnabled"] = true,
			["untrigger"] = {
				["showOn"] = "showAlways",
				["spellName"] = 258860,
			},
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = 0,
			["customTextUpdate"] = "update",
			["icon"] = true,
			["text1Enabled"] = true,
			["keepAspectRatio"] = false,
			["selfPoint"] = "CENTER",
			["trigger"] = {
				["remaining_operator"] = "<",
				["unit"] = "player",
				["use_showgcd"] = true,
				["remaining"] = "1",
				["spellName"] = 258860,
				["type"] = "status",
				["unevent"] = "auto",
				["use_showOn"] = true,
				["event"] = "Action Usable",
				["subeventSuffix"] = "_CAST_START",
				["realSpellName"] = "黑暗鞭笞",
				["use_spellName"] = true,
				["spellIds"] = {
				},
				["use_remaining"] = true,
				["showOn"] = "showAlways",
				["debuffType"] = "HELPFUL",
				["names"] = {
				},
				["subeventPrefix"] = "SPELL",
			},
			["desaturate"] = false,
			["text1Point"] = "CENTER",
			["text2FontFlags"] = "OUTLINE",
			["height"] = 64,
			["load"] = {
				["talent2"] = {
					["single"] = 19,
					["multi"] = {
						[19] = true,
					},
				},
				["ingroup"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["single"] = 15,
					["multi"] = {
					},
				},
				["class"] = {
					["single"] = "DEMONHUNTER",
					["multi"] = {
					},
				},
				["spec"] = {
					["single"] = 1,
					["multi"] = {
					},
				},
				["role"] = {
					["multi"] = {
					},
				},
				["use_talent"] = true,
				["use_class"] = true,
				["race"] = {
					["multi"] = {
					},
				},
				["use_spec"] = true,
				["faction"] = {
					["multi"] = {
					},
				},
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["use_combat"] = true,
				["difficulty"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["internalVersion"] = 5,
			["yOffset"] = 0,
			["text2Containment"] = "INSIDE",
			["animation"] = {
				["start"] = {
					["preset"] = "shrink",
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["main"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["finish"] = {
					["preset"] = "fade",
					["type"] = "preset",
					["duration_type"] = "seconds",
				},
			},
			["text1Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text1Containment"] = "INSIDE",
			["numTriggers"] = 1,
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["regionType"] = "icon",
			["xOffset"] = 0,
			["text1FontFlags"] = "OUTLINE",
			["text2FontSize"] = 24,
			["anchorFrameType"] = "SCREEN",
			["frameStrata"] = 1,
			["text1"] = "%p",
			["text2"] = "%p",
			["additional_triggers"] = {
			},
			["zoom"] = 0,
			["auto"] = true,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["id"] = "黑暗鞭笞",
			["text2Font"] = "Friz Quadrata TT",
			["text2Enabled"] = false,
			["width"] = 64,
			["stickyDuration"] = false,
			["text1Font"] = "Friz Quadrata TT",
			["inverse"] = false,
			["text2Point"] = "CENTER",
			["init_started"] = 1,
			["conditions"] = {
			},
			["cooldown"] = true,
			["parent"] = "8.0浩劫DH_180725A",
		},
		["献祭光环 发光"] = {
			["glow"] = true,
			["text1FontSize"] = 14,
			["cooldownTextEnabled"] = true,
			["untrigger"] = {
				["showOn"] = "showAlways",
				["spellName"] = 258920,
			},
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = 0,
			["customTextUpdate"] = "update",
			["icon"] = true,
			["internalVersion"] = 5,
			["keepAspectRatio"] = false,
			["selfPoint"] = "CENTER",
			["trigger"] = {
				["spellName"] = 258920,
				["type"] = "event",
				["use_showgcd"] = false,
				["unevent"] = "timed",
				["use_showOn"] = true,
				["duration"] = "3",
				["event"] = "Cooldown Ready (Spell)",
				["subeventPrefix"] = "SPELL",
				["realSpellName"] = "献祭光环",
				["use_spellName"] = true,
				["spellIds"] = {
				},
				["subeventSuffix"] = "_CAST_START",
				["showOn"] = "showAlways",
				["names"] = {
				},
				["unit"] = "player",
				["debuffType"] = "HELPFUL",
			},
			["desaturate"] = false,
			["progressPrecision"] = 0,
			["text1Point"] = "CENTER",
			["text2FontFlags"] = "OUTLINE",
			["height"] = 32,
			["load"] = {
				["ingroup"] = {
					["multi"] = {
					},
				},
				["talent2"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["single"] = 6,
					["multi"] = {
					},
				},
				["use_class"] = true,
				["class"] = {
					["single"] = "DEMONHUNTER",
					["multi"] = {
					},
				},
				["role"] = {
					["multi"] = {
					},
				},
				["use_talent"] = true,
				["difficulty"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["faction"] = {
					["multi"] = {
					},
				},
				["use_spec"] = true,
				["use_combat"] = true,
				["spec"] = {
					["single"] = 1,
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["parent"] = "8.0浩劫DH_180725A",
			["text1Enabled"] = true,
			["actions"] = {
				["start"] = {
					["do_glow"] = false,
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["text2Containment"] = "INSIDE",
			["text2Point"] = "CENTER",
			["text1Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["yOffset"] = -16,
			["numTriggers"] = 2,
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["regionType"] = "icon",
			["xOffset"] = 80,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text2FontSize"] = 24,
			["width"] = 32,
			["frameStrata"] = 1,
			["text1"] = "%c",
			["text2"] = "%p",
			["id"] = "献祭光环 发光",
			["zoom"] = 0,
			["auto"] = true,
			["text1Font"] = "Friz Quadrata TT",
			["additional_triggers"] = {
				{
					["trigger"] = {
						["type"] = "status",
						["subeventSuffix"] = "_CAST_START",
						["use_showOn"] = true,
						["use_absorbMode"] = true,
						["event"] = "Cooldown Progress (Spell)",
						["use_unit"] = true,
						["realSpellName"] = "献祭光环",
						["use_spellName"] = true,
						["unevent"] = "auto",
						["showOn"] = "showOnReady",
						["subeventPrefix"] = "SPELL",
						["unit"] = "player",
						["spellName"] = 258920,
					},
					["untrigger"] = {
						["showOn"] = "showOnReady",
						["spellName"] = 258920,
					},
				}, -- [1]
			},
			["text1FontFlags"] = "OUTLINE",
			["text2Enabled"] = false,
			["anchorFrameType"] = "SCREEN",
			["text2Font"] = "Friz Quadrata TT",
			["stickyDuration"] = false,
			["inverse"] = false,
			["text1Containment"] = "INSIDE",
			["conditions"] = {
			},
			["cooldown"] = false,
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["main"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["finish"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
			},
		},
		["恶魔变形 特效"] = {
			["modelIsUnit"] = false,
			["borderBackdrop"] = "Blizzard Tooltip",
			["api"] = false,
			["xOffset"] = 5.00006103515625,
			["untrigger"] = {
			},
			["anchorPoint"] = "CENTER",
			["model_x"] = 0,
			["borderColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0.5, -- [4]
			},
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["portraitZoom"] = false,
			["internalVersion"] = 5,
			["advance"] = false,
			["animation"] = {
				["start"] = {
					["type"] = "preset",
					["preset"] = "shrink",
					["duration_type"] = "seconds",
				},
				["main"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["finish"] = {
					["type"] = "preset",
					["preset"] = "grow",
					["duration_type"] = "seconds",
				},
			},
			["trigger"] = {
				["type"] = "aura",
				["subeventSuffix"] = "_CAST_START",
				["ownOnly"] = true,
				["event"] = "Health",
				["names"] = {
					"恶魔变形", -- [1]
				},
				["spellIds"] = {
					162264, -- [1]
				},
				["showOn"] = "showOnActive",
				["subeventPrefix"] = "SPELL",
				["unit"] = "player",
				["debuffType"] = "HELPFUL",
			},
			["rotation"] = 0,
			["model_st_tx"] = 0,
			["height"] = 170,
			["load"] = {
				["talent2"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["single"] = "DEMONHUNTER",
					["multi"] = {
					},
				},
				["spec"] = {
					["single"] = 1,
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["use_class"] = true,
				["role"] = {
					["multi"] = {
					},
				},
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["faction"] = {
					["multi"] = {
					},
				},
				["use_spec"] = true,
				["use_combat"] = true,
				["ingroup"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["backdropColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0.5, -- [4]
			},
			["sequence"] = 135,
			["scale"] = 1,
			["border"] = false,
			["borderEdge"] = "None",
			["regionType"] = "model",
			["borderSize"] = 16,
			["model_st_us"] = 40,
			["model_path"] = "spells/cfx_demonhunter_eyebeam_beamimpact.m2",
			["model_st_rz"] = 0,
			["model_st_ty"] = 0,
			["activeTriggerMode"] = 0,
			["yOffset"] = 16.0000305175781,
			["borderOffset"] = 5,
			["model_st_ry"] = 0,
			["model_st_rx"] = 270,
			["width"] = 480,
			["id"] = "恶魔变形 特效",
			["model_y"] = -1,
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["selfPoint"] = "CENTER",
			["borderInset"] = 11,
			["numTriggers"] = 1,
			["model_z"] = 0,
			["init_started"] = 1,
			["conditions"] = {
			},
			["model_st_tz"] = 0,
			["parent"] = "8.0浩劫DH_180725A",
		},
		["涅墨西斯 状态"] = {
			["glow"] = true,
			["text1FontSize"] = 14,
			["xOffset"] = 48,
			["untrigger"] = {
			},
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = 0,
			["customTextUpdate"] = "update",
			["icon"] = true,
			["internalVersion"] = 5,
			["keepAspectRatio"] = false,
			["selfPoint"] = "CENTER",
			["trigger"] = {
				["type"] = "aura",
				["subeventSuffix"] = "_CAST_START",
				["ownOnly"] = true,
				["event"] = "Health",
				["names"] = {
					"涅墨西斯", -- [1]
				},
				["spellIds"] = {
					206491, -- [1]
				},
				["showOn"] = "showOnActive",
				["subeventPrefix"] = "SPELL",
				["unit"] = "target",
				["debuffType"] = "HARMFUL",
			},
			["desaturate"] = false,
			["progressPrecision"] = 0,
			["text1Point"] = "CENTER",
			["text2FontFlags"] = "OUTLINE",
			["height"] = 32,
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["main"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["finish"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
			},
			["load"] = {
				["talent2"] = {
					["multi"] = {
					},
				},
				["ingroup"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["single"] = 21,
					["multi"] = {
					},
				},
				["class"] = {
					["single"] = "DEMONHUNTER",
					["multi"] = {
					},
				},
				["spec"] = {
					["single"] = 1,
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["use_talent"] = true,
				["use_class"] = true,
				["role"] = {
					["multi"] = {
					},
				},
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["faction"] = {
					["multi"] = {
					},
				},
				["use_spec"] = true,
				["use_combat"] = true,
				["difficulty"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["cooldownTextEnabled"] = true,
			["actions"] = {
				["start"] = {
					["do_glow"] = true,
					["glow_action"] = "show",
					["do_custom"] = false,
					["glow_frame"] = "WeakAuras:涅墨西斯 Buff",
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["parent"] = "8.0浩劫DH_180725A",
			["text2Containment"] = "INSIDE",
			["yOffset"] = -16,
			["text1Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["numTriggers"] = 2,
			["disjunctive"] = "any",
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["regionType"] = "icon",
			["text2Font"] = "Friz Quadrata TT",
			["width"] = 32,
			["text2FontSize"] = 24,
			["frameStrata"] = 1,
			["text1FontFlags"] = "OUTLINE",
			["text1"] = "%p",
			["additional_triggers"] = {
				{
					["trigger"] = {
						["type"] = "aura",
						["subeventSuffix"] = "_CAST_START",
						["ownOnly"] = true,
						["event"] = "Health",
						["subeventPrefix"] = "SPELL",
						["spellIds"] = {
							206491, -- [1]
						},
						["showOn"] = "showOnActive",
						["names"] = {
							"涅墨西斯", -- [1]
						},
						["unit"] = "player",
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
			},
			["text1Font"] = "Friz Quadrata TT",
			["zoom"] = 0,
			["auto"] = true,
			["text2"] = "%p",
			["id"] = "涅墨西斯 状态",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text2Enabled"] = false,
			["anchorFrameType"] = "SCREEN",
			["stickyDuration"] = false,
			["text1Containment"] = "INSIDE",
			["inverse"] = false,
			["text2Point"] = "CENTER",
			["conditions"] = {
			},
			["cooldown"] = true,
			["text1Enabled"] = true,
		},
		["献祭光环 冷却"] = {
			["glow"] = false,
			["text1FontSize"] = 14,
			["cooldownTextEnabled"] = true,
			["yOffset"] = -16,
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = 0,
			["customTextUpdate"] = "update",
			["icon"] = true,
			["internalVersion"] = 5,
			["keepAspectRatio"] = false,
			["selfPoint"] = "CENTER",
			["trigger"] = {
				["type"] = "status",
				["spellName"] = 258920,
				["unevent"] = "auto",
				["use_showOn"] = true,
				["realSpellName"] = "献祭光环",
				["event"] = "Cooldown Progress (Spell)",
				["subeventPrefix"] = "SPELL",
				["use_showgcd"] = false,
				["use_spellName"] = true,
				["spellIds"] = {
				},
				["subeventSuffix"] = "_CAST_START",
				["showOn"] = "showAlways",
				["names"] = {
				},
				["unit"] = "player",
				["debuffType"] = "HELPFUL",
			},
			["desaturate"] = false,
			["progressPrecision"] = 0,
			["text1Point"] = "CENTER",
			["text2FontFlags"] = "OUTLINE",
			["height"] = 32,
			["load"] = {
				["talent2"] = {
					["multi"] = {
					},
				},
				["ingroup"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["single"] = 6,
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["single"] = "DEMONHUNTER",
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["use_talent"] = true,
				["use_class"] = true,
				["role"] = {
					["multi"] = {
					},
				},
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["faction"] = {
					["multi"] = {
					},
				},
				["use_spec"] = true,
				["use_combat"] = true,
				["spec"] = {
					["single"] = 1,
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["parent"] = "8.0浩劫DH_180725A",
			["actions"] = {
				["start"] = {
					["do_glow"] = false,
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["text2Containment"] = "INSIDE",
			["text1Enabled"] = true,
			["text1Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text2Point"] = "CENTER",
			["untrigger"] = {
				["showOn"] = "showAlways",
				["spellName"] = 258920,
			},
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["regionType"] = "icon",
			["numTriggers"] = 1,
			["xOffset"] = 80,
			["text2FontSize"] = 24,
			["text1Containment"] = "INSIDE",
			["width"] = 32,
			["text1"] = "%p",
			["frameStrata"] = 1,
			["text1Font"] = "Friz Quadrata TT",
			["zoom"] = 0,
			["auto"] = true,
			["text1FontFlags"] = "OUTLINE",
			["id"] = "献祭光环 冷却",
			["text2"] = "%p",
			["text2Enabled"] = false,
			["anchorFrameType"] = "SCREEN",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text2Font"] = "Friz Quadrata TT",
			["inverse"] = false,
			["stickyDuration"] = false,
			["conditions"] = {
			},
			["cooldown"] = true,
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["main"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["finish"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
			},
		},
		["恶魔之咬"] = {
			["glow"] = false,
			["text1FontSize"] = 24,
			["cooldownTextEnabled"] = true,
			["untrigger"] = {
				["showOn"] = "showAlways",
				["spellName"] = 162243,
			},
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = 0,
			["customTextUpdate"] = "update",
			["icon"] = true,
			["text1Enabled"] = true,
			["keepAspectRatio"] = false,
			["selfPoint"] = "CENTER",
			["trigger"] = {
				["remaining_operator"] = "<",
				["unit"] = "player",
				["use_showgcd"] = true,
				["remaining"] = "1",
				["spellName"] = 162243,
				["type"] = "status",
				["unevent"] = "auto",
				["use_showOn"] = true,
				["event"] = "Action Usable",
				["subeventSuffix"] = "_CAST_START",
				["realSpellName"] = "恶魔之咬",
				["use_spellName"] = true,
				["spellIds"] = {
				},
				["use_remaining"] = true,
				["showOn"] = "showAlways",
				["debuffType"] = "HELPFUL",
				["names"] = {
				},
				["subeventPrefix"] = "SPELL",
			},
			["desaturate"] = false,
			["text1Point"] = "CENTER",
			["text2FontFlags"] = "OUTLINE",
			["height"] = 64,
			["load"] = {
				["talent2"] = {
					["single"] = 19,
					["multi"] = {
						[19] = true,
					},
				},
				["talent"] = {
					["single"] = 15,
					["multi"] = {
						[15] = true,
					},
				},
				["class"] = {
					["single"] = "DEMONHUNTER",
					["multi"] = {
					},
				},
				["spec"] = {
					["single"] = 1,
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["role"] = {
					["multi"] = {
					},
				},
				["use_class"] = true,
				["race"] = {
					["multi"] = {
					},
				},
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["faction"] = {
					["multi"] = {
					},
				},
				["use_spec"] = true,
				["use_combat"] = true,
				["ingroup"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["internalVersion"] = 5,
			["yOffset"] = 0,
			["text2Containment"] = "INSIDE",
			["animation"] = {
				["start"] = {
					["preset"] = "shrink",
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["main"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["finish"] = {
					["preset"] = "fade",
					["type"] = "preset",
					["duration_type"] = "seconds",
				},
			},
			["text1Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text1Containment"] = "INSIDE",
			["numTriggers"] = 1,
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["regionType"] = "icon",
			["xOffset"] = 0,
			["text1FontFlags"] = "OUTLINE",
			["text2FontSize"] = 24,
			["anchorFrameType"] = "SCREEN",
			["frameStrata"] = 1,
			["text1"] = "%p",
			["text2"] = "%p",
			["additional_triggers"] = {
			},
			["zoom"] = 0,
			["auto"] = true,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["id"] = "恶魔之咬",
			["text2Font"] = "Friz Quadrata TT",
			["text2Enabled"] = false,
			["width"] = 64,
			["stickyDuration"] = false,
			["text1Font"] = "Friz Quadrata TT",
			["inverse"] = false,
			["text2Point"] = "CENTER",
			["init_started"] = 1,
			["conditions"] = {
			},
			["cooldown"] = true,
			["parent"] = "8.0浩劫DH_180725A",
		},
		["恶魔变形 特效 2"] = {
			["modelIsUnit"] = false,
			["borderBackdrop"] = "Blizzard Tooltip",
			["api"] = false,
			["xOffset"] = 0,
			["untrigger"] = {
			},
			["anchorPoint"] = "CENTER",
			["model_x"] = 0,
			["borderColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0.5, -- [4]
			},
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["portraitZoom"] = false,
			["internalVersion"] = 5,
			["advance"] = false,
			["model_path"] = "spells/cfx_demonhunter_demonspikes_statechest.m2",
			["trigger"] = {
				["type"] = "aura",
				["subeventSuffix"] = "_CAST_START",
				["ownOnly"] = true,
				["event"] = "Health",
				["names"] = {
					"恶魔变形", -- [1]
				},
				["spellIds"] = {
					162264, -- [1]
				},
				["showOn"] = "showOnActive",
				["subeventPrefix"] = "SPELL",
				["unit"] = "player",
				["debuffType"] = "HELPFUL",
			},
			["rotation"] = 0,
			["model_st_tx"] = 0,
			["height"] = 192.000762939453,
			["load"] = {
				["ingroup"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["single"] = "DEMONHUNTER",
					["multi"] = {
					},
				},
				["spec"] = {
					["single"] = 1,
					["multi"] = {
					},
				},
				["talent2"] = {
					["multi"] = {
					},
				},
				["role"] = {
					["multi"] = {
					},
				},
				["use_class"] = true,
				["race"] = {
					["multi"] = {
					},
				},
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["faction"] = {
					["multi"] = {
					},
				},
				["use_spec"] = true,
				["use_combat"] = true,
				["difficulty"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["backdropColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0.5, -- [4]
			},
			["sequence"] = 135,
			["scale"] = 1,
			["border"] = false,
			["borderEdge"] = "None",
			["regionType"] = "model",
			["borderSize"] = 16,
			["model_st_us"] = 40,
			["animation"] = {
				["start"] = {
					["preset"] = "shrink",
					["type"] = "preset",
					["duration_type"] = "seconds",
				},
				["main"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["finish"] = {
					["preset"] = "grow",
					["type"] = "preset",
					["duration_type"] = "seconds",
				},
			},
			["model_st_rz"] = 0,
			["model_st_ty"] = 0,
			["activeTriggerMode"] = 0,
			["yOffset"] = 40,
			["borderOffset"] = 5,
			["model_st_ry"] = 0,
			["model_st_rx"] = 270,
			["width"] = 318.001831054688,
			["id"] = "恶魔变形 特效 2",
			["model_y"] = 0,
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["selfPoint"] = "CENTER",
			["borderInset"] = 11,
			["numTriggers"] = 1,
			["model_z"] = 0,
			["init_started"] = 1,
			["conditions"] = {
			},
			["model_st_tz"] = 0,
			["parent"] = "8.0浩劫DH_180725A",
		},
		["血条进度"] = {
			["sparkWidth"] = 10,
			["stacksSize"] = 12,
			["xOffset"] = 1,
			["stacksFlags"] = "None",
			["yOffset"] = -42,
			["anchorPoint"] = "CENTER",
			["borderColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["rotateText"] = "NONE",
			["icon"] = false,
			["fontFlags"] = "OUTLINE",
			["icon_color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["selfPoint"] = "CENTER",
			["barColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["desaturate"] = false,
			["sparkOffsetY"] = 0,
			["load"] = {
				["talent2"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["ingroup"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["single"] = "DEMONHUNTER",
					["multi"] = {
					},
				},
				["spec"] = {
					["single"] = 1,
					["multi"] = {
					},
				},
				["role"] = {
					["multi"] = {
					},
				},
				["use_class"] = true,
				["race"] = {
					["multi"] = {
					},
				},
				["faction"] = {
					["multi"] = {
					},
				},
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["use_spec"] = true,
				["use_combat"] = true,
				["difficulty"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["timerColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["useAdjustededMin"] = false,
			["regionType"] = "aurabar",
			["stacks"] = true,
			["texture"] = "Armory",
			["textFont"] = "Friz Quadrata TT",
			["sparkTexture"] = "GarrMission_EncounterBar-Spark",
			["spark"] = true,
			["timerFont"] = "Friz Quadrata TT",
			["alpha"] = 1,
			["borderInset"] = 1,
			["textColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["sparkOffsetX"] = 0,
			["disjunctive"] = "all",
			["untrigger"] = {
			},
			["activeTriggerMode"] = -10,
			["customTextUpdate"] = "update",
			["displayTextLeft"] = "%c",
			["internalVersion"] = 5,
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["main"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["finish"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
			},
			["backdropInFront"] = false,
			["text"] = true,
			["stickyDuration"] = false,
			["backgroundColor"] = {
				0.0117647058823529, -- [1]
				0.407843137254902, -- [2]
				0, -- [3]
				0.350000023841858, -- [4]
			},
			["zoom"] = 0,
			["auto"] = true,
			["color"] = {
			},
			["height"] = 18,
			["timerFlags"] = "OUTLINE",
			["borderOffset"] = 2,
			["sparkBlendMode"] = "ADD",
			["backdropColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0, -- [4]
			},
			["inverse"] = true,
			["stacksFont"] = "Friz Quadrata TT",
			["trigger"] = {
				["names"] = {
				},
				["type"] = "status",
				["use_absorbMode"] = true,
				["unevent"] = "auto",
				["unit"] = "player",
				["class"] = "DEMONHUNTER",
				["event"] = "Health",
				["subeventPrefix"] = "SPELL",
				["use_class"] = true,
				["powertype"] = 17,
				["spellIds"] = {
				},
				["subeventSuffix"] = "_CAST_START",
				["showOn"] = "showOnActive",
				["use_unit"] = true,
				["use_powertype"] = true,
				["debuffType"] = "HELPFUL",
			},
			["width"] = 192,
			["sparkRotationMode"] = "AUTO",
			["border"] = false,
			["borderEdge"] = "Blizzard Tooltip",
			["sparkRotation"] = 0,
			["borderSize"] = 12,
			["id"] = "血条进度",
			["icon_side"] = "LEFT",
			["sparkColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["timerSize"] = 13,
			["sparkHeight"] = 30,
			["textFlags"] = "None",
			["useAdjustededMax"] = false,
			["stacksColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["displayTextRight"] = "%c",
			["borderInFront"] = true,
			["sparkHidden"] = "NEVER",
			["borderBackdrop"] = "None",
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["timer"] = true,
			["textSize"] = 12,
			["numTriggers"] = 1,
			["sparkDesature"] = false,
			["orientation"] = "HORIZONTAL_INVERSE",
			["conditions"] = {
			},
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["parent"] = "8.0浩劫DH_180725A",
		},
		["8.0浩劫DH_180725A"] = {
			["backdropColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0.5, -- [4]
			},
			["controlledChildren"] = {
				"恶魔变形 特效 2", -- [1]
				"恶魔变形 特效", -- [2]
				"变身 特效 左", -- [3]
				"变身 特效 右", -- [4]
				"邪能冲撞", -- [5]
				"恶魔之咬", -- [6]
				"投掷利刃", -- [7]
				"混乱打击", -- [8]
				"刃舞", -- [9]
				"恶魔之咬 魔化", -- [10]
				"眼棱 魔化食欲", -- [11]
				"眼棱 魔化盲目", -- [12]
				"黑暗鞭笞", -- [13]
				"眼棱 邪能", -- [14]
				"献祭光环", -- [15]
				"邪能之刃", -- [16]
				"GCD", -- [17]
				"恶魔变形 增益", -- [18]
				"恶魔变形 冷却", -- [19]
				"恶魔变形 发光", -- [20]
				"混乱新星 冷却", -- [21]
				"混乱新星 发光", -- [22]
				"邪能弹幕 冷却", -- [23]
				"邪能弹幕 发光", -- [24]
				"邪能冲撞 冷却", -- [25]
				"势如破竹 增益", -- [26]
				"眼棱 冷却", -- [27]
				"眼棱 发光", -- [28]
				"涅墨西斯 冷却", -- [29]
				"涅墨西斯 状态", -- [30]
				"涅墨西斯 发光", -- [31]
				"瓦解 冷却", -- [32]
				"瓦解 发光", -- [33]
				"献祭光环 冷却", -- [34]
				"献祭光环 增益", -- [35]
				"献祭光环 发光", -- [36]
				"血条背景", -- [37]
				"血条材质", -- [38]
				"血条进度", -- [39]
				"血条边框", -- [40]
				"怒气背景", -- [41]
				"怒气材质", -- [42]
				"怒气进度", -- [43]
				"怒气边框", -- [44]
			},
			["borderBackdrop"] = "Blizzard Tooltip",
			["xOffset"] = 0,
			["border"] = false,
			["untrigger"] = {
			},
			["regionType"] = "group",
			["borderSize"] = 16,
			["activeTriggerMode"] = -10,
			["scale"] = 1,
			["disjunctive"] = "all",
			["expanded"] = false,
			["anchorPoint"] = "CENTER",
			["internalVersion"] = 5,
			["borderOffset"] = 5,
			["trigger"] = {
				["type"] = "aura",
				["subeventSuffix"] = "_CAST_START",
				["event"] = "Health",
				["unit"] = "player",
				["spellIds"] = {
				},
				["showOn"] = "showOnActive",
				["subeventPrefix"] = "SPELL",
				["names"] = {
				},
				["debuffType"] = "HELPFUL",
			},
			["selfPoint"] = "BOTTOMLEFT",
			["id"] = "8.0浩劫DH_180725A",
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["main"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["finish"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
			},
			["frameStrata"] = 2,
			["anchorFrameType"] = "SCREEN",
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["borderInset"] = 11,
			["numTriggers"] = 1,
			["borderColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0.5, -- [4]
			},
			["borderEdge"] = "None",
			["conditions"] = {
			},
			["load"] = {
				["talent2"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["single"] = "DEMONHUNTER",
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["use_class"] = "true",
				["race"] = {
					["multi"] = {
					},
				},
				["faction"] = {
					["multi"] = {
					},
				},
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["ingroup"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["role"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["yOffset"] = -240.999755859375,
		},
		["血条材质"] = {
			["modelIsUnit"] = false,
			["borderBackdrop"] = "Blizzard Tooltip",
			["api"] = false,
			["xOffset"] = 0,
			["untrigger"] = {
			},
			["anchorPoint"] = "CENTER",
			["model_x"] = 0,
			["borderColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0.5, -- [4]
			},
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["portraitZoom"] = false,
			["internalVersion"] = 5,
			["advance"] = false,
			["model_path"] = "spells/cfx_demonhunter_shatteredsouls_missile_02fel.m2",
			["trigger"] = {
				["use_unitisunit"] = false,
				["type"] = "status",
				["subeventPrefix"] = "SPELL",
				["unevent"] = "auto",
				["use_class"] = true,
				["use_absorbMode"] = true,
				["event"] = "Unit Characteristics",
				["use_unit"] = true,
				["use_name"] = false,
				["subeventSuffix"] = "_CAST_START",
				["spellIds"] = {
				},
				["unit"] = "player",
				["showOn"] = "showOnActive",
				["names"] = {
				},
				["class"] = "DEMONHUNTER",
				["debuffType"] = "HELPFUL",
			},
			["rotation"] = 0,
			["model_st_tx"] = 0,
			["height"] = 18,
			["load"] = {
				["talent2"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["ingroup"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["single"] = "DEMONHUNTER",
					["multi"] = {
					},
				},
				["spec"] = {
					["single"] = 1,
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["role"] = {
					["multi"] = {
					},
				},
				["use_spec"] = true,
				["faction"] = {
					["multi"] = {
					},
				},
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["use_combat"] = true,
				["use_class"] = true,
				["size"] = {
					["multi"] = {
					},
				},
			},
			["backdropColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0.5, -- [4]
			},
			["sequence"] = 1,
			["scale"] = 1,
			["parent"] = "8.0浩劫DH_180725A",
			["border"] = false,
			["borderEdge"] = "None",
			["regionType"] = "model",
			["borderSize"] = 16,
			["model_st_us"] = 40,
			["yOffset"] = -42,
			["model_st_rz"] = 0,
			["model_st_ty"] = 0,
			["disjunctive"] = "all",
			["selfPoint"] = "CENTER",
			["model_st_ry"] = 0,
			["borderOffset"] = 5,
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["main"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["finish"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
			},
			["model_st_rx"] = 270,
			["id"] = "血条材质",
			["model_y"] = 1.5,
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["width"] = 192,
			["borderInset"] = 11,
			["numTriggers"] = 1,
			["model_z"] = 4,
			["conditions"] = {
			},
			["model_st_tz"] = 0,
			["activeTriggerMode"] = -10,
		},
		["献祭光环"] = {
			["glow"] = false,
			["text1FontSize"] = 24,
			["cooldownTextEnabled"] = true,
			["untrigger"] = {
				["showOn"] = "showAlways",
			},
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = 0,
			["customTextUpdate"] = "update",
			["icon"] = true,
			["text1Enabled"] = true,
			["keepAspectRatio"] = false,
			["selfPoint"] = "CENTER",
			["trigger"] = {
				["remaining_operator"] = "<",
				["unit"] = "player",
				["use_showgcd"] = true,
				["remaining"] = "1",
				["spellName"] = 258920,
				["type"] = "status",
				["unevent"] = "auto",
				["use_showOn"] = true,
				["event"] = "Action Usable",
				["subeventSuffix"] = "_CAST_START",
				["realSpellName"] = "献祭光环",
				["use_spellName"] = true,
				["spellIds"] = {
				},
				["use_remaining"] = true,
				["showOn"] = "showAlways",
				["debuffType"] = "HELPFUL",
				["names"] = {
				},
				["subeventPrefix"] = "SPELL",
			},
			["desaturate"] = false,
			["text1Point"] = "CENTER",
			["text2FontFlags"] = "OUTLINE",
			["height"] = 64,
			["load"] = {
				["talent2"] = {
					["multi"] = {
					},
				},
				["ingroup"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["single"] = 6,
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["single"] = "DEMONHUNTER",
					["multi"] = {
					},
				},
				["role"] = {
					["multi"] = {
					},
				},
				["use_talent"] = true,
				["use_class"] = true,
				["race"] = {
					["multi"] = {
					},
				},
				["use_spec"] = true,
				["faction"] = {
					["multi"] = {
					},
				},
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["use_combat"] = true,
				["spec"] = {
					["single"] = 1,
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["internalVersion"] = 5,
			["yOffset"] = 0,
			["text2Containment"] = "INSIDE",
			["animation"] = {
				["start"] = {
					["preset"] = "shrink",
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["main"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["finish"] = {
					["translateType"] = "straightTranslate",
					["scalex"] = 1,
					["alphaType"] = "straight",
					["colorB"] = 1,
					["colorG"] = 1,
					["alphaFunc"] = "    function()\n    return 0\n    end\n  ",
					["use_translate"] = true,
					["use_alpha"] = false,
					["type"] = "preset",
					["translateFunc"] = "    function(progress, startX, startY, deltaX, deltaY)\n      return startX + (progress * deltaX), startY + (progress * deltaY)\n    end\n  ",
					["scaley"] = 1,
					["alpha"] = 0,
					["y"] = 0,
					["x"] = 0,
					["preset"] = "fade",
					["colorR"] = 1,
					["rotate"] = 0,
					["colorA"] = 1,
					["duration_type"] = "seconds",
				},
			},
			["text1Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text1Containment"] = "INSIDE",
			["numTriggers"] = 2,
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["regionType"] = "icon",
			["xOffset"] = 0,
			["text1FontFlags"] = "OUTLINE",
			["text2FontSize"] = 24,
			["anchorFrameType"] = "SCREEN",
			["frameStrata"] = 1,
			["text1"] = "%p",
			["text2"] = "%p",
			["id"] = "献祭光环",
			["zoom"] = 0,
			["auto"] = true,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["additional_triggers"] = {
				{
					["trigger"] = {
						["type"] = "status",
						["subeventSuffix"] = "_CAST_START",
						["power_operator"] = "<=",
						["use_power"] = true,
						["event"] = "Power",
						["unit"] = "player",
						["powertype"] = 17,
						["unevent"] = "auto",
						["power"] = "100",
						["use_absorbMode"] = true,
						["subeventPrefix"] = "SPELL",
						["use_powertype"] = true,
						["use_unit"] = true,
					},
					["untrigger"] = {
					},
				}, -- [1]
			},
			["text2Font"] = "Friz Quadrata TT",
			["text2Enabled"] = false,
			["width"] = 64,
			["stickyDuration"] = false,
			["text1Font"] = "Friz Quadrata TT",
			["inverse"] = false,
			["text2Point"] = "CENTER",
			["init_started"] = 1,
			["conditions"] = {
			},
			["cooldown"] = true,
			["parent"] = "8.0浩劫DH_180725A",
		},
		["血条边框"] = {
			["textFlags"] = "OUTLINE",
			["stacksSize"] = 12,
			["xOffset"] = 0,
			["stacksFlags"] = "None",
			["yOffset"] = -42,
			["anchorPoint"] = "CENTER",
			["borderColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["rotateText"] = "NONE",
			["icon"] = false,
			["fontFlags"] = "OUTLINE",
			["icon_color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["selfPoint"] = "CENTER",
			["barColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				0, -- [4]
			},
			["desaturate"] = false,
			["progressPrecision"] = 0,
			["sparkOffsetY"] = 0,
			["load"] = {
				["talent2"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["ingroup"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["single"] = "DEMONHUNTER",
					["multi"] = {
					},
				},
				["spec"] = {
					["single"] = 1,
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["role"] = {
					["multi"] = {
					},
				},
				["use_spec"] = true,
				["faction"] = {
					["multi"] = {
					},
				},
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["use_combat"] = true,
				["use_class"] = true,
				["size"] = {
					["multi"] = {
					},
				},
			},
			["timerColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["useAdjustededMin"] = false,
			["regionType"] = "aurabar",
			["stacks"] = true,
			["texture"] = "Blizzard",
			["textFont"] = "Friz Quadrata TT",
			["borderOffset"] = 2,
			["spark"] = false,
			["timerFont"] = "Friz Quadrata TT",
			["alpha"] = 1,
			["borderInset"] = 1,
			["textColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["sparkOffsetX"] = 0,
			["disjunctive"] = "all",
			["untrigger"] = {
			},
			["activeTriggerMode"] = -10,
			["customTextUpdate"] = "update",
			["textSize"] = 14,
			["internalVersion"] = 5,
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["main"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["finish"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
			},
			["trigger"] = {
				["names"] = {
				},
				["type"] = "status",
				["class"] = "DEMONHUNTER",
				["unevent"] = "auto",
				["unit"] = "player",
				["use_absorbMode"] = true,
				["event"] = "Health",
				["subeventPrefix"] = "SPELL",
				["use_class"] = true,
				["powertype"] = 17,
				["spellIds"] = {
				},
				["subeventSuffix"] = "_CAST_START",
				["showOn"] = "showOnActive",
				["use_unit"] = true,
				["use_powertype"] = true,
				["debuffType"] = "HELPFUL",
			},
			["text"] = true,
			["stickyDuration"] = false,
			["zoom"] = 0,
			["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
			["displayTextLeft"] = "%c",
			["height"] = 18,
			["timerFlags"] = "OUTLINE",
			["timer"] = true,
			["sparkBlendMode"] = "ADD",
			["backdropColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0, -- [4]
			},
			["stacksFont"] = "Friz Quadrata TT",
			["numTriggers"] = 1,
			["backgroundColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				0, -- [4]
			},
			["useAdjustededMax"] = false,
			["width"] = 192,
			["border"] = true,
			["borderEdge"] = "Blizzard Tooltip",
			["borderInFront"] = true,
			["borderSize"] = 10,
			["sparkRotation"] = 0,
			["icon_side"] = "RIGHT",
			["id"] = "血条边框",
			["sparkWidth"] = 10,
			["sparkHeight"] = 30,
			["displayTextRight"] = "%p",
			["borderBackdrop"] = "None",
			["stacksColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["timerSize"] = 14,
			["sparkColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["sparkHidden"] = "NEVER",
			["sparkRotationMode"] = "AUTO",
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["backdropInFront"] = false,
			["auto"] = true,
			["inverse"] = true,
			["sparkDesature"] = false,
			["orientation"] = "HORIZONTAL",
			["conditions"] = {
			},
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["parent"] = "8.0浩劫DH_180725A",
		},
		["怒气材质"] = {
			["modelIsUnit"] = false,
			["borderBackdrop"] = "Blizzard Tooltip",
			["api"] = false,
			["xOffset"] = 0.00018310546875,
			["untrigger"] = {
			},
			["anchorPoint"] = "CENTER",
			["model_x"] = 0,
			["borderColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0.5, -- [4]
			},
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["portraitZoom"] = false,
			["internalVersion"] = 5,
			["advance"] = false,
			["model_path"] = "spells/cfx_demonhunter_shatteredsouls_missile.m2",
			["trigger"] = {
				["use_unitisunit"] = false,
				["type"] = "status",
				["subeventPrefix"] = "SPELL",
				["unevent"] = "auto",
				["use_class"] = true,
				["use_absorbMode"] = true,
				["event"] = "Unit Characteristics",
				["use_unit"] = true,
				["use_name"] = false,
				["subeventSuffix"] = "_CAST_START",
				["spellIds"] = {
				},
				["unit"] = "player",
				["showOn"] = "showOnActive",
				["names"] = {
				},
				["class"] = "DEMONHUNTER",
				["debuffType"] = "HELPFUL",
			},
			["rotation"] = 0,
			["model_st_tx"] = 0,
			["height"] = 18,
			["load"] = {
				["talent2"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["ingroup"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["single"] = "DEMONHUNTER",
					["multi"] = {
					},
				},
				["spec"] = {
					["single"] = 1,
					["multi"] = {
					},
				},
				["role"] = {
					["multi"] = {
					},
				},
				["use_class"] = true,
				["race"] = {
					["multi"] = {
					},
				},
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["use_spec"] = true,
				["faction"] = {
					["multi"] = {
					},
				},
				["use_combat"] = true,
				["difficulty"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["backdropColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0.5, -- [4]
			},
			["sequence"] = 1,
			["scale"] = 1,
			["parent"] = "8.0浩劫DH_180725A",
			["border"] = false,
			["borderEdge"] = "None",
			["regionType"] = "model",
			["borderSize"] = 16,
			["model_st_us"] = 40,
			["yOffset"] = -61,
			["model_st_rz"] = 0,
			["model_st_ty"] = 0,
			["disjunctive"] = "all",
			["selfPoint"] = "CENTER",
			["model_st_ry"] = 0,
			["borderOffset"] = 5,
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["main"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["finish"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
			},
			["model_st_rx"] = 270,
			["id"] = "怒气材质",
			["model_y"] = 1.5,
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["width"] = 192,
			["borderInset"] = 11,
			["numTriggers"] = 1,
			["model_z"] = 4,
			["conditions"] = {
			},
			["model_st_tz"] = 0,
			["activeTriggerMode"] = -10,
		},
		["怒气边框"] = {
			["textFlags"] = "OUTLINE",
			["stacksSize"] = 12,
			["xOffset"] = 0,
			["stacksFlags"] = "None",
			["yOffset"] = -61,
			["anchorPoint"] = "CENTER",
			["borderColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["rotateText"] = "NONE",
			["backgroundColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				0, -- [4]
			},
			["fontFlags"] = "OUTLINE",
			["icon_color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["selfPoint"] = "CENTER",
			["barColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				0, -- [4]
			},
			["desaturate"] = false,
			["sparkOffsetY"] = 0,
			["load"] = {
				["talent2"] = {
					["multi"] = {
					},
				},
				["use_never"] = false,
				["talent"] = {
					["multi"] = {
					},
				},
				["ingroup"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["single"] = "DEMONHUNTER",
					["multi"] = {
					},
				},
				["spec"] = {
					["single"] = 1,
					["multi"] = {
					},
				},
				["role"] = {
					["multi"] = {
					},
				},
				["use_class"] = true,
				["race"] = {
					["multi"] = {
					},
				},
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["use_spec"] = true,
				["faction"] = {
					["multi"] = {
					},
				},
				["use_combat"] = true,
				["difficulty"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["timerColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["useAdjustededMin"] = false,
			["regionType"] = "aurabar",
			["stacks"] = true,
			["texture"] = "Blizzard",
			["textFont"] = "Friz Quadrata TT",
			["borderOffset"] = 2,
			["spark"] = false,
			["timerFont"] = "Friz Quadrata TT",
			["alpha"] = 1,
			["borderInset"] = 1,
			["textColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["sparkOffsetX"] = 0,
			["disjunctive"] = "all",
			["untrigger"] = {
			},
			["activeTriggerMode"] = -10,
			["customTextUpdate"] = "update",
			["textSize"] = 14,
			["internalVersion"] = 5,
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["main"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["finish"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
			},
			["backdropInFront"] = false,
			["text"] = true,
			["stickyDuration"] = false,
			["zoom"] = 0,
			["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
			["displayTextLeft"] = "%c",
			["height"] = 18,
			["timerFlags"] = "OUTLINE",
			["timer"] = true,
			["sparkBlendMode"] = "ADD",
			["backdropColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0, -- [4]
			},
			["trigger"] = {
				["names"] = {
				},
				["type"] = "status",
				["use_absorbMode"] = true,
				["unevent"] = "auto",
				["unit"] = "player",
				["class"] = "DEMONHUNTER",
				["event"] = "Power",
				["subeventPrefix"] = "SPELL",
				["use_class"] = true,
				["powertype"] = 17,
				["spellIds"] = {
				},
				["subeventSuffix"] = "_CAST_START",
				["showOn"] = "showOnActive",
				["use_unit"] = true,
				["use_powertype"] = true,
				["debuffType"] = "HELPFUL",
			},
			["inverse"] = true,
			["useAdjustededMax"] = false,
			["icon"] = false,
			["width"] = 192,
			["border"] = true,
			["borderEdge"] = "Blizzard Tooltip",
			["borderSize"] = 10,
			["borderInFront"] = true,
			["sparkRotation"] = 0,
			["icon_side"] = "RIGHT",
			["id"] = "怒气边框",
			["borderBackdrop"] = "None",
			["sparkHeight"] = 30,
			["displayTextRight"] = "%p/%t",
			["sparkColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["stacksColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["timerSize"] = 14,
			["sparkWidth"] = 10,
			["sparkHidden"] = "NEVER",
			["sparkRotationMode"] = "AUTO",
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["stacksFont"] = "Friz Quadrata TT",
			["auto"] = true,
			["numTriggers"] = 1,
			["sparkDesature"] = false,
			["orientation"] = "HORIZONTAL",
			["conditions"] = {
			},
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["parent"] = "8.0浩劫DH_180725A",
		},
	},
	["editor_theme"] = "Monokai",
}
