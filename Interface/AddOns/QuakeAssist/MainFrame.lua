------------------------------------------------------------
-- MainFrame.lua
--
-- Abin
-- 2017/6/22
------------------------------------------------------------

local GetTime = GetTime

local _, addon = ...
local L = addon.L

local BAR_WIDTH = 160
local BAR_HEIGHT = 18
local BAR_SPACING = 2
local BAR_TEXTURE = addon.path.."\\StatusBar.tga" -- Maybe "Interface\\BUTTONS\\WHITE8X8.BLP" better?

local frame = CreateFrame("Frame", addon.name.."Frame", UIParent)
addon.frame = frame
frame:SetPoint("CENTER")
frame:SetSize(BAR_WIDTH + BAR_HEIGHT + BAR_SPACING, BAR_HEIGHT * 2 + BAR_SPACING)
frame:Hide()
frame:SetMovable(true)
frame:SetUserPlaced(false)
frame:SetDontSavePosition(true)
frame:SetFrameStrata("HIGH")
frame:SetClampedToScreen(true)

addon:RegisterEventCallback("OnEnable", function() frame:Show() end)
addon:RegisterEventCallback("OnDisable", function() frame:Hide() end)

local warningText = frame:CreateFontString(frame:GetName().."WarningText", "ARTWORK", "TextStatusBarText")
frame.warningText = warningText
warningText:SetPoint("BOTTOM", frame, "TOP", BAR_HEIGHT + BAR_SPACING, 6)
warningText:SetFont(DAMAGE_TEXT_FONT, 26, "OUTLINE")
warningText:SetTextColor(1, 0, 0)
warningText:Hide()
warningText:SetText(L["stop casting"])

local mover = CreateFrame("Button", frame:GetName().."Mover", UIParent)
frame.mover = mover
mover:SetAllPoints(frame)
mover:Hide()
mover:SetFrameStrata("FULLSCREEN_DIALOG")

local moverTitle = mover:CreateFontString(mover:GetName().."Title", "ARTWORK", "GameFontNormal")
moverTitle:SetPoint("BOTTOM", mover, "TOP", 0, 3)
moverTitle:SetText(addon.title)

mover:RegisterForDrag("LeftButton")

mover:SetScript("OnDragStart", function(self)
	frame:StartMoving()
end)

mover:SetScript("OnDragStop", function(self)
	frame:StopMovingOrSizing()
	local position = addon.db.position
	if type(position) ~= "table" then
		position = {}
		addon.db.position = position
	end

	position.point, position.relativeTo, position.relativePoint, position.xOffset, position.yOffset = frame:GetPoint(1)
end)

mover:RegisterForClicks("AnyUp")
mover:SetScript("OnClick", function(self)
	addon.optionFrame:Open()
end)

local function StatusBar_SetStatusBarColor(self, r, g, b)
	self:_OrigSetStatusBarColor(r, g, b)
	self.bkgnd:SetVertexColor(r / 2, g / 2, b / 2)
	self.text:SetTextColor(r, g, b)
end

local function CreateStatusBar(name)
	local statusBar = CreateFrame("StatusBar", name, addon.frame)
	statusBar:SetStatusBarTexture(BAR_TEXTURE)
	statusBar:SetHeight(BAR_HEIGHT)

	local icon = statusBar:CreateTexture(name.."Icon", "ARTWORK")
	statusBar.icon = icon
	icon:SetSize(BAR_HEIGHT, BAR_HEIGHT)
	icon:SetPoint("RIGHT", statusBar, "LEFT", -BAR_SPACING, 0)

	local background = statusBar:CreateTexture(name.."Bkgnd", "BORDER")
	statusBar.bkgnd = background
	background:SetAllPoints(statusBar)
	background:SetTexture(BAR_TEXTURE)

	local spark = statusBar:CreateTexture(name.."Spark", "OVERLAY")
	statusBar.spark = spark
	spark:SetTexture("Interface\\CastingBar\\UI-CastingBar-Spark")
	spark:SetBlendMode("ADD")
	spark:SetPoint("CENTER", statusBar:GetStatusBarTexture(), "RIGHT")
	spark:SetSize(BAR_HEIGHT * 0.45, BAR_HEIGHT * 1.8)

	local text = statusBar:CreateFontString(name.."Text", "ARTWORK", "TextStatusBarText")
	statusBar.text = text
	text:SetPoint("LEFT", statusBar, "RIGHT", 2, 0)

	statusBar._OrigSetStatusBarColor = statusBar.SetStatusBarColor
	statusBar.SetStatusBarColor = StatusBar_SetStatusBarColor
	statusBar:SetStatusBarColor(0, 1, 0)

	local tile1 = mover:CreateTexture(nil, "OVERLAY")
	tile1:SetAllPoints(icon)
	tile1:SetTexture("Interface\\BUTTONS\\WHITE8X8.BLP")
	tile1:SetVertexColor(0, 1, 0, 0.4)

	local tile2 = mover:CreateTexture(nil, "OVERLAY")
	tile2:SetAllPoints(statusBar)
	tile2:SetTexture("Interface\\BUTTONS\\WHITE8X8.BLP")
	tile2:SetVertexColor(0, 1, 0, 0.4)

	return statusBar
