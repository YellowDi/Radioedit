local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('Postal') then return end

function AS:Postal(event, addon)
	if event == 'PLAYER_ENTERING_WORLD' then return end

	InboxPrevPageButton:SetPoint('CENTER', InboxFrame, 'BOTTOMLEFT', 45, 112)
	InboxNextPageButton:SetPoint('CENTER', InboxFrame, 'BOTTOMLEFT', 295, 112)

	for i = 1, INBOXITEMS_TO_DISPLAY do
		local b = _G['MailItem'..i..'ExpireTime']
		if b then
			b:SetPoint('TOPRIGHT', 'MailItem'..i, 'TOPRIGHT', -5, -10)
			if b.returnicon then
				b.returnicon:SetPoint('TOPRIGHT', b, 'TOPRIGHT', 20, 0)
			end
		end
		if _G['PostalInboxCB'..i] then
			AS:SkinCheckBox(_G['PostalInboxCB'..i])
		end
	end

	if PostalSelectOpenButton then
		AS:SkinButton(PostalSelectOpenButton, true)
		PostalSelectOpenButton:SetPoint('RIGHT', InboxFrame, 'TOP', -41, -48)
	end

	if Postal_OpenAllMenuButton then
		AS:SkinNextPrevButton(Postal_OpenAllMenuButton, true)
		Postal_OpenAllMenuButton:SetPoint('LEFT', PostalOpenAllButton, 'RIGHT', 5, 0)
	end

	if PostalOpenAllButton then
		AS:SkinButton(PostalOpenAllButton, true)
		PostalOpenAllButton:SetPoint('CENTER', InboxFrame, 'TOP', -34, -400)
	end

	if PostalSelectReturnButton then
		AS:SkinButton(PostalSelectReturnButton, true)
		PostalSelectReturnButton:SetPoint('LEFT', InboxFrame, 'TOP', -5, -48)
	end

	if Postal_ModuleMenuButton then
		AS:SkinNextPrevButton(Postal_ModuleMenuButton, true)
		Postal_ModuleMenuButton:SetPoint('TOPRIGHT', MailFrame, -53, -6)
	end

	if Postal_BlackBookButton then
		AS:SkinNextPrevButton(Postal_BlackBookButton, true)
		Postal_BlackBookButton:SetPoint('LEFT', SendMailNameEditBox, 'RIGHT', 5, 2)
	end

	AS:UnregisterSkinEvent('Postal', event)
end

AS:RegisterSkin('Postal', AS.Postal, 'MAIL_SHOW')