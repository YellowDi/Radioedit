--------------------------
-- Battle Pet Daily Tamer.lua
-- Author: CN-阿曼尼-DeathKnight-仁者無敵:YY132359
-- Date: 2017/8/30
-- 宠物对战日常
--------------------------
local _,tamer = ...
local settings
BattlePetDailyTamer = tamer -- global for outside access

tamer.Paws = {} -- frame pool for paws
tamer.QuestsByContinent = {} -- indexed by continent, lits of questIDs to expect on the current map's continent
tamer.IncompleteObjectives = {} -- table of quest objectives in player quest log that are not complete
tamer.InactiveQuests = {} -- lookup table while TrackCompleted is enabled of inactive(greyed out) quests
tamer.LastMapID = nil -- mapID that was last updated
tamer.PawsShown = nil -- becomes true if any paws are shown on the current map
tamer.OpenedMapFrame = nil -- will be either WorldMapFrame or TaxiRouteMap (and eventually FlightMapFrame) 
tamer.MapNeverShown = true -- will become nil when we've checked whether the Darkmoon Faire is in town

-- quest IDs of dailies with objectives (Beasts of Fable and Legion World Quests)
tamer.QuestsWithObjectives = {32604,32868,32869,41935,42165,42190}

--[[	PawInfo describes the paws and the settings that control them.
		[1] = name as it should appear on map options menu/interface options panel
		[2] = name of savedvar key into BattlePetDailyTamerSettings
		[3] = default value of this setting
		[4] = icon
		[5] = red icon color
		[6] = green icon color
		[7] = blue icon color
]]
tamer.PawInfo = {
	{"|cff00ff0025级|r","TrackSatchels",true,"Interface\\AddOns\\Things\\Media\\paw",0.5,1.0,0.25},
	{"|cff69ccf020级|r","TrackNonSatchels",true,"Interface\\AddOns\\Things\\Media\\paw",0.5,0.85,1.0},
	{"|cffff7d0a30级|r","TrackFables",true,"Interface\\AddOns\\Things\\Media\\paw",1.0,0.5,0},
	{"|cffffffff过时|r","TrackCompleted",false,"Interface\\AddOns\\Things\\Media\\paw",0.75,0.75,0.75},
	{"|cffff88CC宠物复活|r","StableMasters",false,"Interface\\Minimap\\Tracking\\Stablemaster",1.0,1.0,1.0},
}

do -- some post-processing of tables in Battle Pet Daily Tamer Coordinates.lua
	-- remove horde quests for alliance players and alliance quests for horde players
	local wrongQuests = {
		["Alliance"] = {[31818]=1,[31854]=1,[31872]=1,[31862]=1,[31819]=1,[31871]=1,[31904]=1,[31908]=1,[31905]=1,[31906]=1,[31907]=1,[32604]=1,[32868]=1,[32869]=1},
		["Horde"] = {[31693]=1,[31780]=1,[31781]=1,[31850]=1,[31852]=1,[31851]=1,[31910]=1,[31911]=1,[31912]=1,[31913]=1,[31914]=1,[32604]=1,[32868]=1,[32869]=1}
	}
	local quests = wrongQuests[UnitFactionGroup("player")]

   -- remove quests from future patches by adding them to wrongQuests
   if select(4,GetBuildInfo())<70300 then
      quests = quests or {}
      quests[47895] = 1 -- environeer bert only one to remove since argus pets are confined to argus map (unviewable before 7.3)
   end

	if quests then -- player could be neutral pandaren; in which case show everything
		-- remove wrong-faction DailyInfo
		for questID in pairs(quests) do
			tamer.DailyInfo[questID] = nil
		end
		-- remove wrong-faction MapCoordinates[0] (azeroth world map)
		for i=#tamer.MapCoordinates[0],1,-1 do
			if quests[tamer.MapCoordinates[0][i][1]] then
				tremove(tamer.MapCoordinates[0],i)
			end
		end
	end
	wrongQuests = nil -- don't need this table anymore
	-- to prevent the need to go through 132+ table entries on every map update, group quests by continent
	for questID,info in pairs(tamer.DailyInfo) do
		local continent = info[3]
		if not tamer.QuestsByContinent[continent] then
			tamer.QuestsByContinent[continent] = {}
		end
		tinsert(tamer.QuestsByContinent[continent],questID)
	end
end

-- this function is a mirror of default's GetWorldLocFromMapPos
-- takes world coordinates and converts them to current map's coordinates
function tamer:GetMapPosFromWorldLoc(y,x)
  local _,left,top,right,bottom = GetCurrentMapZone()
	-- the x-axis is flipped, left and right could be called maxX and minX respectively
  if left and x and x<left and x>right and y>bottom and y<top then
		local mapX = (x-left)/(right-left)
		local mapY = 1-(y-bottom)/(top-bottom)
		if mapX>0.05 and mapX<0.95 and mapY>0.05 and mapY<0.95 then -- only if they're more than 5% from edge
			return mapX,mapY
		end
  end
