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
function NOP:ItemLoad() -- load template item tooltips
  self.itemLoadRetry = self.itemLoadRetry - 1 -- only limited retries
  if self.itemLoadRetry < 0 then self.itemLoad = true; return; end -- no more retry
  local retry = false
  for itemID, data in pairs(NOP.T_RECIPES) do
    if not NOP.T_RECIPES_FIND[itemID] then -- need fill pattern
      local name = GetItemInfo(itemID)
      if name == nil then -- item has no info on client side yet, let wait for server
        if (private.LOAD_RETRY - self.itemLoadRetry) > 1 then self:Verbose("ItemLoad:GetItemInfo(itemID)",itemID) end
        retry = true
      else
        self.itemFrame:ClearLines() -- clean tooltip frame
        self.itemFrame:SetItemByID(itemID)
        local count = self.itemFrame:NumLines()
        if count > 1 then -- I must have at least 2 lines in tooltip
          local c,pattern = unpack(data,1,2)
          if type(pattern) == "number" then
            if count >= pattern then
              local tooltipText = private.TOOLTIP_ITEM .. "TextLeft" .. pattern
              local text = tooltipText and _G[tooltipText].GetText and _G[tooltipText]:GetText() or "none"
              if text == ITEM_QUALITY1_DESC or text == ITEM_QUALITY2_DESC or text == ITEM_QUALITY3_DESC or text == ITEM_QUALITY4_DESC then -- colorblind mode shift it down!
                tooltipText = private.TOOLTIP_ITEM .. "TextLeft" .. (pattern + 1)
                text = tooltipText and _G[tooltipText].GetText and _G[tooltipText]:GetText() or "none"
              end
              if text and text ~= "none" then NOP.T_RECIPES_FIND[itemID] = {c,text,data[3],data[4]} end
            end
          elseif type(pattern) == "string" then
            local tooltipText = private.TOOLTIP_ITEM .. "TextLeft" .. 1
            local heading = _G[tooltipText]:GetText()
            if heading then -- look in 1st line
              local compare = gsub(heading,pattern,"%1")
              if compare ~= heading then
                NOP.T_RECIPES_FIND[itemID] = {c,compare,data[3],data[4]}
              end
            end
          end
        else
          self:Verbose("ItemLoad:Empty tooltip", itemID)
          retry = true -- /run NOP.itemFrame:ClearLines(); NOP.itemFrame:SetItemByID(111972); print(NOP.itemFrame:NumLines())
          self.itemFrame = self:TooltipCreate(private.TOOLTIP_ITEM) -- empty tooltip I just throw out old one. Workaround for bad tooltip frame init damn Blizzard!
          break
        end
      end
    end
  end
  if retry then 
    self.timerItemLoad = self:ScheduleTimer("ItemLoad", private.TIMER_IDLE)
    return
  end -- postspone
  self.itemLoad = true
  if (private.LOAD_RETRY - self.itemLoadRetry) > 1 then self:Verbose(string.format(private.L["Items cache update run |cFF00FF00%d."],private.LOAD_RETRY - self.itemLoadRetry)) end
  self.itemLoadRetry = private.LOAD_RETRY
