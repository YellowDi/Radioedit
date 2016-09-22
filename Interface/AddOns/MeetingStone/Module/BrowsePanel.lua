
BuildEnv(...)

BrowsePanel = Addon:NewModule(CreateFrame('Frame'), 'BrowsePanel', 'AceEvent-3.0', 'AceTimer-3.0', 'AceSerializer-3.0')

function BrowsePanel:OnInitialize()
    GUI:Embed(self, 'Owner', 'Refresh')
    MainPanel:RegisterPanel(L['查找活动'], self, 5, 100)

    self.activityHash = {}
    self.activityList = {}
    self.bossFilter = {}

    local ActivityList = GUI:GetClass('DataGridView'):New(self) do
        ActivityList:SetAllPoints(self)
        ActivityList:SetItemHighlightWithoutChecked(true)
        ActivityList:SetItemHeight(32)
        ActivityList:SetItemSpacing(1)
        ActivityList:SetItemClass(Addon:GetClass('BrowseItem'))
        ActivityList:SetSelectMode('RADIO')
        ActivityList:SetScrollStep(9)
        ActivityList:SetItemList(self.activityList)
        ActivityList:SetSortHandler(function(activity)
            return activity:BaseSortHandler()
        end)
        ActivityList:RegisterFilter(function(activity, ...)
            return activity:Match(...)
        end)
        ActivityList:InitHeader{
            {
                key = '@',
                text = '@',
                style = 'ICON:20:20',
                width = 30,
                iconHandler = function(activity)
                    if activity:IsUnusable() then
                        return
                    elseif activity:IsSelf() then
                        return [[Interface\AddOns\MeetingStone\Media\Icons]], 0.25, 0.375, 0, 1
                    elseif activity:IsInActivity() then
                        return [[Interface\AddOns\MeetingStone\Media\Icons]], 0.375, 0.5, 0, 1
                    elseif activity:IsApplication() then
                        return [[Interface\AddOns\MeetingStone\Media\Icons]], 0.5, 0.625, 0, 1
                    elseif activity:IsAnyFriend() then
                        return [[Interface\AddOns\MeetingStone\Media\Icons]], 0, 0.125, 0, 1
                    end
                end,
                sortHandler = ActivityList:GetSortHandler(),
            },
            {
                key = 'ActivityName',
                text = L['活动类型'],
                style = 'LEFT',
                width = 170,
                showHandler = function(activity)
                    if activity:IsUnusable() then
                        return activity:GetName(), GRAY_FONT_COLOR.r, GRAY_FONT_COLOR.g, GRAY_FONT_COLOR.b
                    elseif activity:IsAnyFriend() then
                        return activity:GetName(), BATTLENET_FONT_COLOR.r, BATTLENET_FONT_COLOR.g, BATTLENET_FONT_COLOR.b
                    else
                        return activity:GetName(), NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b
                    end
                end,
                sortHandler = function(activity)
                    return activity:GetTypeSortValue()
                end,
                formatHandler = function(grid, activity)
                    if activity:IsDelisted() or activity:IsApplication() then
                        grid:GetParent():SetSelectable(false)

                        if activity == ActivityList:GetSelectedItem() then
                            ActivityList:SetSelected(nil)
                        end
                    else
                        grid:GetParent():SetSelectable(true)
                    end
                end
            },
            {
                key = 'ActivityLoot',
                text = L['拾取'],
                style = 'LEFT',
                width = 50,
                showHandler = function(activity)
                    if activity:IsUnusable() then
                        return activity:GetLootShortText(), GRAY_FONT_COLOR.r, GRAY_FONT_COLOR.g, GRAY_FONT_COLOR.b
                    else
                        return activity:GetLootShortText()
                    end
                end,
                sortHandler = function(activity)
                    return activity:GetLoot()
                end
            },
            {
                key = 'ActivityMode',
                text = L['形式'],
                style = 'LEFT',
                width = 50,
                showHandler = function(activity)
                    if activity:IsUnusable() then
                        return activity:GetModeText(), GRAY_FONT_COLOR.r, GRAY_FONT_COLOR.g, GRAY_FONT_COLOR.b
                    else
                        return activity:GetModeText()
                    end
                end,
                sortHandler = function(activity)
                    return activity:GetMode()
                end,
            },
            {
                key = 'MemberRole',
                text = L['成员'],
                width = 125,
                class = Addon:GetClass('MemberDisplay'),
                formatHandler = function(grid, activity)
                    grid:SetActivity(activity)
                end,
            },
            {
                key = 'Level',
                text = L['等级'],
                width = 60,
                textHandler = function(activity)
                    local minLevel = activity:GetMinLevel()
                    local maxLevel = activity:GetMaxLevel()
                    local isMax = maxLevel >= MAX_PLAYER_LEVEL
                    local isMin = minLevel <= 1

                    if isMax and isMin then
                        return NONE, GRAY_FONT_COLOR.r, GRAY_FONT_COLOR.g, GRAY_FONT_COLOR.b
                    else
                        local text = minLevel == maxLevel and minLevel or isMax and '≥' .. minLevel or minLevel .. '-' .. maxLevel
                        local color = activity:IsUnusable() and GRAY_FONT_COLOR or activity:IsLevelValid() and GREEN_FONT_COLOR or RED_FONT_COLOR
                        return text, color.r, color.g, color.b
                    end
                end
            },
            {
                key = 'ItemLeave',
                text = L['要求'],
                width = 60,
                textHandler = function(activity)
                    if activity:IsArenaActivity() then
                        local pvpRating = activity:GetPvPRating()
                        if pvpRating == 0 then
                            return NONE, GRAY_FONT_COLOR.r, GRAY_FONT_COLOR.g, GRAY_FONT_COLOR.b
                        else
                            local color = activity:IsUnusable() and GRAY_FONT_COLOR or activity:IsPvPRatingValid() and GREEN_FONT_COLOR or RED_FONT_COLOR
                            return pvpRating, color.r, color.g, color.b
                        end
                    else
                        local itemLevel = activity:GetItemLevel()
                        if itemLevel == 0 then
                            return NONE, GRAY_FONT_COLOR.r, GRAY_FONT_COLOR.g, GRAY_FONT_COLOR.b
                        else
                            local color = activity:IsUnusable() and GRAY_FONT_COLOR or activity:IsItemLevelValid() and GREEN_FONT_COLOR or RED_FONT_COLOR
                            return itemLevel, color.r, color.g, color.b
                        end
                    end
                end
            },
            {
                key = 'Leader',
                text = L['团长'],
                style = 'LEFT',
                width = 100,
                showHandler = function(activity)
                    if activity:IsUnusable() then
                        return activity:GetLeaderShort(), GRAY_FONT_COLOR.r, GRAY_FONT_COLOR.g, GRAY_FONT_COLOR.b
                    else
                        return activity:GetLeaderShortText(), NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b
                    end
                end,
            },
            {
                key = 'Title',
                text = L['说明'],
                width = 170,
                class = Addon:GetClass('SummaryGrid'),
                formatHandler = function(grid, activity)
                    grid:SetActivity(activity)
                end
                -- showHandler = function(activity)
                --     return activity:GetTitle()
                -- end,
            }
        }
        ActivityList:SetHeaderPoint('BOTTOMLEFT', ActivityList, 'TOPLEFT', -2, 2)

        ActivityList:SetCallback('OnItemDecline', function(_, _, activity)
            C_LFGList.CancelApplication(activity:GetID())
        end)
        ActivityList:SetCallback('OnSelectChanged', function(_, _, activity)
            self:UpdateSignUpButton(activity)
        end)
        ActivityList:SetCallback('OnRefresh', function(ActivityList)
            local shownCount = ActivityList:GetShownCount()
            if shownCount > 0 then
                self.NoResultBlocker:SetPoint('TOP', ActivityList:GetButton(shownCount), 'BOTTOM')
            else
                self.NoResultBlocker:SetPoint('TOP')
            end
            self.ActivityTotals:SetFormattedText(L['活动总数：%d/%d'], ActivityList:GetItemCount(), #self.activityList)
        end)
        ActivityList:SetCallback('OnItemEnter', function(_, _, activity)
            MainPanel:OpenActivityTooltip(activity)
        end)
        ActivityList:SetCallback('OnItemLeave', function()
            MainPanel:CloseTooltip()
        end)
        ActivityList:SetCallback('OnItemMenu', function(_, itemButton, activity)
            self:ToggleActivityMenu(itemButton, activity)
        end)
    end

    local SearchingBlocker = CreateFrame('Frame', nil, self) do
        SearchingBlocker:Hide()
        SearchingBlocker:SetAllPoints(self)
        SearchingBlocker:SetScript('OnShow', function()
            ActivityList:GetScrollChild():Hide()
        end)
        SearchingBlocker:SetScript('OnHide', function(SearchingBlocker)
            ActivityList:GetScrollChild():Show()
            SearchingBlocker:Hide()
        end)

        local Spinner = CreateFrame('Frame', nil, SearchingBlocker, 'LoadingSpinnerTemplate') do
            Spinner:SetPoint('CENTER')
            Spinner.Anim:Play()
        end

        local Label = SearchingBlocker:CreateFontString(nil, 'ARTWORK', 'GameFontNormalLarge') do
            Label:SetPoint('BOTTOM', Spinner, 'TOP')
            Label:SetText(SEARCHING)
        end
    end

    local NoResultBlocker = CreateFrame('Frame', nil, self) do
        NoResultBlocker:SetPoint('BOTTOMLEFT')
        NoResultBlocker:SetPoint('BOTTOMRIGHT')
        NoResultBlocker:SetPoint('TOP')
        NoResultBlocker:Hide()

        local Label = NoResultBlocker:CreateFontString(nil, 'ARTWORK', 'GameFontDisable') do
            Label:SetPoint('CENTER', 0, 20)
        end

        local Button = CreateFrame('Button', nil, NoResultBlocker, 'UIPanelButtonTemplate') do
            Button:SetPoint('CENTER', 0, -20)
            Button:SetSize(120, 22)
            Button:SetText(L['创建活动'])
            Button:SetScript('OnClick', function()
                ToggleCreatePanel(self.ActivityDropdown:GetValue())
            end)
        end

        NoResultBlocker.Label = Label
        NoResultBlocker.Button = Button
    end

    local SignUpButton = CreateFrame('Button', nil, self, 'UIPanelButtonTemplate') do
        GUI:Embed(SignUpButton, 'Tooltip')
        SignUpButton:SetTooltipAnchor('ANCHOR_TOP')
        SignUpButton:SetSize(120, 22)
        SignUpButton:SetPoint('BOTTOM', MainPanel, 'BOTTOM', 0, 4)
        SignUpButton:SetText(L['申请加入'])
        SignUpButton:Disable()
        SignUpButton:SetMotionScriptsWhileDisabled(true)
        SignUpButton:SetScript('OnClick', function()
            self:SignUp(self.ActivityList:GetSelectedItem())
        end)
        SignUpButton:SetScript('OnShow', function()
            self:UpdateSignUpButton(self.ActivityList:GetSelectedItem())
        end)
        MagicButton_OnLoad(SignUpButton)
    end

    local ActivityLabel = self:CreateFontString(nil, 'ARTWORK', 'GameFontHighlight') do
        ActivityLabel:SetPoint('TOPLEFT', MainPanel, 'TOPLEFT', 70, -30)
        ActivityLabel:SetText(L['活动类型'])
    end

    local ActivityDropdown = GUI:GetClass('Dropdown'):New(self) do
        ActivityDropdown:SetPoint('TOPLEFT', ActivityLabel, 'BOTTOMLEFT', 0, -5)
        ActivityDropdown:SetSize(170, 26)
        ActivityDropdown:SetMaxItem(20)
        ActivityDropdown:SetDefaultValue(0)
        ActivityDropdown:SetDefaultText(L['请选择活动类型'])
        ActivityDropdown:SetCallback('OnSelectChanged', function(_, data, ...)
            self:ClearSearchProfile()
            self:UpdateModeDropdown(data.categoryId)
            self:UpdateBossFilter(data.activityId, data.customId)
            self:DoSearch()
        end)
    end

    local function RefreshFilter()
        self.ActivityList:SetFilterText(self.SearchInput:GetText():lower(), self.bossFilter, Profile:GetSpamWordStatus())
    end

    local ModeLabel = self:CreateFontString(nil, 'ARTWORK', 'GameFontHighlight') do
        ModeLabel:SetPoint('LEFT', ActivityLabel, 'LEFT', ActivityDropdown:GetWidth() + 10, 0)
        ModeLabel:SetText(L['活动形式'])
    end

    local ModeDropdown = GUI:GetClass('Dropdown'):New(self) do
        ModeDropdown:SetPoint('TOPLEFT', ModeLabel, 'BOTTOMLEFT', 0, -5)
        ModeDropdown:SetSize(120, 26)
        ModeDropdown:SetText(L['全部'])
        ModeDropdown:SetDefaultValue(0)
        ModeDropdown:SetDefaultText(L['全部'])
        ModeDropdown:SetCallback('OnSelectChanged', function()
            self:ClearSearchProfile()
            self:DoSearch()
        end)
    end

    local LootLabel = self:CreateFontString(nil, 'ARTWORK', 'GameFontHighlight') do
        LootLabel:SetPoint('LEFT', ModeLabel, 'LEFT', ModeDropdown:GetWidth() + 10, 0)
        LootLabel:SetText(L['拾取方式'])
    end

    local LootDropdown = GUI:GetClass('Dropdown'):New(self) do
        LootDropdown:SetPoint('TOPLEFT', LootLabel, 'BOTTOMLEFT', 0, -5)
        LootDropdown:SetSize(120, 26)
        LootDropdown:SetText(L['全部'])
        LootDropdown:SetDefaultValue(0)
        LootDropdown:SetDefaultText(L['全部'])
        LootDropdown:SetMenuTable(ACTIVITY_LOOT_MENUTABLE_WITHALL)
        LootDropdown:SetCallback('OnSelectChanged', function()
            self:ClearSearchProfile()
            self:DoSearch()
        end)
    end

    local SearchLabel = self:CreateFontString(nil, 'ARTWORK', 'GameFontHighlight') do
        SearchLabel:SetPoint('LEFT', LootLabel, 'LEFT', ModeDropdown:GetWidth() + 10, 0)
        SearchLabel:SetText(L['搜索'])
    end

    local SearchInput = GUI:GetClass('SearchBox'):New(self) do
        SearchInput:SetSize(180, 15)
        SearchInput:SetPoint('TOPLEFT', SearchLabel, 'BOTTOMLEFT', 10, -10)
        SearchInput:SetPrompt(L['搜索说明或团长'])
        SearchInput:EnableAutoComplete(true)
        SearchInput:EnableAutoCompleteFilter(false)
        SearchInput:SetCallback('OnTextChanged', RefreshFilter)
        SearchInput:SetCallback('OnEditFocusLost', function(SearchInput)
            local text = SearchInput:GetText()
            if text ~= '' then
                Profile:SaveSearchInputHistory(self.ActivityDropdown:GetItem().value, text)
            end
        end)
        SearchInput:SetCallback('OnEditFocusGained', function(SearchInput)
            SearchInput:SetAutoCompleteList(Profile:GetSearchInputHistory(ActivityDropdown:GetItem().value))
        end)
    end

    local AdvFilterPanel = CreateFrame('Frame', nil, self) do
        GUI:Embed(AdvFilterPanel, 'Refresh')
        AdvFilterPanel:SetSize(200, 340)
        AdvFilterPanel:SetPoint('TOPLEFT', MainPanel, 'TOPRIGHT', -5, -30)
        AdvFilterPanel:SetFrameLevel(ActivityList:GetFrameLevel()+5)
        AdvFilterPanel:EnableMouse(true)
        AdvFilterPanel:SetBackdrop{
            edgeFile = [[Interface\DialogFrame\UI-DialogBox-Border]],
            edgeSize = 16,
        }
        AdvFilterPanel:Hide()
        AdvFilterPanel:HookScript('OnShow', function()
            self.AdvButton:SetNormalTexture([[Interface\Buttons\UI-SpellbookIcon-PrevPage-Up]])
            self.AdvButton:SetPushedTexture([[Interface\Buttons\UI-SpellbookIcon-PrevPage-Down]])
            self.AdvButton:SetDisabledTexture([[Interface\Buttons\UI-SpellbookIcon-PrevPage-Disabled]])
        end)
        AdvFilterPanel:HookScript('OnHide', function()
            self.AdvButton:SetNormalTexture([[Interface\Buttons\UI-SpellbookIcon-NextPage-Up]])
            self.AdvButton:SetPushedTexture([[Interface\Buttons\UI-SpellbookIcon-NextPage-Down]])
            self.AdvButton:SetDisabledTexture([[Interface\Buttons\UI-SpellbookIcon-NextPage-Disabled]])
        end)

        local closeButton = CreateFrame('Button', nil, AdvFilterPanel, 'UIPanelCloseButton') do
            closeButton:SetPoint('TOPRIGHT', -3, -5)
        end

        local bg = AdvFilterPanel:CreateTexture(nil, 'BACKGROUND') do
            bg:SetPoint('TOPLEFT', 2, -2)
            bg:SetPoint('BOTTOMRIGHT', -2, 2)
            bg:SetTexture([[Interface\FrameGeneral\UI-Background-Rock]])
        end
    end

    local BossFilter = GUI:GetClass('ScrollFrame'):New(AdvFilterPanel) do
        local Border = CreateFrame('Frame', nil, AdvFilterPanel, 'InsetFrameTemplate') do
            Border:SetPoint('TOPLEFT', 10, -40)
            Border:SetPoint('TOPRIGHT', -10, -40)
            Border:SetHeight(200)
            BossFilter:SetParent(Border)
        end

        local Label = Border:CreateFontString(nil, 'ARTWORK', 'GameFontNormal') do
            Label:SetPoint('BOTTOMLEFT', Border, 'TOPLEFT', 0, 5)
            Label:SetText(L['首领过滤'])
        end

        local Help = GUI:GetClass('TitleButton'):New(Border) do
            Help:SetPoint('LEFT', Label, 'RIGHT', 10, 0)
            Help:SetTexture([[Interface\FriendsFrame\InformationIcon]])
            Help:SetTooltip(
                L['首领帮助'],
                GRAY_FONT_COLOR_CODE .. L['忽略'] .. '|r',
                GREEN_FONT_COLOR_CODE .. L['未击杀'] .. '|r',
                RED_FONT_COLOR_CODE .. L['已击杀'] .. '|r'
            )
        end

        local ScrollChild = CreateFrame('Frame', nil, BossFilter) do
            ScrollChild:SetSize(1, 1)
            ScrollChild:SetPoint('TOPLEFT')
            BossFilter:SetScrollChild(ScrollChild)
        end

        BossFilter.buttons = setmetatable({}, {__index = function(buttons, i)
            local button = BossCheckBox:New(ScrollChild)
            button:SetSize(22, 22)
            button:SetPoint('TOPLEFT', ScrollChild, 'TOPLEFT', 5, -(i-1)*22)
            button:SetCallback('OnCheckChanged', function(button)
                self:ClearSearchProfile()
                self.bossFilter[button:GetText()] = button:GetChecked()
                RefreshFilter()
            end)
            buttons[i] = button
            return button
        end})

        BossFilter:SetPoint('TOPLEFT', 5, -5)
        BossFilter:SetPoint('BOTTOMRIGHT', -5, 5)
    end

    local SearchProfileDropdown = GUI:GetClass('Dropdown'):New(AdvFilterPanel) do
        SearchProfileDropdown:SetPoint('TOPLEFT', BossFilter, 'BOTTOMLEFT', -5, -40)
        SearchProfileDropdown:SetPoint('TOPRIGHT', BossFilter, 'BOTTOMRIGHT', 5, -40)
        SearchProfileDropdown:SetHeight(26)
        SearchProfileDropdown:SetMaxItem(20)
        SearchProfileDropdown:SetCallback('OnSelectChanged', function(_, data)
            self.lockProfile = true
            self.DeleteButton:Enable()
            self.ActivityDropdown:SetValue(data.code)
            self.ModeDropdown:SetValue(data.mode)
            self.LootDropdown:SetValue(data.loot)
            self.lockProfile = nil
        end)

        local FilterProfileLabel = SearchProfileDropdown:CreateFontString(nil, 'ARTWORK', 'GameFontNormal') do
            FilterProfileLabel:SetPoint('BOTTOMLEFT', SearchProfileDropdown, 'TOPLEFT', 0, 5)
            FilterProfileLabel:SetText(L['过滤配置'])
        end
    end

    local SaveButton = CreateFrame('Button', nil, AdvFilterPanel, 'UIPanelButtonTemplate') do
        SaveButton:SetPoint('TOPLEFT', SearchProfileDropdown, 'BOTTOMLEFT', 0, -3)
        SaveButton:SetPoint('TOPRIGHT', SearchProfileDropdown, 'BOTTOM', 0, -3)
        SaveButton:SetHeight(22)
        SaveButton:SetText(SAVE)
        SaveButton:SetScript('OnClick', function()
            self:SaveSearchProfile()
        end)
    end

    local DeleteButton = CreateFrame('Button', nil, AdvFilterPanel, 'UIPanelButtonTemplate') do
        DeleteButton:SetPoint('TOPLEFT', SearchProfileDropdown, 'BOTTOM', 0, -3)
        DeleteButton:SetPoint('TOPRIGHT', SearchProfileDropdown, 'BOTTOMRIGHT', 0, -3)
        DeleteButton:SetHeight(22)
        DeleteButton:SetText(DELETE)
        DeleteButton:SetScript('OnClick', function()
            self:DeleteSearchProfile()
        end)
    end

    local RefreshButton = Addon:GetClass('RefreshButton'):New(self) do
        RefreshButton:SetPoint('TOPRIGHT', MainPanel, 'TOPRIGHT', -40, -38)
        RefreshButton:SetTooltip(LFG_LIST_SEARCH_AGAIN)
        RefreshButton:SetScript('OnClick', function()
            self:DoSearch()
        end)
        RefreshButton:HookScript('OnEnable', function(RefreshButton)
            RefreshButton:SetScript('OnUpdate', nil)
            RefreshButton:SetText(REFRESH)
        end)
        RefreshButton:HookScript('OnDisable', function(RefreshButton)
            RefreshButton:SetScript('OnUpdate', RefreshButton.OnUpdate)
        end)
        RefreshButton.OnUpdate = function(RefreshButton, elasped)
            RefreshButton:SetText(format(D_SECONDS, ceil(self:TimeLeft(self.disableRefreshTimer))))
        end
    end

    local AdvButton = CreateFrame('Button', nil, self) do
        GUI:Embed(AdvButton, 'Tooltip')
        AdvButton:SetTooltipAnchor('ANCHOR_RIGHT')
        AdvButton:SetTooltip(L['高级过滤'])
        AdvButton:SetNormalTexture([[Interface\Buttons\UI-SpellbookIcon-NextPage-Up]])
        AdvButton:SetPushedTexture([[Interface\Buttons\UI-SpellbookIcon-NextPage-Down]])
        AdvButton:SetDisabledTexture([[Interface\Buttons\UI-SpellbookIcon-NextPage-Disabled]])
        AdvButton:SetHighlightTexture([[Interface\Buttons\UI-Common-MouseHilight]], 'ADD')
        AdvButton:SetSize(32, 32)
        AdvButton:SetPoint('LEFT', RefreshButton, 'RIGHT', 0, 0)

        if Profile:NeedAdvShine() then
            local Shine = GUI:GetClass('ShineWidget'):New(AdvButton) do
                Shine:SetPoint('TOPLEFT', 5, -5)
                Shine:SetPoint('BOTTOMRIGHT', -5, 5)
                Shine:Start()
            end
            AdvButton.Shine = Shine
            AdvButton:SetScript('OnClick', function()
                Profile:ClearAdvShine()
                Shine:Stop()
                Shine:Hide()
                AdvButton:SetScript('OnClick', function()
                    self.AdvFilterPanel:SetShown(not self.AdvFilterPanel:IsShown())
                end)
                AdvButton:GetScript('OnClick')(AdvButton)
            end)
        else
            AdvButton:SetScript('OnClick', function()
                self.AdvFilterPanel:SetShown(not self.AdvFilterPanel:IsShown())
            end)
        end

    end

    local ActivityTotals = self:CreateFontString(nil, 'ARTWORK', 'GameFontHighlightRight') do
        ActivityTotals:SetPoint('BOTTOMRIGHT', MainPanel, -7, 7)
        ActivityTotals:SetFormattedText(L['活动总数：%d/%d'], 0, 0)
    end

    local IconSummary = CreateFrame('Button', nil, self) do
        IconSummary:SetSize(50, 20)
        IconSummary:SetPoint('BOTTOMLEFT', MainPanel, 10, 5)

        local icon = IconSummary:CreateTexture(nil, 'OVERLAY') do
            icon:SetSize(20, 20)
            icon:SetPoint('LEFT')
            icon:SetTexture([[Interface\AddOns\MeetingStone\Media\Icons]])
            icon:SetTexCoord(0, 32/256, 0, 1)
        end

        local label = IconSummary:CreateFontString(nil, 'OVERLAY') do
            label:SetPoint('LEFT', icon, 'RIGHT', 2, 0)
        end

        IconSummary:SetFontString(label)
        IconSummary:SetNormalFontObject('GameFontHighlightSmall')
        IconSummary:SetHighlightFontObject('GameFontNormalSmall')
        IconSummary:SetText(L['图示'])
        IconSummary:SetScript('OnEnter', function(button)
            GameTooltip:SetOwner(button, 'ANCHOR_RIGHT')
            GameTooltip:SetText(L['图示'])
            GameTooltip:AddLine(format([[|TInterface\AddOns\MeetingStone\Media\Icons:20:20:0:0:256:32:64:96:0:32|t %s]], L['我的活动']), 1, 1, 1)
            GameTooltip:AddLine(format([[|TInterface\AddOns\MeetingStone\Media\Icons:20:20:0:0:256:32:96:128:0:32|t %s]], L['已加入活动']), 1, 1, 1)
            GameTooltip:AddLine(format([[|TInterface\AddOns\MeetingStone\Media\Icons:20:20:0:0:256:32:128:160:0:32|t %s]], L['申请中活动']), 1, 1, 1)
            GameTooltip:AddLine(format([[|TInterface\AddOns\MeetingStone\Media\Icons:20:20:0:0:256:32:0:32:0:32|t %s]], L['好友或公会成员参与的活动']), 1, 1, 1)
            GameTooltip:Show()
        end)
        IconSummary:SetScript('OnLeave', GameTooltip_Hide)
    end

    local SpamWord = GUI:GetClass('CheckBox'):New(self) do
        SpamWord:SetPoint('BOTTOMRIGHT', MainPanel, -230, 5)
        SpamWord:SetText(L['关键字过滤'])
        SpamWord:SetScript('OnClick', function(SpamWord)
            Profile:SetSpamWordEnabled(SpamWord:GetChecked())
            RefreshFilter()
        end)
    end

    local HelpPlate = {
        FramePos = { x = -10,          y = 85 },
        FrameSize = { width = 1030, height = 425 },
        {
            ButtonPos = { x = 330,   y = -5 },
            HighLightBox = { x = 60, y = -5, width = 640, height = 55 },
            ToolTipDir = 'DOWN',
            ToolTipText = L.BrowseHelpFilter,
        },  -- 过滤器
        {
            ButtonPos = { x = 715, y = -5 },
            HighLightBox = { x = 705, y = -5, width = 120, height = 55 },
            ToolTipDir = 'DOWN',
            ToolTipText = L.BrowseHelpRefresh,
        },  -- 刷新
        {
            ButtonPos = { x = 370,  y = -190 },
            HighLightBox = { x = 5, y = -65, width = 820, height = 328 },
            ToolTipDir = 'RIGHT',
            ToolTipText = L.BrowseHelpList,
        },  -- 活动列表
        {
            ButtonPos = { x = 180,  y = -389 },
            HighLightBox = { x = 5, y = -397, width = 220, height = 28 },
            ToolTipDir = 'UP',
            ToolTipText = L.BrowseHelpMisc,
        },  -- 
        {
            ButtonPos = { x = 300,  y = -389 },
            HighLightBox = { x = 300, y = -397, width = 200, height = 28 },
            ToolTipDir = 'UP',
            ToolTipText = L.BrowseHelpApply,
        },  -- 申请
        {
            ButtonPos = { x = 720,  y = -389 },
            HighLightBox = { x = 705, y = -397, width = 120, height = 28 },
            ToolTipDir = 'UP',
            ToolTipText = L.BrowseHelpStatus,
        },  -- 状态
        {
            ButtonPos = { x = 570,  y = -389 },
            HighLightBox = { x = 570, y = -397, width = 130, height = 28 },
            ToolTipDir = 'UP',
            ToolTipText = L.BrowseHelpSpamWord,
        },  -- 关键字
        {
            ButtonPos = { x = 900, y = -45 },
            HighLightBox = { x = 830, y = -15, width = 200, height = 240 },
            ToolTipDir = 'DOWN',
            ToolTipText = L.BrowseHelpBossFilter,
        },
        {
            ButtonPos = { x = 900, y = -290 },
            HighLightBox = { x = 830, y = -260, width = 200, height = 90 },
            ToolTipDir = 'DOWN',
            ToolTipText = L.BrowseHelpSearchProfile,
        }
    }

    MainPanel:AddHelpButton(self, HelpPlate, function(shown)
        if shown then
            self.AdvFilterPanel:Show()
        end
    end)

    self.ActivityList = ActivityList
    self.ActivityDropdown = ActivityDropdown
    self.SignUpButton = SignUpButton
    self.SearchingBlocker = SearchingBlocker
    self.NoResultBlocker = NoResultBlocker
    self.SearchInput = SearchInput
    self.LootDropdown = LootDropdown
    self.ModeDropdown = ModeDropdown
    self.ActivityTotals = ActivityTotals
    self.RefreshButton = RefreshButton
    self.AdvFilterPanel = AdvFilterPanel
    self.BossFilter = BossFilter
    self.AdvButton = AdvButton
    self.SpamWord = SpamWord
    self.SearchProfileDropdown = SearchProfileDropdown
    self.DeleteButton = DeleteButton

    self.RefreshFilterHandler = RefreshFilter

    self:RegisterEvent('LFG_LIST_AVAILABILITY_UPDATE')
    self:RegisterEvent('LFG_LIST_SEARCH_RESULTS_RECEIVED')
    self:RegisterEvent('LFG_LIST_SEARCH_FAILED', 'LFG_LIST_SEARCH_RESULTS_RECEIVED')

    self:RegisterEvent('LFG_LIST_SEARCH_RESULT_UPDATED')
    self:RegisterEvent('LFG_LIST_APPLICATION_STATUS_UPDATED', 'LFG_LIST_SEARCH_RESULT_UPDATED')
    self:RegisterMessage('LFG_LIST_SEARCH_RESULT_REMOVED')
    self:RegisterMessage('MEETINGSTONE_SEARCH_PROFILE_UPDATE')
    
    self:RegisterMessage('MEETINGSTONE_SPAMWORD_STATUS_UPDATE', 'OnToggleSpamWord')
    self:RegisterMessage('MEETINGSTONE_SPAMWORD_UPDATE', RefreshFilter)

    self:SetScript('OnShow', self.OnShow)

    LFGListApplicationDialog.SignUpButton:SetScript('OnClick', function(self)
        local dialog = self:GetParent()
        PlaySound('igMainMenuOptionCheckBoxOn')
        local id = dialog.resultID
        local comment = format('%s%s', dialog.Description.EditBox:GetText(), dialog.playerData or '')
        local tank = dialog.TankButton:IsShown() and dialog.TankButton.CheckButton:GetChecked()
        local healer = dialog.HealerButton:IsShown() and dialog.HealerButton.CheckButton:GetChecked()
        local damager = dialog.DamagerButton:IsShown() and dialog.DamagerButton.CheckButton:GetChecked()

        C_LFGList.ApplyToGroup(id, comment, tank, healer, damager)
        if dialog.playerData then
            Logic:SEJ(dialog.activityData, dialog.Description.EditBox:GetText(), tank, healer, damager, dialog.isBlizzard)
        end
        StaticPopupSpecial_Hide(dialog)
    end)

    LFGListApplicationDialog:HookScript('OnHide', function(self)
        self.isBlizzard = nil
        self.playerData = nil
        self.activityData = nil
        self.Description.EditBox:SetMaxLetters(60)
    end)
end

function BrowsePanel:OnEnable()
    self:MEETINGSTONE_SEARCH_PROFILE_UPDATE()
end

function BrowsePanel:LFG_LIST_AVAILABILITY_UPDATE()
    self.ActivityDropdown:SetMenuTable(GetActivitesMenuTable())
    self.ActivityDropdown:SetValue(Profile:GetLastSearchValue())
    self:Refresh()
end

function BrowsePanel:LFG_LIST_SEARCH_RESULT_UPDATED(_, id)
    self:UpdateActivity(id)
    self.ActivityList:Refresh()
end

function BrowsePanel:LFG_LIST_SEARCH_RESULT_REMOVED(_, id)
    self:RemoveActivity(id)
    self.ActivityList:Refresh()
end

function BrowsePanel:MEETINGSTONE_SEARCH_PROFILE_UPDATE()
    self.SearchProfileDropdown:SetMenuTable(self:GetSearchProfileMenuTable())
    self.SearchProfileDropdown:SetValue(nil)
end

function BrowsePanel:RemoveActivity(id)
    tDeleteItem(self.activityList, self.activityHash[id])
    self.activityHash[id] = nil
end

function BrowsePanel:UpdateActivity(id)
    if not self.activityHash[id] then
        self:CacheActivity(id)
        self:SendMessage('MEETINGSTONE_ACTIVITIES_COUNT_UPDATED', #self.activityList)
    else
        self.activityHash[id]:Update(true)
    end
end

function BrowsePanel:CacheActivity(id)
    local _id, activityId, title, comment = C_LFGList.GetSearchResultInfo(id)
    if not _id then
        return
    elseif not activityId then
        return
    -- elseif title:match('单刷') or comment:match('单刷') or title == '勿扰' then
    --     return
    end

    local activityItem = self.ActivityDropdown:GetItem()
    local activity = Activity:New(id)
    if activityItem then
        if activityItem.activityId and not ACTIVITY_CUSTOM_DATA.A[activityItem.activityId] then
            if activityItem.activityId ~= activity:GetActivityID() or activityItem.customId ~= activity:GetCustomID() then
                return
            end
        end
        if activity:IsSoloActivity() and activityItem.customId ~= activity:GetCustomID() then
            return
        end
    end
    if activity:HasInvalidContent() then
        return
    end

    tinsert(self.activityList, activity)
    self.activityHash[id] = activity
end

function BrowsePanel:LFG_LIST_SEARCH_RESULTS_RECEIVED(event)
    self.lastReceived = time()
    self.SearchingBlocker:Hide()

    wipe(self.activityList)
    wipe(self.activityHash)

    local applications = C_LFGList.GetApplications()

    for _, id in ipairs(applications) do
        self:CacheActivity(id)
    end

    local _, resultList = C_LFGList.GetSearchResults()
    for _, id in ipairs(resultList) do
        self:CacheActivity(id)
    end

    local resultCount = #self.activityList

    self:SendMessage('MEETINGSTONE_ACTIVITIES_COUNT_UPDATED', resultCount)

    local isFailed = event == 'LFG_LIST_SEARCH_FAILED'
    self.NoResultBlocker:SetShown(resultCount == 0)
    self.NoResultBlocker.Label:SetText(isFailed and [[|TInterface\DialogFrame\UI-Dialog-Icon-AlertNew:30|t  ]] .. LFG_LIST_SEARCH_FAILED or LFG_LIST_NO_RESULTS_FOUND)
    self.NoResultBlocker.Button:SetShown(not isFailed)
    self.ActivityList:Refresh()
end

function BrowsePanel:CheckSignUpStatus(activity)
    local numApplications, numActiveApplications = C_LFGList.GetNumApplications()
    local messageApply = LFGListUtil_GetActiveQueueMessage(true)
    local availTank, availHealer, availDPS = C_LFGList.GetAvailableRoles()
    if messageApply then
        return false, messageApply
    elseif not LFGListUtil_IsAppEmpowered() then
        return false, LFG_LIST_APP_UNEMPOWERED
    elseif IsInGroup(LE_PARTY_CATEGORY_HOME) and C_LFGList.IsCurrentlyApplying() then
        return false, LFG_LIST_APP_CURRENTLY_APPLYING
    elseif numActiveApplications >= MAX_LFG_LIST_APPLICATIONS then
        return false, string.format(LFG_LIST_HIT_MAX_APPLICATIONS, MAX_LFG_LIST_APPLICATIONS)
    elseif GetNumGroupMembers(LE_PARTY_CATEGORY_HOME) > MAX_PARTY_MEMBERS + 1 then
        return false, LFG_LIST_MAX_MEMBERS
    elseif not (availTank or availHealer or availDPS) then
        return false, LFG_LIST_MUST_CHOOSE_SPEC
    elseif GroupHasOfflineMember(LE_PARTY_CATEGORY_HOME) then
        return false, LFG_LIST_OFFLINE_MEMBER
    elseif activity then
        return true, nil
    else
        return false, LFG_LIST_SELECT_A_SEARCH_RESULT
    end
end

function BrowsePanel:UpdateSignUpButton(activity)
    local usable, reason = self:CheckSignUpStatus(activity)

    self.SignUpButton:SetEnabled(usable)
    self.SignUpButton:SetTooltip(reason)
end

function BrowsePanel:SignUp(activity)
    if activity then
        local data, length = CodeDescriptionData(activity)
        LFGListApplicationDialog.playerData = data
        LFGListApplicationDialog.activityData = activity
        LFGListApplicationDialog.Description.EditBox:SetMaxLetters(60 - length)
        LFGListApplicationDialog_Show(LFGListApplicationDialog, activity:GetID())
    end
end

function BrowsePanel:DoSearch()
    self.SearchingBlocker:Show()
    self.NoResultBlocker:Hide()
    self.RefreshButton:Disable()
    self:Refresh()
    self:CancelTimer(self.disableRefreshTimer)
    self.disableRefreshTimer = self:ScheduleTimer('OnRefreshTimer', 3)
end

function BrowsePanel:Search()
    local activityItem = self.ActivityDropdown:GetItem()
    if not activityItem then
        return
    end
    
    local categoryId = activityItem.categoryId
    local fullName = activityItem.fullName
    local filters= activityItem.filters
    local baseFilter = activityItem.baseFilter
    local searchValue = activityItem.value
    
    if not categoryId or not self:IsVisible() then
        return
    end
    -- if not self.RefreshButton:IsEnabled() then
    --     return
    -- end

    local searchText = self:GetSearchCode(fullName, self.ModeDropdown:GetValue(), self.LootDropdown:GetValue(), activityItem.customId)

    Profile:SetLastSearchValue(searchValue)
    C_LFGList.Search(categoryId, searchText, filters, baseFilter)

    self.searchTimer = nil
end

function BrowsePanel:GetSearchCode(fullName, mode, loot, customId)
    if loot == 0 then
        loot = nil
    end
    if mode == 0 then
        mode = nil
    end
    loot = loot and rawget(ACTIVITY_LOOT_LONG_NAMES, loot)
    mode = mode and rawget(ACTIVITY_MODE_NAMES, mode)

    if mode then
        return format('%s-%s-%s',
            loot or '',
            mode,
            fullName or ''
        )
    elseif loot then
        return format('-%s-%s',
            loot,
            fullName or ''
        )
    elseif customId and customId ~= 0 and fullName then
        return '-' .. fullName
    end
    return fullName or ''
end

function BrowsePanel:OnRefreshTimer()
    self.RefreshButton:Enable()
end

function BrowsePanel:ToggleActivityMenu(anchor, activity)
    local usable, reason = self:CheckSignUpStatus(activity)

    GUI:ToggleMenu(anchor, {
        {
            text = activity:GetName(),
            isTitle = true,
            notCheckable = true,
        },
        {
            text = L['申请加入'],
            func = function() self:SignUp(activity) end,
            disabled = not usable or activity:IsDelisted() or activity:IsApplication(),
            tooltipTitle = not (activity:IsDelisted() or activity:IsApplication()) and L['申请加入'],
            tooltipText = reason,
            tooltipWhileDisabled = true,
            tooltipOnButton = true,
        },
        {
            text = WHISPER_LEADER,
            func = function() ChatFrame_SendTell(activity:GetLeader()) end,
            disabled = not activity:GetLeader() or not activity:IsApplication(),
            tooltipTitle = not activity:IsApplication() and WHISPER,
            tooltipText = not activity:IsApplication() and LFG_LIST_MUST_SIGN_UP_TO_WHISPER,
            tooltipOnButton = true,
            tooltipWhileDisabled = true,
        },
        {
            text = LFG_LIST_REPORT_GROUP_FOR,
            hasArrow = true,
            menuTable = {
                {
                    text = L['不当的说明'],
                    func = function() C_LFGList.ReportSearchResult(activity:GetID(), activity:IsMeetingStone() and 'lfglistcomment' or 'lfglistname') end,
                },
                {
                    text = LFG_LIST_BAD_DESCRIPTION,
                    func = function() C_LFGList.ReportSearchResult(activity:GetID(), 'lfglistcomment') end,
                    disabled = activity:IsMeetingStone() or not activity:GetComment(),
                },
                {
                    text = LFG_LIST_BAD_VOICE_CHAT_COMMENT,
                    func = function() C_LFGList.ReportSearchResult(activity:GetID(), 'lfglistvoicechat') end,
                    disabled = not activity:GetVoiceChat(),
                },
                {
                    text = LFG_LIST_BAD_LEADER_NAME,
                    func = function() C_LFGList.ReportSearchResult(activity:GetID(), 'badplayername') end,
                    disabled = not activity:GetLeader()
                },
            },
        },
        {
            text = L['加入关键字过滤'],
            func = function()
                SettingPanel:AddSpamWord(activity:GetSummary() or activity:GetComment())
            end,
        },
        {
            text = CANCEL,
        },
    }, 'cursor')
end

function BrowsePanel:GetCurrentActivity()
    return self.ActivityDropdown:GetItem()
end

function BrowsePanel:OnShow()
    if self.lastReceived and time() - self.lastReceived < 300 then
        return
    end
    self:DoSearch()
end

function BrowsePanel:Update()
    self:Search()
end

function BrowsePanel:UpdateBossFilter(activityId, customId, bossFilter)
    if bossFilter then
        self.bossFilter = CopyTable(bossFilter)
    else
        wipe(self.bossFilter)
    end

    local bossList = GetRaidProgressionData(activityId, customId)
    if bossList then
        for i, v in ipairs(bossList) do
            local button = self.BossFilter.buttons[i]
            button:Show()
            button:SetText(v.name)
            button:SetChecked(self.bossFilter[v.name])
        end
    end

    for i = (bossList and #bossList or 0) + 1, #self.BossFilter.buttons do
        self.BossFilter.buttons[i]:Hide()
    end
end

function BrowsePanel:UpdateModeDropdown(categoryId)
    self.ModeDropdown:SetMenuTable(ACTIVITY_MODE_MENUTABLES_WITHALL[categoryId])
    self.ModeDropdown:SetValue(nil)
    self.LootDropdown:SetValue(nil)
end

function BrowsePanel:OnToggleSpamWord(_, enable, onUser)
    if onUser or self.SpamWord:GetChecked() ~= enable then
        self.SpamWord:SetChecked(enable)
        self.RefreshFilterHandler()
    end
end

local function tooltipMore(tip, data)
    local function color(value)
        if value == true then
            return GREEN_FONT_COLOR
        elseif value == false then
            return RED_FONT_COLOR
        else
            return GRAY_FONT_COLOR
        end
    end

    tip:AddSepatator()
    tip:AddLine(format(L['活动类型：|cffffffff%s|r'], data.name))
    tip:AddLine(format(L['活动形式：|cffffffff%s|r'], GetModeName(data.mode)))
    tip:AddLine(format(L['拾取方式：|cffffffff%s|r'], GetLootName(data.loot)))
end

function BrowsePanel:GetSearchProfileMenuTable()
    local menuTable = {}
    for name, v in Profile:IterateSearchProfiles() do
        tinsert(menuTable, {
            value = name,
            text = name,
            name = v.name,
            code = v.code,
            mode = v.mode,
            loot = v.loot,
            activityId = v.activityId,
            customId = v.customId,
            tooltipOnButton = true,
            tooltipTitle = name,
            tooltipMore = tooltipMore,
            checked = function(data)
                return self.SearchProfileDropdown:GetItem() == data
            end,
            checkable = true,
        })
    end
    sort(menuTable, function(a, b)
        return a.text < b.text
    end)
    return menuTable
end

function BrowsePanel:SaveSearchProfile()
    local activityItem = self.ActivityDropdown:GetItem()
    local profile = {
        code = activityItem.value,
        name = activityItem.text,
        mode = self.ModeDropdown:GetValue() or 0,
        loot = self.LootDropdown:GetValue() or 0,
        activityId = activityItem.activityId,
        customId = activityItem.customId,
    }

    GUI:CallInputDialog(
        L['请输入搜索配置名称：'],
        function(result, name)
            if not result then
                return
            end
            if not Profile:GetSearchProfile(name) then
                Profile:AddSearchProfile(name, profile)
            else
                System:Errorf(L['搜索配置“%s”已存在。'], name)
            end
        end,
        self,
        format('%s %s %s', activityItem.text, GetLootName(profile.loot), GetModeName(profile.mode)),
        255,
        250
    )
end

function BrowsePanel:DeleteSearchProfile()
    local item = self.SearchProfileDropdown:GetItem()
    if not item then
        return
    end

    local name = item.text

    GUI:CallMessageDialog(format(L['你确定要删除搜索配置“%s”吗？'], name), function(result)
        if not result then
            return
        end
        Profile:DeleteSearchProfile(name)
        self.DeleteButton:Disable()
    end)
end

function BrowsePanel:ClearSearchProfile()
    if not self.lockProfile then
        self.SearchProfileDropdown:SetValue(nil)
        self.DeleteButton:Disable()
    end
end