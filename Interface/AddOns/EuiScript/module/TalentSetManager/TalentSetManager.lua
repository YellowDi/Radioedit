-- Talent Sets
-- by Jadya
-- EU-Well of Eternity
local E = unpack(ElvUI)
local addonName, addonTable = ...
local L = addonTable.L

local icon_filenames = {}
local max_talent_sets = 15
local numTiers = 7
local numColumns = 3

local spec, sets
             
local function getSetByName(name)
 for k, v in pairs(sets) do
  if v.name == name then return k end
 end
end

local function modifyTalentSet(origName, name, texture)
 local i = getSetByName(origName)
 
 if not i then return end
 
 sets[i].name = name
 if texture then
  sets[i].texture = type(texture) == "number" and texture or ("Interface\\Icons\\"..texture)
 end
end

local function saveTalentSet(name, texture)
 local i = getSetByName(name)

 if not i then i = #sets + 1 end
 
 sets[i] = sets[i] or {}

 sets[i].name = name
 
 if texture then
  sets[i].texture = type(texture) == "number" and texture or ("Interface\\Icons\\"..texture)
 end

 for j = 1, numTiers do
  for c = 1, numColumns do
   local _, _, _, selected = GetTalentInfo(j, c, 1)
   if selected then
    sets[i][j] = c
   end
  end
 end
end

local function deleteTalentSet(name)
 local id = getSetByName(name)

 if not sets[id] then return end
 
 tremove(sets, id)
 TalentSetsList.selectedSetName = nil
 TalentSetList_Update()
end

StaticPopupDialogs["TS_CONFIRM_SAVE_TALENT_SET"] = {
	text = L["confirm_save_set"],
	button1 = YES,
	button2 = NO,
	OnAccept = function (self) saveTalentSet(self.data) TalentSetList_Update() end,
	OnCancel = function (self) end,
	OnHide = function (self) self.data = nil end,
	hideOnEscape = 1,
	timeout = 0,
	exclusive = 1,
	whileDead = 1,
}

StaticPopupDialogs["TS_CONFIRM_DELETE_TALENT_SET"] = {
	text = L["confirm_delete_set"],
	button1 = YES,
	button2 = NO,
	OnAccept = function (self) deleteTalentSet(self.data) end,
	OnCancel = function (self) end,
	hideOnEscape = 1,
	timeout = 0,
	exclusive = 1,
	whileDead = 1,
}

StaticPopupDialogs["TS_CONFIRM_OVERWRITE_TALENT_SET"] = {
	text = L["confirm_overwrite_set"],
	button1 = YES,
	button2 = NO,
	OnAccept = function(self) saveTalentSet(self.data, self.selectedIcon) TalentSetsDialogPopup:Hide() TalentSetList_Update() end,
	OnCancel = function(self) end,
	OnHide = function(self) self.data = nil self.selectedIcon = nil end,
	hideOnEscape = 1,
	timeout = 0,
	exclusive = 1,
	whileDead = 1,
}

local function isEquipped(i)
 if not sets[i] then return end

 for j = 1, numTiers do
  local id, _, _, selected = GetTalentInfo(j, sets[i][j] or 0, 1)
  if not selected then
   return
  end
 end
 return true
end

local function setTalents(i)
 if not sets[i] or isEquipped(i) then return end

 for j = 1, numTiers do
  local id = GetTalentInfo(j, sets[i][j] or 0, 1)
  if id then
   LearnTalent(id)
  end
 end
end

