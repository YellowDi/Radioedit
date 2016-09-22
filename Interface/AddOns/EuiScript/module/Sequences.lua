--Title: GnomeSequencer
--Author: Semlar
--from http://bbs.ngacn.cc/read.php?tid=7454965&_ff=7&_fp=2
--2015.04.08
local E = unpack(ElvUI)
local Sequences = {}
local strlower,strjoin = string.lower,strjoin --eui.cc
if not E.db.Sequences.enable then return; end
local _, Sequences = ... -- Don't touch this

----
-- Rename this file to Sequences.lua before you get started, it uses a different file name so as not to overwrite your existing file with a future update.
-- Every entry in the Sequences table defines a single sequence of macros which behave similarly to /castsequence.
-- Sequence names must be unique and contain no more than 16 characters.
-- To use a macro sequence, create a blank macro in-game with the same name you picked for the sequence here and it will overwrite it.
----

----
-- Here's a large demonstration sequence documenting the format:


-------------------------------------------------   D   ------------------------------------------------- 


Sequences['芒果熊'] = {
    StepFunction = [[
        limit = limit or 1
        if step == limit then
            limit = limit % #macros + 1
            step = 1
        else
            step = step % #macros + 1
        end
    ]],
PreMacro = [[
/console Sound_EnableSFX 0
/cast [nostance:1] 熊形态(变形)
/targetenemy [noharm][dead]
/startattack
]],
        '/cast !裂伤',
        '/castsequence reset=10/combat 粉碎,重殴',
        '/castsequence reset=10/combat 痛击,割伤,割伤,割伤',
        '/cast !裂伤',
PostMacro = [[
/cast !狂暴
/cast !树皮术
/cast !野蛮防御
/cast !自然的守护
/use [combat]13
/use [combat]14
/script UIErrorsFrame:Clear()
/console Sound_EnableSFX 1
]],
}


Sequences['塞梦猫'] = {
    StepFunction = [[
        limit = limit or 1
        if step == limit then
            limit = limit % #macros + 1
            step = 1
        else
            step = step % #macros + 1
        end
    ]],
PreMacro = [[
/console Sound_EnableSFX 0
/cast [nocombat]!潜行
/cast [nostance:2] 猎豹形态(变形)
/targetenemy [noharm][dead]
/startattack
]],
        '/castsequence reset=5 斜掠,痛击,撕碎,撕碎,撕碎,割裂,撕碎,撕碎,撕碎,撕碎,凶猛撕咬',
[[
/console autounshift 0
/cast !治疗之触
/console autounshift 1
]],
PostMacro = [[
/cast [combat]狂暴
/cast [combat]猛虎之怒
/use [combat]13
/use [combat]14
/script UIErrorsFrame:Clear()
/console Sound_EnableSFX 1
]],
}


Sequences['月火猫'] = {
    StepFunction = [[
        limit = limit or 1
        if step == limit then
            limit = limit % #macros + 1
            step = 1
        else
            step = step % #macros + 1
        end
    ]],
PreMacro = [[
/console Sound_EnableSFX 0
/cast [nocombat]!潜行
/cast [nostance:2] 猎豹形态(变形)
/targetenemy [noharm][dead]
/startattack
]],
        '/castsequence reset=5 斜掠,月火术,撕碎,撕碎,撕碎,割裂,痛击,撕碎,撕碎,撕碎,撕碎,凶猛撕咬',
[[
/console autounshift 0
/cast !治疗之触
/console autounshift 1
]],
PostMacro = [[
/cast [combat]狂暴
/cast [combat]猛虎之怒
/use [combat]13
/use [combat]14
/script UIErrorsFrame:Clear()
/console Sound_EnableSFX 1
]],
}


Sequences['鹌鹑1'] = {
    StepFunction = [[
        limit = limit or 1
        if step == limit then
            limit = limit % #macros + 1
            step = 1
        else
            step = step % #macros + 1
        end
    ]],
PreMacro = [[
/console Sound_EnableSFX 0
/cast [nostance:4] 枭兽形态
/targetenemy [noharm][dead]
]],
        '/castsequence reset=6/target/combat 月火术(月光),愤怒,愤怒,愤怒,愤怒,愤怒,愤怒,愤怒,愤怒,愤怒,愤怒',
PostMacro = [[
/cast !星涌术(日光和月光)
/cast !自然的守护
/cast !自然之力(平衡，天赋)
/use [combat]13
/use [combat]14
/script UIErrorsFrame:Clear()
/console Sound_EnableSFX 1
]],
}


