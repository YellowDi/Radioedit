local _,L = ...
local rematch = Rematch
local card = RematchAbilityCard

rematch:InitModule(function()
	local font,size,flag = card.Name:GetFont()
	card.Name:SetFont(font,size+2,flag)
	card.Hints.StrongVs:SetText(L["Vs"])
	card.Hints.WeakVs:SetText(L["Vs"])
end)

-- instead of duplicating all the tables and parsing to create our own ability tooltip,
-- we just set a default tooltip, copy its strings and textures to our own, then
-- hide the default before it's rendered on screen.

function rematch:ShowAbilityCard(parent,petID,abilityID)

	if rematch:UIJustChanged() then return end

	-- if FastPetCard not enabled, then cause a 0.25 delay before showing a card
	if not RematchSettings.FastPetCard then
		if parent and abilityID then
			card.parent = parent
			card.petID = petID
			card.abilityID = abilityID
			rematch:StartTimer("ShowAbilityCard",0.25,rematch.ShowAbilityCard)
			return
		else
			parent = card.parent
			petID = card.petID
			abilityID = card.abilityID
		end
	end

	if not parent or not abilityID then
		return
	end

	local tooltip = FloatingPetBattleAbilityTooltip
	if petID and abilityID then
		local _,maxHealth,power,speed
		if type(petID)=="table" then
			maxHealth,power,speed = petID.health, petID.power, petID.speed
		elseif type(petID)=="string" then
			_,maxHealth,power,speed = C_PetJournal.GetPetStats(petID)
			card.TitleBG:SetDesaturated(false)
			card.Hints.HintsBG:SetDesaturated(false)
		else
			maxHealth,power,speed = 100,0,0 -- missing pets are weak!
			card.TitleBG:SetDesaturated(true)
			card.Hints.HintsBG:SetDesaturated(true)
		end

		local _,name,icon,_,_,_,_,noStrongWeakHints = C_PetBattles.GetAbilityInfoByID(abilityID)

		-- do stuff we can handle on our own
		card.Icon:SetTexture(icon)
		card.Name:SetText(name)
		card.Hints:SetShown(not noStrongWeakHints)

		-- now make default do all the work
		FloatingPetBattleAbility_Show(abilityID,maxHealth,power,speed)

		-- at this point, default tooltip is filled in. now copy default's hard work
		card.Type:SetTexture(tooltip.AbilityPetType:GetTexture())

		local bottom -- tracks the bottom-most line shown, nil if we anchor to the top

		local hasDuration = tooltip.Duration:IsVisible()
		if hasDuration then
			card.Duration:SetText(tooltip.Duration:GetText())
			bottom = card.Duration
		end
		card.Duration:SetShown(hasDuration)

		local hasCooldown = tooltip.MaxCooldown:IsVisible()
		if hasCooldown then
			card.Cooldown:SetText(tooltip.MaxCooldown:GetText())
			if not bottom then
				card.Cooldown:SetPoint("TOPLEFT",card.Duration,"TOPLEFT")
			else
				card.Cooldown:SetPoint("TOPLEFT",bottom,"BOTTOMLEFT",0,-5)
			end
			bottom = card.Cooldown
		end
		card.Cooldown:SetShown(hasCooldown)

		card.Description:SetText(tooltip.Description:GetText())
		if not bottom then
			card.Description:SetPoint("TOPLEFT",card.Duration,"TOPLEFT")
		else
			card.Description:SetPoint("TOPLEFT",bottom,"BOTTOMLEFT",0,-5)
		end

		if not noStrongWeakHints then -- pet has hints
			card.Hints.StrongType:SetTexture(tooltip.StrongAgainstType1:GetTexture())
			card.Hints.WeakType:SetTexture(tooltip.WeakAgainstType1:GetTexture())
			card.MiddleBG:SetPoint("BOTTOMRIGHT",card.Hints,"TOPRIGHT",-3,0)
		else
			card.MiddleBG:SetPoint("BOTTOMRIGHT",-3,3)
		end

		tooltip:Hide() -- we're done with default tooltip, no need to show it

		rematch:SmartAnchor(card,parent)

		card:SetAlpha(0) -- going to wait a frame to resize
		card:SetScript("OnUpdate",card.ResizeAbilityCard)
		rematch:AdjustScale(card)
		card:Show()
	end

end

-- let ability card render for a frame to set boundries relative to positions
function card:ResizeAbilityCard()
	self:SetScript("OnUpdate",nil)
	local top = self:GetTop()
	local bottom = self.Description:GetBottom()
	if self.Hints:IsVisible() then
		self:SetHeight(top-bottom+50)
	else
		self:SetHeight(top-bottom+11)
	end
	self:SetAlpha(1)
end

function rematch:HideAbilityCard()
	card.parent = nil
	card.petID = nil
	card.abilityID = nil
	card:Hide()
end

-- handles the linking of abilities
function rematch:ChatLinkAbility()
	if IsModifiedClick("CHATLINK") then
		local abilityID = self.abilityID
		local petID = self:GetParent().petID
		if not petID and card:IsVisible() then
			petID = card.petID
		end
		local maxHealth,power,speed,_ = 100,0,0
		if rematch:GetIDType(petID)=="pet" then
			_,maxHealth,power,speed = C_PetJournal.GetPetStats(petID)
		end
		ChatEdit_InsertLink(GetBattlePetAbilityHyperlink(abilityID,maxHealth,power,speed))
		return true
	end
end
