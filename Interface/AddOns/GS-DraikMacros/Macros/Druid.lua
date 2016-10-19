------------------------------------------------------------------------------------------
-- Dont edit this file.  It is regularily update when GS-E is updated and any
-- changes you have made may be lost.  Instead either use the GS-myMacros
-- plugin from http://www.wowinterface.com/downloads/info24062-GS-EmyMacrosAddinPack.html
-- or see the wiki on creating Macro Plugins
-- https://github.com/TimothyLuke/GnomeSequenced-Enhanced/wiki/Creating-Addon-Packs
------------------------------------------------------------------------------------------

local Sequences = GSMasterSequences

------------------
----- Druid
------------------
--Guardian 104
--Feral 103
--Balance 102

Sequences['DB_bear1'] = {
specID = 104,
author = "John Mets www.wowlazymacros.com",
helpTxt = " Talents: 2331111",
StepFunction = GSStaticPriority,
PreMacro = [[
/targetenemy [noharm][dead]
]],
"/castsequence reset=combat Thrash, Moonfire, Maul, Swipe",
"/castsequence reset=combat Savage Defense, Swipe, Swipe, Savage Defense ,Frenzied Regeneration, Ironfur",
"/cast Survival Instincts",
"/cast Thrash",
"/castsequence reset=combat Swipe, Moonfire, Maul, Mangle, Ironfur",
"/cast Pulverize",
"/cast Incapacitating Roar",
"/cast [combat] Barkskin",
"/cast [combat] Mighty Bash",
"/cast [combat] Berserk",
"/castsequence Cenarion ward",
PostMacro = [[
/startattack
]],
}

Sequences['DB_bear2'] = {
specID = 104,
author = "John Mets www.wowlazymacros.com",
helpTxt = " Talents: 2331111",
PreMacro = [[
/targetenemy [noharm][dead]
]],
"/castsequence Thrash, Thrash, Thrash, Pulverize",
"/castsequence reset=5 Savage Defense, Swipe, Swipe, Frenzied Regeneration",
"/castsequence [combat] reset=target Moonfire, Mass Entanglement",
"/cast !Mangle",
"/castsequence reset=12 Maul",
"/cast Survival Instincts",
"/cast Thrash",
"/castsequence Swipe, Moonfire, Maul, Mangle",
"/cast Thrash",
"/castsequence Swipe, Moonfire, Maul, Mangle",
"/cast Thrash",
"/cast Pulverize",
"/cast Incapacitating Roar",
"/castsequence [combat] reset=60 Barkskin",
"/castsequence [combat] reset=180 Berserk",
"/castsequence reset=30 cenarion ward",
PostMacro = [[
/startattack
]],
}

Sequences['DB_Feral-ST'] = {
specID = 103,
author = "Jimmy www.wowlazymacros.com",
helpTxt = "2231123",
StepFunction = GSStaticPriority,
PreMacro = [[
/targetenemy [noharm][dead]
/castsequence [@player,nostance:2] Cat Form
/cast [nostealth,nocombat] Prowl
/stopattack [stealth]
]],
'/castsequence [combat,nostealth] Rake,Shred,Shred,Rake,Shred,Rip',
'/castsequence [combat,nostealth] Shred,Rake,Shred,Shred,Rake,Ferocious Bite',
PostMacro = [[
/startattack
/cast Tiger's Fury
]],
}

Sequences['DB_Feral-AoE'] = {
specID = 103,
author = "Jimmy www.wowlazymacros.com",
helpTxt = "2231123",
StepFunction = GSStaticPriority,
 PreMacro = [[
/targetenemy [noharm][dead]
/castsequence [@player,nostance:2] Cat Form
/cast [nostealth,nocombat] Prowl
/stopattack [stealth]
]],
'/castsequence [combat,nostealth] Thrash,Swipe,Swipe,Thrash,Swipe,Rip',
'/castsequence [combat,nostealth] Swipe,Thrash,Swipe,Swipe,Thrash,Ferocious Bite',
PostMacro = [[
/startattack
/cast Tiger's Fury
]],
}

