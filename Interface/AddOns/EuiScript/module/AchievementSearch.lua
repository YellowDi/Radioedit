-- Version: 1.1.0
-- Author: ldz5 and Jai
-- Title: |cffff565e[NetEase]|r Achievement Search
-- modify by eui.cc at 2015.01.29
-- modify by eui.cc at 2016.04.14
local E = unpack(ElvUI)
local L = {}
if GetLocale() == "zhCN" then
	L["Completion date"] = "完成日期"
	L["Description"] = "描述"
	L["Name"] = "名称"
	L["No search results"] = "没有搜索结果"
	L["Reward"] = "奖励"
	L["Use Lua match"] = "使用Lua匹配"
elseif GetLocale() == 'zhTW' then
	L["Completion date"] = "完成日期"
	L["Description"] = "描述"
	L["Name"] = "名稱"
	L["No search results"] = "沒有搜索結果"
	L["Reward"] = "獎勵"
	L["Use Lua match"] = "使用Lua匹配"
else
	L["Completion date"] = "Completion date"
	L["Description"] = "Description"
	L["Name"] = "Name"
	L["No search results"] = "No search results"
	L["Reward"] = "Reward"
	L["Use Lua match"] = "Use Lua match"
end

--API.lua

local strmatch = string.match
local pcall = pcall

ACHIEVEMENTSEARCH_DB = {
    Achievement = {
        name = true,
        description = true,
        reward = true,
        date = false,
    }
}

local function GetAchievementSetting(key)
    return ACHIEVEMENTSEARCH_DB.Achievement[key]
end

local function SetAchievementSetting(key, value)
    ACHIEVEMENTSEARCH_DB.Achievement[key] = value
end

local function safefind(source, pattern)
    local ok, result = pcall(strmatch, source, pattern)
    return ok and result
end

--Achievement.lua
local filterText
local filterList = {}
local filterArgs = {}

local FUNCTIONS = {
    ACHIEVEMENT_FUNCTIONS,
    GUILD_ACHIEVEMENT_FUNCTIONS,
}

