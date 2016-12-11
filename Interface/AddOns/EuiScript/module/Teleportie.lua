local E, L = unpack(ElvUI)

local class = select(2, UnitClass("player"))
if class ~= "MONK" and class ~= "WARLOCK" then return end

local GetSpellInfo = GetSpellInfo
local UnitBuff = UnitBuff
local CreateFrame = CreateFrame


local BUFF_NAME = class == "MONK" and GetSpellInfo(101643) or GetSpellInfo(48018)

local Portal = {}
local distance_format
local pX, pY

local atan2 = math.atan2
local sqrt = sqrt
local abs = math.abs
local unpack = unpack

local str_fmt = string.format
local GetPlayerFacing = GetPlayerFacing

local f = CreateFrame("FRAME", "EuiTeleportie", UIParent)
f:Hide()
f:SetSize(48, 48)
local Portal_tex = f:CreateTexture(nil, "BORDER")
Portal_tex:SetAllPoints()
f.Tex_Circle = f:CreateTexture(nil, "BACKGROUND")
f.Tex_Circle:SetAllPoints()
local Distance_text = f:CreateFontString(nil, "BORDER")
Distance_text:SetFont([[Fonts\ARHei.TTF]], 12, "OUTLINE")
Distance_text:SetNonSpaceWrap(true)
Distance_text:SetJustifyH("CENTER")
Distance_text:Point("BOTTOM", f, "BOTTOM", 0, 12)
f.Direction = f:CreateTexture(nil, "ARTWORK")
f.Direction:SetAllPoints()
f.Dir_Ag = f.Direction:CreateAnimationGroup()
local Dir_Rot = f.Dir_Ag:CreateAnimation("Rotation")
Dir_Rot:SetDuration(0)
Dir_Rot:SetEndDelay(10)
f.Dir_Ag:SetLooping("REPEAT")
f.Dir_Ag:Play()
f.Dir_Ag:Pause()
f:SetClampedToScreen(true)
f:EnableMouse(true)
f:SetMovable(true)
f:RegisterForDrag("RightButton")
f:SetFrameStrata("HIGH")
f:RegisterUnitEvent("UNIT_SPELLCAST_SUCCEEDED", "player")
f:RegisterEvent("PLAYER_LOGIN")
f:RegisterEvent("PLAYER_ALIVE")
f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:RegisterEvent("ZONE_CHANGED_NEW_AREA")

local CheckPortalBuff

local function CheckPortalBuffFade()
	if not UnitBuff("player", BUFF_NAME) then
		f:Hide()
		wipe(Portal)
		f:UnregisterEvent("UNIT_AURA")
	end
end

local function CheckPortalBuffApply()
	if UnitBuff("player", BUFF_NAME) then
		CheckPortalBuff = CheckPortalBuffFade
	end
end

function f:UpdateAppearance()
	local s = E.db.euiscript.teleportie
	Portal_tex:SetTexture(s.texpath_body)
	self.Tex_Circle:SetTexture(s.texpath_bg)
	self.Direction:SetTexture(s.texpath_direction)
	local insets = s.insets
	self:SetClampRectInsets(-1 * insets, insets, insets, -1 * insets)
	Distance_text:SetFont([[Fonts\ARHei.TTF]], s.font_height, "OUTLINE")
	distance_format = "%00000."..s.decimals.."f"
	self:SetSize(s.frame_size, s.frame_size)
	self:SetPoint(unpack(s.framePos))
	f:SetSize(s.frame_size, s.frame_size)
end

local function MarkPosition(savedX, savedY, savedInstId)
--call with parameters to restore saved info or without to mark a new one
	local instance = select(8, GetInstanceInfo())
	if savedInstId and (savedInstId ~= instance or not UnitBuff("player", BUFF_NAME)) then wipe(Portal) return end
	Portal.instance = instance

	local x, y = UnitPosition("player")

	pX, pY = savedX or x, savedY or y
	Portal.RealX, Portal.RealY = pX, pY

	f:Show()
	CheckPortalBuff = CheckPortalBuffApply
	f:RegisterUnitEvent("UNIT_AURA", "player")
