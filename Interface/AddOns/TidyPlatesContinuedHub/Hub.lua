
--[[
Tidy Plates Hub: Interface Panel

Color Guide:
|cffffdd00		for Yellow
|cffff6906		for Orange
|cff999999		for Grey
|cffffaa33		for Brownish Orange

--]]

-- Rapid Panel Functions
local CreateQuickSlider = TidyPlatesContHubRapidPanel.CreateQuickSlider
local CreateQuickCheckbutton = TidyPlatesContHubRapidPanel.CreateQuickCheckbutton
local SetSliderMechanics = TidyPlatesContHubRapidPanel.SetSliderMechanics
local CreateQuickEditbox = TidyPlatesContHubRapidPanel.CreateQuickEditbox
local CreateQuickColorbox = TidyPlatesContHubRapidPanel.CreateQuickColorbox
local CreateQuickDropdown = TidyPlatesContHubRapidPanel.CreateQuickDropdown
local CreateQuickHeadingLabel = TidyPlatesContHubRapidPanel.CreateQuickHeadingLabel
local CreateQuickItemLabel = TidyPlatesContHubRapidPanel.CreateQuickItemLabel
local OnMouseWheelScrollFrame = TidyPlatesContHubRapidPanel.OnMouseWheelScrollFrame
local CreateHubInterfacePanel = TidyPlatesContHubRapidPanel.CreateInterfacePanel

-- Modes
local ThemeList = TidyPlatesContHubMenus.ThemeList
local StyleModes = TidyPlatesContHubMenus.StyleModes
local TextModes = TidyPlatesContHubMenus.TextModes
local RangeModes = TidyPlatesContHubMenus.RangeModes
local AuraWidgetModes = TidyPlatesContHubMenus.AuraWidgetModes
local DebuffStyles = TidyPlatesContHubMenus.DebuffStyles
local EnemyOpacityModes = TidyPlatesContHubMenus.EnemyOpacityModes
local FriendlyOpacityModes = TidyPlatesContHubMenus.FriendlyOpacityModes
local ScaleModes = TidyPlatesContHubMenus.ScaleModes
local FriendlyBarModes = TidyPlatesContHubMenus.FriendlyBarModes
local EnemyBarModes = TidyPlatesContHubMenus.EnemyBarModes
local ThreatWidgetModes = TidyPlatesContHubMenus.ThreatWidgetModes
local EnemyNameColorModes = TidyPlatesContHubMenus.EnemyNameColorModes
local FriendlyNameColorModes = TidyPlatesContHubMenus.FriendlyNameColorModes
local EnemyNameSubtextModes = TidyPlatesContHubMenus.EnemyNameSubtextModes
local ArtStyles = TidyPlatesContHubMenus.ArtStyles
local ArtModes = TidyPlatesContHubMenus.ArtModes
local ThreatWarningModes = TidyPlatesContHubMenus.ThreatWarningModes
local CustomTextModes = TidyPlatesContHubMenus.CustomTextModes
local BasicTextModes = TidyPlatesContHubMenus.BasicTextModes
local AbsorbModes = TidyPlatesContHubMenus.AbsorbModes
local AbsorbUnits = TidyPlatesContHubMenus.AbsorbUnits
local ComboPointsStyles = TidyPlatesContHubMenus.ComboPointsStyles
local BorderTypes = TidyPlatesContHubMenus.BorderTypes

local cEnemy = "|cffff5544"
local cFriendly = "|cffc8e915"

