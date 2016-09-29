-- Mini Dragon(projecteurs@gmail.com)
-- Last update: May 12 2015, 07:49 UTC@14943

if GetLocale() ~= "zhCN" then return end
local L

---------------
-- Nythendra --
---------------
L= DBM:GetModLocalization(1703)

L:SetWarningLocalization({
})

L:SetTimerLocalization({
})

L:SetOptionLocalization({
})

L:SetMiscLocalization({
})

---------------------------
-- Il'gynoth, Heart of Corruption --
---------------------------
L= DBM:GetModLocalization(1738)
L:SetOptionLocalization({
	InfoFrameBehavior	= "在战斗中显示讯息框架",
	Fixates				= "显示中了锁定的玩家",
	Adds				= "显示小怪数量和类型"
})

---------------------------
-- Elerethe Renferal --
---------------------------
L= DBM:GetModLocalization(1744)

---------------------------
-- Ursoc --
---------------------------
L= DBM:GetModLocalization(1667)
L:SetOptionLocalization({
	NoAutoSoaking2		= "禁用所有专注凝视的自动分伤相关的警告/箭头/HUDs"
})
L:SetMiscLocalization({
	SoakersText		=	"吃冲击分配: %s"
})

---------------------------
-- Dragons of Nightmare --
---------------------------
L= DBM:GetModLocalization(1704)

------------------
-- Cenarius --
------------------
L= DBM:GetModLocalization(1750)
L:SetMiscLocalization({
	BrambleYell			= "刺藤在" .. UnitName("player") .. "附近!",
	BrambleMessage		= "注：DBM无法侦测刺藤锁定谁。警告会提示首领丢出的第一个目标，在这之后不能侦测刺藤锁定其他目标。"
})
------------------
-- Xavius --
------------------
L= DBM:GetModLocalization(1726)
L:SetOptionLocalization({
	InfoFrameFilterDream	= "在讯息框架过滤中了$spell:206005的玩家"
})
-------------
--  Trash  --
-------------
L = DBM:GetModLocalization("EmeraldNightmareTrash")

L:SetGeneralLocalization({
	name =	"翡翠梦魇小怪"
})
