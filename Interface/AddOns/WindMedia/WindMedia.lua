-- 自用素材包
-- 作者：houshuu
-- 素材来自于各个地方无法一一列举了
-- 可以自己複製對應語言的一行代碼來模仿添加自己的材質哦~！
local LSM = LibStub("LibSharedMedia-3.0")
local region = 128
if GetLocale() == 'zhCN' then region = 4 end
if GetLocale() == 'zhTW' then region = 8 end

-- English
LSM:Register("font", "Vistor", [[Interface\Addons\WindMedia\Fonts\EN_Vistor.ttf]], region) 
LSM:Register("font", "BigNoodle", [[Interface\Addons\WindMedia\Fonts\EN_BigNoodle.ttf]], region) 
LSM:Register("font", "US 101", [[Interface\Addons\WindMedia\Fonts\EN_US_101.ttf]], region) 
LSM:Register("font", "VenturaEdding", [[Interface\Addons\WindMedia\Fonts\EN_VenturaEdding.ttf]], region) 
LSM:Register("font", "FTY", [[Interface\Addons\WindMedia\Fonts\EN_FTY.ttf]], region) 
LSM:Register("font", "Futura", [[Interface\Addons\WindMedia\Fonts\EN_Futura_NO2_D.ttf]], region)
LSM:Register("font", "Accidental Presidency", [[Interface\Addons\WindMedia\Fonts\EN_Accidental_Presidency.ttf]], region)
LSM:Register("font", "ElvUI PT Sans Narrow", [[Interface\Addons\WindMedia\Fonts\EN_PT_Sans_Narrow.ttf]], region)
LSM:Register("font", "Magistral", [[Interface\Addons\WindMedia\Fonts\EN_Magistral.ttf]], region) 
LSM:Register("font", "Roadway", [[Interface\Addons\WindMedia\Fonts\EN_Roadway.ttf]], region) 
-- 简体
if region == 4 then
	LSM:Register("font", "思源黑体 Heavy", [[Interface\Addons\WindMedia\Fonts\CN_Siyuan_Heavy.ttf]], region) 
	LSM:Register("font", "思源黑体 Bold", [[Interface\Addons\WindMedia\Fonts\CN_Siyuan_Bold.ttf]], region)
	LSM:Register("font", "思源黑体 Medium", [[Interface\Addons\WindMedia\Fonts\CN_Siyuan_Medium.ttf]], region)
	LSM:Register("font", "微软雅黑Myriad", [[Interface\Addons\WindMedia\Fonts\CN_YaHei_myriadpro.ttf]], region)
	LSM:Register("font", "方正准圆", [[Interface\Addons\WindMedia\Fonts\CN_FZZhunyuan.ttf]], region)
end
-- 正體
if region == 8 then
	LSM:Register("font", "思源黑體 Heavy", [[Interface\Addons\WindMedia\Fonts\CN_Siyuan_Heavy.ttf]], region) 
	LSM:Register("font", "思源黑體 Bold", [[Interface\Addons\WindMedia\Fonts\CN_Siyuan_Bold.ttf]], region)
	LSM:Register("font", "思源黑體 Medium", [[Interface\Addons\WindMedia\Fonts\CN_Siyuan_Medium.ttf]], region)
	LSM:Register("font", "微軟雅黑Myriad", [[Interface\Addons\WindMedia\Fonts\CN_YaHei_myriadpro.ttf]], region)
	LSM:Register("font", "方正準圓", [[Interface\Addons\WindMedia\Fonts\CN_FZZhunyuan.ttf]], region)
	-- 仅繁体
	LSM:Register("font", "王漢宗綜藝", [[Interface\Addons\WindMedia\Fonts\TW_Zongyi_Bold.ttf]], region)
	LSM:Register("font", "王漢宗粗圓", [[Interface\Addons\WindMedia\Fonts\TW_Yuan_Bold.ttf]], region)
end

