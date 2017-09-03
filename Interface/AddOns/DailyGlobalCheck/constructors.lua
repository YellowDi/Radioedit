-- Daily Global Check
-- by Jadya
-- EU-Well of Eternity

local addonName, addonTable = ...

local C = addonTable.C

DailyGlobalCheck = {}
DailyGlobalCheck.CharFunctions    = {}
DailyGlobalCheck.PagesFunctions   = {}
DailyGlobalCheck.OptFunctions     = {}
DailyGlobalCheck.Constructors     = {}
DailyGlobalCheck.ListFunctions    = {}
DailyGlobalCheck.MenuFunctions    = {}
DailyGlobalCheck.MapFunctions     = {}
DailyGlobalCheck.HelpFunctions    = {}
DailyGlobalCheck.QuestFunctions   = {}
DailyGlobalCheck.ModeFunctions    = {}
DailyGlobalCheck.Tools            = {}

-- string colors
local colors = {
 LIGHT_RED    = "|cffFF2020",
 LIGHT_GREEN  = "|cff20FF20",
 LIGHT_BLUE   = "|cff11DDFF",
 LIGHT_YELLOW = "|cffFFFFAA",
 ZONE_BLUE    = "|cff00aacc",
 GRAY         = "|cffAAAAAA",
 NAME_COLOR   = "|cffffffcc",
 COORD_COLOR  = "|cffDDDDDD",
 GOLD         = "|cffffcc00",
 WHITE        = "|cffffffff",
 LIST_COLOR   = "|cff00DD11",
 -- classes
 DEATHKNIGHT  = "|cffC41F3B",
 DRUID        = "|cffFF7D0A",
 HUNTER       = "|cffABD473",
 MAGE         = "|cff69CCF0",
 MONK         = "|cff00FF96",
 PALADIN      = "|cffF58CBA",
 PRIEST       = "|cffFFFFFF",
 ROGUE        = "|cffFFF569",
 SHAMAN       = "|cff0070DE",
 WARLOCK      = "|cff9482C9",
 WARRIOR      = "|cffC79C6E",
 DEMONHUNTER  = "|cffA330C9",
}

function addonTable.AddColor(str, color)
 local c = colors[color] or color
 if not str then return "|cffFF0000<Error>|r" end
 if not c then return str end
 return c..str.."|r"
end

function addonTable.cutString(s)
 return tostring(s):gsub("|c%x%x%x%x%x%x%x%x", ""):gsub("|T(.+)|t", " "):gsub("|r", "")
end

local btnheight = 25
local chars = DailyGlobalCheck.CharFunctions
local options = DailyGlobalCheck.OptFunctions
local constructors = DailyGlobalCheck.Constructors

local frames_backdrop  = { bgFile = "Interface\\Buttons\\GreyscaleRamp64", 
                           edgeFile = "Interface\\Buttons\\WHITE8X8", 
						   edgeSize = 1
						 }

local buttons_backdrop = {bgFile = "Interface/Tooltips/UI-Tooltip-Background", 
                         edgeFile = "Interface/Tooltips/UI-Tooltip-Border", 
                         tile = true,
						 tileSize = 16,
						 edgeSize = 16,
                         insets = { left = 4, right = 4, top = 4, bottom = 4 }}

local function SetTooltip(f, l)
 f:SetScript("OnLeave", function(self)
    GameTooltip:Hide()
   end)
 f:SetScript("OnEnter", function(self)
    GameTooltip:SetOwner(f,"ANCHOR_TOP",0,5)
    GameTooltip:ClearLines()
	table.foreach(l, function(_,v)
     GameTooltip:AddLine(v)
	end)
    GameTooltip:Show()
   end)
end

local function createTexture(f, t, tvar)
 tvar = tvar or "tex"
 f[tvar] = f:CreateTexture()
 local tex = f[tvar]
 tex:SetAllPoints()
 if type(t) == "table" then
  tex:SetTexture(unpack(t))
 else
  tex:SetTexture(t)
 end
end

function constructors:SetupTexture(f, ...)
 f.tex = f:CreateTexture()
 f.tex:SetAllPoints()
 f.tex:SetTexture(...)
end

function constructors:CreateListButton(p, name)
 local f = CreateFrame("Frame",name,p)
 f:SetHeight(btnheight)

 f.btn = CreateFrame("Button",nil,f)
 f.btn:SetPoint("TOPLEFT", f, "TOPLEFT", 1, -1)
 f.btn:SetPoint("BOTTOMRIGHT", f, "BOTTOMRIGHT", -1, 1)
 f.btn.text = f.btn:CreateFontString(nil, "OVERLAY", "GameTooltipText")
 f.btn.text:SetPoint("CENTER")

 createTexture(f.btn, {0.2,0.2,0.2,0.5})
 
 f.SetIcon = function(self,s)
              f.btn.tex:SetTexture(s)
             end
 f.SetText = function(self,s)
              f.btn.text:SetText(s)
             end
 f.Select =  function(self)
			  self.btn.tex:SetVertexColor(0, 0.7, 0)
             end
 f.Deselect = function(self)
			   self.btn.tex:SetVertexColor(1, 1, 1)
              end
 f.btn:SetPoint("CENTER", f, "CENTER")
 f.btn:SetSize(13,btnheight-2)
  f.btn:SetScript("OnClick", function()
    if f.clickfunc then f:clickfunc() end
 end)
 f.btn:SetScript("OnEnter", function()
   if f.tooltiplines then
	GameTooltip:SetOwner(f, "ANCHOR_NONE")
	GameTooltip:SetPoint("BOTTOM", f, "TOP", 0, 5)
    GameTooltip:ClearLines()
	GameTooltip:AddLine("")
    table.foreach(f.tooltiplines, function(k,v)
	 GameTooltip:AddLine(v)
	end)
	GameTooltip:Show()
   end
  end)
 f.btn:SetScript("OnLeave", function()
    GameTooltip:Hide()
 end)

 f.btn:SetHighlightTexture("Interface\\buttons\\UI-Listbox-Highlight2", "ADD")
 return f
