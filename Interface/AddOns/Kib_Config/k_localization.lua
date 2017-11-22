local LocalDatabase, _, Locals = unpack(select(2, ...))

--<<IMPORTANT STUFF>>-------------------------------------------------------------------------------<<>>

	local Localizations = {}

--<<DEFAULT LOCALIZATION>>--------------------------------------------------------------------------<<>>

	-- This will be used for enUS, enGB and any empty Localization function
	
	local function Default()
		Locals.Welcome_Message_A 		= "To start using Kib Config, select one of the buttons above the white line."
		Locals.Welcome_Message_B 		= "\n\nIf any issues arise, please post in the forum or PM the author. Thanks! \n\nConfig Version: "

		Locals.ConfigLine_Hint 			= {"Left Click: Copy Settings", "Right Click: Paste Settings"}

		Locals.GeneralTabTip 			= "Contains many general settings"

		Locals.ProfileButton_New 		= {"Create a New Profile", "Type the name of your new Profile"}
		Locals.ProfileButton_Delete 		= {"Delete a Profile", "Select a specific Profile to delete"}
		Locals.ProfileButton_Rename 		= {"Rename Profile", "Type a new name for your current Profile"}
		Locals.ProfileButton_Copy 		= {"Copy a Profile", "Select a specific Profile to copy from"}
		Locals.ProfileButton_Switch 		= {"Switch Profiles", "Select a specific Profile to switch to"}

		Locals.UseAsGlobalFont_Title, Locals.UseAsGlobalFont_Tip = "Use As Global Font", "Your selected font will be applied to all ingame text\n\nNote: Combat text will not update until you restart the game"
		Locals.UseAsGlobalFont_Popup = "Toggle use as global font"

		Locals.ShowConfigButton_Title, Locals.ShowConfigButton_Tip = "Add Config Button to Default Menu", "Adds a button for Kib: Config to the default game menu"
		Locals.ShowConfigButton_Popup = "Toggle the Kib: Config button"

		Locals.UseOldMenu_Title, Locals.UseOldMenu_Tip = "Use Default Game Menu", "Toggle between the default game menu and Kib_Configs game menu"
		Locals.UseOldMenu_Popup = "Toggle the Game Menu"

		Locals.Language_Title, Locals.Language_Popup = "Language", "Switch the Language to: "
		Locals.Language_Tip01 = "Select the specific Language you would like to use.\n\nIf any Non-English Language is still in English, then they have yet to be translated (or your selected font doesn't support it)."
		Locals.Language_Tip02 = "\n\nThink you can help with translation? if so, contact the author."

		Locals.Font_Title, Locals.Font_Popup = "Font", "Switch Font to: "
		Locals.Font_Tip = "The global font used for KIB related addons \n\nNote:\nMost custom fonts don't support non English characters. If this is an issue, stick to using fonts that say [Bliz:] "

		Locals.Addon_Tip, Locals.Addon_Version, Locals.Addon_Popup = "Enable or Disable this Addon", "Addon Version", "Toggle This Addon?"

		Locals.Author = "Author"
		Locals.R, Locals.G, Locals.B = "R", "G", "B"
		Locals.Yes, Locals.No, Locals.Disabled, Locals.General, Locals.Addons = "Yes", "No", "Disabled", "General", "Addons"
		Locals.Values, Locals.Misc, Locals.Reload, Locals.Accept, Locals.Decline = "Values", "Misc", " (Reload)", "Accept", "Decline"
		Locals.Addons2, Locals.Settings, Locals.Help, Locals.Shop, Locals.System = "ADDONS", "SETTINGS", "HELP", "SHOP", "SYSTEM"
		Locals.Interface, Locals.KeyBindings, Locals.Macros, Locals.Logout	= "INTERFACE", "KEY BINDINGS", "MACROS", "LOGOUT"
		Locals.Exit, Locals.Close, Locals.Quit, Locals.GameMenu, Locals.CurrentProfile	= "EXIT", "CLOSE", "QUIT GAME", "GAME MENU", "Current Profile"
	end

--<<itIT>>------------------------------------------------------------------------------------------<<>>

	function Localizations.itIT()
		return Default()
	end

--<<koKR>>------------------------------------------------------------------------------------------<<>>

	function Localizations.koKR()
		return Default()
	end

--<<ptBR>>------------------------------------------------------------------------------------------<<>>

	function Localizations.ptBR()
		return Default()
	end

--<<ruRU>>------------------------------------------------------------------------------------------<<>>

	function Localizations.ruRU()
		return Default()
	end

