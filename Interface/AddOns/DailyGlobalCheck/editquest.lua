-- Daily Global Check
-- by Jadya
-- EU-Well of Eternity
 
--[[
 - values
  - questID    : string
  - type       : int
  - prefix     : string
  - zone       : table  - [1] = string (zone name), [2] = {mapID, x, y, nil, ... }
  - name       : string
  - suffix     : string
  - completion : string
]]

local min, max, lower, tsort, format = math.min, math.max, string.lower, table.sort, string.format

local addonName, addonTable = ...

local AddColor = addonTable.AddColor

local L = addonTable.L
local C = addonTable.C
local Z = DailyGlobalCheck.Z
local ng

local constructors = DailyGlobalCheck.Constructors
local lists = DailyGlobalCheck.ListFunctions
local tools = DailyGlobalCheck.Tools
local modes = DailyGlobalCheck.ModeFunctions
local quest = DailyGlobalCheck.QuestFunctions
local maps  = DailyGlobalCheck.MapFunctions
local help  = DailyGlobalCheck.HelpFunctions

local questID_tab_groups = { ["achicriteria"] = "achievement", 
                             ["boss"]         = "instance" }

local db, search_filters, zone_data_cache
local inits, updates = {}, {}
local qID, qData
local preview

local function questID2Input(questID, key)
 if key == "multipleor" then
  return questID:gsub("multipleor#", ""):gsub("_", " or ")
 elseif key == "multipleand" then
  return questID:gsub("multipleand#", ""):gsub("_", " and ")
 end
 return questID
end

local function input2QuestID(questID)
 questID = lower(tostring(questID):gsub(" ", ""))
 if strfind(questID, "or") then
  return "multipleor#"..questID:gsub("or", "_")
 elseif strfind(questID, "and") then
  return "multipleand#"..questID:gsub("and", "_")
 end
 return questID
end

local function questID_change(old, new)
 local questsdata = DGC_CustomLists.QuestsData

 new = input2QuestID(new)

 if not old or not new or new == "" then 
  return
 elseif old == new then
  return true
 elseif questsdata[new] then
  print(L["bf_err2"])
  return
 end
 
 if questsdata[old] then
  questsdata[new] = questsdata[old]
  questsdata[old] = nil
  questsdata[new].questID = new
 end
 
 for _,list in pairs(DGC_CustomLists.Lists) do
  for _,page in pairs(list.Order) do
   for _,group in pairs(page) do
    for k,v in pairs(group) do
	 if k > 1 and v == old then
	  group[k] = new
	 end
	end
   end
  end
 end
 
 return true
end

local function questID_updatetab(t, qID)
 
 local btn = DGC_EQ_Tabbutton_quest
 local result = ""
 
 if t then
  btn = _G["DGC_EQ_Tabbutton_"..(questID_tab_groups[t] or t)] or DGC_EQ_Tabbutton_quest
 end

 if not btn then return end

 -- fill widgets
 if btn == DGC_EQ_Tabbutton_quest then
  result = questID2Input(qID, t)
  DGC_EQQ_questID:SetText(result)
 elseif btn == DGC_EQ_Tabbutton_spell then
  DGC_EQQ_spellID:SetText(qID and qID:gsub("#", ""):gsub(t or "", "") or "")
 elseif btn == DGC_EQ_Tabbutton_currency then
  DGC_EQQ_currencyID:SetText(qID and qID:gsub("#", ""):gsub(t or "", "") or "")
 end

 btn:Click("LeftButton")
 return result
end

