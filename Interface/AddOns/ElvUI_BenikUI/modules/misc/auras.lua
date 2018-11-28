local E, L, V, P, G, _ = unpack(ElvUI);
local A = E:GetModule('Auras');
local BUI = E:GetModule('BenikUI');

local unpack = unpack

local UnitAura = UnitAura

if E.private.auras.enable ~= true then return end
if E.private.auras.masque.buffs or E.private.auras.masque.debuffs then return end

A.CreateIconBui = A.CreateIcon
function A:CreateIcon(button)
	self:CreateIconBui(button)
	if E.db.benikui.general.auras then
		button:Style('Inside', _, true)
	elseif E.db.benikui.general.benikuiStyle and E.db.benikui.general.shadows then
		if not button.shadow then
			button:CreateSoftShadow()
		end
	end
end

A.UpdateAuraBui = A.UpdateAura
function A:UpdateAura(button, index)
	self:UpdateAuraBui(button, index)
	if E.db.benikui.general.auras ~= true then return end

	local filter = button:GetParent():GetAttribute('filter')
	local unit = button:GetParent():GetAttribute('unit')
	local name = UnitAura(unit, index, filter)

	if(name) then
		if E.db.benikui.general.benikuiStyle == true then
			button.texture:SetTexCoord(unpack(BUI.TexCoords))
		end

		if filter == 'HARMFUL' then
			local color = DebuffTypeColor[dtype or ""]
			if button.style then
				button.style:SetBackdropBorderColor(color.r, color.g, color.b)
			end
		else
			if button.style then
				button.style:SetBackdropBorderColor(unpack(E.media.bordercolor))
			end
		end
	end
end