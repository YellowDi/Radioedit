
WeakAurasSaved = {
	["dynamicIconCache"] = {
		["吞噬巨口"] = {
			[234621] = 463487,
		},
		["末日冲击"] = {
			[240908] = 135791,
		},
		["连锁反应"] = {
			[195418] = 135845,
		},
		["远古狂乱"] = {
			[90355] = 136224,
		},
		["奥术飞弹！"] = {
			[79683] = 136096,
		},
		["多头蛇酸液"] = {
			[232754] = 132107,
		},
		["冰冷智慧"] = {
			[190446] = 236206,
		},
		["吞噬之饥"] = {
			[230920] = 237395,
		},
		["多头蛇射击"] = {
			[230139] = 133578,
		},
		["奥术强化"] = {
			[12042] = 136048,
			[241462] = 135933,
		},
		["聚焦恐惧烈焰"] = {
			[238505] = 236216,
		},
		["炽烈之咒"] = {
			[194329] = 463856,
		},
		["闪回信标"] = {
			[212799] = 132171,
		},
		["寒冰指"] = {
			[44544] = 236227,
		},
		["急速乐章"] = {
			[225719] = 237538,
		},
		["幽灵猫头鹰"] = {
			[242570] = 237241,
		},
		["污染墨汁"] = {
			[232913] = 1500933,
		},
		["能量符文"] = {
			[116014] = 609815,
		},
		["欺诈者的遮蔽"] = {
			[236555] = 136122,
			[242696] = 136122,
		},
		["瓦丝琪之握"] = {
			[208147] = 135859,
		},
		["暗影映像：爆发"] = {
			[236710] = 1357814,
		},
		["抗魔联军的调和"] = {
			[242586] = 1585421,
		},
		["虚空强风"] = {
			[244834] = 236222,
		},
		["玛瑟里顿之力"] = {
			[214404] = 457778,
		},
		["昏暗隐匿"] = {
			[230959] = 134438,
		},
		["狂怒战鼓"] = {
			[178207] = 133841,
		},
		["雷霆震击"] = {
			[230362] = 136111,
		},
		["伊利丹的无目凝视"] = {
			[241721] = 236415,
		},
		["窒息之影"] = {
			[241822] = 462324,
		},
		["切割旋风"] = {
			[232732] = 999952,
		},
		["波涛起伏"] = {
			[241606] = 460857,
		},
		["气定神闲"] = {
			[205025] = 136031,
		},
		["爆发"] = {
			[235974] = 841219,
		},
		["猛烈爆击"] = {
			[242251] = 236216,
		},
		["凯尔萨斯的绝招"] = {
			[209455] = 526168,
		},
		["嗜血"] = {
			[2825] = 136012,
		},
		["强化隐形术"] = {
			[113862] = 575584,
		},
		["强烈燃烧"] = {
			[215816] = 135818,
		},
		["时间扭曲"] = {
			[80353] = 458224,
			[244645] = 458224,
		},
		["冰冻之雨"] = {
			[240555] = 135857,
		},
		["深渊巨喉"] = {
			[230276] = 236302,
		},
		["引力榨取"] = {
			[239155] = 1394890,
		},
		["冰刺"] = {
			[205473] = 135855,
		},
		["冰冷血脉"] = {
			[12472] = 135838,
		},
		["咒术洪流"] = {
			[116267] = 236219,
		},
		["末日之雨"] = {
			[234310] = 135803,
		},
		["英勇"] = {
			[32182] = 132313,
		},
		["燃烧"] = {
			[240262] = 525024,
			[246261] = 135810,
			[190319] = 135824,
		},
		["千魂之暗"] = {
			[239216] = 136123,
		},
	},
	["login_squelch_time"] = 10,
	["displays"] = {
		["Arcane 2T20"] = {
			["glow"] = false,
			["text1FontSize"] = 6,
			["cooldownTextEnabled"] = true,
			["untrigger"] = {
			},
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = 0,
			["customTextUpdate"] = "update",
			["icon"] = true,
			["text1Enabled"] = true,
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["preset"] = "grow",
					["type"] = "preset",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["preset"] = "pulse",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["preset"] = "fade",
					["type"] = "none",
				},
			},
			["trigger"] = {
				["type"] = "aura",
				["spellId"] = "246224",
				["subeventSuffix"] = "_CAST_START",
				["event"] = "Health",
				["names"] = {
					"爆裂能量", -- [1]
				},
				["fullscan"] = true,
				["use_spellId"] = true,
				["spellIds"] = {
					246224, -- [1]
				},
				["name"] = "爆裂能量",
				["custom_hide"] = "timed",
				["unit"] = "player",
				["subeventPrefix"] = "SPELL",
				["debuffType"] = "HELPFUL",
			},
			["desaturate"] = false,
			["text1Point"] = "CENTER",
			["text2FontFlags"] = "OUTLINE",
			["height"] = 40,
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
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["use_spec"] = true,
				["faction"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["single"] = "MAGE",
					["multi"] = {
						["MAGE"] = true,
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
			["yOffset"] = 0,
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["parent"] = "Buffs",
			["text2Containment"] = "INSIDE",
			["displayIcon"] = "Interface\\Icons\\Spell_Nature_Lightning",
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
			["text2Font"] = "Friz Quadrata TT",
			["text1Font"] = "Friz Quadrata TT",
			["text2FontSize"] = 24,
			["anchorFrameType"] = "SCREEN",
			["text2Enabled"] = false,
			["text1"] = "%p",
			["text2"] = "%p",
			["id"] = "Arcane 2T20",
			["zoom"] = 0.18,
			["auto"] = true,
			["text1FontFlags"] = "OUTLINE",
			["additional_triggers"] = {
			},
			["xOffset"] = 0,
			["frameStrata"] = 1,
			["width"] = 40,
			["stickyDuration"] = false,
			["text2Point"] = "CENTER",
			["inverse"] = false,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["cooldown"] = true,
			["selfPoint"] = "CENTER",
		},
		["Obelisk of the Void"] = {
			["glow"] = false,
			["text1FontSize"] = 6,
			["cooldownTextEnabled"] = true,
			["untrigger"] = {
			},
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = 0,
			["customTextUpdate"] = "update",
			["icon"] = true,
			["text1Enabled"] = true,
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["type"] = "preset",
					["preset"] = "grow",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["preset"] = "pulse",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["preset"] = "fade",
					["type"] = "none",
				},
			},
			["trigger"] = {
				["type"] = "aura",
				["subeventSuffix"] = "_CAST_START",
				["event"] = "Health",
				["names"] = {
					"坍缩之影", -- [1]
				},
				["spellIds"] = {
					215476, -- [1]
				},
				["debuffType"] = "HELPFUL",
				["unit"] = "player",
				["subeventPrefix"] = "SPELL",
				["custom_hide"] = "timed",
			},
			["desaturate"] = false,
			["text1Point"] = "CENTER",
			["text2FontFlags"] = "OUTLINE",
			["height"] = 40,
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
				["class"] = {
					["single"] = "MAGE",
					["multi"] = {
						["MAGE"] = true,
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
				["spec"] = {
					["single"] = 2,
					["multi"] = {
						[2] = true,
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
				["size"] = {
					["multi"] = {
					},
				},
			},
			["yOffset"] = 0,
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["parent"] = "Buffs",
			["text2Containment"] = "INSIDE",
			["displayIcon"] = "Interface\\Icons\\Spell_Frost_ColdHearted",
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
			["text2Font"] = "Friz Quadrata TT",
			["text1Font"] = "Friz Quadrata TT",
			["text2FontSize"] = 24,
			["anchorFrameType"] = "SCREEN",
			["text2Enabled"] = false,
			["text1"] = "%c",
			["text2"] = "%p",
			["id"] = "Obelisk of the Void",
			["zoom"] = 0.18,
			["auto"] = true,
			["text1FontFlags"] = "OUTLINE",
			["additional_triggers"] = {
			},
			["xOffset"] = 0,
			["frameStrata"] = 1,
			["width"] = 40,
			["stickyDuration"] = false,
			["text2Point"] = "CENTER",
			["inverse"] = false,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["cooldown"] = true,
			["selfPoint"] = "CENTER",
		},
		["末日冲击"] = {
			["glow"] = false,
			["text1FontSize"] = 32,
			["cooldownTextEnabled"] = true,
			["customText"] = "function()\n    for i=1, 40, 1 do\n        local i_spellID = select(11, UnitDebuff(aura_env.unitID,i))\n        if i_spellID and i_spellID==aura_env.spellID then\n            local tooltipSize = select(3, WeakAuras.GetAuraTooltipInfo(aura_env.unitID, i, aura_env.filter))\n            return aura_env.shortenNumber(tooltipSize) or aura_env.alternativeText\n        end\n    end    \n    return aura_env.alternativeText\nend",
			["untrigger"] = {
			},
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = 0,
			["customTextUpdate"] = "event",
			["actions"] = {
				["start"] = {
					["do_glow"] = false,
					["do_sound"] = false,
					["do_message"] = false,
					["glow_frame"] = "WeakAuras:Artillery",
					["message_type"] = "SAY",
					["glow_action"] = "show",
					["sound"] = "Interface\\AddOns\\Prat-3.0\\Sounds\\Link.ogg",
					["message"] = "",
				},
				["finish"] = {
				},
				["init"] = {
					["do_custom"] = true,
					["custom"] = "aura_env.spellID = 240908 -- Change to whatever debuff you want to keep track\naura_env.unitID = \"player\"\naura_env.filter = \"harmful\"\naura_env.alternativeText = \"DOT\"\n\naura_env.shortenNumber = function(number)\n    if type(number) ~= \"number\" then\n        number = tonumber(number)\n    end\n    if not number then\n        return\n    end\n    \n    local affixes = {\n        \"\",\n        \"K\",\n        \"M\",\n        \"B\",\n    }\n    \n    local affix = 1\n    local dec = 0\n    local num1 = math.abs(number)\n    while num1 >= 1000 and affix < #affixes do\n        num1 = num1 / 1000\n        affix = affix + 1\n    end\n    if affix > 1 then\n        dec = 2\n        local num2 = num1\n        while num2 >= 10 do\n            num2 = num2 / 10\n            dec = dec - 1\n        end\n    end\n    if number < 0 then\n        num1 = -num1\n    end\n    \n    return string.format(\"%.\"..dec..\"f\"..affixes[affix], num1)\nend",
				},
			},
			["fontFlags"] = "THICKOUTLINE",
			["useTooltip"] = false,
			["animation"] = {
				["start"] = {
					["preset"] = "spiral",
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
			},
			["trigger"] = {
				["fullscan"] = true,
				["type"] = "aura",
				["spellId"] = "240908",
				["unevent"] = "timed",
				["subeventPrefix"] = "SPELL",
				["duration"] = "2",
				["event"] = "Combat Log",
				["names"] = {
					"灵魂之刃", -- [1]
				},
				["unit"] = "player",
				["use_spellId"] = true,
				["spellIds"] = {
					200084, -- [1]
				},
				["subeventSuffix"] = "_CAST_START",
				["custom_hide"] = "timed",
				["name"] = "末日冲击",
				["use_unit"] = true,
				["debuffType"] = "HARMFUL",
			},
			["parent"] = "萨格拉斯之墓 - 09#基尔加丹",
			["text1Containment"] = "OUTSIDE",
			["yOffset"] = 0,
			["text1Point"] = "BOTTOM",
			["stacksPoint"] = "BOTTOM",
			["text2FontFlags"] = "OUTLINE",
			["height"] = 100,
			["conditions"] = {
			},
			["load"] = {
				["use_never"] = false,
				["zone"] = "Hellfire Citadel",
				["encounterid"] = "2051",
				["use_encounterid"] = true,
				["use_zoneId"] = true,
				["size"] = {
					["single"] = "party",
					["multi"] = {
						["party"] = true,
					},
				},
				["talent2"] = {
					["multi"] = {
					},
				},
				["use_level"] = false,
				["talent"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["use_zone"] = false,
				["faction"] = {
					["multi"] = {
					},
				},
				["zoneId"] = "1147",
				["role"] = {
					["single"] = "TANK",
					["multi"] = {
						["TANK"] = true,
					},
				},
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
			},
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["inverse"] = false,
			["fontSize"] = 15,
			["text2Containment"] = "OUTSIDE",
			["stickyDuration"] = false,
			["text1Color"] = {
				0, -- [1]
				0.701960784313726, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text2Font"] = "Friz Quadrata TT",
			["anchorFrameType"] = "SCREEN",
			["text1FontFlags"] = "THICKOUTLINE",
			["regionType"] = "icon",
			["frameStrata"] = 1,
			["selfPoint"] = "CENTER",
			["text2FontSize"] = 32,
			["additional_triggers"] = {
			},
			["xOffset"] = 0,
			["text1"] = "%c",
			["zoom"] = 0,
			["stacksContainment"] = "OUTSIDE",
			["text2"] = "%s",
			["auto"] = true,
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["id"] = "末日冲击",
			["text1Font"] = "Friz Quadrata TT",
			["text2Enabled"] = false,
			["width"] = 100,
			["desaturate"] = false,
			["text1Enabled"] = true,
			["numTriggers"] = 1,
			["icon"] = true,
			["displayIcon"] = 464119,
			["cooldown"] = true,
			["text2Point"] = "TOP",
		},
		["末日之雹"] = {
			["glow"] = false,
			["text1FontSize"] = 32,
			["cooldownTextEnabled"] = true,
			["customText"] = "function()\n    for i=1, 40, 1 do\n        local i_spellID = select(11, UnitDebuff(aura_env.unitID,i))\n        if i_spellID and i_spellID==aura_env.spellID then\n            local tooltipSize = select(3, WeakAuras.GetAuraTooltipInfo(aura_env.unitID, i, aura_env.filter))\n            return aura_env.shortenNumber(tooltipSize) or aura_env.alternativeText\n        end\n    end    \n    return aura_env.alternativeText\nend",
			["untrigger"] = {
			},
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = 0,
			["customTextUpdate"] = "event",
			["actions"] = {
				["start"] = {
					["do_glow"] = false,
					["message"] = "",
					["sound"] = "Interface\\AddOns\\Prat-3.0\\Sounds\\Link.ogg",
					["do_sound"] = false,
					["message_type"] = "SAY",
					["glow_action"] = "show",
					["do_message"] = false,
					["glow_frame"] = "WeakAuras:Artillery",
				},
				["finish"] = {
				},
				["init"] = {
					["do_custom"] = true,
					["custom"] = "aura_env.spellID = 240916 -- Change to whatever debuff you want to keep track\naura_env.unitID = \"player\"\naura_env.filter = \"harmful\"\naura_env.alternativeText = \"DOT\"\n\naura_env.shortenNumber = function(number)\n    if type(number) ~= \"number\" then\n        number = tonumber(number)\n    end\n    if not number then\n        return\n    end\n    \n    local affixes = {\n        \"\",\n        \"K\",\n        \"M\",\n        \"B\",\n    }\n    \n    local affix = 1\n    local dec = 0\n    local num1 = math.abs(number)\n    while num1 >= 1000 and affix < #affixes do\n        num1 = num1 / 1000\n        affix = affix + 1\n    end\n    if affix > 1 then\n        dec = 2\n        local num2 = num1\n        while num2 >= 10 do\n            num2 = num2 / 10\n            dec = dec - 1\n        end\n    end\n    if number < 0 then\n        num1 = -num1\n    end\n    \n    return string.format(\"%.\"..dec..\"f\"..affixes[affix], num1)\nend",
				},
			},
			["fontFlags"] = "THICKOUTLINE",
			["useTooltip"] = false,
			["animation"] = {
				["start"] = {
					["preset"] = "spiral",
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
			},
			["trigger"] = {
				["debuffType"] = "HARMFUL",
				["type"] = "aura",
				["spellId"] = "240916",
				["unevent"] = "timed",
				["subeventPrefix"] = "SPELL",
				["duration"] = "2",
				["event"] = "Combat Log",
				["use_unit"] = true,
				["unit"] = "player",
				["use_spellId"] = true,
				["name"] = "末日之雹",
				["subeventSuffix"] = "_CAST_START",
				["custom_hide"] = "timed",
				["spellIds"] = {
					200084, -- [1]
				},
				["names"] = {
					"灵魂之刃", -- [1]
				},
				["fullscan"] = true,
			},
			["parent"] = "萨格拉斯之墓 - 09#基尔加丹",
			["text1Containment"] = "OUTSIDE",
			["yOffset"] = 0,
			["text1Point"] = "BOTTOM",
			["cooldown"] = true,
			["text2FontFlags"] = "OUTLINE",
			["height"] = 100,
			["conditions"] = {
			},
			["load"] = {
				["use_never"] = false,
				["zone"] = "Hellfire Citadel",
				["encounterid"] = "2051",
				["use_encounterid"] = true,
				["role"] = {
					["single"] = "TANK",
					["multi"] = {
						["TANK"] = true,
					},
				},
				["size"] = {
					["single"] = "party",
					["multi"] = {
						["party"] = true,
					},
				},
				["talent2"] = {
					["multi"] = {
					},
				},
				["zoneId"] = "1147",
				["talent"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["use_level"] = false,
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["use_zone"] = false,
				["faction"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["use_zoneId"] = true,
			},
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["inverse"] = false,
			["fontSize"] = 15,
			["text2Containment"] = "OUTSIDE",
			["stickyDuration"] = false,
			["text1Color"] = {
				0, -- [1]
				0.701960784313726, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text2Font"] = "Friz Quadrata TT",
			["anchorFrameType"] = "SCREEN",
			["text1FontFlags"] = "THICKOUTLINE",
			["regionType"] = "icon",
			["frameStrata"] = 1,
			["selfPoint"] = "CENTER",
			["text2FontSize"] = 32,
			["additional_triggers"] = {
			},
			["xOffset"] = 0,
			["text1"] = "%c",
			["zoom"] = 0,
			["stacksContainment"] = "OUTSIDE",
			["text2"] = "%s",
			["auto"] = true,
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["id"] = "末日之雹",
			["text1Font"] = "Friz Quadrata TT",
			["text2Enabled"] = false,
			["width"] = 100,
			["desaturate"] = false,
			["text1Enabled"] = true,
			["numTriggers"] = 1,
			["icon"] = true,
			["displayIcon"] = 464119,
			["stacksPoint"] = "BOTTOM",
			["text2Point"] = "TOP",
		},
		["墨汁+吞噬"] = {
			["text2Point"] = "TOP",
			["text1FontSize"] = 20,
			["cooldownTextEnabled"] = true,
			["customText"] = "function()\n    return \"去喂鲨鱼\"\nend\n\n\n\n\n\n\n\n\n\n",
			["untrigger"] = {
			},
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = 0,
			["customTextUpdate"] = "update",
			["actions"] = {
				["start"] = {
					["do_glow"] = false,
					["message"] = "",
					["sound"] = "Sound\\Interface\\AuctionWindowClose.ogg",
					["do_sound"] = true,
					["message_type"] = "SAY",
					["glow_action"] = "show",
					["do_message"] = false,
					["glow_frame"] = "WeakAuras:Artillery",
				},
				["finish"] = {
				},
				["init"] = {
					["do_custom"] = false,
					["custom"] = "\n\n",
				},
			},
			["fontFlags"] = "THICKOUTLINE",
			["useTooltip"] = false,
			["animation"] = {
				["start"] = {
					["preset"] = "spiral",
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
			},
			["trigger"] = {
				["custom_hide"] = "timed",
				["type"] = "aura",
				["spellId"] = "232913",
				["unevent"] = "timed",
				["names"] = {
					"污染墨汁", -- [1]
				},
				["duration"] = "2",
				["event"] = "Combat Log",
				["use_unit"] = true,
				["unit"] = "player",
				["use_spellId"] = true,
				["name"] = "污染墨汁",
				["subeventSuffix"] = "_CAST_START",
				["spellIds"] = {
					232913, -- [1]
				},
				["subcount"] = true,
				["subeventPrefix"] = "SPELL",
				["debuffType"] = "HARMFUL",
			},
			["glow"] = false,
			["parent"] = "萨格拉斯之墓 - 04#主母萨丝琳",
			["text1Containment"] = "OUTSIDE",
			["cooldown"] = true,
			["text1Point"] = "BOTTOM",
			["conditions"] = {
			},
			["text2FontFlags"] = "THICKOUTLINE",
			["height"] = 100,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["load"] = {
				["use_never"] = false,
				["zone"] = "Hellfire Citadel",
				["encounterid"] = "2037",
				["use_encounterid"] = true,
				["race"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["single"] = "party",
					["multi"] = {
						["party"] = true,
					},
				},
				["talent2"] = {
					["multi"] = {
					},
				},
				["zoneId"] = "1147",
				["talent"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["use_level"] = false,
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["use_zone"] = false,
				["faction"] = {
					["multi"] = {
					},
				},
				["use_zoneId"] = true,
				["role"] = {
					["single"] = "TANK",
					["multi"] = {
						["TANK"] = true,
					},
				},
			},
			["inverse"] = false,
			["stickyDuration"] = false,
			["fontSize"] = 15,
			["text2Containment"] = "OUTSIDE",
			["text2Font"] = "Friz Quadrata TT",
			["text1Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["anchorFrameType"] = "SCREEN",
			["frameStrata"] = 1,
			["text1FontFlags"] = "THICKOUTLINE",
			["regionType"] = "icon",
			["text1Font"] = "Friz Quadrata TT",
			["additional_triggers"] = {
				{
					["trigger"] = {
						["debuffType"] = "HARMFUL",
						["type"] = "aura",
						["spellIds"] = {
							234621, -- [1]
						},
						["subeventSuffix"] = "_CAST_START",
						["unit"] = "player",
						["subeventPrefix"] = "SPELL",
						["event"] = "Health",
						["names"] = {
							"吞噬巨口", -- [1]
						},
					},
					["untrigger"] = {
					},
				}, -- [1]
			},
			["text2FontSize"] = 22,
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["init_completed"] = 1,
			["text1"] = "%c",
			["zoom"] = 0,
			["stacksContainment"] = "OUTSIDE",
			["text2"] = "减速",
			["auto"] = true,
			["desaturate"] = false,
			["id"] = "墨汁+吞噬",
			["xOffset"] = 0,
			["text2Enabled"] = true,
			["width"] = 100,
			["selfPoint"] = "CENTER",
			["text1Enabled"] = true,
			["numTriggers"] = 2,
			["icon"] = true,
			["displayIcon"] = "132107",
			["stacksPoint"] = "BOTTOM",
			["yOffset"] = 0,
		},
		["美味增益鱼:治疗"] = {
			["glow"] = false,
			["text1FontSize"] = 18,
			["cooldownTextEnabled"] = true,
			["customText"] = "function()\n    return \"ADD\\nBUFFED\"\nend\n\n\n\n\n\n",
			["untrigger"] = {
			},
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = 0,
			["customTextUpdate"] = "update",
			["actions"] = {
				["start"] = {
					["do_glow"] = false,
					["message"] = "",
					["sound"] = "Interface\\AddOns\\Prat-3.0\\Sounds\\Link.ogg",
					["do_sound"] = false,
					["message_type"] = "SAY",
					["glow_action"] = "show",
					["do_message"] = false,
					["glow_frame"] = "WeakAuras:Artillery",
				},
				["finish"] = {
				},
				["init"] = {
					["do_custom"] = false,
					["custom"] = "\n\n",
				},
			},
			["fontFlags"] = "THICKOUTLINE",
			["useTooltip"] = false,
			["animation"] = {
				["start"] = {
					["preset"] = "spiral",
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
			},
			["trigger"] = {
				["spellId"] = "239362",
				["duration"] = "2",
				["use_specific_unit"] = false,
				["subcount"] = true,
				["custom_hide"] = "timed",
				["type"] = "aura",
				["unevent"] = "timed",
				["subeventPrefix"] = "SPELL",
				["event"] = "Combat Log",
				["subeventSuffix"] = "_CAST_START",
				["unit"] = "player",
				["use_spellId"] = true,
				["spellIds"] = {
					242945, -- [1]
				},
				["names"] = {
					"鱼人饲料", -- [1]
				},
				["use_unit"] = true,
				["name"] = "美味的增益鱼",
				["debuffType"] = "HARMFUL",
				["fullscan"] = true,
			},
			["text2Point"] = "BOTTOM",
			["text1Containment"] = "OUTSIDE",
			["parent"] = "萨格拉斯之墓 - 04#主母萨丝琳",
			["text1Point"] = "BOTTOM",
			["cooldown"] = true,
			["text2FontFlags"] = "THICKOUTLINE",
			["height"] = 100,
			["conditions"] = {
			},
			["load"] = {
				["use_never"] = false,
				["zone"] = "Hellfire Citadel",
				["encounterid"] = "2037",
				["use_encounterid"] = true,
				["race"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["single"] = "party",
					["multi"] = {
						["party"] = true,
					},
				},
				["talent2"] = {
					["multi"] = {
					},
				},
				["zoneId"] = "1147",
				["talent"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["use_level"] = false,
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["use_zone"] = false,
				["faction"] = {
					["multi"] = {
					},
				},
				["use_zoneId"] = true,
				["role"] = {
					["single"] = "TANK",
					["multi"] = {
						["TANK"] = true,
					},
				},
			},
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["inverse"] = false,
			["fontSize"] = 15,
			["text2Containment"] = "OUTSIDE",
			["stickyDuration"] = false,
			["text1Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text2Font"] = "Friz Quadrata TT",
			["anchorFrameType"] = "SCREEN",
			["text1FontFlags"] = "THICKOUTLINE",
			["regionType"] = "icon",
			["frameStrata"] = 1,
			["selfPoint"] = "CENTER",
			["text2FontSize"] = 20,
			["additional_triggers"] = {
			},
			["text1Font"] = "Friz Quadrata TT",
			["text1"] = "回蓝: %s",
			["zoom"] = 0,
			["stacksContainment"] = "OUTSIDE",
			["text2"] = "%p",
			["auto"] = true,
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["id"] = "美味增益鱼:治疗",
			["xOffset"] = 0,
			["text2Enabled"] = false,
			["width"] = 100,
			["desaturate"] = false,
			["text1Enabled"] = true,
			["numTriggers"] = 1,
			["icon"] = true,
			["displayIcon"] = 464119,
			["stacksPoint"] = "BOTTOM",
			["yOffset"] = 0,
		},
		["OfCD: Time Warp Buff"] = {
			["glow"] = false,
			["text1FontSize"] = 6,
			["cooldownTextEnabled"] = true,
			["untrigger"] = {
			},
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = 0,
			["customTextUpdate"] = "update",
			["icon"] = true,
			["text1Enabled"] = true,
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["type"] = "preset",
					["preset"] = "grow",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["preset"] = "pulse",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["preset"] = "fade",
					["type"] = "none",
				},
			},
			["trigger"] = {
				["type"] = "aura",
				["subeventSuffix"] = "_CAST_START",
				["event"] = "Health",
				["names"] = {
					"Heroism", -- [1]
					"Bloodlust", -- [2]
					"时间扭曲", -- [3]
					"Ancient Hysteria", -- [4]
					"时间扭曲", -- [5]
					"嗜血", -- [6]
				},
				["spellIds"] = {
					[3] = 80353,
				},
				["debuffType"] = "HELPFUL",
				["unit"] = "player",
				["subeventPrefix"] = "SPELL",
				["custom_hide"] = "timed",
			},
			["desaturate"] = false,
			["text1Point"] = "CENTER",
			["text2FontFlags"] = "OUTLINE",
			["height"] = 40,
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
				["class"] = {
					["single"] = "MAGE",
					["multi"] = {
						["MAGE"] = true,
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
				["role"] = {
					["multi"] = {
					},
				},
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["use_name"] = false,
				["faction"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["color"] = {
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
			["parent"] = "Buffs",
			["text2Containment"] = "INSIDE",
			["displayIcon"] = "INTERFACE\\ICONS\\ability_mage_timewarp",
			["text1Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["selfPoint"] = "CENTER",
			["numTriggers"] = 1,
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["regionType"] = "icon",
			["xOffset"] = -136.999690684516,
			["text1Containment"] = "INSIDE",
			["text2FontSize"] = 24,
			["width"] = 40,
			["text2Enabled"] = false,
			["text1"] = "%c",
			["text2"] = "%p",
			["id"] = "OfCD: Time Warp Buff",
			["zoom"] = 0.18,
			["auto"] = false,
			["text1Font"] = "Friz Quadrata TT",
			["additional_triggers"] = {
			},
			["text1FontFlags"] = "OUTLINE",
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["text2Font"] = "Friz Quadrata TT",
			["stickyDuration"] = false,
			["inverse"] = false,
			["text2Point"] = "CENTER",
			["conditions"] = {
			},
			["cooldown"] = true,
			["yOffset"] = -42.0004531338487,
		},
		["Artifact"] = {
			["glow"] = false,
			["text1FontSize"] = 6,
			["cooldownTextEnabled"] = true,
			["untrigger"] = {
			},
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = 0,
			["customTextUpdate"] = "update",
			["icon"] = true,
			["text1Enabled"] = true,
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["type"] = "preset",
					["preset"] = "grow",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["preset"] = "pulse",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["preset"] = "fade",
					["type"] = "none",
				},
			},
			["trigger"] = {
				["type"] = "aura",
				["spellId"] = "242586",
				["subeventSuffix"] = "_CAST_START",
				["event"] = "Health",
				["names"] = {
					"抗魔联军的调和", -- [1]
				},
				["fullscan"] = true,
				["use_spellId"] = true,
				["spellIds"] = {
					242586, -- [1]
				},
				["name"] = "抗魔联军的调和",
				["custom_hide"] = "timed",
				["unit"] = "player",
				["subeventPrefix"] = "SPELL",
				["debuffType"] = "HELPFUL",
			},
			["desaturate"] = false,
			["text1Point"] = "CENTER",
			["text2FontFlags"] = "OUTLINE",
			["height"] = 40,
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
				["spec"] = {
					["single"] = 1,
					["multi"] = {
						true, -- [1]
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
				["class"] = {
					["single"] = "MAGE",
					["multi"] = {
						["MAGE"] = true,
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
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["parent"] = "Buffs",
			["displayIcon"] = "Interface\\Icons\\Spell_Nature_Lightning",
			["text2Containment"] = "INSIDE",
			["yOffset"] = 0,
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
			["text2Font"] = "Friz Quadrata TT",
			["text1Font"] = "Friz Quadrata TT",
			["text2FontSize"] = 24,
			["anchorFrameType"] = "SCREEN",
			["text2Enabled"] = false,
			["text1"] = "%p",
			["text2"] = "%p",
			["id"] = "Artifact",
			["zoom"] = 0.18,
			["auto"] = true,
			["text1FontFlags"] = "OUTLINE",
			["additional_triggers"] = {
			},
			["xOffset"] = 0,
			["frameStrata"] = 1,
			["width"] = 40,
			["stickyDuration"] = false,
			["text2Point"] = "CENTER",
			["inverse"] = false,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["init_started"] = 1,
			["conditions"] = {
			},
			["cooldown"] = true,
			["selfPoint"] = "CENTER",
		},
		["吞噬之饥"] = {
			["text2Point"] = "BOTTOM",
			["text1FontSize"] = 32,
			["cooldownTextEnabled"] = true,
			["customText"] = "function()\n    for i=1, 40, 1 do\n        local i_spellID = select(11, UnitDebuff(aura_env.unitID,i))\n        if i_spellID and i_spellID==aura_env.spellID then\n            local tooltipSize = select(3, WeakAuras.GetAuraTooltipInfo(aura_env.unitID, i, aura_env.filter))\n            return aura_env.shortenNumber(tooltipSize) or aura_env.alternativeText\n        end\n    end    \n    return aura_env.alternativeText\nend",
			["untrigger"] = {
			},
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = 0,
			["customTextUpdate"] = "event",
			["actions"] = {
				["start"] = {
					["do_glow"] = false,
					["message"] = "",
					["sound"] = "Interface\\AddOns\\Prat-3.0\\Sounds\\Link.ogg",
					["glow_frame"] = "WeakAuras:Artillery",
					["message_type"] = "SAY",
					["glow_action"] = "show",
					["do_message"] = false,
					["do_sound"] = false,
				},
				["finish"] = {
				},
				["init"] = {
					["do_custom"] = true,
					["custom"] = "aura_env.spellID = 230920 -- Change to whatever debuff you want to keep track\naura_env.unitID = \"player\"\naura_env.filter = \"harmful\"\naura_env.alternativeText = \"DOT\"\n\naura_env.shortenNumber = function(number)\n    if type(number) ~= \"number\" then\n        number = tonumber(number)\n    end\n    if not number then\n        return\n    end\n    \n    local affixes = {\n        \"\",\n        \"K\",\n        \"M\",\n        \"B\",\n    }\n    \n    local affix = 1\n    local dec = 0\n    local num1 = math.abs(number)\n    while num1 >= 1000 and affix < #affixes do\n        num1 = num1 / 1000\n        affix = affix + 1\n    end\n    if affix > 1 then\n        dec = 2\n        local num2 = num1\n        while num2 >= 10 do\n            num2 = num2 / 10\n            dec = dec - 1\n        end\n    end\n    if number < 0 then\n        num1 = -num1\n    end\n    \n    return string.format(\"%.\"..dec..\"f\"..affixes[affix], num1)\nend",
				},
			},
			["fontFlags"] = "THICKOUTLINE",
			["useTooltip"] = false,
			["animation"] = {
				["start"] = {
					["preset"] = "spiral",
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
			},
			["trigger"] = {
				["debuffType"] = "HARMFUL",
				["type"] = "aura",
				["spellId"] = "230920",
				["unevent"] = "timed",
				["use_unit"] = true,
				["duration"] = "2",
				["event"] = "Combat Log",
				["names"] = {
					"灵魂之刃", -- [1]
				},
				["unit"] = "player",
				["use_spellId"] = true,
				["spellIds"] = {
					200084, -- [1]
				},
				["subeventSuffix"] = "_CAST_START",
				["custom_hide"] = "timed",
				["name"] = "吞噬之饥",
				["subeventPrefix"] = "SPELL",
				["fullscan"] = true,
			},
			["parent"] = "萨格拉斯之墓 - 04#主母萨丝琳",
			["text1Containment"] = "OUTSIDE",
			["yOffset"] = 0,
			["text1Point"] = "TOP",
			["cooldown"] = true,
			["text2FontFlags"] = "THICKOUTLINE",
			["height"] = 100,
			["conditions"] = {
			},
			["load"] = {
				["use_never"] = false,
				["zone"] = "Hellfire Citadel",
				["encounterid"] = "2037",
				["use_encounterid"] = true,
				["role"] = {
					["single"] = "TANK",
					["multi"] = {
						["TANK"] = true,
					},
				},
				["size"] = {
					["single"] = "party",
					["multi"] = {
						["party"] = true,
					},
				},
				["talent2"] = {
					["multi"] = {
					},
				},
				["zoneId"] = "1147",
				["talent"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["use_level"] = false,
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["use_zone"] = false,
				["faction"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["use_zoneId"] = true,
			},
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["inverse"] = false,
			["fontSize"] = 15,
			["text2Containment"] = "OUTSIDE",
			["stickyDuration"] = false,
			["text1Color"] = {
				0, -- [1]
				0.701960784313726, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text2Font"] = "Friz Quadrata TT",
			["anchorFrameType"] = "SCREEN",
			["text1FontFlags"] = "THICKOUTLINE",
			["regionType"] = "icon",
			["frameStrata"] = 1,
			["text1Font"] = "Friz Quadrata TT",
			["text2FontSize"] = 20,
			["additional_triggers"] = {
			},
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text1"] = "%c",
			["zoom"] = 0,
			["stacksContainment"] = "OUTSIDE",
			["text2"] = "吃水母圈",
			["auto"] = true,
			["desaturate"] = false,
			["id"] = "吞噬之饥",
			["xOffset"] = 0,
			["text2Enabled"] = true,
			["width"] = 100,
			["selfPoint"] = "CENTER",
			["text1Enabled"] = true,
			["numTriggers"] = 1,
			["icon"] = true,
			["displayIcon"] = "132107",
			["stacksPoint"] = "BOTTOM",
			["glow"] = false,
		},
		["多头蛇射击"] = {
			["glow"] = false,
			["text1FontSize"] = 22,
			["cooldownTextEnabled"] = true,
			["customText"] = "\n\n",
			["untrigger"] = {
			},
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = 0,
			["customTextUpdate"] = "event",
			["actions"] = {
				["start"] = {
					["do_glow"] = false,
					["glow_frame"] = "WeakAuras:Artillery",
					["do_message"] = false,
					["do_sound"] = false,
					["message_type"] = "SAY",
					["glow_action"] = "show",
					["sound"] = "Interface\\AddOns\\Prat-3.0\\Sounds\\Link.ogg",
					["message"] = "",
				},
				["finish"] = {
				},
				["init"] = {
					["do_custom"] = false,
					["custom"] = "\n\n",
				},
			},
			["fontFlags"] = "THICKOUTLINE",
			["useTooltip"] = false,
			["animation"] = {
				["start"] = {
					["preset"] = "spiral",
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
			},
			["trigger"] = {
				["custom_hide"] = "timed",
				["type"] = "aura",
				["spellId"] = "230139",
				["subeventSuffix"] = "_AURA_APPLIED",
				["use_unit"] = true,
				["duration"] = "2",
				["event"] = "Combat Log",
				["subeventPrefix"] = "SPELL",
				["unit"] = "player",
				["subcount"] = true,
				["name"] = "多头蛇射击",
				["spellIds"] = {
					230139, -- [1]
				},
				["use_spellId"] = true,
				["names"] = {
					"多头蛇射击", -- [1]
				},
				["unevent"] = "timed",
				["debuffType"] = "HARMFUL",
			},
			["text2Point"] = "TOP",
			["text1Containment"] = "OUTSIDE",
			["yOffset"] = 0,
			["text1Point"] = "BOTTOM",
			["stacksPoint"] = "BOTTOM",
			["text2FontFlags"] = "THICKOUTLINE",
			["height"] = 100,
			["conditions"] = {
			},
			["load"] = {
				["use_never"] = false,
				["zone"] = "Hellfire Citadel",
				["encounterid"] = "2037",
				["use_encounterid"] = true,
				["role"] = {
					["single"] = "TANK",
					["multi"] = {
						["TANK"] = true,
					},
				},
				["size"] = {
					["single"] = "party",
					["multi"] = {
						["party"] = true,
					},
				},
				["talent2"] = {
					["multi"] = {
					},
				},
				["use_level"] = false,
				["talent"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["use_zone"] = false,
				["faction"] = {
					["multi"] = {
					},
				},
				["zoneId"] = "1147",
				["race"] = {
					["multi"] = {
					},
				},
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["use_zoneId"] = true,
			},
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["inverse"] = false,
			["fontSize"] = 15,
			["text2Containment"] = "OUTSIDE",
			["stickyDuration"] = false,
			["text1Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text2Font"] = "Friz Quadrata TT",
			["anchorFrameType"] = "SCREEN",
			["text1FontFlags"] = "THICKOUTLINE",
			["regionType"] = "icon",
			["frameStrata"] = 1,
			["selfPoint"] = "CENTER",
			["text2FontSize"] = 20,
			["id"] = "多头蛇射击",
			["text1Font"] = "Friz Quadrata TT",
			["text1"] = "找人分担",
			["zoom"] = 0,
			["stacksContainment"] = "OUTSIDE",
			["text2"] = "%p",
			["auto"] = true,
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["additional_triggers"] = {
			},
			["xOffset"] = 0,
			["text2Enabled"] = false,
			["width"] = 100,
			["desaturate"] = false,
			["text1Enabled"] = true,
			["numTriggers"] = 1,
			["icon"] = true,
			["displayIcon"] = 464119,
			["cooldown"] = true,
			["parent"] = "萨格拉斯之墓 - 04#主母萨丝琳",
		},
		["滑不留手"] = {
			["text2Point"] = "TOP",
			["text1FontSize"] = 20,
			["cooldownTextEnabled"] = true,
			["customText"] = "\n\n",
			["untrigger"] = {
			},
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = 0,
			["customTextUpdate"] = "event",
			["actions"] = {
				["start"] = {
					["do_glow"] = false,
					["message"] = "",
					["sound"] = "Interface\\AddOns\\Prat-3.0\\Sounds\\Link.ogg",
					["glow_frame"] = "WeakAuras:Artillery",
					["message_type"] = "SAY",
					["glow_action"] = "show",
					["do_message"] = false,
					["do_sound"] = false,
				},
				["finish"] = {
				},
				["init"] = {
					["do_custom"] = false,
					["custom"] = "\n\n",
				},
			},
			["fontFlags"] = "THICKOUTLINE",
			["useTooltip"] = false,
			["animation"] = {
				["start"] = {
					["preset"] = "spiral",
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
			},
			["trigger"] = {
				["debuffType"] = "HARMFUL",
				["type"] = "aura",
				["spellId"] = "230139",
				["unevent"] = "timed",
				["use_unit"] = true,
				["duration"] = "2",
				["event"] = "Combat Log",
				["names"] = {
					"滑不留手", -- [1]
				},
				["unit"] = "player",
				["subcount"] = true,
				["name"] = "多头蛇射击",
				["subeventSuffix"] = "_CAST_START",
				["use_spellId"] = true,
				["spellIds"] = {
					239420, -- [1]
				},
				["subeventPrefix"] = "SPELL",
				["custom_hide"] = "timed",
			},
			["desaturate"] = true,
			["text1Containment"] = "OUTSIDE",
			["parent"] = "萨格拉斯之墓 - 04#主母萨丝琳",
			["text1Point"] = "BOTTOM",
			["cooldown"] = true,
			["text2FontFlags"] = "THICKOUTLINE",
			["height"] = 100,
			["conditions"] = {
			},
			["load"] = {
				["use_never"] = false,
				["zone"] = "Hellfire Citadel",
				["encounterid"] = "2037",
				["use_encounterid"] = true,
				["role"] = {
					["single"] = "TANK",
					["multi"] = {
						["TANK"] = true,
					},
				},
				["size"] = {
					["single"] = "party",
					["multi"] = {
						["party"] = true,
					},
				},
				["talent2"] = {
					["multi"] = {
					},
				},
				["zoneId"] = "1147",
				["talent"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["use_level"] = false,
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["use_zone"] = false,
				["faction"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["use_zoneId"] = true,
			},
			["stickyDuration"] = false,
			["inverse"] = false,
			["fontSize"] = 15,
			["text2Containment"] = "OUTSIDE",
			["text2Font"] = "Friz Quadrata TT",
			["text1Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text1Enabled"] = true,
			["anchorFrameType"] = "SCREEN",
			["text1FontFlags"] = "THICKOUTLINE",
			["regionType"] = "icon",
			["frameStrata"] = 1,
			["xOffset"] = 0,
			["text2FontSize"] = 20,
			["id"] = "滑不留手",
			["text1Font"] = "Friz Quadrata TT",
			["text1"] = "不能拿鱼",
			["zoom"] = 0,
			["stacksContainment"] = "OUTSIDE",
			["text2"] = "%p",
			["auto"] = true,
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["additional_triggers"] = {
			},
			["selfPoint"] = "CENTER",
			["text2Enabled"] = false,
			["width"] = 100,
			["icon"] = true,
			["glow"] = false,
			["numTriggers"] = 1,
			["yOffset"] = 0,
			["displayIcon"] = 464119,
			["stacksPoint"] = "BOTTOM",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
		},
		["暗影映像"] = {
			["text2Point"] = "TOP",
			["text1FontSize"] = 22,
			["cooldownTextEnabled"] = true,
			["customText"] = "\n\n",
			["untrigger"] = {
			},
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = 0,
			["customTextUpdate"] = "event",
			["actions"] = {
				["start"] = {
					["do_glow"] = false,
					["message"] = "",
					["sound"] = "Interface\\AddOns\\Prat-3.0\\Sounds\\Link.ogg",
					["do_sound"] = false,
					["message_type"] = "SAY",
					["glow_action"] = "show",
					["do_message"] = false,
					["glow_frame"] = "WeakAuras:Artillery",
				},
				["finish"] = {
				},
				["init"] = {
					["do_custom"] = false,
					["custom"] = "\n\n",
				},
			},
			["fontFlags"] = "THICKOUTLINE",
			["useTooltip"] = false,
			["animation"] = {
				["start"] = {
					["preset"] = "spiral",
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
			},
			["trigger"] = {
				["spellId"] = "239932",
				["duration"] = "2",
				["use_specific_unit"] = false,
				["specificUnit"] = "boss1",
				["debuffType"] = "HARMFUL",
				["type"] = "aura",
				["unevent"] = "timed",
				["event"] = "Combat Log",
				["subeventPrefix"] = "SPELL",
				["subeventSuffix"] = "_CAST_START",
				["use_spellId"] = true,
				["name"] = "邪爪",
				["unit"] = "player",
				["use_unit"] = true,
				["names"] = {
					"暗影映像：哀嚎", -- [1]
					"暗影映像：爆发", -- [2]
					"暗影映像：绝望", -- [3]
				},
				["spellIds"] = {
					236378, -- [1]
					236710, -- [2]
					237590, -- [3]
				},
				["custom_hide"] = "timed",
			},
			["parent"] = "萨格拉斯之墓 - 09#基尔加丹",
			["text1Containment"] = "OUTSIDE",
			["yOffset"] = 0,
			["text1Point"] = "BOTTOM",
			["cooldown"] = true,
			["text2FontFlags"] = "THICKOUTLINE",
			["height"] = 100,
			["conditions"] = {
			},
			["load"] = {
				["use_never"] = false,
				["zone"] = "Hellfire Citadel",
				["encounterid"] = "2051",
				["use_encounterid"] = true,
				["role"] = {
					["single"] = "TANK",
					["multi"] = {
						["TANK"] = true,
					},
				},
				["size"] = {
					["single"] = "party",
					["multi"] = {
						["party"] = true,
					},
				},
				["talent2"] = {
					["multi"] = {
					},
				},
				["zoneId"] = "1147",
				["talent"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["use_level"] = false,
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["use_zone"] = false,
				["faction"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["use_zoneId"] = true,
			},
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["inverse"] = false,
			["fontSize"] = 15,
			["text2Containment"] = "OUTSIDE",
			["stickyDuration"] = false,
			["text1Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text2Font"] = "Friz Quadrata TT",
			["anchorFrameType"] = "SCREEN",
			["text1FontFlags"] = "THICKOUTLINE",
			["regionType"] = "icon",
			["frameStrata"] = 1,
			["text1Font"] = "Friz Quadrata TT",
			["text2FontSize"] = 22,
			["additional_triggers"] = {
			},
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text1"] = "镜像点名",
			["zoom"] = 0,
			["stacksContainment"] = "OUTSIDE",
			["text2"] = "灵魂",
			["auto"] = true,
			["desaturate"] = false,
			["id"] = "暗影映像",
			["xOffset"] = 0,
			["text2Enabled"] = true,
			["width"] = 100,
			["selfPoint"] = "CENTER",
			["text1Enabled"] = true,
			["numTriggers"] = 1,
			["icon"] = true,
			["displayIcon"] = 464119,
			["stacksPoint"] = "BOTTOM",
			["glow"] = false,
		},
		["Potion"] = {
			["glow"] = false,
			["text1FontSize"] = 6,
			["cooldownTextEnabled"] = true,
			["untrigger"] = {
			},
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = 0,
			["customTextUpdate"] = "update",
			["icon"] = true,
			["text1Enabled"] = true,
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["preset"] = "grow",
					["type"] = "preset",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["preset"] = "pulse",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["preset"] = "fade",
					["type"] = "none",
				},
			},
			["trigger"] = {
				["type"] = "aura",
				["subeventSuffix"] = "_CAST_START",
				["event"] = "Health",
				["names"] = {
					"延时之力药水", -- [1]
					"致命优雅药水", -- [2]
				},
				["spellIds"] = {
					229206, -- [1]
					188027, -- [2]
				},
				["debuffType"] = "HELPFUL",
				["unit"] = "player",
				["subeventPrefix"] = "SPELL",
				["custom_hide"] = "timed",
			},
			["desaturate"] = false,
			["text1Point"] = "CENTER",
			["text2FontFlags"] = "OUTLINE",
			["height"] = 40,
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
				["class"] = {
					["single"] = "MAGE",
					["multi"] = {
						["MAGE"] = true,
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
				["spec"] = {
					["single"] = 2,
					["multi"] = {
						[2] = true,
					},
				},
				["faction"] = {
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
			["yOffset"] = 0,
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["parent"] = "Buffs",
			["text2Containment"] = "INSIDE",
			["displayIcon"] = "Interface\\Icons\\Spell_Frost_ColdHearted",
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
			["text2Font"] = "Friz Quadrata TT",
			["text1Font"] = "Friz Quadrata TT",
			["text2FontSize"] = 24,
			["anchorFrameType"] = "SCREEN",
			["text2Enabled"] = false,
			["text1"] = "%c",
			["text2"] = "%p",
			["id"] = "Potion",
			["zoom"] = 0.18,
			["auto"] = true,
			["text1FontFlags"] = "OUTLINE",
			["additional_triggers"] = {
			},
			["xOffset"] = 0,
			["frameStrata"] = 1,
			["width"] = 40,
			["stickyDuration"] = false,
			["text2Point"] = "CENTER",
			["inverse"] = false,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["cooldown"] = true,
			["selfPoint"] = "CENTER",
		},
		["燃烧 2"] = {
			["glow"] = false,
			["text1FontSize"] = 32,
			["cooldownTextEnabled"] = true,
			["customText"] = "function()\n    for i=1, 40, 1 do\n        local i_spellID = select(11, UnitDebuff(aura_env.unitID,i))\n        if i_spellID and i_spellID==aura_env.spellID then\n            local tooltipSize = select(3, WeakAuras.GetAuraTooltipInfo(aura_env.unitID, i, aura_env.filter))\n            return aura_env.shortenNumber(tooltipSize) or aura_env.alternativeText\n        end\n    end    \n    return aura_env.alternativeText\nend",
			["untrigger"] = {
			},
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = 0,
			["customTextUpdate"] = "event",
			["actions"] = {
				["start"] = {
					["do_glow"] = false,
					["glow_frame"] = "WeakAuras:Artillery",
					["do_message"] = false,
					["do_sound"] = false,
					["message_type"] = "SAY",
					["glow_action"] = "show",
					["sound"] = "Interface\\AddOns\\Prat-3.0\\Sounds\\Link.ogg",
					["message"] = "",
				},
				["finish"] = {
				},
				["init"] = {
					["do_custom"] = true,
					["custom"] = "aura_env.spellID = 240262 -- Change to whatever debuff you want to keep track\naura_env.unitID = \"player\"\naura_env.filter = \"harmful\"\naura_env.alternativeText = \"DOT\"\n\naura_env.shortenNumber = function(number)\n    if type(number) ~= \"number\" then\n        number = tonumber(number)\n    end\n    if not number then\n        return\n    end\n    \n    local affixes = {\n        \"\",\n        \"K\",\n        \"M\",\n        \"B\",\n    }\n    \n    local affix = 1\n    local dec = 0\n    local num1 = math.abs(number)\n    while num1 >= 1000 and affix < #affixes do\n        num1 = num1 / 1000\n        affix = affix + 1\n    end\n    if affix > 1 then\n        dec = 2\n        local num2 = num1\n        while num2 >= 10 do\n            num2 = num2 / 10\n            dec = dec - 1\n        end\n    end\n    if number < 0 then\n        num1 = -num1\n    end\n    \n    return string.format(\"%.\"..dec..\"f\"..affixes[affix], num1)\nend",
				},
			},
			["fontFlags"] = "THICKOUTLINE",
			["useTooltip"] = false,
			["animation"] = {
				["start"] = {
					["preset"] = "spiral",
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
			},
			["trigger"] = {
				["fullscan"] = true,
				["type"] = "aura",
				["spellId"] = "240262",
				["unevent"] = "timed",
				["subeventPrefix"] = "SPELL",
				["duration"] = "2",
				["event"] = "Combat Log",
				["use_unit"] = true,
				["unit"] = "player",
				["use_spellId"] = true,
				["name"] = "燃烧",
				["subeventSuffix"] = "_CAST_START",
				["custom_hide"] = "timed",
				["spellIds"] = {
					200084, -- [1]
				},
				["names"] = {
					"灵魂之刃", -- [1]
				},
				["debuffType"] = "HARMFUL",
			},
			["parent"] = "萨格拉斯之墓 - 09#基尔加丹",
			["text1Containment"] = "OUTSIDE",
			["yOffset"] = 0,
			["text1Point"] = "BOTTOM",
			["stacksPoint"] = "BOTTOM",
			["text2FontFlags"] = "OUTLINE",
			["height"] = 100,
			["conditions"] = {
			},
			["load"] = {
				["use_never"] = false,
				["zone"] = "Hellfire Citadel",
				["encounterid"] = "2051",
				["use_encounterid"] = true,
				["role"] = {
					["single"] = "TANK",
					["multi"] = {
						["TANK"] = true,
					},
				},
				["size"] = {
					["single"] = "party",
					["multi"] = {
						["party"] = true,
					},
				},
				["talent2"] = {
					["multi"] = {
					},
				},
				["zoneId"] = "1147",
				["talent"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["use_zone"] = false,
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["use_level"] = false,
				["race"] = {
					["multi"] = {
					},
				},
				["faction"] = {
					["multi"] = {
					},
				},
				["use_zoneId"] = true,
			},
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["inverse"] = false,
			["fontSize"] = 15,
			["text2Containment"] = "OUTSIDE",
			["stickyDuration"] = false,
			["text1Color"] = {
				0, -- [1]
				0.701960784313726, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text2Font"] = "Friz Quadrata TT",
			["anchorFrameType"] = "SCREEN",
			["text1FontFlags"] = "THICKOUTLINE",
			["regionType"] = "icon",
			["frameStrata"] = 1,
			["selfPoint"] = "CENTER",
			["text2FontSize"] = 32,
			["additional_triggers"] = {
			},
			["xOffset"] = 0,
			["text1"] = "%c",
			["zoom"] = 0,
			["stacksContainment"] = "OUTSIDE",
			["text2"] = "%s",
			["auto"] = true,
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["id"] = "燃烧 2",
			["text1Font"] = "Friz Quadrata TT",
			["text2Enabled"] = false,
			["width"] = 100,
			["desaturate"] = false,
			["text1Enabled"] = true,
			["numTriggers"] = 1,
			["icon"] = true,
			["displayIcon"] = 464119,
			["cooldown"] = true,
			["text2Point"] = "TOP",
		},
		["Fire 4T20"] = {
			["glow"] = false,
			["text1FontSize"] = 6,
			["cooldownTextEnabled"] = true,
			["untrigger"] = {
			},
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = 0,
			["customTextUpdate"] = "update",
			["icon"] = true,
			["text1Enabled"] = true,
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["type"] = "preset",
					["preset"] = "grow",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["preset"] = "pulse",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["preset"] = "fade",
					["type"] = "none",
				},
			},
			["trigger"] = {
				["type"] = "aura",
				["spellId"] = "242251",
				["subeventSuffix"] = "_CAST_START",
				["event"] = "Health",
				["names"] = {
					"猛烈爆击", -- [1]
				},
				["fullscan"] = true,
				["use_spellId"] = true,
				["name"] = "猛烈爆击",
				["custom_hide"] = "timed",
				["spellIds"] = {
					242251, -- [1]
				},
				["unit"] = "player",
				["subeventPrefix"] = "SPELL",
				["debuffType"] = "HELPFUL",
			},
			["desaturate"] = false,
			["text1Point"] = "CENTER",
			["text2FontFlags"] = "OUTLINE",
			["height"] = 40,
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
				["spec"] = {
					["single"] = 2,
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
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["role"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["single"] = "MAGE",
					["multi"] = {
						["MAGE"] = true,
					},
				},
				["faction"] = {
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
			["parent"] = "Buffs",
			["displayIcon"] = "Interface\\Icons\\Spell_Nature_Lightning",
			["text2Containment"] = "INSIDE",
			["yOffset"] = 0,
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
			["text2Font"] = "Friz Quadrata TT",
			["text1Font"] = "Friz Quadrata TT",
			["text2FontSize"] = 24,
			["anchorFrameType"] = "SCREEN",
			["text2Enabled"] = false,
			["text1"] = "%p",
			["text2"] = "%p",
			["id"] = "Fire 4T20",
			["zoom"] = 0.18,
			["auto"] = true,
			["text1FontFlags"] = "OUTLINE",
			["additional_triggers"] = {
			},
			["xOffset"] = 0,
			["frameStrata"] = 1,
			["width"] = 40,
			["stickyDuration"] = false,
			["text2Point"] = "CENTER",
			["inverse"] = false,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["cooldown"] = true,
			["selfPoint"] = "CENTER",
		},
		["Arcane: Evocation Buff"] = {
			["glow"] = false,
			["text1FontSize"] = 6,
			["cooldownTextEnabled"] = true,
			["untrigger"] = {
			},
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = 0,
			["customTextUpdate"] = "update",
			["icon"] = true,
			["text1Enabled"] = true,
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["type"] = "preset",
					["preset"] = "grow",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["preset"] = "pulse",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["preset"] = "fade",
					["type"] = "none",
				},
			},
			["trigger"] = {
				["type"] = "aura",
				["subeventSuffix"] = "_CAST_START",
				["event"] = "Health",
				["names"] = {
					"唤醒", -- [1]
				},
				["spellIds"] = {
					12051, -- [1]
				},
				["debuffType"] = "HELPFUL",
				["unit"] = "player",
				["subeventPrefix"] = "SPELL",
				["custom_hide"] = "timed",
			},
			["desaturate"] = false,
			["text1Point"] = "CENTER",
			["text2FontFlags"] = "OUTLINE",
			["height"] = 40,
			["load"] = {
				["talent2"] = {
					["multi"] = {
					},
				},
				["use_never"] = false,
				["talent"] = {
					["single"] = 4,
					["multi"] = {
						[4] = true,
					},
				},
				["class"] = {
					["single"] = "MAGE",
					["multi"] = {
						["MAGE"] = true,
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
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["faction"] = {
					["multi"] = {
					},
				},
				["use_spec"] = true,
				["role"] = {
					["multi"] = {
					},
				},
				["use_name"] = false,
				["size"] = {
					["multi"] = {
					},
				},
			},
			["color"] = {
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
			["parent"] = "Buffs",
			["text2Containment"] = "INSIDE",
			["displayIcon"] = "INTERFACE\\ICONS\\ability_mage_timewarp",
			["text1Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["selfPoint"] = "CENTER",
			["numTriggers"] = 1,
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["regionType"] = "icon",
			["xOffset"] = -136.999690684516,
			["text1Containment"] = "INSIDE",
			["text2FontSize"] = 24,
			["width"] = 40,
			["text2Enabled"] = false,
			["text1"] = "%c",
			["text2"] = "%p",
			["id"] = "Arcane: Evocation Buff",
			["zoom"] = 0.18,
			["auto"] = true,
			["text1Font"] = "Friz Quadrata TT",
			["additional_triggers"] = {
			},
			["text1FontFlags"] = "OUTLINE",
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["text2Font"] = "Friz Quadrata TT",
			["stickyDuration"] = false,
			["inverse"] = false,
			["text2Point"] = "CENTER",
			["conditions"] = {
			},
			["cooldown"] = true,
			["yOffset"] = -42.0004531338487,
		},
		["邪爪 - debuff"] = {
			["text2Point"] = "TOP",
			["text1FontSize"] = 20,
			["cooldownTextEnabled"] = true,
			["customText"] = "\n\n",
			["untrigger"] = {
			},
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = 0,
			["customTextUpdate"] = "event",
			["actions"] = {
				["start"] = {
					["do_glow"] = false,
					["message"] = "",
					["sound"] = "Interface\\AddOns\\Prat-3.0\\Sounds\\Link.ogg",
					["do_sound"] = false,
					["message_type"] = "SAY",
					["glow_action"] = "show",
					["do_message"] = false,
					["glow_frame"] = "WeakAuras:Artillery",
				},
				["finish"] = {
				},
				["init"] = {
					["do_custom"] = false,
					["custom"] = "\n\n",
				},
			},
			["fontFlags"] = "THICKOUTLINE",
			["useTooltip"] = false,
			["animation"] = {
				["start"] = {
					["preset"] = "spiral",
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
			},
			["trigger"] = {
				["spellId"] = "245509",
				["duration"] = "2",
				["names"] = {
					"邪爪", -- [1]
				},
				["subcount"] = true,
				["specificUnit"] = "boss1",
				["debuffType"] = "HARMFUL",
				["type"] = "aura",
				["unevent"] = "timed",
				["subeventPrefix"] = "SPELL",
				["event"] = "Combat Log",
				["subeventSuffix"] = "_CAST_START",
				["unit"] = "player",
				["use_spellId"] = true,
				["name"] = "邪爪",
				["spellIds"] = {
					239932, -- [1]
				},
				["use_unit"] = true,
				["use_specific_unit"] = false,
				["custom_hide"] = "timed",
				["fullscan"] = true,
			},
			["parent"] = "萨格拉斯之墓 - 09#基尔加丹",
			["text1Containment"] = "OUTSIDE",
			["yOffset"] = 0,
			["text1Point"] = "BOTTOM",
			["cooldown"] = true,
			["text2FontFlags"] = "THICKOUTLINE",
			["height"] = 100,
			["conditions"] = {
			},
			["load"] = {
				["use_never"] = false,
				["zone"] = "Hellfire Citadel",
				["encounterid"] = "2051",
				["use_encounterid"] = true,
				["role"] = {
					["single"] = "TANK",
					["multi"] = {
						["TANK"] = true,
					},
				},
				["size"] = {
					["single"] = "party",
					["multi"] = {
						["party"] = true,
					},
				},
				["talent2"] = {
					["multi"] = {
					},
				},
				["zoneId"] = "1147",
				["talent"] = {
					["multi"] = {
					},
				},
				["use_role"] = true,
				["spec"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["use_level"] = false,
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["use_zone"] = false,
				["faction"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["use_zoneId"] = true,
			},
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["inverse"] = false,
			["fontSize"] = 15,
			["text2Containment"] = "OUTSIDE",
			["stickyDuration"] = false,
			["text1Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text2Font"] = "Friz Quadrata TT",
			["anchorFrameType"] = "SCREEN",
			["text1FontFlags"] = "THICKOUTLINE",
			["regionType"] = "icon",
			["frameStrata"] = 1,
			["text1Enabled"] = true,
			["text2FontSize"] = 24,
			["additional_triggers"] = {
			},
			["xOffset"] = 0,
			["text1"] = "易伤: %s%",
			["zoom"] = 0,
			["stacksContainment"] = "OUTSIDE",
			["text2"] = "BOSS",
			["auto"] = true,
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["id"] = "邪爪 - debuff",
			["text1Font"] = "Friz Quadrata TT",
			["text2Enabled"] = false,
			["width"] = 100,
			["selfPoint"] = "CENTER",
			["icon"] = true,
			["numTriggers"] = 1,
			["glow"] = false,
			["displayIcon"] = 464119,
			["stacksPoint"] = "BOTTOM",
			["desaturate"] = true,
		},
		["千魂之暗 - 施法"] = {
			["text2Point"] = "TOP",
			["text1FontSize"] = 20,
			["disjunctive"] = "all",
			["customText"] = "function()\n    return \"去找裂隙\"\nend\n\n\n\n\n\n",
			["untrigger"] = {
			},
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = 0,
			["customTextUpdate"] = "update",
			["actions"] = {
				["start"] = {
					["do_glow"] = false,
					["do_sound"] = false,
					["do_message"] = false,
					["glow_frame"] = "WeakAuras:Artillery",
					["message_type"] = "SAY",
					["glow_action"] = "show",
					["sound"] = "Interface\\AddOns\\Prat-3.0\\Sounds\\Link.ogg",
					["message"] = "",
				},
				["finish"] = {
				},
				["init"] = {
					["do_custom"] = false,
					["custom"] = "\n\n",
				},
			},
			["fontFlags"] = "THICKOUTLINE",
			["text1Containment"] = "OUTSIDE",
			["useTooltip"] = false,
			["parent"] = "萨格拉斯之墓 - 09#基尔加丹",
			["animation"] = {
				["start"] = {
					["preset"] = "spiral",
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
			},
			["trigger"] = {
				["spellId"] = "238999",
				["duration"] = "9",
				["names"] = {
					"暗影映像：绝望", -- [1]
				},
				["specificUnit"] = "boss1",
				["debuffType"] = "HARMFUL",
				["type"] = "event",
				["unevent"] = "timed",
				["event"] = "Combat Log",
				["subeventPrefix"] = "SPELL",
				["subeventSuffix"] = "_CAST_START",
				["use_spellId"] = true,
				["spellIds"] = {
					237590, -- [1]
				},
				["unit"] = "player",
				["use_unit"] = true,
				["use_specific_unit"] = false,
				["name"] = "千魂之暗",
				["custom_hide"] = "timed",
			},
			["stacksPoint"] = "BOTTOM",
			["conditions"] = {
			},
			["desaturate"] = true,
			["stickyDuration"] = false,
			["text1Point"] = "BOTTOM",
			["inverse"] = false,
			["text2FontFlags"] = "THICKOUTLINE",
			["height"] = 100,
			["text2Font"] = "Friz Quadrata TT",
			["load"] = {
				["use_never"] = false,
				["zone"] = "Hellfire Citadel",
				["encounterid"] = "2051",
				["use_encounterid"] = true,
				["race"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["single"] = "party",
					["multi"] = {
						["party"] = true,
					},
				},
				["talent2"] = {
					["multi"] = {
					},
				},
				["use_level"] = false,
				["talent"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["use_zone"] = false,
				["faction"] = {
					["multi"] = {
					},
				},
				["zoneId"] = "1147",
				["use_zoneId"] = true,
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["role"] = {
					["single"] = "HEALER",
					["multi"] = {
						["HEALER"] = true,
						["TANK"] = true,
					},
				},
			},
			["cooldownTextEnabled"] = true,
			["anchorFrameType"] = "SCREEN",
			["fontSize"] = 15,
			["text2Containment"] = "OUTSIDE",
			["frameStrata"] = 1,
			["text1Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["xOffset"] = 0,
			["customTriggerLogic"] = "\n\n",
			["text1FontFlags"] = "THICKOUTLINE",
			["regionType"] = "icon",
			["id"] = "千魂之暗 - 施法",
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text2FontSize"] = 24,
			["selfPoint"] = "CENTER",
			["init_completed"] = 1,
			["text1"] = "%c",
			["zoom"] = 0,
			["stacksContainment"] = "OUTSIDE",
			["text2"] = "BOSS",
			["auto"] = false,
			["text1Enabled"] = true,
			["additional_triggers"] = {
				{
					["trigger"] = {
						["debuffType"] = "HARMFUL",
						["type"] = "aura",
						["spellIds"] = {
							239216, -- [1]
						},
						["subeventSuffix"] = "_CAST_START",
						["unit"] = "player",
						["names"] = {
							"千魂之暗", -- [1]
						},
						["event"] = "Health",
						["subeventPrefix"] = "SPELL",
					},
					["untrigger"] = {
					},
				}, -- [1]
			},
			["text1Font"] = "Friz Quadrata TT",
			["text2Enabled"] = false,
			["width"] = 100,
			["icon"] = true,
			["glow"] = false,
			["numTriggers"] = 2,
			["yOffset"] = 0,
			["displayIcon"] = "136123",
			["cooldown"] = true,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
		},
		["窒息之影"] = {
			["text2Point"] = "TOP",
			["text1FontSize"] = 32,
			["cooldownTextEnabled"] = true,
			["customText"] = "function()\n    for i=1, 40, 1 do\n        local i_spellID = select(11, UnitDebuff(aura_env.unitID,i))\n        if i_spellID and i_spellID==aura_env.spellID then\n            local tooltipSize = select(3, WeakAuras.GetAuraTooltipInfo(aura_env.unitID, i, aura_env.filter))\n            return aura_env.shortenNumber(tooltipSize) or aura_env.alternativeText\n        end\n    end    \n    return aura_env.alternativeText\nend",
			["untrigger"] = {
			},
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = 0,
			["customTextUpdate"] = "event",
			["actions"] = {
				["start"] = {
					["do_glow"] = false,
					["message"] = "",
					["sound"] = "Interface\\AddOns\\Prat-3.0\\Sounds\\Link.ogg",
					["do_sound"] = false,
					["message_type"] = "SAY",
					["glow_action"] = "show",
					["do_message"] = false,
					["glow_frame"] = "WeakAuras:Artillery",
				},
				["finish"] = {
				},
				["init"] = {
					["do_custom"] = true,
					["custom"] = "aura_env.spellID = 241822 -- Change to whatever debuff you want to keep track\naura_env.unitID = \"player\"\naura_env.filter = \"harmful\"\naura_env.alternativeText = \"DOT\"\n\naura_env.shortenNumber = function(number)\n    if type(number) ~= \"number\" then\n        number = tonumber(number)\n    end\n    if not number then\n        return\n    end\n    \n    local affixes = {\n        \"\",\n        \"K\",\n        \"M\",\n        \"B\",\n    }\n    \n    local affix = 1\n    local dec = 0\n    local num1 = math.abs(number)\n    while num1 >= 1000 and affix < #affixes do\n        num1 = num1 / 1000\n        affix = affix + 1\n    end\n    if affix > 1 then\n        dec = 2\n        local num2 = num1\n        while num2 >= 10 do\n            num2 = num2 / 10\n            dec = dec - 1\n        end\n    end\n    if number < 0 then\n        num1 = -num1\n    end\n    \n    return string.format(\"%.\"..dec..\"f\"..affixes[affix], num1)\nend",
				},
			},
			["fontFlags"] = "THICKOUTLINE",
			["useTooltip"] = false,
			["animation"] = {
				["start"] = {
					["preset"] = "spiral",
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
			},
			["trigger"] = {
				["debuffType"] = "HARMFUL",
				["type"] = "aura",
				["spellId"] = "241822",
				["unevent"] = "timed",
				["subeventPrefix"] = "SPELL",
				["duration"] = "2",
				["event"] = "Combat Log",
				["use_unit"] = true,
				["unit"] = "player",
				["use_spellId"] = true,
				["name"] = "窒息之影",
				["subeventSuffix"] = "_CAST_START",
				["custom_hide"] = "timed",
				["spellIds"] = {
					200084, -- [1]
				},
				["names"] = {
					"灵魂之刃", -- [1]
				},
				["fullscan"] = true,
			},
			["parent"] = "萨格拉斯之墓 - 09#基尔加丹",
			["text1Containment"] = "OUTSIDE",
			["yOffset"] = 0,
			["text1Point"] = "BOTTOM",
			["cooldown"] = true,
			["text2FontFlags"] = "THICKOUTLINE",
			["height"] = 100,
			["conditions"] = {
			},
			["load"] = {
				["use_never"] = false,
				["zone"] = "Hellfire Citadel",
				["encounterid"] = "2051",
				["use_encounterid"] = true,
				["role"] = {
					["single"] = "TANK",
					["multi"] = {
						["TANK"] = true,
					},
				},
				["size"] = {
					["single"] = "party",
					["multi"] = {
						["party"] = true,
					},
				},
				["talent2"] = {
					["multi"] = {
					},
				},
				["zoneId"] = "1147",
				["talent"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["use_level"] = false,
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["use_zone"] = false,
				["faction"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["use_zoneId"] = true,
			},
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["inverse"] = false,
			["fontSize"] = 15,
			["text2Containment"] = "OUTSIDE",
			["stickyDuration"] = false,
			["text1Color"] = {
				0, -- [1]
				0.701960784313726, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text2Font"] = "Friz Quadrata TT",
			["anchorFrameType"] = "SCREEN",
			["text1FontFlags"] = "THICKOUTLINE",
			["regionType"] = "icon",
			["frameStrata"] = 1,
			["text1Font"] = "Friz Quadrata TT",
			["text2FontSize"] = 24,
			["additional_triggers"] = {
			},
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text1"] = "%c",
			["zoom"] = 0,
			["stacksContainment"] = "OUTSIDE",
			["text2"] = "吸收治疗",
			["auto"] = true,
			["desaturate"] = false,
			["id"] = "窒息之影",
			["xOffset"] = 0,
			["text2Enabled"] = true,
			["width"] = 100,
			["selfPoint"] = "CENTER",
			["text1Enabled"] = true,
			["numTriggers"] = 1,
			["icon"] = true,
			["displayIcon"] = 464119,
			["stacksPoint"] = "BOTTOM",
			["glow"] = false,
		},
		["Fire 2T20"] = {
			["glow"] = false,
			["text1FontSize"] = 6,
			["cooldownTextEnabled"] = true,
			["untrigger"] = {
			},
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = 0,
			["customTextUpdate"] = "update",
			["icon"] = true,
			["text1Enabled"] = true,
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["preset"] = "grow",
					["type"] = "preset",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["preset"] = "pulse",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["preset"] = "fade",
					["type"] = "none",
				},
			},
			["trigger"] = {
				["type"] = "aura",
				["spellId"] = "246261",
				["subeventSuffix"] = "_CAST_START",
				["event"] = "Health",
				["names"] = {
					"燃烧", -- [1]
				},
				["fullscan"] = true,
				["use_spellId"] = true,
				["spellIds"] = {
					246261, -- [1]
				},
				["name"] = "燃烧",
				["custom_hide"] = "timed",
				["unit"] = "player",
				["subeventPrefix"] = "SPELL",
				["debuffType"] = "HELPFUL",
			},
			["desaturate"] = false,
			["text1Point"] = "CENTER",
			["text2FontFlags"] = "OUTLINE",
			["height"] = 40,
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
				["spec"] = {
					["single"] = 2,
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
				["use_spec"] = true,
				["faction"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["single"] = "MAGE",
					["multi"] = {
						["MAGE"] = true,
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
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["parent"] = "Buffs",
			["displayIcon"] = "Interface\\Icons\\Spell_Nature_Lightning",
			["text2Containment"] = "INSIDE",
			["yOffset"] = 0,
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
			["text2Font"] = "Friz Quadrata TT",
			["text1Font"] = "Friz Quadrata TT",
			["text2FontSize"] = 24,
			["anchorFrameType"] = "SCREEN",
			["text2Enabled"] = false,
			["text1"] = "%p",
			["text2"] = "%p",
			["id"] = "Fire 2T20",
			["zoom"] = 0.18,
			["auto"] = true,
			["text1FontFlags"] = "OUTLINE",
			["additional_triggers"] = {
			},
			["xOffset"] = 0,
			["frameStrata"] = 1,
			["width"] = 40,
			["stickyDuration"] = false,
			["text2Point"] = "CENTER",
			["inverse"] = false,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["cooldown"] = true,
			["selfPoint"] = "CENTER",
		},
		["DefCD: IB /EV Buff"] = {
			["glow"] = false,
			["text1FontSize"] = 6,
			["cooldownTextEnabled"] = true,
			["untrigger"] = {
			},
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = 0,
			["customTextUpdate"] = "update",
			["icon"] = true,
			["text1Enabled"] = true,
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["type"] = "preset",
					["preset"] = "grow",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["preset"] = "pulse",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["preset"] = "fade",
					["type"] = "none",
				},
			},
			["trigger"] = {
				["type"] = "aura",
				["subeventSuffix"] = "_CAST_START",
				["event"] = "Health",
				["names"] = {
					"寒冰屏障", -- [1]
					"隐没", -- [2]
				},
				["spellIds"] = {
					45438, -- [1]
					157913, -- [2]
				},
				["debuffType"] = "HELPFUL",
				["unit"] = "player",
				["subeventPrefix"] = "SPELL",
				["custom_hide"] = "timed",
			},
			["desaturate"] = false,
			["text1Point"] = "CENTER",
			["text2FontFlags"] = "OUTLINE",
			["height"] = 40,
			["load"] = {
				["talent2"] = {
					["multi"] = {
					},
				},
				["use_never"] = false,
				["talent"] = {
					["single"] = 11,
					["multi"] = {
						[11] = true,
					},
				},
				["class"] = {
					["single"] = "MAGE",
					["multi"] = {
						["MAGE"] = true,
					},
				},
				["use_name"] = false,
				["race"] = {
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
				["difficulty"] = {
					["multi"] = {
					},
				},
				["faction"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["color"] = {
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
			["parent"] = "Buffs",
			["text2Containment"] = "INSIDE",
			["displayIcon"] = "INTERFACE\\ICONS\\ability_mage_timewarp",
			["text1Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["selfPoint"] = "CENTER",
			["numTriggers"] = 1,
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["regionType"] = "icon",
			["xOffset"] = -136.999690684516,
			["text1Containment"] = "INSIDE",
			["text2FontSize"] = 24,
			["width"] = 40,
			["text2Enabled"] = false,
			["text1"] = "%c",
			["text2"] = "%p",
			["id"] = "DefCD: IB /EV Buff",
			["zoom"] = 0.18,
			["auto"] = true,
			["text1Font"] = "Friz Quadrata TT",
			["additional_triggers"] = {
			},
			["text1FontFlags"] = "OUTLINE",
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["text2Font"] = "Friz Quadrata TT",
			["stickyDuration"] = false,
			["inverse"] = false,
			["text2Point"] = "CENTER",
			["conditions"] = {
			},
			["cooldown"] = true,
			["yOffset"] = -42.0004531338487,
		},
		["饰品2冷却"] = {
			["glow"] = false,
			["text1FontSize"] = 12,
			["cooldownTextEnabled"] = true,
			["untrigger"] = {
				["showOn"] = "showOnCooldown",
				["itemName"] = 140793,
				["itemSlot"] = 14,
			},
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = -10,
			["customTextUpdate"] = "update",
			["icon"] = true,
			["text1Enabled"] = false,
			["animation"] = {
				["start"] = {
					["preset"] = "grow",
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
			},
			["trigger"] = {
				["itemName"] = 140793,
				["unit"] = "player",
				["itemSlot"] = 14,
				["custom_hide"] = "timed",
				["type"] = "status",
				["subeventSuffix"] = "_CAST_START",
				["use_showOn"] = true,
				["event"] = "Cooldown Progress (Equipment Slot)",
				["subeventPrefix"] = "SPELL",
				["use_itemSlot"] = true,
				["names"] = {
				},
				["spellIds"] = {
				},
				["debuffType"] = "HELPFUL",
				["showOn"] = "showOnCooldown",
				["unevent"] = "auto",
				["use_itemName"] = true,
				["use_unit"] = true,
			},
			["desaturate"] = false,
			["text1Point"] = "BOTTOMRIGHT",
			["text2FontFlags"] = "OUTLINE",
			["height"] = 50,
			["load"] = {
				["talent2"] = {
					["multi"] = {
					},
				},
				["use_never"] = true,
				["talent"] = {
					["multi"] = {
					},
				},
				["class"] = {
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
				["spec"] = {
					["multi"] = {
					},
				},
				["use_combat"] = true,
				["role"] = {
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
				["init"] = {
				},
				["finish"] = {
				},
			},
			["yOffset"] = 0,
			["selfPoint"] = "CENTER",
			["text2Containment"] = "INSIDE",
			["parent"] = "饰品冷却",
			["text1Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["numTriggers"] = 1,
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["regionType"] = "icon",
			["stickyDuration"] = false,
			["text2Font"] = "Friz Quadrata TT",
			["text2FontSize"] = 24,
			["anchorFrameType"] = "SCREEN",
			["frameStrata"] = 1,
			["text1"] = "%P",
			["text2"] = "%p",
			["additional_triggers"] = {
			},
			["zoom"] = 0.2,
			["auto"] = true,
			["text1FontFlags"] = "OUTLINE",
			["id"] = "饰品2冷却",
			["text1Font"] = "Friz Quadrata TT",
			["text2Enabled"] = false,
			["width"] = 50,
			["text1Containment"] = "INSIDE",
			["disjunctive"] = "all",
			["inverse"] = true,
			["text2Point"] = "CENTER",
			["conditions"] = {
			},
			["cooldown"] = true,
			["xOffset"] = 60,
		},
		["萦绕的哀嚎"] = {
			["glow"] = false,
			["text1FontSize"] = 32,
			["cooldownTextEnabled"] = true,
			["customText"] = "function()\n    for i=1, 40, 1 do\n        local i_spellID = select(11, UnitDebuff(aura_env.unitID,i))\n        if i_spellID and i_spellID==aura_env.spellID then\n            local tooltipSize = select(3, WeakAuras.GetAuraTooltipInfo(aura_env.unitID, i, aura_env.filter))\n            return aura_env.shortenNumber(tooltipSize) or aura_env.alternativeText\n        end\n    end    \n    return aura_env.alternativeText\nend",
			["untrigger"] = {
			},
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = 0,
			["customTextUpdate"] = "event",
			["actions"] = {
				["start"] = {
					["do_glow"] = false,
					["message"] = "",
					["sound"] = "Interface\\AddOns\\Prat-3.0\\Sounds\\Link.ogg",
					["do_sound"] = false,
					["message_type"] = "SAY",
					["glow_action"] = "show",
					["do_message"] = false,
					["glow_frame"] = "WeakAuras:Artillery",
				},
				["finish"] = {
				},
				["init"] = {
					["do_custom"] = true,
					["custom"] = "aura_env.spellID = 240908 -- Change to whatever debuff you want to keep track\naura_env.unitID = \"player\"\naura_env.filter = \"harmful\"\naura_env.alternativeText = \"DOT\"\n\naura_env.shortenNumber = function(number)\n    if type(number) ~= \"number\" then\n        number = tonumber(number)\n    end\n    if not number then\n        return\n    end\n    \n    local affixes = {\n        \"\",\n        \"K\",\n        \"M\",\n        \"B\",\n    }\n    \n    local affix = 1\n    local dec = 0\n    local num1 = math.abs(number)\n    while num1 >= 1000 and affix < #affixes do\n        num1 = num1 / 1000\n        affix = affix + 1\n    end\n    if affix > 1 then\n        dec = 2\n        local num2 = num1\n        while num2 >= 10 do\n            num2 = num2 / 10\n            dec = dec - 1\n        end\n    end\n    if number < 0 then\n        num1 = -num1\n    end\n    \n    return string.format(\"%.\"..dec..\"f\"..affixes[affix], num1)\nend",
				},
			},
			["fontFlags"] = "THICKOUTLINE",
			["useTooltip"] = false,
			["animation"] = {
				["start"] = {
					["preset"] = "spiral",
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
			},
			["trigger"] = {
				["custom_hide"] = "timed",
				["type"] = "aura",
				["spellId"] = "243624",
				["unevent"] = "timed",
				["subeventPrefix"] = "SPELL",
				["duration"] = "2",
				["event"] = "Combat Log",
				["names"] = {
					"灵魂之刃", -- [1]
				},
				["unit"] = "player",
				["use_spellId"] = true,
				["spellIds"] = {
					200084, -- [1]
				},
				["subeventSuffix"] = "_CAST_START",
				["debuffType"] = "HARMFUL",
				["name"] = "萦绕的哀嚎",
				["use_unit"] = true,
				["fullscan"] = true,
			},
			["parent"] = "萨格拉斯之墓 - 09#基尔加丹",
			["text1Containment"] = "OUTSIDE",
			["yOffset"] = 0,
			["text1Point"] = "BOTTOM",
			["cooldown"] = true,
			["text2FontFlags"] = "OUTLINE",
			["height"] = 100,
			["conditions"] = {
			},
			["load"] = {
				["use_never"] = false,
				["zone"] = "Hellfire Citadel",
				["encounterid"] = "2051",
				["use_encounterid"] = true,
				["role"] = {
					["single"] = "TANK",
					["multi"] = {
						["TANK"] = true,
					},
				},
				["size"] = {
					["single"] = "party",
					["multi"] = {
						["party"] = true,
					},
				},
				["talent2"] = {
					["multi"] = {
					},
				},
				["zoneId"] = "1147",
				["talent"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["use_level"] = false,
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["use_zone"] = false,
				["faction"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["use_zoneId"] = true,
			},
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["inverse"] = false,
			["fontSize"] = 15,
			["text2Containment"] = "OUTSIDE",
			["stickyDuration"] = false,
			["text1Color"] = {
				0, -- [1]
				0.701960784313726, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text2Font"] = "Friz Quadrata TT",
			["anchorFrameType"] = "SCREEN",
			["text1FontFlags"] = "THICKOUTLINE",
			["regionType"] = "icon",
			["frameStrata"] = 1,
			["selfPoint"] = "CENTER",
			["text2FontSize"] = 32,
			["additional_triggers"] = {
			},
			["xOffset"] = 0,
			["text1"] = "%c",
			["zoom"] = 0,
			["stacksContainment"] = "OUTSIDE",
			["text2"] = "%s",
			["auto"] = true,
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["id"] = "萦绕的哀嚎",
			["text1Font"] = "Friz Quadrata TT",
			["text2Enabled"] = false,
			["width"] = 100,
			["desaturate"] = false,
			["text1Enabled"] = true,
			["numTriggers"] = 1,
			["icon"] = true,
			["displayIcon"] = 464119,
			["stacksPoint"] = "BOTTOM",
			["text2Point"] = "TOP",
		},
		["CC Tracker"] = {
			["outline"] = "OUTLINE",
			["disjunctive"] = "any",
			["displayText"] = "%c",
			["customText"] = "function()\n    local result = \"\"\n    local color = \"\"\n    local coloredName = function(name)\n        local _, class = UnitClass(name)\n        return string.format(\"|c%s%s\", RAID_CLASS_COLORS[class].colorStr, name)\n    end\n    function round(num, idp)\n        local mult = 10^(idp or 0)\n        return math.floor(num * mult + 0.5) / mult\n    end\n    if  WeakAuras.IsOptionsOpen() then\n        aura_env.name = {}\n        aura_env.icon = {}\n        aura_env.Display = {}\n        aura_env.check[1] = 0\n        aura_env.spec = {}\n        aura_env.specstore = {}\n        aura_env.lasttime = {}\n        aura_env.talented = {}\n        aura_env.talented2 = {}\n        aura_env.class = {}\n        aura_env.Texture = {}\n        aura_env.inspected = {}\n        aura_env.stun = {}\n        aura_env.hits = {}\n        aura_env.spellid = {}\n        aura_env.duration = {}\n        aura_env.duration2 = {}\n        aura_env.activecheck = {}\n        aura_env.spellid2 = {}\n        aura_env.duration3 = {}\n        aura_env.duration4 = {}\n        aura_env.activecheck2 = {}\n        aura_env.Texture2 = {}\n        aura_env.icon2 = {}\n        aura_env.Display2 = {}\n        local _,_, text = GetSpellInfo(774)\n        local icon = \"|T\"..text..\":30:30:-5:0:64:64:4:60:4:60|t \"\n        return string.format(\"%s%s |c%s%s\", icon, coloredName(UnitName(\"player\")), \"FFFFFFFF\", \"- READY\")\n    else\n        if aura_env.check[1] ~= GetNumGroupMembers() or GetNumGroupMembers() == 0 then -- this triggers if the group disbanded or the amount of players in the group changed, basically \"restarting\" the weakaura\n            aura_env.check[1] = 50\n            aura_env.name = {}\n            aura_env.icon = {}\n            aura_env.Display = {}\n            aura_env.spec = {}\n            aura_env.specstore = {}\n            aura_env.lasttime = {}\n            aura_env.talented = {}\n            aura_env.stun = {}\n            aura_env.talented2 = {}\n            aura_env.class = {}\n            aura_env.Texture = {}\n            aura_env.inspected = {}\n            aura_env.hits = {}\n            aura_env.spellid = {}\n            aura_env.duration = {}\n            aura_env.duration2 = {}\n            aura_env.activecheck = {}\n            aura_env.spellid2 = {}\n            aura_env.duration3 = {}\n            aura_env.duration4 = {}\n            aura_env.activecheck2 = {}\n            aura_env.Texture2 = {}\n            aura_env.icon2 = {}\n            aura_env.Display2 = {}\n            return \"updating...\"\n        end\n        \n        -- display stuns first\n        for i=1, getn(aura_env.spec) do\n            if aura_env.stun[i] == true then\n                if aura_env.Display[i] == true and aura_env.name[i] ~= nil then\n                    local name,realm = UnitName(aura_env.name[i])\n                    if aura_env.activecheck[i] == 0 then\n                        color = \"FFFFFFFF\" -- white\n                        result = result..string.format(\"%s%s |c%s%s%s\\n\", aura_env.icon[i], coloredName(name), color, \" - \", \"READY\")\n                    elseif aura_env.activecheck[i] == 1 then\n                        color = \"FF00F9FF\" -- teal\n                        local cooldown = aura_env.duration[i] - GetTime()\n                        result = result..string.format(\"%s%s |c%s%s%g\\n\", aura_env.icon[i], coloredName(name), color, \" - \", round(cooldown,1))\n                    elseif aura_env.activecheck[i] == 2 then\n                        color = \"FF00FF00\" -- green\n                        local cooldown = aura_env.duration[i] - GetTime()\n                        result = result..string.format(\"%s%s |c%s%s%g\\n\", aura_env.icon[i], coloredName(name), color, \" - \", round(cooldown,1))\n                    elseif aura_env.activecheck[i] == 3 then\n                        color = \"FFFF0000\" -- red\n                        local cooldown = aura_env.duration2[i] - GetTime()\n                        result = result..string.format(\"%s%s |c%s%s%d\\n\", aura_env.icon[i], coloredName(name), color, \" - \", cooldown) -- 0.5 to offset the default rounding the game does\n                    end\n                end\n            end\n        end\n        \n        -- any other utility spells\n        for i=1, getn(aura_env.spec) do\n            if aura_env.stun[i] == false then\n                if aura_env.Display[i] == true and aura_env.name[i] ~= nil then\n                    local name,realm = UnitName(aura_env.name[i])\n                    if aura_env.activecheck[i] == 0 then\n                        color = \"FFFFFFFF\" -- white\n                        result = result..string.format(\"%s%s |c%s%s%s\\n\", aura_env.icon[i], coloredName(name), color, \" - \", \"READY\")\n                    elseif aura_env.activecheck[i] == 1 then\n                        color = \"FF00F9FF\" -- teal\n                        local cooldown = aura_env.duration[i] - GetTime()\n                        result = result..string.format(\"%s%s |c%s%s%g\\n\", aura_env.icon[i], coloredName(name), color, \" - \", round(cooldown,1))\n                    elseif aura_env.activecheck[i] == 2 then\n                        color = \"FF00FF00\" -- green\n                        local cooldown = aura_env.duration[i] - GetTime()\n                        result = result..string.format(\"%s%s |c%s%s%g\\n\", aura_env.icon[i], coloredName(name), color, \" - \", round(cooldown,1))\n                    elseif aura_env.activecheck[i] == 3 then\n                        color = \"FFFF0000\" -- red\n                        local cooldown = aura_env.duration2[i] - GetTime()\n                        result = result..string.format(\"%s%s |c%s%s%d\\n\", aura_env.icon[i], coloredName(name), color, \" - \", cooldown)\n                    end\n                end\n            end\n        end\n        \n        -- possible 2nd spell from the same spec(only applies to massgrip rune and incap roar atm)\n        for i=1, getn(aura_env.spec) do\n            if aura_env.Display2[i] == true and aura_env.name[i] ~= nil then\n                local name,realm = UnitName(aura_env.name[i])\n                if aura_env.activecheck2[i] == 0 then\n                    color = \"FFFFFFFF\" -- white\n                    result = result..string.format(\"%s%s |c%s%s%s\\n\", aura_env.icon2[i], coloredName(name), color, \" - \", \"READY\")\n                elseif aura_env.activecheck2[i] == 1 then\n                    color = \"FF00F9FF\" -- teal\n                    local cooldown = aura_env.duration3[i] - GetTime()\n                    result = result..string.format(\"%s%s |c%s%s%g\\n\", aura_env.icon2[i], coloredName(name), color, \" - \", round(cooldown,1))\n                elseif aura_env.activecheck2[i] == 2 then\n                    color = \"FF00FF00\" -- green\n                    local cooldown = aura_env.duration3[i] - GetTime()\n                    result = result..string.format(\"%s%s |c%s%s%g\\n\", aura_env.icon2[i], coloredName(name), color, \" - \", round(cooldown,1))\n                elseif aura_env.activecheck2[i] == 3 then\n                    color = \"FFFF0000\" -- red\n                    local cooldown = aura_env.duration4[i] - GetTime()\n                    result = result..string.format(\"%s%s |c%s%s%d\\n\", aura_env.icon2[i], coloredName(name), color, \" - \", cooldown)\n                end\n            end\n        end\n        \n        \n        \n    end\n    if result == \"\" then\n        aura_env.check[1] = 50\n        return \"updating...\"\n    end\n    \n    return result\nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
			["yOffset"] = 135.58685302734,
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = 0,
			["customTextUpdate"] = "update",
			["actions"] = {
				["start"] = {
					["message"] = " ",
					["custom"] = "",
					["do_sound"] = false,
					["message_type"] = "SAY",
					["do_glow"] = false,
					["do_message"] = false,
					["do_custom"] = false,
				},
				["finish"] = {
					["custom"] = "aura_env.name = {}\naura_env.duration = {}\naura_env.duration2 = {}\naura_env.icon = {}\naura_env.activecheck = {}\naura_env.class = {}\naura_env.specstore = {}\naura_env.check[1] = 0\naura_env.Texture = {}\naura_env.spec = {}\naura_env.talented = {}\naura_env.talented2 = {}\naura_env.inspected = {}\naura_env.lasttime = {}\naura_env.spellid = {}\naura_env.Display = {}\naura_env.hits = {}\naura_env.spellid2 = {}\naura_env.duration3 = {}\naura_env.duration4 = {}\naura_env.activecheck2 = {}\naura_env.Texture2 = {}\naura_env.icon2 = {}\naura_env.Display2 = {}\naura_env.stun = {}",
					["do_custom"] = true,
				},
				["init"] = {
					["custom"] = "aura_env.name = {}\naura_env.duration = {}\naura_env.duration2 = {}\naura_env.activecheck = {}\naura_env.icon = {}\naura_env.check = {}\naura_env.specstore = {}\naura_env.Texture = {}\naura_env.spec = {}\naura_env.talented = {}\naura_env.talented2 = {}\naura_env.inspected = {}\naura_env.lasttime = {}\ntable.insert(aura_env.check, 0)\naura_env.class = {}\naura_env.spellid = {}\naura_env.Display = {}\naura_env.hits = {}\naura_env.check[1] = 0\naura_env.spellid2 = {}\naura_env.duration3 = {}\naura_env.duration4 = {}\naura_env.activecheck2 = {}\naura_env.Texture2 = {}\naura_env.icon2 = {}\naura_env.Display2 = {}\naura_env.stun = {}\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
					["do_custom"] = true,
				},
			},
			["fontFlags"] = "OUTLINE",
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["main"] = {
					["use_color"] = false,
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
			},
			["trigger"] = {
				["type"] = "custom",
				["custom_type"] = "status",
				["debuffType"] = "HELPFUL",
				["event"] = "Health",
				["subeventPrefix"] = "SPELL",
				["names"] = {
				},
				["unit"] = "player",
				["spellIds"] = {
				},
				["subeventSuffix"] = "_CAST_START",
				["check"] = "event",
				["events"] = "COMBAT_LOG_EVENT_UNFILTERED",
				["custom"] = "function(event, timestamp, event, hideCaster, sourceGUID, sourceName, sourceFlags, sourceRaidFlags, destGUID, destName, destFlags, destRaidFlags, spellID, spellName, spellSchool)\n    \n    \n    if event == \"SPELL_CAST_SUCCESS\" or event == \"SPELL_AURA_APPLIED\" or event == \"SPELL_AURA_REMOVED\" or event == \"SPELL_DAMAGE\" or event == \"SPELL_HEAL\" or event == \"SPELL_INTERRUPT\" then -- just to prevent going through all the checks for every useless combat log entry\n        for i=1,table.getn(aura_env.name) do\n            if aura_env.name[i] ~= nil then\n                -- Hunter Binding Shot\n                if aura_env.class[i] == 3 then\n                    if aura_env.name[i] == sourceName then\n                        if event == \"SPELL_CAST_SUCCESS\" and spellID == 109248 then -- on cast\n                            aura_env.duration[i] = GetTime()+10\n                            aura_env.duration2[i] = GetTime()+45\n                            aura_env.activecheck[i] = 1\n                        end\n                        if event == \"SPELL_AURA_APPLIED\" and spellID == 117526 then -- binding lying on the ground\n                            aura_env.activecheck[i] = 2\n                            aura_env.duration[i] = GetTime()+5\n                        end\n                        \n                        if event == \"SPELL_AURA_REMOVED\" and spellID == 117526 then -- stun removed\n                            aura_env.activecheck[i] = 3\n                        end\n                    end\n                end\n                \n                -- Deathknight Gorefiend's Grasp\n                if aura_env.class[i] == 6 then\n                    if aura_env.name[i] == sourceName then\n                        if event == \"SPELL_CAST_SUCCESS\" and spellID == 108199 then -- on cast\n                            aura_env.duration[i] = GetTime()+0\n                            if aura_env.talented[i] == true then\n                                aura_env.duration2[i] = GetTime()+120\n                            else\n                                aura_env.duration2[i] = GetTime()+180\n                            end\n                            aura_env.activecheck[i] = 1\n                        end\n                    end\n                end\n                \n                -- Demonhunter DPS Chaos Nova\n                if aura_env.class[i] == 12 then\n                    \n                    if event == \"SPELL_AURA_APPLIED\" and spellID == 204490 then -- silence applied\n                        if aura_env.activecheck[i] == 1 then\n                            aura_env.activecheck[i] = 2\n                            if aura_env.talented2[i] == true then\n                                aura_env.duration[i] = GetTime()+8\n                            else\n                                aura_env.duration[i] = GetTime()+6\n                            end\n                        end\n                    end\n                    \n                    if aura_env.name[i] == sourceName then\n                        if event == \"SPELL_CAST_SUCCESS\" and spellID == 179057 then -- on cast\n                            aura_env.duration[i] = GetTime()+5\n                            if aura_env.talented[i] == true then\n                                aura_env.duration2[i] = GetTime()+40\n                            else\n                                aura_env.duration2[i] = GetTime()+60\n                            end\n                            aura_env.activecheck[i] = 3\n                        end\n                        \n                        if event == \"SPELL_AURA_APPLIED\" and spellID == 179057 then -- stun applied\n                            aura_env.activecheck[i] = 2\n                        end\n                        \n                        if event == \"SPELL_AURA_REMOVED\" and spellID == 179057 then -- stun removed\n                            aura_env.activecheck[i] = 3\n                        end\n                        \n                        if event == \"SPELL_HEAL\" and spellID == 178963 then -- reduce CD by 5 if you consume a soul fragment (assuming everyone has the trait at this point)\n                            if aura_env.activecheck[i] ~= 0 then\n                                aura_env.duration2[i] = aura_env.duration2[i]-5\n                            end\n                        end\n                        \n                        \n                        -- Demonhunter Silence Sigil\n                        if event == \"SPELL_CAST_SUCCESS\" and (spellID == 202137 or spellID == 207682) then -- on cast (2id's because of talent)\n                            if aura_env.talented[i] == true then\n                                aura_env.duration[i] = GetTime()+1\n                                aura_env.duration2[i] = GetTime()+48\n                            else\n                                aura_env.duration[i] = GetTime()+2\n                                aura_env.duration2[i] = GetTime()+60\n                            end\n                            aura_env.activecheck[i] = 1\n                        end\n                        \n                        \n                        \n                        if event == \"SPELL_AURA_REMOVED\" and spellID == 204490 then -- silence removed\n                            aura_env.activecheck[i] = 3\n                        end\n                        \n                        -- grip-rune\n                        if event == \"SPELL_CAST_SUCCESS\" and spellID == 202138 then -- on cast\n                            aura_env.duration3[i] = GetTime()+2\n                            aura_env.duration4[i] = GetTime()+60\n                            aura_env.activecheck2[i] = 1\n                        end\n                        \n                        if event == \"SPELL_AURA_APPLIED\" and spellID == 204843 then -- slow applied\n                            aura_env.duration3[i] = GetTime()+6\n                            aura_env.activecheck2[i] = 2\n                        end\n                        \n                        if event == \"SPELL_AURA_REMOVED\" and spellID == 204843 then -- slow removed\n                            aura_env.activecheck2[i] = 3\n                        end\n                    end\n                    \n                end\n                \n                -- Monk Legsweep\n                if aura_env.class[i] == 10 then\n                    if aura_env.name[i] == sourceName then\n                        if event == \"SPELL_CAST_SUCCESS\" and spellID == 119381 then -- on cast\n                            aura_env.duration[i] = GetTime()+5\n                            aura_env.duration2[i] = GetTime()+45\n                            aura_env.activecheck[i] = 3\n                        end\n                        if event == \"SPELL_AURA_APPLIED\" and spellID == 119381 then -- stun applied\n                            aura_env.activecheck[i] = 2\n                        end\n                        \n                        if event == \"SPELL_AURA_REMOVED\" and spellID == 119381 then -- stun removed\n                            aura_env.activecheck[i] = 3\n                        end\n                    end\n                    \n                    \n                end\n                \n                -- Warrior Shockwave\n                if aura_env.class[i] == 1 then  \n                    if aura_env.name[i] == sourceName then\n                        if event == \"SPELL_CAST_SUCCESS\" and spellID == 46968 then -- on cast\n                            aura_env.duration[i] = GetTime()+4\n                            aura_env.duration2[i] = GetTime()+40\n                            aura_env.activecheck[i] = 3\n                            aura_env.hits[i] = 0\n                        end\n                        if event == \"SPELL_AURA_APPLIED\" and spellID == 132168 then -- stun applied\n                            aura_env.activecheck[i] = 2\n                        end\n                        if event == \"SPELL_DAMAGE\" and spellID == 46968 then -- counting hits to get the correct cooldown\n                            aura_env.hits[i] = aura_env.hits[i]+1\n                            if aura_env.hits[i] == 3 then\n                                aura_env.duration2[i] = aura_env.duration2[i] - 20\n                            end\n                            aura_env.duration[i] = GetTime()+4\n                        end\n                        \n                        if event == \"SPELL_AURA_REMOVED\" and spellID == 132168 then -- stun removed\n                            aura_env.activecheck[i] = 3\n                            aura_env.hits[i] = 0\n                        end\n                    end\n                end\n                \n                -- Shaman stuntotem\n                if aura_env.class[i] == 7 then\n                    if event == \"SPELL_AURA_APPLIED\" and spellID == 118905 then -- cast applied\n                        if aura_env.activecheck[i] == 1 and GetTime() >= aura_env.duration[i]-1 then -- (can't check for sourcename because its the totem doing the stun not the player)\n                            aura_env.activecheck[i] = 2\n                            aura_env.duration[i] = GetTime()+5\n                        end\n                    end\n                    \n                    if aura_env.name[i] == sourceName then\n                        if event == \"SPELL_CAST_SUCCESS\" and spellID == 192058 then -- on cast\n                            aura_env.duration[i] = GetTime()+2\n                            aura_env.duration2[i] = GetTime()+45\n                            aura_env.activecheck[i] = 1\n                        end\n                        \n                        if event == \"SPELL_AURA_REMOVED\" and spellID == 118905 then -- stun removed\n                            aura_env.activecheck[i] = 3\n                        end\n                    end\n                    \n                end\n                \n                -- Druid\n                if aura_env.class[i] == 11 then\n                    -- Vortex\n                    if event == \"SPELL_AURA_REMOVED\" and (spellID == 77764 or spellID == 77761) then -- roar removed\n                        if aura_env.activecheck[i] == 2 then\n                            aura_env.activecheck[i] = 3\n                        end\n                    end\n                    if aura_env.name[i] == sourceName then\n                        if event == \"SPELL_CAST_SUCCESS\" and spellID == 102793 then -- on cast (Vortex)\n                            aura_env.duration[i] = GetTime()+10\n                            aura_env.duration2[i] = GetTime()+60\n                            aura_env.activecheck[i] = 1\n                        end\n                        -- Stampeding Roar\n                        if event == \"SPELL_AURA_APPLIED\" and (spellID == 77764 or spellID == 77761 or spellID == 106898) then -- on cast\n                            aura_env.duration[i] = GetTime()+8\n                            if aura_env.talented[i] == true then\n                                aura_env.duration2[i] = GetTime()+60\n                            else\n                                aura_env.duration2[i] = GetTime()+120\n                            end\n                            aura_env.activecheck[i] = 2\n                        end\n                        \n                        \n                        -- Beam\n                        if event == \"SPELL_CAST_SUCCESS\" and spellID == 78675 then -- on cast (Beam)\n                            aura_env.duration[i] = GetTime()+8\n                            if aura_env.duration2[i+20] == 20 then\n                                aura_env.duration2[i] = GetTime()+45\n                            else\n                                aura_env.duration2[i] = GetTime()+60\n                            end\n                            aura_env.activecheck[i] = 1\n                        end\n                        \n                        if event == \"SPELL_INTERRUPT\" and spellID == 97547 then -- interrupt\n                            aura_env.duration2[i+20] = 20 else\n                            aura_env.duration2[i+20] = 10\n                        end\n                        -- IncapRoar\n                        if event == \"SPELL_CAST_SUCCESS\" and spellID == 99 then -- on cast (Incap Roar)\n                            aura_env.duration3[i] = GetTime()+3\n                            aura_env.duration4[i] = GetTime()+30\n                            aura_env.activecheck2[i] = 3\n                        end\n                        \n                        if event == \"SPELL_AURA_APPLIED\" and spellID == 99 then -- disorient applied (Incap Roar)\n                            aura_env.activecheck2[i] = 2\n                        end\n                        \n                        if event == \"SPELL_AURA_REMOVED\" and spellID == 99 then -- disorient removed (Incap Roar)\n                            aura_env.activecheck2[i] = 3\n                        end\n                    end\n                end\n                \n                -- Paladin \n                if aura_env.class[i] == 2 then\n                    if aura_env.name[i] == sourceName then\n                        if event == \"SPELL_CAST_SUCCESS\" and spellID == 115750 then -- on cast\n                            aura_env.duration[i] = GetTime()+6\n                            aura_env.duration2[i] = GetTime()+90\n                            aura_env.activecheck[i] = 3\n                        end\n                        \n                        if event == \"SPELL_AURA_APPLIED\" and spellID == 105421 then -- disorient applied\n                            aura_env.activecheck[i] = 2\n                        end\n                        \n                        if event == \"SPELL_AURA_REMOVED\" and spellID == 105421 then -- disorient removed\n                            aura_env.activecheck[i] = 3\n                        end\n                    end\n                end\n                \n                \n                -- Warlock\n                if aura_env.class[i] == 9 then\n                    if aura_env.name[i] == sourceName then\n                        if event == \"SPELL_CAST_SUCCESS\" and spellID == 30283 then -- on cast\n                            aura_env.duration[i] = GetTime()+5\n                            aura_env.duration2[i] = GetTime()+30\n                            aura_env.activecheck[i] = 3\n                        end\n                        \n                        if event == \"SPELL_AURA_APPLIED\" and spellID == 30283 then -- stun applied\n                            aura_env.activecheck[i] = 2\n                        end\n                        \n                        if event == \"SPELL_AURA_REMOVED\" and spellID == 30283 then -- stun removed\n                            aura_env.activecheck[i] = 3\n                        end\n                    end\n                end\n                \n                -- Priest\n                if aura_env.class[i] == 5 then\n                    if aura_env.name[i] == sourceName then\n                        if event == \"SPELL_CAST_SUCCESS\" and spellID == 205369 then -- on cast\n                            aura_env.duration[i] = GetTime()+2\n                            aura_env.duration2[i] = GetTime()+30\n                            aura_env.activecheck[i] = 1\n                        end\n                        \n                        if event == \"SPELL_AURA_APPLIED\" and spellID == 226943 then -- stun applied\n                            if aura_env.activecheck[i] == 1 and GetTime() >= aura_env.duration[i]-1 then\n                                aura_env.activecheck[i] = 2\n                                aura_env.duration[i] = GetTime()+4\n                            end\n                        end\n                        \n                        if event == \"SPELL_AURA_REMOVED\" and spellID == 226943 then -- stun removed\n                            aura_env.activecheck[i] = 3\n                        end\n                    end\n                    \n                    \n                end\n            end\n            \n        end\n    end\nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
				["custom_hide"] = "timed",
			},
			["desaturate"] = false,
			["font"] = "Friz Quadrata TT",
			["height"] = 14.7691974639893,
			["load"] = {
				["spec"] = {
					["multi"] = {
					},
				},
				["use_size"] = true,
				["use_never"] = false,
				["talent"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["encounterid"] = "1853",
				["talent2"] = {
					["multi"] = {
					},
				},
				["use_encounterid"] = false,
				["difficulty"] = {
					["single"] = "mythic",
					["multi"] = {
						["mythic"] = true,
					},
				},
				["use_zone"] = false,
				["zone"] = "Blackrock Foundry",
				["faction"] = {
					["multi"] = {
					},
				},
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["role"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["single"] = "party",
					["multi"] = {
						["party"] = true,
					},
				},
			},
			["fontSize"] = 15,
			["displayStacks"] = "%c",
			["parent"] = "CC Tracker ",
			["desc"] = "Author: (EU)Reloh-Blackrock Reloe#2787",
			["stacksPoint"] = "RIGHT",
			["regionType"] = "text",
			["conditions"] = {
			},
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["inverse"] = false,
			["untrigger"] = {
				["custom"] = "\n\n",
			},
			["init_completed"] = 1,
			["justify"] = "LEFT",
			["anchorFrameType"] = "SCREEN",
			["stacksContainment"] = "OUTSIDE",
			["zoom"] = 0.3,
			["auto"] = false,
			["id"] = "CC Tracker",
			["additional_triggers"] = {
				{
					["trigger"] = {
						["type"] = "custom",
						["custom_type"] = "status",
						["event"] = "Health",
						["unit"] = "player",
						["subeventSuffix"] = "_CAST_START",
						["custom"] = "function()\n    if aura_env.check[1] == 0 or aura_env.check[1] == 45 then -- return true if any CC spell is in the group to trigger Display code\n        for i=1, getn(aura_env.spec) do\n            if aura_env.Display[i] == true or aura_env.Display2[i] == true then\n                aura_env.check[1] = GetNumGroupMembers()\n                return true\n            end\n        end\n    end\n    \n    if aura_env.check[1] == 0 or aura_env.check[1] == 45 then -- insert all standard values if the player is one of the classes that may have a tracked CC\n        aura_env.name = {}\n        for i=1, GetNumGroupMembers() do\n            local name, rank, subgroup, level, class = GetRaidRosterInfo(i)\n            if name ~= nil then\n                local localizedClass, englishClass, classIndex = UnitClass(name)\n                if classIndex == 1 or classIndex == 2 or classIndex == 3 or classIndex == 5 or classIndex == 6 or classIndex == 7 or classIndex == 9 or classIndex == 10 or classIndex == 11 or classIndex == 12 then\n                    table.insert(aura_env.name, name)\n                    if getn(aura_env.spec) < getn(aura_env.name) then\n                        table.insert(aura_env.spec, 0)\n                        table.insert(aura_env.class, classIndex)\n                        table.insert(aura_env.specstore, 0)\n                        table.insert(aura_env.talented, false)\n                        table.insert(aura_env.talented2, false)\n                        table.insert(aura_env.inspected, false)\n                        table.insert(aura_env.lasttime, GetTime())\n                        table.insert(aura_env.Display, false)\n                        table.insert(aura_env.spellid, 0)\n                        table.insert(aura_env.hits, 0)\n                        table.insert(aura_env.duration, GetTime()+0)\n                        table.insert(aura_env.duration2, GetTime()+0)\n                        table.insert(aura_env.activecheck, 0)\n                        table.insert(aura_env.Texture, \"\")\n                        table.insert(aura_env.icon, \"\")\n                        table.insert(aura_env.spellid2, 0)\n                        table.insert(aura_env.duration3, GetTime()+0)\n                        table.insert(aura_env.duration4, GetTime()+0)\n                        table.insert(aura_env.activecheck2, 0)\n                        table.insert(aura_env.Texture2, \"\")\n                        table.insert(aura_env.icon2, \"\")\n                        table.insert(aura_env.Display2, false)\n                        table.insert(aura_env.stun, false)\n                    end\n                end\n            end\n        end\n    end\n    \n    for i=1,getn(aura_env.name) do -- set spell to ready if cooldown has run out\n        if aura_env.activecheck[i] == 3 then\n            if aura_env.duration2[i] - GetTime() <= 0 then\n                aura_env.activecheck[i] = 0\n            end\n        elseif aura_env.activecheck[i] == 1 or aura_env.activecheck[i] == 2 then -- set spell to \"on CD\" if its active-time has run out to not get negative values shown\n            if aura_env.duration[i] - GetTime() <= 0 then\n                aura_env.activecheck[i] = 3\n            end\n        end\n        \n        -- same thing for 2nd spell\n        if aura_env.activecheck2[i] == 3 then \n            if aura_env.duration4[i] - GetTime() <= 0 then\n                aura_env.activecheck2[i] = 0\n            end\n        elseif aura_env.activecheck2[i] == 1 or aura_env.activecheck2[i] == 2 then\n            if aura_env.duration3[i] - GetTime() <= 0 then\n                aura_env.activecheck2[i] = 3\n            end\n        end\n        \n        if aura_env.inspected[i] == false then \n            if aura_env.name[i] ~= UnitName(\"player\") then\n                local canInspect = CanInspect(aura_env.name[i]) -- inspect player\n                if canInspect == false then\n                    return false;\n                else\n                    NotifyInspect(aura_env.name[i])\n                    aura_env.specstore[i] = 1\n                    aura_env.inspected[i] = nil\n                end\n            else\n                aura_env.specstore[i] = 1\n                aura_env.inspected[i] = true\n            end\n        end\n        if aura_env.specstore[i] == 1 then -- triggers if the player got inspected or the character is the player himself    \n            if aura_env.name[i] == UnitName(\"player\") then\n                aura_env.specstore[i] = GetSpecializationInfo(GetSpecialization())\n            else\n                aura_env.specstore[i] = GetInspectSpecialization(aura_env.name[i])  \n            end \n            if aura_env.specstore[i] == 0 then -- this value turns to 0 if it can't read the characters spec, so set it back to 1 so it runs the whole thing again\n                aura_env.specstore[i] = 1 \n            else\n                aura_env.spec[i] = aura_env.specstore[i] -- transfer over the value to a different variable so we can check if someone changed his spec without loosing the spec-information we had before\n                aura_env.inspected[i] = true\n                aura_env.lasttime[i] = GetTime()\n            end\n        end\n    end\n    \n    \n    for i=1, getn(aura_env.spec) do\n        if aura_env.inspected[i] == true then \n            if aura_env.spec[i] == 253 or aura_env.spec[i] == 254 then  -- Hunter Binding Shot\n                if aura_env.name[i] == UnitName(\"player\") then\n                    _, _, _, aura_env.talented[i] = GetTalentInfo(5, 1, 1, nil,aura_env.name[i]);\n                else\n                    _, _, _, aura_env.talented[i] = GetTalentInfo(5, 1, 1, true, aura_env.name[i]);\n                end\n                \n                if aura_env.talented[i] == true then\n                    aura_env.Display[i] = true\n                    aura_env.stun[i] = true\n                    aura_env.spellid[i] = 109248\n                end\n            elseif aura_env.spec[i] == 250 then -- Blood dk Gorefiend's Grasp\n                if aura_env.name[i] == UnitName(\"player\") then\n                    _, _, _, aura_env.talented[i] = GetTalentInfo(5, 1, 1, nil,aura_env.name[i]);\n                else\n                    _, _, _, aura_env.talented[i] = GetTalentInfo(5, 1, 1, true, aura_env.name[i]);\n                end\n                aura_env.spellid[i] = 108199\n                aura_env.Display[i] = true\n            elseif aura_env.spec[i] == 577 then  -- Havoc DH Chaos Nova\n                if aura_env.name[i] == UnitName(\"player\") then\n                    _, _, _, aura_env.talented[i] = GetTalentInfo(6, 2, 1, nil,aura_env.name[i]);\n                else\n                    _, _, _, aura_env.talented[i] = GetTalentInfo(6, 2, 1, true, aura_env.name[i]);\n                end\n                aura_env.spellid[i] = 190246\n                aura_env.stun[i] = true\n                aura_env.Display[i] = true\n            elseif aura_env.spec[i] == 581 then   -- Veng DH silence/grip rune\n                if aura_env.name[i] == UnitName(\"player\") then\n                    _, _, _, aura_env.talented[i] = GetTalentInfo(5, 2, 1, nil,aura_env.name[i]); -- grip rune\n                    if aura_env.talented[i] == true then\n                        aura_env.Display2[i] = true\n                        aura_env.spellid2[i] = 204843\n                        if aura_env.inspected[i] == true then\n                            _,_, aura_env.Texture2[i] = GetSpellInfo(aura_env.spellid2[i])\n                            if aura_env.Texture2[i] ~= nil then\n                                aura_env.icon2[i] = \"|T\"..aura_env.Texture2[i]..\":31:31:0:-10:64:64:4:60:4:60|t \"\n                            end\n                        end\n                    else\n                        aura_env.Display2[i] = false\n                    end\n                    _, _, _, aura_env.talented[i] = GetTalentInfo(5, 3, 1, nil,aura_env.name[i]); -- CD reduction\n                    _, _, _, aura_env.talented2[i] = GetTalentInfo(5, 1, 1, nil,aura_env.name[i]); -- inc duration\n                    \n                else\n                    _, _, _, aura_env.talented[i] = GetTalentInfo(5, 2, 1, true, aura_env.name[i]);\n                    if aura_env.talented[i] == true then\n                        aura_env.Display2[i] = true\n                        aura_env.spellid2[i] = 204843\n                        if aura_env.inspected[i] == true then\n                            _,_, aura_env.Texture2[i] = GetSpellInfo(aura_env.spellid2[i])\n                            if aura_env.Texture2[i] ~= nil then\n                                aura_env.icon2[i] = \"|T\"..aura_env.Texture2[i]..\":31:31:0:-10:64:64:4:60:4:60|t \"\n                            end\n                        end\n                    else\n                        aura_env.Display2[i] = false \n                    end\n                    _, _, _, aura_env.talented[i] = GetTalentInfo(5, 3, 1, true, aura_env.name[i]);\n                    _, _, _, aura_env.talented2[i] = GetTalentInfo(5, 1, 1, true, aura_env.name[i]);\n                end\n                aura_env.Display[i] = true\n                aura_env.spellid[i] = 202137\n                \n            elseif aura_env.spec[i] == 268 or aura_env.spec[i] == 269 or aura_env.spec[i] == 270  then -- Monk Legsweep\n                if aura_env.name[i] == UnitName(\"player\") then\n                    _, _, _, aura_env.talented[i] = GetTalentInfo(4, 3, 1, nil,aura_env.name[i]);\n                else\n                    _, _, _, aura_env.talented[i] = GetTalentInfo(4, 3, 1, true, aura_env.name[i]);\n                end\n                if aura_env.talented[i] == true then\n                    aura_env.Display[i] = true\n                    aura_env.stun[i] = true\n                    aura_env.spellid[i] = 119381\n                end\n            elseif aura_env.spec[i] == 71 or aura_env.spec[i] == 72 then -- DPS Warrior Shockwave\n                if aura_env.name[i] == UnitName(\"player\") then\n                    _, _, _, aura_env.talented[i] = GetTalentInfo(2, 1, 1, nil,aura_env.name[i]);\n                else\n                    _, _, _, aura_env.talented[i] = GetTalentInfo(2, 1, 1, true, aura_env.name[i]);\n                end\n                \n                if aura_env.talented[i] == true then\n                    aura_env.Display[i] = true\n                    aura_env.stun[i] = true\n                    aura_env.spellid[i] = 46968\n                end\n            elseif aura_env.spec[i] == 258 then -- Shadow Priest\n                if aura_env.name[i] == UnitName(\"player\") then\n                    _, _, _, aura_env.talented[i] = GetTalentInfo(3, 1, 1, nil,aura_env.name[i]);\n                else\n                    _, _, _, aura_env.talented[i] = GetTalentInfo(3, 1, 1, true, aura_env.name[i]);\n                end\n                if aura_env.talented[i] == true then\n                    aura_env.spellid[i] = 205369\n                    aura_env.Display[i] = true\n                    aura_env.stun[i] = true\n                end\n            elseif aura_env.spec[i] == 73 then  -- Tank Warrior Shockwave\n                if aura_env.name[i] == UnitName(\"player\") then\n                    _, _, _, aura_env.talented[i] = GetTalentInfo(1, 1, 1, nil,aura_env.name[i]);\n                else\n                    _, _, _, aura_env.talented[i] = GetTalentInfo(1, 1, 1, true, aura_env.name[i]);\n                end\n                if aura_env.talented[i] == true then\n                    aura_env.Display[i] = true\n                    aura_env.spellid[i] = 46968\n                    aura_env.stun[i] = true\n                end\n            elseif aura_env.spec[i] == 262 or aura_env.spec[i] == 263 or aura_env.spec[i] == 264 then -- Shaman Stuntotem\n                if aura_env.name[i] == UnitName(\"player\") then\n                    _, _, _, aura_env.talented[i] = GetTalentInfo(3, 1, 1, nil,aura_env.name[i]);\n                else\n                    _, _, _, aura_env.talented[i] = GetTalentInfo(3, 1, 1, true, aura_env.name[i]);\n                end\n                if aura_env.talented[i] == true then\n                    aura_env.spellid[i] = 192058\n                    aura_env.Display[i] = true\n                    aura_env.stun[i] = true\n                end\n            elseif aura_env.spec[i] == 266 or aura_env.spec[i] == 267 then -- Warlock Shadowfury\n                if aura_env.name[i] == UnitName(\"player\") then\n                    _, _, _, aura_env.talented[i] = GetTalentInfo(3, 3, 1, nil,aura_env.name[i]);\n                else\n                    _, _, _, aura_env.talented[i] = GetTalentInfo(3, 3, 1, true, aura_env.name[i]);\n                end\n                if aura_env.talented[i] == true then\n                    aura_env.spellid[i] = 30283\n                    aura_env.Display[i] = true\n                    aura_env.stun[i] = true\n                end\n            elseif aura_env.spec[i] == 104 then -- Guardian Roar\n                if aura_env.name[i] == UnitName(\"player\") then\n                    _, _, _, aura_env.talented[i] = GetTalentInfo(2, 1, 1, nil,aura_env.name[i]);\n                else\n                    _, _, _, aura_env.talented[i] = GetTalentInfo(2, 1, 1, true, aura_env.name[i]);\n                end\n                aura_env.spellid[i] = 106898\n                aura_env.Display[i] = true\n                aura_env.spellid2[i] = 99\n                aura_env.Display2[i] = true\n                if aura_env.inspected[i] == true then\n                    _,_, aura_env.Texture2[i] = GetSpellInfo(aura_env.spellid2[i])\n                    if aura_env.Texture2[i] ~= nil then\n                        aura_env.icon2[i] = \"|T\"..aura_env.Texture2[i]..\":31:31:0:-10:64:64:4:60:4:60|t \"\n                    end\n                end\n            elseif aura_env.spec[i] == 65 or aura_env.spec[i] == 66 or aura_env.spec[i] == 70 then -- Paladin Blinding Light\n                if aura_env.name[i] == UnitName(\"player\") then\n                    _, _, _, aura_env.talented[i] = GetTalentInfo(3, 3, 1, nil,aura_env.name[i]);\n                else\n                    _, _, _, aura_env.talented[i] = GetTalentInfo(3, 3, 1, true, aura_env.name[i]);\n                end\n                if aura_env.talented[i] == true then\n                    aura_env.spellid[i] = 115750\n                    aura_env.Display[i] = true\n                end\n            elseif aura_env.spec[i] == 105 then -- Resto Druid Vortex\n                aura_env.Display[i] = true\n                aura_env.Display2[i] = false\n                aura_env.spellid[i] = 102793\n            elseif aura_env.spec[i] == 102 then -- Druid Solarbeam\n                aura_env.Display[i] = true\n                aura_env.Display2[i] = false\n                aura_env.spellid[i] = 78675\n            elseif aura_env.spec[i] == 103 then -- Feral Roar\n                aura_env.Display[i] = true\n                aura_env.Display2[i] = false\n                aura_env.spellid[i] = 106898\n            else\n                aura_env.talented[i] = false\n            end\n            if aura_env.talented[i] == true then\n                aura_env.Display[i] = true\n            end\n        end\n        if aura_env.inspected[i] == true then\n            _,_, aura_env.Texture[i] = GetSpellInfo(aura_env.spellid[i])\n            if aura_env.Texture[i] ~= nil then\n                aura_env.icon[i] = \"|T\"..aura_env.Texture[i]..\":31:31:0:-10:64:64:4:60:4:60|t \" -- first 2 numbers represent the width and height of the icon\n            end\n        end\n        if GetTime() - aura_env.lasttime[i] > 45 and aura_env.lasttime[i] ~= 0 then -- every 45 seconds we check if the person has changed his spec\n            aura_env.inspected[i] = false\n            aura_env.lasttime[i] = GetTime()\n            aura_env.specstore[i] = 0\n        end\n    end\nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
						["subeventPrefix"] = "SPELL",
						["check"] = "update",
						["use_unit"] = true,
						["unevent"] = "auto",
						["custom_hide"] = "timed",
					},
					["untrigger"] = {
						["custom"] = "function()\n    if aura_env.check[1] == 50 then\n        aura_env.check[1] = 45\n        return true\n    end\nend\n\n\n\n\n\n\n\n",
					},
				}, -- [1]
			},
			["xOffset"] = -615.99992370606,
			["frameStrata"] = 1,
			["width"] = 8.38460636138916,
			["stickyDuration"] = false,
			["icon"] = true,
			["numTriggers"] = 2,
			["selfPoint"] = "CENTER",
			["displayIcon"] = 462650,
			["cooldown"] = true,
			["textColor"] = {
				1, -- [1]
				1, -- [2]
				0.96470588235294, -- [3]
				1, -- [4]
			},
		},
		["引力榨取"] = {
			["glow"] = false,
			["text1FontSize"] = 32,
			["cooldownTextEnabled"] = true,
			["customText"] = "function()\n    for i=1, 40, 1 do\n        local i_spellID = select(11, UnitDebuff(aura_env.unitID,i))\n        if i_spellID and i_spellID==aura_env.spellID then\n            local tooltipSize = select(3, WeakAuras.GetAuraTooltipInfo(aura_env.unitID, i, aura_env.filter))\n            return aura_env.shortenNumber(tooltipSize) or aura_env.alternativeText\n        end\n    end    \n    return aura_env.alternativeText\nend",
			["untrigger"] = {
			},
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = 0,
			["customTextUpdate"] = "event",
			["actions"] = {
				["start"] = {
					["do_glow"] = false,
					["message"] = "",
					["sound"] = "Interface\\AddOns\\Prat-3.0\\Sounds\\Link.ogg",
					["do_sound"] = false,
					["message_type"] = "SAY",
					["glow_action"] = "show",
					["do_message"] = false,
					["glow_frame"] = "WeakAuras:Artillery",
				},
				["finish"] = {
				},
				["init"] = {
					["do_custom"] = true,
					["custom"] = "aura_env.spellID = 239155 -- Change to whatever debuff you want to keep track\naura_env.unitID = \"player\"\naura_env.filter = \"harmful\"\naura_env.alternativeText = \"DOT\"\n\naura_env.shortenNumber = function(number)\n    if type(number) ~= \"number\" then\n        number = tonumber(number)\n    end\n    if not number then\n        return\n    end\n    \n    local affixes = {\n        \"\",\n        \"K\",\n        \"M\",\n        \"B\",\n    }\n    \n    local affix = 1\n    local dec = 0\n    local num1 = math.abs(number)\n    while num1 >= 1000 and affix < #affixes do\n        num1 = num1 / 1000\n        affix = affix + 1\n    end\n    if affix > 1 then\n        dec = 2\n        local num2 = num1\n        while num2 >= 10 do\n            num2 = num2 / 10\n            dec = dec - 1\n        end\n    end\n    if number < 0 then\n        num1 = -num1\n    end\n    \n    return string.format(\"%.\"..dec..\"f\"..affixes[affix], num1)\nend",
				},
			},
			["fontFlags"] = "THICKOUTLINE",
			["useTooltip"] = false,
			["animation"] = {
				["start"] = {
					["preset"] = "spiral",
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
			},
			["trigger"] = {
				["debuffType"] = "HARMFUL",
				["type"] = "aura",
				["spellId"] = "239155",
				["unevent"] = "timed",
				["subeventPrefix"] = "SPELL",
				["duration"] = "2",
				["event"] = "Combat Log",
				["use_unit"] = true,
				["unit"] = "player",
				["use_spellId"] = true,
				["name"] = "引力榨取",
				["subeventSuffix"] = "_CAST_START",
				["custom_hide"] = "timed",
				["spellIds"] = {
					200084, -- [1]
				},
				["names"] = {
					"灵魂之刃", -- [1]
				},
				["fullscan"] = true,
			},
			["parent"] = "萨格拉斯之墓 - 09#基尔加丹",
			["text1Containment"] = "OUTSIDE",
			["yOffset"] = 0,
			["text1Point"] = "BOTTOM",
			["cooldown"] = true,
			["text2FontFlags"] = "OUTLINE",
			["height"] = 100,
			["conditions"] = {
			},
			["load"] = {
				["use_never"] = false,
				["zone"] = "Hellfire Citadel",
				["encounterid"] = "2051",
				["use_encounterid"] = true,
				["role"] = {
					["single"] = "TANK",
					["multi"] = {
						["TANK"] = true,
					},
				},
				["size"] = {
					["single"] = "party",
					["multi"] = {
						["party"] = true,
					},
				},
				["talent2"] = {
					["multi"] = {
					},
				},
				["zoneId"] = "1147",
				["talent"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["use_level"] = false,
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["use_zone"] = false,
				["faction"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["use_zoneId"] = true,
			},
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["inverse"] = false,
			["fontSize"] = 15,
			["text2Containment"] = "OUTSIDE",
			["stickyDuration"] = false,
			["text1Color"] = {
				0, -- [1]
				0.701960784313726, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text2Font"] = "Friz Quadrata TT",
			["anchorFrameType"] = "SCREEN",
			["text1FontFlags"] = "THICKOUTLINE",
			["regionType"] = "icon",
			["frameStrata"] = 1,
			["selfPoint"] = "CENTER",
			["text2FontSize"] = 32,
			["additional_triggers"] = {
			},
			["xOffset"] = 0,
			["text1"] = "%c",
			["zoom"] = 0,
			["stacksContainment"] = "OUTSIDE",
			["text2"] = "%s",
			["auto"] = true,
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["id"] = "引力榨取",
			["text1Font"] = "Friz Quadrata TT",
			["text2Enabled"] = false,
			["width"] = 100,
			["desaturate"] = false,
			["text1Enabled"] = true,
			["numTriggers"] = 1,
			["icon"] = true,
			["displayIcon"] = 464119,
			["stacksPoint"] = "BOTTOM",
			["text2Point"] = "TOP",
		},
		["鱼人饲料"] = {
			["text2Point"] = "BOTTOM",
			["text1FontSize"] = 20,
			["cooldownTextEnabled"] = true,
			["customText"] = "function()\n    return \"小怪增强\"\nend\n\n\n\n\n\n",
			["untrigger"] = {
			},
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = 0,
			["customTextUpdate"] = "update",
			["actions"] = {
				["start"] = {
					["do_glow"] = false,
					["message"] = "",
					["sound"] = "Interface\\AddOns\\Prat-3.0\\Sounds\\Link.ogg",
					["glow_frame"] = "WeakAuras:Artillery",
					["message_type"] = "SAY",
					["glow_action"] = "show",
					["do_message"] = false,
					["do_sound"] = false,
				},
				["finish"] = {
				},
				["init"] = {
					["do_custom"] = false,
					["custom"] = "\n\n",
				},
			},
			["fontFlags"] = "THICKOUTLINE",
			["useTooltip"] = false,
			["animation"] = {
				["start"] = {
					["preset"] = "spiral",
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
			},
			["trigger"] = {
				["spellId"] = "242945",
				["duration"] = "2",
				["unit"] = "target",
				["subcount"] = true,
				["custom_hide"] = "timed",
				["type"] = "aura",
				["unevent"] = "timed",
				["subeventPrefix"] = "SPELL",
				["event"] = "Combat Log",
				["debuffType"] = "HELPFUL",
				["subeventSuffix"] = "_CAST_START",
				["use_spellId"] = true,
				["spellIds"] = {
					242945, -- [1]
				},
				["names"] = {
					"鱼人饲料", -- [1]
				},
				["use_unit"] = true,
				["name"] = "鱼人饲料",
				["use_specific_unit"] = false,
				["fullscan"] = true,
			},
			["desaturate"] = true,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text1Containment"] = "OUTSIDE",
			["cooldown"] = true,
			["text1Point"] = "TOP",
			["conditions"] = {
			},
			["text2FontFlags"] = "THICKOUTLINE",
			["height"] = 100,
			["stickyDuration"] = false,
			["load"] = {
				["use_never"] = false,
				["zone"] = "Hellfire Citadel",
				["encounterid"] = "2037",
				["use_encounterid"] = true,
				["role"] = {
					["single"] = "TANK",
					["multi"] = {
						["TANK"] = true,
					},
				},
				["size"] = {
					["single"] = "party",
					["multi"] = {
						["party"] = true,
					},
				},
				["talent2"] = {
					["multi"] = {
					},
				},
				["zoneId"] = "1147",
				["talent"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["use_level"] = false,
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["use_zone"] = false,
				["faction"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["use_zoneId"] = true,
			},
			["inverse"] = false,
			["text2Font"] = "Friz Quadrata TT",
			["fontSize"] = 15,
			["text2Containment"] = "OUTSIDE",
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text1Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["anchorFrameType"] = "SCREEN",
			["frameStrata"] = 1,
			["text1FontFlags"] = "THICKOUTLINE",
			["regionType"] = "icon",
			["xOffset"] = 0,
			["id"] = "鱼人饲料",
			["text2FontSize"] = 20,
			["text1Font"] = "Friz Quadrata TT",
			["init_completed"] = 1,
			["text1"] = "%c",
			["zoom"] = 0,
			["stacksContainment"] = "OUTSIDE",
			["text2"] = "增伤: %s%",
			["auto"] = true,
			["selfPoint"] = "CENTER",
			["additional_triggers"] = {
			},
			["text1Enabled"] = true,
			["text2Enabled"] = true,
			["width"] = 100,
			["icon"] = true,
			["glow"] = false,
			["numTriggers"] = 1,
			["yOffset"] = 0,
			["displayIcon"] = 464119,
			["stacksPoint"] = "BOTTOM",
			["parent"] = "萨格拉斯之墓 - 04#主母萨丝琳",
		},
		["萨格拉斯之墓 - 04#主母萨丝琳"] = {
			["grow"] = "RIGHT",
			["controlledChildren"] = {
				"滑不留手", -- [1]
				"美味增益鱼:dps", -- [2]
				"美味增益鱼:治疗", -- [3]
				"痛苦负担", -- [4]
				"深渊巨喉", -- [5]
				"吞噬巨口", -- [6]
				"切割旋风", -- [7]
				"鱼人饲料", -- [8]
				"雷霆震击", -- [9]
				"多头蛇酸液", -- [10]
				"多头蛇酸液 - 分担", -- [11]
				"多头蛇射击", -- [12]
				"吞噬之饥", -- [13]
				"污染墨汁", -- [14]
				"墨汁+吞噬", -- [15]
				"昏暗隐匿", -- [16]
				"碎裂波动", -- [17]
			},
			["xOffset"] = -856.948127746582,
			["yOffset"] = 392.9775390625,
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = 0,
			["space"] = 2,
			["background"] = "None",
			["actions"] = {
				["start"] = {
				},
				["init"] = {
				},
				["finish"] = {
				},
			},
			["backgroundInset"] = 0,
			["selfPoint"] = "LEFT",
			["trigger"] = {
				["subeventPrefix"] = "SPELL",
				["type"] = "aura",
				["spellIds"] = {
				},
				["subeventSuffix"] = "_CAST_START",
				["debuffType"] = "HELPFUL",
				["names"] = {
				},
				["event"] = "Health",
				["unit"] = "player",
			},
			["desc"] = "Author: (EU)Warpaladin-Aegwynn; Created: 19.05.2017; Last Update: 23.06.2017; Iteration: 6",
			["stagger"] = 0,
			["height"] = 99.9999389648438,
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
					["multi"] = {
					},
				},
				["use_class"] = false,
				["role"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
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
				["spec"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["animate"] = false,
			["border"] = "None",
			["regionType"] = "dynamicgroup",
			["sort"] = "none",
			["expanded"] = false,
			["constantFactor"] = "RADIUS",
			["borderOffset"] = 16,
			["id"] = "萨格拉斯之墓 - 04#主母萨丝琳",
			["radius"] = 200,
			["frameStrata"] = 1,
			["width"] = 1732.00012207031,
			["untrigger"] = {
			},
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
			},
			["numTriggers"] = 1,
			["align"] = "CENTER",
			["rotation"] = 0,
			["conditions"] = {
			},
			["anchorFrameType"] = "SCREEN",
			["additional_triggers"] = {
			},
		},
		["DefCD: Invisibility Buff"] = {
			["glow"] = false,
			["text1FontSize"] = 6,
			["cooldownTextEnabled"] = true,
			["untrigger"] = {
			},
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = 0,
			["customTextUpdate"] = "update",
			["icon"] = true,
			["text1Enabled"] = true,
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["type"] = "preset",
					["preset"] = "grow",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["preset"] = "pulse",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["preset"] = "fade",
					["type"] = "none",
				},
			},
			["trigger"] = {
				["autoclone"] = false,
				["spellId"] = "110960; 32612",
				["subeventSuffix"] = "_CAST_START",
				["event"] = "Health",
				["names"] = {
					"隐形术", -- [1]
					"强化隐形术", -- [2]
				},
				["custom_hide"] = "timed",
				["use_spellId"] = true,
				["name"] = "强化隐形术",
				["spellIds"] = {
					32612, -- [1]
					110960, -- [2]
				},
				["unit"] = "player",
				["type"] = "aura",
				["subeventPrefix"] = "SPELL",
				["debuffType"] = "HELPFUL",
			},
			["desaturate"] = false,
			["text1Point"] = "CENTER",
			["text2FontFlags"] = "OUTLINE",
			["height"] = 40,
			["load"] = {
				["talent2"] = {
					["multi"] = {
					},
				},
				["use_never"] = false,
				["talent"] = {
					["single"] = 10,
					["multi"] = {
						[10] = true,
					},
				},
				["class"] = {
					["single"] = "MAGE",
					["multi"] = {
						["MAGE"] = true,
					},
				},
				["use_name"] = false,
				["race"] = {
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
				["difficulty"] = {
					["multi"] = {
					},
				},
				["faction"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["color"] = {
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
			["parent"] = "Buffs",
			["text2Containment"] = "INSIDE",
			["displayIcon"] = "INTERFACE\\ICONS\\ability_mage_timewarp",
			["text1Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["selfPoint"] = "CENTER",
			["numTriggers"] = 1,
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["regionType"] = "icon",
			["xOffset"] = -136.999690684516,
			["text1Containment"] = "INSIDE",
			["text2FontSize"] = 24,
			["width"] = 40,
			["text2Enabled"] = false,
			["text1"] = "%p",
			["text2"] = "%p",
			["id"] = "DefCD: Invisibility Buff",
			["zoom"] = 0.18,
			["auto"] = true,
			["text1Font"] = "Friz Quadrata TT",
			["additional_triggers"] = {
			},
			["text1FontFlags"] = "OUTLINE",
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["text2Font"] = "Friz Quadrata TT",
			["stickyDuration"] = false,
			["inverse"] = false,
			["text2Point"] = "CENTER",
			["conditions"] = {
			},
			["cooldown"] = true,
			["yOffset"] = -42.0004531338487,
		},
		["Racial: Troll Buff"] = {
			["glow"] = false,
			["text1FontSize"] = 6,
			["cooldownTextEnabled"] = true,
			["untrigger"] = {
			},
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = 0,
			["customTextUpdate"] = "update",
			["icon"] = true,
			["text1Enabled"] = true,
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["type"] = "preset",
					["preset"] = "grow",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["preset"] = "pulse",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["preset"] = "fade",
					["type"] = "none",
				},
			},
			["trigger"] = {
				["type"] = "aura",
				["subeventSuffix"] = "_CAST_START",
				["event"] = "Health",
				["names"] = {
					"狂暴", -- [1]
				},
				["spellIds"] = {
					26297, -- [1]
				},
				["debuffType"] = "HELPFUL",
				["unit"] = "player",
				["subeventPrefix"] = "SPELL",
				["custom_hide"] = "timed",
			},
			["desaturate"] = false,
			["text1Point"] = "CENTER",
			["text2FontFlags"] = "OUTLINE",
			["height"] = 40,
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
				["spec"] = {
					["single"] = 2,
					["multi"] = {
						[2] = true,
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
				["class"] = {
					["single"] = "MAGE",
					["multi"] = {
						["MAGE"] = true,
					},
				},
				["pvptalent"] = {
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
			["yOffset"] = 0,
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["parent"] = "Buffs",
			["text2Containment"] = "INSIDE",
			["displayIcon"] = "Interface\\Icons\\Spell_Frost_ColdHearted",
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
			["text2Font"] = "Friz Quadrata TT",
			["text1Font"] = "Friz Quadrata TT",
			["text2FontSize"] = 24,
			["anchorFrameType"] = "SCREEN",
			["text2Enabled"] = false,
			["text1"] = "%c",
			["text2"] = "%p",
			["id"] = "Racial: Troll Buff",
			["zoom"] = 0.18,
			["auto"] = true,
			["text1FontFlags"] = "OUTLINE",
			["additional_triggers"] = {
			},
			["xOffset"] = 0,
			["frameStrata"] = 1,
			["width"] = 40,
			["stickyDuration"] = false,
			["text2Point"] = "CENTER",
			["inverse"] = false,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["cooldown"] = true,
			["selfPoint"] = "CENTER",
		},
		["Arcane: Arcane Power Buff"] = {
			["glow"] = false,
			["text1FontSize"] = 6,
			["cooldownTextEnabled"] = true,
			["untrigger"] = {
			},
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = 0,
			["customTextUpdate"] = "update",
			["icon"] = true,
			["text1Enabled"] = true,
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["type"] = "preset",
					["preset"] = "grow",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["preset"] = "pulse",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["preset"] = "fade",
					["type"] = "none",
				},
			},
			["trigger"] = {
				["type"] = "aura",
				["spellId"] = "12042",
				["subeventSuffix"] = "_CAST_START",
				["event"] = "Health",
				["names"] = {
					"奥术强化", -- [1]
				},
				["use_spellId"] = true,
				["name"] = "奥术强化",
				["custom_hide"] = "timed",
				["spellIds"] = {
					12042, -- [1]
				},
				["unit"] = "player",
				["subeventPrefix"] = "SPELL",
				["debuffType"] = "HELPFUL",
			},
			["desaturate"] = false,
			["text1Point"] = "CENTER",
			["text2FontFlags"] = "OUTLINE",
			["height"] = 40,
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
				["use_spec"] = true,
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["role"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["single"] = "MAGE",
					["multi"] = {
						["MAGE"] = true,
					},
				},
				["faction"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["yOffset"] = 0,
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["parent"] = "Buffs",
			["text2Containment"] = "INSIDE",
			["displayIcon"] = "Interface\\Icons\\Spell_Nature_Lightning",
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
			["text2Font"] = "Friz Quadrata TT",
			["text1Font"] = "Friz Quadrata TT",
			["text2FontSize"] = 24,
			["anchorFrameType"] = "SCREEN",
			["text2Enabled"] = false,
			["text1"] = "%p",
			["text2"] = "%p",
			["id"] = "Arcane: Arcane Power Buff",
			["zoom"] = 0.18,
			["auto"] = true,
			["text1FontFlags"] = "OUTLINE",
			["additional_triggers"] = {
			},
			["xOffset"] = 0,
			["frameStrata"] = 1,
			["width"] = 40,
			["stickyDuration"] = false,
			["text2Point"] = "CENTER",
			["inverse"] = false,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["cooldown"] = true,
			["selfPoint"] = "CENTER",
		},
		["聚焦恐惧烈焰 - 群组"] = {
			["glow"] = false,
			["text1FontSize"] = 22,
			["cooldownTextEnabled"] = true,
			["customText"] = "\n\n",
			["untrigger"] = {
			},
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = 0,
			["customTextUpdate"] = "event",
			["actions"] = {
				["start"] = {
					["do_glow"] = false,
					["message"] = "",
					["sound"] = "Interface\\AddOns\\Prat-3.0\\Sounds\\Link.ogg",
					["glow_frame"] = "WeakAuras:Artillery",
					["message_type"] = "SAY",
					["glow_action"] = "show",
					["do_message"] = false,
					["do_sound"] = false,
				},
				["finish"] = {
				},
				["init"] = {
					["do_custom"] = false,
					["custom"] = "\n\n",
				},
			},
			["fontFlags"] = "THICKOUTLINE",
			["useTooltip"] = false,
			["animation"] = {
				["start"] = {
					["preset"] = "spiral",
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
			},
			["trigger"] = {
				["spellId"] = "239932",
				["duration"] = "2",
				["use_unit"] = true,
				["specificUnit"] = "boss1",
				["group_count"] = "0",
				["debuffType"] = "HARMFUL",
				["type"] = "aura",
				["unevent"] = "timed",
				["subeventPrefix"] = "SPELL",
				["event"] = "Combat Log",
				["subeventSuffix"] = "_CAST_START",
				["group_countOperator"] = ">",
				["use_spellId"] = true,
				["spellIds"] = {
					238505, -- [1]
				},
				["unit"] = "group",
				["name"] = "邪爪",
				["use_specific_unit"] = false,
				["names"] = {
					"聚焦恐惧烈焰", -- [1]
				},
				["custom_hide"] = "timed",
			},
			["yOffset"] = 0,
			["text1Containment"] = "OUTSIDE",
			["parent"] = "萨格拉斯之墓 - 09#基尔加丹",
			["text1Point"] = "BOTTOM",
			["cooldown"] = true,
			["text2FontFlags"] = "THICKOUTLINE",
			["height"] = 100,
			["conditions"] = {
			},
			["load"] = {
				["use_never"] = false,
				["zone"] = "Hellfire Citadel",
				["encounterid"] = "2051",
				["use_encounterid"] = true,
				["race"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["single"] = "party",
					["multi"] = {
						["party"] = true,
					},
				},
				["talent2"] = {
					["multi"] = {
					},
				},
				["zoneId"] = "1147",
				["talent"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["use_level"] = false,
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["use_zone"] = false,
				["faction"] = {
					["multi"] = {
					},
				},
				["use_zoneId"] = true,
				["role"] = {
					["single"] = "TANK",
					["multi"] = {
						["TANK"] = true,
					},
				},
			},
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["inverse"] = false,
			["fontSize"] = 15,
			["text2Containment"] = "OUTSIDE",
			["stickyDuration"] = false,
			["text1Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text2Font"] = "Friz Quadrata TT",
			["anchorFrameType"] = "SCREEN",
			["text1FontFlags"] = "THICKOUTLINE",
			["regionType"] = "icon",
			["frameStrata"] = 1,
			["selfPoint"] = "CENTER",
			["text2FontSize"] = 24,
			["additional_triggers"] = {
				{
					["trigger"] = {
						["type"] = "aura",
						["subeventSuffix"] = "_CAST_START",
						["event"] = "Health",
						["subeventPrefix"] = "SPELL",
						["spellIds"] = {
							238505, -- [1]
						},
						["names"] = {
							"聚焦恐惧烈焰", -- [1]
						},
						["inverse"] = true,
						["unit"] = "player",
						["debuffType"] = "HARMFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
			},
			["xOffset"] = 0,
			["text1"] = "分散分担",
			["zoom"] = 0,
			["stacksContainment"] = "OUTSIDE",
			["text2"] = "BOSS",
			["auto"] = true,
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["id"] = "聚焦恐惧烈焰 - 群组",
			["text1Font"] = "Friz Quadrata TT",
			["text2Enabled"] = false,
			["width"] = 100,
			["desaturate"] = false,
			["text1Enabled"] = true,
			["numTriggers"] = 2,
			["icon"] = true,
			["displayIcon"] = 464119,
			["stacksPoint"] = "BOTTOM",
			["text2Point"] = "TOP",
		},
		["灵魂痛楚"] = {
			["text2Point"] = "BOTTOM",
			["text1FontSize"] = 32,
			["cooldownTextEnabled"] = true,
			["customText"] = "function()\n    for i=1, 40, 1 do\n        local i_spellID = select(11, UnitDebuff(aura_env.unitID,i))\n        if i_spellID and i_spellID==aura_env.spellID then\n            local tooltipSize = select(3, WeakAuras.GetAuraTooltipInfo(aura_env.unitID, i, aura_env.filter))\n            return aura_env.shortenNumber(tooltipSize) or aura_env.alternativeText\n        end\n    end    \n    return aura_env.alternativeText\nend",
			["untrigger"] = {
			},
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = 0,
			["customTextUpdate"] = "event",
			["actions"] = {
				["start"] = {
					["do_glow"] = false,
					["message"] = "",
					["sound"] = "Interface\\AddOns\\Prat-3.0\\Sounds\\Link.ogg",
					["do_sound"] = false,
					["message_type"] = "SAY",
					["glow_action"] = "show",
					["do_message"] = false,
					["glow_frame"] = "WeakAuras:Artillery",
				},
				["finish"] = {
				},
				["init"] = {
					["do_custom"] = true,
					["custom"] = "aura_env.spellID = 236602 -- Change to whatever debuff you want to keep track\naura_env.unitID = \"player\"\naura_env.filter = \"harmful\"\naura_env.alternativeText = \"DOT\"\n\naura_env.shortenNumber = function(number)\n    if type(number) ~= \"number\" then\n        number = tonumber(number)\n    end\n    if not number then\n        return\n    end\n    \n    local affixes = {\n        \"\",\n        \"K\",\n        \"M\",\n        \"B\",\n    }\n    \n    local affix = 1\n    local dec = 0\n    local num1 = math.abs(number)\n    while num1 >= 1000 and affix < #affixes do\n        num1 = num1 / 1000\n        affix = affix + 1\n    end\n    if affix > 1 then\n        dec = 2\n        local num2 = num1\n        while num2 >= 10 do\n            num2 = num2 / 10\n            dec = dec - 1\n        end\n    end\n    if number < 0 then\n        num1 = -num1\n    end\n    \n    return string.format(\"%.\"..dec..\"f\"..affixes[affix], num1)\nend",
				},
			},
			["fontFlags"] = "THICKOUTLINE",
			["useTooltip"] = false,
			["animation"] = {
				["start"] = {
					["preset"] = "spiral",
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
			},
			["trigger"] = {
				["debuffType"] = "HARMFUL",
				["type"] = "aura",
				["spellId"] = "236602",
				["unevent"] = "timed",
				["subeventPrefix"] = "SPELL",
				["duration"] = "2",
				["event"] = "Combat Log",
				["use_unit"] = true,
				["unit"] = "player",
				["use_spellId"] = true,
				["name"] = "灵魂痛楚",
				["subeventSuffix"] = "_CAST_START",
				["custom_hide"] = "timed",
				["spellIds"] = {
					200084, -- [1]
				},
				["names"] = {
					"灵魂之刃", -- [1]
				},
				["fullscan"] = true,
			},
			["parent"] = "萨格拉斯之墓 - 09#基尔加丹",
			["text1Containment"] = "OUTSIDE",
			["yOffset"] = 0,
			["text1Point"] = "TOP",
			["cooldown"] = true,
			["text2FontFlags"] = "THICKOUTLINE",
			["height"] = 100,
			["conditions"] = {
			},
			["load"] = {
				["use_never"] = false,
				["zone"] = "Hellfire Citadel",
				["encounterid"] = "2051",
				["use_encounterid"] = true,
				["role"] = {
					["single"] = "TANK",
					["multi"] = {
						["TANK"] = true,
					},
				},
				["size"] = {
					["single"] = "party",
					["multi"] = {
						["party"] = true,
					},
				},
				["talent2"] = {
					["multi"] = {
					},
				},
				["zoneId"] = "1147",
				["talent"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["use_level"] = false,
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["use_zone"] = false,
				["faction"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["use_zoneId"] = true,
			},
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["inverse"] = false,
			["fontSize"] = 15,
			["text2Containment"] = "OUTSIDE",
			["stickyDuration"] = false,
			["text1Color"] = {
				0, -- [1]
				0.701960784313726, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text2Font"] = "Friz Quadrata TT",
			["anchorFrameType"] = "SCREEN",
			["text1FontFlags"] = "THICKOUTLINE",
			["regionType"] = "icon",
			["frameStrata"] = 1,
			["text1Font"] = "Friz Quadrata TT",
			["text2FontSize"] = 22,
			["additional_triggers"] = {
			},
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text1"] = "%c",
			["zoom"] = 0,
			["stacksContainment"] = "OUTSIDE",
			["text2"] = "躲开",
			["auto"] = true,
			["desaturate"] = false,
			["id"] = "灵魂痛楚",
			["xOffset"] = 0,
			["text2Enabled"] = true,
			["width"] = 100,
			["selfPoint"] = "CENTER",
			["text1Enabled"] = true,
			["numTriggers"] = 1,
			["icon"] = true,
			["displayIcon"] = 464119,
			["stacksPoint"] = "BOTTOM",
			["glow"] = false,
		},
		["吞噬巨口"] = {
			["glow"] = false,
			["text1FontSize"] = 32,
			["cooldownTextEnabled"] = true,
			["customText"] = "function()\n    for i=1, 40, 1 do\n        local i_spellID = select(11, UnitDebuff(aura_env.unitID,i))\n        if i_spellID and i_spellID==aura_env.spellID then\n            local tooltipSize = select(3, WeakAuras.GetAuraTooltipInfo(aura_env.unitID, i, aura_env.filter))\n            return aura_env.shortenNumber(tooltipSize) or aura_env.alternativeText\n        end\n    end    \n    return aura_env.alternativeText\nend",
			["untrigger"] = {
			},
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = 0,
			["customTextUpdate"] = "event",
			["actions"] = {
				["start"] = {
					["do_glow"] = false,
					["do_sound"] = false,
					["do_message"] = false,
					["glow_frame"] = "WeakAuras:Artillery",
					["message_type"] = "SAY",
					["glow_action"] = "show",
					["sound"] = "Interface\\AddOns\\Prat-3.0\\Sounds\\Link.ogg",
					["message"] = "",
				},
				["finish"] = {
				},
				["init"] = {
					["do_custom"] = true,
					["custom"] = "aura_env.spellID = 234621 -- Change to whatever debuff you want to keep track\naura_env.unitID = \"player\"\naura_env.filter = \"harmful\"\naura_env.alternativeText = \"DOT\"\n\naura_env.shortenNumber = function(number)\n    if type(number) ~= \"number\" then\n        number = tonumber(number)\n    end\n    if not number then\n        return\n    end\n    \n    local affixes = {\n        \"\",\n        \"K\",\n        \"M\",\n        \"B\",\n    }\n    \n    local affix = 1\n    local dec = 0\n    local num1 = math.abs(number)\n    while num1 >= 1000 and affix < #affixes do\n        num1 = num1 / 1000\n        affix = affix + 1\n    end\n    if affix > 1 then\n        dec = 2\n        local num2 = num1\n        while num2 >= 10 do\n            num2 = num2 / 10\n            dec = dec - 1\n        end\n    end\n    if number < 0 then\n        num1 = -num1\n    end\n    \n    return string.format(\"%.\"..dec..\"f\"..affixes[affix], num1)\nend",
				},
			},
			["fontFlags"] = "THICKOUTLINE",
			["useTooltip"] = false,
			["animation"] = {
				["start"] = {
					["preset"] = "spiral",
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
			},
			["trigger"] = {
				["fullscan"] = true,
				["type"] = "aura",
				["spellId"] = "234621",
				["unevent"] = "timed",
				["names"] = {
					"灵魂之刃", -- [1]
				},
				["duration"] = "2",
				["event"] = "Combat Log",
				["use_unit"] = true,
				["unit"] = "player",
				["use_spellId"] = true,
				["spellIds"] = {
					200084, -- [1]
				},
				["subeventSuffix"] = "_CAST_START",
				["custom_hide"] = "timed",
				["name"] = "吞噬巨口",
				["subeventPrefix"] = "SPELL",
				["debuffType"] = "HARMFUL",
			},
			["parent"] = "萨格拉斯之墓 - 04#主母萨丝琳",
			["text1Containment"] = "OUTSIDE",
			["yOffset"] = 0,
			["text1Point"] = "BOTTOM",
			["stacksPoint"] = "BOTTOM",
			["text2FontFlags"] = "THICKOUTLINE",
			["height"] = 100,
			["conditions"] = {
			},
			["load"] = {
				["use_never"] = false,
				["zone"] = "Hellfire Citadel",
				["encounterid"] = "2037",
				["use_encounterid"] = true,
				["race"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["single"] = "party",
					["multi"] = {
						["party"] = true,
					},
				},
				["talent2"] = {
					["multi"] = {
					},
				},
				["zoneId"] = "1147",
				["talent"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["use_zone"] = false,
				["faction"] = {
					["multi"] = {
					},
				},
				["use_level"] = false,
				["use_zoneId"] = true,
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["role"] = {
					["single"] = "TANK",
					["multi"] = {
						["TANK"] = true,
					},
				},
			},
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["inverse"] = false,
			["fontSize"] = 15,
			["text2Containment"] = "OUTSIDE",
			["stickyDuration"] = false,
			["text1Color"] = {
				0, -- [1]
				0.701960784313726, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text2Font"] = "Friz Quadrata TT",
			["anchorFrameType"] = "SCREEN",
			["text1FontFlags"] = "THICKOUTLINE",
			["regionType"] = "icon",
			["frameStrata"] = 1,
			["selfPoint"] = "CENTER",
			["text2FontSize"] = 22,
			["id"] = "吞噬巨口",
			["text1Font"] = "Friz Quadrata TT",
			["text1"] = "%c",
			["zoom"] = 0,
			["stacksContainment"] = "OUTSIDE",
			["text2"] = "%p",
			["auto"] = true,
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["additional_triggers"] = {
			},
			["xOffset"] = 0,
			["text2Enabled"] = false,
			["width"] = 100,
			["desaturate"] = false,
			["text1Enabled"] = true,
			["numTriggers"] = 1,
			["icon"] = true,
			["displayIcon"] = "132107",
			["cooldown"] = true,
			["text2Point"] = "BOTTOM",
		},
		["痛苦负担"] = {
			["text2Point"] = "BOTTOM",
			["text1FontSize"] = 32,
			["cooldownTextEnabled"] = true,
			["customText"] = "function()\n    for i=1, 40, 1 do\n        local i_spellID = select(11, UnitDebuff(aura_env.unitID,i))\n        if i_spellID and i_spellID==aura_env.spellID then\n            local tooltipSize = select(3, WeakAuras.GetAuraTooltipInfo(aura_env.unitID, i, aura_env.filter))\n            return aura_env.shortenNumber(tooltipSize) or aura_env.alternativeText\n        end\n    end    \n    return aura_env.alternativeText\nend",
			["untrigger"] = {
			},
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = 0,
			["customTextUpdate"] = "event",
			["actions"] = {
				["start"] = {
					["do_glow"] = false,
					["glow_frame"] = "WeakAuras:Artillery",
					["do_message"] = false,
					["do_sound"] = false,
					["message_type"] = "SAY",
					["glow_action"] = "show",
					["sound"] = "Interface\\AddOns\\Prat-3.0\\Sounds\\Link.ogg",
					["message"] = "",
				},
				["finish"] = {
				},
				["init"] = {
					["do_custom"] = true,
					["custom"] = "aura_env.spellID = 230201 -- Change to whatever debuff you want to keep track\naura_env.unitID = \"player\"\naura_env.filter = \"harmful\"\naura_env.alternativeText = \"DOT\"\n\naura_env.shortenNumber = function(number)\n    if type(number) ~= \"number\" then\n        number = tonumber(number)\n    end\n    if not number then\n        return\n    end\n    \n    local affixes = {\n        \"\",\n        \"K\",\n        \"M\",\n        \"B\",\n    }\n    \n    local affix = 1\n    local dec = 0\n    local num1 = math.abs(number)\n    while num1 >= 1000 and affix < #affixes do\n        num1 = num1 / 1000\n        affix = affix + 1\n    end\n    if affix > 1 then\n        dec = 2\n        local num2 = num1\n        while num2 >= 10 do\n            num2 = num2 / 10\n            dec = dec - 1\n        end\n    end\n    if number < 0 then\n        num1 = -num1\n    end\n    \n    return string.format(\"%.\"..dec..\"f\"..affixes[affix], num1)\nend",
				},
			},
			["fontFlags"] = "THICKOUTLINE",
			["useTooltip"] = false,
			["animation"] = {
				["start"] = {
					["preset"] = "spiral",
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
			},
			["trigger"] = {
				["fullscan"] = true,
				["type"] = "aura",
				["spellId"] = "230201",
				["unevent"] = "timed",
				["names"] = {
					"灵魂之刃", -- [1]
				},
				["duration"] = "2",
				["event"] = "Combat Log",
				["use_unit"] = true,
				["unit"] = "player",
				["use_spellId"] = true,
				["name"] = "痛苦负担",
				["subeventSuffix"] = "_CAST_START",
				["custom_hide"] = "timed",
				["spellIds"] = {
					200084, -- [1]
				},
				["subeventPrefix"] = "SPELL",
				["debuffType"] = "HARMFUL",
			},
			["parent"] = "萨格拉斯之墓 - 04#主母萨丝琳",
			["text1Containment"] = "OUTSIDE",
			["yOffset"] = 0,
			["text1Point"] = "TOP",
			["stacksPoint"] = "BOTTOM",
			["text2FontFlags"] = "THICKOUTLINE",
			["height"] = 100,
			["conditions"] = {
			},
			["load"] = {
				["use_never"] = false,
				["zone"] = "Hellfire Citadel",
				["encounterid"] = "2037",
				["use_encounterid"] = true,
				["role"] = {
					["single"] = "TANK",
					["multi"] = {
						["TANK"] = true,
					},
				},
				["size"] = {
					["single"] = "party",
					["multi"] = {
						["party"] = true,
					},
				},
				["talent2"] = {
					["multi"] = {
					},
				},
				["use_level"] = false,
				["talent"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["use_zone"] = false,
				["faction"] = {
					["multi"] = {
					},
				},
				["zoneId"] = "1147",
				["race"] = {
					["multi"] = {
					},
				},
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["use_zoneId"] = true,
			},
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["inverse"] = false,
			["fontSize"] = 15,
			["text2Containment"] = "OUTSIDE",
			["stickyDuration"] = false,
			["text1Color"] = {
				0, -- [1]
				0.701960784313726, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text2Font"] = "Friz Quadrata TT",
			["anchorFrameType"] = "SCREEN",
			["text1FontFlags"] = "THICKOUTLINE",
			["regionType"] = "icon",
			["frameStrata"] = 1,
			["text1Font"] = "Friz Quadrata TT",
			["text2FontSize"] = 20,
			["id"] = "痛苦负担",
			["selfPoint"] = "CENTER",
			["text1"] = "%c",
			["zoom"] = 0,
			["stacksContainment"] = "OUTSIDE",
			["text2"] = "换坦嘲讽",
			["auto"] = true,
			["text1Enabled"] = true,
			["additional_triggers"] = {
			},
			["xOffset"] = 0,
			["text2Enabled"] = true,
			["width"] = 100,
			["text2Color"] = {
				1, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["icon"] = true,
			["numTriggers"] = 1,
			["glow"] = false,
			["displayIcon"] = "132107",
			["cooldown"] = true,
			["desaturate"] = true,
		},
		["萨格拉斯之墓 - 09#基尔加丹"] = {
			["grow"] = "RIGHT",
			["controlledChildren"] = {
				"虚空强风", -- [1]
				"欺诈者的遮蔽", -- [2]
				"伊利丹的无目凝视", -- [3]
				"邪爪 - debuff", -- [4]
				"波涛起伏", -- [5]
				"爆发", -- [6]
				"绝望 - 施法", -- [7]
				"绝望 - debuff", -- [8]
				"暗影映像", -- [9]
				"末日冲击", -- [10]
				"窒息之影", -- [11]
				"末日之雹", -- [12]
				"末日之雨", -- [13]
				"萦绕的哀嚎", -- [14]
				"燃烧 2", -- [15]
				"千魂之暗 - debuff", -- [16]
				"灵魂痛楚", -- [17]
				"千魂之暗 - 施法", -- [18]
				"Tear Rift cast", -- [19]
				"引力榨取", -- [20]
				"聚焦恐惧烈焰 - 玩家", -- [21]
				"聚焦恐惧烈焰 - 群组", -- [22]
				"萦绕的爆发", -- [23]
				"爆裂恐惧烈焰", -- [24]
				"断裂奇点", -- [25]
				"邪爪 - buff", -- [26]
			},
			["xOffset"] = -841.777755737305,
			["yOffset"] = 388.236877441406,
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = 0,
			["space"] = 2,
			["background"] = "None",
			["actions"] = {
				["start"] = {
				},
				["init"] = {
				},
				["finish"] = {
				},
			},
			["backgroundInset"] = 0,
			["selfPoint"] = "LEFT",
			["trigger"] = {
				["subeventPrefix"] = "SPELL",
				["type"] = "aura",
				["spellIds"] = {
				},
				["subeventSuffix"] = "_CAST_START",
				["debuffType"] = "HELPFUL",
				["names"] = {
				},
				["event"] = "Health",
				["unit"] = "player",
			},
			["desc"] = "Author: (EU)Warpaladin-Aegwynn; Created: 19.05.2017; Last Update: 27.06.2017; Iteration: 6",
			["stagger"] = 0,
			["height"] = 99.9998779296875,
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
					["multi"] = {
					},
				},
				["use_class"] = false,
				["role"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
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
				["spec"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["animate"] = false,
			["border"] = "None",
			["regionType"] = "dynamicgroup",
			["sort"] = "none",
			["expanded"] = false,
			["constantFactor"] = "RADIUS",
			["borderOffset"] = 16,
			["id"] = "萨格拉斯之墓 - 09#基尔加丹",
			["radius"] = 200,
			["frameStrata"] = 1,
			["width"] = 2650.00007629395,
			["untrigger"] = {
			},
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
			},
			["numTriggers"] = 1,
			["align"] = "CENTER",
			["rotation"] = 0,
			["conditions"] = {
			},
			["anchorFrameType"] = "SCREEN",
			["additional_triggers"] = {
			},
		},
		["Charm of the Rising Tide"] = {
			["glow"] = false,
			["text1FontSize"] = 15,
			["cooldownTextEnabled"] = true,
			["untrigger"] = {
			},
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = 0,
			["customTextUpdate"] = "update",
			["icon"] = true,
			["text1Enabled"] = true,
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["preset"] = "grow",
					["type"] = "preset",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["preset"] = "pulse",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["preset"] = "fade",
					["type"] = "none",
				},
			},
			["trigger"] = {
				["type"] = "aura",
				["spellId"] = "242458",
				["subeventSuffix"] = "_CAST_START",
				["event"] = "Health",
				["names"] = {
					"涨潮", -- [1]
				},
				["fullscan"] = true,
				["use_spellId"] = true,
				["spellIds"] = {
					242458, -- [1]
				},
				["name"] = "涨潮",
				["custom_hide"] = "timed",
				["unit"] = "player",
				["subeventPrefix"] = "SPELL",
				["debuffType"] = "HELPFUL",
			},
			["desaturate"] = false,
			["text1Point"] = "BOTTOMRIGHT",
			["text2FontFlags"] = "OUTLINE",
			["height"] = 40,
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
				["spec"] = {
					["single"] = 2,
					["multi"] = {
						[2] = true,
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
				["class"] = {
					["single"] = "MAGE",
					["multi"] = {
						["MAGE"] = true,
					},
				},
				["faction"] = {
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
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["selfPoint"] = "CENTER",
			["parent"] = "Buffs",
			["text2Containment"] = "INSIDE",
			["displayIcon"] = "Interface\\Icons\\Spell_Frost_ColdHearted",
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
			["text2Font"] = "Friz Quadrata TT",
			["text1Font"] = "Friz Quadrata TT",
			["text2FontSize"] = 24,
			["anchorFrameType"] = "SCREEN",
			["text2Enabled"] = false,
			["text1"] = "%s",
			["text2"] = "%p",
			["additional_triggers"] = {
			},
			["zoom"] = 0.18,
			["auto"] = true,
			["text1FontFlags"] = "OUTLINE",
			["id"] = "Charm of the Rising Tide",
			["xOffset"] = 0,
			["frameStrata"] = 1,
			["width"] = 40,
			["stickyDuration"] = false,
			["text2Point"] = "CENTER",
			["inverse"] = false,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["cooldown"] = true,
			["yOffset"] = 0,
		},
		["断裂奇点"] = {
			["outline"] = "OUTLINE",
			["text2Point"] = "BOTTOM",
			["text1FontSize"] = 24,
			["xOffset"] = -125.999267578125,
			["displayText"] = " ",
			["customText"] = "\n\n",
			["yOffset"] = 170.000244140625,
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = -10,
			["customTextUpdate"] = "update",
			["actions"] = {
				["start"] = {
					["message"] = "",
					["do_sound"] = false,
					["message_type"] = "SAY",
					["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\WaterDrop.ogg",
					["do_message"] = false,
				},
				["init"] = {
					["do_custom"] = false,
					["custom"] = "\n\n",
				},
				["finish"] = {
					["do_custom"] = false,
					["custom"] = "\n\n",
				},
			},
			["text1Enabled"] = true,
			["selfPoint"] = "BOTTOM",
			["trigger"] = {
				["duration"] = "10",
				["message_operator"] = "match('%s')",
				["unit"] = "player",
				["custom_hide"] = "timed",
				["type"] = "custom",
				["subeventPrefix"] = "SPELL",
				["unevent"] = "custom",
				["names"] = {
				},
				["debuffType"] = "HELPFUL",
				["event"] = "Chat Message",
				["custom_type"] = "event",
				["message"] = "long sleeves",
				["spellIds"] = {
				},
				["events"] = "CHAT_MSG_RAID_BOSS_EMOTE",
				["custom"] = "function(channel, message, language, channelString, target, flags, unknown, channelNumber, channelName, unknown, counter)\n    if message and message:find(\"spell:235059\") then\n        return true\n    end\nend",
				["use_message"] = true,
				["subeventSuffix"] = "_CAST_START",
				["use_messageType"] = true,
				["messageType"] = "CHAT_MSG_PARTY",
			},
			["text1Containment"] = "OUTSIDE",
			["text1Point"] = "TOP",
			["parent"] = "萨格拉斯之墓 - 09#基尔加丹",
			["text2FontFlags"] = "THICKOUTLINE",
			["height"] = 100,
			["untrigger"] = {
				["message"] = "Reset",
				["custom"] = "\n\n",
				["use_message"] = true,
				["use_messageType"] = true,
				["message_operator"] = "==",
				["messageType"] = "CHAT_MSG_PARTY",
			},
			["load"] = {
				["use_never"] = false,
				["zone"] = "Court of Stars",
				["encounterid"] = "2051",
				["use_encounterid"] = true,
				["use_zoneId"] = true,
				["size"] = {
					["multi"] = {
					},
				},
				["talent2"] = {
					["multi"] = {
					},
				},
				["zoneId"] = "1147",
				["talent"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["use_level"] = false,
				["faction"] = {
					["multi"] = {
					},
				},
				["role"] = {
					["multi"] = {
					},
				},
				["use_zone"] = false,
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
			},
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
			},
			["conditions"] = {
			},
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text2Containment"] = "OUTSIDE",
			["inverse"] = false,
			["text1Color"] = {
				1, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["stickyDuration"] = false,
			["text2Font"] = "Friz Quadrata TT",
			["text1FontFlags"] = "THICKOUTLINE",
			["regionType"] = "icon",
			["anchorFrameType"] = "SCREEN",
			["frameStrata"] = 1,
			["text2FontSize"] = 22,
			["text1Font"] = "Friz Quadrata TT",
			["id"] = "断裂奇点",
			["text1"] = "分担",
			["text2"] = "宝珠",
			["auto"] = true,
			["zoom"] = 0,
			["justify"] = "LEFT",
			["desaturate"] = false,
			["additional_triggers"] = {
			},
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text2Enabled"] = true,
			["width"] = 100,
			["icon"] = true,
			["cooldownTextEnabled"] = true,
			["numTriggers"] = 1,
			["glow"] = false,
			["displayIcon"] = "1041232",
			["cooldown"] = true,
			["disjunctive"] = "all",
		},
		["Fire: Combustion Buff"] = {
			["glow"] = false,
			["text1FontSize"] = 6,
			["cooldownTextEnabled"] = true,
			["untrigger"] = {
			},
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = 0,
			["customTextUpdate"] = "update",
			["icon"] = true,
			["text1Enabled"] = true,
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["type"] = "preset",
					["preset"] = "grow",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["preset"] = "pulse",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["preset"] = "fade",
					["type"] = "none",
				},
			},
			["trigger"] = {
				["type"] = "aura",
				["spellId"] = "190319",
				["subeventSuffix"] = "_CAST_START",
				["event"] = "Health",
				["names"] = {
					"燃烧", -- [1]
				},
				["custom_hide"] = "timed",
				["use_spellId"] = true,
				["name"] = "燃烧",
				["spellIds"] = {
					190319, -- [1]
				},
				["fullscan"] = true,
				["unit"] = "player",
				["subeventPrefix"] = "SPELL",
				["debuffType"] = "HELPFUL",
			},
			["desaturate"] = false,
			["text1Point"] = "CENTER",
			["text2FontFlags"] = "OUTLINE",
			["height"] = 40,
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
				["class"] = {
					["single"] = "MAGE",
					["multi"] = {
						["MAGE"] = true,
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
				["spec"] = {
					["single"] = 2,
					["multi"] = {
					},
				},
				["pvptalent"] = {
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
			["parent"] = "Buffs",
			["displayIcon"] = "Interface\\Icons\\Spell_Frost_ColdHearted",
			["text2Containment"] = "INSIDE",
			["yOffset"] = 0,
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
			["text2Font"] = "Friz Quadrata TT",
			["text1Font"] = "Friz Quadrata TT",
			["text2FontSize"] = 24,
			["anchorFrameType"] = "SCREEN",
			["text2Enabled"] = false,
			["text1"] = "%c",
			["text2"] = "%p",
			["id"] = "Fire: Combustion Buff",
			["zoom"] = 0.18,
			["auto"] = true,
			["text1FontFlags"] = "OUTLINE",
			["additional_triggers"] = {
			},
			["xOffset"] = 0,
			["frameStrata"] = 1,
			["width"] = 40,
			["stickyDuration"] = false,
			["text2Point"] = "CENTER",
			["inverse"] = false,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["cooldown"] = true,
			["selfPoint"] = "CENTER",
		},
		["绝望 - debuff"] = {
			["text2Point"] = "TOP",
			["text1FontSize"] = 22,
			["cooldownTextEnabled"] = true,
			["customText"] = "function()\n    return \"法力消耗\"\nend\n\n\n\n\n\n",
			["untrigger"] = {
			},
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = 0,
			["customTextUpdate"] = "update",
			["actions"] = {
				["start"] = {
					["do_glow"] = false,
					["message"] = "",
					["sound"] = "Interface\\AddOns\\Prat-3.0\\Sounds\\Link.ogg",
					["glow_frame"] = "WeakAuras:Artillery",
					["message_type"] = "SAY",
					["glow_action"] = "show",
					["do_message"] = false,
					["do_sound"] = false,
				},
				["finish"] = {
				},
				["init"] = {
					["do_custom"] = false,
					["custom"] = "\n\n",
				},
			},
			["fontFlags"] = "THICKOUTLINE",
			["useTooltip"] = false,
			["animation"] = {
				["start"] = {
					["preset"] = "spiral",
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
			},
			["trigger"] = {
				["spellId"] = "237725",
				["duration"] = "2",
				["use_unit"] = true,
				["subcount"] = true,
				["specificUnit"] = "boss1",
				["debuffType"] = "HARMFUL",
				["type"] = "aura",
				["unevent"] = "timed",
				["subeventPrefix"] = "SPELL",
				["event"] = "Combat Log",
				["subeventSuffix"] = "_CAST_START",
				["unit"] = "player",
				["use_spellId"] = true,
				["name"] = "绝望",
				["spellIds"] = {
					237725, -- [1]
				},
				["use_specific_unit"] = false,
				["names"] = {
					"绝望", -- [1]
				},
				["custom_hide"] = "timed",
				["fullscan"] = true,
			},
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["parent"] = "萨格拉斯之墓 - 09#基尔加丹",
			["text1Containment"] = "OUTSIDE",
			["cooldown"] = true,
			["text1Point"] = "BOTTOM",
			["conditions"] = {
			},
			["text2FontFlags"] = "THICKOUTLINE",
			["height"] = 100,
			["stickyDuration"] = false,
			["load"] = {
				["use_never"] = false,
				["zone"] = "Hellfire Citadel",
				["encounterid"] = "2051",
				["use_encounterid"] = true,
				["race"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["single"] = "party",
					["multi"] = {
						["party"] = true,
					},
				},
				["talent2"] = {
					["multi"] = {
					},
				},
				["zoneId"] = "1147",
				["talent"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["use_level"] = false,
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["use_zone"] = false,
				["faction"] = {
					["multi"] = {
					},
				},
				["use_zoneId"] = true,
				["role"] = {
					["single"] = "TANK",
					["multi"] = {
						["TANK"] = true,
					},
				},
			},
			["inverse"] = false,
			["text2Font"] = "Friz Quadrata TT",
			["fontSize"] = 15,
			["text2Containment"] = "OUTSIDE",
			["desaturate"] = false,
			["text1Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["anchorFrameType"] = "SCREEN",
			["frameStrata"] = 1,
			["text1FontFlags"] = "THICKOUTLINE",
			["regionType"] = "icon",
			["xOffset"] = 0,
			["additional_triggers"] = {
			},
			["text2FontSize"] = 22,
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["init_completed"] = 1,
			["text1"] = "+%s%",
			["zoom"] = 0,
			["stacksContainment"] = "OUTSIDE",
			["text2"] = "%c",
			["auto"] = true,
			["selfPoint"] = "CENTER",
			["id"] = "绝望 - debuff",
			["text1Font"] = "Friz Quadrata TT",
			["text2Enabled"] = true,
			["width"] = 100,
			["text1Enabled"] = true,
			["icon"] = true,
			["numTriggers"] = 1,
			["glow"] = false,
			["displayIcon"] = 464119,
			["stacksPoint"] = "BOTTOM",
			["yOffset"] = 0,
		},
		["饰品1就绪"] = {
			["glow"] = true,
			["text1FontSize"] = 12,
			["cooldownTextEnabled"] = true,
			["untrigger"] = {
				["showOn"] = "showOnReady",
				["itemSlot"] = 13,
			},
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = -10,
			["customTextUpdate"] = "update",
			["icon"] = true,
			["text1Enabled"] = false,
			["animation"] = {
				["start"] = {
					["preset"] = "grow",
					["duration_type"] = "seconds",
					["type"] = "preset",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
			},
			["trigger"] = {
				["debuffType"] = "HELPFUL",
				["type"] = "status",
				["use_unit"] = true,
				["subeventSuffix"] = "_CAST_START",
				["use_showOn"] = true,
				["unit"] = "player",
				["event"] = "Cooldown Progress (Equipment Slot)",
				["subeventPrefix"] = "SPELL",
				["use_itemSlot"] = true,
				["itemSlot"] = 13,
				["spellIds"] = {
				},
				["use_testForCooldown"] = true,
				["showOn"] = "showOnReady",
				["names"] = {
				},
				["unevent"] = "auto",
				["custom_hide"] = "timed",
			},
			["desaturate"] = false,
			["text1Point"] = "BOTTOMRIGHT",
			["text2FontFlags"] = "OUTLINE",
			["height"] = 50,
			["load"] = {
				["talent2"] = {
					["multi"] = {
					},
				},
				["use_never"] = true,
				["talent"] = {
					["multi"] = {
					},
				},
				["class"] = {
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
				["spec"] = {
					["multi"] = {
					},
				},
				["use_combat"] = true,
				["role"] = {
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
				["init"] = {
				},
				["finish"] = {
				},
			},
			["selfPoint"] = "CENTER",
			["text2Containment"] = "INSIDE",
			["parent"] = "饰品冷却",
			["text1Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["yOffset"] = 0,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["regionType"] = "icon",
			["inverse"] = false,
			["text2Point"] = "CENTER",
			["text2FontSize"] = 24,
			["stickyDuration"] = false,
			["width"] = 50,
			["text1"] = "%P",
			["frameStrata"] = 1,
			["text1Font"] = "Friz Quadrata TT",
			["text2"] = "%p",
			["auto"] = true,
			["id"] = "饰品1就绪",
			["additional_triggers"] = {
			},
			["zoom"] = 0.2,
			["text2Enabled"] = false,
			["anchorFrameType"] = "SCREEN",
			["text1FontFlags"] = "OUTLINE",
			["text2Font"] = "Friz Quadrata TT",
			["numTriggers"] = 1,
			["xOffset"] = 0,
			["conditions"] = {
			},
			["text1Containment"] = "INSIDE",
			["disjunctive"] = "all",
		},
		["雷霆震击"] = {
			["text2Point"] = "TOP",
			["text1FontSize"] = 20,
			["cooldownTextEnabled"] = true,
			["customText"] = "\n\n",
			["untrigger"] = {
			},
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = 0,
			["customTextUpdate"] = "event",
			["actions"] = {
				["start"] = {
					["do_glow"] = false,
					["message"] = "",
					["sound"] = "Interface\\AddOns\\Prat-3.0\\Sounds\\Link.ogg",
					["glow_frame"] = "WeakAuras:Artillery",
					["message_type"] = "SAY",
					["glow_action"] = "show",
					["do_message"] = false,
					["do_sound"] = false,
				},
				["finish"] = {
				},
				["init"] = {
					["do_custom"] = false,
					["custom"] = "\n\n",
				},
			},
			["fontFlags"] = "THICKOUTLINE",
			["useTooltip"] = false,
			["animation"] = {
				["start"] = {
					["preset"] = "spiral",
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
			},
			["trigger"] = {
				["debuffType"] = "HARMFUL",
				["type"] = "aura",
				["spellId"] = "230139",
				["unevent"] = "timed",
				["use_unit"] = true,
				["duration"] = "2",
				["event"] = "Combat Log",
				["names"] = {
					"雷霆震击", -- [1]
				},
				["unit"] = "player",
				["subcount"] = true,
				["name"] = "多头蛇射击",
				["subeventSuffix"] = "_CAST_START",
				["use_spellId"] = true,
				["spellIds"] = {
					230362, -- [1]
				},
				["subeventPrefix"] = "SPELL",
				["custom_hide"] = "timed",
			},
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text1Containment"] = "OUTSIDE",
			["desaturate"] = true,
			["text1Point"] = "BOTTOM",
			["cooldown"] = true,
			["text2FontFlags"] = "THICKOUTLINE",
			["height"] = 100,
			["conditions"] = {
			},
			["load"] = {
				["use_never"] = false,
				["zone"] = "Hellfire Citadel",
				["encounterid"] = "2037",
				["use_encounterid"] = true,
				["role"] = {
					["single"] = "TANK",
					["multi"] = {
						["TANK"] = true,
					},
				},
				["size"] = {
					["single"] = "party",
					["multi"] = {
						["party"] = true,
					},
				},
				["talent2"] = {
					["multi"] = {
					},
				},
				["zoneId"] = "1147",
				["talent"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["use_level"] = false,
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["use_zone"] = false,
				["faction"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["use_zoneId"] = true,
			},
			["stickyDuration"] = false,
			["inverse"] = false,
			["fontSize"] = 15,
			["text2Containment"] = "OUTSIDE",
			["text2Font"] = "Friz Quadrata TT",
			["text1Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text1Enabled"] = true,
			["anchorFrameType"] = "SCREEN",
			["text1FontFlags"] = "THICKOUTLINE",
			["regionType"] = "icon",
			["frameStrata"] = 1,
			["xOffset"] = 0,
			["text2FontSize"] = 20,
			["id"] = "雷霆震击",
			["text1Font"] = "Friz Quadrata TT",
			["text1"] = "昏迷",
			["zoom"] = 0,
			["stacksContainment"] = "OUTSIDE",
			["text2"] = "%p",
			["auto"] = true,
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["additional_triggers"] = {
			},
			["selfPoint"] = "CENTER",
			["text2Enabled"] = false,
			["width"] = 100,
			["icon"] = true,
			["glow"] = false,
			["numTriggers"] = 1,
			["yOffset"] = 0,
			["displayIcon"] = 464119,
			["stacksPoint"] = "BOTTOM",
			["parent"] = "萨格拉斯之墓 - 04#主母萨丝琳",
		},
		["欺诈者的遮蔽"] = {
			["text2Point"] = "TOP",
			["text1FontSize"] = 20,
			["cooldownTextEnabled"] = true,
			["customText"] = "function()\n    return \"靠近伊利丹\"\nend\n\n\n\n\n\n",
			["untrigger"] = {
			},
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = 0,
			["customTextUpdate"] = "update",
			["actions"] = {
				["start"] = {
					["do_glow"] = false,
					["message"] = "",
					["sound"] = "Interface\\AddOns\\Prat-3.0\\Sounds\\Link.ogg",
					["do_sound"] = false,
					["message_type"] = "SAY",
					["glow_action"] = "show",
					["do_message"] = false,
					["glow_frame"] = "WeakAuras:Artillery",
				},
				["finish"] = {
				},
				["init"] = {
					["do_custom"] = false,
					["custom"] = "\n\n",
				},
			},
			["fontFlags"] = "THICKOUTLINE",
			["useTooltip"] = false,
			["animation"] = {
				["start"] = {
					["preset"] = "spiral",
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
			},
			["trigger"] = {
				["spellId"] = "239932",
				["duration"] = "2",
				["use_specific_unit"] = false,
				["specificUnit"] = "boss1",
				["debuffType"] = "HARMFUL",
				["type"] = "aura",
				["unevent"] = "timed",
				["event"] = "Combat Log",
				["subeventPrefix"] = "SPELL",
				["subeventSuffix"] = "_CAST_START",
				["use_spellId"] = true,
				["name"] = "邪爪",
				["unit"] = "player",
				["use_unit"] = true,
				["names"] = {
					"欺诈者的遮蔽", -- [1]
				},
				["spellIds"] = {
					236555, -- [1]
				},
				["custom_hide"] = "timed",
			},
			["yOffset"] = 0,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text1Containment"] = "OUTSIDE",
			["cooldown"] = true,
			["text1Point"] = "BOTTOM",
			["conditions"] = {
			},
			["text2FontFlags"] = "THICKOUTLINE",
			["height"] = 100,
			["stickyDuration"] = false,
			["load"] = {
				["use_never"] = false,
				["zone"] = "Hellfire Citadel",
				["encounterid"] = "2051",
				["use_encounterid"] = true,
				["role"] = {
					["single"] = "TANK",
					["multi"] = {
						["TANK"] = true,
					},
				},
				["size"] = {
					["single"] = "party",
					["multi"] = {
						["party"] = true,
					},
				},
				["talent2"] = {
					["multi"] = {
					},
				},
				["zoneId"] = "1147",
				["talent"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["use_level"] = false,
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["use_zone"] = false,
				["faction"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["use_zoneId"] = true,
			},
			["inverse"] = false,
			["text2Font"] = "Friz Quadrata TT",
			["fontSize"] = 15,
			["text2Containment"] = "OUTSIDE",
			["desaturate"] = false,
			["text1Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["anchorFrameType"] = "SCREEN",
			["frameStrata"] = 1,
			["text1FontFlags"] = "THICKOUTLINE",
			["regionType"] = "icon",
			["xOffset"] = 0,
			["additional_triggers"] = {
			},
			["text2FontSize"] = 24,
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["init_completed"] = 1,
			["text1"] = "%c",
			["zoom"] = 0,
			["stacksContainment"] = "OUTSIDE",
			["text2"] = "遮蔽",
			["auto"] = true,
			["selfPoint"] = "CENTER",
			["id"] = "欺诈者的遮蔽",
			["text1Font"] = "Friz Quadrata TT",
			["text2Enabled"] = true,
			["width"] = 100,
			["text1Enabled"] = true,
			["icon"] = true,
			["numTriggers"] = 1,
			["glow"] = false,
			["displayIcon"] = 464119,
			["stacksPoint"] = "BOTTOM",
			["parent"] = "萨格拉斯之墓 - 09#基尔加丹",
		},
		["昏暗隐匿"] = {
			["text2Point"] = "BOTTOM",
			["text1FontSize"] = 22,
			["cooldownTextEnabled"] = true,
			["customText"] = "\n\n",
			["untrigger"] = {
			},
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = 0,
			["customTextUpdate"] = "event",
			["actions"] = {
				["start"] = {
					["do_glow"] = false,
					["message"] = "",
					["sound"] = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Sounds\\BITE.ogg",
					["do_sound"] = true,
					["message_type"] = "SAY",
					["glow_action"] = "show",
					["do_message"] = false,
					["glow_frame"] = "WeakAuras:Artillery",
				},
				["finish"] = {
				},
				["init"] = {
					["do_custom"] = false,
					["custom"] = "\n\n",
				},
			},
			["fontFlags"] = "THICKOUTLINE",
			["useTooltip"] = false,
			["animation"] = {
				["start"] = {
					["preset"] = "spiral",
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
			},
			["trigger"] = {
				["debuffType"] = "HARMFUL",
				["type"] = "aura",
				["spellId"] = "230959",
				["unevent"] = "timed",
				["names"] = {
					"灵魂之刃", -- [1]
				},
				["duration"] = "2",
				["event"] = "Combat Log",
				["use_unit"] = true,
				["unit"] = "player",
				["use_spellId"] = true,
				["name"] = "昏暗隐匿",
				["subeventSuffix"] = "_CAST_START",
				["custom_hide"] = "timed",
				["spellIds"] = {
					200084, -- [1]
				},
				["subeventPrefix"] = "SPELL",
				["fullscan"] = true,
			},
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["desaturate"] = true,
			["text1Containment"] = "OUTSIDE",
			["text1Point"] = "TOP",
			["cooldown"] = true,
			["text2FontFlags"] = "THICKOUTLINE",
			["height"] = 100,
			["conditions"] = {
			},
			["load"] = {
				["use_never"] = false,
				["zone"] = "Hellfire Citadel",
				["encounterid"] = "2037",
				["use_encounterid"] = true,
				["race"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["single"] = "party",
					["multi"] = {
						["party"] = true,
					},
				},
				["talent2"] = {
					["multi"] = {
					},
				},
				["zoneId"] = "1147",
				["talent"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["use_level"] = false,
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["use_zone"] = false,
				["faction"] = {
					["multi"] = {
					},
				},
				["use_zoneId"] = true,
				["role"] = {
					["single"] = "TANK",
					["multi"] = {
						["TANK"] = true,
					},
				},
			},
			["stickyDuration"] = false,
			["inverse"] = false,
			["fontSize"] = 15,
			["text2Containment"] = "OUTSIDE",
			["text2Font"] = "Friz Quadrata TT",
			["text1Color"] = {
				1, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["anchorFrameType"] = "SCREEN",
			["text1FontFlags"] = "THICKOUTLINE",
			["regionType"] = "icon",
			["frameStrata"] = 1,
			["xOffset"] = 0,
			["text2FontSize"] = 20,
			["id"] = "昏暗隐匿",
			["text1Font"] = "Friz Quadrata TT",
			["text1"] = "命中: -75%",
			["zoom"] = 0,
			["stacksContainment"] = "OUTSIDE",
			["text2"] = "跑开",
			["auto"] = true,
			["selfPoint"] = "CENTER",
			["additional_triggers"] = {
			},
			["text1Enabled"] = true,
			["text2Enabled"] = true,
			["width"] = 100,
			["icon"] = true,
			["glow"] = false,
			["numTriggers"] = 1,
			["yOffset"] = 0,
			["displayIcon"] = "132107",
			["stacksPoint"] = "BOTTOM",
			["parent"] = "萨格拉斯之墓 - 04#主母萨丝琳",
		},
		["聚焦恐惧烈焰 - 玩家"] = {
			["text2Point"] = "TOP",
			["text1FontSize"] = 22,
			["cooldownTextEnabled"] = true,
			["customText"] = "function()\n    return \"停止移动\"\nend\n\n\n\n\n\n\n\n",
			["untrigger"] = {
			},
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = 0,
			["customTextUpdate"] = "update",
			["actions"] = {
				["start"] = {
					["do_glow"] = false,
					["glow_frame"] = "WeakAuras:Artillery",
					["do_message"] = false,
					["do_sound"] = false,
					["message_type"] = "SAY",
					["glow_action"] = "show",
					["sound"] = "Interface\\AddOns\\Prat-3.0\\Sounds\\Link.ogg",
					["message"] = "",
				},
				["finish"] = {
				},
				["init"] = {
					["do_custom"] = false,
					["custom"] = "\n\n",
				},
			},
			["fontFlags"] = "THICKOUTLINE",
			["useTooltip"] = false,
			["animation"] = {
				["start"] = {
					["preset"] = "spiral",
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
			},
			["trigger"] = {
				["spellId"] = "239932",
				["duration"] = "2",
				["use_unit"] = true,
				["specificUnit"] = "boss1",
				["debuffType"] = "HARMFUL",
				["type"] = "aura",
				["unevent"] = "timed",
				["event"] = "Combat Log",
				["subeventPrefix"] = "SPELL",
				["subeventSuffix"] = "_CAST_START",
				["use_spellId"] = true,
				["spellIds"] = {
					238505, -- [1]
				},
				["unit"] = "player",
				["use_specific_unit"] = false,
				["names"] = {
					"聚焦恐惧烈焰", -- [1]
				},
				["name"] = "邪爪",
				["custom_hide"] = "timed",
			},
			["text1Containment"] = "OUTSIDE",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["desaturate"] = true,
			["stacksPoint"] = "BOTTOM",
			["text1Point"] = "BOTTOM",
			["conditions"] = {
			},
			["text2FontFlags"] = "THICKOUTLINE",
			["height"] = 100,
			["stickyDuration"] = false,
			["load"] = {
				["use_never"] = false,
				["zone"] = "Hellfire Citadel",
				["encounterid"] = "2051",
				["use_encounterid"] = true,
				["role"] = {
					["single"] = "TANK",
					["multi"] = {
						["TANK"] = true,
					},
				},
				["size"] = {
					["single"] = "party",
					["multi"] = {
						["party"] = true,
					},
				},
				["talent2"] = {
					["multi"] = {
					},
				},
				["zoneId"] = "1147",
				["talent"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["use_zone"] = false,
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["use_level"] = false,
				["race"] = {
					["multi"] = {
					},
				},
				["faction"] = {
					["multi"] = {
					},
				},
				["use_zoneId"] = true,
			},
			["inverse"] = false,
			["text2Font"] = "Friz Quadrata TT",
			["fontSize"] = 15,
			["text2Containment"] = "OUTSIDE",
			["icon"] = true,
			["text1Color"] = {
				1, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["anchorFrameType"] = "SCREEN",
			["frameStrata"] = 1,
			["text1FontFlags"] = "THICKOUTLINE",
			["regionType"] = "icon",
			["text1Font"] = "Friz Quadrata TT",
			["additional_triggers"] = {
			},
			["text2FontSize"] = 24,
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["init_completed"] = 1,
			["text1"] = "%c",
			["zoom"] = 0,
			["stacksContainment"] = "OUTSIDE",
			["text2"] = "BOSS",
			["auto"] = true,
			["selfPoint"] = "CENTER",
			["id"] = "聚焦恐惧烈焰 - 玩家",
			["xOffset"] = 0,
			["text2Enabled"] = false,
			["width"] = 100,
			["text1Enabled"] = true,
			["glow"] = false,
			["numTriggers"] = 1,
			["yOffset"] = 0,
			["displayIcon"] = 464119,
			["cooldown"] = true,
			["parent"] = "萨格拉斯之墓 - 09#基尔加丹",
		},
		["末日之雨"] = {
			["glow"] = false,
			["text1FontSize"] = 32,
			["cooldownTextEnabled"] = true,
			["customText"] = "function()\n    for i=1, 40, 1 do\n        local i_spellID = select(11, UnitDebuff(aura_env.unitID,i))\n        if i_spellID and i_spellID==aura_env.spellID then\n            local tooltipSize = select(3, WeakAuras.GetAuraTooltipInfo(aura_env.unitID, i, aura_env.filter))\n            return aura_env.shortenNumber(tooltipSize) or aura_env.alternativeText\n        end\n    end    \n    return aura_env.alternativeText\nend",
			["untrigger"] = {
			},
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = 0,
			["customTextUpdate"] = "event",
			["actions"] = {
				["start"] = {
					["do_glow"] = false,
					["glow_frame"] = "WeakAuras:Artillery",
					["do_message"] = false,
					["do_sound"] = false,
					["message_type"] = "SAY",
					["glow_action"] = "show",
					["sound"] = "Interface\\AddOns\\Prat-3.0\\Sounds\\Link.ogg",
					["message"] = "",
				},
				["finish"] = {
				},
				["init"] = {
					["do_custom"] = true,
					["custom"] = "aura_env.spellID = 234310 -- Change to whatever debuff you want to keep track\naura_env.unitID = \"player\"\naura_env.filter = \"harmful\"\naura_env.alternativeText = \"DOT\"\n\naura_env.shortenNumber = function(number)\n    if type(number) ~= \"number\" then\n        number = tonumber(number)\n    end\n    if not number then\n        return\n    end\n    \n    local affixes = {\n        \"\",\n        \"K\",\n        \"M\",\n        \"B\",\n    }\n    \n    local affix = 1\n    local dec = 0\n    local num1 = math.abs(number)\n    while num1 >= 1000 and affix < #affixes do\n        num1 = num1 / 1000\n        affix = affix + 1\n    end\n    if affix > 1 then\n        dec = 2\n        local num2 = num1\n        while num2 >= 10 do\n            num2 = num2 / 10\n            dec = dec - 1\n        end\n    end\n    if number < 0 then\n        num1 = -num1\n    end\n    \n    return string.format(\"%.\"..dec..\"f\"..affixes[affix], num1)\nend",
				},
			},
			["fontFlags"] = "THICKOUTLINE",
			["useTooltip"] = false,
			["animation"] = {
				["start"] = {
					["preset"] = "spiral",
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
			},
			["trigger"] = {
				["fullscan"] = true,
				["type"] = "aura",
				["spellId"] = "234310",
				["unevent"] = "timed",
				["subeventPrefix"] = "SPELL",
				["duration"] = "2",
				["event"] = "Combat Log",
				["use_unit"] = true,
				["unit"] = "player",
				["use_spellId"] = true,
				["name"] = "末日之雨",
				["subeventSuffix"] = "_CAST_START",
				["custom_hide"] = "timed",
				["spellIds"] = {
					200084, -- [1]
				},
				["names"] = {
					"灵魂之刃", -- [1]
				},
				["debuffType"] = "HARMFUL",
			},
			["parent"] = "萨格拉斯之墓 - 09#基尔加丹",
			["text1Containment"] = "OUTSIDE",
			["yOffset"] = 0,
			["text1Point"] = "BOTTOM",
			["stacksPoint"] = "BOTTOM",
			["text2FontFlags"] = "OUTLINE",
			["height"] = 100,
			["conditions"] = {
			},
			["load"] = {
				["use_never"] = false,
				["zone"] = "Hellfire Citadel",
				["encounterid"] = "2051",
				["use_encounterid"] = true,
				["role"] = {
					["single"] = "TANK",
					["multi"] = {
						["TANK"] = true,
					},
				},
				["size"] = {
					["single"] = "party",
					["multi"] = {
						["party"] = true,
					},
				},
				["talent2"] = {
					["multi"] = {
					},
				},
				["zoneId"] = "1147",
				["talent"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["use_zone"] = false,
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["use_level"] = false,
				["race"] = {
					["multi"] = {
					},
				},
				["faction"] = {
					["multi"] = {
					},
				},
				["use_zoneId"] = true,
			},
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["inverse"] = false,
			["fontSize"] = 15,
			["text2Containment"] = "OUTSIDE",
			["stickyDuration"] = false,
			["text1Color"] = {
				0, -- [1]
				0.701960784313726, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text2Font"] = "Friz Quadrata TT",
			["anchorFrameType"] = "SCREEN",
			["text1FontFlags"] = "THICKOUTLINE",
			["regionType"] = "icon",
			["frameStrata"] = 1,
			["selfPoint"] = "CENTER",
			["text2FontSize"] = 32,
			["additional_triggers"] = {
			},
			["xOffset"] = 0,
			["text1"] = "%c",
			["zoom"] = 0,
			["stacksContainment"] = "OUTSIDE",
			["text2"] = "%s",
			["auto"] = true,
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["id"] = "末日之雨",
			["text1Font"] = "Friz Quadrata TT",
			["text2Enabled"] = false,
			["width"] = 100,
			["desaturate"] = false,
			["text1Enabled"] = true,
			["numTriggers"] = 1,
			["icon"] = true,
			["displayIcon"] = 464119,
			["cooldown"] = true,
			["text2Point"] = "TOP",
		},
		["虚空强风"] = {
			["text2Point"] = "TOP",
			["text1FontSize"] = 22,
			["cooldownTextEnabled"] = true,
			["customText"] = "\n\n",
			["untrigger"] = {
			},
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = 0,
			["customTextUpdate"] = "event",
			["actions"] = {
				["start"] = {
					["do_glow"] = false,
					["message"] = "",
					["sound"] = "Interface\\AddOns\\Prat-3.0\\Sounds\\Link.ogg",
					["do_sound"] = false,
					["message_type"] = "SAY",
					["glow_action"] = "show",
					["do_message"] = false,
					["glow_frame"] = "WeakAuras:Artillery",
				},
				["finish"] = {
				},
				["init"] = {
					["do_custom"] = false,
					["custom"] = "\n\n",
				},
			},
			["fontFlags"] = "THICKOUTLINE",
			["useTooltip"] = false,
			["animation"] = {
				["start"] = {
					["preset"] = "spiral",
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
			},
			["trigger"] = {
				["spellId"] = "239932",
				["duration"] = "2",
				["use_unit"] = true,
				["specificUnit"] = "boss1",
				["custom_hide"] = "timed",
				["type"] = "aura",
				["subeventSuffix"] = "_CAST_START",
				["event"] = "Combat Log",
				["subeventPrefix"] = "SPELL",
				["debuffType"] = "HELPFUL",
				["use_spellId"] = true,
				["name"] = "邪爪",
				["unevent"] = "timed",
				["use_specific_unit"] = true,
				["names"] = {
					"虚空强风", -- [1]
				},
				["spellIds"] = {
					244834, -- [1]
				},
				["unit"] = "member",
			},
			["parent"] = "萨格拉斯之墓 - 09#基尔加丹",
			["text1Containment"] = "OUTSIDE",
			["yOffset"] = 0,
			["text1Point"] = "BOTTOM",
			["cooldown"] = true,
			["text2FontFlags"] = "THICKOUTLINE",
			["height"] = 100,
			["conditions"] = {
			},
			["load"] = {
				["use_never"] = false,
				["zone"] = "Hellfire Citadel",
				["encounterid"] = "2051",
				["use_encounterid"] = true,
				["role"] = {
					["single"] = "TANK",
					["multi"] = {
						["TANK"] = true,
					},
				},
				["size"] = {
					["single"] = "party",
					["multi"] = {
						["party"] = true,
					},
				},
				["talent2"] = {
					["multi"] = {
					},
				},
				["zoneId"] = "1147",
				["talent"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["use_level"] = false,
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["use_zone"] = false,
				["faction"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["use_zoneId"] = true,
			},
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["inverse"] = false,
			["fontSize"] = 15,
			["text2Containment"] = "OUTSIDE",
			["stickyDuration"] = false,
			["text1Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text2Font"] = "Friz Quadrata TT",
			["anchorFrameType"] = "SCREEN",
			["text1FontFlags"] = "THICKOUTLINE",
			["regionType"] = "icon",
			["frameStrata"] = 1,
			["text1Font"] = "Friz Quadrata TT",
			["text2FontSize"] = 24,
			["additional_triggers"] = {
			},
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text1"] = "免疫",
			["zoom"] = 0,
			["stacksContainment"] = "OUTSIDE",
			["text2"] = "BOSS",
			["auto"] = true,
			["desaturate"] = false,
			["id"] = "虚空强风",
			["xOffset"] = 0,
			["text2Enabled"] = true,
			["width"] = 100,
			["selfPoint"] = "CENTER",
			["text1Enabled"] = true,
			["numTriggers"] = 1,
			["icon"] = true,
			["displayIcon"] = 464119,
			["stacksPoint"] = "BOTTOM",
			["glow"] = false,
		},
		["绝望 - 施法"] = {
			["text2Point"] = "TOP",
			["text1FontSize"] = 20,
			["disjunctive"] = "custom",
			["customText"] = "\n\n",
			["untrigger"] = {
			},
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = 0,
			["customTextUpdate"] = "event",
			["actions"] = {
				["start"] = {
					["do_glow"] = false,
					["message"] = "",
					["sound"] = "Interface\\AddOns\\Prat-3.0\\Sounds\\Link.ogg",
					["glow_frame"] = "WeakAuras:Artillery",
					["message_type"] = "SAY",
					["glow_action"] = "show",
					["do_message"] = false,
					["do_sound"] = false,
				},
				["finish"] = {
				},
				["init"] = {
					["do_custom"] = false,
					["custom"] = "\n\n",
				},
			},
			["fontFlags"] = "THICKOUTLINE",
			["useTooltip"] = false,
			["parent"] = "萨格拉斯之墓 - 09#基尔加丹",
			["animation"] = {
				["start"] = {
					["preset"] = "spiral",
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
			},
			["trigger"] = {
				["spellId"] = "237725",
				["duration"] = "15",
				["names"] = {
					"暗影映像：绝望", -- [1]
				},
				["specificUnit"] = "boss1",
				["debuffType"] = "HARMFUL",
				["type"] = "event",
				["unevent"] = "timed",
				["event"] = "Combat Log",
				["subeventPrefix"] = "SPELL",
				["subeventSuffix"] = "_CAST_START",
				["use_spellId"] = true,
				["name"] = "绝望",
				["unit"] = "player",
				["use_specific_unit"] = false,
				["use_unit"] = true,
				["spellIds"] = {
					237590, -- [1]
				},
				["custom_hide"] = "timed",
			},
			["yOffset"] = 0,
			["cooldown"] = true,
			["text1Containment"] = "OUTSIDE",
			["conditions"] = {
			},
			["text1Point"] = "BOTTOM",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text2FontFlags"] = "THICKOUTLINE",
			["height"] = 100,
			["inverse"] = false,
			["load"] = {
				["use_never"] = false,
				["zone"] = "Hellfire Citadel",
				["encounterid"] = "2051",
				["use_encounterid"] = true,
				["race"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["single"] = "party",
					["multi"] = {
						["party"] = true,
					},
				},
				["talent2"] = {
					["multi"] = {
					},
				},
				["zoneId"] = "1147",
				["talent"] = {
					["multi"] = {
					},
				},
				["use_role"] = true,
				["spec"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["use_level"] = false,
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["use_zone"] = false,
				["faction"] = {
					["multi"] = {
					},
				},
				["use_zoneId"] = true,
				["role"] = {
					["single"] = "HEALER",
					["multi"] = {
						["TANK"] = true,
					},
				},
			},
			["stickyDuration"] = false,
			["text2Font"] = "Friz Quadrata TT",
			["fontSize"] = 15,
			["text2Containment"] = "OUTSIDE",
			["anchorFrameType"] = "SCREEN",
			["text1Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["frameStrata"] = 1,
			["customTriggerLogic"] = "function(trigger)\n    return trigger[1] and not trigger[2]\nend\n\n\n\n\n",
			["text1FontFlags"] = "THICKOUTLINE",
			["regionType"] = "icon",
			["text1Font"] = "Friz Quadrata TT",
			["additional_triggers"] = {
				{
					["trigger"] = {
						["type"] = "event",
						["spellId"] = "237725",
						["unevent"] = "timed",
						["duration"] = "15",
						["event"] = "Combat Log",
						["subeventPrefix"] = "SPELL",
						["use_spellId"] = true,
						["name"] = "绝望",
						["subeventSuffix"] = "_CAST_FAILED",
					},
					["untrigger"] = {
					},
				}, -- [1]
			},
			["text2FontSize"] = 24,
			["text1Enabled"] = true,
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text1"] = "治疗映像",
			["zoom"] = 0,
			["stacksContainment"] = "OUTSIDE",
			["text2"] = "BOSS",
			["auto"] = false,
			["desaturate"] = false,
			["id"] = "绝望 - 施法",
			["xOffset"] = 0,
			["text2Enabled"] = false,
			["width"] = 100,
			["selfPoint"] = "CENTER",
			["icon"] = true,
			["numTriggers"] = 2,
			["cooldownTextEnabled"] = true,
			["displayIcon"] = "458226",
			["stacksPoint"] = "BOTTOM",
			["glow"] = false,
		},
		["Bloodelf Silence"] = {
			["outline"] = true,
			["glow"] = false,
			["text1FontSize"] = 12,
			["disjunctive"] = "any",
			["displayText"] = "%c",
			["customText"] = "function()\n    if  WeakAuras.IsOptionsOpen() then\n        aura_env.check[1] = 0\n        aura_env.name = {}\n        aura_env.duration = {}\n        aura_env.duration2 = {}\n        aura_env.activecheck = {}\n        return \"NAME - READY\"\n    else\n        local coloredName = function(name)\n            local _, class = UnitClass(name)\n            return string.format(\"|c%s%s\", RAID_CLASS_COLORS[class].colorStr, name)\n        end\n        result = \"\"\n        if aura_env.check[1] ~= GetNumGroupMembers() then\n            aura_env.check[1] = 50\n            return \"updating...\"\n        end\n        \n        for i=1,table.getn(aura_env.name) do\n            local name,realm = UnitName(aura_env.name[i])\n            if aura_env.name[i] ~= nil then\n                if aura_env.activecheck[i] == 0 then\n                    color = \"FFFFFFFF\" -- white\n                    result = result..string.format(\"%s |c%s%s%s\\n\", coloredName(name), color, \" - \", \"READY\")\n                elseif aura_env.activecheck[i] == 1 then\n                    color = \"FF00F9FF\" -- teal\n                    cooldown = aura_env.duration[i] - GetTime()\n                    result = result..string.format(\"%s |c%s%s%d\\n\", coloredName(name), color, \" - \", cooldown+0.5)\n                elseif aura_env.activecheck[i] == 2 then\n                    color = \"FF00FF00\" -- green\n                    cooldown = aura_env.duration[i] - GetTime()\n                    result = result..string.format(\"%s |c%s%s%d\\n\", coloredName(name), color, \" - \", cooldown+0.5)\n                elseif aura_env.activecheck[i] == 3 then\n                    color = \"FFFF0000\" -- red\n                    cooldown = aura_env.duration2[i] - GetTime()\n                    result = result..string.format(\"%s |c%s%s%d\\n\", coloredName(name), color, \" - \", cooldown+0.5)\n                end\n            end\n            \n        end\n        if result == \"\" then\n            aura_env.check[1] = 50\n            return \"updating...\"\n        end\n        \n        return result\n        \n    end\n    \nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
			["untrigger"] = {
				["unit"] = "boss2",
				["custom"] = "",
				["use_specific_unit"] = true,
			},
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = 0,
			["customTextUpdate"] = "update",
			["actions"] = {
				["start"] = {
					["message"] = " ",
					["custom"] = "",
					["do_sound"] = false,
					["message_type"] = "SAY",
					["do_glow"] = false,
					["do_message"] = false,
					["do_custom"] = false,
				},
				["finish"] = {
					["custom"] = "aura_env.name = {}\naura_env.duration = {}\naura_env.duration2 = {}\naura_env.activecheck = {}\naura_env.check[1] = 0\n\n\n\n",
					["do_custom"] = true,
				},
				["init"] = {
					["custom"] = "aura_env.name = {}\naura_env.duration = {}\naura_env.duration2 = {}\naura_env.activecheck = {}\naura_env.check = {}\ntable.insert(aura_env.check, 0)\n\n\n\n",
					["do_custom"] = true,
				},
			},
			["text1Enabled"] = true,
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["main"] = {
					["use_color"] = false,
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
			},
			["trigger"] = {
				["stack_info"] = "count",
				["use_alwaystrue"] = true,
				["subeventPrefix"] = "SPELL",
				["duration"] = "5",
				["use_spell"] = true,
				["unit"] = "group",
				["use_specific_unit"] = false,
				["custom_hide"] = "timed",
				["events"] = "COMBAT_LOG_EVENT_UNFILTERED",
				["group_countOperator"] = "==",
				["group_count"] = "1",
				["custom"] = "function(event, timestamp, event, hideCaster, sourceGUID, sourceName, sourceFlags, sourceRaidFlags, destGUID, destName, destFlags, destRaidFlags, spellID, spellName, spellSchool)\n    \n    \n    for i=1,table.getn(aura_env.activecheck) do\n        if event == \"SPELL_CAST_SUCCESS\" then\n            if (spellID == 28730) or (spellID) == 25046 or (spellID) == 69179 or (spellID) == 50613 or (spellID) == 129597 or (spellID) == 155145 or (spellID) == 202719 or (spellID) == 80483 or (spellID) == 232633 then\n                if aura_env.name[i] == sourceName then\n                    aura_env.duration2[i] = GetTime()+90\n                    aura_env.duration[i] = GetTime()+2\n                    aura_env.activecheck[i] = 2\n                end\n            end\n        end\n    end\nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
				["spell"] = "Lightning Bolt",
				["debuffType"] = "HARMFUL",
				["use_sourceName"] = false,
				["type"] = "custom",
				["subeventSuffix"] = "_CREATE",
				["custom_type"] = "status",
				["spellName"] = "Lightning Bolt",
				["unevent"] = "auto",
				["event"] = "Conditions",
				["name_info"] = "aura",
				["sourceName"] = "Elder Regail",
				["use_spellName"] = false,
				["spellIds"] = {
				},
				["use_sourceUnit"] = true,
				["check"] = "event",
				["names"] = {
					"Volatile Rot", -- [1]
				},
				["sourceUnit"] = "target",
				["use_unit"] = true,
			},
			["text1Containment"] = "OUTSIDE",
			["parent"] = "CC Tracker ",
			["text1Point"] = "RIGHT",
			["text2Point"] = "CENTER",
			["text2FontFlags"] = "OUTLINE",
			["height"] = 50,
			["xOffset"] = -681.3489074707,
			["load"] = {
				["zone"] = "Blackrock Foundry",
				["use_size"] = true,
				["use_never"] = false,
				["talent"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["encounterid"] = "1853",
				["role"] = {
					["multi"] = {
					},
				},
				["use_encounterid"] = false,
				["difficulty"] = {
					["single"] = "mythic",
					["multi"] = {
						["mythic"] = true,
					},
				},
				["use_zone"] = false,
				["talent2"] = {
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
				["race"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["single"] = "party",
					["multi"] = {
						["party"] = true,
					},
				},
			},
			["conditions"] = {
			},
			["stickyDuration"] = false,
			["inverse"] = false,
			["text2Containment"] = "INSIDE",
			["text2Font"] = "Friz Quadrata TT",
			["text1Font"] = "Vixar",
			["cooldownTextEnabled"] = true,
			["anchorFrameType"] = "SCREEN",
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["regionType"] = "icon",
			["frameStrata"] = 1,
			["text1FontFlags"] = "OUTLINE",
			["text2FontSize"] = 24,
			["id"] = "Bloodelf Silence",
			["init_completed"] = 1,
			["text1"] = "%c",
			["text2"] = "%p",
			["justify"] = "LEFT",
			["zoom"] = 0.3,
			["auto"] = false,
			["selfPoint"] = "CENTER",
			["additional_triggers"] = {
				{
					["trigger"] = {
						["subeventPrefix"] = "SPELL",
						["type"] = "custom",
						["custom"] = "function()\n    if aura_env.check[1] == 0 or aura_env.check[1] == 45 then\n        aura_env.name = {}\n        for i=1, GetNumGroupMembers() do\n            aura_env.check[1] = GetNumGroupMembers()\n            local name, rank, subgroup, level, class = GetRaidRosterInfo(i)\n            if name ~= nil then\n                race, raceEn = UnitRace(name)\n                if raceEn == \"BloodElf\" then\n                    table.insert(aura_env.duration, GetTime()+0)\n                    table.insert(aura_env.duration2, GetTime()+0)\n                    table.insert(aura_env.activecheck, 0)\n                    table.insert(aura_env.name, name)\n                end\n            end\n        end\n        \n        \n        \n        \n        if table.getn(aura_env.name) > 0 then\n            return true\n        else \n            return false\n        end\n    end\n    for i=1,getn(aura_env.activecheck) do\n        if aura_env.activecheck[i] == 2 then\n            if aura_env.duration[i] - GetTime() <= 0 then\n                aura_env.activecheck[i] = 3\n            end\n        elseif aura_env.activecheck[i] == 3 then\n            if aura_env.duration2[i] - GetTime() <= 0 then\n                aura_env.activecheck[i] = 0\n            end\n        end\n    end\nend\n\n\n",
						["custom_type"] = "status",
						["check"] = "update",
						["subeventSuffix"] = "_CAST_START",
						["event"] = "Health",
						["custom_hide"] = "timed",
					},
					["untrigger"] = {
						["custom"] = "function()\n    if aura_env.check[1] == 50 then\n        aura_env.name = {}\n        aura_env.check[1] = 45\n        return true\n    end\nend\n\n\n\n\n\n\n",
					},
				}, -- [1]
			},
			["desaturate"] = false,
			["text2Enabled"] = false,
			["width"] = 50,
			["icon"] = true,
			["text1Color"] = {
				1, -- [1]
				1, -- [2]
				0.96470588235294, -- [3]
				1, -- [4]
			},
			["numTriggers"] = 2,
			["yOffset"] = 277.58770751953,
			["displayIcon"] = 136222,
			["cooldown"] = true,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
		},
		["Frost 2T20"] = {
			["glow"] = false,
			["text1FontSize"] = 6,
			["cooldownTextEnabled"] = true,
			["untrigger"] = {
			},
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = 0,
			["customTextUpdate"] = "update",
			["icon"] = true,
			["text1Enabled"] = true,
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["type"] = "preset",
					["preset"] = "grow",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["preset"] = "pulse",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["preset"] = "fade",
					["type"] = "none",
				},
			},
			["trigger"] = {
				["type"] = "aura",
				["spellId"] = "240555",
				["subeventSuffix"] = "_CAST_START",
				["event"] = "Health",
				["names"] = {
					"冰冻之雨", -- [1]
				},
				["fullscan"] = true,
				["use_spellId"] = true,
				["name"] = "冰冻之雨",
				["custom_hide"] = "timed",
				["spellIds"] = {
					240555, -- [1]
				},
				["unit"] = "player",
				["subeventPrefix"] = "SPELL",
				["debuffType"] = "HELPFUL",
			},
			["desaturate"] = false,
			["text1Point"] = "CENTER",
			["text2FontFlags"] = "OUTLINE",
			["height"] = 40,
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
				["spec"] = {
					["single"] = 3,
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
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["role"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["single"] = "MAGE",
					["multi"] = {
						["MAGE"] = true,
					},
				},
				["faction"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["yOffset"] = 0,
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["parent"] = "Buffs",
			["text2Containment"] = "INSIDE",
			["displayIcon"] = "Interface\\Icons\\Spell_Nature_Lightning",
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
			["text2Font"] = "Friz Quadrata TT",
			["text1Font"] = "Friz Quadrata TT",
			["text2FontSize"] = 24,
			["anchorFrameType"] = "SCREEN",
			["text2Enabled"] = false,
			["text1"] = "%p",
			["text2"] = "%p",
			["id"] = "Frost 2T20",
			["zoom"] = 0.18,
			["auto"] = true,
			["text1FontFlags"] = "OUTLINE",
			["additional_triggers"] = {
			},
			["xOffset"] = 0,
			["frameStrata"] = 1,
			["width"] = 40,
			["stickyDuration"] = false,
			["text2Point"] = "CENTER",
			["inverse"] = false,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["init_started"] = 1,
			["conditions"] = {
			},
			["cooldown"] = true,
			["selfPoint"] = "CENTER",
		},
		["CC Tracker "] = {
			["backdropColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0.5, -- [4]
			},
			["controlledChildren"] = {
				"CC Tracker", -- [1]
				"Bloodelf Silence", -- [2]
			},
			["borderBackdrop"] = "Blizzard Tooltip",
			["disjunctive"] = "all",
			["xOffset"] = -1.3839111328125,
			["border"] = false,
			["borderEdge"] = "None",
			["anchorPoint"] = "CENTER",
			["borderSize"] = 16,
			["yOffset"] = 35.8126220703125,
			["borderColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0.5, -- [4]
			},
			["expanded"] = false,
			["url"] = "https://wago.io/E15flIcYW/5",
			["actions"] = {
				["start"] = {
				},
				["init"] = {
				},
				["finish"] = {
				},
			},
			["regionType"] = "group",
			["activeTriggerMode"] = -10,
			["borderOffset"] = 5,
			["numTriggers"] = 1,
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
			},
			["additional_triggers"] = {
			},
			["trigger"] = {
				["subeventPrefix"] = "SPELL",
				["type"] = "aura",
				["spellIds"] = {
				},
				["subeventSuffix"] = "_CAST_START",
				["debuffType"] = "HELPFUL",
				["names"] = {
				},
				["event"] = "Health",
				["unit"] = "player",
			},
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["desc"] = "Author: (EU)Reloh-Blackrock Reloe#2787",
			["borderInset"] = 11,
			["version"] = 5,
			["id"] = "CC Tracker ",
			["selfPoint"] = "BOTTOMLEFT",
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
				["spec"] = {
					["multi"] = {
					},
				},
				["use_class"] = false,
				["role"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["untrigger"] = {
			},
		},
		["Whisper in the dark-buff"] = {
			["glow"] = false,
			["text1FontSize"] = 6,
			["cooldownTextEnabled"] = true,
			["untrigger"] = {
			},
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = 0,
			["customTextUpdate"] = "update",
			["icon"] = true,
			["text1Enabled"] = true,
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["type"] = "preset",
					["preset"] = "grow",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["preset"] = "pulse",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["preset"] = "fade",
					["type"] = "none",
				},
			},
			["trigger"] = {
				["type"] = "aura",
				["subeventSuffix"] = "_CAST_START",
				["event"] = "Health",
				["names"] = {
					"恶魔代价", -- [1]
				},
				["spellIds"] = {
					225776, -- [1]
				},
				["debuffType"] = "HELPFUL",
				["unit"] = "player",
				["subeventPrefix"] = "SPELL",
				["custom_hide"] = "timed",
			},
			["desaturate"] = false,
			["text1Point"] = "CENTER",
			["text2FontFlags"] = "OUTLINE",
			["height"] = 40,
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
				["class"] = {
					["single"] = "MAGE",
					["multi"] = {
						["MAGE"] = true,
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
				["spec"] = {
					["single"] = 2,
					["multi"] = {
						[2] = true,
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
				["size"] = {
					["multi"] = {
					},
				},
			},
			["yOffset"] = 0,
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["parent"] = "Buffs",
			["text2Containment"] = "INSIDE",
			["displayIcon"] = "Interface\\Icons\\Spell_Frost_ColdHearted",
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
			["text2Font"] = "Friz Quadrata TT",
			["text1Font"] = "Friz Quadrata TT",
			["text2FontSize"] = 24,
			["anchorFrameType"] = "SCREEN",
			["text2Enabled"] = false,
			["text1"] = "%c",
			["text2"] = "%p",
			["id"] = "Whisper in the dark-buff",
			["zoom"] = 0.18,
			["auto"] = true,
			["text1FontFlags"] = "OUTLINE",
			["additional_triggers"] = {
			},
			["xOffset"] = 0,
			["frameStrata"] = 1,
			["width"] = 40,
			["stickyDuration"] = false,
			["text2Point"] = "CENTER",
			["inverse"] = false,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["cooldown"] = true,
			["selfPoint"] = "CENTER",
		},
		["Encounter Time"] = {
			["outline"] = "OUTLINE",
			["fontSize"] = 24,
			["xOffset"] = 0,
			["displayText"] = "%c",
			["customText"] = "function()\n    if WA_xXx_Combat_Start ~=nil then\n        local combatTime = GetTime()-WA_xXx_Combat_Start\n        return string.format(\"%02d:%02d\", combatTime/60, combatTime%60)\n    else\n        return \"00:00\"\n    end\nend",
			["untrigger"] = {
				["custom"] = "function()\n    return WA_xXx_Combat_Start == nil\nend",
			},
			["regionType"] = "text",
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = 0,
			["customTextUpdate"] = "update",
			["init_completed"] = 1,
			["actions"] = {
				["start"] = {
					["do_sound"] = false,
					["do_message"] = false,
					["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\BikeHorn.mp3",
					["sound_channel"] = "Master",
				},
				["init"] = {
				},
				["finish"] = {
				},
			},
			["selfPoint"] = "CENTER",
			["additional_triggers"] = {
			},
			["height"] = 23.7949085235596,
			["justify"] = "CENTER",
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
			},
			["id"] = "Encounter Time",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["frameStrata"] = 5,
			["anchorFrameType"] = "SCREEN",
			["trigger"] = {
				["type"] = "custom",
				["debuffType"] = "HELPFUL",
				["custom_type"] = "event",
				["unit"] = "player",
				["duration"] = "1",
				["event"] = "Health",
				["subeventPrefix"] = "SPELL",
				["customDuration"] = "",
				["customName"] = "",
				["custom"] = "function()\n    if (UnitExists(\"boss1\") and UnitIsDeadOrGhost(\"player\")) or UnitAffectingCombat(\"player\") or InCombatLockdown() then\n        WA_xXx_Combat_Start = WA_xXx_Combat_Start or GetTime()\n        return true\n    else\n        WA_xXx_Combat_Start = nil\n        return false\n    end\nend",
				["names"] = {
				},
				["subeventSuffix"] = "_CAST_START",
				["spellIds"] = {
				},
				["events"] = "INSTANCE_ENCOUNTER_ENGAGE_UNIT, PLAYER_REGEN_DISABLED, PLAYER_REGEN_ENABLED",
				["custom_hide"] = "custom",
			},
			["font"] = "DIGITAL",
			["numTriggers"] = 1,
			["width"] = 70.7437591552735,
			["init_started"] = 1,
			["conditions"] = {
			},
			["load"] = {
				["talent2"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["single"] = 2,
					["multi"] = {
					},
				},
				["spec"] = {
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
				["race"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["yOffset"] = 400,
		},
		["污染墨汁"] = {
			["text2Point"] = "BOTTOM",
			["text1FontSize"] = 32,
			["cooldownTextEnabled"] = true,
			["customText"] = "function()\n    for i=1, 40, 1 do\n        local i_spellID = select(11, UnitDebuff(aura_env.unitID,i))\n        if i_spellID and i_spellID==aura_env.spellID then\n            local tooltipSize = select(3, WeakAuras.GetAuraTooltipInfo(aura_env.unitID, i, aura_env.filter))\n            return aura_env.shortenNumber(tooltipSize) or aura_env.alternativeText\n        end\n    end    \n    return aura_env.alternativeText\nend",
			["untrigger"] = {
			},
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = 0,
			["customTextUpdate"] = "event",
			["actions"] = {
				["start"] = {
					["do_glow"] = false,
					["glow_frame"] = "WeakAuras:Artillery",
					["do_message"] = false,
					["do_sound"] = false,
					["message_type"] = "SAY",
					["glow_action"] = "show",
					["sound"] = "Interface\\AddOns\\Prat-3.0\\Sounds\\Link.ogg",
					["message"] = "",
				},
				["finish"] = {
				},
				["init"] = {
					["do_custom"] = true,
					["custom"] = "aura_env.spellID = 232913 -- Change to whatever debuff you want to keep track\naura_env.unitID = \"player\"\naura_env.filter = \"harmful\"\naura_env.alternativeText = \"DOT\"\n\naura_env.shortenNumber = function(number)\n    if type(number) ~= \"number\" then\n        number = tonumber(number)\n    end\n    if not number then\n        return\n    end\n    \n    local affixes = {\n        \"\",\n        \"K\",\n        \"M\",\n        \"B\",\n    }\n    \n    local affix = 1\n    local dec = 0\n    local num1 = math.abs(number)\n    while num1 >= 1000 and affix < #affixes do\n        num1 = num1 / 1000\n        affix = affix + 1\n    end\n    if affix > 1 then\n        dec = 2\n        local num2 = num1\n        while num2 >= 10 do\n            num2 = num2 / 10\n            dec = dec - 1\n        end\n    end\n    if number < 0 then\n        num1 = -num1\n    end\n    \n    return string.format(\"%.\"..dec..\"f\"..affixes[affix], num1)\nend",
				},
			},
			["fontFlags"] = "THICKOUTLINE",
			["useTooltip"] = false,
			["animation"] = {
				["start"] = {
					["preset"] = "spiral",
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
			},
			["trigger"] = {
				["fullscan"] = true,
				["type"] = "aura",
				["spellId"] = "232913",
				["unevent"] = "timed",
				["use_unit"] = true,
				["duration"] = "2",
				["event"] = "Combat Log",
				["names"] = {
					"灵魂之刃", -- [1]
				},
				["unit"] = "player",
				["use_spellId"] = true,
				["name"] = "污染墨汁",
				["subeventSuffix"] = "_CAST_START",
				["custom_hide"] = "timed",
				["spellIds"] = {
					200084, -- [1]
				},
				["subeventPrefix"] = "SPELL",
				["debuffType"] = "HARMFUL",
			},
			["parent"] = "萨格拉斯之墓 - 04#主母萨丝琳",
			["text1Containment"] = "OUTSIDE",
			["yOffset"] = 0,
			["text1Point"] = "TOP",
			["stacksPoint"] = "BOTTOM",
			["text2FontFlags"] = "THICKOUTLINE",
			["height"] = 100,
			["conditions"] = {
			},
			["load"] = {
				["use_never"] = false,
				["zone"] = "Hellfire Citadel",
				["encounterid"] = "2037",
				["use_encounterid"] = true,
				["use_zoneId"] = true,
				["size"] = {
					["single"] = "party",
					["multi"] = {
						["party"] = true,
					},
				},
				["talent2"] = {
					["multi"] = {
					},
				},
				["use_level"] = false,
				["talent"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["use_zone"] = false,
				["faction"] = {
					["multi"] = {
					},
				},
				["zoneId"] = "1147",
				["role"] = {
					["single"] = "TANK",
					["multi"] = {
						["TANK"] = true,
					},
				},
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
			},
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["inverse"] = false,
			["fontSize"] = 15,
			["text2Containment"] = "OUTSIDE",
			["stickyDuration"] = false,
			["text1Color"] = {
				0, -- [1]
				0.701960784313726, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text2Font"] = "Friz Quadrata TT",
			["anchorFrameType"] = "SCREEN",
			["text1FontFlags"] = "THICKOUTLINE",
			["regionType"] = "icon",
			["frameStrata"] = 1,
			["text1Font"] = "Friz Quadrata TT",
			["text2FontSize"] = 20,
			["id"] = "污染墨汁",
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text1"] = "%c",
			["zoom"] = 0,
			["stacksContainment"] = "OUTSIDE",
			["text2"] = "减速",
			["auto"] = true,
			["desaturate"] = false,
			["additional_triggers"] = {
				{
					["trigger"] = {
						["type"] = "aura",
						["subeventSuffix"] = "_CAST_START",
						["event"] = "Health",
						["subeventPrefix"] = "SPELL",
						["spellIds"] = {
							234621, -- [1]
						},
						["debuffType"] = "HARMFUL",
						["unit"] = "player",
						["names"] = {
							"吞噬巨口", -- [1]
						},
						["inverse"] = true,
						["custom_hide"] = "timed",
					},
					["untrigger"] = {
					},
				}, -- [1]
			},
			["xOffset"] = 0,
			["text2Enabled"] = true,
			["width"] = 100,
			["selfPoint"] = "CENTER",
			["text1Enabled"] = true,
			["numTriggers"] = 2,
			["icon"] = true,
			["displayIcon"] = "132107",
			["cooldown"] = true,
			["glow"] = false,
		},
		["多头蛇酸液"] = {
			["text2Point"] = "BOTTOM",
			["text1FontSize"] = 32,
			["cooldownTextEnabled"] = true,
			["customText"] = "function()\n    for i=1, 40, 1 do\n        local i_spellID = select(11, UnitDebuff(aura_env.unitID,i))\n        if i_spellID and i_spellID==aura_env.spellID then\n            local tooltipSize = select(3, WeakAuras.GetAuraTooltipInfo(aura_env.unitID, i, aura_env.filter))\n            return aura_env.shortenNumber(tooltipSize) or aura_env.alternativeText\n        end\n    end    \n    return aura_env.alternativeText\nend",
			["untrigger"] = {
			},
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = 0,
			["customTextUpdate"] = "event",
			["actions"] = {
				["start"] = {
					["do_glow"] = false,
					["message"] = "",
					["sound"] = "Interface\\AddOns\\Prat-3.0\\Sounds\\Link.ogg",
					["do_sound"] = false,
					["message_type"] = "SAY",
					["glow_action"] = "show",
					["do_message"] = false,
					["glow_frame"] = "WeakAuras:Artillery",
				},
				["finish"] = {
				},
				["init"] = {
					["do_custom"] = true,
					["custom"] = "aura_env.spellID = 232754 -- Change to whatever debuff you want to keep track\naura_env.unitID = \"player\"\naura_env.filter = \"harmful\"\naura_env.alternativeText = \"DOT\"\n\naura_env.shortenNumber = function(number)\n    if type(number) ~= \"number\" then\n        number = tonumber(number)\n    end\n    if not number then\n        return\n    end\n    \n    local affixes = {\n        \"\",\n        \"K\",\n        \"M\",\n        \"B\",\n    }\n    \n    local affix = 1\n    local dec = 0\n    local num1 = math.abs(number)\n    while num1 >= 1000 and affix < #affixes do\n        num1 = num1 / 1000\n        affix = affix + 1\n    end\n    if affix > 1 then\n        dec = 2\n        local num2 = num1\n        while num2 >= 10 do\n            num2 = num2 / 10\n            dec = dec - 1\n        end\n    end\n    if number < 0 then\n        num1 = -num1\n    end\n    \n    return string.format(\"%.\"..dec..\"f\"..affixes[affix], num1)\nend",
				},
			},
			["fontFlags"] = "THICKOUTLINE",
			["useTooltip"] = false,
			["animation"] = {
				["start"] = {
					["preset"] = "spiral",
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
			},
			["trigger"] = {
				["debuffType"] = "HARMFUL",
				["type"] = "aura",
				["spellId"] = "232754",
				["unevent"] = "timed",
				["names"] = {
					"灵魂之刃", -- [1]
				},
				["duration"] = "2",
				["event"] = "Combat Log",
				["use_unit"] = true,
				["unit"] = "player",
				["use_spellId"] = true,
				["name"] = "多头蛇酸液",
				["subeventSuffix"] = "_CAST_START",
				["custom_hide"] = "timed",
				["spellIds"] = {
					200084, -- [1]
				},
				["subeventPrefix"] = "SPELL",
				["fullscan"] = true,
			},
			["text1Containment"] = "OUTSIDE",
			["desaturate"] = true,
			["yOffset"] = 0,
			["text1Point"] = "TOP",
			["cooldown"] = true,
			["text2FontFlags"] = "THICKOUTLINE",
			["height"] = 100,
			["conditions"] = {
			},
			["load"] = {
				["use_never"] = false,
				["zone"] = "Hellfire Citadel",
				["encounterid"] = "2037",
				["use_encounterid"] = true,
				["use_zoneId"] = true,
				["size"] = {
					["single"] = "party",
					["multi"] = {
						["party"] = true,
					},
				},
				["talent2"] = {
					["multi"] = {
					},
				},
				["zoneId"] = "1147",
				["talent"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["use_level"] = false,
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["use_zone"] = false,
				["faction"] = {
					["multi"] = {
					},
				},
				["role"] = {
					["single"] = "TANK",
					["multi"] = {
						["TANK"] = true,
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
			},
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["inverse"] = false,
			["fontSize"] = 15,
			["text2Containment"] = "OUTSIDE",
			["stickyDuration"] = false,
			["text1Color"] = {
				0, -- [1]
				0.701960784313726, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text2Font"] = "Friz Quadrata TT",
			["anchorFrameType"] = "SCREEN",
			["text2Color"] = {
				1, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["regionType"] = "icon",
			["frameStrata"] = 1,
			["text1Font"] = "Friz Quadrata TT",
			["text2FontSize"] = 22,
			["additional_triggers"] = {
			},
			["selfPoint"] = "CENTER",
			["text1"] = "%c",
			["zoom"] = 0,
			["stacksContainment"] = "OUTSIDE",
			["text2"] = "不要分担",
			["auto"] = true,
			["text1Enabled"] = true,
			["id"] = "多头蛇酸液",
			["xOffset"] = 0,
			["text2Enabled"] = true,
			["width"] = 100,
			["text1FontFlags"] = "THICKOUTLINE",
			["icon"] = true,
			["numTriggers"] = 1,
			["glow"] = false,
			["displayIcon"] = "132107",
			["stacksPoint"] = "BOTTOM",
			["parent"] = "萨格拉斯之墓 - 04#主母萨丝琳",
		},
		["Buffs"] = {
			["grow"] = "LEFT",
			["controlledChildren"] = {
				"Artifact", -- [1]
				"Arcane: Arcane Power Buff", -- [2]
				"Arcane 2T20", -- [3]
				"Frost 2T20", -- [4]
				"Fire 2T20", -- [5]
				"Fire 4T20", -- [6]
				"Arcane: Evocation Buff", -- [7]
				"Frost: Icy Veins Buff", -- [8]
				"Fire: Combustion Buff", -- [9]
				"ROP timer", -- [10]
				"Racial: Troll Buff", -- [11]
				"Ring: Legendary", -- [12]
				"Potion", -- [13]
				"Erratic Metronome", -- [14]
				"Obelisk of the Void", -- [15]
				"Infernal Writ", -- [16]
				"Tarnished Sentinel Medallion", -- [17]
				"Charm of the Rising Tide", -- [18]
				"Tome of Unraveling Sanity", -- [19]
				"Whisper in the dark-buff", -- [20]
				"Whisper in the dark-debuff", -- [21]
				"DefCD: IB /EV Buff", -- [22]
				"DefCD: Cauterize Buff", -- [23]
				"DefCD: Invisibility Buff", -- [24]
				"OfCD: Time Warp Buff", -- [25]
			},
			["xOffset"] = 42.2208862304688,
			["yOffset"] = -191.666320800781,
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = 0,
			["space"] = 6,
			["background"] = "None",
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["backgroundInset"] = 0,
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
				["unit"] = "player",
				["type"] = "aura",
				["spellIds"] = {
				},
				["subeventSuffix"] = "_CAST_START",
				["debuffType"] = "HELPFUL",
				["names"] = {
				},
				["event"] = "Health",
				["subeventPrefix"] = "SPELL",
			},
			["stagger"] = 0,
			["height"] = 40,
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
				["role"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["animate"] = false,
			["border"] = "None",
			["regionType"] = "dynamicgroup",
			["sort"] = "none",
			["expanded"] = false,
			["constantFactor"] = "RADIUS",
			["borderOffset"] = 16,
			["additional_triggers"] = {
			},
			["width"] = 1143.99997329712,
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["id"] = "Buffs",
			["selfPoint"] = "RIGHT",
			["numTriggers"] = 1,
			["rotation"] = 0,
			["align"] = "CENTER",
			["conditions"] = {
			},
			["untrigger"] = {
			},
			["radius"] = 200,
		},
		["萦绕的爆发"] = {
			["text2Point"] = "BOTTOM",
			["text1FontSize"] = 32,
			["cooldownTextEnabled"] = true,
			["customText"] = "function()\n    for i=1, 40, 1 do\n        local i_spellID = select(11, UnitDebuff(aura_env.unitID,i))\n        if i_spellID and i_spellID==aura_env.spellID then\n            local tooltipSize = select(3, WeakAuras.GetAuraTooltipInfo(aura_env.unitID, i, aura_env.filter))\n            return aura_env.shortenNumber(tooltipSize) or aura_env.alternativeText\n        end\n    end    \n    return aura_env.alternativeText\nend",
			["untrigger"] = {
			},
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = 0,
			["customTextUpdate"] = "event",
			["actions"] = {
				["start"] = {
					["do_glow"] = false,
					["glow_frame"] = "WeakAuras:Artillery",
					["do_message"] = false,
					["do_sound"] = false,
					["message_type"] = "SAY",
					["glow_action"] = "show",
					["sound"] = "Interface\\AddOns\\Prat-3.0\\Sounds\\Link.ogg",
					["message"] = "",
				},
				["finish"] = {
				},
				["init"] = {
					["do_custom"] = true,
					["custom"] = "aura_env.spellID = 243536 -- Change to whatever debuff you want to keep track\naura_env.unitID = \"player\"\naura_env.filter = \"harmful\"\naura_env.alternativeText = \"DOT\"\n\naura_env.shortenNumber = function(number)\n    if type(number) ~= \"number\" then\n        number = tonumber(number)\n    end\n    if not number then\n        return\n    end\n    \n    local affixes = {\n        \"\",\n        \"K\",\n        \"M\",\n        \"B\",\n    }\n    \n    local affix = 1\n    local dec = 0\n    local num1 = math.abs(number)\n    while num1 >= 1000 and affix < #affixes do\n        num1 = num1 / 1000\n        affix = affix + 1\n    end\n    if affix > 1 then\n        dec = 2\n        local num2 = num1\n        while num2 >= 10 do\n            num2 = num2 / 10\n            dec = dec - 1\n        end\n    end\n    if number < 0 then\n        num1 = -num1\n    end\n    \n    return string.format(\"%.\"..dec..\"f\"..affixes[affix], num1)\nend",
				},
			},
			["fontFlags"] = "THICKOUTLINE",
			["useTooltip"] = false,
			["animation"] = {
				["start"] = {
					["preset"] = "spiral",
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
			},
			["trigger"] = {
				["fullscan"] = true,
				["type"] = "aura",
				["spellId"] = "243536",
				["unevent"] = "timed",
				["use_unit"] = true,
				["duration"] = "2",
				["event"] = "Combat Log",
				["subeventPrefix"] = "SPELL",
				["unit"] = "player",
				["use_spellId"] = true,
				["spellIds"] = {
					200084, -- [1]
				},
				["subeventSuffix"] = "_CAST_START",
				["names"] = {
					"灵魂之刃", -- [1]
				},
				["name"] = "萦绕的爆发",
				["debuffType"] = "HARMFUL",
				["custom_hide"] = "timed",
			},
			["parent"] = "萨格拉斯之墓 - 09#基尔加丹",
			["text1Containment"] = "OUTSIDE",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text1Point"] = "TOP",
			["stacksPoint"] = "BOTTOM",
			["text2FontFlags"] = "THICKOUTLINE",
			["height"] = 100,
			["conditions"] = {
			},
			["load"] = {
				["use_never"] = false,
				["zone"] = "Hellfire Citadel",
				["encounterid"] = "2051",
				["use_encounterid"] = true,
				["role"] = {
					["single"] = "TANK",
					["multi"] = {
						["TANK"] = true,
					},
				},
				["size"] = {
					["single"] = "party",
					["multi"] = {
						["party"] = true,
					},
				},
				["talent2"] = {
					["multi"] = {
					},
				},
				["zoneId"] = "1147",
				["talent"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["use_zone"] = false,
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["use_level"] = false,
				["race"] = {
					["multi"] = {
					},
				},
				["faction"] = {
					["multi"] = {
					},
				},
				["use_zoneId"] = true,
			},
			["stickyDuration"] = false,
			["inverse"] = false,
			["fontSize"] = 15,
			["text2Containment"] = "OUTSIDE",
			["text2Font"] = "Friz Quadrata TT",
			["text1Color"] = {
				0, -- [1]
				0.701960784313726, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text1FontFlags"] = "THICKOUTLINE",
			["anchorFrameType"] = "SCREEN",
			["text2Color"] = {
				1, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["regionType"] = "icon",
			["frameStrata"] = 1,
			["text1Font"] = "Friz Quadrata TT",
			["text2FontSize"] = 20,
			["id"] = "萦绕的爆发",
			["desaturate"] = false,
			["text1"] = "%c",
			["zoom"] = 0,
			["stacksContainment"] = "OUTSIDE",
			["text2"] = "保持移动",
			["auto"] = true,
			["selfPoint"] = "CENTER",
			["additional_triggers"] = {
			},
			["xOffset"] = 0,
			["text2Enabled"] = true,
			["width"] = 100,
			["text1Enabled"] = true,
			["icon"] = true,
			["numTriggers"] = 1,
			["glow"] = false,
			["displayIcon"] = 464119,
			["cooldown"] = true,
			["yOffset"] = 0,
		},
		["爆裂恐惧烈焰"] = {
			["outline"] = "OUTLINE",
			["text2Point"] = "TOP",
			["text1FontSize"] = 22,
			["disjunctive"] = "all",
			["displayText"] = " ",
			["customText"] = "\n\n",
			["yOffset"] = 170.000244140625,
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = -10,
			["customTextUpdate"] = "update",
			["actions"] = {
				["start"] = {
					["message"] = "{rt7} FLAMES on me {rt7}",
					["do_sound"] = true,
					["message_type"] = "SAY",
					["sound"] = "Sound\\Interface\\AlarmClockWarning2.ogg",
					["do_message"] = true,
				},
				["finish"] = {
					["do_custom"] = false,
					["custom"] = "\n\n",
				},
				["init"] = {
					["do_custom"] = false,
					["custom"] = "\n\n",
				},
			},
			["text1Enabled"] = true,
			["selfPoint"] = "BOTTOM",
			["trigger"] = {
				["duration"] = "4",
				["message_operator"] = "match('%s')",
				["unit"] = "player",
				["custom_hide"] = "timed",
				["type"] = "custom",
				["subeventPrefix"] = "SPELL",
				["unevent"] = "custom",
				["names"] = {
				},
				["debuffType"] = "HELPFUL",
				["event"] = "Chat Message",
				["custom_type"] = "event",
				["message"] = "long sleeves",
				["spellIds"] = {
				},
				["custom"] = "function(channel, message, language, channelString, target, flags, unknown, channelNumber, channelName, unknown, counter)\n    if message and message:find(\"spell:238430\") then \n        return true\n    end\nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
				["events"] = "CHAT_MSG_RAID_BOSS_WHISPER, CHAT_MSG_WHISPER",
				["use_message"] = true,
				["subeventSuffix"] = "_CAST_START",
				["use_messageType"] = true,
				["messageType"] = "CHAT_MSG_PARTY",
			},
			["text1Containment"] = "OUTSIDE",
			["text1Point"] = "BOTTOM",
			["parent"] = "萨格拉斯之墓 - 09#基尔加丹",
			["text2FontFlags"] = "THICKOUTLINE",
			["height"] = 100,
			["untrigger"] = {
				["message"] = "Reset",
				["custom"] = "\n\n",
				["use_message"] = true,
				["message_operator"] = "==",
				["use_messageType"] = true,
				["messageType"] = "CHAT_MSG_PARTY",
			},
			["load"] = {
				["use_never"] = false,
				["zone"] = "Court of Stars",
				["encounterid"] = "2051",
				["use_encounterid"] = true,
				["use_zoneId"] = true,
				["size"] = {
					["multi"] = {
					},
				},
				["talent2"] = {
					["multi"] = {
					},
				},
				["zoneId"] = "1147",
				["talent"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["use_level"] = false,
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["use_zone"] = false,
				["race"] = {
					["multi"] = {
					},
				},
				["faction"] = {
					["multi"] = {
					},
				},
				["role"] = {
					["multi"] = {
					},
				},
			},
			["xOffset"] = -125.999267578125,
			["conditions"] = {
			},
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text2Containment"] = "OUTSIDE",
			["inverse"] = false,
			["text1Color"] = {
				1, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["stickyDuration"] = false,
			["text2Font"] = "Friz Quadrata TT",
			["text1FontFlags"] = "THICKOUTLINE",
			["regionType"] = "icon",
			["anchorFrameType"] = "SCREEN",
			["frameStrata"] = 1,
			["text2FontSize"] = 24,
			["text1Font"] = "Friz Quadrata TT",
			["additional_triggers"] = {
			},
			["text1"] = "点你",
			["text2"] = "烈焰",
			["auto"] = true,
			["zoom"] = 0,
			["justify"] = "LEFT",
			["desaturate"] = false,
			["id"] = "爆裂恐惧烈焰",
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text2Enabled"] = true,
			["width"] = 100,
			["icon"] = true,
			["cooldownTextEnabled"] = true,
			["numTriggers"] = 1,
			["glow"] = false,
			["displayIcon"] = 460698,
			["cooldown"] = true,
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
			},
		},
		["碎裂波动"] = {
			["text2Point"] = "TOP",
			["text1FontSize"] = 22,
			["cooldownTextEnabled"] = true,
			["customText"] = "\n\n",
			["untrigger"] = {
			},
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = 0,
			["customTextUpdate"] = "event",
			["actions"] = {
				["start"] = {
					["do_glow"] = false,
					["message"] = "",
					["sound"] = "Sound\\Interface\\AlarmClockWarning2.ogg",
					["glow_frame"] = "WeakAuras:Artillery",
					["message_type"] = "SAY",
					["glow_action"] = "show",
					["do_message"] = false,
					["do_sound"] = false,
				},
				["finish"] = {
				},
				["init"] = {
					["do_custom"] = false,
					["custom"] = "\n\n",
				},
			},
			["fontFlags"] = "THICKOUTLINE",
			["useTooltip"] = false,
			["animation"] = {
				["start"] = {
					["preset"] = "spiral",
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
			},
			["trigger"] = {
				["debuffType"] = "HARMFUL",
				["type"] = "event",
				["spellId"] = "232827",
				["unevent"] = "timed",
				["use_unit"] = true,
				["duration"] = "4",
				["event"] = "Combat Log",
				["names"] = {
					"多头蛇射击", -- [1]
				},
				["unit"] = "player",
				["use_spellId"] = true,
				["spellIds"] = {
					230139, -- [1]
				},
				["subeventSuffix"] = "_CAST_START",
				["name"] = "碎裂波动",
				["subcount"] = true,
				["subeventPrefix"] = "SPELL",
				["custom_hide"] = "timed",
			},
			["parent"] = "萨格拉斯之墓 - 04#主母萨丝琳",
			["text1Containment"] = "OUTSIDE",
			["yOffset"] = 0,
			["text1Point"] = "BOTTOM",
			["cooldown"] = true,
			["text2FontFlags"] = "THICKOUTLINE",
			["height"] = 100,
			["conditions"] = {
			},
			["load"] = {
				["use_never"] = false,
				["zone"] = "Hellfire Citadel",
				["encounterid"] = "2037",
				["use_encounterid"] = true,
				["role"] = {
					["single"] = "TANK",
					["multi"] = {
						["TANK"] = true,
					},
				},
				["size"] = {
					["single"] = "party",
					["multi"] = {
						["party"] = true,
					},
				},
				["talent2"] = {
					["multi"] = {
					},
				},
				["zoneId"] = "1147",
				["talent"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["use_level"] = false,
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["use_zone"] = false,
				["faction"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["use_zoneId"] = true,
			},
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["inverse"] = false,
			["fontSize"] = 15,
			["text2Containment"] = "OUTSIDE",
			["stickyDuration"] = false,
			["text1Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text2Font"] = "Friz Quadrata TT",
			["anchorFrameType"] = "SCREEN",
			["text1FontFlags"] = "THICKOUTLINE",
			["regionType"] = "icon",
			["frameStrata"] = 1,
			["selfPoint"] = "CENTER",
			["text2FontSize"] = 20,
			["additional_triggers"] = {
			},
			["xOffset"] = 0,
			["text1"] = "躲开",
			["zoom"] = 0,
			["stacksContainment"] = "OUTSIDE",
			["text2"] = "%p",
			["auto"] = false,
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["id"] = "碎裂波动",
			["text1Font"] = "Friz Quadrata TT",
			["text2Enabled"] = false,
			["width"] = 100,
			["desaturate"] = false,
			["text1Enabled"] = true,
			["numTriggers"] = 1,
			["icon"] = true,
			["displayIcon"] = "135861",
			["stacksPoint"] = "BOTTOM",
			["glow"] = false,
		},
		["Erratic Metronome"] = {
			["glow"] = false,
			["text1FontSize"] = 15,
			["cooldownTextEnabled"] = true,
			["customText"] = "function() return \"|n|n\" end",
			["untrigger"] = {
			},
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = 0,
			["customTextUpdate"] = "update",
			["icon"] = true,
			["text1Enabled"] = true,
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["preset"] = "grow",
					["type"] = "preset",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["preset"] = "pulse",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["preset"] = "fade",
					["type"] = "none",
				},
			},
			["trigger"] = {
				["type"] = "aura",
				["subeventSuffix"] = "_CAST_START",
				["event"] = "Health",
				["names"] = {
					"急速乐章", -- [1]
				},
				["spellIds"] = {
					225719, -- [1]
				},
				["debuffType"] = "HELPFUL",
				["unit"] = "player",
				["subeventPrefix"] = "SPELL",
				["custom_hide"] = "timed",
			},
			["desaturate"] = false,
			["text1Point"] = "BOTTOMRIGHT",
			["text2FontFlags"] = "OUTLINE",
			["height"] = 40,
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
				["spec"] = {
					["single"] = 2,
					["multi"] = {
						[2] = true,
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
				["class"] = {
					["single"] = "MAGE",
					["multi"] = {
						["MAGE"] = true,
					},
				},
				["faction"] = {
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
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["selfPoint"] = "CENTER",
			["parent"] = "Buffs",
			["text2Containment"] = "INSIDE",
			["displayIcon"] = "Interface\\Icons\\Spell_Frost_ColdHearted",
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
			["text2Font"] = "Friz Quadrata TT",
			["text1Font"] = "Friz Quadrata TT",
			["text2FontSize"] = 24,
			["anchorFrameType"] = "SCREEN",
			["text2Enabled"] = false,
			["text1"] = "%s",
			["text2"] = "%p",
			["id"] = "Erratic Metronome",
			["zoom"] = 0.18,
			["auto"] = true,
			["text1FontFlags"] = "OUTLINE",
			["additional_triggers"] = {
			},
			["xOffset"] = 0,
			["frameStrata"] = 1,
			["width"] = 40,
			["stickyDuration"] = false,
			["text2Point"] = "CENTER",
			["inverse"] = false,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["cooldown"] = true,
			["yOffset"] = 0,
		},
		["切割旋风"] = {
			["glow"] = false,
			["text1FontSize"] = 32,
			["cooldownTextEnabled"] = true,
			["customText"] = "function()\n    for i=1, 40, 1 do\n        local i_spellID = select(11, UnitDebuff(aura_env.unitID,i))\n        if i_spellID and i_spellID==aura_env.spellID then\n            local tooltipSize = select(3, WeakAuras.GetAuraTooltipInfo(aura_env.unitID, i, aura_env.filter))\n            return aura_env.shortenNumber(tooltipSize) or aura_env.alternativeText\n        end\n    end    \n    return aura_env.alternativeText\nend",
			["untrigger"] = {
			},
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = 0,
			["customTextUpdate"] = "event",
			["actions"] = {
				["start"] = {
					["do_glow"] = false,
					["message"] = "",
					["sound"] = "Interface\\AddOns\\Prat-3.0\\Sounds\\Link.ogg",
					["do_sound"] = false,
					["message_type"] = "SAY",
					["glow_action"] = "show",
					["do_message"] = false,
					["glow_frame"] = "WeakAuras:Artillery",
				},
				["finish"] = {
				},
				["init"] = {
					["do_custom"] = true,
					["custom"] = "aura_env.spellID = 232732 -- Change to whatever debuff you want to keep track\naura_env.unitID = \"player\"\naura_env.filter = \"harmful\"\naura_env.alternativeText = \"DOT\"\n\naura_env.shortenNumber = function(number)\n    if type(number) ~= \"number\" then\n        number = tonumber(number)\n    end\n    if not number then\n        return\n    end\n    \n    local affixes = {\n        \"\",\n        \"K\",\n        \"M\",\n        \"B\",\n    }\n    \n    local affix = 1\n    local dec = 0\n    local num1 = math.abs(number)\n    while num1 >= 1000 and affix < #affixes do\n        num1 = num1 / 1000\n        affix = affix + 1\n    end\n    if affix > 1 then\n        dec = 2\n        local num2 = num1\n        while num2 >= 10 do\n            num2 = num2 / 10\n            dec = dec - 1\n        end\n    end\n    if number < 0 then\n        num1 = -num1\n    end\n    \n    return string.format(\"%.\"..dec..\"f\"..affixes[affix], num1)\nend",
				},
			},
			["fontFlags"] = "THICKOUTLINE",
			["useTooltip"] = false,
			["animation"] = {
				["start"] = {
					["preset"] = "spiral",
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
			},
			["trigger"] = {
				["debuffType"] = "HARMFUL",
				["type"] = "aura",
				["spellId"] = "232732",
				["unevent"] = "timed",
				["names"] = {
					"灵魂之刃", -- [1]
				},
				["duration"] = "2",
				["event"] = "Combat Log",
				["use_unit"] = true,
				["unit"] = "player",
				["use_spellId"] = true,
				["name"] = "切割旋风",
				["subeventSuffix"] = "_CAST_START",
				["custom_hide"] = "timed",
				["spellIds"] = {
					200084, -- [1]
				},
				["subeventPrefix"] = "SPELL",
				["fullscan"] = true,
			},
			["parent"] = "萨格拉斯之墓 - 04#主母萨丝琳",
			["text1Containment"] = "OUTSIDE",
			["yOffset"] = 0,
			["text1Point"] = "BOTTOM",
			["cooldown"] = true,
			["text2FontFlags"] = "THICKOUTLINE",
			["height"] = 100,
			["conditions"] = {
			},
			["load"] = {
				["use_never"] = false,
				["zone"] = "Hellfire Citadel",
				["encounterid"] = "2037",
				["use_encounterid"] = true,
				["race"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["single"] = "party",
					["multi"] = {
						["party"] = true,
					},
				},
				["talent2"] = {
					["multi"] = {
					},
				},
				["zoneId"] = "1147",
				["talent"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["use_level"] = false,
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["use_zone"] = false,
				["faction"] = {
					["multi"] = {
					},
				},
				["use_zoneId"] = true,
				["role"] = {
					["single"] = "TANK",
					["multi"] = {
						["TANK"] = true,
					},
				},
			},
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["inverse"] = false,
			["fontSize"] = 15,
			["text2Containment"] = "OUTSIDE",
			["stickyDuration"] = false,
			["text1Color"] = {
				0, -- [1]
				0.701960784313726, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text2Font"] = "Friz Quadrata TT",
			["anchorFrameType"] = "SCREEN",
			["text1FontFlags"] = "THICKOUTLINE",
			["regionType"] = "icon",
			["frameStrata"] = 1,
			["selfPoint"] = "CENTER",
			["text2FontSize"] = 22,
			["additional_triggers"] = {
			},
			["text1Font"] = "Friz Quadrata TT",
			["text1"] = "%c",
			["zoom"] = 0,
			["stacksContainment"] = "OUTSIDE",
			["text2"] = "%p",
			["auto"] = true,
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["id"] = "切割旋风",
			["xOffset"] = 0,
			["text2Enabled"] = false,
			["width"] = 100,
			["desaturate"] = false,
			["text1Enabled"] = true,
			["numTriggers"] = 1,
			["icon"] = true,
			["displayIcon"] = "132107",
			["stacksPoint"] = "BOTTOM",
			["text2Point"] = "BOTTOM",
		},
		["Tear Rift cast"] = {
			["text2Point"] = "TOP",
			["text1FontSize"] = 20,
			["disjunctive"] = "all",
			["customText"] = "\n\n",
			["untrigger"] = {
			},
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = 0,
			["customTextUpdate"] = "update",
			["actions"] = {
				["start"] = {
					["do_glow"] = false,
					["message"] = "",
					["sound"] = "Interface\\AddOns\\Prat-3.0\\Sounds\\Link.ogg",
					["do_sound"] = false,
					["message_type"] = "SAY",
					["glow_action"] = "show",
					["do_message"] = false,
					["glow_frame"] = "WeakAuras:Artillery",
				},
				["finish"] = {
				},
				["init"] = {
					["do_custom"] = false,
					["custom"] = "\n\n",
				},
			},
			["fontFlags"] = "THICKOUTLINE",
			["useTooltip"] = false,
			["parent"] = "萨格拉斯之墓 - 09#基尔加丹",
			["animation"] = {
				["start"] = {
					["preset"] = "spiral",
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
			},
			["trigger"] = {
				["spellId"] = "243982",
				["duration"] = "4.5",
				["use_unit"] = true,
				["specificUnit"] = "boss1",
				["debuffType"] = "HARMFUL",
				["type"] = "event",
				["unevent"] = "timed",
				["event"] = "Combat Log",
				["subeventPrefix"] = "SPELL",
				["subeventSuffix"] = "_CAST_START",
				["use_spellId"] = true,
				["name"] = "撕裂裂隙",
				["unit"] = "player",
				["names"] = {
					"暗影映像：绝望", -- [1]
				},
				["use_specific_unit"] = false,
				["spellIds"] = {
					237590, -- [1]
				},
				["custom_hide"] = "timed",
			},
			["yOffset"] = 0,
			["cooldown"] = true,
			["text1Containment"] = "OUTSIDE",
			["conditions"] = {
			},
			["text1Point"] = "BOTTOM",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text2FontFlags"] = "THICKOUTLINE",
			["height"] = 100,
			["inverse"] = false,
			["load"] = {
				["use_never"] = false,
				["zone"] = "Hellfire Citadel",
				["encounterid"] = "2051",
				["use_encounterid"] = true,
				["use_zoneId"] = true,
				["size"] = {
					["single"] = "party",
					["multi"] = {
						["party"] = true,
					},
				},
				["talent2"] = {
					["multi"] = {
					},
				},
				["zoneId"] = "1147",
				["talent"] = {
					["multi"] = {
					},
				},
				["use_role"] = true,
				["spec"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["use_level"] = false,
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["use_zone"] = false,
				["faction"] = {
					["multi"] = {
					},
				},
				["role"] = {
					["single"] = "HEALER",
					["multi"] = {
						["TANK"] = true,
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
			},
			["stickyDuration"] = false,
			["text2Font"] = "Friz Quadrata TT",
			["fontSize"] = 15,
			["text2Containment"] = "OUTSIDE",
			["anchorFrameType"] = "SCREEN",
			["text1Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["frameStrata"] = 1,
			["customTriggerLogic"] = "\n\n",
			["text1FontFlags"] = "THICKOUTLINE",
			["regionType"] = "icon",
			["text1Font"] = "Friz Quadrata TT",
			["additional_triggers"] = {
			},
			["text2FontSize"] = 24,
			["text1Enabled"] = true,
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text1"] = "新的裂隙",
			["zoom"] = 0,
			["stacksContainment"] = "OUTSIDE",
			["text2"] = "BOSS",
			["auto"] = false,
			["desaturate"] = false,
			["id"] = "Tear Rift cast",
			["xOffset"] = 0,
			["text2Enabled"] = false,
			["width"] = 100,
			["selfPoint"] = "CENTER",
			["icon"] = true,
			["numTriggers"] = 1,
			["cooldownTextEnabled"] = true,
			["displayIcon"] = "1394890",
			["stacksPoint"] = "BOTTOM",
			["glow"] = false,
		},
		["波涛起伏"] = {
			["text2Point"] = "TOP",
			["text1FontSize"] = 20,
			["cooldownTextEnabled"] = true,
			["customText"] = "\n\n",
			["untrigger"] = {
			},
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = 0,
			["customTextUpdate"] = "event",
			["actions"] = {
				["start"] = {
					["do_glow"] = false,
					["glow_frame"] = "WeakAuras:Artillery",
					["do_message"] = false,
					["do_sound"] = false,
					["message_type"] = "SAY",
					["glow_action"] = "show",
					["sound"] = "Interface\\AddOns\\Prat-3.0\\Sounds\\Link.ogg",
					["message"] = "",
				},
				["finish"] = {
				},
				["init"] = {
					["do_custom"] = false,
					["custom"] = "\n\n",
				},
			},
			["fontFlags"] = "THICKOUTLINE",
			["useTooltip"] = false,
			["animation"] = {
				["start"] = {
					["preset"] = "spiral",
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
			},
			["trigger"] = {
				["spellId"] = "241606",
				["duration"] = "2",
				["names"] = {
					"暗影映像：哀嚎", -- [1]
				},
				["subcount"] = true,
				["specificUnit"] = "boss1",
				["custom_hide"] = "timed",
				["type"] = "aura",
				["unevent"] = "timed",
				["subeventPrefix"] = "SPELL",
				["event"] = "Combat Log",
				["debuffType"] = "HELPFUL",
				["subeventSuffix"] = "_CAST_START",
				["use_spellId"] = true,
				["name"] = "波涛起伏",
				["spellIds"] = {
					236378, -- [1]
				},
				["use_specific_unit"] = false,
				["unit"] = "target",
				["use_unit"] = true,
				["fullscan"] = true,
			},
			["yOffset"] = 0,
			["text1Containment"] = "OUTSIDE",
			["parent"] = "萨格拉斯之墓 - 09#基尔加丹",
			["text1Point"] = "BOTTOM",
			["stacksPoint"] = "BOTTOM",
			["text2FontFlags"] = "THICKOUTLINE",
			["height"] = 100,
			["conditions"] = {
			},
			["load"] = {
				["use_never"] = false,
				["zone"] = "Hellfire Citadel",
				["encounterid"] = "2051",
				["use_encounterid"] = true,
				["role"] = {
					["single"] = "TANK",
					["multi"] = {
						["TANK"] = true,
					},
				},
				["size"] = {
					["single"] = "party",
					["multi"] = {
						["party"] = true,
					},
				},
				["talent2"] = {
					["multi"] = {
					},
				},
				["zoneId"] = "1147",
				["talent"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["use_zone"] = false,
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["use_level"] = false,
				["race"] = {
					["multi"] = {
					},
				},
				["faction"] = {
					["multi"] = {
					},
				},
				["use_zoneId"] = true,
			},
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["inverse"] = false,
			["fontSize"] = 15,
			["text2Containment"] = "OUTSIDE",
			["stickyDuration"] = false,
			["text1Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text2Font"] = "Friz Quadrata TT",
			["anchorFrameType"] = "SCREEN",
			["text1FontFlags"] = "THICKOUTLINE",
			["regionType"] = "icon",
			["frameStrata"] = 1,
			["text1Font"] = "Friz Quadrata TT",
			["text2FontSize"] = 20,
			["id"] = "波涛起伏",
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text1"] = "易伤: %s%",
			["zoom"] = 0,
			["stacksContainment"] = "OUTSIDE",
			["text2"] = "暗影",
			["auto"] = true,
			["desaturate"] = false,
			["additional_triggers"] = {
			},
			["xOffset"] = 0,
			["text2Enabled"] = true,
			["width"] = 100,
			["selfPoint"] = "CENTER",
			["text1Enabled"] = true,
			["numTriggers"] = 1,
			["icon"] = true,
			["displayIcon"] = 464119,
			["cooldown"] = true,
			["glow"] = false,
		},
		["Ring: Legendary"] = {
			["glow"] = false,
			["text1FontSize"] = 6,
			["cooldownTextEnabled"] = true,
			["untrigger"] = {
			},
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = 0,
			["customTextUpdate"] = "update",
			["icon"] = true,
			["text1Enabled"] = true,
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["type"] = "preset",
					["preset"] = "grow",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["preset"] = "pulse",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["preset"] = "fade",
					["type"] = "none",
				},
			},
			["trigger"] = {
				["type"] = "aura",
				["subeventSuffix"] = "_CAST_START",
				["event"] = "Health",
				["names"] = {
					"塞弗斯的秘密", -- [1]
				},
				["spellIds"] = {
					208052, -- [1]
				},
				["debuffType"] = "HELPFUL",
				["unit"] = "player",
				["subeventPrefix"] = "SPELL",
				["custom_hide"] = "timed",
			},
			["desaturate"] = false,
			["text1Point"] = "CENTER",
			["text2FontFlags"] = "OUTLINE",
			["height"] = 40,
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
				["class"] = {
					["single"] = "MAGE",
					["multi"] = {
						["MAGE"] = true,
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
				["spec"] = {
					["single"] = 2,
					["multi"] = {
						[2] = true,
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
				["size"] = {
					["multi"] = {
					},
				},
			},
			["yOffset"] = 0,
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["parent"] = "Buffs",
			["text2Containment"] = "INSIDE",
			["displayIcon"] = "Interface\\Icons\\Spell_Frost_ColdHearted",
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
			["text2Font"] = "Friz Quadrata TT",
			["text1Font"] = "Friz Quadrata TT",
			["text2FontSize"] = 24,
			["anchorFrameType"] = "SCREEN",
			["text2Enabled"] = false,
			["text1"] = "%c",
			["text2"] = "%p",
			["id"] = "Ring: Legendary",
			["zoom"] = 0.18,
			["auto"] = true,
			["text1FontFlags"] = "OUTLINE",
			["additional_triggers"] = {
			},
			["xOffset"] = 0,
			["frameStrata"] = 1,
			["width"] = 40,
			["stickyDuration"] = false,
			["text2Point"] = "CENTER",
			["inverse"] = false,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["cooldown"] = true,
			["selfPoint"] = "CENTER",
		},
		["ROP timer"] = {
			["glow"] = false,
			["text1FontSize"] = 6,
			["cooldownTextEnabled"] = true,
			["untrigger"] = {
			},
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = -10,
			["customTextUpdate"] = "update",
			["icon"] = true,
			["text1Enabled"] = true,
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["main"] = {
					["colorR"] = 1,
					["duration"] = "1",
					["colorA"] = 1,
					["colorG"] = 1,
					["type"] = "custom",
					["scaley"] = 1,
					["alpha"] = 0,
					["duration_type"] = "seconds",
					["y"] = 0,
					["x"] = 0,
					["colorType"] = "custom",
					["use_color"] = true,
					["colorFunc"] = "function(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n    \n    local red, green, blue = 1,1,1\n    \n    if UnitBuff(\"player\",GetSpellInfo(116014)) then \n        red, green, blue = 1,1,1\n    else\n        red, green, blue = 1,0,0\n    end \n    return red, green, blue, 1\nend\n\n\n\n\n\n\n\n\n",
					["rotate"] = 0,
					["scalex"] = 1,
					["colorB"] = 1,
				},
				["finish"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
			},
			["trigger"] = {
				["custom_hide"] = "timed",
				["type"] = "event",
				["spellId"] = "116011",
				["subeventSuffix"] = "_CAST_SUCCESS",
				["unit"] = "player",
				["duration"] = "10",
				["event"] = "Combat Log",
				["subeventPrefix"] = "SPELL",
				["unevent"] = "timed",
				["use_spellId"] = true,
				["name"] = "能量符文",
				["use_sourceUnit"] = true,
				["spellIds"] = {
				},
				["names"] = {
				},
				["sourceUnit"] = "player",
				["debuffType"] = "HELPFUL",
			},
			["desaturate"] = false,
			["text1Point"] = "CENTER",
			["text2FontFlags"] = "OUTLINE",
			["height"] = 40,
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["load"] = {
				["talent2"] = {
					["multi"] = {
					},
				},
				["use_never"] = false,
				["talent"] = {
					["single"] = 8,
					["multi"] = {
					},
				},
				["class"] = {
					["single"] = "MAGE",
					["multi"] = {
					},
				},
				["spec"] = {
					["single"] = 3,
					["multi"] = {
						[3] = true,
					},
				},
				["use_talent"] = true,
				["use_class"] = true,
				["role"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
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
				["race"] = {
					["multi"] = {
					},
				},
				["use_petbattle"] = false,
				["size"] = {
					["multi"] = {
					},
				},
			},
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["displayIcon"] = 609815,
			["selfPoint"] = "CENTER",
			["text2Containment"] = "INSIDE",
			["yOffset"] = -83,
			["text1Font"] = "Expressway",
			["numTriggers"] = 1,
			["xOffset"] = 104,
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["regionType"] = "icon",
			["text1Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["width"] = 40,
			["text2FontSize"] = 24,
			["text2Enabled"] = false,
			["text1FontFlags"] = "OUTLINE",
			["text1"] = "%s",
			["id"] = "ROP timer",
			["text1Containment"] = "INSIDE",
			["zoom"] = 0.18,
			["auto"] = true,
			["text2"] = "%p",
			["additional_triggers"] = {
			},
			["disjunctive"] = "all",
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["text2Font"] = "Friz Quadrata TT",
			["stickyDuration"] = false,
			["inverse"] = false,
			["text2Point"] = "CENTER",
			["conditions"] = {
			},
			["cooldown"] = true,
			["parent"] = "Buffs",
		},
		["邪爪 - buff"] = {
			["text2Point"] = "TOP",
			["text1FontSize"] = 22,
			["cooldownTextEnabled"] = true,
			["customText"] = "\n\n",
			["untrigger"] = {
			},
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = 0,
			["customTextUpdate"] = "event",
			["actions"] = {
				["start"] = {
					["do_glow"] = false,
					["do_sound"] = false,
					["do_message"] = false,
					["glow_frame"] = "WeakAuras:Artillery",
					["message_type"] = "SAY",
					["glow_action"] = "show",
					["sound"] = "Interface\\AddOns\\Prat-3.0\\Sounds\\Link.ogg",
					["message"] = "",
				},
				["finish"] = {
				},
				["init"] = {
					["do_custom"] = false,
					["custom"] = "\n\n",
				},
			},
			["fontFlags"] = "THICKOUTLINE",
			["useTooltip"] = false,
			["animation"] = {
				["start"] = {
					["preset"] = "spiral",
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
			},
			["trigger"] = {
				["spellId"] = "239932",
				["duration"] = "2",
				["names"] = {
					"邪爪", -- [1]
				},
				["specificUnit"] = "boss1",
				["custom_hide"] = "timed",
				["type"] = "aura",
				["subeventSuffix"] = "_CAST_START",
				["event"] = "Combat Log",
				["subeventPrefix"] = "SPELL",
				["debuffType"] = "HELPFUL",
				["use_spellId"] = true,
				["spellIds"] = {
					239932, -- [1]
				},
				["unevent"] = "timed",
				["unit"] = "member",
				["use_specific_unit"] = true,
				["name"] = "邪爪",
				["use_unit"] = true,
			},
			["parent"] = "萨格拉斯之墓 - 09#基尔加丹",
			["text1Containment"] = "OUTSIDE",
			["yOffset"] = 0,
			["text1Point"] = "BOTTOM",
			["stacksPoint"] = "BOTTOM",
			["text2FontFlags"] = "THICKOUTLINE",
			["height"] = 100,
			["conditions"] = {
			},
			["load"] = {
				["use_never"] = false,
				["zone"] = "Hellfire Citadel",
				["encounterid"] = "2051",
				["use_encounterid"] = true,
				["use_zoneId"] = true,
				["size"] = {
					["single"] = "party",
					["multi"] = {
						["party"] = true,
					},
				},
				["talent2"] = {
					["multi"] = {
					},
				},
				["use_level"] = false,
				["talent"] = {
					["multi"] = {
					},
				},
				["use_role"] = true,
				["spec"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["use_zone"] = false,
				["faction"] = {
					["multi"] = {
					},
				},
				["role"] = {
					["single"] = "TANK",
					["multi"] = {
						["TANK"] = true,
					},
				},
				["zoneId"] = "1147",
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
			},
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["inverse"] = false,
			["fontSize"] = 15,
			["text2Containment"] = "OUTSIDE",
			["stickyDuration"] = false,
			["text1Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text2Font"] = "Friz Quadrata TT",
			["anchorFrameType"] = "SCREEN",
			["text1FontFlags"] = "THICKOUTLINE",
			["regionType"] = "icon",
			["frameStrata"] = 1,
			["text1Font"] = "Friz Quadrata TT",
			["text2FontSize"] = 24,
			["additional_triggers"] = {
			},
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text1"] = "增强",
			["zoom"] = 0,
			["stacksContainment"] = "OUTSIDE",
			["text2"] = "BOSS",
			["auto"] = true,
			["desaturate"] = false,
			["id"] = "邪爪 - buff",
			["xOffset"] = 0,
			["text2Enabled"] = true,
			["width"] = 100,
			["selfPoint"] = "CENTER",
			["text1Enabled"] = true,
			["numTriggers"] = 1,
			["icon"] = true,
			["displayIcon"] = 464119,
			["cooldown"] = true,
			["glow"] = false,
		},
		["多头蛇酸液 - 分担"] = {
			["text2Point"] = "TOP",
			["text1FontSize"] = 22,
			["cooldownTextEnabled"] = true,
			["customText"] = "\n\n",
			["untrigger"] = {
			},
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = 0,
			["customTextUpdate"] = "event",
			["actions"] = {
				["start"] = {
					["do_glow"] = false,
					["message"] = "",
					["sound"] = "Interface\\AddOns\\Prat-3.0\\Sounds\\Link.ogg",
					["glow_frame"] = "WeakAuras:Artillery",
					["message_type"] = "SAY",
					["glow_action"] = "show",
					["do_message"] = false,
					["do_sound"] = false,
				},
				["finish"] = {
				},
				["init"] = {
					["do_custom"] = false,
					["custom"] = "\n\n",
				},
			},
			["fontFlags"] = "THICKOUTLINE",
			["useTooltip"] = false,
			["animation"] = {
				["start"] = {
					["preset"] = "spiral",
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
			},
			["trigger"] = {
				["spellId"] = "230139",
				["duration"] = "2",
				["names"] = {
					"多头蛇射击", -- [1]
				},
				["subcount"] = true,
				["group_count"] = "0",
				["group_countOperator"] = ">",
				["type"] = "aura",
				["unevent"] = "timed",
				["subeventPrefix"] = "SPELL",
				["event"] = "Combat Log",
				["subeventSuffix"] = "_CAST_START",
				["custom_hide"] = "timed",
				["use_spellId"] = true,
				["name"] = "多头蛇射击",
				["use_specific_unit"] = false,
				["spellIds"] = {
					230139, -- [1]
				},
				["unit"] = "group",
				["use_unit"] = true,
				["debuffType"] = "HARMFUL",
			},
			["parent"] = "萨格拉斯之墓 - 04#主母萨丝琳",
			["text1Containment"] = "OUTSIDE",
			["yOffset"] = 0,
			["text1Point"] = "BOTTOM",
			["cooldown"] = true,
			["text2FontFlags"] = "THICKOUTLINE",
			["height"] = 100,
			["conditions"] = {
			},
			["load"] = {
				["use_never"] = false,
				["zone"] = "Hellfire Citadel",
				["encounterid"] = "2037",
				["use_encounterid"] = true,
				["role"] = {
					["single"] = "TANK",
					["multi"] = {
						["TANK"] = true,
					},
				},
				["size"] = {
					["single"] = "party",
					["multi"] = {
						["party"] = true,
					},
				},
				["talent2"] = {
					["multi"] = {
					},
				},
				["zoneId"] = "1147",
				["talent"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["use_level"] = false,
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["use_zone"] = false,
				["faction"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["use_zoneId"] = true,
			},
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["inverse"] = false,
			["fontSize"] = 15,
			["text2Containment"] = "OUTSIDE",
			["stickyDuration"] = false,
			["text1Color"] = {
				0, -- [1]
				1, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["text2Font"] = "Friz Quadrata TT",
			["anchorFrameType"] = "SCREEN",
			["text1FontFlags"] = "THICKOUTLINE",
			["regionType"] = "icon",
			["frameStrata"] = 1,
			["selfPoint"] = "CENTER",
			["text2FontSize"] = 20,
			["additional_triggers"] = {
				{
					["trigger"] = {
						["type"] = "aura",
						["subeventSuffix"] = "_CAST_START",
						["event"] = "Health",
						["subeventPrefix"] = "SPELL",
						["spellIds"] = {
							232754, -- [1]
						},
						["debuffType"] = "HARMFUL",
						["unit"] = "player",
						["names"] = {
							"多头蛇酸液", -- [1]
						},
						["inverse"] = true,
						["custom_hide"] = "timed",
					},
					["untrigger"] = {
					},
				}, -- [1]
				{
					["trigger"] = {
						["type"] = "aura",
						["subeventSuffix"] = "_CAST_START",
						["event"] = "Health",
						["subeventPrefix"] = "SPELL",
						["spellIds"] = {
							230201, -- [1]
						},
						["debuffType"] = "HARMFUL",
						["unit"] = "player",
						["names"] = {
							"痛苦负担", -- [1]
						},
						["inverse"] = true,
						["custom_hide"] = "timed",
					},
					["untrigger"] = {
					},
				}, -- [2]
			},
			["xOffset"] = 0,
			["text1"] = "分担",
			["zoom"] = 0,
			["stacksContainment"] = "OUTSIDE",
			["text2"] = "%p",
			["auto"] = false,
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["id"] = "多头蛇酸液 - 分担",
			["text1Font"] = "Friz Quadrata TT",
			["text2Enabled"] = false,
			["width"] = 100,
			["desaturate"] = false,
			["text1Enabled"] = true,
			["numTriggers"] = 3,
			["icon"] = true,
			["displayIcon"] = "132107",
			["stacksPoint"] = "BOTTOM",
			["glow"] = false,
		},
		["伊利丹的无目凝视"] = {
			["text2Point"] = "TOP",
			["text1FontSize"] = 32,
			["cooldownTextEnabled"] = true,
			["customText"] = "function()\n    for i=1, 40, 1 do\n        local i_spellID = select(11, UnitDebuff(aura_env.unitID,i))\n        if i_spellID and i_spellID==aura_env.spellID then\n            local tooltipSize = select(3, WeakAuras.GetAuraTooltipInfo(aura_env.unitID, i, aura_env.filter))\n            return aura_env.shortenNumber(tooltipSize) or aura_env.alternativeText\n        end\n    end    \n    return aura_env.alternativeText\nend",
			["untrigger"] = {
			},
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = 0,
			["customTextUpdate"] = "event",
			["actions"] = {
				["start"] = {
					["do_glow"] = false,
					["message"] = "",
					["sound"] = "Interface\\AddOns\\Prat-3.0\\Sounds\\Link.ogg",
					["do_sound"] = false,
					["message_type"] = "SAY",
					["glow_action"] = "show",
					["do_message"] = false,
					["glow_frame"] = "WeakAuras:Artillery",
				},
				["finish"] = {
				},
				["init"] = {
					["do_custom"] = true,
					["custom"] = "aura_env.spellID = 241721 -- Change to whatever debuff you want to keep track\naura_env.unitID = \"player\"\naura_env.filter = \"harmful\"\naura_env.alternativeText = \"DOT\"\n\naura_env.shortenNumber = function(number)\n    if type(number) ~= \"number\" then\n        number = tonumber(number)\n    end\n    if not number then\n        return\n    end\n    \n    local affixes = {\n        \"\",\n        \"K\",\n        \"M\",\n        \"B\",\n    }\n    \n    local affix = 1\n    local dec = 0\n    local num1 = math.abs(number)\n    while num1 >= 1000 and affix < #affixes do\n        num1 = num1 / 1000\n        affix = affix + 1\n    end\n    if affix > 1 then\n        dec = 2\n        local num2 = num1\n        while num2 >= 10 do\n            num2 = num2 / 10\n            dec = dec - 1\n        end\n    end\n    if number < 0 then\n        num1 = -num1\n    end\n    \n    return string.format(\"%.\"..dec..\"f\"..affixes[affix], num1)\nend",
				},
			},
			["fontFlags"] = "THICKOUTLINE",
			["useTooltip"] = false,
			["animation"] = {
				["start"] = {
					["preset"] = "spiral",
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
			},
			["trigger"] = {
				["debuffType"] = "HARMFUL",
				["type"] = "aura",
				["spellId"] = "241721",
				["unevent"] = "timed",
				["subeventPrefix"] = "SPELL",
				["duration"] = "2",
				["event"] = "Combat Log",
				["use_unit"] = true,
				["unit"] = "player",
				["use_spellId"] = true,
				["name"] = "伊利丹的无目凝视",
				["subeventSuffix"] = "_CAST_START",
				["custom_hide"] = "timed",
				["spellIds"] = {
					200084, -- [1]
				},
				["names"] = {
					"灵魂之刃", -- [1]
				},
				["fullscan"] = true,
			},
			["parent"] = "萨格拉斯之墓 - 09#基尔加丹",
			["text1Containment"] = "OUTSIDE",
			["yOffset"] = 0,
			["text1Point"] = "BOTTOM",
			["cooldown"] = true,
			["text2FontFlags"] = "THICKOUTLINE",
			["height"] = 100,
			["conditions"] = {
			},
			["load"] = {
				["use_never"] = false,
				["zone"] = "Hellfire Citadel",
				["encounterid"] = "2051",
				["use_encounterid"] = true,
				["role"] = {
					["single"] = "TANK",
					["multi"] = {
						["TANK"] = true,
					},
				},
				["size"] = {
					["single"] = "party",
					["multi"] = {
						["party"] = true,
					},
				},
				["talent2"] = {
					["multi"] = {
					},
				},
				["zoneId"] = "1147",
				["talent"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["use_level"] = false,
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["use_zone"] = false,
				["faction"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["use_zoneId"] = true,
			},
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["inverse"] = false,
			["fontSize"] = 15,
			["text2Containment"] = "OUTSIDE",
			["stickyDuration"] = false,
			["text1Color"] = {
				0, -- [1]
				0.701960784313726, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text2Font"] = "Friz Quadrata TT",
			["anchorFrameType"] = "SCREEN",
			["text1FontFlags"] = "THICKOUTLINE",
			["regionType"] = "icon",
			["frameStrata"] = 1,
			["text1Font"] = "Friz Quadrata TT",
			["text2FontSize"] = 24,
			["additional_triggers"] = {
			},
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text1"] = "%c",
			["zoom"] = 0,
			["stacksContainment"] = "OUTSIDE",
			["text2"] = "获得视觉",
			["auto"] = true,
			["desaturate"] = false,
			["id"] = "伊利丹的无目凝视",
			["xOffset"] = 0,
			["text2Enabled"] = true,
			["width"] = 100,
			["selfPoint"] = "CENTER",
			["text1Enabled"] = true,
			["numTriggers"] = 1,
			["icon"] = true,
			["displayIcon"] = 464119,
			["stacksPoint"] = "BOTTOM",
			["glow"] = false,
		},
		["Whisper in the dark-debuff"] = {
			["glow"] = false,
			["text1FontSize"] = 6,
			["cooldownTextEnabled"] = true,
			["untrigger"] = {
			},
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = 0,
			["customTextUpdate"] = "update",
			["icon"] = true,
			["text1Enabled"] = true,
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["preset"] = "grow",
					["type"] = "preset",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["preset"] = "pulse",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["preset"] = "fade",
					["type"] = "none",
				},
			},
			["trigger"] = {
				["type"] = "aura",
				["subeventSuffix"] = "_CAST_START",
				["event"] = "Health",
				["names"] = {
					"邪罪契约", -- [1]
				},
				["spellIds"] = {
					225774, -- [1]
				},
				["debuffType"] = "HELPFUL",
				["unit"] = "player",
				["subeventPrefix"] = "SPELL",
				["custom_hide"] = "timed",
			},
			["desaturate"] = false,
			["text1Point"] = "CENTER",
			["text2FontFlags"] = "OUTLINE",
			["height"] = 40,
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
				["spec"] = {
					["single"] = 2,
					["multi"] = {
						[2] = true,
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
				["class"] = {
					["single"] = "MAGE",
					["multi"] = {
						["MAGE"] = true,
					},
				},
				["faction"] = {
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
			["yOffset"] = 0,
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["parent"] = "Buffs",
			["text2Containment"] = "INSIDE",
			["displayIcon"] = "Interface\\Icons\\Spell_Frost_ColdHearted",
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
			["text2Font"] = "Friz Quadrata TT",
			["text1Font"] = "Friz Quadrata TT",
			["text2FontSize"] = 24,
			["anchorFrameType"] = "SCREEN",
			["text2Enabled"] = false,
			["text1"] = "%c",
			["text2"] = "%p",
			["id"] = "Whisper in the dark-debuff",
			["zoom"] = 0.18,
			["auto"] = true,
			["text1FontFlags"] = "OUTLINE",
			["additional_triggers"] = {
			},
			["xOffset"] = 0,
			["frameStrata"] = 1,
			["width"] = 40,
			["stickyDuration"] = false,
			["text2Point"] = "CENTER",
			["inverse"] = false,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["cooldown"] = true,
			["selfPoint"] = "CENTER",
		},
		["饰品冷却"] = {
			["backdropColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0.5, -- [4]
			},
			["controlledChildren"] = {
				"饰品1就绪", -- [1]
				"饰品1冷却", -- [2]
				"饰品2就绪", -- [3]
				"饰品2冷却", -- [4]
			},
			["borderBackdrop"] = "Blizzard Tooltip",
			["disjunctive"] = "all",
			["border"] = false,
			["untrigger"] = {
			},
			["regionType"] = "group",
			["borderSize"] = 16,
			["activeTriggerMode"] = -10,
			["expanded"] = false,
			["xOffset"] = -457.231018066406,
			["borderEdge"] = "None",
			["borderOffset"] = 5,
			["anchorPoint"] = "CENTER",
			["selfPoint"] = "BOTTOMLEFT",
			["id"] = "饰品冷却",
			["actions"] = {
				["start"] = {
				},
				["init"] = {
				},
				["finish"] = {
				},
			},
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["trigger"] = {
				["subeventPrefix"] = "SPELL",
				["type"] = "aura",
				["spellIds"] = {
				},
				["subeventSuffix"] = "_CAST_START",
				["debuffType"] = "HELPFUL",
				["names"] = {
				},
				["event"] = "Health",
				["unit"] = "player",
			},
			["borderInset"] = 11,
			["numTriggers"] = 1,
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
			},
			["borderColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0.5, -- [4]
			},
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
					["multi"] = {
					},
				},
				["use_class"] = false,
				["role"] = {
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
				["spec"] = {
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
				["size"] = {
					["multi"] = {
					},
				},
			},
			["yOffset"] = -81.3760681152344,
		},
		["爆发"] = {
			["text2Point"] = "TOP",
			["text1FontSize"] = 20,
			["cooldownTextEnabled"] = true,
			["customText"] = "function()\n    return \"小怪增强\"\nend\n\n\n\n",
			["untrigger"] = {
			},
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = 0,
			["customTextUpdate"] = "update",
			["actions"] = {
				["start"] = {
					["do_glow"] = false,
					["message"] = "",
					["sound"] = "Interface\\AddOns\\Prat-3.0\\Sounds\\Link.ogg",
					["glow_frame"] = "WeakAuras:Artillery",
					["message_type"] = "SAY",
					["glow_action"] = "show",
					["do_message"] = false,
					["do_sound"] = false,
				},
				["finish"] = {
				},
				["init"] = {
					["do_custom"] = false,
					["custom"] = "\n\n",
				},
			},
			["fontFlags"] = "THICKOUTLINE",
			["useTooltip"] = false,
			["animation"] = {
				["start"] = {
					["preset"] = "spiral",
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
			},
			["trigger"] = {
				["spellId"] = "235974",
				["duration"] = "2",
				["use_unit"] = true,
				["subcount"] = true,
				["specificUnit"] = "boss1",
				["custom_hide"] = "timed",
				["type"] = "aura",
				["unevent"] = "timed",
				["subeventPrefix"] = "SPELL",
				["event"] = "Combat Log",
				["debuffType"] = "HELPFUL",
				["subeventSuffix"] = "_CAST_START",
				["use_spellId"] = true,
				["name"] = "爆发",
				["use_specific_unit"] = false,
				["unit"] = "target",
				["spellIds"] = {
					236378, -- [1]
				},
				["names"] = {
					"暗影映像：哀嚎", -- [1]
				},
				["fullscan"] = true,
			},
			["yOffset"] = 0,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text1Containment"] = "OUTSIDE",
			["cooldown"] = true,
			["text1Point"] = "BOTTOM",
			["conditions"] = {
			},
			["text2FontFlags"] = "THICKOUTLINE",
			["height"] = 100,
			["stickyDuration"] = false,
			["load"] = {
				["use_never"] = false,
				["zone"] = "Hellfire Citadel",
				["encounterid"] = "2051",
				["use_encounterid"] = true,
				["race"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["single"] = "party",
					["multi"] = {
						["party"] = true,
					},
				},
				["talent2"] = {
					["multi"] = {
					},
				},
				["zoneId"] = "1147",
				["talent"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["use_level"] = false,
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["use_zone"] = false,
				["faction"] = {
					["multi"] = {
					},
				},
				["use_zoneId"] = true,
				["role"] = {
					["single"] = "TANK",
					["multi"] = {
						["TANK"] = true,
					},
				},
			},
			["inverse"] = false,
			["text2Font"] = "Friz Quadrata TT",
			["fontSize"] = 15,
			["text2Containment"] = "OUTSIDE",
			["desaturate"] = false,
			["text1Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["anchorFrameType"] = "SCREEN",
			["frameStrata"] = 1,
			["text1FontFlags"] = "THICKOUTLINE",
			["regionType"] = "icon",
			["xOffset"] = 0,
			["additional_triggers"] = {
			},
			["text2FontSize"] = 22,
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["init_completed"] = 1,
			["text1"] = "加成: %s%",
			["zoom"] = 0,
			["stacksContainment"] = "OUTSIDE",
			["text2"] = "%c",
			["auto"] = true,
			["selfPoint"] = "CENTER",
			["id"] = "爆发",
			["text1Font"] = "Friz Quadrata TT",
			["text2Enabled"] = true,
			["width"] = 100,
			["text1Enabled"] = true,
			["icon"] = true,
			["numTriggers"] = 1,
			["glow"] = false,
			["displayIcon"] = 464119,
			["stacksPoint"] = "BOTTOM",
			["parent"] = "萨格拉斯之墓 - 09#基尔加丹",
		},
		["千魂之暗 - debuff"] = {
			["text2Point"] = "BOTTOM",
			["text1FontSize"] = 32,
			["cooldownTextEnabled"] = true,
			["customText"] = "function()\n    for i=1, 40, 1 do\n        local i_spellID = select(11, UnitDebuff(aura_env.unitID,i))\n        if i_spellID and i_spellID==aura_env.spellID then\n            local tooltipSize = select(3, WeakAuras.GetAuraTooltipInfo(aura_env.unitID, i, aura_env.filter))\n            return aura_env.shortenNumber(tooltipSize) or aura_env.alternativeText\n        end\n    end    \n    return aura_env.alternativeText\nend",
			["untrigger"] = {
			},
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = 0,
			["customTextUpdate"] = "event",
			["actions"] = {
				["start"] = {
					["do_glow"] = false,
					["message"] = "",
					["sound"] = "Interface\\AddOns\\Prat-3.0\\Sounds\\Link.ogg",
					["do_sound"] = false,
					["message_type"] = "SAY",
					["glow_action"] = "show",
					["do_message"] = false,
					["glow_frame"] = "WeakAuras:Artillery",
				},
				["finish"] = {
				},
				["init"] = {
					["do_custom"] = true,
					["custom"] = "aura_env.spellID = 239216 -- Change to whatever debuff you want to keep track\naura_env.unitID = \"player\"\naura_env.filter = \"harmful\"\naura_env.alternativeText = \"DOT\"\n\naura_env.shortenNumber = function(number)\n    if type(number) ~= \"number\" then\n        number = tonumber(number)\n    end\n    if not number then\n        return\n    end\n    \n    local affixes = {\n        \"\",\n        \"K\",\n        \"M\",\n        \"B\",\n    }\n    \n    local affix = 1\n    local dec = 0\n    local num1 = math.abs(number)\n    while num1 >= 1000 and affix < #affixes do\n        num1 = num1 / 1000\n        affix = affix + 1\n    end\n    if affix > 1 then\n        dec = 2\n        local num2 = num1\n        while num2 >= 10 do\n            num2 = num2 / 10\n            dec = dec - 1\n        end\n    end\n    if number < 0 then\n        num1 = -num1\n    end\n    \n    return string.format(\"%.\"..dec..\"f\"..affixes[affix], num1)\nend",
				},
			},
			["fontFlags"] = "THICKOUTLINE",
			["useTooltip"] = false,
			["animation"] = {
				["start"] = {
					["preset"] = "spiral",
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
			},
			["trigger"] = {
				["debuffType"] = "HARMFUL",
				["type"] = "aura",
				["spellId"] = "239216",
				["unevent"] = "timed",
				["subeventPrefix"] = "SPELL",
				["duration"] = "2",
				["event"] = "Combat Log",
				["use_unit"] = true,
				["unit"] = "player",
				["use_spellId"] = true,
				["name"] = "千魂之暗",
				["subeventSuffix"] = "_CAST_START",
				["custom_hide"] = "timed",
				["spellIds"] = {
					200084, -- [1]
				},
				["names"] = {
					"灵魂之刃", -- [1]
				},
				["fullscan"] = true,
			},
			["parent"] = "萨格拉斯之墓 - 09#基尔加丹",
			["text1Containment"] = "OUTSIDE",
			["yOffset"] = 0,
			["text1Point"] = "TOP",
			["cooldown"] = true,
			["text2FontFlags"] = "THICKOUTLINE",
			["height"] = 100,
			["conditions"] = {
			},
			["load"] = {
				["use_never"] = false,
				["zone"] = "Hellfire Citadel",
				["encounterid"] = "2051",
				["use_encounterid"] = true,
				["role"] = {
					["single"] = "TANK",
					["multi"] = {
						["TANK"] = true,
					},
				},
				["size"] = {
					["single"] = "party",
					["multi"] = {
						["party"] = true,
					},
				},
				["talent2"] = {
					["multi"] = {
					},
				},
				["zoneId"] = "1147",
				["talent"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["use_level"] = false,
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["use_zone"] = false,
				["faction"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["use_zoneId"] = true,
			},
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["inverse"] = false,
			["fontSize"] = 15,
			["text2Containment"] = "OUTSIDE",
			["stickyDuration"] = false,
			["text1Color"] = {
				0, -- [1]
				0.701960784313726, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text2Font"] = "Friz Quadrata TT",
			["anchorFrameType"] = "SCREEN",
			["text1FontFlags"] = "THICKOUTLINE",
			["regionType"] = "icon",
			["frameStrata"] = 1,
			["selfPoint"] = "CENTER",
			["text2FontSize"] = 20,
			["additional_triggers"] = {
			},
			["xOffset"] = 0,
			["text1"] = "%c",
			["zoom"] = 0,
			["stacksContainment"] = "OUTSIDE",
			["text2"] = "CLEANSE",
			["auto"] = true,
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["id"] = "千魂之暗 - debuff",
			["text1Font"] = "Friz Quadrata TT",
			["text2Enabled"] = false,
			["width"] = 100,
			["desaturate"] = false,
			["text1Enabled"] = true,
			["numTriggers"] = 1,
			["icon"] = true,
			["displayIcon"] = 464119,
			["stacksPoint"] = "BOTTOM",
			["glow"] = false,
		},
		["深渊巨喉"] = {
			["glow"] = false,
			["text1FontSize"] = 32,
			["cooldownTextEnabled"] = true,
			["customText"] = "function()\n    for i=1, 40, 1 do\n        local i_spellID = select(11, UnitDebuff(aura_env.unitID,i))\n        if i_spellID and i_spellID==aura_env.spellID then\n            local tooltipSize = select(3, WeakAuras.GetAuraTooltipInfo(aura_env.unitID, i, aura_env.filter))\n            return aura_env.shortenNumber(tooltipSize) or aura_env.alternativeText\n        end\n    end    \n    return aura_env.alternativeText\nend",
			["untrigger"] = {
			},
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = 0,
			["customTextUpdate"] = "event",
			["actions"] = {
				["start"] = {
					["do_glow"] = false,
					["message"] = "",
					["sound"] = "Interface\\AddOns\\Prat-3.0\\Sounds\\Link.ogg",
					["glow_frame"] = "WeakAuras:Artillery",
					["message_type"] = "SAY",
					["glow_action"] = "show",
					["do_message"] = false,
					["do_sound"] = false,
				},
				["finish"] = {
				},
				["init"] = {
					["do_custom"] = true,
					["custom"] = "aura_env.spellID = 230276 -- Change to whatever debuff you want to keep track\naura_env.unitID = \"player\"\naura_env.filter = \"harmful\"\naura_env.alternativeText = \"DOT\"\n\naura_env.shortenNumber = function(number)\n    if type(number) ~= \"number\" then\n        number = tonumber(number)\n    end\n    if not number then\n        return\n    end\n    \n    local affixes = {\n        \"\",\n        \"K\",\n        \"M\",\n        \"B\",\n    }\n    \n    local affix = 1\n    local dec = 0\n    local num1 = math.abs(number)\n    while num1 >= 1000 and affix < #affixes do\n        num1 = num1 / 1000\n        affix = affix + 1\n    end\n    if affix > 1 then\n        dec = 2\n        local num2 = num1\n        while num2 >= 10 do\n            num2 = num2 / 10\n            dec = dec - 1\n        end\n    end\n    if number < 0 then\n        num1 = -num1\n    end\n    \n    return string.format(\"%.\"..dec..\"f\"..affixes[affix], num1)\nend",
				},
			},
			["fontFlags"] = "THICKOUTLINE",
			["useTooltip"] = false,
			["animation"] = {
				["start"] = {
					["preset"] = "spiral",
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
			},
			["trigger"] = {
				["debuffType"] = "HARMFUL",
				["type"] = "aura",
				["spellId"] = "230276",
				["unevent"] = "timed",
				["use_unit"] = true,
				["duration"] = "2",
				["event"] = "Combat Log",
				["names"] = {
					"灵魂之刃", -- [1]
				},
				["unit"] = "player",
				["use_spellId"] = true,
				["spellIds"] = {
					200084, -- [1]
				},
				["subeventSuffix"] = "_CAST_START",
				["custom_hide"] = "timed",
				["name"] = "深渊巨喉",
				["subeventPrefix"] = "SPELL",
				["fullscan"] = true,
			},
			["parent"] = "萨格拉斯之墓 - 04#主母萨丝琳",
			["text1Containment"] = "OUTSIDE",
			["yOffset"] = 0,
			["text1Point"] = "BOTTOM",
			["cooldown"] = true,
			["text2FontFlags"] = "THICKOUTLINE",
			["height"] = 100,
			["conditions"] = {
			},
			["load"] = {
				["use_never"] = false,
				["zone"] = "Hellfire Citadel",
				["encounterid"] = "2037",
				["use_encounterid"] = true,
				["role"] = {
					["single"] = "TANK",
					["multi"] = {
						["TANK"] = true,
					},
				},
				["size"] = {
					["single"] = "party",
					["multi"] = {
						["party"] = true,
					},
				},
				["talent2"] = {
					["multi"] = {
					},
				},
				["zoneId"] = "1147",
				["talent"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["use_level"] = false,
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["use_zone"] = false,
				["faction"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["use_zoneId"] = true,
			},
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["inverse"] = false,
			["fontSize"] = 15,
			["text2Containment"] = "OUTSIDE",
			["stickyDuration"] = false,
			["text1Color"] = {
				0, -- [1]
				0.701960784313726, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text2Font"] = "Friz Quadrata TT",
			["anchorFrameType"] = "SCREEN",
			["text1FontFlags"] = "THICKOUTLINE",
			["regionType"] = "icon",
			["frameStrata"] = 1,
			["selfPoint"] = "CENTER",
			["text2FontSize"] = 22,
			["additional_triggers"] = {
			},
			["text1Font"] = "Friz Quadrata TT",
			["text1"] = "%c",
			["zoom"] = 0,
			["stacksContainment"] = "OUTSIDE",
			["text2"] = "%p",
			["auto"] = true,
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["id"] = "深渊巨喉",
			["xOffset"] = 0,
			["text2Enabled"] = false,
			["width"] = 100,
			["desaturate"] = false,
			["text1Enabled"] = true,
			["numTriggers"] = 1,
			["icon"] = true,
			["displayIcon"] = "132107",
			["stacksPoint"] = "BOTTOM",
			["text2Point"] = "BOTTOM",
		},
		["Frost: Icy Veins Buff"] = {
			["glow"] = false,
			["text1FontSize"] = 6,
			["cooldownTextEnabled"] = true,
			["untrigger"] = {
			},
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = 0,
			["customTextUpdate"] = "update",
			["icon"] = true,
			["text1Enabled"] = true,
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["type"] = "preset",
					["preset"] = "grow",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["preset"] = "pulse",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["preset"] = "fade",
					["type"] = "none",
				},
			},
			["trigger"] = {
				["type"] = "aura",
				["subeventSuffix"] = "_CAST_START",
				["event"] = "Health",
				["names"] = {
					"冰冷血脉", -- [1]
				},
				["spellIds"] = {
					12472, -- [1]
				},
				["debuffType"] = "HELPFUL",
				["unit"] = "player",
				["subeventPrefix"] = "SPELL",
				["custom_hide"] = "timed",
			},
			["desaturate"] = false,
			["text1Point"] = "CENTER",
			["text2FontFlags"] = "OUTLINE",
			["height"] = 40,
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
				["spec"] = {
					["single"] = 3,
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
				["class"] = {
					["single"] = "MAGE",
					["multi"] = {
						["MAGE"] = true,
					},
				},
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["use_spec"] = true,
				["role"] = {
					["multi"] = {
					},
				},
				["faction"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["yOffset"] = 0,
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["parent"] = "Buffs",
			["text2Containment"] = "INSIDE",
			["displayIcon"] = "Interface\\Icons\\Spell_Frost_ColdHearted",
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
			["text2Font"] = "Friz Quadrata TT",
			["text1Font"] = "Friz Quadrata TT",
			["text2FontSize"] = 24,
			["anchorFrameType"] = "SCREEN",
			["text2Enabled"] = false,
			["text1"] = "%c",
			["text2"] = "%p",
			["id"] = "Frost: Icy Veins Buff",
			["zoom"] = 0.18,
			["auto"] = false,
			["text1FontFlags"] = "OUTLINE",
			["additional_triggers"] = {
			},
			["xOffset"] = 0,
			["frameStrata"] = 1,
			["width"] = 40,
			["stickyDuration"] = false,
			["text2Point"] = "CENTER",
			["inverse"] = false,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["init_started"] = 1,
			["conditions"] = {
			},
			["cooldown"] = true,
			["selfPoint"] = "CENTER",
		},
		["美味增益鱼:dps"] = {
			["glow"] = false,
			["text1FontSize"] = 18,
			["cooldownTextEnabled"] = true,
			["customText"] = "function()\n    return \"ADD\\nBUFFED\"\nend\n\n\n\n\n\n",
			["untrigger"] = {
			},
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = 0,
			["customTextUpdate"] = "update",
			["actions"] = {
				["start"] = {
					["do_glow"] = false,
					["do_sound"] = false,
					["do_message"] = false,
					["glow_frame"] = "WeakAuras:Artillery",
					["message_type"] = "SAY",
					["glow_action"] = "show",
					["sound"] = "Interface\\AddOns\\Prat-3.0\\Sounds\\Link.ogg",
					["message"] = "",
				},
				["finish"] = {
				},
				["init"] = {
					["do_custom"] = false,
					["custom"] = "\n\n",
				},
			},
			["fontFlags"] = "THICKOUTLINE",
			["useTooltip"] = false,
			["animation"] = {
				["start"] = {
					["preset"] = "spiral",
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
			},
			["trigger"] = {
				["spellId"] = "239375",
				["duration"] = "2",
				["names"] = {
					"鱼人饲料", -- [1]
				},
				["subcount"] = true,
				["debuffType"] = "HARMFUL",
				["type"] = "aura",
				["unevent"] = "timed",
				["subeventPrefix"] = "SPELL",
				["event"] = "Combat Log",
				["subeventSuffix"] = "_CAST_START",
				["unit"] = "player",
				["use_spellId"] = true,
				["name"] = "美味的增益鱼",
				["use_specific_unit"] = false,
				["use_unit"] = true,
				["spellIds"] = {
					242945, -- [1]
				},
				["custom_hide"] = "timed",
				["fullscan"] = true,
			},
			["text2Point"] = "BOTTOM",
			["text1Containment"] = "OUTSIDE",
			["parent"] = "萨格拉斯之墓 - 04#主母萨丝琳",
			["text1Point"] = "BOTTOM",
			["stacksPoint"] = "BOTTOM",
			["text2FontFlags"] = "THICKOUTLINE",
			["height"] = 100,
			["conditions"] = {
			},
			["load"] = {
				["use_never"] = false,
				["zone"] = "Hellfire Citadel",
				["encounterid"] = "2037",
				["use_encounterid"] = true,
				["race"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["single"] = "party",
					["multi"] = {
						["party"] = true,
					},
				},
				["talent2"] = {
					["multi"] = {
					},
				},
				["zoneId"] = "1147",
				["talent"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["use_zone"] = false,
				["faction"] = {
					["multi"] = {
					},
				},
				["use_level"] = false,
				["use_zoneId"] = true,
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["role"] = {
					["single"] = "TANK",
					["multi"] = {
						["TANK"] = true,
					},
				},
			},
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["inverse"] = false,
			["fontSize"] = 15,
			["text2Containment"] = "OUTSIDE",
			["stickyDuration"] = false,
			["text1Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text2Font"] = "Friz Quadrata TT",
			["anchorFrameType"] = "SCREEN",
			["text1FontFlags"] = "THICKOUTLINE",
			["regionType"] = "icon",
			["frameStrata"] = 1,
			["selfPoint"] = "CENTER",
			["text2FontSize"] = 20,
			["id"] = "美味增益鱼:dps",
			["text1Font"] = "Friz Quadrata TT",
			["text1"] = "增伤: %s%",
			["zoom"] = 0,
			["stacksContainment"] = "OUTSIDE",
			["text2"] = "%p",
			["auto"] = true,
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["additional_triggers"] = {
			},
			["xOffset"] = 0,
			["text2Enabled"] = false,
			["width"] = 100,
			["desaturate"] = false,
			["text1Enabled"] = true,
			["numTriggers"] = 1,
			["icon"] = true,
			["displayIcon"] = 464119,
			["cooldown"] = true,
			["yOffset"] = 0,
		},
		["饰品2就绪"] = {
			["glow"] = true,
			["text1FontSize"] = 12,
			["cooldownTextEnabled"] = true,
			["untrigger"] = {
				["showOn"] = "showOnReady",
				["itemName"] = 140793,
				["itemSlot"] = 14,
			},
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = -10,
			["customTextUpdate"] = "update",
			["icon"] = true,
			["text1Enabled"] = false,
			["animation"] = {
				["start"] = {
					["preset"] = "grow",
					["duration_type"] = "seconds",
					["type"] = "preset",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
			},
			["trigger"] = {
				["itemName"] = 140793,
				["use_unit"] = true,
				["itemSlot"] = 14,
				["custom_hide"] = "timed",
				["type"] = "status",
				["unevent"] = "auto",
				["use_showOn"] = true,
				["subeventPrefix"] = "SPELL",
				["event"] = "Cooldown Progress (Equipment Slot)",
				["names"] = {
				},
				["use_itemSlot"] = true,
				["debuffType"] = "HELPFUL",
				["spellIds"] = {
				},
				["use_testForCooldown"] = true,
				["showOn"] = "showOnReady",
				["subeventSuffix"] = "_CAST_START",
				["unit"] = "player",
				["use_itemName"] = true,
			},
			["desaturate"] = false,
			["text1Point"] = "BOTTOMRIGHT",
			["text2FontFlags"] = "OUTLINE",
			["height"] = 50,
			["load"] = {
				["talent2"] = {
					["multi"] = {
					},
				},
				["use_never"] = true,
				["talent"] = {
					["multi"] = {
					},
				},
				["class"] = {
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
				["role"] = {
					["multi"] = {
					},
				},
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["use_combat"] = true,
				["faction"] = {
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
				["init"] = {
				},
				["finish"] = {
				},
			},
			["selfPoint"] = "CENTER",
			["text2Containment"] = "INSIDE",
			["parent"] = "饰品冷却",
			["text1Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["yOffset"] = 0,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["regionType"] = "icon",
			["inverse"] = false,
			["text2Point"] = "CENTER",
			["text2FontSize"] = 24,
			["stickyDuration"] = false,
			["width"] = 50,
			["text1"] = "%P",
			["frameStrata"] = 1,
			["text1Font"] = "Friz Quadrata TT",
			["text2"] = "%p",
			["auto"] = true,
			["additional_triggers"] = {
			},
			["id"] = "饰品2就绪",
			["zoom"] = 0.2,
			["text2Enabled"] = false,
			["anchorFrameType"] = "SCREEN",
			["text1FontFlags"] = "OUTLINE",
			["text2Font"] = "Friz Quadrata TT",
			["numTriggers"] = 1,
			["xOffset"] = 60,
			["conditions"] = {
			},
			["disjunctive"] = "all",
			["text1Containment"] = "INSIDE",
		},
		["Infernal Writ"] = {
			["glow"] = false,
			["text1FontSize"] = 15,
			["cooldownTextEnabled"] = true,
			["untrigger"] = {
			},
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = 0,
			["customTextUpdate"] = "update",
			["icon"] = true,
			["text1Enabled"] = true,
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["type"] = "preset",
					["preset"] = "grow",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["preset"] = "pulse",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["preset"] = "fade",
					["type"] = "none",
				},
			},
			["trigger"] = {
				["type"] = "aura",
				["subeventSuffix"] = "_CAST_START",
				["event"] = "Health",
				["names"] = {
					"强烈燃烧", -- [1]
				},
				["spellIds"] = {
					215816, -- [1]
				},
				["debuffType"] = "HELPFUL",
				["unit"] = "player",
				["subeventPrefix"] = "SPELL",
				["custom_hide"] = "timed",
			},
			["desaturate"] = false,
			["text1Point"] = "BOTTOMRIGHT",
			["text2FontFlags"] = "OUTLINE",
			["height"] = 40,
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
				["spec"] = {
					["single"] = 2,
					["multi"] = {
						[2] = true,
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
				["class"] = {
					["single"] = "MAGE",
					["multi"] = {
						["MAGE"] = true,
					},
				},
				["faction"] = {
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
			["selfPoint"] = "CENTER",
			["parent"] = "Buffs",
			["displayIcon"] = "Interface\\Icons\\Spell_Frost_ColdHearted",
			["text2Containment"] = "INSIDE",
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
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
			["text2Font"] = "Friz Quadrata TT",
			["text1Font"] = "Friz Quadrata TT",
			["text2FontSize"] = 24,
			["anchorFrameType"] = "SCREEN",
			["text2Enabled"] = false,
			["text1"] = "%s",
			["text2"] = "%p",
			["additional_triggers"] = {
			},
			["zoom"] = 0.18,
			["auto"] = true,
			["text1FontFlags"] = "OUTLINE",
			["id"] = "Infernal Writ",
			["xOffset"] = 0,
			["frameStrata"] = 1,
			["width"] = 40,
			["stickyDuration"] = false,
			["text2Point"] = "CENTER",
			["inverse"] = false,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["cooldown"] = true,
			["yOffset"] = 0,
		},
		["Tarnished Sentinel Medallion"] = {
			["glow"] = false,
			["text1FontSize"] = 6,
			["cooldownTextEnabled"] = true,
			["untrigger"] = {
			},
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = 0,
			["customTextUpdate"] = "update",
			["icon"] = true,
			["text1Enabled"] = true,
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["type"] = "preset",
					["preset"] = "grow",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["preset"] = "pulse",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["preset"] = "fade",
					["type"] = "none",
				},
			},
			["trigger"] = {
				["type"] = "aura",
				["spellId"] = "242570",
				["subeventSuffix"] = "_CAST_START",
				["event"] = "Health",
				["names"] = {
					"幽灵猫头鹰", -- [1]
				},
				["fullscan"] = true,
				["use_spellId"] = true,
				["spellIds"] = {
					242570, -- [1]
				},
				["name"] = "幽灵猫头鹰",
				["custom_hide"] = "timed",
				["unit"] = "player",
				["subeventPrefix"] = "SPELL",
				["debuffType"] = "HELPFUL",
			},
			["desaturate"] = false,
			["text1Point"] = "CENTER",
			["text2FontFlags"] = "OUTLINE",
			["height"] = 40,
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
				["spec"] = {
					["single"] = 2,
					["multi"] = {
						[2] = true,
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
				["class"] = {
					["single"] = "MAGE",
					["multi"] = {
						["MAGE"] = true,
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
				["size"] = {
					["multi"] = {
					},
				},
			},
			["yOffset"] = 0,
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["parent"] = "Buffs",
			["text2Containment"] = "INSIDE",
			["displayIcon"] = "Interface\\Icons\\Spell_Frost_ColdHearted",
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
			["text2Font"] = "Friz Quadrata TT",
			["text1Font"] = "Friz Quadrata TT",
			["text2FontSize"] = 24,
			["anchorFrameType"] = "SCREEN",
			["text2Enabled"] = false,
			["text1"] = "%p",
			["text2"] = "%p",
			["id"] = "Tarnished Sentinel Medallion",
			["zoom"] = 0.18,
			["auto"] = true,
			["text1FontFlags"] = "OUTLINE",
			["additional_triggers"] = {
			},
			["xOffset"] = 0,
			["frameStrata"] = 1,
			["width"] = 40,
			["stickyDuration"] = false,
			["text2Point"] = "CENTER",
			["inverse"] = false,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["init_started"] = 1,
			["conditions"] = {
			},
			["cooldown"] = true,
			["selfPoint"] = "CENTER",
		},
		["Tome of Unraveling Sanity"] = {
			["glow"] = false,
			["text1FontSize"] = 6,
			["cooldownTextEnabled"] = true,
			["untrigger"] = {
			},
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = 0,
			["customTextUpdate"] = "update",
			["icon"] = true,
			["text1Enabled"] = true,
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["preset"] = "grow",
					["type"] = "preset",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["preset"] = "pulse",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["preset"] = "fade",
					["type"] = "none",
				},
			},
			["trigger"] = {
				["type"] = "aura",
				["spellId"] = "243942;147019",
				["subeventSuffix"] = "_CAST_START",
				["event"] = "Health",
				["names"] = {
					"醒神宝典", -- [1]
				},
				["fullscan"] = true,
				["use_spellId"] = true,
				["spellIds"] = {
					243952, -- [1]
				},
				["name"] = "萃取理智",
				["custom_hide"] = "timed",
				["unit"] = "player",
				["subeventPrefix"] = "SPELL",
				["debuffType"] = "HELPFUL",
			},
			["desaturate"] = false,
			["text1Point"] = "CENTER",
			["text2FontFlags"] = "OUTLINE",
			["height"] = 40,
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
				["spec"] = {
					["single"] = 2,
					["multi"] = {
						[2] = true,
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
				["class"] = {
					["single"] = "MAGE",
					["multi"] = {
						["MAGE"] = true,
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
				["size"] = {
					["multi"] = {
					},
				},
			},
			["yOffset"] = 0,
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["parent"] = "Buffs",
			["text2Containment"] = "INSIDE",
			["displayIcon"] = "Interface\\Icons\\Spell_Frost_ColdHearted",
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
			["text2Font"] = "Friz Quadrata TT",
			["text1Font"] = "Friz Quadrata TT",
			["text2FontSize"] = 24,
			["anchorFrameType"] = "SCREEN",
			["text2Enabled"] = false,
			["text1"] = "%p",
			["text2"] = "%p",
			["id"] = "Tome of Unraveling Sanity",
			["zoom"] = 0.18,
			["auto"] = true,
			["text1FontFlags"] = "OUTLINE",
			["additional_triggers"] = {
			},
			["xOffset"] = 0,
			["frameStrata"] = 1,
			["width"] = 40,
			["stickyDuration"] = false,
			["text2Point"] = "CENTER",
			["inverse"] = false,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["cooldown"] = true,
			["selfPoint"] = "CENTER",
		},
		["饰品1冷却"] = {
			["glow"] = false,
			["text1FontSize"] = 18,
			["cooldownTextEnabled"] = true,
			["untrigger"] = {
				["itemName"] = 140800,
				["itemSlot"] = 13,
			},
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = -10,
			["customTextUpdate"] = "update",
			["icon"] = true,
			["text1Enabled"] = false,
			["animation"] = {
				["start"] = {
					["preset"] = "grow",
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
			},
			["trigger"] = {
				["itemName"] = 140800,
				["unit"] = "player",
				["itemSlot"] = 13,
				["custom_hide"] = "timed",
				["type"] = "status",
				["subeventSuffix"] = "_CAST_START",
				["use_showOn"] = true,
				["event"] = "Cooldown Progress (Equipment Slot)",
				["subeventPrefix"] = "SPELL",
				["use_itemSlot"] = true,
				["names"] = {
				},
				["spellIds"] = {
				},
				["debuffType"] = "HELPFUL",
				["showOn"] = "showOnCooldown",
				["unevent"] = "auto",
				["use_itemName"] = true,
				["use_unit"] = true,
			},
			["desaturate"] = false,
			["text1Point"] = "CENTER",
			["text2FontFlags"] = "OUTLINE",
			["height"] = 50,
			["load"] = {
				["talent2"] = {
					["multi"] = {
					},
				},
				["use_never"] = true,
				["talent"] = {
					["multi"] = {
					},
				},
				["class"] = {
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
				["role"] = {
					["multi"] = {
					},
				},
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["use_combat"] = true,
				["faction"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["parent"] = "饰品冷却",
			["yOffset"] = 0,
			["text2Containment"] = "INSIDE",
			["text1Containment"] = "INSIDE",
			["text1Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["selfPoint"] = "CENTER",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["regionType"] = "icon",
			["numTriggers"] = 1,
			["text2Point"] = "CENTER",
			["text2FontSize"] = 24,
			["stickyDuration"] = false,
			["width"] = 50,
			["text1"] = "%P",
			["frameStrata"] = 1,
			["text1Font"] = "Friz Quadrata TT",
			["zoom"] = 0.2,
			["auto"] = true,
			["text2"] = "%p",
			["id"] = "饰品1冷却",
			["text1FontFlags"] = "OUTLINE",
			["text2Enabled"] = false,
			["anchorFrameType"] = "SCREEN",
			["text2Font"] = "Friz Quadrata TT",
			["xOffset"] = 0,
			["inverse"] = true,
			["disjunctive"] = "all",
			["conditions"] = {
			},
			["cooldown"] = true,
			["actions"] = {
				["start"] = {
				},
				["init"] = {
				},
				["finish"] = {
				},
			},
		},
		["DefCD: Cauterize Buff"] = {
			["glow"] = false,
			["text1FontSize"] = 6,
			["cooldownTextEnabled"] = true,
			["untrigger"] = {
			},
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = 0,
			["customTextUpdate"] = "update",
			["icon"] = true,
			["text1Enabled"] = true,
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["type"] = "preset",
					["preset"] = "grow",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["preset"] = "pulse",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["preset"] = "fade",
					["type"] = "none",
				},
			},
			["trigger"] = {
				["type"] = "aura",
				["subeventSuffix"] = "_CAST_START",
				["event"] = "Health",
				["unit"] = "player",
				["spellIds"] = {
					87023, -- [1]
				},
				["custom_hide"] = "timed",
				["subeventPrefix"] = "SPELL",
				["names"] = {
					"灸灼", -- [1]
				},
				["debuffType"] = "HARMFUL",
			},
			["desaturate"] = false,
			["text1Point"] = "CENTER",
			["text2FontFlags"] = "OUTLINE",
			["height"] = 40,
			["load"] = {
				["talent2"] = {
					["multi"] = {
					},
				},
				["use_never"] = false,
				["talent"] = {
					["single"] = 5,
					["multi"] = {
					},
				},
				["class"] = {
					["single"] = "MAGE",
					["multi"] = {
						["MAGE"] = true,
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
				["race"] = {
					["multi"] = {
					},
				},
				["use_name"] = false,
				["spec"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["color"] = {
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
			["parent"] = "Buffs",
			["text2Containment"] = "INSIDE",
			["displayIcon"] = "INTERFACE\\ICONS\\ability_mage_timewarp",
			["text1Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["selfPoint"] = "CENTER",
			["numTriggers"] = 1,
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["regionType"] = "icon",
			["xOffset"] = -136.999690684516,
			["text1Containment"] = "INSIDE",
			["text2FontSize"] = 24,
			["width"] = 40,
			["text2Enabled"] = false,
			["text1"] = "%c",
			["text2"] = "%p",
			["id"] = "DefCD: Cauterize Buff",
			["zoom"] = 0.18,
			["auto"] = true,
			["text1Font"] = "Friz Quadrata TT",
			["additional_triggers"] = {
			},
			["text1FontFlags"] = "OUTLINE",
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["text2Font"] = "Friz Quadrata TT",
			["stickyDuration"] = false,
			["inverse"] = false,
			["text2Point"] = "CENTER",
			["conditions"] = {
			},
			["cooldown"] = true,
			["yOffset"] = -42.0004531338487,
		},
	},
	["registered"] = {
	},
	["frame"] = {
		["xOffset"] = -820.048461914063,
		["yOffset"] = -68.97607421875,
		["height"] = 492,
		["width"] = 630.000061035156,
	},
	["editor_theme"] = "Monokai",
}