------------------------------------------------------------------
-- Generate Panel
------------------------------------------------------------------
local function BuildHubPanel(panel)
	panel:Hide()
	local objectName = panel.objectName
	local AlignmentColumn = panel.AlignmentColumn
	local OffsetColumnB = 200						-- 240
	local F = nil									-- Cache for anchoring
	local ColumnTop, ColumnEnd

	panel.StyleLabel, F = CreateQuickHeadingLabel(nil, "姓名板样式", AlignmentColumn, F, 0, 5)

	ColumnTop = F

	panel.StyleEnemyBarsLabel, F = CreateQuickItemLabel(nil, cEnemy.."敌方血条:", AlignmentColumn, F, 0, 2)
	panel.StyleEnemyBarsOnNPC, F = CreateQuickCheckbutton(objectName.."StyleEnemyBarsOnNPC", "所有NPC", AlignmentColumn, F, 16, 0)
	panel.StyleEnemyBarsInstanceMode, F = CreateQuickCheckbutton(objectName.."StyleEnemyBarsInstanceMode", "独立设置以下类型", AlignmentColumn, F, 32*(1/.8), 0)
	panel.StyleEnemyBarsInstanceMode:SetScale(.8)
	panel.StyleEnemyBarsOnElite, F = CreateQuickCheckbutton(objectName.."StyleEnemyBarsOnElite", "精英单位", AlignmentColumn, F, 16, 0)
	panel.StyleEnemyBarsOnPlayers, F = CreateQuickCheckbutton(objectName.."StyleEnemyBarsOnPlayers", "玩家", AlignmentColumn, F, 16, 0)
	panel.StyleEnemyBarsOnActive, F = CreateQuickCheckbutton(objectName.."StyleEnemyBarsOnActive", "激活/受伤的单位", AlignmentColumn, F, 16, 0)

	ColumnEnd = F

	panel.StyleFriendlyBarsLabel, F = CreateQuickItemLabel(nil, cFriendly.."友方血条:", AlignmentColumn, ColumnTop, OffsetColumnB, 2)
	panel.StyleFriendlyBarsOnNPC, F = CreateQuickCheckbutton(objectName.."StyleFriendlyBarsOnNPC", "所有NPC", AlignmentColumn, F, OffsetColumnB+16, 0)
	panel.StyleFriendlyBarsInstanceMode, F = CreateQuickCheckbutton(objectName.."StyleFriendlyBarsInstanceMode", "独立设置以下类型", AlignmentColumn, F, (OffsetColumnB+32)*(1/.8), 0)
	panel.StyleFriendlyBarsInstanceMode:SetScale(.8)
	panel.StyleFriendlyBarsOnElite, F = CreateQuickCheckbutton(objectName.."StyleFriendlyBarsOnElite", "精英单位", AlignmentColumn, F, OffsetColumnB+16, 0)

	panel.StyleFriendlyBarsOnPlayers, F = CreateQuickCheckbutton(objectName.."StyleFriendlyBarsOnPlayers", "玩家", AlignmentColumn, F, OffsetColumnB+16, 0)
	panel.StyleFriendlyBarsOnActive, F = CreateQuickCheckbutton(objectName.."StyleFriendlyBarsOnActive", "激活/受伤的单位", AlignmentColumn, F, OffsetColumnB+16, 0)

	F =  ColumnEnd
	panel.HealthBarStyleLabel, F = CreateQuickItemLabel(nil, "血条框架:", AlignmentColumn, F, 0, 2)
	panel.StyleForceBarsOnTargets, F = CreateQuickCheckbutton(objectName.."StyleForceBarsOnTargets", "强制应用到当前目标", AlignmentColumn, F, 16, 2)

	panel.StyleHeadlineLabel, F = CreateQuickItemLabel(nil, "标题框架(纯文本):", AlignmentColumn, F, 0, 2)
	panel.StyleHeadlineNeutral, F = CreateQuickCheckbutton(objectName.."StyleHeadlineNeutral", "强制应用到中立单位", AlignmentColumn, F, 16, 2)
	panel.StyleHeadlineOutOfCombat, F = CreateQuickCheckbutton(objectName.."StyleHeadlineOutOfCombat", "强制应用到非战斗中", AlignmentColumn, F, 16, 0)
	panel.StyleHeadlineMiniMobs, F = CreateQuickCheckbutton(objectName.."StyleHeadlineMiniMobs", "强制应用到宠物和仆从", AlignmentColumn, F, 16, 0)

	------------------------------
    -- Health Bars
	------------------------------

    panel.HealthBarLabel, F = CreateQuickHeadingLabel(nil, "血条框架显示", AlignmentColumn, F, 0, 5)

    -- Enemy
	panel.EnemyBarColorMode, F =  CreateQuickDropdown(objectName.."EnemyBarColorMode", cEnemy.."敌方血条颜色:", EnemyBarModes, 1, AlignmentColumn, F)
	panel.EnemyNameColorMode, F =  CreateQuickDropdown(objectName.."EnemyNameColorMode", cEnemy.."敌方名字颜色:", EnemyNameColorModes, 1, AlignmentColumn, F)
	panel.EnemyStatusTextMode, F =  CreateQuickDropdown(objectName.."EnemyStatusTextMode", cEnemy.."敌方信息文字:", TextModes, 1, AlignmentColumn, F )
	--panel.EnemyStatusTextModeCenter, F =  CreateQuickDropdown(objectName.."EnemyStatusTextModeCenter", "", BasicTextModes, 1, AlignmentColumn, F, 0, -14 )
	--panel.EnemyStatusTextModeRight, F =  CreateQuickDropdown(objectName.."EnemyStatusTextModeRight", "", BasicTextModes, 1, AlignmentColumn, F, 0, -14 )

	-- Friendly
	panel.FriendlyBarColorMode, F =  CreateQuickDropdown(objectName.."FriendlyBarColorMode", cFriendly.."友方血条颜色:", FriendlyBarModes, 1, AlignmentColumn, panel.HealthBarLabel, OffsetColumnB)
	panel.FriendlyNameColorMode, F =  CreateQuickDropdown(objectName.."FriendlyNameColorMode", cFriendly.."友方名字颜色:", FriendlyNameColorModes, 1, AlignmentColumn, F, OffsetColumnB)
	panel.FriendlyStatusTextMode, F =  CreateQuickDropdown(objectName.."FriendlyStatusTextMode", cFriendly.."友方信息文字:", TextModes, 1, AlignmentColumn, F, OffsetColumnB)
	--panel.FriendlyStatusTextModeCenter, F =  CreateQuickDropdown(objectName.."FriendlyStatusTextModeCenter", "", BasicTextModes, 1, AlignmentColumn, F, OffsetColumnB, -14)
	--panel.FriendlyStatusTextModeRight, F =  CreateQuickDropdown(objectName.."FriendlyStatusTextModeRight", "", BasicTextModes, 1, AlignmentColumn, F, OffsetColumnB, -14)

	-- Other
	panel.TextShowLevel, F = CreateQuickCheckbutton(objectName.."TextShowLevel", "显示等级", AlignmentColumn, F, 0, 2)
    panel.TextShowOnlyOnTargets, F = CreateQuickCheckbutton(objectName.."TextShowOnlyOnTargets", "显示目标和鼠标指向的信息文字", AlignmentColumn, F, 0)
    panel.TextShowOnlyOnActive, F = CreateQuickCheckbutton(objectName.."TextShowOnlyOnActive", "显示激活/受伤的单位", AlignmentColumn, F, 0)


	------------------------------
	-- Headline View
	------------------------------
	--[[
		Hostile Headline	(Current Selection in Dropdown)
			Default Bars
			Headline Always
			Out-of-Combat - Bars during Combat
			On Idle - Bars on Active
			On NPCs - Bars on Players
			On Non-Targets - Bar on Current Target
			On Aggroed Units - Bars on Low Threat (Tank Mode)

		Show Enemy/Friendly Health Bars:
			- On Elite Units
			- On NPCs
			- On Players (When available)
			- On Active/Damaged Units	- Low Threat (Tank Mode)  (Could roll the Tank mode into Active/Damaged units)

		- (Headline Neutral Units)
		- Force Headline Out-of-Combat		Bars during Combat; Headline Out-of-Combat 		(Eliminate this)

	--]]
	panel.StyleLabel, F = CreateQuickHeadingLabel(nil, "标题框架显示（纯文本）", AlignmentColumn, F, 0, 5)

	ColumnTop = F

	panel.EnemyHeadlineColor, F = CreateQuickDropdown(objectName.."EnemyHeadlineColor", cEnemy.."敌方姓名颜色:", EnemyNameColorModes, 1, AlignmentColumn, F)	-- |cffee9900Text-Only Style
	panel.HeadlineEnemySubtext, F =  CreateQuickDropdown(objectName.."HeadlineEnemySubtext", cEnemy.."敌方信息文字:", EnemyNameSubtextModes, 1, AlignmentColumn, F )	-- |cffee9900Text-Only Style

	ColumnEnd = F

	panel.FriendlyHeadlineColor, F = CreateQuickDropdown(objectName.."FriendlyHeadlineColor", cFriendly.."友方名字颜色:", FriendlyNameColorModes, 1, AlignmentColumn, ColumnTop, OffsetColumnB)	-- |cffee9900Text-Only Style
	panel.HeadlineFriendlySubtext, F =  CreateQuickDropdown(objectName.."HeadlineFriendlySubtext", cFriendly.."友方状态文字:", EnemyNameSubtextModes, 1, AlignmentColumn, F, OffsetColumnB )	-- |cffee9900Text-Only Style

	F = ColumnEnd

	------------------------------
	-- Aura (Buff and Debuff) Widget
	------------------------------
	panel.DebuffsLabel = CreateQuickHeadingLabel(nil, "法术效果", AlignmentColumn, F, 0, 5)
	panel.WidgetDebuff = CreateQuickCheckbutton(objectName.."WidgetDebuff", "启用法术效果组件", AlignmentColumn, panel.DebuffsLabel)

	--panel.WidgetAuraMode =  CreateQuickDropdown(objectName.."WidgetAuraMode", "Filter Mode:", AuraWidgetModes, 1, AlignmentColumn, panel.WidgetDebuffStyle, 16)		-- used to be WidgetDebuffMode

	panel.WidgetMyDebuff = CreateQuickCheckbutton(objectName.."WidgetMyDebuff", "包括我的负面效果", AlignmentColumn, panel.WidgetDebuff, 16)
	panel.WidgetMyBuff = CreateQuickCheckbutton(objectName.."WidgetMyBuff", "包括我的增益效果", AlignmentColumn, panel.WidgetMyDebuff, 16)

	panel.WidgetPandemic = CreateQuickCheckbutton(objectName.."WidgetPandemic", "启用DOT续杯高亮提示", AlignmentColumn, panel.WidgetMyBuff, 16)
	panel.ColorPandemic = CreateQuickColorbox(objectName.."ColorPandemic", "", nil, AlignmentColumn, panel.WidgetMyBuff , OffsetColumnB + 64)
	panel.BorderPandemic = CreateQuickDropdown(objectName.."BorderPandemic", "", BorderTypes, 1, AlignmentColumn, panel.WidgetMyBuff, OffsetColumnB + 90)

	panel.WidgetBuffPurgeable = CreateQuickCheckbutton(objectName.."WidgetBuffPurgeable", "包括可驱散的效果", AlignmentColumn, panel.WidgetPandemic, 16)
	panel.ColorBuffPurgeable = CreateQuickColorbox(objectName.."ColorBuffPurgeable", "", nil, AlignmentColumn, panel.WidgetPandemic , OffsetColumnB + 64)
	panel.BorderBuffPurgeable = CreateQuickDropdown(objectName.."BorderBuffPurgeable", "", BorderTypes, 1, AlignmentColumn, panel.WidgetPandemic, OffsetColumnB + 90)

	panel.WidgetBuffEnrage = CreateQuickCheckbutton(objectName.."WidgetBuffEnrage", "包括激怒效果", AlignmentColumn, panel.WidgetBuffPurgeable, 16)
	panel.ColorBuffEnrage = CreateQuickColorbox(objectName.."ColorBuffEnrage", "", nil, AlignmentColumn, panel.WidgetBuffPurgeable , OffsetColumnB + 64)
	panel.BorderBuffEnrage = CreateQuickDropdown(objectName.."BorderBuffEnrage", "", BorderTypes, 1, AlignmentColumn, panel.WidgetBuffPurgeable, OffsetColumnB + 90)

	panel.SpacerSlots = CreateQuickSlider(objectName.."SpacerSlots", "增益、负面效果之间的距离:", "ACTUAL", 150, AlignmentColumn, panel.WidgetBuffEnrage, 16, 2)

	panel.WidgetDebuffListLabel = CreateQuickItemLabel(nil, "其他法术效果:", AlignmentColumn, panel.SpacerSlots, 16)
	panel.WidgetDebuffTrackList = CreateQuickEditbox(objectName.."WidgetDebuffTrackList", nil, nil, AlignmentColumn, panel.WidgetDebuffListLabel, 16)

	panel.WidgetDebuffStyle =  CreateQuickDropdown(objectName.."WidgetDebuffStyle", "图标样式:", DebuffStyles, 1, AlignmentColumn, panel.WidgetDebuffTrackList, 16)

	panel.WidgetAuraTrackDispelFriendly = CreateQuickCheckbutton(objectName.."WidgetAuraTrackDispelFriendly", "包括友方单位可驱散的负面效果", AlignmentColumn, panel.WidgetDebuffStyle, 16, 4)
	panel.WidgetAuraTrackCurse = CreateQuickCheckbutton(objectName.."WidgetAuraTrackCurse", "诅咒", AlignmentColumn, panel.WidgetAuraTrackDispelFriendly, 16+16, -2)
	panel.WidgetAuraTrackDisease = CreateQuickCheckbutton(objectName.."WidgetAuraTrackDisease", "疾病", AlignmentColumn, panel.WidgetAuraTrackCurse, 16+16, -2)
	panel.WidgetAuraTrackMagic = CreateQuickCheckbutton(objectName.."WidgetAuraTrackMagic", "魔法", AlignmentColumn, panel.WidgetAuraTrackDisease, 16+16, -2)
	panel.WidgetAuraTrackPoison = CreateQuickCheckbutton(objectName.."WidgetAuraTrackPoison", "中毒", AlignmentColumn, panel.WidgetAuraTrackMagic, 16+16, -2)


	------------------------------
	-- Debuff Help Tip
	panel.DebuffHelpTip = CreateQuickItemLabel(nil, "提示: |cffCCCCCC法术效果需要用完整的名称或法术ID一一列出。 "..
		"“My”或“All”前缀可用来区分个人法术和所有人的控制法术，“Not”前缀则"..
		"可用来屏蔽法术效果。靠前的法术效果将会被优先显示。", AlignmentColumn, panel.WidgetDebuffListLabel, 225+40) -- 210, 275, )
	panel.DebuffHelpTip:SetHeight(150)
	panel.DebuffHelpTip:SetWidth(200)
	panel.DebuffHelpTip.Text:SetJustifyV("TOP")

	-- Expand Options
	-- Filtering mode: Show raid targets, show only my target

	------------------------------
	--Opacity
	------------------------------
	panel.OpacityLabel, F = CreateQuickHeadingLabel(nil, "透明度", AlignmentColumn, panel.WidgetAuraTrackPoison, 0, 5)
	panel.EnemyAlphaSpotlightMode =  CreateQuickDropdown(objectName.."EnemyAlphaSpotlightMode", cEnemy.."敌方高亮模式:", EnemyOpacityModes, 1, AlignmentColumn, F)
	panel.FriendlyAlphaSpotlightMode, F =  CreateQuickDropdown(objectName.."FriendlySpotlightMode", cFriendly.."友方高亮模式:", FriendlyOpacityModes, 1, AlignmentColumn, F, OffsetColumnB)

	panel.OpacitySpotlight = CreateQuickSlider(objectName.."OpacitySpotlight", "高亮时的透明度:", nil, nil, AlignmentColumn, F, 0, 2)
	panel.OpacityTarget = CreateQuickSlider(objectName.."OpacityTarget", "当前目标的透明度:", nil, nil, AlignmentColumn, panel.OpacitySpotlight, 0, 2)
	panel.OpacityNonTarget = CreateQuickSlider(objectName.."OpacityNonTarget", "非当前目标的透明度:", nil, nil, AlignmentColumn, panel.OpacityTarget, 0, 2)

	panel.OpacitySpotlightSpell = CreateQuickCheckbutton(objectName.."OpacitySpotlightSpell", "高亮正在施法的单位", AlignmentColumn, panel.OpacityNonTarget, 0)
	panel.OpacitySpotlightMouseover = CreateQuickCheckbutton(objectName.."OpacitySpotlightMouseover", "高亮鼠标指向的单位", AlignmentColumn, panel.OpacitySpotlightSpell, 0)
	panel.OpacitySpotlightRaidMarked = CreateQuickCheckbutton(objectName.."OpacitySpotlightRaidMarked", "高亮带有团队标记的单位", AlignmentColumn, panel.OpacitySpotlightMouseover, 0)

	panel.OpacityFullNoTarget = CreateQuickCheckbutton(objectName.."OpacityFullNoTarget", "没有目标时，使用当前目标的透明度", AlignmentColumn, panel.OpacitySpotlightRaidMarked, 0)

	------------------------------
	--Scale
	------------------------------
	panel.ScaleLabel = CreateQuickHeadingLabel(nil, "比例", AlignmentColumn, panel.OpacityFullNoTarget, 0, 5)
	panel.ScaleStandard = CreateQuickSlider(objectName.."ScaleStandard", "一般比例:", nil, nil, AlignmentColumn, panel.ScaleLabel, 0, 2)

	panel.ScaleFunctionMode =  CreateQuickDropdown(objectName.."ScaleFunctionMode", "比例高亮模式:", ScaleModes, 1, AlignmentColumn, panel.ScaleStandard)


	panel.ScaleSpotlight = CreateQuickSlider(objectName.."ScaleSpotlight", "高亮时比例:", nil, nil, AlignmentColumn, panel.ScaleFunctionMode, 0, 2)
	panel.ScaleIgnoreNeutralUnits= CreateQuickCheckbutton(objectName.."ScaleIgnoreNeutralUnits", "忽略中立单位", AlignmentColumn, panel.ScaleSpotlight, 16)
	panel.ScaleIgnoreNonEliteUnits= CreateQuickCheckbutton(objectName.."ScaleIgnoreNonEliteUnits", "忽略非精英单位", AlignmentColumn, panel.ScaleIgnoreNeutralUnits, 16)
	panel.ScaleIgnoreInactive, F = CreateQuickCheckbutton(objectName.."ScaleIgnoreInactive", "忽略未激活的单位", AlignmentColumn, panel.ScaleIgnoreNonEliteUnits, 16)

	panel.ScaleCastingSpotlight, F = CreateQuickCheckbutton(objectName.."ScaleCastingSpotlight", "高亮正在施法的单位", AlignmentColumn, F, 0)
	panel.ScaleTargetSpotlight, F = CreateQuickCheckbutton(objectName.."ScaleTargetSpotlight", "高亮目标单位", AlignmentColumn, F, 0)
	panel.ScaleMouseoverSpotlight, F = CreateQuickCheckbutton(objectName.."ScaleMouseoverSpotlight", "高亮鼠标指向的单位", AlignmentColumn, F, 0)
	--panel.ScaleMiniMobs, F = CreateQuickCheckbutton(objectName.."ScaleMiniMobs", "Auto-Scale Mini/Trivial Mobs", AlignmentColumn, F, 0)



	-- panel.ScaleTrivialMobsMultiplier =
	-- Downscale Trivial Mobs  (70%)

	------------------------------
	-- Trivial Mobs
	------------------------------
	-- Scale Multiplier
	-- Override Target Settings
	-- Ignore Threat
	--

	-- Hiding Mobs vs Filtering Mobs

	------------------------------
    -- Unit Search Spotlight/Searchlight
	------------------------------

	--[[
	panel.UnitSpotlightLabel = CreateQuickHeadingLabel(nil, "Unit Spotlight", AlignmentColumn, panel.ScaleCastingSpotlight, 0, 5)

	-- Column 1
	panel.UnitSpotlightOpacity = CreateQuickSlider(objectName.."UnitSpotlightOpacity", "高亮时的透明度:", nil, nil, AlignmentColumn, panel.UnitSpotlightLabel, 0, 2)
	panel.UnitSpotlightScale = CreateQuickSlider(objectName.."UnitSpotlightScale", "高亮时比例:", nil, nil, AlignmentColumn, panel.UnitSpotlightOpacity, 0, 2)
	panel.UnitSpotlightColorLabel = CreateQuickItemLabel(nil, "Spotlight Color:", AlignmentColumn, panel.UnitSpotlightScale, 0, 0)
	panel.UnitSpotlightColor = CreateQuickColorbox(objectName.."UnitSpotlightColor", "Bar & Glow Color", nil, AlignmentColumn, panel.UnitSpotlightColorLabel , 6, 2)

	panel.UnitSpotlightListLabel = CreateQuickItemLabel(nil, "Unit Name:", AlignmentColumn, panel.UnitSpotlightColor, 0, 4)
	panel.UnitSpotlightList = CreateQuickEditbox(objectName.."UnitSpotlightList", nil, nil, AlignmentColumn, panel.UnitSpotlightListLabel, 0)

	-- Boss NPC units

	-- Column 2
	panel.UnitSpotlightOpacityEnable = CreateQuickCheckbutton(objectName.."UnitSpotlightOpacityEnable", "Enable Opacity", AlignmentColumn, panel.UnitSpotlightListLabel, 8+ OffsetColumnB, 0)
	panel.UnitSpotlightScaleEnable = CreateQuickCheckbutton(objectName.."UnitSpotlightScaleEnable", "Enable Scale", AlignmentColumn, panel.UnitSpotlightOpacityEnable, 8+ OffsetColumnB, 0)
	panel.UnitSpotlightBarEnable = CreateQuickCheckbutton(objectName.."UnitSpotlightBarEnable", "Enable Bar Color", AlignmentColumn, panel.UnitSpotlightScaleEnable, 8+OffsetColumnB)
	panel.UnitSpotlightGlowEnable = CreateQuickCheckbutton(objectName.."UnitSpotlightGlowEnable", "Enable Glow Color", AlignmentColumn, panel.UnitSpotlightBarEnable, 8+OffsetColumnB)

	--]]

	------------------------------
	-- Filter
	--------------------------------
	panel.FilterLabel = CreateQuickHeadingLabel(nil, "单位过滤", AlignmentColumn, F, 0, 5)
	panel.OpacityFiltered, F = CreateQuickSlider(objectName.."OpacityFiltered", "透明度:", nil, nil, AlignmentColumn, panel.FilterLabel, 0, 2)
	panel.ScaleFiltered, F = CreateQuickSlider(objectName.."ScaleFiltered", "比例:", nil, nil, AlignmentColumn, F, 0, 2)
	panel.FilterScaleLock, F = CreateQuickCheckbutton(objectName.."FilterScaleLock", "覆盖当前目标/高亮的比例", AlignmentColumn, F, 16)

	panel.OpacityFilterNeutralUnits, F = CreateQuickCheckbutton(objectName.."OpacityFilterNeutralUnits", "过滤中立单位", AlignmentColumn, F, 8, 4)
	panel.OpacityFilterNonElite, F = CreateQuickCheckbutton(objectName.."OpacityFilterNonElite", "过滤非精英单位", AlignmentColumn, F, 8)
	panel.OpacityFilterEnemyNPC, F = CreateQuickCheckbutton(objectName.."OpacityFilterEnemyNPC", "过滤敌方NPC", AlignmentColumn, F, 8)
	panel.OpacityFilterFriendlyNPC, F = CreateQuickCheckbutton(objectName.."OpacityFilterFriendlyNPC", "过滤友方NPC", AlignmentColumn, F, 8)
	panel.OpacityFilterUntitledFriendlyNPC, F = CreateQuickCheckbutton(objectName.."OpacityFilterUntitledFriendlyNPC", "过滤无头衔的友方NPC", AlignmentColumn, F, 8)

	panel.OpacityFilterPlayers = CreateQuickCheckbutton(objectName.."OpacityFilterPlayers", "过滤玩家", AlignmentColumn, panel.FilterScaleLock, OffsetColumnB, 4)
	panel.OpacityFilterInactive = CreateQuickCheckbutton(objectName.."OpacityFilterInactive", "过滤未激活的单位", AlignmentColumn, panel.OpacityFilterPlayers, OffsetColumnB)
	panel.OpacityFilterMini = CreateQuickCheckbutton(objectName.."OpacityFilterMini", "过滤宠物和仆从", AlignmentColumn, panel.OpacityFilterInactive, OffsetColumnB)

	panel.OpacityCustomFilterLabel = CreateQuickItemLabel(nil, "按名字过滤:", AlignmentColumn, F, 8, 4)
	panel.OpacityFilterList, L = CreateQuickEditbox(objectName.."OpacityFilterList", nil, nil, AlignmentColumn, panel.OpacityCustomFilterLabel, 8)


