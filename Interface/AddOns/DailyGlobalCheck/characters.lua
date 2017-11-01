-- Daily Global Check
-- by Jadya
-- EU-Well of Eternity

-- [[ DGC v1.2 Multi Character Selection ]]--

local abs, max, tsort, tinsert, format = math.abs, math.max, table.sort, table.insert, string.format

local addonName, addonTable = ...
local tx_cross   = "Interface\\RaidFrame\\ReadyCheck-NotReady"
local tx_restore = "Interface\\Buttons\\UI-RefreshButton"
local portrait_none = "Interface\\Garrison\\Portraits\\FollowerPortrait_NoPortrait"
local class_icons = "Interface\\Glues\\CHARACTERCREATE\\UI-CHARACTERCREATE-CLASSES"
local tx_blacklist = "Interface\\TARGETINGFRAME\\TargetDead"
local char_factions_small_alliance =  "|TInterface\\Icons\\Inv_Misc_Tournaments_banner_Human:11|t"
local char_factions_small_horde =  "|TInterface\\Icons\\Inv_Misc_Tournaments_banner_Orc:11|t"
local tx_factions = "Interface\\Glues\\CHARACTERCREATE\\Race-Change-BannerCover"

local _, race = UnitRace("player")
local sex = UnitSex("player") - 2
local _, class = UnitClass("player")
addonTable.playerclass = class
local faction = DailyGlobalCheck.player_faction

local tx_portraits =
 {
	 ["Human0"]    = "Interface\\Garrison\\Portraits\\FollowerPortrait_60858",
	 ["Human1"]    = "Interface\\Garrison\\Portraits\\FollowerPortrait_58776",
	 ["Dwarf0"]    = "Interface\\Garrison\\Portraits\\FollowerPortrait_61373",
	 ["Dwarf1"]    = "Interface\\Garrison\\Portraits\\EnemyPortrait_3056",
	 ["NightElf0"] = "Interface\\Garrison\\Portraits\\FollowerPortrait_58366",
	 ["NightElf1"] = "Interface\\Garrison\\Portraits\\FollowerPortrait_57345",
	 ["Draenei0"]  = "Interface\\Garrison\\Portraits\\FollowerPortrait_57329",
	 ["Draenei1"]  = "Interface\\Garrison\\Portraits\\FollowerPortrait_54040",
	 ["BloodElf0"] = "Interface\\Garrison\\Portraits\\FollowerPortrait_57431",
	 ["BloodElf1"] = "Interface\\Garrison\\Portraits\\FollowerPortrait_58775",
	 ["Worgen0"]   = "Interface\\Garrison\\Portraits\\FollowerPortrait_60405",
	 ["Worgen1"]   = "Interface\\Garrison\\Portraits\\FollowerPortrait_58453",
	 ["Tauren0"]   = "Interface\\Garrison\\Portraits\\FollowerPortrait_60556",
	 ["Tauren1"]   = "Interface\\Garrison\\Portraits\\FollowerPortrait_60461",
	 ["Pandaren0"] = "Interface\\Garrison\\Portraits\\FollowerPortrait_42481",
	 ["Pandaren1"] = "Interface\\Garrison\\Portraits\\FollowerPortrait_60464",
	 ["Orc0"]      = "Interface\\Garrison\\Portraits\\FollowerPortrait_60400",
	 ["Orc1"]      = "Interface\\Garrison\\Portraits\\FollowerPortrait_60412",
	 ["Gnome0"]    = "Interface\\Garrison\\Portraits\\EnemyPortrait_3607",
	 ["Gnome1"]    = "Interface\\Garrison\\Portraits\\FollowerPortrait_61392",
	 ["Troll0"]    = "Interface\\Garrison\\Portraits\\FollowerPortrait_61497",
	 ["Troll1"]    = "Interface\\Garrison\\Portraits\\FollowerPortrait_60044",
	 ["Goblin0"]   = "Interface\\Garrison\\Portraits\\FollowerPortrait_60532",
	 ["Goblin1"]   = "Interface\\Garrison\\Portraits\\FollowerPortrait_57102",
	 ["Scourge0"]  = "Interface\\Garrison\\Portraits\\FollowerPortrait_60478",
	 ["Scourge1"]  = "Interface\\Garrison\\Portraits\\FollowerPortrait_58687",
 }

local L = addonTable.L
local C = addonTable.C
local AddColor = addonTable.AddColor
local Region = GetCurrentRegion() --GetCVar("portal")

