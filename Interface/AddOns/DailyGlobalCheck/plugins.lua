-- Daily Global Check
-- by Jadya
-- EU-Well of Eternity

local tremove, rnd = table.remove, math.random

local addonName, addonTable = ...

-- templates available to plugins
DailyGlobalCheck.template_cave_entrance = {desc = "Cave Entrance", icon = "Interface\\Minimap\\Vehicle-AllianceWarlockPortal"}
--

local lists = DailyGlobalCheck.ListFunctions
local maps  = DailyGlobalCheck.MapFunctions
local tools = DailyGlobalCheck.Tools

local load_queue = {}
local load_ticker

local function load_next_plugin()
 
 if not DailyGlobalCheck.initialized then return end

 local list, data = pairs(load_queue)(load_queue)

 if not list or not data then
  load_ticker:Cancel()  
  load_ticker = nil
  return
 end

 local svar = DailyGlobalCheck_PluginData[list.Title]
 if not svar or svar.active == nil then
  lists:setActive(list, true)
 end
 
 local i = lists:Find(list.Title)
 
 if list.Initialize then
  list:Initialize()
 end
 
 if list.GenerateData then
  list:GenerateData()
 end
 
 DailyGlobalCheck:PushData(data, list)
 
 if not i then
  DailyGlobalCheck.Lists[#(DailyGlobalCheck.Lists) + 1] = list
  -- refresh the list buttons if the mainframe was created already
  if DGC_Mainframe then
   DailyGlobalCheck:RefreshListButtons()
  end
 else
  DailyGlobalCheck.Lists[i] = list
  DailyGlobalCheck:Refresh(DailyGlobalCheck.Lists[i])
 end

 DGCEventFrame:Fire("PLUGIN_LOADED", list)
 
 local lastsel = DailyGlobalCheck_PluginData.last_selected
 if lastsel == list.Title then
  DailyGlobalCheck:OpenList(list)
 end

 load_queue[list] = nil
end

local function start_loading()
 if load_ticker then return end
 load_ticker = C_Timer.NewTicker(0.3, load_next_plugin)
end

function DailyGlobalCheck:LoadPlugin(list, data)

 if not lists:isList(list) then
  return
 end

 if not lists:CheckVersion(list) then
  print("|cff00FF00Daily Global Check |r- plugin |cffFF0000not|r loaded "..list["Title"].." (different version)")
  return
 end

 load_queue[list] = data
 start_loading()
end

-- returns the localized title or requirement
function DailyGlobalCheck.GetQuestTitleByQuestID(questID, req, pref, suff)

 local index = req and (questID.."_"..req) or questID
 if DailyGlobalCheck_Localization.Quests[index] and type(DailyGlobalCheck_Localization.Quests[index]) == "string" then
  return ((pref and pref or "")..DailyGlobalCheck_Localization.Quests[index]..(suff and suff or ""))
 end

 if not DGCQLScanTooltip then
  DGCQLScanTooltip = CreateFrame("GameTooltip", "DGCQLScanTooltip", UIParent, "GameTooltipTemplate")
 end

 DGCQLScanTooltip:SetOwner(UIParent, "ANCHOR_NONE")
 DGCQLScanTooltip:SetHyperlink("quest:"..questID)
 local reuslt
 if req then
  local i = 1
  while i < DGCQLScanTooltip:NumLines() do
   local line = _G["DGCQLScanTooltipTextLeft"..i]
   if not line then 
	break
   end
   if line:GetText() == QUEST_TOOLTIP_REQUIREMENTS then
    local subline = _G["DGCQLScanTooltipTextLeft"..i + req]
	
	if not subline then 
	 break
	end
	
	result = subline:GetText() or ""
	break
   end

   i = i + 1
  end
 else
  result = DGCQLScanTooltipTextLeft1:GetText()
 end
 DGCQLScanTooltip:Hide()
 
 DailyGlobalCheck_Localization.Quests[index] = result

 return result and ((pref and pref or "")..result..(suff and suff or ""))
end

function DailyGlobalCheck.GetItemInfo(itemID, i, pref, suff)
 local result = select(i, GetItemInfo(itemID))
 return result and ((pref and pref or "")..result..(suff and suff or ""))
end

local functions = { quest = DailyGlobalCheck.GetQuestTitleByQuestID, item = DailyGlobalCheck.GetItemInfo }

local function tick(self)
 local result = functions[self.func](unpack(self.data))

 if result or self.counter > 5 then
  if self.k then
   self.t[self.k][self.i] = result or self.default
  else
   self.t[self.i] = result or self.default
  end
  self.default = nil
  self.t = nil
  self.k = nil
  self.i = nil
  self.data = nil
  self.func = nil
  self.counter = nil
  self:Cancel()
  return
 end

 self.counter = self.counter + 1
end

-- v[k][i] will be filled when the result is retrieved
function DailyGlobalCheck.LocalizeSection(v, k, i, default, func, ...)

 if not functions[func] then return default end

 local result

 result = functions[func](...)

 -- tickers will be created only if the quest/item is not cached
 if not result then
  local f = C_Timer.NewTicker(rnd(30, 70) / 100, tick)
  f.default = default
  f.t = v
  f.k = k
  f.i = i
  f.func = func
  f.counter = 0
  f.data = {...}
  return RETRIEVING_DATA
 else
  return result
 end
end

function DailyGlobalCheck:ClearLocalization()
 wipe(DailyGlobalCheck_Localization.Quests)
end

function DailyGlobalCheck.LocalizeQuestNames()
 -- empty for compatibility reasons
end


