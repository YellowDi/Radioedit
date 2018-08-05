local _, ns = ...

-- [[ Default Aura Filter ]] --
ns.defaultAuras = {
	['general'] = { },
	['boss'] = { },
	['arena'] = { },
}

do
	local l = ns.AuraList
	for _, list in pairs({l.Immunity, l.CCImmunity, l.Defensive, l.Offensive, l.Helpful, l.Misc}) do
		for i = 1, #list do
			ns.defaultAuras.arena[list[i]] = true
		end
	end
end

-- [[	Default Settings	]] --
ns.defaultConfig = {
	fontNormal = GameTooltipTextLeft1:GetFont(),
	fontNormalOutline = "NONE",
	fontNormalSize = 1, -- relative size

	fontBig = GameTooltipTextLeft1:GetFont(),
	fontBigOutline = "NONE",
	fontBigSize = 1, -- relative size

	castbars = false,
	castbarSafezoneColor = {.8, 0.4, 0, 1},
	portraitTimer = true,
	combatText = false,
	threatGlow = true,
	colorPlayerDebuffsOnly = true,
	largePlayerAuras = true,

	healthcolormode = 'CLASS',
	healthcolor = { 0.0, 0.1, 0.0 },

	powercolormode = 'TYPE',
	powerUseAtlas = true, --todo
	powerPredictionBar = true, --todoo
	builderSpender = true, --todo
	powercolor = { 0.0, 0.1, 0.0 },

	backdropColor = {0, 0, 0, 0.55},

	TextHealthColor = {1, 1, 1},
	TextHealthColorMode = "CUSTOM",
	TextPowerColor = {1, 1, 1},
	TextPowerColorMode = "CUSTOM",
	TextNameColor = {1, 1, 1},
	TextNameColorMode = "CUSTOM",

	showParty = true,
	showPartyInRaid = true,
	showArena = true,
	showBoss = true,

	borderType = 'neal',
	textureBorder = 'Interface\\AddOns\\oUF_Abu\\Media\\Border\\2borderNormal',
	textureBorderWhite = 'Interface\\AddOns\\oUF_Abu\\Media\\Border\\2borderWhite',
	textureBorderShadow = 'Interface\\AddOns\\oUF_Abu\\Media\\Border\\2borderShadow',

	statusbar = 'Interface\\AddOns\\oUF_Abu\\Media\\Texture\\Raid-Bar-Hp-Fill',
	frameColor = {0.5, 0.5, 0.4},
	playerStyle = 'normal',
	customPlayerTexture = 'Interface\\AddOns\\oUF_Abu\\Media\\Frames\\CUSTOMPLAYER-FRAME',
	frameStyle = 'normal',

	focMod = 'shift-',
	focBut = '1',
	castbarticks = true,
	useAuraTimer = true,
	clickThrough = false,
	classPortraits = false,

	classBar = {},

	-- class stuff
	DEATHKNIGHT = {
		showRunes = true,
		showTotems = true,
	},
	DEMONHUNTER = {
	},
	DRUID = {
		showTotems = true,
		showAdditionalPower = true,
	},
	HUNTER = {
		showTotems = true,
	},
	MAGE = {
		showArcaneStacks = true,
		showTotems = true,
	},
	MONK = {
		showStagger = true,
		showChi = true,
		showTotems = true,
		showAdditionalPower = true,
	},
	PALADIN = {
		showHolyPower = true,
		showTotems = true,
		showAdditionalPower = true,
	},
	PRIEST = {
		showInsanity = true,
		showAdditionalPower = true,
	},
	ROGUE = {
	},
	SHAMAN = {
		showTotems = true,
		showAdditionalPower = true,
	},
	WARLOCK = {
		showShards = true,
		showTotems = true,
	},
	WARRIOR = {
		showTotems = true,
	},

	showComboPoints = true,

	absorbBar = true,
	absorbtexture = 'Interface\\AddOns\\oUF_Abu\\Media\\Texture\\absorbTexture',
	absorbspark = 'Interface\\AddOns\\oUF_Abu\\Media\\Texture\\absorbSpark',

 	player = {
 		style = "normal",
		scale = 1.2,
		HealthTag = "NUMERIC",
		PowerTag = "PERCENT",
		cbshow = true, 
		cbwidth = 200,
		cbheight = 18,
		cbicon = 'LEFT',
		position = 'CENTER/-205/-160',
		cbposition = 'BOTTOM/0/150',
	},

	pet = {
 		style = "normal",
		scale = 1.2,
		HealthTag = "MINIMAL",
		PowerTag = "DISABLE",
		cbshow = true, 
		cbwidth = 200,
		cbheight = 18,
		cbicon = 'LEFT',
		position = 'BOTTOM/-220/225',
		cbposition = 'BOTTOM/0/180',
	},

	target = {
 		style = "normal",
		scale = 1.2,
		HealthTag = "BOTH",
		PowerTag = "PERCENT",
		buffPos = "TOP",
		debuffPos = "BOTTOM",
		cbshow = true, 
		cbwidth = 200,
		cbheight = 18,
		cbicon = 'LEFT',
		position = 'CENTER/205/-160',
		cbposition = 'BOTTOM/10/350',
	},
	
	targettarget = {
		enable = true,
 		style = "normal",
		scale = 1.2,
		enableAura = false,
		HealthTag = "DISABLE",
   },
	
	focus = {
 		style = "normal",
		scale = 1.2,
		HealthTag = "BOTH",
		PowerTag = "PERCENT",
		buffPos = "NONE",
		debuffPos = "BOTTOM",
		position = 'LEFT/300/80',
		cbshow = true, 
		cbwidth = 180,
		cbheight = 20,
		cbicon = 'LEFT',
		cbposition = 'LEFT/300/125',
	},
	
	focustarget = {
		enable = true,
 		style = "normal",
		scale = 1.2,
		enableAura = false,
		HealthTag = "DISABLE",
	},
	
	party = {
 		style = "normal",
		scale = 1.1,
		HealthTag = "MINIMAL",
		PowerTag = "DISABLE",
		position = 'LEFT/80/290'
	},

	boss = {
		scale = 1,
		HealthTag = "PERCENT",
		PowerTag = "PERCENT",
		cbshow = true,
		cboffset = {0, 0},
		cbwidth = 150,
		cbheight = 18,
		cbicon = 'LEFT',
		position = 'RIGHT/-188/255'
	},

	arena = {
		scale = 1.1,
		HealthTag = "BOTH",
		PowerTag = "PERCENT",
		cboffset = {0, 0},
		cbshow = true, 
		cbwidth = 150,
		cbheight = 22,
		cbicon = 'LEFT',
		position = 'RIGHT/-175/225'
	},
}
-----------------------------------------------------------------------
ns.defaultProfiles = {
	auraprofile = 'Default',
	profile = 'Default',
}