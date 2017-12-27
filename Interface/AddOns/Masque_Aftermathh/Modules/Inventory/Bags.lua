local A, C, M, L = select(2, ...):unpack()

if C.Bags.InventoryMod then else return end

local Bags = CreateFrame("Frame")

local Bag = _G["ContainerFrame1"]
local Bank = _G["BankFrameItem1"]
local ReagentBankFrame = _G["ReagentBankFrame"]
local BankFrame = _G["BankFrame"]
local BagHelpBox = _G["BagHelpBox"]
local ContainerFrame_GetOpenFrame = _G["ContainerFrame_GetOpenFrame"]
local Token1, Token2, Token3 = _G["BackpackTokenFrameToken1"], _G["BackpackTokenFrameToken2"], _G["BackpackTokenFrameToken3"]
local NUM_CONTAINER_FRAMES = NUM_CONTAINER_FRAMES
local NUM_BAG_FRAMES = NUM_BAG_FRAMES
local LastButtonBag, LastButtonBank, LastButtonReagent

local ReplaceBags = 0
local ButtonSize = 32
local ButtonSpacing = 4
local ItemsPerRow = 12

local Font = C.Media.Font
local Font2 = C.Media.Font2

local Noop = function() end

local BlizzardBags = {
	CharacterBag0Slot,
	CharacterBag1Slot,
	CharacterBag2Slot,
	CharacterBag3Slot,
}

local BlizzardBank = {
	BankSlotsFrame["Bag1"],
	BankSlotsFrame["Bag2"],
	BankSlotsFrame["Bag3"],
	BankSlotsFrame["Bag4"],
	BankSlotsFrame["Bag5"],
	BankSlotsFrame["Bag6"],
	BankSlotsFrame["Bag7"],
}

function Bags:SkinBagButton()
	local Name = self:GetName()
	local Quest = _G[Name.."IconQuestTexture"]
	local Border = self.IconBorder
	local BattlePay = self.BattlepayItemTexture

	if (Quest) then Quest:SetAlpha(0) end
	if (Border) then Border:SetAlpha(0) end
	if (BattlePay) then BattlePay:SetAlpha(0) end
	
	if (self.IsSkinned) then
		return
	end
   
	self:SetNormalTexture("")
	self:SetPushedTexture("")
	
	local Count = _G[Name.."Count"]
	Count:ClearAllPoints()
	Count:Point("BOTTOMRIGHT", -2, 4)
	Count:SetFontTemplate(Font2, 12)

	local Icon = _G[Name.."IconTexture"]
	Icon:SetTexCoord(unpack(A.TexCoords))
	
	self:CreateButtonPanel(true, ButtonSize, ButtonSize)
	self:CreateButtonBackdrop()
    self:StyleButton()
	
	self.IsSkinned = true
end

function Bags:HideBlizzard()
	local TokenFrame = _G["BackpackTokenFrame"]
	local Inset = _G["BankFrameMoneyFrameInset"]
	local Border = _G["BankFrameMoneyFrameBorder"]
	local BankClose = _G["BankFrameCloseButton"]
	local BankPortraitTexture = _G["BankPortraitTexture"]
	local BankSlotsFrame = _G["BankSlotsFrame"]

	TokenFrame:GetRegions():SetAlpha(0)
	Inset:Hide()
	Border:Hide()
	BankClose:Hide()
	BankPortraitTexture:Hide()
	BagHelpBox:Kill()
	BankFrame:EnableMouse(false)

	for i = 1, 12 do
		local CloseButton = _G["ContainerFrame"..i.."CloseButton"]
		CloseButton:Hide()

		for k = 1, 7 do
			local Container = _G["ContainerFrame"..i]
			select(k, Container:GetRegions()):SetAlpha(0)
		end
	end

	for i = 1, BankFrame:GetNumRegions() do
		local Region = select(i, BankFrame:GetRegions())
		Region:SetAlpha(0)
	end

	for i = 1, BankSlotsFrame:GetNumRegions() do
		local Region = select(i, BankSlotsFrame:GetRegions())
		Region:SetAlpha(0)
	end

	for i = 1, 2 do
		local Tab = _G["BankFrameTab"..i]
		Tab:Hide()
	end
end