end

local QUAKEBAR_MODE_ETA = 0
local QUAKEBAR_MODE_DEBUFF = 1

local quakeBar = CreateStatusBar("QuakeBar")
frame.quakeBar = quakeBar
quakeBar:SetPoint("TOPLEFT", BAR_HEIGHT + BAR_SPACING, 0)
quakeBar:SetPoint("TOPRIGHT")

local _, _, SPELL_TEXTURE = GetSpellInfo(240447)
quakeBar.icon:SetTexture(SPELL_TEXTURE)

function quakeBar:SetMode(mode, duration, expires)
	self.mode, self.expires = mode, expires
	if mode == QUAKEBAR_MODE_ETA then
		self:SetStatusBarColor(0.5, 0.5, 1)
	else
		self:SetStatusBarColor(0.75, 0.75, 0)
	end

	self:SetMinMaxValues(expires - duration, expires)
	self:SetValue(GetTime())
end

quakeBar:SetScript("OnUpdate", function(self)
	local now = GetTime()
	local remain = (self.expires or now) - now

	if self.mode == QUAKEBAR_MODE_ETA and remain < 0 then
		self.expires = self.expires + 20
		self:SetMinMaxValues(now, self.expires)
		remain = 20
	end

	self:SetValue(now)
	self.text:SetFormattedText("%.1f", remain)
end)

addon:RegisterEventCallback("OnEnable", function()
	quakeBar:SetMode(QUAKEBAR_MODE_ETA, 20, GetTime() + 20)
end)

addon:RegisterEventCallback("OnQuake", function(duration, expires)
	if expires then
		quakeBar:SetMode(QUAKEBAR_MODE_DEBUFF, duration, expires)
	else
		quakeBar:SetMode(QUAKEBAR_MODE_ETA, 20, addon.lastQuakeTime + 20)
	end
end)

local castingBar = CreateStatusBar("CastingBar")
frame.castingBar = castingBar
castingBar:Hide()
castingBar:SetPoint("TOPLEFT", quakeBar, "BOTTOMLEFT", 0, -BAR_SPACING)
castingBar:SetWidth(BAR_WIDTH)

castingBar.nameText = castingBar:CreateFontString(castingBar:GetName().."NameText", "ARTWORK", "TextStatusBarText")
castingBar.nameText:SetPoint("TOP", castingBar, "BOTTOM", 0, -2)

castingBar:SetScript("OnUpdate", function(self)
	local castingEndTime = addon.castingEndTime
	if castingEndTime then
		local now = GetTime()
		self:SetValue(now)
		self.text:SetFormattedText("%.1f", castingEndTime - now)
	end
end)

addon:RegisterEventCallback("OnCasting", function(name, texture, startTime, endTime)
	if endTime then
		castingBar.icon:SetTexture(texture)
		castingBar.nameText:SetText(name)
		castingBar:SetMinMaxValues(startTime, endTime)
		castingBar:Show()
	else
		castingBar:Hide()
	end
end)

addon:RegisterEventCallback("OnAlert", function(dangerous)
	if dangerous then
		castingBar:SetStatusBarColor(1, 0, 0)
		warningText:Show()
	else
		castingBar:SetStatusBarColor(0, 1, 0)
		warningText:Hide()
	end
end)

addon:RegisterOptionCallback("position", function(position)
	frame:ClearAllPoints()
	if type(position) == "table" and type(position.point) == "string" then
		frame:SetPoint(position.point, position.relativeTo, position.relativePoint, position.xOffset, position.yOffset)
	else
		frame:SetPoint("CENTER")
	end
end)

addon:RegisterOptionCallback("scale", function(value)
	if type(value) == "number" and value > 20 and value < 300 then
		frame:SetScale(value / 100)
	end
end)

addon:RegisterOptionCallback("lock", function(value)
	if value then
		mover:Hide()
	else
		mover:Show()
	end
end)