end

--[[ Event Frame ]]

tamer.frame = CreateFrame("Frame")
tamer.frame:Hide()

tamer.frame:SetScript("OnEvent",function(self,event,...)
	if tamer[event] then
		tamer[event](self,...)
	end
end)
tamer.frame:RegisterEvent("PLAYER_LOGIN")

function tamer:PLAYER_LOGIN()
	tamer:InitializeSettings()
	-- WorldMapFrame_UpdateMap runs when WORLD_MAP_UPDATE happens and the map is on screen
	hooksecurefunc("WorldMapFrame_Update",tamer.WorldMapFrameUpdate)
	-- WorldMapFrame_UpdateMap can trigger in spasms; we do an OnUpdate to only run after a frame of events
	tamer.frame:SetScript("OnUpdate",tamer.UpdatePaws)
	-- when the map closes, reset the LastMapID so an immediate update happens when map is opened
	WorldMapFrame:HookScript("OnHide",tamer.WorldMapOnHide)
	TaxiRouteMap:HookScript("OnHide",tamer.WorldMapOnHide)
	-- for custom tooltip, start monitoring paw mouseover when mouse enters map
	WorldMapButton:HookScript("OnEnter",tamer.WorldMapOnEnter)
	TaxiFrame:HookScript("OnEnter",tamer.WorldMapOnEnter)
	-- tooltip used for getting localized npc/quest names
	tamer.scanTooltip = CreateFrame("GameTooltip","BattlePetDailyTamerScanTooltip",nil,"GameTooltipTemplate")
	tamer.frame:RegisterEvent("TAXIMAP_OPENED")
	tamer:SetupMenu()
end

-- this is called when both WorldMapFrame and TaxiRouteMap hide
function tamer:WorldMapOnHide()
	tamer.LastMapID = nil
	tamer:HideTooltip()
end

function tamer:InitializeSettings()
	if type(BattlePetDailyTamerSettings)~="table" then
		BattlePetDailyTamerSettings = {}
	end
	settings = BattlePetDailyTamerSettings
	-- if a setting is nil it's not been defined, give it a default value (true/false) from PawInfo
	for _,detail in pairs(tamer.PawInfo) do
		if settings[detail[2]]==nil then
			settings[detail[2]] = detail[3]
		end
	end
end

--[[ Paw frame pool ]]

-- returns the first available paw from the frame pool, or creates one if needed
function tamer:GetAvailablePaw()
	for _,paw in ipairs(tamer.Paws) do
		if not paw.used then
			paw.used = true
			return paw
		end
	end
	-- if we reached here, no existing paw is free; create a new one
	local paw = CreateFrame("Frame")
	paw:SetSize(18,18)
	paw.Icon = paw:CreateTexture(nil,"OVERLAY")
	paw.Icon:SetAllPoints(true)
	paw.used = true
	tinsert(tamer.Paws,paw)
	return paw
end

-- frees a paw for re-use in the frame pool
function tamer:ReleasePaw(paw)
	paw.used = nil
	paw:ClearAllPoints()
	paw:Hide()
end

-- gets a paw tailored to the questID (sized/parented/framelevelled for WorldMapButton or TaxiRouteMap if forTaxi true)
function tamer:GetPaw(questID,inactive,forTaxi)
	local paw = tamer:GetAvailablePaw()
	local pawSize = forTaxi and 16 or (1-WorldMapButton:GetEffectiveScale())*10+18
	paw:SetSize(pawSize,pawSize)
	paw:SetParent(forTaxi and TaxiRouteMap or WorldMapButton)

	if questID then
		local pawInfo = tamer.PawInfo[tamer.DailyInfo[questID][9]]
		paw.Icon:SetTexture(pawInfo[4])
		paw.Icon:SetDesaturated(true)
		if not inactive then
			paw.Icon:SetVertexColor(pawInfo[5],pawInfo[6],pawInfo[7])
		else -- inactive quests are greyed out
			paw.Icon:SetVertexColor(0.75,0.75,0.75)
		end
	else
		paw.Icon:SetTexture("Interface\\Minimap\\Tracking\\StableMaster")
		paw.Icon:SetVertexColor(1,1,1,1)
	end

	paw.questID = questID
	paw:Show()
	return paw
end

--[[ WorldMap update ]]

