local T, C, L, G = unpack(select(2, ...))

local addon_name = G.addon_name
local font = G.Font

----------------------------------------------------------
-----------------[[     Functions     ]]------------------
----------------------------------------------------------

local createcheckbutton = function(parent, x, y, name, t1, t2, value)
	local bu
	if t2 then
		bu = CreateFrame("CheckButton", addon_name..t1..t2..value.."Button", parent, "InterfaceOptionsCheckButtonTemplate")
	else
		bu = CreateFrame("CheckButton", addon_name..t1..value.."Button", parent, "InterfaceOptionsCheckButtonTemplate")	
	end
	bu:SetPoint("TOPLEFT", x, y)
	bu:SetHitRectInsets(0, -50, 0, 0)
	
	_G[bu:GetName() .. "Text"]:SetText(name)
	
	if t2 then
		bu:SetScript("OnShow", function(self) self:SetChecked(ARM_CDB[t1][t2][value]) end)
		bu:SetScript("OnClick", function(self)
			if self:GetChecked() then
				ARM_CDB[t1][t2][value] = true
			else
				ARM_CDB[t1][t2][value] = false
			end
			if bu.apply then
				bu:apply()
			end
		end)		
	else
		bu:SetScript("OnShow", function(self) self:SetChecked(ARM_CDB[t1][value]) end)
		bu:SetScript("OnClick", function(self)
			if self:GetChecked() then
				ARM_CDB[t1][value] = true
			else
				ARM_CDB[t1][value] = false
			end
			if bu.apply then
				bu:apply()
			end
		end)	
	end
	
	return bu
end

local function TestSlider_OnValueChanged(self, value)
   if not self._onsetting then   -- is single threaded 
     self._onsetting = true
     self:SetValue(self:GetValue())
     value = self:GetValue()     -- cant use original 'value' parameter
     self._onsetting = false
   else return end               -- ignore recursion for actual event handler
 end
 
local createslider = function(parent, x, y, name, t1, t2, value, min, max, step)
	local slider
	if t2 then
		slider = CreateFrame("Slider", addon_name..t1..t2..value.."Slider", parent, "OptionsSliderTemplate")
	else
		slider = CreateFrame("Slider", addon_name..t1..value.."Slider", parent, "OptionsSliderTemplate")
	end
	slider:SetPoint("TOPLEFT", x, y)
	slider:SetWidth(160)
	
	BlizzardOptionsPanel_Slider_Enable(slider)
	
	slider:SetMinMaxValues(min, max)
	_G[slider:GetName()..'Low']:SetText(min)
	_G[slider:GetName()..'Low']:ClearAllPoints()
	_G[slider:GetName()..'Low']:SetPoint("RIGHT", slider, "LEFT", -5, 0)
	_G[slider:GetName()..'High']:SetText(max)
	_G[slider:GetName()..'High']:ClearAllPoints()
	_G[slider:GetName()..'High']:SetPoint("LEFT", slider, "RIGHT", 5, 0)
	
	_G[slider:GetName()..'Text']:ClearAllPoints()
	_G[slider:GetName()..'Text']:SetPoint("BOTTOM", slider, "TOP", 0, 3)
	_G[slider:GetName()..'Text']:SetFontObject(GameFontHighlight)

	slider:SetValueStep(step)
	

	slider:SetScript("OnShow", function(self)
		if t2 then
			self:SetValue(ARM_CDB[t1][t2][value])
			_G[slider:GetName()..'Text']:SetText(name.." "..ARM_CDB[t1][t2][value])
		else
			self:SetValue(ARM_CDB[t1][value])
			_G[slider:GetName()..'Text']:SetText(name.." "..ARM_CDB[t1][value])
		end
	end)
	
	slider:SetScript("OnValueChanged", function(self, getvalue)
		if t2 then
			ARM_CDB[t1][t2][value] = getvalue
			TestSlider_OnValueChanged(self, getvalue)
			_G[slider:GetName()..'Text']:SetText(name.." "..ARM_CDB[t1][t2][value])
			if slider.apply then
				slider:apply()
			end
		else
			ARM_CDB[t1][value] = getvalue
			TestSlider_OnValueChanged(self, getvalue)
			_G[slider:GetName()..'Text']:SetText(name.." "..ARM_CDB[t1][value])
			if slider.apply then
				slider:apply()
			end
		end
	end)
	
	return slider	
