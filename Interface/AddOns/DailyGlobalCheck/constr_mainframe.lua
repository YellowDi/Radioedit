-- Daily Global Check
-- by Jadya
-- EU-Well of Eternity

-- [[ Mainframe constructor ]]--

local tinsert = table.insert

local addonName, addonTable = ...

local L = addonTable.L
local C = addonTable.C
local T = addonTable.T

local AddColor = addonTable.AddColor

local new_list_button = { ["Title"] = L["create_new_list"],
                          ["Icon"]  = T.newlist }

local arrowl = "Interface\\icons\\misc_arrowleft"
local arrowr = "Interface\\icons\\misc_arrowright"
local tx_aboutbtn     = "Interface\\icons\\Icon_PetFamily_Beast"
local tx_optionsbtn = "Interface\\icons\\Icon_PetFamily_Mechanical"
local tx_charlist = "Interface\\icons\\Ability_Ambush"
local tx_editbtn = "Interface\\icons\\Garrison_Build"

local chars        = DailyGlobalCheck.CharFunctions
local pages        = DailyGlobalCheck.PagesFunctions
local options      = DailyGlobalCheck.OptFunctions
local constructors = DailyGlobalCheck.Constructors
local lists        = DailyGlobalCheck.ListFunctions
local quest        = DailyGlobalCheck.QuestFunctions
local help         = DailyGlobalCheck.HelpFunctions
local modes        = DailyGlobalCheck.ModeFunctions
local tools        = DailyGlobalCheck.Tools

local opt_framespeed = 20  -- frames animation speed
local centerbuttons_spacing = 80 -- mainframe buttons

local function CheckFramesAnimation(frame)
 if frame and frame:IsVisible() and frame.maxwidth ~= nil and frame.width ~= nil and frame.opening ~= nil then
  if frame.opening then
   if frame.width < frame.maxwidth then
    frame.width = frame.width + opt_framespeed
    frame:SetHeight(frame.width)
   elseif not frame.leftfont:IsVisible() then
    frame.leftfont:Show()
    frame.rightfont:Show()
   end
  else -- closing
   if frame.width > opt_framespeed then
    frame.width = frame.width - opt_framespeed
    frame:SetHeight(frame.width)
    if frame.leftfont:IsVisible() then
     frame.leftfont:Hide()
     frame.rightfont:Hide()
    end
   else
    frame:Hide()
   end
  end
 end
end

