--------------------------
-- HeXie.lua
-- Author: CN-阿曼尼-DeathKnight-仁者無敵:YY132359
-- Date: 2017/10/09
-- 7.25功能合辑<自带反和谐>
--------------------------
local function defaultcvar()
--国服反和谐 ↓ 1:关闭反和谐  0:开启反和谐
SetCVar("overrideArchive", 0)
--国服语言过滤 ↓ 1:开启语言过滤  0:关闭语言过滤
SetCVar("profanityFilter", 0)
-- 战斗字体大小缩放 ↓ (1默认的100%大小，最大2.5 )
SetCVar("WorldTextScale", 3)
--逗号显示↓<神器能量显示万>  1:开启  0:关闭
SetCVar("breakUpLargeNumbers", 1) 
--战斗字体显示方式 ↓ 1向上 2向下 3弧形
SetCVar("floatingCombatTextFloatMode", 1) 
--声望显示 ↓ (浮动战斗信息详情1开  0关)
SetCVar("floatingCombatTextRepChanges", 0) 
-- 战斗字体跳跃速度 ↓ (1~5)
SetCVar("floatingCombatTextCombatDamageDirectionalScale", 2) 
--7.2修改默认延迟 ↓ 7.2默认为400ms太高了
SetCVar("SpellQueueWindow", 120)
--显示目标所有DEBUFF(7.0默认只显示与自己相关的) ↓ 1:开启  0:关闭
SetCVar("noBuffDebuffFilterOnTarget", 0)
--天气效果 ↓ 1-3表示效果，0是关闭 
SetCVar("weatherDensity", 1)
--移动时大地图透明 ↓ 1:开启      0:关闭
SetCVar("mapFade", 0) 
--自动显示装备对比 ↓ 1:开启      0:关闭
SetCVar("alwaysCompareItems", 1)
--最大视角
SetCVar("cameraDistanceMaxZoomFactor", 2.6) 
--不显示队友DOT ↓
SetCVar("noBuffDebuffFilterOnTarget",GetCVarDefault("noBuffDebuffFilterOnTarget"))
-- 防止第一次打开公会卡频
SetCVar("profanityFilter", 0)
--坦克丟失仇恨時閃爍，1開 
SetCVar("ShowNamePlateLoseAggroFlash", 1)
--姓名板職業染色，1開 
SetCVar("ShowClassColorInNameplate", 1) 
--如果想要單獨控制友方姓名板的職業染色，就要使用這項：0關 
SetCVar("ShowClassColorInFriendlyNameplate".1)
--伤害系统数字显示 ↓ 1:开启      0:关闭
SetCVar("floatingCombatTextCombatDamage", 0) 
--治疗系统数字显示 ↓ 1:开启      0:关闭
SetCVar("floatingCombatTextCombatHealing", 0) 
end 
local frame = CreateFrame("FRAME", "defaultcvar") 
   frame:RegisterEvent("PLAYER_ENTERING_WORLD") 
local function eventHandler(self, event, ...) 
         defaultcvar() 
end 
frame:SetScript("OnEvent", eventHandler)