-- [[

    ------------------------------
	-- Reaction
	------------------------------
	-- Health Bar Color
    panel.ReactionLabel = CreateQuickHeadingLabel(nil, "（其他单位）反应", AlignmentColumn, L, 0, 5)
	panel.ReactionColorLabel = CreateQuickItemLabel(nil, "血条框架颜色:", AlignmentColumn, panel.ReactionLabel, 0, 2)
	panel.ColorFriendlyNPC = CreateQuickColorbox(objectName.."ColorFriendlyNPC", "友方NPC", nil, AlignmentColumn, panel.ReactionColorLabel , 16)
	panel.ColorFriendlyPlayer = CreateQuickColorbox(objectName.."ColorFriendlyPlayer", "友方玩家", nil, AlignmentColumn, panel.ColorFriendlyNPC , 16)
	panel.ColorNeutral= CreateQuickColorbox(objectName.."ColorNeutral", "中立单位", nil, AlignmentColumn, panel.ColorFriendlyPlayer , 16)
	panel.ColorHostileNPC = CreateQuickColorbox(objectName.."ColorHostileNPC", "敌方NPC", nil, AlignmentColumn, panel.ColorNeutral , 16)
	panel.ColorHostilePlayer = CreateQuickColorbox(objectName.."ColorHostilePlayer", "敌方玩家", nil, AlignmentColumn, panel.ColorHostileNPC , 16)
	panel.ColorGuildMember = CreateQuickColorbox(objectName.."ColorGuildMember", "公会成员", nil, AlignmentColumn, panel.ColorHostilePlayer , 16)
    -- Text Color
    panel.TextReactionColorLabel = CreateQuickItemLabel(nil, "文字颜色:", AlignmentColumn, panel.ReactionLabel, OffsetColumnB )
	panel.TextColorFriendlyNPC = CreateQuickColorbox(objectName.."TextColorFriendlyNPC", "友方NPC", nil, AlignmentColumn, panel.ReactionColorLabel , OffsetColumnB + 16)
	panel.TextColorFriendlyPlayer = CreateQuickColorbox(objectName.."TextColorFriendlyPlayer", "友方玩家", nil, AlignmentColumn, panel.TextColorFriendlyNPC , OffsetColumnB + 16)
	panel.TextColorNeutral= CreateQuickColorbox(objectName.."TextColorNeutral", "中立单位", nil, AlignmentColumn, panel.TextColorFriendlyPlayer , OffsetColumnB + 16)
	panel.TextColorHostileNPC = CreateQuickColorbox(objectName.."TextColorHostileNPC", "敌方NPC", nil, AlignmentColumn, panel.TextColorNeutral , OffsetColumnB + 16)
	panel.TextColorHostilePlayer = CreateQuickColorbox(objectName.."TextColorHostilePlayer", "敌方玩家", nil, AlignmentColumn, panel.TextColorHostileNPC , OffsetColumnB + 16)
	panel.TextColorGuildMember = CreateQuickColorbox(objectName.."TextColorGuildMember", "公会成员", nil, AlignmentColumn, panel.TextColorHostilePlayer , OffsetColumnB + 16)
	-- Other
	panel.OtherColorLabel = CreateQuickItemLabel(nil, "其他颜色:", AlignmentColumn, panel.ColorGuildMember, 0, 2)
	panel.ColorTapped = CreateQuickColorbox(objectName.."ColorTapped", "被其他玩家接触", nil, AlignmentColumn, panel.OtherColorLabel , 16)
	--panel.ColorTotem = CreateQuickColorbox(objectName.."ColorTotem", "Totem", nil, AlignmentColumn, panel.ColorTapped , 16)
	-- Custom Colors
	panel.CustomColorLabel = CreateQuickItemLabel(nil, "自定义颜色条件:", AlignmentColumn, panel.ColorTapped, 0, 2)
	panel.CustomColorList, L = CreateQuickEditbox(objectName.."CustomColorList", 200, 100, AlignmentColumn, panel.CustomColorLabel, 8)
	panel.CustomColorSelect = CreateQuickColorbox(objectName.."CustomColorSelect", "选择颜色", function(hex) local value = panel.CustomColorList:GetValue(); if value == "" then value = hex else value = value.."\n"..hex end; panel.CustomColorList:SetValue(value) end, AlignmentColumn, panel.CustomColorLabel , OffsetColumnB + 50)
	panel.CustomColorInfo = CreateQuickItemLabel(nil, "|cffCCCCCC十六进制颜色值(#) 后可以添加:\n- 单位名字\n- 法术效果名字/法术ID\n- 血量阈值\n\n(例：#A300FF 戈霍恩之嗣)\n|cffff9320优先级从上到下", AlignmentColumn, panel.CustomColorSelect, OffsetColumnB + 50, 2)
	panel.CustomColorInfo:SetHeight(150)
	panel.CustomColorInfo:SetWidth(220)
	panel.CustomColorInfo.Text:SetJustifyV("TOP")

--]]

	------------------------------
	-- Threat
	------------------------------
    -- Column 1
	panel.ThreatLabel = CreateQuickHeadingLabel(nil, "仇恨", AlignmentColumn, L, 0, 5)
	panel.ThreatWarningMode =  CreateQuickDropdown(objectName.."ThreatWarningMode", "仇恨模式:", ThreatWarningModes, 1, AlignmentColumn, panel.ThreatLabel, 0, 2)
	panel.ThreatGlowEnable = CreateQuickCheckbutton(objectName.."ThreatGlowEnable", "异常时显示预警标记", AlignmentColumn, panel.ThreatWarningMode,0)

	panel.ColorThreatColorLabels = CreateQuickItemLabel(nil, "仇恨颜色:", AlignmentColumn, panel.ThreatGlowEnable, 0, 2)
	panel.ColorThreatWarning = CreateQuickColorbox(objectName.."ColorThreatWarning", "异常", nil, AlignmentColumn, panel.ColorThreatColorLabels , 16)
	panel.ColorThreatTransition = CreateQuickColorbox(objectName.."ColorThreatTransition", "过渡", nil, AlignmentColumn, panel.ColorThreatWarning , 16)
	panel.ColorThreatSafe = CreateQuickColorbox(objectName.."ColorThreatSafe", "安全", nil, AlignmentColumn, panel.ColorThreatTransition, 16)

	panel.WidgetThreatIndicator, F = CreateQuickCheckbutton(objectName.."WidgetThreatIndicator", "显示仇恨指示条", AlignmentColumn, panel.ColorThreatSafe, 0, 2)
	panel.WidgetThreatPercentage, F = CreateQuickCheckbutton(objectName.."WidgetThreatPercentage", "显示仇恨百分比", AlignmentColumn, panel.WidgetThreatIndicator, 0, 2)

	--[[
	-- Warning Border Glow
	--]]

    -- Column 2
	panel.EnableOffTankHighlight = CreateQuickCheckbutton(objectName.."EnableOffTankHighlight", "高亮对副坦克的仇恨", AlignmentColumn, panel.ThreatLabel, OffsetColumnB)
	panel.ColorAttackingOtherTank = CreateQuickColorbox(objectName.."ColorAttackingOtherTank", "正在攻击其他坦克", nil, AlignmentColumn, panel.EnableOffTankHighlight , 16+OffsetColumnB)

	panel.ColorShowPartyAggro = CreateQuickCheckbutton(objectName.."ColorShowPartyAggro", "高亮对小队成员的仇恨", AlignmentColumn, panel.ColorAttackingOtherTank, OffsetColumnB)
	panel.ColorPartyAggro = CreateQuickColorbox(objectName.."ColorPartyAggro", "小队成员吸引仇恨", nil, AlignmentColumn, panel.ColorShowPartyAggro , 14+OffsetColumnB)
	panel.ColorPartyAggroBar = CreateQuickCheckbutton(objectName.."ColorPartyAggroBar", "血条框架颜色", AlignmentColumn, panel.ColorPartyAggro, 16+OffsetColumnB)
	panel.ColorPartyAggroGlow = CreateQuickCheckbutton(objectName.."ColorPartyAggroGlow", "过渡/异常时预警指示", AlignmentColumn, panel.ColorPartyAggroBar, 16+OffsetColumnB)
	panel.ColorPartyAggroText = CreateQuickCheckbutton(objectName.."ColorPartyAggroText", "姓名文字颜色", AlignmentColumn, panel.ColorPartyAggroGlow, 16+OffsetColumnB)

	------------------------------
	-- Health
	------------------------------
	panel.HealthLabel, F = CreateQuickHeadingLabel(nil, "血量", AlignmentColumn, panel.WidgetThreatPercentage, 0, 5)
	panel.EnableHealerWarning, F = CreateQuickCheckbutton(objectName.."EnableHealerWarning", "启用血量预警指示", AlignmentColumn, F)
	panel.HighHealthThreshold = CreateQuickSlider(objectName.."HighHealthThreshold", "高血量阈值:", nil, nil, AlignmentColumn, F, 0, 2)
	panel.LowHealthThreshold =  CreateQuickSlider(objectName.."LowHealthThreshold", "低血量阈值:", nil, nil, AlignmentColumn, panel.HighHealthThreshold, 0, 2)
	panel.HealthColorLabels = CreateQuickItemLabel(nil, "血条颜色:", AlignmentColumn, panel.LowHealthThreshold, 0)
	panel.ColorHighHealth = CreateQuickColorbox(objectName.."ColorHighHealth", "高血量", nil, AlignmentColumn, panel.HealthColorLabels , 16)
	panel.ColorMediumHealth = CreateQuickColorbox(objectName.."ColorMediumHealth", "中等血量", nil, AlignmentColumn, panel.ColorHighHealth , 16)
	panel.ColorLowHealth, F = CreateQuickColorbox(objectName.."ColorLowHealth", "低血量", nil, AlignmentColumn, panel.ColorMediumHealth , 16)
	-- [ ]  Highlight Enemy Healers


	------------------------------
    -- Cast Bars
	------------------------------
    panel.SpellCastLabel, F = CreateQuickHeadingLabel(nil, "施法条", AlignmentColumn, F, 0, 5)
    panel.SpellCastEnableFriendly, F = CreateQuickCheckbutton(objectName.."SpellCastEnableFriendly", "显示友方施法条", AlignmentColumn, F)
	panel.SpellCastColorLabel, F = CreateQuickItemLabel(nil, "施法条颜色:", AlignmentColumn, F, 0, 2)
	panel.ColorNormalSpellCast, F = CreateQuickColorbox(objectName.."ColorNormalSpellCast", "普通", nil, AlignmentColumn, F , 16)
	panel.ColorUnIntpellCast, F = CreateQuickColorbox(objectName.."ColorUnIntpellCast", "无法打断", nil, AlignmentColumn, F , 16)

	--[[
	------------------------------
	-- Text
	------------------------------
	panel.StatusTextLabel, F = CreateQuickHeadingLabel(nil, "Status Text", AlignmentColumn, F, 0, 5)

	panel.StatusTextLeft, F =  CreateQuickDropdown(objectName.."StatusTextLeft", "Custom Text Program:", CustomTextModes, 1, AlignmentColumn, F, 0, 0)
	panel.StatusTextLeftColor = CreateQuickCheckbutton(objectName.."StatusTextLeftColor", "Context Color", AlignmentColumn, F, 150, -16)
	--panel.StatusTextLeftBracket = CreateQuickCheckbutton(objectName.."StatusTextLeftBracket", "Bracket", AlignmentColumn, F, 300, -16)

	panel.StatusTextCenter, F =  CreateQuickDropdown(objectName.."StatusTextCenter", "", CustomTextModes, 1, AlignmentColumn, F, 0, -11)
	panel.StatusTextCenterColor = CreateQuickCheckbutton(objectName.."StatusTextCenterColor", "Context Color", AlignmentColumn, F, 150, -16)
	--panel.StatusTextCenterBracket = CreateQuickCheckbutton(objectName.."StatusTextCenterBracket", "Bracket", AlignmentColumn, F, 300, -16)

	panel.StatusTextRight, F =  CreateQuickDropdown(objectName.."StatusTextRight", "", CustomTextModes, 1, AlignmentColumn, F, 0, -11)
	panel.StatusTextRightColor = CreateQuickCheckbutton(objectName.."StatusTextRightColor", "Context Color", AlignmentColumn, F, 150, -16)
	--panel.StatusTextRightBracket = CreateQuickCheckbutton(objectName.."StatusTextRightBracket", "Bracket", AlignmentColumn, F, 300, -16)

	--]]

	------------------------------
	--Widgets
	------------------------------
	panel.WidgetLabel, F = CreateQuickHeadingLabel(nil, "其他组件", AlignmentColumn, F, 0, 5)
	panel.WidgetTargetHighlight = CreateQuickCheckbutton(objectName.."WidgetTargetHighlight", "将当前目标视为高亮状态", AlignmentColumn, panel.WidgetLabel)
	panel.WidgetEliteIndicator = CreateQuickCheckbutton(objectName.."WidgetEliteIndicator", "显示精英图标", AlignmentColumn, panel.WidgetTargetHighlight)
	panel.ClassEnemyIcon = CreateQuickCheckbutton(objectName.."ClassEnemyIcon", "显示敌方职业图标", AlignmentColumn, panel.WidgetEliteIndicator)
	panel.ClassPartyIcon = CreateQuickCheckbutton(objectName.."ClassPartyIcon", "显示友方职业图标", AlignmentColumn, panel.ClassEnemyIcon)
	panel.WidgetTotemIcon = CreateQuickCheckbutton(objectName.."WidgetTotemIcon", "显示图腾图标", AlignmentColumn, panel.ClassPartyIcon)
	panel.WidgetQuestIcon = CreateQuickCheckbutton(objectName.."WidgetQuestIcon", "在目标上显示任务图标", AlignmentColumn, panel.WidgetTotemIcon)
	panel.WidgetComboPoints = CreateQuickCheckbutton(objectName.."WidgetComboPoints", "在目标上显示玩家个人资源", AlignmentColumn, panel.WidgetQuestIcon)
	panel.WidgetComboPointsStyle, F =  CreateQuickDropdown(objectName.."WidgetComboPointsStyle", "个人资源样式:", ComboPointsStyles, 2, AlignmentColumn, panel.WidgetComboPoints, 16)

	--panel.WidgetEnableExternal = CreateQuickCheckbutton(objectName.."WidgetEnableExternal", "Enable External Widgets", AlignmentColumn, panel.WidgetComboPoints)

	--panel.WidgetThreatIndicatorMode =  CreateQuickDropdown(objectName.."WidgetThreatIndicatorMode", "Threat Indicator:", ThreatWidgetModes, 1, AlignmentColumn, panel.WidgetThreatIndicator, OffsetColumnB+16)
	
	panel.WidgetAbsorbIndicator = CreateQuickCheckbutton(objectName.."WidgetAbsorbIndicator", "显示吸收条", AlignmentColumn, panel.WidgetLabel, OffsetColumnB+60)
	panel.WidgetAbsorbMode =  CreateQuickDropdown(objectName.."WidgetAbsorbMode", "样式:", AbsorbModes, 1, AlignmentColumn, panel.WidgetAbsorbIndicator, OffsetColumnB+76)
	panel.WidgetAbsorbUnits = CreateQuickDropdown(objectName.."WidgetAbsorbUnits", "显示在:", AbsorbUnits, 1, AlignmentColumn, panel.WidgetAbsorbMode, OffsetColumnB+76)
	panel.WidgetRangeIndicator = CreateQuickCheckbutton(objectName.."WidgetRangeIndicator", "显示小队距离预警", AlignmentColumn, panel.WidgetAbsorbUnits, OffsetColumnB+60)
	panel.WidgetRangeMode =  CreateQuickDropdown(objectName.."WidgetRangeMode", "距离:", RangeModes, 1, AlignmentColumn, panel.WidgetRangeIndicator, OffsetColumnB+76)
	------------------------------
	-- Nameplate Behaviour
	------------------------------
	panel.NameplateBehaviourLabel, F = CreateQuickHeadingLabel(nil, "姓名板表现", AlignmentColumn, F, 0, 5)
	panel.NameplateTargetClamp, F = CreateQuickCheckbutton(objectName.."NameplateTargetClamp", "目标姓名板始终可见", AlignmentColumn, F, 0)
	panel.NameplateStacking, F = CreateQuickCheckbutton(objectName.."NameplateStacking", "堆叠姓名板", AlignmentColumn, F, 0)
	panel.NameplateMaxDistance, F = CreateQuickSlider(objectName.."NameplateMaxDistance", "最大显示距离", "ACTUAL", nil, AlignmentColumn, F, 0)
	panel.NameplateOverlapH = CreateQuickSlider(objectName.."NameplateOverlapH", "堆叠水平尺寸", "ACTUAL", 150, AlignmentColumn, F, 0)
	panel.NameplateOverlapV, F = CreateQuickSlider(objectName.."NameplateOverlapV", "堆叠垂直尺寸", "ACTUAL", 150, AlignmentColumn, F, 200)
	panel.NameplateClickableWidth = CreateQuickSlider(objectName.."NameplateClickableWidth", "点击区域宽度", nil, 150, AlignmentColumn, F, 0)
	panel.NameplateClickableHeight, F = CreateQuickSlider(objectName.."NameplateClickableHeight", "点击区域高度", nil, 150, AlignmentColumn, F, 200)
	------------------------------
	-- Advanced
	------------------------------
	panel.AdvancedLabel, F = CreateQuickHeadingLabel(nil, "趣味设定", AlignmentColumn, F, 0, 5)
	panel.TextUseBlizzardFont, F = CreateQuickCheckbutton(objectName.."TextUseBlizzardFont", "使用暴雪默认字体", AlignmentColumn, F, 0)
	panel.FocusAsTarget, F = CreateQuickCheckbutton(objectName.."FocusAsTarget", "将焦点目标视作当前目标", AlignmentColumn, F, 0)
	panel.TextCNNumberDisplay, F = CreateQuickCheckbutton(objectName.."TextCNNumberDisplay", "使用中文数字", AlignmentColumn, F, 0)
	panel.AdvancedEnableUnitCache, F = CreateQuickCheckbutton(objectName.."AdvancedEnableUnitCache", "启用标题缓存", AlignmentColumn, F)
	panel.FrameVerticalPosition, F = CreateQuickSlider(objectName.."FrameVerticalPosition", "姓名板垂直位置: (可能引起定位问题)", nil, nil, AlignmentColumn, F, 0, 4)
	panel.FrameBarWidth, F = CreateQuickSlider(objectName.."FrameBarWidth", "血条宽度 (%)", nil, nil, AlignmentColumn, F, 0, 4)

	--panel.AdvancedCustomCodeLabel = CreateQuickItemLabel(nil, "Custom Theme Code:", AlignmentColumn, panel.FrameVerticalPosition, 0, 4)
	--panel.AdvancedCustomCodeTextbox = CreateQuickEditbox(objectName.."AdvancedCustomCodeTextbox", nil, nil, AlignmentColumn, panel.AdvancedHealthTextLabel, 8)


	--[[
	theme.Default.name.size = 18
	--]]
	local ClearCacheButton = CreateFrame("Button", objectName.."ClearCacheButton", AlignmentColumn, "TidyPlatesContPanelButtonTemplate")
	ClearCacheButton:SetPoint("TOPLEFT", F, "BOTTOMLEFT",-6, -18)
	--ClearCacheButton:SetPoint("TOPLEFT", panel.AdvancedCustomCodeTextbox, "BOTTOMLEFT",-6, -18)
	ClearCacheButton:SetWidth(300)
	ClearCacheButton:SetText("清理缓存")
	ClearCacheButton:SetScript("OnClick", function()
			local count = 0

			print("Tidy Plates Continued Hub: 清除了", count, "条缓存。")
		end)

	local BlizzOptionsButton = CreateFrame("Button", objectName.."BlizzButton", AlignmentColumn, "TidyPlatesContPanelButtonTemplate")
	BlizzOptionsButton:SetPoint("TOPLEFT", ClearCacheButton, "BOTTOMLEFT", 0, -16)
	--BlizzOptionsButton:SetPoint("TOPLEFT", panel.AdvancedCustomCodeTextbox, "BOTTOMLEFT",-6, -18)
	BlizzOptionsButton:SetWidth(300)
	BlizzOptionsButton:SetText("打开暴雪姓名板设置...")
	BlizzOptionsButton:SetScript("OnClick", function() InterfaceOptionsFrame_OpenToCategory(_G["InterfaceOptionsNamesPanel"]) end)


	------------------------------
	-- Set Sizes and Mechanics
	------------------------------
	panel.MainFrame:SetHeight(2800)

	panel.OpacityFilterList:SetWidth(200)
	panel.WidgetDebuffTrackList:SetWidth(200)

	SetSliderMechanics(panel.OpacityTarget, 1, 0, 1, .01)
	SetSliderMechanics(panel.OpacityNonTarget, 1, 0, 1, .01)
	SetSliderMechanics(panel.OpacitySpotlight, 1, 0, 1, .01)
	SetSliderMechanics(panel.OpacityFiltered, 1, 0, 1, .01)

	SetSliderMechanics(panel.ScaleFiltered, 1, .5, 2.2, .01)
	SetSliderMechanics(panel.ScaleStandard, 1, .5, 2.2, .01)
	SetSliderMechanics(panel.ScaleSpotlight, 1, .5, 2.2, .01)

	SetSliderMechanics(panel.SpacerSlots, 0, 0, 4, 1)

	SetSliderMechanics(panel.FrameVerticalPosition, .5, 0, 1, .02)
	SetSliderMechanics(panel.FrameBarWidth, 1, .3, 1.7, .02)

	SetSliderMechanics(panel.HighHealthThreshold, .7, .01, 1, .01)
	SetSliderMechanics(panel.LowHealthThreshold, .3, .01, 1, .01)

	SetSliderMechanics(panel.NameplateMaxDistance, 0, 10, 100, 1)
	SetSliderMechanics(panel.NameplateOverlapH, 0, 0, 10, .1)
	SetSliderMechanics(panel.NameplateOverlapV, 0, 0, 10, .1)
	SetSliderMechanics(panel.NameplateClickableWidth, 1, .1, 2, .01)
	SetSliderMechanics(panel.NameplateClickableHeight, 1, .1, 2, .01)

	-- "RefreshSettings" is called; A) When PLAYER_ENTERING_WORLD is called, and; B) When changes are made to settings

	local ConvertStringToTable = TidyPlatesContHubHelpers.ConvertStringToTable
	local ConvertDebuffListTable = TidyPlatesContHubHelpers.ConvertDebuffListTable
	local ConvertColorListTable = TidyPlatesContHubHelpers.ConvertColorListTable
	local CallForStyleUpdate = TidyPlatesContHubHelpers.CallForStyleUpdate

	function panel.RefreshSettings(LocalVars)
		-- print("RefreshSettings", panel:IsShown())
		CallForStyleUpdate()
		-- Convert Debuff Filter Strings
		ConvertDebuffListTable(LocalVars.WidgetDebuffTrackList, LocalVars.WidgetDebuffLookup, LocalVars.WidgetDebuffPriority)
		-- Convert Unit Filter Strings
		ConvertStringToTable(LocalVars.OpacityFilterList, LocalVars.OpacityFilterLookup)
		ConvertStringToTable(LocalVars.UnitSpotlightList, LocalVars.UnitSpotlightLookup)
		ConvertColorListTable(LocalVars.CustomColorList, LocalVars.CustomColorLookup)
	end

	--panel:Hide()
