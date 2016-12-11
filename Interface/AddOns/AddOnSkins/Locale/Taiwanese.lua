local AS, ASL = unpack(AddOnSkins)
--trans by eui.cc
function AS:UpdateLocale_zhTW()
	ASL.DataText.ToggleEmbed='開關內嵌'
	ASL.DataText.LeftClick='左鍵點擊顯示'
	ASL.DataText.RightClick='右鍵點擊隱藏'

	ASL.EmbedSystem.ToggleLeftChat='開關左聊天面板';
	ASL.EmbedSystem.ToggleRightChat = '開關右聊天面板'
	ASL.EmbedSystem.ToggleEmbed='開關內嵌插件'
	ASL.EmbedSystem.ToggleOptions='開關額外皮膚/選項'

	ASL.OptionsPanel.SkinDesc='啟/禁用此皮膚.'
	ASL.OptionsPanel.EmbedDesc='啟/禁用此內嵌.'
	ASL.OptionsPanel.OptionDesc='啟/禁用此選項.'

	ASL["DBM Transparent Radar"] = "DBM 透明雷達"
	
	ASL["Left: '%s' | Right: '%s'"] = "左: '%s' | 右: '%s'";
	ASL['Embed System: - %s'] = '內嵌系統: - %s';
	ASL["Main: '%s'"] = "主: '%s'";
	ASL["AddOn Skins"]="插件美化"
	ASL["Blizzard Skins"]="暴雪皮膚"
	ASL["BossMod Options"]="副本預警模塊設置"
	ASL["DBM|VEM Font"]="DBM|VEM 字體"
	ASL["DBM|VEM Font Size"]="DBM|VEM 字體尺寸"
	ASL["DBM|VEM Font Flag"]="DBM|VEM 字體描邊"
	ASL["None"]="無"
	ASL["OUTLINE"]="OUTLINE"
	ASL["THICKOUTLINE"]="THICKOUTLINE"
	ASL["MONOCHROME"]="MONOCHROME"
	ASL["MONOCHROMEOUTLINE"]="MONOCHROMEOUTLINE"
	ASL["DBM|VEM Half-bar Skin"]="DBM|VEM 半高計時條"
	ASL["BigWigs Half-Bar"]="BigWigs 半高計時條"
	ASL["Embed Settings"]="內嵌設置"
	ASL["Settings to control Embedded AddOns:\n\nAvailable Embeds: alDamageMeter | Details | Omen | Skada | Recount | TinyDPS"]="設置內嵌插件:\n\n可用內嵌: alDamageMeter | Details | Omen | Skada | Recount | TinyDPS "
	ASL["Single Embed System"]="單內嵌"
	ASL["Embed for Main Panel"]="內嵌到主面板"
	ASL["Dual Embed System"]="雙內嵌"
	ASL["Embed for Left Window"]="內嵌的左窗口"
	ASL["Embed for Right Window"]="內嵌的右窗口"
	ASL["Embed Left Window Width"]="內嵌的左窗口寬度"
	ASL["Out of Combat (Hide)"]="脫戰隱藏"
	ASL["Attach SexyCD to action bar"]="附加SexyCD 到動作條"
	ASL["Attach CoolLine to action bar"]="附加CoolLine 到動作條"
	ASL["Embed Transparancy"]="內嵌背景透明"
	ASL["Embed Below Top Tab"]="嵌入不蓋過聊天標籤"
	ASL["Recount Backdrop"]="Recount 背景"
	ASL["Skada Backdrop"]="Skada 背景"
	ASL["Omen Backdrop"]="Omen 背景"
	ASL["WeakAura AuraBar"]="WeakAura 光環條"
	ASL["Auction House"]="拍賣行"
	ASL["FAQ's"]="FAQ's"
	ASL["DBM/VEM Half-Bar Skin Spacing looks wrong. How can I fix it?"]="DBM/VEM Half-Bar Skin Spacing looks wrong. How can I fix it?"
	ASL["To use the DBM/VEM Half-Bar skin. You must change the DBM/VEM Options. Offset Y needs to be at least 15."]="To use the DBM/VEM Half-Bar skin. You must change the DBM/VEM Options. Offset Y needs to be at least 15."
	ASL["Credits"]="Credits"
	ASL["Credits:"]="Credits:"
	ASL["About/Help"]="About/Help"
	ASL["This is where you can find out more of AddOnSkins."]="This is where you can find out more of AddOnSkins."
	ASL["Download Link"]="Download Link"
	ASL["Changelog Link"]="Changelog Link"
	ASL["GitLab Link / Report Errors"]="GitLab Link / Report Errors"
	ASL["Available Skins / Skin Requests"]="可用的皮膚/ 皮膚需求"
	ASL["Version"]="Version"
	ASL["Left Click to Show"]="左擊顯示"
	ASL["Right Click to Hide"]="右擊顯示"
	ASL["Left Click:"]="左擊:"
	ASL["Right Click:"]="右擊:"
	ASL["Conflict System: Please remove '%s' from your 'World of Warcraft\\Interface\\AddOns\\' directory."]="Conflict System: Please remove '%s' from your 'World of Warcraft\\ Interface\\AddOns\\' directory."
	ASL["Skin Template"]="皮膚模板"
	ASL["Hide Chat Frame"]="隱藏聊天框"
	ASL["Embed OoC Delay"]="內嵌 OoC 延時"
	ASL['Reset Settings']='重置設置'
	ASL["WeakAura Cooldowns"] = "WeakAura 冷卻"
	ASL["Embed into Right Chat Panel"] = "內嵌入右聊天框"
	ASL["Details Backdrop"] = 'Details 背景';
	ASL["Parchment"] = "羊皮紙"
	ASL["Enable Skin Debugging"] = "啓用皮膚調試"

	ASL["Enable the Login Message"] = "啟用登陸信息"
	ASL["Enable the Embed System Message"] = "啟用內嵌信息"
end