end

local createradiobuttongroup = function(parent, x, y, name, t1, t2, value, group)
	local frame
	if t2 then
		frame = CreateFrame("Frame", addon_name..t1..t2..value.."RadioButtonGroup", parent)
	else
		frame = CreateFrame("Frame", addon_name..t1..value.."RadioButtonGroup", parent)
	end
	frame:SetPoint("TOPLEFT", parent, "TOPLEFT", x, y)
	frame:SetSize(150, 30)
	
	frame.text = T.createtext(frame, "OVERLAY", 12, "NONE", "LEFT")
	frame.text:SetPoint("TOPLEFT", frame, "TOPLEFT")
	frame.text:SetText(name)

	for k, v in T.pairsByKeys(group) do
		frame[k] = CreateFrame("CheckButton", addon_name..value..k.."RadioButtonGroup", frame, "UIRadioButtonTemplate")
		
		_G[frame[k]:GetName() .. "Text"]:SetText(v)
		
		if t2 then
			frame[k]:SetScript("OnShow", function(self)
				self:SetChecked(ARM_CDB[t1][t2][value] == k)
			end)
			
			frame[k]:SetScript("OnClick", function(self)
				if self:GetChecked() then
					ARM_CDB[t1][t2][value] = k
					if frame.apply then
						frame:apply()
					end
				else
					self:SetChecked(true)
				end
			end)
		else
			frame[k]:SetScript("OnShow", function(self)
				self:SetChecked(ARM_CDB[t1][value] == k)
			end)
			
			frame[k]:SetScript("OnClick", function(self)
				if self:GetChecked() then
					ARM_CDB[t1][value] = k
					if frame.apply then
						frame:apply()
					end
				else
					self:SetChecked(true)
				end
			end)
		end
	end
	
	for k, v in T.pairsByKeys(group) do
		frame[k]:HookScript("OnClick", function(self)
			if (t2 and ARM_CDB[t1][t2][value] == k) or (not t2 and ARM_CDB[t1][value] == k) then
				for key, value in T.pairsByKeys(group) do
					if key ~= k then
						frame[key]:SetChecked(false)
					end
				end
			end
		end)
	end
	
	local buttons = {frame:GetChildren()}
	for i = 1, #buttons do
		if i == 1 then
			buttons[i]:SetPoint("LEFT", frame.text, "RIGHT", 10, 0)
		else
			buttons[i]:SetPoint("LEFT", _G[buttons[i-1]:GetName() .. "Text"], "RIGHT", 5, 0)
		end
	end
	
	return frame
end

local createeditbox = function(parent, x, y, name, t1, t2, value)
	local box
	if t2 then
		box = CreateFrame("EditBox", addon_name..t1..t2..value.."EditBox", parent, "InputBoxTemplate")
	else
		box = CreateFrame("EditBox", addon_name..t1..value.."EditBox", parent, "InputBoxTemplate")
	end
	
	box:SetSize(150, 20)
	box:SetAutoFocus(false)
	
	box.name = box:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
	box.name:SetText(name)
	
	box.name:SetPoint("TOPLEFT", parent, "TOPLEFT", x, y)
	box:SetPoint("LEFT", box.name, "RIGHT", 10, 1)
	
	box:SetScript("OnShow", function(self)
		if t2 then
			self:SetText(ARM_CDB[t1][t2][value])
		else
			self:SetText(ARM_CDB[t1][value])
		end
	end)
	
	box:SetScript("OnEscapePressed", function(self)
		if t2 then
			self:SetText(ARM_CDB[t1][t2][value])
		else
			self:SetText(ARM_CDB[t1][value])
		end
	end)
	
	box:HookScript("OnEditFocusLost", function(self)
		if t2 then
			ARM_CDB[t1][t2][value] = self:GetText()
		else
			ARM_CDB[t1][value] = self:GetText()
		end
		if box.apply then
			box:apply()
		end
	end)
	
	return box
