-- Daily Global Check
-- by Vildiesel
-- EU-Well of Eternity

local tinsert, tremove, tsort, low = table.insert, table.remove, table.sort, string.lower

local addonName, addonTable = ...

local L = addonTable.L
local C = addonTable.C
local T = addonTable.T
local ng, ntl

local AddColor = addonTable.AddColor

local constructors = DailyGlobalCheck.Constructors
local options      = DailyGlobalCheck.OptFunctions
local tools        = DailyGlobalCheck.Tools
local lists        = DailyGlobalCheck.ListFunctions
local pages        = DailyGlobalCheck.PagesFunctions
local help         = DailyGlobalCheck.HelpFunctions
local maps         = DailyGlobalCheck.MapFunctions

local questpool_list_changed = true
local icon_filenames, current_icons_list, filtered_filenames

-- Visibility Mode --

function tools:CycleListVisibilityByListIndex(i)
 local list = DGC_ListsListbox.list
 
 local isActive = not lists:isActive(list[i])
 lists:setActive(list[i], isActive)
 DGC_ListsListbox:update()
 DailyGlobalCheck:RefreshListButtons()
 if isActive then
  DailyGlobalCheck:OpenList(list[i])
 else
  DailyGlobalCheck:OpenList(lists:FindFirst(true))
 end
end

local function vis_listbox_update_pre(self)
 wipe(self.list)
 
 DailyGlobalCheck:foreachLists(function(k,v)
  tinsert(self.list, v)
 end, false)
end

local function vis_listbox_update_button(btn, list, index)
 local list = DGC_ListsListbox.list

 if lists:isActive(list[index]) then
  btn.btnvisibility:SetText(L["shown"])
  btn.btnvisibility:SetBackdropColor(0, 1, 0, 0.1)
  btn.btnvisibility:SetBackdropBorderColor(0, 1, 0, 1)
 else
  btn.btnvisibility:SetText(L["hidden"])
  btn.btnvisibility:SetBackdropColor(1, 0, 0, 0.1)
  btn.btnvisibility:SetBackdropBorderColor(1, 0, 0, 1)
 end

 btn.title:SetText(list[index].Title)
 btn.icon:SetTexture(list[index].Icon)
end

function tools.setup_list_visibility_panel(p)
 ng = NyxGUI(C.NyxGUIVersion)
 
 -- Lists listbox --
 local f = ng:New(addonName, "Listbox", "DGC_ListsListbox", p)
 constructors:SetupTexture(f, "Interface\\Stationery\\Stationery_ill1")
 --constructors:SetupTexture(f, "Spells\\WeaponTrail_Default")
 f.tex:SetVertexColor(1,1,1,0.4)
 f.hideSelection = true

 f.list = {}

 f.update_pre = vis_listbox_update_pre
 f.update_button = vis_listbox_update_button
 -- need to initialize before setting the region points, otherwise it will mess up the buttons' width
 f:SetSize(C.modes[C.MODE_LIST_VISIBILITY].x - 20, C.modes[C.MODE_LIST_VISIBILITY].y - 80)
 f:Initialize("DGCPluginListButton", f.list)

 f:SetPoint("TOPLEFT")
 f:SetPoint("BOTTOMRIGHT", p, "BOTTOMRIGHT", -20, 0)

 for _,v in pairs(f.buttons) do
  ng:AddToTheme(addonName, "main", "Listbutton", v)
 end

 f:update()
end

------- edit mode -------
local being_dragged = {}

