-- Daily Global Check
-- by Jadya
-- EU-Well of Eternity

local format = string.format

local addonName, addonTable = ...
local L = addonTable.L
local T = addonTable.T

local help = DailyGlobalCheck.HelpFunctions
help.buttons = {}
local help_frame
local current_helpplate
local news_cap = 0

addonTable.HelpPlates = {
            EditMode = {
            	        {ButtonPos = {x = 60,  y = 50  }, HighLightBox = {x = 0  , y = 60  , width = 300, height = 60 }, ToolTipDir = "DOWN" , ToolTipText = format(L["help_edt_1"], "|T"..T.newlist..":12|t")},
            	        {ButtonPos = {x = 250, y = -40 }, HighLightBox = {x = 100, y = -40 , width = 400, height = 40 }, ToolTipDir = "LEFT" , ToolTipText = format(L["help_edt_2"], "|T"..T.btn_rename_list..":12|t")},
            	        {ButtonPos = {x = 530, y = -40 }, HighLightBox = {x = 510, y = -40 , width = 85 , height = 40 }, ToolTipDir = "LEFT" , ToolTipText = L["help_edt_3"]},
            	        {ButtonPos = {x = 100, y = -250}, HighLightBox = {x = 0  , y = -90 , width = 280, height = 395}, ToolTipDir = "RIGHT", ToolTipText = format(L["help_edt_4"], "|TInterface\\Common\\VOICECHAT-MUTED:12|t", "|TInterface\\Minimap\\Vehicle-HammerGold-2:12|t")},
            	        {ButtonPos = {x = 400, y = -250}, HighLightBox = {x = 300, y = -90 , width = 300, height = 395}, ToolTipDir = "LEFT" , ToolTipText = format(L["help_edt_5"], "|TInterface\\Buttons\\Arrow-Up-Up:12|t|TInterface\\Buttons\\Arrow-Down-Up:12|t", "|TInterface\\Common\\VOICECHAT-MUTED:12|t", "|TInterface\\Minimap\\Vehicle-HammerGold-2:12|t")},
            	        {ButtonPos = {x = 480, y = -490}, HighLightBox = {x = 460, y = -485, width = 85 , height = 60 }, ToolTipDir = "UP"   , ToolTipText = L["help_edt_6"]},

            	        FramePos       = { x = 0  , y = -45, w = 600, h = 440 },
						SecondFramePos = { x = 0  , y = 60, w = 300, h = 60},
						ThirdFramePos  = { x = 460, y = -485, w = 85, h = 60},
                       },
           EditQuest = {
            	        {ButtonPos = {x = 320, y = -90 }, HighLightBox = {x = 10 , y = -90 , width = 680, height = 45 }, ToolTipDir = "UP", ToolTipText = L["help_edt_7"]},
            	        {ButtonPos = {x = 320, y = -250}, HighLightBox = {x = 10 , y = -150, width = 680, height = 290}, ToolTipDir = "UP", ToolTipText = L["help_edt_8"]},
            	        {ButtonPos = {x = 320, y = -440}, HighLightBox = {x = 270, y = -445, width = 160, height = 35 }, ToolTipDir = "UP", ToolTipText = L["help_edt_9"]},

            	        FramePos = { x = 0, y = -60, w = 700, h = 420 },
                       },
}

