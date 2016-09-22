﻿local AS, ASL = unpack(AddOnSkins)
--trans by eui.cc
function AS:UpdateLocale_zhCN()
	ASL.DataText.ToggleEmbed = '开关内嵌'
	ASL.DataText.LeftClick = '左键点击显示'
	ASL.DataText.RightClick = '右键点击隐藏'

	ASL.EmbedSystem.ToggleLeftChat = '开关左聊天面板'
	ASL.EmbedSystem.ToggleRightChat = '开关右聊天面板'
	ASL.EmbedSystem.ToggleEmbed = '开关内嵌插件'
	ASL.EmbedSystem.ToggleOptions = '开关额外皮肤/选项'

	ASL.OptionsPanel.SkinDesc = '启/禁用此皮肤.'
	ASL.OptionsPanel.EmbedDesc = '启/禁用此内嵌.'
	ASL.OptionsPanel.OptionDesc = '启/禁用此选项.'
	
	ASL["DBM Transparent Radar"] = "DBM 透明雷达"
	
	ASL["Left: '%s' | Right: '%s'"] = "左: '%s' | 右: '%s'";
	ASL['Embed System: - %s'] = '内嵌系统: - %s';
	ASL["Main: '%s'"] = "主: '%s'";	
	ASL["AddOn Skins"] = "插件美化"
	ASL["Blizzard Skins"] = "暴雪皮肤"
	ASL["BossMod Options"] = "副本预警模块设置"
	ASL["DBM|VEM Font"] = "DBM|VEM 字体"
	ASL["DBM|VEM Font Size"] = "DBM|VEM 字体尺寸"
	ASL["DBM|VEM Font Flag"] = "DBM|VEM 字体描边"
	ASL["None"] = "无"
	ASL["OUTLINE"] = "OUTLINE"
	ASL["THICKOUTLINE"] = "THICKOUTLINE"
	ASL["MONOCHROME"] = "MONOCHROME"
	ASL["MONOCHROMEOUTLINE"] = "MONOCHROMEOUTLINE"
	ASL["DBM|VEM Half-bar Skin"] = "DBM|VEM 半高计时条"
	ASL["BigWigs Half-Bar"] = "BigWigs 半高计时条"
	ASL["Embed Settings"] = "内嵌设置"
	ASL["Settings to control Embedded AddOns:\n\nAvailable Embeds: alDamageMeter | Details | Omen | Skada | Recount | TinyDPS"] = "设置内嵌插件:\n\n可用内嵌: alDamageMeter | Details | Omen | Skada | Recount | TinyDPS"
	ASL["Single Embed System"] = "单内嵌"
	ASL["Embed for Main Panel"] = "内嵌到主面板"
	ASL["Dual Embed System"] = "双内嵌"
	ASL["Embed for Left Window"] = "内嵌的左窗口"
	ASL["Embed for Right Window"] = "内嵌的右窗口"
	ASL["Embed Left Window Width"] = "内嵌的左窗口宽度"
	ASL["Out of Combat (Hide)"] = "脱战隐藏"
	ASL["Attach SexyCD to action bar"] = "附加 SexyCD 到动作条"
	ASL["Attach CoolLine to action bar"] = "附加 CoolLine 到动作条"
	ASL["Embed Transparancy"] = "内嵌背景透明"
	ASL["Embed Below Top Tab"] = "嵌入不盖过聊天标签"
	ASL["Recount Backdrop"] = "Recount 背景"
	ASL["Skada Backdrop"] = "Skada 背景"
	ASL["Omen Backdrop"] = "Omen 背景"
	ASL["WeakAura AuraBar"] = "WeakAura 光环条"
	ASL["Auction House"] = "拍卖行"
	ASL["FAQ's"] = "FAQ's"
	ASL["DBM/VEM Half-Bar Skin Spacing looks wrong. How can I fix it?"] = "DBM/VEM Half-Bar Skin Spacing looks wrong. How can I fix it?"
	ASL["To use the DBM/VEM Half-Bar skin. You must change the DBM/VEM Options. Offset Y needs to be at least 15."] = "To use the DBM/VEM Half-Bar skin. You must change the DBM/VEM Options. Offset Y needs to be at least 15."
	ASL["Credits"] = "Credits"
	ASL["Credits:"] = "Credits:"
	ASL["About/Help"] = "About/Help"
	ASL["This is where you can find out more of AddOnSkins."] = "This is where you can find out more of AddOnSkins."
	ASL["Download Link"] = "Download Link"
	ASL["Changelog Link"] = "Changelog Link"
	ASL["GitLab Link / Report Errors"] = "GitLab Link / Report Errors"
	ASL["Available Skins / Skin Requests"] = "可用的皮肤 / 皮肤需求"
	ASL["Version"] = "Version"
	ASL["Left Click to Show"] = "左击显示"
	ASL["Right Click to Hide"] = "右击显示"
	ASL["Left Click:"] = "左击:"
	ASL["Right Click:"] = "右击:"
	ASL["Conflict System: Please remove '%s' from your 'World of Warcraft\\Interface\\AddOns\\' directory."] = "Conflict System: Please remove '%s' from your 'World of Warcraft\\Interface\\AddOns\\' directory."
	ASL["Skin Template"] = "皮肤模板"
	ASL["Hide Chat Frame"] = "隐藏聊天框"
	ASL["Embed OoC Delay"] = "内嵌 OoC 延时"
	ASL['Reset Settings'] = '重置设置'
	ASL["WeakAura Cooldowns"] = "WeakAura 冷却"
	ASL["Embed into Right Chat Panel"] = "内嵌进右聊天框"
	ASL["Details Backdrop"] = 'Details 背景';
	ASL["Parchment"] = "羊皮纸"
	ASL["Enable Skin Debugging"] = "启用皮肤调试"
	
	ASL["Enable the Login Message"] = "启用登陆信息"
	ASL["Enable the Embed System Message"] = "启用内嵌信息"
end