end
T.createeditbox = createeditbox

T.CreateTitle = function(options, text, y, pos)
	if y then
		local title = T.createtext(options, "OVERLAY", 15, "OUTLINE", "CENTER")
		title:SetText(text)
		
		local line = options:CreateTexture(nil, "ARTWORK")
		
		if pos == "left" then
			title:SetPoint("TOPLEFT", options, "TOPLEFT", 20, y)
			line:SetSize(options:GetWidth()/2-25, 1)
			line:SetPoint("TOPLEFT", options, "TOPLEFT", 20, y-20)
		elseif pos == "right" then
			title:SetPoint("TOPLEFT", options, "TOP", 20, y)
			line:SetSize(options:GetWidth()/2-15, 1)
			line:SetPoint("TOPLEFT", options, "TOP", 20, y-20)
		else
			title:SetPoint("TOPLEFT", options, "TOPLEFT", 20, y)
			line:SetSize(options:GetWidth()-50, 1)
			line:SetPoint("TOPLEFT", options, "TOPLEFT", 20, y-20)
		end
		
		line:SetColorTexture(1, 1, 1, .5)
	end
end

T.CreateOptions = function(text, parent, y1, y2, y3)
	local options = CreateFrame("Frame", nil, parent)
	options:SetPoint("TOPLEFT", parent, "TOPLEFT", 10, -15)
	options:SetPoint("BOTTOMRIGHT", parent, "BOTTOMRIGHT", -10, 10)
	options:Hide()
	
	local tab = parent["tab"..parent.tabindex]
	tab.n = parent.tabindex
	tab:SetFrameLevel(parent:GetFrameLevel()+2)

	T.createborder(tab)

	tab.name = T.createtext(tab, "OVERLAY", 12, "OUTLINE", "LEFT")
	tab.name:SetText(text)
	tab.name:SetPoint("LEFT")
	
	tab:SetSize(130, 25)
	tab:SetPoint("TOPLEFT", parent, "TOPRIGHT", 5, -30*tab.n)
	
	if tab.n == 1 then
		tab.sd:SetBackdropBorderColor(1, 1, 0)
		options:Show()
	end
	
	tab:HookScript("OnMouseDown", function(self)
		options:Show()
		tab.sd:SetBackdropBorderColor(1, 1, 0)
	end)
	
	for i = 1, parent.tabnum do
		if i ~= tab.n then
			parent["tab"..i]:HookScript("OnMouseDown", function(self)
				options:Hide()
				tab.sd:SetBackdropBorderColor(0, 0, 0)
			end)
		end
	end
	
	T.CreateTitle(options, L["图标提示"], y1)
	T.CreateTitle(options, L["声音提示"], y2)
	T.CreateTitle(options, L["其它"], y3)
	
	parent.tabindex = parent.tabindex +1

	return options
end