local pID = addonTable.pID
local delimiter = "~"

local seconds_per_hour = 60 * 60
local seconds_per_day = seconds_per_hour * 24

local constructors = DailyGlobalCheck.Constructors
local chars = DailyGlobalCheck.CharFunctions
local quest = DailyGlobalCheck.QuestFunctions
local lists = DailyGlobalCheck.ListFunctions
local modes = DailyGlobalCheck.ModeFunctions

chars.chardata = {}

function DailyGlobalCheck.GetModCharName(pID, addRealm)
 local c = DailyGlobalCheck_CharData[pID]

 if not c then return addRealm and pID or select(1, strsplit("-", pID)) end

 local _, _, class, faction = strsplit(delimiter, c.info or "")
 local icon = faction == "Alliance" and char_factions_small_alliance or char_factions_small_horde
 return addRealm and (icon.." "..AddColor(pID, class)) or icon.." "..AddColor(select(1, strsplit("-", pID)), class)
end

function chars:isquestcompleted(questID, character, qData)
 local c = DailyGlobalCheck_CharData[character]
 if not c or not c.data or not c.data[questID] then return false end

 -- old version update
 if type(c.data[questID]) == "table" then
  c.data[questID] = (c.data[questID][2] or "")..delimiter
 end

 local cstring, reset = strsplit(delimiter, c.data[questID])
 if not qData or chars:isOutDated(qData[7], reset and tonumber(reset) or c.resets) then
  c.data[questID] = nil
  return false
 end
 
 return true, cstring ~= "" and cstring or nil
end

-- packs a quest as a string with this format
-- cstring ~ personal reset time ~ overlay tooltip info
function chars:PackQuest(questID, cstring, reset)
 local qData = DailyGlobalCheck:getQData(questID)
 local result = (cstring or "")..delimiter

 -- custom reset timer
 result = result..(reset and time() + reset or "")..delimiter
 
 -- overlay info
 local overlay = quest:GetOverlayInfo(questID)
 result = result..(overlay and overlay or "")

 return result
end

function chars:CalculateResets()

 local weekly_reset_time = { hour = Region == 1 and 8 or 7, min = 0 }
 local weekly_reset_day = Region == 1 and 3 or 4

 local t = time()
 local wd, m, d, y = CalendarGetDate()
 local hr, min = GetGameTime()
 --local currDate = date("*t")
 local currDate = { wday = wd, day = d, month = m, year = y, hour = hr, min = min, sec = 0 }
 local weeklyReset = time(currDate)
 local dailyReset = t + GetQuestResetTime()

 if currDate.hour >= weekly_reset_time.hour then
  weeklyReset = weeklyReset + (24 - currDate.hour + weekly_reset_time.hour) * seconds_per_hour - seconds_per_day
 else
  weeklyReset = weeklyReset + (weekly_reset_time.hour - currDate.hour) * seconds_per_hour
 end

 weeklyReset = weeklyReset - currDate.min * 60
 
 local i = currDate.wday
 if i == weekly_reset_day and currDate.hour >= weekly_reset_time.hour then
  weeklyReset = weeklyReset + seconds_per_day * 7
 else
  while i ~= weekly_reset_day do
   i = i + 1
   weeklyReset = weeklyReset + seconds_per_day
   if i > 7 then i = 1 end
  end
 end

 return weeklyReset, dailyReset
end

function chars:isOutDated(qType, t)
 -- normal quests are never outdated
 if qType == 1 or qType == 14 then return false end
 local now = time()

 -- the quest has a custom reset time
 if type(t) == "number" then return now > t end
 
 local dReset = t.dReset or 0
 local wReset = t.wReset or 0
 local mReset = t.mReset or 0

 if qType == 3 or qType == 16 then -- resets at maintenance time (weekly)
  return now > wReset
 elseif qType == 12 then -- resets at midnight
  return now > mReset
 else -- resets at standard daily reset time (3:00 AM)
  return now > dReset
 end
end

