-- Daily Global Check
-- by Jadya
-- EU-Well of Eternity

local tinsert, tsort = table.insert, table.sort

local addonName, addonTable = ...

local L = addonTable.L
local C = addonTable.C
local AddColor = addonTable.AddColor

local constructors = DailyGlobalCheck.Constructors
local modes        = DailyGlobalCheck.ModeFunctions
local options      = DailyGlobalCheck.OptFunctions
local tools        = DailyGlobalCheck.Tools
local help         = DailyGlobalCheck.HelpFunctions
local pages        = DailyGlobalCheck.PagesFunctions
local lists        = DailyGlobalCheck.ListFunctions

local mf, setup_functions

-- quest buttons
local function setup_panel_1(f)
 f.buttons = {}
 
 f.HideQuestButtons = function(self, from)
  local length = #(self.buttons)
  
  if length == 0 or (from and from > length) then return end

  if not from or from == 0 then 
   from = 1
  end

  for i = from, length do
   self.buttons[i]:Hide()
  end
 end
end

local function createPanel(i)
 local f = CreateFrame("Frame", "DGCMainframePanel"..i, mf)
 
 f:SetPoint("TOPLEFT", mf, "TOPLEFT", 1, -70)
 f:SetPoint("BOTTOMRIGHT", mf, "BOTTOMRIGHT", -1, 70)
 if setup_functions[i] then
  setup_functions[i](f)
 end
 
 mf.panels[i] = f
end

function modes:Hide(mode)
 if mode and mf.panels[C.modes[mode].panel] then
  mf.panels[C.modes[mode].panel]:Hide()
 else
  for _,v in pairs(mf.panels) do
   v:Hide()
  end
 end
end

function modes:Set(mode)
 if not mode then return end
 
 DailyGlobalCheck.mode = mode
 
 if mode <= C.MODE_OVERVIEW and DailyGlobalCheck.SelectedList then
  DailyGlobalCheck_PluginData[DailyGlobalCheck.SelectedList.Title].last_mode = mode
 end
 
 if mf then 
  if not mf.panels then mf.panels = {} end
 
  help:Hide()
  modes:Hide()
 
  -- create a panel only if needed
  if not mf.panels[C.modes[mode].panel] then
   createPanel(C.modes[mode].panel)
  end
  
  local panel = mf.panels[C.modes[mode].panel]
  panel:Show()
 end

 DailyGlobalCheck:Refresh()
end

local function modebutton_onclick(self)
 modes:Set(self.tag)
end

function constructors:ModesFrame(p)
 local ng = NyxGUI(C.NyxGUIVersion)

 mf = DGC_Mainframe
 setup_functions = { setup_panel_1,
                     options.setup_quests_panel,
					 options.setup_plugin_panel,
					 options.setup_map_panel,
					 tools.setup_list_visibility_panel,
                     tools.setup_edit_mode_panel,
                     tools.setup_edit_quest_panel,
				   }

 local f = CreateFrame("Frame", "DGCModesFrame", p)
 f:SetFrameStrata("HIGH")
 f:SetBackdrop({ bgFile = "Interface\\Buttons\\GreyscaleRamp64", 
                          edgeFile = "Interface\\Buttons\\WHITE8X8", 
					   edgeSize = 1
					   })
 f:SetBackdropColor(0.07,0.07,0.07,0.9)
 f:SetBackdropBorderColor(0.1,0.1,0.1,0.9)
 f:SetPoint("LEFT", p, "RIGHT")
 f:SetHeight(390)
 f:SetWidth(200)

 local last_t
 local offsetY, h = -25, 25
 for k,v in pairs(C.modes) do
  if not v.hidden then
   if v.t ~= nil and last_t ~= v.t then
    local lbl = ng:New(addonName, "Label", "DGCModesFrameLabel"..v.t, f)
    lbl:SetPoint("TOPLEFT", f, "TOPLEFT", 0, -offsetY - h)
    lbl:SetPoint("TOPRIGHT", f, "TOPRIGHT", 0, -offsetY - h)
    lbl:SetJustifyH("CENTER")
    lbl:SetHeight(h)
    lbl:SetText(v.t)
    offsetY = offsetY + h * 2
    last_t = v.t
   else
    offsetY = offsetY + h
   end
   
   local btn = ng:New(addonName, "Button", "DGCModesFrameTabbutton"..k, f)
   btn:SetPoint("TOPLEFT", f, "TOPLEFT", 20, -offsetY)
   btn:SetPoint("TOPRIGHT", f, "TOPRIGHT", -20, -offsetY)
   btn:SetText(v.name)
   btn.tag = k
   btn:SetScript("OnClick", modebutton_onclick)
  end
 end
 
 f:SetHeight(offsetY + h + 5)
 f:Hide()
  
 return f
end

