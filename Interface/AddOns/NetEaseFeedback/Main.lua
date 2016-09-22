
BuildEnv(...)

local Addon = LibStub('AceAddon-3.0'):NewAddon('NetEaseFeedback', 'AceEvent-3.0', 'NetEaseSocket-2.0')
local GUI = LibStub('NetEaseGUI-2.0')

local ADDON_VERSION = GetAddOnMetadata('NetEaseFeedback', 'Version'):gsub('(%d)%d(%d)%d%d%.(%d%d)','%1%2%3')

HelpFrameNavTbl[99] = {
    text = '延迟反馈', 
    icon = 'Interface\\HelpFrame\\HelpIcon-ReportLag',
    frame = 'netease',
}

function Addon:OnInitialize()
    HelpFrameButton2:SetPoint('TOP', HelpFrameButton1, 'BOTTOM', 0, -1)
    HelpFrameButton5:SetPoint('TOP', HelpFrameButton2, 'BOTTOM', 0, -1)
    HelpFrameButton4:SetPoint('TOP', HelpFrameButton3, 'BOTTOM', 0, -1)
    HelpFrameButton16:SetPoint('TOP', HelpFrameButton4, 'BOTTOM', 0, -1)
    HelpFrameButton99:SetPoint('TOP', HelpFrameButton16, 'BOTTOM', 0, -1)
    HelpFrameButton6:SetPoint('BOTTOM', HelpFrameLeftInset, 'BOTTOM', 2, 16)

    local Frame = CreateFrame('Frame', nil, HelpFrame) do
        Frame:SetPoint('TOPLEFT', HelpFrameMainInset)
        Frame:SetPoint('BOTTOMRIGHT', HelpFrameMainInset)
        Frame:Hide()

        tinsert(HelpFrameWindows, Frame)
        HelpFrame.netease = Frame
    end

    local Title = Frame:CreateFontString(nil, 'ARTWORK', 'GameFontNormalLarge') do
        Title:SetPoint('TOPLEFT', 15, -15)
        Title:SetJustifyH('LEFT')
        Title:SetText('提交延迟反馈')
    end

    local Summary = Frame:CreateFontString(nil, 'ARTWORK', 'GameFontHighlight') do
        Summary:SetWidth(710)
        Summary:SetJustifyH('LEFT')
        Summary:SetPoint('TOPLEFT', Title, 'BOTTOMLEFT', 0, -20)
        Summary:SetText('当您觉得游戏体验已被延迟影响，|cffffd200请立刻提交以下信息来告诉我们！|r')
    end

    local function CheckInput()
        self:CheckInput()
    end

    local function CreateObject(text, parent, class, width, height)
        local Dropdown = GUI:GetClass(class or 'Dropdown'):New(parent) do
            Dropdown:SetSize(width or 250, height or 26)
        end

        local Label = Dropdown:CreateFontString(nil, 'ARTWORK', 'GameFontNormal') do
            Label:SetPoint('BOTTOMLEFT', Dropdown, 'TOPLEFT', 0, 5)
            Label:SetText(text)
        end
        return Dropdown
    end

    local InfoParent = CreateFrame('Frame', nil, Frame) do
        InfoParent:Hide()
        InfoParent:SetSize(1, 1)
        InfoParent:SetPoint('TOPLEFT', 80, -130)

        local Text = Frame:CreateFontString(nil, 'OVERLAY', 'QuestFont_Super_Huge') do
            Text:SetPoint('CENTER', 0, -50)
            Text:SetText('请在下拉框中|n选择您遇到的问题')
        end

        InfoParent:SetScript('OnShow', function()
            Text:Hide()
        end)
        InfoParent:SetScript('OnHide', function()
            Text:Show()
        end)
    end

    local Question = CreateObject('您遇到的问题是', Frame) do
        Question:SetPoint('TOPLEFT', InfoParent, 'TOPLEFT')
        Question:SetMenuTable(QUESTION_MENUTABLE)
        Question:SetDefaultText('请选择您遇到的问题')
        Question:SetMaxItem(20)
        Question:SetCallback('OnSelectChanged', function(Question, item)
            for k, v in pairs(self.objects) do
                v:SetShown(item.objects[k])
            end
            InfoParent:Show()
            CheckInput()
        end)
        Question:SetScript('OnShow', function(Question)
            Question:SetValue(nil)
            InfoParent:Hide()
        end)
    end

    local Realm = CreateObject('出现问题的服务器', InfoParent, 'InputBox') do
        Realm:SetPoint('TOPLEFT', Question, 'BOTTOMLEFT', 0, -40)
        Realm:EnableAutoComplete(true)
        Realm:SetAutoCompleteList(REALM_LIST)
        Realm:SetMaxLetters(8)
        Realm:SetScript('OnShow', function(Realm)
            Realm:SetText(GetRealmName())
        end)
        Realm:SetCallback('OnTextChanged', CheckInput)
    end

    local Instance = CreateObject('无法进入的副本', InfoParent) do
        Instance:SetPoint('TOPLEFT', Realm, 'TOPLEFT')
        Instance:SetDefaultText('请选择无法进入的副本')
        Instance:SetCallback('OnSelectChanged', CheckInput)
        Instance:SetMenuTable(INSTANCE_MENUTABLE)
        Instance:SetMaxItem(20)
        Instance:SetScript('OnShow', function(Instance)
            Instance:SetValue(nil)
        end)
    end

    local Character = CreateObject('角色名-服务器', InfoParent, 'InputBox', 120) do
        Character:SetPoint('TOPLEFT', Realm, 'TOPLEFT')
        Character:SetCallback('OnTextChanged', CheckInput)
        Character:SetPrompt('角色名')
        Character:SetMaxLetters(12)
        Character:SetScript('OnShow', function(self)
            self:SetText(UnitName('player'))
        end)

        local Label = Character:CreateFontString(nil, 'OVERLAY', 'GameFontHighlight') do
            Label:SetPoint('LEFT', Character, 'RIGHT')
            Label:SetText('-')
        end
    end

    local CharacterRealm = CreateObject('', Character, 'InputBox', 120) do
        CharacterRealm:SetPoint('LEFT', Character, 'RIGHT', 10, 0)
        CharacterRealm:SetCallback('OnTextChanged', CheckInput)
        CharacterRealm:SetPrompt('服务器')
        CharacterRealm:EnableAutoComplete(true)
        CharacterRealm:SetAutoCompleteList(REALM_LIST)
        CharacterRealm:SetMaxLetters(8)
        CharacterRealm:SetScript('OnShow', function(self)
            self:SetText(GetRealmName())
        end)
    end

    local Area = CreateObject('上网地区', InfoParent) do
        Area:SetPoint('LEFT', Realm, 'RIGHT', 80, 0)
        Area:SetMenuTable(AREA_MENUTABLE)
        Area:SetDefaultText('请选择上网地区')
        Area:SetMaxItem(20)
        Area:SetCallback('OnSelectChanged', CheckInput)
        Area:SetScript('OnShow', function(Area)
            Area:SetValue(nil)
        end)
    end

    local Date = CreateObject('出现问题的时间', InfoParent, 'DatePicker', 150, 26) do
        Date:SetPoint('TOPLEFT', Realm, 'BOTTOMLEFT', 0, -40)
        Date:EnableFuture(false)
        Date:SetCallback('OnDateChanged', CheckInput)
        Date:SetScript('OnShow', function(Date)
            Date:Constructor()
        end)
    end

    local Time = GUI:GetClass('InputBox'):New(Date) do
        Time:SetPoint('LEFT', Date, 'RIGHT', 5, 2)
        Time:SetSize(95, 15)
        Time:SetMaxBytes(6)
        Time:SetScript('OnTextChanged', CheckInput)
        Time:SetScript('OnShow', function(Time)
            Time:SetText(date('%H:%M'))
        end)
    end

    local ISP = CreateObject('网络供应商', InfoParent) do
        ISP:SetPoint('TOPLEFT', Area, 'BOTTOMLEFT', 0, -40)
        ISP:SetMenuTable(ISP_MENUTABLE)
        ISP:SetDefaultText('请选择您的网络供应商')
        ISP:SetMaxItem(20)
        ISP:SetCallback('OnSelectChanged', CheckInput)
        ISP:SetScript('OnShow', function(ISP)
            ISP:SetValue(nil)
        end)
    end

    local Content = CreateObject('问题描述', InfoParent, 'EditBox', 400, 80) do
        Content:SetPoint('TOPLEFT', Date, 'BOTTOMLEFT', 0, -40)
        Content:SetPoint('TOPRIGHT', ISP, 'BOTTOMRIGHT', 0, -40)
        Content:SetMaxBytes(256)
        Content:SetPrompt('告诉我们您遇到的问题')
        Content:SetScript('OnShow', function(Content)
            Content:SetText('')
        end)
    end

    local SubmitButton = CreateFrame('Button', nil, InfoParent, 'UIPanelButtonTemplate') do
        SubmitButton:SetPoint('BOTTOM', Frame, 'BOTTOM', 0, 15)
        SubmitButton:SetText('提交')
        SubmitButton:SetSize(160, 30)
        SubmitButton:SetScript('OnClick', function()
            self:Submit()
        end)
    end

    local Error = InfoParent:CreateFontString(nil, 'OVERLAY', 'GameFontRed') do
        Error:SetPoint('BOTTOM', Frame, 'BOTTOM', 0, 15)
    end

    local InputBoxGroup = GUI:GetClass('InputBoxGroup'):New() do
        InputBoxGroup:RegisterInputBox(Realm)
        InputBoxGroup:RegisterInputBox(Character)
        InputBoxGroup:RegisterInputBox(CharacterRealm)
        InputBoxGroup:RegisterInputBox(Time)
        InputBoxGroup:RegisterInputBox(Content:GetEditBox())
    end

    self.submits = {}

    self.Realm = Realm
    self.Instance = Instance
    self.Character = Character
    self.CharacterRealm = CharacterRealm
    self.Area = Area
    self.Date = Date
    self.ISP = ISP
    self.Time = Time
    self.Error = Error
    self.SubmitButton = SubmitButton
    self.Question = Question
    self.Content = Content

    self.objects = {
        Realm = self.Realm,
        Instance = self.Instance,
        Character = self.Character,
        Area = self.Area,
        Date = self.Date,
        ISP = self.ISP,
    }

    self:ListenSocket('NERB', 'S1' .. UnitFactionGroup('player'))
    self:ConnectServer()