function TalentSetList_Update()
 local name = TalentSetsList.selectedSetName

 if name then
  local i = getSetByName(name)
  if isEquipped(i) then
   TalentSetsListSaveSet:Disable()
   TalentSetsListEquipSet:Disable()
  else
   TalentSetsListSaveSet:Enable()
   TalentSetsListEquipSet:Enable()
  end
 else
  TalentSetsListSaveSet:Disable()
  TalentSetsListEquipSet:Disable()
 end

 local numSets = #sets
 local numRows = numSets
 if numSets < max_talent_sets then
  numRows = numRows + 1  -- "Add New Set" button
 end

 HybridScrollFrame_Update(TalentSetsList, numRows * 44 + TalentSetsListEquipSet:GetHeight() + 20, TalentSetsList:GetHeight())
 
 local scrollOffset = HybridScrollFrame_GetOffset(TalentSetsList)
 local buttons = TalentSetsList.buttons
 local selectedName = TalentSetsList.selectedSetName

 local id, texture, button
 for i = 1, #buttons do
  if (i+scrollOffset <= numRows) then
   button = buttons[i]
   buttons[i]:Show()
   button:Enable()
   id = i + scrollOffset
 
   if id <= numSets then
    button.name = sets[id].name
    button.text:SetText(sets[id].name)
    button.text:SetTextColor(NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b)
                
    if sets[id].texture then
     button.icon:SetTexture(sets[id].texture)
    else
     button.icon:SetTexture("Interface\\Icons\\INV_Misc_QuestionMark")
    end

    if selectedName and button.name == selectedName then
     button.SelectedBar:Show()
    else
     button.SelectedBar:Hide()
    end
    
    if isEquipped(id) then
     button.Check:Show()
    else
     button.Check:Hide()
    end

    button.icon:SetSize(36, 36)
    button.icon:SetPoint("LEFT", 4, 0)
   else
    -- This is the Add New button
    button.name = nil
    button.text:SetText(PAPERDOLL_NEWEQUIPMENTSET)
    button.text:SetTextColor(GREEN_FONT_COLOR.r, GREEN_FONT_COLOR.g, GREEN_FONT_COLOR.b)
    button.icon:SetTexture("Interface\\PaperDollInfoFrame\\Character-Plus")
    button.icon:SetSize(30, 30)
    button.icon:SetPoint("LEFT", 7, 0)
    button.Check:Hide()
    button.SelectedBar:Hide()
   end
    
   if (i+scrollOffset) == 1 then
    buttons[i].BgTop:Show()
    buttons[i].BgMiddle:SetPoint("TOP", buttons[i].BgTop, "BOTTOM")
   else
    buttons[i].BgTop:Hide()
    buttons[i].BgMiddle:SetPoint("TOP")
   end
    
   if ((i+scrollOffset) == numRows) then
    buttons[i].BgBottom:Show()
    buttons[i].BgMiddle:SetPoint("BOTTOM", buttons[i].BgBottom, "TOP")
   else
    buttons[i].BgBottom:Hide()
    buttons[i].BgMiddle:SetPoint("BOTTOM")
   end
    
   if ((i+scrollOffset)%2 == 0) then
    buttons[i].Stripe:SetColorTexture(0.9, 0.9, 1)
    buttons[i].Stripe:SetAlpha(0.1)
    buttons[i].Stripe:Show()
   else
    buttons[i].Stripe:Hide()
   end
  else
   buttons[i]:Hide()
  end
 end
end

local last_t = 0
local function listBox_update(f, elapsed)
 for i = 1, #f.buttons do
  local button = f.buttons[i]
  if button:IsMouseOver() then
   if button.name and button.name ~= "" then
  	button.DeleteButton:Show()
  	button.EditButton:Show()
   else
    button.DeleteButton:Hide()
    button.EditButton:Hide()
   end
   button.HighlightBar:Show()
  else
   button.DeleteButton:Hide()
   button.EditButton:Hide()
   button.HighlightBar:Hide()
  end
 end
 
 if f.queuedUpdate then
  last_t = last_t + elapsed
  if last_t > 0.5 then
   TalentSetList_Update()
   f.queuedUpdate = false
   last_t = 0
  end
 end
end

function TalentSetList_OnEvent(self, event, ...)
 -- PLAYER_PVP_TALENT_UPDATE
 if event == "PLAYER_TALENT_UPDATE" then
  TalentSetList_Update()
 end
end

function TalentSetList_OnHide(self)
 TalentSetsDialogPopup:Hide()
 StaticPopup_Hide("TS_CONFIRM_DELETE_TALENT_SET")
 StaticPopup_Hide("TS_CONFIRM_OVERWRITE_TALENT_SET")
end

function TalentSetListButton_Delete_OnClick(f)
 local id = getSetByName(f:GetParent().name)
 if not id or not sets[id] then return end

 local dialog = StaticPopup_Show("TS_CONFIRM_DELETE_TALENT_SET", sets[id].name)
 if dialog then
  dialog.data = sets[id].name
 else
  UIErrorsFrame:AddMessage(ERR_CLIENT_LOCKED_OUT, 1.0, 0.1, 0.1, 1.0)
 end