-- returns the currently viewed mapID; both the azeroth world view and cosmic map have a mapID of -1 (grr)
-- so we're arbitrarily calling azeroth world map 0 and cosmic map -1, everything else is their real mapID
function tamer:GetCurrentMapID()
	local mapID = GetCurrentMapAreaID()
	if mapID==-1 then
		return GetCurrentMapContinent()==-1 and -1 or 0
	else
		return mapID
	end
end

-- tamer:WorldMapFrameUpdate() is run immediately after default's WorldMapFrame_Update
-- this can run in short spasms at times, like 8-100+ WORLD_MAP_UPDATEs spread across a few frames
function tamer:WorldMapFrameUpdate()
	if not WorldMapFrame:IsVisible() then
		return -- don't do anything if world map isn't on screen
	end
	-- first remove any default pre-Legion paws shown in WorldMapFrame_UpdateMap
	-- this needs to run every update otherwise default paws would show on screen until delayed UpdatePaws
	for i=1,GetNumMapLandmarks() do
		if GetMapLandmarkInfo(i)==1 then
			_G["WorldMapFramePOI"..i]:Hide()
		end
	end
	-- if map has not yet been shown this session, run a couple checks
	if tamer.MapNeverShown then
		tamer:CheckDMF() -- see if the darkmoon faire is in town (and add it to dailies if so)
		tamer.MapNeverShown = nil
	end
	-- note which map we're updating paws to
	tamer.OpenedMapFrame = WorldMapButton
	-- if this is a different map than we last handled, do an immediate update
	if tamer:GetCurrentMapID()~=tamer.LastMapID then
		tamer:UpdatePaws()
		if tamer.tooltip then
			tamer.tooltip:Hide()
		end
	else -- otherwise wait before doing an update
		tamer.frame.timer = 0
		tamer.frame:Show()
	end
end

-- this is an OnUpdate which runs in reaction to WorldMapFrameUpdate re-running on the same map
function tamer:UpdatePaws(elapsed,forTaxi)
	if elapsed then -- if this was called via OnUpdate, wait 0.5 seconds
		tamer.frame.timer = self.timer + elapsed
		if tamer.frame.timer<0.5 then
			return
		end
	end
	tamer.frame:Hide()
	tamer.LastMapID = tamer:GetCurrentMapID()
	local mapID = tamer.LastMapID
	-- first release all existing paws to get them off the map and freed for re-use
	for _,paw in ipairs(tamer.Paws) do
		tamer:ReleasePaw(paw)
	end
	if not GetCVarBool("showTamers") then
		return -- "Pet Battles" is not checked on the world map tracking button, leave here
	end
	if GetCurrentMapDungeonLevel()~=0 then
		return -- if we're on a dungeon map that happens to overlay WorldLoc of a paw
	end
   if GetCurrentMapAreaID()==1184 then
      return -- if we're looking at Argus map that does not have a map:map representation to closer zoom levels
   end

	-- populate tamer.IncompleteObjectives with quest:objectives that are not done
	wipe(tamer.IncompleteObjectives)
	if settings.TrackFables then
		for _,questID in ipairs(tamer.QuestsWithObjectives) do
			local quest = GetQuestLogIndexByID(questID)
			for i=1,GetNumQuestLeaderBoards(quest) do
				if not select(3,GetQuestLogLeaderBoard(i,quest)) then
					tamer.IncompleteObjectives[questID..":"..i] = 1
				end
			end
		end
	end
	-- whether we're tracking inactive quests or not, clear this before marking any if we're tracking them
	wipe(tamer.InactiveQuests)
	-- the WorldMapButton can change size; fetch its values before placing paws
	local mapWidth = WorldMapButton:GetWidth()
	local mapHeight = WorldMapButton:GetHeight()
	tamer.PawsShown = nil -- assume no paws will be shown
	local trackCompleted = settings.TrackCompleted

	-- if there's a MapCoordinates entry (azeroth world map, maelstrom, etc) show paws from that table
	if tamer.MapCoordinates[mapID] and (GetCurrentMapContinent()~=-1 or mapID==823) then
		for i=1,#tamer.MapCoordinates[mapID] do
			local info = tamer.MapCoordinates[mapID][i]
			local questID,mapX,mapY = info[1],info[2],info[3]
			if tamer:MaybePlacePaw(questID,forTaxi,mapX,mapY,mapWidth,mapHeight) then
				tamer.PawsShown = true
			end
		end
	else
	-- for the majority of zones with no MapCoordinates entry, go through all quests on the current
	-- continent and see if they should be on the current map
		local quests = tamer.QuestsByContinent[GetCurrentMapContinent()]
		if quests then
			for _,questID in ipairs(quests) do
				local info = tamer.DailyInfo[questID]
				local worldX,worldY = info[4],info[5]
				if worldX and worldY then
					local mapX,mapY = tamer:GetMapPosFromWorldLoc(worldX,worldY)
					if mapX then
						if tamer:MaybePlacePaw(questID,forTaxi,mapX,mapY,mapWidth,mapHeight) then
							tamer.PawsShown = true
						end
					end
				end
			end
		end
	end

	-- and place stable masters if any are available for the current zone map
	if settings.StableMasters then
		local stable = tamer.Stables[mapID]
		if stable then
			for i=1,#stable do
				local button = tamer:GetPaw()
				button:SetPoint("CENTER",WorldMapButton,"TOPLEFT",(stable[i][1]/1000)*mapWidth,(stable[i][2]/1000)*mapHeight*-1)
				button:Show()
			end
		end
	end
