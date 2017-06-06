
local LibEvent = LibStub:GetLibrary("LibEvent.7000")

local addonName, addon = ...

addon.L = addon.L or {}
setmetatable(addon.L, { __index = function(_, k)
    local s = {strsplit(".", k)}
    return (s[#s]:gsub("([a-z])([A-Z])", "%1 %2"):gsub("^(%a)", function(c) return strupper(c) end))
end})
local L = addon.L

local function CallTrigger(keystring, value)
    for _, tip in ipairs(addon.tooltips) do
        if (keystring == "general.mask") then
            LibEvent:trigger("tooltip.style.mask", tip, value)
        elseif (keystring == "general.scale") then
            LibEvent:trigger("tooltip.scale", tip, value)
        elseif (keystring == "general.background") then
            LibEvent:trigger("tooltip.style.background", tip, unpack(value))
        elseif (keystring == "general.borderColor") then
            LibEvent:trigger("tooltip.style.border.color", tip, unpack(value))
        elseif (keystring == "general.borderSize") then
            LibEvent:trigger("tooltip.style.border.size", tip, value)
        elseif (keystring == "general.borderCorner") then
            LibEvent:trigger("tooltip.style.border.corner", tip, value)
        end
    end
    if (keystring == "general.statusbarText") then
        LibEvent:trigger("tooltip.statusbar.text", value)
    elseif (keystring == "general.statusbarHeight") then
        LibEvent:trigger("tooltip.statusbar.height", value)
    end
end

local function GetVariable(keystring, tbl)
    local keys = {strsplit(".", keystring)}
    local value = tbl or addon.db
    for i, key in ipairs(keys) do
        if (value[key] == nil) then return end
        value = value[key]
    end
    return value
end

local function SetVariable(keystring, value, tbl)
    local keys = {strsplit(".", keystring)}
    local num = #keys
    local tab = tbl or addon.db
    local lastKey
    for i, key in ipairs(keys) do
        if (i < num) then
            if (not tab[key]) then tab[key] = {} end
            tab = tab[key]
        elseif (i == num) then
            lastKey = key
        end
    end
    tab[lastKey] = value
    CallTrigger(keystring, value)
end

local widgets = {}

function widgets:checkbox(parent, config, labelText)
    local frame = CreateFrame("CheckButton", nil, parent, "InterfaceOptionsCheckButtonTemplate")
    frame.keystring = config.keystring
    frame.Text:SetText(labelText or L[config.keystring])
    frame:SetChecked(GetVariable(config.keystring))
    frame:SetScript("OnClick", function(self) SetVariable(self.keystring, self:GetChecked()) end)
    return frame
end

function widgets:slider(parent, config)
    local frame = CreateFrame("Slider", nil, parent, "OptionsSliderTemplate")
    frame:SetWidth(118)
    frame.Text = frame:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
    frame.Text:SetPoint("LEFT", frame, "RIGHT", 8, 0)
    frame.keystring = config.keystring
    frame.Low:SetText("")
    frame.High:SetTextColor(1, 0.82, 0)
    frame.High:ClearAllPoints()
    frame.High:SetPoint("RIGHT", frame, "LEFT", -1, 0)
    frame.Text:SetText(L[config.keystring])
    frame.High:SetText(GetVariable(config.keystring))
    frame:SetMinMaxValues(config.min, config.max)
    frame:SetValueStep(config.step)
    frame:SetValue(GetVariable(config.keystring))
    frame:SetScript("OnValueChanged", function(self, value)
        local step = self:GetValueStep() or 1
        if (step < 1) then
            value = format("%.1f", value)
        else
            value = floor(value+0.5)
        end
        if (self:GetValue() ~= value) then
            SetVariable(self.keystring, value)
            self.High:SetText(value)
        end
    end)
    return frame
end

function widgets:editbox(parent, config)
    local frame = CreateFrame("EditBox", nil, parent, "InputBoxTemplate")
    frame.keystring = config.keystring
    frame:SetAutoFocus(false)
    frame:SetSize(88, 14)
    frame:SetText(GetVariable(config.keystring))
    frame:SetCursorPosition(0)
    frame:SetScript("OnEnterPressed", function(self)
        SetVariable(self.keystring, self:GetText())
        self:ClearFocus()
    end)
    return frame
end

function widgets:colorpick(parent, config)
    local a, r, g, b = 1
    if (config.colortype == "hex") then
        r, g, b = addon:GetRGBColor(GetVariable(config.keystring))
    else
        r, g, b, a = unpack(GetVariable(config.keystring))
    end
    local frame = CreateFrame("Button", nil, parent)
    frame.keystring = config.keystring
    frame.colortype = config.colortype
    frame.hasopacity = config.hasopacity
    frame:SetSize(16, 16)
    frame:SetNormalTexture("Interface\\ChatFrame\\ChatFrameColorSwatch")
    frame.bg = frame:CreateTexture(nil, "BACKGROUND")
    frame.bg:SetColorTexture(1, 1, 1)
    frame.bg:SetSize(14, 14)
    frame.bg:SetPoint("CENTER")
    frame.Text = frame:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
    frame.Text:SetPoint("LEFT", frame, "RIGHT", 5, 0)
    frame.Text:SetText(L[config.keystring])
    frame.Text:SetShown(not config.hidetitle)
    frame:GetNormalTexture():SetVertexColor(r, g, b, a)
    frame:SetScript("OnClick", function(self)
        local r, g, b, a = self:GetNormalTexture():GetVertexColor()
        local info = {
            r = r, g = g, b = b, opacity = a, hasOpacity = self.hasopacity,
            opacityFunc = self.hasopacity and function()
                local r, g, b = ColorPickerFrame:GetColorRGB()
                local a = format("%.2f", OpacitySliderFrame:GetValue())
                local aa = select(4, ColorPickerFrame.tipframe:GetNormalTexture():GetVertexColor())
                if (a ~= aa) then
                    ColorPickerFrame.tipframe:GetNormalTexture():SetVertexColor(r,g,b,a)
                    SetVariable(ColorPickerFrame.tipframe.keystring, {r,g,b,a})
                end
            end,
            swatchFunc = function()
                local r, g, b = ColorPickerFrame:GetColorRGB()
                local a = format("%.2f", OpacitySliderFrame:GetValue())
                ColorPickerFrame.tipframe:GetNormalTexture():SetVertexColor(r,g,b,a)
                if (ColorPickerFrame.tipframe.colortype == "hex") then
                    SetVariable(ColorPickerFrame.tipframe.keystring, addon:GetHexColor(r,g,b))
                else
                    SetVariable(ColorPickerFrame.tipframe.keystring, {r,g,b,a})
                end
                --for element color
                if (ColorPickerFrame.tipframe:GetParent().colordropdown) then
                    UIDropDownMenu_SetText(ColorPickerFrame.tipframe:GetParent().colordropdown, VIDEO_QUALITY_LABEL6)
                end
            end,
        }
        ColorPickerFrame.tipframe = self
        OpenColorPicker(info)
    end)
    return frame
end

function widgets:dropdown(parent, config, labelText)
    local frame = CreateFrame("Frame", tostring(config), parent, "UIDropDownMenuTemplate")
    frame.keystring = config.keystring
    frame.dropdata = config.dropdata
    frame.Label = frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	frame.Label:SetPoint("LEFT", _G[frame:GetName().."Button"], "RIGHT", 6, 0)
	UIDropDownMenu_Initialize(frame, function(self)
        local keystring = self.keystring
        local selectedValue = UIDropDownMenu_GetSelectedValue(self)
        local info
        for _, v in pairs(self.dropdata) do
            info = UIDropDownMenu_CreateInfo()
            info.text  = L["dropdown."..v]
            info.value = v
            info.arg1  = self
            info.checked = selectedValue == v
            info.func = function(self, dropdown)
                SetVariable(dropdown.keystring, self.value)
                UIDropDownMenu_SetSelectedValue(dropdown, self.value)
            end
            UIDropDownMenu_AddButton(info)
        end
    end, config.displayMode)
    UIDropDownMenu_SetSelectedValue(frame, GetVariable(config.keystring))
    frame.Label:SetText(labelText or L[config.keystring])
    return frame
end

function widgets:element(parent, config)
    local frame = CreateFrame("Frame", nil, parent)
    frame:SetSize(560, 30)
    frame:SetBackdrop({
        bgFile   = "Interface\\Tooltips\\UI-Tooltip-Background",
        insets   = {left = 4, right = 4, top = 4, bottom = 4},
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        edgeSize = 16,
    })
    frame:SetBackdropColor(0, 0, 0.1, 0.8)
    frame:SetBackdropBorderColor(0.6, 0.6, 0.6, 0.6)
    frame.checkbox = self:checkbox(frame, {keystring=config.keystring..".enable"}, L[config.keystring])
    frame.checkbox:SetPoint("LEFT", 5, 0)
    if (config.color) then
        frame.colorpick = self:colorpick(frame, {keystring=config.keystring..".color",colortype="hex",hidetitle=true})
        frame.colorpick:SetPoint("LEFT", 285, 0)
        frame.colordropdown = self:dropdown(frame, {keystring=config.keystring..".color",dropdata=self.colorDropdata,displayMode="MENU"}, "")
        frame.colordropdown:SetScale(0.87)
        frame.colordropdown:SetPoint("LEFT", 200, -1)
    end
    if (config.wildcard) then
        frame.editbox = self:editbox(frame, {keystring=config.keystring..".wildcard"})
        frame.editbox:SetPoint("LEFT", 330, 0)
    end
    if (config.filter) then
        frame.filterdropdown = self:dropdown(frame, {keystring=config.keystring..".filter",dropdata=self.filterDropdata}, "")
        frame.filterdropdown:SetScale(0.87)
        frame.filterdropdown:SetPoint("LEFT", 490, -1)
    end
    return frame
end

function widgets:anchor(parent, config)
    local frame = CreateFrame("Frame", nil, parent)
    frame:SetSize(400, 30)
    frame.dropdown = self:dropdown(frame, {keystring=config.keystring..".position",dropdata=config.dropdata})
    frame.dropdown:SetPoint("LEFT", 0, 0)
    frame.checkbox1 = self:checkbox(frame, {keystring=config.keystring..".returnInCombat"})
    frame.checkbox1:SetPoint("LEFT", frame.dropdown.Label, "RIGHT", 12, -1)
    frame.checkbox2 = self:checkbox(frame, {keystring=config.keystring..".returnOnUnitFrame"})
    frame.checkbox2:SetPoint("LEFT", frame.checkbox1.Text, "RIGHT", 12, 0)
    return frame
end

widgets.filterDropdata = {"none","ininstance","incombat","inraid","samerealm","inpvp","inarena","reaction5","reaction6","not ininstance","not incombat","not inraid","not samerealm","not inpvp","not inarena","not reaction5","not reaction6",}
widgets.colorDropdata = {"default","class","level","reaction","itemQuality","selection","faction",}

local options = {
    general = {
        { keystring = "general.mask",               type = "checkbox" },
        { keystring = "general.statusbarText",      type = "checkbox" },
        { keystring = "general.background",         type = "colorpick", hasopacity = true },
        { keystring = "general.borderColor",        type = "colorpick", hasopacity = true },
        { keystring = "general.scale",              type = "slider", min = 0.5, max = 4, step = 0.1 },
        { keystring = "general.borderSize",         type = "slider", min = 1, max = 6, step = 1 },
        { keystring = "general.statusbarHeight",    type = "slider", min = 0, max = 24, step = 1 },
        { keystring = "general.borderCorner",       type = "dropdown", dropdata = {"default","angular"} },
        { keystring = "general.statusbarPosition",  type = "dropdown", dropdata = {"default","bottom","top"} },
        { keystring = "general.statusbarColor",     type = "dropdown", dropdata = {"default","auto","smooth"} },
        { keystring = "general.anchor",             type = "anchor", dropdata = {"default","cursorRight","cursor","static"} },
        
        { keystring = "item.coloredItemBorder",           type = "checkbox" },
        { keystring = "quest.coloredQuestBorder",         type = "checkbox" },
    },
    pc = {
        { keystring = "unit.player.showTarget",           type = "checkbox" },
        { keystring = "unit.player.showTargetBy",         type = "checkbox" },
        { keystring = "unit.player.showModel",            type = "checkbox" },
        { keystring = "unit.player.coloredBorder",        type = "dropdown", dropdata = widgets.colorDropdata },
        { keystring = "unit.player.anchor",               type = "anchor", dropdata = {"inherit", "default","cursorRight","cursor","static"} },
        { keystring = "unit.player.elements.raidIcon",    type = "element", filter = true, },
        { keystring = "unit.player.elements.pvpIcon",     type = "element", filter = true, },
        { keystring = "unit.player.elements.factionIcon", type = "element", filter = true, },
        { keystring = "unit.player.elements.classIcon",   type = "element", filter = true, },
        { keystring = "unit.player.elements.title",       type = "element", color = true, wildcard = true, filter = true, },
        { keystring = "unit.player.elements.name",        type = "element", color = true, wildcard = true, filter = true, },
        { keystring = "unit.player.elements.realm",       type = "element", color = true, wildcard = true, filter = true, },
        { keystring = "unit.player.elements.statusAFK",   type = "element", color = true, wildcard = true, filter = true, },
        { keystring = "unit.player.elements.statusDND",   type = "element", color = true, wildcard = true, filter = true, },
        { keystring = "unit.player.elements.statusDC",    type = "element", color = true, wildcard = true, filter = true, },
        { keystring = "unit.player.elements.guildName",   type = "element", color = true, wildcard = true, filter = true, },
        { keystring = "unit.player.elements.guildIndex",  type = "element", color = true, wildcard = true, filter = true, },
        { keystring = "unit.player.elements.guildRank",   type = "element", color = true, wildcard = true, filter = true, },
        { keystring = "unit.player.elements.guildRealm",  type = "element", color = true, wildcard = true, filter = true, },
        { keystring = "unit.player.elements.levelValue",  type = "element", color = true, wildcard = true, filter = true, },
        { keystring = "unit.player.elements.factionName", type = "element", color = true, wildcard = true, filter = true, },
        { keystring = "unit.player.elements.gender",      type = "element", color = true, wildcard = true, filter = true, },
        { keystring = "unit.player.elements.raceName",    type = "element", color = true, wildcard = true, filter = true, },
        { keystring = "unit.player.elements.className",   type = "element", color = true, wildcard = true, filter = true, },
        { keystring = "unit.player.elements.isPlayer",    type = "element", color = true, wildcard = true, filter = true, },
    },
    npc = {
        { keystring = "unit.npc.showTarget",            type = "checkbox" },
        { keystring = "unit.npc.showTargetBy",          type = "checkbox" },
        { keystring = "unit.npc.coloredBorder",         type = "dropdown", dropdata = widgets.colorDropdata },
        { keystring = "unit.npc.anchor",                type = "anchor", dropdata = {"inherit","default","cursorRight","cursor","static"} },
        { keystring = "unit.npc.elements.raidIcon",     type = "element", filter = true, },
        { keystring = "unit.npc.elements.classIcon",    type = "element", filter = true, },
        { keystring = "unit.npc.elements.questIcon",    type = "element", filter = true, },
        { keystring = "unit.npc.elements.npcTitle",     type = "element", color = true, wildcard = true, },
        { keystring = "unit.npc.elements.name",         type = "element", color = true, wildcard = true, filter = true, },
        { keystring = "unit.npc.elements.levelValue",   type = "element", color = true, wildcard = true, filter = true, },
        { keystring = "unit.npc.elements.classifBoss",  type = "element", color = true, wildcard = true, filter = true, },
        { keystring = "unit.npc.elements.classifElite", type = "element", color = true, wildcard = true, filter = true, },
        { keystring = "unit.npc.elements.classifRare",  type = "element", color = true, wildcard = true, filter = true, },
        { keystring = "unit.npc.elements.creature",     type = "element", color = true, wildcard = true, filter = true, },
        { keystring = "unit.npc.elements.reactionName", type = "element", color = true, wildcard = true, filter = true, },
    }
}

local frame = CreateFrame("Frame", nil, UIParent)
frame.anchor = CreateFrame("Frame", nil, frame)
frame.anchor:SetPoint("TOPLEFT", 32, -16)
frame.anchor:SetSize(InterfaceOptionsFramePanelContainer:GetWidth()-64, 1)
frame.title = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
frame.title:SetPoint("TOPLEFT", 18, -16)
frame.title:SetText(addonName)
frame.name = addonName


local framePC = CreateFrame("Frame", nil, UIParent)
framePC.anchor = CreateFrame("Frame", nil, framePC)
framePC.anchor:SetPoint("TOPLEFT", 32, -13)
framePC.anchor:SetSize(InterfaceOptionsFramePanelContainer:GetWidth()-64, 1)
framePC.title = framePC:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
framePC.title:SetPoint("TOPLEFT", 18, -16)
framePC.title:SetText(format("%s |cff33eeff%s|r", addonName, "Unit Is Player"))
framePC.name = format("%s - %s", addonName, "Player")
framePC.parent = addonName

framePC:SetSize(500, #options.pc*29+60)
local framePCScrollFrame = CreateFrame("ScrollFrame", nil, UIParent, "UIPanelScrollFrameTemplate")
framePCScrollFrame.ScrollBar:Hide()
framePCScrollFrame.ScrollBar:ClearAllPoints()
framePCScrollFrame.ScrollBar:SetPoint("TOPLEFT", framePCScrollFrame, "TOPRIGHT", -20, -20)
framePCScrollFrame.ScrollBar:SetPoint("BOTTOMLEFT", framePCScrollFrame, "BOTTOMRIGHT", -20, 20)
framePCScrollFrame:HookScript("OnScrollRangeChanged", function(self, xrange, yrange)
    self.ScrollBar:SetShown(floor(yrange) ~= 0)
end)
framePCScrollFrame:SetScrollChild(framePC)
framePCScrollFrame.name = format("%s - %s", addonName, "Player")
framePCScrollFrame.parent = addonName


local frameNPC = CreateFrame("Frame", nil, UIParent)
frameNPC.anchor = CreateFrame("Frame", nil, frameNPC)
frameNPC.anchor:SetPoint("TOPLEFT", 32, -16)
frameNPC.anchor:SetSize(InterfaceOptionsFramePanelContainer:GetWidth()-64, 1)
frameNPC.title = frameNPC:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
frameNPC.title:SetPoint("TOPLEFT", 18, -16)
frameNPC.title:SetText(format("%s |cff33eeff%s|r", addonName, "Unit Is NPC"))
frameNPC.name = format("%s - %s", addonName, "NPC")
frameNPC.parent = addonName

LibEvent:attachEvent("VARIABLES_LOADED", function()
    local element, offsetX
    for i, v in ipairs(options.general) do
        if (widgets[v.type]) then
            if (v.type == "colorpick") then offsetX = 5
            elseif (v.type == "slider") then offsetX = 15
            elseif (v.type == "dropdown") then offsetX = -15
            elseif (v.type == "anchor") then offsetX = -15
            else offsetX = 0 end
            element = widgets[v.type](widgets, frame, v)
            element:SetPoint("TOPLEFT", frame.anchor, "BOTTOMLEFT", offsetX, -(i*32))
        end
    end
    for i, v in ipairs(options.pc) do
        if (widgets[v.type]) then
            if (v.type == "colorpick") then offsetX = 5
            elseif (v.type == "slider") then offsetX = 15
            elseif (v.type == "dropdown") then offsetX = -15
            elseif (v.type == "anchor") then offsetX = -15
            else offsetX = 0 end
            element = widgets[v.type](widgets, framePC, v)
            element:SetPoint("TOPLEFT", framePC.anchor, "BOTTOMLEFT", offsetX, -(i*29))
        end
    end
    for i, v in ipairs(options.npc) do
        if (widgets[v.type]) then
            if (v.type == "colorpick") then offsetX = 5
            elseif (v.type == "slider") then offsetX = 15
            elseif (v.type == "dropdown") then offsetX = -15
            elseif (v.type == "anchor") then offsetX = -15
            else offsetX = 0 end
            element = widgets[v.type](widgets, frameNPC, v)
            element:SetPoint("TOPLEFT", frameNPC.anchor, "BOTTOMLEFT", offsetX, -(i*29))
        end
    end
end)

InterfaceOptions_AddCategory(frame)
InterfaceOptions_AddCategory(framePCScrollFrame)
InterfaceOptions_AddCategory(frameNPC)
SLASH_TinyTooltip1 = "/tinytooltip"
SLASH_TinyTooltip2 = "/tt"
function SlashCmdList.TinyTooltip(msg, editbox)
    if (msg == "reset") then
        BigTipDB = {}
    elseif (msg == "npc") then
        InterfaceOptionsFrame_OpenToCategory(frameNPC)
        InterfaceOptionsFrame_OpenToCategory(frameNPC)
    elseif (msg == "player") then
        InterfaceOptionsFrame_OpenToCategory(framePCScrollFrame)
        InterfaceOptionsFrame_OpenToCategory(framePCScrollFrame)
    else
        InterfaceOptionsFrame_OpenToCategory(frame)
        InterfaceOptionsFrame_OpenToCategory(frame)
    end
end


--@todo anchor位置錨點 鼠標錨點
--@todo 元素拖動
--@todo 世界任務的全屏問題
