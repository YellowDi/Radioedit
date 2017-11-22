local _
local ADDON, private = ...
local NOP = LibStub("AceAddon-3.0"):GetAddon(ADDON)
function NOP:Verbose(...) -- if verbose then output
  if NOP.DB.verbose then self.printt(...) end
end
function NOP.printt(...) -- add time-stamp and addon name to output
  print((private.PRINT_HEAD):format(ElvUI and "" or ("[" .. date("%H:%M") .. "]"),ADDON),...)
end
function NOP:OnInitialize() -- app initialize
  self:InitEvents() -- register events
  self:ProfileLoad() -- initialize AceDB
  self:OptionsLoad() -- initialize AceConfig
  self.scanFrame = self:TooltipCreate(private.TOOLTIP_SCAN)
  self.itemFrame = self:TooltipCreate(private.TOOLTIP_ITEM)
  self.spellFrame = self:TooltipCreate(private.TOOLTIP_SPELL) -- /run NOP.spellFrame = NOP:TooltipCreate("NOP_TOOLTIP_SPELL")
end
function NOP:OnEnable()
  local Masque = LibStub("Masque", true)
  self.masque = Masque and Masque:Group(ADDON) -- when user has installed Masque addon, then skinnig is done by Masque
end
function NOP:TooltipCreate(name) -- create tooltip frame
  local frame
  if _G[name] and _G[name].SetOwner then -- test if frame exist, workaround for broken tooltip, no need create new tooltip frame, reuse old one
    frame = _G[name]
  else
    frame = CreateFrame("GameTooltip",name,nil,"GameTooltipTemplate") -- create new frame
  end
  frame:SetOwner(UIParent,"ANCHOR_NONE") -- frame out of screen and start updating
  return frame
end
local itemRetry = nil
function NOP:ItemLoad() -- load template item tooltips
  self.itemLoadRetry = self.itemLoadRetry - 1 -- only limited retries
  if self.itemLoadRetry < 0 then self.itemLoad = true; self.printt("ItemLoad:","retry limit reached! Last not seen itemID", itemRetry); return; end -- no more retry
  self:Profile(true)
  local retry = false
  local nCB = tonumber(GetCVar(private.CB_CVAR)) -- if colorblind mode activated then on 2nd line there is extra info
  for itemID, data in pairs(NOP.T_RECIPES) do
    if not NOP.T_RECIPES_FIND[itemID] then -- need fill pattern
      local name = GetItemInfo(itemID) -- query or fill client side cache
      if name == nil then -- item has no info on client side yet, let wait for server
        if (private.LOAD_RETRY - self.itemLoadRetry) > 1 then self:Verbose("ItemLoad:","itemID",itemID,"GetItemInfo(itemID) empty") end
        itemRetry = itemID
        retry = true
      else
        self.itemFrame:ClearLines() -- clean tooltip frame
        self.itemFrame:SetItemByID(itemID)
        local count = self.itemFrame:NumLines()
        if count > 1 then -- I must have at least 2 lines in tooltip
          local c,pattern = unpack(data,1,2)
          if type(pattern) == "number" then
            if count >= pattern then
              local i = pattern + nCB
              local tooltipText = private.TOOLTIP_ITEM .. "TextLeft" .. i
              local text = _G[tooltipText].GetText and _G[tooltipText]:GetText() or "none"
              if text and (text ~= "none") then NOP.T_RECIPES_FIND[itemID] = {c,text,data[3],data[4]} end
            end
          elseif type(pattern) == "string" then
            local tooltipText = private.TOOLTIP_ITEM .. "TextLeft" .. 1
            local heading = _G[tooltipText]:GetText()
            if heading then -- look in 1st line
              local compare = gsub(heading,pattern,"%1")
              if (compare ~= heading) then
                NOP.T_RECIPES_FIND[itemID] = {c,compare,data[3],data[4]}
              end
            end
          end
        else
          self:Verbose("ItemLoad:Empty tooltip", itemID)
          itemRetry = itemID
          retry = true
          self.itemFrame = self:TooltipCreate(private.TOOLTIP_ITEM) -- empty tooltip I just throw out old one. Workaround for bad tooltip frame init damn Blizzard!
          break
        end
      end
    end
  end
  self:Profile(false)
  if retry then 
    self.timerItemLoad = self:ScheduleTimer("ItemLoad", private.TIMER_IDLE)
    return
  end -- postspone
  self.itemLoad = true
  if (private.LOAD_RETRY - self.itemLoadRetry) > 1 then self:Verbose("ItemLoad:",string.format(private.L["Items cache update run |cFF00FF00%d."],private.LOAD_RETRY - self.itemLoadRetry)) end
  self.itemLoadRetry = private.LOAD_RETRY
