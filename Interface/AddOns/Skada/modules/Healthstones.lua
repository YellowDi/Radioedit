local L = LibStub("AceLocale-3.0"):GetLocale("Skada", false)

local Skada = Skada

local mod = Skada:NewModule(L["Healthstones"])

local function log_healthstone(set, healthstone)
	local player = Skada:get_player(set, healthstone.playerid, healthstone.playername)
	if player then
		player.healthstone = player.healthstone + 1
		set.healthstone = set.healthstone + 1
	end
end

local healthstone = {}

local function SpellHealthstone(timestamp, eventtype, srcGUID, srcName, srcFlags, dstGUID, dstName, dstFlags, ...)

	local spellId, spellName, spellSchool, sextraSpellId, sextraSpellName, sextraSchool, auraType = ...

	healthstone.playerid = srcGUID
	healthstone.playername = srcName
	healthstone.spellid = spellId
	healthstone.spellname = spellName
	healthstone.extraspellid = sextraSpellId
	healthstone.extraspellname = sextraSpellName
	
	if healthstone.spellid == 6262 or healthstone.spellid == 156438 then
		log_healthstone(Skada.current, healthstone)
		log_healthstone(Skada.total, healthstone)
	end
end

function mod:Update(win, set)
	local max = 0
	local nr = 1

	for i, player in ipairs(set.players) do
		if player.healthstone > 0 then

			local d = win.dataset[nr] or {}
			win.dataset[nr] = d
			d.value = player.healthstone
			d.label = player.name
			d.class = player.class
			d.id = player.id
			d.valuetext = tostring(player.healthstone)
			if player.healthstone > max then
				max = player.healthstone
			end
			nr = nr + 1
		end
	end

	win.metadata.maxvalue = max
end

function mod:OnEnable()
	mod.metadata = {showspots = true, ordersort = true}

	Skada:RegisterForCL(SpellHealthstone, 'SPELL_CAST_SUCCESS', {src_is_interesting_nopets = true})

	Skada:AddMode(self)
end

function mod:OnDisable()
	Skada:RemoveMode(self)
end

function mod:AddToTooltip(set, tooltip)
 	GameTooltip:AddDoubleLine(L["Healthstones"], set.healthstone, 1,1,1)
end

-- Called by Skada when a new player is added to a set.
function mod:AddPlayerAttributes(player)
	if not player.healthstone then
		player.healthstone = 0
	end
end

-- Called by Skada when a new set is created.
function mod:AddSetAttributes(set)
	if not set.healthstone then
		set.healthstone = 0
	end
end

function mod:GetSetSummary(set)
	return set.healthstone
end