function chars:SaveCharData()

 if tContains(DailyGlobalCheck_Options["chars_blacklist"], pID) then
  return
 end
 
 local result = {}
 result.data = {}
 local level = UnitLevel("player")
 result.info = race..delimiter..sex..delimiter..class..delimiter..faction..delimiter..level
 result.last_login = time()
 
 DailyGlobalCheck:foreachLists(function(k,v)
  for _,o in pairs(v["Order"]) do
   for _,questIDs in pairs(o) do
    for index,qID in pairs(questIDs) do
     if index > 1 then -- 1 is the header
      local b, cstring, reset = DailyGlobalCheck.isquestcompleted(qID, true, v)
      if b then
       result.data[qID] = chars:PackQuest(qID, cstring, reset)
      end
     end
    end
   end
  end
 end)

 local wr, dr = chars:CalculateResets()
 local mr = dr - seconds_per_hour * 3
 result.resets = { wReset = wr, dReset = dr, mReset = mr }

--[[ 
-- debug
 local tmp = date("*t", wr)
 print("weekly reset")
 print(tmp.day.."/"..tmp.month.."/"..tmp.year.." ("..tmp.wday..") - "..tmp.hour..":"..tmp.min)
 
 tmp = date("*t", dr)
 print("daily reset")
 print(tmp.day.."/"..tmp.month.."/"..tmp.year.." ("..tmp.wday..") - "..tmp.hour..":"..tmp.min)
]]
 
 DailyGlobalCheck_CharData[pID] = result

 -- delete not existing lists from the character list settings saved var
 lists:UpdatePluginDataSVar()
end

-- characters UI
local chars_frame
local layers = {}
local realmbtn_height = 30
local parent_offsetY = 0
local function isSelected(pid)
 return DailyGlobalCheck.selectedpID == pid
end

local function hideButtons(layer)
 for k,v in pairs(chars_frame.buttons) do
  if not layer or v.layer == layer then
   v:Hide()
   v:SetBackdropBorderColor(0.2,0.2,0.2,1)
  end
 end
 -- hide children too
 if layer < #layers then hideButtons(layer + 1) end
end

function chars:GetCharClass(pid)
 return chars.chardata[pid] and chars.chardata[pid].class or ""
end

local function extractCharData(pid)
 local name, server = strsplit("-", pid)
 local result = {name = name, pid = pid, t = "char"}
 
 local svar = DailyGlobalCheck_CharData[pid]
 local last_login

 if svar then
  local race, sex, class, faction, level = strsplit(delimiter, svar.info or "")
  result.race = race
  result.sex  = sex
  result.class = class
  result.faction = faction
  result.level = tonumber(level)
  last_login = tonumber(svar.last_login)
  if last_login then
   last_login = AddColor(date("%m/%d/%y", last_login), "COORD_COLOR")
  end
 end 
 
 if pid == pID then
  result.info = GUILD_ONLINE_LABEL
 else
  result.info = LASTONLINE..": "..(last_login or GM_SURVEY_NOT_APPLICABLE)
 end
 
 chars.chardata[pid] = result
 return result, server
end

local function setupButtonText(f, name, info, data)
 if f.t == "char" then
  f.name:SetText((data.level and AddColor(data.level.." ", "WHITE") or "")..
                                 AddColor(name, data.class or "WHITE"))
  f.info:SetText(AddColor(info, "GRAY") or "")
 elseif f.t == "blacklist_root" then
  f.name:SetText(AddColor(name, "COORD_COLOR") or "")
  f.info:SetText(AddColor(info, "GRAY") or "")
 else
  f.name:SetText(AddColor(name, "GOLD") or "")
  f.info:SetText(AddColor(info, "GRAY") or "")
 end
end

local function btnHighlight(f)
 for _,v in pairs(f:GetParent().buttons) do
  --v:SetBackdropColor(0.1,0.1,0.1,1)
  v.highlight:Hide()
 end
 
 f.highlight:Show()
end

local function btnOnClick(self)
 if self.t == "char" and self.pid then
  --self:SetBackdropColor(0,0.3,0,1)
  btnHighlight(self)
  DailyGlobalCheck.selectedpID = self.pid
  modes:Set(C.MODE_CLASSIC)
  --DailyGlobalCheck:Refresh()
 end
end

local function btnOnEnter(f)
 f:SetBackdropBorderColor(0,0.8,0.8,1)

 if f.contents then -- update next layer
  local i = f.layer + 1
  local length = #layers
  hideButtons(i)

  if length > i then
   for k = i + 1, length do
    layers[k] = nil
   end 
  end
	
  layers[i] = f.contents
  local _,_,_,_,y = f:GetPoint("TOPLEFT")
  parent_offsetY = y
  chars_frame:update(i)
 end
end

