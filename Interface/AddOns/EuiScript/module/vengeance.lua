local E, L, _ = unpack(ElvUI); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB, Localize Underscore
local V = E:NewModule("vengeance", 'AceEvent-3.0');
local LSM = LibStub("LibSharedMedia-3.0")

local GetSpellInfo = GetSpellInfo
local select = select
local UnitClass = UnitClass
local UnitBuff = UnitBuff
local GetSpecialization =GetSpecialization

local buffName, _, buffIcon = GetSpellInfo(158300)
local class = select(2, UnitClass("player"));

local isTank = {
	['DRUID'] = 3,
	['PALADIN'] = 2,
	['WARRIOR'] = 3,
	['DEATHKNIGHT'] = 1,
	['MONK'] = 1,
}

function V:UNIT_AURA(event, unit)
	if event == "UNIT_AURA" and unit ~= "player" then return; end
	local pec, value = select(15, UnitBuff('player', buffName))
	if pec and pec > 0 then
		EuiVegeanceIcon.text:SetText(pec..'%')
	else
		EuiVegeanceIcon.text:SetText('')
	end
	if value and value > 0 then
		EuiVegeanceIcon.text2:SetText(E:ShortValue(value))
	else
		EuiVegeanceIcon.text2:SetText('')
	end	
end

function V:PLAYER_REGEN_ENABLED()
	EuiVegeanceIcon:SetAlpha(0);
end

function V:PLAYER_REGEN_DISABLED()
	EuiVegeanceIcon:SetAlpha(1);
end	

function V:Toggle()
	if E.db.euiscript.vbutton.enable and (isTank[class] == GetSpecialization()) then
		self:RegisterEvent("UNIT_AURA")
		if E.db.euiscript.vbutton.combat then
			self:RegisterEvent("PLAYER_REGEN_ENABLED")
			self:RegisterEvent("PLAYER_REGEN_DISABLED")
			EuiVegeanceIcon:SetAlpha(0);
		else
			EuiVegeanceIcon:SetAlpha(1);
		end
	else
		self:UnregisterEvent("UNIT_AURA")
		self:UnregisterEvent("PLAYER_REGEN_ENABLED")
		self:UnregisterEvent("PLAYER_REGEN_DISABLED")		
		EuiVegeanceIcon:SetAlpha(0);
	end
	self:UpdateSize()
end

function V:UpdateSize()
	self.button:Size(E.db.euiscript.vbutton.size)
	self.button.text:SetFont(LSM:Fetch("font", E.db.unitframe.font), E.db.euiscript.vbutton.fontsize, 'OUTLINE')
end

function V:Initialize()
	if not isTank[class] then return; end
	
	self:RegisterEvent("PLAYER_TALENT_UPDATE", "Toggle")
	
	local f = CreateFrame("Button", "EuiVegeanceIcon", UIParent)
--	f:RegisterForClicks('AnyUp')
	f:SetTemplate("Default")
	f:StyleButton()
	f:SetFrameLevel(5)
	f:SetAlpha(0)
	f:Size(E.db.euiscript.vbutton.size)
	f:Point("CENTER", UIParent, "CENTER", -400, -200)
	self.button = f

	f.Icon = f:CreateTexture(nil, 'ARTWORK')
	f.Icon:Point("TOPLEFT", 2, -2)
	f.Icon:Point("BOTTOMRIGHT", -2, 2)
	f.Icon:SetTexCoord(.08, .92, .08, .92)
	f.Icon:SetTexture(buffIcon)

	f.text = f:CreateFontString(nil, 'OVERLAY')
	f.text:FontTemplate(LSM:Fetch("font", E.db.unitframe.font), E.db.euiscript.vbutton.fontsize, 'OUTLINE')
	f.text:Point("CENTER", f, "CENTER", 0, 1)
	f.text:SetTextColor(1,1,0)
	
	f.text2 = f:CreateFontString(nil, 'OVERLAY')
	f.text2:FontTemplate(LSM:Fetch("font", E.db.unitframe.font), E.db.euiscript.vbutton.fontsize, 'OUTLINE')
	f.text2:Point("TOP", f, "BOTTOM", 0, -2)
	f.text2:SetTextColor(1,1,0)
	
--	f:SetAttribute("type1", "spell")
--	f:SetAttribute("spell1", buffSpell)
	
	E:CreateMover(f, "EuiVegeanceIconMover", buffName, nil, nil, nil, "ALL,EUI", function() return E.db.euiscript.vbutton.enable; end)
	
	self:Toggle()
end

E:RegisterModule(V:GetName())