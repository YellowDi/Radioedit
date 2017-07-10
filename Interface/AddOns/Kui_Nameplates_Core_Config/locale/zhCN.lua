if GetLocale() ~= 'zhCN' then return end
local opt = KuiNameplatesCoreConfig
opt.page_names["auras"] = "光环"
opt.page_names["bossmod"] = "Boss 模式"
opt.page_names["castbars"] = "施法条"
opt.page_names["classpowers"] = "职业资源"
opt.page_names["framesizes"] = "框体大小"
opt.page_names["general"] = "一般"
opt.page_names["healthbars"] = "血量条"
opt.page_names["nameonly"] = "名字模式"
opt.page_names["text"] = "文本"
opt.page_names["threat"] = "仇恨"

opt.titles["absorb_enable"] = "显示吸收"
opt.titles["absorb_striped"] = "条纹吸收材质"
opt.titles["auras_centre"] = "置中对齐图标"
opt.titles["auras_enabled"] = "启用"
opt.titles["auras_filtering_sep"] = "过滤"
opt.titles["auras_icon_minus_size"] = "杂兵图标大小"
opt.titles["auras_icon_normal_size"] = "常规图标大小"
opt.titles["auras_icon_squareness"] = "长宽比例"
opt.titles["auras_icons_sep"] = "图标"
opt.titles["auras_maximum_length"] = "最大显示秒数"
opt.titles["auras_minimum_length"] = "最小显示秒数"
opt.titles["auras_on_personal"] = "显示在个人资源上"
opt.titles["auras_pulsate"] = "闪烁图标"
opt.titles["auras_sort"] = "排序方式"
opt.titles["auras_time_threshold"] = "计时器阈值"
opt.titles["auras_vanilla_filter"] = "使用默认UI过滤器"
opt.titles["auras_whitelist"] = "使用白名单"
opt.titles["bar_animation"] = "姓名板动画"
opt.titles["bar_texture"] = "姓名板材质"
opt.titles["bossmod_clickthrough"] = "姓名板自动显示时启用点击穿越"
opt.titles["bossmod_control_visibility"] = "允许首领警报插件控制姓名版是否可见"
opt.titles["bossmod_enable"] = "启用"
opt.titles["bossmod_icon_size"] = "图标大小"
opt.titles["bossmod_x_offset"] = "水平偏移"
opt.titles["bossmod_y_offset"] = "垂直偏移"
opt.titles["bot_vertical_offset"] = "等级血量垂直偏移"
opt.titles["castbar_colour"] = "施法条颜色"
opt.titles["castbar_enable"] = "启用"
opt.titles["castbar_height"] = "施法条高度"
opt.titles["castbar_icon"] = "显示法术图标"
opt.titles["castbar_name"] = "显示法术名称"
opt.titles["castbar_showall"] = "所有姓名版均显示施法条"
opt.titles["castbar_showenemy"] = "显示敌方施法条"
opt.titles["castbar_showfriend"] = "显示友方施法条"
opt.titles["castbar_showpersonal"] = "显示自身施法条"
opt.titles["castbar_unin_colour"] = "免疫打断颜色"
opt.titles["class_colour_enemy_names"] = "敌方姓名职业染色"
opt.titles["class_colour_friendly_names"] = "友方姓名职业染色"
opt.titles["classpowers_bar_height"] = "资源条高度"
opt.titles["classpowers_bar_width"] = "资源条宽度"
opt.titles["classpowers_colour"] = "图标颜色"
opt.titles["classpowers_colour_inactive"] = "閒置状态"
opt.titles["classpowers_colour_overflow"] = "资源溢出"
opt.titles["classpowers_enable"] = "启用"
opt.titles["classpowers_on_target"] = "在目标上显示"
opt.titles["classpowers_size"] = "图标大小"
opt.titles["clickthrough_enemy"] = "敌方"
opt.titles["clickthrough_friend"] = "友方"
opt.titles["clickthrough_self"] = "个人"
opt.titles["clickthrough_sep"] = "点击穿越"
opt.titles["colour_absorb"] = "吸收涂层"
opt.titles["colour_enemy_class"] = "敌方玩家职业染色"
opt.titles["colour_enemy_pet"] = "宠物"
opt.titles["colour_enemy_player"] = "玩家"
opt.titles["colour_friendly"] = "友善"
opt.titles["colour_friendly_pet"] = "宠物"
opt.titles["colour_hated"] = "敌对"
opt.titles["colour_neutral"] = "中立"
opt.titles["colour_player"] = "玩家"
opt.titles["colour_player_class"] = "友方玩家职业染色"
opt.titles["colour_self"] = "自己"
opt.titles["colour_self_class"] = "自身职业染色"
opt.titles["colour_tapped"] = "无拾取权"
opt.titles["combat_friendly"] = "战斗动作: 友方"
opt.titles["combat_hostile"] = "战斗动作: 敌方"
opt.titles["copy_profile_label"] = "为配置输入新名称"
opt.titles["copy_profile_title"] = "复制配置"
opt.titles["delete_profile_label"] = "删除配置 |cffffffff%s|r?"
opt.titles["delete_profile_title"] = "删除配置"
opt.titles["execute_auto"] = "自动检测斩杀血量"
opt.titles["execute_colour"] = "斩杀染色"
opt.titles["execute_enabled"] = "启用斩杀染色"
opt.titles["execute_percent"] = "斩杀阈值百分比"
opt.titles["execute_sep"] = "斩杀阶段"
opt.titles["fade_all"] = "默认渐隐"
opt.titles["fade_alpha"] = "渐隐透明度"
opt.titles["fade_avoid_execute_friend"] = "避开低血量友方"
opt.titles["fade_avoid_execute_hostile"] = "避开低血量敌方"
opt.titles["fade_avoid_nameonly"] = "避开名字模式"
opt.titles["fade_avoid_raidicon"] = "避开团队标记"
opt.titles["fade_avoid_tracked"] = "避开追踪中或战斗中的"
opt.titles["fade_friendly_npc"] = "渐隐友方NPC"
opt.titles["fade_neutral_enemy"] = "渐隐中立单位"
opt.titles["fade_rules_sep"] = "框体渐隐"
opt.titles["fade_speed"] = "渐隐动画速度"
opt.titles["fade_untracked"] = "渐隐非追踪单位"
opt.titles["font_face"] = "文本字型"
opt.titles["font_size_normal"] = "常规字型大小"
opt.titles["font_size_small"] = "辅助字型大小"
opt.titles["font_style"] = "文字样式"
opt.titles["frame_glow_size"] = "框体高亮尺寸"
opt.titles["frame_glow_threat"] = "显示威胁高亮"
opt.titles["frame_height"] = "常规姓名板高度"
opt.titles["frame_height_minus"] = "杂兵姓名板高度"
opt.titles["frame_height_personal"] = "个人资源高度"
opt.titles["frame_width"] = "常规姓名板宽度"
opt.titles["frame_width_minus"] = "杂兵姓名板宽度"
opt.titles["frame_width_personal"] = "个人资源宽度"
opt.titles["glow_as_shadow"] = "显示阴影高亮"
opt.titles["guild_text_npcs"] = "显示NPC头衔"
opt.titles["guild_text_players"] = "显示玩家公会"
opt.titles["health_text"] = "显示生命值"
opt.titles["health_text_friend_dmg"] = "损血友方"
opt.titles["health_text_friend_max"] = "满血友方"
opt.titles["health_text_hostile_dmg"] = "损血敌方"
opt.titles["health_text_hostile_max"] = "满血敌方"
opt.titles["health_text_sep"] = "生命值文字"
opt.titles["hide_names"] = "隐藏未追踪单位名字"
opt.titles["ignore_uiscale"] = "忽略界面缩放"
opt.titles["level_text"] = "显示等级"
opt.titles["name_text"] = "显示姓名"
opt.titles["name_vertical_offset"] = "名字垂直偏移"
opt.titles["nameonly"] = "启用名字模式"
opt.titles["nameonly_all_enemies"] = "包括敌方"
opt.titles["nameonly_damaged_friends"] = "包括未满血的友方"
opt.titles["nameonly_enemies"] = "包括不可攻击的敌人"
opt.titles["nameonly_health_colour"] = "血量百分比染色"
opt.titles["nameonly_in_combat"] = "正与你交战的单位"
opt.titles["nameonly_neutral"] = "包括中立单位"
opt.titles["nameonly_no_font_style"] = "无字型描边"
opt.titles["nameonly_target"] = "包括目标"
opt.titles["new_profile"] = "新配置..."
opt.titles["new_profile_label"] = "输入配置名称"
opt.titles["powerbar_height"] = "能量条高度"
opt.titles["profile"] = "配置"
opt.titles["reaction_colour_sep"] = "血量条颜色"
opt.titles["rename_profile_label"] = "输入新名称为 |cffffffff%s"
opt.titles["rename_profile_title"] = "重命名配置"
opt.titles["reset_profile_label"] = "重置配置 |cffffffff%s|r?"
opt.titles["reset_profile_title"] = "重置配置"
opt.titles["state_icons"] = "显示状态图标"
opt.titles["tank_mode"] = "启用"
opt.titles["tankmode_colour_sep"] = "仇恨染色"
opt.titles["tankmode_force_enable"] = "强制启用坦克模式"
opt.titles["tankmode_force_offtank"] = "强制换坦检测"
opt.titles["tankmode_other_colour"] = "仇恨丢失"
opt.titles["tankmode_tank_colour"] = "仇恨稳固"
opt.titles["tankmode_trans_colour"] = "仇恨不稳"
opt.titles["target_arrows"] = "显示目标箭头"
opt.titles["target_arrows_size"] = "箭头大小"
opt.titles["target_glow"] = "显示目标高亮"
opt.titles["target_glow_colour"] = "目标高亮颜色"
opt.titles["text_vertical_offset"] = "文字垂直偏移"
opt.titles["threat_brackets"] = "显示仇恨括号"
opt.titles["title_text_players"] = "显示玩家头衔"
opt.titles["use_blizzard_personal"] = "忽略个人资源"
opt.titles["version"] = "%s 作者: %s @ Curse, 版本 %s"