function Bags:CreateReagentContainer()
	local Reagent = CreateFrame("Frame", "ReagentBank", UIParent)
	local SwitchBankButton = CreateFrame("Button", nil, Reagent)
	local SortButton = CreateFrame("Button", nil, Reagent)
	local NumButtons = ReagentBankFrame.size
	local NumRows, LastRowButton, NumButtons, LastButton = 0, ReagentBankFrameItem1, 1, ReagentBankFrameItem1
	local Deposit = ReagentBankFrame.DespositButton

	Reagent:SetWidth(((ButtonSize + ButtonSpacing) * ItemsPerRow) + 22 - ButtonSpacing)
	Reagent:SetPoint("BOTTOM", UIParent, 0, 162)
	Reagent:SetFrameStrata(self.Bank:GetFrameStrata())
	Reagent:SetFrameLevel(self.Bank:GetFrameLevel())
	Reagent:CreateBackdrop()

	ReagentBankFrame:StripTexture()
	ReagentBankFrame:SetParent(Reagent)
	ReagentBankFrame:ClearAllPoints()
	ReagentBankFrame:SetAllPoints()
	
	SwitchBankButton:Size((Reagent:GetWidth() / 2) - 1, 23)
	SwitchBankButton:SkinButton()
	SwitchBankButton:Point("BOTTOMLEFT", Reagent, "TOPLEFT", 0, 2)
	SwitchBankButton:SetScript("OnClick", function()
		Reagent:Hide()
		self.Bank:Show()
		BankFrame_ShowPanel(BANK_PANELS[1].name)

		for i = 5, 11 do
			if (not IsBagOpen(i)) then
				self:OpenBag(i, 1)
			end
		end
	end)

	local SwitchBankButtonText = SwitchBankButton:CreateFontString(nil, "OVERLAY")
	SwitchBankButtonText:SetFontTemplate(Font, 12)
	SwitchBankButtonText:SetPoint("CENTER")
	SwitchBankButtonText:SetText("Switch to: "..BANK)
	SwitchBankButtonText:SetTextColor(1.0, 0.82, 0)
	
	Deposit:SetParent(Reagent)
	Deposit:ClearAllPoints()
	Deposit:Size(Reagent:GetWidth(), 23)
	Deposit:Point("BOTTOMLEFT", SwitchBankButton, "TOPLEFT", 0, 2)
	Deposit:SkinButton()

	SortButton:Size((Reagent:GetWidth() / 2) - 1, 23)
	SortButton:SetPoint("LEFT", SwitchBankButton, "RIGHT", 2, 0)
	SortButton:SkinButton()
	SortButton:SetScript("OnClick", BankFrame_AutoSortButtonOnClick)
	
	local SortButtonText = SortButton:CreateFontString(nil, "OVERLAY")
	SortButtonText:SetFontTemplate(Font, 12)
	SortButtonText:SetPoint("CENTER")
	SortButtonText:SetText(BAG_FILTER_CLEANUP)
	SortButtonText:SetTextColor(1.0, 0.82, 0)

	for i = 1, 98 do
		local Button = _G["ReagentBankFrameItem"..i]	
		Button:ClearAllPoints()
		Button:SetWidth(ButtonSize)
		Button:SetHeight(ButtonSize)
	
		if (i == 1) then
			Button:SetPoint("TOPLEFT", Reagent, "TOPLEFT", 10, -10)
			LastRowButton = Button
			LastButton = Button
		elseif (NumButtons == ItemsPerRow) then
			Button:SetPoint("TOPRIGHT", LastRowButton, "TOPRIGHT", 0, -(ButtonSpacing + ButtonSize))
			Button:SetPoint("BOTTOMLEFT", LastRowButton, "BOTTOMLEFT", 0, -(ButtonSpacing + ButtonSize))
			LastRowButton = Button
			NumRows = NumRows + 1
			NumButtons = 1
		else
			Button:SetPoint("TOPRIGHT", LastButton, "TOPRIGHT", (ButtonSpacing + ButtonSize), 0)
			Button:SetPoint("BOTTOMLEFT", LastButton, "BOTTOMLEFT", (ButtonSpacing + ButtonSize), 0)
			NumButtons = NumButtons + 1
		end
		
		Bags.SkinBagButton(Button)
		self:SlotUpdate(-3, Button)
		
		LastButton = Button
	end

	Reagent:SetHeight(((ButtonSize + ButtonSpacing) * (NumRows + 1) + 20) - ButtonSpacing)
	Reagent:SetScript("OnHide", function()
		ReagentBankFrame:Hide()
	end)

	local Unlock = ReagentBankFrameUnlockInfo
	local UnlockButton = ReagentBankFrameUnlockInfoPurchaseButton

	Unlock:StripTexture()
	Unlock:SetAllPoints(Reagent)
	Unlock:CreateBackdrop()
	UnlockButton:SkinButton()

	self.Reagent = Reagent
	self.Reagent.SwitchBankButton = SwitchBankButton
	self.Reagent.SortButton = SortButton
