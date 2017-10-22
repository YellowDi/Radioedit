-- Daily Global Check
-- by Jadya
-- EU-Well of Eternity

local addonName, addonTable = ...

local L = addonTable.L
local C = addonTable.C
local Z = DailyGlobalCheck.Z

DailyGlobalCheck.WorldQuests = {}
local WQ = DailyGlobalCheck.WorldQuests

WQ.Data   = {}
 
WQ.ItemClass = setmetatable({}, { __index = function(t, k)
												 local class = select(12, GetItemInfo(k))
												 if class then
												  t[k] = class
												  return class
												 end
												end})

-- TagInfo
WQ.TagInfo   = setmetatable({}, { __index = function(t, k)
                                               local tag, name, type, rarity, isElite = GetQuestTagInfo(k)
                                               t[k] = {tag, name, type, rarity, isElite}
											   return t[k]
											  end})
--[[
 1  tag
 2  name
 3  type
 4  rarity
 5  isElite
    
 6  gold reward
 7  {currencyName, currencyTexture, currencyID}
 8  itemID
 9  factionID
 10 item reward type ("artifact_power", ...)
]]
--
 
local timer_force_update = 5
local lowest_timer, timer_end, timer
local zone_indexes = {
                      [1015] = 1,
                      [1018] = 2,
                      [1024] = 3,
                      [1017] = 4,
                      [1033] = 5,
                      [1014] = 6,
                      [1096] = 7,
                      [1021] = 8,
                      [1135] = 9,
                      [1171] = 10,
                      [1170] = 11,
					 }

local function isquestcompleted(questID)
 if IsQuestFlaggedCompleted(questID) then return true end
 -- (tag_info[questID][8] or "")
 return false, SecondsToTime((C_TaskQuest.GetQuestTimeLeftMinutes(questID) or 0) * 60)
end

local function remove_from_lists_order(questID)
 for _,v in pairs(WQ.lists) do
  for _,order in pairs(v.Order) do
   for _,quests in pairs(order) do
    local i = 2
    while i < #quests do
     if quests[i] == questID then
      tremove(quests, i)
     else
      i = i + 1
     end
    end
   end
  end
 end
end

local function removeQuest(questID)
 WQ.Data[questID] = nil
 WQ.TagInfo[questID] = nil
 remove_from_lists_order(questID)
 DGCEventFrame:Fire("WORLD_QUEST_REMOVED", questID)
end

local function quick_update()
 WQ.Update()
 WQ.quick_update_timer = nil
end

local tmp = 0
local remove_cache = {}
local function checkMap(mapID)

 if not WQ.initialized then
  print("Daily Global Check - World Quests module not initialized")
  return
 end

 local result
 
 wipe(remove_cache)
 local timeLeftMinutes
 for k in pairs(WQ.Data) do
  timeLeftMinutes = C_TaskQuest.GetQuestTimeLeftMinutes(k)
  if not timeLeftMinutes or timeLeftMinutes == 0 then
   remove_cache[k] = true
  end
 end
 
 for k in pairs(remove_cache) do
  removeQuest(k)
  result = true
 end
 
 local t = C_TaskQuest.GetQuestsForPlayerByMapID(mapID)
 if t then
  for k,v in pairs(t) do
  
   timeLeftMinutes = C_TaskQuest.GetQuestTimeLeftMinutes(v.questId)

   --if timeLeftMinutes > WORLD_QUESTS_TIME_CRITICAL_MINUTES then
   if timeLeftMinutes > 0 then
   
    if lowest_timer > timeLeftMinutes then
     lowest_timer = timeLeftMinutes
    end
    
    local title, factionID = C_TaskQuest.GetQuestInfoByQuestID(v.questId)
        
    if not WQ.Data[v.questId] then
     --WQ.Data[v.questId] = {v.questId.." "..Z[mapID], title, [6] = 0, [10] = isquestcompleted, [12] = true}
     WQ.Data[v.questId] = {Z[mapID], title, [6] = 0, [10] = isquestcompleted, [12] = true}
     WQ.Data[v.questId].questID = v.questId
     result = true
    end
    local info = WQ.TagInfo[v.questId]
    local overlay

    local pref = (info[4] == LE_WORLD_QUEST_QUALITY_RARE or info[4] == LE_WORLD_QUEST_QUALITY_EPIC) and WORLD_QUEST_QUALITY_COLORS[info[4]].hex or ""
  
    local last = info[6]
    info[6] = GetQuestLogRewardMoney(v.questId) or 0
    if info[6] > 0 then
     pref = "|Tinterface\\moneyframe\\UI-GoldIcon:12|t"
     overlay = GetCoinTextureString(info[6])
     if info[6] ~= last then
      result = true
     end
    end

    info[9] = factionID
    local numQuestCurrencies = GetNumQuestLogRewardCurrencies(v.questId)
    if numQuestCurrencies >= 1 then
     overlay = ""
     for i = 1, numQuestCurrencies do
      local cname, ctexture, num = GetQuestLogRewardCurrencyInfo(i, v.questId)
      if cname then
       if not info[7] then
        info[7] = {cname, ctexture, num}
        result = true
       elseif info[7][1] ~= cname or info[7][3] ~= num then
        info[7][1] = cname
        info[7][2] = ctexture
        info[7][3] = num
        result = true
       end
       pref = "|T"..ctexture..":12|t"
       overlay = overlay..C.overlay_delimiter1..BONUS_OBJECTIVE_REWARD_WITH_COUNT_FORMAT:format(ctexture, num, cname)
      end
     end
    end
   
    local mapData
    if not v.floor or v.floor == 0 then
     mapData = WQ.Data[v.questId][5]
     
     if not mapData then
      mapData = {}
      WQ.Data[v.questId][5] = mapData
      result = true
     end
     
     mapData[1] = mapID
     mapData[2] = v.x * 100
     mapData[3] = v.y * 100
    end
   
    -- inquisitor tivos portal icon
    if v.questId == 43611 or v.questId == 42631 then
     WQ.Data[v.questId][6] = nil
     mapData[5] = mapID
     mapData[6] = 26.81
     mapData[7] = 49.06
     mapData[8] = {desc="Legion Portal", icon="interface\\minimap\\vehicle-silvershardmines-arrow"}
    end

    if cname then
     --pref = pref.."|T"..ctexture..":12|t"
     pref = pref.."|TInterface\\Icons\\Tracking_FindTimber:12|t"
    end
   
   
   	if not HaveQuestRewardData(v.questId) then
	 C_TaskQuest.RequestPreloadRewardData(v.questId)
     if not WQ.quick_update_timer then
      tmp = tmp + 1
      WQ.quick_update_timer = C_Timer.NewTimer(5, quick_update)
     end
    else
     local numRewards = GetNumQuestLogRewards(v.questId)
     if numRewards > 0 then
      for i = 1, numRewards do
       local itemName, itemTexture, quantity, quality, isUsable, itemID = GetQuestLogRewardInfo(i, v.questId)
       if itemName then
       
        if info[8] ~= itemID then result = true end
        info[8] = itemID
        WQ.Data[v.questId].itemID = itemID
        overlay = "|QR"..v.questId.."|qr"
        if IsArtifactPowerItem(itemID) then
         pref = pref.."|T1394892:12|t"
         info[10] = "artifact_power"
        elseif info[8] == 124124 then
         pref = pref.."|T1417744:12|t"
        end
       else
