--[[ Pet Panel Filter menus ]]

local _,L = ...
local rematch = Rematch
local roster = rematch.Roster
local settings
local rmf = {}

rematch:InitModule(function()
	settings = RematchSettings

	rematch.favoriteFilterMenu = {} -- this is rebuilt as favorite filters are added/removed
	rmf:UpdateFavoriteFilterMenu() -- by this function no less
	rematch:RegisterMenu("FavoriteFilters",rematch.favoriteFilterMenu,rematch.UpdateRoster)

	-- if no script filters defined, then create some default scripts
	if #settings.ScriptFilters==0 then
		settings.ScriptFilters = {
			{ L["Unnamed Pets"], L["-- Collected pets that still have their original name.\n\nreturn owned and not customName"] },
			{ L["Partially Leveled"], L["-- Pets that have earned some xp in battle.\n\nreturn xp and xp>0"] },
			{ L["Unique Abilities"], L["-- Pets with abilities not shared by other pets.\n\nif not count then\n  -- create count of each ability per species\n  count = {}\n  for speciesID in AllSpeciesIDs() do\n    for abilityID in AllAbilities(speciesID) do\n      if not count[abilityID] then\n        count[abilityID] = 0\n      end\n      count[abilityID] = count[abilityID] + 1\n    end\n  end\nend\n\nfor _,abilityID in ipairs(abilityList) do\n  if count[abilityID]==1 then\n    return true\n  end\nend"] },
			{ L["Pets Without Rares"], L["-- Collected battle pets that have no rare version.\n\nif not rares then\n  rares = {}\n  for petID in AllPetIDs() do\n    if select(5,C_PetJournal.GetPetStats(petID))==4 then\n      rares[C_PetJournal.GetPetInfoByPetID(petID)]=true\n    end\n  end\nend\n\nif canBattle and owned and not rares[speciesID] then\n  return true\nend"] },
			{ L["Hybrid Counters"], L["-- Pets with three or more attack types different than their pet type.\n\nlocal count = 0\nfor _,abilityID in ipairs(abilityList) do\n  local abilityType,noHints = select(7, C_PetBattles.GetAbilityInfoByID(abilityID) )\n  if not noHints and abilityType~=petType then\n    count = count + 1\n  end\nend\n\nreturn count>=3\n"] },
		}
	end

	rematch.scriptFilterMenu = {} -- this is rebuilt as scripts are added/removed
	rematch:UpdateScriptFilterMenu() -- by this function (really)
	rematch:RegisterMenu("ScriptFilters",rematch.scriptFilterMenu,rematch.UpdateRoster)

	-- this is the universal right-click menu for a pet: petpanel, queuepanel and loadoutpanel
	rematch:RegisterMenu("PetMenu", {
		{ title=true, maxWidth=200, text=function(entry,petID) return rematch:GetPetName(petID) end },
		{ text=function(entry,petID) -- Summon/Dismiss
				return C_PetJournal.GetSummonedPetGUID()==petID and PET_ACTION_DISMISS or SUMMON
			end,
			hidden=function(entry,petID)
				return rematch:GetIDType(petID)~="pet"
			end,
			func=function(entry,petID)
				C_PetJournal.SummonPetByGUID(petID)
			end },
		{ text=L["Put Leveling Pet Here"], -- for loadout slots only
			hidden=function(entry,petID)
				local parent = rematch:GetMenuParent():GetParent()
				local ggparent = parent:GetParent():GetParent()
				return (parent~=RematchLoadoutPanel and ggparent~=RematchLoadoutPanel and parent~=RematchMiniPanel) or rematch:IsSlotQueueControlled(rematch:GetMenuParent():GetID())
			end,
			func=function(entry,petID)
				rematch:SetLevelingSlot(rematch:GetMenuParent():GetID(),true)
				rematch:UpdateQueue()
			end },
		{ text=L["Stop Leveling This Slot"], -- for loadout slots only
			hidden=function(entry,petID)
				local parent = rematch:GetMenuParent():GetParent()
				local ggparent = parent:GetParent():GetParent()
				return (parent~=RematchLoadoutPanel and ggparent~=RematchLoadoutPanel and parent~=RematchMiniPanel) or not rematch:IsSlotQueueControlled(rematch:GetMenuParent():GetID())
			end,
			func=function(entry,petID)
				rematch:SetLevelingSlot(rematch:GetMenuParent():GetID(),nil)
				rematch:UpdateQueue()
			end },
		{ text=L["Set Notes"], func=function(self,petID)
				rematch.Notes.locked = true
				rematch:ShowNotes("pet",petID,true)
				rematch.Notes.Content.ScrollFrame.EditBox:SetFocus(true)
			end },
		{ text=L["Find Similar"],
			hidden=function(entry,petID)
				local idType = rematch:GetIDType(petID)
				if idType=="pet" then
					if select(15,C_PetJournal.GetPetInfoByPetID(petID)) then
						return false -- owned pet can battle, return false (don't hide)
					end
				elseif idType=="species" then
					if select(8,C_PetJournal.GetPetInfoBySpeciesID(petID)) then
						return false -- missing pet can battle, return false (don't hide)
					end
				end
				return true -- hide Find Similar if we reached here
			end,
			func=function(entry,petID)
				if rematch:GetIDType(petID)=="species" then
					roster:SetSimilarFilter(petID)
				else
					local speciesID = C_PetJournal.GetPetInfoByPetID(petID)
					roster:SetSimilarFilter(speciesID)
				end
			end },
		{ text=BATTLE_PET_RENAME, -- Rename
			hidden=function(entry,petID)
				return rematch:GetIDType(petID)~="pet"
			end,
			func=function(entry,petID)
				local dialog = rematch:ShowDialog("Rename",300,180,BATTLE_PET_RENAME,L["Enter a new name"],ACCEPT,function() C_PetJournal.SetCustomName(petID,rematch.Dialog.EditBox:GetText()) end,CANCEL,nil,PET_RENAME_DEFAULT_LABEL,function() C_PetJournal.SetCustomName(petID,"") rematch.Dialog:Hide() end)
				dialog.Pet:SetPoint("TOPRIGHT",-12,-28)
				rematch:FillPetListButton(dialog.Pet,petID)
				dialog.Pet:Show()
				dialog.EditBox:SetPoint("TOP",0,-84)
				dialog.EditBox:SetText(rematch:GetPetName(petID)) -- set starting name
				dialog.EditBox:Show()
			end,
		},
		{ text=function(entry,petID) -- Set/Remove Favorite
				return (rematch:GetIDType(petID)=="pet" and C_PetJournal.PetIsFavorite(petID)) and BATTLE_PET_UNFAVORITE or BATTLE_PET_FAVORITE
			end,
			hidden=function(entry,petID)
				return rematch:GetIDType(petID)~="pet"
			end,
			func=function(entry,petID)
				C_PetJournal.SetFavorite(petID,C_PetJournal.PetIsFavorite(petID) and 0 or 1)
			end },
		{ text=function(self,petID)
				return format(L["List %d Teams"],roster:IsPetInTeam(petID,true))
			end,
			hidden=function(self,petID)
				local count = roster:IsPetInTeam(petID,true)
				return not count or count==0
			end,
			func=function(self,petID)
				if rematch:GetIDType(petID)=="pet" then
					rematch.TeamPanel:SetTeamSearch(petID)
				else
					rematch.TeamPanel:SetTeamSearch(rematch:GetPetName(petID))
				end
				rematch:ShowTeam()
			end	},
		{ text=L["Hide Pet"], hidden=function(self,petID) return not rmf:ForPetPanel() or rmf:PetIsHidden(petID) end, func=rmf.ShowHidePetDialog },
		{ text=L["Unhide Pet"], hidden=function(self,petID) return not rmf:ForPetPanel() or not rmf:PetIsHidden(petID) end, func=function(self,petID) roster:SetHidePet(petID,false) end },
		{ text=BATTLE_PET_RELEASE, -- Release
			hidden=function(entry,petID)
				return rematch:GetIDType(petID)~="pet" or not C_PetJournal.PetCanBeReleased(petID)
			end,
			disabled=function(entry,petID)
				return C_PetJournal.PetIsSlotted(petID)
			end,
			disabledReason=L["Slotted pets cannot be released."],
			func=function(entry,petID)
				local dialog = rematch:ShowDialog("Release",300,176,BATTLE_PET_RELEASE,L["Release this pet?"],YES,function() C_PetJournal.ReleasePetByID(petID) end,NO)
				dialog.Pet:SetPoint("TOPRIGHT",-12,-28)
				rematch:FillPetListButton(dialog.Pet,petID)
				dialog.Pet:Show()
				dialog.Warning:SetPoint("TOPLEFT",16,-80)
				dialog.Warning.Text:SetText(L["Once released, this pet is gone forever!"])
				dialog.Warning:Show()
			end,
			},
		{ text=BATTLE_PET_PUT_IN_CAGE, -- Put In Cage
			hidden=function(entry,petID)
				return rematch:GetIDType(petID)~="pet" or not C_PetJournal.PetIsTradable(petID)
			end,
			disabled=function(entry,petID)
				return C_PetJournal.PetIsSlotted(petID) or C_PetJournal.PetIsHurt(petID)
			end,
			disabledReason=function(entry,petID)
				return C_PetJournal.PetIsSlotted(petID) and L["Slotted pets cannot be caged."] or L["Injured pets cannot be caged."]
			end,
			func=function(entry,petID)
				local dialog = rematch:ShowDialog("Cage",300,140,BATTLE_PET_PUT_IN_CAGE,L["Cage this pet?"],YES,function() C_PetJournal.CagePetByID(petID) end,NO)
				dialog.Pet:SetPoint("TOPRIGHT",-12,-28)
				rematch:FillPetListButton(dialog.Pet,petID)
				dialog.Pet:Show()
			end },
		{ spacer=true, hidden=function(self,petID) return not rematch:PetCanLevel(petID) end },
		{ text=L["Start Leveling"], -- only for pets not already in the queue
			hidden=function(entry,petID)
				return not rematch:PetCanLevel(petID) or rematch:IsPetLeveling(petID) or settings.QueueActiveSort
			end,
			func=function(entry,petID)
				rematch:InsertPetToQueue(1,petID)
				rematch:ShowQueue(petID)
			end },
		{ text=L["Add To Leveling Queue"],
			hidden=function(entry,petID)
				return not rematch:PetCanLevel(petID) or rematch:IsPetLeveling(petID)
			end,
			func=function(entry,petID)
				rematch:InsertPetToQueue(#settings.LevelingQueue+1,petID)
				rematch:ShowQueue(petID)
			end },
		{ text=L["Stop Leveling"],
			hidden=function(entry,petID)
				return not rematch:IsPetLeveling(petID)
			end,
			func=function(entry,petID)
				rematch:RemovePetFromQueue(petID)
			end },

		-- queue move buttons
		{ spacer=true, hidden=rmf.IsNotQueuePet },
		{ text=L["Move To Top"], hidden=rmf.IsNotQueuePet, icon="Interface\\Buttons\\UI-MicroStream-Green", iconCoords={0.075,0.925,0.925,0.075}, stay=true,
			disabled=function(entry,petID)
				return settings.LevelingQueue[1]==petID
			end,
			func=function(entry,petID)
				rematch:MovePetInQueue(petID,-2)
			end },
		{ text=L["Move Up"], hidden=rmf.IsNotQueuePet, icon="Interface\\Buttons\\UI-MicroStream-Yellow", iconCoords={0.075,0.925,0.925,0.075}, stay=true,
			disabled=function(entry,petID)
				return settings.LevelingQueue[1]==petID
			end,
			func=function(entry,petID)
				rematch:MovePetInQueue(petID,-1)
			end },
		{ text=L["Move Down"], hidden=rmf.IsNotQueuePet, icon="Interface\\Buttons\\UI-MicroStream-Yellow", stay=true,
			disabled=function(entry,petID)
				return settings.LevelingQueue[#settings.LevelingQueue]==petID
			end,
			func=function(entry,petID)
				rematch:MovePetInQueue(petID,1)
			end },
		{ text=L["Move To End"], hidden=rmf.IsNotQueuePet, icon="Interface\\Buttons\\UI-MicroStream-Green", stay=true,
			disabled=function(entry,petID)
				return settings.LevelingQueue[#settings.LevelingQueue]==petID
			end,
			func=function(entry,petID)
				rematch:MovePetInQueue(petID,2)
			end },
		{ spacer=true, hidden=function(self,petID) return not rematch:PetCanLevel(petID) end },

		{ text=function(self,petID) return rmf:IsNotQueuePet() and CANCEL or OKAY end },
	 },rematch.UpdateQueue)

	-- these are the pet panel filter menus

	rematch:RegisterMenu("PetFilter", { -- Filter main menu
		{ text=COLLECTED, check=true, group="Collected", var="Owned", value=rmf.GetNotValue, func=rmf.ToggleNotValue },
		{ text=L["Only Favorites"], check=true, indent=8, group="Favorite", size=2, var=1, value=rmf.GetValue, func=rmf.ToggleValue },
		{ text=NOT_COLLECTED, check=true, group="Collected", var="Missing", value=rmf.GetNotValue, func=rmf.ToggleNotValue },
		{ text=PET_FAMILIES, subMenu="PetTypes", group="Types", highlight=rmf.GroupUsed },
		{ text=L["Strong Vs"], subMenu="PetStrong", group="Strong", highlight=rmf.GroupUsed  },
		{ text=L["Tough Vs"], subMenu="PetTough", group="Tough", highlight=rmf.GroupUsed },
		{ text=SOURCES, subMenu="PetSources", group="Sources", highlight=rmf.GroupUsed },
		{ text=RARITY, subMenu="PetRarity", group="Rarity", highlight=rmf.GroupUsed },
		{ text=LEVEL, subMenu="PetLevel", group="Level", highlight=rmf.GroupUsed },
		{ text=L["Breed"], hidden=rmf.NotBreedable, subMenu="PetBreed", group="Breed", highlight=rmf.GroupUsed },
		{ text=OTHER, subMenu="PetOther", group="Other", highlight=rmf.GroupUsed },
		{ text=L["Script"], subMenu="ScriptFilters", group="Script", highlight=rmf.GroupUsed },
		{ text=RAID_FRAME_SORT_LABEL, subMenu="PetSort" },
		{ text=L["Favorite Filters"], subMenu="FavoriteFilters" },
		{ text=L["Help"], stay=true, hidden=rmf.HideMenuHelp, icon="Interface\\Common\\help-i", iconCoords={0.15,0.85,0.15,0.85}, tooltipTitle=L["Pet Filter"], tooltipBody=format(L["In addition to the filters in this menu, you can further refine the pet list with the search box. Some search examples:\n\nPets: %sBlack Tabby\124r\nZones: %sSilithus\124r\nAbilities: %sSandstorm\124r\nText in abilities: %sBleed\124r\nLevels: %slevel=21-23\124r\nStats: %sspeed>300\124r\n\nSearches in \"quotes\" will limit results to only complete matches.\n\nSearch results will be sorted by relevance unless the option %sDon't Sort By Relevance\124r is checked in the Options tab."],rematch.hexWhite,rematch.hexWhite,rematch.hexWhite,rematch.hexWhite,rematch.hexWhite,rematch.hexWhite,rematch.hexWhite) },
		{ text=L["Reset All"], func=function() roster:ClearAllFilters(true) end, stay=true },
		{ text=OKAY, noPostFunc=true },
	},rematch.UpdateRoster)

	rematch:RegisterMenu("PetTypes", { -- Filter->Pet Families
		{ title=true, text=PET_FAMILIES },
		{ text=BATTLE_PET_NAME_1, icon=rmf.GetIcon, check=true, group="Types", size=10, var=1, value=rmf.GetValue, func=rmf.ToggleValue },
		{ text=BATTLE_PET_NAME_2, icon=rmf.GetIcon, check=true, group="Types", size=10, var=2, value=rmf.GetValue, func=rmf.ToggleValue },
		{ text=BATTLE_PET_NAME_3, icon=rmf.GetIcon, check=true, group="Types", size=10, var=3, value=rmf.GetValue, func=rmf.ToggleValue },
		{ text=BATTLE_PET_NAME_4, icon=rmf.GetIcon, check=true, group="Types", size=10, var=4, value=rmf.GetValue, func=rmf.ToggleValue },
		{ text=BATTLE_PET_NAME_5, icon=rmf.GetIcon, check=true, group="Types", size=10, var=5, value=rmf.GetValue, func=rmf.ToggleValue },
		{ text=BATTLE_PET_NAME_6, icon=rmf.GetIcon, check=true, group="Types", size=10, var=6, value=rmf.GetValue, func=rmf.ToggleValue },
		{ text=BATTLE_PET_NAME_7, icon=rmf.GetIcon, check=true, group="Types", size=10, var=7, value=rmf.GetValue, func=rmf.ToggleValue },
		{ text=BATTLE_PET_NAME_8, icon=rmf.GetIcon, check=true, group="Types", size=10, var=8, value=rmf.GetValue, func=rmf.ToggleValue },
		{ text=BATTLE_PET_NAME_9, icon=rmf.GetIcon, check=true, group="Types", size=10, var=9, value=rmf.GetValue, func=rmf.ToggleValue },
		{ text=BATTLE_PET_NAME_10, icon=rmf.GetIcon, check=true, group="Types", size=10, var=10, value=rmf.GetValue, func=rmf.ToggleValue },
		{ text=L["Help"], stay=true, hidden=rmf.HideMenuHelp, icon="Interface\\Common\\help-i", iconCoords={0.15,0.85,0.15,0.85}, tooltipTitle=L["Checkbox Groups"], tooltipBody=format(L["In filter menus, checkbox groups assume if nothing is checked you want to view all choices.\n\nYou can also:\n\n%s[Shift]+Click\124r to check all except the box clicked.\n\n%s[Alt]+Click\124r to uncheck all except the box clicked."],rematch.hexWhite,rematch.hexWhite) },
		{ text=RESET, group="Types", stay=true, func=rmf.ResetTypeGroup },
	},rematch.UpdateRoster)

	rematch:RegisterMenu("PetStrong", { -- Filter->Strong Vs
		{ title=true, text=L["Strong Vs"] },
		{ text=BATTLE_PET_NAME_1, icon=rmf.GetIcon, check=true, group="Strong", size=10, var=1, value=rmf.GetValue, func=rmf.ToggleValue },
		{ text=BATTLE_PET_NAME_2, icon=rmf.GetIcon, check=true, group="Strong", size=10, var=2, value=rmf.GetValue, func=rmf.ToggleValue },
		{ text=BATTLE_PET_NAME_3, icon=rmf.GetIcon, check=true, group="Strong", size=10, var=3, value=rmf.GetValue, func=rmf.ToggleValue },
		{ text=BATTLE_PET_NAME_4, icon=rmf.GetIcon, check=true, group="Strong", size=10, var=4, value=rmf.GetValue, func=rmf.ToggleValue },
		{ text=BATTLE_PET_NAME_5, icon=rmf.GetIcon, check=true, group="Strong", size=10, var=5, value=rmf.GetValue, func=rmf.ToggleValue },
		{ text=BATTLE_PET_NAME_6, icon=rmf.GetIcon, check=true, group="Strong", size=10, var=6, value=rmf.GetValue, func=rmf.ToggleValue },
		{ text=BATTLE_PET_NAME_7, icon=rmf.GetIcon, check=true, group="Strong", size=10, var=7, value=rmf.GetValue, func=rmf.ToggleValue },
		{ text=BATTLE_PET_NAME_8, icon=rmf.GetIcon, check=true, group="Strong", size=10, var=8, value=rmf.GetValue, func=rmf.ToggleValue },
		{ text=BATTLE_PET_NAME_9, icon=rmf.GetIcon, check=true, group="Strong", size=10, var=9, value=rmf.GetValue, func=rmf.ToggleValue },
		{ text=BATTLE_PET_NAME_10, icon=rmf.GetIcon, check=true, group="Strong", size=10, var=10, value=rmf.GetValue, func=rmf.ToggleValue },
		{ text=L["Help"], stay=true, hidden=rmf.HideMenuHelp, icon="Interface\\Common\\help-i", iconCoords={0.15,0.85,0.15,0.85}, tooltipTitle=L["Checkbox Groups"], tooltipBody=format(L["In filter menus, checkbox groups assume if nothing is checked you want to view all choices.\n\nYou can also:\n\n%s[Shift]+Click\124r to check all except the box clicked.\n\n%s[Alt]+Click\124r to uncheck all except the box clicked."],rematch.hexWhite,rematch.hexWhite) },
		{ text=RESET, group="Strong", stay=true, func=rmf.ResetTypeGroup },
	},rematch.UpdateRoster)

	rematch:RegisterMenu("PetTough", { -- Filter->Tough Vs
		{ title=true, text=L["Tough Vs"] },
		{ text=BATTLE_PET_NAME_1, icon=rmf.GetIcon, check=true, group="Tough", size=10, var=1, value=rmf.GetValue, func=rmf.ToggleValue },
		{ text=BATTLE_PET_NAME_2, icon=rmf.GetIcon, check=true, group="Tough", size=10, var=2, value=rmf.GetValue, func=rmf.ToggleValue },
		{ text=BATTLE_PET_NAME_3, icon=rmf.GetIcon, check=true, group="Tough", size=10, var=3, value=rmf.GetValue, func=rmf.ToggleValue },
		{ text=BATTLE_PET_NAME_4, icon=rmf.GetIcon, check=true, group="Tough", size=10, var=4, value=rmf.GetValue, func=rmf.ToggleValue },
		{ text=BATTLE_PET_NAME_5, icon=rmf.GetIcon, check=true, group="Tough", size=10, var=5, value=rmf.GetValue, func=rmf.ToggleValue },
		{ text=BATTLE_PET_NAME_6, icon=rmf.GetIcon, check=true, group="Tough", size=10, var=6, value=rmf.GetValue, func=rmf.ToggleValue },
		{ text=BATTLE_PET_NAME_7, icon=rmf.GetIcon, check=true, group="Tough", size=10, var=7, value=rmf.GetValue, func=rmf.ToggleValue },
		{ text=BATTLE_PET_NAME_8, icon=rmf.GetIcon, check=true, group="Tough", size=10, var=8, value=rmf.GetValue, func=rmf.ToggleValue },
		{ text=BATTLE_PET_NAME_9, icon=rmf.GetIcon, check=true, group="Tough", size=10, var=9, value=rmf.GetValue, func=rmf.ToggleValue },
		{ text=BATTLE_PET_NAME_10, icon=rmf.GetIcon, check=true, group="Tough", size=10, var=10, value=rmf.GetValue, func=rmf.ToggleValue },
		{ text=L["Help"], stay=true, hidden=rmf.HideMenuHelp, icon="Interface\\Common\\help-i", iconCoords={0.15,0.85,0.15,0.85}, tooltipTitle=L["Checkbox Groups"], tooltipBody=format(L["In filter menus, checkbox groups assume if nothing is checked you want to view all choices.\n\nYou can also:\n\n%s[Shift]+Click\124r to check all except the box clicked.\n\n%s[Alt]+Click\124r to uncheck all except the box clicked."],rematch.hexWhite,rematch.hexWhite) },
		{ text=RESET, group="Tough", stay=true, func=rmf.ResetTypeGroup },
	},rematch.UpdateRoster)

	rematch:RegisterMenu("PetSources", { -- Filter->Sources
		{ text=BATTLE_PET_SOURCE_1, check=true, group="Sources", size=10, var=1, value=rmf.GetValue, func=rmf.ToggleValue, icon="Interface\\AddOns\\Rematch\\Textures\\sources", iconCoords={0,0.25,0,0.25} },
		{ text=BATTLE_PET_SOURCE_2, check=true, group="Sources", size=10, var=2, value=rmf.GetValue, func=rmf.ToggleValue, icon="Interface\\AddOns\\Rematch\\Textures\\sources", iconCoords={0.25,0.5,0,0.25} },
		{ text=BATTLE_PET_SOURCE_3, check=true, group="Sources", size=10, var=3, value=rmf.GetValue, func=rmf.ToggleValue, icon="Interface\\AddOns\\Rematch\\Textures\\sources", iconCoords={0.5,0.75,0,0.25} },
		{ text=BATTLE_PET_SOURCE_4, check=true, group="Sources", size=10, var=4, value=rmf.GetValue, func=rmf.ToggleValue, icon="Interface\\AddOns\\Rematch\\Textures\\sources", iconCoords={0.75,1,0,0.25} },
		{ text=BATTLE_PET_SOURCE_5, check=true, group="Sources", size=10, var=5, value=rmf.GetValue, func=rmf.ToggleValue, icon="Interface\\AddOns\\Rematch\\Textures\\sources", iconCoords={0,0.25,0.25,0.5} },
		{ text=BATTLE_PET_SOURCE_6, check=true, group="Sources", size=10, var=6, value=rmf.GetValue, func=rmf.ToggleValue, icon="Interface\\AddOns\\Rematch\\Textures\\sources", iconCoords={0.25,0.5,0.25,0.5} },
		{ text=BATTLE_PET_SOURCE_7, check=true, group="Sources", size=10, var=7, value=rmf.GetValue, func=rmf.ToggleValue, icon="Interface\\AddOns\\Rematch\\Textures\\sources", iconCoords={0.5,0.75,0.25,0.5} },
		{ text=BATTLE_PET_SOURCE_8, check=true, group="Sources", size=10, var=8, value=rmf.GetValue, func=rmf.ToggleValue, icon="Interface\\AddOns\\Rematch\\Textures\\sources", iconCoords={0.75,1,0.25,0.5} },
		{ text=BATTLE_PET_SOURCE_9, check=true, group="Sources", size=10, var=9, value=rmf.GetValue, func=rmf.ToggleValue, icon="Interface\\AddOns\\Rematch\\Textures\\sources", iconCoords={0,0.25,0.5,0.75} },
		{ text=BATTLE_PET_SOURCE_10, check=true, group="Sources", size=10, var=10, value=rmf.GetValue, func=rmf.ToggleValue, icon="Interface\\AddOns\\Rematch\\Textures\\sources", iconCoords={0.25,0.5,0.5,0.75} },
		{ text=L["Help"], stay=true, hidden=rmf.HideMenuHelp, icon="Interface\\Common\\help-i", iconCoords={0.15,0.85,0.15,0.85}, tooltipTitle=L["Checkbox Groups"], tooltipBody=format(L["In filter menus, checkbox groups assume if nothing is checked you want to view all choices.\n\nYou can also:\n\n%s[Shift]+Click\124r to check all except the box clicked.\n\n%s[Alt]+Click\124r to uncheck all except the box clicked."],rematch.hexWhite,rematch.hexWhite) },
		{ text=RESET, group="Sources", stay=true, func=rmf.ResetGroup },
	},rematch.UpdateRoster)

	rematch:RegisterMenu("PetRarity", { -- Filter->Rarity
		{ text=rmf.RarityText, check=true, group="Rarity", size=4, var=1, value=rmf.GetValue, func=rmf.ToggleValue },
		{ text=rmf.RarityText, check=true, group="Rarity", size=4, var=2, value=rmf.GetValue, func=rmf.ToggleValue },
		{ text=rmf.RarityText, check=true, group="Rarity", size=4, var=3, value=rmf.GetValue, func=rmf.ToggleValue },
		{ text=rmf.RarityText, check=true, group="Rarity", size=4, var=4, value=rmf.GetValue, func=rmf.ToggleValue },
		{ text=L["Help"], stay=true, hidden=rmf.HideMenuHelp, icon="Interface\\Common\\help-i", iconCoords={0.15,0.85,0.15,0.85}, tooltipTitle=L["Checkbox Groups"], tooltipBody=format(L["In filter menus, checkbox groups assume if nothing is checked you want to view all choices.\n\nYou can also:\n\n%s[Shift]+Click\124r to check all except the box clicked.\n\n%s[Alt]+Click\124r to uncheck all except the box clicked."],rematch.hexWhite,rematch.hexWhite) },
		{ text=RESET, group="Rarity", stay=true, func=rmf.ResetGroup },
	},rematch.UpdateRoster)

	rematch:RegisterMenu("PetLevel", { -- Filter->Level
		{ text=L["Low Level (1-7)"], check=true, group="Level", size=4, var=1, value=rmf.GetValue, func=rmf.ToggleValue },
		{ text=L["Mid Level (8-14)"], check=true, group="Level", size=4, var=2, value=rmf.GetValue, func=rmf.ToggleValue },
		{ text=L["High Level (15-24)"], check=true, group="Level", size=4, var=3, value=rmf.GetValue, func=rmf.ToggleValue },
		{ text=L["Max Level (25)"], check=true, group="Level", size=4, var=4, value=rmf.GetValue, func=rmf.ToggleValue },
		{ spacer=true },
		{ text=L["Without Any 25s"], radio=true, group="Level", radioGroup="Level", var="Without25s", value=rmf.GetValue, func=rmf.ToggleRadio },
		{ text=L["Moveset Not At 25"], radio=true, group="Level", radioGroup="Level", var="MovesetNot25", value=rmf.GetValue, func=rmf.ToggleRadio },
		{ spacer=true },
		{ text=L["Help"], stay=true, hidden=rmf.HideMenuHelp, icon="Interface\\Common\\help-i", iconCoords={0.15,0.85,0.15,0.85}, tooltipTitle=L["Level"], tooltipBody=format(L["You can filter to a specific level or range of levels in the search box. For example, search for:\n\n\%slevel=1\124r\nor\n\%slevel=21-23\124r"],rematch.hexWhite,rematch.hexWhite) },
		{ text=RESET, group="Level", stay=true, func=rmf.ResetGroup },
	},rematch.UpdateRoster)

	rematch:RegisterMenu("PetBreed", { -- Filter->Breed
		{ text=rmf.GetBreedName, check=true, group="Breed", var=1, size=11, value=rmf.GetValue, func=rmf.ToggleValue },
		{ text=rmf.GetBreedName, check=true, group="Breed", var=2, size=11, value=rmf.GetValue, func=rmf.ToggleValue },
		{ text=rmf.GetBreedName, check=true, group="Breed", var=3, size=11, value=rmf.GetValue, func=rmf.ToggleValue },
		{ text=rmf.GetBreedName, check=true, group="Breed", var=4, size=11, value=rmf.GetValue, func=rmf.ToggleValue },
		{ text=rmf.GetBreedName, check=true, group="Breed", var=5, size=11, value=rmf.GetValue, func=rmf.ToggleValue },
		{ text=rmf.GetBreedName, check=true, group="Breed", var=6, size=11, value=rmf.GetValue, func=rmf.ToggleValue },
		{ text=rmf.GetBreedName, check=true, group="Breed", var=7, size=11, value=rmf.GetValue, func=rmf.ToggleValue },
		{ text=rmf.GetBreedName, check=true, group="Breed", var=8, size=11, value=rmf.GetValue, func=rmf.ToggleValue },
		{ text=rmf.GetBreedName, check=true, group="Breed", var=9, size=11, value=rmf.GetValue, func=rmf.ToggleValue },
		{ text=rmf.GetBreedName, check=true, group="Breed", var=10, size=11, value=rmf.GetValue, func=rmf.ToggleValue },
		{ text=NEW, check=true, group="Breed", var=11, size=11, value=rmf.GetValue, func=rmf.ToggleValue },
		{ text=L["Help"], stay=true, hidden=rmf.HideMenuHelp, icon="Interface\\Common\\help-i", iconCoords={0.15,0.85,0.15,0.85}, tooltipTitle=L["Breed"], tooltipBody=function() return format(L["All breed data is pulled from your installed %s%s\124r addon.\n\nThe breed \"New\" categorizes pets with no breed data. Keep your breed addon up to date to see if they have new data."],rematch.hexWhite,GetAddOnMetadata(rematch.breedSource,"Title") or rematch.breedSource) end },
		{ text=RESET, group="Breed", stay=true, func=rmf.ResetTypeGroup },
	},rematch.UpdateRoster)

	rematch:RegisterMenu("PetOther", { -- Filter->Other
		{ text=L["Leveling"], radio=true, group="Other", radioGroup="Leveling", var="Leveling", value=rmf.GetValue, func=rmf.ToggleRadio },
		{ text=L["Not Leveling"], radio=true, group="Other", radioGroup="Leveling", var="NotLeveling", value=rmf.GetValue, func=rmf.ToggleRadio },
		{ spacer=true },
		{ text=L["Tradable"], radio=true, group="Other", radioGroup="Tradable", var="Tradable", value=rmf.GetValue, func=rmf.ToggleRadio },
		{ text=L["Not Tradable"], radio=true, group="Other", radioGroup="Tradable", var="NotTradable", value=rmf.GetValue, func=rmf.ToggleRadio },
		{ spacer=true },
		{ text=L["Can Battle"], radio=true, group="Other", radioGroup="Battle", var="Battle", value=rmf.GetValue, func=rmf.ToggleRadio },
		{ text=L["Can't Battle"], radio=true, group="Other", radioGroup="Battle", var="NotBattle", value=rmf.GetValue, func=rmf.ToggleRadio },
		{ spacer=true },
		{ text=L["One Copy"], radio=true, group="Other", radioGroup="Quantity", var="Qty1", value=rmf.GetValue, func=rmf.ToggleRadio },
		{ text=L["Two+ Copies"], radio=true, group="Other", radioGroup="Quantity", var="Qty2", value=rmf.GetValue, func=rmf.ToggleRadio },
		{ text=L["Three+ Copies"], radio=true, group="Other", radioGroup="Quantity", var="Qty3", value=rmf.GetValue, func=rmf.ToggleRadio },
		{ spacer=true },
		{ text=L["In A Team"], radio=true, group="Other", radioGroup="Team", var="InTeam", value=rmf.GetValue, func=rmf.ToggleRadio },
		{ text=L["Not In A Team"], radio=true, group="Other", radioGroup="Team", var="NotInTeam", value=rmf.GetValue, func=rmf.ToggleRadio },
		{ spacer=true },
		{ text=L["Current Zone"], check=true, group="Other", radioGroup="Zone", var="CurrentZone", value=rmf.GetValue, func=rmf.ToggleRadio },
		{ text=L["Hidden Pets"], check=true, group="Other", radioGroup="Hidden", var="Hidden", value=rmf.GetValue, func=rmf.ToggleRadio },
		{ text=L["Has Notes"], check=true, group="Other", radioGroup="Notes", var="HasNotes", value=rmf.GetValue, func=rmf.ToggleRadio },
		{ spacer=true },
		{ text=RESET, group="Other", stay=true, func=rmf.ResetGroup },
	},rematch.UpdateRoster)

	rematch:RegisterMenu("PetSort", { -- Filter->Sort
		{ text=NAME, radio=true, order=1, var="Order", value=rmf.GetSort, func=rmf.SetSort },
		{ text=LEVEL, radio=true, order=2, var="Order", value=rmf.GetSort, func=rmf.SetSort },
		{ text=RARITY, radio=true, order=3, var="Order", value=rmf.GetSort, func=rmf.SetSort },
		{ text=TYPE, radio=true, order=4, var="Order", value=rmf.GetSort, func=rmf.SetSort },
		{ text=PET_BATTLE_STAT_HEALTH, radio=true, var="Order", order=5, value=rmf.GetSort, func=rmf.SetSort },
		{ text=PET_BATTLE_STAT_POWER, radio=true, var="Order", order=6, value=rmf.GetSort, func=rmf.SetSort },
		{ text=PET_BATTLE_STAT_SPEED, radio=true, var="Order", order=7, value=rmf.GetSort, func=rmf.SetSort },
		{ spacer=true },
		{ text=L["Reverse Sort"], check=true, var="Reverse", value=rmf.GetSort, func=rmf.SetSort },
		{ text=L["Favorites First"], check=true, var="FavoritesFirst", value=rmf.GetSort, func=rmf.SetSort },
		{ spacer=true },
		{ text=L["Help"], stay=true, hidden=rmf.HideMenuHelp, icon="Interface\\Common\\help-i", iconCoords={0.15,0.85,0.15,0.85}, tooltipTitle=L["Sort By"], tooltipBody=format(L["You can filter to a specific range of stats too. For example, search for:\n\n\%shealth>500\124r\nor\n\%sspeed=200-300\124r\n\nThe sort order is not ordinarily reset when filters are reset. The option %sReset Sort With Filters\124r in the Options tab will reset the sort when you reset the filters."],rematch.hexWhite,rematch.hexWhite,rematch.hexWhite) },
		{ text=RESET, stay=true, func=roster.ClearSort },
	},rematch.UpdateRoster)

	rematch:RegisterMenu("FindAbility", {
		{ text=function(entry,abilityID) return (select(2,C_PetBattles.GetAbilityInfoByID(abilityID))) end, title=true },
		{ text=L["Find Pets With This Ability"], func=function(entry,abilityID) rematch:SearchAbility(abilityID) end },
		{ text=CANCEL },
	})
end)

function rmf:GetValue() return roster:GetFilter(self.group,self.var) end
function rmf:GetNotValue() return not roster:GetFilter(self.group,self.var) end
function rmf:ToggleNotValue(subject,checked) roster:SetFilter(self.group,self.var,checked) end
function rmf:GroupUsed() return not roster:IsFilterClear(self.group) end
function rmf:GetIcon() return "Interface\\Icons\\Icon_PetFamily_"..PET_TYPE_SUFFIX[self.var] end
function rmf:ResetGroup() roster:ClearFilter(self.group) end
function rmf:RarityText() return "\124c"..select(4,GetItemQualityColor(self.var-1)).._G["BATTLE_PET_BREED_QUALITY"..self.var] end
function rmf:GetSort() if self.order then return roster:GetSort(self.var)==self.order else return roster:GetSort(self.var) end end
function rmf:SetSort(subject,checked) roster:SetSort(self.var,self.order or not checked) end
function rmf:HideMenuHelp() return settings.HideMenuHelp end


function rmf:ResetTypeGroup()
	if roster:IsFilterUsed(self.group) then
		roster:ClearFilter(self.group)
	else
		roster:ClearFilter("Types")
		roster:ClearFilter("Strong")
		roster:ClearFilter("Tough")
	end
end

function rmf:ToggleValue(subject,checked)
	if IsShiftKeyDown() then -- if shift is held, it will uncheck one being toggled and check all others in group
		for i=1,self.size do
			roster:SetFilter(self.group,i,i~=self.var)
		end
		if self.group=="Level" then -- special handling for level hybrid check/radio group
			roster:ClearRadio("Level","Level")
		end
	elseif IsAltKeyDown() then -- if alt is held, check only one being clicked
		for i=1,self.size do
			roster:SetFilter(self.group,i,i==self.var)
		end
	else
		roster:SetFilter(self.group,self.var,not checked)
		if not checked and self.group=="Level" then
			roster:ClearRadio("Level","Level")
		end
	end
	local typeMode = self.group=="Types" and 1 or self.group=="Strong" and 2 or self.group=="Tough" and 3
	if typeMode then
		rematch.PetPanel:SetTypeMode(typeMode)
	end
	-- if all in group are checked, then uncheck them all
	if roster:IsFilterFull(self.group,self.size) then
		roster:ClearFilter(self.group)
	end
end

-- for radio buttons that can be toggled on/off (Level and Other filter group)
function rmf:ToggleRadio(subject,checked)
	if checked then -- unchecking never affects other radios
		roster:SetFilter(self.group,self.var,nil)
	else
		if self.group=="Level" then
			roster:ClearFilter(self.group)
		else
			roster:ClearRadio(self.group,self.radioGroup)
		end
		roster:SetFilter(self.group,self.var,true)
	end
	if self.var=="CurrentZone" then
		roster:UpdateZoneRegistration()
	end
end

function rmf:GetBreedName()
	if (rematch.breedSource=="BattlePetBreedID" and rematch.BPBIDFormat~=BPBID_Options.format) or #rematch.breedNames==0 then
		rematch:GatherBreedNames()
	end
	return rematch.breedNames[self.var] or ""
end

function rmf:NotBreedable()
	return rematch.breedSource~="BattlePetBreedID" and rematch.breedSource~="PetTracker_Breeds" and rematch.breedSource~="LibPetBreedInfo-1.0"
end

-- returns true if the queue menu should not show
function rmf:IsNotQueuePet()
	local parent = rematch:GetMenuParent():GetParent()
	local queueParent = RematchQueueListScrollFrameScrollChild
	local miniParent = RematchMiniQueueListScrollFrameScrollChild -- needs more scroll
	return settings.QueueActiveSort or (parent~=queueParent and parent~=miniParent and parent:GetParent()~=miniParent)
end

-- returns true if the open menu is for a pet panel pet
function rmf:ForPetPanel()
	local parent = rematch:GetMenuParent():GetParent()
	return parent==RematchPetListScrollFrameScrollChild or parent:GetParent()==RematchPetListScrollFrameScrollChild
end

-- returns true if the petID (can be a speciesID) is hidden
function rmf:PetIsHidden(petID)
	if settings.HiddenPets then
		local speciesID = rematch:GetPetSpeciesID(petID)
		return speciesID and settings.HiddenPets[speciesID]
	end
end

function rmf:ShowHidePetDialog(petID)
	if settings.DontConfirmHidePets then
		roster:SetHidePet(petID,true)
	else
		local speciesID = rematch:GetPetSpeciesID(petID)
		local name = C_PetJournal.GetPetInfoBySpeciesID(speciesID)
		if speciesID and name then
			local dialog = rematch:ShowDialog("HidePet",300,240,L["Hide Pet"],L["Hide this pet?"],YES,function() roster:SetHidePet(petID,true) end,NO)
			dialog.CheckButton:SetPoint("BOTTOMLEFT",48,64)
			dialog.CheckButton.text:SetText(L["Don't Ask When Hiding Pets"])
			dialog.CheckButton:Show()
			dialog.CheckButton:SetScript("OnClick",function(self) settings.DontConfirmHidePets=self:GetChecked() end)
			dialog.Slot:SetPoint("TOPLEFT",12,-32)
			rematch:FillPetSlot(dialog.Slot,petID,true)
			dialog.Slot:Show()
			dialog:ShowText(format(L["Are you sure you want to hide all versions of %s%s\124r?\n\nHidden pets will not show up in the pet list or searches. You can view or unhide these pets in the 'Other' filter."],rematch.hexWhite,name),224,112,"TOPLEFT",dialog.Slot,"TOPRIGHT",6,0)
		end
	end
end

--[[ Favorite Filters menu ]]

-- this should be called whenever the favorite filter data changes (login, saving and deleting)
function rmf:UpdateFavoriteFilterMenu()
	local favs = settings.FavoriteFilters
	local menu = rematch.favoriteFilterMenu
	wipe(menu)
	for i=1,#favs do
		tinsert(menu,{text=favs[i][1],deleteButton=true,index=i,func=rmf.LoadFavoriteFilter,deleteFunc=rmf.DeleteFavoriteFilter})
	end
	if #favs>0 then
		tinsert(menu,{spacer=true})
	end
	tinsert(menu,{text=L["Save Filter"],icon="Interface\\GuildBankFrame\\UI-GuildBankFrame-NewTab",disabled=rmf.FiltersClear,disabledReason=L["A filter must be active before it can be saved."],func=rmf.ShowSaveFilterDialog})
end

-- returns true if all filter groups are clear (excludes search)
function rmf:FiltersClear()
	for filter,filterName in pairs(roster.filterGroups) do
		if roster:IsFilterUsed(filter) then
			return false
		end
	end
	return true
end

function rmf:ShowSaveFilterDialog()
	local dialog = rematch:ShowDialog("SaveFilter",300,242,L["Save Filter"],L["Save this as a favorite filter?"],SAVE,rmf.SaveFilterAccept,CANCEL)
	local text = format(L["Filters: %s%s\124r\n\nChoose a name to use in the Favorite Filters menu:"],rematch.hexWhite,roster:GetFiltersText(true))
	dialog:ShowText(text,260,80,"TOP",0,-36)
	dialog.EditBox:SetPoint("TOP",dialog.Text,"BOTTOM")
	dialog.Accept:Disable() -- need a name entered
	dialog.EditBox:Show()
	dialog.SmallText:SetSize(220,32)
	dialog.SmallText:SetPoint("TOP",dialog.EditBox,"BOTTOM",0,-4)
	dialog.SmallText:SetText(L["Note: Search text and Sort order are not included in the filter."])
	dialog.SmallText:Show()
end

local function copyFilter(source,destination)
	wipe(destination)
	for group,info in pairs(source) do
		destination[group] = {}
		for k,v in pairs(info) do
			destination[group][k] = v
		end
	end
end

-- accept click of the SaveFilter dialog for favorite filters
function rmf:SaveFilterAccept()
	local name = rematch.Dialog.EditBox:GetText()
	if not name or name:len()==0 or rmf:FiltersClear() then return end
	tinsert(settings.FavoriteFilters,{name,{}})
	copyFilter(settings.Filters,settings.FavoriteFilters[#settings.FavoriteFilters][2])
	rmf:UpdateFavoriteFilterMenu()
end

function rmf:LoadFavoriteFilter()
	local menu = settings.FavoriteFilters[self.index][2]
	for group in pairs(roster.filterGroups) do
		if not menu[group] then
			menu[group] = {} -- make sure old filters have each filter group when copying to live filter
		end
	end
	if menu then
		copyFilter(menu,settings.Filters)
	end
end

function rmf:DeleteFavoriteFilter()
	rematch:HideMenu() -- we're here from a button on the menu, wasn't the menu itself really
	local dialog = rematch:ShowDialog("DeleteFilter",300,118,L["Delete Filter"],nil,YES,function() tremove(settings.FavoriteFilters,self.index) rmf:UpdateFavoriteFilterMenu() end,NO)
	dialog:ShowText(format(L["Are you sure you want to delete the filter named %s%s\124r?"],rematch.hexWhite,settings.FavoriteFilters[self.index][1]),240,40,"TOP",0,-36)
end

--[[ Script Filters menu ]]

function rematch:UpdateScriptFilterMenu()
	local scripts = settings.ScriptFilters
	local menu = rematch.scriptFilterMenu
	wipe(menu)
	for i=1,#scripts do
		tinsert(menu,{text=scripts[i][1],index=i,radio=true,value=rmf.IndexIsScript,tooltipBody=rmf.ScriptTooltip,func=rmf.ToggleScript,deleteButton=true,deleteFunc=rmf.DeleteScript,editButton=true,editFunc=rematch.ShowScriptFilterDialog})
	end
	if #scripts>0 then
		tinsert(menu,{spacer=true})
	end
	tinsert(menu,{text=L["New Script"],icon="Interface\\GuildBankFrame\\UI-GuildBankFrame-NewTab",func=rematch.ShowScriptFilterDialog,tooltipBody=L["Create a new pet filter."]})
	tinsert(menu,{text=L["Help"],stay=true,hidden=rmf.HideMenuHelp,icon="Interface\\Common\\help-i",iconCoords={0.15,0.85,0.15,0.85}, tooltipTitle=L["Script Filters"], tooltipBody=L["This allows you to create custom pet filters with a little bit of Lua code. See the reference buttons at the top of the New Script dialog for details.\n\nTo view or edit an existing script, click the Gear icon beside the script in the menu above."]})
	if #scripts>0 then
		tinsert(menu,{text=RESET,group="Script",stay=true,func=rmf.ResetTypeGroup})
	end
end

-- if script has a comment (like this one) as its first line, us it as the tooltip
function rmf:ScriptTooltip()
	local code = settings.ScriptFilters[self.index] and settings.ScriptFilters[self.index][2]
	if code then
		return code:match("^[^%S]?%-%-[^S]?(.-)\n")
	end
end

-- scripts are radio buttons that can be turned off
function rmf:ToggleScript(subject,checked)
	if checked then
		roster:ClearFilter("Script")
	else
		rematch:HideDialog() -- close script dialog potentially open
		roster:SetFilter("Script","code",settings.ScriptFilters[self.index][2])
		roster:SetFilter("Script","name",settings.ScriptFilters[self.index][1])
	end
end

-- returns true if the indexed script's code is the one currently filtered
function rmf:IndexIsScript(subject)
	return settings.ScriptFilters[self.index] and settings.ScriptFilters[self.index][2]==roster:GetFilter("Script","code")
end

-- deleteFunc for script menu item (editFunc is over in ScriptFilter.lua)
function rmf:DeleteScript()
	local dialog = rematch:ShowDialog("DeleteScript",300,118,L["Delete Script"],nil,YES,function() rmf:DeleteScriptConfirm(self.index) end,NO)
	dialog:ShowText(format(L["Are you sure you want to delete the script named %s%s\124r?"],rematch.hexWhite,settings.ScriptFilters[self.index][1]),240,40,"TOP",0,-36)
end

-- from confirmation dialog, not only deletes the script but if the script's code is
-- current active, clears the script filter.
function rmf:DeleteScriptConfirm(index)
	local script = settings.ScriptFilters[index]
	if script then
		local active = roster:GetFilter("Script","code")==script[2] and roster:GetFilter("Script","name")==script[1]
		tremove(settings.ScriptFilters,index)
		if active then
			roster:ClearFilter("Script")
			rematch:UpdateRoster()
		end
		rematch:UpdateScriptFilterMenu()
	end
end