end
local spellRetry = nil
function NOP:SpellLoad() -- load spell patterns
  self.spellLoadRetry = self.spellLoadRetry - 1
  if self.spellLoadRetry < 0 then self.spellLoad = true; self.printt("SpellLoad:","retry limit reached! Last not seend spell on itemID", spellRetry); return end
  self:Profile(true)
  local retry = false
  NOP.T_OPEN[format("%s %s",ITEM_SPELL_TRIGGER_ONUSE,ITEM_OPENABLE)] = {{1,private.PRI_OPEN},nil,nil} -- standard right click open
  NOP.T_OPEN[ITEM_OPENABLE] = {{1,private.PRI_OPEN},nil,nil} -- standard right click open
--[[
  for spellid, data in pairs(NOP.T_SPELL_BY_USE_TEXT) do -- [spellID] = {{count_to_use,priotity},itemID,{"sub-Zone",...},{[mapID]=true,...}}, table for opening via spell, used for multiple items with same spell text
    if data and data[2] then
      local name = GetItemInfo(data[2]) -- query or fill client side cache
      if name == nil then -- item has no info on client side yet, let wait for server
        if (private.LOAD_RETRY - self.spellLoadRetry) > 1 then self:Verbose("SpellLoad:","data[2]",data[2],"GetItemInfo(data[2]) is empty") end
        spellRetry = data[2]
        retry = true
      else
        self.spellFrame:ClearLines() -- clean tooltip frame
        self.spellFrame:SetSpellByID(spellid) -- Fills the tooltip with information about a spell specified by ID
        local spellName, spellRank, spellID = self.spellFrame:GetSpell() -- Returns information about the spell displayed in the tooltip
        local count = self.spellFrame:NumLines()
        if spellName then -- it has spell and tooltip has at least 2 lines
          local tooltipText = private.TOOLTIP_SPELL .. "TextLeft" .. count
          if _G[tooltipText] and _G[tooltipText].GetText then
            local spell = _G[tooltipText]:GetText() -- get last line from tooltip
            if spell ~= nil and spell ~= "" then
              NOP.T_OPEN[format("%s %s",ITEM_SPELL_TRIGGER_ONUSE,spell)] = {data[1],data[3],data[4]} -- ["tooltip-string"] = {{count_to_use,priority},{"sub-ZoneName","sub-ZoneName"},{[mapID]=true,[mapID]=true}}, items by open-spell in tooltip
            end
          end
        else
          spellRetry = data[2] .. " spellID " .. spellid
          retry = true -- this is problem in tooltip frame! Workaround for bad tooltip frame init damn Blizzard!
          if (count < 1) then 
            self:Verbose("SpellLoad:","spellid",spellid,"empty tooltip")
            self.spellFrame = self:TooltipCreate(private.TOOLTIP_SPELL)
          end
        end
      end
    end
  end
--]]
  for itemID,data in pairs(NOP.T_SPELL_BY_NAME) do
    local spell = GetItemSpell(itemID)
    if spell and spell ~= "" then
      NOP.T_SPELL_FIND[spell] = data
    else
      self:Verbose("SpellLoad:","itemID,",itemID,"GetItemSpell(itemID) empty")
      spellRetry = itemID
      retry = true
    end
  end
  self:Profile(false)
  if retry then
    self.timerSpellLoad = self:ScheduleTimer("SpellLoad", private.TIMER_IDLE)
    return
  end
  self.spellLoad = true
  if (private.LOAD_RETRY - self.spellLoadRetry) > 1 then self:Verbose("SpellLoad:",string.format(private.L["Spells cache update run |cFF00FF00%d."],private.LOAD_RETRY - self.spellLoadRetry)) end
  self.spellLoadRetry = private.LOAD_RETRY -- limit number of retries