local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == 'Blizzard_AchievementUI' then
		do
			local function MakeGetCategoryNumAchievements(name)
				local old = _G[name]
				_G[name] = function(category, raw)
					if not filterText or raw then
						return old(category)
					else
						return #filterList, 0, 0
					end
				end
			end

			MakeGetCategoryNumAchievements('AchievementFrame_GetCategoryNumAchievements_All')
			MakeGetCategoryNumAchievements('AchievementFrame_GetCategoryNumAchievements_Complete')
			MakeGetCategoryNumAchievements('AchievementFrame_GetCategoryNumAchievements_Incomplete')

			ACHIEVEMENTUI_SELECTEDFILTER = AchievementFrame_GetCategoryNumAchievements_All
		--    AchievementFrameFilters[1].func = AchievementFrame_GetCategoryNumAchievements_All
		--    AchievementFrameFilters[2].func = AchievementFrame_GetCategoryNumAchievements_Complete
		--    AchievementFrameFilters[3].func = AchievementFrame_GetCategoryNumAchievements_Incomplete
		end

		do
			setfenv(AchievementFrameAchievements_Update, setmetatable({
				AchievementButton_DisplayAchievement = function(button, category, achievement, selectionID)
					local item = filterText and filterList[achievement]
					if item then
						button.category = item.category
						return AchievementButton_DisplayAchievement(button, item.category, item.index, selectionID)
					else
						button.category = index
						return AchievementButton_DisplayAchievement(button, category, achievement, selectionID)
					end
				end
			}, {__index = _G}))

			setfenv(AchievementButton_OnClick, setmetatable({
				AchievementButton_DisplayAchievement = function(button, category, achievement, selectionID)
					if category == 'total' then
						return AchievementButton_DisplayAchievement(button, button.category, achievement, selectionID)
					else
						return AchievementButton_DisplayAchievement(button, category, achievement, selectionID)
					end
				end
			}, {__index = _G}))
		end

		local function Match(find, text, name, description, rewardText, month, day, year)
			return GetAchievementSetting('name')        and find(name:lower(), text) or
				   GetAchievementSetting('description') and find(description:lower(), text) or
				   GetAchievementSetting('reward')      and find(rewardText:lower(), text) or
				   GetAchievementSetting('date')        and find(format(SHORTDATE, month, day, year), text)
		end

		local function Cache(get, category, cindex)
			local match = GetAchievementSetting('match')
			local find = match and safefind or string.match
			local text = match and filterText or filterText:gsub('[^%w\128-\255]', '%%%1'):lower()
			local numAchievements, numCompleted, completedOffset = get(category, true)
			
			for i = 1 + completedOffset, numAchievements + completedOffset do
				local id, name, points, completed,
						month, day, year, description, flags,
						icon, rewardText, isGuild, wasEarnedByMe, earnedBy = GetAchievementInfo(category, i)

				if id and Match(find, text, name, description, rewardText, month, day, year) then
					tinsert(filterList, {
						category = category,
						index = i,
						key = format('%d%08x%08x', completed and 0 or 1, cindex or 0, i)
					})
				end
			end
		end

		local function SortHandler(a, b)
			return a.key < b.key
		end

		local Timer = CreateFrame('Frame', nil, AchievementFrameHeader) do
			Timer:Hide()
			Timer:SetScript('OnUpdate', function(self)
				local category = self.categories[self.index]
				if category then
					Cache(ACHIEVEMENTUI_SELECTEDFILTER, category, self.index)
					self.index = self.index + 1
				else
					self:Hide()
					sort(filterList, SortHandler)
					AchievementFrameAchievements_Update()
				end
			end)

			local Loading = CreateFrame('Frame', nil, Timer, 'LoadingSpinnerTemplate') do
				Loading:SetPoint('TOP', AchievementFrameAchievements, 0, -189)
				Loading.Anim:Play()
				Loading:Hide()
			end

			function Timer:Start(categories)
				self.categories = categories
				self.index = 1
				self:Show()
				Loading:SetShown(#categories > 1)
				AchievementFrameAchievementsFeatOfStrengthText:Hide()
			end

			Timer.Stop = Timer.Hide
		end

		local function UpdateSearch()
			local achievementFunctions = FUNCTIONS[AchievementFrame.selectedTab]
			if not achievementFunctions then
				return
			end

			local category = achievementFunctions.selectedCategory

			wipe(filterList)

			if filterText then
				if category == 'summary' or category == 'total' then
					AchievementFrameSummary:Hide()
					AchievementFrameAchievements:Show()
					achievementFunctions.selectedCategory = 'total'

					AchievementFrameAchievements_Update()
					Timer:Start(achievementFunctions.categoryAccessor())
				else
					Timer:Start({category})
				end
			else
				Timer:Stop()
				if category == 'summary' or category == 'total' then
					AchievementFrameSummary:Show()
					AchievementFrameAchievements:Hide()
					achievementFunctions.selectedCategory = 'summary'
				end
				AchievementFrameAchievements_Update()
			end
		end

		local SearchBox = CreateFrame('EditBox', nil, AchievementFrameHeader, 'SearchBoxTemplate') do
			SearchBox:SetPoint('TOPLEFT', AchievementFrame, 148, 12)
			SearchBox:SetSize(96, 15)
			SearchBox.Left:Hide()
			SearchBox.Right:Hide()
			SearchBox.Middle:Hide()
			SearchBox:HookScript('OnTextChanged', function(SearchBox)
				filterText = SearchBox:GetText()
				filterText = filterText ~= '' and filterText or nil
				UpdateSearch()
			end)

			local SearchInset = SearchBox.Left do
				SearchInset:Show()
				SearchInset:SetSize(128, 32)
				SearchInset:ClearAllPoints()
				SearchInset:SetPoint('TOPLEFT', AchievementFrameHeader, 'TOPLEFT', 111, -56)
				SearchInset:SetTexture([[Interface\AchievementFrame\UI-Achievement-RightDDLInset]])
				SearchInset:SetTexCoord(0, 1, 0, 1)
			end

			local function OnUpdate(self)
				self:SetShown(AchievementFrameAchievements:IsShown() or AchievementFrameSummary:IsShown())
				self:SetScript('OnUpdate', nil)
			end

			local function ToggleSearchBox()
				SearchBox:SetScript('OnUpdate', OnUpdate)
			end

			local function ShowSearchBox()
				SearchBox:Show()
			end

			AchievementFrameAchievements:HookScript('OnShow', ShowSearchBox)
			AchievementFrameAchievements:HookScript('OnHide', ToggleSearchBox)
			AchievementFrameSummary:HookScript('OnShow', ShowSearchBox)
			AchievementFrameSummary:HookScript('OnHide', ToggleSearchBox)
			AchievementFrame:HookScript('OnHide', function()
				local achievementFunctions = FUNCTIONS[AchievementFrame.selectedTab]
				if achievementFunctions and achievementFunctions.selectedCategory == 'total' then
					achievementFunctions.selectedCategory = 'summary'
				end
			end)
		end

		local Option = CreateFrame('Button', nil, SearchBox) do
			Option:SetSize(16, 16)
			Option:SetPoint('LEFT', SearchBox, 'RIGHT', -5, -1)

			local icon = Option:CreateTexture(nil, 'BACKGROUND')
			icon:SetAllPoints(Option)
			icon:SetTexture([[Interface\GossipFrame\HealerGossipIcon]])

			local function set(button, key, value)
				SetAchievementSetting(button.value, not GetAchievementSetting(button.value))
				UpdateSearch()
			end

			local function check(button)
				return GetAchievementSetting(button.value)
			end

			local dropdown = {
				menuList = {
					{ isNotRadio = true, checked = check, func = set, value = 'name', text = L['Name'], },
					{ isNotRadio = true, checked = check, func = set, value = 'description', text = L['Description'], },
					{ isNotRadio = true, checked = check, func = set, value = 'reward', text = L['Reward'], },
					{ isNotRadio = true, checked = check, func = set, value = 'date', text = L['Completion date'], },
					{
						text = '',
						iconOnly = true,
						isTitle = true,
						notCheckable = true,
						icon = [[Interface\Common\UI-TooltipDivider-Transparent]],
						iconInfo = { tCoordLeft = 0, tCoordRight = 1, tCoordTop = 0, tCoordBottom = 1, tSizeX = 0, tFitDropDownSizeX = true, tSizeY = 8, }
					},
					{ isNotRadio = true, checked = check, func = set, value = 'match', text = L['Use Lua match'], },
				},
				initialize = EasyMenu_Initialize,
				SetHeight = nop,
			} 

			Option:SetScript('OnClick', function()
				ToggleDropDownMenu(1, nil, dropdown, SearchBox, -10, 0, dropdown.menuList)
			end)
		end

		hooksecurefunc('AchievementCategoryButton_OnClick', UpdateSearch)
		hooksecurefunc('AchievementFrameBaseTab_OnClick', function()
			for i, v in ipairs(FUNCTIONS) do
				if i ~= id and v.selectedCategory == 'total' then
					v.selectedCategory = 'summary'
				end
			end
			UpdateSearch()
		end)

		local prevFilterFunc = ACHIEVEMENTUI_SELECTEDFILTER
		hooksecurefunc('AchievementFrame_SetFilter', function()
			if prevFilterFunc == ACHIEVEMENTUI_SELECTEDFILTER then
				return
			end
			prevFilterFunc = ACHIEVEMENTUI_SELECTEDFILTER
			UpdateSearch()
		end)

		hooksecurefunc('AchievementFrameAchievements_Update', function()
			if not filterText or #filterList > 0 then
				return
			end

			if Timer:IsShown() then
				AchievementFrameAchievementsFeatOfStrengthText:Hide()
			else
				AchievementFrameAchievementsFeatOfStrengthText:Show()
				AchievementFrameAchievementsFeatOfStrengthText:SetText(L['No search results'])
			end
		end)

		--Stats.lua
		local filterText

		local achievementNames = setmetatable({}, {__index = function(t, id)
			t[id] = select(2, GetAchievementInfo(id)) or false
			return t[id]
		end})

		setfenv(AchievementFrameStats_Update, setmetatable({
			GetStatistic = function(...)
				local quantity, skip, id = GetStatistic(...)
				if filterText then
					local name = achievementNames[id]
					if name and not safefind(name, filterText) then
						skip = true
					end
				end
				return quantity, skip, id
			end
		}, {__index = _G}))

		local SearchBox2= CreateFrame('EditBox', nil, AchievementFrameStats, 'SearchBoxTemplate') do
			SearchBox2:SetPoint('TOPLEFT', AchievementFrame, 148, 12)
			SearchBox2:SetSize(108, 15)
			SearchBox2.Left:Hide()
			SearchBox2.Right:Hide()
			SearchBox2.Middle:Hide()
			SearchBox2:HookScript('OnTextChanged', function(SearchBox2)
				filterText = SearchBox2:GetText()
				filterText = filterText ~= '' and filterText or nil
				STAT_FUNCTIONS.lastCategory = nil
				AchievementFrameStats_Update()
			end)

			local SearchInset = SearchBox2.Left do
				SearchInset:Show()
				SearchInset:SetSize(128, 32)
				SearchInset:ClearAllPoints()
				SearchInset:SetPoint('TOPLEFT', AchievementFrameHeader, 'TOPLEFT', 111, -56)
				SearchInset:SetTexture([[Interface\AchievementFrame\UI-Achievement-RightDDLInset]])
				SearchInset:SetTexCoord(0, 1, 0, 1)
			end
		end

		if E.private.skins.blizzard.enable == true and E.private.skins.blizzard.achievement == true then
			E:GetModule('Skins'):HandleEditBox(SearchBox)
			E:GetModule('Skins'):HandleEditBox(SearchBox2)
		end
	end
end)