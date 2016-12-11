local E, L = unpack(ElvUI) -- Import Functions/Constants, Config, Locales
local Pitch = E:NewModule('Pitch', 'AceEvent-3.0')

local IsFlying = IsFlying
local IsSwimming = IsSwimming
local UnitOnTaxi = UnitOnTaxi
local UnitAffectingCombat = UnitAffectingCombat
local GetUnitPitch = GetUnitPitch
local pi, floor, pairs = math.pi, math.floor, pairs
local UIFrameFadeIn = UIFrameFadeIn
local UIFrameFadeOut = UIFrameFadeOut
local CUSTOM_CLASS_COLORS = CUSTOM_CLASS_COLORS
local RAID_CLASS_COLORS = RAID_CLASS_COLORS
local IsLoggedIn = IsLoggedIn

local LoggedIn = false

local updateSpeed = 1/40

-- Vars
local PitchHeight = 120

local PitchElements = {
	[1] = "Center",
	[2] = "Mover",
	[3] = "Limit",
}

local db = {
	visibility = {
		flying = true,
		swimming = true,
		combat = false,			
	},
	position = {
		x = -1,
		y = 0,
	},
	animation = {
		fadetime = 0.5,
	},
	appearance = {
		opacity = {
			surround = 1,
			background = 0.8,
		},
	},
}

local PitchTextures = {
	Center = {
		M = {
			surround = [[Interface\AddOns\EuiScript\textures\Pitch\Center_M_Surround]],
			bg = [[Interface\AddOns\EuiScript\textures\Pitch\Center_M_BG]],
		},
		U = {
			surround = [[Interface\AddOns\EuiScript\textures\Pitch\Center_U_Surround]],
			bg = [[Interface\AddOns\EuiScript\textures\Pitch\Center_U_BG]],
		},
	},
	Mover = {
		M = {
			surround = [[Interface\AddOns\EuiScript\textures\Pitch\Mover_M_Surround]],
			bg = [[Interface\AddOns\EuiScript\textures\Pitch\Mover_M_BG]],
		},
		U = {
			surround = [[Interface\AddOns\EuiScript\textures\Pitch\Mover_U_Surround]],
			bg = [[Interface\AddOns\EuiScript\textures\Pitch\Mover_U_BG]],
		},
	},
	Limit = {
		surround = [[Interface\AddOns\EuiScript\textures\Pitch\Limit_Surround]],
		bg = [[Interface\AddOns\EuiScript\textures\Pitch\Limit_BG]],
	},
}

local PitchFrame = nil
local PitchVisible = false
local PitchFaded = false

local PitchDirection = 0	-- 0 = Center, 1 = Up, -1 = Down
local CurPitch = 0
local ElapsedSinceChange = 0