end
function NOP:SpellLoad() -- load spell patterns
  self.spellLoadRetry = self.spellLoadRetry - 1
  if self.spellLoadRetry < 0 then self.spellLoad = true; return end
  local retry = false
  for spellid, data in pairs(NOP.T_SPELL_BY_USE_TEXT) do -- [spellID] = {min-count,itemID,{"sub-Zone"},{[mapID]=true,[mapID]=true}}
    if data and data[2] then
      local name = GetItemInfo(data[2]) -- now just cache all items into cache, later will get tooltip for spells over them
      if name == nil then -- item has no info on client side yet, let wait for server
        if (private.LOAD_RETRY - self.spellLoadRetry) > 1 then self:Verbose("SpellLoad:GetItemInfo(data[2])",data[2]) end
        retry = true
      end
    end
  end
  if retry then
    self.timerSpellLoad = self:ScheduleTimer("SpellLoad", private.TIMER_IDLE)
    return
  end
  retry = false
  wipe(NOP.T_OPEN) -- clear table
  NOP.T_OPEN[ITEM_OPENABLE] = {1,nil} -- standard right click open
  for spellid,data in pairs(NOP.T_SPELL_BY_USE_TEXT) do -- [spellID] = {min-count,itemID,{"sub-Zone"},{[mapID]=true,[mapID]=true}}
    self.spellFrame:ClearLines() -- clean tooltip frame
    self.spellFrame:SetSpellByID(spellid) -- Fills the tooltip with information about a spell specified by ID
    local spellName, spellRank, spellID = self.spellFrame:GetSpell() -- Returns information about the spell displayed in the tooltip
    local count = self.spellFrame:NumLines()
    if spellName then -- it has spell and tooltip has at least 2 lines
      local tooltipText = private.TOOLTIP_SPELL .. "TextLeft" .. count
      if _G[tooltipText] and _G[tooltipText].GetText then
        local spell = _G[tooltipText]:GetText() -- get last line from tooltip
        if spell ~= nil and spell ~= "" then
          NOP.T_OPEN[format("%s %s",ITEM_SPELL_TRIGGER_ONUSE,spell)] = {data[1],data[3],data[4]} -- fill up string table to compare item tooltips for opening spellIDs
        end -- /run foreach(NOP.T_OPEN,print)
      end
    else
      retry = true -- this is problem in tooltip frame! Workaround for bad tooltip frame init damn Blizzard!
      if (count < 1) then 
        self:Verbose("SpellLoad:Empty tooltip",spellid)
        self.spellFrame = self:TooltipCreate(private.TOOLTIP_SPELL)
      end
    end
  end
  if retry then
    self.timerSpellLoad = self:ScheduleTimer("SpellLoad", private.TIMER_IDLE)
    return
  end
  retry = false
  for itemID,count in pairs(NOP.T_SPELL_BY_NAME) do
    local spell = GetItemSpell(itemID)
    if spell then
      if (string.len(spell) > 0) then NOP.T_SPELL_FIND[spell] = count end
    else
      self:Verbose("SpellLoad:GetItemSpell(itemID)",itemID)
      retry = true
    end
  end
  if retry then
    self.timerSpellLoad = self:ScheduleTimer("SpellLoad", private.TIMER_IDLE)
    return
  end
  self.spellLoad = true
  if (private.LOAD_RETRY - self.spellLoadRetry) > 1 then self:Verbose(string.format(private.L["Spells cache update run |cFF00FF00%d."],private.LOAD_RETRY - self.spellLoadRetry)) end
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
      self.printt(private.L["Permanently Blacklisted:|cFF00FF00"],name or itemID)
    else
      if not (type(NOP.T_BLACKLIST) == "table") then NOP.T_BLACKLIST = {} end
      NOP.T_BLACKLIST[0] = true -- blacklist is defined
      NOP.T_BLACKLIST[itemID] = true
      if NOP.DB.Skip then
        self.printt(private.L["Session Blacklisted:|cFF00FF00"],name or itemID)
      else
        self.printt(private.L["Temporary Blacklisted:|cFF00FF00"],name or itemID)
      end
    end
    NOP.T_USE[itemID] = nil; NOP.T_CHECK[itemID] = nil
    self:ItemShowNew() -- find another item
  end
end
function NOP:Profile(onStart) -- time profiling
  if true then return end -- release has profilling disabled
  if not self.profileSession then self.profileSession = GetTime() end -- start of session
  if onStart then
    self.profileCount = (self.profileCount or 0) + 1
    self.profileTP = debugprofilestop()
    return
  end
  self.profileTotal = (self.profileTotal or 0) + (debugprofilestop() - self.profileTP)
end
function NOP:inCombat() -- combat lockdown
  return InCombatLockdown()
end
function NOP:SecondsToString(s) -- return delta, time-string
  local nH = math.floor(s/3600)
  local nM = math.floor(s/60 - nH*60)
  local nS = math.floor(s - nH*3600 - nM*60)
  if nH > 0  then return 30,string.format("%d",nH) .. ":" .. string.format("%02d",nM); end
  if nM > 0  then return  1,string.format("%d",nM) .. ":" .. string.format("%02d",nS); end
  if s > 9.9 then return  1,string.format("%.0f",s); end
  return 0.1, string.format("%.1f",s)
end
function NOP:ZoneChanged()
  self.timerZoneChanged = nil
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