end

function TalentSetListButton_OnClick(f, button, down)
 if f.name and f.name ~= "" then
  PlaySound("igMainMenuOptionCheckBoxOn")
  TalentSetsList.selectedSetName = f.name
  -- mark the ignored slots
  TalentSetList_Update()
  TalentSetsDialogPopup:Hide()
 else
  -- This is the "New Set" button
  TalentSetsDialogPopup:Show()
  TalentSetsList.selectedSetName = nil
  TalentSetList_Update()
 end
 StaticPopup_Hide("TS_CONFIRM_DELETE_TALENT_SET")
 StaticPopup_Hide("TS_CONFIRM_OVERWRITE_TALENT_SET")
end

function TalentSetListButton_OnDoubleClick(f)
 if f.name and f.name ~= "" then
  PlaySound("igCharacterInfoTab")
  setTalents(getSetByName(f.name))
  TalentSetsList.queuedUpdate = true
 end
end

function TalentSetListButton_OnEnter(f)
 --if f.name and f.name ~= "" then
  --GameTooltip_SetDefaultAnchor(GameTooltip, f)
 --end
end

local function equipSet_OnClick(f)
 local name = TalentSetsList.selectedSetName
 if name and name ~= "" then
  local i = getSetByName(name)
  PlaySound("igCharacterInfoTab")
  setTalents(i)
  TalentSetsList.queuedUpdate = true
 end
end

local function saveSet_OnClick(self)
 local selectedSetName = TalentSetsList.selectedSetName
 if selectedSetName and selectedSetName ~= "" then
  local dialog = StaticPopup_Show("TS_CONFIRM_SAVE_TALENT_SET", selectedSetName)
  if dialog then
   dialog.data = selectedSetName
  else
   UIErrorsFrame:AddMessage(ERR_CLIENT_LOCKED_OUT, 1.0, 0.1, 0.1, 1.0)
  end
 end
end

local function showFrame()
 if not ElvUI[1].db.euiscript.talentSetManager then return; end

 if TalentSetManager_Options.visible then
  TalentSetsMainframe:Show()
 end
 TalentSetsShowButton:Show()
end

local function hideFrame()
 TalentSetsMainframe:Hide()
 TalentSetsShowButton:Hide()
end