end

function Addon:CheckInput()
    local err = self:CheckError()

    self.Error:SetText(err or '')
    self.SubmitButton:SetShown(not err)
end

function Addon:CheckError()
    if self.Realm:IsVisible() then
        local text = self.Realm:GetText():trim()
        if text == '' then
            return '请填写出现问题的服务器'
        elseif not tContains(REALM_LIST, text) then
            return '服务器填写错误'
        end
    end
    if self.Character:IsVisible() then
        if self.Character:GetText():trim() == '' then
            return '请填写出现问题的角色'
        end
        local text = self.CharacterRealm:GetText():trim()
        if text == '' then
            return '请填写角色所在的服务器'
        elseif not tContains(REALM_LIST, text) then
            return '角色服务器填写错误'
        end
    end
    if self.Instance:IsVisible() then
        if not self.Instance:GetValue() then
            return '请选择无法进入的副本'
        end
    end
    if not self.Area:GetValue() then
        return '请选择上网地区'
    end
    if not self.Date:GetValue() then
        return '请选择出现问题的日期'
    end
    if self.Time:GetText():trim() == '' then
        return '请输入出现问题的时间'
    end
    local hour, minute = self.Time:GetText():trim():match('^(%d%d?):(%d%d)$')
    hour, minute = tonumber(hour), tonumber(minute)
    if not hour or not minute then
        return '出现问题的时间格式不正确'
    end
    if hour > 23 or minute > 59 then
        return '出现问题的时间格式不正确'
    end
    if not self.ISP:GetValue() then
        return '请选择您的网络供应商'
    end
