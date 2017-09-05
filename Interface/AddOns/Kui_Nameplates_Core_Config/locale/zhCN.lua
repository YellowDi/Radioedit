local L = KuiNameplatesCoreConfig:Locale('zhCN')
if not L then return end

L["page_names"] = {
	["auras"] = "光环",
	["bossmod"] = "Boss 模式",
	["castbars"] = "施法条",
	["classpowers"] = "职业资源",
	["framesizes"] = "框体大小",
	["general"] = "一般",
	["healthbars"] = "血量条",
	["nameonly"] = "名字模式",
	["text"] = "文本",
	["threat"] = "仇恨",
}

L["titles"] = {
	["absorb_enable"] = "显示吸收",
	["absorb_striped"] = "条纹吸收材质",
	["auras_centre"] = "置中对齐图标",
	["auras_enabled"] = "启用",
	["auras_filtering_sep"] = "过滤",
	["auras_hide_all_other"] = "將他人施放的所有光环列入黑名單",
	["auras_icon_minus_size"] = "杂兵图标大小",
	["auras_icon_normal_size"] = "常规图标大小",
	["auras_icon_squareness"] = "长宽比例",
	["auras_icons_sep"] = "图标",
	["auras_kslc_hint"] = "KuiSpellListConfig（可在Curse上取得）可以让你编辑法术黑名单和白名单，任何单位所施放的法术都可以放入自订清单。",
	["auras_maximum_length"] = "最大显示秒数",
	["auras_minimum_length"] = "最小显示秒数",
	["auras_on_personal"] = "显示在个人资源上",
	["auras_pulsate"] = "闪烁图标",
	["auras_show_all_self"] = "將自身施放的所有光環列入白名單",
	["auras_sort"] = "排序方式",
	["auras_time_threshold"] = "计时器阈值",
	["bar_animation"] = "姓名板动画",
	["bar_texture"] = "姓名板材质",
	["bossmod_clickthrough"] = "姓名板自动显示时启用点击穿越",
	["bossmod_control_visibility"] = "允许首领警报插件控制姓名版是否可见",
	["bossmod_enable"] = "启用",
	["bossmod_icon_size"] = "图标大小",
	["bossmod_x_offset"] = "水平偏移",
	["bossmod_y_offset"] = "垂直偏移",
	["bot_vertical_offset"] = "等级血量垂直偏移",
	["castbar_colour"] = "施法条颜色",
	["castbar_enable"] = "启用",
	["castbar_height"] = "施法条高度",
	["castbar_icon"] = "显示法术图标",
	["castbar_name"] = "显示法术名称",
--Translation missing
	["castbar_shield"] = "Show uninterruptible shield",
	["castbar_showall"] = "所有姓名版均显示施法条",
	["castbar_showenemy"] = "显示敌方施法条",
	["castbar_showfriend"] = "显示友方施法条",
	["castbar_showpersonal"] = "显示自身施法条",
	["castbar_unin_colour"] = "免疫打断颜色",
	["class_colour_enemy_names"] = "敌方姓名职业染色",
	["class_colour_friendly_names"] = "友方姓名职业染色",
	["classpowers_bar_height"] = "资源条高度",
	["classpowers_bar_width"] = "资源条宽度",
	["classpowers_colour"] = "图标颜色",
	["classpowers_colour_inactive"] = "閒置状态",
	["classpowers_colour_overflow"] = "资源溢出",
	["classpowers_enable"] = "启用",
	["classpowers_on_target"] = "在目标上显示",
	["classpowers_size"] = "图标大小",
	["clickthrough_enemy"] = "敌方",
	["clickthrough_friend"] = "友方",
	["clickthrough_self"] = "个人",
	["clickthrough_sep"] = "点击穿越",
	["colour_absorb"] = "吸收涂层",
	["colour_enemy_class"] = "敌方玩家职业染色",
	["colour_enemy_pet"] = "宠物",
	["colour_enemy_player"] = "玩家",
	["colour_friendly"] = "友善",
	["colour_friendly_pet"] = "宠物",
	["colour_hated"] = "敌对",
	["colour_neutral"] = "中立",
	["colour_player"] = "玩家",
	["colour_player_class"] = "友方玩家职业染色",
	["colour_self"] = "自己",
	["colour_self_class"] = "自身职业染色",
	["colour_tapped"] = "无拾取权",
	["combat_friendly"] = "战斗动作: 友方",
	["combat_hostile"] = "战斗动作: 敌方",
	["copy_profile_label"] = "为配置输入新名称",
	["copy_profile_title"] = "复制配置",
	["dd_auras_sort_index"] = "光环索引",
	["dd_auras_sort_time"] = "剩馀时间",
	["dd_bar_animation_cutaway"] = "切除",
	["dd_bar_animation_smooth"] = "平滑",
	["dd_combat_toggle_hide"] = "战斗隐藏，脱战显示",
	["dd_combat_toggle_nothing"] = "无动作",
	["dd_combat_toggle_show"] = "战斗显示，脱战隐藏",
	["dd_font_style_monochrome"] = "点阵字描边",
	["dd_font_style_none"] = "无",
	["dd_font_style_outline"] = "描边",
	["dd_font_style_shadow"] = "阴影",
	["dd_font_style_shadowandoutline"] = "阴影加描边",
	["dd_health_text_blank"] = "空",
	["dd_health_text_current"] = "当前值",
	["dd_health_text_deficit"] = "损失值",
	["dd_health_text_maximum"] = "最大值",
	["dd_health_text_percent"] = "百分比",
	["delete_profile_label"] = "删除配置|cffffffff%s|r？",
	["delete_profile_title"] = "删除配置",
	["execute_auto"] = "自动检测斩杀血量",
	["execute_colour"] = "斩杀染色",
	["execute_enabled"] = "启用斩杀染色",
	["execute_percent"] = "斩杀阈值百分比",
	["execute_sep"] = "斩杀阶段",
	["fade_all"] = "默认渐隐",
	["fade_alpha"] = "渐隐透明度",
	["fade_avoid_execute_friend"] = "避开低血量友方",
	["fade_avoid_execute_hostile"] = "避开低血量敌方",
	["fade_avoid_nameonly"] = "避开名字模式",
	["fade_avoid_raidicon"] = "避开团队标记",
	["fade_avoid_tracked"] = "避开追踪中或战斗中的",
	["fade_friendly_npc"] = "渐隐友方NPC",
	["fade_neutral_enemy"] = "渐隐中立单位",
	["fade_rules_sep"] = "框体渐隐",
	["fade_speed"] = "渐隐动画速度",
	["fade_untracked"] = "渐隐非追踪单位",
	["font_face"] = "文本字型",
	["font_size_normal"] = "常规字型大小",
	["font_size_small"] = "辅助字型大小",
	["font_style"] = "文字样式",
	["frame_glow_size"] = "框体高亮尺寸",
	["frame_glow_threat"] = "显示威胁高亮",
	["frame_height"] = "常规姓名板高度",
	["frame_height_minus"] = "杂兵姓名板高度",
	["frame_height_personal"] = "个人资源高度",
	["frame_width"] = "常规姓名板宽度",
	["frame_width_minus"] = "杂兵姓名板宽度",
	["frame_width_personal"] = "个人资源宽度",
	["glow_as_shadow"] = "显示阴影高亮",
	["guild_text_npcs"] = "显示NPC头衔",
	["guild_text_players"] = "显示玩家公会",
	["health_text"] = "显示生命值",
	["health_text_friend_dmg"] = "损血友方",
	["health_text_friend_max"] = "满血友方",
	["health_text_hostile_dmg"] = "损血敌方",
	["health_text_hostile_max"] = "满血敌方",
	["health_text_sep"] = "生命值文字",
	["hide_names"] = "隐藏未追踪单位名字",
	["ignore_uiscale"] = "忽略界面缩放",
	["level_text"] = "显示等级",
	["name_text"] = "显示姓名",
	["name_vertical_offset"] = "名字垂直偏移",
	["nameonly"] = "启用名字模式",
	["nameonly_all_enemies"] = "包括敌方",
	["nameonly_damaged_friends"] = "包括未满血的友方",
	["nameonly_enemies"] = "包括不可攻击的敌人",
	["nameonly_health_colour"] = "血量百分比染色",
	["nameonly_in_combat"] = "正与你交战的单位",
	["nameonly_neutral"] = "包括中立单位",
	["nameonly_no_font_style"] = "无字型描边",
	["nameonly_target"] = "包括目标",
	["new_profile"] = "新配置...",
	["new_profile_label"] = "输入配置名称",
	["powerbar_height"] = "能量条高度",
	["profile"] = "配置",
	["reaction_colour_sep"] = "血量条颜色",
	["rename_profile_label"] = "输入新名称为|cffffffff%s",
	["rename_profile_title"] = "重命名配置",
	["reset_profile_label"] = "重置配置|cffffffff%s|r?",
	["reset_profile_title"] = "重置配置",
	["state_icons"] = "显示状态图标",
	["tank_mode"] = "启用",
	["tankmode_colour_sep"] = "仇恨染色",
	["tankmode_force_enable"] = "强制启用坦克模式",
	["tankmode_force_offtank"] = "强制换坦检测",
	["tankmode_other_colour"] = "仇恨丢失",
	["tankmode_tank_colour"] = "仇恨稳固",
	["tankmode_trans_colour"] = "仇恨不稳",
	["target_arrows"] = "显示目标箭头",
	["target_arrows_size"] = "箭头大小",
	["target_glow"] = "显示目标高亮",
	["target_glow_colour"] = "目标高亮颜色",
	["text_vertical_offset"] = "文字垂直偏移",
	["threat_brackets"] = "显示仇恨括号",
	["title_text_players"] = "显示玩家头衔",
	["use_blizzard_personal"] = "忽略个人资源",
	["version"] = "%s 作者: %s @ Curse, 版本 %s",
}