T.CreateAlertIconOptions = function(parent, SpellID, AlertName, difficulty, ...)
	local options = CreateFrame("Frame", addon_name.."Icons"..AlertName.."options", parent)
	options:SetSize(600, 40)
	options:SetPoint(...)
	
	local spellname, _, iconpath = GetSpellInfo(SpellID)
	local details = GetSpellDescription(SpellID)
	
	options.spell = CreateFrame("Frame", nil, options)
	options.spell:SetSize(30,30)
	options.spell:SetPoint("TOPLEFT", 0, 0)
	T.createborder(options.spell)
	
	options.spell.icon = options.spell:CreateTexture(nil, "OVERLAY")
	options.spell.icon:SetTexCoord( .1, .9, .1, .9)
	options.spell.icon:SetAllPoints()
	options.spell.icon:SetTexture(iconpath)
	
	options.spell.text = T.createtext(options.spell, "OVERLAY", 15, "OUTLINE", "LEFT")
	options.spell.text:SetPoint("LEFT", options.spell.icon, "RIGHT", 5, 0)
	options.spell.text:SetText(spellname)
	
	options.spell:SetScript("OnEnter", function(self) 
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT",  -20, 10)
		GameTooltip:SetSpellByID(SpellID)
		if options.tip then
			GameTooltip:AddLine(" ")
			GameTooltip:AddLine(G.addon_c..options.tip.."|r")
			if difficulty ~= "all" then
				GameTooltip:AddLine(G.addon_c..GetDifficultyInfo(difficulty).."|r")
			end
		end
		GameTooltip:Show() 
	end)
	options.spell:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)
	
	options.enable = createcheckbutton(options, 180, 0, L["启用"], "Icons", AlertName, "enable")
	options.enable.apply = function() G["Icons"][AlertName].update_onedit("enable") end
	
	options.hl = createcheckbutton(options, 250, 0, L["发光"], "Icons", AlertName, "hl")
	options.hl.apply = function() G["Icons"][AlertName].update_onedit("hl") end
	
	return options
end

T.CreateSoundOptions = function(parent, v, x, y, tip)
	local _, spellID = string.split("_", v)
	local str = GetSpellInfo(spellID)
	local bu = createcheckbutton(parent, x, y, str, "Sounds", false, v)
	
	bu:SetScript("OnEnter", function(self) 
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT",  -20, 10)
		GameTooltip:SetSpellByID(spellID)
		if tip then
			GameTooltip:AddLine(" ")
			GameTooltip:AddLine(G.addon_c..tip.."|r")
		end
		GameTooltip:Show() 
		if G.shared[v] then
			PlaySoundFile(G.media.sounds..G.shared[v]..".ogg", "Master")
		else
			PlaySoundFile(G.media.sounds..v..".ogg", "Master")
		end
	end)
	
	bu:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)
end

T.CreateTextAlertOptions = function(s, t, parent, v, x, y, difficulty)
	local bu = createcheckbutton(parent, x, y, s, t, false, v)
	if t == "HealthPercAlerts" then
		bu.apply = function() G["HP_frames"][v].update_onedit("enable") end
	elseif t == "PowerAlerts" then
		bu.apply = function() G["PP_frames"][v].update_onedit("enable") end
	elseif t == "Texts" then
		bu.apply = function() G["Texts"][v].update_onedit("enable") end
	end
	
	if difficulty and difficulty ~= "all" then
		bu:SetScript("OnEnter", function(self) 
			GameTooltip:SetOwner(self, "ANCHOR_RIGHT",  -20, 10)
			GameTooltip:AddLine(G.addon_c..GetDifficultyInfo(difficulty).."|r")
			GameTooltip:Show() 
		end)
		bu:SetScript("OnLeave", function(self)
			GameTooltip:Hide()
		end)
	end
end

T.Create_HLOnRaid_Options = function(parent, v, x, y, tip)
	local _, spellID = string.split("_", v)
	local str = string.format(L["显示高亮图标"], GetSpellInfo(spellID))
	local bu = createcheckbutton(parent, x, y, str, "HL_Spells", false, v)
	
	if tip then
		bu:SetScript("OnEnter", function(self) 
			GameTooltip:SetOwner(self, "ANCHOR_RIGHT",  -20, 10)
			GameTooltip:AddLine(G.addon_c..tip.."|r")
			GameTooltip:Show() 
		end)
		
		bu:SetScript("OnLeave", function(self)
			GameTooltip:Hide()
		end)
	end
end

T.Create_GS_Options = function(parent, v, x, y)
	local _, spellID = string.split("_", v)
	local str = string.format(L["显示分担指示器"], GetSpellInfo(spellID))
	createcheckbutton(parent, x, y, str, "GS_Spells", false, v)
end

