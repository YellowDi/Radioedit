--[[
# Element: Portraits

Handles updating of the unit's portrait.

## Widget

Portrait - A PlayerModel or Texture used to represent the unit's portrait.

## Notes

The quest delivery question mark will be used instead of the unit's model when the client doesn't have the model
information for the unit.

## Examples

    -- 3D Portrait
    -- Position and size
    local Portrait = CreateFrame('PlayerModel', nil, self)
    Portrait:SetSize(32, 32)
    Portrait:SetPoint('RIGHT', self, 'LEFT')

    -- Register it with oUF
    self.Portrait = Portrait

    -- 2D Portrait
    local Portrait = self:CreateTexture(nil, 'OVERLAY')
    Portrait:SetSize(32, 32)
    Portrait:SetPoint('RIGHT', self, 'LEFT')

    -- Register it with oUF
    self.Portrait = Portrait
--]]

local parent, ns = ...
local oUF = ns.oUF

local function Update(self, event, unit)
	if(not unit or not UnitIsUnit(self.unit, unit)) then return end

	local element = self.Portrait

	--[[ Callback: Portrait:PreUpdate(unit)
	Called before the element has been updated.

	* self - the Portrait element
	* unit - the event unit that the update has been triggered for
	--]]
	if(element.PreUpdate) then element:PreUpdate(unit) end

	if(element:IsObjectType('Model')) then
		local guid = UnitGUID(unit)
		if(not UnitExists(unit) or not UnitIsConnected(unit) or not UnitIsVisible(unit)) then
			element:SetCamDistanceScale(0.25)
			element:SetPortraitZoom(0)
			element:SetPosition(0,0,0.5)
			element:ClearModel()
			element:SetModel([[Interface\Buttons\\TalkToMeQuestionMark.m2]])
			element.guid = nil
		elseif(element.guid ~= guid or event == 'UNIT_MODEL_CHANGED') then
			element:SetCamDistanceScale(1)
			element:SetPortraitZoom(1)
			element:SetPosition(0,0,0)
			element:ClearModel()
			element:SetUnit(unit)
			element.guid = guid
		end
	else
		SetPortraitTexture(element, unit)
	end

	--[[ Callback: Portrait:PostUpdate(unit)
	Called after the element has been updated.

	* self - the Portrait element
	* unit - the event unit that the update has been triggered for
	--]]
	if(element.PostUpdate) then
		return element:PostUpdate(unit)
	end
end

local function Path(self, ...)
	--[[ Override: Portrait:Override(...)
	Used to completely override the internal update function.

	* self - the Portrait element
	* ...  - the event and the arguments that accompany it
	--]]
	return (self.Portrait.Override or Update) (self, ...)
end

local function ForceUpdate(element)
	return Path(element.__owner, 'ForceUpdate', element.__owner.unit)
end

local function Enable(self, unit)
	local element = self.Portrait
	if(element) then
		element:Show()
		element.__owner = self
		element.ForceUpdate = ForceUpdate

		self:RegisterEvent('UNIT_PORTRAIT_UPDATE', Path)
		self:RegisterEvent('UNIT_MODEL_CHANGED', Path)
		self:RegisterEvent('UNIT_CONNECTION', Path)

		-- The quest log uses PARTY_MEMBER_{ENABLE,DISABLE} to handle updating of
		-- party members overlapping quests. This will probably be enough to handle
		-- model updating.
		--
		-- DISABLE isn't used as it fires when we most likely don't have the
		-- information we want.
		if(unit == 'party') then
			self:RegisterEvent('PARTY_MEMBER_ENABLE', Path)
		end

		return true
	end
end

local function Disable(self)
	local element = self.Portrait
	if(element) then
		element:Hide()

		self:UnregisterEvent('UNIT_PORTRAIT_UPDATE', Path)
		self:UnregisterEvent('UNIT_MODEL_CHANGED', Path)
		self:UnregisterEvent('PARTY_MEMBER_ENABLE', Path)
		self:UnregisterEvent('UNIT_CONNECTION', Path)
	end
end

oUF:AddElement('Portrait', Path, Enable, Disable)
