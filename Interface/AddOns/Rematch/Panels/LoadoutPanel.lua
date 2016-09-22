﻿local _,L = ...
local rematch = Rematch
local panel = RematchLoadoutPanel
local settings, saved

rematch:InitModule(function()
	rematch.LoadoutPanel = panel
	settings = RematchSettings
	saved = RematchSaved
	for i=1,3 do
		panel.Loadouts[i].Pet.Pet:SetSize(44,44)
		panel.Loadouts[i]:RegisterForDrag("LeftButton")
		panel.Loadouts[i].HP:SetMinMaxValues(0,100)
		panel.Loadouts[i]:RegisterForClicks("AnyUp")
		panel.Loadouts[i].Pet.Pet:SetID(i)
		rematch:AddLevelingBorder(panel.Loadouts[i].Pet.Pet)
	end
	-- there's no event for when loadout pets change (really!) so we hooksecurefunc them
	hooksecurefunc(C_PetJournal,"SetAbility",function() rematch:StartTimer("LoadoutsChanging",0,panel.UpdateLoadouts) end)
	hooksecurefunc(C_PetJournal,"SetPetLoadOutInfo",function() rematch:StartTimer("LoadoutsChanging",0,panel.UpdateLoadouts) end)
	-- to avoid watching CURSOR_UPDATE all the time, only registering for event on a PickupPet
	hooksecurefunc(C_PetJournal,"PickupPet",rematch.CURSOR_UPDATE)
end)

function panel:Update()
	if panel:IsVisible() then
		panel:UpdateLoadouts()
		panel:UpdateTarget()
	end
end