local function deleteChar(self)

 local btn = self:GetParent() -- self is the delete button
 local pid = btn.pid
 
 if btn.t == "char" then
  if pid == pID or isSelected(pid) then return end
 
  if pid and btn.layer > 1 then
   if DailyGlobalCheck_CharData[pid] then DailyGlobalCheck_CharData[pid] = nil end
  
   if not tContains(DailyGlobalCheck_Options["chars_blacklist"], pid) then
    tinsert(DailyGlobalCheck_Options["chars_blacklist"], pid)
	DGCEventFrame:Fire("CHARACTER_LIST_CHANGED")
   end
   print(string.format(L["chars_deleted"], pid))
  end
 elseif btn.t == "blacklist" then
   local blacklist = DailyGlobalCheck_Options["chars_blacklist"]
   local i = -1
   for k,v in pairs(blacklist) do
    if v == pid then
	 i = k
    end
   end
   if i > -1 then
    table.remove(blacklist, i)
    print(string.format(L["chars_restored"], pid)) 
	DGCEventFrame:Fire("CHARACTER_LIST_CHANGED")
   end
 end

 chars_frame:populate()
 chars_frame:update(1)
end

local function getButton()
 local result
 for k,v in pairs(chars_frame.buttons) do
  if not v:IsVisible() then
   result = v
   break
  end
 end

 if not result then
  result = constructors:charsListButton(chars_frame, realmbtn_height, deleteChar)
  
  result:SetScript("OnEnter", function(self)
   btnOnEnter(self)
  end)
 
  result:SetScript("OnLeave", function(self)
   self:SetBackdropBorderColor(0.2,0.2,0.2,1)
  end)
  
  result:SetScript("OnMouseUp", btnOnClick)
 end
 return result
end

local last_width
local function setupButton(f, layer, i, data)
 local t, name, info, contents, pid = data.t, data.name, data.info, data.contents, data.pid
 
 if not chars_frame.frame_layers[layer] then
  local parent = layer == 1 and chars_frame or chars_frame.frame_layers[layer - 1]
  chars_frame.frame_layers[layer] = CreateFrame("Frame", nil, parent)
  chars_frame.frame_layers[layer]:SetPoint("TOPLEFT", parent, "TOPRIGHT")
  chars_frame.frame_layers[layer]:SetSize(1,1)
 end

 if i == 1 then 
  last_width = 0
 end

 local offsetY = -((i - 1) * realmbtn_height) + parent_offsetY
 f.layer = layer
 f.t   = t
 setupButtonText(f, name, info, data)
 f.pid = pid

 if contents then
  f.contents = contents
  f.arrow:Show()
 else
  f.contents = nil
  f.arrow:Hide()
 end

 local text_width = max(f.name:GetWidth(), f.info:GetWidth())
 last_width = max(last_width, text_width + 100)

 local anchor = chars_frame.frame_layers[layer]
 f:SetPoint("TOPLEFT", anchor, "TOPLEFT", 0, offsetY)
 f:SetPoint("TOPRIGHT", anchor, "TOPRIGHT", 0, offsetY)
 if anchor:GetWidth() < last_width then anchor:SetWidth(last_width) end
 
 f.highlight:Hide()
 if pid == DailyGlobalCheck.selectedpID then
  f.highlight:Show()
 end

 f.portrait:Show()
 f.btn_delete:Show()
 f.faction:Hide()
 if t == "blacklist_root" then
  f.portrait:SetTexture(tx_blacklist)
 elseif t == "blacklist" then
  f.portrait:SetTexture(portrait_none)
  f.btn_delete:SetNormalTexture(tx_restore)
 elseif t == "char" then
  f.btn_delete:SetNormalTexture(tx_cross)
  if f.pid == pID then
   SetPortraitTexture(f.portrait, "player")
   f.btn_delete:Hide()
  elseif data.race and data.sex and tx_portraits[data.race..data.sex] then
   f.portrait:SetTexture(tx_portraits[data.race..data.sex])
  else
   f.portrait:SetTexture(portrait_none)
  end
  if data.faction == "Alliance" then
   f.faction:SetTexCoord(0,0.5,0,1)
   f.faction:Show()
  elseif data.faction == "Horde" then
   f.faction:SetTexCoord(0.5,1,0,1)
   f.faction:Show()
  else
  end
 else
  f.portrait:Hide()
  f.btn_delete:Hide()
 end
 
 f:Show()
end

