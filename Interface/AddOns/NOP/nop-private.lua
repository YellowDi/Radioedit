--[[ Constants and private data ]]
local _
-- [[
local assert = _G.assert
local LibStub = _G.LibStub; assert(LibStub ~= nil,'LibStub')
local format = _G.format; assert(format ~= nil,'format')
local GetAddOnMetadata = _G.GetAddOnMetadata; assert(GetAddOnMetadata ~= nil,'GetAddOnMetadata')
-- ]]
local ADDON, P = ...
local LB = LibStub("LibBabble-SubZone-3.0") -- Localized sub-zone names, need it for zone specific items.
local LB_has = LB:GetUnstrictLookupTable()
P.SALVAGE_YARD = LB_has["Salvage Yard"]
P.MINE_HORDE = LB_has["Frostwall Mine"]
P.MINE_ALLIANCE = LB_has["Lunarfall Excavation"]
P.SHIPYARD_HORDE = LB_has["Frostwall Shipyard"]
P.SHIPYARD_ALLIANCE = LB_has["Lunarfall Shipyard"]
P.TIMELESS_ISLE = 951
P.FROSTWALL = 976
P.LUNARFALL = 971
P.FROSTFIRE_RIDGE = 941
P.SHADOWMOON_VALLEY = 947
P.L = LibStub("AceLocale-3.0"):GetLocale(ADDON, false) -- get localized strings, don't print error if no locale is defined then default will be used
P.NOP_TITLE = P.L["NOP_TITLE"]
P.NOP_VERSION = format(P.L["NOP_VERSION"],GetAddOnMetadata(ADDON, "Version") or "")
P.UNITID_PLAYER = "player"
P.UNITID_PET = "pet"
P.AURA_HELPFUL = "HELPFUL"
P.CONSOLE_CMD = "/nop"
P.CONSOLE_USAGE = P.L["CONSOLE_USAGE"]
P.MACRO_INACTIVE = "/stopcasting"
P.MACRO_ACTIVE = "/use item:%d" -- "%s/use %d %d"
P.MACRO_PICKLOCK = "/use %s\n/use %d %d" -- Picklock targeted at bags position only works, because there could be locked and unlocked items in bags
P.DEFAULT_ICON = "Interface\\Icons\\inv_crate_01" -- Supply Crate
P.DEFAULT_ITEMID = 4629 -- Supply Crate
P.QUEST_ICON = "Interface\\MINIMAP\\ObjectIcons"
P.ICON_TEXT = "NumberFontNormal"
P.DEFAULT_ICON_SIZE = 35
P.CLICK_DRAG_MSG = P.L["CLICK_DRAG_MSG"]
P.CLICK_SKIP_MSG = P.L["CLICK_SKIP_MSG"]
P.CLICK_OPEN_MSG = P.L["CLICK_OPEN_MSG"]
P.CLICK_BLACKLIST_MSG = P.L["CLICK_BLACKLIST_MSG"]
P.BUTTON_FRAME = ADDON.."_BUTTON"
P.QB_NAME = ADDON.."_QB_"
P.TOOLTIP_ITEM = ADDON.."_TOOLTIP_ITEM"
P.TOOLTIP_SPELL = ADDON.."_TOOLTIP_SPELL"
P.TOOLTIP_SCAN = ADDON.."_TOOLTIP_SCAN"
P.SPELL_PICKLOCK = 1804
P.AURA_MINERS_COFFEE = 176049 -- applied by Miner's cofee item could have 5 stacks past 6.1 wow version
P.RO_SHIPYARD = 128373 -- Rush Orders: Shipyards in Garrison always get lower priority
P.CB_CVAR = "colorblindMode"
P.ITEM_TYPE_BATTLE_PET = "battlepet"
P.ITEM_TYPE_ITEM = "item"
P.RGB_YELLOW = "|cFFFFFF00"
P.RGB_RED = "|cFFFF0000"
P.RGB_MAGENTA = "|cFF00FFFF"
P.RGB_NORMAL = "|r"
P.TIMER_IDLE = 2.0 -- recheck delay for calling protected function in combat
P.TIMER_RECHECK = 10.0 -- delay for slow non-event driven item lookup in bags
P.PRINT_HEAD = "|cff7f7f7f%s|r [|cff00ffff%s|r]"
P.BLACKLIST = {[90043] = true,} -- special blacklist
P.MOUSE_LB = "\124TInterface\\TutorialFrame\\UI-Tutorial-Frame:12:12:0:0:512:512:10:65:228:283\124t" -- left mouse button
P.MOUSE_RB = "\124TInterface\\TutorialFrame\\UI-Tutorial-Frame:12:12:0:0:512:512:10:65:330:385\124t" -- right mouse button
P.WORK_ANNOUNCE = 0.4 -- 40% and more done is reported
P.TOGO_ANNOUNCE = P.L["TOGO_ANNOUNCE"]
P.REWARD_ANNOUNCE = P.L["REWARD_ANNOUNCE"]
P.SHIPYARD_ANNOUNCE = P.L["SHIPYARD_ANNOUNCE"]
P.ARTIFACT_ANNOUNCE = P.L["ARTIFACT_ANNOUNCE"]
P.ARCHAELOGY_ANNOUNCE = P.L["ARCHAELOGY_ANNOUNCE"]
P.TALENT_ANNOUNCE = P.L["TALENT_ANNOUNCE"]