end
function NOP:PickLockUpdate() -- rogue picklocking
  if IsPlayerSpell(private.SPELL_PICKLOCK) then -- have it in spellbook?
    self.spellFrame:ClearLines() -- clean tooltip frame
    self.spellFrame:SetSpellByID(private.SPELL_PICKLOCK) -- Fills the tooltip with information about a spell specified by ID
    local count = self.spellFrame:NumLines()
    if count > 3 then
      local text = _G[private.TOOLTIP_SPELL .. "TextLeft" .. 4]:GetText() -- 4th line contains actual level of picklocking
      if text and text ~= "" then
        self.pickLockLevel = tonumber(string.match(text,"%d+")) -- /run local level = string.match("blabla 500.","%d+"); print(level)
        if self.pickLockLevel then
          self.pickLockSpell = GetSpellInfo(private.SPELL_PICKLOCK) -- save name for later use
        else
          self.printt("Can't determine level of",GetSpellInfo(private.SPELL_PICKLOCK),"unexpected formating of tooltip!",text) -- diagnostic
        end
      end
    else
      self.printt("Tooltip has less lines than expected, has", count, "instead more than 3.") -- diagnostic
    end
  end
end
function NOP:PrintTooltip(tooltip) -- dump tooltip in chat frame
  local name = tooltip:GetName()
  for i=1,tooltip:NumLines() do -- scan all lines in tooltip
    local leftText = _G[name .. "TextLeft" .. i]
    local rightText = _G[name .. "TextRight" .. i]
    if leftText and leftText.GetText then
      local r,g,b,a = leftText:GetTextColor()
      local line = leftText:GetText()
      if line and line ~= "" then self.printt(format("L %2d RGBA %3.3d %3.3d %3.3d %3.3d T %s",i,math.floor(r * 255 + 0.5),math.floor(g * 255 + 0.5),math.floor(b * 255 + 0.5),math.floor(a * 255 + 0.5), line)) end
    end
    if rightText and rightText.GetText then
      local r,g,b,a = rightText:GetTextColor()
      local line = rightText:GetText()
      if line and line ~= "" then self.printt(format("R %2d RGBA %3.3d %3.3d %3.3d %3.3d T %s",i,math.floor(r * 255 + 0.5),math.floor(g * 255 + 0.5),math.floor(b * 255 + 0.5),math.floor(a * 255 + 0.5), line)) end
    end
  end
end
function NOP:BlacklistClear() -- reset temporary blacklist
  if not NOP.DB.Skip and NOP.T_BLACKLIST and NOP.T_BLACKLIST[0] then -- have blacklisted items and is not session sticky, lets erase blacklist and check again
    wipe(NOP.T_BLACKLIST) -- empty list
    wipe(NOP.T_CHECK)
    return true
  end
end
function NOP:BlacklistReset() -- reset permanent blacklist
  if (type(NOP.DB.T_BLACKLIST) == "table") then
    wipe(NOP.DB.T_BLACKLIST)
  else
    NOP.DB.T_BLACKLIST = {} 
  end
  if (type(NOP.DB.T_BLACKLIST_Q) == "table") then
    wipe(NOP.DB.T_BLACKLIST_Q)
  else
    NOP.DB.T_BLACKLIST_Q = {} 
  end
  wipe(NOP.T_CHECK)
  self:ItemShowNew()
