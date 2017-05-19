
--------------
-- 配置面板 --
--------------

local LibEvent = LibStub:GetLibrary("LibEvent.7000")

local VERSION = 2.0

local addon, ns = ...

local L = ns.L or {}

setmetatable(L, { __index = function(_, k)
    return k:gsub("([a-z])([A-Z])", "%1 %2")
end})

local DefaultDB = {
    version = VERSION,                    --配置的版本號
    ShowItemBorder = true,                --物品直角邊框
    EnableItemLevel  = true,              --物品等級
      ShowColoredItemLevelString = false, --裝等文字隨物品品質
      ShowItemSlotString = true,          --物品部位文字
    ShowInspectAngularBorder = false,     --觀察面板直角邊框
    ShowInspectColoredLabel = true,       --觀察面板高亮橙裝武器標簽
    ShowOwnFrameWhenInspecting = false,   --觀察同時顯示自己裝備列表
    DisplayPercentageStats = false,       --裝備屬性換算成百分比數值
    EnablePartyItemLevel = true,          --小隊裝等
        SendPartyItemLevelToSelf = false, --發送小隊裝等到自己面板
        SendPartyItemLevelToParty = true, --發送小隊裝等到隊伍頻道
        ShowPartySpecialization = true,   --顯示隊友天賦
    EnableRaidItemLevel = false,          --團隊裝等
    EnableMouseItemLevel = false,         --鼠標裝等
}

local options = {
    { key = "ShowItemBorder" },
    { key = "EnableItemLevel",
      child = {
        { key = "ShowColoredItemLevelString" },
        { key = "ShowItemSlotString" },
      }
    },
    { key = "ShowInspectAngularBorder" },
    { key = "ShowInspectColoredLabel" },
    { key = "ShowOwnFrameWhenInspecting" },
    { key = "DisplayPercentageStats" },
    { key = "EnablePartyItemLevel",
      child = {
        { key = "ShowPartySpecialization" },
        { key = "SendPartyItemLevelToSelf" },
        { key = "SendPartyItemLevelToParty" },
      }
    },
    { key = "EnableRaidItemLevel",
        checkedFunc = function() TinyInspectRaidFrame:Show() end,
        uncheckedFunc = function() TinyInspectRaidFrame:Hide() end,
    },
    { key = "EnableMouseItemLevel" },
}

TinyInspectDB = DefaultDB

local function CallCustomFunc(self)
    local checked = self:GetChecked()
    if (checked and self.checkedFunc) then
        self.checkedFunc(self)
    end
    if (not checked and self.uncheckedFunc) then
        self.uncheckedFunc(self)
    end
end

local function StatusSubCheckbox(self, status)
    local checkbox
    for i = 1, self:GetNumChildren() do
        checkbox = select(i, self:GetChildren())
        checkbox:SetEnabled(status)
        StatusSubCheckbox(checkbox, status)
    end
end

local function OnClickCheckbox(self)
    local status = self:GetChecked()
    TinyInspectDB[self.key] = status
    StatusSubCheckbox(self, status)
    CallCustomFunc(self)
end

local function CreateCheckbox(list, parent, anchor, offsetx, offsety)
    local checkbox, subbox
    local stepx, stepy = 20, 32
    if (not list) then return offsety end
    for i, v in ipairs(list) do
        checkbox = CreateFrame("CheckButton", nil, parent, "InterfaceOptionsCheckButtonTemplate")
        checkbox.key = v.key
        checkbox.checkedFunc = v.checkedFunc
        checkbox.uncheckedFunc = v.uncheckedFunc
        checkbox.Text:SetText(L[v.key])
        checkbox:SetScript("OnClick", OnClickCheckbox)
        checkbox:SetPoint("TOPLEFT", anchor, "BOTTOMLEFT", offsetx, -6-offsety)
        offsety = offsety + stepy
        offsety = CreateCheckbox(v.child, checkbox, anchor, offsetx+stepx, offsety)
    end
    return offsety
end

local function InitCheckbox(parent)
    local checkbox
    for i = 1, parent:GetNumChildren() do
        checkbox = select(i, parent:GetChildren())
        if (checkbox.key) then
            checkbox:SetChecked(TinyInspectDB[checkbox.key])
            StatusSubCheckbox(checkbox, checkbox:GetChecked())
            CallCustomFunc(checkbox)
            InitCheckbox(checkbox)
        end
    end
end

local frame = CreateFrame("Frame", nil, UIParent)
frame.title = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
frame.title:SetPoint("TOPLEFT", 18, -16)
frame.title:SetText(addon)
frame.name = addon

CreateCheckbox(options, frame, frame.title, 18, 10)

LibEvent:attachEvent("VARIABLES_LOADED", function()
    if (not TinyInspectDB or not TinyInspectDB.version) then
        TinyInspectDB = DefaultDB
    elseif (TinyInspectDB.version < DefaultDB.version) then
        for k, v in pairs(DefaultDB) do
            if (not TinyInspectDB[k]) then
                TinyInspectDB[k] = v
            end
        end
    end
    InitCheckbox(frame)
end)

InterfaceOptions_AddCategory(frame)
SLASH_TinyInspect1 = "/tinyinspect"
SLASH_TinyInspect2 = "/ti"
function SlashCmdList.TinyInspect(msg, editbox)
    if (msg == "raid") then
        return ToggleFrame(TinyInspectRaidFrame)
    end
    InterfaceOptionsFrame_OpenToCategory(frame)
    InterfaceOptionsFrame_OpenToCategory(frame)
end
