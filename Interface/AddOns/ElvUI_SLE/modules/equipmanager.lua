local SLE, T, E, L, V, P, G = unpack(select(2, ...))
local EM = SLE:NewModule('EquipManager', 'AceHook-3.0', 'AceEvent-3.0')
local GetRealZoneText = GetRealZoneText
EM.Processing = false

--GLOBALS: CreateFrame, CharacterFrame, SLASH_FISH1, SlashCmdList
local C_EquipmentSet = C_EquipmentSet
local _G = _G
local gsub = gsub

EM.Conditions = {}

local Difficulties = {
	[1] = 'normal', --5ppl normal
	[2] = 'heroic', --5ppl heroic
	[3] = 'normal', --10ppl raid
	[4] = 'normal', --25ppl raid
	[5] = 'heroic', --10ppl heroic raid
	[6] = 'heroic', --25ppl heroic raid
	[7] = 'lfr', --25ppl LFR
	[8] = 'challenge', --5ppl challenge
	[9] = 'normal', --40ppl raid
	[11] = 'heroic', --Heroic scenario
	[12] = 'normal', --Normal scenario
	[14] = 'normal', --10-30ppl normal
	[15] = 'heroic', --13-30ppl heroic
	[16] = 'mythic', --20ppl mythic
	[17] = 'lfr', --10-30 LFR
	[23] = 'mythic', --5ppl mythic
	[24] = 'timewalking', --Timewalking
}

--Table of tags conditions for gear switching
EM.TagsTable = {
	--self explanatory
	["solo"] = function() if T.IsInGroup() then return false; else return true; end end,
	--if in party. Can use [party:size] with size as an argument. If group size equals to provided number. Without number true for any group
	["party"] = function(size)
		size = T.tonumber(size)
		if T.IsInGroup() then
			if size then
				if size == T.GetNumGroupMembers() then return true; else return false; end
			else
				return true
			end
		else
			return false
		end
	end,
	--if in raid. Can use [raid:size] with size as an argument. If raid size equals to provided number. Without number true for any raid
	["raid"] = function(size)
		size = T.tonumber(size)
		if T.IsInRaid() then
			if size then
				if size == T.GetNumGroupMembers() then return true; else return false; end
			else
				return true
			end
		else
			return false
		end
	end,
	--if spec index. Index is required. 1, 2, 3 or 4 (for droodz)
	["spec"] = function(index)
		local index = T.tonumber(index)
		if not index then return false end
		if index == T.GetSpecialization() then return true; else return false; end
	end,
	--Talent selected. [talent:tier/column] 
	["talent"] = function(tier, column)
		local tier, column = T.tonumber(tier), T.tonumber(column)
		if not (tier or column) then return false end
		if tier < 0 or tier > 7 then SLE:Print(T.format(L["SLE_EM_TAG_INVALID_TALENT_TIER"], tier), "error") return false end
		if column < 0 or column > 3 then SLE:Print(T.format(L["SLE_EM_TAG_INVALID_TALENT_COLUMN"], column), "error") return false end
		local _, _, _, selected = T.GetTalentInfo(tier, column, 1)
		if selected then
			return true
		else
			return false
		end
	end,
	--If in instanse. Optional arg [instance:type] - party, raid, scenario
	["instance"] = function(dungeonType)
		local inInstance, InstanceType = T.IsInInstance()
		if inInstance then
			if dungeonType then
				if InstanceType == dungeonType then return true; else return false; end
			else
				if InstanceType == "pvp" or InstanceType == "arena" then return false; else return true; end
			end
		else
			return false
		end
	end,
	--If in pvp zone. [pvp:type] - pvp, arena
	["pvp"] = function(pvpType)
		local inInstance, InstanceType = T.IsInInstance()
		if inInstance then
			if pvpType and (InstanceType == "pvp" or InstanceType == "arena") then
				if InstanceType == pvpType then return true; else return false; end
			else
				if InstanceType == "pvp" or InstanceType == "arena" then return true; else return false; end
			end
		else
			for i = 1, T.GetNumWorldPVPAreas() do
				local _, localizedName, isActive, canQueue = T.GetWorldPVPAreaInfo(i)
				if (T.GetRealZoneText() == localizedName and isActive) or (T.GetRealZoneText() == localizedName and canQueue) then return true end
			end
			return false
		end
	end,
	--Instance difficulty. normal, heroic, etc
	["difficulty"] = function(difficulty)
		if not T.IsInInstance() then return false end
		if not difficulty then return false end
		local difID = T.select(3, T.GetInstanceInfo())
		if difficulty == Difficulties[difID] then
			return true;
		else
			return false;
		end
	end,
	--Well, it's just true :D
	["NoCondition"] = function()
		return true	
	end,
}

