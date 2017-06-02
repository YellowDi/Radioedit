
--------------------------------
-- Configuration Panel
--------------------------------

local LibEvent = LibStub:GetLibrary("LibEvent.7000")

local addon, ns = ...

local L = ns.L or {}

setmetatable(L, { __index = function(_, k)
    return k:gsub("([a-z])([A-Z])", "%1 %2")
end})

local DefaultDB = {
    version = 1.3,
    Scale = 1,
    Alpha = 0.9,
    BorderSize = 1,
    HPHeight = 12,
    StaticPosition = false,
    UseMouseAnchor = true,
    AnchorCursorRight = true,
    OnlyMouseoverUnit = true,
    OriginalInCombat = true,
    AppendLevelToName = false,
    DisplayStyleMask = false,
    ShowAngularBorder = true,
    ShowColoredClassBorder = false,
    ShowStatusBar   = true,
    StatusBarText = true,
    DynamicStatusBarColor = false,
    ShowTarget      = true,
    ShowColoredItemBorder = false,
    name = {
        PVPIcon     = true,
        FactionIcon = true,
        ClassIcon   = true,
        Title       = "|cffCCFFFF%s|r",
        Realm       = "|cff00EEEE%s|r",
        Race        = "|cffcccccc%s|r",
        Class       = "|cffffffff%s|r",
        AFK         = "|cffFFD200(%s)|r",
        DND         = "|cffFFD200(%s)|r",
        OFFLINE     = "|cff999999(%s)|r",
    },
    guild = {
        Guild       = "|cffFF00FF<%.36s>|r",
        Rank        = "|cffCC88FF(%s:%s)|r",
        Realm       = "|cff00CCCC%s|r",
    },
    npc = {
        Title       = "|cff99E8E8<%s>|r",
        Boss        = "|cffff0000(%s)|r",
        Elite       = "|cffffff33(%s)|r",
        Rare        = "|cffffaaff(%s)|r",
        Reaction    = "|cff33ffff<%s>|r",
        Friendly    = "|cff99ff66%1|r",
    },
}

local options = {
    { key = "UseMouseAnchor",       type = "checkbox" },
    { key = "AnchorCursorRight",    type = "checkbox" },
    { key = "OnlyMouseoverUnit",    type = "checkbox" },
    { key = "OriginalInCombat",     type = "checkbox" },
    { key = "DisplayStyleMask",     type = "checkbox" },
    { key = "ShowAngularBorder",    type = "checkbox" },
    { key = "ShowColoredClassBorder", type = "checkbox" },
    { key = "ShowColoredItemBorder",  type = "checkbox" },
    { key = "ShowStatusBar",        type = "checkbox" },
    { key = "StatusBarText",        type = "checkbox" },
    { key = "DynamicStatusBarColor", type = "checkbox" },
    { key = "ShowTarget",            type = "checkbox" },
    { key = "name.PVPIcon",         type = "checkbox" },
    { key = "name.FactionIcon",     type = "checkbox" },
    { key = "name.ClassIcon",       type = "checkbox" },
    { key = "AppendLevelToName",    type = "checkbox" },
    { key = "name.Title",           type = "colormixin" },
    { key = "name.Realm",           type = "colormixin" },
    { key = "name.Race",            type = "colormixin" },
    { key = "name.Class",           type = "colormixin" },
    { key = "name.AFK",             type = "colormixin" },
    { key = "name.DND",             type = "colormixin" },
    { key = "name.OFFLINE",         type = "colormixin" },
    { key = "guild.Guild",          type = "colormixin" },
    { key = "guild.Rank",           type = "colormixin" },
    { key = "guild.Realm",          type = "colormixin" },
    { key = "npc.Title",            type = "colormixin" },
    { key = "npc.Boss",             type = "colormixin" },
    { key = "npc.Elite",            type = "colormixin" },
    { key = "npc.Rare",             type = "colormixin" },
    { key = "npc.Reaction",         type = "colormixin" },
    { key = "npc.Friendly",         type = "colormixin" },
    { key = "StaticPosition",       type = "position" },
    { key = "Scale",                type = "slider", trigger = "TOOLTIP_SCALE", min = 1, max = 2, step = ".1" },
    { key = "Alpha",                type = "slider", trigger = "TOOLTIP_ALPHA", min = 0, max = 1, step = ".1" },
    { key = "BorderSize",           type = "slider", trigger = "TOOLTIP_BORDER_SIZE", min = 1, max = 8 },
    { key = "HPHeight",             type = "slider", trigger = "TOOLTIP_HP_HEIGHT", min = 1, max = 16 },
}

