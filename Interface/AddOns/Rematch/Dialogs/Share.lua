local _,L = ...
local rematch = Rematch
local share = RematchDialog.Share
local settings

local rxData = nil -- will be a string built from messages sent from other clients

-- there are two styles of strings:
-- string: "name of team:npcID:pet1:p1a1:p1a2:p1a3:pet2:p2a1:p2a2:p2a3:pet3:p3a1:p3a2:p3a3:P:minHP:allowMM:expectedDD:maxHP:minXP:maxXP:N:notes+"
-- in string format, P:etc are optional, as is N:notes+
-- plain text: "name of team\n(NPC#123)\n1: Name of Pet (1,2,1)\netc"

-- patterns for importing teams from a string
-- (.*) gathers up trailing characters after the pattern; it's "" if empty
local patterns = {
	normal = "^([^\n]-):(%d+):(%d+):(%d+):(%d+):(%d+):(%d+):(%d+):(%d+):(%d+):(%d+):(%d+):(%d+):(%d+):(.*)",
	prefs = "P:(%d+):(%d+):(%d+):(%d+):([%d%.]+):([%d%.]+):(.*)",
	notes = "N:(.+)",
}

-- plain text match() and format() stubs; be very careful that these match!
local importStubs = {
	title_npcID = L["^(.-)%(.-NPC#(%d+)%)"], -- "Team (NPC Name NPC#1234)" or "Team (NPC#1234)"
	allpets_capture = "%s*(1:[^\n]+\n%s*2:[^\n]+\n%s*3:[^\n]+)", -- captures 1: 2: 3: pet section
	pet_with_abilities = L[":([^\n]-)[%(%[]*([12]).([12]).([12])[%)%]]*.-[\n]*"], -- "Name (1,2,1)"
	pet_basic = L[":([^\n]+)"], -- when abilities can't be parsed, try for just a name
	prefs = L["\n%s*Preferred leveling pets: ([^\n]+)%."], -- whole preferences line (%. excludes final .)
	minHP_basic = L["at least (%d+) health"],
	minHP_allowMM = L["or any Magic/Mechanical"],
	minHP_expectedDD = L[".+[,%(](.-)damage expected%)"],
	maxHP = L["at most (%d+) health"],
	minXP = L["at least level ([%d%.]+)"],
	maxXP = L["at most level ([%d%.]+)"],
	leveling_pet = L["^[Ll][Ee][Vv][Ee][Ll][Ii][Nn][Gg] [Pp][Ee][Tt]$"], -- case insensitive compare
	carry_pet = L["^[Cc][Aa][Rr][Rr][Yy] [Pp][Ee][Tt]$"], -- for attempting to import teams not created with rematch
}
local exportStubs = {
	title_npcID_only = L["%s (NPC#%d)"], -- 1=name of npc, 2=npcID
	title_npcID_name = L["%s (%s NPC#%d)"], -- 1=name of team, 2=name of npc, 3=npcID
	pet_basic = L["%d: %s"], -- 1=slot, 2=pet name
	pet_with_abilities = L["%d: %s (%d,%d,%d)"], -- 1=slot, 2=pet name, 3-5=1/2 ability
	prefs = L["Preferred leveling pets: %s."], -- 1=concatenated string of preferences
	minHP_basic = L["at least %d health"], -- 1=minHP
	minHP_allowMM = L["at least %d health (or any Magic/Mechanical)"], -- 1=minHP
	minHP_expectedDD = L["at least %d health (%s damage expected)"], -- 1=minHP, 2=expectedDD text
	minHP_allowMM_expectedDD = L["at least %d health (or any Magic/Mechanical, %s damage expected)"], -- 1=minHP, 2=expectedDD text (", " critical!)
	maxHP = L["at most %d health"], -- 1=maxHP
	minXP = L["at least level %s"], -- 1=minXP
	maxXP = L["at most level %s"], -- 1=maxXP
}

rematch:InitModule(function()
	settings = RematchSettings
	local radios = rematch.Dialog.ConflictRadios
	radios.MakeUnique.text:SetFontObject("GameFontHighlight")
	radios.Overwrite.text:SetFontObject("GameFontHighlight")
	-- stuff for sending/receiving teams
	RegisterAddonMessagePrefix("Rematch")
	rematch:RegisterEvent("CHAT_MSG_ADDON")
	rematch:RegisterEvent("BN_CHAT_MSG_ADDON")
end)

