local E, L, DF = unpack(ElvUI)
local RD = E:NewModule('Resurrect', 'AceEvent-3.0', 'AceTimer-3.0')

local GetSpellInfo = GetSpellInfo
local GetSpellCharges = GetSpellCharges
local tostring = tostring
local floor = math.floor
local mod = mod
local select = select
local CreateFrame = CreateFrame
local IsInInstance = IsInInstance


local SPELLNAME, _, ICONTEXT = GetSpellInfo(20484)
----------------------------------------------------------------------------------------
--	Resurrect cooldowns
--  eui.cc at 2015.1.14
----------------------------------------------------------------------------------------
local function OnUpdate()
	local charges, maxCharges, started, duration = GetSpellCharges(20484) -- Rebirth
	if not charges then
		BattleResAnchor.timer:SetText(SPELLNAME..L['Cooldown Text'])
		BattleResAnchor.num:SetText('')
		return;
	end
	
	BattleResAnchor.num:SetText(tostring(charges))

	local time = duration - (GetTime() - started)
	local m = floor(time/60)
	local s = mod(time, 60)
	BattleResAnchor.timer:SetFormattedText("%d:%02d", m, s)
end

function RD:ZONE_CHANGED_NEW_AREA()
	if select(2, IsInInstance()) == "raid" then
		self:ScheduleRepeatingTimer(OnUpdate, 0.5)
		BattleResAnchor:Show()
	else
		self:CancelAllTimers()
		BattleResAnchor:Hide()
	end
end

function RD:UpdateSetting()
	BattleResAnchor:SetSize(E.db.euiscript.rescd.width, E.db.euiscript.rescd.height)
	BattleResAnchor.Icon:SetSize(E.db.euiscript.rescd.height-4, E.db.euiscript.rescd.height-4)
	BattleResAnchor.num:FontTemplate(nil, E.db.euiscript.rescd.fontsize, 'OUTLINE')
	BattleResAnchor.timer:FontTemplate(nil, E.db.euiscript.rescd.fontsize, 'OUTLINE')
	BattleResAnchor.timer:SetText(SPELLNAME..L['Cooldown Text'])
end

function RD:Toggle()
	if E.db.euiscript.rescd.enable then
		self:RegisterEvent("ZONE_CHANGED_NEW_AREA")
		if select(2, IsInInstance()) == "raid" then
			self:ScheduleRepeatingTimer(OnUpdate, 0.5)
			BattleResAnchor:Show()
		end
	else
		self:UnregisterEvent("ZONE_CHANGED_NEW_AREA")
	end
	self:UpdateSetting()
end

function RD:CreateAnchor()
	local f = CreateFrame("Frame", "BattleResAnchor", UIParent)
	f:Size(E.db.euiscript.rescd.width, E.db.euiscript.rescd.height)
	f:SetTemplate("Transparent")
	f:Point("TOP", 120, -80)
	f:Hide()

	f.Icon = f:CreateTexture(nil, "ARTWORK")
	f.Icon:SetTexCoord(0.08, 0.92, 0.08, 0.92)
	f.Icon:SetTexture(ICONTEXT)
	f.Icon:Point("RIGHT", f, "LEFT", -4, 0)
	f.Icon.bg = CreateFrame("Frame", nil, f)
	f.Icon.bg:SetTemplate("Default")
	f.Icon.bg:SetFrameLevel(f:GetFrameLevel()-1)
	f.Icon.bg:Point("TOPLEFT", f.Icon, "TOPLEFT", -2, 2)
	f.Icon.bg:Point("BOTTOMRIGHT", f.Icon, "BOTTOMRIGHT", 2, -2)
	
	f.num = f:CreateFontString(nil, "OVERLAY")
	f.num:Point("CENTER", f.Icon, "CENTER", 0, 0)
	
	f.timer = f:CreateFontString(nil, "OVERLAY")
	f.timer:Point("LEFT", f, "LEFT", 2, 0)

	E:CreateMover(f, "BattleResAnchorMover", SPELLNAME..L['Cooldown Text'], nil, nil, nil, "ALL,EUI", function() return E.db.euiscript.rescd.enable; end)
end

function RD:Initialize()
	self:CreateAnchor()
	self:Toggle()
end	

E:RegisterModule(RD:GetName())