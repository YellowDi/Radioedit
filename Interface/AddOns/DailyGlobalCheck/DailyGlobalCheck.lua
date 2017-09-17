-- Daily Global Check
-- by Vildiesel
-- EU-Well of Eternity

local addonName, addonTable = ...

local dgc, max, tinsert = DailyGlobalCheck, math.max, table.insert

local ldb = LibStub:GetLibrary("LibDataBroker-1.1")
local ldbicon = ldb and LibStub("LibDBIcon-1.0", true)
addonTable.ldbicon = ldbicon

local L = addonTable.L -- localization
local C = addonTable.C -- constants
local T = addonTable.T -- textures
 
local AddColor = addonTable.AddColor

local addontitle = "|cff00AAFFDaily Global Check|r"
local addontitle_short = "|cff00AAFFDGC|r"

--[[ questdata structure
 1  - zone
 2  - name
 3  - prefix
 4  - suffix
 5  - mapdata  { mapID, x, y, nil(reserved), ... }
 6  - mapdata behavior (nil == normal, 0 == no icons)
 7  - questtype
 8  - mapicon
 9  - showfunc
 10 - completedfunc
 11 - plugin title
 12 - hidden in the quests pool (edit mode)
 13 - overlay info
 14 - map icon special mouse up function
 15 - dynamic icon id (overrides [8])
]]

function dgc:GetVersion()
 return C.version, C.minor_version
end

-- saved variables
DGC_CustomLists = {}
DailyGlobalCheck_CharData = {}

-- ext
local chars        = dgc.CharFunctions
local pages        = dgc.PagesFunctions
local options      = dgc.OptFunctions
local constructors = dgc.Constructors
local lists        = dgc.ListFunctions
local maps         = dgc.MapFunctions
local quest        = dgc.QuestFunctions
local modes        = dgc.ModeFunctions
local tools        = dgc.Tools

local charData = dgc_CharData
local pName = GetUnitName("player")
local pRealm = GetRealmName()
addonTable.pID = pName.."-"..pRealm
local pID = addonTable.pID

dgc.Lists = {}
--
dgc.player_faction = UnitFactionGroup("player") or ""
dgc.selectedpID = pID
---
local DGCTTmenu = {}
local DGCMMmenu = {}
--
-- quests data pool
dgc.QuestsData = {}
local questsdata = dgc.QuestsData
local questsdata_duplicates = {}
local counter = 0

---- metatables ----
local function setmeta(t, meta)
 if not getmetatable(t) then
  setmetatable(t, meta)
 end
end

local questdata_template = {"", L["namemissing"], "", "", nil, nil, 2}
local meta_qd_template = { __index = questdata_template }
addonTable.meta_qd_template = meta_qd_template
local function meta_qd_template_newindex(t, k, v)
 rawset(t, k, v)
 if v then
  setmeta(v, meta_qd_template)
 end
end
local meta_qd_newindex = { __newindex = meta_qd_template_newindex }
--------

-- fixed lists (plugins) and custom lists (saved variables)
function dgc:foreachLists(func, active)
 for k,v in pairs(dgc.Lists) do
  if active == false or lists:isActive(v) then
   func(k,v)
  end
 end
 
 if not DGC_CustomLists.Lists then return end
 
 for k,v in pairs(DGC_CustomLists.Lists) do
  if active == false or lists:isActive(v) then
   func(k,v)
  end
 end
end

function dgc:foreachQData(func)
 for k,v in pairs(dgc.QuestsData) do
  func(k,v)
 end

 for k,v in pairs(questsdata_duplicates) do
  for plugin,data in pairs(v) do
   func(plugin.."<!"..k, data)
  end
 end

 if not DGC_CustomLists.QuestsData then return end
 
 for k,v in pairs(DGC_CustomLists.QuestsData) do
  func(k,v)
 end
end

function dgc:getQData(questID, plugin)
 if plugin then
  local s = plugin.."<!"..questID
  return dgc.QuestsData[s] or dgc.QuestsData[questID]
 else
  return dgc.QuestsData[questID] or DGC_CustomLists.QuestsData[questID]
 end
end
--

function dgc.GetRealQuestID(questID, plugin)
 local s = plugin.."<!"..questID
 return dgc.QuestsData[s] and s or questID
end

