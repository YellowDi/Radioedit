-- Daily Global Check
-- by Jadya
-- EU-Well of Eternity

local lower, format = string.lower, string.format
local addonName, addonTable = ...

local C = addonTable.C
local AddColor = addonTable.AddColor

local quest = DailyGlobalCheck.QuestFunctions

local instance_names = {}

function quest:IsAccountWide(questtype)
 return type(questtype) == "number" and (questtype >= 14 and questtype <= 16)
end

-- special quests completion
-- instance
function quest.instance(instanceID, diff)

 if not instanceID or not diff then return end
 
 local now = time()
 for i = 1, GetNumSavedInstances() do
  local name, _, reset, difficulty, locked, extended, _, isRaid, _, difficultyName, numEncounters, encounterProgress = GetSavedInstanceInfo(i)
  local link = GetSavedInstanceChatLink(i) or ""
  local ID = link:find(":"..instanceID..":")
  if ID and (diff == "all" or difficulty == tonumber(diff)) then
   if (locked or extended) then
    return true, AddColor(encounterProgress.." / "..numEncounters, "LIGHT_GREEN"), reset
   else
    return true, AddColor("["..LFG_LIST_APP_TIMED_OUT.."] "..encounterProgress.." / "..numEncounters, "GRAY"), now + 864000
   end
  end
 end
end

-- instance boss
function quest.boss(instanceID, diff, boss)
 if not instanceID or not diff then return end

 local now = time()
 for i = 1, GetNumSavedInstances() do
  local name, _, reset, difficulty, locked, extended, _, isRaid, _, difficultyName, numEncounters, encounterProgress = GetSavedInstanceInfo(i)
  local link = GetSavedInstanceChatLink(i) or ""
  local ID = link:find(":"..instanceID..":")
  if ID and (diff == "all" or difficulty == tonumber(diff)) then
   if (locked or extended) then
    local _, _, dead = GetSavedInstanceEncounterInfo(i, boss)
	if dead then
     return true, BOSS_DEAD, reset
	end
   end
  end
 end
 return false, AVAILABLE
end
--

-- raid finder instance
function quest.raidfinder(dungeonID, bosses)
 
 if not dungeonID then return end
 
 local suffix = ""
 local total
 local c = 0
 local t = GetLFGDungeonNumEncounters(dungeonID)

 if not t then return false end
 
 for i = 1, t do
  local _, _, killed = GetLFGDungeonEncounterInfo(dungeonID, i)
  if killed then
   c = c + 1
  end
 end

 suffix = bosses and " / "..select("#", strsplit("_", bosses)) or " "..BOSS_DEAD

 if c > 0 then
  return true, AddColor(c..suffix, "LIGHT_GREEN")
 end
end
--

-- currency
function quest.currency(currencyID)
 local name, amount, texturePath, earnedThisWeek, weeklyMax, totalMax, isDiscovered = GetCurrencyInfo(currencyID)
 if not name or name == "" then return false end
 local now = time()
 return true, (totalMax > 0 and (amount.." / "..totalMax) or amount), now + 2592000
end
--

-- achievement
function quest.achievement(achiID)
 if not tonumber(achiID) then return end
 local id, _, _, completed = GetAchievementInfo(achiID)

 if not id then return false, BLIZZARD_STORE_REGION_LOCKED end

 return completed
end
--
-- achievement criteria
function quest.achicriteria(achiID, criteria)
 if not tonumber(achiID) then return end
 local id, _, _, completed = GetAchievementInfo(achiID)

 if not id or not criteria then return false, BLIZZARD_STORE_REGION_LOCKED end

 return completed or select(3, GetAchievementCriteriaInfo(achiID, criteria))
end
--
-- spell
function quest.spell(spellID)
 local result = GetSpellCooldown(spellID)
 return result and (result > 0) or false
end
--
-- multiple questIDs
function quest.multipleor(IDs)
 for i = 1, select("#", strsplit("_", IDs)) do
  local questID = select(i, strsplit("_", IDs))
  questID = tonumber(questID)
  if questID and IsQuestFlaggedCompleted(questID) then
   return true
  end
 end
 return false
end

function quest.multipleand(IDs)
 for i = 1, select("#", strsplit("_", IDs)) do
  local questID = select(i, strsplit("_", IDs))
  questID = tonumber(questID)
  if questID and not IsQuestFlaggedCompleted(questID) then
   return false
  end
 end
 return true
end
--
-- handler
function quest:isquestcompleted(questID)
 local key, arg1, arg2, arg3 = quest:GetSpecialType(questID)
 local r1, r2, r3

 if key and quest[key] then
  r1, r2, r3 = quest[key](arg1, arg2, arg3)
 end
 
 return r1, r2, r3
