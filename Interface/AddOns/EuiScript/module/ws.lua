local E, L, V, P, G, _ = unpack(ElvUI); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB, Localize Underscore
local WS = E:NewModule("WS", 'AceEvent-3.0');
local LSM = LibStub("LibSharedMedia-3.0")

local GetSpellInfo = GetSpellInfo
local select, tostring, select = select, tostring, select
local floor = math.floor
local UnitClass = UnitClass
local IsInRaid = IsInRaid
local GetInstanceInfo = GetInstanceInfo
local GetNumGroupMembers = GetNumGroupMembers
local GetRaidRosterInfo = GetRaidRosterInfo
local UnitAura = UnitAura
local UnitHealthMax = UnitHealthMax
local UnitHealth =UnitHealth
local UnitPower = UnitPower
local GetTime = GetTime
local GetSpecialization = GetSpecialization
local InCombatLockdown = InCombatLockdown
local UnitLevel = UnitLevel
local SPELL_POWER_CHI = SPELL_POWER_CHI

local buffName, _, buffIcon = GetSpellInfo(115151)
local buffSpell = GetSpellInfo(116680)
local buffSpell2 = GetSpellInfo(116670)--  镇魂引
local class = select(2, UnitClass("player"));

local function Update(self)
	if not IsInRaid() then
		if self:GetAlpha() > 0 then
			self:SetAlpha(0)
		end
		return;
	end
	
	local inInstance, instanceType = IsInInstance()
	local _, _, _, _, maxPlayers, _, _ = GetInstanceInfo()
	local raidNum = GetNumGroupMembers()
	if inInstance and instanceType == "raid" then raidNum = maxPlayers end	
	local num = 0;
	local Expires;
	local count = 0;
	for i = 1, raidNum do
		local name, _, subgroup = GetRaidRosterInfo(i)
		if subgroup <= floor(raidNum / 5) then
			local unit = "raid"..i
			local name,_,_,_,_,_,exipres,u = UnitAura(unit,buffName)
			if name and u == 'player' then		
				num = num + 1;
				local damage = UnitHealthMax(u) - UnitHealth(u)
				if damage >= E.db.euiscript.wsbutton.healthValue then
					count = count + 1
				end
				
				if not Expires then
					Expires = exipres
				elseif Expires > exipres then
					Expires = exipres
				elseif Expires <= GetTime() then
					Expires = nil
				end
			end			
		end
	end
	local cp = UnitPower("player", SPELL_POWER_CHI)
	if (count >= E.db.euiscript.wsbutton.count) then
		self.text2:SetText(count == 0 and '' or buffSpell2..':'..tostring(count))
	else
		self.text2:SetText('')
	end
	if cp >= 2 then
		self.text2:SetTextColor(0,1,.25)
	else
		self.text2:SetTextColor(.62,0,0)
	end
	self.text:SetText(num == 0 and '' or tostring(num))
	if Expires then
		local t = Expires - GetTime()
		if t >= 6 then
			self.time:SetFormattedText('%s', tostring(floor(t)))
		else
			self.time:SetFormattedText('%.1f', t)
		end
	else
		self.time:SetText('')
	end
	if num == 0 then self:SetAlpha(0) else self:SetAlpha(1) end
end

function WS:Toggle()
	if E.db.euiscript.wsbutton.enable and GetSpecialization() == 2 then
		EuiMonkHeal:SetScript("OnUpdate", Update);
	else
		EuiMonkHeal:SetScript("OnUpdate", nil);
		EuiMonkHeal:SetAlpha(0);
	end
	self:UpdateSize()
end

function WS:PLAYER_REGEN_ENABLED()
	self.button:Size(E.db.euiscript.wsbutton.size)
	self:UnregisterEvent('PLAYER_REGEN_ENABLED')
end

function WS:UpdateSize()
	if InCombatLockdown() then
		self:RegisterEvent('PLAYER_REGEN_ENABLED')
	else
		self.button:Size(E.db.euiscript.wsbutton.size)
	end
	self.button.time:SetFont(LSM:Fetch("font", E.db.unitframe.font), E.db.euiscript.wsbutton.fontsize * .7, 'OUTLINE')
	self.button.text:SetFont(LSM:Fetch("font", E.db.unitframe.font), E.db.euiscript.wsbutton.fontsize, 'OUTLINE')
	self.button.text2:SetFont(LSM:Fetch("font", E.db.unitframe.font), E.db.euiscript.wsbutton.fontsize, 'OUTLINE')
end

function WS:Initialize()
	if class ~= 'MONK' then return end;
	if(UnitLevel('player') < 90) then return; end
	
	self:RegisterEvent("PLAYER_TALENT_UPDATE", "Toggle")
	
	local f = CreateFrame("Button", "EuiMonkHeal", UIParent, "SecureActionButtonTemplate")
	f:RegisterForClicks('AnyUp')
	f:SetTemplate("Default")
	f:StyleButton()
	f:SetFrameLevel(5)
	f:SetAlpha(0)
	f:Size(E.db.euiscript.wsbutton.size)
	f:Point("CENTER", UIParent, "CENTER", -400, 0)
	self.button = f

	f.Icon = f:CreateTexture(nil, 'ARTWORK')
	f.Icon:Point("TOPLEFT", 2, -2)
	f.Icon:Point("BOTTOMRIGHT", -2, 2)
	f.Icon:SetTexCoord(.08, .92, .08, .92)
	f.Icon:SetTexture(buffIcon)

	f.time = f:CreateFontString(nil, 'OVERLAY')
	f.time:FontTemplate(LSM:Fetch("font", E.db.unitframe.font), E.db.euiscript.wsbutton.fontsize * .7, 'OUTLINE')
	f.time:Point("BOTTOMRIGHT", f, "BOTTOMRIGHT", 0, 0)
	f.time:SetTextColor(1,1,0)

	f.text = f:CreateFontString(nil, 'OVERLAY')
	f.text:FontTemplate(LSM:Fetch("font", E.db.unitframe.font), E.db.euiscript.wsbutton.fontsize, 'OUTLINE')
	f.text:Point("CENTER", f, "CENTER", 0, 2)
	
	f.text2 = f:CreateFontString(nil, 'OVERLAY')
	f.text2:FontTemplate(LSM:Fetch("font", E.db.unitframe.font), E.db.euiscript.wsbutton.fontsize+2, 'OUTLINE')
	f.text2:Point("TOP", f, "BOTTOM", 0, -2)	
	f.text2:SetJustifyH("CENTER")
	
	f:SetAttribute("type1", "spell")
	f:SetAttribute("spell1", buffSpell)
	
	E:CreateMover(f, "EuiMonkHealMover", buffName, nil, nil, nil, "ALL,EUI", function() return E.db.euiscript.wsbutton.enable; end)
	
	self:Toggle()
end

E:RegisterModule(WS:GetName())