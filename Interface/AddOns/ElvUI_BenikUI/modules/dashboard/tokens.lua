local E, L, V, P, G, _ = unpack(ElvUI);
local BUI = E:GetModule('BenikUI');
local mod = E:GetModule('BuiDashboards');
local DT = E:GetModule('DataTexts');

local getn = getn
local pairs, ipairs = pairs, ipairs
local tinsert, twipe, tsort = table.insert, table.wipe, table.sort

local GameTooltip = _G["GameTooltip"]
local UIFrameFadeIn, UIFrameFadeOut = UIFrameFadeIn, UIFrameFadeOut
local GetCurrencyInfo = GetCurrencyInfo
local IsShiftKeyDown = IsShiftKeyDown

-- GLOBALS: hooksecurefunc

local DASH_HEIGHT = 20
local DASH_SPACING = 3
local SPACING = 1

local classColor = E.myclass == 'PRIEST' and E.PriestColors or (CUSTOM_CLASS_COLORS and CUSTOM_CLASS_COLORS[E.myclass] or RAID_CLASS_COLORS[E.myclass])

local Currency = {
	241,	-- Champion's Seal
	361,	-- Illustrious Jewelcrafter's Token
	391,	-- Tol Barad Commendation
	402,	-- Ironpaw Token
	416,	-- Mark of the World Tree
	515,	-- Darkmoon Prize Ticket
	61,		-- Dalaran Jewelcrafter's Token
	614,	-- Mote of Darkness
	615,	-- Essence of Corrupted Deathwing
	697,	-- Elder Charm of Good Fortune
	738,	-- Lesser Charm of Good Fortune
	752,	-- Mogu Rune of Fate
	776,	-- Warforged Seal
	777,	-- Timeless Coin
	789,	-- Bloody Coin
	81,		-- Epicurean's Award
	
	-- Archaeology
	384,	-- Dwarf Archaeology Fragment
	385,	-- Troll Archaeology Fragment
	393,	-- Fossil Archaeology Fragment
	394,	-- Night Elf Archaeology Fragment
	397,	-- Orc Archaeology Fragment
	398,	-- Draenei Archaeology Fragment
	399,	-- Vrykul Archaeology Fragment
	400,	-- Nerubian Archaeology Fragment
	401,	-- Tol'vir Archaeology Fragment
	676,	-- Pandaren Archaeology Fragment
	677,	-- Mogu Archaeology Fragment
	754,	-- Mantid Archaeology Fragment
	1172,	-- Highborne Archaeology Fragment
	1173,	-- Highmountain Tauren Archaeology Fragment
	1174,	-- Demonic Archaeology Fragment
	1534,	-- Zandalari Archaeology Fragment
	1535,	-- Drust Archaeology Fragment

	-- WoD
	821,	-- Draenor Clans Archaeology Fragment
	828,	-- Ogre Archaeology Fragment
	829,	-- Arakkoa Archaeology Fragment
	824,	-- Garrison Resources
	823,	-- Apexis Crystal (for gear, like the valors)
	994,	-- Seal of Tempered Fate (Raid loot roll)
	980,	-- Dingy Iron Coins (rogue only, from pickpocketing)
	944,	-- Artifact Fragment (PvP)
	1101,	-- Oil
	1129,	-- Seal of Inevitable Fate
	1166, 	-- Timewarped Badge (6.22)
	1191, 	-- Valor Points (6.23)

	-- Legion
	1155,	-- Ancient Mana
	1220,	-- Order Resources
	1275,	-- Curious Coin (Buy stuff :P)
	1226,	-- Nethershard (Invasion scenarios)
	1273,	-- Seal of Broken Fate (Raid)
	1154,	-- Shadowy Coins
	1149,	-- Sightless Eye (PvP)
	1268,	-- Timeworn Artifact (Honor Points?)
	1299,	-- Brawler's Gold
	1314,	-- Lingering Soul Fragment (Good luck with this one :D)
	1342,	-- Legionfall War Supplies (Construction at the Broken Shore)
	1355,	-- Felessence (Craft Legentary items)
	1356,	-- Echoes of Battle (PvP Gear)
	1357,	-- Echoes of Domination (Elite PvP Gear)
	1416,	-- Coins of Air
	1508,	-- Veiled Argunite
	1533,	-- Wakening Essence
	
	-- BfA
	1560, 	-- War Resources
	1565,	-- Rich Azerite Fragment
	1580,	-- Seal of Wartorn Fate
	1587,	-- War Supplies
	1710,	-- Seafarer's Dubloon
}

