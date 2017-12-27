
-- local T, C, L, G = unpack(select(2, ...))

local addon, ns = ...
ns[1] = {} -- T, functions, constants, variables
ns[2] = {} -- C, config
ns[3] = {} -- L, localization
ns[4] = {} -- G, globals (Optionnal)

--[[--------------
--     init     --
--------------]]--
RegisterAddonMessagePrefix("arm_vc") 
RegisterAddonMessagePrefix("arm_hl_raid") 
RegisterAddonMessagePrefix("arm_share") 

local T, C, L, G = unpack(select(2, ...))

G.addon_name = "AntorusRaidMods"
G.addon_cname = "|cffEE3A8CAntorus Raid Mods|r"
G.addon_c = "|cffEE3A8C"

G.dragFrameList = {}

G.Font = GameFontHighlight:GetFont()

G.media = {
	blank = "Interface\\Buttons\\WHITE8x8",
	bar = "Interface\\AddOns\\AntorusRaidMods\\media\\statusbar",
	sounds = "Interface\\AddOns\\AntorusRaidMods\\media\\sounds\\"
}

G.Client = GetLocale()
G.Version = GetAddOnMetadata("AntorusRaidMods", "Version")

G.PlayerRealm = GetRealmName()
G.PlayerName = UnitName("player");

G.myClass = select(2, UnitClass("player"))

G.Ccolor = {}
if(IsAddOnLoaded'!ClassColors' and CUSTOM_CLASS_COLORS) then
	G.Ccolor = CUSTOM_CLASS_COLORS[G.myClass]
else
	G.Ccolor = RAID_CLASS_COLORS[G.myClass]
end

G.Ccolors = {}
if(IsAddOnLoaded'!ClassColors' and CUSTOM_CLASS_COLORS) then
	G.Ccolors = CUSTOM_CLASS_COLORS
else
	G.Ccolors = RAID_CLASS_COLORS
end

G.Ecolors = {}
for eclass, color in pairs (FACTION_BAR_COLORS) do
	G.Ecolors[eclass] = {}
	G.Ecolors[eclass].r = color.r
	G.Ecolors[eclass].g = color.g
	G.Ecolors[eclass].b = color.b
	G.Ecolors[eclass].colorStr = ('|cff%02x%02x%02x'):format(color.r * 255, color.g * 255, color.b * 255)
end

G.classcolor = ('|cff%02x%02x%02x'):format(G.Ccolor.r * 255, G.Ccolor.g * 255, G.Ccolor.b * 255)

StaticPopupDialogs[G.addon_name.."Reset Confirm"] = {
	text = "",
	button1 = ACCEPT,
	button2 = CANCEL,
	hideOnEscape = 1, 
	whileDead = true,
	preferredIndex = 3,
}

StaticPopupDialogs[G.addon_name.."Import Confirm"] = {
	text = L["导入确认"],
	button1 = ACCEPT,
	button2 = CANCEL,
	hideOnEscape = 1, 
	whileDead = true,
	preferredIndex = 3,
}

--[[------------------------
--     Group Inspect     --
------------------------]]--

AntorusRaidMods = LibStub("AceAddon-3.0"):NewAddon("AntorusRaidMods")

if not AntorusRaidMods then return end

AntorusRaidMods.RaidRoster = {}

if not AntorusRaidMods.events then
	AntorusRaidMods.events = LibStub("CallbackHandler-1.0"):New(AntorusRaidMods)
end

local DefensiveSpells = {
	["PALADIN"] = {
		["642_1"] = {spellID = 642, cd = 240, spec =70, talent = "all"}, -- 圣盾术 惩戒
		["642_2"] = {spellID = 642, cd = 210, spec =65, talent = "all"}, -- 圣盾术 神圣
		--["498"] = {spellID = 498, cd = 42, spec =65, talent = "all"}, -- 圣佑术 神圣 测试
	},
	
	["MAGE"] = {
		["45438"] = {spellID = 45438, cd = 240, spec ="all", talent = "all"}, -- 寒冰屏障
		["235219"] = {spellID = 235219, cd = 300, spec =64, talent = "all"}, -- 急速冷却
	},
	
	["DEMONHUNTER"] = {
		["196555"] = {spellID = 196555, cd = 120, spec = 577, talent = 21863}, -- 虚空行走 浩劫
	},
	
	["HUNTER"] = {
		["186265"] = {spellID = 186265, cd = 180, spec = "all", talent = "all"}, -- 灵龟守护
	},
	
	["ROGUE"] = {
		["31224"] = {spellID = 31224, cd = 90, spec = "all", talent = "all"}, -- 暗影斗篷
	},
}

function AntorusRaidMods:OnUpdate(event, info)
	if not info.name or not info.class or not info.global_spec_id or not info.talents then return end
	if DefensiveSpells[info.class] then
		AntorusRaidMods['RaidRoster'][info.name] = AntorusRaidMods['RaidRoster'][info.name] or {}

		for tag, spell_info in pairs (DefensiveSpells[info.class]) do
			if (spell_info.spec == "all" or spell_info.spec == info.global_spec_id) and (spell_info.talent == "all" or info.talents[spell_info.talent]) then
				AntorusRaidMods['RaidRoster'][info.name][spell_info.spellID] = AntorusRaidMods['RaidRoster'][info.name][spell_info.spellID] or {}
				AntorusRaidMods['RaidRoster'][info.name][spell_info.spellID]["dur"] = spell_info.cd
			end
		end
	end
end

function AntorusRaidMods:OnRemove(guid)
	if (guid) then
	    local name = select(6, GetPlayerInfoByGUID(guid))
		if AntorusRaidMods['RaidRoster'][name] then
			AntorusRaidMods['RaidRoster'][name] = nil
		end
	else
		AntorusRaidMods['RaidRoster'] = {}
	end
end

local LGIST=LibStub:GetLibrary("LibGroupInSpecT-1.1")

function AntorusRaidMods:OnInitialize()
	LGIST.RegisterCallback (AntorusRaidMods, "GroupInSpecT_Update", function(event, ...)
		AntorusRaidMods.OnUpdate(...)
	end)
	LGIST.RegisterCallback (AntorusRaidMods, "GroupInSpecT_Remove", function(...)
		AntorusRaidMods.OnRemove(...)
	end)
end

local Group_Update = CreateFrame("Frame")
Group_Update:RegisterEvent("PLAYER_ENTERING_WORLD")
Group_Update:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")

local function ResetCD()
	for player, spells in pairs(AntorusRaidMods['RaidRoster']) do
		for spellid, info in pairs(AntorusRaidMods['RaidRoster'][player]) do
			AntorusRaidMods['RaidRoster'][player][spellid]["start"] = 0
		end
	end
end

Group_Update:SetScript("OnEvent", function(self, event, ...)
	if event == "PLAYER_ENTERING_WORLD" then
		ResetCD()
		Group_Update:UnregisterEvent("PLAYER_ENTERING_WORLD")
	elseif event == "ENCOUNTER_END" then
		ResetCD()
	elseif event == "COMBAT_LOG_EVENT_UNFILTERED" then
		local _, event_type, _, _, sourceName, _, _, _, _, _, _, spellID = ...   
		if event_type == "SPELL_CAST_SUCCESS" and AntorusRaidMods['RaidRoster'][sourceName] and AntorusRaidMods['RaidRoster'][sourceName][spellID] then
			AntorusRaidMods['RaidRoster'][sourceName][spellID]["start"] = GetTime()
		end
	end
end)