end
function NOP:BlacklistItem(isPermanent,itemID) -- right click will add item into blacklist
  if itemID then
    local name = GetItemInfo(itemID)
    if isPermanent then
      if not (type(NOP.DB.T_BLACKLIST) == "table") then NOP.DB.T_BLACKLIST = {} end
      NOP.DB.T_BLACKLIST[0] = true
      NOP.DB.T_BLACKLIST[itemID] = true
      self.printt(private.L["PERMA_BLACKLIST"],name or itemID)
    else
      if not (type(NOP.T_BLACKLIST) == "table") then NOP.T_BLACKLIST = {} end
      NOP.T_BLACKLIST[0] = true -- blacklist is defined
      NOP.T_BLACKLIST[itemID] = true
      if NOP.DB.Skip then
        self.printt(private.L["SESSION_BLACKLIST"],name or itemID)
      else
        self.printt(private.L["TEMP_BLACKLIST"],name or itemID)
      end
    end
    NOP.T_USE[itemID] = nil; NOP.T_CHECK[itemID] = nil
  end
end
function NOP:Profile(onStart) -- time profiling
  if not self.profileOn then return end
  if not self.profileSession then self.profileSession = GetTime() end -- start of session
  if onStart then
    self.profileCount = (self.profileCount or 0) + 1
    self.profileTP = debugprofilestop()
    return
  end
  local elapsed = (debugprofilestop() - self.profileTP)
  if self.profileMaxRun == nil or self.profileMaxRun < elapsed then self.profileMaxRun = elapsed end
  self.profileTotal = (self.profileTotal or 0) + elapsed
end
function NOP:inCombat() -- combat lockdown
  return InCombatLockdown()
end
function NOP:SecondsToString(s) -- return delta, time-string
  local nH = math.floor(s/3600)
  local nM = math.floor(s/60 - nH*60)
  local nS = math.floor(s - nH*3600 - nM*60)
  if nH > 0  then return 30,string.format("%d",nH) .. ":" .. string.format("%02d",nM); end
  if nM > 0  then return  5,string.format("%d",nM) .. ":" .. string.format("%02d",nS); end
  if s > 9.9 then return  1,string.format("%.0f",s); end
  return 0.1, string.format("%.1f",s)
end
function NOP:ZoneChanged()
  self.timerZoneChanged = nil
  self:Profile(true)
  local saveArea = GetCurrentMapAreaID()
  local saveDungeonLevel = GetCurrentMapDungeonLevel()
  local saveContinent = GetCurrentMapContinent()
  SetMapToCurrentZone() -- need set actual map to actual zone te get real mapID
  local mapID = GetCurrentMapAreaID()
  if (saveContinent ~= GetCurrentMapContinent()) then SetMapZoom(saveContinent) end
  if (saveArea ~= mapID) then SetMapByID(saveArea) end
  if (saveDungeonLevel ~= GetCurrentMapDungeonLevel()) then SetDungeonMapLevel(saveDungeonLevel) end -- restore map
  if mapID ~= self.mapID then
    self.mapID = mapID
    wipe(NOP.T_CHECK) -- empty list, recheck all on new map
  end
  local minimapZone = GetMinimapZoneText()
  self:Profile(false)
  if minimapZone and minimapZone ~= self.Zone then -- new zone need update Button
    self.Zone = minimapZone
    self:ItemShowNew()
  end
end
function NOP:removekey(t, key) -- remove item in hash table by key
  if t and key and (type(t) == "table") and (t[key] ~= nil) then
    local element = t[key]
    t[key] = nil
    return element
  end
  return nil