-- 状态条材质
-- ElvUI_CustomMedia
LSM:Register("statusbar", "ElvUI_01", [[Interface\Addons\WindMedia\Statusbar\ElvUI A.tga]]) 
LSM:Register("statusbar", "ElvUI_02", [[Interface\Addons\WindMedia\Statusbar\ElvUI B.tga]]) 
LSM:Register("statusbar", "ElvUI_03", [[Interface\Addons\WindMedia\Statusbar\ElvUI C.tga]]) 
LSM:Register("statusbar", "ElvUI_04", [[Interface\Addons\WindMedia\Statusbar\ElvUI D.tga]]) 
LSM:Register("statusbar", "ElvUI_05", [[Interface\Addons\WindMedia\Statusbar\ElvUI E.tga]]) 
LSM:Register("statusbar", "ElvUI_06", [[Interface\Addons\WindMedia\Statusbar\ElvUI F.tga]]) 
LSM:Register("statusbar", "ElvUI_07", [[Interface\Addons\WindMedia\Statusbar\ElvUI G.tga]]) 
LSM:Register("statusbar", "ElvUI_08", [[Interface\Addons\WindMedia\Statusbar\ElvUI H.tga]]) 
LSM:Register("statusbar", "ElvUI_09", [[Interface\Addons\WindMedia\Statusbar\ElvUI I.tga]]) 
LSM:Register("statusbar", "ElvUI_10", [[Interface\Addons\WindMedia\Statusbar\ElvUI J.tga]]) 
LSM:Register("statusbar", "ElvUI_11", [[Interface\Addons\WindMedia\Statusbar\ElvUI K.tga]]) 
LSM:Register("statusbar", "ElvUI_12", [[Interface\Addons\WindMedia\Statusbar\ElvUI L.tga]]) 
LSM:Register("statusbar", "ElvUI_13", [[Interface\Addons\WindMedia\Statusbar\ElvUI M.tga]]) 
LSM:Register("statusbar", "ElvUI_14", [[Interface\Addons\WindMedia\Statusbar\ElvUI N.tga]]) 
LSM:Register("statusbar", "ElvUI_15", [[Interface\Addons\WindMedia\Statusbar\ElvUI O.tga]]) 
LSM:Register("statusbar", "ElvUI_16", [[Interface\Addons\WindMedia\Statusbar\ElvUI P.tga]])
-- FreeUI.Fluffy
LSM:Register("statusbar", "ElvUI_17", [[Interface\Addons\WindMedia\Statusbar\FF_Angelique.tga]]) 
LSM:Register("statusbar", "ElvUI_18", [[Interface\Addons\WindMedia\Statusbar\FF_Antonia.tga]]) 
LSM:Register("statusbar", "ElvUI_19", [[Interface\Addons\WindMedia\Statusbar\FF_Bettina.tga]]) 
LSM:Register("statusbar", "ElvUI_20", [[Interface\Addons\WindMedia\Statusbar\FF_Jasmin.tga]]) 
LSM:Register("statusbar", "ElvUI_21", [[Interface\Addons\WindMedia\Statusbar\FF_Larissa.tga]]) 
LSM:Register("statusbar", "ElvUI_22", [[Interface\Addons\WindMedia\Statusbar\FF_Lisa.tga]])
LSM:Register("statusbar", "ElvUI_23", [[Interface\Addons\WindMedia\Statusbar\FF_Sam.tga]])
LSM:Register("statusbar", "ElvUI_24", [[Interface\Addons\WindMedia\Statusbar\FF_Stella.tga]])
-- 风行丨GG @ NGA
LSM:Register("statusbar", "FXGG_1", [[Interface\Addons\WindMedia\Statusbar\FX_001.tga]])
LSM:Register("statusbar", "FXGG_2", [[Interface\Addons\WindMedia\Statusbar\FX_002.tga]])
LSM:Register("statusbar", "FXGG_3", [[Interface\Addons\WindMedia\Statusbar\FX_003.tga]])
LSM:Register("statusbar", "FXGG_4", [[Interface\Addons\WindMedia\Statusbar\FX_004.tga]])
-- 自作
LSM:Register("statusbar", "Wind_1", [[Interface\Addons\WindMedia\Statusbar\WindTools_1.tga]])
-- 随便收集的
LSM:Register("statusbar", "Wind_2", [[Interface\Addons\WindMedia\Statusbar\WindTools_2.tga]])