Sequences['鹌鹑2'] = {
    StepFunction = [[
        limit = limit or 1
        if step == limit then
            limit = limit % #macros + 1
            step = 1
        else
            step = step % #macros + 1
        end
    ]],
PreMacro = [[
/console Sound_EnableSFX 0
/cast [nostance:4] 枭兽形态
/targetenemy [noharm][dead]
]],
        '/castsequence reset=6/target/combat 月火术(月光),星火术,星火术,星火术,星火术,星火术,星火术,星火术',
PostMacro = [[
/cast !星涌术(日光和月光)
/cast !超凡之盟
/cast !自然的守护
/cast !自然之力(平衡，天赋)
/use [combat]13
/use [combat]14
/script UIErrorsFrame:Clear()
/console Sound_EnableSFX 1
]],
}

-------------------------------------------------   DZ   ------------------------------------------------- 


Sequences['战斗'] = {
    StepFunction = [[
        limit = limit or 1
        if step == limit then
            limit = limit % #macros + 1
            step = 1
        else
            step = step % #macros + 1
        end
    ]],
PreMacro = [[
/console Sound_EnableSFX 0
/cast [nocombat]复原
/targetenemy [noharm][dead]
/startattack
]],
        '/castsequence reset=10/target/combat 要害打击,影袭,切割,影袭,影袭,影袭,影袭,刺骨,影袭,影袭,影袭,影袭,刺骨',
        '/cast !影舞步',
PostMacro = [[
/cast !冲动
/cast !血性狂怒
/cast !备战就绪
/use [combat]13
/use [combat]14
/script UIErrorsFrame:Clear()
/console Sound_EnableSFX 1
]],
}


Sequences['刺杀'] = {
    StepFunction = [[
        limit = limit or 1
        if step == limit then
            limit = limit % #macros + 1
            step = 1
        else
            step = step % #macros + 1
        end
    ]],
PreMacro = [[
/console Sound_EnableSFX 0
/cast [nocombat]复原
/targetenemy [noharm][dead]
/startattack
]],
        '/cast !斩击',
        '/castsequence reset=10/target/combat 毁伤,毁伤,割裂,毁伤,毁伤,毒伤,毁伤,毁伤,毒伤,毁伤,毁伤,毒伤',
        '/cast !宿敌',
PostMacro = [[
/cast !血性狂怒
/cast !备战就绪
/use [combat]13
/use [combat]14
/script UIErrorsFrame:Clear()
/console Sound_EnableSFX 1
]],
}
-------------------------------------------------   LR   ------------------------------------------------- 


Sequences['飞刃射击'] = {
    StepFunction = [[
        limit = limit or 1
        if step == limit then
            limit = limit % #macros + 1
            step = 1
        else
            step = step % #macros + 1
        end
    ]],
PreMacro = [[
/console Sound_EnableSFX 0
/targetenemy [noharm][dead]
/startattack
]],
        '/cast !飞刃',
        '/cast !夺命射击',
        '/castsequence reset=8 !奇美拉射击,稳固射击,稳固射击',
        '/castsequence reset=3 !瞄准射击,稳固射击',
        '/cast !夺命射击',
PostMacro = [[
/cast !胁迫
/cast !狂暴
/cast !急速射击
/use [combat]13
/use [combat]14
/script UIErrorsFrame:Clear()
/console Sound_EnableSFX 1
]],
}


Sequences['弹幕射击'] = {
    StepFunction = [[
        limit = limit or 1
        if step == limit then
            limit = limit % #macros + 1
            step = 1
        else
            step = step % #macros + 1
        end
    ]],
PreMacro = [[
/console Sound_EnableSFX 0
/targetenemy [noharm][dead]
/startattack
]],
        '/cast [nochanneling:弹幕射击] 弹幕射击',
        '/cast [nochanneling:弹幕射击] 夺命射击',
        '/castsequence reset=8 [nochanneling:弹幕射击] 奇美拉射击,稳固射击,稳固射击',
        '/castsequence reset=3 [nochanneling:弹幕射击] 瞄准射击,稳固射击',
        '/cast [nochanneling:弹幕射击] 夺命射击',
PostMacro = [[
/cast [nochanneling:弹幕射击] 胁迫
/cast [nochanneling:弹幕射击] 狂暴
/cast [nochanneling:弹幕射击] 急速射击
/use [combat]13
/use [combat]14
/script UIErrorsFrame:Clear()
/console Sound_EnableSFX 1
]],
}