T.Create_BossMod_Options = function(parent, name, v, x, y)
	local bu = createcheckbutton(parent, x, y, name, "BossMod", false, v)
	return bu
end

T.Create_PlateAlerts_Options = function(parent, v, x, y)
	if v == "vulnerability" then
		local bu = CreateFrame("CheckButton", addon_name.."PlateAurasvulnerabilityButton", parent, "InterfaceOptionsCheckButtonTemplate")	
		bu:SetPoint("TOPLEFT", x, y)
		bu:SetHitRectInsets(0, -50, 0, 0)		
		_G[bu:GetName() .. "Text"]:SetText(string.format(L["显示姓名板图标"], L["易伤"]))
		
		bu:SetScript("OnShow", function(self) self:SetChecked(ARM_CDB["PlateAuras"][255429]) end)
		
		bu:SetScript("OnClick", function(self)
			if self:GetChecked() then
				ARM_CDB["PlateAuras"][255429] = true
				ARM_CDB["PlateAuras"][255425] = true
				ARM_CDB["PlateAuras"][255419] = true
				ARM_CDB["PlateAuras"][255422] = true
				ARM_CDB["PlateAuras"][255418] = true
				ARM_CDB["PlateAuras"][255430] = true
				ARM_CDB["PlateAuras"][255433] = true
			else
				ARM_CDB["PlateAuras"][255429] = false
				ARM_CDB["PlateAuras"][255425] = false
				ARM_CDB["PlateAuras"][255419] = false
				ARM_CDB["PlateAuras"][255422] = false
				ARM_CDB["PlateAuras"][255418] = false
				ARM_CDB["PlateAuras"][255430] = false
				ARM_CDB["PlateAuras"][255433] = false
			end
		end)
		
	else
		local str = string.format(L["显示姓名板图标"], GetSpellInfo(v))
		createcheckbutton(parent, x, y, str, "PlateAuras", false, v)
	end
end

T.Create_PlateAlerts_Power_Options = function(parent, v, name, x, y)
	local str = string.format(L["显示姓名板能量图标"], name)
	createcheckbutton(parent, x, y, str, "PlatePower", false, v)
end

T.Create_ChatMsgSpells_Options = function(parent, v, x, y)
	if not GetSpellInfo(v) then
		print(v)
		return
	end
	local str = string.format(L["添加喊话"], GetSpellInfo(v))
	createcheckbutton(parent, x, y, str, "ChatMsgSpells", false, v)
end
----------------------------------------------------------
-----------------[[        GUI        ]]------------------
----------------------------------------------------------

local gui = CreateFrame("Frame", addon_name.."_GUI", UIParent)
gui:SetSize(1000, 800)
gui:SetScale(1)
gui:SetPoint("CENTER", UIParent, "CENTER")
gui:SetFrameStrata("HIGH")
gui:SetFrameLevel(2)
gui:Hide()

gui:RegisterForDrag("LeftButton")
gui:SetScript("OnDragStart", function(self) self:StartMoving() end)
gui:SetScript("OnDragStop", function(self) self:StopMovingOrSizing() end)
gui:SetClampedToScreen(true)
gui:SetMovable(true)
gui:SetUserPlaced(true)
gui:EnableMouse(true)
T.createborder(gui)

gui.title = T.createtext(gui, "OVERLAY", 15, "OUTLINE", "CENTER")
gui.title:SetPoint("BOTTOM", gui, "TOP", 0, -5)
gui.title:SetText(addon_name.." "..G.Version)

gui.close = CreateFrame("Button", nil, gui)
gui.close:SetPoint("BOTTOMRIGHT", -3, 3)
gui.close:SetSize(20, 20)
gui.close:SetNormalTexture("Interface\\BUTTONS\\UI-GroupLoot-Pass-Up")
gui.close:SetHighlightTexture("Interface\\BUTTONS\\UI-GroupLoot-Pass-Highlight")
gui.close:SetPushedTexture("Interface\\BUTTONS\\UI-GroupLoot-Pass-Down")
gui.close:SetPushedTextOffset(3, 3)
gui.close:SetScript("OnClick", function() gui:Hide() end)