local function Icon_OnEnter(self)
	local id = self:GetParent().id
	if E.db.dashboards.tokens.tooltip then
		GameTooltip:SetOwner(self, 'ANCHOR_RIGHT', 3, 0);
		GameTooltip:SetCurrencyByID(id)
		GameTooltip:AddLine(' ')
		GameTooltip:AddLine(L['Shift+RightClick to remove'], 0.7, 0.7, 1)
		GameTooltip:Show()
	end

	if E.db.dashboards.tokens.mouseover then
		E:UIFrameFadeIn(BUI_TokensDashboard, 0.2, BUI_TokensDashboard:GetAlpha(), 1)
	end
end

local function Icon_OnLeave(self)
	if E.db.dashboards.tokens.mouseover then
		E:UIFrameFadeIn(BUI_TokensDashboard, 0.2, BUI_TokensDashboard:GetAlpha(), 0)
	end
	GameTooltip:Hide()
end

local function Icon_OnMouseUp(self, btn)
	if btn == "RightButton" then
		if IsShiftKeyDown() then
			local id = self:GetParent().id
			E.private.dashboards.tokens.chooseTokens[id] = false
			mod:UpdateTokens()
		end
	end
end

local function sortFunction(a, b)
	return a.name < b.name
end

function mod:UpdateTokens()
	local db = E.db.dashboards.tokens
	local holder = BUI_TokensDashboard

	if(BUI.TokensDB[1]) then
		for i = 1, getn(BUI.TokensDB) do
			BUI.TokensDB[i]:Kill()
		end
		twipe(BUI.TokensDB)
		holder:Hide()
	end

	if db.mouseover then holder:SetAlpha(0) else holder:SetAlpha(1) end

	holder:SetScript('OnEnter', function(self)
		if db.mouseover then
			E:UIFrameFadeIn(holder, 0.2, holder:GetAlpha(), 1)
		end
	end)

	holder:SetScript('OnLeave', function(self)
		if db.mouseover then
			E:UIFrameFadeOut(holder, 0.2, holder:GetAlpha(), 0)
		end
	end)

	for _, id in pairs(Currency) do
		local name, amount, icon, _, weeklyMax, totalMax, isDiscovered = GetCurrencyInfo(id)

		if name then
			if isDiscovered == false then E.private.dashboards.tokens.chooseTokens[id] = false end

			if E.private.dashboards.tokens.chooseTokens[id] == true then
				if db.zeroamount or amount > 0 then
					holder:Show()
					holder:Height(((DASH_HEIGHT + (E.PixelMode and 1 or DASH_SPACING)) * (#BUI.TokensDB + 1)) + DASH_SPACING + (E.PixelMode and 0 or 2))
					if tokenHolderMover then
						tokenHolderMover:Size(holder:GetSize())
						holder:Point('TOPLEFT', tokenHolderMover, 'TOPLEFT')
					end

					self.tokenFrame = self:CreateDashboard(nil, holder, 'tokens')

					if totalMax == 0 then
						self.tokenFrame.Status:SetMinMaxValues(0, amount)
					else
						if db.weekly and weeklyMax > 0 then
							self.tokenFrame.Status:SetMinMaxValues(0, weeklyMax)
						else
							self.tokenFrame.Status:SetMinMaxValues(0, totalMax)
						end
					end
					self.tokenFrame.Status:SetValue(amount)

					if E.db.dashboards.barColor == 1 then
						self.tokenFrame.Status:SetStatusBarColor(classColor.r, classColor.g, classColor.b)
					else
						self.tokenFrame.Status:SetStatusBarColor(E.db.dashboards.customBarColor.r, E.db.dashboards.customBarColor.g, E.db.dashboards.customBarColor.b)
					end

					if totalMax == 0 then
						self.tokenFrame.Text:SetFormattedText('%s', amount)
					else
						if db.weekly and weeklyMax > 0 then
							self.tokenFrame.Text:SetFormattedText('%s / %s', amount, weeklyMax)
						else
							self.tokenFrame.Text:SetFormattedText('%s / %s', amount, totalMax)
						end
					end

					if E.db.dashboards.textColor == 1 then
						self.tokenFrame.Text:SetTextColor(classColor.r, classColor.g, classColor.b)
					else
						self.tokenFrame.Text:SetTextColor(BUI:unpackColor(E.db.dashboards.customTextColor))
					end

					self.tokenFrame.IconBG:SetScript('OnMouseUp', Icon_OnMouseUp)
					self.tokenFrame.IconBG:SetScript('OnEnter', Icon_OnEnter)
					self.tokenFrame.IconBG:SetScript('OnLeave', Icon_OnLeave)

					self.tokenFrame.IconBG.Icon:SetTexture(icon)

					self.tokenFrame:SetScript('OnEnter', function(self)
						self.Text:SetFormattedText('%s', name)
						if db.mouseover then
							E:UIFrameFadeIn(holder, 0.2, holder:GetAlpha(), 1)
						end
					end)

					self.tokenFrame:SetScript('OnLeave', function(self)
						if totalMax == 0 then
							self.Text:SetFormattedText('%s', amount)
						else
							if db.weekly and weeklyMax > 0 then
								self.Text:SetFormattedText('%s / %s', amount, weeklyMax)
							else
								self.Text:SetFormattedText('%s / %s', amount, totalMax)
							end
						end
						GameTooltip:Hide()
						if db.mouseover then
							E:UIFrameFadeOut(holder, 0.2, holder:GetAlpha(), 0)
						end
					end)

					self.tokenFrame.id = id
					self.tokenFrame.name = name

					tinsert(BUI.TokensDB, self.tokenFrame)
				end
			end
		end
	end

	tsort(BUI.TokensDB, sortFunction)

	for key, frame in pairs(BUI.TokensDB) do
		frame:ClearAllPoints()
		if(key == 1) then
			frame:Point('TOPLEFT', holder, 'TOPLEFT', 0, -SPACING -(E.PixelMode and 0 or 4))
		else
			frame:Point('TOP', BUI.TokensDB[key - 1], 'BOTTOM', 0, -SPACING -(E.PixelMode and 0 or 2))
		end
	end
end

function mod:UpdateTokenSettings()
	mod:FontStyle(BUI.TokensDB)
	mod:FontColor(BUI.TokensDB)
	mod:BarColor(BUI.TokensDB)
end

function mod:TokenEvents()
	self:RegisterEvent('CURRENCY_DISPLAY_UPDATE', 'UpdateTokens')
end

function mod:CreateTokensDashboard()
	local DASH_WIDTH = E.db.dashboards.tokens.width or 150

	self.tokenHolder = self:CreateDashboardHolder('BUI_TokensDashboard', 'tokens')

	if E.db.dashboards.system.enableSystem and BUI_SystemDashboard then
		self.tokenHolder:Point('TOPLEFT', BUI_SystemDashboard, 'BOTTOMLEFT', 0, -10)
	else
		self.tokenHolder:Point('TOPLEFT', E.UIParent, 'TOPLEFT', 2, -30)
	end
	self.tokenHolder:Width(DASH_WIDTH)

	mod:UpdateTokens()
	mod:UpdateTokenSettings()
	mod:UpdateHolderDimensions(self.tokenHolder, 'tokens', BUI.TokensDB)
	mod:ToggleStyle(self.tokenHolder, 'tokens')
	mod:ToggleTransparency(self.tokenHolder, 'tokens')

	E:CreateMover(self.tokenHolder, 'tokenHolderMover', L['Tokens'], nil, nil, nil, 'ALL,BenikUI', nil, 'benikui,dashboards,tokens')
end

function mod:LoadTokens()
	if E.db.dashboards.tokens.enableTokens ~= true then return end

	mod:CreateTokensDashboard()
	mod:TokenEvents()

	hooksecurefunc(DT, 'LoadDataTexts', mod.UpdateTokenSettings)
end