local function CreateAboutFrame()

 local btn, f
 f = CreateFrame("Frame")
 f:SetParent(DGC_Mainframe)
 constructors:SetupFrame(f)
 f.leftfont = f:CreateFontString(nil, "OVERLAY", "GameTooltipText")
 f.rightfont = f:CreateFontString(nil, "OVERLAY", "GameTooltipText")
 f.rightfont:SetJustifyH("RIGHT")
 f.leftfont:SetPoint("TOPLEFT",5,-5) 
 f.rightfont:SetPoint("TOPRIGHT",-5,-5)
 f.width = 1
 f.maxwidth = 220
 f.leftfont:Hide()
 f.rightfont:Hide()
 f:SetFrameStrata("DIALOG")
 f:SetClampedToScreen(true)
 f:ClearAllPoints()
 f:SetPoint("TOPLEFT", DGC_Mainframe, "BOTTOMLEFT")
 f:SetPoint("TOPRIGHT", DGC_Mainframe, "BOTTOMRIGHT")
 
 -- about button
 btn = CreateFrame("FRAME", nil, DGC_Mainframe)
 btn.tex = btn:CreateTexture()
 btn:SetPoint("BOTTOM", DGC_Mainframe, "BOTTOM",centerbuttons_spacing,10)
 btn:SetSize(25,25)
 btn.tex:SetAllPoints()
 btn.tex:SetTexture(tx_aboutbtn)
 btn.enabled = true
 
 f.leftfont:SetText(AddColor(" Daily Global Check ","GOLD")..C.str_version.."\n"..
                                         AddColor(" by\n","GRAY")..
                                         AddColor(" Jadya","LIGHT_BLUE")..
                                         AddColor(" EU-Well of Eternity\n\n","GRAY")..
										 AddColor(" Plugins available on Curse:\n","LIGHT_GREEN")..
                                         AddColor(" Daily Global Check_Legion Rare Mobs\n"..
												  " Daily Global Check_Legion Treasure Chests\n"..
												  " Daily Global Check_Legion World Quests\n"..
                                                  " Daily Global Check_World Bosses\n"..
												  " Daily Global Check_Pet Tamers\n"..
												  " Daily Global Check_GarrisonMissions\n"..
												  " Daily Global Check_GarrisonWorkOrders\n"..
												  " Daily Global Check_Professions\n"..
												  " Daily Global Check_Instance Lockouts\n"..
												  " Daily Global Check_Hallow's End\n"..
												  " Daily Global Check_Lunar Festival\n"..
												  " Daily Global Check_Midsummer\n",
                                                  "GRAY")
										 )
 f.rightfont:SetText("|T"..T.dgcicon..":24|t\n")

 -- frame's opening/closing animation
 f:SetScript("OnUpdate", function(self)
   CheckFramesAnimation(f)
  end)

  btn:SetScript("OnEnter", function(self)
   if btn.enabled then
    f.opening = true
    f:SetHeight(f.width)
    f:Show()
   end
 end)

  btn:SetScript("OnLeave", function(self)
    f.opening = false 
  end)
 btn:Show()
 
 if f.opening then f:Show() else f:Hide() end
 DGC_Mainframe.fabout = f
 DGC_Mainframe.btnabout = btn
end

local function setAnchor(self, anchor)
if self.editmode then return end
   
 local x,y = self:GetLeft(), self:GetTop()
 self:ClearAllPoints()
 y = -GetScreenHeight() + y

 if anchor == "TOPLEFT" then
  self:SetPoint(anchor, UIParent, "TOPLEFT", x, y)
 elseif anchor == "TOPRIGHT" then
  self:SetPoint(anchor, UIParent, "TOPLEFT", x + self:GetWidth(), y)
 elseif anchor == "BOTTOMLEFT" then
  self:SetPoint(anchor, UIParent, "TOPLEFT", x, y - self:GetHeight())
 elseif anchor == "BOTTOMRIGHT" then
  self:SetPoint(anchor, UIParent, "TOPLEFT", x + self:GetWidth(), y - self:GetHeight())
 end
 
 local a1, _, a2, x, y = self:GetPoint()
 DailyGlobalCheck_Options["frame_position"] = {a1, nil, a2, x, y}
end

local function pluginbutton_func(self)
 DGC_Mainframe:SetAnchor("TOPLEFT")
 DailyGlobalCheck:OpenList(self.list)
end

function DailyGlobalCheck:RefreshListButtons(list)

 if not DGC_Mainframe then return end

 -- if a list is specified, refresh only if it's missing
 if list then
  for _,v in pairs(DGC_Mainframe.listbuttons) do
   if v.list == list then 
    return
   end
  end
 end

 local listbuttons_counter = 1

 local function createlistbutton(v, func)
  local btn
  if DGC_Mainframe.listbuttons[listbuttons_counter] then
   btn = DGC_Mainframe.listbuttons[listbuttons_counter]
  else
   btn = constructors:CreateListButton(DGC_Mainframe)
   DGC_Mainframe.listbuttons[listbuttons_counter] = btn
   btn:SetSize(25,25)
  end

  local pos = listbuttons_counter - 1
  local l = pos % 8
  local r = math.floor(pos / 8) + 1
  btn:SetPoint("TOPLEFT", DGC_Mainframe, "TOPLEFT", 5 + l + (l * C.pluginbtnsize), C.pluginbtnsize * r + 1)  
  btn.list = v.Title
  btn.tooltiplines = {v.Title}
  if v ~= nil and v == DailyGlobalCheck.SelectedList then
   DGC_Mainframe:SelectListButton(btn.list)
  end
  btn:SetIcon(v.Icon and v.Icon or tx_qmark)
  btn.clickfunc = func or pluginbutton_func
  btn:Show()
  listbuttons_counter = listbuttons_counter + 1
 end

 table.sort(DailyGlobalCheck.Lists, function(a,b) return string.lower(a.Title) < string.lower(b.Title) end)
 table.sort(DGC_CustomLists.Lists, function(a,b) return string.lower(a.Title) < string.lower(b.Title) end)

 for k,v in pairs(DGC_Mainframe.listbuttons) do
  v:Hide()
 end
 
 if DailyGlobalCheck.mode == C.MODE_EDIT_QUEST then
  return
 end

 if DailyGlobalCheck.mode == C.MODE_EDIT then
  DailyGlobalCheck:foreachLists(function(k,v)
   if not lists:isPlugin(v.Title) then
    createlistbutton(v)
   end
  end) -- not sure it's a good thing to see even not active lists
  createlistbutton(new_list_button, tools.NewList)
  return
 end
 
 listbuttons_counter = 1
 DailyGlobalCheck:foreachLists(function(k,v)
  createlistbutton(v)
 end)
