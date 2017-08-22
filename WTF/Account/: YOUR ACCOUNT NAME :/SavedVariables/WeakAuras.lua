
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
		["污染墨汁"] = {
			[232913] = 1500933,
		},
		["能量符文"] = {
			[116014] = 609815,
		},
		["瓦丝琪之握"] = {
			[208147] = 135859,
		},
		["千魂之暗"] = {
			[239216] = 136123,
		},
		["燃烧"] = {
			[240262] = 525024,
			[246261] = 135810,
			[190319] = 135824,
		},
		["玛瑟里顿之力"] = {
			[214404] = 457778,
		},
		["狂怒战鼓"] = {
			[178207] = 133841,
		},
		["末日之雨"] = {
			[234310] = 135803,
		},
		["咒术洪流"] = {
			[116267] = 236219,
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
		["雷霆震击"] = {
			[230362] = 136111,
		},
		["嗜血"] = {
			[2825] = 136012,
		},
		["凯尔萨斯的绝招"] = {
			[209455] = 526168,
		},
		["伊利丹的无目凝视"] = {
			[241721] = 236415,
		},
		["强化隐形术"] = {
			[113862] = 575584,
		},
		["时间扭曲"] = {
			[80353] = 458224,
			[244645] = 458224,
		},
		["引力榨取"] = {
			[239155] = 1394890,
		},
		["冰冻之雨"] = {
			[240555] = 135857,
		},
		["深渊巨喉"] = {
			[230276] = 236302,
		},
		["爆发"] = {
			[235974] = 841219,
		},
		["冰刺"] = {
			[205473] = 135855,
		},
		["冰冷血脉"] = {
			[12472] = 135838,
		},
		["昏暗隐匿"] = {
			[230959] = 134438,
		},
		["虚空强风"] = {
			[244834] = 236222,
		},
		["英勇"] = {
			[32182] = 132313,
		},
		["暗影映像：爆发"] = {
			[236710] = 1357814,
		},
		["欺诈者的遮蔽"] = {
			[236555] = 136122,
			[242696] = 136122,
		},
	},
	["login_squelch_time"] = 10,
	["registered"] = {
	},
	["frame"] = {
		["xOffset"] = -820.048461914063,
		["width"] = 630.000061035156,
		["height"] = 492,
		["yOffset"] = -68.97607421875,
	},
	["displays"] = {
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
					["do_sound"] = false,
					["do_message"] = false,
					["glow_frame"] = "WeakAuras:Artillery",
					["message_type"] = "SAY",
					["glow_action"] = "show",
					["sound"] = "Interface\\AddOns\\Prat-3.0\\Sounds\\Link.ogg",
					["message"] = "",
				},
				["init"] = {
					["do_custom"] = true,
					["custom"] = "aura_env.spellID = 236602 -- Change to whatever debuff you want to keep track\naura_env.unitID = \"player\"\naura_env.filter = \"harmful\"\naura_env.alternativeText = \"DOT\"\n\naura_env.shortenNumber = function(number)\n    if type(number) ~= \"number\" then\n        number = tonumber(number)\n    end\n    if not number then\n        return\n    end\n    \n    local affixes = {\n        \"\",\n        \"K\",\n        \"M\",\n        \"B\",\n    }\n    \n    local affix = 1\n    local dec = 0\n    local num1 = math.abs(number)\n    while num1 >= 1000 and affix < #affixes do\n        num1 = num1 / 1000\n        affix = affix + 1\n    end\n    if affix > 1 then\n        dec = 2\n        local num2 = num1\n        while num2 >= 10 do\n            num2 = num2 / 10\n            dec = dec - 1\n        end\n    end\n    if number < 0 then\n        num1 = -num1\n    end\n    \n    return string.format(\"%.\"..dec..\"f\"..affixes[affix], num1)\nend",
				},
				["finish"] = {
				},
			},
			["fontFlags"] = "THICKOUTLINE",
			["useTooltip"] = false,
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["preset"] = "spiral",
					["type"] = "none",
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
				["fullscan"] = true,
				["type"] = "aura",
				["spellId"] = "236602",
				["unevent"] = "timed",
				["use_unit"] = true,
				["duration"] = "2",
				["event"] = "Combat Log",
				["names"] = {
					"灵魂之刃", -- [1]
				},
				["name"] = "灵魂痛楚",
				["use_spellId"] = true,
				["spellIds"] = {
					200084, -- [1]
				},
				["custom_hide"] = "timed",
				["subeventSuffix"] = "_CAST_START",
				["unit"] = "player",
				["subeventPrefix"] = "SPELL",
				["debuffType"] = "HARMFUL",
			},
			["yOffset"] = 0,
			["text1Containment"] = "OUTSIDE",
			["stacksPoint"] = "BOTTOM",
			["text1Point"] = "TOP",
			["displayIcon"] = 464119,
			["text2FontFlags"] = "THICKOUTLINE",
			["height"] = 100,
			["parent"] = "萨格拉斯之墓 - 09#基尔加丹",
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
				["use_zoneId"] = true,
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
				["use_zone"] = false,
				["use_level"] = false,
				["class"] = {
					["multi"] = {
					},
				},
			},
			["icon"] = true,
			["numTriggers"] = 1,
			["fontSize"] = 15,
			["text2Containment"] = "OUTSIDE",
			["text1Enabled"] = true,
			["text1Color"] = {
				0, -- [1]
				0.701960784313726, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["selfPoint"] = "CENTER",
			["width"] = 100,
			["text1FontFlags"] = "THICKOUTLINE",
			["regionType"] = "icon",
			["text2Enabled"] = true,
			["xOffset"] = 0,
			["text2FontSize"] = 22,
			["id"] = "灵魂痛楚",
			["desaturate"] = false,
			["text1"] = "%c",
			["text2"] = "躲开",
			["stacksContainment"] = "OUTSIDE",
			["zoom"] = 0,
			["auto"] = true,
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["additional_triggers"] = {
			},
			["text1Font"] = "Friz Quadrata TT",
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["text2Font"] = "Friz Quadrata TT",
			["stickyDuration"] = false,
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
					["message"] = "",
					["sound"] = "Interface\\AddOns\\Prat-3.0\\Sounds\\Link.ogg",
					["glow_frame"] = "WeakAuras:Artillery",
					["message_type"] = "SAY",
					["glow_action"] = "show",
					["do_message"] = false,
					["do_sound"] = false,
				},
				["init"] = {
					["do_custom"] = true,
					["custom"] = "aura_env.spellID = 234621 -- Change to whatever debuff you want to keep track\naura_env.unitID = \"player\"\naura_env.filter = \"harmful\"\naura_env.alternativeText = \"DOT\"\n\naura_env.shortenNumber = function(number)\n    if type(number) ~= \"number\" then\n        number = tonumber(number)\n    end\n    if not number then\n        return\n    end\n    \n    local affixes = {\n        \"\",\n        \"K\",\n        \"M\",\n        \"B\",\n    }\n    \n    local affix = 1\n    local dec = 0\n    local num1 = math.abs(number)\n    while num1 >= 1000 and affix < #affixes do\n        num1 = num1 / 1000\n        affix = affix + 1\n    end\n    if affix > 1 then\n        dec = 2\n        local num2 = num1\n        while num2 >= 10 do\n            num2 = num2 / 10\n            dec = dec - 1\n        end\n    end\n    if number < 0 then\n        num1 = -num1\n    end\n    \n    return string.format(\"%.\"..dec..\"f\"..affixes[affix], num1)\nend",
				},
				["finish"] = {
				},
			},
			["fontFlags"] = "THICKOUTLINE",
			["useTooltip"] = false,
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["preset"] = "spiral",
					["type"] = "none",
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
				["debuffType"] = "HARMFUL",
				["type"] = "aura",
				["spellId"] = "234621",
				["unevent"] = "timed",
				["use_unit"] = true,
				["duration"] = "2",
				["event"] = "Combat Log",
				["subeventPrefix"] = "SPELL",
				["spellIds"] = {
					200084, -- [1]
				},
				["use_spellId"] = true,
				["name"] = "吞噬巨口",
				["custom_hide"] = "timed",
				["subeventSuffix"] = "_CAST_START",
				["unit"] = "player",
				["names"] = {
					"灵魂之刃", -- [1]
				},
				["fullscan"] = true,
			},
			["yOffset"] = 0,
			["text1Containment"] = "OUTSIDE",
			["cooldown"] = true,
			["text1Point"] = "BOTTOM",
			["displayIcon"] = "132107",
			["text2FontFlags"] = "THICKOUTLINE",
			["height"] = 100,
			["parent"] = "萨格拉斯之墓 - 04#主母萨丝琳",
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
				["role"] = {
					["single"] = "TANK",
					["multi"] = {
						["TANK"] = true,
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
				["use_zoneId"] = true,
				["use_level"] = false,
				["use_zone"] = false,
				["class"] = {
					["multi"] = {
					},
				},
			},
			["icon"] = true,
			["numTriggers"] = 1,
			["fontSize"] = 15,
			["text2Containment"] = "OUTSIDE",
			["text1Enabled"] = true,
			["text1Color"] = {
				0, -- [1]
				0.701960784313726, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["desaturate"] = false,
			["width"] = 100,
			["text1FontFlags"] = "THICKOUTLINE",
			["regionType"] = "icon",
			["text2Enabled"] = false,
			["xOffset"] = 0,
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
			["text2"] = "%p",
			["stacksContainment"] = "OUTSIDE",
			["zoom"] = 0,
			["auto"] = true,
			["text1Font"] = "Friz Quadrata TT",
			["id"] = "吞噬巨口",
			["selfPoint"] = "CENTER",
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["text2Font"] = "Friz Quadrata TT",
			["stickyDuration"] = false,
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
			["stacksPoint"] = "BOTTOM",
			["text2Point"] = "BOTTOM",
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
					["message"] = "",
					["sound"] = "Interface\\AddOns\\Prat-3.0\\Sounds\\Link.ogg",
					["glow_frame"] = "WeakAuras:Artillery",
					["message_type"] = "SAY",
					["glow_action"] = "show",
					["do_message"] = false,
					["do_sound"] = false,
				},
				["init"] = {
					["do_custom"] = true,
					["custom"] = "aura_env.spellID = 240908 -- Change to whatever debuff you want to keep track\naura_env.unitID = \"player\"\naura_env.filter = \"harmful\"\naura_env.alternativeText = \"DOT\"\n\naura_env.shortenNumber = function(number)\n    if type(number) ~= \"number\" then\n        number = tonumber(number)\n    end\n    if not number then\n        return\n    end\n    \n    local affixes = {\n        \"\",\n        \"K\",\n        \"M\",\n        \"B\",\n    }\n    \n    local affix = 1\n    local dec = 0\n    local num1 = math.abs(number)\n    while num1 >= 1000 and affix < #affixes do\n        num1 = num1 / 1000\n        affix = affix + 1\n    end\n    if affix > 1 then\n        dec = 2\n        local num2 = num1\n        while num2 >= 10 do\n            num2 = num2 / 10\n            dec = dec - 1\n        end\n    end\n    if number < 0 then\n        num1 = -num1\n    end\n    \n    return string.format(\"%.\"..dec..\"f\"..affixes[affix], num1)\nend",
				},
				["finish"] = {
				},
			},
			["fontFlags"] = "THICKOUTLINE",
			["useTooltip"] = false,
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["preset"] = "spiral",
					["type"] = "none",
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
				["debuffType"] = "HARMFUL",
				["type"] = "aura",
				["spellId"] = "240908",
				["unevent"] = "timed",
				["names"] = {
					"灵魂之刃", -- [1]
				},
				["duration"] = "2",
				["event"] = "Combat Log",
				["use_unit"] = true,
				["spellIds"] = {
					200084, -- [1]
				},
				["use_spellId"] = true,
				["name"] = "末日冲击",
				["custom_hide"] = "timed",
				["subeventSuffix"] = "_CAST_START",
				["unit"] = "player",
				["subeventPrefix"] = "SPELL",
				["fullscan"] = true,
			},
			["yOffset"] = 0,
			["text1Containment"] = "OUTSIDE",
			["cooldown"] = true,
			["text1Point"] = "BOTTOM",
			["displayIcon"] = 464119,
			["text2FontFlags"] = "OUTLINE",
			["height"] = 100,
			["parent"] = "萨格拉斯之墓 - 09#基尔加丹",
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
				["role"] = {
					["single"] = "TANK",
					["multi"] = {
						["TANK"] = true,
					},
				},
				["zoneId"] = "1147",
				["use_zone"] = false,
				["class"] = {
					["multi"] = {
					},
				},
			},
			["icon"] = true,
			["numTriggers"] = 1,
			["fontSize"] = 15,
			["text2Containment"] = "OUTSIDE",
			["text1Enabled"] = true,
			["text1Color"] = {
				0, -- [1]
				0.701960784313726, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["desaturate"] = false,
			["width"] = 100,
			["text1FontFlags"] = "THICKOUTLINE",
			["regionType"] = "icon",
			["text2Enabled"] = false,
			["text1Font"] = "Friz Quadrata TT",
			["text2FontSize"] = 32,
			["id"] = "末日冲击",
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text1"] = "%c",
			["text2"] = "%s",
			["stacksContainment"] = "OUTSIDE",
			["zoom"] = 0,
			["auto"] = true,
			["xOffset"] = 0,
			["additional_triggers"] = {
			},
			["selfPoint"] = "CENTER",
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["text2Font"] = "Friz Quadrata TT",
			["stickyDuration"] = false,
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
			["stacksPoint"] = "BOTTOM",
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
					["do_sound"] = false,
					["do_message"] = false,
					["glow_frame"] = "WeakAuras:Artillery",
					["message_type"] = "SAY",
					["glow_action"] = "show",
					["sound"] = "Interface\\AddOns\\Prat-3.0\\Sounds\\Link.ogg",
					["message"] = "",
				},
				["init"] = {
					["do_custom"] = true,
					["custom"] = "aura_env.spellID = 240916 -- Change to whatever debuff you want to keep track\naura_env.unitID = \"player\"\naura_env.filter = \"harmful\"\naura_env.alternativeText = \"DOT\"\n\naura_env.shortenNumber = function(number)\n    if type(number) ~= \"number\" then\n        number = tonumber(number)\n    end\n    if not number then\n        return\n    end\n    \n    local affixes = {\n        \"\",\n        \"K\",\n        \"M\",\n        \"B\",\n    }\n    \n    local affix = 1\n    local dec = 0\n    local num1 = math.abs(number)\n    while num1 >= 1000 and affix < #affixes do\n        num1 = num1 / 1000\n        affix = affix + 1\n    end\n    if affix > 1 then\n        dec = 2\n        local num2 = num1\n        while num2 >= 10 do\n            num2 = num2 / 10\n            dec = dec - 1\n        end\n    end\n    if number < 0 then\n        num1 = -num1\n    end\n    \n    return string.format(\"%.\"..dec..\"f\"..affixes[affix], num1)\nend",
				},
				["finish"] = {
				},
			},
			["fontFlags"] = "THICKOUTLINE",
			["useTooltip"] = false,
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["preset"] = "spiral",
					["type"] = "none",
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
				["fullscan"] = true,
				["type"] = "aura",
				["spellId"] = "240916",
				["unevent"] = "timed",
				["use_unit"] = true,
				["duration"] = "2",
				["event"] = "Combat Log",
				["names"] = {
					"灵魂之刃", -- [1]
				},
				["name"] = "末日之雹",
				["use_spellId"] = true,
				["spellIds"] = {
					200084, -- [1]
				},
				["custom_hide"] = "timed",
				["subeventSuffix"] = "_CAST_START",
				["unit"] = "player",
				["subeventPrefix"] = "SPELL",
				["debuffType"] = "HARMFUL",
			},
			["yOffset"] = 0,
			["text1Containment"] = "OUTSIDE",
			["stacksPoint"] = "BOTTOM",
			["text1Point"] = "BOTTOM",
			["displayIcon"] = 464119,
			["text2FontFlags"] = "OUTLINE",
			["height"] = 100,
			["parent"] = "萨格拉斯之墓 - 09#基尔加丹",
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
				["use_zoneId"] = true,
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
				["use_zone"] = false,
				["use_level"] = false,
				["class"] = {
					["multi"] = {
					},
				},
			},
			["icon"] = true,
			["numTriggers"] = 1,
			["fontSize"] = 15,
			["text2Containment"] = "OUTSIDE",
			["text1Enabled"] = true,
			["text1Color"] = {
				0, -- [1]
				0.701960784313726, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["desaturate"] = false,
			["width"] = 100,
			["text1FontFlags"] = "THICKOUTLINE",
			["regionType"] = "icon",
			["text2Enabled"] = false,
			["text1Font"] = "Friz Quadrata TT",
			["text2FontSize"] = 32,
			["id"] = "末日之雹",
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text1"] = "%c",
			["text2"] = "%s",
			["stacksContainment"] = "OUTSIDE",
			["zoom"] = 0,
			["auto"] = true,
			["xOffset"] = 0,
			["additional_triggers"] = {
			},
			["selfPoint"] = "CENTER",
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["text2Font"] = "Friz Quadrata TT",
			["stickyDuration"] = false,
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
			["text2Point"] = "TOP",
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
					["message"] = "",
					["sound"] = "Interface\\AddOns\\Prat-3.0\\Sounds\\Link.ogg",
					["do_sound"] = false,
					["message_type"] = "SAY",
					["glow_action"] = "show",
					["do_message"] = false,
					["glow_frame"] = "WeakAuras:Artillery",
				},
				["init"] = {
					["do_custom"] = true,
					["custom"] = "aura_env.spellID = 230201 -- Change to whatever debuff you want to keep track\naura_env.unitID = \"player\"\naura_env.filter = \"harmful\"\naura_env.alternativeText = \"DOT\"\n\naura_env.shortenNumber = function(number)\n    if type(number) ~= \"number\" then\n        number = tonumber(number)\n    end\n    if not number then\n        return\n    end\n    \n    local affixes = {\n        \"\",\n        \"K\",\n        \"M\",\n        \"B\",\n    }\n    \n    local affix = 1\n    local dec = 0\n    local num1 = math.abs(number)\n    while num1 >= 1000 and affix < #affixes do\n        num1 = num1 / 1000\n        affix = affix + 1\n    end\n    if affix > 1 then\n        dec = 2\n        local num2 = num1\n        while num2 >= 10 do\n            num2 = num2 / 10\n            dec = dec - 1\n        end\n    end\n    if number < 0 then\n        num1 = -num1\n    end\n    \n    return string.format(\"%.\"..dec..\"f\"..affixes[affix], num1)\nend",
				},
				["finish"] = {
				},
			},
			["fontFlags"] = "THICKOUTLINE",
			["useTooltip"] = false,
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["preset"] = "spiral",
					["type"] = "none",
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
				["debuffType"] = "HARMFUL",
				["type"] = "aura",
				["spellId"] = "230201",
				["unevent"] = "timed",
				["use_unit"] = true,
				["duration"] = "2",
				["event"] = "Combat Log",
				["subeventPrefix"] = "SPELL",
				["name"] = "痛苦负担",
				["use_spellId"] = true,
				["spellIds"] = {
					200084, -- [1]
				},
				["custom_hide"] = "timed",
				["subeventSuffix"] = "_CAST_START",
				["unit"] = "player",
				["names"] = {
					"灵魂之刃", -- [1]
				},
				["fullscan"] = true,
			},
			["yOffset"] = 0,
			["desaturate"] = true,
			["cooldown"] = true,
			["text1Point"] = "TOP",
			["displayIcon"] = "132107",
			["text2FontFlags"] = "THICKOUTLINE",
			["height"] = 100,
			["parent"] = "萨格拉斯之墓 - 04#主母萨丝琳",
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
				["use_zoneId"] = true,
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
				["zoneId"] = "1147",
				["use_zone"] = false,
				["class"] = {
					["multi"] = {
					},
				},
			},
			["glow"] = false,
			["numTriggers"] = 1,
			["fontSize"] = 15,
			["text2Containment"] = "OUTSIDE",
			["icon"] = true,
			["text1Color"] = {
				0, -- [1]
				0.701960784313726, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text1FontFlags"] = "THICKOUTLINE",
			["width"] = 100,
			["text2Color"] = {
				1, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["regionType"] = "icon",
			["text2Enabled"] = true,
			["xOffset"] = 0,
			["text2FontSize"] = 20,
			["additional_triggers"] = {
			},
			["text1Enabled"] = true,
			["text1"] = "%c",
			["text2"] = "换坦嘲讽",
			["stacksContainment"] = "OUTSIDE",
			["zoom"] = 0,
			["auto"] = true,
			["selfPoint"] = "CENTER",
			["id"] = "痛苦负担",
			["text1Font"] = "Friz Quadrata TT",
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["text2Font"] = "Friz Quadrata TT",
			["stickyDuration"] = false,
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
			["stacksPoint"] = "BOTTOM",
			["text1Containment"] = "OUTSIDE",
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
				["finish"] = {
				},
				["init"] = {
				},
			},
			["backgroundInset"] = 0,
			["selfPoint"] = "LEFT",
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
				["race"] = {
					["multi"] = {
					},
				},
				["spec"] = {
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
			["animate"] = false,
			["border"] = "None",
			["regionType"] = "dynamicgroup",
			["sort"] = "none",
			["expanded"] = false,
			["constantFactor"] = "RADIUS",
			["borderOffset"] = 16,
			["id"] = "萨格拉斯之墓 - 09#基尔加丹",
			["additional_triggers"] = {
			},
			["frameStrata"] = 1,
			["width"] = 2650.00007629395,
			["anchorFrameType"] = "SCREEN",
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
			["numTriggers"] = 1,
			["rotation"] = 0,
			["align"] = "CENTER",
			["conditions"] = {
			},
			["untrigger"] = {
			},
			["radius"] = 200,
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
					["do_sound"] = true,
					["do_message"] = false,
					["glow_frame"] = "WeakAuras:Artillery",
					["message_type"] = "SAY",
					["glow_action"] = "show",
					["sound"] = "Sound\\Interface\\AuctionWindowClose.ogg",
					["message"] = "",
				},
				["init"] = {
					["do_custom"] = false,
					["custom"] = "\n\n",
				},
				["finish"] = {
				},
			},
			["fontFlags"] = "THICKOUTLINE",
			["useTooltip"] = false,
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["preset"] = "spiral",
					["type"] = "none",
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
				["debuffType"] = "HARMFUL",
				["type"] = "aura",
				["spellId"] = "232913",
				["unevent"] = "timed",
				["use_unit"] = true,
				["duration"] = "2",
				["event"] = "Combat Log",
				["subeventPrefix"] = "SPELL",
				["use_spellId"] = true,
				["subcount"] = true,
				["name"] = "污染墨汁",
				["spellIds"] = {
					232913, -- [1]
				},
				["subeventSuffix"] = "_CAST_START",
				["unit"] = "player",
				["names"] = {
					"污染墨汁", -- [1]
				},
				["custom_hide"] = "timed",
			},
			["yOffset"] = 0,
			["glow"] = false,
			["text1Containment"] = "OUTSIDE",
			["stacksPoint"] = "BOTTOM",
			["text1Point"] = "BOTTOM",
			["displayIcon"] = "132107",
			["text2FontFlags"] = "THICKOUTLINE",
			["height"] = 100,
			["icon"] = true,
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
				["role"] = {
					["single"] = "TANK",
					["multi"] = {
						["TANK"] = true,
					},
				},
				["use_zoneId"] = true,
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["faction"] = {
					["multi"] = {
					},
				},
				["use_zone"] = false,
				["use_level"] = false,
				["class"] = {
					["multi"] = {
					},
				},
			},
			["numTriggers"] = 2,
			["text1Enabled"] = true,
			["fontSize"] = 15,
			["text2Containment"] = "OUTSIDE",
			["selfPoint"] = "CENTER",
			["text1Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["width"] = 100,
			["text2Enabled"] = true,
			["text1FontFlags"] = "THICKOUTLINE",
			["regionType"] = "icon",
			["xOffset"] = 0,
			["id"] = "墨汁+吞噬",
			["text2FontSize"] = 22,
			["desaturate"] = false,
			["init_completed"] = 1,
			["text1"] = "%c",
			["text2"] = "减速",
			["stacksContainment"] = "OUTSIDE",
			["zoom"] = 0,
			["auto"] = true,
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["additional_triggers"] = {
				{
					["trigger"] = {
						["names"] = {
							"吞噬巨口", -- [1]
						},
						["type"] = "aura",
						["spellIds"] = {
							234621, -- [1]
						},
						["subeventSuffix"] = "_CAST_START",
						["unit"] = "player",
						["subeventPrefix"] = "SPELL",
						["event"] = "Health",
						["debuffType"] = "HARMFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
			},
			["text1Font"] = "Friz Quadrata TT",
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["text2Font"] = "Friz Quadrata TT",
			["stickyDuration"] = false,
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
			["parent"] = "萨格拉斯之墓 - 04#主母萨丝琳",
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
					["do_sound"] = false,
					["do_message"] = false,
					["glow_frame"] = "WeakAuras:Artillery",
					["message_type"] = "SAY",
					["glow_action"] = "show",
					["sound"] = "Interface\\AddOns\\Prat-3.0\\Sounds\\Link.ogg",
					["message"] = "",
				},
				["init"] = {
					["do_custom"] = false,
					["custom"] = "\n\n",
				},
				["finish"] = {
				},
			},
			["fontFlags"] = "THICKOUTLINE",
			["useTooltip"] = false,
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["preset"] = "spiral",
					["type"] = "none",
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
				["spellId"] = "239362",
				["duration"] = "2",
				["use_specific_unit"] = false,
				["subcount"] = true,
				["custom_hide"] = "timed",
				["type"] = "aura",
				["unevent"] = "timed",
				["subeventPrefix"] = "SPELL",
				["event"] = "Combat Log",
				["debuffType"] = "HARMFUL",
				["spellIds"] = {
					242945, -- [1]
				},
				["use_spellId"] = true,
				["name"] = "美味的增益鱼",
				["use_unit"] = true,
				["names"] = {
					"鱼人饲料", -- [1]
				},
				["unit"] = "player",
				["subeventSuffix"] = "_CAST_START",
				["fullscan"] = true,
			},
			["yOffset"] = 0,
			["text1Containment"] = "OUTSIDE",
			["text2Point"] = "BOTTOM",
			["text1Point"] = "BOTTOM",
			["stacksPoint"] = "BOTTOM",
			["text2FontFlags"] = "THICKOUTLINE",
			["height"] = 100,
			["displayIcon"] = 464119,
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
				["role"] = {
					["single"] = "TANK",
					["multi"] = {
						["TANK"] = true,
					},
				},
				["use_zoneId"] = true,
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["faction"] = {
					["multi"] = {
					},
				},
				["use_zone"] = false,
				["use_level"] = false,
				["class"] = {
					["multi"] = {
					},
				},
			},
			["icon"] = true,
			["numTriggers"] = 1,
			["fontSize"] = 15,
			["text2Containment"] = "OUTSIDE",
			["text1Enabled"] = true,
			["text1Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["desaturate"] = false,
			["width"] = 100,
			["text1FontFlags"] = "THICKOUTLINE",
			["regionType"] = "icon",
			["text2Enabled"] = false,
			["xOffset"] = 0,
			["text2FontSize"] = 20,
			["id"] = "美味增益鱼:治疗",
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text1"] = "回蓝: %s",
			["text2"] = "%p",
			["stacksContainment"] = "OUTSIDE",
			["zoom"] = 0,
			["auto"] = true,
			["text1Font"] = "Friz Quadrata TT",
			["additional_triggers"] = {
			},
			["selfPoint"] = "CENTER",
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["text2Font"] = "Friz Quadrata TT",
			["stickyDuration"] = false,
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
			["parent"] = "萨格拉斯之墓 - 04#主母萨丝琳",
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
				["duration"] = "10",
				["message_operator"] = "match('%s')",
				["unit"] = "player",
				["custom_hide"] = "timed",
				["type"] = "custom",
				["subeventPrefix"] = "SPELL",
				["unevent"] = "custom",
				["names"] = {
				},
				["subeventSuffix"] = "_CAST_START",
				["event"] = "Chat Message",
				["custom_type"] = "event",
				["message"] = "long sleeves",
				["events"] = "CHAT_MSG_RAID_BOSS_EMOTE",
				["custom"] = "function(channel, message, language, channelString, target, flags, unknown, channelNumber, channelName, unknown, counter)\n    if message and message:find(\"spell:235059\") then\n        return true\n    end\nend",
				["spellIds"] = {
				},
				["use_message"] = true,
				["debuffType"] = "HELPFUL",
				["use_messageType"] = true,
				["messageType"] = "CHAT_MSG_PARTY",
			},
			["text1Containment"] = "OUTSIDE",
			["text1Point"] = "TOP",
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
			["text2FontFlags"] = "THICKOUTLINE",
			["height"] = 100,
			["parent"] = "萨格拉斯之墓 - 09#基尔加丹",
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
				["use_zone"] = false,
				["role"] = {
					["multi"] = {
					},
				},
				["use_level"] = false,
				["class"] = {
					["multi"] = {
					},
				},
			},
			["disjunctive"] = "all",
			["displayIcon"] = "1041232",
			["glow"] = false,
			["text2Containment"] = "OUTSIDE",
			["numTriggers"] = 1,
			["text1Color"] = {
				1, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["cooldownTextEnabled"] = true,
			["icon"] = true,
			["text1FontFlags"] = "THICKOUTLINE",
			["regionType"] = "icon",
			["width"] = 100,
			["text2Enabled"] = true,
			["text2FontSize"] = 22,
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["additional_triggers"] = {
			},
			["text1"] = "分担",
			["desaturate"] = false,
			["justify"] = "LEFT",
			["zoom"] = 0,
			["auto"] = true,
			["text2"] = "宝珠",
			["id"] = "断裂奇点",
			["text1Font"] = "Friz Quadrata TT",
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["text2Font"] = "Friz Quadrata TT",
			["stickyDuration"] = false,
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
			["untrigger"] = {
				["message"] = "Reset",
				["custom"] = "\n\n",
				["use_message"] = true,
				["message_operator"] = "==",
				["use_messageType"] = true,
				["messageType"] = "CHAT_MSG_PARTY",
			},
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
					["glow_frame"] = "WeakAuras:Artillery",
					["do_message"] = false,
					["do_sound"] = false,
					["message_type"] = "SAY",
					["glow_action"] = "show",
					["sound"] = "Interface\\AddOns\\Prat-3.0\\Sounds\\Link.ogg",
					["message"] = "",
				},
				["init"] = {
					["do_custom"] = false,
					["custom"] = "\n\n",
				},
				["finish"] = {
				},
			},
			["fontFlags"] = "THICKOUTLINE",
			["useTooltip"] = false,
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["preset"] = "spiral",
					["type"] = "none",
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
				["custom_hide"] = "timed",
				["names"] = {
					"绝望", -- [1]
				},
				["use_spellId"] = true,
				["name"] = "绝望",
				["use_specific_unit"] = false,
				["spellIds"] = {
					237725, -- [1]
				},
				["unit"] = "player",
				["subeventSuffix"] = "_CAST_START",
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
			["stacksPoint"] = "BOTTOM",
			["text1Point"] = "BOTTOM",
			["displayIcon"] = 464119,
			["text2FontFlags"] = "THICKOUTLINE",
			["height"] = 100,
			["glow"] = false,
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
				["role"] = {
					["single"] = "TANK",
					["multi"] = {
						["TANK"] = true,
					},
				},
				["use_zoneId"] = true,
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["faction"] = {
					["multi"] = {
					},
				},
				["use_zone"] = false,
				["use_level"] = false,
				["class"] = {
					["multi"] = {
					},
				},
			},
			["numTriggers"] = 1,
			["icon"] = true,
			["fontSize"] = 15,
			["text2Containment"] = "OUTSIDE",
			["text1Enabled"] = true,
			["text1Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["width"] = 100,
			["text2Enabled"] = true,
			["text1FontFlags"] = "THICKOUTLINE",
			["regionType"] = "icon",
			["text1Font"] = "Friz Quadrata TT",
			["id"] = "绝望 - debuff",
			["text2FontSize"] = 22,
			["selfPoint"] = "CENTER",
			["init_completed"] = 1,
			["text1"] = "+%s%",
			["text2"] = "%c",
			["stacksContainment"] = "OUTSIDE",
			["zoom"] = 0,
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
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["desaturate"] = false,
			["text2Font"] = "Friz Quadrata TT",
			["inverse"] = false,
			["stickyDuration"] = false,
			["conditions"] = {
			},
			["cooldown"] = true,
			["parent"] = "萨格拉斯之墓 - 09#基尔加丹",
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
					["duration_type"] = "seconds",
					["preset"] = "grow",
					["type"] = "preset",
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
				["custom_hide"] = "timed",
				["type"] = "status",
				["subeventSuffix"] = "_CAST_START",
				["unevent"] = "auto",
				["use_showOn"] = true,
				["subeventPrefix"] = "SPELL",
				["event"] = "Cooldown Progress (Equipment Slot)",
				["names"] = {
				},
				["use_itemSlot"] = true,
				["itemSlot"] = 13,
				["spellIds"] = {
				},
				["use_testForCooldown"] = true,
				["showOn"] = "showOnReady",
				["unit"] = "player",
				["use_unit"] = true,
				["debuffType"] = "HELPFUL",
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
				["faction"] = {
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
				["use_combat"] = true,
				["spec"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["disjunctive"] = "all",
			["text1Containment"] = "INSIDE",
			["text2Containment"] = "INSIDE",
			["yOffset"] = 0,
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
			["xOffset"] = 0,
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["regionType"] = "icon",
			["numTriggers"] = 1,
			["text2Font"] = "Friz Quadrata TT",
			["text2FontSize"] = 24,
			["text1FontFlags"] = "OUTLINE",
			["anchorFrameType"] = "SCREEN",
			["text1"] = "%P",
			["text2Enabled"] = false,
			["text2"] = "%p",
			["zoom"] = 0.2,
			["auto"] = true,
			["additional_triggers"] = {
			},
			["id"] = "饰品1就绪",
			["text1Font"] = "Friz Quadrata TT",
			["frameStrata"] = 1,
			["width"] = 50,
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
			["parent"] = "饰品冷却",
			["selfPoint"] = "CENTER",
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
					["message"] = "",
					["sound"] = "Interface\\AddOns\\Prat-3.0\\Sounds\\Link.ogg",
					["glow_frame"] = "WeakAuras:Artillery",
					["message_type"] = "SAY",
					["glow_action"] = "show",
					["do_message"] = false,
					["do_sound"] = false,
				},
				["init"] = {
					["do_custom"] = false,
					["custom"] = "\n\n",
				},
				["finish"] = {
				},
			},
			["fontFlags"] = "THICKOUTLINE",
			["useTooltip"] = false,
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["preset"] = "spiral",
					["type"] = "none",
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
				["use_unit"] = true,
				["spellIds"] = {
					239932, -- [1]
				},
				["use_spellId"] = true,
				["name"] = "邪爪",
				["use_specific_unit"] = true,
				["unit"] = "member",
				["unevent"] = "timed",
				["debuffType"] = "HELPFUL",
				["subeventPrefix"] = "SPELL",
			},
			["glow"] = false,
			["text1Containment"] = "OUTSIDE",
			["parent"] = "萨格拉斯之墓 - 09#基尔加丹",
			["text1Point"] = "BOTTOM",
			["cooldown"] = true,
			["text2FontFlags"] = "THICKOUTLINE",
			["height"] = 100,
			["displayIcon"] = 464119,
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
				["zoneId"] = "1147",
				["role"] = {
					["single"] = "TANK",
					["multi"] = {
						["TANK"] = true,
					},
				},
				["use_zone"] = false,
				["class"] = {
					["multi"] = {
					},
				},
			},
			["icon"] = true,
			["numTriggers"] = 1,
			["fontSize"] = 15,
			["text2Containment"] = "OUTSIDE",
			["text1Enabled"] = true,
			["text1Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["selfPoint"] = "CENTER",
			["width"] = 100,
			["text1FontFlags"] = "THICKOUTLINE",
			["regionType"] = "icon",
			["text2Enabled"] = true,
			["xOffset"] = 0,
			["text2FontSize"] = 24,
			["id"] = "邪爪 - buff",
			["desaturate"] = false,
			["text1"] = "增强",
			["text2"] = "BOSS",
			["stacksContainment"] = "OUTSIDE",
			["zoom"] = 0,
			["auto"] = true,
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["additional_triggers"] = {
			},
			["text1Font"] = "Friz Quadrata TT",
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["text2Font"] = "Friz Quadrata TT",
			["stickyDuration"] = false,
			["inverse"] = false,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["stacksPoint"] = "BOTTOM",
			["yOffset"] = 0,
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
					["do_sound"] = false,
					["do_message"] = false,
					["glow_frame"] = "WeakAuras:Artillery",
					["message_type"] = "SAY",
					["glow_action"] = "show",
					["sound"] = "Interface\\AddOns\\Prat-3.0\\Sounds\\Link.ogg",
					["message"] = "",
				},
				["init"] = {
					["do_custom"] = false,
					["custom"] = "\n\n",
				},
				["finish"] = {
				},
			},
			["fontFlags"] = "THICKOUTLINE",
			["useTooltip"] = false,
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["preset"] = "spiral",
					["type"] = "none",
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
				["spellId"] = "239932",
				["duration"] = "2",
				["use_specific_unit"] = false,
				["specificUnit"] = "boss1",
				["debuffType"] = "HARMFUL",
				["type"] = "aura",
				["unevent"] = "timed",
				["event"] = "Combat Log",
				["custom_hide"] = "timed",
				["name"] = "邪爪",
				["use_spellId"] = true,
				["spellIds"] = {
					236555, -- [1]
				},
				["names"] = {
					"欺诈者的遮蔽", -- [1]
				},
				["use_unit"] = true,
				["unit"] = "player",
				["subeventSuffix"] = "_CAST_START",
				["subeventPrefix"] = "SPELL",
			},
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["yOffset"] = 0,
			["text1Containment"] = "OUTSIDE",
			["stacksPoint"] = "BOTTOM",
			["text1Point"] = "BOTTOM",
			["displayIcon"] = 464119,
			["text2FontFlags"] = "THICKOUTLINE",
			["height"] = 100,
			["glow"] = false,
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
				["use_zoneId"] = true,
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
				["use_zone"] = false,
				["use_level"] = false,
				["class"] = {
					["multi"] = {
					},
				},
			},
			["numTriggers"] = 1,
			["icon"] = true,
			["fontSize"] = 15,
			["text2Containment"] = "OUTSIDE",
			["text1Enabled"] = true,
			["text1Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["width"] = 100,
			["text2Enabled"] = true,
			["text1FontFlags"] = "THICKOUTLINE",
			["regionType"] = "icon",
			["text1Font"] = "Friz Quadrata TT",
			["id"] = "欺诈者的遮蔽",
			["text2FontSize"] = 24,
			["selfPoint"] = "CENTER",
			["init_completed"] = 1,
			["text1"] = "%c",
			["text2"] = "遮蔽",
			["stacksContainment"] = "OUTSIDE",
			["zoom"] = 0,
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
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["desaturate"] = false,
			["text2Font"] = "Friz Quadrata TT",
			["inverse"] = false,
			["stickyDuration"] = false,
			["init_started"] = 1,
			["conditions"] = {
			},
			["cooldown"] = true,
			["parent"] = "萨格拉斯之墓 - 09#基尔加丹",
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
					["glow_frame"] = "WeakAuras:Artillery",
					["do_message"] = false,
					["do_sound"] = false,
					["message_type"] = "SAY",
					["glow_action"] = "show",
					["sound"] = "Interface\\AddOns\\Prat-3.0\\Sounds\\Link.ogg",
					["message"] = "",
				},
				["init"] = {
					["do_custom"] = true,
					["custom"] = "aura_env.spellID = 230920 -- Change to whatever debuff you want to keep track\naura_env.unitID = \"player\"\naura_env.filter = \"harmful\"\naura_env.alternativeText = \"DOT\"\n\naura_env.shortenNumber = function(number)\n    if type(number) ~= \"number\" then\n        number = tonumber(number)\n    end\n    if not number then\n        return\n    end\n    \n    local affixes = {\n        \"\",\n        \"K\",\n        \"M\",\n        \"B\",\n    }\n    \n    local affix = 1\n    local dec = 0\n    local num1 = math.abs(number)\n    while num1 >= 1000 and affix < #affixes do\n        num1 = num1 / 1000\n        affix = affix + 1\n    end\n    if affix > 1 then\n        dec = 2\n        local num2 = num1\n        while num2 >= 10 do\n            num2 = num2 / 10\n            dec = dec - 1\n        end\n    end\n    if number < 0 then\n        num1 = -num1\n    end\n    \n    return string.format(\"%.\"..dec..\"f\"..affixes[affix], num1)\nend",
				},
				["finish"] = {
				},
			},
			["fontFlags"] = "THICKOUTLINE",
			["useTooltip"] = false,
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["preset"] = "spiral",
					["type"] = "none",
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
				["fullscan"] = true,
				["type"] = "aura",
				["spellId"] = "230920",
				["unevent"] = "timed",
				["names"] = {
					"灵魂之刃", -- [1]
				},
				["duration"] = "2",
				["event"] = "Combat Log",
				["subeventPrefix"] = "SPELL",
				["spellIds"] = {
					200084, -- [1]
				},
				["use_spellId"] = true,
				["name"] = "吞噬之饥",
				["custom_hide"] = "timed",
				["subeventSuffix"] = "_CAST_START",
				["unit"] = "player",
				["use_unit"] = true,
				["debuffType"] = "HARMFUL",
			},
			["yOffset"] = 0,
			["text1Containment"] = "OUTSIDE",
			["stacksPoint"] = "BOTTOM",
			["text1Point"] = "TOP",
			["displayIcon"] = "132107",
			["text2FontFlags"] = "THICKOUTLINE",
			["height"] = 100,
			["parent"] = "萨格拉斯之墓 - 04#主母萨丝琳",
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
				["use_zoneId"] = true,
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
				["use_zone"] = false,
				["use_level"] = false,
				["class"] = {
					["multi"] = {
					},
				},
			},
			["icon"] = true,
			["numTriggers"] = 1,
			["fontSize"] = 15,
			["text2Containment"] = "OUTSIDE",
			["text1Enabled"] = true,
			["text1Color"] = {
				0, -- [1]
				0.701960784313726, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["selfPoint"] = "CENTER",
			["width"] = 100,
			["text1FontFlags"] = "THICKOUTLINE",
			["regionType"] = "icon",
			["text2Enabled"] = true,
			["xOffset"] = 0,
			["text2FontSize"] = 20,
			["id"] = "吞噬之饥",
			["desaturate"] = false,
			["text1"] = "%c",
			["text2"] = "吃水母圈",
			["stacksContainment"] = "OUTSIDE",
			["zoom"] = 0,
			["auto"] = true,
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["additional_triggers"] = {
			},
			["text1Font"] = "Friz Quadrata TT",
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["text2Font"] = "Friz Quadrata TT",
			["stickyDuration"] = false,
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
			["glow"] = false,
		},
		["饰品1冷却"] = {
			["glow"] = false,
			["text1FontSize"] = 18,
			["cooldownTextEnabled"] = true,
			["untrigger"] = {
				["itemSlot"] = 13,
				["itemName"] = 140800,
			},
			["anchorPoint"] = "CENTER",
			["activeTriggerMode"] = -10,
			["customTextUpdate"] = "update",
			["icon"] = true,
			["text1Enabled"] = false,
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["preset"] = "grow",
					["type"] = "none",
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
				["itemName"] = 140800,
				["unit"] = "player",
				["itemSlot"] = 13,
				["custom_hide"] = "timed",
				["type"] = "status",
				["subeventSuffix"] = "_CAST_START",
				["use_showOn"] = true,
				["event"] = "Cooldown Progress (Equipment Slot)",
				["use_unit"] = true,
				["use_itemSlot"] = true,
				["use_itemName"] = true,
				["spellIds"] = {
				},
				["unevent"] = "auto",
				["showOn"] = "showOnCooldown",
				["debuffType"] = "HELPFUL",
				["names"] = {
				},
				["subeventPrefix"] = "SPELL",
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
				["faction"] = {
					["multi"] = {
					},
				},
				["use_combat"] = true,
				["spec"] = {
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
			["disjunctive"] = "all",
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["regionType"] = "icon",
			["inverse"] = true,
			["xOffset"] = 0,
			["text2FontSize"] = 24,
			["text2Font"] = "Friz Quadrata TT",
			["anchorFrameType"] = "SCREEN",
			["text1"] = "%P",
			["text2Enabled"] = false,
			["text1FontFlags"] = "OUTLINE",
			["zoom"] = 0.2,
			["auto"] = true,
			["text2"] = "%p",
			["id"] = "饰品1冷却",
			["text1Font"] = "Friz Quadrata TT",
			["frameStrata"] = 1,
			["width"] = 50,
			["stickyDuration"] = false,
			["text2Point"] = "CENTER",
			["numTriggers"] = 1,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
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
					["message"] = "",
					["sound"] = "Interface\\AddOns\\Prat-3.0\\Sounds\\Link.ogg",
					["do_sound"] = false,
					["message_type"] = "SAY",
					["glow_action"] = "show",
					["do_message"] = false,
					["glow_frame"] = "WeakAuras:Artillery",
				},
				["init"] = {
					["do_custom"] = false,
					["custom"] = "\n\n",
				},
				["finish"] = {
				},
			},
			["fontFlags"] = "THICKOUTLINE",
			["useTooltip"] = false,
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["preset"] = "spiral",
					["type"] = "none",
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
				["spellId"] = "239932",
				["duration"] = "2",
				["use_unit"] = true,
				["specificUnit"] = "boss1",
				["debuffType"] = "HARMFUL",
				["type"] = "aura",
				["unevent"] = "timed",
				["event"] = "Combat Log",
				["custom_hide"] = "timed",
				["spellIds"] = {
					238505, -- [1]
				},
				["use_spellId"] = true,
				["name"] = "邪爪",
				["names"] = {
					"聚焦恐惧烈焰", -- [1]
				},
				["use_specific_unit"] = false,
				["unit"] = "player",
				["subeventSuffix"] = "_CAST_START",
				["subeventPrefix"] = "SPELL",
			},
			["desaturate"] = true,
			["parent"] = "萨格拉斯之墓 - 09#基尔加丹",
			["text1Containment"] = "OUTSIDE",
			["cooldown"] = true,
			["text1Point"] = "BOTTOM",
			["displayIcon"] = 464119,
			["text2FontFlags"] = "THICKOUTLINE",
			["height"] = 100,
			["yOffset"] = 0,
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
				["use_zoneId"] = true,
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
				["use_level"] = false,
				["use_zone"] = false,
				["class"] = {
					["multi"] = {
					},
				},
			},
			["numTriggers"] = 1,
			["glow"] = false,
			["fontSize"] = 15,
			["text2Containment"] = "OUTSIDE",
			["text1Enabled"] = true,
			["text1Color"] = {
				1, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["width"] = 100,
			["text2Enabled"] = false,
			["text1FontFlags"] = "THICKOUTLINE",
			["regionType"] = "icon",
			["xOffset"] = 0,
			["id"] = "聚焦恐惧烈焰 - 玩家",
			["text2FontSize"] = 24,
			["selfPoint"] = "CENTER",
			["init_completed"] = 1,
			["text1"] = "%c",
			["text2"] = "BOSS",
			["stacksContainment"] = "OUTSIDE",
			["zoom"] = 0,
			["auto"] = true,
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["additional_triggers"] = {
			},
			["text1Font"] = "Friz Quadrata TT",
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["icon"] = true,
			["text2Font"] = "Friz Quadrata TT",
			["inverse"] = false,
			["stickyDuration"] = false,
			["conditions"] = {
			},
			["stacksPoint"] = "BOTTOM",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
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
					["message"] = "",
					["sound"] = "Interface\\AddOns\\Prat-3.0\\Sounds\\Link.ogg",
					["do_sound"] = false,
					["message_type"] = "SAY",
					["glow_action"] = "show",
					["do_message"] = false,
					["glow_frame"] = "WeakAuras:Artillery",
				},
				["init"] = {
					["do_custom"] = true,
					["custom"] = "aura_env.spellID = 234310 -- Change to whatever debuff you want to keep track\naura_env.unitID = \"player\"\naura_env.filter = \"harmful\"\naura_env.alternativeText = \"DOT\"\n\naura_env.shortenNumber = function(number)\n    if type(number) ~= \"number\" then\n        number = tonumber(number)\n    end\n    if not number then\n        return\n    end\n    \n    local affixes = {\n        \"\",\n        \"K\",\n        \"M\",\n        \"B\",\n    }\n    \n    local affix = 1\n    local dec = 0\n    local num1 = math.abs(number)\n    while num1 >= 1000 and affix < #affixes do\n        num1 = num1 / 1000\n        affix = affix + 1\n    end\n    if affix > 1 then\n        dec = 2\n        local num2 = num1\n        while num2 >= 10 do\n            num2 = num2 / 10\n            dec = dec - 1\n        end\n    end\n    if number < 0 then\n        num1 = -num1\n    end\n    \n    return string.format(\"%.\"..dec..\"f\"..affixes[affix], num1)\nend",
				},
				["finish"] = {
				},
			},
			["fontFlags"] = "THICKOUTLINE",
			["useTooltip"] = false,
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["preset"] = "spiral",
					["type"] = "none",
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
				["debuffType"] = "HARMFUL",
				["type"] = "aura",
				["spellId"] = "234310",
				["unevent"] = "timed",
				["use_unit"] = true,
				["duration"] = "2",
				["event"] = "Combat Log",
				["names"] = {
					"灵魂之刃", -- [1]
				},
				["name"] = "末日之雨",
				["use_spellId"] = true,
				["spellIds"] = {
					200084, -- [1]
				},
				["custom_hide"] = "timed",
				["subeventSuffix"] = "_CAST_START",
				["unit"] = "player",
				["subeventPrefix"] = "SPELL",
				["fullscan"] = true,
			},
			["yOffset"] = 0,
			["text1Containment"] = "OUTSIDE",
			["cooldown"] = true,
			["text1Point"] = "BOTTOM",
			["displayIcon"] = 464119,
			["text2FontFlags"] = "OUTLINE",
			["height"] = 100,
			["parent"] = "萨格拉斯之墓 - 09#基尔加丹",
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
				["use_zoneId"] = true,
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
				["use_level"] = false,
				["use_zone"] = false,
				["class"] = {
					["multi"] = {
					},
				},
			},
			["icon"] = true,
			["numTriggers"] = 1,
			["fontSize"] = 15,
			["text2Containment"] = "OUTSIDE",
			["text1Enabled"] = true,
			["text1Color"] = {
				0, -- [1]
				0.701960784313726, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["desaturate"] = false,
			["width"] = 100,
			["text1FontFlags"] = "THICKOUTLINE",
			["regionType"] = "icon",
			["text2Enabled"] = false,
			["text1Font"] = "Friz Quadrata TT",
			["text2FontSize"] = 32,
			["id"] = "末日之雨",
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text1"] = "%c",
			["text2"] = "%s",
			["stacksContainment"] = "OUTSIDE",
			["zoom"] = 0,
			["auto"] = true,
			["xOffset"] = 0,
			["additional_triggers"] = {
			},
			["selfPoint"] = "CENTER",
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["text2Font"] = "Friz Quadrata TT",
			["stickyDuration"] = false,
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
			["stacksPoint"] = "BOTTOM",
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
					["do_sound"] = false,
					["do_message"] = false,
					["glow_frame"] = "WeakAuras:Artillery",
					["message_type"] = "SAY",
					["glow_action"] = "show",
					["sound"] = "Interface\\AddOns\\Prat-3.0\\Sounds\\Link.ogg",
					["message"] = "",
				},
				["init"] = {
					["do_custom"] = false,
					["custom"] = "\n\n",
				},
				["finish"] = {
				},
			},
			["fontFlags"] = "THICKOUTLINE",
			["useTooltip"] = false,
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["preset"] = "spiral",
					["type"] = "none",
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
				["spellId"] = "239932",
				["duration"] = "2",
				["use_unit"] = true,
				["specificUnit"] = "boss1",
				["custom_hide"] = "timed",
				["type"] = "aura",
				["subeventSuffix"] = "_CAST_START",
				["event"] = "Combat Log",
				["unit"] = "member",
				["name"] = "邪爪",
				["use_spellId"] = true,
				["spellIds"] = {
					244834, -- [1]
				},
				["names"] = {
					"虚空强风", -- [1]
				},
				["use_specific_unit"] = true,
				["unevent"] = "timed",
				["debuffType"] = "HELPFUL",
				["subeventPrefix"] = "SPELL",
			},
			["yOffset"] = 0,
			["text1Containment"] = "OUTSIDE",
			["parent"] = "萨格拉斯之墓 - 09#基尔加丹",
			["text1Point"] = "BOTTOM",
			["stacksPoint"] = "BOTTOM",
			["text2FontFlags"] = "THICKOUTLINE",
			["height"] = 100,
			["displayIcon"] = 464119,
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
				["use_zoneId"] = true,
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
				["use_zone"] = false,
				["use_level"] = false,
				["class"] = {
					["multi"] = {
					},
				},
			},
			["icon"] = true,
			["numTriggers"] = 1,
			["fontSize"] = 15,
			["text2Containment"] = "OUTSIDE",
			["text1Enabled"] = true,
			["text1Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["selfPoint"] = "CENTER",
			["width"] = 100,
			["text1FontFlags"] = "THICKOUTLINE",
			["regionType"] = "icon",
			["text2Enabled"] = true,
			["xOffset"] = 0,
			["text2FontSize"] = 24,
			["id"] = "虚空强风",
			["desaturate"] = false,
			["text1"] = "免疫",
			["text2"] = "BOSS",
			["stacksContainment"] = "OUTSIDE",
			["zoom"] = 0,
			["auto"] = true,
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["additional_triggers"] = {
			},
			["text1Font"] = "Friz Quadrata TT",
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["text2Font"] = "Friz Quadrata TT",
			["stickyDuration"] = false,
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
					["glow_frame"] = "WeakAuras:Artillery",
					["do_message"] = false,
					["do_sound"] = false,
					["message_type"] = "SAY",
					["glow_action"] = "show",
					["sound"] = "Interface\\AddOns\\Prat-3.0\\Sounds\\Link.ogg",
					["message"] = "",
				},
				["init"] = {
					["do_custom"] = false,
					["custom"] = "\n\n",
				},
				["finish"] = {
				},
			},
			["fontFlags"] = "THICKOUTLINE",
			["useTooltip"] = false,
			["glow"] = false,
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["preset"] = "spiral",
					["type"] = "none",
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
				["custom_hide"] = "timed",
				["name"] = "绝望",
				["use_spellId"] = true,
				["spellIds"] = {
					237590, -- [1]
				},
				["use_unit"] = true,
				["use_specific_unit"] = false,
				["unit"] = "player",
				["subeventSuffix"] = "_CAST_START",
				["subeventPrefix"] = "SPELL",
			},
			["parent"] = "萨格拉斯之墓 - 09#基尔加丹",
			["stacksPoint"] = "BOTTOM",
			["text1Containment"] = "OUTSIDE",
			["displayIcon"] = "458226",
			["text1Point"] = "BOTTOM",
			["cooldownTextEnabled"] = true,
			["text2FontFlags"] = "THICKOUTLINE",
			["height"] = 100,
			["numTriggers"] = 2,
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
				["role"] = {
					["single"] = "HEALER",
					["multi"] = {
						["TANK"] = true,
					},
				},
				["use_zoneId"] = true,
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["faction"] = {
					["multi"] = {
					},
				},
				["use_zone"] = false,
				["use_level"] = false,
				["class"] = {
					["multi"] = {
					},
				},
			},
			["icon"] = true,
			["selfPoint"] = "CENTER",
			["fontSize"] = 15,
			["text2Containment"] = "OUTSIDE",
			["width"] = 100,
			["text1Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text2Enabled"] = false,
			["customTriggerLogic"] = "function(trigger)\n    return trigger[1] and not trigger[2]\nend\n\n\n\n\n",
			["text1FontFlags"] = "THICKOUTLINE",
			["regionType"] = "icon",
			["xOffset"] = 0,
			["id"] = "绝望 - 施法",
			["text2FontSize"] = 24,
			["desaturate"] = false,
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text1"] = "治疗映像",
			["text2"] = "BOSS",
			["stacksContainment"] = "OUTSIDE",
			["zoom"] = 0,
			["auto"] = false,
			["text1Enabled"] = true,
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
			["text1Font"] = "Friz Quadrata TT",
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["text2Font"] = "Friz Quadrata TT",
			["stickyDuration"] = false,
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
		["Bloodelf Silence"] = {
			["outline"] = true,
			["glow"] = false,
			["text1FontSize"] = 12,
			["disjunctive"] = "any",
			["displayText"] = "%c",
			["customText"] = "function()\n    if  WeakAuras.IsOptionsOpen() then\n        aura_env.check[1] = 0\n        aura_env.name = {}\n        aura_env.duration = {}\n        aura_env.duration2 = {}\n        aura_env.activecheck = {}\n        return \"NAME - READY\"\n    else\n        local coloredName = function(name)\n            local _, class = UnitClass(name)\n            return string.format(\"|c%s%s\", RAID_CLASS_COLORS[class].colorStr, name)\n        end\n        result = \"\"\n        if aura_env.check[1] ~= GetNumGroupMembers() then\n            aura_env.check[1] = 50\n            return \"updating...\"\n        end\n        \n        for i=1,table.getn(aura_env.name) do\n            local name,realm = UnitName(aura_env.name[i])\n            if aura_env.name[i] ~= nil then\n                if aura_env.activecheck[i] == 0 then\n                    color = \"FFFFFFFF\" -- white\n                    result = result..string.format(\"%s |c%s%s%s\\n\", coloredName(name), color, \" - \", \"READY\")\n                elseif aura_env.activecheck[i] == 1 then\n                    color = \"FF00F9FF\" -- teal\n                    cooldown = aura_env.duration[i] - GetTime()\n                    result = result..string.format(\"%s |c%s%s%d\\n\", coloredName(name), color, \" - \", cooldown+0.5)\n                elseif aura_env.activecheck[i] == 2 then\n                    color = \"FF00FF00\" -- green\n                    cooldown = aura_env.duration[i] - GetTime()\n                    result = result..string.format(\"%s |c%s%s%d\\n\", coloredName(name), color, \" - \", cooldown+0.5)\n                elseif aura_env.activecheck[i] == 3 then\n                    color = \"FFFF0000\" -- red\n                    cooldown = aura_env.duration2[i] - GetTime()\n                    result = result..string.format(\"%s |c%s%s%d\\n\", coloredName(name), color, \" - \", cooldown+0.5)\n                end\n            end\n            \n        end\n        if result == \"\" then\n            aura_env.check[1] = 50\n            return \"updating...\"\n        end\n        \n        return result\n        \n    end\n    \nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
			["untrigger"] = {
				["use_specific_unit"] = true,
				["custom"] = "",
				["unit"] = "boss2",
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
					["do_message"] = false,
					["do_custom"] = false,
					["do_glow"] = false,
				},
				["init"] = {
					["custom"] = "aura_env.name = {}\naura_env.duration = {}\naura_env.duration2 = {}\naura_env.activecheck = {}\naura_env.check = {}\ntable.insert(aura_env.check, 0)\n\n\n\n",
					["do_custom"] = true,
				},
				["finish"] = {
					["custom"] = "aura_env.name = {}\naura_env.duration = {}\naura_env.duration2 = {}\naura_env.activecheck = {}\naura_env.check[1] = 0\n\n\n\n",
					["do_custom"] = true,
				},
			},
			["text1Enabled"] = true,
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["use_color"] = false,
					["type"] = "none",
				},
				["finish"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
			},
			["trigger"] = {
				["stack_info"] = "count",
				["use_alwaystrue"] = true,
				["unit"] = "group",
				["duration"] = "5",
				["use_spell"] = true,
				["use_unit"] = true,
				["use_specific_unit"] = false,
				["names"] = {
					"Volatile Rot", -- [1]
				},
				["spellIds"] = {
				},
				["debuffType"] = "HARMFUL",
				["group_count"] = "1",
				["events"] = "COMBAT_LOG_EVENT_UNFILTERED",
				["type"] = "custom",
				["group_countOperator"] = "==",
				["spell"] = "Lightning Bolt",
				["sourceName"] = "Elder Regail",
				["name_info"] = "aura",
				["custom_type"] = "status",
				["spellName"] = "Lightning Bolt",
				["unevent"] = "auto",
				["event"] = "Conditions",
				["subeventSuffix"] = "_CREATE",
				["use_sourceName"] = false,
				["use_spellName"] = false,
				["custom"] = "function(event, timestamp, event, hideCaster, sourceGUID, sourceName, sourceFlags, sourceRaidFlags, destGUID, destName, destFlags, destRaidFlags, spellID, spellName, spellSchool)\n    \n    \n    for i=1,table.getn(aura_env.activecheck) do\n        if event == \"SPELL_CAST_SUCCESS\" then\n            if (spellID == 28730) or (spellID) == 25046 or (spellID) == 69179 or (spellID) == 50613 or (spellID) == 129597 or (spellID) == 155145 or (spellID) == 202719 or (spellID) == 80483 or (spellID) == 232633 then\n                if aura_env.name[i] == sourceName then\n                    aura_env.duration2[i] = GetTime()+90\n                    aura_env.duration[i] = GetTime()+2\n                    aura_env.activecheck[i] = 2\n                end\n            end\n        end\n    end\nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
				["use_sourceUnit"] = true,
				["check"] = "event",
				["custom_hide"] = "timed",
				["sourceUnit"] = "target",
				["subeventPrefix"] = "SPELL",
			},
			["text1Containment"] = "OUTSIDE",
			["parent"] = "CC Tracker ",
			["text1Point"] = "RIGHT",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text2FontFlags"] = "OUTLINE",
			["height"] = 50,
			["xOffset"] = -681.3489074707,
			["load"] = {
				["talent"] = {
					["multi"] = {
					},
				},
				["use_size"] = true,
				["use_never"] = false,
				["zone"] = "Blackrock Foundry",
				["encounterid"] = "1853",
				["class"] = {
					["multi"] = {
					},
				},
				["use_zone"] = false,
				["use_encounterid"] = false,
				["difficulty"] = {
					["single"] = "mythic",
					["multi"] = {
						["mythic"] = true,
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
				["talent2"] = {
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
					["single"] = "party",
					["multi"] = {
						["party"] = true,
					},
				},
			},
			["displayIcon"] = 136222,
			["yOffset"] = 277.58770751953,
			["numTriggers"] = 2,
			["text2Containment"] = "INSIDE",
			["text1Font"] = "Vixar",
			["text1Color"] = {
				1, -- [1]
				1, -- [2]
				0.96470588235294, -- [3]
				1, -- [4]
			},
			["icon"] = true,
			["width"] = 50,
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["regionType"] = "icon",
			["text2Enabled"] = false,
			["desaturate"] = false,
			["text2FontSize"] = 24,
			["additional_triggers"] = {
				{
					["trigger"] = {
						["custom_hide"] = "timed",
						["type"] = "custom",
						["custom"] = "function()\n    if aura_env.check[1] == 0 or aura_env.check[1] == 45 then\n        aura_env.name = {}\n        for i=1, GetNumGroupMembers() do\n            aura_env.check[1] = GetNumGroupMembers()\n            local name, rank, subgroup, level, class = GetRaidRosterInfo(i)\n            if name ~= nil then\n                race, raceEn = UnitRace(name)\n                if raceEn == \"BloodElf\" then\n                    table.insert(aura_env.duration, GetTime()+0)\n                    table.insert(aura_env.duration2, GetTime()+0)\n                    table.insert(aura_env.activecheck, 0)\n                    table.insert(aura_env.name, name)\n                end\n            end\n        end\n        \n        \n        \n        \n        if table.getn(aura_env.name) > 0 then\n            return true\n        else \n            return false\n        end\n    end\n    for i=1,getn(aura_env.activecheck) do\n        if aura_env.activecheck[i] == 2 then\n            if aura_env.duration[i] - GetTime() <= 0 then\n                aura_env.activecheck[i] = 3\n            end\n        elseif aura_env.activecheck[i] == 3 then\n            if aura_env.duration2[i] - GetTime() <= 0 then\n                aura_env.activecheck[i] = 0\n            end\n        end\n    end\nend\n\n\n",
						["custom_type"] = "status",
						["check"] = "update",
						["subeventSuffix"] = "_CAST_START",
						["event"] = "Health",
						["subeventPrefix"] = "SPELL",
					},
					["untrigger"] = {
						["custom"] = "function()\n    if aura_env.check[1] == 50 then\n        aura_env.name = {}\n        aura_env.check[1] = 45\n        return true\n    end\nend\n\n\n\n\n\n\n",
					},
				}, -- [1]
			},
			["init_completed"] = 1,
			["text1"] = "%c",
			["selfPoint"] = "CENTER",
			["auto"] = false,
			["zoom"] = 0.3,
			["justify"] = "LEFT",
			["text2"] = "%p",
			["id"] = "Bloodelf Silence",
			["text1FontFlags"] = "OUTLINE",
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["cooldownTextEnabled"] = true,
			["text2Font"] = "Friz Quadrata TT",
			["inverse"] = false,
			["stickyDuration"] = false,
			["conditions"] = {
			},
			["cooldown"] = true,
			["text2Point"] = "CENTER",
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
			["yOffset"] = -81.3760681152344,
			["borderEdge"] = "None",
			["borderOffset"] = 5,
			["anchorPoint"] = "CENTER",
			["selfPoint"] = "BOTTOMLEFT",
			["id"] = "饰品冷却",
			["borderColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0.5, -- [4]
			},
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
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
			["borderInset"] = 11,
			["numTriggers"] = 1,
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
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
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
				["difficulty"] = {
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
			["xOffset"] = -457.231018066406,
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
			["borderEdge"] = "None",
			["border"] = false,
			["untrigger"] = {
			},
			["anchorPoint"] = "CENTER",
			["borderSize"] = 16,
			["yOffset"] = 35.8126220703125,
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
			["url"] = "https://wago.io/E15flIcYW/5",
			["expanded"] = false,
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
			["additional_triggers"] = {
			},
			["borderOffset"] = 5,
			["version"] = 5,
			["selfPoint"] = "BOTTOMLEFT",
			["id"] = "CC Tracker ",
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
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["desc"] = "Author: (EU)Reloh-Blackrock Reloe#2787",
			["borderInset"] = 11,
			["numTriggers"] = 1,
			["activeTriggerMode"] = -10,
			["regionType"] = "group",
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
				["faction"] = {
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
				["use_class"] = false,
				["spec"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["xOffset"] = -1.3839111328125,
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
					["message"] = "",
					["sound"] = "Interface\\AddOns\\Prat-3.0\\Sounds\\Link.ogg",
					["do_sound"] = false,
					["message_type"] = "SAY",
					["glow_action"] = "show",
					["do_message"] = false,
					["glow_frame"] = "WeakAuras:Artillery",
				},
				["init"] = {
					["do_custom"] = true,
					["custom"] = "aura_env.spellID = 240262 -- Change to whatever debuff you want to keep track\naura_env.unitID = \"player\"\naura_env.filter = \"harmful\"\naura_env.alternativeText = \"DOT\"\n\naura_env.shortenNumber = function(number)\n    if type(number) ~= \"number\" then\n        number = tonumber(number)\n    end\n    if not number then\n        return\n    end\n    \n    local affixes = {\n        \"\",\n        \"K\",\n        \"M\",\n        \"B\",\n    }\n    \n    local affix = 1\n    local dec = 0\n    local num1 = math.abs(number)\n    while num1 >= 1000 and affix < #affixes do\n        num1 = num1 / 1000\n        affix = affix + 1\n    end\n    if affix > 1 then\n        dec = 2\n        local num2 = num1\n        while num2 >= 10 do\n            num2 = num2 / 10\n            dec = dec - 1\n        end\n    end\n    if number < 0 then\n        num1 = -num1\n    end\n    \n    return string.format(\"%.\"..dec..\"f\"..affixes[affix], num1)\nend",
				},
				["finish"] = {
				},
			},
			["fontFlags"] = "THICKOUTLINE",
			["useTooltip"] = false,
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["preset"] = "spiral",
					["type"] = "none",
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
				["debuffType"] = "HARMFUL",
				["type"] = "aura",
				["spellId"] = "240262",
				["unevent"] = "timed",
				["use_unit"] = true,
				["duration"] = "2",
				["event"] = "Combat Log",
				["names"] = {
					"灵魂之刃", -- [1]
				},
				["name"] = "燃烧",
				["use_spellId"] = true,
				["spellIds"] = {
					200084, -- [1]
				},
				["custom_hide"] = "timed",
				["subeventSuffix"] = "_CAST_START",
				["unit"] = "player",
				["subeventPrefix"] = "SPELL",
				["fullscan"] = true,
			},
			["yOffset"] = 0,
			["text1Containment"] = "OUTSIDE",
			["cooldown"] = true,
			["text1Point"] = "BOTTOM",
			["displayIcon"] = 464119,
			["text2FontFlags"] = "OUTLINE",
			["height"] = 100,
			["parent"] = "萨格拉斯之墓 - 09#基尔加丹",
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
				["use_zoneId"] = true,
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
				["use_level"] = false,
				["use_zone"] = false,
				["class"] = {
					["multi"] = {
					},
				},
			},
			["icon"] = true,
			["numTriggers"] = 1,
			["fontSize"] = 15,
			["text2Containment"] = "OUTSIDE",
			["text1Enabled"] = true,
			["text1Color"] = {
				0, -- [1]
				0.701960784313726, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["desaturate"] = false,
			["width"] = 100,
			["text1FontFlags"] = "THICKOUTLINE",
			["regionType"] = "icon",
			["text2Enabled"] = false,
			["text1Font"] = "Friz Quadrata TT",
			["text2FontSize"] = 32,
			["id"] = "燃烧 2",
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text1"] = "%c",
			["text2"] = "%s",
			["stacksContainment"] = "OUTSIDE",
			["zoom"] = 0,
			["auto"] = true,
			["xOffset"] = 0,
			["additional_triggers"] = {
			},
			["selfPoint"] = "CENTER",
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["text2Font"] = "Friz Quadrata TT",
			["stickyDuration"] = false,
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
			["stacksPoint"] = "BOTTOM",
			["text2Point"] = "TOP",
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
			["yOffset"] = 400,
			["activeTriggerMode"] = 0,
			["customTextUpdate"] = "update",
			["init_completed"] = 1,
			["actions"] = {
				["start"] = {
					["sound_channel"] = "Master",
					["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\BikeHorn.mp3",
					["do_message"] = false,
					["do_sound"] = false,
				},
				["finish"] = {
				},
				["init"] = {
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
			["id"] = "Encounter Time",
			["height"] = 24.0682678222656,
			["justify"] = "CENTER",
			["selfPoint"] = "CENTER",
			["additional_triggers"] = {
			},
			["trigger"] = {
				["type"] = "custom",
				["custom_hide"] = "custom",
				["custom_type"] = "event",
				["custom"] = "function()\n    if (UnitExists(\"boss1\") and UnitIsDeadOrGhost(\"player\")) or UnitAffectingCombat(\"player\") or InCombatLockdown() then\n        WA_xXx_Combat_Start = WA_xXx_Combat_Start or GetTime()\n        return true\n    else\n        WA_xXx_Combat_Start = nil\n        return false\n    end\nend",
				["duration"] = "1",
				["event"] = "Health",
				["subeventPrefix"] = "SPELL",
				["customDuration"] = "",
				["customName"] = "",
				["events"] = "INSTANCE_ENCOUNTER_ENGAGE_UNIT, PLAYER_REGEN_DISABLED, PLAYER_REGEN_ENABLED",
				["spellIds"] = {
				},
				["subeventSuffix"] = "_CAST_START",
				["names"] = {
				},
				["unit"] = "player",
				["debuffType"] = "HELPFUL",
			},
			["frameStrata"] = 5,
			["width"] = 74.2992095947266,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["font"] = "DIGITAL",
			["numTriggers"] = 1,
			["anchorFrameType"] = "SCREEN",
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
				["class"] = {
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
			["anchorPoint"] = "CENTER",
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
					["message"] = "",
					["sound"] = "Interface\\AddOns\\Prat-3.0\\Sounds\\Link.ogg",
					["do_sound"] = false,
					["message_type"] = "SAY",
					["glow_action"] = "show",
					["do_message"] = false,
					["glow_frame"] = "WeakAuras:Artillery",
				},
				["init"] = {
					["do_custom"] = true,
					["custom"] = "aura_env.spellID = 232913 -- Change to whatever debuff you want to keep track\naura_env.unitID = \"player\"\naura_env.filter = \"harmful\"\naura_env.alternativeText = \"DOT\"\n\naura_env.shortenNumber = function(number)\n    if type(number) ~= \"number\" then\n        number = tonumber(number)\n    end\n    if not number then\n        return\n    end\n    \n    local affixes = {\n        \"\",\n        \"K\",\n        \"M\",\n        \"B\",\n    }\n    \n    local affix = 1\n    local dec = 0\n    local num1 = math.abs(number)\n    while num1 >= 1000 and affix < #affixes do\n        num1 = num1 / 1000\n        affix = affix + 1\n    end\n    if affix > 1 then\n        dec = 2\n        local num2 = num1\n        while num2 >= 10 do\n            num2 = num2 / 10\n            dec = dec - 1\n        end\n    end\n    if number < 0 then\n        num1 = -num1\n    end\n    \n    return string.format(\"%.\"..dec..\"f\"..affixes[affix], num1)\nend",
				},
				["finish"] = {
				},
			},
			["fontFlags"] = "THICKOUTLINE",
			["useTooltip"] = false,
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["preset"] = "spiral",
					["type"] = "none",
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
				["debuffType"] = "HARMFUL",
				["type"] = "aura",
				["spellId"] = "232913",
				["unevent"] = "timed",
				["names"] = {
					"灵魂之刃", -- [1]
				},
				["duration"] = "2",
				["event"] = "Combat Log",
				["subeventPrefix"] = "SPELL",
				["name"] = "污染墨汁",
				["use_spellId"] = true,
				["spellIds"] = {
					200084, -- [1]
				},
				["custom_hide"] = "timed",
				["subeventSuffix"] = "_CAST_START",
				["unit"] = "player",
				["use_unit"] = true,
				["fullscan"] = true,
			},
			["yOffset"] = 0,
			["text1Containment"] = "OUTSIDE",
			["cooldown"] = true,
			["text1Point"] = "TOP",
			["displayIcon"] = "132107",
			["text2FontFlags"] = "THICKOUTLINE",
			["height"] = 100,
			["parent"] = "萨格拉斯之墓 - 04#主母萨丝琳",
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
				["role"] = {
					["single"] = "TANK",
					["multi"] = {
						["TANK"] = true,
					},
				},
				["zoneId"] = "1147",
				["use_zone"] = false,
				["class"] = {
					["multi"] = {
					},
				},
			},
			["icon"] = true,
			["numTriggers"] = 2,
			["fontSize"] = 15,
			["text2Containment"] = "OUTSIDE",
			["text1Enabled"] = true,
			["text1Color"] = {
				0, -- [1]
				0.701960784313726, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["selfPoint"] = "CENTER",
			["width"] = 100,
			["text1FontFlags"] = "THICKOUTLINE",
			["regionType"] = "icon",
			["text2Enabled"] = true,
			["xOffset"] = 0,
			["text2FontSize"] = 20,
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
						["custom_hide"] = "timed",
						["inverse"] = true,
						["names"] = {
							"吞噬巨口", -- [1]
						},
						["unit"] = "player",
						["debuffType"] = "HARMFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
			},
			["desaturate"] = false,
			["text1"] = "%c",
			["text2"] = "减速",
			["stacksContainment"] = "OUTSIDE",
			["zoom"] = 0,
			["auto"] = true,
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["id"] = "污染墨汁",
			["text1Font"] = "Friz Quadrata TT",
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["text2Font"] = "Friz Quadrata TT",
			["stickyDuration"] = false,
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
			["stacksPoint"] = "BOTTOM",
			["glow"] = false,
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
					["do_sound"] = false,
					["do_message"] = false,
					["glow_frame"] = "WeakAuras:Artillery",
					["message_type"] = "SAY",
					["glow_action"] = "show",
					["sound"] = "Interface\\AddOns\\Prat-3.0\\Sounds\\Link.ogg",
					["message"] = "",
				},
				["init"] = {
					["do_custom"] = false,
					["custom"] = "\n\n",
				},
				["finish"] = {
				},
			},
			["fontFlags"] = "THICKOUTLINE",
			["useTooltip"] = false,
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["preset"] = "spiral",
					["type"] = "none",
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
				["custom_hide"] = "timed",
				["use_specific_unit"] = false,
				["use_spellId"] = true,
				["name"] = "邪爪",
				["use_unit"] = true,
				["spellIds"] = {
					239932, -- [1]
				},
				["unit"] = "player",
				["subeventSuffix"] = "_CAST_START",
				["fullscan"] = true,
			},
			["text1Containment"] = "OUTSIDE",
			["desaturate"] = true,
			["parent"] = "萨格拉斯之墓 - 09#基尔加丹",
			["text1Point"] = "BOTTOM",
			["stacksPoint"] = "BOTTOM",
			["text2FontFlags"] = "THICKOUTLINE",
			["height"] = 100,
			["displayIcon"] = 464119,
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
				["use_zoneId"] = true,
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
				["use_zone"] = false,
				["use_level"] = false,
				["class"] = {
					["multi"] = {
					},
				},
			},
			["glow"] = false,
			["numTriggers"] = 1,
			["fontSize"] = 15,
			["text2Containment"] = "OUTSIDE",
			["icon"] = true,
			["text1Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["selfPoint"] = "CENTER",
			["width"] = 100,
			["text1FontFlags"] = "THICKOUTLINE",
			["regionType"] = "icon",
			["text2Enabled"] = false,
			["text1Font"] = "Friz Quadrata TT",
			["text2FontSize"] = 24,
			["id"] = "邪爪 - debuff",
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text1"] = "易伤: %s%",
			["text2"] = "BOSS",
			["stacksContainment"] = "OUTSIDE",
			["zoom"] = 0,
			["auto"] = true,
			["xOffset"] = 0,
			["additional_triggers"] = {
			},
			["text1Enabled"] = true,
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["text2Font"] = "Friz Quadrata TT",
			["stickyDuration"] = false,
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
					["glow_frame"] = "WeakAuras:Artillery",
					["do_message"] = false,
					["do_sound"] = false,
					["message_type"] = "SAY",
					["glow_action"] = "show",
					["sound"] = "Interface\\AddOns\\Prat-3.0\\Sounds\\Link.ogg",
					["message"] = "",
				},
				["init"] = {
					["do_custom"] = false,
					["custom"] = "\n\n",
				},
				["finish"] = {
				},
			},
			["fontFlags"] = "THICKOUTLINE",
			["useTooltip"] = false,
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["preset"] = "spiral",
					["type"] = "none",
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
				["custom_hide"] = "timed",
				["type"] = "aura",
				["spellId"] = "230139",
				["unevent"] = "timed",
				["names"] = {
					"滑不留手", -- [1]
				},
				["duration"] = "2",
				["event"] = "Combat Log",
				["subeventPrefix"] = "SPELL",
				["name"] = "多头蛇射击",
				["subcount"] = true,
				["spellIds"] = {
					239420, -- [1]
				},
				["use_spellId"] = true,
				["subeventSuffix"] = "_CAST_START",
				["unit"] = "player",
				["use_unit"] = true,
				["debuffType"] = "HARMFUL",
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
			["stacksPoint"] = "BOTTOM",
			["text2FontFlags"] = "THICKOUTLINE",
			["height"] = 100,
			["displayIcon"] = 464119,
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
				["use_zoneId"] = true,
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
				["use_zone"] = false,
				["use_level"] = false,
				["class"] = {
					["multi"] = {
					},
				},
			},
			["yOffset"] = 0,
			["numTriggers"] = 1,
			["fontSize"] = 15,
			["text2Containment"] = "OUTSIDE",
			["glow"] = false,
			["text1Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["icon"] = true,
			["width"] = 100,
			["text1FontFlags"] = "THICKOUTLINE",
			["regionType"] = "icon",
			["text2Enabled"] = false,
			["selfPoint"] = "CENTER",
			["text2FontSize"] = 20,
			["additional_triggers"] = {
			},
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text1"] = "不能拿鱼",
			["text2"] = "%p",
			["stacksContainment"] = "OUTSIDE",
			["zoom"] = 0,
			["auto"] = true,
			["text1Font"] = "Friz Quadrata TT",
			["id"] = "滑不留手",
			["xOffset"] = 0,
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["text1Enabled"] = true,
			["text2Font"] = "Friz Quadrata TT",
			["inverse"] = false,
			["stickyDuration"] = false,
			["conditions"] = {
			},
			["cooldown"] = true,
			["parent"] = "萨格拉斯之墓 - 04#主母萨丝琳",
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
					["message"] = "",
					["sound"] = "Interface\\AddOns\\Prat-3.0\\Sounds\\Link.ogg",
					["glow_frame"] = "WeakAuras:Artillery",
					["message_type"] = "SAY",
					["glow_action"] = "show",
					["do_message"] = false,
					["do_sound"] = false,
				},
				["init"] = {
					["do_custom"] = false,
					["custom"] = "\n\n",
				},
				["finish"] = {
				},
			},
			["fontFlags"] = "THICKOUTLINE",
			["desaturate"] = true,
			["useTooltip"] = false,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["preset"] = "spiral",
					["type"] = "none",
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
				["custom_hide"] = "timed",
				["spellIds"] = {
					237590, -- [1]
				},
				["use_spellId"] = true,
				["name"] = "千魂之暗",
				["use_specific_unit"] = false,
				["use_unit"] = true,
				["unit"] = "player",
				["subeventSuffix"] = "_CAST_START",
				["subeventPrefix"] = "SPELL",
			},
			["cooldown"] = true,
			["displayIcon"] = "136123",
			["text1Containment"] = "OUTSIDE",
			["yOffset"] = 0,
			["text1Point"] = "BOTTOM",
			["numTriggers"] = 2,
			["text2FontFlags"] = "THICKOUTLINE",
			["height"] = 100,
			["glow"] = false,
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
				["role"] = {
					["single"] = "HEALER",
					["multi"] = {
						["HEALER"] = true,
						["TANK"] = true,
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
				["use_zoneId"] = true,
				["zoneId"] = "1147",
				["use_zone"] = false,
				["class"] = {
					["multi"] = {
					},
				},
			},
			["icon"] = true,
			["width"] = 100,
			["fontSize"] = 15,
			["text2Containment"] = "OUTSIDE",
			["text2Enabled"] = false,
			["text1Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text1Font"] = "Friz Quadrata TT",
			["customTriggerLogic"] = "\n\n",
			["text1FontFlags"] = "THICKOUTLINE",
			["regionType"] = "icon",
			["additional_triggers"] = {
				{
					["trigger"] = {
						["subeventPrefix"] = "SPELL",
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
						["debuffType"] = "HARMFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
			},
			["text1Enabled"] = true,
			["text2FontSize"] = 24,
			["selfPoint"] = "CENTER",
			["init_completed"] = 1,
			["text1"] = "%c",
			["text2"] = "BOSS",
			["stacksContainment"] = "OUTSIDE",
			["zoom"] = 0,
			["auto"] = false,
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["id"] = "千魂之暗 - 施法",
			["xOffset"] = 0,
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["cooldownTextEnabled"] = true,
			["text2Font"] = "Friz Quadrata TT",
			["inverse"] = false,
			["stickyDuration"] = false,
			["init_started"] = 1,
			["conditions"] = {
			},
			["stacksPoint"] = "BOTTOM",
			["parent"] = "萨格拉斯之墓 - 09#基尔加丹",
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
					["message"] = "",
					["sound"] = "Interface\\AddOns\\Prat-3.0\\Sounds\\Link.ogg",
					["do_sound"] = false,
					["message_type"] = "SAY",
					["glow_action"] = "show",
					["do_message"] = false,
					["glow_frame"] = "WeakAuras:Artillery",
				},
				["init"] = {
					["do_custom"] = false,
					["custom"] = "\n\n",
				},
				["finish"] = {
				},
			},
			["fontFlags"] = "THICKOUTLINE",
			["useTooltip"] = false,
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["preset"] = "spiral",
					["type"] = "none",
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
				["debuffType"] = "HARMFUL",
				["type"] = "aura",
				["spellId"] = "230139",
				["subeventSuffix"] = "_AURA_APPLIED",
				["unevent"] = "timed",
				["duration"] = "2",
				["event"] = "Combat Log",
				["subeventPrefix"] = "SPELL",
				["names"] = {
					"多头蛇射击", -- [1]
				},
				["subcount"] = true,
				["name"] = "多头蛇射击",
				["use_spellId"] = true,
				["spellIds"] = {
					230139, -- [1]
				},
				["unit"] = "player",
				["use_unit"] = true,
				["custom_hide"] = "timed",
			},
			["parent"] = "萨格拉斯之墓 - 04#主母萨丝琳",
			["text1Containment"] = "OUTSIDE",
			["text2Point"] = "TOP",
			["text1Point"] = "BOTTOM",
			["cooldown"] = true,
			["text2FontFlags"] = "THICKOUTLINE",
			["height"] = 100,
			["displayIcon"] = 464119,
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
				["use_zoneId"] = true,
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
				["zoneId"] = "1147",
				["use_zone"] = false,
				["class"] = {
					["multi"] = {
					},
				},
			},
			["icon"] = true,
			["numTriggers"] = 1,
			["fontSize"] = 15,
			["text2Containment"] = "OUTSIDE",
			["text1Enabled"] = true,
			["text1Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["desaturate"] = false,
			["width"] = 100,
			["text1FontFlags"] = "THICKOUTLINE",
			["regionType"] = "icon",
			["text2Enabled"] = false,
			["xOffset"] = 0,
			["text2FontSize"] = 20,
			["additional_triggers"] = {
			},
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text1"] = "找人分担",
			["text2"] = "%p",
			["stacksContainment"] = "OUTSIDE",
			["zoom"] = 0,
			["auto"] = true,
			["text1Font"] = "Friz Quadrata TT",
			["id"] = "多头蛇射击",
			["selfPoint"] = "CENTER",
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["text2Font"] = "Friz Quadrata TT",
			["stickyDuration"] = false,
			["inverse"] = false,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["stacksPoint"] = "BOTTOM",
			["yOffset"] = 0,
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
					["do_sound"] = false,
					["do_message"] = false,
					["glow_frame"] = "WeakAuras:Artillery",
					["message_type"] = "SAY",
					["glow_action"] = "show",
					["sound"] = "Interface\\AddOns\\Prat-3.0\\Sounds\\Link.ogg",
					["message"] = "",
				},
				["init"] = {
					["do_custom"] = true,
					["custom"] = "aura_env.spellID = 232754 -- Change to whatever debuff you want to keep track\naura_env.unitID = \"player\"\naura_env.filter = \"harmful\"\naura_env.alternativeText = \"DOT\"\n\naura_env.shortenNumber = function(number)\n    if type(number) ~= \"number\" then\n        number = tonumber(number)\n    end\n    if not number then\n        return\n    end\n    \n    local affixes = {\n        \"\",\n        \"K\",\n        \"M\",\n        \"B\",\n    }\n    \n    local affix = 1\n    local dec = 0\n    local num1 = math.abs(number)\n    while num1 >= 1000 and affix < #affixes do\n        num1 = num1 / 1000\n        affix = affix + 1\n    end\n    if affix > 1 then\n        dec = 2\n        local num2 = num1\n        while num2 >= 10 do\n            num2 = num2 / 10\n            dec = dec - 1\n        end\n    end\n    if number < 0 then\n        num1 = -num1\n    end\n    \n    return string.format(\"%.\"..dec..\"f\"..affixes[affix], num1)\nend",
				},
				["finish"] = {
				},
			},
			["fontFlags"] = "THICKOUTLINE",
			["useTooltip"] = false,
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["preset"] = "spiral",
					["type"] = "none",
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
				["fullscan"] = true,
				["type"] = "aura",
				["spellId"] = "232754",
				["unevent"] = "timed",
				["use_unit"] = true,
				["duration"] = "2",
				["event"] = "Combat Log",
				["subeventPrefix"] = "SPELL",
				["name"] = "多头蛇酸液",
				["use_spellId"] = true,
				["spellIds"] = {
					200084, -- [1]
				},
				["custom_hide"] = "timed",
				["subeventSuffix"] = "_CAST_START",
				["unit"] = "player",
				["names"] = {
					"灵魂之刃", -- [1]
				},
				["debuffType"] = "HARMFUL",
			},
			["yOffset"] = 0,
			["desaturate"] = true,
			["stacksPoint"] = "BOTTOM",
			["text1Point"] = "TOP",
			["displayIcon"] = "132107",
			["text2FontFlags"] = "THICKOUTLINE",
			["height"] = 100,
			["text1Containment"] = "OUTSIDE",
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
				["race"] = {
					["multi"] = {
					},
				},
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
				["faction"] = {
					["multi"] = {
					},
				},
				["use_zone"] = false,
				["use_level"] = false,
				["class"] = {
					["multi"] = {
					},
				},
			},
			["glow"] = false,
			["numTriggers"] = 1,
			["fontSize"] = 15,
			["text2Containment"] = "OUTSIDE",
			["icon"] = true,
			["text1Color"] = {
				0, -- [1]
				0.701960784313726, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text2Color"] = {
				1, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["width"] = 100,
			["text1FontFlags"] = "THICKOUTLINE",
			["regionType"] = "icon",
			["text2Enabled"] = true,
			["xOffset"] = 0,
			["text2FontSize"] = 22,
			["id"] = "多头蛇酸液",
			["text1Enabled"] = true,
			["text1"] = "%c",
			["text2"] = "不要分担",
			["stacksContainment"] = "OUTSIDE",
			["zoom"] = 0,
			["auto"] = true,
			["selfPoint"] = "CENTER",
			["additional_triggers"] = {
			},
			["text1Font"] = "Friz Quadrata TT",
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["text2Font"] = "Friz Quadrata TT",
			["stickyDuration"] = false,
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
			["parent"] = "萨格拉斯之墓 - 04#主母萨丝琳",
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
					["message"] = "",
					["sound"] = "Interface\\AddOns\\Prat-3.0\\Sounds\\Link.ogg",
					["do_sound"] = false,
					["message_type"] = "SAY",
					["glow_action"] = "show",
					["do_message"] = false,
					["glow_frame"] = "WeakAuras:Artillery",
				},
				["init"] = {
					["do_custom"] = true,
					["custom"] = "aura_env.spellID = 243536 -- Change to whatever debuff you want to keep track\naura_env.unitID = \"player\"\naura_env.filter = \"harmful\"\naura_env.alternativeText = \"DOT\"\n\naura_env.shortenNumber = function(number)\n    if type(number) ~= \"number\" then\n        number = tonumber(number)\n    end\n    if not number then\n        return\n    end\n    \n    local affixes = {\n        \"\",\n        \"K\",\n        \"M\",\n        \"B\",\n    }\n    \n    local affix = 1\n    local dec = 0\n    local num1 = math.abs(number)\n    while num1 >= 1000 and affix < #affixes do\n        num1 = num1 / 1000\n        affix = affix + 1\n    end\n    if affix > 1 then\n        dec = 2\n        local num2 = num1\n        while num2 >= 10 do\n            num2 = num2 / 10\n            dec = dec - 1\n        end\n    end\n    if number < 0 then\n        num1 = -num1\n    end\n    \n    return string.format(\"%.\"..dec..\"f\"..affixes[affix], num1)\nend",
				},
				["finish"] = {
				},
			},
			["fontFlags"] = "THICKOUTLINE",
			["useTooltip"] = false,
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["preset"] = "spiral",
					["type"] = "none",
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
				["custom_hide"] = "timed",
				["type"] = "aura",
				["spellId"] = "243536",
				["unevent"] = "timed",
				["debuffType"] = "HARMFUL",
				["duration"] = "2",
				["event"] = "Combat Log",
				["subeventPrefix"] = "SPELL",
				["spellIds"] = {
					200084, -- [1]
				},
				["use_spellId"] = true,
				["name"] = "萦绕的爆发",
				["names"] = {
					"灵魂之刃", -- [1]
				},
				["subeventSuffix"] = "_CAST_START",
				["unit"] = "player",
				["use_unit"] = true,
				["fullscan"] = true,
			},
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text1Containment"] = "OUTSIDE",
			["cooldown"] = true,
			["text1Point"] = "TOP",
			["displayIcon"] = 464119,
			["text2FontFlags"] = "THICKOUTLINE",
			["height"] = 100,
			["parent"] = "萨格拉斯之墓 - 09#基尔加丹",
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
				["use_zoneId"] = true,
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
				["use_level"] = false,
				["use_zone"] = false,
				["class"] = {
					["multi"] = {
					},
				},
			},
			["glow"] = false,
			["numTriggers"] = 1,
			["fontSize"] = 15,
			["text2Containment"] = "OUTSIDE",
			["icon"] = true,
			["text1Color"] = {
				0, -- [1]
				0.701960784313726, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text1Enabled"] = true,
			["width"] = 100,
			["text2Color"] = {
				1, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["regionType"] = "icon",
			["text2Enabled"] = true,
			["xOffset"] = 0,
			["text2FontSize"] = 20,
			["additional_triggers"] = {
			},
			["selfPoint"] = "CENTER",
			["text1"] = "%c",
			["text2"] = "保持移动",
			["stacksContainment"] = "OUTSIDE",
			["zoom"] = 0,
			["auto"] = true,
			["desaturate"] = false,
			["id"] = "萦绕的爆发",
			["text1Font"] = "Friz Quadrata TT",
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["text1FontFlags"] = "THICKOUTLINE",
			["text2Font"] = "Friz Quadrata TT",
			["inverse"] = false,
			["stickyDuration"] = false,
			["init_started"] = 1,
			["conditions"] = {
			},
			["stacksPoint"] = "BOTTOM",
			["yOffset"] = 0,
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
					["glow_frame"] = "WeakAuras:Artillery",
					["do_message"] = false,
					["do_sound"] = false,
					["message_type"] = "SAY",
					["glow_action"] = "show",
					["sound"] = "Sound\\Interface\\AlarmClockWarning2.ogg",
					["message"] = "",
				},
				["init"] = {
					["do_custom"] = false,
					["custom"] = "\n\n",
				},
				["finish"] = {
				},
			},
			["fontFlags"] = "THICKOUTLINE",
			["useTooltip"] = false,
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["preset"] = "spiral",
					["type"] = "none",
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
				["custom_hide"] = "timed",
				["type"] = "event",
				["spellId"] = "232827",
				["unevent"] = "timed",
				["names"] = {
					"多头蛇射击", -- [1]
				},
				["duration"] = "4",
				["event"] = "Combat Log",
				["subeventPrefix"] = "SPELL",
				["use_spellId"] = true,
				["subcount"] = true,
				["spellIds"] = {
					230139, -- [1]
				},
				["name"] = "碎裂波动",
				["subeventSuffix"] = "_CAST_START",
				["unit"] = "player",
				["use_unit"] = true,
				["debuffType"] = "HARMFUL",
			},
			["glow"] = false,
			["text1Containment"] = "OUTSIDE",
			["parent"] = "萨格拉斯之墓 - 04#主母萨丝琳",
			["text1Point"] = "BOTTOM",
			["stacksPoint"] = "BOTTOM",
			["text2FontFlags"] = "THICKOUTLINE",
			["height"] = 100,
			["displayIcon"] = "135861",
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
				["use_zoneId"] = true,
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
				["use_zone"] = false,
				["use_level"] = false,
				["class"] = {
					["multi"] = {
					},
				},
			},
			["icon"] = true,
			["numTriggers"] = 1,
			["fontSize"] = 15,
			["text2Containment"] = "OUTSIDE",
			["text1Enabled"] = true,
			["text1Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["desaturate"] = false,
			["width"] = 100,
			["text1FontFlags"] = "THICKOUTLINE",
			["regionType"] = "icon",
			["text2Enabled"] = false,
			["text1Font"] = "Friz Quadrata TT",
			["text2FontSize"] = 20,
			["id"] = "碎裂波动",
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text1"] = "躲开",
			["text2"] = "%p",
			["stacksContainment"] = "OUTSIDE",
			["zoom"] = 0,
			["auto"] = false,
			["xOffset"] = 0,
			["additional_triggers"] = {
			},
			["selfPoint"] = "CENTER",
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["text2Font"] = "Friz Quadrata TT",
			["stickyDuration"] = false,
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
					["do_sound"] = false,
					["do_message"] = false,
					["glow_frame"] = "WeakAuras:Artillery",
					["message_type"] = "SAY",
					["glow_action"] = "show",
					["sound"] = "Interface\\AddOns\\Prat-3.0\\Sounds\\Link.ogg",
					["message"] = "",
				},
				["init"] = {
					["do_custom"] = false,
					["custom"] = "\n\n",
				},
				["finish"] = {
				},
			},
			["fontFlags"] = "THICKOUTLINE",
			["useTooltip"] = false,
			["glow"] = false,
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["preset"] = "spiral",
					["type"] = "none",
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
				["spellId"] = "243982",
				["duration"] = "4.5",
				["use_unit"] = true,
				["specificUnit"] = "boss1",
				["debuffType"] = "HARMFUL",
				["type"] = "event",
				["unevent"] = "timed",
				["event"] = "Combat Log",
				["custom_hide"] = "timed",
				["name"] = "撕裂裂隙",
				["use_spellId"] = true,
				["spellIds"] = {
					237590, -- [1]
				},
				["use_specific_unit"] = false,
				["names"] = {
					"暗影映像：绝望", -- [1]
				},
				["unit"] = "player",
				["subeventSuffix"] = "_CAST_START",
				["subeventPrefix"] = "SPELL",
			},
			["parent"] = "萨格拉斯之墓 - 09#基尔加丹",
			["stacksPoint"] = "BOTTOM",
			["text1Containment"] = "OUTSIDE",
			["displayIcon"] = "1394890",
			["text1Point"] = "BOTTOM",
			["cooldownTextEnabled"] = true,
			["text2FontFlags"] = "THICKOUTLINE",
			["height"] = 100,
			["numTriggers"] = 1,
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
				["race"] = {
					["multi"] = {
					},
				},
				["role"] = {
					["single"] = "HEALER",
					["multi"] = {
						["TANK"] = true,
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
				["use_zone"] = false,
				["use_level"] = false,
				["class"] = {
					["multi"] = {
					},
				},
			},
			["icon"] = true,
			["selfPoint"] = "CENTER",
			["fontSize"] = 15,
			["text2Containment"] = "OUTSIDE",
			["width"] = 100,
			["text1Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text2Enabled"] = false,
			["customTriggerLogic"] = "\n\n",
			["text1FontFlags"] = "THICKOUTLINE",
			["regionType"] = "icon",
			["xOffset"] = 0,
			["id"] = "Tear Rift cast",
			["text2FontSize"] = 24,
			["desaturate"] = false,
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text1"] = "新的裂隙",
			["text2"] = "BOSS",
			["stacksContainment"] = "OUTSIDE",
			["zoom"] = 0,
			["auto"] = false,
			["text1Enabled"] = true,
			["additional_triggers"] = {
			},
			["text1Font"] = "Friz Quadrata TT",
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["text2Font"] = "Friz Quadrata TT",
			["stickyDuration"] = false,
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
					["do_sound"] = false,
					["do_message"] = false,
					["glow_frame"] = "WeakAuras:Artillery",
					["message_type"] = "SAY",
					["glow_action"] = "show",
					["sound"] = "Interface\\AddOns\\Prat-3.0\\Sounds\\Link.ogg",
					["message"] = "",
				},
				["init"] = {
					["do_custom"] = true,
					["custom"] = "aura_env.spellID = 241822 -- Change to whatever debuff you want to keep track\naura_env.unitID = \"player\"\naura_env.filter = \"harmful\"\naura_env.alternativeText = \"DOT\"\n\naura_env.shortenNumber = function(number)\n    if type(number) ~= \"number\" then\n        number = tonumber(number)\n    end\n    if not number then\n        return\n    end\n    \n    local affixes = {\n        \"\",\n        \"K\",\n        \"M\",\n        \"B\",\n    }\n    \n    local affix = 1\n    local dec = 0\n    local num1 = math.abs(number)\n    while num1 >= 1000 and affix < #affixes do\n        num1 = num1 / 1000\n        affix = affix + 1\n    end\n    if affix > 1 then\n        dec = 2\n        local num2 = num1\n        while num2 >= 10 do\n            num2 = num2 / 10\n            dec = dec - 1\n        end\n    end\n    if number < 0 then\n        num1 = -num1\n    end\n    \n    return string.format(\"%.\"..dec..\"f\"..affixes[affix], num1)\nend",
				},
				["finish"] = {
				},
			},
			["fontFlags"] = "THICKOUTLINE",
			["useTooltip"] = false,
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["preset"] = "spiral",
					["type"] = "none",
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
				["fullscan"] = true,
				["type"] = "aura",
				["spellId"] = "241822",
				["unevent"] = "timed",
				["use_unit"] = true,
				["duration"] = "2",
				["event"] = "Combat Log",
				["names"] = {
					"灵魂之刃", -- [1]
				},
				["name"] = "窒息之影",
				["use_spellId"] = true,
				["spellIds"] = {
					200084, -- [1]
				},
				["custom_hide"] = "timed",
				["subeventSuffix"] = "_CAST_START",
				["unit"] = "player",
				["subeventPrefix"] = "SPELL",
				["debuffType"] = "HARMFUL",
			},
			["yOffset"] = 0,
			["text1Containment"] = "OUTSIDE",
			["stacksPoint"] = "BOTTOM",
			["text1Point"] = "BOTTOM",
			["displayIcon"] = 464119,
			["text2FontFlags"] = "THICKOUTLINE",
			["height"] = 100,
			["parent"] = "萨格拉斯之墓 - 09#基尔加丹",
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
				["use_zoneId"] = true,
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
				["use_zone"] = false,
				["use_level"] = false,
				["class"] = {
					["multi"] = {
					},
				},
			},
			["icon"] = true,
			["numTriggers"] = 1,
			["fontSize"] = 15,
			["text2Containment"] = "OUTSIDE",
			["text1Enabled"] = true,
			["text1Color"] = {
				0, -- [1]
				0.701960784313726, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["selfPoint"] = "CENTER",
			["width"] = 100,
			["text1FontFlags"] = "THICKOUTLINE",
			["regionType"] = "icon",
			["text2Enabled"] = true,
			["xOffset"] = 0,
			["text2FontSize"] = 24,
			["id"] = "窒息之影",
			["desaturate"] = false,
			["text1"] = "%c",
			["text2"] = "吸收治疗",
			["stacksContainment"] = "OUTSIDE",
			["zoom"] = 0,
			["auto"] = true,
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["additional_triggers"] = {
			},
			["text1Font"] = "Friz Quadrata TT",
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["text2Font"] = "Friz Quadrata TT",
			["stickyDuration"] = false,
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
			["glow"] = false,
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
					["do_sound"] = false,
					["do_message"] = false,
					["glow_frame"] = "WeakAuras:Artillery",
					["message_type"] = "SAY",
					["glow_action"] = "show",
					["sound"] = "Interface\\AddOns\\Prat-3.0\\Sounds\\Link.ogg",
					["message"] = "",
				},
				["init"] = {
					["do_custom"] = true,
					["custom"] = "aura_env.spellID = 232732 -- Change to whatever debuff you want to keep track\naura_env.unitID = \"player\"\naura_env.filter = \"harmful\"\naura_env.alternativeText = \"DOT\"\n\naura_env.shortenNumber = function(number)\n    if type(number) ~= \"number\" then\n        number = tonumber(number)\n    end\n    if not number then\n        return\n    end\n    \n    local affixes = {\n        \"\",\n        \"K\",\n        \"M\",\n        \"B\",\n    }\n    \n    local affix = 1\n    local dec = 0\n    local num1 = math.abs(number)\n    while num1 >= 1000 and affix < #affixes do\n        num1 = num1 / 1000\n        affix = affix + 1\n    end\n    if affix > 1 then\n        dec = 2\n        local num2 = num1\n        while num2 >= 10 do\n            num2 = num2 / 10\n            dec = dec - 1\n        end\n    end\n    if number < 0 then\n        num1 = -num1\n    end\n    \n    return string.format(\"%.\"..dec..\"f\"..affixes[affix], num1)\nend",
				},
				["finish"] = {
				},
			},
			["fontFlags"] = "THICKOUTLINE",
			["useTooltip"] = false,
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["preset"] = "spiral",
					["type"] = "none",
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
				["fullscan"] = true,
				["type"] = "aura",
				["spellId"] = "232732",
				["unevent"] = "timed",
				["use_unit"] = true,
				["duration"] = "2",
				["event"] = "Combat Log",
				["subeventPrefix"] = "SPELL",
				["name"] = "切割旋风",
				["use_spellId"] = true,
				["spellIds"] = {
					200084, -- [1]
				},
				["custom_hide"] = "timed",
				["subeventSuffix"] = "_CAST_START",
				["unit"] = "player",
				["names"] = {
					"灵魂之刃", -- [1]
				},
				["debuffType"] = "HARMFUL",
			},
			["yOffset"] = 0,
			["text1Containment"] = "OUTSIDE",
			["stacksPoint"] = "BOTTOM",
			["text1Point"] = "BOTTOM",
			["displayIcon"] = "132107",
			["text2FontFlags"] = "THICKOUTLINE",
			["height"] = 100,
			["parent"] = "萨格拉斯之墓 - 04#主母萨丝琳",
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
				["role"] = {
					["single"] = "TANK",
					["multi"] = {
						["TANK"] = true,
					},
				},
				["use_zoneId"] = true,
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["faction"] = {
					["multi"] = {
					},
				},
				["use_zone"] = false,
				["use_level"] = false,
				["class"] = {
					["multi"] = {
					},
				},
			},
			["icon"] = true,
			["numTriggers"] = 1,
			["fontSize"] = 15,
			["text2Containment"] = "OUTSIDE",
			["text1Enabled"] = true,
			["text1Color"] = {
				0, -- [1]
				0.701960784313726, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["desaturate"] = false,
			["width"] = 100,
			["text1FontFlags"] = "THICKOUTLINE",
			["regionType"] = "icon",
			["text2Enabled"] = false,
			["xOffset"] = 0,
			["text2FontSize"] = 22,
			["id"] = "切割旋风",
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text1"] = "%c",
			["text2"] = "%p",
			["stacksContainment"] = "OUTSIDE",
			["zoom"] = 0,
			["auto"] = true,
			["text1Font"] = "Friz Quadrata TT",
			["additional_triggers"] = {
			},
			["selfPoint"] = "CENTER",
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["text2Font"] = "Friz Quadrata TT",
			["stickyDuration"] = false,
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
			["text2Point"] = "BOTTOM",
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
					["message"] = "",
					["sound"] = "Interface\\AddOns\\Prat-3.0\\Sounds\\Link.ogg",
					["do_sound"] = false,
					["message_type"] = "SAY",
					["glow_action"] = "show",
					["do_message"] = false,
					["glow_frame"] = "WeakAuras:Artillery",
				},
				["init"] = {
					["do_custom"] = false,
					["custom"] = "\n\n",
				},
				["finish"] = {
				},
			},
			["fontFlags"] = "THICKOUTLINE",
			["useTooltip"] = false,
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["preset"] = "spiral",
					["type"] = "none",
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
				["use_unit"] = true,
				["unit"] = "target",
				["use_spellId"] = true,
				["name"] = "波涛起伏",
				["use_specific_unit"] = false,
				["spellIds"] = {
					236378, -- [1]
				},
				["subeventSuffix"] = "_CAST_START",
				["debuffType"] = "HELPFUL",
				["fullscan"] = true,
			},
			["parent"] = "萨格拉斯之墓 - 09#基尔加丹",
			["text1Containment"] = "OUTSIDE",
			["glow"] = false,
			["text1Point"] = "BOTTOM",
			["cooldown"] = true,
			["text2FontFlags"] = "THICKOUTLINE",
			["height"] = 100,
			["displayIcon"] = 464119,
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
				["use_zoneId"] = true,
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
				["use_level"] = false,
				["use_zone"] = false,
				["class"] = {
					["multi"] = {
					},
				},
			},
			["icon"] = true,
			["numTriggers"] = 1,
			["fontSize"] = 15,
			["text2Containment"] = "OUTSIDE",
			["text1Enabled"] = true,
			["text1Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["selfPoint"] = "CENTER",
			["width"] = 100,
			["text1FontFlags"] = "THICKOUTLINE",
			["regionType"] = "icon",
			["text2Enabled"] = true,
			["xOffset"] = 0,
			["text2FontSize"] = 20,
			["additional_triggers"] = {
			},
			["desaturate"] = false,
			["text1"] = "易伤: %s%",
			["text2"] = "暗影",
			["stacksContainment"] = "OUTSIDE",
			["zoom"] = 0,
			["auto"] = true,
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["id"] = "波涛起伏",
			["text1Font"] = "Friz Quadrata TT",
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["text2Font"] = "Friz Quadrata TT",
			["stickyDuration"] = false,
			["inverse"] = false,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["stacksPoint"] = "BOTTOM",
			["yOffset"] = 0,
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
					["do_sound"] = false,
					["do_message"] = false,
					["glow_frame"] = "WeakAuras:Artillery",
					["message_type"] = "SAY",
					["glow_action"] = "show",
					["sound"] = "Interface\\AddOns\\Prat-3.0\\Sounds\\Link.ogg",
					["message"] = "",
				},
				["init"] = {
					["do_custom"] = true,
					["custom"] = "aura_env.spellID = 239216 -- Change to whatever debuff you want to keep track\naura_env.unitID = \"player\"\naura_env.filter = \"harmful\"\naura_env.alternativeText = \"DOT\"\n\naura_env.shortenNumber = function(number)\n    if type(number) ~= \"number\" then\n        number = tonumber(number)\n    end\n    if not number then\n        return\n    end\n    \n    local affixes = {\n        \"\",\n        \"K\",\n        \"M\",\n        \"B\",\n    }\n    \n    local affix = 1\n    local dec = 0\n    local num1 = math.abs(number)\n    while num1 >= 1000 and affix < #affixes do\n        num1 = num1 / 1000\n        affix = affix + 1\n    end\n    if affix > 1 then\n        dec = 2\n        local num2 = num1\n        while num2 >= 10 do\n            num2 = num2 / 10\n            dec = dec - 1\n        end\n    end\n    if number < 0 then\n        num1 = -num1\n    end\n    \n    return string.format(\"%.\"..dec..\"f\"..affixes[affix], num1)\nend",
				},
				["finish"] = {
				},
			},
			["fontFlags"] = "THICKOUTLINE",
			["useTooltip"] = false,
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["preset"] = "spiral",
					["type"] = "none",
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
				["fullscan"] = true,
				["type"] = "aura",
				["spellId"] = "239216",
				["unevent"] = "timed",
				["use_unit"] = true,
				["duration"] = "2",
				["event"] = "Combat Log",
				["names"] = {
					"灵魂之刃", -- [1]
				},
				["name"] = "千魂之暗",
				["use_spellId"] = true,
				["spellIds"] = {
					200084, -- [1]
				},
				["custom_hide"] = "timed",
				["subeventSuffix"] = "_CAST_START",
				["unit"] = "player",
				["subeventPrefix"] = "SPELL",
				["debuffType"] = "HARMFUL",
			},
			["yOffset"] = 0,
			["text1Containment"] = "OUTSIDE",
			["stacksPoint"] = "BOTTOM",
			["text1Point"] = "TOP",
			["displayIcon"] = 464119,
			["text2FontFlags"] = "THICKOUTLINE",
			["height"] = 100,
			["parent"] = "萨格拉斯之墓 - 09#基尔加丹",
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
				["use_zoneId"] = true,
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
				["use_zone"] = false,
				["use_level"] = false,
				["class"] = {
					["multi"] = {
					},
				},
			},
			["icon"] = true,
			["numTriggers"] = 1,
			["fontSize"] = 15,
			["text2Containment"] = "OUTSIDE",
			["text1Enabled"] = true,
			["text1Color"] = {
				0, -- [1]
				0.701960784313726, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["desaturate"] = false,
			["width"] = 100,
			["text1FontFlags"] = "THICKOUTLINE",
			["regionType"] = "icon",
			["text2Enabled"] = false,
			["text1Font"] = "Friz Quadrata TT",
			["text2FontSize"] = 20,
			["id"] = "千魂之暗 - debuff",
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text1"] = "%c",
			["text2"] = "CLEANSE",
			["stacksContainment"] = "OUTSIDE",
			["zoom"] = 0,
			["auto"] = true,
			["xOffset"] = 0,
			["additional_triggers"] = {
			},
			["selfPoint"] = "CENTER",
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["text2Font"] = "Friz Quadrata TT",
			["stickyDuration"] = false,
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
					["glow_frame"] = "WeakAuras:Artillery",
					["do_message"] = false,
					["do_sound"] = false,
					["message_type"] = "SAY",
					["glow_action"] = "show",
					["sound"] = "Interface\\AddOns\\Prat-3.0\\Sounds\\Link.ogg",
					["message"] = "",
				},
				["init"] = {
					["do_custom"] = false,
					["custom"] = "\n\n",
				},
				["finish"] = {
				},
			},
			["fontFlags"] = "THICKOUTLINE",
			["useTooltip"] = false,
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["preset"] = "spiral",
					["type"] = "none",
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
				["debuffType"] = "HARMFUL",
				["event"] = "Combat Log",
				["use_unit"] = true,
				["unit"] = "group",
				["use_spellId"] = true,
				["name"] = "多头蛇射击",
				["spellIds"] = {
					230139, -- [1]
				},
				["use_specific_unit"] = false,
				["custom_hide"] = "timed",
				["subeventSuffix"] = "_CAST_START",
				["subeventPrefix"] = "SPELL",
			},
			["glow"] = false,
			["text1Containment"] = "OUTSIDE",
			["parent"] = "萨格拉斯之墓 - 04#主母萨丝琳",
			["text1Point"] = "BOTTOM",
			["stacksPoint"] = "BOTTOM",
			["text2FontFlags"] = "THICKOUTLINE",
			["height"] = 100,
			["displayIcon"] = "132107",
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
				["use_zoneId"] = true,
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
				["use_zone"] = false,
				["use_level"] = false,
				["class"] = {
					["multi"] = {
					},
				},
			},
			["icon"] = true,
			["numTriggers"] = 3,
			["fontSize"] = 15,
			["text2Containment"] = "OUTSIDE",
			["text1Enabled"] = true,
			["text1Color"] = {
				0, -- [1]
				1, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["desaturate"] = false,
			["width"] = 100,
			["text1FontFlags"] = "THICKOUTLINE",
			["regionType"] = "icon",
			["text2Enabled"] = false,
			["text1Font"] = "Friz Quadrata TT",
			["text2FontSize"] = 20,
			["id"] = "多头蛇酸液 - 分担",
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text1"] = "分担",
			["text2"] = "%p",
			["stacksContainment"] = "OUTSIDE",
			["zoom"] = 0,
			["auto"] = false,
			["xOffset"] = 0,
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
						["custom_hide"] = "timed",
						["inverse"] = true,
						["names"] = {
							"多头蛇酸液", -- [1]
						},
						["unit"] = "player",
						["debuffType"] = "HARMFUL",
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
						["custom_hide"] = "timed",
						["inverse"] = true,
						["names"] = {
							"痛苦负担", -- [1]
						},
						["unit"] = "player",
						["debuffType"] = "HARMFUL",
					},
					["untrigger"] = {
					},
				}, -- [2]
			},
			["selfPoint"] = "CENTER",
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["text2Font"] = "Friz Quadrata TT",
			["stickyDuration"] = false,
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
					["do_sound"] = false,
					["do_message"] = false,
					["glow_frame"] = "WeakAuras:Artillery",
					["message_type"] = "SAY",
					["glow_action"] = "show",
					["sound"] = "Interface\\AddOns\\Prat-3.0\\Sounds\\Link.ogg",
					["message"] = "",
				},
				["init"] = {
					["do_custom"] = true,
					["custom"] = "aura_env.spellID = 239155 -- Change to whatever debuff you want to keep track\naura_env.unitID = \"player\"\naura_env.filter = \"harmful\"\naura_env.alternativeText = \"DOT\"\n\naura_env.shortenNumber = function(number)\n    if type(number) ~= \"number\" then\n        number = tonumber(number)\n    end\n    if not number then\n        return\n    end\n    \n    local affixes = {\n        \"\",\n        \"K\",\n        \"M\",\n        \"B\",\n    }\n    \n    local affix = 1\n    local dec = 0\n    local num1 = math.abs(number)\n    while num1 >= 1000 and affix < #affixes do\n        num1 = num1 / 1000\n        affix = affix + 1\n    end\n    if affix > 1 then\n        dec = 2\n        local num2 = num1\n        while num2 >= 10 do\n            num2 = num2 / 10\n            dec = dec - 1\n        end\n    end\n    if number < 0 then\n        num1 = -num1\n    end\n    \n    return string.format(\"%.\"..dec..\"f\"..affixes[affix], num1)\nend",
				},
				["finish"] = {
				},
			},
			["fontFlags"] = "THICKOUTLINE",
			["useTooltip"] = false,
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["preset"] = "spiral",
					["type"] = "none",
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
				["fullscan"] = true,
				["type"] = "aura",
				["spellId"] = "239155",
				["unevent"] = "timed",
				["use_unit"] = true,
				["duration"] = "2",
				["event"] = "Combat Log",
				["names"] = {
					"灵魂之刃", -- [1]
				},
				["name"] = "引力榨取",
				["use_spellId"] = true,
				["spellIds"] = {
					200084, -- [1]
				},
				["custom_hide"] = "timed",
				["subeventSuffix"] = "_CAST_START",
				["unit"] = "player",
				["subeventPrefix"] = "SPELL",
				["debuffType"] = "HARMFUL",
			},
			["yOffset"] = 0,
			["text1Containment"] = "OUTSIDE",
			["stacksPoint"] = "BOTTOM",
			["text1Point"] = "BOTTOM",
			["displayIcon"] = 464119,
			["text2FontFlags"] = "OUTLINE",
			["height"] = 100,
			["parent"] = "萨格拉斯之墓 - 09#基尔加丹",
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
				["use_zoneId"] = true,
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
				["use_zone"] = false,
				["use_level"] = false,
				["class"] = {
					["multi"] = {
					},
				},
			},
			["icon"] = true,
			["numTriggers"] = 1,
			["fontSize"] = 15,
			["text2Containment"] = "OUTSIDE",
			["text1Enabled"] = true,
			["text1Color"] = {
				0, -- [1]
				0.701960784313726, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["desaturate"] = false,
			["width"] = 100,
			["text1FontFlags"] = "THICKOUTLINE",
			["regionType"] = "icon",
			["text2Enabled"] = false,
			["text1Font"] = "Friz Quadrata TT",
			["text2FontSize"] = 32,
			["id"] = "引力榨取",
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text1"] = "%c",
			["text2"] = "%s",
			["stacksContainment"] = "OUTSIDE",
			["zoom"] = 0,
			["auto"] = true,
			["xOffset"] = 0,
			["additional_triggers"] = {
			},
			["selfPoint"] = "CENTER",
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["text2Font"] = "Friz Quadrata TT",
			["stickyDuration"] = false,
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
			["text2Point"] = "TOP",
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
					["duration_type"] = "seconds",
					["preset"] = "grow",
					["type"] = "none",
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
				["itemName"] = 140793,
				["unit"] = "player",
				["itemSlot"] = 14,
				["custom_hide"] = "timed",
				["type"] = "status",
				["subeventSuffix"] = "_CAST_START",
				["use_showOn"] = true,
				["event"] = "Cooldown Progress (Equipment Slot)",
				["use_unit"] = true,
				["use_itemSlot"] = true,
				["use_itemName"] = true,
				["spellIds"] = {
				},
				["unevent"] = "auto",
				["showOn"] = "showOnCooldown",
				["debuffType"] = "HELPFUL",
				["names"] = {
				},
				["subeventPrefix"] = "SPELL",
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
				["faction"] = {
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
				["use_combat"] = true,
				["spec"] = {
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
			["text2Point"] = "CENTER",
			["inverse"] = true,
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["regionType"] = "icon",
			["disjunctive"] = "all",
			["text1Containment"] = "INSIDE",
			["text2FontSize"] = 24,
			["width"] = 50,
			["text2Enabled"] = false,
			["text1"] = "%P",
			["text1Font"] = "Friz Quadrata TT",
			["id"] = "饰品2冷却",
			["zoom"] = 0.2,
			["auto"] = true,
			["text1FontFlags"] = "OUTLINE",
			["additional_triggers"] = {
			},
			["text2"] = "%p",
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["text2Font"] = "Friz Quadrata TT",
			["stickyDuration"] = false,
			["numTriggers"] = 1,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["cooldown"] = true,
			["xOffset"] = 60,
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
					["do_sound"] = false,
					["do_message"] = false,
					["glow_frame"] = "WeakAuras:Artillery",
					["message_type"] = "SAY",
					["glow_action"] = "show",
					["sound"] = "Interface\\AddOns\\Prat-3.0\\Sounds\\Link.ogg",
					["message"] = "",
				},
				["init"] = {
					["do_custom"] = true,
					["custom"] = "aura_env.spellID = 241721 -- Change to whatever debuff you want to keep track\naura_env.unitID = \"player\"\naura_env.filter = \"harmful\"\naura_env.alternativeText = \"DOT\"\n\naura_env.shortenNumber = function(number)\n    if type(number) ~= \"number\" then\n        number = tonumber(number)\n    end\n    if not number then\n        return\n    end\n    \n    local affixes = {\n        \"\",\n        \"K\",\n        \"M\",\n        \"B\",\n    }\n    \n    local affix = 1\n    local dec = 0\n    local num1 = math.abs(number)\n    while num1 >= 1000 and affix < #affixes do\n        num1 = num1 / 1000\n        affix = affix + 1\n    end\n    if affix > 1 then\n        dec = 2\n        local num2 = num1\n        while num2 >= 10 do\n            num2 = num2 / 10\n            dec = dec - 1\n        end\n    end\n    if number < 0 then\n        num1 = -num1\n    end\n    \n    return string.format(\"%.\"..dec..\"f\"..affixes[affix], num1)\nend",
				},
				["finish"] = {
				},
			},
			["fontFlags"] = "THICKOUTLINE",
			["useTooltip"] = false,
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["preset"] = "spiral",
					["type"] = "none",
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
				["fullscan"] = true,
				["type"] = "aura",
				["spellId"] = "241721",
				["unevent"] = "timed",
				["use_unit"] = true,
				["duration"] = "2",
				["event"] = "Combat Log",
				["names"] = {
					"灵魂之刃", -- [1]
				},
				["name"] = "伊利丹的无目凝视",
				["use_spellId"] = true,
				["spellIds"] = {
					200084, -- [1]
				},
				["custom_hide"] = "timed",
				["subeventSuffix"] = "_CAST_START",
				["unit"] = "player",
				["subeventPrefix"] = "SPELL",
				["debuffType"] = "HARMFUL",
			},
			["yOffset"] = 0,
			["text1Containment"] = "OUTSIDE",
			["stacksPoint"] = "BOTTOM",
			["text1Point"] = "BOTTOM",
			["displayIcon"] = 464119,
			["text2FontFlags"] = "THICKOUTLINE",
			["height"] = 100,
			["parent"] = "萨格拉斯之墓 - 09#基尔加丹",
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
				["use_zoneId"] = true,
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
				["use_zone"] = false,
				["use_level"] = false,
				["class"] = {
					["multi"] = {
					},
				},
			},
			["icon"] = true,
			["numTriggers"] = 1,
			["fontSize"] = 15,
			["text2Containment"] = "OUTSIDE",
			["text1Enabled"] = true,
			["text1Color"] = {
				0, -- [1]
				0.701960784313726, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["selfPoint"] = "CENTER",
			["width"] = 100,
			["text1FontFlags"] = "THICKOUTLINE",
			["regionType"] = "icon",
			["text2Enabled"] = true,
			["xOffset"] = 0,
			["text2FontSize"] = 24,
			["id"] = "伊利丹的无目凝视",
			["desaturate"] = false,
			["text1"] = "%c",
			["text2"] = "获得视觉",
			["stacksContainment"] = "OUTSIDE",
			["zoom"] = 0,
			["auto"] = true,
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["additional_triggers"] = {
			},
			["text1Font"] = "Friz Quadrata TT",
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["text2Font"] = "Friz Quadrata TT",
			["stickyDuration"] = false,
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
					["glow_frame"] = "WeakAuras:Artillery",
					["do_message"] = false,
					["do_sound"] = false,
					["message_type"] = "SAY",
					["glow_action"] = "show",
					["sound"] = "Interface\\AddOns\\Prat-3.0\\Sounds\\Link.ogg",
					["message"] = "",
				},
				["init"] = {
					["do_custom"] = true,
					["custom"] = "aura_env.spellID = 230276 -- Change to whatever debuff you want to keep track\naura_env.unitID = \"player\"\naura_env.filter = \"harmful\"\naura_env.alternativeText = \"DOT\"\n\naura_env.shortenNumber = function(number)\n    if type(number) ~= \"number\" then\n        number = tonumber(number)\n    end\n    if not number then\n        return\n    end\n    \n    local affixes = {\n        \"\",\n        \"K\",\n        \"M\",\n        \"B\",\n    }\n    \n    local affix = 1\n    local dec = 0\n    local num1 = math.abs(number)\n    while num1 >= 1000 and affix < #affixes do\n        num1 = num1 / 1000\n        affix = affix + 1\n    end\n    if affix > 1 then\n        dec = 2\n        local num2 = num1\n        while num2 >= 10 do\n            num2 = num2 / 10\n            dec = dec - 1\n        end\n    end\n    if number < 0 then\n        num1 = -num1\n    end\n    \n    return string.format(\"%.\"..dec..\"f\"..affixes[affix], num1)\nend",
				},
				["finish"] = {
				},
			},
			["fontFlags"] = "THICKOUTLINE",
			["useTooltip"] = false,
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["preset"] = "spiral",
					["type"] = "none",
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
				["fullscan"] = true,
				["type"] = "aura",
				["spellId"] = "230276",
				["unevent"] = "timed",
				["names"] = {
					"灵魂之刃", -- [1]
				},
				["duration"] = "2",
				["event"] = "Combat Log",
				["subeventPrefix"] = "SPELL",
				["spellIds"] = {
					200084, -- [1]
				},
				["use_spellId"] = true,
				["name"] = "深渊巨喉",
				["custom_hide"] = "timed",
				["subeventSuffix"] = "_CAST_START",
				["unit"] = "player",
				["use_unit"] = true,
				["debuffType"] = "HARMFUL",
			},
			["yOffset"] = 0,
			["text1Containment"] = "OUTSIDE",
			["stacksPoint"] = "BOTTOM",
			["text1Point"] = "BOTTOM",
			["displayIcon"] = "132107",
			["text2FontFlags"] = "THICKOUTLINE",
			["height"] = 100,
			["parent"] = "萨格拉斯之墓 - 04#主母萨丝琳",
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
				["use_zoneId"] = true,
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
				["use_zone"] = false,
				["use_level"] = false,
				["class"] = {
					["multi"] = {
					},
				},
			},
			["icon"] = true,
			["numTriggers"] = 1,
			["fontSize"] = 15,
			["text2Containment"] = "OUTSIDE",
			["text1Enabled"] = true,
			["text1Color"] = {
				0, -- [1]
				0.701960784313726, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["desaturate"] = false,
			["width"] = 100,
			["text1FontFlags"] = "THICKOUTLINE",
			["regionType"] = "icon",
			["text2Enabled"] = false,
			["xOffset"] = 0,
			["text2FontSize"] = 22,
			["id"] = "深渊巨喉",
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text1"] = "%c",
			["text2"] = "%p",
			["stacksContainment"] = "OUTSIDE",
			["zoom"] = 0,
			["auto"] = true,
			["text1Font"] = "Friz Quadrata TT",
			["additional_triggers"] = {
			},
			["selfPoint"] = "CENTER",
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["text2Font"] = "Friz Quadrata TT",
			["stickyDuration"] = false,
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
			["text2Point"] = "BOTTOM",
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
					["do_message"] = false,
					["do_custom"] = false,
					["do_glow"] = false,
				},
				["init"] = {
					["custom"] = "aura_env.name = {}\naura_env.duration = {}\naura_env.duration2 = {}\naura_env.activecheck = {}\naura_env.icon = {}\naura_env.check = {}\naura_env.specstore = {}\naura_env.Texture = {}\naura_env.spec = {}\naura_env.talented = {}\naura_env.talented2 = {}\naura_env.inspected = {}\naura_env.lasttime = {}\ntable.insert(aura_env.check, 0)\naura_env.class = {}\naura_env.spellid = {}\naura_env.Display = {}\naura_env.hits = {}\naura_env.check[1] = 0\naura_env.spellid2 = {}\naura_env.duration3 = {}\naura_env.duration4 = {}\naura_env.activecheck2 = {}\naura_env.Texture2 = {}\naura_env.icon2 = {}\naura_env.Display2 = {}\naura_env.stun = {}\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
					["do_custom"] = true,
				},
				["finish"] = {
					["custom"] = "aura_env.name = {}\naura_env.duration = {}\naura_env.duration2 = {}\naura_env.icon = {}\naura_env.activecheck = {}\naura_env.class = {}\naura_env.specstore = {}\naura_env.check[1] = 0\naura_env.Texture = {}\naura_env.spec = {}\naura_env.talented = {}\naura_env.talented2 = {}\naura_env.inspected = {}\naura_env.lasttime = {}\naura_env.spellid = {}\naura_env.Display = {}\naura_env.hits = {}\naura_env.spellid2 = {}\naura_env.duration3 = {}\naura_env.duration4 = {}\naura_env.activecheck2 = {}\naura_env.Texture2 = {}\naura_env.icon2 = {}\naura_env.Display2 = {}\naura_env.stun = {}",
					["do_custom"] = true,
				},
			},
			["fontFlags"] = "OUTLINE",
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["use_color"] = false,
					["type"] = "none",
				},
				["finish"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
			},
			["trigger"] = {
				["type"] = "custom",
				["custom_type"] = "status",
				["custom_hide"] = "timed",
				["event"] = "Health",
				["subeventPrefix"] = "SPELL",
				["spellIds"] = {
				},
				["custom"] = "function(event, timestamp, event, hideCaster, sourceGUID, sourceName, sourceFlags, sourceRaidFlags, destGUID, destName, destFlags, destRaidFlags, spellID, spellName, spellSchool)\n    \n    \n    if event == \"SPELL_CAST_SUCCESS\" or event == \"SPELL_AURA_APPLIED\" or event == \"SPELL_AURA_REMOVED\" or event == \"SPELL_DAMAGE\" or event == \"SPELL_HEAL\" or event == \"SPELL_INTERRUPT\" then -- just to prevent going through all the checks for every useless combat log entry\n        for i=1,table.getn(aura_env.name) do\n            if aura_env.name[i] ~= nil then\n                -- Hunter Binding Shot\n                if aura_env.class[i] == 3 then\n                    if aura_env.name[i] == sourceName then\n                        if event == \"SPELL_CAST_SUCCESS\" and spellID == 109248 then -- on cast\n                            aura_env.duration[i] = GetTime()+10\n                            aura_env.duration2[i] = GetTime()+45\n                            aura_env.activecheck[i] = 1\n                        end\n                        if event == \"SPELL_AURA_APPLIED\" and spellID == 117526 then -- binding lying on the ground\n                            aura_env.activecheck[i] = 2\n                            aura_env.duration[i] = GetTime()+5\n                        end\n                        \n                        if event == \"SPELL_AURA_REMOVED\" and spellID == 117526 then -- stun removed\n                            aura_env.activecheck[i] = 3\n                        end\n                    end\n                end\n                \n                -- Deathknight Gorefiend's Grasp\n                if aura_env.class[i] == 6 then\n                    if aura_env.name[i] == sourceName then\n                        if event == \"SPELL_CAST_SUCCESS\" and spellID == 108199 then -- on cast\n                            aura_env.duration[i] = GetTime()+0\n                            if aura_env.talented[i] == true then\n                                aura_env.duration2[i] = GetTime()+120\n                            else\n                                aura_env.duration2[i] = GetTime()+180\n                            end\n                            aura_env.activecheck[i] = 1\n                        end\n                    end\n                end\n                \n                -- Demonhunter DPS Chaos Nova\n                if aura_env.class[i] == 12 then\n                    \n                    if event == \"SPELL_AURA_APPLIED\" and spellID == 204490 then -- silence applied\n                        if aura_env.activecheck[i] == 1 then\n                            aura_env.activecheck[i] = 2\n                            if aura_env.talented2[i] == true then\n                                aura_env.duration[i] = GetTime()+8\n                            else\n                                aura_env.duration[i] = GetTime()+6\n                            end\n                        end\n                    end\n                    \n                    if aura_env.name[i] == sourceName then\n                        if event == \"SPELL_CAST_SUCCESS\" and spellID == 179057 then -- on cast\n                            aura_env.duration[i] = GetTime()+5\n                            if aura_env.talented[i] == true then\n                                aura_env.duration2[i] = GetTime()+40\n                            else\n                                aura_env.duration2[i] = GetTime()+60\n                            end\n                            aura_env.activecheck[i] = 3\n                        end\n                        \n                        if event == \"SPELL_AURA_APPLIED\" and spellID == 179057 then -- stun applied\n                            aura_env.activecheck[i] = 2\n                        end\n                        \n                        if event == \"SPELL_AURA_REMOVED\" and spellID == 179057 then -- stun removed\n                            aura_env.activecheck[i] = 3\n                        end\n                        \n                        if event == \"SPELL_HEAL\" and spellID == 178963 then -- reduce CD by 5 if you consume a soul fragment (assuming everyone has the trait at this point)\n                            if aura_env.activecheck[i] ~= 0 then\n                                aura_env.duration2[i] = aura_env.duration2[i]-5\n                            end\n                        end\n                        \n                        \n                        -- Demonhunter Silence Sigil\n                        if event == \"SPELL_CAST_SUCCESS\" and (spellID == 202137 or spellID == 207682) then -- on cast (2id's because of talent)\n                            if aura_env.talented[i] == true then\n                                aura_env.duration[i] = GetTime()+1\n                                aura_env.duration2[i] = GetTime()+48\n                            else\n                                aura_env.duration[i] = GetTime()+2\n                                aura_env.duration2[i] = GetTime()+60\n                            end\n                            aura_env.activecheck[i] = 1\n                        end\n                        \n                        \n                        \n                        if event == \"SPELL_AURA_REMOVED\" and spellID == 204490 then -- silence removed\n                            aura_env.activecheck[i] = 3\n                        end\n                        \n                        -- grip-rune\n                        if event == \"SPELL_CAST_SUCCESS\" and spellID == 202138 then -- on cast\n                            aura_env.duration3[i] = GetTime()+2\n                            aura_env.duration4[i] = GetTime()+60\n                            aura_env.activecheck2[i] = 1\n                        end\n                        \n                        if event == \"SPELL_AURA_APPLIED\" and spellID == 204843 then -- slow applied\n                            aura_env.duration3[i] = GetTime()+6\n                            aura_env.activecheck2[i] = 2\n                        end\n                        \n                        if event == \"SPELL_AURA_REMOVED\" and spellID == 204843 then -- slow removed\n                            aura_env.activecheck2[i] = 3\n                        end\n                    end\n                    \n                end\n                \n                -- Monk Legsweep\n                if aura_env.class[i] == 10 then\n                    if aura_env.name[i] == sourceName then\n                        if event == \"SPELL_CAST_SUCCESS\" and spellID == 119381 then -- on cast\n                            aura_env.duration[i] = GetTime()+5\n                            aura_env.duration2[i] = GetTime()+45\n                            aura_env.activecheck[i] = 3\n                        end\n                        if event == \"SPELL_AURA_APPLIED\" and spellID == 119381 then -- stun applied\n                            aura_env.activecheck[i] = 2\n                        end\n                        \n                        if event == \"SPELL_AURA_REMOVED\" and spellID == 119381 then -- stun removed\n                            aura_env.activecheck[i] = 3\n                        end\n                    end\n                    \n                    \n                end\n                \n                -- Warrior Shockwave\n                if aura_env.class[i] == 1 then  \n                    if aura_env.name[i] == sourceName then\n                        if event == \"SPELL_CAST_SUCCESS\" and spellID == 46968 then -- on cast\n                            aura_env.duration[i] = GetTime()+4\n                            aura_env.duration2[i] = GetTime()+40\n                            aura_env.activecheck[i] = 3\n                            aura_env.hits[i] = 0\n                        end\n                        if event == \"SPELL_AURA_APPLIED\" and spellID == 132168 then -- stun applied\n                            aura_env.activecheck[i] = 2\n                        end\n                        if event == \"SPELL_DAMAGE\" and spellID == 46968 then -- counting hits to get the correct cooldown\n                            aura_env.hits[i] = aura_env.hits[i]+1\n                            if aura_env.hits[i] == 3 then\n                                aura_env.duration2[i] = aura_env.duration2[i] - 20\n                            end\n                            aura_env.duration[i] = GetTime()+4\n                        end\n                        \n                        if event == \"SPELL_AURA_REMOVED\" and spellID == 132168 then -- stun removed\n                            aura_env.activecheck[i] = 3\n                            aura_env.hits[i] = 0\n                        end\n                    end\n                end\n                \n                -- Shaman stuntotem\n                if aura_env.class[i] == 7 then\n                    if event == \"SPELL_AURA_APPLIED\" and spellID == 118905 then -- cast applied\n                        if aura_env.activecheck[i] == 1 and GetTime() >= aura_env.duration[i]-1 then -- (can't check for sourcename because its the totem doing the stun not the player)\n                            aura_env.activecheck[i] = 2\n                            aura_env.duration[i] = GetTime()+5\n                        end\n                    end\n                    \n                    if aura_env.name[i] == sourceName then\n                        if event == \"SPELL_CAST_SUCCESS\" and spellID == 192058 then -- on cast\n                            aura_env.duration[i] = GetTime()+2\n                            aura_env.duration2[i] = GetTime()+45\n                            aura_env.activecheck[i] = 1\n                        end\n                        \n                        if event == \"SPELL_AURA_REMOVED\" and spellID == 118905 then -- stun removed\n                            aura_env.activecheck[i] = 3\n                        end\n                    end\n                    \n                end\n                \n                -- Druid\n                if aura_env.class[i] == 11 then\n                    -- Vortex\n                    if event == \"SPELL_AURA_REMOVED\" and (spellID == 77764 or spellID == 77761) then -- roar removed\n                        if aura_env.activecheck[i] == 2 then\n                            aura_env.activecheck[i] = 3\n                        end\n                    end\n                    if aura_env.name[i] == sourceName then\n                        if event == \"SPELL_CAST_SUCCESS\" and spellID == 102793 then -- on cast (Vortex)\n                            aura_env.duration[i] = GetTime()+10\n                            aura_env.duration2[i] = GetTime()+60\n                            aura_env.activecheck[i] = 1\n                        end\n                        -- Stampeding Roar\n                        if event == \"SPELL_AURA_APPLIED\" and (spellID == 77764 or spellID == 77761 or spellID == 106898) then -- on cast\n                            aura_env.duration[i] = GetTime()+8\n                            if aura_env.talented[i] == true then\n                                aura_env.duration2[i] = GetTime()+60\n                            else\n                                aura_env.duration2[i] = GetTime()+120\n                            end\n                            aura_env.activecheck[i] = 2\n                        end\n                        \n                        \n                        -- Beam\n                        if event == \"SPELL_CAST_SUCCESS\" and spellID == 78675 then -- on cast (Beam)\n                            aura_env.duration[i] = GetTime()+8\n                            if aura_env.duration2[i+20] == 20 then\n                                aura_env.duration2[i] = GetTime()+45\n                            else\n                                aura_env.duration2[i] = GetTime()+60\n                            end\n                            aura_env.activecheck[i] = 1\n                        end\n                        \n                        if event == \"SPELL_INTERRUPT\" and spellID == 97547 then -- interrupt\n                            aura_env.duration2[i+20] = 20 else\n                            aura_env.duration2[i+20] = 10\n                        end\n                        -- IncapRoar\n                        if event == \"SPELL_CAST_SUCCESS\" and spellID == 99 then -- on cast (Incap Roar)\n                            aura_env.duration3[i] = GetTime()+3\n                            aura_env.duration4[i] = GetTime()+30\n                            aura_env.activecheck2[i] = 3\n                        end\n                        \n                        if event == \"SPELL_AURA_APPLIED\" and spellID == 99 then -- disorient applied (Incap Roar)\n                            aura_env.activecheck2[i] = 2\n                        end\n                        \n                        if event == \"SPELL_AURA_REMOVED\" and spellID == 99 then -- disorient removed (Incap Roar)\n                            aura_env.activecheck2[i] = 3\n                        end\n                    end\n                end\n                \n                -- Paladin \n                if aura_env.class[i] == 2 then\n                    if aura_env.name[i] == sourceName then\n                        if event == \"SPELL_CAST_SUCCESS\" and spellID == 115750 then -- on cast\n                            aura_env.duration[i] = GetTime()+6\n                            aura_env.duration2[i] = GetTime()+90\n                            aura_env.activecheck[i] = 3\n                        end\n                        \n                        if event == \"SPELL_AURA_APPLIED\" and spellID == 105421 then -- disorient applied\n                            aura_env.activecheck[i] = 2\n                        end\n                        \n                        if event == \"SPELL_AURA_REMOVED\" and spellID == 105421 then -- disorient removed\n                            aura_env.activecheck[i] = 3\n                        end\n                    end\n                end\n                \n                \n                -- Warlock\n                if aura_env.class[i] == 9 then\n                    if aura_env.name[i] == sourceName then\n                        if event == \"SPELL_CAST_SUCCESS\" and spellID == 30283 then -- on cast\n                            aura_env.duration[i] = GetTime()+5\n                            aura_env.duration2[i] = GetTime()+30\n                            aura_env.activecheck[i] = 3\n                        end\n                        \n                        if event == \"SPELL_AURA_APPLIED\" and spellID == 30283 then -- stun applied\n                            aura_env.activecheck[i] = 2\n                        end\n                        \n                        if event == \"SPELL_AURA_REMOVED\" and spellID == 30283 then -- stun removed\n                            aura_env.activecheck[i] = 3\n                        end\n                    end\n                end\n                \n                -- Priest\n                if aura_env.class[i] == 5 then\n                    if aura_env.name[i] == sourceName then\n                        if event == \"SPELL_CAST_SUCCESS\" and spellID == 205369 then -- on cast\n                            aura_env.duration[i] = GetTime()+2\n                            aura_env.duration2[i] = GetTime()+30\n                            aura_env.activecheck[i] = 1\n                        end\n                        \n                        if event == \"SPELL_AURA_APPLIED\" and spellID == 226943 then -- stun applied\n                            if aura_env.activecheck[i] == 1 and GetTime() >= aura_env.duration[i]-1 then\n                                aura_env.activecheck[i] = 2\n                                aura_env.duration[i] = GetTime()+4\n                            end\n                        end\n                        \n                        if event == \"SPELL_AURA_REMOVED\" and spellID == 226943 then -- stun removed\n                            aura_env.activecheck[i] = 3\n                        end\n                    end\n                    \n                    \n                end\n            end\n            \n        end\n    end\nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
				["events"] = "COMBAT_LOG_EVENT_UNFILTERED",
				["subeventSuffix"] = "_CAST_START",
				["check"] = "event",
				["unit"] = "player",
				["names"] = {
				},
				["debuffType"] = "HELPFUL",
			},
			["desaturate"] = false,
			["font"] = "Friz Quadrata TT",
			["height"] = 15.3162107467651,
			["load"] = {
				["encounterid"] = "1853",
				["use_size"] = true,
				["use_never"] = false,
				["talent"] = {
					["multi"] = {
					},
				},
				["use_zone"] = false,
				["spec"] = {
					["multi"] = {
					},
				},
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
				["zone"] = "Blackrock Foundry",
				["talent2"] = {
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
			["fontSize"] = 15,
			["displayStacks"] = "%c",
			["parent"] = "CC Tracker ",
			["desc"] = "Author: (EU)Reloh-Blackrock Reloe#2787",
			["cooldown"] = true,
			["regionType"] = "text",
			["displayIcon"] = 462650,
			["selfPoint"] = "CENTER",
			["numTriggers"] = 2,
			["icon"] = true,
			["init_completed"] = 1,
			["stickyDuration"] = false,
			["width"] = 9.75213813781738,
			["stacksContainment"] = "OUTSIDE",
			["zoom"] = 0.3,
			["auto"] = false,
			["additional_triggers"] = {
				{
					["trigger"] = {
						["type"] = "custom",
						["custom_type"] = "status",
						["event"] = "Health",
						["unit"] = "player",
						["subeventSuffix"] = "_CAST_START",
						["custom"] = "function()\n    if aura_env.check[1] == 0 or aura_env.check[1] == 45 then -- return true if any CC spell is in the group to trigger Display code\n        for i=1, getn(aura_env.spec) do\n            if aura_env.Display[i] == true or aura_env.Display2[i] == true then\n                aura_env.check[1] = GetNumGroupMembers()\n                return true\n            end\n        end\n    end\n    \n    if aura_env.check[1] == 0 or aura_env.check[1] == 45 then -- insert all standard values if the player is one of the classes that may have a tracked CC\n        aura_env.name = {}\n        for i=1, GetNumGroupMembers() do\n            local name, rank, subgroup, level, class = GetRaidRosterInfo(i)\n            if name ~= nil then\n                local localizedClass, englishClass, classIndex = UnitClass(name)\n                if classIndex == 1 or classIndex == 2 or classIndex == 3 or classIndex == 5 or classIndex == 6 or classIndex == 7 or classIndex == 9 or classIndex == 10 or classIndex == 11 or classIndex == 12 then\n                    table.insert(aura_env.name, name)\n                    if getn(aura_env.spec) < getn(aura_env.name) then\n                        table.insert(aura_env.spec, 0)\n                        table.insert(aura_env.class, classIndex)\n                        table.insert(aura_env.specstore, 0)\n                        table.insert(aura_env.talented, false)\n                        table.insert(aura_env.talented2, false)\n                        table.insert(aura_env.inspected, false)\n                        table.insert(aura_env.lasttime, GetTime())\n                        table.insert(aura_env.Display, false)\n                        table.insert(aura_env.spellid, 0)\n                        table.insert(aura_env.hits, 0)\n                        table.insert(aura_env.duration, GetTime()+0)\n                        table.insert(aura_env.duration2, GetTime()+0)\n                        table.insert(aura_env.activecheck, 0)\n                        table.insert(aura_env.Texture, \"\")\n                        table.insert(aura_env.icon, \"\")\n                        table.insert(aura_env.spellid2, 0)\n                        table.insert(aura_env.duration3, GetTime()+0)\n                        table.insert(aura_env.duration4, GetTime()+0)\n                        table.insert(aura_env.activecheck2, 0)\n                        table.insert(aura_env.Texture2, \"\")\n                        table.insert(aura_env.icon2, \"\")\n                        table.insert(aura_env.Display2, false)\n                        table.insert(aura_env.stun, false)\n                    end\n                end\n            end\n        end\n    end\n    \n    for i=1,getn(aura_env.name) do -- set spell to ready if cooldown has run out\n        if aura_env.activecheck[i] == 3 then\n            if aura_env.duration2[i] - GetTime() <= 0 then\n                aura_env.activecheck[i] = 0\n            end\n        elseif aura_env.activecheck[i] == 1 or aura_env.activecheck[i] == 2 then -- set spell to \"on CD\" if its active-time has run out to not get negative values shown\n            if aura_env.duration[i] - GetTime() <= 0 then\n                aura_env.activecheck[i] = 3\n            end\n        end\n        \n        -- same thing for 2nd spell\n        if aura_env.activecheck2[i] == 3 then \n            if aura_env.duration4[i] - GetTime() <= 0 then\n                aura_env.activecheck2[i] = 0\n            end\n        elseif aura_env.activecheck2[i] == 1 or aura_env.activecheck2[i] == 2 then\n            if aura_env.duration3[i] - GetTime() <= 0 then\n                aura_env.activecheck2[i] = 3\n            end\n        end\n        \n        if aura_env.inspected[i] == false then \n            if aura_env.name[i] ~= UnitName(\"player\") then\n                local canInspect = CanInspect(aura_env.name[i]) -- inspect player\n                if canInspect == false then\n                    return false;\n                else\n                    NotifyInspect(aura_env.name[i])\n                    aura_env.specstore[i] = 1\n                    aura_env.inspected[i] = nil\n                end\n            else\n                aura_env.specstore[i] = 1\n                aura_env.inspected[i] = true\n            end\n        end\n        if aura_env.specstore[i] == 1 then -- triggers if the player got inspected or the character is the player himself    \n            if aura_env.name[i] == UnitName(\"player\") then\n                aura_env.specstore[i] = GetSpecializationInfo(GetSpecialization())\n            else\n                aura_env.specstore[i] = GetInspectSpecialization(aura_env.name[i])  \n            end \n            if aura_env.specstore[i] == 0 then -- this value turns to 0 if it can't read the characters spec, so set it back to 1 so it runs the whole thing again\n                aura_env.specstore[i] = 1 \n            else\n                aura_env.spec[i] = aura_env.specstore[i] -- transfer over the value to a different variable so we can check if someone changed his spec without loosing the spec-information we had before\n                aura_env.inspected[i] = true\n                aura_env.lasttime[i] = GetTime()\n            end\n        end\n    end\n    \n    \n    for i=1, getn(aura_env.spec) do\n        if aura_env.inspected[i] == true then \n            if aura_env.spec[i] == 253 or aura_env.spec[i] == 254 then  -- Hunter Binding Shot\n                if aura_env.name[i] == UnitName(\"player\") then\n                    _, _, _, aura_env.talented[i] = GetTalentInfo(5, 1, 1, nil,aura_env.name[i]);\n                else\n                    _, _, _, aura_env.talented[i] = GetTalentInfo(5, 1, 1, true, aura_env.name[i]);\n                end\n                \n                if aura_env.talented[i] == true then\n                    aura_env.Display[i] = true\n                    aura_env.stun[i] = true\n                    aura_env.spellid[i] = 109248\n                end\n            elseif aura_env.spec[i] == 250 then -- Blood dk Gorefiend's Grasp\n                if aura_env.name[i] == UnitName(\"player\") then\n                    _, _, _, aura_env.talented[i] = GetTalentInfo(5, 1, 1, nil,aura_env.name[i]);\n                else\n                    _, _, _, aura_env.talented[i] = GetTalentInfo(5, 1, 1, true, aura_env.name[i]);\n                end\n                aura_env.spellid[i] = 108199\n                aura_env.Display[i] = true\n            elseif aura_env.spec[i] == 577 then  -- Havoc DH Chaos Nova\n                if aura_env.name[i] == UnitName(\"player\") then\n                    _, _, _, aura_env.talented[i] = GetTalentInfo(6, 2, 1, nil,aura_env.name[i]);\n                else\n                    _, _, _, aura_env.talented[i] = GetTalentInfo(6, 2, 1, true, aura_env.name[i]);\n                end\n                aura_env.spellid[i] = 190246\n                aura_env.stun[i] = true\n                aura_env.Display[i] = true\n            elseif aura_env.spec[i] == 581 then   -- Veng DH silence/grip rune\n                if aura_env.name[i] == UnitName(\"player\") then\n                    _, _, _, aura_env.talented[i] = GetTalentInfo(5, 2, 1, nil,aura_env.name[i]); -- grip rune\n                    if aura_env.talented[i] == true then\n                        aura_env.Display2[i] = true\n                        aura_env.spellid2[i] = 204843\n                        if aura_env.inspected[i] == true then\n                            _,_, aura_env.Texture2[i] = GetSpellInfo(aura_env.spellid2[i])\n                            if aura_env.Texture2[i] ~= nil then\n                                aura_env.icon2[i] = \"|T\"..aura_env.Texture2[i]..\":31:31:0:-10:64:64:4:60:4:60|t \"\n                            end\n                        end\n                    else\n                        aura_env.Display2[i] = false\n                    end\n                    _, _, _, aura_env.talented[i] = GetTalentInfo(5, 3, 1, nil,aura_env.name[i]); -- CD reduction\n                    _, _, _, aura_env.talented2[i] = GetTalentInfo(5, 1, 1, nil,aura_env.name[i]); -- inc duration\n                    \n                else\n                    _, _, _, aura_env.talented[i] = GetTalentInfo(5, 2, 1, true, aura_env.name[i]);\n                    if aura_env.talented[i] == true then\n                        aura_env.Display2[i] = true\n                        aura_env.spellid2[i] = 204843\n                        if aura_env.inspected[i] == true then\n                            _,_, aura_env.Texture2[i] = GetSpellInfo(aura_env.spellid2[i])\n                            if aura_env.Texture2[i] ~= nil then\n                                aura_env.icon2[i] = \"|T\"..aura_env.Texture2[i]..\":31:31:0:-10:64:64:4:60:4:60|t \"\n                            end\n                        end\n                    else\n                        aura_env.Display2[i] = false \n                    end\n                    _, _, _, aura_env.talented[i] = GetTalentInfo(5, 3, 1, true, aura_env.name[i]);\n                    _, _, _, aura_env.talented2[i] = GetTalentInfo(5, 1, 1, true, aura_env.name[i]);\n                end\n                aura_env.Display[i] = true\n                aura_env.spellid[i] = 202137\n                \n            elseif aura_env.spec[i] == 268 or aura_env.spec[i] == 269 or aura_env.spec[i] == 270  then -- Monk Legsweep\n                if aura_env.name[i] == UnitName(\"player\") then\n                    _, _, _, aura_env.talented[i] = GetTalentInfo(4, 3, 1, nil,aura_env.name[i]);\n                else\n                    _, _, _, aura_env.talented[i] = GetTalentInfo(4, 3, 1, true, aura_env.name[i]);\n                end\n                if aura_env.talented[i] == true then\n                    aura_env.Display[i] = true\n                    aura_env.stun[i] = true\n                    aura_env.spellid[i] = 119381\n                end\n            elseif aura_env.spec[i] == 71 or aura_env.spec[i] == 72 then -- DPS Warrior Shockwave\n                if aura_env.name[i] == UnitName(\"player\") then\n                    _, _, _, aura_env.talented[i] = GetTalentInfo(2, 1, 1, nil,aura_env.name[i]);\n                else\n                    _, _, _, aura_env.talented[i] = GetTalentInfo(2, 1, 1, true, aura_env.name[i]);\n                end\n                \n                if aura_env.talented[i] == true then\n                    aura_env.Display[i] = true\n                    aura_env.stun[i] = true\n                    aura_env.spellid[i] = 46968\n                end\n            elseif aura_env.spec[i] == 258 then -- Shadow Priest\n                if aura_env.name[i] == UnitName(\"player\") then\n                    _, _, _, aura_env.talented[i] = GetTalentInfo(3, 1, 1, nil,aura_env.name[i]);\n                else\n                    _, _, _, aura_env.talented[i] = GetTalentInfo(3, 1, 1, true, aura_env.name[i]);\n                end\n                if aura_env.talented[i] == true then\n                    aura_env.spellid[i] = 205369\n                    aura_env.Display[i] = true\n                    aura_env.stun[i] = true\n                end\n            elseif aura_env.spec[i] == 73 then  -- Tank Warrior Shockwave\n                if aura_env.name[i] == UnitName(\"player\") then\n                    _, _, _, aura_env.talented[i] = GetTalentInfo(1, 1, 1, nil,aura_env.name[i]);\n                else\n                    _, _, _, aura_env.talented[i] = GetTalentInfo(1, 1, 1, true, aura_env.name[i]);\n                end\n                if aura_env.talented[i] == true then\n                    aura_env.Display[i] = true\n                    aura_env.spellid[i] = 46968\n                    aura_env.stun[i] = true\n                end\n            elseif aura_env.spec[i] == 262 or aura_env.spec[i] == 263 or aura_env.spec[i] == 264 then -- Shaman Stuntotem\n                if aura_env.name[i] == UnitName(\"player\") then\n                    _, _, _, aura_env.talented[i] = GetTalentInfo(3, 1, 1, nil,aura_env.name[i]);\n                else\n                    _, _, _, aura_env.talented[i] = GetTalentInfo(3, 1, 1, true, aura_env.name[i]);\n                end\n                if aura_env.talented[i] == true then\n                    aura_env.spellid[i] = 192058\n                    aura_env.Display[i] = true\n                    aura_env.stun[i] = true\n                end\n            elseif aura_env.spec[i] == 266 or aura_env.spec[i] == 267 then -- Warlock Shadowfury\n                if aura_env.name[i] == UnitName(\"player\") then\n                    _, _, _, aura_env.talented[i] = GetTalentInfo(3, 3, 1, nil,aura_env.name[i]);\n                else\n                    _, _, _, aura_env.talented[i] = GetTalentInfo(3, 3, 1, true, aura_env.name[i]);\n                end\n                if aura_env.talented[i] == true then\n                    aura_env.spellid[i] = 30283\n                    aura_env.Display[i] = true\n                    aura_env.stun[i] = true\n                end\n            elseif aura_env.spec[i] == 104 then -- Guardian Roar\n                if aura_env.name[i] == UnitName(\"player\") then\n                    _, _, _, aura_env.talented[i] = GetTalentInfo(2, 1, 1, nil,aura_env.name[i]);\n                else\n                    _, _, _, aura_env.talented[i] = GetTalentInfo(2, 1, 1, true, aura_env.name[i]);\n                end\n                aura_env.spellid[i] = 106898\n                aura_env.Display[i] = true\n                aura_env.spellid2[i] = 99\n                aura_env.Display2[i] = true\n                if aura_env.inspected[i] == true then\n                    _,_, aura_env.Texture2[i] = GetSpellInfo(aura_env.spellid2[i])\n                    if aura_env.Texture2[i] ~= nil then\n                        aura_env.icon2[i] = \"|T\"..aura_env.Texture2[i]..\":31:31:0:-10:64:64:4:60:4:60|t \"\n                    end\n                end\n            elseif aura_env.spec[i] == 65 or aura_env.spec[i] == 66 or aura_env.spec[i] == 70 then -- Paladin Blinding Light\n                if aura_env.name[i] == UnitName(\"player\") then\n                    _, _, _, aura_env.talented[i] = GetTalentInfo(3, 3, 1, nil,aura_env.name[i]);\n                else\n                    _, _, _, aura_env.talented[i] = GetTalentInfo(3, 3, 1, true, aura_env.name[i]);\n                end\n                if aura_env.talented[i] == true then\n                    aura_env.spellid[i] = 115750\n                    aura_env.Display[i] = true\n                end\n            elseif aura_env.spec[i] == 105 then -- Resto Druid Vortex\n                aura_env.Display[i] = true\n                aura_env.Display2[i] = false\n                aura_env.spellid[i] = 102793\n            elseif aura_env.spec[i] == 102 then -- Druid Solarbeam\n                aura_env.Display[i] = true\n                aura_env.Display2[i] = false\n                aura_env.spellid[i] = 78675\n            elseif aura_env.spec[i] == 103 then -- Feral Roar\n                aura_env.Display[i] = true\n                aura_env.Display2[i] = false\n                aura_env.spellid[i] = 106898\n            else\n                aura_env.talented[i] = false\n            end\n            if aura_env.talented[i] == true then\n                aura_env.Display[i] = true\n            end\n        end\n        if aura_env.inspected[i] == true then\n            _,_, aura_env.Texture[i] = GetSpellInfo(aura_env.spellid[i])\n            if aura_env.Texture[i] ~= nil then\n                aura_env.icon[i] = \"|T\"..aura_env.Texture[i]..\":31:31:0:-10:64:64:4:60:4:60|t \" -- first 2 numbers represent the width and height of the icon\n            end\n        end\n        if GetTime() - aura_env.lasttime[i] > 45 and aura_env.lasttime[i] ~= 0 then -- every 45 seconds we check if the person has changed his spec\n            aura_env.inspected[i] = false\n            aura_env.lasttime[i] = GetTime()\n            aura_env.specstore[i] = 0\n        end\n    end\nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
						["unevent"] = "auto",
						["check"] = "update",
						["use_unit"] = true,
						["subeventPrefix"] = "SPELL",
						["custom_hide"] = "timed",
					},
					["untrigger"] = {
						["custom"] = "function()\n    if aura_env.check[1] == 50 then\n        aura_env.check[1] = 45\n        return true\n    end\nend\n\n\n\n\n\n\n\n",
					},
				}, -- [1]
			},
			["id"] = "CC Tracker",
			["xOffset"] = -615.99992370606,
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["justify"] = "LEFT",
			["untrigger"] = {
				["custom"] = "\n\n",
			},
			["inverse"] = false,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["stacksPoint"] = "RIGHT",
			["textColor"] = {
				1, -- [1]
				1, -- [2]
				0.96470588235294, -- [3]
				1, -- [4]
			},
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
					["glow_frame"] = "WeakAuras:Artillery",
					["do_message"] = false,
					["do_sound"] = false,
					["message_type"] = "SAY",
					["glow_action"] = "show",
					["sound"] = "Interface\\AddOns\\Prat-3.0\\Sounds\\Link.ogg",
					["message"] = "",
				},
				["init"] = {
					["do_custom"] = false,
					["custom"] = "\n\n",
				},
				["finish"] = {
				},
			},
			["fontFlags"] = "THICKOUTLINE",
			["useTooltip"] = false,
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["preset"] = "spiral",
					["type"] = "none",
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
				["names"] = {
					"暗影映像：哀嚎", -- [1]
				},
				["name"] = "爆发",
				["use_spellId"] = true,
				["spellIds"] = {
					236378, -- [1]
				},
				["unit"] = "target",
				["use_specific_unit"] = false,
				["subeventSuffix"] = "_CAST_START",
				["debuffType"] = "HELPFUL",
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
			["stacksPoint"] = "BOTTOM",
			["text1Point"] = "BOTTOM",
			["displayIcon"] = 464119,
			["text2FontFlags"] = "THICKOUTLINE",
			["height"] = 100,
			["glow"] = false,
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
				["role"] = {
					["single"] = "TANK",
					["multi"] = {
						["TANK"] = true,
					},
				},
				["use_zoneId"] = true,
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["faction"] = {
					["multi"] = {
					},
				},
				["use_zone"] = false,
				["use_level"] = false,
				["class"] = {
					["multi"] = {
					},
				},
			},
			["numTriggers"] = 1,
			["icon"] = true,
			["fontSize"] = 15,
			["text2Containment"] = "OUTSIDE",
			["text1Enabled"] = true,
			["text1Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["width"] = 100,
			["text2Enabled"] = true,
			["text1FontFlags"] = "THICKOUTLINE",
			["regionType"] = "icon",
			["text1Font"] = "Friz Quadrata TT",
			["id"] = "爆发",
			["text2FontSize"] = 22,
			["selfPoint"] = "CENTER",
			["init_completed"] = 1,
			["text1"] = "加成: %s%",
			["text2"] = "%c",
			["stacksContainment"] = "OUTSIDE",
			["zoom"] = 0,
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
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["desaturate"] = false,
			["text2Font"] = "Friz Quadrata TT",
			["inverse"] = false,
			["stickyDuration"] = false,
			["conditions"] = {
			},
			["cooldown"] = true,
			["yOffset"] = 0,
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
					["glow_frame"] = "WeakAuras:Artillery",
					["do_message"] = false,
					["do_sound"] = false,
					["message_type"] = "SAY",
					["glow_action"] = "show",
					["sound"] = "Interface\\AddOns\\Prat-3.0\\Sounds\\Link.ogg",
					["message"] = "",
				},
				["init"] = {
					["do_custom"] = false,
					["custom"] = "\n\n",
				},
				["finish"] = {
				},
			},
			["fontFlags"] = "THICKOUTLINE",
			["useTooltip"] = false,
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["preset"] = "spiral",
					["type"] = "none",
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
				["spellId"] = "242945",
				["duration"] = "2",
				["unit"] = "target",
				["subcount"] = true,
				["custom_hide"] = "timed",
				["type"] = "aura",
				["unevent"] = "timed",
				["subeventPrefix"] = "SPELL",
				["event"] = "Combat Log",
				["use_specific_unit"] = false,
				["spellIds"] = {
					242945, -- [1]
				},
				["use_spellId"] = true,
				["name"] = "鱼人饲料",
				["use_unit"] = true,
				["names"] = {
					"鱼人饲料", -- [1]
				},
				["subeventSuffix"] = "_CAST_START",
				["debuffType"] = "HELPFUL",
				["fullscan"] = true,
			},
			["text1Containment"] = "OUTSIDE",
			["parent"] = "萨格拉斯之墓 - 04#主母萨丝琳",
			["desaturate"] = true,
			["stacksPoint"] = "BOTTOM",
			["text1Point"] = "TOP",
			["displayIcon"] = 464119,
			["text2FontFlags"] = "THICKOUTLINE",
			["height"] = 100,
			["yOffset"] = 0,
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
				["use_zoneId"] = true,
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
				["use_zone"] = false,
				["use_level"] = false,
				["class"] = {
					["multi"] = {
					},
				},
			},
			["numTriggers"] = 1,
			["glow"] = false,
			["fontSize"] = 15,
			["text2Containment"] = "OUTSIDE",
			["icon"] = true,
			["text1Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["width"] = 100,
			["text2Enabled"] = true,
			["text1FontFlags"] = "THICKOUTLINE",
			["regionType"] = "icon",
			["text1Enabled"] = true,
			["additional_triggers"] = {
			},
			["text2FontSize"] = 20,
			["selfPoint"] = "CENTER",
			["init_completed"] = 1,
			["text1"] = "%c",
			["text2"] = "增伤: %s%",
			["stacksContainment"] = "OUTSIDE",
			["zoom"] = 0,
			["auto"] = true,
			["text1Font"] = "Friz Quadrata TT",
			["id"] = "鱼人饲料",
			["xOffset"] = 0,
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["text2Color"] = {
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
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
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
				["finish"] = {
				},
				["init"] = {
				},
			},
			["backgroundInset"] = 0,
			["selfPoint"] = "LEFT",
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
				["race"] = {
					["multi"] = {
					},
				},
				["spec"] = {
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
			["animate"] = false,
			["border"] = "None",
			["regionType"] = "dynamicgroup",
			["sort"] = "none",
			["expanded"] = false,
			["constantFactor"] = "RADIUS",
			["borderOffset"] = 16,
			["id"] = "萨格拉斯之墓 - 04#主母萨丝琳",
			["additional_triggers"] = {
			},
			["frameStrata"] = 1,
			["width"] = 1732.00012207031,
			["anchorFrameType"] = "SCREEN",
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
			["numTriggers"] = 1,
			["rotation"] = 0,
			["align"] = "CENTER",
			["conditions"] = {
			},
			["untrigger"] = {
			},
			["radius"] = 200,
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
					["do_sound"] = false,
					["do_message"] = false,
					["glow_frame"] = "WeakAuras:Artillery",
					["message_type"] = "SAY",
					["glow_action"] = "show",
					["sound"] = "Interface\\AddOns\\Prat-3.0\\Sounds\\Link.ogg",
					["message"] = "",
				},
				["init"] = {
					["do_custom"] = true,
					["custom"] = "aura_env.spellID = 240908 -- Change to whatever debuff you want to keep track\naura_env.unitID = \"player\"\naura_env.filter = \"harmful\"\naura_env.alternativeText = \"DOT\"\n\naura_env.shortenNumber = function(number)\n    if type(number) ~= \"number\" then\n        number = tonumber(number)\n    end\n    if not number then\n        return\n    end\n    \n    local affixes = {\n        \"\",\n        \"K\",\n        \"M\",\n        \"B\",\n    }\n    \n    local affix = 1\n    local dec = 0\n    local num1 = math.abs(number)\n    while num1 >= 1000 and affix < #affixes do\n        num1 = num1 / 1000\n        affix = affix + 1\n    end\n    if affix > 1 then\n        dec = 2\n        local num2 = num1\n        while num2 >= 10 do\n            num2 = num2 / 10\n            dec = dec - 1\n        end\n    end\n    if number < 0 then\n        num1 = -num1\n    end\n    \n    return string.format(\"%.\"..dec..\"f\"..affixes[affix], num1)\nend",
				},
				["finish"] = {
				},
			},
			["fontFlags"] = "THICKOUTLINE",
			["useTooltip"] = false,
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["preset"] = "spiral",
					["type"] = "none",
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
				["fullscan"] = true,
				["type"] = "aura",
				["spellId"] = "243624",
				["unevent"] = "timed",
				["names"] = {
					"灵魂之刃", -- [1]
				},
				["duration"] = "2",
				["event"] = "Combat Log",
				["use_unit"] = true,
				["spellIds"] = {
					200084, -- [1]
				},
				["use_spellId"] = true,
				["name"] = "萦绕的哀嚎",
				["debuffType"] = "HARMFUL",
				["subeventSuffix"] = "_CAST_START",
				["unit"] = "player",
				["subeventPrefix"] = "SPELL",
				["custom_hide"] = "timed",
			},
			["yOffset"] = 0,
			["text1Containment"] = "OUTSIDE",
			["stacksPoint"] = "BOTTOM",
			["text1Point"] = "BOTTOM",
			["displayIcon"] = 464119,
			["text2FontFlags"] = "OUTLINE",
			["height"] = 100,
			["parent"] = "萨格拉斯之墓 - 09#基尔加丹",
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
				["use_zoneId"] = true,
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
				["use_zone"] = false,
				["use_level"] = false,
				["class"] = {
					["multi"] = {
					},
				},
			},
			["icon"] = true,
			["numTriggers"] = 1,
			["fontSize"] = 15,
			["text2Containment"] = "OUTSIDE",
			["text1Enabled"] = true,
			["text1Color"] = {
				0, -- [1]
				0.701960784313726, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["desaturate"] = false,
			["width"] = 100,
			["text1FontFlags"] = "THICKOUTLINE",
			["regionType"] = "icon",
			["text2Enabled"] = false,
			["text1Font"] = "Friz Quadrata TT",
			["text2FontSize"] = 32,
			["id"] = "萦绕的哀嚎",
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text1"] = "%c",
			["text2"] = "%s",
			["stacksContainment"] = "OUTSIDE",
			["zoom"] = 0,
			["auto"] = true,
			["xOffset"] = 0,
			["additional_triggers"] = {
			},
			["selfPoint"] = "CENTER",
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["text2Font"] = "Friz Quadrata TT",
			["stickyDuration"] = false,
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
			["text2Point"] = "TOP",
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
					["message"] = "",
					["sound"] = "Interface\\AddOns\\Prat-3.0\\Sounds\\Link.ogg",
					["glow_frame"] = "WeakAuras:Artillery",
					["message_type"] = "SAY",
					["glow_action"] = "show",
					["do_message"] = false,
					["do_sound"] = false,
				},
				["init"] = {
					["do_custom"] = false,
					["custom"] = "\n\n",
				},
				["finish"] = {
				},
			},
			["fontFlags"] = "THICKOUTLINE",
			["useTooltip"] = false,
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["preset"] = "spiral",
					["type"] = "none",
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
				["custom_hide"] = "timed",
				["name"] = "美味的增益鱼",
				["use_spellId"] = true,
				["spellIds"] = {
					242945, -- [1]
				},
				["use_unit"] = true,
				["use_specific_unit"] = false,
				["unit"] = "player",
				["subeventSuffix"] = "_CAST_START",
				["fullscan"] = true,
			},
			["yOffset"] = 0,
			["text1Containment"] = "OUTSIDE",
			["text2Point"] = "BOTTOM",
			["text1Point"] = "BOTTOM",
			["cooldown"] = true,
			["text2FontFlags"] = "THICKOUTLINE",
			["height"] = 100,
			["displayIcon"] = 464119,
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
				["role"] = {
					["single"] = "TANK",
					["multi"] = {
						["TANK"] = true,
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
				["use_zoneId"] = true,
				["use_level"] = false,
				["use_zone"] = false,
				["class"] = {
					["multi"] = {
					},
				},
			},
			["icon"] = true,
			["numTriggers"] = 1,
			["fontSize"] = 15,
			["text2Containment"] = "OUTSIDE",
			["text1Enabled"] = true,
			["text1Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["desaturate"] = false,
			["width"] = 100,
			["text1FontFlags"] = "THICKOUTLINE",
			["regionType"] = "icon",
			["text2Enabled"] = false,
			["xOffset"] = 0,
			["text2FontSize"] = 20,
			["additional_triggers"] = {
			},
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text1"] = "增伤: %s%",
			["text2"] = "%p",
			["stacksContainment"] = "OUTSIDE",
			["zoom"] = 0,
			["auto"] = true,
			["text1Font"] = "Friz Quadrata TT",
			["id"] = "美味增益鱼:dps",
			["selfPoint"] = "CENTER",
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["text2Font"] = "Friz Quadrata TT",
			["stickyDuration"] = false,
			["inverse"] = false,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["stacksPoint"] = "BOTTOM",
			["parent"] = "萨格拉斯之墓 - 04#主母萨丝琳",
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
					["duration_type"] = "seconds",
					["preset"] = "grow",
					["type"] = "preset",
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
				["itemName"] = 140793,
				["use_unit"] = true,
				["itemSlot"] = 14,
				["custom_hide"] = "timed",
				["type"] = "status",
				["unevent"] = "auto",
				["use_showOn"] = true,
				["event"] = "Cooldown Progress (Equipment Slot)",
				["use_itemName"] = true,
				["unit"] = "player",
				["use_itemSlot"] = true,
				["subeventSuffix"] = "_CAST_START",
				["spellIds"] = {
				},
				["use_testForCooldown"] = true,
				["showOn"] = "showOnReady",
				["debuffType"] = "HELPFUL",
				["names"] = {
				},
				["subeventPrefix"] = "SPELL",
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
				["faction"] = {
					["multi"] = {
					},
				},
				["use_combat"] = true,
				["spec"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["text1Containment"] = "INSIDE",
			["disjunctive"] = "all",
			["text2Containment"] = "INSIDE",
			["yOffset"] = 0,
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
			["xOffset"] = 60,
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["regionType"] = "icon",
			["numTriggers"] = 1,
			["text2Font"] = "Friz Quadrata TT",
			["text2FontSize"] = 24,
			["text1FontFlags"] = "OUTLINE",
			["anchorFrameType"] = "SCREEN",
			["text1"] = "%P",
			["text2Enabled"] = false,
			["text2"] = "%p",
			["zoom"] = 0.2,
			["auto"] = true,
			["id"] = "饰品2就绪",
			["additional_triggers"] = {
			},
			["text1Font"] = "Friz Quadrata TT",
			["frameStrata"] = 1,
			["width"] = 50,
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
			["parent"] = "饰品冷却",
			["selfPoint"] = "CENTER",
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
				["duration"] = "4",
				["message_operator"] = "match('%s')",
				["unit"] = "player",
				["custom_hide"] = "timed",
				["type"] = "custom",
				["subeventPrefix"] = "SPELL",
				["unevent"] = "custom",
				["names"] = {
				},
				["subeventSuffix"] = "_CAST_START",
				["event"] = "Chat Message",
				["custom_type"] = "event",
				["message"] = "long sleeves",
				["custom"] = "function(channel, message, language, channelString, target, flags, unknown, channelNumber, channelName, unknown, counter)\n    if message and message:find(\"spell:238430\") then \n        return true\n    end\nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
				["events"] = "CHAT_MSG_RAID_BOSS_WHISPER, CHAT_MSG_WHISPER",
				["spellIds"] = {
				},
				["use_message"] = true,
				["debuffType"] = "HELPFUL",
				["use_messageType"] = true,
				["messageType"] = "CHAT_MSG_PARTY",
			},
			["text1Containment"] = "OUTSIDE",
			["text1Point"] = "BOTTOM",
			["xOffset"] = -125.999267578125,
			["text2FontFlags"] = "THICKOUTLINE",
			["height"] = 100,
			["parent"] = "萨格拉斯之墓 - 09#基尔加丹",
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
				["use_zone"] = false,
				["use_level"] = false,
				["class"] = {
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
			["displayIcon"] = 460698,
			["glow"] = false,
			["text2Containment"] = "OUTSIDE",
			["numTriggers"] = 1,
			["text1Color"] = {
				1, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["cooldownTextEnabled"] = true,
			["icon"] = true,
			["text1FontFlags"] = "THICKOUTLINE",
			["regionType"] = "icon",
			["width"] = 100,
			["text2Enabled"] = true,
			["text2FontSize"] = 24,
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["id"] = "爆裂恐惧烈焰",
			["text1"] = "点你",
			["desaturate"] = false,
			["justify"] = "LEFT",
			["zoom"] = 0,
			["auto"] = true,
			["text2"] = "烈焰",
			["additional_triggers"] = {
			},
			["text1Font"] = "Friz Quadrata TT",
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["text2Font"] = "Friz Quadrata TT",
			["stickyDuration"] = false,
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
			["untrigger"] = {
				["message"] = "Reset",
				["custom"] = "\n\n",
				["use_message"] = true,
				["use_messageType"] = true,
				["message_operator"] = "==",
				["messageType"] = "CHAT_MSG_PARTY",
			},
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
					["do_sound"] = true,
					["do_message"] = false,
					["glow_frame"] = "WeakAuras:Artillery",
					["message_type"] = "SAY",
					["glow_action"] = "show",
					["sound"] = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Sounds\\BITE.ogg",
					["message"] = "",
				},
				["init"] = {
					["do_custom"] = false,
					["custom"] = "\n\n",
				},
				["finish"] = {
				},
			},
			["fontFlags"] = "THICKOUTLINE",
			["useTooltip"] = false,
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["preset"] = "spiral",
					["type"] = "none",
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
				["fullscan"] = true,
				["type"] = "aura",
				["spellId"] = "230959",
				["unevent"] = "timed",
				["use_unit"] = true,
				["duration"] = "2",
				["event"] = "Combat Log",
				["subeventPrefix"] = "SPELL",
				["name"] = "昏暗隐匿",
				["use_spellId"] = true,
				["spellIds"] = {
					200084, -- [1]
				},
				["custom_hide"] = "timed",
				["subeventSuffix"] = "_CAST_START",
				["unit"] = "player",
				["names"] = {
					"灵魂之刃", -- [1]
				},
				["debuffType"] = "HARMFUL",
			},
			["parent"] = "萨格拉斯之墓 - 04#主母萨丝琳",
			["desaturate"] = true,
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
			["displayIcon"] = "132107",
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
				["role"] = {
					["single"] = "TANK",
					["multi"] = {
						["TANK"] = true,
					},
				},
				["use_zoneId"] = true,
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["faction"] = {
					["multi"] = {
					},
				},
				["use_zone"] = false,
				["use_level"] = false,
				["class"] = {
					["multi"] = {
					},
				},
			},
			["yOffset"] = 0,
			["numTriggers"] = 1,
			["fontSize"] = 15,
			["text2Containment"] = "OUTSIDE",
			["glow"] = false,
			["text1Color"] = {
				1, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["icon"] = true,
			["width"] = 100,
			["text1FontFlags"] = "THICKOUTLINE",
			["regionType"] = "icon",
			["text2Enabled"] = true,
			["text1Enabled"] = true,
			["text2FontSize"] = 20,
			["additional_triggers"] = {
			},
			["selfPoint"] = "CENTER",
			["text1"] = "命中: -75%",
			["text2"] = "跑开",
			["stacksContainment"] = "OUTSIDE",
			["zoom"] = 0,
			["auto"] = true,
			["text1Font"] = "Friz Quadrata TT",
			["id"] = "昏暗隐匿",
			["xOffset"] = 0,
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["text2Color"] = {
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
			["text1Containment"] = "OUTSIDE",
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
					["glow_frame"] = "WeakAuras:Artillery",
					["do_message"] = false,
					["do_sound"] = false,
					["message_type"] = "SAY",
					["glow_action"] = "show",
					["sound"] = "Interface\\AddOns\\Prat-3.0\\Sounds\\Link.ogg",
					["message"] = "",
				},
				["init"] = {
					["do_custom"] = false,
					["custom"] = "\n\n",
				},
				["finish"] = {
				},
			},
			["fontFlags"] = "THICKOUTLINE",
			["useTooltip"] = false,
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["preset"] = "spiral",
					["type"] = "none",
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
				["spellId"] = "239932",
				["duration"] = "2",
				["use_unit"] = true,
				["specificUnit"] = "boss1",
				["group_count"] = "0",
				["debuffType"] = "HARMFUL",
				["type"] = "aura",
				["unevent"] = "timed",
				["custom_hide"] = "timed",
				["event"] = "Combat Log",
				["names"] = {
					"聚焦恐惧烈焰", -- [1]
				},
				["use_specific_unit"] = false,
				["use_spellId"] = true,
				["spellIds"] = {
					238505, -- [1]
				},
				["name"] = "邪爪",
				["unit"] = "group",
				["group_countOperator"] = ">",
				["subeventSuffix"] = "_CAST_START",
				["subeventPrefix"] = "SPELL",
			},
			["parent"] = "萨格拉斯之墓 - 09#基尔加丹",
			["text1Containment"] = "OUTSIDE",
			["yOffset"] = 0,
			["text1Point"] = "BOTTOM",
			["stacksPoint"] = "BOTTOM",
			["text2FontFlags"] = "THICKOUTLINE",
			["height"] = 100,
			["displayIcon"] = 464119,
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
				["role"] = {
					["single"] = "TANK",
					["multi"] = {
						["TANK"] = true,
					},
				},
				["use_zoneId"] = true,
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["faction"] = {
					["multi"] = {
					},
				},
				["use_zone"] = false,
				["use_level"] = false,
				["class"] = {
					["multi"] = {
					},
				},
			},
			["icon"] = true,
			["numTriggers"] = 2,
			["fontSize"] = 15,
			["text2Containment"] = "OUTSIDE",
			["text1Enabled"] = true,
			["text1Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["desaturate"] = false,
			["width"] = 100,
			["text1FontFlags"] = "THICKOUTLINE",
			["regionType"] = "icon",
			["text2Enabled"] = false,
			["text1Font"] = "Friz Quadrata TT",
			["text2FontSize"] = 24,
			["id"] = "聚焦恐惧烈焰 - 群组",
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text1"] = "分散分担",
			["text2"] = "BOSS",
			["stacksContainment"] = "OUTSIDE",
			["zoom"] = 0,
			["auto"] = true,
			["xOffset"] = 0,
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
						["unit"] = "player",
						["inverse"] = true,
						["debuffType"] = "HARMFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
			},
			["selfPoint"] = "CENTER",
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["text2Font"] = "Friz Quadrata TT",
			["stickyDuration"] = false,
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
			["text2Point"] = "TOP",
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
					["glow_frame"] = "WeakAuras:Artillery",
					["do_message"] = false,
					["do_sound"] = false,
					["message_type"] = "SAY",
					["glow_action"] = "show",
					["sound"] = "Interface\\AddOns\\Prat-3.0\\Sounds\\Link.ogg",
					["message"] = "",
				},
				["init"] = {
					["do_custom"] = false,
					["custom"] = "\n\n",
				},
				["finish"] = {
				},
			},
			["fontFlags"] = "THICKOUTLINE",
			["useTooltip"] = false,
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["preset"] = "spiral",
					["type"] = "none",
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
				["custom_hide"] = "timed",
				["type"] = "aura",
				["spellId"] = "230139",
				["unevent"] = "timed",
				["names"] = {
					"雷霆震击", -- [1]
				},
				["duration"] = "2",
				["event"] = "Combat Log",
				["subeventPrefix"] = "SPELL",
				["name"] = "多头蛇射击",
				["subcount"] = true,
				["spellIds"] = {
					230362, -- [1]
				},
				["use_spellId"] = true,
				["subeventSuffix"] = "_CAST_START",
				["unit"] = "player",
				["use_unit"] = true,
				["debuffType"] = "HARMFUL",
			},
			["parent"] = "萨格拉斯之墓 - 04#主母萨丝琳",
			["text1Containment"] = "OUTSIDE",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text1Point"] = "BOTTOM",
			["stacksPoint"] = "BOTTOM",
			["text2FontFlags"] = "THICKOUTLINE",
			["height"] = 100,
			["displayIcon"] = 464119,
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
				["use_zoneId"] = true,
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
				["use_zone"] = false,
				["use_level"] = false,
				["class"] = {
					["multi"] = {
					},
				},
			},
			["yOffset"] = 0,
			["numTriggers"] = 1,
			["fontSize"] = 15,
			["text2Containment"] = "OUTSIDE",
			["glow"] = false,
			["text1Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["icon"] = true,
			["width"] = 100,
			["text1FontFlags"] = "THICKOUTLINE",
			["regionType"] = "icon",
			["text2Enabled"] = false,
			["selfPoint"] = "CENTER",
			["text2FontSize"] = 20,
			["additional_triggers"] = {
			},
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text1"] = "昏迷",
			["text2"] = "%p",
			["stacksContainment"] = "OUTSIDE",
			["zoom"] = 0,
			["auto"] = true,
			["text1Font"] = "Friz Quadrata TT",
			["id"] = "雷霆震击",
			["xOffset"] = 0,
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["text1Enabled"] = true,
			["text2Font"] = "Friz Quadrata TT",
			["inverse"] = false,
			["stickyDuration"] = false,
			["conditions"] = {
			},
			["cooldown"] = true,
			["desaturate"] = true,
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
					["do_sound"] = false,
					["do_message"] = false,
					["glow_frame"] = "WeakAuras:Artillery",
					["message_type"] = "SAY",
					["glow_action"] = "show",
					["sound"] = "Interface\\AddOns\\Prat-3.0\\Sounds\\Link.ogg",
					["message"] = "",
				},
				["init"] = {
					["do_custom"] = false,
					["custom"] = "\n\n",
				},
				["finish"] = {
				},
			},
			["fontFlags"] = "THICKOUTLINE",
			["useTooltip"] = false,
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["preset"] = "spiral",
					["type"] = "none",
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
				["spellId"] = "239932",
				["duration"] = "2",
				["use_specific_unit"] = false,
				["specificUnit"] = "boss1",
				["debuffType"] = "HARMFUL",
				["type"] = "aura",
				["unevent"] = "timed",
				["event"] = "Combat Log",
				["custom_hide"] = "timed",
				["name"] = "邪爪",
				["use_spellId"] = true,
				["spellIds"] = {
					236378, -- [1]
					236710, -- [2]
					237590, -- [3]
				},
				["names"] = {
					"暗影映像：哀嚎", -- [1]
					"暗影映像：爆发", -- [2]
					"暗影映像：绝望", -- [3]
				},
				["use_unit"] = true,
				["unit"] = "player",
				["subeventSuffix"] = "_CAST_START",
				["subeventPrefix"] = "SPELL",
			},
			["yOffset"] = 0,
			["text1Containment"] = "OUTSIDE",
			["glow"] = false,
			["text1Point"] = "BOTTOM",
			["stacksPoint"] = "BOTTOM",
			["text2FontFlags"] = "THICKOUTLINE",
			["height"] = 100,
			["displayIcon"] = 464119,
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
				["use_zoneId"] = true,
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
				["use_zone"] = false,
				["use_level"] = false,
				["class"] = {
					["multi"] = {
					},
				},
			},
			["icon"] = true,
			["numTriggers"] = 1,
			["fontSize"] = 15,
			["text2Containment"] = "OUTSIDE",
			["text1Enabled"] = true,
			["text1Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["selfPoint"] = "CENTER",
			["width"] = 100,
			["text1FontFlags"] = "THICKOUTLINE",
			["regionType"] = "icon",
			["text2Enabled"] = true,
			["xOffset"] = 0,
			["text2FontSize"] = 22,
			["id"] = "暗影映像",
			["desaturate"] = false,
			["text1"] = "镜像点名",
			["text2"] = "灵魂",
			["stacksContainment"] = "OUTSIDE",
			["zoom"] = 0,
			["auto"] = true,
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["additional_triggers"] = {
			},
			["text1Font"] = "Friz Quadrata TT",
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["text2Font"] = "Friz Quadrata TT",
			["stickyDuration"] = false,
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
			["parent"] = "萨格拉斯之墓 - 09#基尔加丹",
		},
	},
	["editor_theme"] = "Monokai",
}
