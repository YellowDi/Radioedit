local parent, ns = ...
local oUF = ns.oUF

local hiddenParent = CreateFrame('Frame')
hiddenParent:Hide()

local function handleFrame(baseName)
	local frame
	if(type(baseName) == 'string') then
		frame = _G[baseName]
	else
		frame = baseName
	end

	if(frame) then
		frame:UnregisterAllEvents()
		frame:Hide()

		-- Keep frame hidden without causing taint
		frame:SetParent(hiddenParent)

		local health = frame.healthbar
		if(health) then
			health:UnregisterAllEvents()
		end

		local power = frame.manabar
		if(power) then
			power:UnregisterAllEvents()
		end

		local spell = frame.spellbar
		if(spell) then
			spell:UnregisterAllEvents()
		end

		local altpowerbar = frame.powerBarAlt
		if(altpowerbar) then
			altpowerbar:UnregisterAllEvents()
		end
	end
end

function oUF:DisableBlizzard(unit)
	if(not unit) then return end

	if(unit == 'player') then
		handleFrame(PlayerFrame)

		-- For the damn vehicle support:
		PlayerFrame:RegisterEvent('PLAYER_ENTERING_WORLD')
		PlayerFrame:RegisterEvent('UNIT_ENTERING_VEHICLE')
		PlayerFrame:RegisterEvent('UNIT_ENTERED_VEHICLE')
		PlayerFrame:RegisterEvent('UNIT_EXITING_VEHICLE')
		PlayerFrame:RegisterEvent('UNIT_EXITED_VEHICLE')

		-- User placed frames don't animate
		PlayerFrame:SetUserPlaced(true)
		PlayerFrame:SetDontSavePosition(true)
	elseif(unit == 'pet') then
		handleFrame(PetFrame)
	elseif(unit == 'target') then
		handleFrame(TargetFrame)
		handleFrame(ComboFrame)
	elseif(unit == 'focus') then
		handleFrame(FocusFrame)
		handleFrame(TargetofFocusFrame)
	elseif(unit == 'targettarget') then
		handleFrame(TargetFrameToT)
	elseif(unit:match('(boss)%d?$') == 'boss') then
		local id = unit:match('boss(%d)')
		if(id) then
			handleFrame('Boss' .. id .. 'TargetFrame')
		else
			for i = 1, 5 do
				handleFrame(('Boss%dTargetFrame'):format(i))
			end
		end
	elseif(unit:match('(party)%d?$') == 'party') then
		local id = unit:match('party(%d)')
		if(id) then
			handleFrame('PartyMemberFrame' .. id)
		else
			for i = 1, 4 do
				handleFrame(('PartyMemberFrame%d'):format(i))
			end
		end
	elseif(unit:match('(arena)%d?$') == 'arena') then
		local id = unit:match('arena(%d)')
		if(id) then
			handleFrame('ArenaEnemyFrame' .. id)
		else
			for i = 1, 5 do
				handleFrame(string.format('ArenaEnemyFrame%d', i))
			end
		end

		-- Blizzard_ArenaUI should not be loaded
		Arena_LoadUI = function() end
		SetCVar('showArenaEnemyFrames', '0', 'SHOW_ARENA_ENEMY_FRAMES_TEXT')
	end
end
