local T, C, L, G = unpack(select(2, ...))
	
local Character_default_Settings = {
	FramePoints = {},
	
	General = {
		disable_all = false,
		disable_sound = false,
		disable_chatmsg = false,
		enable_alert = true,
	},
	
	AlertFrame = {
		enable = true,
		icon_size = 70,
		icon_space = 5,
		grow_dir = "BOTTOM",
		font_size = 40,
		ifont_size = 14,
	},
	
	TextFrame = {
		enable = true,
		flash = true,
		font_size = 50,
	},
	
	HealthPercFrame = {
		enable = true,			
		font_size = 40,
		flash = true,
	},
	
	PowerFrame = {
		enable = true,			
		font_size = 40,
		flash = true,
	},
	
	HL_Frame = {
		enable = true,
		position = "CENTER",
		iconSize = 30,
		iconAlpha = 80,
	},
	
	GroupSharingFrame = {
		enable = true,			
		font_size = 35,
		sound = true,
	},
	
	PlateAlerts = {
		enable = true,
		fsize = 18,
		size = 45,
		y = 30,
	},
	
	BossMod_Layout = {
		scale = 100,
	},
	
	BossMod = {
		Felhounds_Alert = true,
		
		HighCommand_Alert = true,
		
		Eonar_Alert = true,
		
		Kingaroth_Alert = true,
		
		Varimathras_Alert = true,
		
		CovenofShivarra_Alert = true,
		
		Aggramar_Alert = true,
		
		Argus_Alert = true,
		
		Argus_Debuff_Alert = true,
	},

	Eonar_Texts = {
		{
			"清茶", --邪污足迹	
			"阿宅", --目标锁定
			"小林", --奥术
			"王辉", --燃烧
		},
		{
			"李韬", --邪污足迹	
			"多多", --目标锁定
			"YCY", --奥术
			"三点", --燃烧
		},
		{
			"小胖", --邪污足迹	
			"柴伟", --目标锁定
			"鱼鱼鱼", --奥术
			"FS", --燃烧
		},
		{
			"泡泡", --邪污足迹	
			"太阳", --目标锁定
			"污水塘", --奥术
			"折木", --燃烧
		},
	},
	
	Aggramar_Texts = {
		    {
				"斗篷+阿宅", -- P1第1次
				"佯攻+李韬", -- P1第2次
				"佯攻+阿三", -- P1第3次
				"?",         -- P1第4次
			},
			
			{
				"斗篷+阿宅", -- P2第1次
				"佯攻+李韬", -- P2第2次
				"佯攻+阿宅", -- P2第3次
				"人群",      -- P2第4次    
				"斗篷+阿宅", -- P2第5次
				"佯攻+李韬", -- P2第6次
				"?",         -- P2第7次
			},
			
			{
				"斗篷+阿宅", -- P3第1次
				"佯攻+李韬", -- P3第2次
				"佯攻+阿宅", -- P3第3次
				"人群",      -- P3第4次    
				"斗篷+阿宅", -- P3第5次
				"佯攻+李韬", -- P3第6次
				"?",         -- P3第7次
			},
	},
	
	Icons = {
		--["Test_aura_774"] = { enable = true, hl = false }, -- 测试用	
		--["Test_auras_48438"] = { enable = true, hl = true }, -- 测试用	
		--["Test_logs_8936"] = { enable = true, hl = false }, -- 测试用
		--["Test_cast_5185"] = { enable = true, hl = false }, -- 测试用		
		--["Test_msg_774"] = { enable = true, hl = false }, -- 测试用	
		
		["Worldbreaker_auras_246200"] = { enable = false, hl = false }, -- 邪能轰炸
		["Worldbreaker_cast_240277"] = { enable = true, hl = true }, -- 天启引擎
		["Worldbreaker_aura_246848"] = { enable = true, hl = false }, -- 引力毁灭
		["Worldbreaker_logs_244969"] = { enable = true, hl = true }, -- 根除
		["Worldbreaker_logs_244294"] = { enable = true, hl = true }, -- 歼灭
		["Worldbreaker_logs_247044"] = { enable = true, hl = true }, -- 错乱歼灭
		["Worldbreaker_msg_244410"] = { enable = true, hl = true },-- 屠戮
		["Worldbreaker_aura_246919"] = { enable = true, hl = true },-- 错乱屠戮
		
		["Felhounds_aura_251448"] = { enable = false, hl = true }, -- 烈焰之喉
		["Felhounds_aura_251455"] = { enable = false, hl = false }, -- 闷烧
		["Felhounds_aura_251447"] = { enable = false, hl = true }, -- 腐蚀之喉
		["Felhounds_aura_245098"] = { enable = false, hl = false }, -- 腐蚀
		["Felhounds_aura_244768"] = { enable = true, hl = true }, -- 荒芜凝视
		["Felhounds_aura_244072"] = { enable = true, hl = true }, -- 熔火之触
		["Felhounds_aura_244091"] = { enable = true, hl = true }, -- 烧焦
		["Felhounds_logs_244057"] = { enable = true, hl = true }, -- 燃烧腐蚀
		["Felhounds_aura_248815"] = { enable = true, hl = true }, -- 燃烧腐蚀-点燃	
		["Felhounds_cast_244159"] = { enable = false, hl = true }, -- 吞噬引爆
		["Felhounds_aura_254429"] = { enable = true, hl = true }, -- 黑暗压迫
		["Felhounds_logs_244056"] = { enable = true, hl = true }, -- 虹吸腐蚀
		["Felhounds_aura_248819"] = { enable = true, hl = true }, -- 虹吸腐蚀-虹吸
		["Felhounds_aura_244055"] = { enable = true, hl = true }, -- 暗影触痕
		["Felhounds_aura_244054"] = { enable = true, hl = true }, -- 烈焰触痕
		["Felhounds_logs_245022"] = { enable = true, hl = true }, -- 织燃
		["Felhounds_logs_249113"] = { enable = true, hl = true }, -- 黑暗重构
		
		["HighCommand_auras_244892"] = { enable = false, hl = false }, -- 弱点攻击		
		["HighCommand_aura_257974"] = { enable = true, hl = false }, -- 混乱脉冲
		["HighCommand_aura_244737"] = { enable = true, hl = true }, -- 震荡手雷
		["HighCommand_aura_253290"] = { enable = true, hl = true }, -- 熵能爆裂
		["HighCommand_aura_244748"] = { enable = true, hl = true }, -- 震晕
		["HighCommand_aura_244910"] = { enable = true, hl = true }, -- 邪能护盾		
		["HighCommand_aura_244172"] = { enable = true, hl = true }, -- 灵能突袭
		["HighCommand_logs_244625"] = { enable = true, hl = true }, -- 齐射
		["HighCommand_logs_253039"] = { enable = true, hl = true }, -- 恶魔冲锋
		
		["Hasabel_auras_244016"] = { enable = false, hl = false }, -- 时空裂隙
		["Hasabel_aura_244383"] = { enable = true, hl = false }, -- 烈焰之盾
		["Hasabel_auras_244613"] = { enable = true, hl = false }, -- 永燃烈焰
		["Hasabel_auras_244849"] = { enable = true, hl = false }, -- 腐蚀烂泥
		["Hasabel_auras_245075"] = { enable = true, hl = false }, -- 饥饿幽影
		["Hasabel_auras_245118"] = { enable = true, hl = false }, -- 饱足幽影
		["Hasabel_aura_245050"] = { enable = true, hl = false }, -- 欺骗幻境
		["Hasabel_aura_245040"] = { enable = true, hl = true }, -- 腐蚀
		["Hasabel_logs_246208"] = { enable = true, hl = true }, -- 酸性之网
		["Hasabel_logs_243983"] = { enable = true, hl = true }, -- 崩塌的世界
		["Hasabel_logs_244000"] = { enable = true, hl = true }, -- 邪能风暴扫射
		["Hasabel_cast_257939"] = { enable = true, hl = false }, -- 火门计时器
		["Hasabel_cast_257941"] = { enable = true, hl = false }, -- 毒门计时器
		["Hasabel_cast_257942"] = { enable = true, hl = false }, -- 暗门计时器
		["Hasabel_aura_244709"] = { enable = true, hl = false }, -- 烈焰引爆
		
		["Eonar_aura_248332"] = { enable = true, hl = true }, -- 邪能之雨
		["Eonar_aura_249017"] = { enable = true, hl = false }, -- 反馈-奥术奇点
		["Eonar_aura_250693"] = { enable = true, hl = true }, -- 奥术奇点
		["Eonar_aura_249014"] = { enable = true, hl = false }, -- 反馈-邪污足迹
		["Eonar_aura_250140"] = { enable = true, hl = true }, -- 邪污足迹
		["Eonar_aura_249016"] = { enable = true, hl = false }, -- 反馈-目标锁定
		["Eonar_aura_249015"] = { enable = true, hl = false }, -- 反馈-燃烧的余烬
		["Eonar_aura_250691"] = { enable = true, hl = true }, -- 燃烧的余烬
		["Eonar_logs_248795"] = { enable = true, hl = true }, -- 邪能池
		["Eonar_cast_249121"] = { enable = true, hl = false }, -- 终极毁灭
		
		["Imonar_auras_247367"] = { enable = false, hl = false }, -- 震击之枪
		["Imonar_auras_250255"] = { enable = false, hl = false }, -- 强化震击之枪
		["Imonar_auras_247687"] = { enable = false, hl = false }, -- 撕裂
		["Imonar_msg_254244"] = { enable = true, hl = true }, -- 催眠气罐
		["Imonar_aura_255029"] = { enable = true, hl = true }, -- 催眠气罐
		["Imonar_aura_247565"] = { enable = true, hl = false }, -- 催眠毒气
		["Imonar_aura_250006"] = { enable = true, hl = false }, -- 强化脉冲手雷
		["Imonar_aura_247716"] = { enable = true, hl = true }, -- 充能轰炸
		["Imonar_logs_248254"] = { enable = true, hl = true }, -- 充能轰炸
		["Imonar_aura_247932"] = { enable = true, hl = true }, -- 霰弹爆破
		["Imonar_aura_248070"] = { enable = true, hl = true }, -- 强化霰弹爆破
		["Imonar_aura_247641"] = { enable = true, hl = true }, -- 静滞陷阱
		["Imonar_aura_250224"] = { enable = true, hl = true }, -- 震晕
		["Imonar_aura_247949"] = { enable = true, hl = true }, -- 霰弹爆破（转阶段）
		["Imonar_aura_248321"] = { enable = true, hl = true }, -- 洪荒烈火 250191 同名
		["Imonar_aura_248424"] = { enable = true, hl = false }, -- 聚合之力
		["Imonar_logs_254183"] = { enable = true, hl = true }, -- 灼伤皮肤
		
		["Kingaroth_auras_254919"] = { enable = false, hl = false }, -- 熔铸之击
		["Kingaroth_logs_246833"] = { enable = true, hl = true }, -- 毁灭者
		["Kingaroth_cast_246657"] = { enable = true, hl = true }, -- 歼灭
		["Kingaroth_aura_249535"] = { enable = true, hl = true }, -- 破坏术		
		["Kingaroth_aura_246687"] = { enable = true, hl = true }, -- 屠戮
		["Kingaroth_aura_249680"] = { enable = true, hl = true }, -- 轰鸣屠戮
		["Kingaroth_aura_246698"] = { enable = true, hl = true }, -- 破坏
		["Kingaroth_logs_246516"] = { enable = true, hl = true }, -- 天启协议
		
		["Varimathras_aura_243968"] = { enable = true, hl = false }, -- 烈焰折磨
		["Varimathras_aura_243977"] = { enable = true, hl = false }, -- 冰霜折磨
		["Varimathras_aura_243980"] = { enable = true, hl = false }, -- 邪能折磨
		["Varimathras_aura_243973"] = { enable = true, hl = false }, -- 暗影折磨
		["Varimathras_aura_243961"] = { enable = true, hl = true }, -- 哀难
		["Varimathras_aura_244094"] = { enable = true, hl = true }, -- 冥魂之拥
		["Varimathras_auras_244094"] = { enable = true, hl = true }, -- 冥魂之拥
		["Varimathras_aura_248732"] = { enable = true, hl = true }, -- 毁灭回响
		["Varimathras_logs_248740"] = { enable = true, hl = true }, -- 毁灭回响
		["Varimathras_logs_244005"] = { enable = true, hl = true }, -- 黑暗裂隙
		["Varimathras_aura_244042"] = { enable = true, hl = true }, -- 被标记的猎物
		
		["CovenofShivarra_auras_244899"] = { enable = false, hl = false }, -- 火焰打击
		["CovenofShivarra_aura_253753"] = { enable = true, hl = false }, -- 恐惧
		["CovenofShivarra_logs_245634"] = { enable = true, hl = true }, -- 飞旋的军刀
		["CovenofShivarra_aura_253520"] = { enable = true, hl = true }, -- 爆裂冲击
		["CovenofShivarra_logs_252861"] = { enable = true, hl = true }, -- 黑暗风暴 开始施法
		["CovenofShivarra_aura_253020"] = { enable = true, hl = true }, -- 黑暗风暴 debuff
		["CovenofShivarra_auras_245518"] = { enable = false, hl = false }, -- 快速冻结
		["CovenofShivarra_auras_245586"] = { enable = false, hl = false }, -- 冷凝之血 (256356 同名冻结) 
		["CovenofShivarra_aura_253697"] = { enable = true, hl = false }, -- 冰霜之球
		["CovenofShivarra_auras_250757"] = { enable = true, hl = true }, -- 宇宙之光
		["CovenofShivarra_aura_250097"] = { enable = true, hl = false }, -- 阿曼苏尔的诡诈
		["CovenofShivarra_logs_249863"] = { enable = true, hl = false }, -- 泰坦的面容
		["CovenofShivarra_msg_250095"] = { enable = true, hl = false }, -- 阿曼苏尔的痛苦
		["CovenofShivarra_msg_245671"] = { enable = true, hl = false }, -- 卡兹格罗斯的痛苦
		["CovenofShivarra_msg_246763"] = { enable = true, hl = false }, -- 高戈奈斯的痛苦
		["CovenofShivarra_msg_245910"] = { enable = true, hl = false }, -- 诺甘农的痛苦
		
		["Aggramar_auras_245990"] = { enable = false, hl = false }, -- 泰沙拉克之触
		["Aggramar_aura_245994"] = { enable = true, hl = true }, -- 灼热之焰
		["Aggramar_aura_254452"] = { enable = true, hl = true }, -- 饕餮烈焰
		["Aggramar_logs_245458"] = { enable = false, hl = true }, -- 破敌者 施法
		["Aggramar_logs_255059"] = { enable = false, hl = true }, -- 强化破敌者	施法	
		["Aggramar_auras_244291"] = { enable = false, hl = false }, -- 破敌者
		["Aggramar_auras_255060"] = { enable = false, hl = false }, -- 强化破敌者
		["Aggramar_logs_245463"] = { enable = false, hl = true }, -- 烈焰撕裂 施法
		["Aggramar_logs_255058"] = { enable = false, hl = true }, -- 强化烈焰撕裂 施法
		["Aggramar_aura_247079"] = { enable = true, hl = false }, -- 强化烈焰撕裂
		["Aggramar_logs_245301"] = { enable = true, hl = true }, -- 灼热风暴
		["Aggramar_logs_255061"] = { enable = true, hl = true }, -- 强化灼热风暴
		["Aggramar_aura_244912"] = { enable = true, hl = true }, -- 烈焰喷薄
		["Aggramar_logs_245916"] = { enable = true, hl = true }, -- 熔火残渣
		["Aggramar_aura_244736"] = { enable = true, hl = true }, -- 烈焰之迹
		["Aggramar_auras_255528"] = { enable = true, hl = true }, -- 烈焰绑带
		["Aggramar_aura_245631_boss2"] = { enable = true, hl = true }, -- 狂野烈焰
		["Aggramar_aura_245631_boss3"] = { enable = true, hl = true }, -- 狂野烈焰
		
		["Argus_logs_248167"] = { enable = true, hl = true }, -- 死亡之雾
		["Argus_aura_248396"] = { enable = true, hl = true }, -- 灵魂凋零
		["Argus_auras_248499"] = { enable = false, hl = false }, -- 巨镰横扫
		["Argus_aura_258646"] = { enable = true, hl = true }, -- 天空之赐
		["Argus_aura_253903"] = { enable = true, hl = false }, -- 天空之力
		["Argus_aura_258647"] = { enable = true, hl = true }, -- 海洋之赐
		["Argus_aura_253901"] = { enable = true, hl = false }, -- 海洋之力
		["Argus_aura_250669"] = { enable = true, hl = true }, -- 灵魂爆发
		["Argus_auras_250669"] = { enable = true, hl = false }, -- 灵魂爆发
		["Argus_aura_251570"] = { enable = true, hl = true }, -- 灵魂炸弹
		["Argus_auras_251570"] = { enable = true, hl = true }, -- 灵魂炸弹
		["Argus_auras_255199"] = { enable = false, hl = false }, -- 阿格拉玛的化身
		["Argus_aura_255200"] = { enable = true, hl = true }, -- 阿格拉玛的恩赐
		["Argus_aura_253021"] = { enable = true, hl = true }, -- 宿命
		["Argus_auras_252729"] = { enable = true, hl = true }, -- 宇宙射线
		["Argus_auras_252616"] = { enable = true, hl = true }, -- 宇宙道标
		["Argus_aura_252634"] = { enable = true, hl = false }, -- 宇宙重击
		["Argus_aura_256399"] = { enable = false, hl = true }, -- 凋零之根
		["Argus_aura_257299"] = { enable = true, hl = false }, -- 怒火余烬
		["Argus_auras_258039"] = { enable = false, hl = false }, -- 死亡之镰
		["Argus_aura_256899"] = { enable = true, hl = false }, -- 灵魂引爆
		["Argus_logs_256396"] = { enable = true, hl = true }, -- 重组脉冲
		["Argus_aura_257215"] = { enable = true, hl = false }, -- 泰坦造物
		["Argus_auras_258838"] = { enable = true, hl = false }, -- 碎魂之镰
		["Argus_aura_257966"] = { enable = true, hl = false }, -- 萨格拉斯的判决
		["Argus_aura_258000"] = { enable = true, hl = false }, -- 断裂羁绊
		["Argus_aura_257930"] = { enable = true, hl = false }, -- 毁灭之惧
		["Argus_aura_257911"] = { enable = true, hl = false }, -- 狂野怒意
		["Argus_msg_258068"] = { enable = true, hl = true }, -- 萨格拉斯的凝视
		["Argus_aura_257931"] = { enable = true, hl = false }, -- 萨格拉斯的恐惧
		["Argus_aura_257869"] = { enable = true, hl = false }, -- 萨格拉斯的狂怒
		["Argus_logs_258030"] = { enable = true, hl = true }, -- 天启领域
	},
	
	Texts = {
		["Argus_text_1"] = true, -- 灵魂凋零计数
		["Argus_text_2"] = true, -- 护送提示
		["Argus_text_3"] = true, -- 萨格拉斯的凝视
		["Argus_text_4"] = true, -- 萨格拉斯的判决
	},
	
	HealthPercAlerts = {
		--["boss_1810"] = true, -- test
		["boss_1992"] = true, -- 1
		["boss_1985"] = true, -- 4
		["boss_2009"] = true, -- 6
		["boss_1984"] = true, -- 10
		["boss_2031"] = true, -- 11
	},
	
	PowerAlerts = {
		--["boss_1810"] = true, -- test
		["boss_2025"] = true, -- 5
		["boss_2004"] = true, -- 7
		["boss_1983"] = true, -- 8
		["boss_1984"] = true, -- 10
		["boss_2031"] = true, -- 11
	},
	
	Sounds = {
		["1_246220"] = false, --邪能轰炸
		["1_246848"] = true, -- 引力毁灭
		["1_240277"] = true, -- 天启引擎
		["1_244969"] = true, -- 根除
		["1_244410"] = true, -- 屠戮
		["1_246919"] = true, -- 错乱屠戮
		["1_244294"] = true, -- 歼灭
		["1_247044"] = true, -- 错乱歼灭
		
		["2_251448"] = false,
		["2_244072"] = true,
		["2_244768"] = true,
		["2_244057"] = true,
		["2_251447"] = false,
		["2_244131"] = true,
		["2_254429"] = true,
		["2_244056"] = true,
		["2_244055"] = true,
		["2_244054"] = true,
		["2_245024"] = true, -- 被吞噬move
		["2_245022"] = true, -- 炽燃move
		
		["3_244625"] = true,
		["3_245304"] = false,
		["3_245227"] = true,
		["3_244892"] = false, -- tank
		["3_244722"] = true,
		["3_254130"] = true,
		["3_246505"] = false, -- 炎爆术
		["3_253039"] = false, -- 剑刃风暴(快走开)
		["3_244910"] = true, -- 邪能护盾
		["3_244947"] = true,
		
		["4_244016"] = false, -- tank
		["4_243983"] = true,
		["4_244000"] = true,
		["4_244689"] = true,
		["4_244613"] = true,
		["4_244849"] = true,
		["4_245118"] = true,
		["4_245075"] = true,
		["4_246208"] = true, -- 酸性之网move
		["4_245504"] = true, -- 咆哮暗影
		["4_244318"] = true, -- 火门开启
		["4_246082"] = true, -- 毒门开启
		["4_246157"] = true, -- 暗门开启
		["4_244607"] = true, -- 克索诺斯之焰
		["4_244915"] = true, -- 吸取精华
		["4_245040"] = true, -- 腐蚀
		
		["5_250030"] = true,
		["5_248861"] = true,
		["5_248332"] = true,
		["5_249121"] = true,
		["5_249017"] = true, -- 反馈奥术奇点 FIX 读音错误
		["5_250693"] = true,
		["5_249016"] = true,
		["5_249015"] = true,
		["5_250691"] = true,
		["5_249014"] = true,
		["5_248795"] = true, -- 邪能池move
		["5_250701"] = true, -- 邪能横扫
		
		["6_247367"] = false, -- tank
		["6_250255"] = false, -- tank
		["6_254244"] = true,
		["6_248068"] = true,
		["6_247687"] = false, -- tank
		["6_248254"] = true,
		["6_247923"] = true,
		["6_248070"] = true,
		["6_254183"] = true, -- 灼伤皮肤move

		["7_254919"] = false, -- tank
		["7_254926"] = true,
		["7_248214"] = true,
		["7_246833"] = true,
		["7_248375"] = true,
		["7_246657"] = true,
		["7_246687"] = true,
		["7_246698"] = true,
		["7_246516"] = true,
		
		["8_243968"] = true,
		["8_243977"] = true,
		["8_243980"] = true,
		["8_243973"] = true,
		["8_243961"] = true, -- FIX 读音错误 哀难
		["8_243960"] = false, -- tank
		["8_243999"] = true,
		["8_244042"] = true,
		["8_244093"] = true,
		["8_244094"] = true,
		["8_248732"] = true,
		["8_244005"] = true, -- 黑暗裂隙move
		["8_248740"] = true,
		
		["9_244899"] = false, -- tank
		["9_245627"] = true, -- 飞旋的军刀
		["9_253520"] = true,
		["9_246329"] = true,
		["9_252861"] = true,
		["9_245518"] = false, -- tank
		["9_245532"] = true,
		["9_253650"] = true,
		["9_250757"] = true,
		["9_250095"] = true, -- 阿曼苏尔的诡诈
		["9_245671"] = true, -- 卡兹格罗斯之焰
		["9_246763"] = true, -- 高戈奈斯之怒
		["9_245910"] = true, -- 诺甘农的幽灵军团

		["10_243431"] = false, -- tank
		["10_254452"] = true,
		["10_244912"] = true,
		["10_244693"] = true,
		["10_245458"] = true,
		["10_247079"] = true,
		["10_245301"] = true,
		["10_245983"] = true,
		["10_255061"] = true,
		["10_246037"] = true,
		["10_255059"] = true,
		["10_245463"] = true,
		["10_245994"] = true,
		["10_245916"] = true,
		["10_245631"] = true,
		
		["11_248165"] = true,
		["11_248317"] = true,
		["11_248396"] = true,
		["11_257296"] = true,
		["11_248499"] = false, -- tank
		["11_255594"] = true,
		["11_258646"] = true,
		["11_258647"] = true,
		["11_250669"] = true,
		["11_251570"] = true,
		["11_255839"] = true,
		["11_255199"] = false, -- tank
		["11_252729"] = true,
		["11_252616"] = true,
		["11_258039"] = false, -- tank
		["11_256396"] = true,
		["11_248167"] = true, -- 死亡之雾move
		["11_256388"] = true, -- 初始化序列
		["11_257215"] = true, -- 泰坦造物
		["11_258838"] = true, -- 碎魂之镰
		["11_257966"] = true,
		["11_258068"] = true, -- 萨格拉斯的凝视
		["11_258000"] = true,
		["11_257931"] = true,
		["11_257869"] = true,
		["11_258029"] = true, -- 初始化序列M
		["11_258030"] = true, -- 天启领域
	},
	
	HL_Spells = {
		--["hl_2061_3"] = true, -- 测试用
		--["hl_139_5"] = true, -- 测试用
		--["hl_774_d"] = true, -- 测试用
		
		["hl_244410_d"] = true, -- 屠戮
		["hl_246919_d"] = true, -- 错乱屠戮
		["hl_244072_d"] = true, -- 熔火之触
		["hl_244768_d"] = true, -- 荒芜凝视
		["hl_244737_d"] = true, -- 震荡手雷
		["hl_244172_i"] = true, -- 灵能突袭
		["hl_244613_i"] = true, -- 永燃烈焰
		["hl_244849_i"] = true, -- 腐蚀烂泥
		["hl_245118_i"] = true, -- 饱足幽影
		["hl_248332_d"] = true, -- 邪能之雨
		["hl_254244_3"] = true, -- 催眠气罐 检查时间
		["hl_246687_d"] = true, -- 屠戮
		["hl_249680_d"] = true, -- 轰鸣屠戮
		["hl_244094_d"] = true, -- 冥魂之拥
		["hl_253520_d"] = true, -- 爆裂脉冲
		["hl_245586_i"] = true, -- 冷凝之血
		["hl_250757_d"] = true, -- 宇宙之光
		["hl_254452_d"] = true, -- 饕餮烈焰
		["hl_248396_d"] = true, -- 灵魂凋零
		["hl_250669_d"] = true, -- 灵魂爆发
		["hl_251570_d"] = true, -- 灵魂炸弹
		["hl_252729_d"] = true, -- 宇宙射线
		
	},
	
	GS_Spells = {
		--["gs_48438"] = true,-- 测试用	
		--["gs_246698"] = true,
	},
	
	PlateAuras = {
		[244901] = true, -- 催化作用
		[244903] = true, -- 催化作用
		[247091] = true, -- 催化
		[245905] = true, -- 融火残渣
		[245631] = true, -- 狂野烈焰
		[255429] = true, -- 易伤
		[255425] = true, -- 易伤
		[255419] = true, -- 易伤
		[255422] = true, -- 易伤
		[255418] = true, -- 易伤
		[255430] = true, -- 易伤
		[255433] = true, -- 易伤
		[255496] = true, -- 宇宙之剑
		[255935] = true, -- 宇宙之力
		[255478] = true, -- 永恒之刃
		--[774] = true,-- 测试用		
		--[8936] = true,-- 测试用			
	},
	
	PlatePower = {
		["122532"] = true,
	},
	
	ChatMsgSpells = {
		--[48438] = true,-- 测试用		
		--[8936] = true,-- 测试用	
		[244410] = true, -- 屠戮
		[246919] = true, -- 错乱屠戮
		[244768] = true, -- 荒芜凝视
		[248815] = true, -- 点燃
		[254429] = true, -- 黑暗压迫
		[248819] = true, -- 虹吸
		[244737] = true, -- 震荡手雷
		[248332] = true, -- 邪能之雨
		[254244] = true, -- 催眠气罐 msg
		[249680] = true, -- 轰鸣屠戮
		[246687] = true, -- 屠戮
		[246698] = true, -- 破坏
		[244042] = true, -- 被标记的猎物
		[244094] = true, -- 冥魂之拥
		[248732] = true, -- 毁灭回响
		[253520] = true, -- 爆裂脉冲
		[250757] = true, -- 宇宙之光
		[254452] = true, -- 饕餮烈焰
		[245994] = true, -- 炽热之焰
		[258646] = true, -- 天空之赐
		[258647] = true, -- 海洋之赐
		[250669] = true, -- 灵魂爆发
		[251570] = true, -- 灵魂炸弹
		[252729] = true, -- 宇宙射线
		[252616] = true, -- 宇宙道标
	},
	

}

