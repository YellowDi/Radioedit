local E, L, V, P, G = unpack(select(2, ...)); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB
local mod = E:GetModule('NamePlates')

function mod:ConstructElement_TargetArrow(frame)
	local arrowIndicator = WorldFrame:CreateTexture(nil, 'BORDER', -1)
	arrowIndicator:SetTexture([[Interface\AddOns\ElvUI\media\textures\nameplateTargetIndicator.tga]])
	arrowIndicator:Hide()

	local doubleArrowIndicator = CreateFrame("Frame", nil, WorldFrame)
	doubleArrowIndicator.left = doubleArrowIndicator:CreateTexture(nil, 'BORDER', -1)
	doubleArrowIndicator.left:SetTexture([[Interface\AddOns\ElvUI\media\textures\nameplateTargetIndicatorLeft.tga]])
	doubleArrowIndicator.right = doubleArrowIndicator:CreateTexture(nil, 'BORDER', -1)
	doubleArrowIndicator.right:SetTexture([[Interface\AddOns\ElvUI\media\textures\nameplateTargetIndicatorRight.tga]])
	doubleArrowIndicator:Hide()

	return arrowIndicator, doubleArrowIndicator
end

function mod:ConfigureElement_TargetArrow(frame)
	if not frame then return end
	local db = self.db.targetIndicator
	if not self.db.targetIndicator.enable then
		frame.arrowIndicator:Hide()
		frame.doubleArrowIndicator:Hide()
		return;
	end

	if(self.db.targetIndicator.style == 'arrow') then
		frame.arrowIndicator:SetHeight(db.height)
		frame.arrowIndicator:SetWidth(db.width)
		frame.arrowIndicator:SetVertexColor(db.color.r, db.color.g, db.color.b)
	elseif(self.db.targetIndicator.style == 'doubleArrow' or self.db.targetIndicator.style == 'doubleArrowInverted' or self.db.targetIndicator.style == 'doubleTPArrow') then
		frame.doubleArrowIndicator.left:SetHeight(db.height)
		frame.doubleArrowIndicator.left:SetWidth(db.width)
		frame.doubleArrowIndicator.right:SetWidth(db.width)
		frame.doubleArrowIndicator.right:SetHeight(db.height)
		frame.doubleArrowIndicator.left:SetVertexColor(db.color.r, db.color.g, db.color.b)
		frame.doubleArrowIndicator.right:SetVertexColor(db.color.r, db.color.g, db.color.b)
	end
end

function mod:UpdateElement_TargetArrow(frame)
	if(not frame.HealthBar:IsShown()) then return end

	if not self.db.targetIndicator.enable then
		frame.arrowIndicator:Hide()
		frame.doubleArrowIndicator:Hide()
		return;
	end

	local r, g, b, shouldShow;
	if ( UnitIsUnit(frame.unit, "target") ) then
		if(self.db.targetIndicator.style == 'arrow') then
			frame.doubleArrowIndicator:Hide()
		elseif(self.db.targetIndicator.style == 'doubleArrow' or self.db.targetIndicator.style == 'doubleArrowInverted' or self.db.targetIndicator.style == 'doubleTPArrow') then
			frame.arrowIndicator:Hide()
			if self.db.targetIndicator.style == 'doubleTPArrow' then
				frame.doubleArrowIndicator.left:SetTexture([[Interface\AddOns\ElvUI\media\textures\nameplate_arrows_left.tga]])
				frame.doubleArrowIndicator.right:SetTexture([[Interface\AddOns\ElvUI\media\textures\nameplate_arrows_right.tga]])
			else
				frame.doubleArrowIndicator.left:SetTexture([[Interface\AddOns\ElvUI\media\textures\nameplateTargetIndicatorLeft.tga]])
				frame.doubleArrowIndicator.right:SetTexture([[Interface\AddOns\ElvUI\media\textures\nameplateTargetIndicatorRight.tga]])
			end
		end

		if(self.db.targetIndicator.style == 'arrow') then
			frame.arrowIndicator:SetHeight(self.db.targetIndicator.height)
			frame.arrowIndicator:SetWidth(self.db.targetIndicator.width)
		elseif(self.db.targetIndicator.style == 'doubleArrow' or self.db.targetIndicator.style == 'doubleArrowInverted' or self.db.targetIndicator.style == 'doubleTPArrow') then
			frame.doubleArrowIndicator.left:SetHeight(self.db.targetIndicator.height)
			frame.doubleArrowIndicator.left:SetWidth(self.db.targetIndicator.width)
			frame.doubleArrowIndicator.right:SetWidth(self.db.targetIndicator.width)
			frame.doubleArrowIndicator.right:SetHeight(self.db.targetIndicator.height)
		end

		if(self.db.targetIndicator.style == 'arrow') then
			frame.arrowIndicator:ClearAllPoints()
			frame.arrowIndicator:SetPoint("BOTTOM", frame, "TOP", self.db.targetIndicator.xOffset, self.db.targetIndicator.yOffset)
			frame.arrowIndicator:Show()
		elseif(self.db.targetIndicator.style == 'doubleArrow' or self.db.targetIndicator.style == 'doubleTPArrow') then
			frame.doubleArrowIndicator.left:ClearAllPoints()
			frame.doubleArrowIndicator.right:ClearAllPoints()
			frame.doubleArrowIndicator.left:SetPoint("RIGHT", frame, "LEFT", -self.db.targetIndicator.xOffset, self.db.targetIndicator.yOffset)
			frame.doubleArrowIndicator.right:SetPoint("LEFT", frame, "RIGHT", self.db.targetIndicator.xOffset, self.db.targetIndicator.yOffset)
			frame.doubleArrowIndicator:SetFrameLevel(0)
			frame.doubleArrowIndicator:SetFrameStrata("BACKGROUND")
			frame.doubleArrowIndicator:Show()
		elseif(self.db.targetIndicator.style == 'doubleArrowInverted') then
			frame.doubleArrowIndicator.left:ClearAllPoints()
			frame.doubleArrowIndicator.right:ClearAllPoints()
			frame.doubleArrowIndicator.right:SetPoint("RIGHT", frame, "LEFT", -self.db.targetIndicator.xOffset, self.db.targetIndicator.yOffset)
			frame.doubleArrowIndicator.left:SetPoint("LEFT", frame, "RIGHT", self.db.targetIndicator.xOffset, self.db.targetIndicator.yOffset)
			frame.doubleArrowIndicator:SetFrameLevel(0)
			frame.doubleArrowIndicator:SetFrameStrata("BACKGROUND")
			frame.doubleArrowIndicator:Show()
		end
	else
		frame.arrowIndicator:Hide()
		frame.doubleArrowIndicator:Hide()
	end
end