Sequences['DB_feralaoe'] = {
specID = 103,
author = "lloskka www.wowlazymacros.com",
helpTxt = "Talents 2331223",
PreMacro = [[
/targetenemy [noharm][dead]
/use [noform:2]Cat Form
/cast [nostealth,nocombat] Prowl
]],
[[/cast [combat] !Incarnation: King of the Jungle]],
[[/cast [combat] !Mighty Bash]],
[[/castsequence reset=combat Rake,Thrash,Swipe,Swipe,Swipe,Ferocious Bite]],
PostMacro = [[
/cast [combat] !survival Instincts
/cast [combat] !Tiger's Fury
/startattack
]],
}

Sequences['DB_feralsingle'] = {
specID = 103,
author = "lloskka www.wowlazymacros.com",
helpTxt = "Talents 2331223",
PreMacro = [[
/cast Wild Charge
/targetenemy [noharm][dead]
]],
'/castsequence reset=combat Rake,shred,shred,shred,!Rip,Rake,shred,shred,shred,ferocious bite,Rake,shred,shred,shred,ferocious bite',
'/use [combat] Berserk',
'/use [combat] survival instincts',
'/cast Incarnation: King of the Jungle',
PostMacro = [[
/startattack
/cast Tiger's Fury
]],
}

Sequences['DB_Boomer'] = {
specID = 102,
author = "Draik",
helpTxt = "2323112",
 PreMacro = [[
/targetenemy [noharm][dead]
/use [noform]!Moonkin Form
]],
'/cast Moonfire',
'/cast Sunfire',
'/castsequence [combat] Solar Wrath,Lunar Strike,Solar Wrath,Lunar Strike,Solar Wrath,Solar Wrath',
'/cast Starsurge',
PostMacro = [[
/startattack
]],
}


Sequences['DB_RestoBoomer'] = {
specID = 105,
author = "Draik",
helpTxt = "2312232",
 PreMacro = [[
/targetenemy [noharm][dead]
/use [noform]!Moonkin Form
]],
'/cast Moonfire',
'/cast Sunfire',
'/castsequence [combat] Solar Wrath,Lunar Strike,Solar Wrath,Lunar Strike,Solar Wrath,Solar Wrath',
'/cast Starsurge',
PostMacro = [[
/startattack
]],
}

Sequences["DB_druid_bala_st"] = {
specID = 102,
author="someone",
helpTxt = "3333132 CTRL Blessing of the Ancients, Shift Celestial Alignment, Alt Solar Beam",
StepFunction = GSStaticPriority,
PreMacro = [[
/targetenemy [noharm][dead]
/cast [noform]!Moonkin Form
/cast [mod:ctrl] Blessing of the Ancients
/cast [mod:shift] Celestial Alignment
/cast [mod:alt] Solar Beam
]],
"/castsequence reset=target Sunfire,null",
"/castsequence reset=target Moonfire,null",
"/castsequence [combat]Starsurge,Solar Wrath,Lunar Strike,Solar Wrath",
"/castsequence Lunar Strike,Solar Wrath,Starsurge,Solar Wrath,Lunar Strike,Starsurge",
"/castsequence [combat]Solar Wrath,Lunar Strike,Solar Wrath,Moonfire",
"/castsequence [combat]Solar Wrath,Starsurge,Lunar Strike,Solar Wrath",
"/castsequence [combat]Starsurge,Solar Wrath,Solar Wrath,Sunfire",
"/castsequence [combat]Solar Wrath,Lunar Strike,Starsurge,Moonfire",
"/castsequence [combat]Lunar Strike,Solar Wrath,Lunar Strike",
"/cast Starsurge",
PostMacro = [[
/startattack
]],
}