end

function Bags:CreateContainer(storagetype, ...)
	local Container = CreateFrame("Frame", storagetype, UIParent)
	Container:SetWidth(((ButtonSize + ButtonSpacing) * ItemsPerRow) + 22 - ButtonSpacing)
	Container:Point(...)
	Container:SetFrameStrata("MEDIUM")
	Container:SetFrameLevel(50)
	Container:CreateBackdrop()
	Container:Hide()

	if (storagetype == "Bag") then
		local Sort = BagItemAutoSortButton
		local BagsContainer = CreateFrame("Frame", nil, UIParent)
		local ToggleBagsContainer = CreateFrame("Button")

		BagsContainer:SetParent(Container)
		BagsContainer:SetWidth(10)
		BagsContainer:SetHeight(10)
		BagsContainer:SetPoint("BOTTOMRIGHT", Container, "TOPRIGHT", 0, 27)
		BagsContainer:Hide()
		BagsContainer:CreateBackdrop()

		Sort:Size(Container:GetWidth(), 23)
		Sort:ClearAllPoints()
		Sort:SetPoint("BOTTOMLEFT", Container, "TOPLEFT", 0, 2)
		Sort:SetFrameLevel(Container:GetFrameLevel())
		Sort:SetFrameStrata(Container:GetFrameStrata())
		Sort:StripTexture()
		Sort:SkinButton()
		
		local SortText = Sort:CreateFontString(nil, "OVERLAY")
		SortText:SetFontTemplate(Font, 12)
		SortText:SetPoint("CENTER")
		SortText:SetText(BAG_FILTER_CLEANUP)
		SortText:SetTextColor(1.0, 0.82, 0)
		
		Sort.ClearAllPoints = Noop
		Sort.SetPoint = Noop

		ToggleBagsContainer:SetHeight(20)
		ToggleBagsContainer:SetWidth(20)
		ToggleBagsContainer:SkinCloseButton()
		ToggleBagsContainer:SetPoint("TOPRIGHT", Container, "TOPRIGHT", -6, -6)
		ToggleBagsContainer:SetParent(Container)
		ToggleBagsContainer:EnableMouse(true)
	
		ToggleBagsContainer:SetScript("OnMouseUp", function(self, button)
			local Purchase = BankFramePurchaseInfo

			if (button == "RightButton") then
				local BanksContainer = Bags.Bank.BagsContainer
				local Purchase = BankFramePurchaseInfo
				local ReagentButton = Bags.Bank.ReagentButton

				if (ReplaceBags == 0) then
					ReplaceBags = 1
					BagsContainer:Show()
					BanksContainer:Show()
					BanksContainer:ClearAllPoints()

					if Purchase:IsShown() then
						BanksContainer:SetPoint("BOTTOMLEFT", Purchase, "TOPLEFT", 50, 2)
					else
						BanksContainer:SetPoint("BOTTOMLEFT", ReagentButton, "TOPLEFT", 0, 2)
					end
				else
					ReplaceBags = 0
					BagsContainer:Hide()
					BanksContainer:Hide()
				end
			else
				CloseAllBags()
				CloseBankBagFrames()
				CloseBankFrame()
				--PlaySound("igBackPackClose")
			end
		end)

		for _, Button in pairs(BlizzardBags) do
			Button:SetWidth(ButtonSize)
			Button:SetHeight(ButtonSize)
			
			Button:SetParent(BagsContainer)
			Button:ClearAllPoints()
			
			Button:SkinButton()
			
			Button:SetPushedTexture("")
			Button:SetCheckedTexture("")
	
			local Icon = _G[Button:GetName().."IconTexture"]
			Icon:SetTexCoord(unpack(A.TexCoords))
			
			Button.IconBorder:SetAlpha(0)

			if (LastButtonBag) then
				Button:SetPoint("LEFT", LastButtonBag, "RIGHT", ButtonSpacing, 0)
			else
				Button:SetPoint("TOPLEFT", BagsContainer, "TOPLEFT", ButtonSpacing, -ButtonSpacing)
			end

			LastButtonBag = Button
			BagsContainer:SetWidth((ButtonSize * getn(BlizzardBags)) + (ButtonSpacing * (getn(BlizzardBags) + 1)))
			BagsContainer:SetHeight(ButtonSize + (ButtonSpacing * 2))
		end

		Container.BagsContainer = BagsContainer
		Container.CloseButton = ToggleBagsContainer
		Container.SortButton = Sort
	else
		local PurchaseButton = BankFramePurchaseButton
		local CostText = BankFrameSlotCost
		local TotalCost = BankFrameDetailMoneyFrame
		local Purchase = BankFramePurchaseInfo
		local SortButton = CreateFrame("Button", nil, Container)
		local BankBagsContainer = CreateFrame("Frame", nil, Container)

		CostText:ClearAllPoints()
		CostText:SetPoint("BOTTOMLEFT", 60, 10)
		TotalCost:ClearAllPoints()
		TotalCost:SetPoint("LEFT", CostText, "RIGHT", 0, 0)
		PurchaseButton:ClearAllPoints()
		PurchaseButton:SetPoint("BOTTOMRIGHT", -10, 10)
		PurchaseButton:SkinButton()
		BankItemAutoSortButton:Hide()

		local SwitchReagentButton = CreateFrame("Button", nil, Container)
		SwitchReagentButton:Size((Container:GetWidth() / 2) - 1, 23)
		SwitchReagentButton:SkinButton()
		SwitchReagentButton:Point("BOTTOMLEFT", Container, "TOPLEFT", 0, 2)
		
		local SwitchReagentButtonText = SwitchReagentButton:CreateFontString(nil, "OVERLAY")
		SwitchReagentButtonText:SetFontTemplate(C.Media.Font, 12)
		SwitchReagentButtonText:SetPoint("CENTER")
		SwitchReagentButtonText:SetText("Switch to: "..REAGENT_BANK)
		SwitchReagentButtonText:SetTextColor(1.0, 0.82, 0)
		
		SwitchReagentButton:SetScript("OnClick", function()
			BankFrame_ShowPanel(BANK_PANELS[2].name)

			if (not ReagentBankFrame.isMade) then
				self:CreateReagentContainer()
				ReagentBankFrame.isMade = true
			else
				self.Reagent:Show()
			end

			for i = 5, 11 do
				self:CloseBag(i)
			end
		end)

		SortButton:Size((Container:GetWidth() / 2) - 1, 23)
		SortButton:SetPoint("LEFT", SwitchReagentButton, "RIGHT", 2, 0)
		SortButton:SkinButton()

		local SortButtonText = SortButton:CreateFontString(nil, "OVERLAY")
		SortButtonText:SetFontTemplate(C.Media.Font, 12)
		SortButtonText:SetPoint("CENTER")
		SortButtonText:SetText(BAG_FILTER_CLEANUP)
		SortButtonText:SetTextColor(1.0, 0.82, 0)
		
		SortButton:SetScript("OnClick", BankFrame_AutoSortButtonOnClick)

		Purchase:ClearAllPoints()
		Purchase:SetWidth(Container:GetWidth() + 50)
		Purchase:SetHeight(70)
		Purchase:SetPoint("BOTTOMLEFT", SwitchReagentButton, "TOPLEFT", -50, 6)
		Purchase:CreateBackdrop()

		BankBagsContainer:Size(Container:GetWidth(), BankSlotsFrame.Bag1:GetHeight() + ButtonSpacing + ButtonSpacing)
		BankBagsContainer:CreateBackdrop()
		BankBagsContainer:SetPoint("BOTTOMLEFT", SwitchReagentButton, "TOPLEFT", 0, 2)
		BankBagsContainer:SetFrameLevel(Container:GetFrameLevel())
		BankBagsContainer:SetFrameStrata(Container:GetFrameStrata())

		for i = 1, 7 do
			local Bag = BankSlotsFrame["Bag"..i]
			Bag:SetWidth(ButtonSize)
			Bag:SetHeight(ButtonSize)
			Bag:SkinButton()
			
			Bag:SetParent(BankBagsContainer)
			Bag:ClearAllPoints()
			
			Bag.HighlightFrame:Kill()
			Bag.IconBorder:SetAlpha(0)

			Bag.icon:SetTexCoord(unpack(A.TexCoords))

			if (i == 1) then
				Bag:SetPoint("TOPLEFT", BankBagsContainer, "TOPLEFT", ButtonSpacing, -ButtonSpacing)
			else
				Bag:SetPoint("LEFT", BankSlotsFrame["Bag"..i-1], "RIGHT", ButtonSpacing, 0)
			end
		end

		BankBagsContainer:SetWidth((ButtonSize * 7) + (ButtonSpacing * (7 + 1)))
		BankBagsContainer:SetHeight(ButtonSize + (ButtonSpacing * 2))
		BankBagsContainer:Hide()

		BankFrame:EnableMouse(false)

		Container.BagsContainer = BankBagsContainer
		Container.ReagentButton = SwitchReagentButton
		Container.SortButton = SortButton
	end

	self[storagetype] = Container
