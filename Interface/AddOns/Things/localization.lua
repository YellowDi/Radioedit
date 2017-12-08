--------------------------
-- localization.lua
-- Author: CN-阿曼尼-DeathKnight-仁者無敵:YY132359
-- Date: 2017/4/3
-- 背包物品信息
--------------------------
if GetLocale() == "zhCN" then
	BAGNON_NUM_BAGS = '背包: %d'
	BAGNON_NUM_BANK = '银行: %d'
	BAGNON_NUM_REAGENTBANK = '材料银行: %d'
	BAGNON_EQUIPPED = '已装备'
elseif GetLocale() == "zhTW" then
	BAGNON_NUM_BAGS = '背包: %d'
	BAGNON_NUM_BANK = '銀行: %d'
	BAGNON_NUM_REAGENTBANK = '材料銀行: %d'
	BAGNON_EQUIPPED = '已裝備'
else
	BAGNON_NUM_BAGS = 'Bags: %d'
	BAGNON_NUM_BANK = 'Bank: %d'
	BAGNON_NUM_REAGENTBANK = 'ReagentBank: %d'
	BAGNON_EQUIPPED = 'Equipped'
end