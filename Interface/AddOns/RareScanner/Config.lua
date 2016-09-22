-----------------------------------------------------------------------
-- AddOn namespace.
-----------------------------------------------------------------------
local ADDON_NAME, private = ...

local LibStub = _G.LibStub

local RareScanner = LibStub("AceAddon-3.0"):GetAddon("RareScanner")
local AL = LibStub("AceLocale-3.0"):GetLocale("RareScanner", false)

-----------------------------------------------------------------------
-- Config option functions.
-----------------------------------------------------------------------
private.SOUNDS = {
	["Female BloodElf Beg"] = "Sound\\Character\\BloodElf\\BloodElfFemaleBeg01.wav",
	["Achievement Sound"] = "Sound\\spells\\achievmentsound1.ogg",
	["Alarm Clock"] = "Sound\\interface\\alarmclockwarning2.ogg",
	["Boat Docking"] = "Sound\\doodad\\boatdockedwarning.ogg",
	["Siege Engineer Weapon"] = "Sound\\doodad\\fx_ograid_siege_weaponmachine_warning.ogg",
	["PVP Alliance"] = "Sound\\spells\\pvpwarningalliance.ogg",
	["PVP Horde"] = "Sound\\spells\\pvpwarninghorde.ogg",
	["Ready Check"] = "Sound\\interface\\levelup2.ogg",
	["Horn"] = "Sound\\Events\\gruntling_horn_bb.ogg",
	["Event Wardrum Ogre"] = "Sound\\Event Sounds\\Event_wardrum_ogre.ogg",
}

private.TOOLTIP_POSITIONS = {
	["ANCHOR_LEFT"] = AL["TOOLTIP_LEFT"],
	["ANCHOR_RIGHT"] = AL["TOOLTIP_RIGHT"],
	["ANCHOR_CURSOR"] = AL["TOOLTIP_CURSOR"],
	["ANCHOR_TOPLEFT"] = AL["TOOLTIP_TOP"],
	["ANCHOR_BOTTOMLEFT"] = AL["TOOLTIP_BOTTOM"],
}

private.ITEM_QUALITY = {
	[0] = AL["QUALITY_POOR"],
	[1] = AL["QUALITY_COMMON"],
	[2] = AL["QUALITY_UNCOMMON"],
	[3] = AL["QUALITY_RARE"],
	[4] = AL["QUALITY_EPIC"],
	[5] = AL["QUALITY_LEGENDARY"],
}

local FILTERED_LIST = {}

local general_options

local function GetGeneralOptions()
	if not general_options then
		local db = private.db

		general_options = {
			type = "group",
			order = 1,
			name = _G.GENERAL_LABEL,
			handler = RareScanner,
			desc = AL["GENERAL_OPTIONS"],
			args = {
				scanRares = {
					order = 0,
					name = AL["ENABLE_SCAN_RARES"],
					desc = AL["ENABLE_SCAN_RARES_DESC"],
					type = "toggle",
					get = function() return db.general.scanRares end,
					set = function(_, value)
						db.general.scanRares = value
					end,
					width = "full",
				},
				scanContainers = {
					order = 1,
					name = AL["ENABLE_SCAN_CONTAINERS"],
					desc = AL["ENABLE_SCAN_CONTAINERS_DESC"],
					type = "toggle",
					get = function() return db.general.scanContainers end,
					set = function(_, value)
						db.general.scanContainers = value
					end,
					width = "full",
				},
				scanEvents = {
					order = 2,
					name = AL["ENABLE_SCAN_EVENTS"],
					desc = AL["ENABLE_SCAN_EVENTS_DESC"],
					type = "toggle",
					get = function() return db.general.scanEvents end,
					set = function(_, value)
						db.general.scanEvents = value
					end,
					width = "full",
				},
				scanGarrison = {
					order = 3,
					name = AL["ENABLE_SCAN_GARRISON_CHEST"],
					desc = AL["ENABLE_SCAN_GARRISON_CHEST_DESC"],
					type = "toggle",
					get = function() return db.general.scanGarrison end,
					set = function(_, value)
						db.general.scanGarrison = value
					end,
					width = "full",
				},
				scanAshran = {
					order = 4,
					name = AL["ENABLE_SCAN_IN_ASHRAN"],
					desc = AL["ENABLE_SCAN_IN_ASHRAN_DESC"],
					type = "toggle",
					get = function() return db.general.scanAshran end,
					set = function(_, value)
						db.general.scanAshran = value
					end,
					width = "full",
				},
				test = {
					order = 5,
					name = AL["TEST"],
					desc = AL["TEST_DESC"],
					type = "execute",
					func = function() RareScanner:Test() end,
					width = "normal",
				}
			},
		}
	end
	
	return general_options
end

local sound_options

local function GetSoundOptions()
	if not sound_options then
		local db = private.db

		sound_options = {
			type = "group",
			order = 2,
			name = AL["SOUND"],
			handler = RareScanner,
			desc = AL["SOUND_OPTIONS"],
			args = {
				soundPlayed = {
					order = 0,
					type = "select",
					dialogControl = 'LSM30_Sound',
					name = AL["ALARM_SOUND"],
					desc = AL["ALARM_SOUND_DESC"],
					values = private.SOUNDS,
					get = function() return db.sound.soundPlayed end,
					set = function(_, value)
						db.sound.soundPlayed = value
					end,
					width = "double",
				},
				soundObjectPlayed = {
					order = 1,
					type = "select",
					dialogControl = 'LSM30_Sound',
					name = AL["ALARM_TREASURES_SOUND"],
					desc = AL["ALARM_TREASURES_SOUND_DESC"],
					values = private.SOUNDS,
					get = function() return db.sound.soundObjectPlayed end,
					set = function(_, value)
						db.sound.soundObjectPlayed = value
					end,
					width = "double",
				},
				soundDisabled = {
					order = 2,
					name = AL["DISABLE_SOUND"],
					desc = AL["DISABLE_SOUND_DESC"],
					type = "toggle",
					get = function() return db.sound.soundDisabled end,
					set = function(_, value)
						db.sound.soundDisabled = value
					end,
					width = "full",
				},
			},
		}
	end
	
	return sound_options
