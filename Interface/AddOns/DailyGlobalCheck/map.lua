-- Daily Global Check
-- by Jadya
-- EU-Well of Eternity

--[[ map related functions ]]--

local tinsert, tremove, ceil, sin, cos, tonumber, UnitPosition = table.insert, table.remove, math.ceil, math.sin, math.cos, tonumber, UnitPosition

local addonName, addonTable = ...

local T = addonTable.T
local AddColor = addonTable.AddColor

local transforms = {}

for k,v in pairs(GetWorldMapTransforms()) do
 local id, newID, _, _, y1, y2, x1, x2, oy, ox = GetWorldMapTransformInfo(v)
 if (ox ~= 0 or oy ~= 0) and id ~= 1064 --[[until I realize why isle of thunder offset is broken]] then
  transforms[#transforms + 1] = {x2, y2, x1, y1, ox, oy, id = id, newID = newID}
 end
end

local map_data = setmetatable({}, { __index = function(t, k)
											   local instanceID, _, _, left, right, top, bottom = GetAreaMapInfo(k)
											   local ml, mr, mt, mb = left, right, top, bottom

											   for _,v in pairs(transforms) do
											    if v.id == instanceID and left < v[1] and top < v[2] and right > v[3] and bottom > v[4] then
											     left = left + v[5]
												 right = right + v[5]
												 top = top + v[6]
												 bottom = bottom + v[6]
												 instanceID = v.newID
												 break
											    end
											   end

											   if instanceID then
  										        t[k] = { id = instanceID, l = left, t = top, r = right, b = bottom, w = right - left, h = bottom - top,
                                                                          ml = ml, mt = mt, mw = mr - ml, mh = mb - mt}
  										        return t[k]
											   else
											    t[k] = false
											   end
											  end})

-- zone names cache, available to plugins
DailyGlobalCheck.Z = setmetatable({}, { __index = function(t, k)
												   local result = GetMapNameByID(k) or ""
											       t[k] = result
												   return result
 											      end})

local lists =  DailyGlobalCheck.ListFunctions
local maps  = DailyGlobalCheck.MapFunctions

local minimapShapes = {
	-- {upper-left, lower-left, upper-right, lower-right}
	-- true = rounded, false = squared
	--["ROUND"]                 = {true , true , true , true}, -- no need of this
	["SQUARE"] 			      = {false, false, false, false},
	["CORNER-TOPLEFT"] 		  = {true , false, false, false},
	["CORNER-TOPRIGHT"] 	  = {false, false, true , false},
	["CORNER-BOTTOMLEFT"] 	  = {false, true , false, false},
	["CORNER-BOTTOMRIGHT"]	  = {false, false, false, true},
	["SIDE-LEFT"] 			  = {true , true , false, false},
	["SIDE-RIGHT"] 			  = {false, false, true , true},
	["SIDE-TOP"] 			  = {true , false, true , false},
	["SIDE-BOTTOM"] 		  = {false, true , false, true},
	["TRICORNER-TOPLEFT"] 	  = {true , true , true , false},
	["TRICORNER-TOPRIGHT"]    = {true , false, true , true},
	["TRICORNER-BOTTOMLEFT"]  = {true , true , false, true},
	["TRICORNER-BOTTOMRIGHT"] = {false, true , true , true},
}

local wmf = CreateFrame("Frame", "DGCWorldMapOverlay", WorldMapButton)
local mmf = CreateFrame("Frame", "DGCMinimapOverlay", Minimap)
local frames_pool = {}
local updates = {} -- option update functions
local icons = { worldmap = {}, minimap = {} }
local map_tooltip
local player_mapID, player_instanceID, player_dungeonID
local dungeon_data = {}
-- minimap vars
local minimap_icons_in_radius = {}
local player_last_x, player_last_y, lastZoom, zoom_mod, zoom_add, zoom_base, zoom, lastFacing, fsin, fcos, isRotating, isOutdoor, inInstance
local svar

-- icon frames pool
local function getbtn()
 local btn = frames_pool[1]
 if btn then tremove(frames_pool, 1) end
 return btn
end

local function freebtn(btn)
 if not btn then return end

 if not tContains(frames_pool, btn) then
  frames_pool[#frames_pool + 1] = btn
 end
 btn:SetParent(nil)
 btn:Hide()
end
--

local function getMapIcon(v, k)
 return (type(v[5][k + 3]) == "table" and v[5][k + 3].icon) or
--        (type(v[8])        == "table" and v[8][1])          or
        v[8] or
        T.dgcicon
end

-- icon events
local function mapbutton_onmouseup(self, mousebutton)
 if not IsControlKeyDown() or mousebutton ~= "RightButton" then
  local p = self:GetParent()
  if self:GetParent() == wmf then
   WorldMapButton_OnClick(WorldMapButton, mousebutton)
  else
   Minimap_OnClick(Minimap, mousebutton)
  end
  return
 end

 local data = self.data

 if data then
  local x = data[5][2] / 100
  local y = data[5][3] / 100
  addonTable.setTomTomWP(data[5][1], nil, x, y, { title = data[2]})
 end
end

local overlay_pool = {}

local function mapbutton_onenter(self)
 local data = self.data

 if not data then return end
 
 map_tooltip:SetOwner(self,"ANCHOR_BOTTOM")
 map_tooltip:ClearLines()

 local btn
 for i = 1, (self.i.numIcons or 1) do
  btn = self.i["button"..i]
  if btn and btn:IsVisible() then
   local overlay = overlay_pool[i]
   if not overlay then
    overlay = wmf:CreateTexture(nil, "OVERLAY")
    overlay:SetSize(30, 30)
    overlay:SetTexture("spells\\Frost_Glow")
    overlay:SetVertexColor(1,1,1,0.4)
    overlay:SetBlendMode("ADD")
    overlay_pool[i] = overlay
   end
   overlay:SetParent(self.i["button"..i])
   overlay:SetPoint("CENTER", self.i["button"..i], "CENTER")
   overlay:Show()
   i = i + 1
  end
 end

 map_tooltip:AddLine("|cff00AAFFDaily Global Check|r")
 map_tooltip:AddLine(AddColor(self.i.list and self.i.list.Title or "","LIGHT_BLUE"))
 map_tooltip:AddLine(data[3].." "..data[2])
 map_tooltip:AddLine(data[4])
 local desc = self.info and self.info.desc
 if desc then
  map_tooltip:AddLine(" ")
  map_tooltip:AddLine(AddColor(desc, "LIGHT_GREEN"))
 end
 map_tooltip:Show()
 
 map_tooltip.info:SetOwner(map_tooltip, "ANCHOR_BOTTOM")
 local info = DailyGlobalCheck.QuestFunctions:GetOverlayInfo(data.questID, data)
 if (info and DailyGlobalCheck:OverlayInfoToTooltip(map_tooltip.info, info)) then
  map_tooltip.info:Show()
 else
  map_tooltip.info:Hide()
 end
end

local function mapbutton_onleave(self)
 for _,v in pairs(overlay_pool) do
  v:Hide()
 end
 map_tooltip:Hide()
end
--

local counter = 0
local function createButton(t)
 local f = getbtn()
 if not f then
  f = CreateFrame("Frame", "DailyGlobalCheck_MapIcon"..counter)
  f:SetScript("OnMouseUp", mapbutton_onmouseup) 
  f:SetScript("OnEnter", mapbutton_onenter)
  f:SetScript("OnLeave", mapbutton_onleave)
  f.tex = f:CreateTexture()
  f.tex:SetAllPoints()
  counter = counter + 1
 end

 f:SetParent(t == "worldmap" and wmf or mmf)
 local size = svar.UI[t.."_icon_size"]
 f:SetSize(size, size)
 f:EnableMouse(svar.UI[t.."_icon_interact"])
 return f
end

local function removeButton(i, v, index)
 if not i then return end
 
 minimap_icons_in_radius[v] = nil
 
 if index then
  if i["button"..index] then
   freebtn(i["button"..index])
   i["button"..index] = nil
  end
  return
 end

 for k = 1, (i.numIcons or 1) do
  freebtn(i["button"..k])
  i["button"..k] = nil
 end
end

function maps:RemoveList(t, list)
 if not lists:isList(list) then return end

 for _,v in pairs(icons[t]) do
  for j,i in pairs(v) do
   if i.list == list then
    removeButton(i, v)
    i.visible = false
   end
  end
 end
end

local function AddButton(t, v, list)
 if not icons[t][map_data[v[5][1]].id] then
  icons[t][map_data[v[5][1]].id] = {}
 end
 if not icons[t][map_data[v[5][1]].id][v] then
  icons[t][map_data[v[5][1]].id][v] = { list = list }
 end
 icons[t][map_data[v[5][1]].id][v].visible = true
 icons[t][map_data[v[5][1]].id][v].numIcons = ceil(#(v[5]) / 4)
end

local function AddList(t, list)
 local pages_t = lists:getShowPagesTable(list)
 for Ipage, page in pairs(list.Order) do
  if pages_t[Ipage] ~= "0" then
   for _, group in pairs(page) do
    for i = 2, #group do
	 local v = DailyGlobalCheck:getQData(group[i], list.Title)
	 if v and v[5] and map_data[v[5][1]] and (not v[6] or v[6] ~= 0) then
	  if not DailyGlobalCheck.isquestcompleted(group[i], true, list) and addonTable.isshown(group[i], list.Title) then
       AddButton(t, v, list)
	  end
	 end
    end
   end
  end
 end
end

function maps:UpdateList(t, list, clear)
 if clear then
  maps:RemoveList(t, list)
 end

 if lists:isActive(list) and lists:getShowMapIcons(list, t) then
  AddList(t, list)
 elseif not clear then
  maps:RemoveList(t, list)
 end

 if t == "worldmap" then
  wmf.update()
 else
  mmf.update(true)
 end
end

function maps:Update(t)
 DailyGlobalCheck:foreachLists(function(k,v)
  maps:UpdateList(t, list)
 end)
end

-- worldmap
local function updateWorldmapIcon(i, v, current_data, mapID)
 local inDungeon = dungeon_data.id ~= 0

 local k = 1
 while v[5][k] do
  local index = ceil(k / 4)

  local iconInDungeon = type(v[5][k + 3]) == "table" and v[5][k + 3].level
  local iconInThisDungeon = inDungeon and iconInDungeon and iconInDungeon == dungeon_data.id

  local x, y, wx, wy, rect

  if inDungeon then
   rect = dungeon_data
   if current_data.l ~= 0 and current_data.r ~= 0 and current_data.t ~= 0 and current_data.b ~= 0 then
    wx = current_data.w * v[5][k + 1] / 100 + current_data.l
    wy = current_data.h * v[5][k + 2] / 100 + current_data.t
	if not rect.l or not rect.r or not rect.t or not rect.b then
	 rect = current_data
	end
   else
    wx = (rect.r - rect.l) * v[5][k + 1] / 100 + rect.l
    wy = (rect.b - rect.t) * v[5][k + 2] / 100 + rect.t
   end
  else
   local data = map_data[v[5][k]]
   rect = current_data
   wx = data.w * v[5][k + 1] / 100 + data.l
   wy = data.h * v[5][k + 2] / 100 + data.t
  end

  if not rect.l or not rect.r or not rect.t or not rect.b then
   removeButton(i, v)
   break
  end

  local nL = (rect.r - rect.l)
  local nT = (rect.b - rect.t)

  x = (wx - rect.l) / (nL ~= 0 and nL or 1)
  y = -(wy - rect.t) / (nT ~= 0 and nT or 1)

  if (DailyGlobalCheck_Options.UI.show_adjacent_icons or v[5][k] == mapID) and ((not inDungeon and not iconInDungeon) or iconInThisDungeon) and
      wx < rect.l and wx > rect.r and wy < rect.t and wy > rect.b and i.visible then
   local btn = i["button"..index]
   if not btn then
    btn = createButton("worldmap")
    btn.tex:SetTexture(getMapIcon(v, k))
	i["button"..index] = btn
	btn.i = i
    btn.data = v
    btn.info = v[5][k + 3]
   end
   btn:SetPoint("CENTER", wmf, "TOPLEFT", wmf.w * x, wmf.h * y)
   btn:Show()
  elseif i["button"..index] then
   i["button"..index]:Hide()
   --removeButton(i, index)
  end
  k = k + 4
 end
end

local function checkQuestCompletion(k, v)
 return k.questID and DailyGlobalCheck.isquestcompleted(k.questID, true, v.list)
end

local last_check = 0
local function updateWorldmap()
 if not wmf:IsVisible() then return end
 
 wmf.w, wmf.h = wmf:GetWidth(), wmf:GetHeight()

 dungeon_data.id, dungeon_data.r,
 dungeon_data.b, dungeon_data.l, dungeon_data.t = GetCurrentMapDungeonLevel()

 local mapID = GetCurrentMapAreaID()
 local current_data = map_data[mapID]

 -- general check every 2~ minutes to be sure we hide every completed quest icon
 if not InCombatLockdown() then
  local now = time()
  if now > last_check + 120 then
   for t,v in pairs(icons) do
    for j,data in pairs(v) do
	 -- we'll be checking the current instance later in this function
	 if not current_data or j ~= current_data.id then
	  for v,i in pairs(data) do
       if checkQuestCompletion(v, i) then
	    removeButton(i, v)
	    v[j] = nil
	   end
	  end
	 end
	end
   end
   last_check = now
  end
 end
 
 if icons.worldmap[wmf.last_instanceID] and (not current_data or wmf.last_instanceID ~= current_data.id or dungeon_data.id ~= wmf.last_dungeon) then
  for v,i in pairs(icons.worldmap[wmf.last_instanceID]) do
   removeButton(i, v)
  end
 end

 if current_data and WorldMapButton:IsVisible() and icons.worldmap[current_data.id] then
  for v, i in pairs(icons.worldmap[current_data.id]) do
   if checkQuestCompletion(v, i) then
    removeButton(i, v)
    icons.worldmap[current_data.id][v] = nil
   else
    updateWorldmapIcon(i, v, current_data, mapID)
   end
  end
 end
 wmf.last_instanceID = current_data and current_data.id
 wmf.last_dungeon = dungeon_data.id
end
--
wmf.update = updateWorldmap

-- minimap
local function updateMinimapIcon(i, v)

 local k = 1
 while v[5][k] do
  local index = ceil(k / 4)
  local data = map_data[v[5][k]]

  local wx = data.mw * v[5][k + 1] / 100 + data.ml
  local wy = data.mh * v[5][k + 2] / 100 + data.mt

  local dx, dy = (player_last_x - wx) * zoom, (player_last_y - wy) * zoom
  
  if isRotating then
   dx, dy = dx * fcos - dy * fsin, dx * fsin + dy * fcos
  end

  local isRound
  if shape then
   local i = dx < 0 and 1 or 3
   if dy < 0 then
    isRound = shape[i]
   else
    isRound = shape[i + 1]
   end
  else
   isRound = true
  end

  local dist = isRound and (dx ^ 2 + dy ^ 2) / 0.8 or max(dx ^ 2, dy ^ 2) / 0.8

  local x, y = dx * mmWidth / 2, -dy * mmHeight / 2
  if dist <= 1 and i.visible and (((not v[5][k + 3] or not v[5][k + 3].level) and player_dungeonID == 0) or (v[5][k + 3] and v[5][k + 3].level == player_dungeonID))then
   local btn = i["button"..index]
   if not btn then
    btn = createButton("minimap")
	btn.tex:SetTexture(getMapIcon(v, k))
	i["button"..index] = btn
   end

   btn.i = i
   btn.data = v
   btn.info = v[5][k + 3]
   btn:SetPoint("CENTER", mmf, "CENTER", x, y)
   btn:Show()
  elseif i["button"..index] then
   i["button"..index]:Hide()
   --removeButton(i, index)
  end
  k = k + 4
 end
end

local last_minimap_refresh = 5
local function updateMinimap(forced)

 if not icons.minimap[player_instanceID] then return end

 local py, px = UnitPosition("player")
 
 local z = Minimap:GetZoom()
 if not isOutdoor then
  zoom_mod  = z == 4 and 1.6 or 1.2
  zoom_add  = z == 5 and 1 or 0
 end
 
 zoom = zoom_base / ((5 - z) * zoom_mod + zoom_add)

 local facing = isRotating and GetPlayerFacing() or 0

 if px ~= player_last_x or py ~= player_last_y or zoom ~= lastZoom or (isRotating and facing ~= lastFacing) or forced then
  shape = GetMinimapShape and minimapShapes[GetMinimapShape()]

  player_last_x = px
  player_last_y = py
  lastZoom = zoom
  lastFacing = facing
 
  if isRotating then
   fsin = sin(facing)
   fcos = cos(facing)
  end

  if last_minimap_refresh > 2 or forced then
   last_minimap_refresh = 0
   wipe(minimap_icons_in_radius)
   for v, i in pairs(icons.minimap[player_instanceID]) do
	local k = 1
    if not minimap_icons_in_radius[v] then
     while v[5][k] do
	  local index = ceil(k / 4)
      if v[5][k] == player_mapID then
	   local wx = map_data[v[5][k]].mw * v[5][k + 1] / 100 + map_data[v[5][k]].ml
       local wy = map_data[v[5][k]].mh * v[5][k + 2] / 100 + map_data[v[5][k]].mt
	   if sqrt((player_last_x - wx)^2 + (player_last_y - wy)^2) < 300 then
        minimap_icons_in_radius[v] = i
	   elseif i["button"..k] then
	    i["button"..k]:Hide()
	   end
	  end
	  k = k + 4
     end
	end
   end
  end

  for v, i in pairs(minimap_icons_in_radius) do
   if not DailyGlobalCheck.isquestcompleted(v.questID, true, i.list, v) then
    updateMinimapIcon(i, v)
   else
	removeButton(icons.minimap[player_instanceID][v], v)
	icons.minimap[player_instanceID][v] = nil
   end
  end
 end
end

mmf.update = updateMinimap

local last_time = 0
function minimapOnUpdate(_, elapsed)
 last_time = last_time + elapsed
 last_minimap_refresh = last_minimap_refresh + elapsed
 if last_time > 0.05 then
  updateMinimap()
  last_time = 0
 end
end

local function updateMinimapZoom()
 local z = Minimap:GetZoom()
 if GetCVar("minimapZoom") == GetCVar("minimapInsideZoom") then
  Minimap:SetZoom(z + (z < 4 and 1 or -1))
 end
 isOutdoor = tonumber(GetCVar("minimapZoom")) == Minimap:GetZoom()
 if isOutdoor then
  zoom_base = 0.015
  zoom_mod  = 0.5
  zoom_add  = 1
 else
  zoom_base = 0.04
 end
 Minimap:SetZoom(z)
end
--

local function updateIconsSize(t, value)
 local size = value
 for _,v in pairs(icons[t]) do
  for _,i in pairs(v) do
   for k = 1, (i.numIcons or 1) do
    if i["button"..k] then
     i["button"..k]:SetSize(size, size)
	end
   end
  end
 end
end

local function updateInteractable(t, value)
 for _,v in pairs(icons[t]) do
  for _,i in pairs(v) do
   for k = 1, (i.numIcons or 1) do
    if i["button"..k] then
     i["button"..k]:EnableMouse(value)
	end
   end
  end
 end
end

local function updateVisibility(t, value)
 local f = t == "worldmap" and wmf or mmf
 if value then
  f:Show()
  f.update(true)
 else 
  f:Hide()
 end
end

local function updateVisibility_List(t, _, list)
 maps:UpdateList(t, list)
 if t == "worldmap" then
  updateWorldmap()
 else
  updateMinimap(true)
 end
end

local function hideIcons(t)
 for _,data in pairs(icons[t]) do
  for v, i in pairs(data) do
   removeButton(i, v)
  end
 end
end

function maps:Initialize()
 svar = DailyGlobalCheck_Options

 wmf:SetAllPoints()

 mmWidth  = 0
 mmHeight = 0
 mmf:SetScript("OnSizeChanged", function()
  mmWidth = mmf:GetWidth()
  mmHeight = mmf:GetHeight()
 end)

 mmf:SetAllPoints()
 isRotating = GetCVar("rotateMinimap") == "1"
 mmf:SetScript("OnUpdate", minimapOnUpdate)

 map_tooltip = CreateFrame("GameTooltip","DailyGlobalCheck_maptooltip", nil, "GameTooltipTemplate")
 map_tooltip:SetFrameStrata("TOOLTIP")
 map_tooltip:SetScale(0.8)
 map_tooltip.info = CreateFrame("GameTooltip", "DailyGlobalCheck_maptooltipInfo", map_tooltip, "GameTooltipTemplate")
 map_tooltip.info:SetScale(0.9)

 DGCEventFrame:RegisterEvent("WORLD_MAP_UPDATE")
 DGCEventFrame.WORLD_MAP_UPDATE = updateWorldmap

 DGCEventFrame:RegisterEvent("MINIMAP_UPDATE_ZOOM")
 DGCEventFrame.MINIMAP_UPDATE_ZOOM = updateMinimapZoom
 
 DGCEventFrame:RegisterEvent("CVAR_UPDATE")
 function DGCEventFrame.CVAR_UPDATE(...)
  if ... == "ROTATE_MINIMAP" then
   isRotating = select(2, ...) == "1"
   updateMinimap(true)
  end
 end

 local function setPlayerZone()
  -- necessary to avoid world map zoom reset
  WorldMapFrame:UnregisterEvent("WORLD_MAP_UPDATE")
  
  local prev_mapID = GetCurrentMapAreaID()
  local prev_dungeonID = GetCurrentMapDungeonLevel()
  local prev_cont
  if not prev_mapID or prev_mapID < 0 or prev_mapID == 751 then
   prev_cont = GetCurrentMapContinent()
  end

  SetMapToCurrentZone()

  local new_mapID = GetCurrentMapAreaID()
  local new_dungeonID = GetCurrentMapDungeonLevel()

  if player_mapID ~= new_mapID or player_dungeonID ~= new_dungeonID then
   player_instanceID = map_data[new_mapID] and map_data[new_mapID].id
   player_mapID =  new_mapID
   player_dungeonID = new_dungeonID
   hideIcons("minimap")
   hideIcons("worldmap")
  end

  if prev_cont then
   SetMapZoom(prev_cont)
  else
   if prev_mapID ~= new_mapID then
    SetMapByID(prev_mapID)
   end
   
   if prev_dungeonID > 0 then
    SetDungeonMapLevel(prev_dungeonID)
   end
  end

  WorldMapFrame:RegisterEvent("WORLD_MAP_UPDATE")
  --updateMinimap(true)
 end

 DGCEventFrame:RegisterEvent("ZONE_CHANGED")
 DGCEventFrame:RegisterEvent("ZONE_CHANGED_NEW_AREA")
 DGCEventFrame:RegisterEvent("ZONE_CHANGED_INDOORS")
 DGCEventFrame.ZONE_CHANGED          = setPlayerZone
 DGCEventFrame.ZONE_CHANGED_INDOORS  = setPlayerZone
 DGCEventFrame.ZONE_CHANGED_NEW_AREA = setPlayerZone

 -- minimize CPU usage inside instances
 local function toggleMinimap()
  local now = IsInInstance()
  if now and not inInstance then
   mmf:Hide()
  elseif inInstance and not now then
   mmf:Show()
  end
  inInstance = now
 end
 DGCEventFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
 DGCEventFrame.PLAYER_ENTERING_WORLD = toggleMinimap
 --
 
 updates._icon_size     = updateIconsSize
 updates._icon_interact = updateInteractable
 updates.show_icons     = updateVisibility
 updates.show_mapicons_ = updateVisibility_List -- plugin option

 local function option_changed(opt, value, list)
  -- not interested in plugin generic options
  if type(opt) ~= "string" then return end
 
  local t, func

  local i, j = opt:find("worldmap")
  if not i then
   t = "minimap"
   i, j = opt:find(t)
   func = opt:gsub(t, "")
  else
   t = "worldmap"
   func = opt:gsub(t, "")
  end

  if updates[func] then
   updates[func](t, value, list)
  end
 end

 DGCEventFrame:Hook("OPTION_CHANGED", option_changed)
 DGCEventFrame:Hook("OPTION_CHANGED_PLUGIN", option_changed)

 local function updateicons(list)
  maps:UpdateList("worldmap", list)
  maps:UpdateList("minimap", list)
 end
 
 DGCEventFrame:Hook("PLUGIN_LOADED", updateicons)
 
 option_changed("show_worldmapicons", svar.show_worldmapicons)
 option_changed("show_minimapicons", svar.show_minimapicons)
 
 updateMinimapZoom()
 setPlayerZone()
end