end
local HERALD_ANNOUNCED = {}
function NOP:CheckBuilding(toCheck)
  if not NOP.DB.herald then return end
  if toCheck then C_Garrison.RequestLandingPageShipmentInfo(); return; end
  if C_Garrison.HasGarrison(LE_GARRISON_TYPE_6_0) then -- garrison shipments
    local buildings = C_Garrison.GetBuildings(LE_GARRISON_TYPE_6_0)
    local numBuildings = #buildings
    if(numBuildings > 0) then
      for i = 1, numBuildings do
        local buildingID = buildings[i].buildingID;
        if buildingID and not HERALD_ANNOUNCED[buildingID] then
          local name, _, _, shipmentsReady, shipmentsTotal = C_Garrison.GetLandingPageShipmentInfo(buildingID)
          if name and shipmentsReady and shipmentsTotal and (shipmentsReady / shipmentsTotal) > private.WORK_ANNOUNCE then
            self:PrintToActive((private.TOGO_ANNOUNCE):format(name,shipmentsReady,shipmentsTotal-shipmentsReady))
            HERALD_ANNOUNCED[buildingID] = true
          end
        end
      end
    end
  end
  if C_Garrison.HasGarrison(LE_GARRISON_TYPE_7_0) then -- Order hall
    local followerShipments = C_Garrison.GetFollowerShipments(LE_GARRISON_TYPE_7_0) -- troops ready
    if followerShipments then
      for i = 1, #followerShipments do
        if not HERALD_ANNOUNCED[followerShipments[i]] then
          local name, _, _, shipmentsReady, shipmentsTotal = C_Garrison.GetLandingPageShipmentInfoByContainerID(followerShipments[i])
          if name and shipmentsReady and shipmentsTotal and (shipmentsReady / shipmentsTotal) > private.WORK_ANNOUNCE then
            self:PrintToActive((private.TOGO_ANNOUNCE):format(name,shipmentsReady,shipmentsTotal-shipmentsReady))
            HERALD_ANNOUNCED[followerShipments[i]] = true
          end
        end
      end
    end
    local looseShipments = C_Garrison.GetLooseShipments(LE_GARRISON_TYPE_7_0) -- research
    if looseShipments then
      for i = 1, #looseShipments do
        if not HERALD_ANNOUNCED[looseShipments[i]] then
          local name, _, _, shipmentsReady, shipmentsTotal = C_Garrison.GetLandingPageShipmentInfoByContainerID(looseShipments[i])
          if name and shipmentsReady and shipmentsTotal and (shipmentsReady / shipmentsTotal) > private.WORK_ANNOUNCE then
            self:PrintToActive((private.TOGO_ANNOUNCE):format(name,shipmentsReady,shipmentsTotal-shipmentsReady))
            HERALD_ANNOUNCED[looseShipments[i]] = true
          end
        end
      end
    end
    local talentTrees = C_Garrison.GetTalentTreeIDsByClassID(LE_GARRISON_TYPE_7_0, select(3, UnitClass("player"))) -- orderhall talents
    if talentTrees then
      local completeTalentID = C_Garrison.GetCompleteTalent(LE_GARRISON_TYPE_7_0)
      if completeTalentID and not HERALD_ANNOUNCED[completeTalentID] then
        for treeIndex, treeID in ipairs(talentTrees) do
          local _, _, tree = C_Garrison.GetTalentTreeInfoForID(treeID)
          for talentIndex, talent in ipairs(tree) do
            if (talent.id == completeTalentID) then
              self:PrintToActive((private.TALENT_ANNOUNCE):format(talent.name))
              HERALD_ANNOUNCED[completeTalentID] = true
            end
          end
        end
      end
      for treeIndex, treeID in ipairs(talentTrees) do
        local _, _, tree = C_Garrison.GetTalentTreeInfoForID(treeID)
        for talentIndex, talent in ipairs(tree) do
          if talent.selected and not HERALD_ANNOUNCED[talent.perkSpellID] and NOP.T_INSTA_WQ[talent.perkSpellID] then
            local ability = GetSpellInfo(talent.perkSpellID) -- spell name
            local _, duration = GetSpellCooldown(talent.perkSpellID)
            local count = GetItemCount(NOP.T_INSTA_WQ[talent.perkSpellID])
            local name = GetItemInfo(NOP.T_INSTA_WQ[talent.perkSpellID])
            if duration == 0 and name then
              local txt = " " .. private.RGB_RED .. ERR_SPELL_FAILED_REAGENTS_GENERIC .. " " .. private.RGB_YELLOW .. name
              self:PrintToActive((private.TALENT_ANNOUNCE):format(ability) .. ((count == 0) and txt or ""))
              HERALD_ANNOUNCED[talent.perkSpellID] = true
            end
          end
        end
      end
    end
  end -- /run local _, _, t = C_Garrison.GetTalentTreeInfoForID(119); for a,b in ipairs(t) do print(a, b.selected, b.perkSpellID) end
  if HasArtifactEquipped() and not HERALD_ANNOUNCED[0] then -- artifact points to spend
    local _, _, _, _, totalXP, pointsSpent, _, _, _, _, _, _, artifactTier = C_ArtifactUI.GetEquippedArtifactInfo()
    local numPointsAvailableToSpend, xp, xpForNextPoint = MainMenuBar_GetNumArtifactTraitsPurchasableFromXP(pointsSpent, totalXP, artifactTier)
    if numPointsAvailableToSpend > 0 then
      self:PrintToActive((private.ARTIFACT_ANNOUNCE):format(numPointsAvailableToSpend))
      HERALD_ANNOUNCED[0] = true
    end
  end
  for i = 1, GetNumArchaeologyRaces() do -- archaelogy can be completed
    local raceName, _, _, have, required = GetArchaeologyRaceInfo(i)
    if raceName and (required > 0) and (have >= required) and not HERALD_ANNOUNCED[raceName] then
      self:PrintToActive((private.ARCHAELOGY_ANNOUNCE):format(raceName))
      HERALD_ANNOUNCED[raceName] = true
    end
  end
  if not HERALD_ANNOUNCED["shipyard"] then -- shipyard missing ships
    local activeShips, maxShips = C_Garrison.GetNumFollowers(LE_FOLLOWER_TYPE_SHIPYARD_6_2), 0
    local _,_,_,_,_,shipyardRank = C_Garrison.GetOwnedBuildingInfo(98)
    if shipyardRank == 1 then 
      maxShips = 6
    elseif shipyardRank == 2 then
      maxShips = 8
    elseif shipyardRank == 3 then
      maxShips = 10 
    end
    if maxShips > 0 then
      if activeShips < maxShips then
        self:PrintToActive((private.SHIPYARD_ANNOUNCE):format(activeShips,maxShips))
        HERALD_ANNOUNCED["shipyard"] = true
      end
    end
  end
  ExpandAllFactionHeaders()
  local nF = GetNumFactions()
  for i=1, nF do
    local name, _, _, _, _, value, _, _, header, _, _, _, _, id = GetFactionInfo(i)
    if name and not header and id then
      if C_Reputation.IsFactionParagon(id) then
        local reward = false
        value, top, _, reward = C_Reputation.GetFactionParagonInfo(id)
        while (value > top) do value = value - top end
        if reward and not HERALD_ANNOUNCED[id] then 
          self:PrintToActive((private.REWARD_ANNOUNCE):format(name))
          HERALD_ANNOUNCED[id] = true
        end
      end
    end
  end
end
function NOP:PrintToActive(msg) -- print to all active chat windows
  if msg then
    local txt = ("|cff7f7f7f%s|r [|cff007f7f%s|r]" .. " %s"):format(ElvUI and "" or ("[" .. date("%H:%M") .. "]"),ADDON,msg)
    for i = 1, NUM_CHAT_WINDOWS do
      local name, fontSize, r, g, b, alpha, shown, locked, docked, uninteractable = GetChatWindowInfo(i)
      if shown and _G["ChatFrame"..i] then
        _G["ChatFrame"..i]:AddMessage(txt)
      end
    end
  end
end
function NOP:CompressText(text) -- printable
  text = string.gsub(text, "\n", "/n") -- novy radek
  text = string.gsub(text, "/n$", "") -- novy radek na konci zahodit
  text = string.gsub(text, "||", "/124") -- interni formatovani WoW
  return string.trim(text)
end