local function HEX2RGB(color)
	local r = tonumber(strsub(color,1,2),16) or 255
	local g = tonumber(strsub(color,3,4),16) or 255
	local b = tonumber(strsub(color,5,6),16) or 255
	return r/255, g/255, b/255
end

local function RGB2HEX(color, g, b)
    if (g and b) then
        return ("%02x%02x%02x"):format(color*255, g*255, b*255)
    elseif color.r then
        return ("%02x%02x%02x"):format(color.r*255, color.g*255, color.b*255)
    else
        local r, g, b = unpack(color)
        return ("%02x%02x%02x"):format(r*255, g*255, b*255)
    end
end

local function CheckboxOnClick(self)
    local key, subkey = strsplit(".", self.key)
    if (subkey) then
        TinyTooltipDB[key][subkey] = self:GetChecked()
    else
        TinyTooltipDB[key] = self:GetChecked()
    end
end

local currentColorFrame

ColorPickerFrame:HookScript("OnHide", function() currentColorFrame = false end)

local function GetColorAndWildcard(value)
    local hex, wildcard = string.match(value, "|cff(%x%x%x%x%x%x)(.*)|r")
    local r, g, b = HEX2RGB(hex)
    return r, g, b, wildcard
end

local function ColorMinixDefaultValue(self)
    local key1, key2 = strsplit(".", self.key)
    if (key2) then
        return DefaultDB[key1][key2] or "|cffffffff%s|r"
    else
        return DefaultDB[key1] or "|cffffffff%s|r"
    end
end

local function ColorminixCheckboxOnClick(self)
    local parent = self:GetParent()
    local status = self:GetChecked()
    local key1, key2 = strsplit(".", parent.key)
    if (not status) then
        if (key2) then
            TinyTooltipDB[key1][key2] = false
        else
            TinyTooltipDB[key1] = false
        end
    else
        local value = ColorMinixDefaultValue(parent)
        if (key2) then
            TinyTooltipDB[key1][key2] = value
        else
            TinyTooltipDB[key1] = value
        end
        local r, g, b, wildcard = GetColorAndWildcard(value)
        parent.colorbox:GetNormalTexture():SetVertexColor(r, g, b)
        parent.inputbox:SetText(wildcard)
        LibEvent:trigger("TINYTOOLTIP_EXAMPLE")
    end
end

local function ColorPickerOnClick()
    if (not currentColorFrame) then return end
    local key1, key2 = strsplit(".", currentColorFrame.key)
    local wildcard = currentColorFrame.inputbox:GetText()
    local r, g, b = ColorPickerFrame:GetColorRGB()
    local value = "|cff" .. RGB2HEX(r,g,b) .. wildcard .. "|r"
    if (key2) then
        TinyTooltipDB[key1][key2] = value
    else
        TinyTooltipDB[key1] = value
    end
    currentColorFrame.colorbox:GetNormalTexture():SetVertexColor(r, g, b)
    LibEvent:trigger("TINYTOOLTIP_EXAMPLE")
end

local function ColormixinInputOnEnter(self)
    self:ClearFocus()
    local parent = self:GetParent()
    local key1, key2 = strsplit(".", parent.key)
    local wildcard = self:GetText()
    local r, g, b = parent.colorbox:GetNormalTexture():GetVertexColor()
    local value = "|cff" .. RGB2HEX(r,g,b) .. wildcard .. "|r"
    if (key2) then
        TinyTooltipDB[key1][key2] = value
    else
        TinyTooltipDB[key1] = value
    end
    LibEvent:trigger("TINYTOOLTIP_EXAMPLE")
end

