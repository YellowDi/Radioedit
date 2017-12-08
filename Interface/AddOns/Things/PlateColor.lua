--------------------------
-- PlateColor.lua
-- Author: CN-阿曼尼-DeathKnight-仁者無敵:YY132359
-- Date: 2017/10/10
-- 血条仇恨变色<紫色仇恨是你，蓝色仇恨不稳，黄色仇恨高，红色安全>
--------------------------
hooksecurefunc("CompactUnitFrame_OnUpdate", function(frame)
   if C_NamePlate.GetNamePlateForUnit(frame.unit) ~= C_NamePlate.GetNamePlateForUnit("player") and not UnitIsPlayer(frame.unit) and not CompactUnitFrame_IsTapDenied(frame) then
	  local threat = UnitThreatSituation("player", frame.unit) or 0
	  local reaction = UnitReaction(frame.unit, "player")
		if threat == 3 then
            r, g, b = 0.3, 0, 0.6   -- 仇恨是你 颜色
		elseif threat == 2 and GetSpecializationRole(GetSpecialization()) == "TANK" then      
            r, g, b = 0, 0, 1		-- 你是T但是仇恨不稳 颜色
		elseif threat == 2 then      
            r, g, b = 0.6, 0, 0.6		-- 你不是T但是仇恨不稳 颜色
        elseif threat == 1 then      
            r, g, b = 1, 0.5, 0		-- 你要OT  颜色
		elseif reaction == 4 then
			r, g, b = 1, 1, 0		--中立怪黄色
        else
			r, g, b = 1, 0, 0	 	
        end
      frame.healthBar:SetStatusBarColor(r, g, b, 1)
   end
end) 

--紫色 0.3, 0, 0.6
--蓝色 0, 0, 1
--橙色 1, 0.5, 0
--黄色 1, 1, 0
--红色 1, 0, 0