opt.tooltips["absorb_enable"] = "在姓名板上显示吸收盾"
opt.tooltips["absorb_striped"] = "在吸收盾上使用条纹材质。如果未勾选，继承姓名板材质"
opt.tooltips["auras_centre"] = "水平置中对齐框体上的图标，而非靠左对齐"
opt.tooltips["auras_enabled"] = "在姓名板上显示你施放的光环：友方显示buff，敌方显示debuff"
opt.tooltips["auras_icon_minus_size"] = "杂兵单位姓名板的图标大小"
opt.tooltips["auras_icon_normal_size"] = "常规单位姓名板的图标大小"
opt.tooltips["auras_icon_squareness"] = "光环图标的长宽比例，设为1代表是正方形"
opt.tooltips["auras_maximum_length"] = "不显示秒数大于此数值的光环。将值设为-1可忽略此选项"
opt.tooltips["auras_minimum_length"] = "不显示秒数低于此数值的光环"
opt.tooltips["auras_on_personal"] = "在个人资源上显示光环图标"
opt.tooltips["auras_pulsate"] = "快要结束时闪烁图标"
opt.tooltips["auras_time_threshold"] = "当光环的剩馀秒数少于这个数值时，显示倒数文字。-1表示总是显示"
opt.tooltips["auras_vanilla_filter"] = "在敌方姓名板使用暴雪自带的光环过滤器，显示其他玩家受到的法术效果（例如昏迷、沉默等）和某些重要的玩家法术。|n|n|cffff6666目前没有办法编辑此过滤器的法术清单。|n|n注意：启用此功能时，敌方的KSLC白名单会被忽略不生效。"
opt.tooltips["auras_whitelist"] = "使用KuiSpellList来过滤法术。你可以在Curse上取得附挂插件KuiSpellListConfig来自订此清单。|n|n|cffff6666注意：如果启用\"使用默认UI过滤器\"，则此选项和白名单将被忽略不生效。"
opt.tooltips["bar_animation"] = "血量/能量条变化的动画方式"
opt.tooltips["bar_texture"] = "状态条使用的材质（由LibSharedMedia提供）"
opt.tooltips["bossmod_clickthrough"] = "当友方姓名板自动显示的时候禁用点击"
opt.tooltips["bossmod_control_visibility"] = "首领警报插件可以发送信息给姓名板插件，通知他们在首领战中保持启用友方的姓名板；并忽略其他设定（如自动战斗切换）以便在友方玩家显示额外的信息。|n|n|cffff6666如果禁用此选项、并且没有启用友方姓名板，首领警报模块将无法显示资讯。"
opt.tooltips["bossmod_enable"] = "首领警报插件可以与姓名板插件交流，在相关首领战中于姓名板上显示额外信息；例如首领施放的重要增减益效果。"
opt.tooltips["bossmod_icon_size"] = "首领光环图标大小"
opt.tooltips["bossmod_x_offset"] = "首领光环图标位置的水平偏移量"
opt.tooltips["bossmod_y_offset"] = "首领光环图标位置的垂直偏移量"
opt.tooltips["bot_vertical_offset"] = "等级血量垂直偏移"
opt.tooltips["castbar_enable"] = "启用施法条"
opt.tooltips["castbar_showall"] = "在所有姓名板上显示施法条"
opt.tooltips["castbar_showenemy"] = "显示敌方施法条"
opt.tooltips["castbar_showfriend"] = "显示友方施法条，注意：启用名字模式时不会显示施法条"
opt.tooltips["castbar_showpersonal"] = "如果启用个人资源，在其上显示自身施法条"
opt.tooltips["castbar_unin_colour"] = "染色无法被打断的施法条"
opt.tooltips["class_colour_enemy_names"] = "根据职业染色敌方玩家名字，同时也影响名字模式的文字文本。"
opt.tooltips["class_colour_friendly_names"] = "根据职业染色友方玩家名字，同时也影响名字模式的文字文本。"
opt.tooltips["classpowers_bar_height"] = "醉仙缓劲条高度"
opt.tooltips["classpowers_bar_width"] = "醉仙缓劲条宽度"
opt.tooltips["classpowers_colour"] = "职业副资源（如连击点、圣能）的颜色"
opt.tooltips["classpowers_colour_inactive"] = "职业能量静止时的图标颜色"
opt.tooltips["classpowers_colour_overflow"] = "职业能量\"溢出\"的颜色（如盗贼的预感）"
opt.tooltips["classpowers_enable"] = "显示副资源，像是连击点、圣能等等。"
opt.tooltips["classpowers_on_target"] = "将副资源显示于目标，而非依附个人资源"
opt.tooltips["classpowers_size"] = "副资源图标大小"
opt.tooltips["clickthrough_enemy"] = "禁止点击个人资源"
opt.tooltips["clickthrough_friend"] = "禁止点击友方姓名板"
opt.tooltips["clickthrough_self"] = "禁止点击个人资源"
opt.tooltips["colour_friendly_pet"] = "请注意：友方玩家宠物一般不会显示姓名板"
opt.tooltips["colour_player"] = "其他友方玩家姓名板的颜色"
opt.tooltips["colour_self"] = "个人资源的姓名板颜色"
opt.tooltips["colour_self_class"] = "以职业颜色染色个人资源"
opt.tooltips["combat_friendly"] = "进入与离开战斗时在友方框体上採取的动作。"
opt.tooltips["combat_hostile"] = "进入与离开战斗时在敌方框体上採取的动作。"
opt.tooltips["execute_auto"] = "自动侦测你的天赋专精所需的斩杀阈值，对于无斩杀的角色默认为20%"
opt.tooltips["execute_colour"] = "斩杀阶段使用的颜色"
opt.tooltips["execute_enabled"] = "当单位进入斩杀阶段时，重新染色姓名板"
opt.tooltips["execute_percent"] = "手动设定斩杀阶段血量阈值"
opt.tooltips["fade_all"] = "默认状态下渐隐所有框体"
opt.tooltips["fade_alpha"] = "渐隐框体的透明度。请注意：如果设为0（即框体完全透明不可见），则不可见的姓名板仍然可以点击。 插件不能任意禁用姓名板的点击框"
opt.tooltips["fade_avoid_execute_friend"] = "不要渐隐血量处于斩杀阶段的友方姓名板（在\"血量条\"页面设置）"
opt.tooltips["fade_avoid_execute_hostile"] = "不要渐隐血量处于斩杀阶段的敌方姓名板（在\"血量条\"页面设置）"
opt.tooltips["fade_avoid_nameonly"] = "启用名字模式时，不要渐隐姓名板"
opt.tooltips["fade_avoid_raidicon"] = "不要渐隐被标记了团队图标的姓名板"
opt.tooltips["fade_avoid_tracked"] = "不渐隐已追踪或是正在与你战斗中的单位姓名板。|n透过改变 Esc > 界面 > 姓名 > “NPC名称”下拉菜单的选项，来设定是否进行追踪"
opt.tooltips["fade_friendly_npc"] = "默认渐隐友方NPC姓名板（包含名字模式）"
opt.tooltips["fade_neutral_enemy"] = "默认渐隐可攻击的中立单位姓名板（包含名字模式）"
opt.tooltips["fade_speed"] = "框体渐隐的速度，1是最慢的，0是立即渐隐"
opt.tooltips["fade_untracked"] = "渐隐非追踪姓名板（包含名字模式）。|n透过改变 Esc > 界面 > 姓名 > “NPC名称”下拉菜单的选项，来设定是否进行追踪"
opt.tooltips["font_face"] = "姓名板所使用的全局字型（由LibSharedMedia提供）"
opt.tooltips["font_size_normal"] = "常规字型大小 （名称等）"
opt.tooltips["font_size_small"] = "小字型大小（商人、法术名等等）"
opt.tooltips["frame_glow_size"] = "目标高亮与威胁指示的高亮大小"
opt.tooltips["frame_glow_threat"] = "以高亮的颜色变化来指示威胁状态"
opt.tooltips["frame_height"] = "标准姓名板高度"
opt.tooltips["frame_height_minus"] = "杂兵和无名字（不重要的单位）的姓名板高度（杂兵一般会显示比较小的姓名板）"
opt.tooltips["frame_height_personal"] = "个人资源条的高度（若要启用，勾选 Esc > 界面 > 姓名 > 显示个人资源）"
opt.tooltips["frame_width"] = "标准姓名板宽度"
opt.tooltips["frame_width_minus"] = "杂兵的姓名板宽度（杂兵一般会显示比较小的姓名板）"
opt.tooltips["frame_width_personal"] = "个人资源条的宽度（若要启用，勾选 Esc > 界面 > 姓名 > 显示个人资源）"
opt.tooltips["guild_text_npcs"] = "显示NPC的头衔，像是军需官..等等。"
opt.tooltips["guild_text_players"] = "启用名字模式时，显示玩家公会"
opt.tooltips["health_text_friend_dmg"] = "友方玩家损血时的血量文字格式"
opt.tooltips["health_text_friend_max"] = "友方玩家满血时的血量文字格式"
opt.tooltips["health_text_hostile_dmg"] = "敌方玩家损血时的血量文字格式"
opt.tooltips["health_text_hostile_max"] = "敌方玩家满血时的血量文字格式"
opt.tooltips["hide_names"] = "你可以透过改变 Esc > 界面 > 姓名 > “NPC名称”下拉菜单的选项，来设定是否进行追踪。注意：此設定在名字模式不生效"
opt.tooltips["ignore_uiscale"] = "忽略默认的界面缩放。这可以让姓名板维持精确的像素，不受解析度影响。"
opt.tooltips["nameonly"] = "隐藏友方或不可攻击单位的姓名板。启用此模组时以血量百分比染色名字。"
opt.tooltips["nameonly_all_enemies"] = "在所有敌方单位使用名字模式"
opt.tooltips["nameonly_damaged_friends"] = "在所有友方单位使用名字模式，即使血量未满"
opt.tooltips["nameonly_enemies"] = "在不可攻击的敌方使用名字模式（不包括在免疫效果中的敌方玩家）"
opt.tooltips["nameonly_in_combat"] = "在战斗中使用名字模式（将同时在敌方玩家身上启用）|n|n注意，这不适用于训练假人或其他没有威胁值列表的单位。"
opt.tooltips["nameonly_neutral"] = "在可攻击的中立单位使用名字模式"
opt.tooltips["nameonly_no_font_style"] = "使用名字模式时，不使用字体描边（将字型样式设为空）"
opt.tooltips["nameonly_target"] = "也在当前目标使用名字模式"
opt.tooltips["powerbar_height"] = "能量条的高度。不能超过姓名板框体高度"
opt.tooltips["state_icons"] = "在首领与精英单位上显示图标（启用\"显示等级文字\"时隐藏）"
opt.tooltips["tank_mode"] = "当你是坦克时，重新染色你正在坦住的单位姓名板颜色"
opt.tooltips["tankmode_force_enable"] = "总是使用坦克模式，不管你是否处于坦克专精"
opt.tooltips["tankmode_force_offtank"] = "染色被团队中其他坦克所坦住的姓名板，即使你目前并非坦克专精"
opt.tooltips["tankmode_other_colour"] = "当其他坦克接力坦住时的姓名板颜色。|n|n只对坦克专精生效，并且需要其他坦克在你的团队中、而且职责要设定为坦克。"
opt.tooltips["tankmode_tank_colour"] = "稳定坦住时的姓名板颜色"
opt.tooltips["tankmode_trans_colour"] = "获得或失去仇恨时的姓名板颜色"
opt.tooltips["target_arrows"] = "在当前目标周围显示箭头。箭头的颜色继承目标的高亮颜色。"
opt.tooltips["threat_brackets"] = "显示威胁括弧"
opt.tooltips["title_text_players"] = "显示玩家头衔"
opt.tooltips["use_blizzard_personal"] = "不美化个人资源或是职业能量。|n|n当启用此选项，个人框体可以在\"框体大小\"中的\"个人资源\"选项中调整，但是需要重载界面才能完全生效。|n|n要让此框体显示，你必须勾选在Esc > 界面 > 姓名 > 单位姓名板中的\"显示个人资源\"选项。|n|n要显示未被美化的职业资源，必须在同一页面取消勾选\"显示目标的特殊资源\"。|n|n|cffff6666如果当前框体可见，则需要重载界面。"