Sequences['飞刃兽王'] = {
    StepFunction = [[
        limit = limit or 1
        if step == limit then
            limit = limit % #macros + 1
            step = 1
        else
            step = step % #macros + 1
        end
    ]],
PreMacro = [[
/console Sound_EnableSFX 0
/targetenemy [noharm][dead]
/startattack
]],
        '/cast !夺命黑鸦',
        '/cast !夺命射击',
        '/castsequence reset=6 !眼镜蛇射击,杀戮命令,眼镜蛇射击,奥术射击',
        '/castsequence reset=15 !飞刃,凶暴野兽,飞刃,飞刃,凶暴野兽,飞刃,集中火力',
        '/cast !夺命射击',
PostMacro = [[
/cast !胁迫
/cast !狂暴
/cast !狂野怒火
/use [combat]13
/use [combat]14
/script UIErrorsFrame:Clear()
/console Sound_EnableSFX 1
]],
}


Sequences['弹幕兽王'] = {
    StepFunction = [[
        limit = limit or 1
        if step == limit then
            limit = limit % #macros + 1
            step = 1
        else
            step = step % #macros + 1
        end
    ]],
PreMacro = [[
/console Sound_EnableSFX 0
/targetenemy [noharm][dead]
/startattack
]],
        '/cast [nochanneling:弹幕射击] 弹幕射击',
        '/cast [nochanneling:弹幕射击] 夺命射击',
        '/castsequence reset=5 [nochanneling:弹幕射击] 杀戮命令,眼镜蛇射击,奥术射击,眼镜蛇射击',
        '/cast [nochanneling:弹幕射击] 凶暴野兽',
        '/cast [nochanneling:弹幕射击] 夺命射击',
PostMacro = [[
/cast [nochanneling:弹幕射击] 胁迫
/cast [nochanneling:弹幕射击] 狂暴
/cast [nochanneling:弹幕射击] 狂野怒火
/use [combat]13
/use [combat]14
/script UIErrorsFrame:Clear()
/console Sound_EnableSFX 1
]],
}


Sequences['生存'] = {
    StepFunction = [[
        limit = limit or 1
        if step == limit then
            limit = limit % #macros + 1
            step = 1
        else
            step = step % #macros + 1
        end
    ]],
PreMacro = [[
/console Sound_EnableSFX 0
/targetenemy [noharm][dead]
/startattack
]],
        '/cast !黑箭',
        '/castsequence reset=1.5 !爆炸射击,奥术射击,眼镜蛇射击',
        '/cast !飞刃',
        '/castsequence reset=1.5 !爆炸射击,奥术射击,眼镜蛇射击',
        '/cast !眼镜蛇射击',
PostMacro = [[
/cast !胁迫
/cast !狂暴
/use [combat]13
/use [combat]14
/script UIErrorsFrame:Clear()
/console Sound_EnableSFX 1
]],
}

-------------------------------------------------   MS   ------------------------------------------------- 


Sequences['断鞭'] = {
    StepFunction = [[
        limit = limit or 1
        if step == limit then
            limit = limit % #macros + 1
            step = 1
        else
            step = step % #macros + 1
        end
    ]],
PreMacro = [[
/console Sound_EnableSFX 0
/cast [noform] !暗影形态
/targetenemy [noharm][dead]
]],
        '/cast [nochanneling] 精神鞭笞',
        '/castsequence [nochanneling:狂乱] 心灵震爆,心灵震爆,心灵震爆,噬灵疫病',
        '/castsequence [nochanneling:狂乱] reset=10/target/combat 暗言术：痛,吸血鬼之触,神圣之星',
        '/cast !暗言术：灭',
PostMacro = [[
/cast [nochanneling:狂乱] 暗影魔
/cast [nochanneling:狂乱] 吸血鬼的拥抱
/use [combat]13
/use [combat]14
/script UIErrorsFrame:Clear()
/console Sound_EnableSFX 1
]],
}


Sequences['尖刺'] = {
    StepFunction = [[
        limit = limit or 1
        if step == limit then
            limit = limit % #macros + 1
            step = 1
        else
            step = step % #macros + 1
        end
    ]],
PreMacro = [[
/console Sound_EnableSFX 0
/cast [noform] !暗影形态
/targetenemy [noharm][dead]
]],
        '/castsequence [nochanneling:狂乱] 心灵震爆,心灵震爆,心灵震爆,吸血鬼之触,暗言术：痛,噬灵疫病,精神鞭笞',
        '/cast !暗言术：灭',
        '/cast [nochanneling:狂乱] 心灵震爆',
        '/cast [nochanneling:狂乱] 心灵尖刺',
PostMacro = [[
/cast [nochanneling:狂乱] 暗影魔
/cast [nochanneling:狂乱] 吸血鬼的拥抱
/use [combat]13
/use [combat]14
/script UIErrorsFrame:Clear()
/console Sound_EnableSFX 1
]],
}

-------------------------------------------------   QS   ------------------------------------------------- 