end

function quest:GetSpecialType(questID)
 if not questID then return end
 
 local key, arg1, arg2, arg3 = strsplit("#", questID)
 key = lower(key)
 if key and quest[key] and type(quest[key]) == "function" then
  return key, arg1, arg2, arg3
 end
end

-- Overlay
-- simple text overlays can be divided in left text and right text by using the ^ separator
function quest:GetOverlayInfo(questID, data)
 local qData = data or DailyGlobalCheck:getQData(questID)

 if not qData then return end
 
 -- quest's overlay info
 if qData[13] then
  if type(qData[13]) == "function" then
   return qData[13](questID, qData)
  else 
   return qData[13]
  end
 end

  -- it's an alt
 if DailyGlobalCheck.selectedpID ~= addonTable.pID then
  local c = DailyGlobalCheck_CharData[DailyGlobalCheck.selectedpID]
  if not c or not c.data or not c.data[questID] then return end
  local _, _, link = strsplit("~", c.data[questID])
  if link == "" or link == "nil" then return end
  return link
 end

 local result
 questID = tostring(questID)

 -- it's the player
 if questID:find("instance#") then -- instance
  local key,arg1,arg2 = strsplit("#", questID)
  for i = 1, GetNumSavedInstances() do
   local name, _, reset, difficulty, locked, extended = GetSavedInstanceInfo(i)
   local link = GetSavedInstanceChatLink(i)
   
   if not link then return end
   
   local ID = link:find(":"..arg1..":")
   if --[[(locked or extended) and ]]ID and (arg2 == "all" or difficulty == tonumber(arg2)) then
    result = link
   end
  end
 elseif questID:find("raidfinder#") then -- raid finder
  local key,arg1,arg2 = strsplit("#", questID)
  
  if not arg1 then return end
    
  result = ""

  if arg2 then
   for i = 1, select("#", strsplit("_", arg2)) do
    local name, _, killed = GetLFGDungeonEncounterInfo(arg1, select(i, strsplit("_", arg2)) or 0)
	local s = AddColor(name, "WHITE")..C.overlay_delimiter2..(killed and AddColor(BOSS_DEAD, "LIGHT_RED") or AddColor(AVAILABLE, "LIGHT_GREEN"))
	result = result..(#result > 0 and C.overlay_delimiter1 or "")..s
   end
  else
   for i = 1, GetLFGDungeonNumEncounters(arg1) do
    local name, _, killed = GetLFGDungeonEncounterInfo(arg1, i)
    local s = AddColor(name, "WHITE")..C.overlay_delimiter2..(killed and AddColor(BOSS_DEAD, "LIGHT_RED") or AddColor(AVAILABLE, "LIGHT_GREEN"))
	result = result..(#result > 0 and C.overlay_delimiter1 or "")..s
   end
  end
 end
 return result
end

function DailyGlobalCheck:OverlayInfoToTooltip(tt, data)
 if type(data) == "string" and data ~= "" then
  local size = select("#", strsplit(C.overlay_delimiter3, data))
  if size > 0 then
   tt:ClearLines()
   for i = 1, size do
    local s = select(i, strsplit(C.overlay_delimiter3, data))
	if s:find("|H(.+)|h") then
     tt:SetHyperlink(s)
	 if i < size then
	  tt:AddLine(" ")
	 end
	elseif s:find("|QR(.+)|qr") then
	 local questID = s:match("\|QR(.+)\|qr")
	 if questID and  GetNumQuestLogRewards(questID) > 0 then
	  tt:SetQuestLogItem("reward", 1, questID)
	 end
    else
	 local t = select("#", strsplit(C.overlay_delimiter1, s))
	 if t > 0 then
	  tt:AddLine(AddColor(GUILDINFOTAB_INFO, "LIGHT_BLUE"))
	  for i = 1, t do
	   local s2 = select(i, strsplit(C.overlay_delimiter1, s))
	   local l, r = strsplit(C.overlay_delimiter2, s2)
       tt:AddDoubleLine(l, r)
	  end
	 end
    end
   end
   return true
  end
 end
end

local function showTooltip(data)
 GameTooltip:SetOwner(DGC_Mainframe, "ANCHOR_NONE")
 GameTooltip:SetPoint("LEFT", DGC_Mainframe, "RIGHT")
 
 if DailyGlobalCheck:OverlayInfoToTooltip(GameTooltip, data) then
  GameTooltip:Show()
 end
end

function quest:ShowOverlay(button)
 local list = DailyGlobalCheck.SelectedList

 showTooltip(button.overlayInfo)
end

function quest:HideOverlay(button)
 GameTooltip:Hide()
end