local function ColormixinOpenColorPicker(self)
    local parent = self:GetParent()
    local key1, key2 = strsplit(".", parent.key)
    local default
    if (key2) then
        default = TinyTooltipDB[key1][key2] or DefaultDB[key1][key2]
    else
        default = TinyTooltipDB[key1] or DefaultDB[key1]
    end
    local r, g, b, wildcard = GetColorAndWildcard(default)
    local info = {
        r = r,
        g = g,
        b = b,
        hasOpacity = false,
        swatchFunc = ColorPickerOnClick,
    }
    currentColorFrame = parent
    OpenColorPicker(info)
end

local function SliderOnValueChanged(self, value)
    if (self.step) then
        value = format("%".. self.step .."f", value)
    else
        value = floor(value)
    end
    if (self.lastValue ~= value) then
        self.lastValue = value
        TinyTooltipDB[self.key] = value
        _G[self:GetName().."High"]:SetText(value)
        LibEvent:trigger(self.trigger, value)
    end
end

local function InitCheckboxValue(self, key)
    local key1, key2 = strsplit(".", key)
    local value
    if (key2) then
        value = TinyTooltipDB[key1][key2]
    else
        value = TinyTooltipDB[key1]
    end
    self:SetChecked(value and true or false)
end

local function InitColorminix(self, key)
    local key1, key2 = strsplit(".", key)
    local value, default
    if (key2) then
        value = TinyTooltipDB[key1][key2]
        default = value or DefaultDB[key1][key2]
    else
        value = TinyTooltipDB[key1]
        default = value or DefaultDB[key1]
    end
    local r, g, b, wildcard = GetColorAndWildcard(default)
    self.checkbox:SetChecked(value and true or false)
    self.colorbox:GetNormalTexture():SetVertexColor(r, g, b)
    self.inputbox:SetText(wildcard)
    self.inputbox:SetCursorPosition(0)
end

local frame = CreateFrame("Frame", nil, UIParent)
frame.anchor = CreateFrame("Frame", nil, frame)
frame.anchor:SetPoint("TOPLEFT", 28, -48)
frame.anchor:SetSize(InterfaceOptionsFramePanelContainer:GetWidth()-60, 1)
frame.title = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
frame.title:SetPoint("TOPLEFT", 18, -16)
frame.title:SetText(addon)
frame.name = addon