end

local display_options

local function GetDisplayOptions()
	if not display_options then
		local db = private.db

		display_options = {
			type = "group",
			order = 3,
			name = AL["DISPLAY"],
			handler = RareScanner,
			desc = AL["DISPLAY_OPTIONS"],
			args = {
				autoHideButton = {
					order = 0,
					type = "range",
					name = AL["AUTO_HIDE_BUTTON"],
					desc = AL["AUTO_HIDE_BUTTON_DESC"],
					min	= 0,
					max	= 30,
					step	= 5,
					bigStep = 5,
					get = function() return db.display.autoHideButton end,
					set = function(_, value)
						db.display.autoHideButton = value
					end,
					width = "full",
				},
				displayButton = {
					order = 1,
					type = "toggle",
					name = AL["DISPLAY_BUTTON"],
					desc = AL["DISPLAY_BUTTON_DESC"],
					get = function() return db.display.displayButton end,
					set = function(_, value)
						db.display.displayButton = value
					end,
					width = "full",
				},
				displayChatMessage = {
					order = 2,
					type = "toggle",
					name = AL["SHOW_CHAT_ALERT"],
					desc = AL["SHOW_CHAT_ALERT_DESC"],
					get = function() return db.display.displayChatMessage end,
					set = function(_, value)
						db.display.displayChatMessage = value
					end,
					width = "full",
				},
				separator = {
					order = 3,
					type = "header",
					name = AL["LOOT_PANEL_OPTIONS"],
				},
				displayLoot = {
					order = 4,
					type = "toggle",
					name = AL["DISPLAY_LOOT_PANEL"],
					desc = AL["DISPLAY_LOOT_PANEL_DESC"],
					get = function() return db.display.displayLoot end,
					set = function(_, value)
						db.display.displayLoot = value
					end,
					width = "full",
				},
				lootMinQuality = {
					order = 5,
					type = "select",
					name = AL["LOOT_MIN_QUALITY"],
					desc = AL["LOOT_MIN_QUALITY_DESC"],
					values = private.ITEM_QUALITY,
					get = function() return db.display.lootMinQuality end,
					set = function(_, value)
						db.display.lootMinQuality = value
					end,
					width = "double",
				},
				lootTooltipPosition = {
					order = 5,
					type = "select",
					name = AL["LOOT_TOOLTIP_POSITION"],
					desc = AL["LOOT_TOOLTIP_POSITION_DESC"],
					values = private.TOOLTIP_POSITIONS,
					get = function() return db.display.lootTooltipPosition end,
					set = function(_, value)
						db.display.lootTooltipPosition = value
					end,
					width = "double",
				}
			},
		}
	end
	
	return display_options
end

local function GetFilterOptions()
	if not filter_options then
		local db = private.db

		filter_options = {
			type = "group",
			order = 1,
			name = AL["FILTER"],
			handler = RareScanner,
			desc = AL["FILTER"],
			args = {
				rareFiltersSearch = {
					order = 1,
					type = "input",
					name = AL["FILTERS_SEARCH"],
					desc = AL["FILTERS_SEARCH_DESC"],
					set = function(_, value)
						if value then
							filter_options.args.rareFilters.values = {}
							for k, v in pairs(AL["RARE_LIST"]) do 
								if string.match(k, value) then
									filter_options.args.rareFilters.values[k] = v
								end
							end
						end
					end,
					width = "full",
				},
				rareFiltersClear = {
					order = 2,
					name = AL["CLEAR_FILTERS_SEARCH"],
					desc = AL["CLEAR_FILTERS_SEARCH_DESC"],
					type = "execute",
					func = function() 
						filter_options.args.rareFilters.values = AL["RARE_LIST"]
					end,
					width = "normal",
				},
				separator = {
					order = 3,
					type = "header",
					name = AL["FILTERS"],
				},
				rareFilters = {
					order = 4,
					type = "multiselect",
					name = AL["FILTER_RARE_LIST"],
					desc = AL["FILTER_RARE_LIST_DESC"],
					values = AL["RARE_LIST"],
					get = function(_, key) return db.general.filteredRares[key] end,
					set = function(_, key, value)
						db.general.filteredRares[key] = value;
					end,
				}
			},
		}
	end
	
	return filter_options
end

function RareScanner:SetupOptions()

	local RSAC = LibStub("AceConfig-3.0")
	RSAC:RegisterOptionsTable("RareScanner General", GetGeneralOptions)
	RSAC:RegisterOptionsTable("RareScanner Sound", GetSoundOptions)
	RSAC:RegisterOptionsTable("RareScanner Display", GetDisplayOptions)
	RSAC:RegisterOptionsTable("RareScanner Filter", GetFilterOptions)

	local RSACD = LibStub("AceConfigDialog-3.0-RSmod")
	RSACD:AddToBlizOptions("RareScanner General", _G.GENERAL_LABEL, "RareScanner")
	RSACD:AddToBlizOptions("RareScanner Sound", AL["SOUND"], "RareScanner")
	RSACD:AddToBlizOptions("RareScanner Display", AL["DISPLAY"], "RareScanner")
	RSACD:AddToBlizOptions("RareScanner Filter", AL["FILTER"], "RareScanner")
end