
-------------------------------------
-- 物品等級顯示 Author: M
-------------------------------------

local LibEvent = LibStub:GetLibrary("LibEvent.7000")
local LibSchedule = LibStub:GetLibrary("LibSchedule.7000")
local LibItemInfo = LibStub:GetLibrary("LibItemInfo.7000")

local ARMOR = ARMOR or "Armor"
local RELICSLOT = RELICSLOT or "Relic"
local ARTIFACT_POWER = ARTIFACT_POWER or "Artifact"

--框架
local function GetItemLevelFrame(self)
    if (not self.ItemLevelFrame) then
        local fontAdjust = GetLocale():sub(1,2) == "zh" and 0 or -3
        self.ItemLevelFrame = CreateFrame("Frame", nil, self)
        self.ItemLevelFrame:SetFrameLevel(8)
        self.ItemLevelFrame:SetSize(self:GetSize())
        self.ItemLevelFrame:SetPoint("CENTER")
        self.ItemLevelFrame.levelString = self.ItemLevelFrame:CreateFontString(nil, "OVERLAY")
        self.ItemLevelFrame.levelString:SetFont(STANDARD_TEXT_FONT, 14+fontAdjust, "OUTLINE")
        self.ItemLevelFrame.levelString:SetPoint("TOP")
        self.ItemLevelFrame.levelString:SetTextColor(1, 0.82, 0)
        self.ItemLevelFrame.slotString = self.ItemLevelFrame:CreateFontString(nil, "OVERLAY")
        self.ItemLevelFrame.slotString:SetFont(STANDARD_TEXT_FONT, 10+fontAdjust, "OUTLINE")
        self.ItemLevelFrame.slotString:SetPoint("BOTTOMRIGHT", 1, 2)
        self.ItemLevelFrame.slotString:SetTextColor(1, 1, 1)
        self.ItemLevelFrame.slotString:SetJustifyH("RIGHT")
        self.ItemLevelFrame.slotString:SetWidth(34)
        self.ItemLevelFrame.slotString:SetHeight(0)
        LibEvent:trigger("ITEMLEVEL_FRAME_CREATED", self.ItemLevelFrame, self)
    end
    if (TinyInspectDB and TinyInspectDB.EnableItemLevel) then
        self.ItemLevelFrame:Show()
    else
        self.ItemLevelFrame:Hide()
    end
    return self.ItemLevelFrame
end

--設置裝等文字
local function SetItemLevelString(self, text, quality)
    if (quality and TinyInspectDB and TinyInspectDB.ShowColoredItemLevelString) then
        local r, g, b, hex = GetItemQualityColor(quality)
        text = format("|c%s%s|r", hex, text)
    end
    self:SetText(text)
end

--設置部位文字
local function SetItemSlotString(self, class, equipSlot, link)
    local slotText = ""
    if (TinyInspectDB and TinyInspectDB.ShowItemSlotString) then
        if (equipSlot and string.find(equipSlot, "INVTYPE_")) then
            slotText = _G[equipSlot] or ""
        elseif (class == ARMOR) then
            slotText = class
        elseif (link and IsArtifactPowerItem(link)) then
            slotText = ARTIFACT_POWER
        elseif (link and IsArtifactRelicItem(link)) then
            slotText = RELICSLOT
        end
    end
    self:SetText(slotText)
end

--設置物品等級
local function SetItemLevel(self, link)
    if (not self) then return end
    local frame = GetItemLevelFrame(self)
    if (self.OrigItemLink == link) then
        SetItemLevelString(frame.levelString, self.OrigItemLevel, self.OrigItemQuality)
        SetItemSlotString(frame.slotString, self.OrigItemClass, self.OrigItemEquipSlot, self.OrigItemLink)
    else
        local _, count, level, quality, class, equipSlot
        if (link) then
            count, level, _, _, quality, _, _, class, _, _, equipSlot = LibItemInfo:GetItemInfo(link)
            SetItemLevelString(frame.levelString, level > 0 and level or "", quality)
            SetItemSlotString(frame.slotString, class, equipSlot, link)
        else
            SetItemLevelString(frame.levelString, "")
            SetItemSlotString(frame.slotString)
        end
        self.OrigItemLink = link
        self.OrigItemLevel = (level and level > 0) and level or ""
        self.OrigItemQuality = quality
        self.OrigItemClass = class
        self.OrigItemEquipSlot = equipSlot
    end