end

-- if the given quest should be on the map, then place a paw at mapX and mapY and return true
function tamer:MaybePlacePaw(questID,forTaxi,mapX,mapY,mapWidth,mapHeight)
	local show,inactive = tamer:PawNeedsShown(questID)
	if not show then -- if it's not active, then see if it should be shown due to TrackCompleted (now "Inactive Dailies")
		inactive = inactive and settings.TrackCompleted
		if inactive then -- PawNeedsShown agrees it should be shown if TrackCompleted enabled
			tamer.InactiveQuests[questID] = true
		end
	end
	if show or inactive then
		local paw = tamer:GetPaw(questID,inactive,forTaxi)
		if not forTaxi then
			paw:SetPoint("CENTER",WorldMapButton,"TOPLEFT",mapX*mapWidth,mapY*mapHeight*-1)
		else
			local _,_,xoff,yoff = tamer:ConvertMapToTaxi(mapX,mapY)
			paw:SetPoint("CENTER",TaxiRouteMap,"TOPLEFT",xoff,yoff)
		end
		local frameLevelOffset = show and 6 or 4 -- move active paws to a higher framelevel than inactive ones
		paw:SetFrameLevel((forTaxi and TaxiRouteMap:GetFrameLevel()+1 or WorldMapButton:GetFrameLevel()+4)+frameLevelOffset)
		return true
	end
end

-- returns whether a paw should be shown on the map
-- returns two values: whether quest should be shown, whether it should be shown as inactive
function tamer:PawNeedsShown(questID)
	local info = tamer.DailyInfo[questID]
	-- if setting for this type of paw is disabled, paw doesn't need shown
	if not info then
		return -- should never happen but just in case
	end
	local pawInfo = tamer.PawInfo[info[9]]
	if pawInfo and not settings[pawInfo[2]] then
		return false,false
	end
	local mapID = tamer.LastMapID
	
   if info[3]==9 then -- if this is an argus family fighter pet, it's always fightable and should always be shown
      return true,false
	elseif info[3]==8 then -- if this is a broken isle quest
		-- if it's not an active world quest, paw doesn't need shown
		local timeLeft = C_TaskQuest.GetQuestTimeLeftMinutes(questID)
		if not timeLeft or timeLeft==0 then
			return false,mapID~=0 -- do not allow inactive if it's not azeroth world map
		end
		-- if the current mapID is the quest's native mapID then paw doesn't need shown (default shows its own with tooltip and stuff)
		if info[6]==mapID then
			return false,false
		end
	elseif type(questID)=="string" then
		-- if this is a questID:objective and it's not in the IncompleteObjectives table, then it's either complete
		-- or the quest is not picked up; paw doesn't need shown
		if not tamer.IncompleteObjectives[questID] then
			return false,mapID~=0
		end
	else -- this is a regular questID; if quest completed, paw doesn't need shown
		if IsQuestFlaggedCompleted(questID) then
			return false,mapID~=0
		end
	end
	return true,false
end

-- only called once when the map is first shown; if Darkmoon Faire is in town then it will add its dailies
function tamer:CheckDMF()
	local _, month, day, year = CalendarGetDate()
	CalendarSetAbsMonth(month,year)
	-- it seems for holidays we don't need to OpenCalendar()
	local oldDMFcvar = GetCVar("calendarShowDarkmoon")
	SetCVar("calendarShowDarkmoon",true) -- to tell if DMF is on the calendar we need to set this cvar
	for i=1,CalendarGetNumDayEvents(0,day) do
		if CalendarGetHolidayInfo(0,day,i)==CALENDAR_FILTER_DARKMOON then
			-- Darkmoon Faire is in town! Adds it to the dailies
			tamer.DailyInfo[32175]={67370,CALENDAR_FILTER_DARKMOON,0,nil,nil,823,0.479,0.625,1,25,1067,1065,1066} -- Jeremy Feasel
			tamer.DailyInfo[36471]={85519,CALENDAR_FILTER_DARKMOON,0,nil,nil,823,0.474,0.622,1,25,1475,1476,1477} -- Christoph VonFeasel
			tamer.MapCoordinates[823] = {
				{32175,0.47900,0.62500}, -- Jeremy Feasel
				{36471,0.47400,0.62200}, -- Christoph VonFeasel
			}
		end
	end
	SetCVar("calendarShowDarkmoon",oldDMFcvar) -- restore the cvar we set above
