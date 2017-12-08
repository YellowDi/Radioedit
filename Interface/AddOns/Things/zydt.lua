--------------------------
-- zydt.lua
-- Author: CN-阿曼尼-DeathKnight-仁者無敵:YY132359
-- Date: 2017/4/3
-- 隐藏大厅资源
--------------------------
if not IsAddOnLoaded("Blizzard_OrderHallUI") then 
   LoadAddOn("Blizzard_OrderHallUI") 
end 
OrderHallCommandBar:SetScript("OnEnter", function() 
   OrderHallCommandBar:SetAlpha(1) 
end) 
OrderHallCommandBar:SetScript("OnLeave", function() 
   OrderHallCommandBar:SetAlpha(0) 
end) 
OrderHallCommandBar:SetAlpha(0)