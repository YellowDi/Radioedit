local E, L, V, P, G, _ = unpack(ElvUI); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB, Localize Underscore
local UF = E:GetModule('UnitFrames');

E.Options.args.unitframe.name = '04.'.. L["UnitFrames"]
E.Options.args.unitframe.args.general.args.generalGroup.args.transparent = {
	order = 5,
	type = 'toggle',
	name = L["Transparent Theme"],
	disabled = function() return E.db.general.transparent == false end,
	set = function(info, value) E.db.unitframe.transparent = value; E:StaticPopup_Show("CONFIG_RL") end,
}
E.Options.args.unitframe.args.general.args.generalGroup.args.powertrans = {
	order = 6,
	type = 'toggle',
	name = L["Transparent Power"],
	disabled = function() return E.db.general.transparent == false end,
	set = function(info, value) E.db.unitframe.powertrans = value; E:StaticPopup_Show("CONFIG_RL") end,
}
E.Options.args.unitframe.args.general.args.generalGroup.args.unitframeType = {
	order = 7,
	name = E.ValColor..L["Eui UF Style"].."|r",
	type = 'range',
	min = 1, max = 9, step = 1,
	set = function(info, value)
		E.db.unitframe.unitframeType = value
		E:SetupUFStyle(value)
	end,
}
E.Options.args.unitframe.args.general.args.fontGroup.args.number = {
	type = "select",
	order = 10,
	name = L["value type"],
	desc = L["set value type"],
	values = {
		["0"] = L["0"],
		["K"] = L["K"],
		["W"] = L["W"],
		["CNW"] = L["CNW"],
	},
}
--P["unitframe"].number
E.Options.args.general.args.general.args.number = {
	type = "select",
	order = 100,
	name = L["value type"],
	desc = L["set value type"],
	get = function(info) return E.db.unitframe.number end,
	set = function(info, value)
		E.db.unitframe.number = value;
		local UF = E:GetModule('UnitFrames')
		if UF then UF:Update_AllFrames(); end
	end,
	values = {
		["0"] = L["0"],
		["K"] = L["K"],
		["W"] = L["W"],
		["CNW"] = L["CNW"],
	},
}


local unitsGroup = {'player', 'target', 'targettarget', 'targettargettarget', 'focus', 'focustarget', 'pet', 'pettarget'}
for i = 1, #unitsGroup do
	if E.Options.args.unitframe.args[unitsGroup[i]].args then
		if E.Options.args.unitframe.args[unitsGroup[i]].args.health and (not E.Options.args.unitframe.args[unitsGroup[i]].args.health.args.orientation) then
			E.Options.args.unitframe.args[unitsGroup[i]].args.health.args.orientation = {
				order = 99,
				type = 'select',
				name = L['Orientation'],
				get = function(info) return E.db.unitframe.units[unitsGroup[i]].health.orientation; end,
				set = function(info, value) E.db.unitframe.units[unitsGroup[i]].health.orientation = value; E:StaticPopup_Show('CONFIG_RL'); end,
				values = {
					['HORIZONTAL'] = L['Horizontal'],
					['VERTICAL'] = L['Vertical'],
				},
			}
		end
		if E.Options.args.unitframe.args[unitsGroup[i]].args.power and (not E.Options.args.unitframe.args[unitsGroup[i]].args.power.args.orientation) then
			E.Options.args.unitframe.args[unitsGroup[i]].args.power.args.orientation = {
				order = 99,
				type = 'select',
				name = L['Orientation'],
				get = function(info) return E.db.unitframe.units[unitsGroup[i]].power.orientation; end,
				set = function(info, value) E.db.unitframe.units[unitsGroup[i]].power.orientation = value; E:StaticPopup_Show('CONFIG_RL'); end,
				values = {
					['HORIZONTAL'] = L['Horizontal'],
					['VERTICAL'] = L['Vertical'],
				},
			}
		end
		E.Options.args.unitframe.args[unitsGroup[i]].args.height.max = 550
	end
end	

