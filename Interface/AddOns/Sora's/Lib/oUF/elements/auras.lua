--[[
# Element: Auras

Handles creation and updating of aura icons.

## Widget

Auras   - A Frame to hold icons representing both buffs and debuffs.
Buffs   - A Frame to hold icons representing buffs.
Debuffs - A Frame to hold icons representing debuffs.

## Notes

At least one of the above widgets must be present for the element to work.

## Options

.disableCooldown    - Disables the cooldown spiral. Defaults to false.
.size               - Aura icon size. Defaults to 16.
.onlyShowPlayer     - Only show auras created by player/vehicle.
.showStealableBuffs - Display the stealable texture on buffs that can be stolen.
.spacing            - Spacing between each icon. Defaults to 0.
.['spacing-x']      - Horizontal spacing between each icon. Takes priority over `spacing`.
.['spacing-y']      - Vertical spacing between each icon. Takes priority over `spacing`.
.['growth-x']       - Horizontal growth direction. Defaults to 'RIGHT'.
.['growth-y']       - Vertical growth direction. Defaults to 'UP'.
.initialAnchor      - Anchor point for the icons. Defaults to 'BOTTOMLEFT'.
.filter             - Custom filter list for auras to display. Defaults to 'HELPFUL' on buffs and 'HARMFUL' on debuffs.

## Options Auras

.numBuffs     - The maximum number of buffs to display. Defaults to 32.
.numDebuffs   - The maximum number of debuffs to display. Defaults to 40.
.gap          - Controls the creation of an invisible icon between buffs and debuffs. Defaults to false.
.buffFilter   - Custom filter list for buffs to display. Takes priority over `filter`.
.debuffFilter - Custom filter list for debuffs to display. Takes priority over `filter`.

## Options Buffs

.num - Number of buffs to display. Defaults to 32.

## Options Debuffs

.num - Number of debuffs to display. Defaults to 40.

## Examples

    -- Position and size
    local Buffs = CreateFrame('Frame', nil, self)
    Buffs:SetPoint('RIGHT', self, 'LEFT')
    Buffs:SetSize(16 * 2, 16 * 16)

    -- Register with oUF
    self.Buffs = Buffs
--]]

local parent, ns = ...
local oUF = ns.oUF

local VISIBLE = 1
local HIDDEN = 0

local function UpdateTooltip(self)
	GameTooltip:SetUnitAura(self:GetParent().__owner.unit, self:GetID(), self.filter)
end

local function onEnter(self)
	if(not self:IsVisible()) then return end

	GameTooltip:SetOwner(self, 'ANCHOR_BOTTOMRIGHT')
	self:UpdateTooltip()
end

local function onLeave()
	GameTooltip:Hide()
end

local function createAuraIcon(icons, index)
	local button = CreateFrame('Button', icons:GetDebugName() .. 'Button' .. index, icons)
	button:RegisterForClicks('RightButtonUp')

	local cd = CreateFrame('Cooldown', '$parentCooldown', button, 'CooldownFrameTemplate')
	cd:SetAllPoints()

	local icon = button:CreateTexture(nil, 'BORDER')
	icon:SetAllPoints()

	local count = button:CreateFontString(nil, 'OVERLAY', 'NumberFontNormal')
	count:SetPoint('BOTTOMRIGHT', button, 'BOTTOMRIGHT', -1, 0)

	local overlay = button:CreateTexture(nil, 'OVERLAY')
	overlay:SetTexture([[Interface\Buttons\UI-Debuff-Overlays]])
	overlay:SetAllPoints()
	overlay:SetTexCoord(.296875, .5703125, 0, .515625)
	button.overlay = overlay

	local stealable = button:CreateTexture(nil, 'OVERLAY')
	stealable:SetTexture([[Interface\TargetingFrame\UI-TargetingFrame-Stealable]])
	stealable:SetPoint('TOPLEFT', -3, 3)
	stealable:SetPoint('BOTTOMRIGHT', 3, -3)
	stealable:SetBlendMode('ADD')
	button.stealable = stealable

	button.UpdateTooltip = UpdateTooltip
	button:SetScript('OnEnter', onEnter)
	button:SetScript('OnLeave', onLeave)

	button.icon = icon
	button.count = count
	button.cd = cd

	--[[ Callback: Auras:PostCreateIcon(button)
	Called after a new aura button has been created.

	* self   - the widget that holds the aura button
	* button - the newly created aura button
	--]]
	if(icons.PostCreateIcon) then icons:PostCreateIcon(button) end

	return button