L["tooltips"] = {
	["absorb_enable"] = "在姓名板上显示吸收盾",
	["absorb_striped"] = "在吸收盾上使用条纹材质。如果未勾选，继承姓名板材质",
	["auras_centre"] = "水平置中对齐框体上的图标，而非靠左对齐",
	["auras_enabled"] = "在姓名板上显示你施放的光环：友方显示buff，敌方显示debuff",
	["auras_hide_all_other"] = "不显示任何他人施放的光环（如控场和缓速）。|n|n请注意：KuiSpellList的生效优先级高于此选项，所以你仍然可以在勾选此选项的情况下用|cffffff88KuiSpellListConfig|r（可在Curse上取得）自订特定法术的显示。",
	["auras_icon_minus_size"] = "杂兵单位姓名板的图标大小",
	["auras_icon_normal_size"] = "常规单位姓名板的图标大小",
	["auras_icon_squareness"] = "光环图标的长宽比例，设为1代表是正方形",
	["auras_maximum_length"] = "不显示秒数大于此数值的光环。将值设为-1可忽略此选项",
	["auras_minimum_length"] = "不显示秒数低于此数值的光环",
	["auras_on_personal"] = "在个人资源上显示光环图标",
	["auras_pulsate"] = "快要结束时闪烁图标",
	["auras_show_all_self"] = "显示你施放的所有光环，而非只显示暴雪预设的重要光环。|n|n请注意：KuiSpellList的生效优先级高于此选项，所以你仍然可以在勾选此选项的情况下用|cffffff88KuiSpellListConfig|r（可在Curse上取得）自订特定法术的显示。",
	["auras_time_threshold"] = "当光环的剩馀秒数少于这个数值时，显示倒数文字。-1表示总是显示",
	["bar_animation"] = "血量/能量条变化的动画方式",
	["bar_texture"] = "状态条使用的材质（由LibSharedMedia提供）",
	["bossmod_clickthrough"] = "当友方姓名板自动显示的时候禁用点击",
	["bossmod_control_visibility"] = "首领警报插件可以发送信息给姓名板插件，通知他们在首领战中保持启用友方的姓名板；并忽略其他设定（如自动战斗切换）以便在友方玩家显示额外的信息。|n|n|cffff6666如果禁用此选项、并且没有启用友方姓名板，首领警报模块将无法显示资讯。",
	["bossmod_enable"] = "首领警报插件可以与姓名板插件交流，在相关首领战中于姓名板上显示额外信息；例如首领施放的重要增减益效果。",
	["bossmod_icon_size"] = "首领光环图标大小",
	["bossmod_x_offset"] = "首领光环图标位置的水平偏移量",
	["bossmod_y_offset"] = "首领光环图标位置的垂直偏移量",
	["bot_vertical_offset"] = "等级血量垂直偏移",
	["castbar_enable"] = "启用施法条",
--Translation missing
	["castbar_shield"] = "Show a shield icon on the castbar during casts which cannot be interrupted",
	["castbar_showall"] = "在所有姓名板上显示施法条",
	["castbar_showenemy"] = "显示敌方施法条",
	["castbar_showfriend"] = "显示友方施法条，注意：启用名字模式时不会显示施法条",
	["castbar_showpersonal"] = "如果启用个人资源，在其上显示自身施法条",
	["castbar_unin_colour"] = "染色无法被打断的施法条",
	["class_colour_enemy_names"] = "根据职业染色敌方玩家名字，同时也影响名字模式的文字文本。",
	["class_colour_friendly_names"] = "根据职业染色友方玩家名字，同时也影响名字模式的文字文本。",
	["classpowers_bar_height"] = "醉仙缓劲条高度",
	["classpowers_bar_width"] = "醉仙缓劲条宽度",
	["classpowers_colour"] = "职业副资源（如连击点、圣能）的颜色",
	["classpowers_colour_inactive"] = "职业能量静止时的图标颜色",
	["classpowers_colour_overflow"] = "职业能量\"溢出\"的颜色（如盗贼的预感）",
	["classpowers_enable"] = "显示副资源，像是连击点、圣能等等。",
	["classpowers_on_target"] = "将副资源显示于目标，而非依附个人资源",
	["classpowers_size"] = "副资源图标大小",
	["clickthrough_enemy"] = "禁止点击个人资源",
	["clickthrough_friend"] = "禁止点击友方姓名板",
	["clickthrough_self"] = "禁止点击个人资源",
	["colour_friendly_pet"] = "请注意：友方玩家宠物一般不会显示姓名板",
	["colour_player"] = "其他友方玩家姓名板的颜色",
	["colour_self"] = "个人资源的姓名板颜色",
	["colour_self_class"] = "以职业颜色染色个人资源",
	["combat_friendly"] = "进入与离开战斗时在友方框体上採取的动作。",
	["combat_hostile"] = "进入与离开战斗时在敌方框体上採取的动作。",
	["execute_auto"] = "自动侦测你的天赋专精所需的斩杀阈值，对于无斩杀的角色默认为20%",
	["execute_colour"] = "斩杀阶段使用的颜色",
	["execute_enabled"] = "当单位进入斩杀阶段时，重新染色姓名板",
	["execute_percent"] = "手动设定斩杀阶段血量阈值",
	["fade_all"] = "默认状态下渐隐所有框体",
	["fade_alpha"] = "渐隐框体的透明度。请注意：如果设为0（即框体完全透明不可见），则不可见的姓名板仍然可以点击。 插件不能任意禁用姓名板的点击框",
	["fade_avoid_execute_friend"] = "不要渐隐血量处于斩杀阶段的友方姓名板（在\"血量条\"页面设置）",
	["fade_avoid_execute_hostile"] = "不要渐隐血量处于斩杀阶段的敌方姓名板（在\"血量条\"页面设置）",
	["fade_avoid_nameonly"] = "启用名字模式时，不要渐隐姓名板",
	["fade_avoid_raidicon"] = "不要渐隐被标记了团队图标的姓名板",
	["fade_avoid_tracked"] = "不渐隐已追踪或是正在与你战斗中的单位姓名板。|n透过改变 Esc > 界面 > 姓名 > “NPC名称”下拉菜单的选项，来设定是否进行追踪",
	["fade_friendly_npc"] = "默认渐隐友方NPC姓名板（包含名字模式）",
	["fade_neutral_enemy"] = "默认渐隐可攻击的中立单位姓名板（包含名字模式）",
	["fade_speed"] = "框体渐隐的速度，1是最慢的，0是立即渐隐",
	["fade_untracked"] = "渐隐非追踪姓名板（包含名字模式）。|n透过改变 Esc > 界面 > 姓名 > “NPC名称”下拉菜单的选项，来设定是否进行追踪",
	["font_face"] = "姓名板所使用的全局字型（由LibSharedMedia提供）",
	["font_size_normal"] = "常规字型大小 （名称等）",
	["font_size_small"] = "小字型大小（商人、法术名等等）",
	["frame_glow_size"] = "目标高亮与威胁指示的高亮大小",
	["frame_glow_threat"] = "以高亮的颜色变化来指示威胁状态",
	["frame_height"] = "标准姓名板高度",
	["frame_height_minus"] = "杂兵和无名字（不重要的单位）的姓名板高度（杂兵一般会显示比较小的姓名板）",
	["frame_height_personal"] = "个人资源条的高度（若要启用，勾选 Esc > 界面 > 姓名 > 显示个人资源）",
	["frame_width"] = "标准姓名板宽度",
	["frame_width_minus"] = "杂兵的姓名板宽度（杂兵一般会显示比较小的姓名板）",
	["frame_width_personal"] = "个人资源条的宽度（若要启用，勾选 Esc > 界面 > 姓名 > 显示个人资源）",
	["guild_text_npcs"] = "显示NPC的头衔，像是军需官..等等。",
	["guild_text_players"] = "启用名字模式时，显示玩家公会",
	["health_text_friend_dmg"] = "友方玩家损血时的血量文字格式",
	["health_text_friend_max"] = "友方玩家满血时的血量文字格式",
	["health_text_hostile_dmg"] = "敌方玩家损血时的血量文字格式",
	["health_text_hostile_max"] = "敌方玩家满血时的血量文字格式",
	["hide_names"] = "你可以透过改变 Esc > 界面 > 姓名 > “NPC名称”下拉菜单的选项，来设定是否进行追踪。注意：此設定在名字模式不生效",
	["ignore_uiscale"] = "忽略默认的界面缩放。这可以让姓名板维持精确的像素，不受解析度影响。",
	["name_vertical_offset"] = "名字文本位置的垂直偏移量",
	["nameonly"] = "隐藏友方或不可攻击单位的姓名板。启用此模组时以血量百分比染色名字。",
	["nameonly_all_enemies"] = "在所有敌方单位使用名字模式",
	["nameonly_damaged_friends"] = "在所有友方单位使用名字模式，即使血量未满",
	["nameonly_enemies"] = "在不可攻击的敌方使用名字模式（不包括在免疫效果中的敌方玩家）",
	["nameonly_health_colour"] = "以部份染色的方式来显示血量百分比",
	["nameonly_in_combat"] = "在战斗中使用名字模式（将同时在敌方玩家身上启用）|n|n注意，这不适用于训练假人或其他没有威胁值列表的单位。",
	["nameonly_neutral"] = "在可攻击的中立单位使用名字模式",
	["nameonly_no_font_style"] = "使用名字模式时，不使用字体描边（将字型样式设为空）",
	["nameonly_target"] = "也在当前目标使用名字模式",
	["powerbar_height"] = "能量条的高度。不能超过姓名板框体高度",
	["state_icons"] = "在首领与精英单位上显示图标（启用\"显示等级文字\"时隐藏）",
	["tank_mode"] = "当你是坦克时，重新染色你正在坦住的单位姓名板颜色",
	["tankmode_force_enable"] = "总是使用坦克模式，不管你是否处于坦克专精",
	["tankmode_force_offtank"] = "染色被团队中其他坦克所坦住的姓名板，即使你目前并非坦克专精",
	["tankmode_other_colour"] = "当其他坦克接力坦住时的姓名板颜色。|n|n只对坦克专精生效，并且需要其他坦克在你的团队中、而且职责要设定为坦克。",
	["tankmode_tank_colour"] = "稳定坦住时的姓名板颜色",
	["tankmode_trans_colour"] = "获得或失去仇恨时的姓名板颜色",
	["target_arrows"] = "在当前目标周围显示箭头。箭头的颜色继承目标的高亮颜色。",
	["text_vertical_offset"] = "姓名板文字的全局垂直偏移量。针对WOW中某些比较奇怪的字体渲染作出微调。注意：尾数设为.5有助于在姓名板移动时减少抖动现象",
	["threat_brackets"] = "显示威胁括弧",
	["title_text_players"] = "显示玩家头衔",
	["use_blizzard_personal"] = "不美化个人资源或是职业能量。|n|n当启用此选项，个人框体可以在\"框体大小\"中的\"个人资源\"选项中调整，但是需要重载界面才能完全生效。|n|n要让此框体显示，你必须勾选在Esc > 界面 > 姓名 > 单位姓名板中的\"显示个人资源\"选项。|n|n要显示未被美化的职业资源，必须在同一页面取消勾选\"显示目标的特殊资源\"。|n|n|cffff6666如果当前框体可见，则需要重载界面。",
}
