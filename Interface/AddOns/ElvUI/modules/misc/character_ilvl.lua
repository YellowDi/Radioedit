local E, L, V, P, G = unpack(select(2, ...)); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB
local ItemUpgradeInfo = LibStub("LibItemUpgradeInfo-1.0")

----------------------------------------------------------------------------------------
--	Item level on slot buttons in Character/InspectFrame(by Tukz)
----------------------------------------------------------------------------------------
local slots = {
	"HeadSlot", "NeckSlot", "ShoulderSlot", "BackSlot", "ChestSlot", "ShirtSlot", "TabardSlot",
	"WristSlot", "MainHandSlot", "SecondaryHandSlot", "HandsSlot", "WaistSlot",
	"LegsSlot", "FeetSlot", "Finger0Slot", "Finger1Slot", "Trinket0Slot", "Trinket1Slot"
}

local function CreateButtonsText(frame)
	for _, slot in pairs(slots) do
		local button = _G[frame..slot]
		button.t = button:CreateFontString(nil, "OVERLAY", "SystemFont_Outline_Small")
		button.t:SetPoint("TOPRIGHT", button, "TOPRIGHT", -1, -2)
		button.t:SetText("")
	end
end

local isClose = false
local function UpdateButtonsText(frame)
	if frame == "Inspect" and not InspectFrame:IsShown() then return end

	if isClose then return; end

	if not E.db.euiscript.char_ilvl then
		for _, slot in pairs(slots) do
			local text = _G[frame..slot].t
			text:SetText('')
		end
		isClose = true;
		return;
	else
		isClose = false;
	end

	local unit, itemM, itemS, itemMlv, itemSlv, itemMMax
	if frame == "Inspect" then
		unit = "target"
	else
		unit = "player"
	end
	itemM = GetInventoryItemLink(unit, 16)
	itemS = GetInventoryItemLink(unit, 17)
	itemMlv = itemM and ItemUpgradeInfo:GetUpgradedItemLevel(itemM) or 0
	itemSlv = itemS and ItemUpgradeInfo:GetUpgradedItemLevel(itemS) or 0
	itemMMax = (itemMlv > itemSlv) and itemMlv or itemSlv

	for _, slot in pairs(slots) do
		local id = GetInventorySlotInfo(slot)
		local text = _G[frame..slot].t
		local item

		item = GetInventoryItemLink(unit, id)

		if slot == "ShirtSlot" or slot == "TabardSlot" then
			text:SetText("")
		elseif item then
			local oldilevel = text:GetText()
			local _, _, q, ilevel = GetItemInfo(item)

			if ilevel then
				if q == 6 and ilevel == 750 and (id == 16 or id == 17) then--修正神器副手itemLink字串不含升级物品信息的问题
					text:SetText("|cFFFFFF00".. itemMMax)
				else				
					if ilevel ~= oldilevel then
						if ilevel == 1 then
							text:SetText("")
						else
							text:SetText("|cFFFFFF00".. ItemUpgradeInfo:GetUpgradedItemLevel(item))
						end
					end
				end
			else
				text:SetText("")
			end
		else
			text:SetText("")
		end
	end
end

local OnEvent = CreateFrame("Frame")
OnEvent:RegisterEvent("PLAYER_LOGIN")
OnEvent:RegisterEvent("PLAYER_EQUIPMENT_CHANGED")
OnEvent:SetScript("OnEvent", function(self, event)
	if event == "PLAYER_LOGIN" then
		CreateButtonsText("Character")
		UpdateButtonsText("Character")
		self:UnregisterEvent("PLAYER_LOGIN")
		CharacterFrame:HookScript("OnShow", function(self) UpdateButtonsText("Character") end)
	elseif event == "PLAYER_EQUIPMENT_CHANGED" then
		UpdateButtonsText("Character")
	else
		UpdateButtonsText("Inspect")
	end
end)

local OnLoad = CreateFrame("Frame")
OnLoad:RegisterEvent("ADDON_LOADED")
OnLoad:SetScript("OnEvent", function(self, event, addon)
	if addon == "Blizzard_InspectUI" then
		CreateButtonsText("Inspect")
		InspectFrame:HookScript("OnShow", function(self) UpdateButtonsText("Inspect") end)
		OnEvent:RegisterEvent("UNIT_INVENTORY_CHANGED")
		OnEvent:RegisterEvent("PLAYER_TARGET_CHANGED")
		OnEvent:RegisterEvent("INSPECT_READY")
		self:UnregisterEvent("ADDON_LOADED")
	end
end)