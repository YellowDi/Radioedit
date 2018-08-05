local _, ns = ...
local colors = oUF.colors

local ignorePetSpells = {
	115746, -- Felbolt  (Green Imp)
	3110,	-- firebolt (imp)
	31707,	-- waterbolt (water elemental)
	85692,  -- Doom Bolt
}

------------------------------------------------------------------
--	Channeling ticks, based on Castbars by Xbeeps				--
------------------------------------------------------------------
local CastingBarFrameTicksSet
do
	local GetSpellInfo, GetCombatRatingBonus = GetSpellInfo, GetCombatRatingBonus
	local _, class = UnitClass("player")

	-- Negative means not modified by haste
	local BaseTickDuration = { }
	if class == "WARLOCK" then
		BaseTickDuration[GetSpellInfo(689) or ""] = 1 -- Drain Life
		BaseTickDuration[GetSpellInfo(1120) or ""] = 2 -- Drain Soul
		BaseTickDuration[GetSpellInfo(755) or ""] = 1 -- Health Funnel
		BaseTickDuration[GetSpellInfo(5740) or ""] = 2 -- Rain of Fire
		BaseTickDuration[GetSpellInfo(1949) or ""] = 1 -- Hellfire
		BaseTickDuration[GetSpellInfo(103103) or ""] = 1 -- Malefic Grasp
		BaseTickDuration[GetSpellInfo(108371) or ""] = 1 -- Harvest Life
	elseif class == "DRUID" then
		BaseTickDuration[GetSpellInfo(740) or ""] = 2 -- Tranquility
		BaseTickDuration[GetSpellInfo(16914) or ""] = 1 -- Hurricane
		BaseTickDuration[GetSpellInfo(106996) or ""] = 1 -- Astral STORM
		BaseTickDuration[GetSpellInfo(127663) or ""] = -1 -- Astral Communion
	elseif class == "PRIEST" then
		local mind_flay_TickTime = 1
		if IsSpellKnown(157223) then --Enhanced Mind Flay
			mind_flay_TickTime = 2/3
		end
		BaseTickDuration[GetSpellInfo(47540) or ""] = 1 -- Penance
		BaseTickDuration[GetSpellInfo(15407) or ""] =  mind_flay_TickTime -- Mind Flay
		BaseTickDuration[GetSpellInfo(129197) or ""] = mind_flay_TickTime -- Mind Flay (Insanity)
		BaseTickDuration[GetSpellInfo(48045) or ""] = 1 -- Mind Sear
		BaseTickDuration[GetSpellInfo(179337) or ""] = 1 -- Searing Insanity
		BaseTickDuration[GetSpellInfo(64843) or ""] = 2 -- Divine Hymn
		BaseTickDuration[GetSpellInfo(64901) or ""] = 2 -- Hymn of Hope
	elseif class == "MAGE" then
		BaseTickDuration[GetSpellInfo(10) or ""] = 1 -- Blizzard
		BaseTickDuration[GetSpellInfo(5143) or ""] = 0.4 -- Arcane Missiles
		BaseTickDuration[GetSpellInfo(12051) or ""] = 2 -- Evocation
	elseif class == "MONK" then
		BaseTickDuration[GetSpellInfo(117952) or ""] = 1 -- Crackling Jade Lightning
		BaseTickDuration[GetSpellInfo(113656) or ""] = 1 -- Fists of Fury
		BaseTickDuration[GetSpellInfo(115294) or ""] = -1 -- Mana Tea
	end

	function CastingBarFrameTicksSet(Castbar, unit, name, stop)
		Castbar.ticks = Castbar.ticks or {}
		local function CreateATick()
			local spark = Castbar:CreateTexture(nil, 'OVERLAY', nil, 1)
			spark:SetTexture("Interface\\CastingBar\\UI-CastingBar-Spark")
			spark:SetVertexColor(1, 1, 1, 1)
			spark:SetBlendMode('ADD')
			spark:SetWidth(10)
			table.insert(Castbar.ticks, spark)
			return spark
		end
		for _,tick in ipairs(Castbar.ticks) do
			tick:Hide()
		end
		if (stop) then return end
		if (Castbar) then
			local baseTickDuration = BaseTickDuration[name]
			local tickDuration
			if (baseTickDuration) then
				if (baseTickDuration > 0) then
					local castTime = select(7, GetSpellInfo(2060))
					if (not castTime or (castTime == 0)) then
						castTime = 2500 / (1 + (GetCombatRatingBonus(CR_HASTE_SPELL) or 0) / 100)
					end
					tickDuration = (castTime / 2500) * baseTickDuration
				else
					tickDuration = -baseTickDuration
				end                
			end
			if (tickDuration) then
				local width = Castbar:GetWidth()
				local delta = (tickDuration * width / Castbar.max)
				local i = 1
				while (delta * i) < width do
					if i > #Castbar.ticks then CreateATick() end
					local tick = Castbar.ticks[i]
					tick:SetHeight(Castbar:GetHeight() * 1.5)
					tick:SetPoint("CENTER", Castbar, "LEFT", delta * i, 0)
					tick:Show()
					i = i + 1
				end
			end
		end
	end