Sequences['防骑'] = {
    StepFunction = [[
        limit = limit or 1
        if step == limit then
            limit = limit % #macros + 1
            step = 1
        else
            step = step % #macros + 1
        end
    ]],
PreMacro = [[
/console Sound_EnableSFX 0
/targetenemy [noharm][dead]
/startattack
]],
        '/cast !审判',
        '/cast !愤怒之锤',
        '/castsequence reset=6/combat 圣洁护盾,十字军打击,奉献,正义之锤,圣洁护盾,十字军打击,神圣愤怒,圣洁护盾,正义之锤,奉献,十字军打击,圣洁护盾,正义之锤,神圣愤怒',
        '/cast !神圣棱镜',
PostMacro = [[
/cast !圣佑术
/cast !正义盾击
/cast !神圣复仇者
/use [combat]13
/use [combat]14
/script UIErrorsFrame:Clear()
/console Sound_EnableSFX 1
]],
}


Sequences['惩戒'] = {
    StepFunction = [[
        limit = limit or 1
        if step == limit then
            limit = limit % #macros + 1
            step = 1
        else
            step = step % #macros + 1
        end
    ]],
PreMacro = [[
/console Sound_EnableSFX 0
/targetenemy [noharm][dead]
/startattack
]],
        '/cast !驱邪术',
        '/cast !愤怒之锤',
        '/castsequence reset=6 最终审判,神圣风暴',
        '/castsequence reset=6 十字军打击,审判',
PostMacro = [[
/cast !圣佑术
/cast !复仇之怒
/use [combat]13
/use [combat]14
/script UIErrorsFrame:Clear()
/console Sound_EnableSFX 1
]],
}

-------------------------------------------------   SM   ------------------------------------------------- 


Sequences['增强'] = {
    StepFunction = [[
        limit = limit or 1
        if step == limit then
            limit = limit % #macros + 1
            step = 1
        else
            step = step % #macros + 1
        end
    ]],
PreMacro = [[
/console Sound_EnableSFX 0
/targetenemy [noharm][dead]
/startattack
]],
        '/cast !风暴打击',
        '/cast !熔岩猛击',
        '/castsequence reset=10/target/combat 烈焰震击,冰霜震击,冰霜震击',
        '/cast !火焰新星',
        '/cast !元素释放',
PostMacro = [[
/cast !幽魂步
/cast !血性狂怒
/cast !先祖指引
/cast !萨满之怒
/cast !星界转移
/cast !元素掌握
/cast !纳鲁的赐福
/use [combat]13
/use [combat]14
/script UIErrorsFrame:Clear()
/console Sound_EnableSFX 1
]],
}


Sequences['元素1'] = {
    StepFunction = [[
        limit = limit or 1
        if step == limit then
            limit = limit % #macros + 1
            step = 1
        else
            step = step % #macros + 1
        end
    ]],
PreMacro = [[
/console Sound_EnableSFX 0
/targetenemy [noharm][dead]
]],
        '/cast !熔岩爆裂',
        '/castsequence reset=5/target/combat 烈焰震击,大地震击,大地震击,大地震击',
        '/cast !火焰释放',
        '/cast !闪电链',
PostMacro = [[
/cast !血性狂怒
/cast !萨满之怒
/cast !先祖指引
/cast !星界转移
/cast !纳鲁的赐福
/use [combat]13
/use [combat]14
/script UIErrorsFrame:Clear()
/console Sound_EnableSFX 1
]],
}


Sequences['元素2'] = {
    StepFunction = [[
        limit = limit or 1
        if step == limit then
            limit = limit % #macros + 1
            step = 1
        else
            step = step % #macros + 1
        end
    ]],
PreMacro = [[
/console Sound_EnableSFX 0
/targetenemy [noharm][dead]
]],
        '/cast !熔岩爆裂',
        '/castsequence reset=5/target/combat 烈焰震击,大地震击,大地震击,大地震击',
        '/cast !火焰释放',
        '/cast !闪电箭',
PostMacro = [[
/cast !血性狂怒
/cast !萨满之怒
/cast !先祖指引
/cast !星界转移
/cast !纳鲁的赐福
/use [combat]13
/use [combat]14
/script UIErrorsFrame:Clear()
/console Sound_EnableSFX 1
]],
}
-------------------------------------------------   SS   ------------------------------------------------- 


