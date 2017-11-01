local _
local ADDON, private = ...
local NOP = LibStub("AceAddon-3.0"):GetAddon(ADDON)
local T_BAGS = {} -- bags table
local T_PICK = {} -- picklocking items 
function NOP:ItemIsBlacklisted(itemID) -- is item blacklisted?
  if not itemID then return true end
  if NOP.T_BLACKLIST and NOP.T_BLACKLIST[itemID] then -- temporary blacklist
    self:Verbose("itemID",itemID,"is temporary blacklisted")
    return true
  elseif NOP.DB["T_BLACKLIST"] and NOP.DB.T_BLACKLIST[itemID] then -- Permanent blacklist
    self:Verbose("itemID",itemID,"is permanently blacklisted")
    return true
  elseif private.BLACKLIST[itemID] then
    self:Verbose("itemID",itemID,"build-in blacklisted")
    return true
  end
end
function NOP:ItemGetSpell(itemID) -- looking for usable item by spell attached to item returns (count, 2) or nil
  local spell = GetItemSpell(itemID)
  if spell then
    local count = NOP.T_SPELL_FIND[spell] -- how many of them I need?
    if count then -- is in table and has no red text in tooltip
      self:Verbose("itemID",itemID,"GetItemSpell", spell)
      return count, 2
    end
  end
end
function NOP:ItemGetItem(itemID) -- looking for usable item by itemID returns (count, 2, zone, map, aura) or nil
  local count,z,m,a = unpack(NOP.T_ITEMS[itemID],1,4)
  if m and not m[self.mapID] then return end -- map lock
  if a then
    for n = 1, 40 do 
      local name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable, shouldConsolidate, spellID  = UnitAura(private.UNITID_PLAYER, n,private.AURA_HELPFUL)
      if spellID and spellID == a then -- already have aura from that item
        if aura == private.AURA_MINERS_COFFEE then -- extra handling for this aura
          if count >= NOP.DB.cofeeStacks then -- it has enough of stacks?
            self:Verbose("itemID",itemID,"rejected already have aura",name,"with",count,"stacks")
            return
          end
        else
          self:Verbose("itemID",itemID,"rejected already have aura",name)
          return
        end
        break
      end
    end
  end
  return count, 2, z, m, a
end
function NOP:ItemGetLockPattern(itemID) -- test tooltip for locked item
  if NOP.DB.profession and self.pickLockLevel and (self.scanFrame:NumLines() > 2) then -- rogue picklock in use
    local locked = -1 
    if string.match(_G[private.TOOLTIP_SCAN .. "TextLeft" .. 2]:GetText(),"^" .. LOCKED .. "$") then locked = 3 end -- LOCKED is Blizzard's UI global variable and is localized text of Locked, it must be at start of 2dn line in tooltip
    if string.match(_G[private.TOOLTIP_SCAN .. "TextLeft" .. 3]:GetText(),"^" .. LOCKED .. "$") then locked = 4 end -- color-blind mode adds extra line
    if locked > 0 then 
      local lockLevel = tonumber(string.match(_G[private.TOOLTIP_SCAN .. "TextLeft" .. locked]:GetText(),"%d+")) -- this line must contain unlock level
      if lockLevel and (self.pickLockLevel >= lockLevel) then -- I can picklock this!
        self:Verbose(itemID,"Locked:",lockLevel)
        T_PICK[itemID] = true
        return 1, 2
      end
    end
  end
end
function NOP:ItemGetPattern(itemID) -- looking for usable item via pattern in tooltip returns (count, 2, zone, map) or nil
  local n, p = self:ItemGetLockPattern(itemID)
  if n then return n,p end
  for i=1,self.scanFrame:NumLines() do -- scan all lines in tooltip
    local headingLine = private.TOOLTIP_SCAN .. "TextLeft" .. i
    local heading = _G[headingLine]:GetText() -- get line from tooltip
    if heading and heading ~= "" then
      for key, data in pairs(NOP.T_RECIPES_FIND) do
        local c, pattern, z, m = unpack(data,1,4)
        if strfind(heading,pattern,1,true) then
          return c, 2, z, m
        end
      end
      for key, data in pairs(NOP.T_OPEN) do
        if strfind(heading,key,1,true) then
          local c, z, m = unpack(data,1,3)
          return c, 2, z, m
        end
      end
    end
  end