local function fitText(w, s, col)
 local width = w:GetWidth() / 9

 s = tostring(s or "") 

 local l = #s
 
 s = addonTable.cutString(s):sub(1, width)
 
 w:SetText(AddColor(s..((#s < l) and ".." or ""), col))
end

local function data2widgets()
 
 local c = DailyGlobalCheck_Options.Colors

 -- questID
  local qt = quest:GetSpecialType(qID)
  local v = questID_updatetab(qt, qID)
  preview["QuestID"].value = v
  fitText(preview["QuestID"], v)
 -- quest type
  qt = C.questtype_strings[qData[7]] or ""
  local widget = _G["DGC_EQQT_"..qt]
  if widget then
   widget:Click()--SetChecked(true)
  end
  preview["Type"].value = qData[7]
  fitText(preview["Type"], qt)
 -- prefix
  DGC_EQP_prefix:SetText(qData[3])
  preview["Prefix"].value = qData[3]
  fitText(preview["Prefix"], qData[3], c[3])
 -- zone
 fitText(preview["Zone"], qData[1], c[1])
 if qData[5] then
  local m = qData[5]
  DGC_EQ_Tabbutton_zoneselect:Click("LeftButton")
  DGC_EQZC_mapID:SetText(m[1] or "")
  DGC_EQZC_coordX:SetText(m[2] or 0)
  DGC_EQZC_coordY:SetText(m[3] or 0)
  --fitText(preview["Coords"], x.." "..y, c[5])
  updates.zoneselect()
 else -- simple text
  DGC_EQ_Tabbutton_zonesimple:Click("LeftButton")
  preview["Coords"]:SetText("")
  updates.zonesimple()
 end
 -- name
  DGC_EQP_name:SetText(qData[2])
  preview["Name"].value = qData[2]
  fitText(preview["Name"], qData[2], c[2])
 -- suffix
  DGC_EQP_suffix:SetText(qData[4])
  preview["Suffix"].value = qData[4]
  fitText(preview["Suffix"], qData[4], c[4])
end

local function widgets2data()
 
 local qID_result = questID_change(qID, preview["QuestID"].value)
 
 if not qID_result then
  print("|cff11DDFFDaily Global Check|r - QuestID requires changes")
  return
 end

 qData[1] = preview["Zone"].value[1]
 qData[2] = preview["Name"].value
 qData[3] = preview["Prefix"].value
 qData[4] = preview["Suffix"].value
 qData[5] = preview["Zone"].value[2]
 qData[6] = nil -- mapdata behavior nyi
 qData[7] = preview["Type"].value
 
 return true
end

-- Generic Editbox
local function editbox_textchanged(self)
 local s = self:GetText()

 if self == DGC_EQQ_questID then
  fitText(preview[self.tag], s, self.i and DailyGlobalCheck_Options.Colors[self.i])
  s = tonumber(s) or s
 elseif self == DGC_EQQ_spellID then
  fitText(preview[self.tag], s, self.i and DailyGlobalCheck_Options.Colors[self.i]) 
  s = "spell#"..s
  DGC_EQQ_spellID:update_info()
 elseif self == DGC_EQQ_currencyID then
  fitText(preview[self.tag], s, self.i and DailyGlobalCheck_Options.Colors[self.i]) 
  s = "currency#"..s
  DGC_EQQ_currencyID:update_info()
 elseif self == DGC_EQZC_mapID then
  local id = tonumber(self:GetText())
  if id and Z[id] then
   s = Z[id]
  else
   s = ""
  end
  fitText(preview[self.tag], s, self.i and DailyGlobalCheck_Options.Colors[self.i]) 
  preview[self.tag].value[1] = s
  return
 end

 preview[self.tag].value = s
end
--
-- internal tab updates
-- questID
function updates.quest()
 editbox_textchanged(DGC_EQQ_questID)
 preview["QuestID"].label:SetText(L["b_questid"])
 preview["Type"].label:SetText("Type")
 preview["Type"]:Enable()
end

function updates.spell()
 editbox_textchanged(DGC_EQQ_spellID)
 preview["QuestID"].label:SetText(L["spell_id"])
 preview["Type"].label:SetText("Type")
 preview["Type"]:Enable()
end

function updates.currency()
 editbox_textchanged(DGC_EQQ_currencyID)
 preview["QuestID"].label:SetText(L["currency_id"])
 preview["Type"].label:SetText(AddColor("Type", "GRAY"))
 preview["Type"]:Disable()
end
-- Zone
function updates.zonesimple()
 local zone = DGC_EQZS_zone:GetText()
 fitText(preview["Zone"], zone, DailyGlobalCheck_Options.Colors[1])
 preview["Zone"].value[1] = zone
 preview["Zone"].value[2] = nil
 preview["Zone"].value[3] = nil
 preview["Coords"]:SetText("")
end

function updates.zoneselect()
 local id = tonumber(DGC_EQZC_mapID:GetText())
 local x, y = tonumber(DGC_EQZC_coordX:GetText()) or 0, tonumber(DGC_EQZC_coordY:GetText()) or 0
 local zone, data
 
 x = floor(min(100, max(0, x)) * 100) / 100
 y = floor(min(100, max(0, y)) * 100) / 100
 if id and Z[id] then
  zone = Z[id]
  data = zone_data_cache
  data[1] = id
  data[2] = x
  data[3] = y
 else
  zone = ""
  data = nil
 end

 -- zone name
 fitText(preview["Zone"], zone, DailyGlobalCheck_Options.Colors[1])
 preview["Zone"].value[1] = zone
 -- coords
 preview["Zone"].value[2] = data
 --preview["Zone"].value[3] = nil -- mapdata behavior nyi
 fitText(preview["Coords"], floor(x).." "..floor(y), DailyGlobalCheck_Options.Colors[5])
end
--

local function init_search_section(tab, edtname, listname, db, btnfunc)
 local f = ng:New(addonName, "Editbox", edtname, tab)
 f:SetWidth(240)
 f:SetPoint("TOPRIGHT", tab, "TOPRIGHT", -40, -20)
 f:SetTitle(SEARCH)
 f:SetScript("OnTextChanged", function(self) 
                   local lb = self.list
                   local s = lower(self:GetText())
                   wipe(lb.list)
					
					if not s or s == "" then 
					 lb:update()
					 lb.warning_label:SetText("")
					 return
					end

					local c = s:sub(1,1)
					
					local counter = 1
                   for k,v in pairs(db) do
                    if lower(v):find(s) then
					 local i = #lb.list + 1
                     lb.list[i] = k
					 counter = counter + 1
					 if counter == 100 then break end
                    end
                   end
					
					if counter >= 100 then
					 lb.warning_label:SetText(format("Displaying the first %s results", AddColor(counter, "LIGHT_GREEN")))
					else
					 lb.warning_label:SetText("")
					end

                   tsort(lb.list, sortfunc)
				   lb:update()
                  end)
 search_filters[#search_filters + 1] = f
				   
 local lb = ng:New(addonName, "Listbox", listname, tab)
 f.list = lb
 
 lb.warning_label = ng:New(addonName, "Label", nil, tab)
 lb.warning_label:SetPoint("TOP", lb, "BOTTOM", 0, -10)

 lb.list = {}
 lb.update_button = function(self, list, index)
                    self.left_text:SetText(db[list[index]])
                   end

 lb:SetSize(220, 200)
 lb:Initialize("DGCSimpleListButton")
 lb:SetPoint("TOPLEFT", f, "BOTTOMLEFT", 0, -10)
 lb:SetPoint("BOTTOMRIGHT", f, "BOTTOMRIGHT", 0, -175)

 for _,v in pairs(lb.buttons) do
  ng:AddToTheme(addonName, nil, "Listbutton", v)
  v.func = btnfunc
 end
end

-- questID
function inits.quest(tab)
 local f = ng:New(addonName, "Label", "DGC_EQQ_questID_infolabel", tab)
 f:SetPoint("BOTTOMLEFT", tab, "BOTTOMLEFT", 10, 20)
 f:SetPoint("BOTTOMRIGHT", tab, "BOTTOMRIGHT", -10, 0)
 f:SetText(format(L["edit_questID_info"], "|cff00FF00or|r", "|cff00FF00and|r"))
 f:SetJustifyH("LEFT")

 f = ng:New(addonName, "Editbox", "DGC_EQQ_questID", tab)
 f:SetPoint("TOPLEFT", tab, "TOPLEFT", 10, -20)
 f:SetWidth(400)
 f:SetTitle(L["b_questid"])
 f.tag = "QuestID"
 f:SetScript("OnTextChanged", editbox_textchanged)
end

function inits.spell(tab)
 local f = ng:New(addonName, "Label", "DGC_EQQ_spellID_infolabel", tab)
 f:SetPoint("BOTTOMLEFT", tab, "BOTTOMLEFT", 10, 10)
 f:SetPoint("BOTTOMRIGHT", tab, "BOTTOM", 0, 0)
 f:SetJustifyH("LEFT")
 f:SetText(L["edit_spell_info"])

 f = ng:New(addonName, "Editbox", "DGC_EQQ_spellID", tab)
 f:SetPoint("TOPLEFT", tab, "TOPLEFT", 10, -20)
 f:SetWidth(150)
 f:SetTitle(L["spell_id"])
 f.tag = "QuestID"
 f:SetScript("OnTextChanged", editbox_textchanged) 
 
 f.info_label = ng:New(addonName, "Label", nil, tab)
 f.info_label:SetPoint("TOPLEFT", f, "BOTTOMLEFT", 0, -65)
 f.info_label:SetPoint("BOTTOMRIGHT", f, "BOTTOMRIGHT", 0, -75)
 f.info_icon = f:CreateTexture()
 f.info_icon:SetPoint("TOP", f, "BOTTOM", 0, -10)
 f.info_icon:SetSize(50, 50)
 f.update_info = function(self)
                  local id = tonumber(self:GetText())
				  if id then
                   local name, _, icon = GetSpellInfo(id)
				   self.info_label:SetText(name)
				   self.info_icon:SetTexture(icon)
				  else
				   self.info_label:SetText("")
				   self.info_icon:SetTexture()
				  end
                 end
 
 local function init_spell_database()
  local i = 0

  local progressbar = ng:New(addonName, "Progressbar", nil, tab)
  progressbar:SetWidth(175)
  progressbar:SetPoint("CENTER", tab, "CENTER", 0, 40)
  progressbar:SetText(format(L["generating_database"], lower(SPELLS)))

  db.spells = {}
  
  local function func(self)
   DGC_EQQ_spellID:SetText(DGC_EQspell_list.list[self.index])
  end
  
  C_Timer.NewTicker(0.025, function(self)
                            for k = 1, 750 do
 						     i = i + 1
                             local name = GetSpellInfo(i)
 						     if name then
							  name = name
 						      db.spells[i] = name
 						     end
 						    end
							progressbar:SetValue(i / 250000 * 100)
 						    if i > 250000 then
 						     self:Cancel()
							 init_search_section(tab, "DGC_EQspell_filter", "DGC_EQspell_list", db.spells, func)
							 progressbar:Hide()
 						    end
 						   end)
 end

 f = ng:New(addonName, "Button", nil, tab)
 f:SetSize(150, 40)
 f:SetPoint("CENTER", tab, "CENTER", 0, 40)
 f:SetText(L["search_by_name"])
 f:SetScript("OnClick", function(self) self:Hide() init_spell_database() end)
end


function inits.currency(tab)
 local f = ng:New(addonName, "Editbox", "DGC_EQQ_currencyID", tab)
 f:SetPoint("TOPLEFT", tab, "TOPLEFT", 10, -20)
 f:SetWidth(150)
 f:SetTitle(L["currency_id"])
 f.tag = "QuestID"
 f:SetScript("OnTextChanged", editbox_textchanged) 
 
 f.info_label = ng:New(addonName, "Label", nil, tab)
 f.info_label:SetPoint("TOPLEFT", f, "BOTTOMLEFT", 0, -65)
 f.info_label:SetPoint("BOTTOMRIGHT", f, "BOTTOMRIGHT", 0, -75)
 f.info_icon = f:CreateTexture()
 f.info_icon:SetPoint("TOP", f, "BOTTOM", 0, -10)
 f.info_icon:SetSize(50, 50)
 f.update_info = function(self)
                  local id = tonumber(self:GetText())
				  if id then
                   local name, _, icon = GetCurrencyInfo(id)
				   self.info_label:SetText(name)
				   self.info_icon:SetTexture(icon)
				  else
				   self.info_label:SetText("")
				   self.info_icon:SetTexture()
				  end
                 end

 local function init_currency_database()
  db.currencies = {}
  
  local function func(self)
   DGC_EQQ_currencyID:SetText(DGC_EQcurrency_list.list[self.index])
  end
  
                            for k = 1, 2000 do
                             local name = GetCurrencyInfo(k)
 						     if name and name ~= "" then
							  name = name
 						      db.currencies[k] = name
 						     end
 						    end
						    init_search_section(tab, "DGC_EQcurrency_filter", "DGC_EQcurrency_list", db.currencies, func)
 end

 f = ng:New(addonName, "Button", nil, tab)
 f:SetSize(150, 40)
 f:SetPoint("CENTER", tab, "CENTER", 0, 40)
 f:SetText(L["search_by_name"])
 f:SetScript("OnClick", function(self) self:Hide() init_currency_database() end)
end

-- zone 1 - Simple Text
function inits.zonesimple(tab)
 local f = ng:New(addonName, "Editbox", "DGC_EQZS_zone", tab)
 f:SetWidth(220)
 f:SetPoint("TOPLEFT", tab, "TOPLEFT", 10, -20)
 f:SetTitle(ZONE)
 f.tag = "Zone"
 f.i = 1
 f:SetScript("OnTextChanged", updates.zonesimple)
end
--

-- zone 2 - Select Zone
function inits.zoneselect(tab)
 local f = ng:New(addonName, "Editbox", "DGC_EQZC_mapID", tab)
 f:SetWidth(150)
 f:SetPoint("TOPLEFT", tab, "TOPLEFT", 10, -20)
 f:SetTitle(L["map_id"])
 f.tag = "Zone"
 f:SetScript("OnTextChanged", editbox_textchanged)
 
 local g = ng:New(addonName, "Groupbox", nil, tab)
 g:SetPoint("TOP", DGC_EQZC_mapID, "BOTTOM", 0, -30)
 g:SetSize(140, 40)
 g:SetText(L["coordinates"])

 f = ng:New(addonName, "Editbox", "DGC_EQZC_coordX", tab)
 f:SetWidth(60)
 f:SetPoint("TOPLEFT", g, "TOPLEFT", 5, -15)
 f:SetTitle("X")
 f:SetScript("OnTextChanged", updates.zoneselect)

 f = ng:New(addonName, "Editbox", "DGC_EQZC_coordY", tab)
 f:SetWidth(60)
 f:SetPoint("LEFT", DGC_EQZC_coordX, "RIGHT", 10, 0)
 f:SetTitle("Y")
 f:SetScript("OnTextChanged", updates.zoneselect)

 local function init_zone_database()
  db.zones = {}
  
  local function func(self)
   DGC_EQZC_mapID:SetText(DGC_EQzone_list.list[self.index])
   updates.zoneselect()
  end
  
  for k = 1, 2000 do
   local name = Z[k]
   if name and name ~= "" then
	name = name
 	db.zones[k] = name
   end
  end
  init_search_section(tab, "DGC_EQzone_filter", "DGC_EQzone_list", db.zones, func)
 end

 f = ng:New(addonName, "Button", nil, tab)
 f:SetSize(150, 40)
 f:SetPoint("CENTER", tab, "CENTER", 0, 40)
 f:SetText(L["search_by_name"])
 f:SetScript("OnClick", function(self) self:Hide() init_zone_database() end)
end
--

local function btnok_click()
 if widgets2data() then
  modes:Set(C.MODE_EDIT)
 else
  -- in caso di questID uguali bloccare tutto e cerchiare in rosso preview["QuestID"]
 end
end

local function btncancel_click()
 modes:Set(C.MODE_EDIT)
end

local bg = { bgFile = "Interface\\Buttons\\GreyscaleRamp64", 
             edgeFile = "Interface\\Buttons\\WHITE8X8", 
	         edgeSize = 1
		   }

function tools.setup_edit_quest_panel(p)
 ng = NyxGUI(C.NyxGUIVersion)
 db = {}
 search_filters = {}

 local g1 = ng:New(addonName, "Groupbox", nil, p)
 g1:SetPoint("TOPLEFT")
 g1:SetPoint("BOTTOMRIGHT")
 
 local g2 = ng:New(addonName, "Groupbox", nil, g1)
 g2:SetPoint("TOPLEFT", g1, "TOPLEFT", 10, -20)
 g2:SetPoint("BOTTOMRIGHT", g1, "TOPRIGHT", -10, -70)

 local editgroup = ng:New(addonName, "Groupbox", nil, g2)
 editgroup:SetPoint("TOPLEFT", g2, "BOTTOMLEFT", 0, -10)
 editgroup:SetPoint("BOTTOMRIGHT", p, "BOTTOMRIGHT", -10, 40)

 local anchor = 10
 local function createPreviewButton(key, w, tabindex)
  local btn = ng:New(addonName, "Tabbutton", "DGCEQ_"..key, g2, nil, tabindex)
  local label = ng:New(addonName, "Label", nil, btn)
  label:SetText(key)
  label:SetPoint("BOTTOM", btn, "TOP")
  btn.label = label
  btn:ClearAllPoints()
  btn:SetPoint("LEFT", g2, "LEFT", anchor, 0)
  anchor = anchor + w
  btn:SetSize(w - 5, 15)
  btn.value = ""
  preview[key] = btn
 end

 preview = {}
 createPreviewButton("QuestID"   , 75)
 createPreviewButton("Type"      , 25 )
 createPreviewButton("Prefix"    , 75 )
 createPreviewButton("Zone"      , 100)
 createPreviewButton("Name"      , 150, 3)
 createPreviewButton("Suffix"    , 75 , 3)
 createPreviewButton("Coords"    , 75 , 4)
 createPreviewButton("Completion", 75)

 preview["Zone"].value = {}

 ------------ questID group ------------
 g1 = ng:New(addonName, "Groupbox", nil, preview["QuestID"].tab)
 g1:SetPoint("TOPLEFT", editgroup, "TOPLEFT", 10, -40)
 g1:SetPoint("BOTTOMRIGHT", editgroup, "BOTTOMRIGHT", -10, 10)
 
 local function createTab(t, text, w, group)
  local result = ng:New(addonName, "Tabbutton", "DGC_EQ_Tabbutton_"..t, group)
  result:SetWidth(w)
  result:SetText(text)
  if inits[t] then
   inits[t](result.tab)
  end
  if updates[t] then
   result.tab:SetScript("OnShow", updates[t])
  end
  result.tab:Hide()
  return result.tab
 end

 -- quest
 createTab("quest", L["b_questid"], 100, g1)
 createTab("spell", STAT_CATEGORY_SPELL, 100, g1)
 createTab("currency", CURRENCY, 100, g1)

 -- instance
 --tab = createTab("instance", "Instance", 100, g1)
 --createTab("boss", "Instance Boss", 100, g1)
 --createTab("achievement", "Achievement", 100, g1)
 --createTab("achicriteria", "Achi. Criteria", 100, g1)

 ------------------------

 ------------ quest type group ------------

 local function chk_questtype_onclick(self)
  fitText(preview["Type"], C.questtype_strings[self.tag] or "D")
  preview["Type"].value = self.tag
 end
 
 local f = ng:New(addonName, "Radiobutton", "DGC_EQQT_Q", preview["Type"].tab)
 f:SetPoint("TOPLEFT", editgroup, "TOPLEFT", 10, -10)
 f:SetText("Quest")
 f.tag = 1
 f.func = chk_questtype_onclick
 
 f = ng:New(addonName, "Radiobutton", "DGC_EQQT_D", preview["Type"].tab)
 f:SetPoint("TOPLEFT", editgroup, "TOPLEFT", 10, -30)
 f:SetText("Daily")
 f.func = chk_questtype_onclick
 
 f = ng:New(addonName, "Radiobutton", "DGC_EQQT_W", preview["Type"].tab)
 f:SetPoint("TOPLEFT", editgroup, "TOPLEFT", 10, -50)
 f:SetText("Weekly")
 f.tag = 3
 f.func = chk_questtype_onclick
 
 f = ng:New(addonName, "Radiobutton", "DGC_EQQT_R", preview["Type"].tab)
 f:SetPoint("TOPLEFT", editgroup, "TOPLEFT", 10, -70)
 f:SetText("Repeatable")
 f.tag = 13
 f.func = chk_questtype_onclick
 
 f = ng:New(addonName, "Radiobutton", "DGC_EQQT_Qa", preview["Type"].tab)
 f:SetPoint("TOPLEFT", editgroup, "TOPLEFT", 10, -100)
 f:SetText("Quest (Account-Wide)")
 f.tag = 14
 f.func = chk_questtype_onclick
 
 f = ng:New(addonName, "Radiobutton", "DGC_EQQT_Da", preview["Type"].tab)
 f:SetPoint("TOPLEFT", editgroup, "TOPLEFT", 10, -120)
 f:SetText("Daily (Account-Wide)")
 f.tag = 15
 f.func = chk_questtype_onclick
 
 f = ng:New(addonName, "Radiobutton", "DGC_EQQT_Wa", preview["Type"].tab)
 f:SetPoint("TOPLEFT", editgroup, "TOPLEFT", 10, -140)
 f:SetText("Weekly (Account-Wide)")
 f.tag = 16
 f.func = chk_questtype_onclick

 --[[f = ng:New(addonName, "Radiobutton", "DGC_EQQT_instance", editgroup)
 f:SetPoint("TOPLEFT", editgroup, "TOPLEFT", 10, -70)
 f:SetText("Instance")]]
 
 ------------------------

 ------------ prefix name and suffix ------------
 
 f = ng:New(addonName, "Editbox", "DGC_EQP_prefix", preview["Prefix"].tab)
 f:SetWidth(220)
 f:SetPoint("TOPLEFT", editgroup, "TOPLEFT", 10, -20)
 f:SetTitle(L["b_prefix"])
 f.tag = "Prefix"
 f.i = 3
 f:SetScript("OnTextChanged", editbox_textchanged)

 f = ng:New(addonName, "Editbox", "DGC_EQP_name", preview["Name"].tab)
 f:SetWidth(220)
 f:SetPoint("TOPLEFT", editgroup, "TOPLEFT", 10, -60)
 f:SetTitle(NAME)
 f.tag = "Name"
 f.i = 2
 f:SetScript("OnTextChanged", editbox_textchanged)

 f = ng:New(addonName, "Editbox", "DGC_EQP_suffix", preview["Suffix"].tab)
 f:SetWidth(220)
 f:SetPoint("TOPLEFT", editgroup, "TOPLEFT", 10, -100)
 f:SetTitle(L["b_suffix"])
 f.tag = "Suffix"
 f.i = 4
 f:SetScript("OnTextChanged", editbox_textchanged)
 
 ------------------------

 ------------ not available message ------------
 
 f = ng:New(addonName, "Label", "DGC_EQZ_tmplabel", preview["Completion"].tab)
 f:SetPoint("CENTER", editgroup, "CENTER")
 f:SetText("|TInterface\\Minimap\\Vehicle-HammerGold-1:32|t Not available at the moment")
  
 ------------------------

 -- zone
 g1 = ng:New(addonName, "Groupbox", nil, preview["Zone"].tab)
 g1:SetPoint("TOPLEFT", editgroup, "TOPLEFT", 10, -40)
 g1:SetPoint("BOTTOMRIGHT", editgroup, "BOTTOMRIGHT", -10, 10)

 -- tab 1 ( simple )
 createTab("zonesimple", LOCALE_TEXT_LABEL, 95, g1)

 -- tab 2 ( select zone )
 createTab("zoneselect", "Select Zone", 95, g1)
 --

 -- ok button
 f = ng:New(addonName, "Button", nil, p)
 f:SetPoint("BOTTOM", p, "BOTTOM", -40, 8)
 f:SetText(OKAY)
 f:SetScript("OnClick", btnok_click)
 f:SetWidth(75)
 
 -- cancel button
 f = ng:New(addonName, "Button", nil, p)
 f:SetPoint("BOTTOM", p, "BOTTOM", 40, 8)
 f:SetText(CANCEL)
 f:SetScript("OnClick", btncancel_click)
 f:SetWidth(75)

 -- help button
 f = CreateFrame("Button", "DGC_EQHelpButton", p, "MainHelpPlateButton")
 f:SetPoint("TOPLEFT", DGC_Mainframe, "TOPLEFT", -5, 5)
 f:SetScript("OnClick", function()
  local hp = addonTable.HelpPlates.EditQuest

  if not help:isShowing(hp) then
   help:Show(hp, DGC_Mainframe, DGC_EQHelpButton)
  else
   help:Hide()
  end
 end)
end

function tools:EditQuest(questID, data)

 if not data then return end
 
 qID = questID
 qData = data
 zone_data_cache = {}
 modes:Set(C.MODE_EDIT_QUEST)
 data2widgets()
 
 for _,v in pairs(search_filters) do
  v:SetText("")
 end
 
 DGCEQ_QuestID:Click("Leftbutton")
end
