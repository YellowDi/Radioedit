--------------------------
-- Coordinates.lua
-- Author: CN-阿曼尼-DeathKnight-仁者無敵:YY132359
-- Date: 2017/10/9
-- 谁再点小地图
--------------------------
local addon = CreateFrame('ScrollingMessageFrame', false, Minimap) 
addon:SetHeight(10) 
addon:SetWidth(100) 
addon:SetPoint('BOTTOM', Minimap, 0, 20) 

addon:SetFont(STANDARD_TEXT_FONT, 12, 'OUTLINE') 
addon:SetJustifyH'CENTER' 
addon:SetJustifyV'CENTER' 
addon:SetMaxLines(1) 
addon:SetFading(true) 
addon:SetFadeDuration(3) 
addon:SetTimeVisible(5) 

addon:RegisterEvent'MINIMAP_PING' 
addon:SetScript('OnEvent', function(self, event, u) 
local c = RAID_CLASS_COLORS[select(2,UnitClass(u))] 
local name = UnitName(u) 
addon:AddMessage(name, c.r, c.g, c.b) 
end)