local Account_default_Settings = {

}

function T.LoadVariables()
	if ARM_CDB == nil then
		ARM_CDB = {}
	end
	for a, b in pairs(Character_default_Settings) do
		if type(b) ~= "table" then
			if ARM_CDB[a] == nil then
				ARM_CDB[a] = b
			end
		else
			if ARM_CDB[a] == nil then
				ARM_CDB[a] = {}
			end
			for k, v in pairs(b) do
				if ARM_CDB[a][k] == nil then
					ARM_CDB[a][k] = v
				end
			end
		end
	end
end

function T.LoadAccountVariables()
	if ARM_DB == nil then
		ARM_DB = {}
	end
	for a, b in pairs(Account_default_Settings) do
		if type(b) ~= "table" then
			if ARM_DB[a] == nil then
				ARM_DB[a] = b
			end
		else
			if ARM_DB[a] == nil then
				ARM_DB[a] = {}
			end
			for k, v in pairs(b) do
				if ARM_DB[a][k] == nil then
					if v then
						ARM_DB[a][k] = v
					else
						print(a,k)
					end
				end
			end
		end
	end
end

local eventframe = CreateFrame("Frame")
eventframe:RegisterEvent("ADDON_LOADED")
eventframe:SetScript("OnEvent", function(self, event, ...)
	local addon = ...
	if addon ~= G.addon_name then return end
	
	T.LoadVariables()
	T.LoadAccountVariables()
	ARM_DB["spells"] = {}
	for k, v in pairs(Character_default_Settings["Sounds"]) do
		local _, spellID = string.split("_", k)
		local spellName = GetSpellInfo(spellID)
		ARM_DB["spells"][k] = spellName
	end
end)