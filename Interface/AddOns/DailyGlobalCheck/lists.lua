-- Daily Global Check
-- by Jadya
-- EU-Well of Eternity

--[[ v1.3 lists functions ]]--

local addonName, addonTable = ...
local L = addonTable.L

local lists = DailyGlobalCheck.ListFunctions
local pages = DailyGlobalCheck.PagesFunctions
local maps  = DailyGlobalCheck.MapFunctions
local dgcicon = "Interface\\icons\\INV_Sigil_Freya"

function lists:isList(v)
 if not v or type(v) ~= "table" then return end
 
 return (v.Title and v.Icon and v.Order)
end

function lists:isPlugin(title)
 local _,_,container = lists:Find(title, false)
 return container == DailyGlobalCheck.Lists
end

function lists:GetSvar(v)
 if not lists:isList(v) then return end

 if not DailyGlobalCheck_PluginData[v["Title"]] then
  DailyGlobalCheck_PluginData[v["Title"]] = {}
 end
 
 return DailyGlobalCheck_PluginData[v["Title"]]
end

------- active lists -------
function lists:isActive(v)
 if not lists:isList(v) or not DailyGlobalCheck_PluginData[v["Title"]] then 
  return
 else
  return DailyGlobalCheck_PluginData[v["Title"]].active
 end
end

function lists:setActive(v, bool)
 if not lists:isList(v) then return end

 if not DailyGlobalCheck_PluginData[v["Title"]] then
  DailyGlobalCheck_PluginData[v["Title"]] = {}
 end

 DailyGlobalCheck_PluginData[v["Title"]].active = bool
 maps:UpdateList("worldmap", v)
 maps:UpdateList("minimap", v)
end
----------------------------

------- show plugin worldmap and minimap icons -------
function lists:getShowMapIcons(list, t)
 if not lists:isList(list) then return end

 local svar = lists:GetSvar(list)
 return svar["show_mapicons_"..t] == nil or svar["show_mapicons_"..t]
end

function lists:setShowMapIcons(list, t, bool)
 if not lists:isList(list) then return end

 local svar = lists:GetSvar(list)

 svar["show_mapicons_"..t] = bool
end

local buffer = {}
function lists:getShowPagesTable(list)
 if not lists:isList(list) then return end
 
 local svar = lists:GetSvar(list)
 local m = pages:Max(list)

 for i = 1, m do
  buffer[i] = not svar["mapicons_pages"] and "1" or select(i, strsplit(";", svar["mapicons_pages"]))
 end
 return buffer
end

function lists:getShowPage(list, page)
 if not lists:isList(list) then return end
 
 local svar = lists:GetSvar(list)
 return not svar["mapicons_pages"] and "1" or select(page, strsplit(";", svar["mapicons_pages"]))
end

function lists:setShowPage(list, page, value)
 if not lists:isList(list) then return end

 local t = lists:getShowPagesTable(list)
 local result = ""
 for i = 1, pages:Max(list) do
  if i == page then
   result = result..";"..(value and "1" or "0")
  else
   result = result..";"..(t[i] or "1")
  end
 end
 result = result:sub(2, #result)
 lists:GetSvar(list)["mapicons_pages"] = result
end
------------------------------------------------------

function lists:Count()
 return #(DailyGlobalCheck.Lists) + #(DGC_CustomLists.Lists)
end

function lists:FindFirst(active)

 if active == false then
  return DailyGlobalCheck.Lists[1] or DGC_CustomLists.Lists[1]
 end

 local i = 1
 local container = DailyGlobalCheck.Lists

 while i <= #container do
  if lists:isActive(container[i]) then
   return container[i]
  end
  i = i + 1
 end
 
 i = 1
 container = DGC_CustomLists.Lists
 
 while i <= #container do
  if lists:isActive(container[i]) then
   return container[i]
  end
  i = i + 1
 end
end

function lists:Find(title, active)
 for k,v in pairs(DailyGlobalCheck.Lists) do
  if v.Title == title and (active == false or lists:isActive(v)) then
   return k, v, DailyGlobalCheck.Lists
  end
 end

 if not DGC_CustomLists.Lists then return end
 
 for k,v in pairs(DGC_CustomLists.Lists) do
  if v.Title == title and (active == false or lists:isActive(v)) then
   return k, v, DGC_CustomLists.Lists
  end
 end
end

function lists:CheckVersion(v)
 return v.Version and v.Version == DailyGlobalCheck:GetVersion()
end

function lists:New()
 local title = L["newlist"]
 local counter = 1
 
 while lists:Find(title, false) do
  title = L["newlist"].." ("..counter..")"
  counter = counter + 1
 end

 local result = {}
 result.Title   = title
 result.Icon    = dgcicon
 result.Version = DailyGlobalCheck:GetVersion()
 result.Order   = {}
 pages:New(result)
 return result
end

function lists:Rename(list, newtitle)
 
 local _, l = lists:Find(newtitle)
 if l and l ~= list then return end
 
 local oldtitle = list.Title
 
 list.Title = newtitle

 if not DailyGlobalCheck_PluginData[oldtitle] then return end
 
 local old_list = DailyGlobalCheck_PluginData[oldtitle]
 DailyGlobalCheck_PluginData[oldtitle] = nil
 DailyGlobalCheck_PluginData[newtitle] = old_list
 
 if DailyGlobalCheck_PluginData.last_selected and DailyGlobalCheck_PluginData.last_selected == oldtitle then
  DailyGlobalCheck_PluginData.last_selected = newtitle
 end
 
 return true
end

function lists:Remove(title)
 local i, _, list = lists:Find(title, false)
 
 if not i then return end

 maps:RemoveList("worldmap", list)
 maps:RemoveList("minimap", list)

 table.remove(list, i)
end

function lists:ContainsQuest(v, questID)
 if not lists:isList(v) then return end

 for pp,pages in pairs(v.Order) do
  for pi,page in pairs(pages) do
   for i,qID in pairs(page) do
    if qID == questID then
	 return pp, pi, i
	end
   end
  end
 end
end

function lists:UpdatePluginDataSVar()
 for k in pairs(DailyGlobalCheck_PluginData) do
  if k ~= "last_selected" and not lists:Find(k, false) then
   DailyGlobalCheck_PluginData[k] = nil
  end
 end
end