-- updates the three loadout pet slots
function panel:UpdateLoadouts()
	if rematch.MiniPanel:IsVisible() then
		rematch.MiniPanel:Update()
		return
	end
	local info = rematch.info
	for i=1,3 do
		local button = panel.Loadouts[i]
		local petID
		petID,info[1],info[2],info[3] = C_PetJournal.GetPetLoadOutInfo(i)
		button.petID = petID
		rematch:FillPetListButton(button.Pet,petID,true)
		if petID then
			local _,_,level,xp,maxXP,displayID = C_PetJournal.GetPetInfoByPetID(petID)
			local health, maxHealth = C_PetJournal.GetPetStats(petID)
			if level~=25 then
				button.XP:Show()
				button.XP:SetValue(xp*100/maxXP)
			else
				button.XP:Hide()
			end
			button.HP:SetValue(health*100/maxHealth)
			if health==0 then
				button.HP.Health:SetText(DEAD)
				button.HP.Health:SetPoint("BOTTOM",button.HP,"TOP",4,4)
				button.HP.MiniHP:Hide()
			elseif health<maxHealth then
				button.HP.Health:SetText(format("%d%%",health*100/maxHealth))
				button.HP.Health:SetPoint("BOTTOM",button.HP,"TOP",5,4)
				button.HP.MiniHP:Hide()
			else
				button.HP.Health:SetText(health)
				button.HP.Health:SetPoint("BOTTOM",button.HP,"TOP",-1,4)
				button.HP.MiniHP:Show()
			end
			button.HP:Show()
			-- update model of loaded pet (if it's a different model; to avoid model restarting at first frame)
			if button.displayID ~= displayID then
				button.displayID = displayID
				button.Model:SetDisplayInfo(displayID)
			end
			button.Model:Show()
		else
			button.XP:Hide()
			button.HP:Hide()
			button.Model:Hide()
		end
		-- update loaded abilities
		for j=1,3 do
			button.Abilities[j]:SetShown(petID and true)
			if petID then
				panel:FillAbilityButton(button.Abilities[j],petID,info[j])
			end
		end
		button.queueControl = rematch:IsSlotQueueControlled(i)
		-- update background
		button.InsetBack:SetDesaturated(not petID)
		-- update leveling border if a slot is controlled by the queue
		if rematch:IsSlotQueueControlled(i) then
			button.Pet.Pet.Leveling:SetShown(not settings.QueuePaused)
			button.Pet.Pet.Leveling:SetDesaturated(not rematch:IsPetLeveling(petID))
		else
			button.Pet.Pet.Leveling:Hide()
		end

		button.LockOverlay:SetShown((C_PetBattles.GetPVPMatchmakingInfo() or not C_PetJournal.IsJournalUnlocked()) and true)
	end
end

-- returns the slot (other than the given slot) that already contains the petID
function rematch:IsPetSlotted(slot,petID)
	for i=1,3 do
		if i~=slot and petID==C_PetJournal.GetPetLoadOutInfo(i) then
			return i
		end
	end
end

-- for loadout slots accepting a pet, returns true if a pet was dropped
function panel:LoadoutButtonReceivePet()
	local hasPet,petID = GetCursorInfo()
	if hasPet=="battlepet" and rematch:GetIDType(petID)=="pet" then
		ClearCursor()
		local slot = self:GetParent()==rematch.MiniPanel and self:GetID() or self:GetParent():GetID()
		if slot>=1 and slot<=3 then
			local otherSlot = rematch:IsPetSlotted(slot,petID)
			rematch:SlotPet(slot,petID)
			if otherSlot then
				-- if an already-slotted pet is being slotted, swap its leveling slot status with the other slot
				local otherLeveling = rematch:IsSlotQueueControlled(otherSlot)
				rematch:SetLevelingSlot(otherSlot,rematch:IsSlotQueueControlled(slot))
				rematch:SetLevelingSlot(slot,otherLeveling)
			else
				rematch:SetLevelingSlot(slot,nil)
			end
			rematch:UpdateQueue()
			return true
		end
	end
end

-- this is a click of an ability in the main loadout panel
function panel:AbilityButtonOnClick(button)

	if rematch.ChatLinkAbility(self) then
		self:SetChecked(not self:GetChecked())
		return -- was only linking ability, can leave
	end

	if button=="RightButton" then
		self:SetChecked(not self:GetChecked())
		rematch:SetMenuSubject(self.abilityID)
		rematch:ShowMenu("FindAbility","cursor",nil,nil,nil,nil,true)
		return
	end

	-- check if flyout already open for this ability; close it and leave if so
	if panel.Flyout:IsVisible() and panel.Flyout:GetParent()==self then
		rematch:HideFlyout()
		return
	end
	rematch:HideWidgets()
	-- uncheck every ability except the one being opened
	for i=1,3 do
		for j=1,3 do
			local button = panel.Loadouts[i].Abilities[j]
			button:SetChecked(button==self)
		end
	end
	-- display the flyout for this ability
	local petSlot = self:GetParent():GetID()
	local abilitySlot = self:GetID()
	panel.Flyout:SetParent(self)
	panel.Flyout:SetFrameStrata("DIALOG")
	panel.Flyout:SetPoint("TOP",self,"BOTTOM")
	for i=1,2 do
		panel.Flyout.Abilities[i].NumberBG:SetShown(settings.ShowAbilityNumbers)
		panel.Flyout.Abilities[i].Number:SetShown(settings.ShowAbilityNumbers)
	end
	panel.Flyout:Show()
	local info,petID = rematch.info
	wipe(info)
	petID,info[1],info[2],info[3] = C_PetJournal.GetPetLoadOutInfo(petSlot)
	C_PetJournal.GetPetAbilityList((C_PetJournal.GetPetInfoByPetID(petID)),rematch.abilityList,rematch.levelList)
	panel.Flyout.petID = petID
	for i=1,2 do
		local listIndex = (i-1)*3+abilitySlot
		local abilityID = rematch.abilityList[listIndex]
		panel:FillAbilityButton(panel.Flyout.Abilities[i],petID,abilityID)
		panel.Flyout.Abilities[i]:SetChecked(abilityID==self.abilityID)
	end
end

-- fills an ability button for loadout (both main and flyout buttons)
function panel:FillAbilityButton(button,petID,abilityID)
	if rematch:GetIDType(petID)~="pet" then
		button.abilityID = nil
		button.Icon:SetTexture("Interface\\PaperDoll\\UI-Backpack-EmptySlot")
		return
	end
	button.abilityID = abilityID
	local _,_,icon = C_PetBattles.GetAbilityInfoByID(abilityID)
	button.Icon:SetTexture(icon)
	local speciesID,_,level = C_PetJournal.GetPetInfoByPetID(petID)
	if speciesID then
		C_PetJournal.GetPetAbilityList(speciesID,rematch.abilityList,rematch.levelList)
		for i,candidate in ipairs(rematch.abilityList) do
			if candidate==abilityID then
				if level<rematch.levelList[i] then -- if pet too low level, show level in red on button
					button.Cover:Show()
					button.Level:SetText(rematch.levelList[i])
					button.Level:Show()
					button.Icon:SetDesaturated(true)
				else
					button.Cover:Hide()
					button.Level:Hide()
					button.Icon:SetDesaturated(false)
				end
				return
			end
		end
	end
end

-- click of one of the two buttons in the ability flyout window
function panel:FlyoutAbilityOnClick()
	if rematch.ChatLinkAbility(self) then
		self:SetChecked(not self:GetChecked())
		return -- only linking ability to chat, leave
	end
	local petSlot = self:GetParent():GetParent():GetParent():GetID()
	local abilitySlot = self:GetParent():GetParent():GetID()
	if self.Cover:IsVisible() then
		self:SetChecked(not self:GetChecked())
		return
	else
		rematch.timeUIChanged = GetTime()
		rematch:HideFlyout()
		C_PetJournal.SetAbility(petSlot,abilitySlot,self.abilityID)
	end
end

-- unchecks every ability and hides flyout
function rematch:HideFlyout()
	for i=1,3 do
		for j=1,3 do
			panel.Loadouts[i].Abilities[j]:SetChecked(false)
		end
	end
	panel.Flyout:Hide()
	rematch.MiniPanel.Flyout:Hide()
end

function panel:UpdateTarget(unit)
	if not panel:IsVisible() then
		return
	end
	local npcID = rematch.recentTarget
	local name = rematch:GetNameFromNpcID(npcID)
	local target = panel.Target
	target.Name:SetText(name)

	local show = npcID and true
	target.Model:SetShown(show)
	target.ModelBorder:SetShown(show)
	target.GreenCheck:SetShown(show and saved[npcID])
	target.SaveStatus:SetShown(show)
	target.LoadSaveButton:SetShown(show)
	target.Clear:SetShown(show)
	target.Vs:Hide()
	for i=1,3 do
		target.Pets[i]:SetShown(show)
	end

	if not show then return end -- nothing being displayed, leave after stuff hidden

	if saved[npcID] then -- this target has a saved team
		target.SaveStatus:SetPoint("LEFT",target.GreenCheck,"RIGHT",2,0)
		target.SaveStatus:SetText(L["Target has a saved team"])
		target.LoadSaveButton:SetText(L["Load"])
		target.LoadSaveButton.tooltipTitle = L["Load"]
		target.LoadSaveButton.tooltipBody = L["Load the team saved for this target."]
	else
		target.SaveStatus:SetPoint("LEFT",target.GreenCheck,"LEFT",4,0)
		target.SaveStatus:SetText(L["This target has no saved team"])
		target.LoadSaveButton:SetText(SAVE)
		target.LoadSaveButton.tooltipTitle = SAVE
		target.LoadSaveButton.tooltipBody = L["Save the currently loaded pets to this target."]
	end

	local hasPets,vs = panel:UpdateTargetModelandPets(target,nil,npcID)

	if vs then
		target.Pet1:SetPoint("TOPLEFT",target,"LEFT",84,-7)
		target.Vs:Show()
	else
		target.Pet1:SetPoint("TOPLEFT",target,"LEFT",64,-7)
		target.Vs:Hide()
	end
	rematch:MaybeBlingTarget(target)
end

-- shared by LoadoutPanel.Target and MiniPanel.Target
function panel:UpdateTargetModelandPets(frame,unit,npcID,vs)
	if unit then -- target can have a different model than its npcID (ie Garrison Creatures)
		frame.Model:SetUnit(unit)
	else
		frame.Model:SetCreature(npcID)
	end
	frame.Model:Show()
	-- display notable pets (if any)
	local hasPets -- becomes the index of the last notable pet displayed
	if rematch.notableNames[npcID] then -- notable npcID targeted, display its team
		local notableIndex
		for index,info in pairs(rematch.notableNPCs) do
			if info[1]==npcID then
				notableIndex = index
				break
			end
		end
		if notableIndex then
			for i=1,3 do
				local petID = rematch.notableNPCs[notableIndex][i+2]
				if petID then
					rematch:FillPetSlot(frame.Pets[i],petID,true)
					hasPets = i
				end
				frame.Pets[i]:SetShown(petID and true)
			end
		end
	end
	if vs or not hasPets then -- if no notable pets, then hide all pets
		if saved[npcID] then
			for i=1,3 do
				rematch:FillPetSlot(frame.Pets[i],saved[npcID][i][1],true)
				frame.Pets[i]:Show()
			end
			hasPets = true
			vs = true
		else
			for i=1,3 do
				frame.Pets[i]:Hide()
			end
		end
	end
	return hasPets,vs
end

function panel:LoadSaveButtonOnClick(button)
	local npcID = rematch.recentTarget
	if saved[npcID] then
		rematch:LoadTeam(npcID)
		rematch:SetLastInteractNpcID(npcID)
		if rematch.TeamPanel:IsVisible() then
			rematch:ShowTeam(npcID)
		end
	elseif npcID then
		rematch:SetSideline(npcID,saved[npcID],true)
		rematch:CheckToOverwriteNotesAndPreferences()
		rematch:ShowSaveAsDialog()
	end
end

function panel:LockedButtonOnEnter()
	if not C_PetJournal.IsJournalUnlocked() then
		rematch.ShowTooltip(self,LOCKED,PET_JOURNAL_READONLY_TEXT,"cursor")
	elseif C_PetBattles.GetPVPMatchmakingInfo() then
		rematch.ShowTooltip(self,LOCKED,ERR_PETBATTLE_QUEUE_QUEUED,"cursor")
	end
end

-- flashes the frame.Bling if the recent target is a new one (and team isn't loaded)
function rematch:MaybeBlingTarget(frame)
	local npcID = rematch.recentTarget
	if npcID and saved[npcID] and settings.loadedTeam~=npcID and rematch.blingedNpcID~=npcID then
		rematch.blingedNpcID = npcID
		frame.Bling:Show()
	end
end

-- updates highlights from pet card being locked
function panel:UpdateHighlights()
	if panel:IsVisible() then
		local card = rematch.PetCard
		local petID = (card.petID and card.petID~=0 and card.locked) and card.petID
		for i=1,3 do
			local button = panel.Loadouts[i]
			local lock = petID and button.petID==petID
			button.lockHighlight = lock or nil
			if lock then
				button.InsetHighlight:Show()
			elseif GetMouseFocus()~=button then
				button.InsetHighlight:Hide()
			end
		end
	end
end
