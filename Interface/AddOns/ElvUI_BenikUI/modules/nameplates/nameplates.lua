local E, L, V, P, G = unpack(ElvUI);
local BUI = E:GetModule('BenikUI');
local NP = E:GetModule('NamePlates')
local mod = E:NewModule('BuiNameplates', 'AceHook-3.0');

function mod:NameplateShadows(frame, useMainFrame)
	local parent = frame

	if(parent:GetObjectType() == "Texture") then
		parent = frame:GetParent()
	end

	if useMainFrame then
		parent:CreateSoftShadow()
		return
	end

	parent.backdrop:CreateSoftShadow()
end


function mod:Initialize()
	if not BUI.ShadowMode then return end
	hooksecurefunc(NP, 'StyleFrame', mod.NameplateShadows)
end

local function InitializeCallback()
	mod:Initialize()
end

E:RegisterModule(mod:GetName(), InitializeCallback)