end

-- Bag
hooksecurefunc("ContainerFrame_Update", function(self)
    local id = self:GetID()
    local name = self:GetName()
    local button
    for i = 1, self.size do
        button = _G[name.."Item"..i]
        SetItemLevel(button, GetContainerItemLink(id, button:GetID()))
    end
end)

-- Bank
hooksecurefunc("BankFrameItemButton_Update", function(self)
    if (self.isBag) then return end
    SetItemLevel(self, GetContainerItemLink(self:GetParent():GetID(), self:GetID()))
end)

-- Merchant
hooksecurefunc("MerchantFrameItem_UpdateQuality", function(self, link)
    SetItemLevel(self.ItemButton, link)
end)

-- GuildBank
LibEvent:attachEvent("ADDON_LOADED", function(self, addonName)
    if (addonName == "Blizzard_GuildBankUI") then
        hooksecurefunc("GuildBankFrame_Update", function()
            if (GuildBankFrame.mode == "bank") then
                local tab = GetCurrentGuildBankTab()
                local button, index, column
                for i = 1, MAX_GUILDBANK_SLOTS_PER_TAB do
                    index = mod(i, NUM_SLOTS_PER_GUILDBANK_GROUP)
                    if (index == 0) then
                        index = NUM_SLOTS_PER_GUILDBANK_GROUP
                    end
                    column = ceil((i-0.5)/NUM_SLOTS_PER_GUILDBANK_GROUP)
                    button = _G["GuildBankColumn"..column.."Button"..index]
                    SetItemLevel(button, GetGuildBankItemLink(tab, i))
                end
            end
        end)
    end
end)

-- Auction
LibEvent:attachEvent("ADDON_LOADED", function(self, addonName)
    if (addonName == "Blizzard_AuctionUI") then
        hooksecurefunc("AuctionFrameBrowse_Update", function()
            local offset = FauxScrollFrame_GetOffset(BrowseScrollFrame)
            local itemButton
            for i = 1, NUM_BROWSE_TO_DISPLAY do
                itemButton = _G["BrowseButton"..i.."Item"]
                if (itemButton) then
                    SetItemLevel(itemButton, GetAuctionItemLink("list", offset+i))
                end
            end
        end)
        hooksecurefunc("AuctionFrameBid_Update", function()
            local offset = FauxScrollFrame_GetOffset(BidScrollFrame)
            local itemButton
            for i = 1, NUM_BIDS_TO_DISPLAY do
                itemButton = _G["BidButton"..i.."Item"]
                if (itemButton) then
                    SetItemLevel(itemButton, GetAuctionItemLink("bidder", offset+i))
                end
            end
        end)
        hooksecurefunc("AuctionFrameAuctions_Update", function()
            local offset = FauxScrollFrame_GetOffset(AuctionsScrollFrame)
            local tokenCount = C_WowTokenPublic.GetNumListedAuctionableTokens()
            local itemButton
            for i = 1, NUM_AUCTIONS_TO_DISPLAY do
                itemButton = _G["AuctionsButton"..i.."Item"]
                if (itemButton) then
                    SetItemLevel(itemButton, GetAuctionItemLink("owner", offset-tokenCount+i))
                end
            end
        end)
    end
end)

-- ALT
if (EquipmentFlyout_DisplayButton) then
    hooksecurefunc("EquipmentFlyout_DisplayButton", function(button, paperDollItemSlot)
        local location = button.location
        if (not location) then return end
        local player, bank, bags, voidStorage, slot, bag, tab, voidSlot = EquipmentManager_UnpackLocation(location)
        if (not player and not bank and not bags and not voidStorage) then return end
        if (voidStorage) then return end
        local link
        if (bags) then
            link = GetContainerItemLink(bag, slot)
        else
            link = GetInventoryItemLink("player", slot)
        end
        SetItemLevel(button, link)
    end)
end