end

local function customFilter(icons, unit, icon, name)
	if((icons.onlyShowPlayer and icon.isPlayer) or (not icons.onlyShowPlayer and name)) then
		return true
	end
end

local function updateIcon(unit, icons, index, offset, filter, isDebuff, visible)
	local name, rank, texture, count, dispelType, duration, expiration, caster, isStealable,
		nameplateShowSelf, spellID, canApply, isBossDebuff, casterIsPlayer, nameplateShowAll,
		timeMod, effect1, effect2, effect3 = UnitAura(unit, index, filter)

	if(name) then
		local position = visible + offset + 1
		local icon = icons[position]
		if(not icon) then
			--[[ Override: Auras:CreateIcon(index)
			Used to create the aura button at a given position.

			* self  - the widget that holds the aura buttons
			* index - the offset the icon should be created at

			Returns the button used to represent aura.
			--]]
			icon = (icons.CreateIcon or createAuraIcon) (icons, position)

			table.insert(icons, icon)
			icons.createdIcons = icons.createdIcons + 1
		end

		local isPlayer
		if(caster == 'player' or caster == 'vehicle') then
			isPlayer = true
		end

		icon.owner = caster
		icon.filter = filter
		icon.isDebuff = isDebuff
		icon.isPlayer = isPlayer

		--[[ Override: Auras:CustomFilter(unit, icon, ...)
		Defines a custom filter that controls if the aura button should be shown.

		* self - the widget that holds the aura buttons
		* unit - the unit that has the aura
		* icon - the button displaying the aura
		* ...  - the return values from [UnitAura](http://wowprogramming.com/docs/api/UnitAura)

		Returns a boolean value indicating whether the aura button should be shown.
		--]]
		local show = (icons.CustomFilter or customFilter) (icons, unit, icon, name, rank, texture,
			count, dispelType, duration, expiration, caster, isStealable, nameplateShowSelf, spellID,
			canApply, isBossDebuff, casterIsPlayer, nameplateShowAll,timeMod, effect1, effect2, effect3)

		if(show) then
			-- We might want to consider delaying the creation of an actual cooldown
			-- object to this point, but I think that will just make things needlessly
			-- complicated.
			local cd = icon.cd
			if(cd and not icons.disableCooldown) then
				if(duration and duration > 0) then
					cd:SetCooldown(expiration - duration, duration)
					cd:Show()
				else
					cd:Hide()
				end
			end

			if((isDebuff and icons.showDebuffType) or (not isDebuff and icons.showBuffType) or icons.showType) then
				local color = DebuffTypeColor[dispelType] or DebuffTypeColor.none

				icon.overlay:SetVertexColor(color.r, color.g, color.b)
				icon.overlay:Show()
			else
				icon.overlay:Hide()
			end

			local stealable = not isDebuff and isStealable
			if(stealable and icons.showStealableBuffs and not UnitIsUnit('player', unit)) then
				icon.stealable:Show()
			else
				icon.stealable:Hide()
			end

			icon.icon:SetTexture(texture)
			icon.count:SetText((count > 1 and count))

			local size = icons.size or 16
			icon:SetSize(size, size)

			icon:EnableMouse(true)
			icon:SetID(index)
			icon:Show()

			--[[ Callback: Auras:PostUpdateIcon(unit, icon, index, offest)
			Called after the aura button has been updated.

			* self   - the widget that holds the aura button
			* unit   - the unit that has the aura
			* icon   - the button that has been updated
			* index  - the index of the aura
			* offset - the offset the button has been created at
			--]]
			if(icons.PostUpdateIcon) then
				icons:PostUpdateIcon(unit, icon, index, position)
			end

			return VISIBLE
		else
			return HIDDEN
		end
	end
end

local function SetPosition(icons, from, to)
	local sizex = (icons.size or 16) + (icons['spacing-x'] or icons.spacing or 0)
	local sizey = (icons.size or 16) + (icons['spacing-y'] or icons.spacing or 0)
	local anchor = icons.initialAnchor or 'BOTTOMLEFT'
	local growthx = (icons['growth-x'] == 'LEFT' and -1) or 1
	local growthy = (icons['growth-y'] == 'DOWN' and -1) or 1
	local cols = math.floor(icons:GetWidth() / sizex + 0.5)

	for i = from, to do
		local button = icons[i]

		-- Bail out if the to range is out of scope.
		if(not button) then break end
		local col = (i - 1) % cols
		local row = math.floor((i - 1) / cols)

		button:ClearAllPoints()
		button:SetPoint(anchor, icons, anchor, col * sizex * growthx, row * sizey * growthy)
	end
end

local function filterIcons(unit, icons, filter, limit, isDebuff, offset, dontHide)
	if(not offset) then offset = 0 end
	local index = 1
	local visible = 0
	local hidden = 0
	while(visible < limit) do
		local result = updateIcon(unit, icons, index, offset, filter, isDebuff, visible)
		if(not result) then
			break
		elseif(result == VISIBLE) then
			visible = visible + 1
		elseif(result == HIDDEN) then
			hidden = hidden + 1
		end

		index = index + 1
	end

	if(not dontHide) then
		for i = visible + offset + 1, #icons do
			icons[i]:Hide()
		end
	end

	return visible, hidden
end

local function UpdateAuras(self, event, unit)
	if(self.unit ~= unit) then return end

	local auras = self.Auras
	if(auras) then
		--[[ Callback: Auras:PreUpdate(unit)
		Called before the element has been updated.

		* self - the widget that holds the aura buttons
		* unit - the event unit that the update has been triggered for
		--]]
		if(auras.PreUpdate) then auras:PreUpdate(unit) end

		local numBuffs = auras.numBuffs or 32
		local numDebuffs = auras.numDebuffs or 40
		local max = numBuffs + numDebuffs

		local visibleBuffs, hiddenBuffs = filterIcons(unit, auras, auras.buffFilter or auras.filter or 'HELPFUL', numBuffs, nil, 0, true)

		local hasGap
		if(visibleBuffs ~= 0 and auras.gap) then
			hasGap = true
			visibleBuffs = visibleBuffs + 1

			local icon = auras[visibleBuffs]
			if(not icon) then
				icon = (auras.CreateIcon or createAuraIcon) (auras, visibleBuffs)
				table.insert(auras, icon)
				auras.createdIcons = auras.createdIcons + 1
			end

			-- Prevent the icon from displaying anything.
			if(icon.cd) then icon.cd:Hide() end
			icon:EnableMouse(false)
			icon.icon:SetTexture()
			icon.overlay:Hide()
			icon.stealable:Hide()
			icon.count:SetText()
			icon:Show()

			--[[ Callback: Auras:PostUpdateGapIcon(unit, icon, visibleBuffs)
			Called after an invisible aura button has been created. Only used by Auras when the `gap` option is enabled.

			* self         - the widget that holds the aura button
			* unit         - the unit that has the aura button
			* icon         - the invisible aura button (gap)
			* visibleBuffs - the number of currently visible buttons
			--]]
			if(auras.PostUpdateGapIcon) then
				auras:PostUpdateGapIcon(unit, icon, visibleBuffs)
			end
		end

		local visibleDebuffs, hiddenDebuffs = filterIcons(unit, auras, auras.debuffFilter or auras.filter or 'HARMFUL', numDebuffs, true, visibleBuffs)
		auras.visibleDebuffs = visibleDebuffs

		if(hasGap and visibleDebuffs == 0) then
			auras[visibleBuffs]:Hide()
			visibleBuffs = visibleBuffs - 1
		end

		auras.visibleBuffs = visibleBuffs
		auras.visibleAuras = auras.visibleBuffs + auras.visibleDebuffs

		local fromRange, toRange
		--[[ Callback: Auras:PreSetPosition(max)
		Called before the aura buttons have been (re-)anchored.

		* self - the widget that holds the aura buttons
		* max  - the maximum possible number of aura buttons

		Returns the starting offset and the number of buttons to be (re-)anchored.
		--]]
		if(auras.PreSetPosition) then
			fromRange, toRange = auras:PreSetPosition(max)
		end

		if(fromRange or auras.createdIcons > auras.anchoredIcons) then
			--[[ Override: Auras:SetPosition(from, to)
			Used to (re-)anchor the aura buttons.
			Called when new aura buttons have been created or if :PreSetPosition is defined.

			* self - the widget that holds the aura buttons
			* from - the aura button before the new aura button
			* to   - the current number of created buttons
			--]]
			(auras.SetPosition or SetPosition) (auras, fromRange or auras.anchoredIcons + 1, toRange or auras.createdIcons)
			auras.anchoredIcons = auras.createdIcons
		end

		--[[ Callback: Auras:PostUpdate(unit)
		Called after the element has been updated.

		* self - the widget that holds the aura buttons
		* unit - the event unit that the update has been triggered for
		--]]
		if(auras.PostUpdate) then auras:PostUpdate(unit) end
	end

	local buffs = self.Buffs
	if(buffs) then
		if(buffs.PreUpdate) then buffs:PreUpdate(unit) end

		local numBuffs = buffs.num or 32
		local visibleBuffs, hiddenBuffs = filterIcons(unit, buffs, buffs.filter or 'HELPFUL', numBuffs)
		buffs.visibleBuffs = visibleBuffs

		local fromRange, toRange
		if(buffs.PreSetPosition) then
			fromRange, toRange = buffs:PreSetPosition(numBuffs)
		end

		if(fromRange or buffs.createdIcons > buffs.anchoredIcons) then
			(buffs.SetPosition or SetPosition) (buffs, fromRange or buffs.anchoredIcons + 1, toRange or buffs.createdIcons)
			buffs.anchoredIcons = buffs.createdIcons
		end

		if(buffs.PostUpdate) then buffs:PostUpdate(unit) end
	end

	local debuffs = self.Debuffs
	if(debuffs) then
		if(debuffs.PreUpdate) then debuffs:PreUpdate(unit) end

		local numDebuffs = debuffs.num or 40
		local visibleDebuffs, hiddenDebuffs = filterIcons(unit, debuffs, debuffs.filter or 'HARMFUL', numDebuffs, true)
		debuffs.visibleDebuffs = visibleDebuffs

		local fromRange, toRange
		if(debuffs.PreSetPosition) then
			fromRange, toRange = debuffs:PreSetPosition(numDebuffs)
		end

		if(fromRange or debuffs.createdIcons > debuffs.anchoredIcons) then
			(debuffs.SetPosition or SetPosition) (debuffs, fromRange or debuffs.anchoredIcons + 1, toRange or debuffs.createdIcons)
			debuffs.anchoredIcons = debuffs.createdIcons
		end

		if(debuffs.PostUpdate) then debuffs:PostUpdate(unit) end
	end
end

local function Update(self, event, unit)
	if(self.unit ~= unit) then return end

	UpdateAuras(self, event, unit)

	-- Assume no event means someone wants to re-anchor things. This is usually
	-- done by UpdateAllElements and :ForceUpdate.
	if(event == 'ForceUpdate' or not event) then
		local buffs = self.Buffs
		if(buffs) then
			(buffs.SetPosition or SetPosition) (buffs, 1, buffs.createdIcons)
		end

		local debuffs = self.Debuffs
		if(debuffs) then
			(debuffs.SetPosition or SetPosition) (debuffs, 1, debuffs.createdIcons)
		end

		local auras = self.Auras
		if(auras) then
			(auras.SetPosition or SetPosition) (auras, 1, auras.createdIcons)
		end
	end
end

local function ForceUpdate(element)
	return Update(element.__owner, 'ForceUpdate', element.__owner.unit)
end

local function Enable(self)
	if(self.Buffs or self.Debuffs or self.Auras) then
		self:RegisterEvent('UNIT_AURA', UpdateAuras)

		local buffs = self.Buffs
		if(buffs) then
			buffs.__owner = self
			buffs.ForceUpdate = ForceUpdate

			buffs.createdIcons = 0
			buffs.anchoredIcons = 0
		end

		local debuffs = self.Debuffs
		if(debuffs) then
			debuffs.__owner = self
			debuffs.ForceUpdate = ForceUpdate

			debuffs.createdIcons = 0
			debuffs.anchoredIcons = 0
		end

		local auras = self.Auras
		if(auras) then
			auras.__owner = self
			auras.ForceUpdate = ForceUpdate

			auras.createdIcons = 0
			auras.anchoredIcons = 0
		end

		return true
	end
end

local function Disable(self)
	if(self.Buffs or self.Debuffs or self.Auras) then
		self:UnregisterEvent('UNIT_AURA', UpdateAuras)

		if(self.Buffs) then self.Buffs:Hide() end
		if(self.Debuffs) then self.Debuffs:Hide() end
		if(self.Auras) then self.Auras:Hide() end
	end
end

oUF:AddElement('Aura', Update, Enable, Disable)