local function initializeFrame()

 local mf = CreateFrame("Frame", "TalentSetsMainframe", PlayerTalentFrame, "InsetFrameTemplate")
 mf:SetSize(200, 346)
 mf:SetPoint("LEFT", PlayerTalentFrame, "RIGHT", -1, 0)

 mf.title = mf:CreateFontString(nil, "BACKGROUND", "QuestFont_Shadow_Huge")
 mf.title:SetPoint("TOP", 0, -6)
 mf.title:SetText(L["talent_sets"])
 mf.title:SetTextColor(GREEN_FONT_COLOR.r, GREEN_FONT_COLOR.g, GREEN_FONT_COLOR.b)
 
 local btn = CreateFrame("Checkbutton", "TalentSetsShowButton", PlayerTalentFrame, "SpellBookSkillLineTabTemplate")
 btn.tooltip = L["talent_sets"]
 btn:SetPoint("TOPLEFT", PlayerTalentFrame, "TOPRIGHT", 0, -20)
 btn:SetChecked(TalentSetManager_Options.visible)
 btn:SetNormalTexture("Interface\\Icons\\achievement_guildperk_ladyluck_rank2")

 btn:SetScript("OnClick", function()
  TalentSetManager_Options.visible = not TalentSetManager_Options.visible
  if TalentSetManager_Options.visible then
   TalentSetsMainframe:Show()
  else
   TalentSetsMainframe:Hide()
  end
 end)
 
 TalentSetsDialogPopup:SetParent(mf)
 TalentSetsDialogPopup:SetPoint("LEFT", mf, "RIGHT")
 
 local f = CreateFrame("Scrollframe", "TalentSetsList", mf, "HybridScrollFrameTemplate")
 f:SetSize(172, 304)
 f:SetPoint("TOPLEFT", mf, "TOPLEFT", 1, -30)
 --f:SetPoint("BOTTOMRIGHT", mf, "BOTTOMRIGHT", -25, 1)
 
 f:SetFrameLevel(mf:GetFrameLevel() + 1)
 
 f.scrollBar = CreateFrame("Slider", "TalentSetsFrameScrollBar", f, "HybridScrollBarTemplate")
 f.scrollBar:SetPoint("TOPLEFT", f, "TOPRIGHT", 4, -19)
 f.scrollBar:SetPoint("BOTTOMLEFT", f, "BOTTOMRIGHT", 4, 14)
 f.scrollBar.doNotHide = 1
 
 -- equip button
 f.EquipSet = CreateFrame("Button", "TalentSetsListEquipSet", f, "UIPanelButtonTemplate")
 f.EquipSet:SetSize(87, 22)
 f.EquipSet:SetPoint("TOPLEFT", f, "TOPLEFT")
 f.EquipSet:SetScript("OnClick", equipSet_OnClick)
 f.EquipSet:SetText(LEARN)
 f.EquipSet:SetFrameLevel(mf:GetFrameLevel() + 3)

 f.EquipSet.ButtonBackground = f.EquipSet:CreateTexture(nil, "BACKGROUND", 0)
 f.EquipSet.ButtonBackground:SetPoint("TOPLEFT", f, "TOPLEFT")
 f.EquipSet.ButtonBackground:SetPoint("BOTTOMRIGHT", f, "TOPRIGHT", 0, -23)
 f.EquipSet.ButtonBackground:SetColorTexture(0, 0, 0)

 
 -- save button
 f.SaveSet = CreateFrame("Button", "TalentSetsListSaveSet", f, "UIPanelButtonTemplate")
 f.SaveSet:SetSize(87, 22)
 f.SaveSet:SetPoint("LEFT", f.EquipSet, "RIGHT")
 f.SaveSet:SetScript("OnClick", saveSet_OnClick)
 f.SaveSet:SetText(SAVE)
 f.SaveSet:SetFrameLevel(mf:GetFrameLevel() + 3)
 
 f.update = TalentSetList_Update
 f:SetScript("OnUpdate", listBox_update)
 f:SetScript("OnEvent", TalentSetList_OnEvent)
 f:SetScript("OnHide", TalentSetList_OnHide)
 f:SetScript("OnShow", TalentSetList_Update)
 
 HybridScrollFrame_CreateButtons(f, "TalentSetListButton", 2, -(f.EquipSet:GetHeight()+4))
 f:update()

 f:RegisterEvent("PLAYER_TALENT_UPDATE")
-- f:RegisterEvent("PLAYER_UPDATE_RESTING")
end

function TalentSetsDialogPopup_OnLoad (self)
 self.buttons = {}
 
 local rows = 0
 
 local button = CreateFrame("CheckButton", "TalentSetsDialogPopupButton1", TalentSetsDialogPopup, "TalentSetPopupButtonTemplate")
 button:SetPoint("TOPLEFT", 24, -85)
 button:SetID(1)
 tinsert(self.buttons, button)
 
 local lastPos
 for i = 2, 15 do
  button = CreateFrame("CheckButton", "TalentSetsDialogPopupButton" .. i, TalentSetsDialogPopup, "TalentSetPopupButtonTemplate")
  button:SetID(i)
  
  lastPos = (i - 1) / 5
  if lastPos == math.floor(lastPos) then
   button:SetPoint("TOPLEFT", self.buttons[i - 5], "BOTTOMLEFT", 0, -8)
  else
   button:SetPoint("TOPLEFT", self.buttons[i - 1], "TOPRIGHT", 10, 0)
  end
  tinsert(self.buttons, button)
 end
 
 self.SetSelection = function(self, fTexture, Value)
  if fTexture then
   self.selectedTexture = Value
   self.selectedIcon = nil
  else
   self.selectedTexture = nil
   self.selectedIcon = Value
  end
 end
end

function TalentSetsDialogPopup_OnShow(self)
 PlaySound("igCharacterInfoOpen")
 self.name = nil
 self.id = nil
 self.isEdit = false
 RecalculateTalentSetsDialogPopup()
end

function TalentSetsDialogPopup_OnHide(self)
 TalentSetsDialogPopup.name = nil
 TalentSetsDialogPopup.id = nil
 TalentSetsDialogPopup:SetSelection(true, nil)
 TalentSetsDialogPopupEditBox:SetText("")
 icon_filenames = nil
 collectgarbage()