-- Overview Mode
local pref = "oview_"
local order, buffer
local function overlay_update(k)
 local O = DailyGlobalCheck_Options
 local list = DailyGlobalCheck.SelectedList
 local index = pages:Curr()
 
 if not list or not list.Order[index] then return end
 
 k = k:gsub(pref, "")
 local s = OVERVIEW..C.overlay_delimiter2..DailyGlobalCheck.GetModCharName(k)..C.overlay_delimiter1.." "..C.overlay_delimiter1

 -- store and override the current selected pID for the isquestcompleted function
 local old_selected_pID = DailyGlobalCheck.selectedpID
 DailyGlobalCheck.selectedpID = k
 
 -- no reason to call it again (called under completion())
-- DGCEventFrame:Fire("ON_DRAW", list)
 
 for _,group in pairs(list.Order[index]) do
  s = s..C.overlay_delimiter1.." "..C.overlay_delimiter1..AddColor(group[1], "GOLD")..C.overlay_delimiter1
  for i = 2,#group do
   if addonTable.isshown(group[i], list.Title) then
    local data = DailyGlobalCheck:getQData(group[i], list.Title)
    if data then
     local completed, cstring, reset = DailyGlobalCheck.isquestcompleted(group[i], k == addonTable.pID)
     if cstring == nil then
	  cstring = completed and COMPLETE or INCOMPLETE
	 end
     cstring = data[7] == 13 and AddColor(L["repeatable"], O.Colors[9])
                              or AddColor(cstring, completed and O.Colors[7] or O.Colors[8])
     s = s..AddColor(data[2], O.Colors[2])..C.overlay_delimiter2..addonTable.GetQuestCompletionText(cstring)..C.overlay_delimiter1
	end
   end
  end
 end

 -- set the old selected character pID
 DailyGlobalCheck.selectedpID = old_selected_pID
 return s
end

local function completion(k)
 local list = DailyGlobalCheck.SelectedList
 local index = pages:Curr()
 
 if not list or not list.Order[index] then return false, "" end

 k = k:gsub(pref, "")
 local old_selected_pID = DailyGlobalCheck.selectedpID
 DailyGlobalCheck.selectedpID = k
 
 DGCEventFrame:Fire("ON_DRAW", list, lists:isPlugin(list.Title))

 local c, t = 0,0
 for _,group in pairs(list.Order[index]) do
  for i = 2,#group do
   local data = DailyGlobalCheck:getQData(group[i], list.Title)
   if data then
    t = t + (data[7] == 13 and 0 or 1)
    if addonTable.isshown(group[i], list.Title) and DailyGlobalCheck.isquestcompleted(group[i], k == addonTable.pID) then
     c = c + 1
    end
   end
  end
 end

 DailyGlobalCheck.selectedpID = old_selected_pID
 return false, AddColor(((c.." / "..t).." "..COMPLETE), c > 0 and "LIGHT_GREEN" or "LIGHT_RED")
end

local function overview_realm_sort(a, b)
 return a[1] < b[1]
end

local function overview_sort(a, b)
 return a < b
end

local realm_indexes = {}
local ri = 1
local function update_character_list()
 local t = DailyGlobalCheck.QuestsData
 for k in pairs(t) do
  if not DailyGlobalCheck_CharData[k] or tContains(DailyGlobalCheck_Options.chars_blacklist, k) then
   t[pref..k] = nil
  end
 end

 -- store realm data to setup groups
 local _, prealm = strsplit("-", addonTable.pID)
 if not realm_indexes[prealm] then
  realm_indexes[prealm] = ri
  ri = ri + 1
 end
 
 for k in pairs(DailyGlobalCheck_CharData) do
  local _, realm = strsplit("-", k)
  if not realm_indexes[realm] then
   realm_indexes[realm] = ri
   ri = ri + 1
  end
 end
 --
 
 -- fill realm groups with chars
 local function addChar(pID)
  local _, realm = strsplit("-", pID)
  if not t[pref..pID] then
   t[pref..pID] = {realm, DailyGlobalCheck.GetModCharName(pID), [10] = completion, [12] = true, [13] = overlay_update}
   setmetatable(t[pref..pID], addonTable.meta_qd_template)
  end
  if not order[1][realm_indexes[realm]] then
   order[1][realm_indexes[realm]] = {realm}
  end
  tinsert(order[1][realm_indexes[realm]], pref..pID)
 end
 
 wipe(order[1])
 addChar(addonTable.pID)
 for k in pairs(DailyGlobalCheck_CharData) do
  if k ~= addonTable.pID then
   addChar(k)
  end
 end

 tsort(order[1], overview_realm_sort)
 for k,v in pairs(order[1]) do
  tsort(v, overview_sort)
 end
end

function modes:GetOverviewOrder()
 return order
end

function modes:InitializeOverview()
 order          = {{{""}}}
 buffer         = {}
 character_list = {}

 update_character_list()

 DGCEventFrame:Hook("CHARACTER_LIST_CHANGED", update_character_list)
end