end
local offset = 0
function NOP:ItemToUse(itemID,count,prio,zone,map,aura) -- store item into table
  local pt = NOP.T_USE[itemID]
  if not pt then -- new item
    if (self.BF and self.BF.showID == nil) and (itemID == self.AceDB.char.itemID) then -- first time looking for item then get last item from last session
      NOP.T_USE[itemID] = {count, prio, zone, map, aura, GetTime()+1.0, GetItemCount(itemID)}
    else
      NOP.T_USE[itemID] = {count, prio, zone, map, aura, GetTime()+offset, GetItemCount(itemID)} -- seed with time
      offset = offset + 0.001
    end
  else -- update item
    if pt[7] and count and (pt[7] < count) and (GetItemCount(itemID) >= count) then pt[6] = GetTime() end -- trigger is rise count above limit
    pt[1] = count
    pt[2] = prio
    if pt[3] == nil then pt[3] = zone end
    if pt[4] == nil then pt[4] = map end
    if pt[5] == nil then pt[5] = aura end
    pt[7] = GetItemCount(itemID)
  end
end
function NOP:ItemScan() -- /run NOP:ItemScan(); foreach(NOP.T_USE,print)
  wipe(T_BAGS); wipe(T_PICK) -- wipe internal table
  for bag = BACKPACK_CONTAINER, NUM_BAG_SLOTS, 1 do
    for slot = 1, GetContainerNumSlots(bag), 1 do
      local itemID = GetContainerItemID(bag,slot)
      if itemID ~= nil then T_BAGS[itemID] = {bag,slot} end -- index it for later use in macro and clear check table
    end
  end
  for key in pairs(NOP.T_CHECK) do if not T_BAGS[key] then NOP.T_CHECK[key] = nil end end -- cleanup check table
  for key in pairs(NOP.T_USE) do if not T_BAGS[key] then NOP.T_USE[key] = nil end end  -- cleanup item table
  for itemID, data in pairs(T_BAGS) do
    if not NOP.T_CHECK[itemID] then -- not checked before
      NOP.T_CHECK[itemID] = true -- stop checking it except later NOP.T_USE will reset it
      if not self:ItemIsBlacklisted(itemID) then
        local bag, slot = unpack(data)
        local itemLink = GetContainerItemLink(bag,slot) -- create link from slot, it will have type of item in bags
        if itemLink then
          local _, _, linkColor, linkType, linkID = string.find(itemLink, "|?c?f?f?(%x*)|?H?([^:]*):?(%d+):")
          if linkType == private.ITEM_TYPE_BATTLE_PET then
            local numCollected, limit = C_PetJournal.GetNumCollectedInfo(linkID)
            if (numCollected < limit) then
              self:ItemToUse(itemID, 1, 2, nil, nil)
            else
              self:Verbose("Pet",itemID,"have more than",limit)
              NOP.T_USE[itemID] = nil
            end
          elseif linkType == private.ITEM_TYPE_ITEM then
            local count, prio, zone, map, aura = self:ItemGetSpell(itemID)
            if count and (count > 0) then
              self:ItemToUse(itemID, count, prio, zone, map, aura)
            else
              self.scanFrame:ClearLines() -- clean tooltip frame
              self.scanFrame:SetBagItem(bag, slot) -- fill up tooltip
              if (self.scanFrame:NumLines() < 1) then -- bug, all items should have tooltip!
                self:Verbose("Broken tooltip on " .. itemID)
                self.scanFrame = self:TooltipCreate(private.TOOLTIP_SCAN) -- workaround for this obscure bug is reset parent for tooltip
                self.scanFrame:SetBagItem(bag, slot) -- fill up tooltip
              end
              if self.scanFrame:NumLines() > 0 then
                if NOP.T_ITEMS and NOP.T_ITEMS[itemID] then
                  count, prio, zone, map, aura = self:ItemGetItem(itemID)
                  if count and (count > 0) then 
                    self:ItemToUse(itemID, count, prio, zone, map, aura)
                  end
                else
                  count, prio, zone, map, aura = self:ItemGetPattern(itemID)
                  if count and (count > 0) then
                    self:ItemToUse(itemID, count, prio, zone, map, aura)
                  else
                    NOP.T_USE[itemID] = nil
                  end
                end
              else
                self.printt(format("|cFFFF0000Error|r broken tooltip for |cFFFF0000%s|r itemID(%d)",GetItemInfo(itemID) or "unknown",itemID))
                NOP.T_USE[itemID] = nil
              end
            end
          end
        else
          self:Verbose("itemID",itemID,"don't return itemLink")
          NOP.T_USE[itemID] = nil
        end
      else
        self:Verbose("itemID",itemID,"is blacklisted")
        NOP.T_USE[itemID] = nil
      end
    end
  end
end
function NOP:ItemIsUnusable(Red, Green, Blue, Alpha) -- test red color
  Red = math.floor(Red * 255 + 0.5)
  Green = math.floor(Green * 255 + 0.5)
  Blue = math.floor(Blue * 255 + 0.5)
  Alpha = math.floor(Alpha * 255 + 0.5)
  return (Red == 255 and Green == 32 and Blue == 32 and Alpha == 255)