end

function Bags:SetBagsSearchPosition()
	local BagItemSearchBox = BagItemSearchBox
	local BankItemSearchBox = BankItemSearchBox

	BagItemSearchBox:SetParent(self.Bag)
	BagItemSearchBox:SetWidth(self.Bag:GetWidth() - (ButtonSpacing + ButtonSpacing + ButtonSpacing + ButtonSpacing))
	BagItemSearchBox:ClearAllPoints()
	BagItemSearchBox:SetPoint("BOTTOMLEFT", self.Bag, "BOTTOMLEFT", ButtonSpacing - 1, ButtonSpacing * 4)
	BagItemSearchBox:StripTexture()
	BagItemSearchBox.SetParent = Noop
	BagItemSearchBox.ClearAllPoints = Noop
	BagItemSearchBox.SetPoint = Noop
	
	local BagItemSearchBoxBackdrop = CreateFrame("Frame", nil, BagItemSearchBox)
	BagItemSearchBoxBackdrop:SetPoint("TOPLEFT", 6, 4)
	BagItemSearchBoxBackdrop:SetPoint("BOTTOMRIGHT", 2, -4)
	BagItemSearchBoxBackdrop:CreateBackdrop(true)
	BagItemSearchBoxBackdrop:SetFrameLevel(BagItemSearchBox:GetFrameLevel() - 1)

	BankItemSearchBox:Hide()