function dgc:NormalizeQuestID(questID)
 local plugin, qID
 local i = strfind(questID, "<!")
 
 if i then
  plugin  = questID:sub(1, i - 1)
  qID = questID:sub(i + 2, #questID)
  return qID, plugin
 else
  return questID
 end 
end
------------------------------------------------------------------------------
function dgc:GetCoord(data)
 
 local function beautify(coord)
  local s = tostring(math.floor(coord * 10) / 10)
  local i = strfind(s, "%.")
  if i then
   if i < 2 then s = "0"..s end
  else
   s = s..".0"
  end
  if coord < 10 then s = "0"..s end
  return s
 end

 local v = data[5] -- map data
 --local behavior = data[6]
 return v and AddColor(beautify(v[2]).."  "..beautify(v[3]), DailyGlobalCheck_Options.Colors[5]) or ""
end

------------------------------------------------------------------------------
function dgc.isquestcompleted(questID, mainCharOnly, notSelectedPlugin, qdata)

 --if true then return end

 local list = notSelectedPlugin or dgc.SelectedList

 local data = qdata or dgc:getQData(questID, list and list.Title or nil)

 if data and data[7] == 13 then return false end
 
 if not mainCharOnly and dgc.selectedpID ~= pID and not (data and quest:IsAccountWide(data[7])) then
  return chars:isquestcompleted(questID, dgc.selectedpID, data)
 end

 questID = dgc:NormalizeQuestID(questID)
 questID = tonumber(questID) or questID
 -- iscompleted custom function
 if data and data[10] then
  if type(data[10]) == "function" then
   dgc.result, dgc.cs, dgc.reset = data[10](questID)
   DGCEventFrame:Fire("ON_DRAW_COMPLETION", questID, data)
   return dgc.result, dgc.cs, dgc.reset
  elseif type(data[10]) == "string" then
   return false -- temporary, string completion functions to be implemented
  end
 elseif type(questID) ~= "number" then
  dgc.result, dgc.cs, dgc.reset = quest:isquestcompleted(questID)
  DGCEventFrame:Fire("ON_DRAW_COMPLETION", questID, data)
  return dgc.result, dgc.cs, dgc.reset
 else
  return IsQuestFlaggedCompleted(questID)
 end
end
local isquestcompleted = dgc.isquestcompleted
------------------------------------------------------------------------------
local function isshown(questID, plugin)
 local qData = dgc:getQData(questID, plugin)
 if not qData then return false end

  -- fire the show func if present
 return qData[9] == nil or qData[9](questID)
end
addonTable.isshown = isshown

function dgc:RefreshTitle()
 local f = DGC_Mainframe
 local SelectedList = dgc.SelectedList
 
 if not f then return end

 local plugintitle = SelectedList and AddColor(SelectedList["Title"], "LIST_COLOR") or ""
 local mode = dgc.mode or 1
 
 if mode ~= C.MODE_CLASSIC and mode ~= C.MODE_OVERVIEW then
  if mode == C.MODE_OPTIONS_PLUGIN then
   f.title:SetText(SelectedList and SelectedList["Title"] or "")
   f.page:SetText("")
  elseif mode == C.MODE_EDIT then
   f.title:SetText(SelectedList and SelectedList["Title"] or "")
   f.page:SetText(pages:GetString(SelectedList))
  else
   f.title:SetText("")
   f.page:SetText("")
  end
 
  f.listTitle:SetText(AddColor(C.modes[mode].name, "LIST_COLOR"))
  return
 end

 if SelectedList then
  local suff = pID ~= dgc.selectedpID and AddColor(" "..L["opt_characters_short"], "LIGHT_BLUE") or ""
  local name = strsplit("-", (dgc.selectedpID or ""))
  local title = AddColor(name..suff, chars:GetCharClass(dgc.selectedpID))
  f.title:SetText(mode == C.MODE_OVERVIEW and AddColor(OVERVIEW, "LIGHT_BLUE") or title)
  -- pages
  f.page:SetText(pages:GetString(SelectedList))
 end
 f.listTitle:SetText(plugintitle)
end
---------------------------- TomTom Menu Frame -------------------------------------
local function setTomTomWaypoint(...)
 TomTom:AddMFWaypoint(...)
 local t = select(5, ...)
 print(L["s_tomtomset"].." ("..AddColor(t.title, "LIGHT_BLUE")..")")
end
addonTable.setTomTomWP = setTomTomWaypoint -- temporary until I fix the TomTom interface

function dgc:ShowTomTomMenu()
 if not dgc.SelectedList then return end
 DGCMenuFrame:SetPoint("TOP",DGC_Mainframe.TomTombutton,"BOTTOM",0,-5)
 EasyMenu(DGCTTmenu, DGCMenuFrame, DGCMenuFrame, 0 , 0, "MENU")
end

local function GenerateTomTomMenu()

 if not TomTom or not DGCMenuFrame or not dgc.SelectedList then return end

  local function CreateSubMenu(q)
   local submenu = {}
   for index,questID in pairs(q) do
    local data = dgc:getQData(questID)
    if index > 1 and data and isshown(questID) and data[5] then
    tinsert(submenu, { text = data[2].." - "..AddColor(data[1],"GRAY").." "..dgc:GetCoord(data),
                            disabled = isquestcompleted(questID) or not data[5],
                            notCheckable = 1,
                            keepShownOnClick = true,
                            func = function(self)
                               if data and data[5] then
                                 setTomTomWaypoint(data[5][1], nil,
                                            data[5][2] / 100,
                                            data[5][3] / 100,
                                          { title = data[2]})
                               end
                              end
                              })
     end
    end
    return submenu
   end

  wipe(DGCTTmenu)
  tinsert(DGCTTmenu, {text = AddColor("- TomTom Waypoints -","GOLD"),notCheckable = 1, isTitle = true})
  tinsert(DGCTTmenu, {text = AddColor("Click either a single quest or a group","LIGHT_BLUE"),notCheckable = 1, isTitle = true})
  tinsert(DGCTTmenu, {text = AddColor("to set TomTom waypoints","LIGHT_BLUE"),notCheckable = 1, isTitle = true})
  tinsert(DGCTTmenu, {text = "",notCheckable = 1, isTitle = true})

  table.foreach(dgc.SelectedList["Order"], function(k,tab)
   local pref = "|T"..dgc.SelectedList["Icon"]..":12|t"
   table.foreach(tab, function(header,quests)
    if table.getn(quests) > 1 then
    tinsert(DGCTTmenu, { text = quests[1] ~= "" and pref..quests[1] or pref..L["notitle"],
                              keepShownOnClick = true,
                              notCheckable = 1,
                       func = function(self)
                               table.foreach(quests, function(index, questID)
							    if index > 1 then
 								 local data = dgc:getQData(questID)
                                  if data and data[5] and not isquestcompleted(questID) and isshown(questID) then
                                   TomTom:AddMFWaypoint(data[5][1], nil,
                                              data[5][2] / 100,
                                              data[5][3] / 100,
                                            { title = data[2] } )
                                   print(L["s_tomtomset"].." ("..AddColor(data[2],"LIGHT_BLUE")..")")
                                 end
								end
                               end)
                              end,
                       hasArrow = true,
		               menuList = CreateSubMenu(quests)})
	end
   end)
  end)
  tinsert(DGCTTmenu, {text = "", isTitle = true, notCheckable = 1})
  tinsert(DGCTTmenu, {text = CLOSE, notCheckable = 1})
end

---------------------------- Generate Line (used by drawtooltip and /dgc print) -------------------------------------
local function GenerateLine(questID, cstring)
 local s1 = ""
 local O = DailyGlobalCheck_Options
 local data = dgc:getQData(questID)

 if not data then return L["questdatamissing"] end

 local questtype = data[7]

 -- quest type
 if O["show_questtype"] then
  s1 = s1..AddColor("["..(C.questtype_strings[questtype] or "").."]", "LIGHT_BLUE") 
 end
 -- prefix
 if O["show_prefix"] then
  s1 = s1..AddColor(data[3], O.Colors[3])
 end
 -- zone name
 if O["show_zone"] then
  s1 = s1..AddColor(data[1], O.Colors[1])
 end
 -- quest name
 s1 = s1.." "..AddColor(data[2], O.Colors[2])
 -- suffix
 if O["show_suffix"] then
  s1 = s1..AddColor(data[4], O.Colors[4])
 end
 -- coordinates
 if O["show_coordinates"] then
  s1 = s1.." "..AddColor(dgc:GetCoord(data), O.Colors[5])
 end
 
 return s1, questtype
end
------------------------------------------ Draw Tooltip --------------------------------------------------------
local function DrawTooltip(tt)
 local O = DailyGlobalCheck_Options

 if not dgc.SelectedList then
  if lists:Count() == 0 then
   tt:AddDoubleLine(AddColor("No active lists","LIGHT_RED")," ")
  else
   tt:AddDoubleLine(AddColor(L["nolist"],"LIGHT_RED")," ")
  end
 else
  local mode = dgc.mode or 1
  local questsorder
  local index 
  if mode == C.MODE_OVERVIEW then
   questsorder = modes:GetOverviewOrder()
   index = 1
  else
   questsorder = dgc.SelectedList.Order
   index = pages:Curr()
  end

  DGCEventFrame:Fire("ON_DRAW", dgc.SelectedList, lists:isPlugin(dgc.SelectedList.Title))
  
  if not questsorder[index] then return end
  
  local s1,s2,qt
  for k,v in pairs(questsorder[index]) do
   local folding = pages:GetFolding(mode == C.MODE_OVERVIEW and "_overview" or dgc.SelectedList.Title, index, k)
   if folding then
   
   if v[1] ~= "" then
    tt:AddDoubleLine(AddColor(v[1], O.Colors[6])," ")
   end
   
    for i = 2,#v do
     local questID = v[i]
	  if isshown(questID, dgc.SelectedList.Title) then
	   local completed, cstring, reset = isquestcompleted(questID, true)
	   if not DailyGlobalCheck_Options["hide_completed"] or (not completed or cstring or reset) then
	    if cstring == nil then 
	     cstring = completed and COMPLETE or INCOMPLETE
	    end
        s1, qt = GenerateLine(questID)
        s2 = qt == 13 and AddColor(L["repeatable"], O.Colors[9])                      -- repeatable
	                  or AddColor(cstring, completed and O.Colors[7] or O.Colors[8]) -- custom cstring or complete/incomplete
        tt:AddDoubleLine(s1,s2,questID)
	   end
	  end
     end
     tt:AddDoubleLine(" "," ")
    end
   end
  end
  
 tt:AddLine(pages:GetString(dgc.SelectedList))
 tt:AddLine(AddColor(L["lclicktoopen"],"LIGHT_BLUE"))
 tt:AddLine(AddColor(L["rclicktoopen"],"LIGHT_BLUE"))
 tt:Show()
end

------------------------------------------ Draw Frame (fill button) ----------------------------------------------------
local columns_w = {}

local function getBtn(i)
 local result = DGC_Mainframe.panels[1].buttons[i] or constructors:QuestButton(i, DGC_Mainframe.panels[1])
 
 if not DGC_Mainframe.panels[1].buttons[i] then
  DGC_Mainframe.panels[1].buttons[i] = result
 end
 
 return result
end

local function adjustColumnsSize(f)
 columns_w[1] = max(columns_w[1] or 0, f.zone:GetStringWidth())
 columns_w[2] = max(columns_w[2] or 0, f.name:GetStringWidth())
 columns_w[3] = max(columns_w[3] or 0, f.prefix:GetStringWidth())
 columns_w[4] = max(columns_w[4] or 0, f.suffix:GetStringWidth())
 columns_w[5] = max(columns_w[5] or 0, f.coords:GetStringWidth())
 columns_w[6] = max(columns_w[6] or 0, f.completed:GetStringWidth())
end

local function fillButtonText(i, s1, s2)
 local f = getBtn(i)
 f:FillText(s1, s2)
 return f
end

local function fillButtonData(i, questID, cstring)

 local f = getBtn(i) 
 f:FillDataByID(questID, cstring, dgc.SelectedList["Title"]) 
 adjustColumnsSize(f)
 return f
end

------------------------------------------ Draw Frame --------------------------------------------------------
local function DrawFrame()
 local f = DGC_Mainframe
 
 local button = 1
 wipe(columns_w)
 
 ---
 local function fillButton(t, ...)
  local btn
  if t == "data" then
   btn = fillButtonData(button, ...)
   btn.noresize = nil
  elseif t == "text" then
   btn = fillButtonText(button, ...)
   btn.noresize = true
  else
   return
  end
  btn:Show()
  button = button + 1
 end
 ---
 
 if not dgc.SelectedList then
  if lists:Count() == 0 then
   fillButton("text", AddColor("No Lists Available", "LIGHT_RED"))
   f.panels[1].buttons[button - 1].folding:Hide()
  else
   fillButton("text", AddColor(L["nolist"], "LIGHT_RED"))
   f.panels[1].buttons[button - 1].folding:Hide()
  end
  -- hide the remaining buttons
  f.panels[1]:HideQuestButtons(2)
  f:SetSize(300, 150)
  return
 end
 
 local mode = dgc.mode or 1
 local questsorder 
 local index 
 if mode == C.MODE_OVERVIEW then
  questsorder = modes:GetOverviewOrder()
  index = 1
 else
  questsorder = dgc.SelectedList.Order
  index = pages:Curr()
 end

 DGCEventFrame:Fire("ON_DRAW", dgc.SelectedList, lists:isPlugin(dgc.SelectedList.Title))

 if not questsorder[index] then return end

 for k = 1,#questsorder[index] do
  local folding = pages:GetFolding(mode == C.MODE_OVERVIEW and "_overview" or dgc.SelectedList.Title, index, k)

  local v = questsorder[index][k]
  if v[1] ~= "" then
   fillButton("text", AddColor(v[1], DailyGlobalCheck_Options.Colors[6]))
   f.panels[1].buttons[button - 1].folding.group = k
   f.panels[1].buttons[button - 1].folding:Show()
   if not folding then
    f.panels[1].buttons[button - 1].folding.icon:Show()
   else
    f.panels[1].buttons[button - 1].folding.icon:Hide()
   end
  end

  if folding then
   for i = 2,#v do
    local questID = v[i]
    if isshown(questID) then
     local completed, cstring, reset = isquestcompleted(questID, istooltip)
     if not DailyGlobalCheck_Options["hide_completed"] or (not completed or cstring or reset) then
      if cstring == nil then cstring = completed and COMPLETE or INCOMPLETE end
	  fillButton("data", questID, AddColor(cstring, completed and DailyGlobalCheck_Options.Colors[7] or DailyGlobalCheck_Options.Colors[8]))
      f.panels[1].buttons[button - 1].folding:Hide()
     end
    end
   end
  else
   fillButton("text", AddColor(L["collapsed"], "LIGHT_BLUE"))
   f.panels[1].buttons[button - 1].folding:Hide()
  end
  fillButton("text", " ")
  f.panels[1].buttons[button - 1].folding:Hide()
 end

 -- hide the remaining buttons
 f.panels[1]:HideQuestButtons(button - 1)

 -- create some space for the buttons
 local offset = C.pluginbtnsize * 5

 local w = 0
 
 for i = 1,6 do
  w = w + (columns_w[i] and columns_w[i] + 5 or 0)
 end

 f:SetSize(max(350, w + 30), button * 12 + offset)
 
 for i = 1, button - 1 do
  if not f.panels[1].buttons[i].noresize then
   f.panels[1].buttons[i].zone:SetWidth     (columns_w[1] and columns_w[1] + 5 or 0)
   f.panels[1].buttons[i].name:SetWidth     (columns_w[2] and columns_w[2] + 5 or 0)
   f.panels[1].buttons[i].prefix:SetWidth   (columns_w[3] and columns_w[3] + 5 or 0)
   f.panels[1].buttons[i].suffix:SetWidth   (columns_w[4] and columns_w[4] + 5 or 0)
   f.panels[1].buttons[i].coords:SetWidth   (columns_w[5] and columns_w[5] + 5 or 0)
   f.panels[1].buttons[i].completed:SetWidth(columns_w[6] and columns_w[6] + 5 or 0)
  end
 end
 local title = DGC_Mainframe.listTitle
 local w = title:GetWidth()
 title:SetPoint("TOPLEFT", DGC_Mainframe, "TOPLEFT", (DGC_Mainframe:GetWidth() - 70) / 2 - w / 2, -15)
end
---------------------------- Chat Output ---------------------------------------------
local function ChatOutput()
 if not dgc.SelectedList or not dgc.SelectedList["Order"][pages:Curr()] then return end

 local s1,s2,qt
 for k,v in pairs(dgc.SelectedList["Order"][pages:Curr()]) do
 if v[1] ~= "" then
  print(AddColor(v[1], DailyGlobalCheck_Options.Colors[6]))
 end
 for i,questID in pairs(v) do
        if i > 1 then
	    if isshown(questID) then
			local completed, cstring = isquestcompleted(questID)
			if cstring == nil then cstring = completed and COMPLETE or INCOMPLETE end
            s1, qt = GenerateLine(questID)
			s2 = qt == 13 and AddColor(L["repeatable"], DailyGlobalCheck_Options.Colors[9])                       -- repeatable
	                      or AddColor(cstring, completed and DailyGlobalCheck_Options.Colors[7] or DailyGlobalCheck_Options.Colors[8]) -- custom cstring or complete/incomplete
            print(s1.." "..s2)
		end
     end
  end
 end
end
---------------------------- push data -----------------------------------------
function dgc:PushData(v, list, refresh)
 setmeta(v, meta_qd_newindex)
 
 if not lists:isList(list) then return end
 
 local plugin = list and list.Title

 for qID, qData in pairs(v) do
  qData.questID = qID
  setmeta(qData, meta_qd_template)

  local td = rawget(questsdata, qID)
  if (not td or td[11] == plugin) and not rawget(questsdata_duplicates, tostring(qID)) then
   questsdata[qID] = qData
   questsdata[qID][11] = plugin
   questsdata[qID][8] = questsdata[qID][8] or list.Icon
  elseif plugin then
   local old_data = questsdata[qID]
   questsdata[qID] = nil

   qID = tostring(qID)
   if not questsdata_duplicates[qID] then questsdata_duplicates[qID] = {} end

   questsdata_duplicates[qID][plugin] = qData
   questsdata_duplicates[qID][plugin][11] = plugin
   questsdata_duplicates[qID][plugin][8] = qData[8] or list.Icon

   if old_data and old_data[11] and old_data[11] ~= plugin then
    questsdata_duplicates[qID][old_data[11]] = old_data
   end
  else
   --print("Daily Global Check - quest "..qID.." was not added because it already exists and cannot be a duplicate (no source plugin specified)")
  end
 end

 if refresh and dgc.SelectedList and dgc.SelectedList.Title == plugin then
  dgc:Refresh()
 end
end

function dgc:OpenList(v)
 local list = type(v) == "string" and select(2, lists:Find(v)) or v

 if not v or not lists:isList(list) then
  dgc.SelectedList = nil
  dgc:Refresh()
  GenerateTomTomMenu()
  DailyGlobalCheck_PluginData.last_selected = nil
  if DGC_Mainframe then
   DGC_Mainframe:SelectListButton(nil)
  end
  return
 end

 dgc.SelectedList = list
 DailyGlobalCheck_PluginData.last_selected = list.Title
 GenerateTomTomMenu()
 if not dgc.mode or dgc.mode <= C.MODE_OVERVIEW then
  local lastmode = DailyGlobalCheck_PluginData[list.Title].last_mode or C.MODE_CLASSIC
  modes:Set(lastmode)
 else
  dgc:Refresh()
 end
 if DGCMenuFrame then DGCMenuFrame:Hide() end
 if DGC_Mainframe then
  DGC_Mainframe:SelectListButton(dgc.SelectedList.Title)
 end
end
---------------------------------------------------------------------
local function GenerateMinimapMenu()
 if not DGCMMmenu then return end

  local function CreateListsMenu()
   local submenu = {}
    dgc:foreachLists(function(k,v)
    tinsert(submenu, { text = v["Title"],
                            notCheckable = 1,
                            keepShownOnClick = true,
                            func = function()
                               dgc:OpenList(v)
                              end
                              })
    end)
    return submenu
   end

  DGCMMmenu = {}
  tinsert(DGCMMmenu, {text = AddColor(L["availablelists"],"GOLD"),notCheckable = 1, hasArrow = true, menuList = CreateListsMenu()})
  
  if TomTom and DGCTTmenu then
   tinsert(DGCMMmenu, {text = AddColor("TomTom","GOLD"),notCheckable = 1, hasArrow = true, menuList = DGCTTmenu})
  end
  
  tinsert(DGCMMmenu, {text = "", isTitle = true, notCheckable = 1})

  tinsert(DGCMMmenu, {text = L["prevpage"], notCheckable = 1, func = function() 
   if pages:Move(dgc.SelectedList, -1) and DGC_Mainframe then
    DGC_Mainframe:SetAnchor("BOTTOMLEFT")
    dgc:Refresh(dgc.SelectedList)
   end
  end})
  
  tinsert(DGCMMmenu, {text = L["nextpage"], notCheckable = 1, func = function() 
   if pages:Move(dgc.SelectedList, 1) and DGC_Mainframe then
    DGC_Mainframe:SetAnchor("BOTTOMLEFT")
    dgc:Refresh(dgc.SelectedList)
   end
  end})
--  table.insert(DGCTTmenu, {text = "",notCheckable = 1, isTitle = true})
  tinsert(DGCMMmenu, {text = "", isTitle = true, notCheckable = 1})
  tinsert(DGCMMmenu, {text = CLOSE, notCheckable = 1})
  EasyMenu(DGCMMmenu, DGCMenuFrame, "cursor", -100 , 0, "MENU")
end

-- slash command
function DGCInit(arg)

 if arg == "print" then
  print(AddColor("Daily Global Check","LIGHT_BLUE"))
  local last_pID = dgc.selectedpID
  dgc.selectedpID = addonTable.pID
  ChatOutput()
  dgc.selectedpID = last_pID
  print(AddColor("---","LIGHT_BLUE"))
  return
 end

 -- constructor moved to constr_mainframe.lua
 if not DGC_Mainframe then constructors:MainFrame() end

 local f = DGC_Mainframe
 
 local a1, _, a2, x, y = unpack(DailyGlobalCheck_Options["frame_position"] or {})
 if not a1 then
  f:SetPoint("CENTER")
 else
  f:SetPoint(a1, UIParent, a2, x, y)
 end
 
 if f:IsVisible() then
  f:Hide()
  if DGCMenuFrame then DGCMenuFrame:Hide() end
  collectgarbage()
 else
  local lastmode
  if dgc.SelectedList and dgc.SelectedList["Title"] then
   f:SelectListButton(dgc.SelectedList["Title"])
   lastmode = DailyGlobalCheck_PluginData[dgc.SelectedList.Title].last_mode
  end
  modes:Set(lastmode or C.MODE_CLASSIC)
  f:Show()
 end
end

local function updateMainframeButtons(enabled)
 if not DGC_Mainframe then return end

 for _,v in pairs(DGC_Mainframe.dynamic_buttons) do
  if enabled then
   v:Show()
  else
   if v.open then v:func() end
   v:Hide()
  end
 end
end

function dgc:Refresh(list)
 local mode = dgc.mode

 dgc:RefreshTitle()
 dgc:RefreshListButtons()

 if DGC_Mainframe then 
  DGC_Mainframe.closebtn:Show()
  DGC_Mainframe.dgcicon:SetTexture(T.dgcicon)
  if C.modes[mode].x and C.modes[mode].y then
   DGC_Mainframe:SetSize(C.modes[mode].x, C.modes[mode].y)
  end
 end

 if mode == C.MODE_CLASSIC or mode == C.MODE_OVERVIEW then
  if not list or dgc.SelectedList == list then
   if DGC_Mainframe then
    DGC_Mainframe:UpdateArrows()
    DrawFrame()
	DGC_Mainframe.dgcicon:SetTexture(dgc.SelectedList and dgc.SelectedList.Icon or T.dgcicon)
   end
  end
  updateMainframeButtons(true)
 elseif mode == C.MODE_OPTIONS_QUEST or mode == C.MODE_OPTIONS_PLUGIN or mode == C.MODE_OPTIONS_MAP then -- options
  updateMainframeButtons(false)
  options:Update(mode)
 elseif mode == C.MODE_LIST_VISIBILITY then -- list visibility
  updateMainframeButtons(false)
 elseif mode == C.MODE_EDIT then -- edit mode
  updateMainframeButtons(false)
  tools:update_edit_panel()
  DGC_Mainframe:UpdateArrows()
  DGC_Mainframe.Lbtn:Show()
  DGC_Mainframe.Rbtn:Show()
  DGC_Mainframe.dgcicon:SetTexture(dgc.SelectedList and dgc.SelectedList["Icon"] or T.dgcicon)
 elseif mode == C.MODE_EDIT_QUEST then
  DGC_Mainframe.closebtn:Hide()
 end
end

local ldbset = false
local eventframe = CreateFrame("FRAME","DGCEventFrame")

-- custom global events, usable by plugins
function eventframe.Hook(self, event, func)
 if not self[event] then self[event] = {} end
 tinsert(self[event], func)
end

function eventframe.Fire(self, event, ...)
 if not self[event] then return end
 for _,v in pairs(self[event]) do
  v(...)
 end
end
--

eventframe:RegisterEvent("PLAYER_LOGIN")
function eventframe.PLAYER_LOGIN(...)
  if DailyGlobalCheck_Localization == nil then DailyGlobalCheck_Localization = {} end
  if DailyGlobalCheck_Localization.Quests == nil then DailyGlobalCheck_Localization.Quests = {} end

  options:Initialize()
  
  local O = DailyGlobalCheck_Options

  -- NyxGUI init
  local ng = NyxGUI(C.NyxGUIVersion)
  ng:Initialize(addonName, O, "main", C.default_theme)
  ng:SetThemeData(addonName, "main", C.default_theme)
  
  maps:Initialize()
  modes:InitializeOverview()
  

  if not DGC_CustomLists.Lists then DGC_CustomLists.Lists = {} end
  if not DGC_CustomLists.QuestsData then DGC_CustomLists.QuestsData = {} end

  DailyGlobalCheck.initialized = true
 
  if O["DGC_Version"] then
   -- v1.2 --> v1.3 conversion
   if O["DGC_Version"] < 1003 then
    O["last_selected"] = nil
    
    for k,v in pairs(DGC_CustomLists) do
     if lists:isList(v) then
	  for qID, QuestsData in pairs(v.Data) do
       DGC_CustomLists.QuestsData[qID] = QuestsData
	  end
	  v.Data = {}
      tinsert(DGC_CustomLists.Lists, v)
	  DGC_CustomLists[k] = nil
	 end
    end
   end

   -- v1.3 --> v1.4 conversion
   if O["DGC_Version"] < 1004 then
   
    for k,v in pairs(DGC_CustomLists.Lists) do
	 if v.MultiCharsEnabled then
	  v.MultiCharsEnabled = nil
	 end
	end
	
    for k,v in pairs(DGC_CustomLists.QuestsData) do
	 local _, _, _, _, mapData, _, qtype = unpack(v)
	 -- quest type
	 if qtype == "Q" then
	  DGC_CustomLists.QuestsData[k][7] = 1
	 elseif qtype == "D" or not qtype then
	  DGC_CustomLists.QuestsData[k][7] = 2
	 elseif qtype == "W" then
	  DGC_CustomLists.QuestsData[k][7] = 3
	  -- 4..10 reserved
	 elseif qtype == "I" then
	  DGC_CustomLists.QuestsData[k][7] = 11
	 elseif qtype == "M" then
	  DGC_CustomLists.QuestsData[k][7] = 12
	 elseif qtype == "R" then
	  DGC_CustomLists.QuestsData[k][7] = 13
	 end

	 -- map data
	 if mapData and type(mapData) == "table" then
	  local newMapData = {}
	  local found
	  for mapID, coords in pairs(mapData) do
	   if type(coords) == "table" then
		tinsert(newMapData, mapID)
		tinsert(newMapData, coords[1])
		tinsert(newMapData, coords[2])
		tinsert(newMapData, "placeholder") -- [4] reserved
		found = true
	   end
	  end
	  if found then
	   for k,v in pairs(newMapData) do
	    if v == "placeholder" then
		 newMapData[k] = nil
		end
	   end
	   DGC_CustomLists.QuestsData[k][5] = newMapData
	   DGC_CustomLists.QuestsData[k][6] = nil
	  end
	 end
	end
   end
  end

  -- metatables
  local meta_questsdata_duplicates = { __index = function(t, k)
                                                 k = tostring(k)
	                                             local questID, plugin = dgc:NormalizeQuestID(k)
                                                 if plugin then
												  if not rawget(t, questID) then return end
												  return rawget(t, questID)[plugin]
												 elseif not rawget(t, k) then
												  return
												 else
												  return (dgc.SelectedList and rawget(t, k)[dgc.SelectedList.Title])
												 end
                                                end
									 }

  local meta_qd_main_list   = { __newindex = meta_qd_template_newindex,
                                __index = DGC_CustomLists.QuestsData}
                                
  local meta_qd_custom_list = { __newindex = meta_qd_template_newindex,
                                __index = DailyGlobalCheck.WorldQuests.Data}
                                
  local meta_qd_worldquests = { __newindex = meta_qd_template_newindex,
                                __index = questsdata_duplicates}
								 
  -- (main quests data > custom quests data > world quests > duplicates) cascade
  setmeta(dgc.QuestsData, meta_qd_main_list)
  setmeta(DGC_CustomLists.QuestsData, meta_qd_custom_list)
  setmeta(dgc.WorldQuests.Data, meta_qd_worldquests)
  setmeta(questsdata_duplicates, meta_questsdata_duplicates)
  
  for k,v in pairs(DGC_CustomLists.QuestsData) do
   setmeta(v, meta_qd_template)
   v.questID = k
  end
  --

  for _,v in pairs(DGC_CustomLists.Lists) do
   local svar = DailyGlobalCheck_PluginData[v["Title"]]
   if not svar or svar.active == nil then
    lists:setActive(v, true)
   end
  
   local lastsel = DailyGlobalCheck_PluginData["last_selected"]
   if v.Title == lastsel then
    dgc:OpenList(lastsel)
   end

   maps:UpdateList("worldmap", v)
   maps:UpdateList("minimap", v)
  end

  DGCMenuFrame = CreateFrame("Frame", "DGCMenuFrame", UIParent, "UIDropDownMenuTemplate")

  if O["minimap_icon"] == nil then -- show minimap icon
    O["minimap_icon"] = {
        hide = false,
        minimapPos = 220,
    }
  end
  O["DGC_Version"] = C.version
  
  if ldb and not ldbset then
        local DailyGlobalCheck_broker = ldb:NewDataObject("Daily Global Check", {
	        type = "data source",
	        icon = T.dgcicon,
	        label = "Daily Global Check",
	        OnClick = function(self,button)
			 if button == "LeftButton" then
               DGCInit()
			 elseif button == "RightButton" then
			  GenerateMinimapMenu()
			 end
	        end,
	        OnTooltipShow = function(tooltip)
			 if lists:isList(dgc.SelectedList) then
			  tooltip:ClearLines()
			  tooltip:AddLine(addontitle..AddColor(" ("..dgc.SelectedList["Title"]..")","LIGHT_BLUE"))
		      DrawTooltip(tooltip)
			 end
	    end,
        })
        if ldbicon then
            ldbicon:Register("DailyGlobalCheck_broker", DailyGlobalCheck_broker, O["minimap_icon"])
        end
   ldbset = true
 end
end

eventframe:SetScript("OnEvent", function(self, event, ...) eventframe[event](...) end)

-- "Add quest to Custom List" menubutton in the QuestMap frame
local function hookToggleDropDownMenu(level, value, dropDownFrame, anchorName, xOffset, yOffset, menuList, button, autoHideDelay)
 if dropDownFrame ~= QuestMapQuestOptionsDropDown or not DailyGlobalCheck_Options["show_questlogbtn"] then
  return
 end 

 local questLogIndex = GetQuestLogIndexByID(dropDownFrame.questID)
 local title, _, _, _, _, _, frequency, questID = GetQuestLogTitle(questLogIndex)
 local info = UIDropDownMenu_CreateInfo()

 info.isNotRadio = true
 info.notCheckable = true
 info.isTitle  = true

 -- blank space
 info.text = " "
 UIDropDownMenu_AddButton(info, level)
 -- addon title
 info.text = "|T"..T.dgcicon..":16|t "..addontitle
 UIDropDownMenu_AddButton(info, level)
 -- quest ID
 info.text = AddColor(L["b_questid"].." "..dropDownFrame.questID, "GOLD")
 UIDropDownMenu_AddButton(info, level)
 -- add buttons
 info.isTitle  = false
 info.disabled = false
 info.text = L["add_quest"]
 info.func = function()

  if dgc:getQData(questID) then
   print(L["bf_err2"])
   return
  end

  local data = {}
  local map = GetQuestWorldMapAreaID(questID)
  data[1] = map and GetMapNameByID(map) or ""
  data[2] = title
  data[3] = ""
  data[4] = ""
  data[7] = frequency ~= 2 and frequency or nil
  data.questID = questID
  DGC_CustomLists.QuestsData[questID] = data
  print(string.format(L["questlog_quest_added"], AddColor(title, "NAME_COLOR")))
 end
 UIDropDownMenu_AddButton(info, level)
end

hooksecurefunc("ToggleDropDownMenu", hookToggleDropDownMenu)

-- slash command
SLASH_DAILYGLOBALCHECK1 = "/dgcheck"
SLASH_DAILYGLOBALCHECK2 = "/dgc"
SlashCmdList["DAILYGLOBALCHECK"] = DGCInit