end
function NOP:ItemIsUsable(itemID) -- look in tooltip if there is no red text
  if not T_BAGS[itemID] then return end -- don't have item
  local bag,slot = unpack(T_BAGS[itemID])
  self.scanFrame:ClearLines() -- clean tooltip frame
  self.scanFrame:SetBagItem(bag, slot) -- fill up tooltip
  if (self.scanFrame:NumLines() < 1) then -- bug, all items should have tooltip!
    --self:Verbose("itemID",itemID,"Empty tooltip!")
    self.scanFrame = self:TooltipCreate(private.TOOLTIP_SCAN) -- workaround for this obscure bug is reset parent for tooltip
    self.scanFrame:SetBagItem(bag, slot) -- fill up tooltip
  end
  if self.scanFrame:NumLines() > 0 then
    for i=1,self.scanFrame:NumLines() do -- scan all lines in tooltip
      local leftText = _G[private.TOOLTIP_SCAN .. "TextLeft" .. i]
      local rightText = _G[private.TOOLTIP_SCAN .. "TextLeft" .. i]
      if leftText and leftText.GetText then
        local text = leftText:GetText()
        if text and text ~= "" then
          if self:ItemIsUnusable(leftText:GetTextColor()) then 
            --self:Verbose("itemID",itemID,"has red text in tooltip!",text)
            return false
          end
        end
      end
      if rightText and rightText.GetText then
        local text = rightText:GetText()
        if text and text ~= "" then
          if self:ItemIsUnusable(rightText:GetTextColor()) then 
            -- self:Verbose("itemID",itemID,"has red text in tooltip!",text) 
            return false
          end
        end
      end
    end
    return true
  end
  --self:Verbose("itemID",itemID,"Empty tooltip!")
  return false
end
function NOP:ItemToPicklock(itemID) -- need to find which item really need to unlock, locked and unlocked items have same itemID
  for bag = BACKPACK_CONTAINER, NUM_BAG_SLOTS, 1 do
    for slot = 1, GetContainerNumSlots(bag), 1 do
      local id = GetContainerItemID(bag,slot)
      if (id == itemID) then
        self.scanFrame:ClearLines() -- clean tooltip frame
        self.scanFrame:SetBagItem(bag, slot) -- fill up tooltip
        if (self.scanFrame:NumLines() < 1) then -- bug, all items should have tooltip!
          self:Verbose("Broken tooltip on " .. id)
          self.scanFrame = self:TooltipCreate(private.TOOLTIP_SCAN) -- workaround for this obscure bug is reset parent for tooltip
          self.scanFrame:SetBagItem(bag, slot) -- fill up tooltip
        end
        if self:ItemGetLockPattern(id) then
          self.BF.bagID, self.BF.slotID = bag, slot -- this item really need to unlock
          self:Verbose("Locked item",id,"bag",bag,"slot",slot)
          return true
        end
      end
    end
  end
end
function NOP:ItemShow(bagID,slotID,itemID,itemCount,itemTexture) -- add item to button
  local button = self.BF
  if not button then return end
  if bagID then self:Verbose("itemID",itemID,"has",GetItemSpell(itemID) or "None") end
  button.bagID = bagID; button.slotID = slotID -- used in tooltip
  button.itemID = itemID; button.itemCount = itemCount; button.itemTexture = itemTexture -- used in button show
  button.expiration = 0
  if WoWBox and bagID then
    WoWBox.itemClick = nil
    if self.priorityItem then
      if (itemID == 118903) or (itemID == 118897) then -- mine
        WoWBox.itemClick = (itemCount > 5)
      elseif (itemID ~= 128373) then -- salvage but not shipyard
        WoWBox.itemClick = true
      end
    end
  end
  if bagID and slotID and itemID and itemTexture then -- time to update button with 1st item
    if (self.pickLockID == itemID) and self:ItemToPicklock(itemID) then -- search what item really need to unlock!
      button.mtext = format(private.MACRO_PICKLOCK,self.pickLockSpell,button.bagID,button.slotID) -- bagId and slotID could change in self:ItemToPicklock(itemID)!
    else
      button.mtext = format(private.MACRO_ACTIVE,itemID)
    end
    self:Verbose("itemID",itemID,"bag",button.bagID,"slot",button.slotID,"placed on button")
    button.showID = itemID -- from now every item in bag is new one
    self.AceDB.char.itemID = itemID -- store for restore as last item on button after logout/login
    self:ButtonShow() -- show button
  else -- need hide button
    if self:BlacklistClear() then -- no more items to show, may be some are just temporary blacklisted
      self.printt(private.L["Temporary blacklist cleared, restarting lookup!"])
      self:ItemShowNew() -- restart process
      return
    end
    self.AceDB.char.itemID = nil
    self:ButtonHide() -- hide button
  end
