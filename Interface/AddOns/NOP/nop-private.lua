--[[ Constants ]]
local _
local ADDON, private = ...
local LB = LibStub("LibBabble-SubZone-3.0") -- Localized sub-zone names, need it for zone specific items.
local LB_has = LB:GetUnstrictLookupTable()
private.SALVAGE_YARD = LB_has["Salvage Yard"]
private.MINE_HORDE = LB_has["Frostwall Mine"]
private.MINE_ALLIANCE = LB_has["Lunarfall Excavation"]
private.SHIPYARD_HORDE = LB_has["Frostwall Shipyard"]
private.SHIPYARD_ALLIANCE = LB_has["Lunarfall Shipyard"]
private.TIMELESS_ISLE = 951
private.FROSTWALL = 976
private.LUNARFALL = 971
private.L = LibStub("AceLocale-3.0"):GetLocale(ADDON, false) -- get localized strings, don't print error if no locale defined then default will be used
private.NOP_TITLE = private.L["NOP_TITLE"]
private.NOP_VERSION = format(private.L["NOP_VERSION"],GetAddOnMetadata(ADDON, "Version") or "")
private.UNITID_PLAYER = "player"
private.UNITID_PET = "pet"
private.AURA_HELPFUL = "HELPFUL"
private.CONSOLE_CMD = "/nop"
private.CONSOLE_USAGE = private.L["CONSOLE_USAGE"]
private.MACRO_INACTIVE = "/stopcasting"
-- private.MACRO_CLOSE = "/run NOP:ButtonClose()\n"
private.MACRO_ACTIVE = "/use item:%d" -- "%s/use %d %d"
private.MACRO_PICKLOCK = "/use %s\n/use item:%d" -- "/use %s\n/use %d %d"
private.DEFAULT_ICON = "Interface\\Icons\\inv_crate_01" -- Supply Crate
private.DEFAULT_ITEMID = 4629 -- Supply Crate
private.QUEST_ICON = "Interface\\MINIMAP\\ObjectIcons"
private.ICON_TEXT = "NumberFontNormal"
private.DEFAULT_ICON_SIZE = 35
private.CLICK_DRAG_MSG = private.L["ALT-LeftClick and drag to move."]
private.CLICK_SKIP_MSG = private.L["RightClick to skip item."]
private.CLICK_OPEN_MSG = private.L["LeftClick to open or use."]
private.CLICK_BLACKLIST_MSG = private.L["CTRL-RightClick to blacklist item."]
private.BUTTON_FRAME = ADDON.."_BUTTON"
private.QB_NAME = ADDON.."_QB_"
private.TOOLTIP_ITEM = ADDON.."_TOOLTIP_ITEM"
private.TOOLTIP_SPELL = ADDON.."_TOOLTIP_SPELL"
private.TOOLTIP_SCAN = ADDON.."_TOOLTIP_SCAN"
private.SPELL_PICKLOCK = 1804
private.AURA_MINERS_COFFEE = 176049 -- applied by Miner's cofee item could have 5 stacks past 6.1 wow version
private.RO_SHIPYARD = 128373 -- Rush Orders: Shipyards in Garrison always get lower priority
private.ITEM_TYPE_BATTLE_PET = "battlepet"
private.ITEM_TYPE_ITEM = "item"
private.RGB_YELLOW = "|cFFFFFF00"
private.RGB_RED = "|cFFFF0000"
private.RGB_MAGENTA = "|cFF00FFFF"
private.TIMER_IDLE = 0.5 -- recheck delay for calling protected function in combat
private.TIMER_RECHECK = 10.0 -- delay for slow non-event driven item lookup in bags
private.LOAD_RETRY = 10 -- update cache cycles for items and spell
private.PRINT_HEAD = "|cff7f7f7f%s|r [|cff00ffff%s|r]"