end

-- a simple textured frame
function constructors:CreateStaticBtn(parent, tex, pos, tooltiptext)
 local f = CreateFrame("Frame", nil, parent)
 f:SetSize(25,25)
 f:SetPoint(unpack(pos))
 createTexture(f, tex)
 SetTooltip(f, tooltiptext)
 return f
end

-- a static button which can be used to show a panel
function constructors:CreatePanelBtn(parent, tex, panel, pos, tooltiptext)
 local f = constructors:CreateStaticBtn(parent, tex, pos, tooltiptext)
 f.tex:SetVertexColor(1,1,1,1)
 f.open = false
 f.panel = panel
 
 f.func = function(self)
  self.open = not self.open
  if self.open then
   self.tex:SetVertexColor(0,1,0,1)
   self.panel:Show()
  else
   self.tex:SetVertexColor(1,1,1,1)
   self.panel:Hide()
  end
 end
 
 f:SetScript("OnMouseUp", f.func)
 return f
end

function constructors:largebuttontemplate(p, text, tooltiptext)
  result = CreateFrame("FRAME", nil, p)
  result:SetWidth(60)
  result:SetHeight(25)
  result.text = result:CreateFontString(nil, "OVERLAY", "GameTooltipText")
  result.text:SetJustifyH("CENTER")
  result.text:SetAllPoints()
  result.text:SetText(text)
  result:SetBackdrop(buttons_backdrop)
  SetTooltip(result, {tooltiptext})
  return result
end

function constructors:SetupFrame(f, backdrop_only)
 f:SetBackdrop(frames_backdrop)
 f:SetBackdropColor(0.07,0.07,0.07,0.9)
 f:SetBackdropBorderColor(0.1,0.1,0.1,0.9)
 
 if backdrop_only then return end
 
 f:SetFrameStrata("HIGH")
end

-- characters frame
function constructors:charsListButton(p, h, deletefunc)
 local f = CreateFrame("Frame", nil, p)
 
 f.portrait = f:CreateTexture()
 f.portrait:SetSize(h - 8, h - 8)
 f.portrait:SetPoint("TOPLEFT", f, "TOPLEFT", 4, -4)
 
 f.arrow = f:CreateTexture()
 f.arrow:SetSize(h, h)
 f.arrow:SetPoint("TOPRIGHT", f, "TOPRIGHT")
 f.arrow:SetTexture("Interface\\MINIMAP\\MiniMap-QuestArrow")
 f.arrow:SetRotation(4.71)
 f.name = f:CreateFontString(nil, "OVERLAY", "GameTooltipText")
 f.name:SetPoint("TOPLEFT", f, "TOPLEFT", h, -2)
 f.info = f:CreateFontString(nil, "OVERLAY", "GameTooltipTextSmall")
 f.info:SetPoint("BOTTOMLEFT", f, "BOTTOMLEFT", h, 2)
 f.btn_delete = CreateFrame("Button", nil, f)
 f.btn_delete:SetSize(h - 8, h -8)
 f.btn_delete:SetPoint("TOPRIGHT", f, "TOPRIGHT", -4, -4)
 f.btn_delete:SetHighlightTexture("Interface\\Buttons\\UI-Panel-Button-Highlight")
 f.btn_delete:SetScript("OnClick", deletefunc)
 f.faction = f:CreateTexture()
 f.faction:SetSize(h - 8, h - 8)
 f.faction:SetPoint("TOPLEFT", f, "TOPRIGHT", -h * 2, 0)
 f.faction:SetPoint("BOTTOMRIGHT", f, "BOTTOMRIGHT", -h, 0)
 f.faction:SetTexture("Interface\\Glues\\CHARACTERCREATE\\UI-CharacterCreate-Factions")
 f.faction:SetVertexColor(1,1,1,0.2)

 f.highlight = f:CreateTexture()
 f.highlight:SetAllPoints()
 f.highlight:SetColorTexture(0.7,0.5,1,0.1)

 f:SetBackdrop(frames_backdrop)
 f:SetBackdropColor(0.1,0.1,0.1,1)
 f:SetBackdropBorderColor(0.2,0.2,0.2,1)
 f:SetFrameStrata("MEDIUM")
 f:SetSize(300, h)

 table.insert(p.buttons, f)
 return f
end

function constructors:QuestButton(i, p)
 local f = CreateFrame("Frame", "DGCQuestButton"..i, p, "DGCQuestButton")
 f:SetPoint("TOPLEFT", p, "TOPLEFT", 0, -(i - 1) * C.quest_button_h)
 f:SetPoint("TOPRIGHT", p, "TOPRIGHT", 0, -(i - 1) * C.quest_button_h)
 if i % 2 == 0 then
  f.tex = f:CreateTexture()
  f.tex:SetAllPoints()
  f.tex:SetColorTexture(0.1,0.8,0.2,0.05)
 end
 return f
end