end
function NOP:ItemShowNew() -- check bags for usable item and place it on button
  self.preClick = nil -- from now error won't blacklist item on button
  if self:inCombat() or not (self.spellLoad and self.itemLoad) then -- postspone in combat and on loading
    self.timerItemShowNew = self:ScheduleTimer("ItemShowNew", private.TIMER_IDLE)
    return
  end
  self.timerItemShowNew = nil
  self:Profile(true)
  self:ItemScan() -- rescan bags
  local toShow, prio, stamp = nil, 0, 0 -- item for use on button
  for itemID, data in pairs(NOP.T_USE) do
    local c, p, z, m, a, t = unpack(data,1,6)
    local inZone = false
    --self:Verbose("itemID",itemID,"Count",c,"Priority",p,"Zone",z,"Aura",a,"Stamp",t,"precheck")
    if z then -- zone table can be {"sub-Zone","sub-Zone",...} | zoneID | {zoneID,zoneID,...}
      if type(z) == "table" then
        for i = 1, #z do
          if type(z[i]) == "string" then -- sub-zone string name
            if z[i] == self.Zone then
              inZone = true
            end
          end
        end
      end
      if inZone then
        p = 1
      else
        if NOP.DB.zoneUnlock and not a then
          p = p + 10 -- shift priority behind items not zone locked
          inZone = true
        else
          p = nil
        end
      end -- zone items outside zone have lowest priority else maximal priority
    end
    if a and (not inZone or not self:ItemGetItem(itemID)) then p = nil end -- zone items with buff only shown in proper zone and when no buff with defined stacks is on
    if z and (not inZone) then p = nil end -- rush orders shipyard have special handling
    if m and not m[self.mapID] then p = nil end -- map lock
    self:Verbose("itemID",itemID,"Zone",(inZone and "yes" or "no"),"Priority",((type(p) == "number") and p or "disabled"),"Stamp",t)
    if (type(p) == "number") and self:ItemIsUsable(itemID) and (GetItemCount(itemID) >= c) then -- have priority defined so it is candidate for button
      if (prio == 0) then -- 1st usable item set values to compare with
        --self:Verbose("itemID",itemID,"Priority",p,prio,"Stamp",t,stamp,"first")
        toShow = itemID; prio = p; stamp = t
      else 
        if (p < prio) then -- higher priority
          --self:Verbose("itemID",itemID,"Priority",p,prio,"Stamp",t,stamp,"priority")
          toShow = itemID; prio = p; stamp = t
        else 
          if (p == prio) and (t > stamp) then -- newer item to show
            --self:Verbose("itemID",itemID,"Priority",p,prio,"Newer",t,stamp,"newer")
            toShow = itemID; prio = p; stamp = t
          end
        end
      end
    end
  end
  if toShow then -- have something to place on button
    local bag,slot = unpack(T_BAGS[toShow])
    local itemID = GetContainerItemID(bag,slot)
    if (itemID ~= toShow) then -- gotcha in that slot is not that item, but GetItemCount telling us we have it, lets search it again
      self:Verbose("Item",toShow,"moved in bags.")
      for bag = BACKPACK_CONTAINER, NUM_BAG_SLOTS, 1 do
        for slot = 1, GetContainerNumSlots(bag), 1 do
          if toShow == GetContainerItemID(bag,slot) then T_BAGS[toShow] = {bag,slot} end -- update it
        end
      end
      bag,slot = unpack(T_BAGS[toShow])
      if not (toShow == GetContainerItemID(bag,slot)) then -- oh item is not there!
        self:Profile(false)
        self:Verbose("Item",toShow,"missing in bags.")
        self:ItemShowNew() -- retry without that item
        return
      end
    end
    if (prio == 1) then self.priorityItem = toShow else self.priorityItem = nil end -- glow effect on button
    local count = GetItemCount(toShow)
    local itemTexture = GetContainerItemInfo(bag, slot)
    self.pickLockID = T_PICK[toShow] and toShow -- it is item in picklocking table?, macro will be different
    self:ItemShow(bag,slot,toShow,count,itemTexture) -- place new item on button
  else
    self.priorityItem = nil
    self:ItemShow(nil)
  end
  self:Profile(false)
end
function NOP:ItemTimer() -- slow backpack recheck
  if self:inCombat() or not (self.spellLoad and self.itemLoad) then return end -- still loading or in combat
  -- wipe(NOP.T_CHECK) -- invalidate cache
  self:ItemShowNew() -- find item to place on button
end
