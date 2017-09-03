-- Daily Global Check
-- by Jadya
-- EU-Well of Eternity

local addonName, addonTable = ...

addonTable.C = {}
addonTable.T = {}
local L = addonTable.L
local C = addonTable.C
local T = addonTable.T

C.version = 1004 -- current list structure version
C.str_version = "|cffAAAAAAv|cff00ff001.5|r"
C.NyxGUIVersion = "1.0"

-- delimiters
C.overlay_delimiter1 = "@"
C.overlay_delimiter2 = "^"
C.overlay_delimiter3 = "~"

C.maxlists            = 30
C.max_quests_per_page = 50 -- max quests in a list page
-- buttons            
C.pluginbtnsize       = 25 -- plugin button size
C.quest_button_h      = 12 -- quest button height

-- worldmap and minimap icons
C.mapicons_size_min = 8
C.mapicons_size_max = 25

C.questtype_strings = {"Q", "D", "W", [11] = "I", [12] = "M", [13] = "R",
                       [14] = "Qa", [15] = "Da", [16] = "Wa", -- account wide quest types
					   [17] = "S"
					  }

-- mode indexes
C.MODE_CLASSIC         = 1
C.MODE_OVERVIEW        = 2
C.MODE_OPTIONS_QUEST   = 3
C.MODE_OPTIONS_PLUGIN  = 4
C.MODE_OPTIONS_MAP     = 5
C.MODE_LIST_VISIBILITY = 6
C.MODE_EDIT            = 7
C.MODE_EDIT_QUEST      = 8

-- modes table
C.modes = { -- interface
            {name = L["classic"]        , t = UIOPTIONS_MENU, panel = 1}, -- classic
            {name = OVERVIEW                                , panel = 1}, -- overview
            -- options
			{name = L["quest_options"]  , t = OPTIONS       , panel = 2, x = 320, y = 450                }, -- quest options
			{name = L["plugin_options"]                     , panel = 3, x = 320, y = 450                }, -- plugin options
			{name = L["map_options"]                        , panel = 4, x = 320, y = 450                }, -- map options
                                                                                                         
			{name = L["list_visibility"], t = L["tools"]    , panel = 5, x = 320, y = 450                }, -- list visibility
			{name = L["edit_mode"]                          , panel = 6, x = 600, y = 550                }, -- edit mode
			{name = L["edit_quest"]                         , panel = 7, x = 700, y = 550, hidden = true }, -- edit quest
		  }

-- default options
C.defaults = {
              show_questtype     = false,
              show_coordinates   = true,
              show_zone          = false,
              show_prefix        = false,
              show_suffix        = false,
              show_worldmapicons = true,
              show_minimapicons  = true,
              show_questlogbtn   = true,
              hide_completed     = false,

              UI = {
                    show_adjacent_icons= false,
			        worldmap_icon_interact = true,
					minimap_icon_interact = true,
			        worldmap_icon_size = 17,
                    minimap_icon_size  = 14,
			       },

		      Colors = {
			            "|cffAAAAAA", -- 1 zone
						"|cffffffcc", -- 2 name
						"|cffffffff", -- 3 prefix
						"|cffffffff", -- 4 suffix
						"|cffdddddd", -- 5 coordinates
						"|cffffcc00", -- 6 group header
						
						"|cff20FF20", -- 7 completed
						"|cffFF2020", -- 8 incomplete
						"|cff11DDFF", -- 9 repeatable
					   }
             }

-- DGC default theme (NyxGUI)
C.default_theme = {
				   l0_color      = "121212E6",
				   l0_border     = "191919E6",
				   l0_texture    = "Interface\\Buttons\\GreyscaleRamp64",
				   l1_color      = "0000007F",
				   l1_border     = "191919E6",
				   l1_texture    = "Interface\\Buttons\\WHITE8X8",
				   l2_color      = "020702FF",
				   l2_border     = "001900FF",
				   l2_texture    = "Interface\\Buttons\\WHITE8X8",
				   l3_color      = "05660D26",
				   l3_border     = "00140033",
				   l3_texture    = "Interface\\Buttons\\WHITE8X8",
				   --l3_texture    = "spells\\ICETEXTURE_MAGE",
				   thumb         = "19B219FF",
				   highlight     = "00FF0033",
	              -- fonts
				   f_label_name   = "Fonts\\FRIZQT__.ttf",
				   f_label_h      = 11,
				   f_label_flags  = "",
				   f_label_color  = "FFFFFFFF",
				   f_button_name  = "Fonts\\FRIZQT__.ttf",
				   f_button_h     = 12,
				   f_button_flags = "",
				   f_button_color = "FFFFFFFF",
				  }

-- textures
T.dgcicon         = "Interface\\icons\\INV_Sigil_Freya"
T.newlist         = "Interface\\PaperDollInfoFrame\\Character-Plus.png"
T.btn_rename_list = "Interface\\Icons\\INV_Inscription_Scroll"


