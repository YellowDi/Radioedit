-- Daily Global Check
-- by Jadya
-- EU-Well of Eternity

--[[ v1.2 pages functions ]]--

local addonTitle, addonTable = ...
local L = addonTable.L
local C = addonTable.C

local lists = DailyGlobalCheck.ListFunctions
local pages = DailyGlobalCheck.PagesFunctions
pages.PageSelector = {}

local max_pages = 30

local function extract_data(list)
 if not lists:isList(list) then list = DailyGlobalCheck.SelectedList end 
 if not lists:isList(list) then
  return ""
 else
  return list["Title"], list["Order"]
 end
end

-- default page value for any list
local function default(t)
 if not t then return 1 end

 if not DailyGlobalCheck_PluginData[t] then
  DailyGlobalCheck_PluginData[t] = {}
 end
 DailyGlobalCheck_PluginData[t].page = 1
 return 1
end

function pages:Max(list)
 local _, order = extract_data(list)
 
 if not order then return 1 end
 
 return #order
end

function pages:Curr(list)
 local title = extract_data(list)
 local svar = DailyGlobalCheck_PluginData[title]

 if not svar or not svar.page then
  return default(title)
 else
  return svar.page
 end
end

function pages:New(list)
 if not lists:isList(list) then return end

 local count = pages:Max(list)

 if count >= max_pages then return end
 
 list["Order"][count + 1] = {{L["new_group"]}}
end

function pages:Remove(list)
 if not lists:isList(list) or pages:Max(list) == 1 then return end
 
 local page = pages:Curr(list)
 
 table.remove(list["Order"], page)
 
 if page > pages:Max(list) then
  pages:Move(list, -1)
 end
end

function pages:Move(list, i)
 
 if not list then return end

 local title, order = extract_data(list)
 local svar = DailyGlobalCheck_PluginData[title]
 
 if not svar or not svar.page then
  return default(title)
 else
  svar.page = svar.page + i
  
  local count = table.getn(order)
  local result = svar.page
  svar.page = math.max(1,math.min(count, svar.page))

  return result == svar.page
 end
end

function pages:GetString(list)
 if not list then return "" end
 return string.format(COLLECTION_PAGE_NUMBER,pages:Curr(list),pages:Max(list))
end

-- folding
function pages:GetFolding(plugin, page, group)
 local svar = DailyGlobalCheck_PluginData[plugin]
 if not svar.folding then
  svar.folding = {}
 end
 
 if not svar.folding[page] or DailyGlobalCheck_PluginData[plugin].folding[page][group] ~= false then
  return true
 else
  return false
 end
end

function pages:Fold(f)
 local mode = DailyGlobalCheck.mode
 
 if not DailyGlobalCheck.SelectedList then return end
 
 local title
 local page 
 
 if mode == C.MODE_OVERVIEW then
  title = "_overview"
  page = 1
 else
  title = DailyGlobalCheck.SelectedList.Title
  page = pages:Curr()
 end

 local svar = DailyGlobalCheck_PluginData[title]
 
 if not svar.folding[page] then
  svar.folding[page] = {[f.group] = false}
  return
 end

 local folding = pages:GetFolding(title, page, f.group)
 if folding == false then
  DailyGlobalCheck_PluginData[title].folding[page][f.group] = nil
  for k in pairs(DailyGlobalCheck_PluginData[title].folding[page]) do
   return
  end
  DailyGlobalCheck_PluginData[title].folding[page] = nil
 else
  DailyGlobalCheck_PluginData[title].folding[page][f.group] = false
 end
end




