-- Title: Skada SerpentOrbs
-- Author: Gethe88
-- Version: v1.0.9

local L = {}
local locale = GetLocale()

L["Absorbed:"] = "Absorbed:"
L["Average hit:"] = "Average hit:"
L["Critical:"] = "Critical:"
L["Expired:"] = "Expired:"
L["GotS (Burst)"] = "GotS (Burst)"
L["GotS Efficiency"] = "GotS Efficiency"
L["GotS Healing"] = "GotS Healing"
L["GotS (Pickup)"] = "GotS (Pickup)"
L["Healing Details"] = "Healing Details"
L["Maximum hit:"] = "Maximum hit:"
L["Minimum hit:"] = "Minimum hit:"
L["Orb Efficiency for"] = "Orb Efficiency for"
L["Orb Healing for"] = "Orb Healing for"
L["Overhealing:"] = "Overhealing:"
L["Picked Up:"] = "Picked Up:"
L["Total Orbs:"] = "Total Orbs:"
L["Used:"] = "Used:"
L["Wasted:"] = "Wasted:"

if locale == "zhCN" then
	L["Absorbed:"] = "吸收:"
	L["Average hit:"] = "平均:"
	L["Critical:"] = "致命一击:"
	L["Expired:"] = "破裂:"
	L["GotS (Burst)"] = "青龙之赐(破裂)"
	L["GotS Efficiency"] = "青龙之赐效益"
	L["GotS Healing"] = "青龙之赐治疗"
	L["GotS (Pickup)"] = "青龙之赐(碰触)"
	L["Healing Details"] = "治疗细节"
	L["Maximum hit:"] = "最大:"
	L["Minimum hit:"] = "最小:"
	L["Orb Efficiency for"] = "珠效益于"
	L["Orb Healing for"] = "珠治疗量于"
	L["Overhealing:"] = "过量治疗:"
	L["Picked Up:"] = "碰触:"
	L["Total Orbs:"] = "珠总数:"
	L["Used:"] = "被使用:"
	L["Wasted:"] = "浪费:"
elseif locale == "zhTW" then
	L["Absorbed:"] = "吸收:"
	L["Average hit:"] = "平均:"
	L["Critical:"] = "致命一擊:"
	L["Expired:"] = "破裂:"
	L["GotS (Burst)"] = "玉蛟之賜(破裂)"
	L["GotS Efficiency"] = "玉蛟之賜效益"
	L["GotS Healing"] = "玉蛟之賜治療"
	L["GotS (Pickup)"] = "玉蛟之賜(碰觸)"
	L["Healing Details"] = "治療細節"
	L["Maximum hit:"] = "最大:"
	L["Minimum hit:"] = "最小:"
	L["Orb Efficiency for"] = "玉效益於"
	L["Orb Healing for"] = "玉治療量於"
	L["Overhealing:"] = "過量治療:"
	L["Picked Up:"] = "碰觸:"
	L["Total Orbs:"] = "玉總數:"
	L["Used:"] = "被使用:"
	L["Wasted:"] = "浪費:"
end

local Skada = Skada

local modGotSHeal = Skada:NewModule(L["GotS Healing"])
local GotSHealDetail = Skada:NewModule(L["Healing Details"])
local modGotSWaste = Skada:NewModule(L["GotS Efficiency"])

