--[[ Slash handler and key-binding header ]]
local _
local ADDON, private = ...
local NOP = LibStub("AceAddon-3.0"):GetAddon(ADDON)
NOP.slash_handler = function(msg, editbox) -- /nop handler
  local line = msg:lower()
  local cmd, arg = string.split(" ,",line)
  if cmd == "bdump" then
    for bag = BACKPACK_CONTAINER, NUM_BAG_SLOTS, 1 do
      for slot = 1, GetContainerNumSlots(bag), 1 do
        local link = GetContainerItemLink(bag, slot)
        if link then
          local _, _, itemColor, itemType, itemID = string.find(link, "|?c?f?f?(%x*)|?H?([^:]*):?(%d+):")
          NOP.printt("Bag",bag,"Slot",slot,"Link",itemType or "unknow type",itemID or "unknown ID")
        end
      end
    end
    return
  end
  if cmd == "verbose" then
    NOP.DB.verbose = not NOP.DB.verbose
    NOP.printt("Verbose mode", NOP.DB.verbose and "on" or "off")
    return
  end
  if cmd == "titem" then
    local id = tonumber(arg)
    if id then
      for bag = BACKPACK_CONTAINER, NUM_BAG_SLOTS, 1 do
        for slot = 1, GetContainerNumSlots(bag), 1 do
          local itemID = GetContainerItemID(bag,slot)
          if itemID and itemID == id then -- when I own item just check true tooltip over bags
            NOP.printt("Tooltip based on item in bag",bag,"slot",slot)
            NOP.itemFrame:ClearLines()
            NOP.itemFrame:SetBagItem(bag, slot)
            NOP:PrintTooltip(NOP.itemFrame)
            return
          end
        end
      end
      local name = GetItemInfo(id)
      if not name then
        NOP.printt("Item ID",id,"is not in cache yet! Try same ID later")
        return
      end
      NOP.printt("Tooltip based only on ID")
      NOP.itemFrame:ClearLines()
      NOP.itemFrame:SetItemByID(id)
      NOP:PrintTooltip(NOP.itemFrame)
    end
    return
  end
  if cmd == "tspell" then
    local id = tonumber(arg)
    if id then
      local name = GetSpellInfo(id)
      if not name then
        NOP.printt("Spell ID",id,"is not in cache yet! Try same ID later")
        return
      end
      NOP.spellFrame:ClearLines()
      NOP.spellFrame:SetSpellByID(id)
      NOP:PrintTooltip(NOP.spellFrame)
    end
    return
  end
  if cmd == "profile" then
    if NOP.profileSession and NOP.profileCount and NOP.profileTotal and NOP.profileMaxRun and NOP.profileCount > 0 then
      local Elapsed = GetTime() - NOP.profileSession
      local textTime = (" %dh %02dm %02ds "):format(Elapsed / 3600, math.fmod(Elapsed / 60, 60), math.fmod(Elapsed, 60))
      NOP.printt(format("%s session time %d [calls] spend %.2f [ms/call] max run %.2f [ms]", textTime, NOP.profileCount, NOP.profileTotal / NOP.profileCount, NOP.profileMaxRun))
    end
    UpdateAddOnMemoryUsage()
    NOP.printt(format("Memory usage %.2f kB",GetAddOnMemoryUsage(ADDON)))
    if NOP.BF then
      local secure,addon = issecurevariable(NOP.BF,"Hide")
      if not secure then NOP.printt("Tainted button Hide() by:",addon) end
      secure,addon = issecurevariable(NOP.BF,"Show")
      if not secure then NOP.printt("Tainted button Show() by:",addon) end
      secure,addon = issecurevariable(NOP.BF,"SetAttribute")
      if not secure then NOP.printt("Tainted button SetAttribute() by:",addon) end
    end
    if NOP.profileOn then -- toggle profiling
      NOP.profileOn = nil
      NOP.profileSession = nil
      NOP.profileCount = nil 
      NOP.profileTotal = nil
      NOP.printt("Profiling OFF")
    else
      NOP.profileOn = true
      NOP.profileSession = nil
      NOP.profileCount = nil 
      NOP.profileTotal = nil
      NOP.printt("Profiling ON")
    end
    NOP.DB["profiling"] = NOP.profileOn
    return
  end
  if cmd == "reset" then
    if NOP.BF and not NOP:inCombat() then
      NOP:ButtonReset()
    end
    return
  end
  if cmd == "skin" then
    NOP.DB["skinButton"] = (not NOP.DB.skinButton)
    NOP:ButtonLoad()
    NOP:QBSkin()
    return
  end
  if cmd == "quest" then
    NOP.DB["quest"] = not NOP.DB.quest
    NOP:QBUpdate()
    return
  end
  if cmd == "show" then
    NOP.DB["visible"] = not NOP.DB.visible
    NOP:ItemShowNew()
    NOP:QBUpdate()
    return
  end
  if cmd == "lock" then
    NOP.DB["lockButton"] = (not NOP.DB.lockButton)
    return
  end
  if cmd == "glow" then
    NOP.DB["glowButton"] = (not NOP.DB.glowButton)
    return
  end
  if cmd == "skip" then
    NOP.DB["Skip"] = (not NOP.DB.Skip)
    if NOP:BlacklistClear() then NOP:ItemShowNew() end
    return
  end
  if cmd == "clear" then
    NOP:BlacklistReset()
    return
  end
  if cmd == "list" then
    if (NOP.DB["T_BLACKLIST"] ~= nil and NOP.DB.T_BLACKLIST[0]) or (NOP.DB["T_BLACKLIST_Q"] ~= nil and NOP.DB.T_BLACKLIST_Q[0])then
      NOP.printt(private.L["BLACKLISTED_ITEMS"])
      NOP.printt("--Button--")
      for itemID,count in pairs(NOP.DB.T_BLACKLIST) do
        if itemID and itemID > 0 then
          local name = GetItemInfo(itemID)
          if not name then
            NOP.printt("ItemID:",itemID,"Not in cache, try later same command to see name.")
          else
            NOP.printt("ItemID:",itemID,"Name:",name)
          end
        end
      end
      NOP.printt("--Quest--")
      for itemID,count in pairs(NOP.DB.T_BLACKLIST_Q) do
        if itemID and itemID > 0 then
          local name = GetItemInfo(itemID)
          if not name then
            NOP.printt("ItemID:",itemID,"Not in cache, try later same command to see name.")
          else
            NOP.printt("ItemID:",itemID,"Name:",name)
          end
        end
      end
    else
      NOP.printt(private.L["BLACKLIST_EMPTY"])
    end
    return
  end
  if cmd == "unlist" then
    local id = tonumber(arg)
    if id then
      if NOP.DB["T_BLACKLIST"] ~= nil and NOP.DB.T_BLACKLIST[id] then NOP.DB.T_BLACKLIST[id] = nil; NOP.printt("Removed ItemID:",id) end
      if NOP.DB["T_BLACKLIST_Q"] ~= nil and NOP.DB.T_BLACKLIST_Q[id] then NOP.DB.T_BLACKLIST_Q[id] = nil; NOP.printt("Removed ItemID:",id) end
    end
    return
  end
  if cmd == "zone" then
    NOP.DB["zoneUnlock"] = not NOP.DB.zoneUnlock
    NOP:ItemShowNew()
    return
  end
  local usage = {string.split("\n", private.L["NOP_USE"] .. private.CONSOLE_CMD .. private.CONSOLE_USAGE)}
  for _,line in pairs(usage) do 
    NOP.printt(line)
  end
end
SLASH_NOP_SWITCH1 = private.CONSOLE_CMD
SlashCmdList["NOP_SWITCH"] = NOP.slash_handler
_G.BINDING_HEADER_NEWOPENABLES = ADDON -- add category to bindings to be able bind button to hotkey in default Blizzard interface
_G["BINDING_NAME_CLICK " .. private.BUTTON_FRAME .. ":LeftButton"] = _G.USABLE_ITEMS
