local A, C, M, L = select(2, ...):unpack()

if C.Misc.AutoRepairSell then else return end

local AutoRepairSell = CreateFrame("Frame")
AutoRepairSell:RegisterEvent("MERCHANT_SHOW")

AutoRepairSell:SetScript("OnEvent", function()
	if CanMerchantRepair() then
		local Cost = GetRepairAllCost()
		if (Cost > 0 and GetMoney() > Cost) then
			RepairAllItems()
			print(format("|cFFFFFF00Repair Cost Was:|r %.1fg", Cost * 0.0001))
		end
	end

	for Bag = 0, 4 do
		for Slot = 0, GetContainerNumSlots(Bag) do
			local Link = GetContainerItemLink(Bag, Slot)
			
			if Link and (select(3, GetItemInfo(Link)) == 0) then
				UseContainerItem(Bag, Slot)
			end
		end
	end
end)