local function log_heal(set, heal)
    -- Get the player from set.
    local player = Skada:get_player(set, heal.playerid, heal.playername)
    if player then
        if not set.orbbursthits[heal.srcName] then
            set.orbbursthits[heal.srcName] = 0
        end
        if not set.orbpickuphits[heal.srcName] then
            set.orbpickuphits[heal.srcName] = 0
        end

        if heal.spellid == 124041 then -- Orb Pickup
            heal.spellname = L["GotS (Pickup)"]
            set.orbpickuphits[heal.srcName] = set.orbpickuphits[heal.srcName] + 1
            set.orbpickuphits.total = set.orbpickuphits.total + 1
        elseif heal.spellid == 135920 then -- Orb Burst
            heal.spellname = L["GotS (Burst)"]
            set.orbbursthits[heal.srcName] = set.orbbursthits[heal.srcName] + 1
            set.orbbursthits.total = set.orbbursthits.total + 1
        end
        -- Subtract overhealing
        local amount = math.max(0, heal.orbamount - heal.orboverhealing)
        -- Add absorbed
        amount = amount + heal.orbabsorbed

        -- Add to player total.
        player.orbhealing = player.orbhealing + amount
        player.orboverhealing = player.orboverhealing + heal.orboverhealing
        player.orbhealingabsorbed = player.orbhealingabsorbed + heal.orbabsorbed

        -- Also add to set total damage.
        set.orbhealing = set.orbhealing + amount
        set.orboverhealing = set.orboverhealing + heal.orboverhealing
        set.orbhealingabsorbed = set.orbhealingabsorbed + heal.orbabsorbed

        -- Add to recipient healing.
        do
            if heal.dstName then
                local orbhealed = player.orbhealed[heal.dstName]

                -- Create recipient if it does not exist.
                if not orbhealed then
                    local _, className = UnitClass(heal.dstName)
                    orbhealed = {class = className, amount = 0}
                    player.orbhealed[heal.dstName] = orbhealed
                end

                orbhealed.amount = orbhealed.amount + amount
            end
        end

        -- Add to spell healing
        do

            local spell = player.orbhealingspells[heal.spellname]

            -- Create spell if it does not exist.
            if not spell then
                spell = {id = heal.spellid, name = heal.spellname, orbhits = 0, orbhealing = 0, orboverhealing = 0, orbabsorbed = 0, orbcritical = 0, orbmin = nil, orbmax = 0}
                player.orbhealingspells[heal.spellname] = spell
            end

            spell.orbhealing = spell.orbhealing + amount
            if heal.orbcritical then
                spell.orbcritical = spell.orbcritical + 1
            end
            spell.orboverhealing = spell.orboverhealing + heal.orboverhealing
            spell.orbabsorbed = spell.orbabsorbed + heal.orbabsorbed

            spell.orbhits = (spell.orbhits or 0) + 1

            if not spell.orbmin or amount < spell.orbmin then
                spell.orbmin = amount
            end
            if not spell.orbmax or amount > spell.orbmax then
                spell.orbmax = amount
            end
        end
    end
end

local function log_cast(set, cast)
    -- Get the player from set.
    local player = Skada:get_player(set, cast.playerid, cast.playername)
    if player then
        -- Add to player orb casts.
        if cast.spellid == 119031 then -- Orb Summon
            player.orbsummon = player.orbsummon + 1
            set.orbsummon = set.orbsummon + 1
        end
        if cast.spellid == 135920 then -- Orb Burst
            player.orbburstcast = player.orbburstcast + 1
            set.orbburstcast = set.orbburstcast + 1
        end
    end
end

local heal = {}
local cast = {}

local function SpellHeal(timestamp, eventtype, srcGUID, srcName, srcFlags, dstGUID, dstName, dstFlags, ...)
    -- Healing
    local spellId, spellName, spellSchool, samount, soverhealing, absorbed, scritical = ...

    if (spellId == 124041) or (spellId == 135920) then  -- Orb Pickup or Burst
        heal.playername = dstName
        heal.playerid = dstGUID
        heal.srcName = string.split("-", srcName)
        heal.spellid = spellId
        heal.spellname = spellName
        heal.orbamount = samount
        heal.orboverhealing = soverhealing
        heal.orbcritical = scritical
        heal.orbabsorbed = absorbed

        Skada:FixPets(heal)
        log_heal(Skada.current, heal)
        log_heal(Skada.total, heal)
    end
end

local function SpellCast(timestamp, eventtype, srcGUID, srcName, srcFlags, dstGUID, dstName, dstFlags, ...)
    -- Healing
    local spellId, spellName, spellSchool = ...

    if (spellId == 119031) or (spellId == 135920) then  -- Orb Summon/Pickup/Burst
        cast.dstName = dstName
        cast.playerid = srcGUID
        cast.playername = srcName
        cast.spellid = spellId
        cast.spellname = spellName

        Skada:FixPets(cast)
        log_cast(Skada.current, cast)
        log_cast(Skada.total, cast)
    end
end