G.gui = gui
----------------------------------------------------------
--------------[[     General Settings     ]]--------------
----------------------------------------------------------
gui.tabindex = 1
gui.tabnum = 13
for i = 1, 13 do
	gui["tab"..i] = CreateFrame("Frame", addon_name.."GUI Tab"..i, gui)
	gui["tab"..i]:SetScript("OnMouseDown", function() end)
end

local options = T.CreateOptions(L["通用"], gui)

T.CreateTitle(options, L["通用"], -20, "left")

local resetposbutton = T.createUIPanelButton(options, addon_name.."ResetPosButton", 100, 25, L["重置位置"])
resetposbutton:SetPoint("TOPLEFT", options, "TOPLEFT", 50, -50)
resetposbutton:SetScript("OnClick", function()
	StaticPopupDialogs[G.addon_name.."Reset Confirm"].text = L["重置位置确认"]
	StaticPopupDialogs[G.addon_name.."Reset Confirm"].OnAccept = function()
		T.ResetAll()
	end
	StaticPopup_Show(G.addon_name.."Reset Confirm")
end)

local unlockbutton = T.createUIPanelButton(options, G.addon_name.."UnlockAllFramesButton", 100, 25, L["解锁框体"])
unlockbutton:SetPoint("LEFT", resetposbutton, "RIGHT", 10, 0)
unlockbutton:SetScript("OnClick", function()
	T.UnlockAll()
end)

local resetbutton = T.createUIPanelButton(options, G.addon_name.."ResetButton", 100, 25, L["重置所有设置"])
resetbutton:SetPoint("LEFT", unlockbutton, "RIGHT", 10, 0)
resetbutton:SetScript("OnClick", function()
	StaticPopupDialogs[G.addon_name.."Reset Confirm"].text = L["重置所有设置确认"]
	StaticPopupDialogs[G.addon_name.."Reset Confirm"].OnAccept = function()
		ARM_CDB = nil
		ARM_DB = nil
		ReloadUI()
	end
	StaticPopup_Show(G.addon_name.."Reset Confirm")
end)

local testbutton = T.createUIPanelButton(options, G.addon_name.."TestButton", 100, 25, L["测试"])
testbutton:SetPoint("LEFT", resetbutton, "RIGHT", 10, 0)
testbutton:SetScript("OnClick", function()
	for k, frame in pairs(G.Test) do
		frame.StartTest()
	end
	gui:Hide()
end)

options.Golbal_disable_sound = createcheckbutton(options, 40, -90, L["静音"], "General", false, "disable_sound")

options.Golbal_disable_chatmsg = createcheckbutton(options, 140, -90, L["不发送聊天讯息"], "General", false, "disable_chatmsg")
options.Golbal_disable_chatmsg:ClearAllPoints()
options.Golbal_disable_chatmsg:SetPoint("LEFT", _G[options.Golbal_disable_sound:GetName() .. "Text"], "RIGHT", 10, 0)

options.Golbal_disable_all = createcheckbutton(options, 280, -90, L["禁用插件"], "General", false, "disable_all")
options.Golbal_disable_all:ClearAllPoints()
options.Golbal_disable_all:SetPoint("LEFT", _G[options.Golbal_disable_chatmsg:GetName() .. "Text"], "RIGHT", 10, 0)
options.Golbal_disable_all.apply = function() T.UpdateAll() end

T.CreateTitle(options, L["图标提示"], -130, "left")

options.AlertFrame_enable = createcheckbutton(options, 40, -160, L["启用"], "AlertFrame", false, "enable")
options.AlertFrame_enable.apply = function() T.EditAlertFrame("enable") end

local growdirection_group = {
	["BOTTOM"] = L["上"],
	["TOP"] = L["下"],
}
options.AlertFrame_grow_dir = createradiobuttongroup(options, 150, -166, L["排列方向"], "AlertFrame", false, "grow_dir", growdirection_group)
options.AlertFrame_grow_dir.apply = function() T.EditAlertFrame("grow_dir") end