local function layerUpdate(_, layer)

 hideButtons(layer)
 if layers[layer] then
  for k,v in pairs(layers[layer]) do
   local btn = getButton()
   if v.t == "char" and v.pid == pID then
	v.level = UnitLevel("player")
    v.class = class
	v.faction = faction
   end
   setupButton(btn, layer, k, v)
   v.btn = btn
   btn.parentbtn = p
  end
 end
end

-- { name, info, t, contents, pid }
local function charsframePopulate()
 parent_offsetY = 0
 local index = 1
 
 layers[1] = {}
 local data = extractCharData(pID)
 layers[1][index] = { name = data.name, info = data.info, t = "char", pid = pID }

 local i_realms = {}
 
 index = index + 1
 
 for k,_ in pairs(DailyGlobalCheck_CharData) do
  if k ~= pID then
   local data, server = extractCharData(k)
   if data.name and server then
    data.t = "char"
    if not i_realms[server] then
     layers[1][index] = { name = server, info = L["opt_characters"].." #1", contents = {data} }
	 i_realms[server] = index
	 index = index + 1
    else
     tinsert(layers[1][i_realms[server]].contents, data)
	 layers[1][i_realms[server]].info = L["opt_characters"].." #"..#(layers[1][i_realms[server]].contents)
    end
   end
  end
 end

 tsort(layers[1], function(a,b)
  if b.pid == pID then return
  elseif a.t == "blacklist_root" then return true
  else return #a.contents > #b.contents
  end
 end)
 for _,v in pairs(layers[1]) do
  if v.contents then
   tsort(v.contents, function(a,b)
    local alev = a.level or 0
	local blev = b.level or 0
    return alev == blev and a.name < b.name or alev > blev
   end)
  end
 end
 
 -- blacklist
 local blacklist_realms = {}
 local i = 0
 wipe(i_realms)
 local blacklist = DailyGlobalCheck_Options["chars_blacklist"]
 for _,v in pairs(blacklist) do
  local data, server = extractCharData(v)
  data.t = "blacklist"
  if not i_realms[server] then
   i = i + 1
   blacklist_realms[i] =  { name = server, info = L["opt_characters"].." #1", contents = {data} }
   i_realms[server] = i
  else
   tinsert(blacklist_realms[i].contents, data)
   blacklist_realms[i].info = L["opt_characters"].." #"..#(blacklist_realms[i].contents)
  end
 end
 --
 tsort(blacklist_realms, function(a,b) return #a.contents > #b.contents end)
 for k,v in pairs(blacklist_realms) do
  tsort(v.contents, function(a,b) return a.name < b.name end)
 end
 
 local blacklist_char_count = 0
 for _,v in pairs(blacklist_realms) do
  blacklist_char_count = blacklist_char_count + #v.contents
 end

 layers[1][index] = { name = L["blacklist"], info = blacklist_char_count == 0 and EMPTY or (L["opt_characters"].." #"..blacklist_char_count), t = "blacklist_root", contents = blacklist_realms}
end

function chars:CreateCharactersFrame(parent)
 DailyGlobalCheck.CharactersFrame = CreateFrame("Frame", "DGCCharactersFrame", parent)
 chars_frame = DailyGlobalCheck.CharactersFrame
 
 chars_frame.populate = charsframePopulate
 
 chars_frame.buttons = {}
 chars_frame:SetPoint("TOPLEFT", parent, "BOTTOMLEFT")
 chars_frame:SetFrameStrata("MEDIUM")
 chars_frame:SetSize(1,1)

 chars_frame.update = layerUpdate
 chars_frame.frame_layers = {}

 chars_frame:populate()
 chars_frame:update(1)
 chars_frame:Hide()
 
 return chars_frame
end

--[[ -- forbidden as of wow 7.3.2
local logoutfunc = Logout
function Logout()
 if chars then chars:SaveCharData() end
 logoutfunc()
end

local quitfunc = Quit
function Quit()
 if chars then chars:SaveCharData() end
 quitfunc()
end
]]

DGCEventFrame:RegisterEvent("PLAYER_LEAVING_WORLD")
function DGCEventFrame.PLAYER_LEAVING_WORLD(...)
 if chars then chars:SaveCharData() end
end

DGCEventFrame:RegisterEvent("PLAYER_LOGOUT")
function DGCEventFrame.PLAYER_LOGOUT(...)
 if chars then chars:SaveCharData() end
end