-- this is a rough readaptation of the blizzard's tutorial frame, made to avoid taint issues
local function CreateHelpFrame()
 -- helpframe
 help.DGCHelpPlate = CreateFrame("Frame")
 help_frame = help.DGCHelpPlate
 help_frame:SetFrameStrata("HIGH")
 help_frame:SetFrameLevel(10)
 help_frame:EnableMouse(true)
 
 help_frame.secondframe = CreateFrame("Frame", nil, help_frame)
 help_frame.secondframe:SetFrameLevel(10)
 help_frame.secondframe:EnableMouse(true)
 
 help_frame.thirdframe = CreateFrame("Frame", nil, help_frame)
 help_frame.thirdframe:SetFrameLevel(10)
 help_frame.thirdframe:EnableMouse(true)
 
 --[[
 help_frame.tex = help_frame:CreateTexture()
 help_frame.tex:SetTexture(1,0,0,0.4)
 help_frame.tex:SetAllPoints()
 
 help_frame.secondframe.tex = help_frame.secondframe:CreateTexture()
 help_frame.secondframe.tex:SetTexture(0,0,1,0.4)
 help_frame.secondframe.tex:SetAllPoints()
 
 help_frame.thirdframe.tex = help_frame.thirdframe:CreateTexture()
 help_frame.thirdframe.tex:SetTexture(0,1,0,0.4)
 help_frame.thirdframe.tex:SetAllPoints()
 ]]
end

local function hideplatetooltip()
 DGC_HelpPlateTooltip.ArrowUP:Hide()
 DGC_HelpPlateTooltip.ArrowGlowUP:Hide()
 DGC_HelpPlateTooltip.ArrowDOWN:Hide()
 DGC_HelpPlateTooltip.ArrowGlowDOWN:Hide()
 DGC_HelpPlateTooltip.ArrowLEFT:Hide()
 DGC_HelpPlateTooltip.ArrowGlowLEFT:Hide()
 DGC_HelpPlateTooltip.ArrowRIGHT:Hide()
 DGC_HelpPlateTooltip.ArrowGlowRIGHT:Hide()
 DGC_HelpPlateTooltip:ClearAllPoints()
 DGC_HelpPlateTooltip:Hide()
end

local function btn_onenter(self)
 hideplatetooltip()
 
 if ( self.tooltipDir == "UP" ) then
  DGC_HelpPlateTooltip.ArrowUP:Show()
  DGC_HelpPlateTooltip.ArrowGlowUP:Show()
  DGC_HelpPlateTooltip:SetPoint("BOTTOM", self, "TOP", 0, 10)
 elseif ( self.tooltipDir == "DOWN" ) then
  DGC_HelpPlateTooltip.ArrowDOWN:Show()
  DGC_HelpPlateTooltip.ArrowGlowDOWN:Show()
  DGC_HelpPlateTooltip:SetPoint("TOP", self, "BOTTOM", 0, -10)
 elseif ( self.tooltipDir == "LEFT" ) then
  DGC_HelpPlateTooltip.ArrowLEFT:Show()
  DGC_HelpPlateTooltip.ArrowGlowLEFT:Show()
  DGC_HelpPlateTooltip:SetPoint("RIGHT", self, "LEFT", -10, 0)
 elseif ( self.tooltipDir == "RIGHT" ) then
  DGC_HelpPlateTooltip.ArrowRIGHT:Show()
  DGC_HelpPlateTooltip.ArrowGlowRIGHT:Show()
  DGC_HelpPlateTooltip:SetPoint("LEFT", self, "RIGHT", 10, 0)
 end
 
 DGC_HelpPlateTooltip.Text:SetText(self.toolTipText)
 DGC_HelpPlateTooltip:Show()
 self.box:Hide()
 self.boxHighlight:Show()
 self.Pulse:Stop()
 self.HelpIGlow:Hide();
 self.BgGlow:Hide();
end

local function btn_onleave(self)
 hideplatetooltip()
 
 self.box:Show()
 self.boxHighlight:Hide()
 self.viewed = true
end