Sequences['DB_KTNDRUHEALS'] = {
specID = 105,
author = "KTN",
helpTxt = "2113112",
PreMacro = [[
/cast [@focus,dead] Rebirth
]],
'/castsequence [@focus] reset=15/combat Lifebloom, Regrowth, Rejuvenation',
'/cast [@focus] Cenarion Ward',
'/castsequence reset=target [@mouseover,exists,help,nodead] Regrowth, Rejuvenation, Healing Touch, Swiftmend',
PostMacro = [[
/cast [@focus]Ironbark
/cast [@player]Barkskin
]],
}

Sequences['DB_KTNDRUAOEHEALS'] = {
specID = 105,
author = "KTN",
helpTxt = "2113112",
'/castsequence [@focus] Wild Growth',
}

Sequences['DB_KTNRestoBoom'] = {
specID = 105,
author = "KTN",
helpTxt = "Talents-2113112",
PreMacro = [[
/cast [@focus,dead] Rebirth
/assist [@focus,exists,nodead]
/targetenemy [noharm]
/use [noform]!Moonkin Form
]],
'/castsequence [combat] Moonfire, Sunfire, Solar Wrath, Lunar Strike, Solar Wrath, Lunar Strike, Solar Wrath, Lunar Strike',
'/cast Starsurge',
PostMacro = [[
/startattack
]],
}

----------GS-DruidMacros  v0.1 - Patch: 7.0.3

Sequences['Guardian_ST'] = {
specID = 104,
author = "HiroYakamura",
helpTxt = "Talents: 3131321 - Modifiers: 'Shift' for Galatic Guardian Procs or to use Ironfur; 'Ctrl' for Barkskin on Damage Spikes. Mark of Ursol & Frenz. Regeneration on separate keybind for more control",
StepFunction = GSStaticPriority,
PreMacro = [[
/targetenemy [noharm][dead]
/use [noform] !Bear Form
/castsequence [mod:ctrl,combat] reset=90 Barkskin, Survival Instincts, Survival Instincts, null
]],
"/cast [nomod] Mangle",
"/cast [nomod] Thrash",
"/cast [nomod] Swipe",
"/cast [mod:shift] Moonfire",
"/cast [mod:shift] Ironfur",
PostMacro = [[
/startattack
]],
}

Sequences['Guardian_MT'] = {
specID = 104,
author = "HiroYakamura",
helpTxt = "Talents: 3131321 - Modifiers: 'Shift' for Galatic Guardian Procs or to use Ironfur; 'Ctrl' for Barkskin on Damage Spikes. Mark of Ursol & Frenz. Regeneration on separate keybind for more control",
StepFunction = GSStaticPriority,
PreMacro = [[
/targetenemy [noharm][dead]
/use [noform] !Bear Form
/castsequence [mod:ctrl,combat] reset=90 Barkskin, Survival Instincts, Survival Instincts, null
]],
"/cast [nomod] Thrash",
"/cast [nomod] Mangle",
"/cast [nomod] Swipe",
"/cast [mod:shift] Moonfire",
"/cast [mod:shift] Ironfur",
PostMacro = [[
/startattack
]],
}

--Feral (specID = 103)

Sequences['Feral-ST'] = {
author = 'HiroYakamura',
specID = 103,
helpTxt = 'Talents: 2331123',
icon = 'INV_Misc_QuestionMark',
PreMacro=[[
/targetenemy [noharm][dead]
/use [noform] !Cat Form
/cast [nostealth,nocombat] Prowl
/stopattack [stealth]
]],
"/castsequence [combat,nostealth] Rake,Shred,Shred,Shred,Rip",
"/castsequence [combat,nostealth] Shred,Shred,Shred,Shred,Ferocious Bite",
PostMacro=[[
/startattack
/cast [combat]Tiger's Fury
/use [combat]13
/use [combat]14
]],
}

