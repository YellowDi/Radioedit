--------------------------
-- AuraSpell.lua
-- Author: CN-阿曼尼-DeathKnight-仁者無敵:YY132359
-- Date: 2017/4/3
-- DEbuff自动喊话 
--------------------------
local PlayerAuraAppList = {
	-- 这里填写玩家 获得 BUFF/DEBUFF的列表,请按规格填写...
	[  6770] = "附近有贼!已被闷棍!",
------↑[  闷棍]	
	[212641] = "8秒内伤害降低50%",
	[ 86659] = "8秒内伤害降低50%",
------↑[远古列王守卫]
	[ 31850] = "8秒内伤害降低20%",
------↑[炙热防御者]
------↑[  6940] = "12秒内伤害降低30%",
------↑[牺牲祝福]
	[  1022] = "10秒内免疫物理伤害",
------↑[保护祝福]
	[204018] = "10秒内免疫魔法伤害",
------↑[破咒祝福]
	[ 98007] = "持续6秒",
------↑[灵魂链接]
	[ 98008] = "持续6秒",
------↑[灵魂链接]
	[ 31821] = "持续8秒",
------↑[光环掌握]
	[ 97463] = "生命值提高15%持续10秒",
------↑[命令怒吼]
	[   740] = "持续8秒",
------↑[    宁静]
	[196718] = "持续8秒",
------↑[幻影打击]
	[209426] = "持续8秒",
------↑[幻影打击]
	[ 47788] = "持续10秒",
------↑[守护之魂]
	[ 64844] = "持续8秒",
------↑[神圣赞美诗]
	[ 64843] = "持续8秒",
------↑[神圣赞美诗]
	[ 33206] = "持续8秒",
------↑[痛苦压制]
	[116849] = "持续12秒",
------↑[作茧缚命]
	[102342] = "12秒内伤害降低20%",
------↑[铁木树皮]
	[ 22812] = "12秒内伤害降低20%",
------↑[ 树皮术]
	[ 61336] = "6秒内伤害降低50%",
------↑[生存本能]
	[102558] = "持续30秒",
------↑[乌索尔的守护者]
	[200851] = "10秒内伤害降低25%",
------↑[沉睡者之怒]
	[ 187827] = "持续15秒",
------↑[恶魔变形]
	[ 55233] = "10秒内伤害降低30%受到治疗提高30%",
------↑[吸血鬼之血]
	[ 48792] = "8秒内伤害降低20%",
------↑[冰封之韧]
	[  1160] = "12秒内伤害降低20%",
------↑[挫志怒吼]
	[ 12975] = "15秒内生命提高60%",
------↑[破釜沉舟]
	[   871] = "8秒内伤害降低40%",
------↑[  盾墙]
	[ 23920] = "5秒内法术伤害降低30",
------↑[法术反射]
	[243425] = "15秒内伤害降低25%",
------↑[壮胆酒]
	[115203] = "15秒内伤害降低25%",
------↑[壮胆酒]

}
local PlayerAuraRemList = {
	-- 这里填写玩家 失去 BUFF/DEBUFF的列表,请按规格填写...
	[206677] = "炙烧烙印消失!准备换T",
}
local PlayerSpellList = {
	-- 这里填写玩家 释放 指定法术的列表,请按规格填写...
	[ 61999] = "%t,等待复活",
	[ 20484] = "%t,等待复活",
}
local TargetAuraAppList = {
	-- 这里填写目标 获得 BUFF/DEBUFF的列表,请按规格填写...
	[204459] = "持续15秒;爆发全开输出目标",
------↑[暗夜老一 易伤外壳]
	[206344] = "毁灭之球;被点名的远离人群",
}
local TargetAuraRemList = {
	-- 这里填写目标 失去 BUFF/DEBUFF的列表,请按规格填写...
}
local TargetSpellList = {
	-- 这里填写目标 释放 指定法术的列表,请按规格填写...
	[204316] = "站在水晶后面躲避击飞",
	[204471] = "躲避正面防止击飞",
	[205344] = "被点名的往后场跑",
	[205420] = "所有玩家速度踩圈",
	[206946] = "所有玩家集合",
	[206517] = "所有玩家远离BOSS",
	[206344] = "毁灭之球;被点名的远离人群",
}
local AuraAppList = {
	-- 这里填写周围玩家 获得 BUFF/DEBUFF的列表,请按规格填写...
}
local AuraRemList = {
	-- 这里填写周围玩家 失去 BUFF/DEBUFF的列表,请按规格填写...
}
local SpellMessageList = {
	-- 这里填写周围玩家 释放 指定法术的列表,请按规格填写...
	[ 31884] = "是他,是他,就是他!我们的英雄小哪吒",
------↑[防骑复仇之怒]
	[231895] = "是他,是他,就是他!我们的英雄小哪吒",
------↑[惩戒复仇之怒]
	[ 31842] = "是他,是他,就是他!我们的英雄小哪吒",
------↑[神圣复仇之怒]

}
local SpellSoundList = {
	-- 这里填写玩家 释放 指定法术的列表,请按规格填写...就是成功释放后会播放对应的音效...
	[ 00000] = "Sound\\Creature\\LordMarrowgar\\IC_Marrowgar_Aggro01.ogg",
}