E.Options.args.unitframe.args.player.args.Swing = {
	order = 801,
	type = 'group',
	name = L['Swing'],
	get = function(info) return E.db.unitframe.units['player']['Swing'][ info[#info] ] end,
	set = function(info, value) E.db.unitframe.units['player']['Swing'][ info[#info] ] = value; UF:CreateAndUpdateUF('player'); end,
	args = {
		enable = {
			type = 'toggle',
			order = 1,
			name = L['Enable'],
			desc = L['Swing Bar'],
		},
		width = {
			order = 2,
			name = L['Width'],
			type = 'range',
			min = 20, max = 600, step = 1,
		},
		height = {
			order = 3,
			name = L['Height'],
			type = 'range',
			min = 4, max = 200, step = 1,
		},
		text = {
			order = 4,
			name = L['Display Text'],
			type = 'toggle',
		},
		color = {
			order = 5,
			type = 'color',
			name = L['Color'],
			get = function(info)
				local t = E.db.unitframe.units['player']['Swing'].color
				return t.r, t.g, t.b, t.a
			end,
			set = function(info, r, g, b)
				local t = E.db.unitframe.units['player']['Swing'].color
				t.r, t.g, t.b = r, g, b
				UF:CreateAndUpdateUF('player');
			end,			
		},			
	},
}
E.Options.args.unitframe.args.player.args.gcd = {
	order = 12,
	name = L['GCD Bar'],
	desc = L['GCD Bar'],
	set = function(info, value) E.db.unitframe.units.player.gcd = value; E:StaticPopup_Show("CONFIG_RL") end,
	get = function(info) return E.db.unitframe.units.player.gcd; end,
	type = 'toggle',
}

E.Options.args.unitframe.args.player.args.tankshield = {
	order = 1200,
	type = 'group',
	name = L['BloodShield'],
	desc = L["BloodShield desc"],
	get = function(info) return E.db.unitframe.units['player']['tankshield'][ info[#info] ] end,
	set = function(info, value) E.db.unitframe.units['player']['tankshield'][ info[#info] ] = value; UF:CreateAndUpdateUF('player') end,
	args = {
		enable = {
			type = 'toggle',
			order = 1,
			name = L['Enable'],
		},
		xOffset = {
			order = 8,
			type = 'range',
			name = L['xOffset'],
			min = -600, max = 600, step = 1,
		},
		yOffset = {
			order = 9,
			type = 'range',
			name = L['yOffset'],
			min = -600, max = 600, step = 1,
		},
		sizeOverride = {
			type = 'range',
			order = 10,
			name = L['Size Override'],
			min = 0, max = 150, step = 1,
		},
	},
}

E.Options.args.unitframe.args.player.args.stagger = nil;
E.Options.args.unitframe.args.general.args.generalGroup.args.casttimeformat = {
	order = 6,
	type = 'range',
	min = 0, max = 2, step = 1,
	name = L['Castbar time Decimal places'],
}

E.Options.args.unitframe.args.player.args.classbar.args.text = {
	order = 5,
	type = 'toggle',
	name = L['Text'],
}

if E.myclass == 'DEATHKNIGHT' then
E.Options.args.unitframe.args.player.args.classbar.args.dkText = {
	order = 6,
	type = 'toggle',
	name = L['Time'],
}
E.Options.args.unitframe.args.player.args.classbar.args.dkTextXoffset = {
	order = 7,
	type = 'range',
	min = -100, max = 100, step = 1,
	name = L['xOffset'],
	disabled = function() return not E.db.unitframe.units.player.classbar.dkText; end,
}
E.Options.args.unitframe.args.player.args.classbar.args.dkTextYoffset = {
	order = 8,
	type = 'range',
	min = -100, max = 100, step = 1,
	name = L['yOffset'],
	disabled = function() return not E.db.unitframe.units.player.classbar.dkText; end,
}
end


E.Options.args.unitframe.args.player.args.classbar.args.dkRunesBorderColor = {
	order = 6,
	type = 'toggle',
	name = L['dkRunesBorderColor'],
	hidden = (E.myclass ~= 'DEATHKNIGHT'),
}


E.Options.args.unitframe.args.player.args.classbar.args.height.max = 100

if E.myclass == 'MAGE' then
	for i = 1, 3 do
		E.Options.args.unitframe.args.player.args.power.args['tick'..i] = {
			order = 30+i,
			name = L['Display Tick'..i],
			desc = L['Set to 0 to disable.'],
			type = 'range',
			min = 0, max = 1, step = 0.01,
			isPercent = true,
		}
	end
	E.Options.args.unitframe.args.player.args.power.args.minperc = {
		order = 35,
		name = L['Powerbar min perc'],
		desc = L['Set to 0 to disable.'],
		type = 'range',
		min = 0, max = 1, step = 0.01,
		isPercent = true,
	}
end

E.Options.args.unitframe.args.target.args.DragonOverlayStyle = {
	order = 13,
	type = 'select',
	name = L['Dragon Overlay Style'],
	values = {
		['classic'] = L['classic'],
		['modern'] = L['modern'],
		['none'] = NONE,
	},
	set = function(info,value) E.db.unitframe.units['target'].DragonOverlayStyle = value; UF:CreateAndUpdateUF('target'); end
}

E.Options.args.unitframe.args.target.args.range = {
	order = 350,
	type = 'group',
	name = L["Range"],
	get = function(info) return E.db.unitframe.units['target']['range'][ info[#info] ] end,
	set = function(info, value) E.db.unitframe.units['target']['range'][ info[#info] ] = value; UF:CreateAndUpdateUF('target') end,
	args = {
		enable = {
			order = 1,
			type = 'toggle',
			name = L['Enable'],
		},
		position = {
			type = 'select',
			order = 2,
			name = L['Position'],
			values = {
				TOPLEFT = L['TOPLEFT'],
				LEFT = L['LEFT'],
				BOTTOMLEFT = L['BOTTOMLEFT'],
				RIGHT = L['RIGHT'],
				TOPRIGHT = L['TOPRIGHT'],
				BOTTOMRIGHT = L['BOTTOMRIGHT'],
				CENTER = L['CENTER'],
				TOP = L['TOP'],
				BOTTOM = L['BOTTOM'],
			},
		},		
		offsetX = {
			order = 3,
			type = 'range',
			name = L['X Offset'],
			min = -500, max = 500, step = 1,
		},
		offsetY = {
			order = 4,
			type = 'range',
			name = L['Y Offset'],
			min = -500, max = 500, step = 1,
		},	
	},
}

E.Options.args.unitframe.args.target.args.castbar.args.InterruptSound = {
	order = 100,
	type = 'toggle',
	name = L['Interrupting the voice prompts'],
}

E.Options.args.unitframe.args.focus.args.castbar.args.InterruptSound = {
	order = 100,
	type = 'toggle',
	name = L['Interrupting the voice prompts'],
}

E.Options.args.unitframe.args.focus.args.range = {
	order = 350,
	type = 'group',
	name = L["Range"],
	get = function(info) return E.db.unitframe.units['focus']['range'][ info[#info] ] end,
	set = function(info, value) E.db.unitframe.units['focus']['range'][ info[#info] ] = value; UF:CreateAndUpdateUF('focus') end,
	args = {
		enable = {
			order = 1,
			type = 'toggle',
			name = L['Enable'],
		},
		position = {
			type = 'select',
			order = 2,
			name = L['Position'],
			values = {
				TOPLEFT = L['TOPLEFT'],
				LEFT = L['LEFT'],
				BOTTOMLEFT = L['BOTTOMLEFT'],
				RIGHT = L['RIGHT'],
				TOPRIGHT = L['TOPRIGHT'],
				BOTTOMRIGHT = L['BOTTOMRIGHT'],
				CENTER = L['CENTER'],
				TOP = L['TOP'],
				BOTTOM = L['BOTTOM'],
			},
		},		
		offsetX = {
			order = 3,
			type = 'range',
			name = L['X Offset'],
			min = -500, max = 500, step = 1,
		},
		offsetY = {
			order = 4,
			type = 'range',
			name = L['Y Offset'],
			min = -500, max = 500, step = 1,
		},	
	},
}

E.Options.args.unitframe.args['raid'].name = L['Raid Frames'];
E.Options.args.unitframe.args['raid'].args.health.args.colorClass = {
	order = 6,
	type = 'toggle',
	name = L['Class Health'],
	desc = L['Color health by classcolor or reaction.'],											
}

E.Options.args.unitframe.args['raid'].args.general.args.mouseGlow = {
	order = 10,
	type = 'toggle',
	name = L['mouseGlow'],
}

E.Options.args.unitframe.args['boss'].args.mouseGlow = {
	order = 10,
	type = 'toggle',
	name = L['mouseGlow'],
}

E.Options.args.unitframe.args['raid'].args.general.args.visibilityGroup.args.spacer = {
	type = 'description',
	name = '',
	order = 3,
}
E.Options.args.unitframe.args['raid'].args.general.args.visibilityGroup.args.soloShow = {
	order = 4,
	type = 'execute',
	name = L['Solo Show'],
	func = function()
		E.db.unitframe.units['raid'].visibility = '[@player,exists,nogroup:party] show;';
		UF:CreateAndUpdateHeaderGroup('raid', nil, nil, true)
	end,
}
E.Options.args.unitframe.args['raid'].args.general.args.visibilityGroup.args.partyShow = {
	order = 5,
	type = 'execute',
	name = L['Party Show'],
	func = function()
		E.db.unitframe.units['raid'].visibility = '[group:party,nogroup:raid] show;';
		UF:CreateAndUpdateHeaderGroup('raid', nil, nil, true)
	end,
}
E.Options.args.unitframe.args['raid'].args.general.args.visibilityGroup.args.raidShow = {
	order = 6,
	type = 'execute',
	name = L['Raid Show'],
	func = function()
		E.db.unitframe.units['raid'].visibility = '[@raid2,noexists] hide;show';
		UF:CreateAndUpdateHeaderGroup('raid', nil, nil, true)
	end,
}
E.Options.args.unitframe.args['raid'].args.general.args.visibilityGroup.args.visibility.order = 7;

E.Options.args.unitframe.args['party'].args.general.args.visibilityGroup.args.spacer = {
	type = 'description',
	name = '',
	order = 3,
}
E.Options.args.unitframe.args['party'].args.general.args.visibilityGroup.args.soloShow = {
	order = 4,
	type = 'execute',
	name = L['Solo Show'],
	func = function()
		E.db.unitframe.units['party'].visibility = '[@raid2,exists] hide;show';
		UF:CreateAndUpdateHeaderGroup('party', nil, nil, true)
	end,
}
E.Options.args.unitframe.args['party'].args.general.args.visibilityGroup.args.partyShow = {
	order = 5,
	type = 'execute',
	name = L['Party Show'],
	func = function()
		E.db.unitframe.units['party'].visibility = '[@raid2,exists][@party1,noexists] hide;show';
		UF:CreateAndUpdateHeaderGroup('party', nil, nil, true)
	end,
}
E.Options.args.unitframe.args['party'].args.general.args.visibilityGroup.args.raidShow = {
	order = 6,
	type = 'execute',
	name = L['Raid Show'],
	func = function()
		E.db.unitframe.units['party'].visibility = '[@raid2,noexists] hide;show';
		UF:CreateAndUpdateHeaderGroup('party', nil, nil, true)
	end,
}
E.Options.args.unitframe.args['party'].args.general.args.visibilityGroup.args.arenaShow = {
	order = 7,
	type = 'execute',
	name = L['Arena Show'],
	func = function()
		E.db.unitframe.units['party'].visibility = '[@raid6,exists][nogroup] hide;show';
		UF:CreateAndUpdateHeaderGroup('party', nil, nil, true)
	end,
}

E.Options.args.unitframe.args['party'].args.general.args.visibilityGroup.args.visibility.order = 7;

--E.Options.args.unitframe.args.raidpet = nil

E.Options.args.unitframe.args.boss.args.attack_color = {
	order = 12,
	name = L['attack_color'],
	type = 'toggle',
}

E.Options.args.unitframe.args.boss.args.threatStyle = nil
E.Options.args.unitframe.args.boss.args.space = {
	order = 9,
	name = L['Vertical Spacing'],
	type = 'range',
	min = 10, max = 100, step = 1,
}

E.Options.args.unitframe.args.boss.args.targetBossColor = {
	order = 13,
	type = 'color',
	name = CHOOSE..TARGET..COLOR,
	get = function(info)
		local t = E.db.unitframe.units.boss.targetBossColor
		return t.r, t.g, t.b, t.a
	end,
	set = function(info, r, g, b)
		local t = E.db.unitframe.units.boss.targetBossColor
		t.r, t.g, t.b = r, g, b
		UF:Update_AllFrames()
	end,	
}

E.Options.args.unitframe.args.target.args.factionIcon = {
	order = 1000,
	type = 'group',
	name = L["Faction Icon"],
	get = function(info) return E.db.unitframe.units['target']['factionIcon'][ info[#info] ] end,
	set = function(info, value) E.db.unitframe.units['target']['factionIcon'][ info[#info] ] = value; UF:CreateAndUpdateUF('target') end,
	args = {
		enable = {
			type = 'toggle',
			order = 1,
			name = L['Enable'],
		},
		xOffset = {
			order = 2,
			type = 'range',
			name = L['xOffset'],
			desc = L['An X offset (in pixels) to be used when anchoring new frames.'],
			min = -500, max = 500, step = 1,		
		},
		yOffset = {
			order = 3,
			type = 'range',
			name = L['yOffset'],
			desc = L['An Y offset (in pixels) to be used when anchoring new frames.'],
			min = -500, max = 500, step = 1,		
		},
		size = {
			order = 4,
			type = 'range',
			name = L['Size'],
			min = 4, max = 100, step = 1,
		},
	},
}
local ABM = E:GetModule('AuraMover')
E.Options.args.unitframe.args.player.args.aurabar.args.detach = {
	order = 25,
	type = "toggle",
	name = '|cff30ee30'..L['Detach From Frame']..'|r',
	get = function(info) return E.db.abm.player end,
	set = function(info, value) E.db.abm.player = value; UF:CreateAndUpdateUF('player'); ABM:MoverToggle() end,
}

E.Options.args.unitframe.args.player.args.aurabar.args.width = {
	order = 26,
	type = "range",
	name = '|cff30ee30'..L['Width']..'|r',
	min = 50, max = 500, step = 1,
	get = function(info) return E.db.abm.playerw end,
	set = function(info, value) E.db.abm.playerw = value; UF:CreateAndUpdateUF('player') end,
}

E.Options.args.unitframe.args.player.args.aurabar.args.space = {
	order = 27,
	type = "range",
	name = '|cff30ee30'..L["Vertical Spacing"]..'|r',
	min = -10, max = 20, step = 1,
	get = function(info) return E.db.abm.playerSpace end,
	set = function(info, value) E.db.abm.playerSpace = value; UF:CreateAndUpdateUF('player') end,
}

E.Options.args.unitframe.args.target.args.aurabar.args.detach = {
	order = 25,
	type = "toggle",
	name = '|cff30ee30'..L['Detach From Frame']..'|r',
	get = function(info) return E.db.abm.target end,
	set = function(info, value) E.db.abm.target = value; UF:CreateAndUpdateUF('target'); ABM:MoverToggle() end,
}

E.Options.args.unitframe.args.target.args.aurabar.args.width = {
	order = 26,
	type = "range",
	name = '|cff30ee30'..L['Width']..'|r',
	min = 50, max = 500, step = 1,
	get = function(info) return E.db.abm.targetw end,
	set = function(info, value) E.db.abm.targetw = value; UF:CreateAndUpdateUF('target') end,
}

E.Options.args.unitframe.args.target.args.aurabar.args.space = {
	order = 27,
	type = "range",
	name = '|cff30ee30'..L["Vertical Spacing"]..'|r',
	min = -10, max = 20, step = 1,
	get = function(info) return E.db.abm.targetSpace end,
	set = function(info, value) E.db.abm.targetSpace = value; UF:CreateAndUpdateUF('target') end,
}

E.Options.args.unitframe.args.focus.args.aurabar.args.detach = {
	order = 25,
	type = "toggle",
	name = '|cff30ee30'..L['Detach From Frame']..'|r',
	get = function(info) return E.db.abm.focus end,
	set = function(info, value) E.db.abm.focus = value; UF:CreateAndUpdateUF('focus'); ABM:MoverToggle() end,
}

E.Options.args.unitframe.args.focus.args.aurabar.args.width = {
	order = 26,
	type = "range",
	name = '|cff30ee30'..L['Width']..'|r',
	min = 50, max = 500, step = 1,
	get = function(info) return E.db.abm.focusw end,
	set = function(info, value) E.db.abm.focusw = value; UF:CreateAndUpdateUF('focus') end,
}

E.Options.args.unitframe.args.focus.args.aurabar.args.space = {
	order = 27,
	type = "range",
	name = '|cff30ee30'..L["Vertical Spacing"]..'|r',
	min = -10, max = 20, step = 1,
	get = function(info) return E.db.abm.focusSpace end,
	set = function(info, value) E.db.abm.focusSpace = value; UF:CreateAndUpdateUF('focus') end,
}