end

--[[ Tooltip

	There are two tooltips:
		tamer.scantip (BattlePetDailyTamerScanTooltip) is a GameTooltip for lifting NPC names (and maybe quest names down the road)
		tamer.tooltip (BattlePetDailyTamerTooltip) is a home-made tooltip to float by the cursor with the NPC and opponent pets
]]

function tamer:WorldMapOnEnter()
	if not tamer.tooltipTicker then
		-- tooltipTicker is a separate frame that runs an OnUpdate to monitor what the mouse is over
		tamer.tooltipTicker = CreateFrame("Frame")
		tamer.tooltipTicker:Hide()
		tamer.tooltipTicker:SetScript("OnUpdate",tamer.TooltipTicker)
		tamer.tooltipTicker.timer = 0
		-- tooltip is a custom tooltip that will display tamers beneath the mouse
		tamer.tooltip = CreateFrame("Frame",nil,tamer.tooltipTicker) -- child of above tooltipTicker which has no parent on purpose
		tamer.tooltip.data = {} -- list of entries to show in the tooltip
		tamer.tooltip.Lines = {} -- list of fontstrings to display in the tooltip
		tamer.tooltip:SetBackdrop({bgFile="Interface\\ChatFrame\\ChatFrameBackground",edgeFile="Interface\\ChatFrame\\ChatFrameBackground",edgeSize=2})
		tamer.tooltip:SetBackdropColor(0.1,0.1,0.1)
		tamer.tooltip:SetBackdropBorderColor(0,0,0)
		tamer.tooltip:SetFrameStrata("TOOLTIP")
		tamer.tooltip:SetClampedToScreen(true)
		tamer.tooltip:SetScale(GameTooltip:GetEffectiveScale()) -- make it same scale as regular tooltip
		tamer.tooltip:SetScript("OnUpdate",tamer.PositionTooltip)
	end
	tamer.tooltipTicker:Show()
end

-- 0.2 seconds while the mouse is over the WorldMapButton
function tamer:TooltipTicker(elapsed)
	self.timer = self.timer + elapsed
	if self.timer > 0.2 then
		self.timer = 0
		local found
		if tamer.PawsShown then
			for _,paw in pairs(tamer.Paws) do
				if paw.used and paw.questID and paw:IsVisible() and MouseIsOver(paw) then
					if not found then
						tamer:StartTooltip()
					end
					tamer:AddQuestToTooltip(paw.questID)
					found = true
				end
			end
		end
		if found then
			tamer:ShowTooltip()
		else
			tamer:HideTooltip()
		end
	end
	if not tamer.OpenedMapFrame or not MouseIsOver(tamer.OpenedMapFrame) then
		self:Hide()
	end
end

-- this resets the counters for a new tooltip
function tamer:StartTooltip()
	tamer.tooltip.line = 0
	tamer.tooltip.maxWidth = 0
end

-- adds details about questID to the tooltip, depending on its DailyInfo
function tamer:AddQuestToTooltip(questID)
	local info = tamer.DailyInfo[questID]
	-- if this isn't first quest on the tooltip, add a blank line to space them out
	if tamer.tooltip.line>0 then
		tamer:AddToTooltip("")
	end
	-- add npc name
	local name = info[1]
	if type(name)=="number" then
		name = tamer:GetNameFromNpcID(name)
		if type(name)=="string" then
			info[1] = name
		else
			name = "\124cffff2222"..RETRIEVING_DATA
		end
	end
	local inactive = tamer.InactiveQuests[questID]
	if name and inactive then
		tamer:AddToTooltip(format("\124cffaaaaaa%s (Inactive)",name))
	else
		tamer:AddToTooltip(name)
	end
	local goldFont = inactive and "\124cffaaaaaa" or "\124cffffd200"

	-- add detail like "Beasts of Fable Book II"
	if info[2] then
		tamer:AddToTooltip(((name or inactive) and goldFont or "")..info[2]) -- if no name then don't make detail grey (it will be the "npc name" and gold)
	elseif info[3]==8 then -- if this quest has no detail and it's a Broken Isle quest then fill in quest name for detail
		local quest = tamer:GetNameFromQuestID(questID)
		if quest then
			info[2] = quest
			tamer:AddToTooltip(goldFont..quest)
		end
	end
	-- if a Broken Isle quest, add time left
	if info[3]==8 then
		local timeLeft = C_TaskQuest.GetQuestTimeLeftMinutes(questID)
		if timeLeft>0 then
			local timeString
			local color = "\124cffffd200"
			if timeLeft <= WORLD_QUESTS_TIME_CRITICAL_MINUTES then
				color = "\124cffff4444"
				timeString = SecondsToTime(timeLeft*60)
			elseif timeLeft <= 60 + WORLD_QUESTS_TIME_CRITICAL_MINUTES then
				timeString = SecondsToTime((timeLeft - WORLD_QUESTS_TIME_CRITICAL_MINUTES) * 60)
			elseif timeLeft < 24 * 60 + WORLD_QUESTS_TIME_CRITICAL_MINUTES then
				timeString = D_HOURS:format(math.floor(timeLeft - WORLD_QUESTS_TIME_CRITICAL_MINUTES) / 60)
			else
				timeString = D_DAYS:format(math.floor(timeLeft - WORLD_QUESTS_TIME_CRITICAL_MINUTES) / 1440)
			end
			tamer:AddToTooltip(format("%s%s",color,BONUS_OBJECTIVE_TIME_LEFT:format(timeString)))
		end
	end
	-- add pets
	if not tamer.InactiveQuests[questID] then
		local pets = tamer:GetPetsAsText(info[11],info[12],info[13])
		if pets:len()>0 then
			tamer:AddToTooltip(pets..(info[10] and format(" \124cffcfcfcfLevel %d",info[10]) or ""))
		end
	end