end

function Bags:SetTokensPosition()
	local Money = ContainerFrame1MoneyFrame

	Token1:ClearAllPoints()
	Token1:SetPoint("TOPRIGHT", self.Bag, -24*4, -14)
	
	Token2:ClearAllPoints()
	Token2:SetPoint("TOPRIGHT", self.Bag, -26*6, -14)
	
	Token3:ClearAllPoints()
	Token3:SetPoint("TOPRIGHT", self.Bag, -28*8, -14)
end

function Bags:SkinTokens()
	ContainerFrame1MoneyFrameGoldButtonText:SetFontTemplate(Font, 12)
	ContainerFrame1MoneyFrameSilverButtonText:SetFontTemplate(Font, 12)
	ContainerFrame1MoneyFrameCopperButtonText:SetFontTemplate(Font, 12)

	for i = 1, 3 do
		local Token = _G["BackpackTokenFrameToken"..i]
		Token:SetFrameStrata("HIGH")
		Token:SetFrameLevel(5)

		local Icon = _G["BackpackTokenFrameToken"..i.."Icon"]
		Icon:SetTexCoord(unpack(A.TexCoords))
		
		local Count = _G["BackpackTokenFrameToken"..i.."Count"]
		Count:SetFontTemplate(Font, 12)
	end
end

