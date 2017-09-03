-- Daily Global Check
-- by Jadya
-- EU-Well of Eternity

local tinsert, tremove, floor, ceil = table.insert, table.remove, math.floor, math.ceil

local addonName, addonTable = ...

local L = addonTable.L
local C = addonTable.C
local ng

local AddColor = addonTable.AddColor

local constructors = DailyGlobalCheck.Constructors
local options      = DailyGlobalCheck.OptFunctions
local maps         = DailyGlobalCheck.MapFunctions
local lists        = DailyGlobalCheck.ListFunctions
local pages        = DailyGlobalCheck.PagesFunctions

local addontitle = "|TInterface\\icons\\INV_Sigil_Freya:16 |t|cff00AAFFDaily Global Check|r"
local dgcicon = "Interface\\icons\\INV_Sigil_Freya"

------ DGC Base Options ------
function options.setup_quests_panel(f)

 local t = f:CreateFontString(nil, "OVERLAY", "GameTooltipText")
 t:SetPoint("TOP", DGC_Mainframe.title, "BOTTOM", 0, -5)
 t:SetWordWrap(true)
 t:SetText(AddColor(L["account_wide_options"], "LIGHT_YELLOW"))

 local chkcounter = 0

 local function CreateCheckbox(opt, text)

  local c = ng:New(addonName, "Checkbox", f:GetName().."Checkbox"..chkcounter, f)
  c:SetText("|cffFFFFFF"..text.."|r")

  tinsert(f.checkboxes, c)
  c:SetPoint("TOPLEFT", f, "TOPLEFT", 10, -20 * chkcounter)
  c.text:SetWidth(C.modes[C.MODE_OPTIONS_QUEST].x - 40)  
  c.text:SetJustifyH("LEFT")

  c:SetScript("OnClick", function(self)
    if opt == "minimap_icon" then
      DailyGlobalCheck_Options["minimap_icon"].hide = not self:GetChecked()
 	 addonTable.ldbicon:Refresh("DailyGlobalCheck_broker", DailyGlobalCheck_broker, DailyGlobalCheck_Options["minimap_icon"])
    else
	 local value = self:GetChecked()
     DailyGlobalCheck_Options[opt] = value
	 DGCEventFrame:Fire("OPTION_CHANGED", opt, value)
	 DailyGlobalCheck:Refresh()
    end
  end)

  if opt == "minimap_icon" then
   c:SetChecked(DailyGlobalCheck_Options["minimap_icon"] and not DailyGlobalCheck_Options["minimap_icon"].hide or false)
  else
   c:SetChecked(DailyGlobalCheck_Options[opt])
  end
  chkcounter = chkcounter + 1
  return c
 end

 f.checkboxes = {}
 CreateCheckbox("minimap_icon",L["opt_minimap"])
 chkcounter = chkcounter + 1
 CreateCheckbox("show_questtype", L["opt_questtype"])
 CreateCheckbox("show_prefix", L["opt_prefix"])
 CreateCheckbox("show_zone", L["opt_zonename"])
 CreateCheckbox("show_suffix", L["opt_suffix"])
 CreateCheckbox("show_coordinates", L["opt_coords"])
 CreateCheckbox("hide_completed", L["opt_hidecompleted"])
 chkcounter = chkcounter + 2
 CreateCheckbox("show_questlogbtn", L["opt_showquestbtn"])
end

------ Plugin Options ------
local lastselected
local chkcounter = 0

-- widgets handling
local widgets_pool = {}

local function getwidget(t)
 local panel = DGC_Mainframe.panels[3]
 local found
 
 for k,v in pairs(widgets_pool) do
  if v.t == t then
   found = k
   break
  end
 end

 if found then
  local f = widgets_pool[found]
  tremove(widgets_pool, found)
  tinsert(panel.widgets, f)
  return f
 elseif t == "Checkbox" or t == "Radiobutton" then
  local f = ng:New(addonName, t, panel:GetName().."Checkbox"..chkcounter, panel)
  chkcounter = chkcounter + 1
  tinsert(panel.widgets, f)
  f.t = t
  return f
 end
end
--