end

function RecalculateTalentSetsDialogPopup(name)
 local popup = TalentSetsDialogPopup
 local i = getSetByName(name)
 if i then
  TalentSetsDialogPopupEditBox:SetText(name)
  if sets[i].texture then
   popup:SetSelection(true, sets[i].texture)
  else
   popup:SetSelection(false, 1)
  end
 else
  TalentSetsDialogPopupEditBox:SetText("")
  popup:SetSelection(false, 1)
 end
 
 TalentSetsDialogPopupEditBox:HighlightText(0)

 RefreshSetIconInfo()
 local totalItems = #icon_filenames
 local texture
 if popup.selectedTexture then
  local foundIndex
  for index=1, totalItems do
   texture = icon_filenames[index]
   if texture == popup.selectedTexture then
    foundIndex = index
    break
   end
  end
  if not foundIndex then
   foundIndex = 1
  end
  
  local offsetnumIcons = floor((totalItems - 1) / 5)
  local offset = floor((foundIndex - 1) / 5)
  offset = offset + min((3 - 1), offsetnumIcons-offset) - (3 - 1)
  if foundIndex <= 15 then
   offset = 0
  end
  FauxScrollFrame_OnVerticalScroll(TalentSetsDialogPopupScrollFrame, offset*36, 36, nil)
 else
  FauxScrollFrame_OnVerticalScroll(TalentSetsDialogPopupScrollFrame, 0, 36, nil)
 end
 TalentSetsDialogPopup_Update()
end

function RefreshSetIconInfo()
 icon_filenames = {}
 icon_filenames[1] = "INV_MISC_QUESTIONMARK"
 local index = 2
    
 for c = 1, 7 do
  for r = 1,3 do
   local _, _, texture = GetTalentInfo(c, r, 1)

   if texture then
    texture = string.lower(texture):gsub("interface\\icons\\", "")
    icon_filenames[index] = texture
    if icon_filenames[index] then
     index = index + 1
     for j = 1, index - 1 do
      if icon_filenames[index] == icon_filenames[j] then
       icon_filenames[index] = nil
       index = index - 1
       break
      end
     end
    end
   end
  end
 end
 GetLooseMacroItemIcons(icon_filenames)
 GetLooseMacroIcons(icon_filenames)
 GetMacroItemIcons(icon_filenames)
 GetMacroIcons(icon_filenames)
end