local function getButton()
 local f
 
 for i = 1, #help.buttons do
  local button = help.buttons[i]
   if not button:IsShown() then
	frame = button
	break
   end
 end
 
 if not f then
  f = CreateFrame("Button", nil, help_frame, "HelpPlateButton")
  f:SetFrameStrata("HIGH")
  f:SetFrameLevel(11)
  f:SetScript("OnEnter", btn_onenter)
  f:SetScript("OnLeave", btn_onleave)
  f.box = CreateFrame("Frame", nil, help_frame, "HelpPlateBox")
  f.boxHighlight = CreateFrame("Frame", nil, help_frame, "HelpPlateBoxHighlight")
  f.box:SetScript("OnEnter", nil)
  f.box:SetScript("OnLeave", nil)
  help.buttons[#help.buttons + 1] = f
 end
 
 f.tooltipDir = "RIGHT"
 f:SetSize(HELP_BUTTON_NORMAL_SIZE, HELP_BUTTON_NORMAL_SIZE)
 return f
end

function help:Show(plate, p, helpButton)
 if not help_frame then CreateHelpFrame() end
 
 if current_helpplate then help:Hide() end

 current_helpplate = plate
 current_helpplate.mainHelpButton = helpButton
 for i = 1, #current_helpplate do
  if ( not current_helpplate[i].MinLevel or (UnitLevel("player") >= current_helpplate[i].MinLevel) ) then
   local button = getButton()
   button:ClearAllPoints()
   button:SetPoint("TOPLEFT", p, "TOPLEFT", current_helpplate[i].ButtonPos.x, current_helpplate[i].ButtonPos.y )
   button.tooltipDir = current_helpplate[i].ToolTipDir
   button.toolTipText = current_helpplate[i].ToolTipText
   button.viewed = false
   button:Show()
   if helpButton.initialTutorial then
    button.HelpIGlow:Show()
    button.BgGlow:Show()
    button.Pulse:Play()
   else
    button.HelpIGlow:Hide()
    button.BgGlow:Hide()
    button.Pulse:Stop()
   end
   
   button.box:ClearAllPoints()
   button.box:SetSize( current_helpplate[i].HighLightBox.width, current_helpplate[i].HighLightBox.height )
   button.box:SetPoint( "TOPLEFT", p, "TOPLEFT", current_helpplate[i].HighLightBox.x, current_helpplate[i].HighLightBox.y )
   button.box:Show()
   
   button.boxHighlight:ClearAllPoints()
   button.boxHighlight:SetSize( current_helpplate[i].HighLightBox.width, current_helpplate[i].HighLightBox.height )
   button.boxHighlight:SetPoint( "TOPLEFT", p, "TOPLEFT", current_helpplate[i].HighLightBox.x, current_helpplate[i].HighLightBox.y )
   button.boxHighlight:Hide()
  end
 end
 
 help_frame:SetScale(p:GetEffectiveScale())
 help_frame:SetPoint("TOPLEFT", p, "TOPLEFT", plate.FramePos.x, plate.FramePos.y )
 if plate.FramePos.w and plate.FramePos.h then
  help_frame:SetSize( plate.FramePos.w, plate.FramePos.h )
 else
  help_frame:SetPoint("BOTTOMRIGHT", p, "BOTTOMRIGHT")
 end

 if plate.SecondFramePos then
  help_frame.secondframe:SetPoint("TOPLEFT", p, "TOPLEFT", plate.SecondFramePos.x, plate.SecondFramePos.y)
  help_frame.secondframe:SetSize(plate.SecondFramePos.w, plate.SecondFramePos.h)
  help_frame.secondframe:Show()
 else
  help_frame.secondframe:Hide()
 end
 
 if plate.ThirdFramePos then
  help_frame.thirdframe:SetPoint("TOPLEFT", p, "TOPLEFT", plate.ThirdFramePos.x, plate.ThirdFramePos.y)
  help_frame.thirdframe:SetSize(plate.ThirdFramePos.w, plate.ThirdFramePos.h)
  help_frame.thirdframe:Show()
 else
  help_frame.thirdframe:Hide()
 end
 
 help_frame:Show()
end

function help:Hide()
 if not help_frame then return end

 for i = 1, #help.buttons do
  local button = help.buttons[i]
  button.tooltipDir = "RIGHT"
  button.box:Hide()
  button:Hide()
 end
 current_helpplate = nil
 help_frame:Hide()
 return
end

function help:isShowing(helpplate)
 return current_helpplate == helpplate
end
--

local function hasNonReadNews()
 return (DailyGlobalCheck_Options["news_read"] or 0) < news_cap
end

local news_frame
local function news_next()
 local f = news_frame
 local increment = DGC_HelpPlateTooltip:IsVisible()

 if increment then
  if L["news_#"..(f.index + 1)] then
   f.index = f.index + 1
  else
   f.index = 1
  end
 end

 local svar = DailyGlobalCheck_Options["news_read"] or 0
 if f.index > svar then
  DailyGlobalCheck_Options["news_read"] = f.index
 end
 f.exclamation_point:Hide()
 hideplatetooltip()
 DGC_HelpPlateTooltip.ArrowUP:Show()
 DGC_HelpPlateTooltip.ArrowGlowUP:Show()
 DGC_HelpPlateTooltip:SetPoint("BOTTOM", f, "TOP", 0, 10)
 local news = L["news_#"..f.index]

 local s = "|cffffcc00"..GUILD_TAB_NEWS.."\n|cff11DDFF"..f.index.." / " ..news_cap..
           "|r\n"..news.."\n"..L["news_bottomtext1"].."\n"..L["news_bottomtext2"]
 DGC_HelpPlateTooltip.Text:SetText(s)
 DGC_HelpPlateTooltip:Show()
end

local function news_hide()
 hideplatetooltip()
 DGC_Mainframe.news_frame:SetAnimation(97)
 local visible = news_frame:IsVisible()
 if not visible or not hasNonReadNews() then
  news_frame.exclamation_point:Hide()
 elseif visible then
  news_frame.exclamation_point:Show()
 end
end

-- model, size, event, effect model, effect type, sound, ttl, model position, delayed sound, delayed sound delay
local helpers = {
 {65336,75,"Calendar_WinterVeil","spells\\snowflakecreature_var1_missile.m2",0},     -- winter veil snowman
 {30711,85,"Calendar_LoveInTheAir","spells\\valentinefirework.m2",1,"sound\\spells\\valentinefirework.ogg",100,{-40,15,65}},-- love is in the air
 {40665,95,"Calendar_LunarFestival","spells\\fireworks_spirals.m2",1,"sound\\doodad\\fx_firework_whistle_05.ogg",100,{-20, 0, 10},"sound\\doodad\\g_fireworkboomgeneral6.ogg",1.7}, -- lunar festival
 {38521,85,"Calendar_HallowsEnd"},     -- hallow's end crone
 {96207,85}, -- grommash (WoD)
 {28127,85}, -- wrynn (Legion)
}

local function getHelper()
 OpenCalendar()
 local _, month, today, year = CalendarGetDate()
 CalendarSetAbsMonth(month, year)
 for i = 1, CalendarGetNumDayEvents(0, today) do
  local _, _, texture = CalendarGetHolidayInfo(0, today, i)
  for k,v in pairs(helpers) do
   if texture == v[3] then
	return v
   end
  end
 end
 
 -- the last one is the default one
 return helpers[#helpers]
end

local effects

local function createEffects(helper)
 if not effects then effects = {} end

 if not helper[5] or helper[5] == 0 then -- particles mode
  for k = 1,20 do
   C_Timer.After(k * 0.03, function()
    if not effects[k] then
     effects[k] = CreateFrame("PlayerModel", nil, DGC_Mainframe.news_frame)
    end
	local e = effects[k]
	e:SetModel(helper[4])
    e:SetSize(math.random(15) + 10, math.random(15) + 10)
    e.fx = math.random(15) - 7.5
    e:SetPoint("CENTER", DGC_Mainframe.news_frame, "CENTER")   
    e.fy = math.random(7.5)
    e.x = 0
    e.y = 0
    e.ttl = helper[7] or 50
    if e.ticker then e.ticker:Cancel() end
    e:Show()
   
    e.ticker = C_Timer.NewTicker(0.03, function(self)
      e.ttl = e.ttl - 1
      if e.ttl <= 0 then
       e:Hide()
       self:Cancel()
      end
      e.fy = e.fy - 0.2
      e.fx = e.fx / 1.01
      e.x = e.x + e.fx
      e.y = e.y + e.fy
      e:SetPoint("CENTER", DGC_Mainframe.news_frame, "CENTER", e.x, e.y)
     end)
   end)
  end
 elseif helper[5] == 1 then -- static effect mode
  if not effects[1] then
   effects[1] = CreateFrame("PlayerModel", nil, DGC_Mainframe.news_frame)
  end
  local e = effects[1]
  e:SetModel(helper[4])
  e:SetSize(300,300)
  e:SetPoint("BOTTOM", DGC_Mainframe.news_frame, "CENTER")
  e.ttl = helper[7] or 100
  if e.ticker then e.ticker:Cancel() end
  e:Show()

  if helper[8] then
   e:SetPosition(unpack(helper[8]))
  end
  e:SetFacing(2)

  e.ticker = C_Timer.NewTicker(0.03, function(self)
    e.ttl = e.ttl - 1
    if e.ttl <= 0 then
     e:Hide()
     self:Cancel()
    end
   end)
 end
end

function help:CreateNewsFrame()
 local f = DGC_Mainframe
 f.news_frame = CreateFrame("DressUpModel", nil, f)
 f.news_frame:SetPoint("BOTTOMRIGHT", f, "TOPRIGHT", 0, -10)
 local helper = getHelper()
 f.news_frame:SetSize(helper[2], helper[2])
 f.news_frame:SetDisplayInfo(helper[1])
 f.news_frame:SetAnimation(97)
 f.news_frame:SetFrameStrata("MEDIUM")
 f.news_frame:SetScript("OnMouseUp", function(self, button)
  if button == "LeftButton" then
   --self:SetAnimation(69) -- dance
   --self:SetAnimation(60) -- chat
   --self:SetAnimation(113) -- salute
   self:SetAnimation(67) -- wave
   news_next()
  else
   f.news_frame:SetAnimation(97)
   news_hide()
   
   -- special effects
   if helper[4] then
	createEffects(helper)
   end
   -- sounds
   if helper[6] then
    PlaySoundFile(helper[6])
   end
   
   if helper[9] and helper[10] then
    C_Timer.After(helper[10], function() PlaySoundFile(helper[9]) end)
   end
  end
 end)
 f.news_frame:SetScript("OnHide", news_hide)
 
 f.news_frame:SetScript("OnShow", function(self)
  if hasNonReadNews() then
   self.exclamation_point:Show()
  end
 end)

 news_frame = f.news_frame
 
 f.news_frame.exclamation_point = f:CreateTexture()
 f.news_frame.exclamation_point:SetSize(50,50)
 f.news_frame.exclamation_point:SetPoint("BOTTOM", f.news_frame, "TOP", 25, -45)
 --f.news_frame.exclamation_point:SetTexture("Interface\\Minimap\\ObjectIcons")
 --f.news_frame.exclamation_point:SetTexCoord(0.125, 0.256, 0.125, 0.256)
 f.news_frame.exclamation_point:SetTexture("spells\\SILENCE")
 f.news_frame.exclamation_point:Hide()
 local ag = f.news_frame.exclamation_point:CreateAnimationGroup()    
 local a = ag:CreateAnimation("Scale")
 a:SetScale(0.75,0.75)
 a:SetDuration(1)
 ag:SetLooping("BOUNCE")
 ag:Play()
 
 local i = 1
 local t = L["news_#"..1]
 while t do
  i = i + 1
  t = L["news_#"..i]
 end
 news_cap = i - 1
 
 f.news_frame.index = math.min(DailyGlobalCheck_Options["news_read"] or 1, news_cap)

 f.news_frame:Show()
end
--
