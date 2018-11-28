local E, L, V, P, G = unpack(ElvUI);
local BUIB = E:NewModule('BuiBags', 'AceHook-3.0', 'AceEvent-3.0');
local B = E:GetModule('Bags')

local _G = _G

local NUM_CONTAINER_FRAMES = NUM_CONTAINER_FRAMES

-- GLOBALS: hooksecurefunc

local SPACING = (E.PixelMode and 1 or 5)
local BORDER = E.Border;

function BUIB:StyleBags()
	if ElvUI_ContainerFrame then
		ElvUI_ContainerFrame:Style('Outside')
		ElvUI_ContainerFrameContainerHolder:Style('Outside')
	end

	if ElvUI_ContainerFrameContainerHolder then
		ElvUI_ContainerFrameContainerHolder:Point('BOTTOMLEFT', ElvUI_ContainerFrame.style, 'TOPLEFT', 0, SPACING + BORDER)
	end

	if ElvUIBags then
		ElvUIBags.backdrop:Style('Outside')
		ElvUIBags.backdrop:SetTemplate('Transparent')
	end
end

function BUIB:OpenBankBags()
	if ElvUI_BankContainerFrame then
		ElvUI_BankContainerFrame:Style('Outside')
		ElvUI_BankContainerFrameContainerHolder:Style('Outside')
	end

	if ElvUI_BankContainerFrameContainerHolder then
		ElvUI_BankContainerFrameContainerHolder:Point('BOTTOMLEFT', ElvUI_BankContainerFrame.style, 'TOPLEFT', 0, SPACING + BORDER)
	end
end

function BUIB:SkinBlizzBags()
	if E.private.skins.blizzard.enable ~= true or E.private.skins.blizzard.bags ~= true or E.private.bags.enable then return end

	for i = 1, NUM_CONTAINER_FRAMES, 1 do
		local container = _G['ContainerFrame'..i]
		if container.backdrop then
			container.backdrop:Style('Inside')
		end
	end
	if BankFrame then
		BankFrame:Style('Outside')
	end
end

function BUIB:AllInOneBags()
	self:StyleBags()
	self:RegisterEvent('BANKFRAME_OPENED', 'OpenBankBags')
end

function BUIB:Initialize()
	if E.db.benikui.general.benikuiStyle ~= true then return end
	self:AllInOneBags()
	self:SkinBlizzBags()
	self:OpenBankBags()
end

local function InitializeCallback()
	BUIB:Initialize()
end

E:RegisterModule(BUIB:GetName(), InitializeCallback)