Sequences['毁灭'] = {
    StepFunction = [[
        limit = limit or 1
        if step == limit then
            limit = limit % #macros + 1
            step = 1
        else
            step = step % #macros + 1
        end
    ]],
PreMacro = [[
/console Sound_EnableSFX 0
/targetenemy [noharm][dead]
]],
        '/castsequence reset=10/target/combat 献祭,烧尽,烧尽,烧尽,烧尽,燃烧,烧尽,烧尽,献祭,烧尽,烧尽,烧尽,燃烧,烧尽',
        '/cast !混乱之箭',
        '/cast !暗影灼烧',
PostMacro = [[
/cast !不灭决心
/cast !黑暗灵魂：易爆
/use [combat]13
/use [combat]14
/script UIErrorsFrame:Clear()
/console Sound_EnableSFX 1
]],
}


Sequences['痛苦'] = {
    StepFunction = [[
        limit = limit or 1
        if step == limit then
            limit = limit % #macros + 1
            step = 1
        else
            step = step % #macros + 1
        end
    ]],
PreMacro = [[
/console Sound_EnableSFX 0
/targetenemy [noharm][dead]
]],
        '/castsequence [nochanneling:吸取灵魂] reset=10/target/combat 痛苦无常,腐蚀术,吸取灵魂,吸取灵魂,痛苦无常,腐蚀术,吸取灵魂,吸取灵魂,生命分流',
        '/castsequence [nochanneling:吸取灵魂] reset=10/target/combat 痛楚,鬼影缠身,吸取灵魂,吸取灵魂,吸取灵魂',
PostMacro = [[
/cast !不灭决心
/cast !黑暗灵魂：哀难
/use [combat]13
/use [combat]14
/script UIErrorsFrame:Clear()
/console Sound_EnableSFX 1
]],
}


Sequences['恶魔1'] = {
    StepFunction = [[
        limit = limit or 1
        if step == limit then
            limit = limit % #macros + 1
            step = 1
        else
            step = step % #macros + 1
        end
    ]],
PreMacro = [[
/console Sound_EnableSFX 0
/cancelaura 恶魔变形
/targetenemy [noharm][dead]
]],
        '/castsequence reset=6/target/combat 腐蚀术,暗影箭,暗影箭,暗影箭,暗影箭,灵魂之火,生命分流',
        '/castsequence reset=6/target/combat 古尔丹之手,灵魂之火',
PostMacro = [[
/cast !不灭决心
/cast !黑暗灵魂：学识
/cast !基尔加丹的狡诈
/use [combat]13
/use [combat]14
/script UIErrorsFrame:Clear()
/console Sound_EnableSFX 1
]],
}


Sequences['恶魔2'] = {
    StepFunction = [[
        limit = limit or 1
        if step == limit then
            limit = limit % #macros + 1
            step = 1
        else
            step = step % #macros + 1
        end
    ]],
PreMacro = [[
/console Sound_EnableSFX 0
/cast !恶魔变形
/targetenemy [noharm][dead]
]],
        '/castsequence reset=6/target/combat 末日降临,混乱之触,混乱之触,混乱之触,混乱之触,混乱之触,混乱之触,混乱之触,混乱之触,混乱之触,混乱之触',
        '/castsequence reset=6/target/combat 混乱波浪,灵魂之火,灵魂之火',
PostMacro = [[
/cast !不灭决心
/cast !黑暗灵魂：学识
/cast !基尔加丹的狡诈
/use [combat]13
/use [combat]14
/script UIErrorsFrame:Clear()
/console Sound_EnableSFX 1
]],
}

-------------------------------------------------   DK   ------------------------------------------------- 


Sequences['鲜血'] = {
    StepFunction = [[
        limit = limit or 1
        if step == limit then
            limit = limit % #macros + 1
            step = 1
        else
            step = step % #macros + 1
        end
    ]],
PreMacro = [[
/console Sound_EnableSFX 0
/targetenemy [noharm][dead]
/startattack
]],
        '/cast !灵界打击',
        '/castsequence reset=10/target/combat 爆发,凋零缠绕,凋零缠绕,凋零缠绕,凋零缠绕,凋零缠绕,凋零缠绕,凋零缠绕,凋零缠绕,凋零缠绕,凋零缠绕,凋零缠绕,凋零缠绕,凋零缠绕,凋零缠绕,凋零缠绕,凋零缠绕,凋零缠绕,凋零缠绕,凋零缠绕',
        '/cast !血液沸腾',
        '/cast !灵魂收割',
PostMacro = [[
/cast !白骨之盾
/cast !符文刃舞
/cast !反魔法护罩
/cast !吸血鬼之血
/use [combat]13
/use [combat]14
/script UIErrorsFrame:Clear()
/console Sound_EnableSFX 1
]],
}