local PitchLimit = 88		-- Maximum flight pitch in Degrees (88 is WoW's default)
local PitchCenterPoint = 1	-- When to change the Pitch display to Center style

---- PITCH UPDATE
-- Timer
local PitchTimer = CreateFrame("FRAME")
PitchTimer.int = 0.5
PitchTimer:Hide()

local function PitchTimerUpdate(self, elapsed)
	PitchTimer.int = PitchTimer.int - elapsed
	ElapsedSinceChange = ElapsedSinceChange + elapsed
	if (PitchTimer.int <= 0) then
		if ( ((db.visibility.flying and IsFlying()) or (db.visibility.swimming and IsSwimming() and not UnitOnTaxi("player"))) and (db.visibility.combat or not UnitAffectingCombat("player")) ) then
			-- Show Pitch display, update pitch and increase update rate
			if not PitchVisible then
				ElapsedSinceChange = 0
				Pitch:UpdateShown(true)
			end
			Pitch:UpdatePitch()
			PitchTimer.int = updateSpeed
		else
			-- Hide Pitch display and decrease update rate
			if PitchVisible then
				Pitch:UpdateShown(false)
			end
			PitchTimer.int = 0.5
			ElapsedSinceChange = 0
		end		
	end
end

-- Update Pitch display to current pitch
function Pitch:UpdatePitch()
	local OldPitch = CurPitch
	CurPitch = GetUnitPitch("player") * 360 / (2 * pi)
	
	-- Limit Pitch to normal max limits (incase people activate Barrel Rolls on their flyers)
	if CurPitch > PitchLimit then CurPitch = PitchLimit end
	if CurPitch < -PitchLimit then CurPitch = -PitchLimit end
	
	-- Fader
	if OldPitch ~= CurPitch then
		ElapsedSinceChange = 0
		if PitchFaded then self:Fade(true) end
	else
		if ElapsedSinceChange > db.animation.fadetime and not PitchFaded then
			self:Fade(false)
		end
	end	
	
	-- Move Mover
	local yPos = floor(CurPitch * ((PitchHeight / 2) / PitchLimit) + 0.5)
	PitchFrame["Mover"]:SetPoint("CENTER", PitchFrame, "CENTER", 0, yPos)
	
	-- Update textures if changing between Up/Down/Center 
	if ((CurPitch < PitchCenterPoint and CurPitch > -PitchCenterPoint) and (PitchDirection ~= 0)) then
		-- Center
		PitchFrame["Center"].bg:SetTexture(PitchTextures.Center.M.bg)
		PitchFrame["Center"].surround:SetTexture(PitchTextures.Center.M.surround)
		PitchFrame["Center"]:SetPoint("CENTER", PitchFrame, "CENTER", 0, 0)
		PitchFrame["Mover"].bg:SetTexture(PitchTextures.Mover.M.bg)
		PitchFrame["Mover"].surround:SetTexture(PitchTextures.Mover.M.surround)
		PitchFrame["Limit"]:Hide()
		
		PitchDirection = 0
	elseif ((CurPitch >= PitchCenterPoint) and (PitchDirection ~= 1)) then
		-- Up
		PitchFrame["Center"].bg:SetTexture(PitchTextures.Center.U.bg)
		PitchFrame["Center"].surround:SetTexture(PitchTextures.Center.U.surround)
		PitchFrame["Center"].bg:SetTexCoord(0, 1, 0, 1)
		PitchFrame["Center"].surround:SetTexCoord(0, 1, 0, 1)
		PitchFrame["Center"]:SetPoint("CENTER", PitchFrame, "CENTER", 0, 1)
		PitchFrame["Mover"].bg:SetTexture(PitchTextures.Mover.U.bg)
		PitchFrame["Mover"].surround:SetTexture(PitchTextures.Mover.U.surround)
		PitchFrame["Mover"].bg:SetTexCoord(0, 1, 0, 1)
		PitchFrame["Mover"].surround:SetTexCoord(0, 1, 0, 1)
		PitchFrame["Limit"].bg:SetTexture(PitchTextures.Limit.bg)
		PitchFrame["Limit"].surround:SetTexture(PitchTextures.Limit.surround)
		PitchFrame["Limit"].bg:SetTexCoord(0, 1, 0, 1)
		PitchFrame["Limit"].surround:SetTexCoord(0, 1, 0, 1)
		PitchFrame["Limit"]:SetPoint("CENTER", PitchFrame, "CENTER", 0, floor((PitchHeight / 2) + 12))
		PitchFrame["Limit"]:Show()
		
		PitchDirection = 1
	elseif ((CurPitch <= -PitchCenterPoint) and (PitchDirection ~= -1)) then
		-- Down
		PitchFrame["Center"].bg:SetTexture(PitchTextures.Center.U.bg)
		PitchFrame["Center"].surround:SetTexture(PitchTextures.Center.U.surround)
		PitchFrame["Center"].bg:SetTexCoord(0, 1, 1, 0)
		PitchFrame["Center"].surround:SetTexCoord(0, 1, 1, 0)
		PitchFrame["Center"]:SetPoint("CENTER", PitchFrame, "CENTER", 0, -1)
		PitchFrame["Mover"].bg:SetTexture(PitchTextures.Mover.U.bg)
		PitchFrame["Mover"].surround:SetTexture(PitchTextures.Mover.U.surround)
		PitchFrame["Mover"].bg:SetTexCoord(0, 1, 1, 0)
		PitchFrame["Mover"].surround:SetTexCoord(0, 1, 1, 0)
		PitchFrame["Limit"].bg:SetTexture(PitchTextures.Limit.bg)
		PitchFrame["Limit"].surround:SetTexture(PitchTextures.Limit.surround)
		PitchFrame["Limit"].bg:SetTexCoord(0, 1, 1, 0)
		PitchFrame["Limit"].surround:SetTexCoord(0, 1, 1, 0)
		PitchFrame["Limit"]:SetPoint("CENTER", PitchFrame, "CENTER", 0, floor(-(PitchHeight / 2) - 12))
		PitchFrame["Limit"]:Show()
		
		PitchDirection = -1
	end
end

---- VISIBILITY
-- Fade In/Out the Pitch display
function Pitch:Fade(val)
	if val then
		UIFrameFadeIn(PitchFrame, 0, 1, 1)
		PitchFaded = false
	else
		UIFrameFadeOut(PitchFrame, 0.5, 1, 0)
		PitchFaded = true
	end
end

-- Show/Hide the Pitch display
function Pitch:UpdateShown(shown)
	if shown then
		PitchFrame:Show()
		PitchVisible = true
	else
		PitchFrame:Hide()
		PitchVisible = false
	end
end

---- FRAME UPDATES
-- Set Colors
function Pitch:UpdateColors()
	local classColor = (CUSTOM_CLASS_COLORS and CUSTOM_CLASS_COLORS[E.myclass] or RAID_CLASS_COLORS[E.myclass])

	for i, v in pairs(PitchElements) do
		PitchFrame[v].bg:SetVertexColor(classColor.r, classColor.g, classColor.b, db.appearance.opacity.background)
		PitchFrame[v].surround:SetVertexColor(1, 1, 1, db.appearance.opacity.surround)
	end
end

-- Set Position
function Pitch:UpdatePosition()
	PitchFrame:ClearAllPoints()
	PitchFrame:SetPoint("CENTER", UIParent, "CENTER", db.position.x, db.position.y)
end

-- Frame Creation
local function CreateArtFrame(parent)
	local NewArtFrame
	NewArtFrame = CreateFrame("Frame", nil, parent)
	NewArtFrame:SetParent(parent)
	NewArtFrame.surround = NewArtFrame:CreateTexture(nil, "ARTWORK")
	NewArtFrame.surround:SetAllPoints()
	NewArtFrame.bg = NewArtFrame:CreateTexture(nil, "ARTWORK")
	NewArtFrame.bg:SetAllPoints(NewArtFrame)
	return NewArtFrame
end

local function CreateFrames()
	if not PitchFrame then
		-- Main
		PitchFrame = CreateFrame("Frame", "RealUIPitch", UIParent)
	--	PitchFrame:SetParent(RealUIPositionersCenter)
		PitchFrame:SetFrameStrata("MEDIUM")
		PitchFrame:SetFrameLevel(0)
		PitchFrame:SetHeight(PitchHeight)
		PitchFrame:SetWidth(100)
		PitchFrame:Hide()
		
		-- Elements
		for i, v in pairs(PitchElements) do
			PitchFrame[v] = CreateArtFrame(PitchFrame)
			PitchFrame[v]:ClearAllPoints()
			PitchFrame[v]:SetPoint("CENTER", PitchFrame, "CENTER", 0, 0)
			PitchFrame[v]:SetFrameStrata("MEDIUM")
			PitchFrame[v]:SetFrameLevel(0)
			PitchFrame[v]:SetWidth(64)
			PitchFrame[v]:SetHeight(64)
		end
		PitchFrame["Mover"]:SetFrameLevel(1)
		PitchFrame["Limit"].bg:SetTexture(ArrowLarge)
	end
end

function Pitch:RefreshMod()
	if not PitchFrame then
		CreateFrames()
	end
	PitchTimer:Show()
	self:UpdatePosition()
	self:UpdateColors()
end

function Pitch:PLAYER_ENTERING_WORLD()
	self:RefreshMod()
	self:UnregisterEvent('PLAYER_ENTERING_WORLD')
end

---- INITIALIZE
function Pitch:Initialize()
	self:Toggle(E.db.euiscript.pitch)
end

function Pitch:Toggle(toggle)
	if toggle then
		self:RegisterEvent("PLAYER_ENTERING_WORLD")
		
		if IsLoggedIn() then
			self:RefreshMod()
			PitchTimer:SetScript("OnUpdate", PitchTimerUpdate)
		end
	else
		if PitchFrame then
			PitchFrame:Hide()
			PitchTimer:Hide()
			PitchTimer:SetScript("OnUpdate", nil)
		end	
	end
end

E:RegisterModule(Pitch:GetName())