LibEvent:attachTrigger("TINYTOOLTIP_INIT", function()
    local line
    local anchor = frame.anchor
    for i, v in ipairs(options) do
        if (v.type == "checkbox") then
            line = CreateFrame("CheckButton", nil, frame, "InterfaceOptionsCheckButtonTemplate")
            line:SetScript("OnClick", CheckboxOnClick)
            line.key = v.key
            line.Text:SetText(L[v.key])
            line:SetPoint("TOPLEFT", anchor, "BOTTOMLEFT", 0, -1)
            anchor = line
            InitCheckboxValue(line, v.key)
        end
    end
    for i, v in ipairs(options) do
        if (v.type == "position") then
            line = CreateFrame("CheckButton", nil, frame, "InterfaceOptionsCheckButtonTemplate")
            line.key = v.key
            line.Text:SetText(L[v.key])
            line:SetPoint("TOPLEFT", anchor, "BOTTOMLEFT", 0, -1)
            anchor = line
            InitCheckboxValue(line, v.key)
            line:SetScript("OnClick", function(self)
                local status = self:GetChecked()
                if (not status) then
                    TinyTooltipDB[self.key] = status
                else
                    TinyTooltipDB[self.key] = format("%s,%s", -CONTAINER_OFFSET_X - 13, CONTAINER_OFFSET_Y)
                    if (not self.util) then
                        self.util = CreateFrame("Frame", nil, self, "ThinBorderTemplate")
                        self.util.point = CreateFrame("Button", nil, self.util)
                        self.util.point:SetSize(16, 16)
                        self.util.point:SetPoint("BOTTOMRIGHT", 1, -1)
                        self.util.point:SetNormalTexture("Interface\\Cursor\\Item")
                        self.util.point:GetNormalTexture():SetTexCoord(12/32, 0, 12/32, 0)
                        self.util:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -CONTAINER_OFFSET_X - 13, CONTAINER_OFFSET_Y)
                        self.util:SetClampedToScreen(true)
                        self.util:EnableMouse(true)
                        self.util:SetMovable(true)
                        self.util:SetSize(113,80)
                        self.util:RegisterForDrag("LeftButton")
                        self.util:SetScript("OnDragStart", function(self) self:StartMoving() end)
                        self.util:SetScript("OnDragStop", function(self)
                            self:StopMovingOrSizing()
                            local parent = self:GetParent()
                            local right, bottom = self:GetRight(), self:GetBottom()
                            TinyTooltipDB[parent.key] = format("%s,%s", floor(right - GetScreenWidth())+4, floor(bottom)-3)
                        end)
                    end
                    self.util:Show()
                end
            end)
        end
    end
    local j = 0
    for i, v in ipairs(options) do
        if (v.type == "slider") then
            line = CreateFrame("Slider", "TinyTooltipSlider"..i, frame, "OptionsSliderTemplate")
            line:SetWidth(64)
            if (j == 0) then
                line:SetPoint("TOPLEFT", anchor, "BOTTOMLEFT", 32, -8)
            else
                line:SetPoint("LEFT", anchor, "RIGHT", 84, 0)
            end
            line.key = v.key
            line.step = v.step
            line.trigger = v.trigger
            _G[line:GetName().."Text"]:SetText(L[v.key])
            _G[line:GetName().."Text"]:SetTextColor(1, 0.82, 0)
            _G[line:GetName().."Text"]:ClearAllPoints()
            _G[line:GetName().."Text"]:SetPoint("RIGHT", line, "LEFT", -4, 0)
            _G[line:GetName().."Low"]:SetText("")
			_G[line:GetName().."High"]:SetText(TinyTooltipDB[v.key] or 1)
            _G[line:GetName().."High"]:ClearAllPoints()
            _G[line:GetName().."High"]:SetPoint("LEFT", line, "RIGHT", 2, 0)
			line:SetMinMaxValues(v.min, v.max)
			line:SetValueStep(0.1)
            line:SetValue(TinyTooltipDB[v.key] or 1)
            LibEvent:trigger(v.trigger, TinyTooltipDB[v.key] or 1)
            anchor = line
            j = j + 1
            line:SetScript("OnValueChanged", SliderOnValueChanged)
        end
    end
    anchor = frame.anchor
    for i, v in ipairs(options) do
        if (v.type == "colormixin") then
            line = CreateFrame("Frame", "TinyTooltipColormixin"..i, frame, "ChatConfigCheckBoxWithSwatchTemplate")
            line:SetWidth(300)
            line.key = v.key
            line.checkbox = _G[line:GetName().."Check"]
            line.colorbox = _G[line:GetName().."ColorSwatch"]
            line.inputbox = CreateFrame("EditBox", nil, line, "InputBoxTemplate")
            line.inputbox:SetAutoFocus(false)
            line.inputbox:SetSize(88, 14)
            line.inputbox:SetPoint("LEFT", line.colorbox, "RIGHT", 16, 0)
            line:SetPoint("TOPRIGHT", anchor, "BOTTOMRIGHT", 0, -1)
            _G[line:GetName().."CheckText"]:SetText(L[v.key])
            line.checkbox:SetScript("OnClick", ColorminixCheckboxOnClick)
            line.colorbox:SetScript("OnClick", ColormixinOpenColorPicker)
            line.inputbox:SetScript("OnEnterPressed", ColormixinInputOnEnter)
            anchor = line
            InitColorminix(line, v.key)
        end
    end
end)

LibEvent:attachEvent("VARIABLES_LOADED", function()
    if (not TinyTooltipDB or not TinyTooltipDB.version) then
        TinyTooltipDB = CopyTable(DefaultDB)
    elseif (TinyTooltipDB.version < DefaultDB.version) then
        TinyTooltipDB.version = DefaultDB.version
        for k, v in pairs(DefaultDB) do
            if (TinyTooltipDB[k] == nil) then
                TinyTooltipDB[k] = v
            end
        end
    end
    LibEvent:trigger("TINYTOOLTIP_INIT")
end)

InterfaceOptions_AddCategory(frame)
SLASH_TinyTooltip1 = "/tinytooltip"
function SlashCmdList.TinyTooltip(msg, editbox)
    if (msg == "reset") then
        TinyTooltipDB = DefaultDB
        return 
    end
    InterfaceOptionsFrame_OpenToCategory(frame)
    InterfaceOptionsFrame_OpenToCategory(frame)
end