end

--User interface
local anchorOpposites = {
	TOPLEFT     = "ANCHOR_BOTTOMRIGHT",
	TOPRIGHT    = "ANCHOR_BOTTOMLEFT",
	BOTTOMLEFT  = "ANCHOR_TOPRIGHT",
	BOTTOMRIGHT = "ANCHOR_TOPLEFT",
	TOP         = "ANCHOR_BOTTOM",
	BOTTOM      = "ANCHOR_TOP",
	LEFT        = "ANCHOR_RIGHT",
	RIGHT       = "ANCHOR_LEFT",
	CENTER      = "ANCHOR_TOP",
}

local old_in_range
local function OnUpdate() 	
	local x, y = UnitPosition("player")
	local x_diff, y_diff = pX - x, pY - y
	local distance = sqrt(x_diff ^ 2 + y_diff ^ 2)
	Distance_text:SetText(str_fmt(distance_format, distance))
	Dir_Rot:SetRadians(atan2(y_diff, x_diff) - GetPlayerFacing())

	local in_range = distance < 39.99
	if in_range ~= old_in_range then
		if in_range then
			Portal_tex:SetVertexColor(unpack(E.db.euiscript.teleportie.texColor_near))
			Distance_text:SetTextColor(unpack(E.db.euiscript.teleportie.textColor_near))
		else
			Portal_tex:SetVertexColor(unpack(E.db.euiscript.teleportie.texColor_far))
			Distance_text:SetTextColor(unpack(E.db.euiscript.teleportie.textColor_far))
		end
	end
	old_in_range = in_range
end

f:SetScript("OnEnter", function(self)
	GameTooltip:SetOwner(self, anchorOpposites[E.db.euiscript.teleportie.framePos[1]])
	GameTooltip:ClearLines()
	GameTooltip:AddLine(BUFF_NAME)
	GameTooltip:AddLine(L["Move me by shift + right mouse draging!"])
	GameTooltip:AddLine(L["Scale me by mouse-over wheeling!"])
	--GameTooltip:AddLine("For more options type: /teleportie")
	GameTooltip:Show()
end)
f:SetScript("OnLeave", function(self)
	--GameTooltip:FadeOut()
	GameTooltip:Hide()
end)
f:SetScript("OnDragStart", function(self, ...)
	if IsShiftKeyDown() then
		self:StartMoving()
	end
end)
f:SetScript("OnDragStop", function(self, ...)
	self:StopMovingOrSizing()
	E.db.euiscript.teleportie.framePos = {self:GetPoint()}
end)
f:SetScript("OnEvent", function(self, event, ...) 
	if not E.db.euiscript.teleportie.enable then return; end
	
	if event == "UNIT_AURA" then
		CheckPortalBuff()
	elseif event == "UNIT_SPELLCAST_SUCCEEDED" then
		local spellId = select(5, ...)
		if spellId == 101643 or spellId == 48018 or spellId == 119996 then
			MarkPosition()
		end
	elseif event == "PLAYER_LOGIN" then
		f:UpdateAppearance()
		Portal = E.db.euiscript.teleportie.Portal
	elseif event == "PLAYER_ENTERING_WORLD" and Portal.RealX then
		MarkPosition(Portal.RealX, Portal.RealY, Portal.instance)
		f:Toggle()
	elseif event == "PLAYER_ALIVE" then
		self:Hide()
		wipe(Portal)
	end
end)
f:SetScript("OnMouseWheel", function(self, delta)
	local size = self:GetSize() + (0.5 * delta)
	self:SetSize(size, size)
	E.db.euiscript.teleportie.frame_size = size
end)

function f:Toggle()
	if E.db.euiscript.teleportie.enable then
		f:SetScript("OnUpdate", OnUpdate)
	else
		f:SetScript("OnUpdate", nil)
		f:Hide()
	end
end
f:Toggle()