--<<zhCN>>------------------------------------------------------------------------------------------<<>>
	function Localizations.zhCN()
		Locals.Welcome_Message_A 		= "选择白线上的按钮或图标,开始使用Kib_Config."
		Locals.Welcome_Message_B 		= "\n\n如果在使用中发现任何问题,请在论坛上回复或者PM作者. 谢谢! \n\n版本号: "

		Locals.ConfigLine_Hint 			= {"左键点击: 复制设置", "右键点击: 粘帖设置"}

		Locals.GeneralTabTip 			= "包含许多常规设置"

		Locals.ProfileButton_New 		= {"创建新配置文件", "输入新配置文件的名称"}
		Locals.ProfileButton_Delete 		= {"删除配置文件", "删除选定的配置文件"}
		Locals.ProfileButton_Rename 		= {"重命名配置文件", "重命名当前配置文件"}
		Locals.ProfileButton_Copy 		= {"复制配置文件", "复制选定的配置文件"}
		Locals.ProfileButton_Switch 		= {"切换配置文件", "切换到选定的配置文件"}

		Locals.UseAsGlobalFont_Title, Locals.UseAsGlobalFont_Tip = "使用全局字体", "你选择的字体将会应用在所有游戏文字中\n\n注意: 战斗文字只在你重启游戏才会更新"
		Locals.UseAsGlobalFont_Popup = "切换全局字体"

		Locals.ShowConfigButton_Title, Locals.ShowConfigButton_Tip = "默认菜单中加入设置按钮", "添加Kib按钮: 默认游戏菜单中加入设置"
		Locals.ShowConfigButton_Popup = "切换Kib: 设置按钮"

		Locals.UseOldMenu_Title, Locals.UseOldMenu_Tip = "使用默认游戏菜单", "在自带游戏菜单和 Kib_Configs 之间切换"
		Locals.UseOldMenu_Popup = "切换游戏菜单"

		Locals.Language_Title, Locals.Language_Popup = "语言", "切换语言: "
		Locals.Language_Tip01 = "选择你想使用的特定语言.\n\n如果依然显示的是英语, 表明还未被翻译(或者你选择的字体不支持)."
		Locals.Language_Tip02 = "\n\n如果你觉得可以帮助翻译请与作者联系."

		Locals.Font_Title, Locals.Font_Popup = "字体", "切换字体: "
		Locals.Font_Tip = " 使用全局KIB字体附加设置  \n\n注意:\n大多数自定义字体不支持非英字符. 如果出现这个问题,请选择[Bliz:]开头的字体文件,中文选择[zhCN:] "

		Locals.Addon_Tip, Locals.Addon_Version, Locals.Addon_Popup = "激活或禁用插件", "插件版本", "切换这个插件?"

		Locals.Author = "作者"
		Locals.R, Locals.G, Locals.B = "红", "绿", "蓝"
		Locals.Yes, Locals.No, Locals.Disabled, Locals.General, Locals.Addons = "是", "否", "禁用", "一般", "插件"
		Locals.Values, Locals.Misc, Locals.Reload, Locals.Accept, Locals.Decline = "值", "杂项", "(重载)", "接受", "拒绝"
		Locals.Addons2, Locals.Settings, Locals.Help, Locals.Shop, Locals.System = "插件", "设置", "帮助", "商城", "系统"
		Locals.Interface, Locals.KeyBindings, Locals.Macros, Locals.Logout	= "界面", "按键设置", "宏", "登出游戏"
		Locals.Exit, Locals.Close, Locals.Quit, Locals.GameMenu, Locals.CurrentProfile	= "退出", "关闭", "退出游戏", "游戏菜单", "当前配置"

	end

--<<zhTW>>------------------------------------------------------------------------------------------<<>>

	function Localizations.zhTW()
		return Default()
	end

--<<deDE>>------------------------------------------------------------------------------------------<<>>

	function Localizations.deDE()
		return Default()
	end

--<<enGB>>------------------------------------------------------------------------------------------<<>>

	function Localizations.enGB() -- Leave as Default
		return Default()
	end

--<<enUS>>------------------------------------------------------------------------------------------<<>>

	function Localizations.enUS() -- Leave as Default
		return Default()
	end

--<<esES>>------------------------------------------------------------------------------------------<<>>

	function Localizations.esES()
		return Default()
	end

--<<esMX>>------------------------------------------------------------------------------------------<<>>

	function Localizations.esMX()
		return Default()
	end

--<<frFR>>------------------------------------------------------------------------------------------<<>>

	function Localizations.frFR()
		return Default()
	end

--<<GET LOCALIZED TEXT>>----------------------------------------------------------------------------<<>>

	function LocalDatabase.GetLocalizedText(SelectedLanguage)
		Localizations[SelectedLanguage]()
	end

----------------------------------------------------------------------------------------------------<<END>>