Sequences['冰霜DK'] = {
    StepFunction = [[
        limit = limit or 1
        if step == limit then
            limit = limit % #macros + 1
            step = 1
        else
            step = step % #macros + 1
        end
    ]],
PreMacro = [[
/console Sound_EnableSFX 0
/targetenemy [noharm][dead]
/startattack
]],
        '/cast !湮没',
        '/castsequence reset=10/target/combat 爆发,冰霜打击,冰霜打击,冰霜打击,冰霜打击,冰霜打击,冰霜打击,冰霜打击,冰霜打击,冰霜打击,冰霜打击,冰霜打击,冰霜打击,冰霜打击,冰霜打击,冰霜打击,冰霜打击,冰霜打击,冰霜打击,冰霜打击',
        '/cast !冷酷严冬',
        '/cast !凛风冲击',
PostMacro = [[
/cast !冰霜之柱
/cast !反魔法护罩
/use [combat]13
/use [combat]14
/script UIErrorsFrame:Clear()
/console Sound_EnableSFX 1
]],
}


Sequences['邪恶'] = {
    StepFunction = [[
        limit = limit or 1
        if step == limit then
            limit = limit % #macros + 1
            step = 1
        else
            step = step % #macros + 1
        end
    ]],
PreMacro = [[
/console Sound_EnableSFX 0
/targetenemy [noharm][dead]
/startattack
]],
        '/cast !天灾打击',
        '/cast !脓疮打击',
        '/castsequence reset=10/target/combat 爆发,凋零缠绕,凋零缠绕,凋零缠绕,凋零缠绕,凋零缠绕,凋零缠绕,凋零缠绕,凋零缠绕,凋零缠绕,凋零缠绕,凋零缠绕,凋零缠绕,凋零缠绕,凋零缠绕,凋零缠绕,凋零缠绕,凋零缠绕,凋零缠绕,凋零缠绕',
        '/cast !黑暗突变',
        '/cast !冷酷严冬',
PostMacro = [[
/cast !反魔法护罩
/use [combat]13
/use [combat]14
/script UIErrorsFrame:Clear()
/console Sound_EnableSFX 1
]],
}

-------------------------------------------------   WS   ------------------------------------------------- 


Sequences['凝神酒仙'] = {
    StepFunction = [[
        limit = limit or 1
        if step == limit then
            limit = limit % #macros + 1
            step = 1
        else
            step = step % #macros + 1
        end
    ]],
PreMacro = [[
/console Sound_EnableSFX 0
/targetenemy [noharm][dead]
/startattack
]],
        '/castsequence reset=10/combat 醉酿投,醉酿投,真气波',
        '/castsequence reset=10/combat 猛虎掌,猛虎掌,猛虎掌,贯日击,幻灭踢,飘渺酒,猛虎掌,猛虎掌,猛虎掌,贯日击,幻灭踢',
        '/castsequence reset=10/combat 移花接木,移花接木,火焰之息',
        '/cast !贯日击',
PostMacro = [[
/cast !金钟罩
/cast !散魔功
/cast !壮胆酒
/use [combat]13
/use [combat]14
/script UIErrorsFrame:Clear()
/console Sound_EnableSFX 1
]],
}


Sequences['气破酒仙'] = {
    StepFunction = [[
        limit = limit or 1
        if step == limit then
            limit = limit % #macros + 1
            step = 1
        else
            step = step % #macros + 1
        end
    ]],
PreMacro = [[
/console Sound_EnableSFX 0
/targetenemy [noharm][dead]
/startattack
]],
        '/castsequence reset=10/combat 醉酿投,醉酿投,真气波',
        '/castsequence reset=10/combat 猛虎掌,猛虎掌,猛虎掌,贯日击,真气破,飘渺酒,猛虎掌,猛虎掌,猛虎掌,贯日击,真气破',
        '/castsequence reset=10/combat 移花接木,移花接木,火焰之息',
        '/cast !贯日击',
PostMacro = [[
/cast !金钟罩
/cast !散魔功
/cast !壮胆酒
/use [combat]13
/use [combat]14
/script UIErrorsFrame:Clear()
/console Sound_EnableSFX 1
]],
}


Sequences['踏风'] = {
    StepFunction = [[
        limit = limit or 1
        if step == limit then
            limit = limit % #macros + 1
            step = 1
        else
            step = step % #macros + 1
        end
    ]],
PreMacro = [[
/console Sound_EnableSFX 0
/targetenemy [noharm][dead]
/startattack
]],
        '/castsequence [nochanneling:怒雷破] reset=8/combat 猛虎掌,旭日东升踢,幻灭踢,幻灭踢,旭日东升踢,猛虎掌,幻灭踢,幻灭踢,旭日东升踢,幻灭踢,怒雷破,虎眼酒',
        '/castsequence [nochanneling:怒雷破] reset=8/combat 移花接木,真气波',
        '/cast [nochanneling:怒雷破] 贯日击',
PostMacro = [[
/cast !豪能酒
/cast !散魔功
/cast !业报之触
/cast !白虎下凡
/use [combat]13
/use [combat]14
/script UIErrorsFrame:Clear()
/console Sound_EnableSFX 1
]],
}

