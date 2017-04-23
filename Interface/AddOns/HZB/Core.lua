local HZB_F=nil
local HZB_RUN=nil

SLASH_HZB1 = "/hzb"
SlashCmdList["HZB"] = function()
	HZB_INIT()
end


function HZB_INIT()
	if HZB_F==nil then
		HZB_F=CreateFrame("frame")
	end


	
	
	local T=0
	
	local INDEX_EQUIP="单体"
	UseEquipmentSet("单体")
	
	local TIMER=function()
		local t=GetTime()
		if t-T>1 then
		    HZB_RUN()
			T=t
		end
	end
	
	local HZB_X=function()
		if InCombatLockdown() then
			return
		end
	
		local level=UnitLevel("target")
		if level and level < 0 then
			if INDEX_EQUIP ~= "单体" then
				INDEX_EQUIP="单体"
				UseEquipmentSet("单体")
				print("切换装备 单体")
			end 
		elseif level and level == 112 then
			if INDEX_EQUIP ~= "单体" then 
				UseEquipmentSet("单体")
				INDEX_EQUIP="单体"
				print("切换装备 单体")
			end 
		else
			if INDEX_EQUIP ~= "AOE" then 
				UseEquipmentSet("AOE")
				INDEX_EQUIP="AOE"
				print("切换装备 AOE")
			end 
		end
		
	end
	
	
	if HZB_RUN==nil then
	    print("开启 自动换装")
		HZB_RUN=HZB_X
	else 
		print("关闭 自动换装")
		TIMER=nil
		HZB_RUN=nil
	end

	HZB_F:SetScript("OnUpdate",TIMER)
	
end