--Building up set data
function EM:BuildingConditions(option)
	if not option then return end --if no condition string is passed, return
	local pattern = "%[(.-)%]([^;]+)"
	local SetInfo = {
		["options"] = {}, --tag/args combos for set
		["set"] = "", --Set name
	}
	local condition
	while option:match(pattern) do --If matched that means eligible condition tag is found, e.g. [tag:arg]
		condition, option = option:match(pattern)
		if not(condition and option) then return end
		T.tinsert(SetInfo.options, condition)
	end
	SetInfo.set = option:gsub("^%s*", "")
	T.tinsert(EM.Conditions, SetInfo)
end

--Function to setup a table of calls for conditions provided by user
function EM:TagsProcess(msg)
	if msg == "" then return end --No conditions were passed. Whya the hell this module is even enabled then?!
	T.twipe(EM.Conditions)
	local MsgSections = { (";"):split(msg) } --Splitting message (e.g. option line) to short parts by a separator symbol ";"

	--Cycling through table to add conditions contained in every section to the table
	for i, v in T.ipairs(MsgSections) do
		local section = MsgSections[i]
		EM:BuildingConditions(section)
	end
	--Going trought conditions to build actual function calls into conditions table
	for i = 1, #EM.Conditions do
		local SetInfo = EM.Conditions[i]
		if #SetInfo.options == 0 then --if number of options (tag/arg combos) is 0 this means that's the last "if everything else failed type of call.
			SetInfo.options[1] = {commands = {{condition = "NoCondition", args = {}}}}
		else
			for index = 1, #SetInfo.options do
				local condition = SetInfo.options[index] --Getting the string
				local ConditionList = { (","):split(condition) } --Making it to a set of conditions to check
				local CommandsInfo = {} --Table for functions to check + arguments to pass
				for j = 1, #ConditionList do
					local tagString = ConditionList[j]; --Getting the full tag "tag:args"
					if tagString then --If it exists. Otherwise how the fuck it happened to be in the table in the first place, but better be safe than sorry.
						local command, argument = (":"):split(tagString) --Split actual core tag from arguments
						local argTable = {} --List of arguments to pass later
						if argument and T.find(argument, "%.") then --If dot is found then warn the user of a typo. This is a high class establishment, we use commas here.
							SLE:Print(L["SLE_EM_TAG_DOT_WARNING"], "error")
						else
							if argument and ("/"):split(argument) then --if tag happened to have 2+ argumants
								local former
								while argument and ("/"):split(argument) do
									former, argument = ("/"):split(argument)
									T.tinsert(argTable, former)
								end
							else
								T.tinsert(argTable, argument)
							end

							--Find the tag in provided tag list
							local tag = command:match("^%s*(.+)%s*$")
							if EM.TagsTable[tag] then --If tag is registered, add stuff to the table
								T.tinsert(CommandsInfo, { condition = command:match("^%s*(.+)%s*$"), args = argTable })
							else
								--We don't use that kind of tag in this neighborhood
								SLE:Print(T.format(L["SLE_EM_TAG_INVALID"], tag), "error")
								--Wipe the table and stop executing cause since one tag is wrong the string will fail to execute anyways
								T.twipe(EM.Conditions)
								return
							end
						end
					end
				end
				--Raplce general info with determained function calls and arguments
				SetInfo.options[index] = {commands = CommandsInfo}
			end
		end
	end
end

--Checking if some tag condition is true for the provided conditions table
function EM:TagsConditionsCheck(data)
	for index,tagInfo in T.ipairs(data) do 
		for _, option in T.ipairs(tagInfo.options) do
			if not option.commands then return end --if for some unimaginable reason this is missing, better stop doing everything
			local matches = 0 --Number of conditions passed in this tag check
			for conditionIndex,conditionInfo in T.ipairs(option.commands) do
				--Getting function that determines if condition is met
				local tagFunc = conditionInfo["condition"]
				--If tag contains nil (tho previous checks should have this covere already) or not actually a function
				if not EM.TagsTable[tagFunc] or T.type(EM.TagsTable[tagFunc]) ~= "function" then
					SLE:Print(T.format(L["SLE_EM_TAG_INVALID"], tagFunc), "error")
					return nil
				end
				--Getting arguments table and use it to call a tag check
				local args = conditionInfo["args"]
				local result = EM.TagsTable[tagFunc](T.unpack(args))
				--if check returns true then we have a match
				if result then 
					matches = matches + 1
				else
					matches = 0
					break 
				end
				--if every check matches then this condition is met, returning result
				if matches == #option.commands then return tagInfo.set end
			end
		end
	end