end


-- Create Instances of Panels
local TankPanel = CreateHubInterfacePanel( "HubPanelSettingsTank", "|cFF3782D1坦克模板", "Tidy Plates Continued" )
TidyPlatesContPanel:AddProfile("Tank")
BuildHubPanel(TankPanel)
function ShowTidyPlatesContHubTankPanel() TidyPlatesContUtility.OpenInterfacePanel(TankPanel) end


local DamagePanel = CreateHubInterfacePanel( "HubPanelSettingsDamage", "|cFFFF1100伤害输出模板", "Tidy Plates Continued" )
TidyPlatesContPanel:AddProfile("Damage")
BuildHubPanel(DamagePanel)
function ShowTidyPlatesContHubDamagePanel() TidyPlatesContUtility.OpenInterfacePanel(DamagePanel) end



local HealerPanel = CreateHubInterfacePanel( "HubPanelSettingsHealer", "|cFF44DD55治疗者模板", "Tidy Plates Continued"  )
TidyPlatesContPanel:AddProfile("Healer")
BuildHubPanel(HealerPanel)
function ShowTidyPlatesContHubHealerPanel() TidyPlatesContUtility.OpenInterfacePanel(HealerPanel) end


local GladiatorPanel = CreateHubInterfacePanel( "HubPanelSettingsGladiator", "|cFFAA6600角斗士模板", "Tidy Plates Continued"  )
TidyPlatesContPanel:AddProfile("Gladiator")
BuildHubPanel(GladiatorPanel)
function ShowTidyPlatesContHubGladiatorPanel() TidyPlatesContUtility.OpenInterfacePanel(GladiatorPanel) end