options.AlertFrame_icon_size = createslider(options, 60, -210, L["图标大小"], "AlertFrame", false, "icon_size", 30, 100, 1)
options.AlertFrame_icon_size.apply = function() T.EditAlertFrame("icon_size") end

options.AlertFrame_icon_space = createslider(options, 300, -210, L["图标间距"], "AlertFrame", false, "icon_space", 0, 20, 1)
options.AlertFrame_icon_space.apply = function() T.EditAlertFrame("icon_space") end

options.AlertFrame_font_size = createslider(options, 60, -250, L["大字体大小"], "AlertFrame", false, "font_size", 20, 60, 1)
options.AlertFrame_font_size.apply = function() T.EditAlertFrame("font_size") end

options.AlertFrame_ifont_size = createslider(options, 300, -250, L["小字体大小"], "AlertFrame", false, "ifont_size", 10, 20, 1)
options.AlertFrame_ifont_size.apply = function() T.EditAlertFrame("ifont_size") end

T.CreateTitle(options, L["血量提示"], -280, "left")

options.HealthPercFrame_enable = createcheckbutton(options, 40, -310, L["启用"], "HealthPercFrame", false, "enable")
options.HealthPercFrame_enable.apply = function() T.EditHealthPercFrame("enable") end

options.HealthPercFrame_flash = createcheckbutton(options, 155, -310, L["闪烁"], "HealthPercFrame", false, "flash")
options.HealthPercFrame_flash.apply = function() T.EditHealthPercFrame("flash") end

options.HealthPercFrame_font_size = createslider(options, 60, -360, L["字体大小"], "HealthPercFrame", false, "font_size", 20, 60, 1)
options.HealthPercFrame_font_size.apply = function() T.EditHealthPercFrame("font_size") end

T.CreateTitle(options, L["能量提示"], -390, "left")

options.PowerFrame_enable = createcheckbutton(options, 40, -420, L["启用"], "PowerFrame", false, "enable")
options.PowerFrame_enable.apply = function() T.EditPowerFrame("enable") end

options.PowerFrame_flash = createcheckbutton(options, 155, -420, L["闪烁"], "PowerFrame", false, "flash")
options.PowerFrame_flash.apply = function() T.EditPowerFrame("flash") end

options.PowerFrame_font_size = createslider(options, 60, -470, L["字体大小"], "PowerFrame", false, "font_size", 20, 60, 1)
options.PowerFrame_font_size.apply = function() T.EditPowerFrame("font_size") end

T.CreateTitle(options, L["醒目文字提示"], -500, "left")

options.TextFrame_enable = createcheckbutton(options, 40, -530, L["启用"], "TextFrame", false, "enable")
options.TextFrame_enable.apply = function() T.EditTextFrame("enable") end

options.TextFrame_flash = createcheckbutton(options, 155, -530, L["闪烁"], "TextFrame", false, "flash")
options.TextFrame_flash.apply = function() T.EditTextFrame("flash") end

options.TextFrame_font_size = createslider(options, 60, -580, L["字体大小"], "TextFrame", false, "font_size", 20, 80, 1)
options.TextFrame_font_size.apply = function() T.EditTextFrame("font_size") end

T.CreateTitle(options, L["团队高亮图标"], -610, "left")

options.HL_Frame_enable = createcheckbutton(options, 40, -640, L["启用"], "HL_Frame", false, "enable")

options.HL_Frame_icon_size = createslider(options, 60, -670, L["图标大小"], "HL_Frame", false, "iconSize", 15, 40, 1)

options.HL_Frame_icon_alpha = createslider(options, 300, -670, L["图标透明度"], "HL_Frame", false, "iconAlpha", 10, 100, 1)