end

--Equipping stuff
local function Equip(event)
	--If equip is in process or lock button is checked, then return
	if EM.Processing or EM.lock then return end
	--Only equip stuff on first load
	if event == "PLAYER_ENTERING_WORLD" then EM:UnregisterEvent(event) end
	--If zone changed and option for only swap on talent change is enabled, then return
	if (event == "ZONE_CHANGED" or event == "LOADING_SCREEN_DISABLED") and EM.db.onlyTalent then return end
	EM.Processing = true

	--Usualy it takes around a second to equip everything
	E:Delay(1, function() EM.Processing = false end)
	--Don't try to equip in combat. it wouldn't work anyways
	if T.InCombatLockdown() then
		EM:RegisterEvent("PLAYER_REGEN_ENABLED", Equip)
		return
	end
	if event == "PLAYER_REGEN_ENABLED" then
		EM:UnregisterEvent(event)
	end

	--Figuring out the hell should be equipped
	local equippedSet
	local equipmentSetIDs = C_EquipmentSet.GetEquipmentSetIDs()
	--If any actual equip set is on
	for index = 1, C_EquipmentSet.GetNumEquipmentSets() do
		local name, _, _, isEquipped = C_EquipmentSet.GetEquipmentSetInfo(equipmentSetIDs[index]);
		if isEquipped then --Set found, leaving
			equippedSet = name
			break
		end
	end
	--What actually should be equipped, based on tags
	local trueSet = EM:TagsConditionsCheck(EM.Conditions)
	--If something should be equipped
	if trueSet then
		--Get id
		local SetID = C_EquipmentSet.GetEquipmentSetID(trueSet)
		if SetID then
			--If it is not what's equipped right now, then put it on.
			if not equippedSet or (equippedSet and trueSet ~= equippedSet) then
				C_EquipmentSet.UseEquipmentSet(SetID)
			end
		else
			--if id of specifiet set is not peresent (e.g. no set named like trueSet exists), you should probably revisit your tag line
			SLE:Print(T.format(L["SLE_EM_SET_NOT_EXIST"], trueSet), "error")
		end
	end
end

--Creating a lock button. Prevents gear from auto equip
function EM:CreateLock()
	if _G["SLE_Equip_Lock_Button"] or not EM.db.lockbutton then return end
	local button = CreateFrame("Button", "SLE_Equip_Lock_Button", CharacterFrame)
	button:Size(20, 20)
	button:Point("BOTTOMLEFT", _G["CharacterFrame"], "BOTTOMLEFT", 4, 4)
	button:SetFrameLevel(_G["CharacterModelFrame"]:GetFrameLevel() + 2)
	button:SetScript("OnEnter", function(self)
		_G["GameTooltip"]:SetOwner(self)
		_G["GameTooltip"]:AddLine(L["SLE_EM_LOCK_TOOLTIP"])
		_G["GameTooltip"]:Show()
	end)
	button:SetScript("OnLeave", function(self)
		_G["GameTooltip"]:Hide() 
	end)
	E:GetModule("Skins"):HandleButton(button)

	button.TitleText = button:CreateFontString(nil, "OVERLAY")
	button.TitleText:FontTemplate()
	button.TitleText:SetPoint("BOTTOMLEFT", button, "TOPLEFT", 0, 0)
	button.TitleText:SetJustifyH("LEFT")
	button.TitleText:SetText(L["SLE_EM_LOCK_TITLE"])

	button.Icon = button:CreateTexture(nil, "OVERLAY")
	button.Icon:SetAllPoints()
	button.Icon:SetTexture([[Interface\AddOns\ElvUI_SLE\media\textures\lock]])
	button.Icon:SetVertexColor(0, 1, 0)

	button:SetScript("OnClick", function()
		EM.lock = not EM.lock
		button.Icon:SetVertexColor(EM.lock and 1 or 0, EM.lock and 0 or 1, 0)
	end)
end

function EM:UpdateTags()
	EM:TagsProcess(EM.db.conditions)
	Equip()
end

function EM:Initialize()
	EM.db = E.private.sle.equip
	EM.lock = false
	if not SLE.initialized then return end
	if not EM.db.enable then return end
	self:RegisterEvent("PLAYER_ENTERING_WORLD", Equip)
	self:RegisterEvent("LOADING_SCREEN_DISABLED", Equip)
	self:RegisterEvent("ACTIVE_TALENT_GROUP_CHANGED", Equip)
	self:RegisterEvent("ZONE_CHANGED", Equip)

	--Initial apply options
	EM:TagsProcess(EM.db.conditions)

	self:CreateLock()
end

SLE:RegisterModule(EM:GetName())