local AllMode = false				-- 全局模式,开启后将检测通报周围玩家...会造成刷屏...请慎重开启...
local WaringMode = false			-- 警报模式,开启后不管在什么团队中,都会使用 说 通报...防止一些人不看团队频道...

local ChannelSet = function(Warning)
	if (not IsInGroup(LE_PARTY_CATEGORY_HOME) or not IsInRaid(LE_PARTY_CATEGORY_HOME)) and IsInGroup(LE_PARTY_CATEGORY_INSTANCE) then
		if WaringMode == true then
			return "SAY"
		else
			return "INSTANCE_CHAT"
		end
	elseif IsInRaid(LE_PARTY_CATEGORY_HOME) then
		if Warning and (UnitIsGroupLeader("player") or UnitIsGroupAssistant("player") or IsEveryoneAssistant()) then
			if WaringMode == true then
				return "SAY"
			else
				return "RAID_WARNING"
			end
		else
			if WaringMode == true then
				return "SAY"
			else
				return "RAID"
			end
		end
	elseif IsInGroup(LE_PARTY_CATEGORY_HOME) then
		if WaringMode == true then
			return "SAY"
		else
			return "PARTY"
		end
	else
		return "SAY"
	end
end

local function OnEvent(self, event, ...)
	if event == "COMBAT_LOG_EVENT_UNFILTERED" then
		local EventType, SourceGUID, SourceName, DestGUID, DestName, SpellId = select(2, ...), select(4, ...), select(5, ...), select(8, ...), select(9, ...), select(12, ...)
		if UnitIsDeadOrGhost("player") then return end
		if SourceGUID == UnitGUID("player") and EventType == "SPELL_CAST_SUCCESS" then
			if PlayerSpellList[SpellId] then
				SendChatMessage(">>> "..SourceName.." 施放了 "..GetSpellLink(SpellId).." → "..PlayerSpellList[SpellId].." <<<", ChannelSet(Warning))
			elseif SpellSoundList[SpellId] then
				PlaySoundFile(SpellSoundList[SpellId], "Master")
			end
		elseif DestGUID == UnitGUID("player") then
			if EventType == "SPELL_AURA_APPLIED" and PlayerAuraAppList[SpellId] then
				SendChatMessage(">>> "..DestName.." 获得了 "..GetSpellLink(SpellId).." → "..PlayerAuraAppList[SpellId].." <<<", ChannelSet(Warning))
			elseif EventType == "SPELL_AURA_REMOVED" and PlayerAuraRemList[SpellId] then
				SendChatMessage(">>> "..DestName.." 失去了 "..GetSpellLink(SpellId).." → "..PlayerAuraRemList[SpellId].." <<<", ChannelSet(Warning))
			end
		elseif SourceGUID == UnitGUID("target") then
			if EventType == "SPELL_CAST_SUCCESS" and TargetSpellList[SpellId] then
				SendChatMessage(">>> "..SourceName.." 施放了 "..GetSpellLink(SpellId).." → "..TargetSpellList[SpellId].." <<<", ChannelSet(Warning))
			end
		elseif DestGUID == UnitGUID("target") then
			if EventType == "SPELL_AURA_APPLIED" and TargetAuraAppList[SpellId] then
				SendChatMessage(">>> "..DestName.." 获得了 "..GetSpellLink(SpellId).." → "..TargetAuraAppList[SpellId].." <<<", ChannelSet(Warning))
			elseif EventType == "SPELL_AURA_REMOVED" and TargetAuraRemList[SpellId] then
				SendChatMessage(">>> "..DestName.." 失去了 "..GetSpellLink(SpellId).." → "..TargetAuraRemList[SpellId].." <<<", ChannelSet(Warning))
			end
		elseif AllMode == true then
			if EventType == "SPELL_AURA_APPLIED" and AuraAppList[SpellId] then
				SendChatMessage(">>> "..DestName.." 获得了 "..GetSpellLink(SpellId).." → "..AuraAppList[SpellId].." <<<", ChannelSet(Warning))
			elseif EventType == "SPELL_AURA_REMOVED" and AuraRemList[SpellId] then
				SendChatMessage(">>> "..DestName.." 失去了 "..GetSpellLink(SpellId).." → "..AuraRemList[SpellId].." <<<", ChannelSet(Warning))
			elseif EventType == "SPELL_CAST_SUCCESS" and SpellMessageList[SpellId] then
				SendChatMessage(">>> "..SourceName.." 施放了 "..GetSpellLink(SpellId).." → "..SpellMessageList[SpellId].." <<<", ChannelSet(Warning))
			end
		end
	end
end

local Frame = CreateFrame("Frame")
Frame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
Frame:SetScript("OnEvent", OnEvent)