end

------------------------------------------------------------------
--						Setup Castbars 							--
------------------------------------------------------------------
local BasePos = {
	boss =		{'TOPRIGHT', 'TOPLEFT', -10, 0},
	arena = 	{'TOPRIGHT', 'TOPLEFT', -30, -10},
}
function ns.CreateCastbars(self)

	local uconfig = ns.config[self.cUnit]
	if not uconfig.cbshow then return end

	local Castbar = ns.CreateStatusBar(self, 'BORDER', self:GetName()..'Castbar')
	Castbar:SetSize(uconfig.cbwidth, uconfig.cbheight)
	Castbar:SetFrameStrata('HIGH')
	ns.CreateBorder(Castbar, 11, 3)

	if (BasePos[self.cUnit]) then
		local point, rpoint, x, y = unpack(BasePos[self.cUnit])
		Castbar:SetPoint(point, self, rpoint, x + uconfig.cboffset[1], y + uconfig.cboffset[2])
	else
		ns.CreateCastbarAnchor(Castbar)
	end

	Castbar.Background = Castbar:CreateTexture(nil, 'BACKGROUND')
	Castbar.Background:SetTexture('Interface\\Buttons\\WHITE8x8')
	Castbar.Background:SetAllPoints(Castbar)

	if (self.cUnit == 'player') then
		local SafeZone = Castbar:CreateTexture(nil, 'BORDER') 
		SafeZone:SetTexture(ns.config.statusbar)
		SafeZone:SetVertexColor(unpack(ns.config.castbarSafezoneColor))
		table.insert(ns.statusbars, SafeZone)
		Castbar.SafeZone = SafeZone

		local Flash = CreateFrame("Frame", nil, Castbar)
		Flash:SetAllPoints(Castbar)

		ns.CreateBorder(Flash, 11, 3)
		Flash:SetBorderTexture('white')
		Flash:SetBorderColor(1, 1, 0.6)
		if (uconfig.cbicon == 'RIGHT') then
			Flash:SetBorderPadding(3, 3, 3, 4 + uconfig.cbheight)
		elseif (uconfig.cbicon == 'LEFT') then
			Flash:SetBorderPadding(3, 3, 4 + uconfig.cbheight, 3)
		end
		Castbar.Flash = Flash
		Castbar.Ticks = ns.config.castbarticks
	end
	
	local Spark = Castbar:CreateTexture(nil, "ARTWORK", nil, 1)
	Spark:SetSize(15, (uconfig.cbheight * 2))
	Spark:SetBlendMode("ADD")	
	Castbar.Spark = Spark

	if (uconfig.cbicon ~= 'NONE') then
		local Icon = Castbar:CreateTexture(nil, 'ARTWORK')
		Icon:SetSize(uconfig.cbheight + 2, uconfig.cbheight + 2)
		Icon:SetTexCoord(0.05, 0.95, 0.05, 0.95)
		if (uconfig.cbicon == 'RIGHT') then
			Icon:SetPoint('LEFT', Castbar, 'RIGHT', 0, 0)
			Castbar:SetBorderPadding(3, 3, 3, 4 + uconfig.cbheight)
		elseif (uconfig.cbicon == 'LEFT') then
			Icon:SetPoint('RIGHT', Castbar, 'LEFT', 0, 0)
			Castbar:SetBorderPadding(3, 3, 4 + uconfig.cbheight, 3)
		end
		Castbar.Icon = Icon
	end

	Castbar.Time = ns.CreateFontString(Castbar, 13, 'RIGHT')
	Castbar.Time:SetPoint('RIGHT', Castbar, -5, 0)

	Castbar.Text = ns.CreateFontString(Castbar, 13, 'LEFT')
	Castbar.Text:SetPoint('LEFT', Castbar, 4, 0)
	Castbar.Text:SetPoint('RIGHT', Castbar.Time, 'LEFT', -8, 0)
	Castbar.Text:SetWordWrap(false)

	Castbar.PostCastStart = ns.PostCastStart
	Castbar.PostCastFailed = ns.PostCastFailed
	Castbar.PostCastInterrupted = ns.PostCastInterrupted
	Castbar.PostCastInterruptible = ns.UpdateCastbarColor
	Castbar.PostCastNotInterruptible = ns.UpdateCastbarColor
	Castbar.PostCastStop = ns.PostStop
	Castbar.PostChannelStop = ns.PostStop
	Castbar.PostChannelStart = ns.PostChannelStart

	self.CCastbar = Castbar
