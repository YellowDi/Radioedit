local A, C, L = select(2, ...):unpack()

if C.Tooltip.TooltipMod then else return end

local Tooltip = _G["GameTooltip"] 

hooksecurefunc(Tooltip, "SetUnitBuff", function(self, ...)
	local ID = select(11, UnitBuff(...))
	if (ID) then
		self:AddLine("SpellID: " .. ID, 0.7, 0.3, 0.7)
		self:Show()
	end
end)

hooksecurefunc(Tooltip, "SetUnitDebuff", function(self, ...)
	local ID = select(11, UnitDebuff(...))
	if (ID) then
		self:AddLine("SpellID: " .. ID, 0.7, 0.3, 0.7)
		self:Show()
	end
end)

hooksecurefunc(Tooltip, "SetUnitAura", function(self, ...)
	local ID = select(11, UnitAura(...))
	if (ID) then
		self:AddLine("SpellID: " .. ID, 0.7, 0.3, 0.7)
		self:Show()
	end
end)

hooksecurefunc("SetItemRef", function(link, text, button, chatFrame)
	if (string.find(link,"^spell:")) then
		local ID = string.sub(link,7)
		ItemRefTooltip:AddLine("SpellID: " .. ID, 0.7, 0.3, 0.7)
		ItemRefTooltip:Show()
	end
end)

Tooltip:HookScript("OnTooltipSetSpell", function(self)
	local ID = select(3,self:GetSpell())
	if (ID) then
		self:AddLine("SpellID: " .. ID, 0.7, 0.3, 0.7)
		self:Show()
	end
end)