local function updatepluginpanel()
 local list = DailyGlobalCheck.SelectedList
 local of = DGC_Mainframe.panels[3]

 if not of or list == lastselected then return end

 for _,v in pairs(of.widgets) do
  v:Hide()
  tinsert(widgets_pool, v)
 end
 wipe(of.widgets)

 if not list or not list.Options then
  --of.text:SetText(L["plugin_opt_none"])
  --of.text:SetText("")
 else
  --of.text:SetText("")

  -- widgets creation
  if not DailyGlobalCheck_PluginData[list["Title"]] then DailyGlobalCheck_PluginData[list["Title"]] = {} end
  local svar = DailyGlobalCheck_PluginData[list["Title"]]
  if not svar.options then svar.options = {} end

  
  for k,v in pairs(list.Options) do
   local t, text, refresh, flags = unpack(v)
   local f = getwidget(t)
   if f then
    f.tag = k
    f:SetPoint("TOPLEFT", of, "TOPLEFT", 10, -20 * k)

   -- Checkbox
    if t == "Checkbox" or t == "Radiobutton" then
     f.text:SetText("|cffFFFFFF"..text.."|r")
	 
     if svar.options[k] == nil then
      svar.options[k] = v[3]
     end
    
     f:SetChecked(svar.options[k])
    
     f:SetScript("OnClick", function(self)
	  local value
	  if self.t == "Radiobutton" then
       value = true
	   self:SetChecked(true)
	  else
	   value = self:GetChecked()
      end
	  svar.options[self.tag] = value
    
	  for _,v in pairs(of.widgets) do
	   if v.t == "Radiobutton" and v ~= f then
	    svar.options[v.tag] = false
	    v:SetChecked(false)
	   end
	  end
	  
      DGCEventFrame:Fire("OPTION_CHANGED_PLUGIN", self.tag, value, list)
	  
	  if refresh then
	   DailyGlobalCheck:Refresh()
      end
     end)
    end
    f:Show()
   end
  end
 end
 
 if list then
  local svar = lists:GetSvar(list)
  if svar.show_mapicons_worldmap == nil then
   lists:setShowMapIcons(list, "worldmap", true)
  end
  if svar.show_mapicons_minimap == nil then 
   lists:setShowMapIcons(list, "minimap", true)
  end
  
  local p = of.icons_frame
  
  of.toggle_all_pages:Hide()
  for _,v in pairs(p.pool) do
   v.active = false
   v:Hide()
  end
  
  local wm = lists:getShowMapIcons(list, "worldmap")
  local mm = lists:getShowMapIcons(list, "minimap")
  --if wm or mm then  
   local function pagebutton_click(self)
    lists:setShowPage(self.list, self.tag, self.checked)
	maps:UpdateList("worldmap",self.list, true)
	maps:UpdateList("minimap" ,self.list, true)
   end

   local function pagebutton_onenter(self)
    if not self.list.Order[self.tag] then return end

    GameTooltip:ClearLines()
	GameTooltip:SetOwner(self, "ANCHOR_LEFT")
	GameTooltip:AddLine(TUTORIAL_TITLE39)
	for _,v in pairs(self.list.Order[self.tag]) do
	 GameTooltip:AddLine(AddColor(v[1], "WHITE"))
	end
	GameTooltip:Show()
   end
   
   local function pagebutton_onleave(self)
    GameTooltip:Hide()
   end   
  
   local pages_t = lists:getShowPagesTable(list)

   local pgs = pages:Max(list)
   local lns = ceil(pgs / 6)
   for i = 1, pgs do
    local f = p.pool[i]
    if not f then
     p.pool[i] = ng:New(addonName, "Checkbutton", nil, p)
	 f = p.pool[i]
	 f:SetText(i)
     f:SetSize(25, 25)
     f:SetPoint("TOPLEFT", p, "TOPLEFT", 150 + ((i - 1) % 6) * 26, -36 -(26 * (floor((i - 1) / 6))))
	 f.tag = i
	 f.func = pagebutton_click
	 f:HookScript("OnEnter", pagebutton_onenter)
	 f:HookScript("OnLeave", pagebutton_onleave)
    end
	f.list = list
	f:SetChecked(not pages_t[i] or pages_t[i] == "1")
	f.active = true
   end
   p:SetHeight((lns + 2) * 26)
  --end
  
  of.toggle_all_pages:SetChecked(true)
  p:SetPagesVisibility(list)
  of.showworldmapicons:SetChecked(wm)
  of.showminimapicons:SetChecked(mm)
 end

 lastselected = list
end