end

-- helper function to convert a variable number of speciesIDs to a string of icons
function tamer:GetPetsAsText(...)
	local txt=""
	for i=1,select("#",...) do
		local speciesID = select(i,...)
		if speciesID then
			local _,_,petType = C_PetJournal.GetPetInfoBySpeciesID(speciesID)
			if petType then
				local petType = format("\124TInterface\\Icons\\Pet_Type_%s:16\124t",PET_TYPE_SUFFIX[petType])
				txt=txt..petType
			end
		end
	end
	return txt
end

-- adds a line of text to the tooltip
function tamer:AddToTooltip(text)
	if text then
		local tooltip = tamer.tooltip
		local line = tooltip.line + 1
		tooltip.line = line
		if not tooltip.Lines[line] then
			tooltip.Lines[line] = tooltip:CreateFontString(nil,"ARTWORK","GameFontHighlight")
			tooltip.Lines[line]:SetPoint("TOPLEFT",6,-6-(line-1)*16)
		end
		tooltip.Lines[line]:SetText(text)
		tooltip.Lines[line]:Show()
		tooltip.maxWidth = max(tooltip.Lines[line]:GetStringWidth(),tooltip.maxWidth)
	end
end

-- when done adding stuff to the tooltip, this will size and show it
function tamer:ShowTooltip()
	local tooltip = tamer.tooltip
	if tooltip.line>0 then
		tamer.tooltip:SetScale(GameTooltip:GetEffectiveScale()) -- in case scale has changed since tooltip created
		tamer.tooltip:SetSize(tooltip.maxWidth+12,tooltip.line*16+10)
		tamer:PositionTooltip()
	end
	for i=tooltip.line+1,#tooltip.Lines do
		tooltip.Lines[i]:Hide()
	end
	tamer.tooltip:Show()
end

function tamer:HideTooltip()
	if tamer.tooltip then
		tamer.tooltip:Hide()
	end
end

-- the OnUpdate of the tooltip will continually reposition the tooltip at the cursor
function tamer:PositionTooltip()
	local x,y = GetCursorPosition()
	local scale = UIParent:GetEffectiveScale()
	tamer.tooltip:SetPoint("BOTTOMRIGHT",UIParent,"BOTTOMLEFT",x/scale-4,y/scale+4)
end

-- takes an npcID and returns the name of the npc
function tamer:GetNameFromNpcID(npcID)
	tamer.scanTooltip:SetOwner(WorldMapButton,"ANCHOR_NONE")
	tamer.scanTooltip:SetHyperlink(format("unit:Creature-0-0-0-0-%d-0000000000",npcID))
	if tamer.scanTooltip:NumLines()>0 then
		local name = BattlePetDailyTamerScanTooltipTextLeft1:GetText()
		tamer.scanTooltip:Hide()
		return name
	end
end

-- like the above for npc names, this will get the name of a quest from its questID
-- except it's only used for broken isle so it will use C_TaskQuest.GetQuestInfoByQuestID
function tamer:GetNameFromQuestID(questID)
	if type(questID)=="string" then
		questID = tonumber(questID:match("^(%d+)"))
	end
	if questID then
		return (C_TaskQuest.GetQuestInfoByQuestID(questID))
	end
end

