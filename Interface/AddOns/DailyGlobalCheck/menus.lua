-- Daily Global Check
-- by Jadya
-- EU-Well of Eternity

local addonName, addonTable = ...
local L = addonTable.L

local menus = DailyGlobalCheck.MenuFunctions
local editframe = DailyGlobalCheck.EditPanel

-- editframe zones dropdown
function menus.Init_ZonesDropdown(self, level, menuList)

 local IDs -- zone IDs for the submenus
 local info = UIDropDownMenu_CreateInfo()
 info.notCheckable = true

  local function btn_click(self)
   editframe:quest_edit_SelectZone(self.value)
  end

  local function create_menu_element(i)
   local z = GetMapNameByID(i)
   if z then
    info.text = z
	info.value = i
	info.func = btn_click
    UIDropDownMenu_AddButton(info, level)
   end
  end

 if (level or 1) == 1 then
 -- Draenor
  info.text = GetMapNameByID(962)
  info.hasArrow = true
  info.menuList = "draenor"
  UIDropDownMenu_AddButton(info)
  
 -- Pandaria
  info.text = GetMapNameByID(862)
  info.hasArrow = true
  info.menuList = "pandaria"
  UIDropDownMenu_AddButton(info)
  
 -- Northrend
  info.text = GetMapNameByID(485)
  info.hasArrow = true
  info.menuList = "northrend"
  UIDropDownMenu_AddButton(info)
 
 -- Outlands
  info.text = GetMapNameByID(466)
  info.hasArrow = true
  info.menuList = "outlands"
  UIDropDownMenu_AddButton(info)
  
 -- Kalimdor
  info.text = GetMapNameByID(13)
  info.hasArrow = true
  info.menuList = "kalimdor"
  UIDropDownMenu_AddButton(info)
  
 -- Eastern Kingdoms
  info.text = GetMapNameByID(14)
  info.hasArrow = true
  info.menuList = "eastern"
  UIDropDownMenu_AddButton(info)
  
 -- Empty space
  info.text = ""
  info.hasArrow = false
  info.disabled = true
  UIDropDownMenu_AddButton(info)

 -- No zone
  info.text = NONE 
  info.disabled = false
  info.value = -1
  info.func = btn_click
  UIDropDownMenu_AddButton(info)

  return
 elseif menuList == "draenor" then
  IDs = {978,941,976,949,971,950,947,948,1009,946,945,1011}
 elseif menuList == "pandaria" then
  IDs = {858,929,928,857,809,905,903,806,873,808,951,810,811,807}
 elseif menuList == "northrend" then
  IDs = {486,510,504,488,490,491,541,492,493,495,501,496}
 elseif menuList == "outlands" then
  IDs = {475,465,477,479,473,481,478,467}
 elseif menuList == "kalimdor" then
  IDs = {772,894,43,181,464,476,890,42,381,101,4,141,891,182,121,795,241,606,9,11,321,888,261,607,81,161,41,471,61,362,720,201,889,281}
 elseif menuList == "eastern" then
  IDs = {614,16,17,19,29,866,32,892,27,34,23,30,462,463,545,611,24,341,499,610,35,895,37,864,36,684,685,28,615,480,21,301,689,893,38,673,26,502,20,708,709,700,382,613,22,39,40}
 else
  return
 end

 for _,v in pairs(IDs) do
  create_menu_element(v)
 end
end

-- editframe zones dropdown
function menus.Init_QuestsFilterDropdown(self, level, menuList)

 local info = UIDropDownMenu_CreateInfo()
 info.notCheckable = false

  local function btn_click(self)
   DGC_EFQuestsScrollFrame.filters[self.value] = self.checked
   DGC_EFQuestsScrollFrame:update()
  end
 
 if (level or 1) == 1 then
 -- Plugins
  info.hasArrow = true
  info.text     = SOURCE
  info.menuList = "plugins"
  UIDropDownMenu_AddButton(info)
  
  info.hasArrow = false
 elseif menuList == "plugins" then
  for _,v in pairs(DailyGlobalCheck.Lists) do
   info.text  = v["Title"]
   info.value = v["Title"]
   info.isNotRadio = true
   info.keepShownOnClick = true
   info.func = btn_click
   info.checked = DGC_EFQuestsScrollFrame.filters[v["Title"]]
   UIDropDownMenu_AddButton(info, level)
  end
 end
end