end

function constructors:MainFrame()

 if DGC_Mainframe then return end

 local ng = NyxGUI(C.NyxGUIVersion)
 
 -- mainframe --
 
 CreateFrame("Frame", "DGC_Mainframe", UIParent)
 local f = DGC_Mainframe
 f:SetPoint("CENTER")
 f:SetMovable(true)
 f:EnableMouse(true)
 f:RegisterForDrag("LeftButton")
 f:SetClampedToScreen(true)
 
 f.SetAnchor = setAnchor
 
 local ondragstart = function()
  DGC_Mainframe:StartMoving()
 end
 
 local ondragstop = function()
  DGC_Mainframe:StopMovingOrSizing()
  local a1, _, a2, x, y = DGC_Mainframe:GetPoint()
  DailyGlobalCheck_Options["frame_position"] = {a1, nil, a2, x, y}
 end
 
 f:SetScript("OnDragStart", ondragstart)
 f:SetScript("OnDragStop",  ondragstop)
 constructors:SetupFrame(f)

 -- buttons shown/hidden in different modes
 f.dynamic_buttons = {}
 
 -- upper part --
 
 -- news frame
 help:CreateNewsFrame()

 -- textures and fontstrings 
 -- Mainframe Icon
 f.dgcicon = f:CreateTexture(nil, "OVERLAY")
 f.dgcicon:SetPoint("TOPRIGHT", f, "TOPRIGHT", -20, 10)
 f.dgcicon:SetTexture(T.dgcicon)
 f.dgcicon:SetSize(50,50)
 -- Selected List Title
 f.listTitle = f:CreateFontString(nil, nil, "Game20Font")
 --f.listTitle:SetFont("Fonts\\FRIZQT__.ttf", 20, "")
 f.listTitle:SetPoint("TOPLEFT", f, "TOPLEFT", 10, -5)
 f.listTitle:SetPoint("BOTTOMRIGHT", f.dgcicon, "BOTTOMLEFT", -10, 0)

 -- Character Name
 f.title = f:CreateFontString(nil, nil, "SystemFont_Med3")
 --f.title:SetFont("Fonts\\FRIZQT__.ttf", 16, "")
 --f.title:SetPoint("TOP", f.pageTitle, "BOTTOM", 0, -5)
 f.title:SetPoint("TOP", f.listTitle, "BOTTOM", 0, -5)


 -- Pages
 f.page = f:CreateFontString(nil, nil, "NumberFont_Shadow_Small")
 --f.page:SetFont("Fonts\\ARIALN.ttf", 13, "")
 f.page:SetPoint("BOTTOM", f, "BOTTOM", 0, 40)
 
 DailyGlobalCheck:RefreshTitle()
 
 -- lower buttons --
 
 -- prev page, next page buttons
 f.Lbtn = constructors:CreateStaticBtn(f, arrowl, {"BOTTOMLEFT", f, "BOTTOMLEFT",10,10}, {L["prevpage"]})
 tinsert(f.dynamic_buttons, f.Lbtn)
 
 f.Rbtn = constructors:CreateStaticBtn(f, arrowr, {"BOTTOMRIGHT", f, "BOTTOMRIGHT",-10,10}, {L["nextpage"]})
 tinsert(f.dynamic_buttons, f.Rbtn)

 f.UpdateArrows = function(self)
  if pages:Curr() == 1 then
   self.Lbtn.tex:SetVertexColor(0.4,0.4,0.4,1)
  else
   self.Lbtn.tex:SetVertexColor(1,1,1,1)
  end
  
  if pages:Curr() == pages:Max() then
   self.Rbtn.tex:SetVertexColor(0.4,0.4,0.4,1)
  else
   self.Rbtn.tex:SetVertexColor(1,1,1,1)
  end
 end

 f.Lbtn:SetScript("OnMouseUp", function(self)
  if pages:Move(DailyGlobalCheck.SelectedList, -1) then
   f:SetAnchor("BOTTOMLEFT")
   DailyGlobalCheck:Refresh(DailyGlobalCheck.SelectedList)
  end
 end)

 f.Rbtn:SetScript("OnMouseUp", function(self)
  if pages:Move(DailyGlobalCheck.SelectedList, 1) then
   f:SetAnchor("BOTTOMRIGHT")
   DailyGlobalCheck:Refresh(DailyGlobalCheck.SelectedList)
  end
 end)

 f:UpdateArrows()
   
 -- about frame
 CreateAboutFrame()

 -- modes
 local modesframe = constructors:ModesFrame(f)
 f.btnmodes = constructors:CreatePanelBtn(f, tx_optionsbtn, modesframe, {"BOTTOMRIGHT",f,"BOTTOMRIGHT",-10,40},{GAMEOPTIONS_MENU})
 
 -- characters
 local charframe = chars:CreateCharactersFrame(f)
 f.btnchars = constructors:CreatePanelBtn(f, tx_charlist, charframe, {"BOTTOM",f,"BOTTOM",-centerbuttons_spacing,10},{BINDING_NAME_TOGGLECHARACTER0})
 tinsert(f.dynamic_buttons, f.btnchars)

 -- Plugin Buttons
 f.listbuttons = {}

 -- list selection buttons
 f.SelectListButton = function(self, title)
  for i = 1, #(self.listbuttons) do
   if title ~= nil and self.listbuttons[i].list == title then
    self.listbuttons[i]:Select()
   else
    self.listbuttons[i]:Deselect()
   end
  end
 end

 DailyGlobalCheck:RefreshListButtons()

 -- TomTom button
 if TomTom then
  f.TomTombutton = constructors:largebuttontemplate(f, "TomTom", L["tomtom_button"])
  f.TomTombutton:SetPoint("BOTTOMLEFT",f,"BOTTOMLEFT",5,40)
  f.TomTombutton:SetBackdropColor(1,0,0.3,1)
  f.TomTombutton:SetScript("OnMouseUp", function()
     if DGCMenuFrame then
      if DGCMenuFrame:IsVisible() then
       DGCMenuFrame:Hide()
      end
  	 DailyGlobalCheck:ShowTomTomMenu()
     end
    end)
  tinsert(f.dynamic_buttons, f.TomTombutton)
 end
 
 -- close button
  f.closebtn = ng:New(addonName, "Button", nil, f)
  f.closebtn:SetPoint("BOTTOM", f, "BOTTOM",0,10)
  f.closebtn:SetSize(100,25)
  f.closebtn:SetText(CLOSE)
  f.closebtn:SetScript("OnClick", function()
                                   local f = DGC_Mainframe
                                   f:Hide()
                                   if DGCMenuFrame then DGCMenuFrame:Hide() end
                                  end)
  f:SetSize(300,150)
  f:Hide()
  
  f:SetScript("OnHide", help.Hide)
end