function Bags:SlotUpdate(id, Button)
	if not (Button) then
		return
	end

	local ItemLink = GetContainerItemLink(id, Button:GetID())
	local Texture, Count, Lock, Quality, _, _, _, _, _, ItemID = GetContainerItemInfo(id, Button:GetID())
	local IsNewItem = C_NewItems.IsNewItem(id, Button:GetID())
	
	if (Button.ItemID == ItemID) then 
		return 
	end
	
	Button.ItemID = ItemID
	
	local QuestItem, QuestID, IsActive = GetContainerItemQuestInfo(id, Button:GetID())
	local NewItem = Button.NewItemTexture
	local IconQuestTexture = Button.IconQuestTexture

	if IconQuestTexture then IconQuestTexture:SetAlpha(0) end
	
	if (NewItem) then
		NewItem:SetTexture("Interface\\Buttons\\WHITE8x8")
		NewItem:SetInside(Button, 1, 1)
	end
	
	Button:CreateButtonPanel(true, ButtonSize, ButtonSize)
	
	if (QuestItem or QuestID or IsActive) then
		Button.ButtonPanel:SetColorTemplate(1.0, 0.82, 0)
	elseif (ItemLink) then
		local Rarity = select(3, GetItemInfo(ItemLink)) or 0
		Button.ButtonPanel:SetColorTemplate(GetItemQualityColor(Rarity))
	else
		Button.ButtonPanel:SetColorTemplate(unpack(C.General.BorderColor))
	end
end

function Bags:BagUpdate(id)
	local Size = GetContainerNumSlots(id)
	for Slot = 1, Size do
		local Button = _G["ContainerFrame"..(id + 1).."Item"..Slot]
		if (Button) then
			if not Button:IsShown() then
				Button:Show()
			end
			self:SlotUpdate(id, Button)
		end
	end
end

function Bags:UpdateAllBags()
	local NumRows, LastRowButton, NumButtons, LastButton = 0, ContainerFrame1Item1, 1, ContainerFrame1Item1
	local FirstButton

	for Bag = 5, 1, -1 do
		local ID = Bag - 1
		local Slots = GetContainerNumSlots(ID)

		for Item = Slots, 1, -1 do
			local Button = _G["ContainerFrame"..Bag.."Item"..Item]
			local Money = ContainerFrame1MoneyFrame

			if not FirstButton then
				FirstButton = Button
			end

			Button:ClearAllPoints()
			Button:SetWidth(ButtonSize)
			Button:SetHeight(ButtonSize)
			Button:SetFrameStrata("HIGH")
			Button:SetFrameLevel(2)
	
			Money:ClearAllPoints()
			Money:Show()
			Money:SetPoint("TOPLEFT", Bags.Bag, "TOPLEFT", 12, -12)
			Money:SetFrameStrata("HIGH")
			Money:SetFrameLevel(2)

			if (Button == FirstButton) then
				Button:SetPoint("TOPLEFT", Bags.Bag, "TOPLEFT", 10, -40)
				LastRowButton = Button
				LastButton = Button
			elseif (NumButtons == ItemsPerRow) then
				Button:SetPoint("TOPRIGHT", LastRowButton, "TOPRIGHT", 0, -(ButtonSpacing + ButtonSize))
				Button:SetPoint("BOTTOMLEFT", LastRowButton, "BOTTOMLEFT", 0, -(ButtonSpacing + ButtonSize))
				LastRowButton = Button
				NumRows = NumRows + 1
				NumButtons = 1
			else
				Button:SetPoint("TOPRIGHT", LastButton, "TOPRIGHT", (ButtonSpacing + ButtonSize), 0)
				Button:SetPoint("BOTTOMLEFT", LastButton, "BOTTOMLEFT", (ButtonSpacing + ButtonSize), 0)
				NumButtons = NumButtons + 1
			end

			Bags.SkinBagButton(Button)

			LastButton = Button
		end

		Bags:BagUpdate(ID)
	end

	Bags.Bag:SetHeight(((ButtonSize + ButtonSpacing) * (NumRows + 1) + 54 + BagItemSearchBox:GetHeight() + (ButtonSpacing * 4)) - ButtonSpacing)
end