function options.setup_plugin_panel(p)

 local t = p:CreateFontString(nil, "OVERLAY", "GameTooltipText")
 t:SetPoint("TOP", DGC_Mainframe.title, "BOTTOM", 0, -5)
 t:SetWordWrap(true)
 t:SetText(AddColor("(Character-specific options)", "LIGHT_YELLOW"))
 p.text = t
 
 p.widgets = {}

 local grp = ng:New(addonName, "Groupbox", nil, p)
 grp:SetText(L["map_icons_visibility_list"])
 grp:SetPoint("BOTTOMLEFT", p, "BOTTOMLEFT", 0, -5)
 grp:SetPoint("BOTTOMRIGHT", p, "BOTTOMRIGHT", 0, -5)
 grp:SetSize(100, 100)
 grp.pool = {}
 grp.SetPagesVisibility = function(self, list)
   local wm = lists:getShowMapIcons(list, "worldmap")
   local mm = lists:getShowMapIcons(list, "minimap")
 
   if wm or mm then
    p.toggle_all_pages:Show()
   else
    p.toggle_all_pages:Hide()
   end

   for _,v in pairs(self.pool) do
    if (wm or mm) and v.active then v:Show() else v:Hide() end
   end
  end
 p.icons_frame = grp

 local f = ng:New(addonName, "Checkbutton", nil, grp)
 f:SetText(L["toggle_all_pages"])
 f:SetSize(120, 25)
 f:SetPoint("TOPLEFT", grp, "TOPLEFT", 150, -10)
 f.func = function(self)
   local list
   for _,v in pairs(self:GetParent().pool) do
    if v.active then
	 list = v.list
     v:SetChecked(self.checked)
     lists:setShowPage(v.list, v.tag, self.checked)
	end
   end
   if list then
    maps:UpdateList("worldmap",list, true)
    maps:UpdateList("minimap" ,list, true)
   end
  end
 p.toggle_all_pages = f

 f = ng:New(addonName, "Checkbox", "DGCOptionsPluginWMCheckbox", p)
 f.text:SetWidth(90)
 f:SetText("|cffFFFFFF"..WORLDMAP_BUTTON.."|r")
 f:SetPoint("BOTTOMLEFT", p, "BOTTOMLEFT", 5, 35)
 f:SetScript("OnClick", function(self)
     local list = DailyGlobalCheck.SelectedList
	 if not list then return end
	 local value = self:GetChecked()
     lists:setShowMapIcons(list, "worldmap", value)
	 grp:SetPagesVisibility(list)
	 DGCEventFrame:Fire("OPTION_CHANGED_PLUGIN", "show_mapicons_worldmap", value, list)
    end)
 p.showworldmapicons = f

 f = ng:New(addonName, "Checkbox", "DGCOptionsPluginMMCheckbox", p)
 f.text:SetWidth(90)
 f:SetText("|cffFFFFFF"..MINIMAP_LABEL.."|r")
 f:SetPoint("BOTTOMLEFT", p, "BOTTOMLEFT", 5, 10)
 f:SetScript("OnClick", function(self)
     local list = DailyGlobalCheck.SelectedList
	 if not list then return end
	 local value = self:GetChecked()
     lists:setShowMapIcons(list, "minimap", value)
	 grp:SetPagesVisibility(list)
	 DGCEventFrame:Fire("OPTION_CHANGED_PLUGIN", "show_mapicons_minimap", value, list)
    end)
 p.showminimapicons = f

 --f = ng:New(addonName, "Checkbutton", "DGCOptionsPluginWMCheckbox", p)
 --f:SetPoint("BOTTOM")
 
 updatepluginpanel()
 return p
end

local function updatemappanel()
 local O = DailyGlobalCheck_Options
 local of = DGC_Mainframe.panels[4]
 
 if not of then return end

 for k,v in pairs(of.widgets) do
  if v.SetChecked then
   v:SetChecked(O[k] ~= nil and O[k] or O.UI[k])
  elseif v.SetValue then
   v:SetValue(O[k] ~= nil and O[k] or O.UI[k])
  end
 end
end

local function createMapGroup(p, t)
 local grp = ng:New(addonName, "Groupbox", p:GetName().."Group"..t, p)
 grp.text:SetText(L[t.."_icons"])
 
 local O = DailyGlobalCheck_Options.UI
 
 -- enable
 local f = ng:New(addonName, "Checkbox", "DGC"..t.."CheckboxEnable", p)
 f:SetPoint("TOPLEFT", grp, "TOPLEFT", 20, -5)
 f:SetText("|cffFFFFFF"..ENABLE.."|r")
 f:SetScript("OnClick", function(self)
   local value = self:GetChecked()
   DailyGlobalCheck_Options["show_"..t.."icons"] = value
   DGCEventFrame:Fire("OPTION_CHANGED", "show_"..t.."icons", value)
   DailyGlobalCheck:Refresh()
  end)
 p.widgets["show_"..t.."icons"] = f

 -- interactable icons
 f = ng:New(addonName, "Checkbox", "DGC"..t.."CheckboxInteract", p)
 f.text:SetText("|cffFFFFFF"..MAKE_INTERACTABLE.."|r")
 f:SetPoint("TOPLEFT", grp, "TOPLEFT", 20, -30)
 f:SetChecked(O[t.."_icon_interact"])
 f:SetScript("OnClick", function(self)
   local value = self:GetChecked()
   O[t.."_icon_interact"] = value
   DGCEventFrame:Fire("OPTION_CHANGED", t.."_icon_interact", value)
   DailyGlobalCheck:Refresh()
  end)
 p.widgets[t.."_icon_interact"] = f
 
 if t == "worldmap" then
  f = ng:New(addonName, "Checkbox", "DGC"..t.."CheckboxShowAdjacent", p)
  f.text:SetText("|cffFFFFFF"..L["show_adjacent_map_icons"].."|r")
  f:SetPoint("TOPLEFT", grp, "TOPLEFT", 20, -55)
  f:SetChecked(O["show_adjacent_icons"])
  f:SetScript("OnClick", function(self)
    local value = self:GetChecked()
    O["show_adjacent_icons"] = value
    DGCEventFrame:Fire("OPTION_CHANGED", "show_adjacent_icons", value)
    DailyGlobalCheck:Refresh()
   end)
  p.widgets["show_adjacent_icons"] = f
 end

 -- icon size
 f = ng:New(addonName, "SliderH", "DGC"..t.."IconSizeSlider", grp)
 f:SetPoint("TOPLEFT", grp, "TOPLEFT", 20, t == "worldmap" and -90 or -60)
 f:SetMinMaxValues(C.mapicons_size_min, C.mapicons_size_max)
 f:SetScript("OnValueChanged", function(self, value)
                                local v = floor(value)
                                self.text_value:SetText(v)
                                self.preview_icon:SetSize(v, v)
					            self.text_value:SetText(L["size"].." "..AddColor(v, "LIGHT_GREEN"))
					            O[t.."_icon_size"] = v
					            DGCEventFrame:Fire("OPTION_CHANGED", t.."_icon_size", v)
                               end)

 f.preview_icon = grp:CreateTexture()
 f.preview_icon:SetPoint("LEFT", f, "RIGHT", 20, 0)
 f.preview_icon:SetTexture(dgcicon)
 f:SetValue(O[t.."_icon_size"])
 p.widgets[t.."_icon_size"] = f
 return grp