-------------------------------------------------   ZS   ------------------------------------------------- 


Sequences['防战'] = {
    StepFunction = [[
        limit = limit or 1
        if step == limit then
            limit = limit % #macros + 1
            step = 1
        else
            step = step % #macros + 1
        end
    ]],
PreMacro = [[
/console Sound_EnableSFX 0
/targetenemy [noharm][dead]
/startattack
]],
        '/cast !复仇',
        '/cast !盾牌猛击',
        '/castsequence reset=10/combat 震荡波,雷霆一击,雷霆一击,雷霆一击,雷霆一击',
        '/cast !乘胜追击',
        '/cast !毁灭打击',
PostMacro = [[
/cast !盾牌格挡
/cast !浴血奋战
/cast !狂暴之怒
/cast !挫志怒吼
/use [combat]13
/use [combat]14
/script UIErrorsFrame:Clear()
/console Sound_EnableSFX 1
]],
}


Sequences['角斗'] = {
    StepFunction = [[
        limit = limit or 1
        if step == limit then
            limit = limit % #macros + 1
            step = 1
        else
            step = step % #macros + 1
        end
    ]],
PreMacro = [[
/console Sound_EnableSFX 0
/targetenemy [noharm][dead]
/startattack
]],
        '/cast !复仇',
        '/cast !盾牌猛击',
        '/castsequence reset=15/target/combat 胜利在望,雷霆一击,风暴之锤,雷霆一击',
        '/cast !毁灭打击',
        '/cast !斩杀',
PostMacro = [[
/cast !盾牌冲锋
/cast !浴血奋战
/cast !狂暴之怒
/cast !挫志怒吼
/cast !英勇打击
/use [combat]13
/use [combat]14
/script UIErrorsFrame:Clear()
/console Sound_EnableSFX 1
]],
}


Sequences['武器'] = {
    StepFunction = [[
        limit = limit or 1
        if step == limit then
            limit = limit % #macros + 1
            step = 1
        else
            step = step % #macros + 1
        end
    ]],
PreMacro = [[
/console Sound_EnableSFX 0
/targetenemy [noharm][dead]
/startattack
]],
        '/cast !巨人打击',
        '/cast !致死打击',
        '/castsequence reset=15/target/combat 撕裂,猛击,猛击,猛击,猛击,猛击,猛击',
        '/castsequence reset=15/target/combat 胜利在望,雷霆一击,风暴之锤,雷霆一击',
        '/cast !斩杀',
PostMacro = [[
/cast !鲁莽
/cast !浴血奋战
/cast !狂暴之怒
/use [combat]13
/use [combat]14
/script UIErrorsFrame:Clear()
/console Sound_EnableSFX 1
]],
}


Sequences['狂怒'] = {
    StepFunction = [[
        limit = limit or 1
        if step == limit then
            limit = limit % #macros + 1
            step = 1
        else
            step = step % #macros + 1
        end
    ]],
PreMacro = [[
/console Sound_EnableSFX 0
/targetenemy [noharm][dead]
/startattack
]],
        '/cast !嗜血',
        '/cast !怒击',
        '/castsequence reset=15/target/combat 胜利在望,雷霆一击,风暴之锤,雷霆一击',
        '/cast !狂风打击',
        '/cast !斩杀',
PostMacro = [[
/cast !鲁莽
/cast !浴血奋战
/cast !狂暴之怒
/use [combat]13
/use [combat]14
/script UIErrorsFrame:Clear()
/console Sound_EnableSFX 1
]],
}

-------------------------------------------------   FS   ------------------------------------------------- 


Sequences['奥术'] = {
    StepFunction = [[
        limit = limit or 1
        if step == limit then
            limit = limit % #macros + 1
            step = 1
        else
            step = step % #macros + 1
        end
    ]],
PreMacro = [[
/console Sound_EnableSFX 0
/targetenemy [noharm][dead]
]],
        '/castsequence [nochanneling:奥术飞弹] reset=25 隐没,寒冰护体,隐没',
        '/castsequence [nochanneling:奥术飞弹] reset=12 奥术冲击,奥术冲击,奥术冲击,奥术冲击,虚空风暴,奥术弹幕',
        '/cast [nochanneling:奥术飞弹] 奥术飞弹',
PostMacro = [[
/cast [nochanneling:奥术飞弹] 奥术强化
/cast [nochanneling:奥术飞弹] 气定神闲
/use [combat]13
/use [combat]14
/script UIErrorsFrame:Clear()
/console Sound_EnableSFX 1
]],
}

