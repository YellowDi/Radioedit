local L = LibStub("AceLocale-3.0"):NewLocale("GS-E", "zhCN")

--Debug Strings from Core
L["createButton PreMacro: "] = "createButton PreMacro: "
L["createButton PostMacro: "] = "createButton PostMacro: "
L["Reloading Sequences"] = "重载一键宏"
L["Entering GSSplitMeIntolines with :"] = "Entering GSSplitMeIntolines with :"
L["Line : "] = "行 : "
L["Testing String: "] = "测试字符: "
L[" Deleted Orphaned Macro "] = " Deleted Orphaned Macro "
L["I am loaded"] = "我已载入"
L[" Sequence named "] = " 一键宏命名 "
L[" is unknown."] = " 是未知的."
L["Moving on - "] = "移动到 - "
L[" already exists."] = " 已存在."
L["Sequence Name: "] = "一键宏名称: "
L["No Specialisation information for sequence "] = "无天赋信息关于一键宏 "
L[". Overriding with information for current spec "] = ". 重写当前天赋信息 "
L["Checking if specID "] = "检查 如果有天赋ID "
L[" equals "] = " 等于 "
L[" equals currentclassid "] = " 等于 当前职业ID "
L["GSUpdateSequence PreMacro updated to: "] = "GSUpdateSequence PreMacro updated to: "
L["GSUpdateSequence PostMacro updated to: "] = "GSUpdateSequence PostMacro updated to: "
L["Adding missing Language :"] =  "添加丢失的语言 :"
L["has been disabled.  The Macro stub for this sequence will be deleted and will not be recreated until you re-enable this sequence.  It will also not appear in the /gs list until it is recreated."] = true
L["This Sequence is currently Disabled Locally."] = true
L["is currently disabled from use."] = true
L["has been enabled.  The Macro stub is now available in your Macro interface."] = true
L["Testing "]  = true
L["Source "] = true
L["Cycle Version "] = true
L["Active Version "] = true

--Debug Strings from Errorhandler
L["Dump of GS Debug messages"] = "列表 GS 调试信息"
L["Update"] = "更新"
L["Close"] = "关闭"
L["[GNOME] syntax error on line %d of Sequences.lua:|r %s"] = "Sequences.lua 语法错误在行 %d :|r %s"
L["<SEQUENCEDEBUG> |r "] = "<SEQUENCEDEBUG> |r "
L["<DEBUG> |r "] = "<DEBUG> |r "

--Output Strings from Core
L["Close to Maximum Personal Macros.|r  You can have a maximum of "] = "已接近个人最大宏限制.|r  你能有的宏数量最多为 "
L[" macros per character.  You currently have "] = " 角色个人宏.  你当前已有 "
L["|r.  As a result this macro was not created.  Please delete some macros and reenter "] = "|r.  宏未创建，请删除一些宏后再继续 "
L["/gs|r again."] = "输入 /gs|r ."
L["Close to Maximum Macros.|r  You can have a maximum of "] = "接受最大宏.|r  你能拥有的宏数量为 "
L["|r.  You can also have a  maximum of "] = "|r.  你能拥有最多 "
L[" macros per Account.  You currently have "] = " 宏每个帐号.  你当前有 "
L["Contributed by: "] = "由: "
L["No Help Information "] = "无帮助信息 "
L["Unknown Author|r "] = "未知作者|r "
L["|r Incomplete Sequence Definition - This sequence has no further information "] = "|r 不完整的一键宏定义 - 此宏无进一步的信息 "

-- Setup and Help Output from Core
L["GnomeSequencer was originally written by semlar of wowinterface.com."] = "GnomeSequencer was originally written by semlar of wowinterface.com."
L["This is a small addon that allows you create a sequence of macros to be executed at the push of a button."] = "This is a small addon that allows you create a sequence of macros to be executed at the push of a button."
L["Like a /castsequence macro, it cycles through a series of commands when the button is pushed. However, unlike castsequence, it uses macro text for the commands instead of spells, and it advances every time the button is pushed instead of stopping when it can't cast something."] = "Like a /castsequence macro, it cycles through a series of commands when the button is pushed. However, unlike castsequence, it uses macro text for the commands instead of spells, and it advances every time the button is pushed instead of stopping when it can't cast something."
L["This version has been modified by TimothyLuke to make the power of GnomeSequencer avaialble to people who are not comfortable with lua programming."] = "This version has been modified by TimothyLuke to make the power of GnomeSequencer avaialble to people who are not comfortable with lua programming."
L[":|r To get started "] = ":|r 来得到开始 "
L["/gs|r will list any macros available to your spec.  This will also add any macros available for your current spec to the macro interface."] = "/gs|r will list any macros available to your spec.  This will also add any macros available for your current spec to the macro interface."
L["/gs listall|r will produce a list of all available macros with some help information."] = "/gs listall|r will produce a list of all available macros with some help information."
L["To use a macro, open the macros interface and create a macro with the exact same name as one from the list.  A new macro with two lines will be created and place this on your action bar."] = "To use a macro, open the macros interface and create a macro with the exact same name as one from the list.  A new macro with two lines will be created and place this on your action bar."
L["The command "] = "此命令 "
L["/gs showspec|r will show your current Specialisation and the SPECID needed to tag any existing macros."] = "/gs showspec|r will show your current Specialisation and the SPECID needed to tag any existing macros."
L["/gs cleanorphans|r will loop through your macros and delete any left over GS-E macros that no longer have a sequence to match them."] = "/gs cleanorphans|r will loop through your macros and delete any left over GS-E macros that no longer have a sequence to match them."
L[":|r Your current Specialisation is "] = ":|r 你当前天赋为 "
L["  The Alternative ClassID is "] = "  替代职业ID "
L["GnomeSequencer-Enhanced loaded.|r  Type "] = "GnomeSequencer-Enhanced 载入.|r  输入 "
L["/gs help|r to get started."] = "/gs help|r 来获得帮助."
L["Version="] = "版本="
L[":|r You cannot delete the only copy of a sequence."] = ":|r 无法删除一键宏的唯一副本."
L["A sequence colision has occured.  Your local version of "] = true
L[" has been added as a new version and set to active.  Please review if this is as expected."] = true
L["A sequence colision has occured. "] = true
L[" tried to overwrite the version already loaded from "] = true
L[". This version was not loaded."] = true
L["Sequence specID set to current spec of "] = true
L["Sequence Author set to Unknown"] = true
L["No Help Information Available"] = true
L[" was imported with the following errors."] = true