---------------------------------------------
-- Slash Commands
---------------------------------------------

function ShowTidyPlatesContHubPanel()
	local profile = TidyPlatesContOptions.ActiveProfile
	if profile == "坦克" then
		ShowTidyPlatesContHubTankPanel()
	elseif profile == "治疗者" then
		ShowTidyPlatesContHubHealerPanel()
	elseif profile == "角斗士" then
		ShowTidyPlatesContHubGladiatorPanel()
	else
		ShowTidyPlatesContHubDamagePanel()
	end

end

local function SlashCommandHub()
	--local profile = GetProfile()
	ShowTidyPlatesContHubPanel()
end


SLASH_HUB1 = '/hub'
SlashCmdList['HUB'] = SlashCommandHub


--[[
	local ColorPanel = CreateInterfacePanel( "HubPanelSettingsColors", "Tidy Plates Continued Hub: 颜色", nil )
	ColorPanel.RefreshSettings = function() end
	InterfaceOptions_AddCategory(ColorPanel)
--]]
--end

--local HubHandler = CreateFrame("Frame")
--HubHandler:SetScript("OnEvent", OnLogin)
--HubHandler:RegisterEvent("PLAYER_LOGIN")





--[[
local GladiatorPanel = CreateInterfacePanel( "HubPanelSettingsGladiator", "Tidy Plates Continued Hub: |cFFAA6600角斗士", nil )
BuildHubPanel(GladiatorPanel)
function ShowTidyPlatesContHubGladiatorPanel() InterfaceOptionsFrame_OpenToCategory(GladiatorPanel) end
--]]
--[[

-- Testing

/run print(HubDamageConfigFrame:GetParent())
/run HubDamageConfigFrame:SetParent(UIParent); HubDamageConfigFrame:SetPoint("TOPLEFT")

HubDamageConfigFrame = DamagePanel

--]]


StaticPopupDialogs["TidyPlatesContHUB_RESETCHECK"] = {
  text = "Tidy Plates Continued Hub: 你的当前设置已经过期……",
  button1 = "重置并重载UI",
  button2 = "忽略",

  OnAccept = function()
  		-- print()
  end,

  OnCancel = function()
  		-- print()
  end,

  timeout = 0,
  whileDead = true,
  hideOnEscape = true,
  preferredIndex = 3,  -- avoid some UI taint, see http://www.wowace.com/announcements/how-to-avoid-some-ui-taint/
}

--StaticPopup_Show ("TidyPlatesContHUB_RESETCHECK")
--StaticPopup_Hide ("EXAMPLE_HELLOWORLD")