Sequences['Feral-MT'] = {
specID = 103,
author = "HiroYakamura",
helpTxt = "Talents: 2331123",
StepFunction = GSStaticPriority,
icon = 'INV_Misc_QuestionMark',
PreMacro = [[
/targetenemy [noharm][dead]
/castsequence [@player,nostance:2] Cat Form(Shapeshift)
/cast [nostealth,nocombat] Prowl
/stopattack [stealth]
]],
'/castsequence [combat,nostealth] Thrash,Swipe,Swipe,Swipe,Swipe,Rip',
'/castsequence [combat,nostealth] Swipe,Swipe,Swipe,Swipe,Thrash,Ferocious Bite',
PostMacro = [[
/startattack
/cast [combat]Tiger's Fury
/use [combat]13
/use [combat]14
]],
}

--Balance (specID = 102)

Sequences['Moonkin_ST'] = {
author = 'HiroYakamura',
specID = 102,
helpTxt = 'Talents: 3133233 - Use modifier Shift to reapply Moonfire and Sunfire. Incarnation is supposed to be on a separate Keybind for more burst control.',
icon = 'INV_Misc_QuestionMark',
PreMacro=[[
/targetenemy [noharm][dead]
/use [noform] !Moonkin Form
]],
"/castsequence [combat] Solar Wrath,Lunar Strike,Solar Wrath,Lunar Strike,Solar Wrath,Solar Wrath",
"/cast [combat] Starsurge",
"/castsequence reset=target/shift Moonfire, Sunfire, null",
PostMacro=[[
/startattack
/use [combat]13
/use [combat]14
]],
}

Sequences['Moonkin_MT'] = {
author = 'HiroYakamura',
specID = 102,
helpTxt = 'Talents: 3133233 - Use modifier Shift to reapply Moonfire and Sunfire. Incarnation is supposed to be on a separate Keybind for more burst control.',
icon = 'INV_Misc_QuestionMark',
PreMacro=[[
/targetenemy [noharm][dead]
/use [noform] !Moonkin Form
]],
"/castsequence [combat,nomod] Lunar Strike, Solar Wrath, Lunar Strike, Lunar Strike, Solar Wrath",
"/cast [combat,nomod] Starsurge",
"/cast [mod:shift,combat] Starfall",
"/castsequence [nomod] reset=target/ctrl Moonfire, Sunfire, null",
PostMacro=[[
/startattack
/use [combat]13
/use [combat]14
]],
}

--Restoration (specID = 105)

Sequences['Restoration_Tank'] = {
specID = 105,
author = "HiroYakamura",
helpTxt = "Talents: 2111122 - Target Tank & Use Macro. Use CTRL Modifier to apply Cenarion Ward. Use Shift modifier to counter Damage-Spikes (Swiftmend + Ironbark + Empowered Rejuvenation)",
icon = 'INV_Misc_QuestionMark',
 PreMacro = [[
/cast [mod:ctrl] Cenarion Ward
]],
'/castsequence [mod:shift] Swiftmend, Ironbark, Swiftmend',
'/castsequence reset=shift/target Lifebloom, Rejuvenation, Regrowth, Healing Touch, Healing Touch, Healing Touch, Healing Touch',
PostMacro = [[
/use [mod:shift,combat]13
/use [mod:shift,combat]14
]],
}

Sequences['Restoration_Group'] = {
specID = 105,
author = "HiroYakamura",
helpTxt = "Talents: 2111122 - Target Group Member & Use Macro. Use CTRL Modifier to apply Cenarion Ward. Use Shift modifier to counter Damage-Spikes (Swiftmend + Tranquility)",
icon = 'INV_Misc_QuestionMark',
 PreMacro = [[
/cast [mod:ctrl] Cenarion Ward
]],
'/castsequence [mod:shift,nochanneling] Tranquility, Swiftmend, Swiftmend, Swiftmend, Swiftmend',
'/castsequence [nochanneling] reset=shift/target Rejuvenation, Regrowth, Wild Growth, Healing Touch, Healing Touch, Healing Touch',
PostMacro = [[
/use [mod:shift,combat]13
/use [mod:shift,combat]14
]],
}