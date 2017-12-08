--------------------------
-- SyMerchant.lua
-- Author: CN-阿曼尼-DeathKnight-仁者無敵:YY132359
-- Date: 2017/9/10
-- 自动售卖灰色物品
--------------------------

-- 自定义购买列表 
local CustomBuyList = {
	--[服务器-玩家名称] = {
	--	[物品名称] = 数量,
	--},
}

-- 自定义卖出列表  
local CustomSellList = {
	--[物品名称] = true,
}

local AutoSellJunk = 1		-- 是否自动卖出灰色物品， 0 - 否， 1 - 是
local AutoRepair = 1		-- 是否自动修理， 0 - 否， 1 - 是
local UseGuildBank = 0		-- 是否优先使用公会银行， 0 - 否， 1 - 是
local AuotBuyItems = 1		-- 是否自动购买自定义的物品， 0 - 否， 1 - 是
local MessageToShow = 1		-- 是否具体显示卖出物品列表， 0 - 不显示， 1 - 显示

local item_profit = 0
GameTooltip:HookScript("OnTooltipAddMoney", function(self, amount)
	item_profit = amount
end)

local profile = GetRealmName().." - "..UnitName("player")

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

------------- Sell Junk ----------------

local function SellJunk()
	if not MerchantFrame:IsVisible() or AutoSellJunk == 0 then return 0 end

	local item_num = 0	
	local sum_item_profit = 0
	local bag, slot

	for bag = 0, 4 do
		for slot = 0, GetContainerNumSlots(bag) do
			local link = GetContainerItemLink(bag, slot)
			if link then
				local id = tonumber(link:match'item:(%d+):')
				local _, _, itemname = string.find(link, "^.*%[(.*)%].*$")
				if id then
					if (select(3, GetItemInfo(id)) == 0) or CustomSellList[itemname] then
						local _, item_count = GetContainerItemInfo(bag,slot)
						item_count = item_count or 1
						GameTooltip:SetBagItem(bag, slot)
						sum_item_profit = sum_item_profit + item_profit
						item_num = item_num + 1
						if MessageToShow == 1 then
							DEFAULT_CHAT_FRAME:AddMessage('卖出：' .. link .. '|cFF00FF00x' .. item_count .. '|r ' .. GetMoneyString(item_profit) )
						end
            PickupContainerItem(bag, slot)
            PickupMerchantItem()
					end
				end
			end
		end
	end
	
	if item_num > 0 and sum_item_profit > 0 then
		DEFAULT_CHAT_FRAME:AddMessage('共卖出：|cFF00FF00' .. item_num .. '|r ' .. '件物品，获得：' .. GetMoneyString(sum_item_profit))
	end

	return sum_item_profit
end

------------- Auto Repair ----------------

local function RepairItems()
	if not MerchantFrame:IsVisible() or AutoRepair == 0  or not CanMerchantRepair()  then return 0 end

	local repair_cost, canRepair = GetRepairAllCost()
		
	if canRepair then
		local str = GetMoneyString(repair_cost)
		if UseGuildBank == 1 and IsInGuild() and CanGuildBankRepair() and (GetGuildBankWithdrawMoney() >= repair_cost) and (GetGuildBankMoney() >= repair_cost) then
			RepairAllItems(1)
			str = "公款修理，支出：" .. str
		elseif GetMoney() >= repair_cost then
			RepairAllItems()
			str = "自费修理，支出：" .. str
		else
			DEFAULT_CHAT_FRAME:AddMessage("金钱不足，需修理费：" .. str)
			return 0
		end
		PlaySound(7994, "Master")
		DEFAULT_CHAT_FRAME:AddMessage(str)
	end
	
	return repair_cost
end

------------- Buy Items ----------------

local function BuyItems()
	if not MerchantFrame:IsVisible() or AuotBuyItems == 0 then return 0 end	
	
	local buy_list = 0
	if CustomBuyList[profile] then 
		buy_list = CustomBuyList[profile] 
	else
		return 0 
	end

	local buy_cost = 0
	for name, need in pairs(buy_list) do
		for i=1, GetMerchantNumItems() do
			local link = GetMerchantItemLink(i)
			if(link) then
				local itemid = string.match(link,"item:(%d+):")
				local _, _, itemname = string.find(link, "^.*%[(.*)%].*$")
				if(itemname == name) then					
					local _,_,price = GetMerchantItemInfo(i) 
					local rem = need - GetItemCount(itemid)					
					if(rem <= 0)then break end
					
					local max = GetMerchantItemMaxStack(i)
					while(rem >= max) do
						BuyMerchantItem(i,max)
						buy_cost = buy_cost + price * max
						rem = rem - max
					end 
					if(rem > 0) then
						BuyMerchantItem(i,rem)
						buy_cost = buy_cost + price * rem
					end
					break
				end 
			end 
		end
		
	end

	return buy_cost
end

local f = CreateFrame("Frame")
f:Hide()
f:RegisterEvent("MERCHANT_SHOW")

f:SetScript("OnEvent", function(self, event, ...)
	if event == "MERCHANT_SHOW" then
		local balance = SellJunk() - RepairItems() - BuyItems()
		
		if balance > 0 then
				DEFAULT_CHAT_FRAME:AddMessage('本次交易共|cff00FF00收入|r：' .. GetMoneyString(balance))
		elseif balance < 0 then
				DEFAULT_CHAT_FRAME:AddMessage('本次交易共|cffFF0000支出|r：' .. GetMoneyString(-balance))
		end
	end	
end)