--[[ Taxi Support

	The new FlightMapFrame for Broken Isle flights is not supported yet;
	its zoom-in feature mostly removes the need but should investigate looking into it more.
]]

tamer.taxiAdjustments = {
  -- The taxi only displays a part of the world map for each continent.
  -- These numbers (tweaked from Homing Digeon by Wobin) are used to
  -- translate a point on the world map to each continent's taxi map
  [1] = { xratio=1.5, yratio=1, xoff=0, yoff=-5 }, -- Kalimdor
  [2] = { xratio=1.4, yratio=.95, xoff=5, yoff=5 }, -- Eastern Kingdom
  [3] = { xratio=1.4, yratio=1, xoff=10, yoff=5 }, -- Outlands
  [4] = { xratio=1.2, yratio=0.75, xoff=15, yoff=-25 }, -- Northrend
  [5] = { xratio=1.0, yratio=1.0, xoff=0, yoff=0 }, -- Maelstrom
  [6] = { xratio=1.3, yratio=0.875, xoff=-10, yoff=0 }, -- Pandaria
  [7] = { xratio=1.35, yratio=0.9, xoff=36, yoff=0 }, -- Draenor
	[8] = { xratio=1.0, yratio=1.0, xoff=0, yoff=0 }, -- Broken Isle (not used yet)
}

-- takes world coordinates and returns taxi coordinates, taxi SetPoint offsets
-- world coordinates must be from current continent's zoom level
function tamer:ConvertMapToTaxi(wx,wy)
  local magic = tamer.taxiAdjustments[GetCurrentMapContinent()]
  local tcx, tcy = TaxiRouteMap:GetSize()
  local tx = tcx/2-tcx*magic.xratio*(.5-wx)+magic.xoff
  local ty = -tcy/2+tcy*magic.yratio*(.5-wy)-magic.yoff
  return tx/tcx,1+ty/tcy,tx,ty
end

-- event handler for TAXIMAP_OPENED (formerly UpdateTaxiPaws)
function tamer:TAXIMAP_OPENED()
	if not TaxiRouteMap:IsVisible() then
		return
	elseif settings.TaxiPaws then
		tamer.OpenedMapFrame = TaxiRouteMap
		-- change map to continent view of the player's current map area
		-- taxi maps look at the whole continent
		tamer.frame:UnregisterEvent("WORLD_MAP_UPDATE")
		local userMap = GetCurrentMapAreaID()
		SetMapToCurrentZone()
	  SetMapZoom(GetCurrentMapContinent())
		tamer:UpdatePaws(nil,true)
		SetMapByID(userMap)
		tamer.frame:RegisterEvent("WORLD_MAP_UPDATE")
		-- bump taxi nodes higher so no paws overlap them (paws should always be beneath taxi nodes)
		local nodeFrameLevel = TaxiRouteMap:GetFrameLevel()+8
		for i=1,NumTaxiNodes() do
			_G["TaxiButton"..i]:SetFrameLevel(nodeFrameLevel)
		end
	else -- no taxi paws, hide all paws
		for _,paw in ipairs(tamer.Paws) do
			tamer:ReleasePaw(paw)
		end
	end
end

--[[ Tracking Button

	To solve the taint caused by using default DropDownMenus, and to better coexist with PetTracker
	which replaces the default menu, this addon makes its own tracking button that slides out
	when the user mouseovers the default world map tracking button.
]]

local ourTrackingButton = BattlePetDailyTamerButton
local mapTrackingButton = WorldMapFrame.UIElementsFrame.TrackingOptionsButton.Button

function tamer:ShowTrackingButton()
	if not ourTrackingButton:IsVisible() then
		ourTrackingButton:Show()
		ourTrackingButton:SetFrameLevel(mapTrackingButton:GetFrameLevel()-2)
		ourTrackingButton.SlideOut:Play()
	end
end

function tamer:HideTrackingButton()
	if ourTrackingButton.SlideOut:IsPlaying() or not mapTrackingButton:IsVisible() then
		ourTrackingButton:Hide() -- if button is still sliding out, hide it right away; don't need to animate
		ourTrackingButton.Menu:Hide() -- hide menu too so it's not up when we show it later
	else
		ourTrackingButton.SlideIn:Play() -- an actual hide happens in the OnFinished of this animation
	end
end

-- this is the OnUpdate for the tracking button
function tamer:TrackingButtonOnUpdate()
	if not MouseIsOver(ourTrackingButton) and not MouseIsOver(mapTrackingButton) and not self.Menu:IsVisible() then
		tamer:HideTrackingButton()
	end
end