local function spell_tooltip(win, id, label, tooltip)
    local player = Skada:find_player(win:get_selected_set(), GotSHealDetail.playerid)
    if player then
        local spell = player.orbhealingspells[label]
        if spell then
            tooltip:AddLine(player.name.." - "..label)
            if spell.orbmax and spell.orbmin then
                tooltip:AddDoubleLine(L["Minimum hit:"], Skada:FormatNumber(spell.orbmin), 255,255,255,255,255,255)
                tooltip:AddDoubleLine(L["Maximum hit:"], Skada:FormatNumber(spell.orbmax), 255,255,255,255,255,255)
            end
            tooltip:AddDoubleLine(L["Average hit:"], Skada:FormatNumber(spell.orbhealing / spell.orbhits), 255,255,255,255,255,255)
            if spell.orbhits then
                tooltip:AddDoubleLine(L["Critical:"], ("%02.1f%%"):format(spell.orbcritical / spell.orbhits * 100), 255,255,255,255,255,255)
            end
            if spell.orbhits then
                tooltip:AddDoubleLine(L["Overhealing:"], ("%02.1f%%"):format(spell.orboverhealing / (spell.orboverhealing + spell.orbhealing) * 100), 255,255,255,255,255,255)
            end
            if spell.orbhits and spell.orbabsorbed then
                tooltip:AddDoubleLine(L["Absorbed:"], ("%02.1f%%"):format(spell.orbabsorbed / (spell.orboverhealing + spell.orbhealing) * 100), 255,255,255,255,255,255)
            end
        end
    end
end
-- Number of full orbs vs explosions
function GotSHealDetail:Enter(win, id, label)
    GotSHealDetail.playerid = id
    GotSHealDetail.title = L["Orb Healing for"].." "..label
end

function GotSHealDetail:Update(win, set)
    -- View spells for this player.

    local player = Skada:find_player(set, self.playerid)
    local nr = 1
    local max = 0

    if player then
        for spellname, spell in pairs(player.orbhealingspells) do
            local d = win.dataset[nr] or {}
            win.dataset[nr] = d

            d.id = spell.id
            d.label = spell.name
            d.value = spell.orbhealing
            d.valuetext = ("%s / %d"):format(Skada:FormatNumber(spell.orbhealing), spell.orbhits)
            local _, _, icon = GetSpellInfo(spell.id)
            d.icon = icon
            d.spellid = spell.id

            if spell.orbhealing > max then
                max = spell.orbhealing
            end

            nr = nr + 1
        end
    end

    win.metadata.hasicon = true
    win.metadata.maxvalue = max
end



function modGotSHeal:Update(win, set)
    local nr = 1
    local max = 0

    for i, player in ipairs(set.players) do
        if player.orbhealing > 0 then

            local d = win.dataset[nr] or {}
            win.dataset[nr] = d

            d.id = player.id
            d.label = player.name
            d.value = player.orbhealing

            local burstHits = 0
            if player.orbhealingspells[L["GotS (Burst)"]] then
                burstHits = player.orbhealingspells[L["GotS (Burst)"]].orbhits
            end
            local pickHits = 0
            if player.orbhealingspells[L["GotS (Pickup)"]] then
                pickHits = player.orbhealingspells[L["GotS (Pickup)"]].orbhits
            end

            d.valuetext = ("%s / %d"):format(Skada:FormatNumber(player.orbhealing), burstHits + pickHits)
            d.class = player.class

            if player.orbhealing > max then
                max = player.orbhealing
            end

            nr = nr + 1
        end
    end

    win.metadata.maxvalue = max
end

function modGotSHeal:OnEnable()
    modGotSHeal.metadata = {showspots = true, click1 = GotSHealDetail}
    GotSHealDetail.metadata = {tooltip = spell_tooltip}

    Skada:RegisterForCL(SpellHeal, 'SPELL_HEAL', {dst_is_interesting = true})

    Skada:AddMode(self)
end

function modGotSHeal:OnDisable()
    Skada:RemoveMode(self)
end

function modGotSHeal:AddToTooltip(set, tooltip)
    GameTooltip:AddDoubleLine(L["GotS Healing"], Skada:FormatNumber(set.orbhealing), 1,1,1)
end

function modGotSHeal:GetSetSummary(set)
    return ("%s"):format(Skada:FormatNumber(set.orbhealing))
end

-- Called by Skada when a new player is added to a set.
function modGotSHeal:AddPlayerAttributes(player)
    player.orbhealed = player.orbhealed or {}                       -- Stored healing per recipient
    player.orbhealing = player.orbhealing or 0                  -- Total healing
    player.orbhealingspells = player.orbhealingspells or {}     -- Healing spells
    player.orboverhealing = player.orboverhealing or 0          -- Overheal total
    player.orbhealingabsorbed = player.orbhealingabsorbed or 0  -- Absorbed total

    -- update any pre-existing orbhealingspells for new properties
    local _, orbheal, orbhealed
    for _, orbheal in pairs(player.orbhealingspells) do
        heal.orbabsorbed = heal.orbabsorbed or 0        -- Amount of healing that was absorbed
    end