Sequences['冰霜'] = {
    StepFunction = [[
        limit = limit or 1
        if step == limit then
            limit = limit % #macros + 1
            step = 1
        else
            step = step % #macros + 1
        end
    ]],
PreMacro = [[
/console Sound_EnableSFX 0
/targetenemy [noharm][dead]
/startattack
]],
        '/castsequence [nochanneling] reset=15 寒冰宝珠,寒冰护体',
        '/castsequence [nochanneling] reset=10 寒冰箭,寒冰箭,冰枪术,寒冰箭,寒冰箭,冰枪术,霜火之箭',
        '/castsequence [nochanneling] reset=15 深度冻结,彗星风暴',
PostMacro = [[
/cast !浮冰
/cast !寒冰新星
/cast !冰冷血脉
/use [combat]13
/use [combat]14
/script UIErrorsFrame:Clear()
/console Sound_EnableSFX 1
]],
}


--core.lua

local CastCmds = { use = true, cast = true, spell = true }
local function UpdateIcon(self)
	local step = self:GetAttribute('step') or 1
	local button = self:GetName()
	local macro, foundSpell, notSpell = Sequences[button][step], false, ''
	for cmd, etc in gmatch(macro or '', '/(%w+)%s+([^\n]+)') do
		if CastCmds[strlower(cmd)] then
			local spell, target = SecureCmdOptionParse(etc)
			if spell then
				if GetSpellInfo(spell) then
					SetMacroSpell(button, spell, target)
					foundSpell = true
					break
				elseif notSpell == '' then
					notSpell = spell
				end
			end
		end
	end
	if not foundSpell then SetMacroItem(button, notSpell) end
end

local OnClick = [=[
	local step = self:GetAttribute('step')
	self:SetAttribute('macrotext', self:GetAttribute('PreMacro') .. macros[step] .. self:GetAttribute('PostMacro'))
	%s
	if not step or not macros[step] then -- User attempted to write a step method that doesn't work, reset to 1
		print('|cffff0000Invalid step assigned by custom step sequence', self:GetName(), step or 'nil')
		step = 1
	end
	self:SetAttribute('step', step)
	self:CallMethod('UpdateIcon')
]=]

for name, sequence in pairs(Sequences) do
	local button = CreateFrame('Button', name, nil, 'SecureActionButtonTemplate,SecureHandlerBaseTemplate')
	button:SetAttribute('type', 'macro')
	button:Execute('name, macros = self:GetName(), newtable([=======[' .. strjoin(']=======],[=======[', unpack(sequence)) .. ']=======])')
	button:SetAttribute('step', 1)
	button:SetAttribute('PreMacro', (sequence.PreMacro or '') .. '\n')
	button:SetAttribute('PostMacro', '\n' .. (sequence.PostMacro or ''))
	button:WrapScript(button, 'OnClick', format(OnClick, sequence.StepFunction or 'step = step % #macros + 1'))
	button.UpdateIcon = UpdateIcon
end

local ModifiedMacros = {} -- [macroName] = true if we've already modified this macro

local IgnoreMacroUpdates = false
local f = CreateFrame('Frame')
f:SetScript('OnEvent', function(self, event)
	if (event == 'UPDATE_MACROS' or event == 'PLAYER_LOGIN') and not IgnoreMacroUpdates then
		if (not InCombatLockdown()) and (not IsAddOnLoaded('GnomeSequencer')) then
			IgnoreMacroUpdates = true
			--self:UnregisterEvent('UPDATE_MACROS')
			for name, sequence in pairs(Sequences) do
				local macroIndex = GetMacroIndexByName(name)
				if macroIndex and macroIndex ~= 0 then
					if not ModifiedMacros[name] then
						ModifiedMacros[name] = true
						EditMacro(macroIndex, nil, nil, '#showtooltip\n/click ' .. name)
					end
					_G[name]:UpdateIcon()
				elseif ModifiedMacros[name] then
					ModifiedMacros[name] = nil
				end
			end
			IgnoreMacroUpdates = false
			--self:RegisterEvent('UPDATE_MACROS')
			E.SequencesmacroList = Sequences
		else
			self:RegisterEvent('PLAYER_REGEN_ENABLED')
		end
	elseif event == 'PLAYER_REGEN_ENABLED' then
		self:UnregisterEvent('PLAYER_REGEN_ENABLED')
		self:GetScript('OnEvent')(self, 'UPDATE_MACROS')
	end
end)
f:RegisterEvent('UPDATE_MACROS')
f:RegisterEvent('PLAYER_LOGIN')