local function edit_listbox_update_pre(self)
 local list = DailyGlobalCheck.SelectedList
 
 wipe(self.list)
 
 if not list then return end

 local data = list.Order[pages:Curr()]
 
 local counter = 0
 for kg,group in pairs(data) do
  counter = counter + #group
 end

 for kg,group in pairs(data) do
  for k, questID in pairs(group) do
   tinsert(self.list, questID)
   local i = #self.list
   if not self.positions[i] then self.positions[i] = {} end
   self.positions[i][1] = kg
   self.positions[i][2] = k
  end

  tinsert(self.list, "dgc#new_quest")
  if not self.positions[#self.list] then self.positions[#self.list] = {} end
  self.positions[#self.list][1] = kg
  self.positions[#self.list][2] = #group + 1
 end
 
 tinsert(self.list, "dgc#new_group")
 if not self.positions[#self.list] then self.positions[#self.list] = {} end
 self.positions[#self.list][1] = #data + 1
 self.positions[#self.list][2] = 0
 
 if DGC_EdtGroupRename then DGC_EdtGroupRename:Hide() end
end

local function edit_listbox_update_button(btn, list, index)
 local selectedList = DailyGlobalCheck.SelectedList
 
 if not selectedList then return end

 local data = DailyGlobalCheck:getQData(list[index], selectedList.Title)
 
 local _, fh = btn.zone:GetFont()

 local w = btn:GetWidth() / fh
 
 -- group header
 if list[index] ~= "dgc#new_group" and DGC_EditListbox.positions[btn.index][2] == 1 then
  btn.zone:SetText("")
  btn.edit:Show()
  btn.remove:Show()
  btn.arrowUp:Show()
  btn.arrowDown:Show()
  btn:SetBackdropColor(0, 0, 0.1, 0.3)

  local name = list[index]
  
  if #name > w then
   name = addonTable.cutString(name):sub(1, w)..".."
   --name = name:sub(1, w)..".."
  end

  btn.name:SetText(AddColor(name, "GOLD"))

  local edt = DGC_EdtGroupRename
  if edt and edt.group == DGC_EditListbox.positions[btn.index][1] then
   edt:Show()
   edt:SetFocus()
   DGC_EdtGroupRename:SetPoint("TOPLEFT", btn, "TOPLEFT", 20, -5)
   DGC_EdtGroupRename:SetPoint("TOPRIGHT", btn, "TOPRIGHT", -70, -5)
  end
  
  return
 end

 btn.arrowUp:Hide()
 btn.arrowDown:Hide()

 -- new quest
 if list[index] == "dgc#new_quest" then
  btn.name:SetText(AddColor(L["new_quest"].."..", "LIGHT_GREEN"))
  btn.zone:SetText("")
  btn:SetBackdropColor(0, 0.1, 0, 0.3)
  btn.edit:Hide()
  btn.remove:Hide()
  return
 end
 
 -- new group
 if list[index] == "dgc#new_group" then
  btn.name:SetText(AddColor(L["new_group"].."..", "LIGHT_GREEN"))
  btn.zone:SetText("")
  btn:SetBackdropColor(0, 0.1, 0.05, 0.3)
  btn.edit:Hide()
  btn.remove:Hide()
  return
 end

 if being_dragged.t == 0 and being_dragged.list == selectedList and
    pages:Curr() == being_dragged.page and
    being_dragged.pos == DGC_EditListbox.positions[btn.index] then
  btn:SetBackdropColor(1, 0.5, 0.3, 0.2)
 else
  btn:SetBackdropColor(0, 0, 0, 0)
 end

 if not data then 
  btn.name:SetText(list[index])
  btn.zone:SetText(L["questdatamissing"])
  btn.edit:Hide()
  btn.remove:Show()
  return
 end

 if not data[11] then
  btn.edit:Show()
 else
  btn.edit:Hide()
 end

 btn.remove:Show()

 local zone = data[1]
 local name = data[2]
 
 if #zone > w then
  zone = zone:sub(1, w)..".."
 end
 
 name = addonTable.cutString(name)
 if #name > w then
  --name = addonTable.cutString(name):sub(1, w)..".."
  name = name:sub(1, w)..".."
 end

 btn.zone:SetText(AddColor(zone, "GRAY"))
 btn.name:SetText(AddColor(name, "NAME_COLOR"))
end

local function isLimitReached(list)
 local i = 0
 for _,v in pairs(list) do
  i = i + #v + 1 -- group headers count as two
 end
 
 return i > C.max_quests_per_page
end

local function new_quest()
 local questID = 0
 local q = {}
 
 q[1] = ""
 q[2] = L["new_quest"]
 q[3] = ""
 q[4] = ""
 
 while DailyGlobalCheck:getQData(questID) do
  questID = questID + 1
 end
 
 DGC_CustomLists.QuestsData[questID] = q
 return questID
end

local function edit_listbutton_click(self, button)
 local list = DailyGlobalCheck.SelectedList.Order[pages:Curr()]

 if DGC_EditListbox.list[self.index] == "dgc#new_quest" then
  --print("Daily Global Check - New quest currently unavailable")
  if isLimitReached(list) then
   print("|cff00AAFFDaily Global Check|r - "..string.format(L["quests_limit"], C.max_quests_per_page))
   return
  end
  
  local questID = new_quest()
  
  local pos = DGC_EditListbox.positions[self.index]
  tinsert(list[pos[1]], questID)
  questpool_list_changed = true
  DGC_EditPoolListbox:update()
  DGC_EditListbox:update()
  
 elseif DGC_EditListbox.list[self.index] == "dgc#new_group" then
  if isLimitReached(list) then
   print("|cff00AAFFDaily Global Check|r - "..string.format(L["quests_limit"], C.max_quests_per_page))
   return
  end
  
  list[#list + 1] = {L["new_group"]}
  DGC_EditListbox:update()
 end
end

function tools:NewList()
 if #(DGC_CustomLists.Lists) >= C.maxlists then
  print("|cff00AAFFDaily Global Check|r - "..string.format(L["lists_limit"], C.maxlists))
  return
 end

 local list = lists:New()
 DGC_CustomLists.Lists[#DGC_CustomLists.Lists + 1] = list
 lists:setActive(list, true)
 DailyGlobalCheck:OpenList(list)
 DailyGlobalCheck:RefreshListButtons()
end

local function rename_list()
 local list = DailyGlobalCheck.SelectedList

 if not list then return end
 
 DGC_EdtListRename:SetText(list.Title)
 DGC_EdtListRename:Show()
 DGC_EdtListRename:SetFocus()
 DGC_BtnListRename:Hide()
end

local function select_first_list()

 DailyGlobalCheck:OpenList(nil)
-- DailyGlobalCheck:RefreshListButtons()
 
 for k,v in pairs(DGC_Mainframe.listbuttons) do
  if v:IsVisible() and v.list ~= L["create_new_list"] then
   list = v.list
   break
  end
 end

 DailyGlobalCheck:OpenList(list)
end

local function delete_list()
 local list = DailyGlobalCheck.SelectedList
 
 if not list then return end
 
 lists:Remove(list.Title)

 select_first_list()
end

local function new_page()
 local list = DailyGlobalCheck.SelectedList
 pages:New(list)
 pages:Move(list, pages:Max() - pages:Curr())
 DailyGlobalCheck:Refresh()
end

local function delete_page()
 local list = DailyGlobalCheck.SelectedList
 pages:Remove(list)
 DailyGlobalCheck:Refresh()
end

function tools.update_edit_panel()
 if not DGC_EditListbox or not DGC_EditPoolDropdown then return end

 DGC_EditListbox:update()
 DGC_EditPoolDropdown:Populate()
end

local function move_group(list, pos, new_pos)
 local element = list[pos]
 
 tremove(list, pos)
 tinsert(list, new_pos, element)
end

function tools:EditListButton_ArrowUpClick(self)
 local pos     = DGC_EditListbox.positions[self:GetParent().index][1]
 local new_pos = pos - 1 > 0 and pos - 1 or 1

 if pos == new_pos then
  return
 end
 
 move_group(DailyGlobalCheck.SelectedList.Order[pages:Curr()], pos, new_pos)
 DGC_EditListbox:update()
end

function tools:EditListButton_ArrowDownClick(self)
 local list = DailyGlobalCheck.SelectedList.Order[pages:Curr()]
 local pos     = DGC_EditListbox.positions[self:GetParent().index][1]
 local new_pos = pos + 1 < #list and pos + 1 or #list

 if pos == new_pos then
  return
 end
 
 move_group(list, pos, new_pos)
 DGC_EditListbox:update()
end

---- quests drag & drop ----
function DGCEventFrame.CURSOR_UPDATE(...)
 local t, itemID = GetCursorInfo()

 if t ~= "item" or itemID ~= 45788 or itemID ~= 45814 then
  wipe(being_dragged)
  DGC_EditListbox:update()
  DGC_EditPoolListbox:update()
  DGCEventFrame:UnregisterEvent("CURSOR_UPDATE")
 end
end

local function edit_buttonDragStart(self)
 -- group headers and new element buttons can't be dragged
 if DGC_EditListbox.positions[self.index][2] == 1 or
    DGC_EditListbox.list[self.index] == "dgc#new_quest" or
	DGC_EditListbox.list[self.index] == "dgc#new_group" then return end

 PickupItem(45788)

 being_dragged.t = 0
 being_dragged.list = DailyGlobalCheck.SelectedList
 being_dragged.page = pages:Curr()
 being_dragged.pos = DGC_EditListbox.positions[self.index]
 DGC_EditListbox:update()
 DGCEventFrame:RegisterEvent("CURSOR_UPDATE")
end

local function move_list_element(list, group, pos, new_list, new_group, new_pos)

 if list ~= new_list and isLimitReached(new_list) then
  print("|cff00AAFFDaily Global Check|r - "..string.format(L["quests_limit"], C.max_quests_per_page))
  return
 end
 
 local dragged_element = list[group][pos]
 
 if new_pos <= 2 then
  new_pos = 2
 elseif list == new_list then
  if new_pos > #new_list[new_group] then
   new_pos = new_pos - 1
  end
 else
  new_pos = new_pos
 end

 tremove(list[group], pos)
 tinsert(new_list[new_group], new_pos, dragged_element)
end

local function move_pool_element(new_list, new_group, new_pos)

 if isLimitReached(new_list) then
  print("|cff00AAFFDaily Global Check|r - "..string.format(L["quests_limit"], C.max_quests_per_page))
  return
 end

 if new_pos <= 2 then
  new_pos = 2
 elseif list == new_list then
  if new_pos > #new_list[new_group] then
   new_pos = new_pos - 1
  end
 else
  new_pos = new_pos
 end

 tinsert(new_list[new_group], new_pos, being_dragged.element)
end

local function edit_listboxDragReceive(self)
 if not DailyGlobalCheck.SelectedList then return end

 local t, itemID = GetCursorInfo()

 if t == "item" then
  local new_list  = DailyGlobalCheck.SelectedList.Order[pages:Curr()]
  local new_group = #new_list
  
  if new_group == 0 then
   return
  end
  
  local new_pos   = #new_list[new_group] + 1
  
  if itemID == 45788 then
   local list  = being_dragged.list.Order[being_dragged.page]
   local group, pos = unpack(being_dragged.pos)
   
    move_list_element(list, group, pos, new_list, new_group, new_pos)
  elseif itemID == 45814 then
   move_pool_element(new_list, new_group, new_pos)
  end

  wipe(being_dragged)
  ClearCursor()
 end
end

local function edit_buttonDragReceive(self)
 if DGC_EditListbox.list[self.index] == "dgc#new_group" then return end

 local t, itemID = GetCursorInfo()

 if t == "item" then
  local new_list           = DailyGlobalCheck.SelectedList.Order[pages:Curr()]
  local new_group, new_pos = unpack(DGC_EditListbox.positions[self.index])
  
  if itemID == 45788 then
   local list       = being_dragged.list.Order[being_dragged.page]
   local group, pos = unpack(being_dragged.pos)
   
   move_list_element(list, group, pos, new_list, new_group, new_pos)
  elseif itemID == 45814 then 
   move_pool_element(new_list, new_group, new_pos)
  end
  wipe(being_dragged)
  DGC_EditListbox:update()
  ClearCursor()
 end
end
----

function tools:EditQuestButtonClick(self)
 local listbox = self:GetParent():GetParent():GetParent()
 local list = DailyGlobalCheck.SelectedList
 local i = self:GetParent().index

 if listbox == DGC_EditListbox and listbox.positions[i][2] == 1 then
  local edt = DGC_EdtGroupRename
  local p = self:GetParent()
  edt.group = DGC_EditListbox.positions[i][1]
  edt:SetPoint("TOPLEFT", p, "TOPLEFT", 20, -5)
  edt:SetPoint("TOPRIGHT", p, "TOPRIGHT", -70, -5)
  edt:SetText(DGC_EditListbox.list[i])
  edt:Show()
  edt:SetFocus()
  return
 end

 -- editquest.lua
 local questID = listbox == DGC_EditListbox and listbox.list[self:GetParent().index] or listbox.questIDs[listbox.list[i]]
 tools:EditQuest(questID, DailyGlobalCheck:getQData(questID, list and list.Title))
end

function tools:RemovePoolQuestButtonClick(self)
 local i = self:GetParent().index

 DGC_CustomLists.QuestsData[DGC_EditPoolListbox.questIDs[DGC_EditPoolListbox.list[i]]] = nil

 questpool_list_changed = true
 DGC_EditPoolListbox:update()
 DGC_EditListbox:update()
end

function tools:RemoveQuestButtonClick(self)
 local i = self:GetParent().index

 local group, pos = unpack(DGC_EditListbox.positions[i])
  
 if pos == 1 then
  tremove(DailyGlobalCheck.SelectedList.Order[pages:Curr()], group)
 else
  tremove(DailyGlobalCheck.SelectedList.Order[pages:Curr()][group], pos)
 end

 DGC_EditListbox:update()
end

--- quest pool ---

local function sortfunc(a, b)
 if a[2] == "" and b[2] == "" then
  return tostring(a.questID) < tostring(b.questID)
 else
  return tostring(a[2]) < tostring(b[2])
 end
end

local function questpool_generate_list(self)
 wipe(self.list)
 wipe(self.questIDs)
 local filter = DGC_EditPoolFilter and low(DGC_EditPoolFilter:GetText()) or ""
 local plugin = DGC_EditPoolDropdown.value or ""
 
 local function checkFilter(s)
  return s and low(s):find(filter)
 end

 DailyGlobalCheck:foreachQData(function(k,v)
  if not v[12] and
    (filter == "" or (low(tostring(k)):find(filter) or checkFilter(v[1]) or checkFilter(v[2]) or checkFilter(v[11]))) and 
	((plugin == "custom" and (v[11] == "" or not v[11])) or plugin == "" or plugin == v[11]) then
   tinsert(self.list, v)
   self.questIDs[v] = k
  end
 end)

 tsort(self.list, sortfunc)
end

local function questpool_listbox_update_pre(self)
 if questpool_list_changed then
  questpool_generate_list(self)
  questpool_list_changed = nil
 end
end

local function questpool_listbox_update_button(btn, list, index)
 if list[index][11] then
  local _, l = lists:Find(list[index][11], false)
  btn.icon:SetTexture(l and l.Icon)
  btn.icon:Show()
  btn.remove:Hide()
  btn.edit:Hide()
 else
  btn.icon:Hide()
  btn.remove:Show()
  btn.edit:Show()
 end

 if being_dragged.t == 1 and DGC_EditPoolListbox.questIDs[list[index]] == being_dragged.element then
  btn:SetBackdropColor(1, 0.5, 0.3, 0.2)
 else
  btn:SetBackdropColor(0, 0, 0, 0)
 end

 --btn.zone:SetText(AddColor(list[index][1],"GRAY"))
 --btn.name:SetText(AddColor(list[index][2],"NAME_COLOR"))
 btn.zone:SetText(AddColor(list[index].questID,"GRAY"))
 btn.name:SetText(AddColor(list[index][2],"NAME_COLOR"))
end

local function lists_dropdown_update_button(btn, list, index)
 btn.icon:SetTexture(DGC_EditPoolDropdown.icons[index] and DGC_EditPoolDropdown.icons[index] or nil)
 btn.left_text:SetText(list[index])
end

local function lists_buttonDragStart(self)
 if not DGC_EditPoolListbox.questIDs[DGC_EditPoolListbox.list[self.index]] then return end

 PickupItem(45814)

 being_dragged.t = 1
 being_dragged.element = DGC_EditPoolListbox.questIDs[DGC_EditPoolListbox.list[self.index]]

 DGC_EditPoolListbox:update()
 DGCEventFrame:RegisterEvent("CURSOR_UPDATE")
end

local function lists_dropdown_onvaluechanged(self)
 if self.index == 1 then
  self.value = ""
 elseif self.index == 2 then
  self.value = "custom"
 else
  self.value = DailyGlobalCheck.Lists[self.index - 2].Title
 end
 
 questpool_list_changed = true
 DGC_EditPoolListbox:update()
end

local function populate_lists_dropdown()
 local f = DGC_EditPoolDropdown
 wipe(f.list)
 wipe(f.icons)
 tinsert(f.list, ALL)
 tinsert(f.icons, false)
 tinsert(f.list, CUSTOM)
 tinsert(f.icons, T.dgcicon)
 for _, v in pairs(DailyGlobalCheck.Lists) do
  tinsert(f.list, v.Title)
  tinsert(f.icons, v.Icon)
 end
end
--

--- icon selection dialog ---
local icons_meta = setmetatable({}, { __index = function(t, k)
                                                 return current_icons_list[k - icons_added]
                                                end })
                                                
local function refreshIconTable()
 local filter = low(DGCIconDialogPopup.filter)
 wipe(icons_meta)
 icons_added = 0
 if filter == "" or ("inv_misc_questionmark"):find(filter) then
  icons_meta[1] = "inv_misc_questionmark"
  icons_added = icons_added + 1
 end
end

function RecalculateDGCIconDialogPopup(name)
 local popup = DGCIconDialogPopup

 if not icon_filenames then
  icon_filenames = ntl:GetList("icons")
 end

 DGCIconDialogPopupEditBox:HighlightText()
 DGCIconDialogPopup_FilterList()
 
 local list = DailyGlobalCheck.SelectedList
 if list then
  popup.selectedTexture = list.Icon
 else
  DGCIconDialogPopupEditBox:SetText("")
  popup.selectedTexture = "interface\\icons\\inv_misc_questionmark"
 end
 
 local totalItems = #current_icons_list + icons_added
 
 DGCIconDialogPopup_Update()
 
 if popup.selectedTexture then
  local foundIndex
  for index = 1, totalItems do
   if ("interface\\icons\\"..icons_meta[index]) == low(popup.selectedTexture) then
    foundIndex = index
    break
   end
  end

  if not foundIndex then
   foundIndex = 1
  end

  local offsetnumIcons = floor((totalItems - 1) / DGCIconDialogPopup.buttons_per_row) - DGCIconDialogPopup.buttons_per_row / 2
  local offset = floor((foundIndex - 1) / DGCIconDialogPopup.buttons_per_row)
  if foundIndex <= DGCIconDialogPopup.numrows * DGCIconDialogPopup.buttons_per_row then
   offset = 0
  elseif offset > offsetnumIcons then
   offset = offsetnumIcons
  end
  FauxScrollFrame_OnVerticalScroll(DGCIconDialogPopupScrollFrame, offset * 36, 36, nil)
 else
  FauxScrollFrame_OnVerticalScroll(DGCIconDialogPopupScrollFrame, 0, 36, nil)
 end
end

function DGCIconDialogPopup_FilterList(update)
 if DGCIconDialogPopup.filter == "" then
  current_icons_list = icon_filenames
 else
  current_icons_list = ntl:FilterList("icons", DGCIconDialogPopup.filter, filtered_filenames)
 end

 refreshIconTable()
 
 if update then
  DGCIconDialogPopup_Update()
 end
end

function DGCIconDialogPopup_Update()
 local popup = DGCIconDialogPopup
 local buttons = popup.buttons
 local offset = FauxScrollFrame_GetOffset(DGCIconDialogPopupScrollFrame) or 0

 local button

 -- Icon list
 local texture, index, button
 local length = #current_icons_list + icons_added

 for i = 1, DGCIconDialogPopup.numrows * DGCIconDialogPopup.buttons_per_row do
  local button = buttons[i]
  index = offset * DGCIconDialogPopup.buttons_per_row + i
  if index <= length then
   texture = type(icons_meta[index]) == "string" and "interface\\icons\\"..icons_meta[index] or icons_meta[index]
   button.icon:SetTexture(texture)
   button.tex = texture
   button:Show()
   if texture == popup.selectedTexture then
    button:SetChecked(true)
    popup.selectedTexture = texture
   else
    button:SetChecked(false)
   end
  else
   button.icon:SetTexture("")
   button:Hide()
  end
 end

 FauxScrollFrame_Update(DGCIconDialogPopupScrollFrame, ceil(length / DGCIconDialogPopup.buttons_per_row), DGCIconDialogPopup.numrows, 36 )
end

function DGCIconDialogPopupOkay_OnClick(self, button)
 DailyGlobalCheck.SelectedList.Icon = DGCIconDialogPopup.selectedTexture
 DGCIconDialogPopup:Hide()
 DailyGlobalCheck:Refresh(DailyGlobalCheck.SelectedList)
end

function DGCIconDialogPopupCancel_OnClick()
 DGCIconDialogPopup:Hide()
end

function DGCIconPopupButton_OnClick(self, button)
 local offset = FauxScrollFrame_GetOffset(DGCIconDialogPopupScrollFrame) or 0
 DGCIconDialogPopup.selectedTexture = self.tex
 DGCIconDialogPopup_Update()
end

function DGCIconDialogPopup_OnHide(self)
 DGCIconDialogPopup.name = nil
 DGCIconDialogPopup.id = nil
 DGCIconDialogPopup.selectedTexture = "interface\\icons\\inv_misc_questionmark"
 DGCIconDialogPopupEditBox:SetText("")
 collectgarbage()
end

local function changeListIcon(self)
 if not DailyGlobalCheck.SelectedList then return end
 
 DGCIconDialogPopup:Show()
 DGCIconDialogPopup.isEdit = true
 DGCIconDialogPopup.origName = DailyGlobalCheck.SelectedList.Icon
 RecalculateDGCIconDialogPopup(DailyGlobalCheck.SelectedList.Icon)
end

-----------------------------

function tools.setup_edit_mode_panel(p)

 ng = NyxGUI(C.NyxGUIVersion)
 ntl = NyxTL("1.0")

 p:SetScript("OnShow", function()
  local list = DailyGlobalCheck.SelectedList
  if not list or lists:isPlugin(list.Title) then
   select_first_list()
  end
 end)
 
 p:SetScript("OnHide", function()
  for k,v in pairs(DGC_CustomLists.Lists) do
   maps:UpdateList("worldmap", v)
   maps:UpdateList("minimap", v)
  end
 end)

 -- quest pool
 
 -- list dropdown
 local f = ng:New(addonName, "Dropdown", "DGC_EditPoolDropdown", p)
 f.update_button = lists_dropdown_update_button
 f.list  = {}
 f.icons = {}
 f.Populate = populate_lists_dropdown
 f.OnValueChanged = lists_dropdown_onvaluechanged
 
 -- quest pool listbox
 f = ng:New(addonName, "Listbox", "DGC_EditPoolListbox", p)
 constructors:SetupTexture(f, "Interface\\Stationery\\Stationery_ill1")
 f.tex:SetVertexColor(1,1,1,0.4)
 f.hideSelection = true

 f.list      = {}
 f.questIDs  = {}
 f.positions = {} -- stores the quests and groups original positions

 f.update_pre = questpool_listbox_update_pre
 f.update_button = questpool_listbox_update_button
 -- need to initialize before setting the region points, otherwise it will mess up the buttons' width
 f:SetSize(C.modes[C.MODE_EDIT].x / 2 - 40, C.modes[C.MODE_EDIT].y - 240)
 f:Initialize("DGCEditQuestPoolListButton")
 f:SetPoint("TOPLEFT", p, "TOPLEFT", 0, -60)
 f:SetPoint("BOTTOMRIGHT", p, "BOTTOM", -40, 0)

 for _,v in pairs(f.buttons) do
  ng:AddToTheme(addonName, nil, "Listbutton", v)
  
  v:RegisterForDrag("LeftButton")
  v:SetScript("OnDragStart", lists_buttonDragStart)
 end

 DGC_EditPoolDropdown:SetPoint("BOTTOMLEFT", DGC_EditPoolListbox, "TOPLEFT", 4, 5)
 DGC_EditPoolDropdown:SetPoint("BOTTOMRIGHT", DGC_EditPoolListbox, "TOP", -2, 5)

 -- quest pool filter editbox
 f = ng:New(addonName, "Editbox", "DGC_EditPoolFilter", p)
 f:SetTitle(SEARCH)
 f:SetPoint("BOTTOMRIGHT", DGC_EditPoolListbox, "TOPRIGHT", 0, 5)
 f:SetPoint("BOTTOMLEFT", DGC_EditPoolListbox, "TOP", 4, 5)
 f:SetHeight(20)
 f:SetScript("OnTextChanged", function() 
   questpool_list_changed = true
   DGC_EditPoolListbox:update() 
  end)

 -- quests listbox --
 f = ng:New(addonName, "Listbox", "DGC_EditListbox", p)
 constructors:SetupTexture(f, "Interface\\Stationery\\Stationery_ill1")
 f.tex:SetVertexColor(1,1,1,0.4)
 f.hideSelection = true

 f.list      = {}
 f.positions = {} -- stores the quests and groups original positions

 f.update_pre = edit_listbox_update_pre
 f.update_button = edit_listbox_update_button
 -- need to initialize before setting the region points, otherwise it will mess up the buttons' width
 f:SetSize(C.modes[C.MODE_EDIT].x / 2, C.modes[C.MODE_EDIT].y - 240)
 f:RegisterForDrag("LeftButton")
 f:SetScript("OnReceiveDrag", edit_listboxDragReceive)
 f:SetScript("OnMouseUp", edit_listboxDragReceive)

 f:Initialize("DGCEditListButton")
 f:SetPoint("TOPLEFT", p, "TOP", 0, -60)
 f:SetPoint("BOTTOMRIGHT", p, "BOTTOMRIGHT", -20, 0)

 for _,v in pairs(f.buttons) do
  ng:AddToTheme(addonName, "main", "Listbutton", v)

  v:RegisterForDrag("LeftButton")
  v:SetScript("OnDragStart", edit_buttonDragStart)
  v:SetScript("OnReceiveDrag", edit_buttonDragReceive)
  v:SetScript("OnMouseUp", edit_buttonDragReceive)
  
  v.func = edit_listbutton_click
 end

 -- rename group editbox
 f = ng:New(addonName, "Editbox", "DGC_EdtGroupRename", DGC_EditListbox)
 --f:SetFrameStrata("HIGH")
 f:SetScript("OnEnterPressed", function(self)
   local group = self.group
 
   if not group then return end

   local list = DailyGlobalCheck.SelectedList.Order[pages:Curr()][group]
   list[1] = self:GetText()
   self.group = nil
   self:Hide()
   DailyGlobalCheck:Refresh()
  end)
 f:SetScript("OnEscapePressed", function(self) 
   self.group = nil
   self:Hide()
  end)
 f:Hide()

 -- rename list editbox
 f = ng:New(addonName, "Editbox", "DGC_EdtListRename", p)
 f:SetPoint("TOP", DGC_Mainframe.title, "TOP", 0, 5)
 f:SetPoint("BOTTOM", DGC_Mainframe.title, "BOTTOM", 0, -5)
 f:SetWidth(300)
 f:SetScript("OnEnterPressed", function(self)
   local list = DailyGlobalCheck.SelectedList
 
   if not list then return end

   if lists:Rename(list, self:GetText()) then
    self:Hide()
    DGC_BtnListRename:Show()
    DailyGlobalCheck:Refresh()
   end
  end)
 f:SetScript("OnEscapePressed", function(self) 
   self:Hide()
   DGC_BtnListRename:Show()
  end)
 f:Hide()

 -- rename list button
 f = CreateFrame("Button", "DGC_BtnListRename", p)
 f:SetHighlightTexture("Interface\\Buttons\\UI-Listbox-Highlight2")
 f:GetHighlightTexture():SetVertexColor(1,1,1,0.4)
 f:SetSize(24, 24)
 f:SetPoint("LEFT", DGC_Mainframe.title, "RIGHT", 5, 0)
 constructors:SetupTexture(f, T.btn_rename_list)
 f:SetScript("OnClick", rename_list)

 -- remove list button
 f = ng:New(addonName, "Button", nil, p)
 ng:RemoveFromTheme(addonName, "main", "Button", f)
 f:SetBackdropColor(0.5, 0, 0, 0.5)
 f.highlight:SetVertexColor(0.5, 0, 0, 0.5)
 f.highlight:SetAlpha(0)
 f:SetPoint("TOPRIGHT", DGC_Mainframe, "TOPRIGHT", -10, -50)
 f:SetText(L["delete_list"])
 f:SetScript("OnClick", delete_list)

 -- icon selection frame init
 addonTable:CreateIconSelectionFrame()
 
 -- change icon button
 f = CreateFrame("Frame", nil, p)
 f:SetPoint("TOPLEFT", DGC_Mainframe.dgcicon, "TOPLEFT", -4, 4)
 f:SetPoint("BOTTOMRIGHT", DGC_Mainframe.dgcicon, "BOTTOMRIGHT", 4, -4)
 f.tex = f:CreateTexture()
 f.tex:SetAllPoints()
 f.tex:SetBlendMode("ADD")
 f.tex:SetTexture("Interface\\Buttons\\ButtonHilight-Square")
 f:SetScript("OnMouseUp", changeListIcon)

 -- new page button
 f = ng:New(addonName, "Button", nil, p)
 f:SetPoint("BOTTOMRIGHT", DGC_Mainframe, "BOTTOMRIGHT", -60, 40)
 f:SetText(L["new_page"])
 f:SetScript("OnClick", new_page)

 -- delete page button
 f = ng:New(addonName, "Button", nil, p)
 ng:RemoveFromTheme(addonName, "main", "Button", f)
 f:SetBackdropColor(0.5, 0, 0, 0.5)
 f.highlight:SetVertexColor(0.5, 0, 0, 0.5)
 f.highlight:SetAlpha(0)
 f:SetPoint("BOTTOMRIGHT", DGC_Mainframe, "BOTTOMRIGHT", -60, 10)
 f:SetText(L["del_page"])
 f:SetScript("OnClick", delete_page)

 -- help button
 f = CreateFrame("Button", "DGC_EMHelpButton", p, "MainHelpPlateButton")
 f:SetPoint("TOPLEFT", DGC_Mainframe, "TOPLEFT", -5, 5)
 f:SetScript("OnClick", function()
  local hp = addonTable.HelpPlates.EditMode

  if not help:isShowing(hp) then
   help:Show(hp, DGC_Mainframe, DGC_EMHelpButton)
  else
   help:Hide()
  end
 end)

 DGCEventFrame:Hook("PLUGIN_LOADED", populate_lists_dropdown)

 DGC_EditPoolDropdown:Initialize()
 p:Hide()
 p:Show()
end