end

function ns.PostCastStart(Castbar, unit, name, castid)
	if (unit == 'pet') then
		Castbar:SetAlpha(1)
		for _, spellID in pairs(ignorePetSpells) do
			if (UnitCastingInfo('pet') == GetSpellInfo(spellID)) then
				Castbar:SetAlpha(0)
			end
		end
	end
	ns.UpdateCastbarColor(Castbar, unit)
	if (Castbar.SafeZone) then
		Castbar.SafeZone:SetDrawLayer("BORDER", -1)
	end
end

function ns.PostCastFailed(Castbar, unit, spellname, castid)
	if (Castbar.Text) then
		Castbar.Text:SetText(FAILED) 
	end
	Castbar:SetStatusBarColor(1, 0, 0) -- Red
	if (Castbar.max) then 
		Castbar:SetValue(Castbar.max)
	end
end

function ns.PostCastInterrupted(Castbar, unit, spellname, castid)
	if (Castbar.Text) then
		Castbar.Text:SetText(INTERRUPTED) 
	end
	Castbar:SetStatusBarColor(1, 0, 0)
	if (Castbar.max) then -- Some spells got trough without castbar
		Castbar:SetValue(Castbar.max)
	end
end

function ns.PostStop(Castbar, unit, spellname, castid)
	--Castbar:SetValue(Castbar.max)
	if (Castbar.Ticks) then
		CastingBarFrameTicksSet(Castbar, unit, name, true)
	end
end

function ns.PostChannelStart(Castbar, unit, name)
	if (unit == 'pet' and Castbar:GetAlpha() == 0) then
		Castbar:SetAlpha(1)
	end

	ns.UpdateCastbarColor(Castbar, unit)
	if Castbar.SafeZone then
		Castbar.SafeZone:SetDrawLayer("BORDER", 1)
	end
	if (Castbar.Ticks) then
		CastingBarFrameTicksSet(Castbar, unit, name)
	end
end

function ns.UpdateCastbarColor(Castbar, unit)
	local color
	local bR, bG, bB = ns.GetPaintColor(0.2)
	local text = 'default'

	if UnitIsUnit(unit, "player") then
		color = colors.class[select(2,UnitClass("player"))]
	elseif Castbar.interrupt then
		color = colors.uninterruptible
		text = 'white'
		bR, bG, bB = 0.8, 0.7, 0.2
	elseif UnitIsFriend(unit, "player") then
		color = colors.reaction[5]
	else
		color = colors.reaction[1]
	end

	Castbar:SetBorderTexture(text)
	Castbar:SetBorderColor(bR, bG, bB)

	local r, g, b = color[1], color[2], color[3]
	Castbar:SetStatusBarColor(r * 0.8, g * 0.8, b * 0.8)
	Castbar.Background:SetVertexColor(r * 0.2, g * 0.2, b * 0.2)
end