-- called only one time during login; sets up the menu stuff that doesn't change
function tamer:SetupMenu()
	local menu = ourTrackingButton.Menu
	menu.Buttons = {}
	local maxWidth = 0
	for i=1,#tamer.PawInfo do
		menu.Buttons[i] = CreateFrame("Button",nil,menu,"BattlePetDailyTamerMenuTemplate")
		local button = menu.Buttons[i]
		button:SetID(i)
		button:SetPoint("TOPLEFT",10,-15-i*16)
		button.Text:SetText(tamer.PawInfo[i][1])
		maxWidth = max(maxWidth,button.Text:GetStringWidth())
		button.Icon:SetTexture(tamer.PawInfo[i][4])
		button.Icon:SetVertexColor(tamer.PawInfo[i][5],tamer.PawInfo[i][6],tamer.PawInfo[i][7])
	end
	menu.Title.Text:SetText("宠物训练师")
	menu.Title:SetNormalFontObject("GameFontNormalSmallLeft")
	menu.Title.Icon:Hide()
	menu.Buttons[0] = menu.Title -- title doubles as one of the menu buttons
	-- make all buttons the maximum width
	for i=0,#tamer.PawInfo do
		menu.Buttons[i]:SetWidth(maxWidth+46)
	end
	-- size of menu never changes during a session
	menu:SetSize(maxWidth+46+24,(#tamer.PawInfo+1)*16+30)
	menu:SetBackdropBorderColor(TOOLTIP_DEFAULT_COLOR.r, TOOLTIP_DEFAULT_COLOR.g, TOOLTIP_DEFAULT_COLOR.b)
	menu:SetBackdropColor(TOOLTIP_DEFAULT_BACKGROUND_COLOR.r, TOOLTIP_DEFAULT_BACKGROUND_COLOR.g, TOOLTIP_DEFAULT_BACKGROUND_COLOR.b)
	-- when we mouseover the default tracking button slide our tracking button out
	mapTrackingButton:HookScript("OnEnter",tamer.ShowTrackingButton)
	-- when the default tracking button hides, hide ours too
	mapTrackingButton:HookScript("OnHide",tamer.HideTrackingButton)
	mapTrackingButton:HookScript("OnClick",function() ourTrackingButton.Menu:Hide() end)
end

-- click of our tracking button toggles our custom menu
function tamer:TrackingButtonOnClick()
	ourTrackingButton.Menu.timer = nil
	ourTrackingButton.Menu:SetShown(not ourTrackingButton.Menu:IsVisible())
	tamer:UpdateMenu()
end

-- updates the checks of each menu item
function tamer:UpdateMenu()
	local enabled -- becomes true if the cvar is enabled
	for i=0,#tamer.PawInfo do
		local button = ourTrackingButton.Menu.Buttons[i]
		local checked
		if i==0 then -- this is the title button; checked is the cvar value
			checked = GetCVarBool("showTamers")
			enabled = checked -- noting this to decide whether to grey out rest of menu items
		else -- this is one of the actual settings; also greys it out if above cvar disabled
			checked = settings[tamer.PawInfo[i][2]]
			button:SetEnabled(enabled)
			button.Check:SetDesaturated(not enabled)
			button.Icon:SetDesaturated(not enabled)
			if not enabled then
				button.Icon:SetVertexColor(0.75,0.75,0.75)
			else
				button.Icon:SetVertexColor(tamer.PawInfo[i][5],tamer.PawInfo[i][6],tamer.PawInfo[i][7])
			end
		end
		if checked then
			button.Check:SetTexCoord(0,0.5,0,0.5)
		else
			button.Check:SetTexCoord(0.5,1,0,0.5)
		end
	end
end

-- click of one of the 7 menu items
function tamer:MenuButtonOnClick()
	local index = self:GetID()
	if index>0 then -- if one of the real settings (id 1+)
		local var = tamer.PawInfo[index][2]
		settings[var] = not settings[var]
	else -- if main title (id 0), enabled/disable tamers
		SetCVar("showTamers",not GetCVarBool("showTamers"))
	end
	tamer:UpdateMenu()
	tamer:UpdatePaws()
end

-- this makes ESC close the menu
function tamer:MenuOnKeyDown(key)
	if key==GetBindingKey("TOGGLEGAMEMENU") then
		self:SetPropagateKeyboardInput(false)
		self:Hide()
	else
		self:SetPropagateKeyboardInput(true)
	end
end

-- when the menu is first shown its timer is nil; only when the mouse moves over
-- the menu does it set a timer of 0; 2 seconds after leaving the menu the menu will hide
-- note this will make menu stay up indefinitely if mouse never enters menu (just like default)
function tamer:MenuOnUpdate(elapsed)
	if MouseIsOver(self) then
		self.timer = 0
	elseif self.timer then
		self.timer = self.timer + elapsed
		if self.timer > 2 then
			self:Hide()
		end
	end
end