function Bags:UpdateAllBankBags()
	local NumRows, LastRowButton, NumButtons, LastButton = 0, ContainerFrame1Item1, 1, ContainerFrame1Item1
	for Bank = 1, 28 do
		local Button = _G["BankFrameItem"..Bank]
		local Money = ContainerFrame2MoneyFrame
		local BankFrameMoneyFrame = BankFrameMoneyFrame

		Button:ClearAllPoints()
		Button:SetWidth(ButtonSize)
		Button:SetHeight(ButtonSize)
		Button:SetFrameStrata("HIGH")
		Button:SetFrameLevel(2)
		Button.IconBorder:SetAlpha(0)

		BankFrameMoneyFrame:Hide()

		if (Bank == 1) then
			Button:SetPoint("TOPLEFT", Bags.Bank, "TOPLEFT", 10, -10)
			LastRowButton = Button
			LastButton = Button
		elseif (NumButtons == ItemsPerRow) then
			Button:SetPoint("TOPRIGHT", LastRowButton, "TOPRIGHT", 0, -(ButtonSpacing + ButtonSize))
			Button:SetPoint("BOTTOMLEFT", LastRowButton, "BOTTOMLEFT", 0, -(ButtonSpacing + ButtonSize))
			LastRowButton = Button
			NumRows = NumRows + 1
			NumButtons = 1
		else
			Button:SetPoint("TOPRIGHT", LastButton, "TOPRIGHT", (ButtonSpacing + ButtonSize), 0)
			Button:SetPoint("BOTTOMLEFT", LastButton, "BOTTOMLEFT", (ButtonSpacing + ButtonSize), 0)
			NumButtons = NumButtons + 1
		end

		Bags.SkinBagButton(Button)
		Bags.SlotUpdate(self, -1, Button)

		LastButton = Button
	end

	for Bag = 6, 12 do
		local Slots = GetContainerNumSlots(Bag - 1)
		for Item = Slots, 1, -1 do
			local Button = _G["ContainerFrame"..Bag.."Item"..Item]

			Button:ClearAllPoints()
			Button:SetWidth(ButtonSize)
			Button:SetHeight(ButtonSize)
			Button:SetFrameStrata("HIGH")
			Button:SetFrameLevel(2)
			Button.IconBorder:SetAlpha(0)

			if (NumButtons == ItemsPerRow) then
				Button:SetPoint("TOPRIGHT", LastRowButton, "TOPRIGHT", 0, -(ButtonSpacing + ButtonSize))
				Button:SetPoint("BOTTOMLEFT", LastRowButton, "BOTTOMLEFT", 0, -(ButtonSpacing + ButtonSize))
				LastRowButton = Button
				NumRows = NumRows + 1
				NumButtons = 1
			else
				Button:SetPoint("TOPRIGHT", LastButton, "TOPRIGHT", (ButtonSpacing+ButtonSize), 0)
				Button:SetPoint("BOTTOMLEFT", LastButton, "BOTTOMLEFT", (ButtonSpacing+ButtonSize), 0)
				NumButtons = NumButtons + 1
			end

			Bags.SkinBagButton(Button)
			Bags.SlotUpdate(self, Bag - 1, Button)

			LastButton = Button
		end
	end

	Bags.Bank:SetHeight(((ButtonSize + ButtonSpacing) * (NumRows + 1) + 20) - ButtonSpacing)
end

function Bags:OpenBag(id)
	if (not CanOpenPanels()) then
		if (UnitIsDead("player")) then NotWhileDeadError() end
		return
	end

	local Size = GetContainerNumSlots(id)
	local OpenFrame = ContainerFrame_GetOpenFrame()
	for i = 1, Size, 1 do
		local Index = Size - i + 1
		local Button = _G[OpenFrame:GetName().."Item"..i]

		Button:SetID(Index)
		Button:Show()
	end

	OpenFrame.size = Size
	OpenFrame:SetID(id)
	OpenFrame:Show()
	if (id == 4) then Bags:UpdateAllBags() elseif (id == 11) then Bags:UpdateAllBankBags() end
end

function Bags:OpenBag(id)
	if (not CanOpenPanels()) then
		if (UnitIsDead("player")) then
			NotWhileDeadError()
		end
		return
	end

	local Size = GetContainerNumSlots(id)
	local OpenFrame = ContainerFrame_GetOpenFrame()

	for i = 1, Size, 1 do
		local Index = Size - i + 1
		local Button = _G[OpenFrame:GetName().."Item"..i]
		Button:SetID(Index)
		Button:Show()
	end

	OpenFrame.size = Size
	OpenFrame:SetID(id)
	OpenFrame:Show()

	if (id == 4) then
		Bags:UpdateAllBags()
	elseif (id == 11) then
		Bags:UpdateAllBankBags()
	end
end

function Bags:CloseBag(id)
	CloseBag(id)
end

function Bags:OpenAllBags()
	self:OpenBag(0, 1)
	for i = 1, 4 do
		self:OpenBag(i, 1)
	end

	if IsBagOpen(0) then
		self.Bag:Show()
	end
end