--[[        if not WQ.quick_update_timer then
         --print("force update in 5")
         WQ.quick_update_timer = C_Timer.NewTimer(5, quick_update)
        end
        ]]
       end
      end
    
     if info[3] == LE_QUEST_TAG_TYPE_PET_BATTLE then
      pref = pref.."|Tspells\\Paw_Green:12|t"
     elseif info[3] == LE_QUEST_TAG_TYPE_PVP then
      pref = pref.."|TInterface\\PvpFrame\\Icon-Combat:12|t"
     end
   
     if info[5] then
      if info[3] == LE_QUEST_TAG_TYPE_DUNGEON then
       pref = pref.."|TInterface\\Minimap\\Vehicle-AllianceWarlockPortal:12|t"
      else
       pref = pref.."|TInterface\\TargetingFrame\\UI-TargetingFrame-Skull:12|t"
      end
     end
    end
   end
   
    WQ.Data[v.questId][3] = pref
    WQ.Data[v.questId][13] = overlay
   end
  end
 end

 return result
end

local function set_timer(t)
 
 local now = time()
 local gap = t > timer_force_update and (t * 60 + 90) or t

 if now + gap >= timer_end then return end

 if timer then
  timer:Cancel()
 end

 timer = C_Timer.NewTimer(gap, WQ.Update)
 timer_end = now + gap
end

local c = 0
function WQ:Update()
 c = c + 1
 local prev_mapID = GetCurrentMapAreaID()
 local prev_dungeonID = GetCurrentMapDungeonLevel()
 local prev_cont
 if not prev_mapID or prev_mapID < 0 or prev_mapID == 751 then
  prev_cont = GetCurrentMapContinent()
 end

 WorldMapFrame:UnregisterEvent("WORLD_MAP_UPDATE")

 lowest_timer = 9999
 for k in pairs(zone_indexes) do
  SetMapByID(k)
  checkMap(k)
 end
 
 if prev_cont then
  SetMapZoom(prev_cont)
 else
  SetMapByID(prev_mapID)
  
  if prev_dungeonID > 0 then
   SetDungeonMapLevel(prev_dungeonID)
  end
 end

 WorldMapFrame:RegisterEvent("WORLD_MAP_UPDATE")

 if lowest_timer < 9999 then
  set_timer(lowest_timer)
 end
 
 DGCEventFrame:Fire("WORLD_QUESTS_UPDATE")
end

function WQ:UpdateCurrentMap()
 lowest_timer = 9999

 if checkMap(GetCurrentMapAreaID()) then
  set_timer(lowest_timer)
  DGCEventFrame:Fire("WORLD_QUESTS_UPDATE")
 end
end

local last_update = {}
local function worldmap_update()

 if not WorldMapButton:IsVisible() then return end

 if WQ.update_needed then
  WQ.update_needed = nil
  WQ:Update()
 end
 
 local now = time()
 local mapID = GetCurrentMapAreaID()
 
 if zone_indexes[mapID] and (not last_update[mapID] or last_update[mapID] + 5 < now) then
  WQ:UpdateCurrentMap()
  last_update[mapID] = now
 end
end

function WQ:Initialize(list)

 if not WQ.lists then WQ.lists = {} end
 if list and not tContains(WQ.lists, list) then
  WQ.lists[#WQ.lists + 1] = list
 end

 if WQ.initialized then return end

 timer_end = time() + 9999
 WQ.Active = {}
 
 WQ.initialized = true
 WQ.update_needed = true
 
 C_Timer.After( 5, WQ.Update)
 C_Timer.After(10, WQ.Update)
 C_Timer.After(20, WQ.Update)
 C_Timer.After(30, WQ.Update)
 C_Timer.After(40, WQ.Update)
 C_Timer.After(60, WQ.Update)
 
 local wq_eventframe = CreateFrame("Frame")
 wq_eventframe:RegisterEvent("WORLD_MAP_UPDATE")
 wq_eventframe:SetScript("OnEvent", worldmap_update)
end