end

-- Called by Skada when a new set is created.
function modGotSHeal:AddSetAttributes(set)
    set.orbhealing = set.orbhealing or 0
    set.orboverhealing = set.orboverhealing or 0
    set.orbhealingabsorbed = set.orbhealingabsorbed or 0
end



local function waste_tooltip(win, id, name, tooltip)
    local set = win:get_selected_set()
    local player = Skada:find_player(set, id)

    tooltip:AddLine(L["Orb Efficiency for"].." "..name)
    if player and (player.orbburstcast > 0) then
        local totalOrbs = player.orbsummon
        local usedOrbs = (set.orbbursthits[player.name] or 0) + (set.orbpickuphits[player.name] or 0)
        local wastedOrbs = player.orbburstcast - (set.orbbursthits[player.name] or 0)

        tooltip:AddDoubleLine(L["Total Orbs:"], totalOrbs, 255,255,255,255,255,255)
        tooltip:AddDoubleLine(L["Picked Up:"], set.orbpickuphits[player.name], 255,255,255,255,255,255)
        tooltip:AddDoubleLine(L["Expired:"], player.orbburstcast, 255,255,255,255,255,255)
        tooltip:AddDoubleLine(L["Used:"], ("%d (%.1f%%)"):format(usedOrbs, usedOrbs / totalOrbs * 100), 255,255,255,255,255,255)
        tooltip:AddDoubleLine(L["Wasted:"], ("%d (%.1f%%)"):format(wastedOrbs, wastedOrbs / totalOrbs * 100), 255,255,255,255,255,255)
    end
end

-- Spell view of a player.
function modGotSWaste:OnEnable()
    modGotSWaste.metadata = {tooltip = waste_tooltip}

    Skada:RegisterForCL(SpellCast, 'SPELL_CAST_SUCCESS', {src_is_interesting = true})

    Skada:AddMode(self)
end

function modGotSWaste:OnDisable()
    Skada:RemoveMode(self)
end

function modGotSWaste:Update(win, set)
    local max = 0
    local nr = 1

    for i, player in ipairs(set.players) do
        local totalOrbs = 0
        local d = win.dataset[nr] or {}
        win.dataset[nr] = d
        d.label = player.name
        d.class = player.class
        d.id = player.id
        if (player.orbhealing > 0) then
            totalOrbs = player.orbsummon
            local usedOrbs = (set.orbbursthits[player.name] or 0) + (set.orbpickuphits[player.name] or 0)

            d.value = usedOrbs
            d.valuetext = ("%d / %d (%.1f%%)"):format(totalOrbs, usedOrbs, usedOrbs / totalOrbs * 100)
        elseif (player.orbsummon >= 0) then
            totalOrbs = player.orbsummon

            d.value = totalOrbs
            d.valuetext = ("%d"):format(totalOrbs)
        end
        if totalOrbs > max then
            max = totalOrbs
        end
        nr = nr + 1
    end

    win.metadata.maxvalue = max
end

function modGotSWaste:GetSetSummary(set)
    local totalOrbs = set.orbsummon
    local usedOrbs = set.orbbursthits.total + set.orbpickuphits.total

    return ("%.1f%%"):format((totalOrbs <= 0) and 0 or (usedOrbs / totalOrbs * 100))
end

function modGotSWaste:AddToTooltip(set, tooltip)
    local totalOrbs = set.orbburstcast + set.orbpickuphits.total
    local usedOrbs = set.orbbursthits.total + set.orbpickuphits.total

    GameTooltip:AddDoubleLine(L["GotS Efficiency"], ("%.1f%%"):format(usedOrbs / totalOrbs * 100), 1,1,1)
end

function modGotSWaste:AddPlayerAttributes(player)
    player.orbsummon = player.orbsummon or 0
    player.orbburstcast = player.orbburstcast or 0
end

-- Called by Skada when a new set is created.
function modGotSWaste:AddSetAttributes(set)
    set.orbsummon = set.orbsummon or 0
    set.orbburstcast = set.orbburstcast or 0
    set.orbpickuphits = set.orbpickuphits or {total = 0}
    set.orbbursthits = set.orbbursthits or {total = 0}           -- Orb Bursts
end