end

function options.setup_map_panel(p)
 p.widgets = {}

 local t = p:CreateFontString(nil, "OVERLAY", "GameTooltipText")
 t:SetPoint("TOP", DGC_Mainframe.title, "BOTTOM", 0, -5)
 t:SetWordWrap(true)
 t:SetText(AddColor(L["account_wide_options"], "LIGHT_YELLOW"))
 
 -- world map
 local grp1 = createMapGroup(p, "worldmap")
 grp1:SetPoint("TOPLEFT", p, "TOPLEFT", 10, -20)
 grp1:SetPoint("BOTTOMRIGHT", p, "TOPRIGHT", -10, -150)
 
 -- minimap
 local grp2 = createMapGroup(p, "minimap")
 grp2:SetPoint("TOPLEFT", grp1, "BOTTOMLEFT", 0, -20)
 grp2:SetPoint("BOTTOMRIGHT", grp1, "BOTTOMRIGHT", 0, -120)
 
 updatemappanel()
end

function options:Update(mode)
 if not DGC_Mainframe then return end
 
 if mode == C.MODE_OPTIONS_PLUGIN then
  updatepluginpanel()
 elseif mode == C.MODE_OPTIONS_MAP then
  updatemappanel()
 end
end

function options:Initialize()

 ng = NyxGUI(C.NyxGUIVersion)

 if DailyGlobalCheck_Options == nil then DailyGlobalCheck_Options = {} end
 if DailyGlobalCheck_PluginData == nil then DailyGlobalCheck_PluginData = {} end
 
 setmetatable(DailyGlobalCheck_PluginData, { __index = function(t, k)
                                                        if k == "last_selected" then return end
                                                        t[k] = {}
														return t[k]
                                                       end})
 local O = DailyGlobalCheck_Options
 
 -- tmp
 if O["show_mapicons"] ~= nil then
  O["show_worldmapicons"] = O["show_mapicons"]
  O["show_mapicons"] = nil
 end

 local function checkOpt(opt, subT)
  if subT then
   if O[subT][opt] == nil then O[subT][opt] = C.defaults[subT][opt] end 
  else
   if O[opt] == nil then O[opt] = C.defaults[opt] end 
  end
 end

 checkOpt("show_questtype")
 checkOpt("show_coordinates")
 checkOpt("show_zone")
 checkOpt("show_prefix")
 checkOpt("show_suffix")
 checkOpt("show_worldmapicons")
 checkOpt("show_minimapicons")
 checkOpt("show_questlogbtn")
 checkOpt("hide_completed")
 
 if O["chars_blacklist"]  == nil then O["chars_blacklist"]  = {} end
 if O["frame_position"]   == nil then O["frame_position"]   = {"CENTER"} end

 -- UI Options
 if not O.UI then O.UI = {} end
 checkOpt("worldmap_icon_interact", "UI")
 checkOpt("minimap_icon_interact", "UI")
 checkOpt("worldmap_icon_size", "UI")
 checkOpt("minimap_icon_size", "UI")
 --
 -- Color Options
 if not O.Colors then O.Colors = {} end
 for i = 1,#(C.defaults.Colors) do
  checkOpt(i, "Colors")
 end
end