-- returns the sidelined team in plain-text format (or nil if it can't)
function rematch:ConvertSidelineToPlainText()
	local result = {}
	local team,key = rematch:GetSideline()
	if not key then return end -- no team sidelined, leave

	if type(key)=="number" then
		local npcName = rematch:GetNameFromNpcID(key)
		if npcName==team.teamName then -- name of team is same as npcID: "Name of Team (NPC#123)"
			tinsert(result,format(exportStubs.title_npcID_only,npcName,key))
		else -- name of team is different from npcID: "Name of Team (Name of NPC (NPC#123)"
			tinsert(result,format(exportStubs.title_npcID_name,team.teamName,npcName,key))
		end
	else -- named team, no npcID; first line is just the name of the team
		tinsert(result,key)
	end

	tinsert(result,"") -- blank line separating title from rest

	-- pets and abilities (1: Name of Pet (2/2/1)
	for i=1,3 do
		local speciesID, ability1, ability2, ability3 = rematch:ExportPet(team[i],3)
		if speciesID and speciesID~=0 then
			local name = C_PetJournal.GetPetInfoBySpeciesID(speciesID)
			if name then
				if ability3 then
					tinsert(result,format(exportStubs.pet_with_abilities,i,name,ability1,ability2,ability3))
				else
					tinsert(result,format(exportStubs.pet_basic,i,name))
				end
			end
		else
			tinsert(result,format(exportStubs.pet_basic,i,L["Leveling Pet"]))
		end
	end

	-- Preferred leveling pets: at least 700 health (or any magic/mechanical, dragonkin damage expected); at most 1200 health; at least level 5; at most level 24.5.
	if rematch:HasPreferences(team) and not settings.DontIncludePreferences then
		tinsert(result,"")
		local subprefs = {}
		if team.minHP then
			local ddType = team.expectedDD and _G["BATTLE_PET_NAME_"..team.expectedDD]
			if team.allowMM and team.expectedDD then
				tinsert(subprefs,format(exportStubs.minHP_allowMM_expectedDD,team.minHP,ddType))
			elseif team.allowMM and not team.expectedDD then
				tinsert(subprefs,format(exportStubs.minHP_allowMM,team.minHP))
			elseif not team.allowMM and team.expectedDD then
				tinsert(subprefs,format(exportStubs.minHP_expectedDD,team.minHP,ddType))
			else
				tinsert(subprefs,format(exportStubs.minHP_basic,team.minHP))
			end
		end
		if team.maxHP then
			tinsert(subprefs,format(exportStubs.maxHP,team.maxHP))
		end
		if team.minXP then
			tinsert(subprefs,format(exportStubs.minXP,team.minXP))
		end
		if team.maxXP then
			tinsert(subprefs,format(exportStubs.maxXP,team.maxXP))
		end
		-- combine all of the above to "Preferred leveling pets: (stubs separated by a ;)."
		tinsert(result,format(exportStubs.prefs,table.concat(subprefs,"; ")))
	end

	-- notes if any
	if team.notes and not settings.DontIncludeNotes then
		tinsert(result,"")
		tinsert(result,team.notes:trim())
	end

	return table.concat(result,"\n")
end

-- returns sidelined team in string format
function rematch:ConvertSidelineToString()
	local result = {}
	local team,key = rematch:GetSideline()
	if not key then return end
	local name = rematch:GetSidelineTitle()
	tinsert(result,format("%s:",name)) -- name of team
	tinsert(result,format("%s:",type(key)=="number" and key or 0))
	for i=1,3 do
		tinsert(result,rematch:ExportPet(team[i]))
	end
	if rematch:HasPreferences(team) and not settings.DontIncludePreferences then
		tinsert(result,format("P:%s:%s:%s:%s:%s:%s:",
			team.minHP or 0,
			team.allowMM and 1 or 0,
			team.expectedDD or 0,
			team.maxHP or 0,
			team.minXP or 0,
			team.maxXP or 0))
	end
	if team.notes and team.notes:trim()~="" and not settings.DontIncludeNotes then
		tinsert(result,(format("N:%s",team.notes):gsub("\n","\\n")))
	end
	return table.concat(result)
end

--[[ Export Dialog ]]

-- takes a pet table entry (team[1] team[2] or team[3]) and returns it broken down
-- if plain is false: "speciesID:ability1:ability2:ability3:"
-- if plain is true: speciesID, 1, 2, 1
function rematch:ExportPet(pet,plain)
	local speciesID
	local idType = rematch:GetIDType(pet[1])
	if idType=="species" then
		speciesID = pet[1]
	elseif idType=="pet" then
		speciesID = C_PetJournal.GetPetInfoByPetID(pet[1])
		if not speciesID then -- if pet doesn't exist, grab its speciesID
			speciesID = pet[5]
		end
	end
	-- if creating a string, this is simple
	if not plain then
		if speciesID then
			return format("%d:%d:%d:%d:",speciesID,pet[2] or 0,pet[3] or 0,pet[4] or 0)
		else
			return "0:0:0:0:" -- anything we can't interpret is a leveling pet
		end
	end
	-- this is intended for plain text, convert abilities to 1/2 format
	if speciesID then
		local name = C_PetJournal.GetPetInfoBySpeciesID(speciesID)
		if name then
			local info = rematch.info
			wipe(info)
			C_PetJournal.GetPetAbilityList(speciesID,rematch.abilityList,rematch.levelList)
			for j=1,3 do
				if pet[j+1]==rematch.abilityList[j] then
					tinsert(info,1)
				elseif pet[j+1]==rematch.abilityList[j+3] then
					tinsert(info,2)
				else
					tinsert(info,0)
				end
			end
			if #info==3 then
				return speciesID,unpack(info)
			end
		end
	end
	-- if we reached here, this pet is a leveling pet (empty slots get turned into leveling pets)
	return 0,0,0,0
end

function rematch:ShowExportDialog(key,wholeTab)
	local dialog = rematch:ShowDialog("ExportDialog",340,296,wholeTab and L["Export Tab"] or L["Export Team"],nil,nil,nil,OKAY)
	dialog:SetContext("wholeTab",wholeTab) -- if wholeTab is true, all teams in current tab exported
	share:SetPoint("TOP",0,-36)
	share:Show()
	share.TopText:SetText(wholeTab and L["Press Ctrl+C to copy these teams to the clipboard."] or L["Press Ctrl+C to copy this team to the clipboard."])

	dialog.MultiLine:SetSize(280,150)
	dialog.MultiLine:SetPoint("TOP",share.TopText,"BOTTOM",0,-12)
	dialog.MultiLine:Show()

	-- preferences and notes checkboxes
	if not rematch:UpdateShareIncludes(wholeTab) then
		dialog:SetHeight(280)
	else
		dialog.ShareIncludes:SetPoint("TOP",dialog.MultiLine,"BOTTOM",0,-8)
		dialog.ShareIncludes:Show()
	end
	share:FillExportEditBox()
	dialog.MultiLine.EditBox:SetFocus(true)
end

function share:FillExportEditBox()
	local text
	if rematch.Dialog:GetContext("wholeTab") then -- if exporting a whole tab
		local data = {}
		for _,key in pairs(rematch.TeamPanel:GetWorkingList()) do
			rematch:SetSideline(key,RematchSaved[key])
			tinsert(data,rematch:ConvertSidelineToString())
		end
		text = table.concat(data,"\n")
	else -- otherwise export plain or string single team
		text = rematch:GetSidelineContext("plain") and rematch:ConvertSidelineToPlainText() or rematch:ConvertSidelineToString()
	end
	local editBox = rematch.Dialog.MultiLine.EditBox
	if text~=editBox:GetText() then
		editBox:SetText(text)
		editBox:SetCursorPosition(0)
		editBox:HighlightText(0)
	end
	editBox:SetScript("OnTextChanged",share.FillExportEditBox)
end

--[[ Share Includes (checkboxes to Include Preferences and Include Notes) ]]

-- updates the Include Preferences/Notes checkboxes and returns true if notes or preferences
-- are used by the sidelined team (or force is passed); make force true to enable both
-- checkboxes (multi-team export)
function rematch:UpdateShareIncludes(force)
	local incl = rematch.Dialog.ShareIncludes
	incl.IncludePreferences.text:SetText(L["Include Preferences"])
	incl.IncludeNotes.text:SetText(L["Include Notes"])
	incl.IncludePreferences:SetChecked(not settings.DontIncludePreferences)
	incl.IncludeNotes:SetChecked(not settings.DontIncludeNotes)
	local team = rematch:GetSideline()
	local hasPref = force or rematch:HasPreferences(team)
	local hasNotes = force or team.notes and true
	incl.IncludePreferences:SetEnabled(hasPref)
	incl.IncludePreferences.text:SetFontObject(hasPref and "GameFontNormalSmall" or "GameFontDisableSmall")
	incl.IncludeNotes:SetEnabled(hasNotes)
	incl.IncludeNotes.text:SetFontObject(hasNotes and "GameFontNormalSmall" or "GameFontDisableSmall")
	return force or hasNotes or hasPref
end
-- onclick of checkbox will directly change setting
function rematch:ShareIncludeOnClick()
	settings[self.var] = not self:GetChecked()
	if rematch:IsDialogOpen("ExportDialog") then
		share:FillExportEditBox()
	end
end

--[[ Import Dialog ]]

function rematch:ShowImportDialog()
	local dialog = rematch:ShowDialog("ImportDialog",340,306,L["Import Team"],nil,SAVE,share.AcceptImport,CANCEL)
	share:SetPoint("TOP",0,-36)
	share:Show()
	share.TopText:SetText(L["Press Ctrl+V to paste a team from the clipboard."])

	dialog.MultiLine:SetSize(280,150)
	dialog.MultiLine:SetPoint("TOP",share.TopText,"BOTTOM",0,-12)
	dialog.MultiLine:Show()
	dialog.MultiLine.EditBox:SetScript("OnTextChanged",share.ImportEditBoxOnTextChanged)
	dialog.MultiLine.EditBox:SetFocus(true)

	dialog.TabPicker:SetPoint("TOP",dialog.MultiLine,"BOTTOM",0,-12)
	dialog.TabPicker:Show()
	dialog.Accept:Disable()
end

-- returns true if the passed name,npcID form an already-used team key
function share:IsKeyUsed(name,npcID)
	if not npcID or npcID==0 or npcID=="0" then
		return RematchSaved[name] and true
	else
		return RematchSaved[tonumber(npcID)] and true
	end
end

-- if text contains string teams, returns the number of teams and the number of those keys
-- already used for an existing saved team. the first team is sidelined. if gather given
-- as a table, string lines are added to it
function share:TestTextForStringTeams(text,gather)
	text = (text or ""):trim()
	if text=="" then return end
	-- team name:npcID:pet01:p1-a1:p1-a2:p1-a3:pet02:p2-a1:p2-a2:p2-a3:pet03:p3-a1:p3-a2:p3-a3:
	local teams = 0 -- number of teams in this text
	local used = 0 -- number of keys already used by an existing saved team
	for line in text:gmatch("[^\n]+") do
		local name,npcID = line:trim():match(patterns.normal)
		if name then
			if type(gather)=="table" then
				tinsert(gather,line)
			else
				if teams==0 then -- if this is first team, sideline it
					share:ConvertStringToSideline(line)
					rematch.Dialog:SetContext("plain",nil)
				end
				teams = teams+1
				if share:IsKeyUsed(name,npcID) then
					used = used+1
				end
			end
		end
	end
	if teams>0 then
		return teams,used
	end
end

-- after a received team has speciesIDs assigned, this function will go through
-- and convert speciesIDs to the highest level petIDs if they exist.
function share:FindPetIDsForSideline()
	local team = rematch:GetSideline()
	-- find petIDs for the incoming pets
	for i=1,3 do
		if rematch:GetIDType(team[i][1])=="species" then
			local petID = rematch:FindTemporaryPetID(team[i][1],i>1 and team[1][1],i>2 and team[2][1])
			if petID then
				team[i][5] = team[i][1] -- copy speciesID to 5th field if we found a real petID
				team[i][1] = petID -- and put real petID in primary pet slot
			end
		end
	end
end

-- converts a single string to a team on the sideline
-- returns true if conversion successful
function share:ConvertStringToSideline(text)
	if type(text)~="string" then
		return -- no idea what this is, leave!
	end
	-- gather normal pattern (name, npcID, pets, abilities) into info[1] through info[14]
	-- if anything else exists (prefs and notes) it'd be in info[15] to parse afterwards
	info = { text:match(patterns.normal) }
	if #info==0 then
		return -- no match happened, this text is bad
	end
	local name,npcID = info[1],tonumber(info[2])
	local team,key
	if npcID and npcID~=0 then
		team,key = rematch:SetSideline(npcID,{teamName=name})
	else
		team,key = rematch:SetSideline(name,{})
	end
	team.tab = settings.SelectedTab>1 and settings.SelectedTab or nil
	-- copy pets to sidelined team
	for i=1,3 do
		team[i] = {}
		for j=1,4 do
			team[i][j] = tonumber(info[3+(i-1)*4+(j-1)])
		end
	end
	share:FindPetIDsForSideline() -- replace speciesIDs with petIDs
	local leftover = info[15]
	if leftover and leftover~="" then -- maybe preferences or notes included
		-- gather possibly "P:0:0:etc" from remaining part of string, info[7] is leftover afterwards
		info = { leftover:match(patterns.prefs) }
		if info[1] then -- a match means preferences found
			for i=1,#info do
				if info[i]=="0" then
					info[i] = nil -- nil any blank entries P:200:0:0:etc
				end
			end
			team.minHP = tonumber(info[1])
			team.allowMM = info[2]=="1" and true or nil
			team.expectedDD = info[3]~="0" and tonumber(info[3]) or nil
			team.maxHP = tonumber(info[4])
			team.minXP = tonumber(info[5])
			team.maxXP = tonumber(info[6])
			leftover = info[7]
		end
		local notes = leftover:match(patterns.notes)
		if notes then
			team.notes = notes:gsub("\\n","\n")
		end
	end
	return true
end

-- when editbox changes, its contents are tested to see if any teams are in its text
-- the dialog is adjusted based on result
function share:ImportEditBoxOnTextChanged()
	local text = (self:GetText() or ""):trim()
	local numTeams,numConflicts = share:TestTextForStringTeams(text)

	if not numTeams then
		numTeams = share:TestTextForPlainTextTeam(text) -- plain text only supports single teams
	end

	local dialog = rematch.Dialog
	dialog.Accept:SetEnabled(numTeams and numTeams>0)
	dialog:SetContext("numTeams",numTeams)

	if text:len()==0 then -- nothing in editbox, show minimal dialog awaiting input
		dialog.Warning:Hide()
		dialog.Team:Hide()
		dialog.Text:Hide()
		dialog.ConflictRadios:Hide()
		dialog:SetHeight(306)
	elseif not numTeams or numTeams==0 then -- no discernable teams in editbox, show warning only
		dialog.Warning.Text:SetText(L["This is not a recognizable team."])
		dialog.Warning:SetPoint("TOP",dialog.TabPicker,"BOTTOM",0,-4)
		dialog.Warning:Show()
		dialog.Team:Hide()
		dialog.Text:Hide()
		dialog.ConflictRadios:Hide()
		dialog:SetHeight(338)
	elseif numTeams==1 then -- one team is found, show the team
		dialog.Warning:Hide()
		dialog.Team:SetPoint("TOP",dialog.TabPicker,"BOTTOM",0,-28)
		local team,key = rematch:GetSideline()
		dialog:FillTeam(dialog.Team,team)
		dialog.Team:Show()
		dialog:ShowText(rematch:GetSidelineTitle(true),280,20,"TOP",dialog.TabPicker,"BOTTOM",0,-4)
		dialog.Text:SetJustifyH("CENTER")
		if not RematchSaved[key] then
			dialog:SetHeight(410)
			dialog.ConflictRadios:Hide()
		else
			dialog.ConflictRadios:SetPoint("TOP",dialog.Team,"BOTTOM",0,-8)
			dialog.ConflictRadios:Show()
			share:UpdateConflictRadios(format(L["An existing team already has this %s."],type(key)=="number" and L["target"] or L["name"]),L["Create a new copy"],L["Overwrite existing team"])
			dialog:SetHeight(480)
		end
	else -- this is a multi-team import
		dialog.Warning:Hide()
		dialog.Team:Hide()
		dialog:ShowText(format(L["%s%d\124r teams are in this import."],rematch.hexWhite,numTeams),280,20,"TOP",dialog.TabPicker,"BOTTOM",0,-8)
		dialog.Text:SetJustifyH("CENTER")
		if not numConflicts or numConflicts==0 then
			dialog.ConflictRadios:Hide()
			dialog:SetHeight(334)
		else
			dialog.ConflictRadios:SetPoint("TOP",dialog.Text,"BOTTOM",0,-4)
			dialog.ConflictRadios:Show()
			share:UpdateConflictRadios(format(L["%s%d\124r have a name or target already used."],rematch.hexRed,numConflicts),L["Create new copies"],L["Overwrite existing teams"])
			dialog:SetHeight(402)
		end
	end
end

-- sets text (if passed) of radio buttons and updates their checked state
function share:UpdateConflictRadios(text,opt1,opt2)
	local radios = rematch.Dialog.ConflictRadios
	if text then
		radios.Text:SetText(text)
		radios.MakeUnique.text:SetText(opt1)
		radios.Overwrite.text:SetText(opt2)
	end
	radios.MakeUnique:SetChecked(not settings.ConflictOverwrite)
	radios.Overwrite:SetChecked(settings.ConflictOverwrite and true)
end

-- click of either "Create Copy" or "Overwrite Team" radio buttons
function share:ConflictRadioOnClick()
	settings.ConflictOverwrite = self:GetID()==2 and true
	share:UpdateConflictRadios()
end

-- when the Save button is clicked on the import dialog
function share:AcceptImport()
	local numTeams = rematch.Dialog:GetContext("numTeams")
	if numTeams==1 then
		-- if ConflictOverwrite not checked, then make sure sidelined team has a unique key
		if not settings.ConflictOverwrite then
			rematch:MakeSidelineUnique()
		end
		rematch:SetSidelineContext("receivedTeam",true)
		rematch:PushSideline()
		local team,key = rematch:GetSideline()
		rematch:ShowTeam(key)
	elseif numTeams and numTeams>1 then -- multiline import
		if not rematch:GetSidelineContext("plain") then -- importing string format
			local teamStrings = {}
			share:TestTextForStringTeams(rematch.Dialog.MultiLine.EditBox:GetText():trim(),teamStrings)
			for _,line in ipairs(teamStrings) do
				share:ConvertStringToSideline(line)
				if not settings.ConflictOverwrite then
					rematch:MakeSidelineUnique()
				end
				rematch:SetSidelineContext("receivedTeam",true)
				rematch:PushSideline()
			end
		end
	end
end

-- returns 1 (number of teams) if text contains a team in plain text format
function share:TestTextForPlainTextTeam(text)
	text = (text or ""):trim()
	if text=="" then return end
	if not text:match(".-\n%s*1: .-\n%s*2: .-\n%s*3: .+") then
		return -- basic test that it has text in the first line and 1: 2: 3: for pets
	end
	-- name of team (and optional npcID) are in the first line of text
	local name,npcID = text:match(importStubs.title_npcID)
	if not name then
		name = text:match("^(.-)\n") -- whole line is name if npcID not included
	end
	name = name:trim()
	local team,key
	if npcID then
		team,key = rematch:SetSideline(tonumber(npcID),{teamName=name})
	else
		team,key = rematch:SetSideline(name,{})
	end
	team.tab = settings.SelectedTab>1 and settings.SelectedTab or nil
	-- gather pets
	local allpets = text:match(importStubs.allpets_capture)
	if not allpets then
		return -- can't interpret pets, actually
	end
	local abilities,pet = {}
	for i=1,3 do
		pet,abilities[1],abilities[2],abilities[3] = allpets:match(i..importStubs.pet_with_abilities)
		if not pet then -- couldn't match "Pet Name (1,2,1)", try matching just its name
			pet = allpets:match(i..importStubs.pet_basic)
		end
		if pet then
			-- remove anything between extra ()s []s and breeds (P/P P/S etc) (and :!: from warcraftpets guides)
			pet = pet:gsub("%(.-%)",""):gsub("%[.-%]",""):gsub("[BPHS]/[BPHS]",""):gsub(":!:",""):trim()
			if pet:match(importStubs.leveling_pet) or pet:match(importStubs.carry_pet) then
				team[i] = {0,0,0,0} -- this is a leveling pet
			else
				local speciesID = C_PetJournal.FindPetIDByName(pet)
				if speciesID then -- parsed pet has a species ID woot
					team[i] = {speciesID}
				end
			end
		end
		-- any pet that can't be interpreted given a blank entry
		if not team[i] then
			team[i] = {}
		end
		-- if pet has a speciesID and known abilties, add them to pet entry
		if team[i][1] and team[i][1]~=0 and abilities[1] then
			C_PetJournal.GetPetAbilityList(team[i][1],rematch.abilityList,rematch.levelList)
			for j=1,3 do
				team[i][j+1] = rematch.abilityList[abilities[j]=="2" and j+3 or j]
			end
		end
	end
	share:FindPetIDsForSideline() -- replace speciesIDs with petIDs
	-- now look for any preferences
	local prefs = text:match(importStubs.prefs)
	if prefs then

		local function parsenumber(text,pattern)
			local number = text:match(pattern)
			if number then
				number = tonumber(number)
				if number~=0 then -- "0" notes a nil
					return number
				end
			end
		end

		local minHP = parsenumber(prefs,importStubs.minHP_basic) -- prefs:match(importStubs.minHP_basic)
		if minHP then
			team.minHP = tonumber(minHP)
			if prefs:match(importStubs.minHP_allowMM) then
				team.allowMM = true
			end
			local expectedDD = prefs:match(importStubs.minHP_expectedDD)
			if expectedDD then
				expectedDD = expectedDD:trim()
				for i=1,10 do
					if _G["BATTLE_PET_NAME_"..i]==expectedDD then
						team.expectedDD = i
					end
				end
			end
		end
		team.maxHP = parsenumber(prefs,importStubs.maxHP) -- tonumber(prefs:match(importStubs.maxHP) or "")
		team.minXP = parsenumber(prefs,importStubs.minXP) -- tonumber(prefs:match(importStubs.minXP) or "")
		team.maxXP = parsenumber(prefs,importStubs.maxXP) -- tonumber(prefs:match(importStubs.maxXP) or "")
	end
	-- notes are everything after preferences (if they exists) or pets otherwise
	local _,notes
	_,notes = text:match(importStubs.prefs.."(.*)")
	if not notes then
		_,notes = text:match(importStubs.allpets_capture.."\n(.+)")
	end
	if notes and notes:trim()~="" then
		team.notes = notes:trim()
	end
	return 1
end

function share:ExportTeamTab()
	rematch:ShowExportDialog(nil,true)
end

--[[ Send ]]

-- a sideline should be set before calling this; the dialog is re-summoned on accept to show the send status
function rematch:ShowSendDialog()
	local sending = rematch:GetSidelineContext("sending")
	local hasIncludes = rematch:UpdateShareIncludes()
	local height = 250 + (hasIncludes and 16 or 0) + (sending and 26 or 0)
	local dialog = rematch:ShowDialog("SendDialog",300,height,L["Send Team"],nil,L["Send"],share.SendAccept,CANCEL,share.SendCancel)
	dialog:ShowText(rematch:GetSidelineTitle(true),280,32,"TOP",0,-28)
	dialog.Text:SetJustifyH("CENTER")
	dialog.Team:SetPoint("TOP",dialog.Text,"BOTTOM",0,-4)
	local team,key = rematch:GetSideline()
	dialog:FillTeam(dialog.Team,team)
	dialog.Team:Show()
	dialog.Send:SetPoint("TOP",dialog.Team,"BOTTOM",0,-8)
	dialog.Send.TopText:SetText(L["Who do you want to send this team to?"])
	dialog.Send:Show()
	if hasIncludes then
		dialog.ShareIncludes:SetPoint("BOTTOM",0,30)
		dialog.ShareIncludes:Show()
	end
	if sending then -- this dialog is the result of the send button being clicked (or enter hit)
		dialog.Send.EditBox:ClearFocus()
		share:SetSendResult(L["Sending..."],"Interface\\Icons\\Achievement_GuildPerk_GMail",true)
	else -- if this is before send is hit, initialize stuff to be blank
		share:SetSendResult()
		dialog.Send.EditBox:SetText("")
		dialog.Send.EditBox:SetFocus(true)
	end
end

-- if text has any value, displays the text and icon to appear beneath the editbox
-- "Sending..." "Team successfully received!" "They are not online. Send Failed." etc
function share:SetSendResult(text,icon,round)
	local send = rematch.Dialog.Send
	send.ResultIcon:SetShown(text and true)
	send.ResultText:SetShown(text and true)
	if text then
		send.ResultText:SetText(text)
		if round then
			SetPortraitToTexture(send.ResultIcon,icon)
		else
			send.ResultIcon:SetTexture(icon)
		end
	end
end

-- when user hit send (or enter) it will resummon the send dialog with "sending" context true
function share:SendAccept()
	share:SendCancel() -- stop any pending teams being sent
	rematch:SetSidelineContext("sending",true)
	rematch:ShowSendDialog()
	local teamString = rematch:ConvertSidelineToString()
	local recipient = rematch.Dialog.Send.EditBox:GetText()
	if teamString and recipient then
		rematch:SetSidelineContext("recipient",nil)
		rematch:StartTimer("SendTimeout",5,share.SendTimeout)
		-- first step is to figure out who to send this to: bnet or character
		local bnetIDAccount = BNet_GetBNetIDAccount(recipient)
		if bnetIDAccount then
			local bnetIDGameAccount, client = select(6,BNGetFriendInfoByID(bnetIDAccount))
			if bnetIDGameAccount and client=="WoW" then
				rematch:SetSidelineContext("recipient",bnetIDGameAccount)
			end
		end
		if not rematch:GetSidelineContext("recipient") then
			-- recipient is not bnet, we'll send via chat
			rematch:SetSidelineContext("recipient",recipient)
		end
		-- next step is to fill sideline context data table with string(s)
		share:SerializeTeamString(teamString)
		-- first line is sent right away
		share:SendNextLine()
	end
end

-- sends the next line of txData to the recipient; returns the percent of lines sent
function share:SendNextLine()
	local data = rematch:GetSidelineContext("txData")
	local recipient = rematch:GetSidelineContext("recipient")
	if type(data)=="table" and #data>0 and recipient then
		if not rematch:GetSidelineContext("txLines") then
			-- if sending out first line (txLines not defined), set it as the number of lines being sent
			rematch:SetSidelineContext("txLines",#data)
		end
		if #data>0 then
			share:SendMessage(data[1],recipient) -- send top-most line
			tremove(data,1) -- remove first line
			rematch:StartTimer("SendTimeout",5,share.SendTimeout) -- restart timeout timer
		else
			share:SendCancel() -- all done, can stop sending
		end
		return (1-(#data/rematch:GetSidelineContext("txLines")))*100
	end
end

-- called 5 seconds after a send begins; if this isn't cancelled before then, error displayed
-- and send stopped (within SendFailed)
function share:SendTimeout()
	share:SendFailed(L["No response. Lag or they don't have Rematch?"])
end

-- call with a message to indiciate why the send failed
function share:SendFailed(reason)
	share:SetSendResult(reason,"Interface\\RaidFrame\\ReadyCheck-NotReady")
	rematch.Dialog.Send.EditBox:SetFocus(true)
	share:SendCancel()
end

-- when user cancels a send (closing dialog or clicking cancel) or from SendFailed
function share:SendCancel()
	rematch:StopTimer("SendTimeout")
	rematch:SetSidelineContext("sending",nil)
	rematch:SetSidelineContext("recipient",nil)
	rematch:SetSidelineContext("txData",nil)
	rematch:SetSidelineContext("txLines",nil)
end

-- all out-bound communication should go through here
-- sends message to sendTo via BNSendGameData if sendTo is an id (number),
-- regular SendAddonMessage otherwise
function share:SendMessage(message,sendTo)
	if type(sendTo)=="number" then -- this is a bnet id
		BNSendGameData(sendTo,"Rematch",message)
	elseif type(sendTo)=="string" then -- this is a string name
		SendAddonMessage("Rematch",message,"WHISPER",sendTo)
	end
end

-- creates sideline context "txData" as a table of each line to send.
-- if a teamString is less than 253 characters, it only has one line.
-- when a line is incomplete (more are incoming) then it ends with \003.
-- when a line is a continuation (not the first line) then it begins with \002.
-- when an incoming team begins without \002 it should start a new team.
-- when an incoming line ends with \003 it should wait for the next line.
function share:SerializeTeamString(teamString)
	local data = {}
	repeat
		tinsert(data,teamString:sub(1,253))
		teamString = teamString:sub(254)
	until teamString:len()==0
	if #data>1 then -- if more than one line is being sent
		for i=1,#data-1 do
			data[i] = data[i].."\003" -- append \003 byte to end of incomplete lines
		end
		for i=2,#data do
			data[i] = "\002"..data[i] -- prefix \002 to start of continuing lines
		end
	end
	rematch:SetSidelineContext("txData",data)
end

-- handles incoming messages via the regular SendAddonMessage
function rematch:CHAT_MSG_ADDON(prefix,message,_,sender)
	if prefix=="Rematch" then
		share:HandleReceivedMessage(message,sender)
	end
end

-- handles incoming messages via battle.net (sender will be a numeric toonID)
function rematch:BN_CHAT_MSG_ADDON(prefix,message,_,sender)
	if prefix=="Rematch" then
		share:HandleReceivedMessage(message,sender)
	end
end

function share:HandleReceivedMessage(message,sender)
	-- first check whether received message is a response to one we sent out
	if message=="ok" then
		share:SendCancel()
		share:SetSendResult(L["Team successfully received!"],"Interface\\RaidFrame\\ReadyCheck-Ready")
		rematch.Dialog.Send.EditBox:SetFocus(true)
	elseif message=="ack" then -- one line of an incomplete txData received
		local percent = share:SendNextLine() -- send next line and update % in send.Result
		share:SetSendResult(format(L["Sending...%d%%"],percent),"Interface\\Icons\\Achievement_GuildPerk_GMail",true)
	elseif message=="busy" then
		share:SendFailed(L["They're busy. Try again later."])
	elseif message=="combat" then
		share:SendFailed(L["They're in combat. Try again later."])
	elseif message=="block" then
		share:SendFailed(L["They have team sharing disabled."])
	else -- any other messages are unsolicited, likely an incoming team

		-- first check if user able to receive a team
		if settings.DisableShare then
			share:SendMessage("block",sender)
		elseif InCombatLockdown() then
			share:SendMessage("combat",sender)
		elseif rematch.Dialog:IsVisible() then
			share:SendMessage("busy",sender)
		else

			-- lines that do NOT begin with \002 are brand new teams...maybe
			if not message:match("^\002") then
				local name,npcID = message:match(patterns.normal)
				if name then -- this looks like a team woot
					-- we'll convert it to a team once we're sure we have the whole thing
					rxData = message:gsub("\002",""):gsub("\003","")
				end
			else -- this message is a continuation (began with \002), so append it to rxData
				if rxData then
					rxData = rxData..(message:gsub("\002",""):gsub("\003",""))
				end
			end

			-- lines that end with \003 are incomplete. send back an ack and wait
			if message:match("\003$") then -- message is incomplete, send back an ack that it was received
				share:SendMessage("ack",sender)
			else -- lines that don't end with \003 are the final line
				share:SendMessage("ok",sender) -- message fully received
				if share:ConvertStringToSideline(rxData) then
					if type(sender)=="number" then -- for bnet-sent teams, sender is a numeric toonID
						rematch:SetSidelineContext("sender",(select(2,BNGetGameAccountInfo(sender))))
					else -- for regularly sent teams, sender is the name
						rematch:SetSidelineContext("sender",sender)
					end
					rematch:ShowReceiveDialog()
				end
			end
		end
	end
end

--[[ Receive ]]

-- called when a team is received (received team is sidelined in message handling before this is called)
function rematch:ShowReceiveDialog()
	local dialog = rematch:ShowDialog("ReceiveDialog",300,264,L["Incoming Rematch Team!"],L["Save this team?"],SAVE,share.ReceiveAccept,CANCEL)
	local team,key = rematch:GetSideline()
	local sender,form,npcName = rematch:GetSidelineContext("sender") or UNKNOWN
	if type(key)=="number" then -- this is a targeted team
		npcName = rematch:GetNameFromNpcID(key)
		if team.teamName~=npcName then
			form = L["%s%s\124r has sent you a team named \"%s\" (for %s)."]
		else
			form = L["%s%s\124r has sent you a team for %s."]
		end
	else
		form = L["%s%s\124r has sent you a team named \"%s\"."]
	end
	dialog:ShowText(format(form,rematch.hexWhite,sender,rematch:GetSidelineTitle(true),npcName),260,64,"TOP",0,-24)
	dialog.Team:SetPoint("TOP",dialog.Text,"BOTTOM")
	dialog:FillTeam(dialog.Team,team)
	dialog.Team:Show()
	dialog.TabPicker:SetPoint("TOP",dialog.Team,"BOTTOM",0,-12)
	dialog.TabPicker:Show()
	if RematchSaved[key] then
		dialog.ConflictRadios:SetPoint("TOP",dialog.TabPicker,"BOTTOM",0,-8)
		dialog.ConflictRadios:Show()
		share:UpdateConflictRadios(format(L["An existing team already has this %s."],type(key)=="number" and L["target"] or L["name"]),L["Create a new copy"],L["Overwrite existing team"])
		dialog:SetHeight(332)
	end
end

-- when the save button is clicked in the receive dialog
function share:ReceiveAccept()
	if not settings.ConflictOverwrite then
		rematch:MakeSidelineUnique()
	end
	rematch:SetSidelineContext("receivedTeam",true)
	rematch:PushSideline()
	local team,key = rematch:GetSideline()
	rematch:ShowTeam(key)
end

-- when PetBattleTeams is enabled, Team menu has "Import Pet Battle Teams" which calls this
function rematch:ShowImportPBTDialog()
	local dialog = rematch:ShowDialog("ImportPBT",300,130,L["Import From Pet Battle Teams"],L["Import these teams?"],L["Import"],share.ImportPBTAccept,CANCEL)
	local PBTSaved = PetBattleTeamsDB.namespaces.TeamManager.global.teams
	dialog:ShowText(format("%s%d\124r teams in are in Pet Battle Teams.",rematch.hexWhite,#PBTSaved),270,32,"TOP",0,-32)
	dialog.Text:SetJustifyH("CENTER")
	local numConflicts = 0
	for i=1,#PBTSaved do
		if RematchSaved[(PBTSaved[i].name or "Team: "..i)] then
			numConflicts = numConflicts+1
		end
	end
	if numConflicts>0 then
		dialog.ConflictRadios:SetPoint("TOP",dialog.Text,"BOTTOM",0,-4)
		dialog.ConflictRadios:Show()
		share:UpdateConflictRadios(format(L["%s%d\124r Rematch teams have the same name."],rematch.hexRed,numConflicts),L["Create new copies"],L["Overwrite existing teams"])
		dialog:SetHeight(200)
	end
end

-- import button from ImportPBT dialog
function share:ImportPBTAccept()
	local PBTSaved = PetBattleTeamsDB.namespaces.TeamManager.global.teams
	for i=1,#PBTSaved do
		local team,key = rematch:SetSideline(PBTSaved[i].name or "Team: "..i,{})
		team.tab = settings.SelectedTab>1 and settings.SelectedTab or nil
		for j=1,3 do -- add the three pets
			local petID = PBTSaved[i][j].petID
			if petID then
				local hex = petID:match("BattlePet%-(.+)")
				if hex then -- old teams had lower case hex digits
					petID = format("BattlePet-%s",hex:upper())
				end
				if rematch:GetIDType(petID)=="pet" and petID~="BattlePet-0-000000000000" then
					local speciesID = C_PetJournal.GetPetInfoByPetID(petID)
					if not speciesID then -- this is not a valid petID, use its speciesID instead
						speciesID = PBTSaved[i][j].speciesID
						if type(speciesID)=="number" then
							team[j] = {speciesID} -- but there is a speciesID, so use that instead of a petID
						else
							speciesID = nil -- no idea what this is, nil it
						end
					else
						team[j] = {petID} -- petID is valid, use it for the pet
					end
					if team[j] and speciesID then -- a pet was found, add its abilities
						for k=1,3 do
							team[j][k+1] = PBTSaved[i][j].abilities[k]
						end
						team[j][5] = speciesID -- add its speciesID too
					end
				end
			end
			if not team[j] then -- no pet was successfully made for this slot, add a leveling slot
				team[j] = {0,0,0,0}
			end
		end
		if not settings.ConflictOverwrite then
			rematch:MakeSidelineUnique() -- if "Create new copies", make name unique if needed
		end
		rematch:SetSidelineContext("receivedTeam",true)
		rematch:PushSideline() -- and save the team
	end
end

-- does a backup of all teams across all tabs
function rematch:ShowBackupDialog()
	local dialog = rematch:ShowDialog("BackupTeams",340,430,L["Backup All Teams"],nil,nil,nil,OKAY,share.FinishBackup)
	dialog:ShowText(L["Please Wait..."],300,100,"TOP",0,-32)
	dialog.MultiLine:SetSize(280,150)
	dialog.MultiLine:SetPoint("TOP",dialog.Text,"BOTTOM",0,-8)
	dialog.MultiLine:Show()
	dialog.SmallText:SetSize(280,100)
	dialog.SmallText:SetPoint("TOP",dialog.MultiLine,"BOTTOM",0,-8)
	dialog.SmallText:SetText(L["Note: These are just your teams and their notes and preferences. Tab information, sort orders, win records, specific breeds and other settings are not included.\n\nFor the most complete backup of all your addon data, please backup your Word of Warcraft\\WTF folder."])
	dialog.SmallText:Show()

	-- backup these two user settings
	dialog:SetContext("backupDontIncludePreferences",settings.DontIncludePreferences)
	dialog:SetContext("backupDontIncludeNotes",settings.DontIncludeNotes)
	-- and then clear them so we include preferences and notes with all teams
	settings.DontIncludePreferences = nil
	settings.DontIncludeNotes = nil

	dialog:SetContext("backupCurrentTab",1) -- start at first tab
	rematch:StartTimer("BackupTeams",0.1,share.BackupTeamTab) -- and start timer to gather each tab one at a time
end

-- inserts an exported tab into dialog.MultiLine.EditBox
-- to prevent the client locking up from extreme amounts of text inserted into an editbox,
-- we're only adding one tab every 0.1 seconds
function share:BackupTeamTab()
	local dialog = rematch.Dialog
	local tab = dialog:GetContext("backupCurrentTab")
	if tab<=#settings.TeamGroups then
		local out = {}
		if tab>1 then -- add some space between last team of previous tab if this isn't first
			tinsert(out,"\n")
		end
		tinsert(out,format("__ %s __\n",settings.TeamGroups[tab][1]))
		-- first gather all teams for this tab into a scratch table
		local scratch = {}
		for key,team in pairs(RematchSaved) do
			if team.tab==tab or (not team.tab and tab==1) then
				tinsert(scratch,key)
			end
		end
		-- sort the teams in the scratch table
		table.sort(scratch,rematch.TeamSort)

		-- now go through and add each team to the out table
		for _,key in ipairs(scratch) do
			rematch:SetSideline(key,RematchSaved[key])
			local text = rematch:ConvertSidelineToString()
			tinsert(out,text)
		end

		dialog.MultiLine.EditBox:Insert(table.concat(out,"\n"))
		-- move on to the next tab
		dialog:SetContext("backupCurrentTab",tab+1)
		rematch:StartTimer("BackupTeams",0.1,share.BackupTeamTab) -- call this again in 0.1 seconds
	else
		-- we've added all tabs to the dialog; highlight everything and set focus
		dialog.MultiLine.EditBox:SetFocus(true)
		dialog.MultiLine.EditBox:SetCursorPosition(0)
		dialog.MultiLine.EditBox:HighlightText(0)
		dialog.Text:SetText(L["Press Ctrl+C to copy these teams to the clipboard. Then paste them into an email to yourself or a text file someplace safe.\n\nIf you ever need to restore your teams, paste them back in with Import Teams."])
		rematch:StopTimer("BackupTeams")
	end
end

-- called when the backup dialog closes
function share:FinishBackup()
	local dialog = rematch.Dialog
	settings.DontIncludePreferences = dialog:GetContext("backupDontIncludePreferences")
	settings.DontIncludeNotes = dialog:GetContext("backupDontIncludeNotes")
	rematch:StopTimer("BackupTeams")
	settings.BackupCount = rematch:GetNumTeams()
end

function rematch:CheckForBackupReminder()
	if not settings.NoBackupReminder then
		settings.BackupCount = settings.BackupCount or 0
		local numTeams = rematch:GetNumTeams()
		if numTeams>=(settings.BackupCount+50) then
			settings.BackupCount = numTeams -- if they declined, don't ask again until another 50 teams
			local dialog = rematch:ShowDialog("BackupReminder",300,220,L["Backup All Rematch Teams?"],nil,YES,rematch.ShowBackupDialog,NO)
			dialog:ShowText(format(L["You have %s%d\124r Rematch teams.\n\nWould you like to back them up?"],rematch.hexWhite,numTeams),260,48,"TOP",0,-32)
			dialog.SmallText:SetSize(260,72)
			dialog.SmallText:SetPoint("TOP",dialog.Text,"BOTTOM",0,-2)
			dialog.SmallText:SetText(L["Choosing Yes will export all teams to copy and paste in an email to yourself or someplace safe.\n\nYou can also do this at any time from the Teams button at the top of the Teams panel of Rematch."])
			dialog.SmallText:Show()
			dialog.CheckButton:SetPoint("TOPLEFT",dialog.SmallText,"BOTTOMLEFT",24,-2)
			dialog.CheckButton.text:SetText(L["Don't Remind About Backups"])
			dialog.CheckButton:Show()
			dialog.CheckButton:SetScript("OnClick",function(self) settings.NoBackupReminder = self:GetChecked() end)
		end
	end
end