function TalentSetsDialogPopup_Update()
 RefreshSetIconInfo()

 local popup = TalentSetsDialogPopup
 local buttons = popup.buttons
 local offset = FauxScrollFrame_GetOffset(TalentSetsDialogPopupScrollFrame) or 0
 local button
 -- Icon list
 local texture, index, button, realIndex
 for i = 1, 15 do
  local button = buttons[i]
  index = offset * 5 + i
  if index <= #icon_filenames then
   texture = icon_filenames[index]
   button.icon:SetTexture(type(texture) == "number" and texture or ("INTERFACE\\ICONS\\"..texture))
   button:Show()
   if index == popup.selectedIcon then
    button:SetChecked(true)
   elseif texture == popup.selectedTexture then
    button:SetChecked(true)
    popup:SetSelection(false, index)
   else
    button:SetChecked(false)
   end
  else
   button.icon:SetTexture("")
   button:Hide()
  end
 end
 FauxScrollFrame_Update(TalentSetsDialogPopupScrollFrame, ceil(#icon_filenames / 5) , 3, 36 )
end

function TalentSetsDialogPopupOkay_Update()
 local popup = TalentSetsDialogPopup
 local button = TalentSetsDialogPopupOkay
 
 if (popup.selectedIcon or popup.isEdit) and popup.name then
  button:Enable()
 else
  button:Disable()
 end
end

function TalentSetsDialogPopupOkay_OnClick(self, button)
 local popup = TalentSetsDialogPopup
 local iconTexture = icon_filenames[popup.selectedIcon]

 if getSetByName(popup.name) then
  if popup.isEdit and popup.name ~= popup.origName then
   UIErrorsFrame:AddMessage(L["set_already_exists"], 1.0, 0.1, 0.1, 1.0)
   return
  elseif not popup.isEdit then
   local dialog = StaticPopup_Show("TS_CONFIRM_OVERWRITE_TALENT_SET", popup.name)
   if dialog then
 	dialog.data = popup.name
 	dialog.selectedIcon = icon_filenames[popup.selectedIcon]
   else
    UIErrorsFrame:AddMessage(ERR_CLIENT_LOCKED_OUT, 1.0, 0.1, 0.1, 1.0)
   end
   return
  end
 elseif #sets >= max_talent_sets and not popup.isEdit then
  UIErrorsFrame:AddMessage(L["sets_limit_reached"], 1.0, 0.1, 0.1, 1.0)
  return
 end
 
 if popup.isEdit then
  TalentSetsList.selectedSetName = popup.name
  modifyTalentSet(popup.origName, popup.name, iconTexture)
 else
  saveTalentSet(popup.name, iconTexture)
 end
 --TalentSetsList.queuedUpdate = true
 TalentSetList_Update()
 popup:Hide()
end

function TalentSetsDialogPopupCancel_OnClick()
 TalentSetsDialogPopup:Hide()
end

function TalentSetPopupButton_OnClick(self, button)
 local popup = TalentSetsDialogPopup
 local offset = FauxScrollFrame_GetOffset(TalentSetsDialogPopupScrollFrame) or 0
 popup.selectedIcon = (offset * 5) + self:GetID()
 popup.selectedTexture = nil
 TalentSetsDialogPopup_Update()
 TalentSetsDialogPopupOkay_Update()
end

local function specChanged()
 if not TalentSetManager_Saves then
 	TalentSetManager_Saves = {}
 end
 if not spec then
	 spec = GetSpecialization()
  end
 if not TalentSetManager_Saves.talents[spec] then
  TalentSetManager_Saves.talents[spec] = {}
 end
 sets = TalentSetManager_Saves.talents[spec]
 if TalentSetsList then
  TalentSetsList.selectedSetName = nil
  TalentSetList_Update()
 end
end

local eventframe = CreateFrame("Frame")
local function eventhandler(self, event, ...)
 if event == "VARIABLES_LOADED" then
 
  if not TalentSetManager_Options then TalentSetManager_Options = {} end
  if TalentSetManager_Options.visible == nil then TalentSetManager_Options.visible = true end
  if not TalentSetManager_Saves then TalentSetManager_Saves = {} end
  if not TalentSetManager_Saves.talents then TalentSetManager_Saves.talents = {} end

 elseif event == "ACTIVE_TALENT_GROUP_CHANGED" then
  local new_spec = GetSpecialization()
  if new_spec ~= spec then
   spec = new_spec
   specChanged()
  end
 elseif event == "PLAYER_LEVEL_UP" then
  numTiers = GetMaxTalentTier()
 elseif ... == "Blizzard_TalentUI" then
  numTiers = GetMaxTalentTier()
  spec = GetSpecialization()
  specChanged()
  
  initializeFrame()
  if PlayerTalentFrameTalents then
	PlayerTalentFrameTalents:HookScript("OnShow", showFrame)
	PlayerTalentFrameTalents:HookScript("OnHide", hideFrame)
  end
 end
end

function E:TalentSetManager_Toggle(toggle)
	if toggle then
		eventframe:RegisterEvent("ADDON_LOADED")
		eventframe:RegisterEvent("VARIABLES_LOADED")
		eventframe:RegisterEvent("PLAYER_LEVEL_UP")
		eventframe:RegisterEvent("ACTIVE_TALENT_GROUP_CHANGED")
		eventframe:SetScript("OnEvent", eventhandler)
		if not TalentSetsMainframe then
			eventhandler(eventframe, "VARIABLES_LOADED")
			numTiers = GetMaxTalentTier()
			spec = GetSpecialization()
			specChanged()
		end
		if IsAddOnLoaded("Blizzard_TalentUI") then
			eventhandler(eventframe, "ADDON_LOADED", "Blizzard_TalentUI")
		end
	else
		eventframe:UnregisterEvent("ADDON_LOADED")
		eventframe:UnregisterEvent("VARIABLES_LOADED")
		eventframe:UnregisterEvent("PLAYER_LEVEL_UP")
		eventframe:UnregisterEvent("ACTIVE_TALENT_GROUP_CHANGED")
		eventframe:SetScript("OnEvent", nil)
		if TalentSetsMainframe then hideFrame() end
	end
end