function Bags:OpenAllBankBags()
	local Bank = BankFrame
	if Bank:IsShown() then
		self.Bank:Show()
		for i = 5, 11 do
			if (not IsBagOpen(i)) then
				self:OpenBag(i, 1)
			end
		end
	end
end

function Bags:CloseAllBags()
	if MerchantFrame:IsVisible() or InboxFrame:IsVisible() then
		return
	end
	CloseAllBags()
	--PlaySound("igBackPackClose")
end

function Bags:CloseAllBankBags()
	local Bank = BankFrame
	if (Bank:IsVisible()) then
		CloseBankBagFrames()
		CloseBankFrame()
	end
end

function Bags:ToggleBags()
	if (self.Bag:IsShown() and BankFrame:IsShown()) and (not self.Bank:IsShown())  and (not ReagentBankFrame:IsShown()) then
		self:OpenAllBankBags()
		return
	end

	if (self.Bag:IsShown() or self.Bank:IsShown()) then
		if MerchantFrame:IsVisible() or InboxFrame:IsVisible() then
			return
		end
		self:CloseAllBags()
		self:CloseAllBankBags()
		return
	end

	if not self.Bag:IsShown() then
		self:OpenAllBags()
	end

	if not self.Bank:IsShown() and BankFrame:IsShown() then
		self:OpenAllBankBags()
	end
end

function Bags:OnEvent(event, ...)
	if (event == "BAG_UPDATE") then
		self:BagUpdate(...)
	elseif (event == "BAG_CLOSED") then		
		local Bag = ... + 1
		local Container = _G["ContainerFrame"..Bag]
		local Size = Container.size
		for i = 1, Size do
			local Button = _G["ContainerFrame"..Bag.."Item"..i]
			
			if Button then
				Button:Hide()
			end
		end
		self:CloseAllBags()
		self:CloseAllBankBags()
	elseif (event == "PLAYERBANKSLOTS_CHANGED") then
		local ID = ...
		if ID <= 28 then
			local Button = _G["BankFrameItem"..ID]
			if (Button) then
				self:SlotUpdate(-1, Button)
			end
		end
	elseif (event == "PLAYERREAGENTBANKSLOTS_CHANGED") then
		local ID = ...
		local Button = _G["ReagentBankFrameItem"..ID]
		if (Button) then
			self:SlotUpdate(-3, Button)
		end
	end
end

function Bags:Enable()
	SetSortBagsRightToLeft(false)
	SetInsertItemsLeftToRight(false)

	Bags:CreateContainer("Bag", "BOTTOMRIGHT", UIParent, -9, 21)
	Bags:CreateContainer("Bank", "BOTTOMLEFT", UIParent, 9, 21)
	Bags:HideBlizzard()
	Bags:SetBagsSearchPosition()
	Bags:SetTokensPosition()
	Bags:SkinTokens()

	Bag:SetScript("OnHide", function()
		self.Bag:Hide()

		if self.Reagent and self.Reagent:IsShown() then
			self.Reagent:Hide()
		end
	end)

	Bank:SetScript("OnHide", function()
		self.Bank:Hide()
	end)

	BankFrame:HookScript("OnHide", function()
		if self.Reagent and self.Reagent:IsShown() then
			self.Reagent:Hide()
		end
	end)

	function UpdateContainerFrameAnchors() end
	function ToggleBag() ToggleAllBags() end
	function ToggleBackpack() ToggleAllBags() end
	function OpenAllBags() ToggleAllBags() end
	function OpenBackpack() ToggleAllBags() end
	function ToggleAllBags() self:ToggleBags() end

	self:RegisterEvent("BAG_UPDATE")
	self:RegisterEvent("PLAYERBANKSLOTS_CHANGED")
	self:RegisterEvent("PLAYERREAGENTBANKSLOTS_CHANGED")
	self:RegisterEvent("BAG_CLOSED")
	self:SetScript("OnEvent", self.OnEvent)

	ToggleAllBags()
	ToggleAllBags()
end

Bags:RegisterEvent("PLAYER_LOGIN")
Bags:RegisterEvent("PLAYER_ENTERING_WORLD")
Bags:RegisterEvent("ADDON_LOADED")

Bags:SetScript("OnEvent", function(self, event, AddOn)
	if (event == "PLAYER_LOGIN") then
		Bags:Enable()
	end
end)