local anchors = {
	["CENTER"] = L["中间"], 
	["LEFT"] = L["左"], 
	["RIGHT"] = L["右"], 
	["TOP"] = L["上"], 
	["BOTTOM"] = L["下"], 
	["TOPLEFT"] = L["左上"], 
	["TOPRIGHT"] = L["右上"], 
	["BOTTOMLEFT"] = L["左下"], 
	["BOTTOMRIGHT"] = L["右下"],
}

options.HL_Frame_position = createradiobuttongroup(options, 40, -710, L["锚点"], "HL_Frame", false, "position", anchors)

--T.CreateTitle(options, L["分组分担提示"], -650, "left")
--
--options.GS_Frame_enable = createcheckbutton(options, 40, -680, L["启用"], "GroupSharingFrame", false, "enable")
--options.GS_Frame_enable.apply = function() T.EditGroupSharingFrame("enable") end
--
--options.GS_Frame_sound = createcheckbutton(options, 155, -680, L["声音提示"], "GroupSharingFrame", false, "sound")
--
--options.GS_Frame_font_size = createslider(options, 60, -730, L["字体大小"], "GroupSharingFrame", false, "font_size", 20, 60, 1)
--options.GS_Frame_font_size.apply = function() T.EditGroupSharingFrame("font_size") end

T.CreateTitle(options, L["姓名板图标"], -20, "right")

options.PlateAlerts_enable = createcheckbutton(options, 520, -50, L["启用"], "PlateAlerts", false, "enable")

options.PlateAlerts_size = createslider(options, 550, -100, L["图标大小"], "PlateAlerts", false, "size", 30, 60, 1)

options.PlateAlerts_fsize = createslider(options, 550, -140, L["字体大小"], "PlateAlerts", false, "fsize", 15, 25, 1)

options.PlateAlerts_y = createslider(options, 550, -180, L["垂直距离"], "PlateAlerts", false, "y", -50, 50, 1)

T.CreateTitle(options, L["技能提示"], -210, "right")

options.BM_scale = createslider(options, 550, -260, L["尺寸"], "BossMod_Layout", false, "scale", 50, 200, 1)
options.BM_scale.apply = function() T.Edit_BossMods() end
----------------------------------------------------------
---------------[[     Version Check     ]]----------------
----------------------------------------------------------

local vc_frame = CreateFrame("Frame")

vc_frame:RegisterEvent("CHAT_MSG_ADDON")

vc_frame:SetScript("OnEvent", function(self, event, ...)	
	local prefix, message, channel, sender = ... 
	if prefix == "arm_vc" then 
		if message == "start_vc" then 
			if G.PlayerName == string.split("-", sender) and IsInRaid() then 
				print(G.addon_cname.." Version Check") 
				 
				self.raidroster = {} 
				 
				SendAddonMessage("arm_vc", "ver", "RAID") 
				 
				for i = 1, 40 do 
					local unitID = "raid"..i 
					local name = UnitName(unitID) 
					if name then 
						self.raidroster[name] = "NO ADDON" 
					end 
				end 

				C_Timer.After(2, function() 
					print("-----------------") 
					for name, ver in pairs(self.raidroster) do
						local c_name = "|c"..G.Ccolors[select(2, UnitClass(name))]["colorStr"]..name.." |r"
						print(c_name.."ver: "..ver) 
					end 
				end)
			end 
		elseif message == "ver" then 
			SendAddonMessage("arm_vc", "send_ver,"..G.PlayerName..","..G.Version, "RAID")
		else 
			local mark, name, ver = string.split(",", message) 
			if mark == "send_ver" then 
				self.raidroster[name] = ver 
			end 
		end 
	end
end)


----------------------------------------------------------
--------------------[[     CMD     ]]---------------------
----------------------------------------------------------

SLASH_ARM1 = "/arm"
SlashCmdList["ARM"] = function(arg)
	if string.upper(arg) == "VER" then
		if IsInRaid() then
			SendAddonMessage("arm_vc", "start_vc", "RAID")
		else
			T.msg(L["请先加入团队"])
		end
	elseif gui:IsShown() then
		gui:Hide()
	else
		gui:Show()
	end
end