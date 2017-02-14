-- Engine
local S, C, L, DB = unpack(select(2, ...))

-- Variables
if not C.AuraTimer then
    C.AuraTimer = {}
end


C.AuraTimer.WhiteList = {}
C.AuraTimer.WhiteList.Player = {
    -- 玩家状态监视白名单列表，请自行添加需要加入白名单的技能ID
} 
C.AuraTimer.WhiteList.Target = {
    -- 目标状态监视白名单列表，请自行添加需要加入白名单的技能ID
    [164812] = true, -- 月火术
    [164815] = true, -- 阳炎术
}
