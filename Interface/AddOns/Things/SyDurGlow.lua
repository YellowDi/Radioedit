--------------------------
-- SyDurGlow.lua
-- Author: CN-°¢ÂüÄá-DeathKnight-ÈÊÕßŸo”³:YY132359
-- Date: 2017/9/10
-- ÄÍ¾Ã¶ÈÏÔÊ¾
--------------------------
local  q, vl
local _G = getfenv(0)
local SlotDurStrs = {}
local items = {
	"Head 1",
	"Neck",
	"Shoulder 2",
	"Shirt",
	"Chest 3",
	"Waist 4",
	"Legs 5",
	"Feet 6",
	"Wrist 7",
	"Hands 8",
	"Finger0",
	"Finger1",
	"Trinket0",
	"Trinket1",
	"Back",
	"MainHand 9",
	"SecondaryHand 10",
	"Tabard",
}

local function GetMoneyString(value)
	local copper = mod(value, 100)
	local gold = floor(value / 10000)
	local silver = mod(floor(value / 100), 100)

	if gold > 0 then
		return format(" "..GOLD_AMOUNT_TEXTURE.." "..SILVER_AMOUNT_TEXTURE.." "..COPPER_AMOUNT_TEXTURE, gold,0,0, silver,0,0, copper,0,0)
	elseif silver > 0 then
		return format(" "..SILVER_AMOUNT_TEXTURE.." "..COPPER_AMOUNT_TEXTURE, silver,0,0, copper,0,0)
	else
		return format(" "..COPPER_AMOUNT_TEXTURE, copper,0,0)
	end
end

-------------------------------- Durability show ---------------------------------

local tooltip = CreateFrame("GameTooltip")
tooltip:SetOwner(WorldFrame, "ANCHOR_NONE")

PaperDollFrame:CreateFontString("SyDurRepairCost", "ARTWORK", "NumberFontNormal")
SyDurRepairCost:SetPoint("BOTTOMLEFT", "PaperDollFrame", "BOTTOMLEFT", 8, 13)

local function GetDurStrings(name)
	if(not SlotDurStrs[name]) then
		local slot = _G["Character" .. name .. "Slot"]
		SlotDurStrs[name] = slot:CreateFontString(nil, "OVERLAY", "NumberFontNormal")
		SlotDurStrs[name]:SetPoint("CENTER", slot, "BOTTOM", 0, 8)
	end
	return SlotDurStrs[name]
end

local function UpdateDurability()
	local durcost = 0

	for id, vl in pairs(items) do
		local slot, index = string.split(" ", vl)
		if index then
			local has, _, cost = tooltip:SetInventoryItem("player", id);
			local value, max = GetInventoryItemDurability(id)
			local SlotDurStr = GetDurStrings(slot)
			if(has and value and max and max ~= 0) then
				local percent = value / max				
				SlotDurStr:SetText('')
				if(ceil(percent * 100) < 100)then
					SlotDurStr:SetTextColor(1 - percent, percent, 0)
					SlotDurStr:SetText(ceil(percent * 100) .. "%")
				end
				durcost = durcost + cost
			else
				 SlotDurStr:SetText("")
			end
		end
	end

	SyDurRepairCost:SetText(GetMoneyString(durcost))
end

----------------------------------- Event --------------------------------------

local f = CreateFrame("Frame")
f:Hide()
f:RegisterEvent("UNIT_INVENTORY_CHANGED")
f:RegisterEvent("UPDATE_INVENTORY_DURABILITY")

f:SetScript("OnEvent", function(self, event, ...)
	if event == "UPDATE_INVENTORY_DURABILITY" then
		UpdateDurability()
	elseif event == "UNIT_INVENTORY_CHANGED" then
		UpdateDurability()
	end	
end)