-- ForAddons: Bagnon Combuctor LiteBag ArkInventory
LibEvent:attachEvent("PLAYER_LOGIN", function()
    -- For Bagnon
    if (Bagnon and Bagnon.ItemSlot) then
        local origFunc = Bagnon.ItemSlot.Update
        function Bagnon.ItemSlot:Update()
            origFunc(self)
            SetItemLevel(self, self:GetItem())
        end
    end
    -- For Combuctor
    if (Combuctor and Combuctor.ItemSlot) then
        local origFunc = Combuctor.ItemSlot.Update
        function Combuctor.ItemSlot:Update()
            origFunc(self)
            SetItemLevel(self, self:GetItem())
        end
    end
    -- For LiteBag
    if (LiteBagItemButton_UpdateItem) then
        hooksecurefunc("LiteBagItemButton_UpdateItem", function(self)
            SetItemLevel(self, GetContainerItemLink(self:GetParent():GetID(), self:GetID()))
        end)
    end
    -- For ArkInventory
    if (ArkInventory and ArkInventory.Frame_Item_Update_Texture) then
        local origFunc = ArkInventory.Frame_Item_Update_Texture
        function ArkInventory.Frame_Item_Update_Texture(button)
            origFunc(button)
            local i = ArkInventory.Frame_Item_GetDB(button)
            if (i) then
                SetItemLevel(button, i.h)
            end
        end
    end
end)

-- GuildNews
LibEvent:attachEvent("ADDON_LOADED", function(self, addonName)
    if (addonName == "Blizzard_GuildUI") then
        GuildNewsItemCache = {}
        hooksecurefunc("GuildNewsButton_SetText", function(button, text_color, text, text1, text2, ...)
            if (text2 and type(text2) == "string") then
                local link = string.match(text2, "|H(item:%d+:.-)|h.-|h")
                if (link) then
                    local level = GuildNewsItemCache[link] or select(2, LibItemInfo:GetItemInfo(link))
                    if (level > 0) then
                        GuildNewsItemCache[link] = level
                        text2 = text2:gsub("(%|Hitem:%d+:.-%|h%[)(.-)(%]%|h)", "%1"..level..":%2%3")
                        button.text:SetFormattedText(text, text1, text2, ...)
                    end
                end
            end
        end)
    end
end)


-------------------
--   PaperDoll  --
-------------------

local function SetPaperDollItemLevel(self, unit)
    if (not self) then return end
    local id = self:GetID()
    local frame = GetItemLevelFrame(self)
    if (unit and self.hasItem) then
        local count, level, _, link, quality = LibItemInfo:GetUnitItemInfo(unit, id)
        SetItemLevelString(frame.levelString, level > 0 and level or "", quality)
        if (id == 16 or id == 17) then
            local _, mlevel, _, _, mquality = LibItemInfo:GetUnitItemInfo(unit, 16)
            local _, olevel, _, _, oquality = LibItemInfo:GetUnitItemInfo(unit, 17)
            if (mlevel > 0 and olevel > 0 and (mquality == 6 or oquality == 6)) then
                SetItemLevelString(frame.levelString, max(mlevel,olevel), mquality or oquality)
            end
        end
    else
        SetItemLevelString(frame.levelString, "")
    end
end

hooksecurefunc("PaperDollItemSlotButton_OnShow", function(self, isBag)
    SetPaperDollItemLevel(self, "player")
end)

hooksecurefunc("PaperDollItemSlotButton_OnEvent", function(self, event, id, ...)
    if (event == "PLAYER_EQUIPMENT_CHANGED" and self:GetID() == id) then
        SetPaperDollItemLevel(self, "player")
    end
end)

LibEvent:attachTrigger("UNIT_INSPECT_READY", function(self, data)
    if (InspectFrame and InspectFrame.unit and UnitGUID(InspectFrame.unit) == data.guid) then
        for _, button in ipairs({
             InspectHeadSlot,InspectNeckSlot,InspectShoulderSlot,InspectBackSlot,InspectChestSlot,InspectWristSlot,
             InspectHandsSlot,InspectWaistSlot,InspectLegsSlot,InspectFeetSlot,InspectFinger0Slot,InspectFinger1Slot,
             InspectTrinket0Slot,InspectTrinket1Slot,InspectMainHandSlot,InspectSecondaryHandSlot
            }) do
            SetPaperDollItemLevel(button, InspectFrame.unit)
        end
    end
end)