end

function Addon:Submit()
    if self:CheckError() then
        return
    end

    local now = time()
    local question = self.Question:GetValue()

    if self.submits[question] and now - self.submits[question] < 600 then
        self:Print('您已经提交过该问题，请不要重复提交。', 1, 0, 0)
    else
        self.submits[question] = now

        local realm = self.Realm:IsVisible() and self.Realm:GetText():trim() or self.CharacterRealm:IsVisible() and self.CharacterRealm:GetText() or GetRealmName()
        local instance = self.Instance:IsVisible() and self.Instance:GetValue() or nil
        local character = self.Character:IsVisible() and self.Character:GetText():trim() .. '-' .. self.CharacterRealm:GetText():trim() or nil
        local area = self.Area:GetValue()
        local isp = self.ISP:GetValue()
        local content = self.Content:GetText()
        local stamp do
            local t = {}
            local hour, minute = self.Time:GetText():match('^(%d+):(%d+)$')
            t.year, t.month, t.day = self.Date:GetValue()
            t.hour, t.min = tonumber(hour), tonumber(minute)
            stamp = time(t)
        end
        local latencyHome, latencyWorld = select(3, GetNetStats())

        self:SendServer('SNEFD', ADDON_VERSION, select(2, BNGetInfo()), UnitGUID('player'), question, area, stamp, isp, content, realm, instance, character, latencyHome, latencyWorld)
        self:Print('感谢提交反馈。')
    end
end

function Addon:Print(text, r, g, b)
    local color = ChatTypeInfo.SYSTEM
    UIErrorsFrame:AddMessage(text, r or color.r, g or color.g, b or color.b)
end
