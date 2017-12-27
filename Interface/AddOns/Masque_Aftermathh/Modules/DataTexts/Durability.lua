local A, C, M, L = select(2, ...):unpack()

if C.DataTexts.Durability then else return end

local DurabilityFrame = CreateFrame("Frame", nil, UIParent)
DurabilityFrame:SetSize(160, 50)
DurabilityFrame:SetPoint(unpack(C.DataTexts.DurabilityPoint))

local DurabilityText = DurabilityFrame:CreateFontString(nil, "OVERLAY")
DurabilityText:SetPoint("CENTER", DurabilityFrame)
DurabilityText:SetFontTemplate(C.Media.Font2, C.DataTexts.FontSize)
DurabilityText:SetTextColor(unpack(C.DataTexts.TextColor))

local Slots = {
	[1] = {1, "Head", 1000},
	[2] = {3, "Shoulder", 1000},
	[3] = {5, "Chest", 1000},
	[4] = {6, "Waist", 1000},
	[5] = {9, "Wrist", 1000},
	[6] = {10, "Hands", 1000},
	[7] = {7, "Legs", 1000},
	[8] = {8, "Feet", 1000},
	[9] = {16, "Main Hand", 1000},
	[10] = {17, "Off Hand", 1000},
	[11] = {18, "Ranged", 1000}
}

local function DurabilityFrameOnEvent(self)
	local Total = 0
	local Current, Max

	for i = 1, 11 do
		if (GetInventoryItemLink("player", Slots[i][1]) ~= nil) then
			Current, Max = GetInventoryItemDurability(Slots[i][1])

			if Current then
				Slots[i][3] = Current / Max
				Total = Total + 1
			end
		end
	end

	table.sort(Slots, function(a, b) return a[3] < b[3] end)

	if (Total > 0) then
		DurabilityText:SetFormattedText("%s: %s", "|CFFFFFFFFDurability|r", floor(Slots[1][3] * 100) .. "%|r")
	else
		DurabilityText:SetFormattedText("%s: %s", "|CFFFFFFFFDurability|r", "100" .. "%|r")
	end

	Total = 0
end

DurabilityFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
DurabilityFrame:RegisterEvent("UPDATE_INVENTORY_DURABILITY")
DurabilityFrame:RegisterEvent("MERCHANT_SHOW")
	
DurabilityFrame:SetScript("OnEvent", DurabilityFrameOnEvent)