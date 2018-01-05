local T, C, L, G = unpack(select(2, ...))

local addon_name = G.addon_name
local font = G.Font

T.msg = function(msg)
	print(G.addon_cname.." >"..msg)
end

local day, hour, minute = 86400, 3600, 60
T.FormatTime = function(s)
    if s >= day then
        return format("%dd", floor(s/day + 0.5))
    elseif s >= hour then
        return format("%dh", floor(s/hour + 0.5))
    elseif s >= minute then
        return format("%dm", floor(s/minute + 0.5))
    end

    return format("%ds", math.fmod(s, minute))
end

T.pairsByKeys = function(t)
    local a = {}
    for n in pairs(t) do table.insert(a, n) end
    table.sort(a)
    local i = 0      -- iterator variable
    local iter = function ()   -- iterator function
		i = i + 1
        if a[i] == nil then return nil
        else return a[i], t[a[i]]
        end
      end
    return iter
end

T.ColorName = function(name)
	if UnitClass(name) then
		return ("|c%s%s|r"):format(G.Ccolors[select(2, UnitClass(name))]["colorStr"], name)
	else
		return name
	end
end

T.SendChatMsg = function(msg, channel, rp)
	SendChatMessage(msg, channel)
	if rp then
		for i = 1, rp do
			C_Timer.After(i, function() SendChatMessage(msg, channel) end)
		end
	end
end

T.CreateIconBD = function(f, icon)
	local iconbd = f:CreateTexture(nil, "BORDER")
	iconbd:SetColorTexture(0, 0, 0)
	iconbd:SetPoint("TOPLEFT", icon, "TOPLEFT", -1, 1)
	iconbd:SetPoint("BOTTOMRIGHT", icon, "BOTTOMRIGHT", 1, -1)
end

T.createborder = function(frame, r, g, b)
	if frame.style then return end
	
	local lvl = frame:GetFrameLevel()
	frame.sd = CreateFrame("Frame", nil, frame)
	frame.sd:SetFrameLevel(lvl == 0 and 1 or lvl - 1)
	frame.sd:SetBackdrop({
		bgFile = "Interface\\Buttons\\WHITE8x8",
		edgeFile = "Interface\\Buttons\\WHITE8x8",
		edgeSize = 1,
			insets = { left = 1, right = 1, top = 1, bottom = 1,}
		})
	frame.sd:SetPoint("TOPLEFT", frame, -1, 1)
	frame.sd:SetPoint("BOTTOMRIGHT", frame, 1, -1)
	if not (r and g and b) then
		frame.sd:SetBackdropColor(.05, .05, .05, .5)
		frame.sd:SetBackdropBorderColor(0, 0, 0)
	else
		frame.sd:SetBackdropColor(r, g, b, .5)
		frame.sd:SetBackdropBorderColor(r, g, b)
	end
	frame.style = true
end

T.createbdframe = function(f)
	local lvl = f:GetFrameLevel()

	local bg = CreateFrame("Frame", nil, f)
	bg:SetPoint("TOPLEFT", f, -1, 1)
	bg:SetPoint("BOTTOMRIGHT", f, 1, -1)
	bg:SetFrameLevel(lvl == 0 and 1 or lvl - 1)

	bg:SetBackdrop({
		bgFile = "Interface\\Buttons\\WHITE8x8",
		edgeFile = "Interface\\Buttons\\WHITE8x8",
		edgeSize = 1,
			insets = { left = 1, right = 1, top = 1, bottom = 1,}
		})
		
	bg:SetBackdropColor(.05, .05, .05, .5)
	bg:SetBackdropBorderColor(0, 0, 0)
	
	return bg
end

T.createtext = function(frame, layer, fontsize, flag, justifyh, shadow)
	local text = frame:CreateFontString(nil, layer)
	text:SetFont(font, fontsize, flag)
	text:SetJustifyH(justifyh)
	
	if shadow then
		text:SetShadowColor(0, 0, 0)
		text:SetShadowOffset(1, -1)
	end
	
	return text
end

T.createUIPanelButton = function(parent, name, width, height, text)
	local button = CreateFrame("Button", name, parent)
	button:SetSize(width, height)
	T.createborder(button)	
	
	button.text = T.createtext(button, "OVERLAY", 12, "OUTLINE", "CENTER")
	button.text:SetText(text)
	button.text:SetPoint("CENTER")

	button:SetScript("OnEnter", function()
		button.text:SetTextColor(1, 1, 0)
		button.sd:SetBackdropColor(1, 1, 0, 0.2)
		button.sd:SetBackdropBorderColor(1, 1, 0)
	end)
 	button:SetScript("OnLeave", function()
		button.text:SetTextColor(1, 1, 1)
		button.sd:SetBackdropColor(0, 0, 0, .3)
		button.sd:SetBackdropBorderColor(0, 0, 0)
	end)
	
	return button
end

T.createStatusbar = function(parent, layer, height, width, r, g, b, alpha, name)
	local bar = CreateFrame("StatusBar", name, parent)
	if height then
		bar:SetHeight(height)
	end
	if width then
		bar:SetWidth(width)
	end

	bar:SetStatusBarTexture(G.media.blank)
	bar:SetStatusBarColor(r, g, b, alpha)

	--bar.bg = bar:CreateTexture(nil, "BACKGROUND")
	--bar.bg:SetColorTexture(0, 0, 0, 0.3)
	--bar.bg:SetAllPoints(true)

	bar:GetStatusBarTexture():SetHorizTile(false)
	bar:GetStatusBarTexture():SetVertTile(false)

	return bar
end

T.createbu = function(parent, share, name)
	local bu = T.createUIPanelButton(parent, G.addon_name..share.."_bu", 100, 25, L["共享配置"])
	bu:SetPoint("BOTTOM", parent, "BOTTOM", 0, 30)

	bu:SetScript("OnClick", function()
		if InCombatLockdown() then
			T.msg(L["脱战共享"])
		elseif not IsInRaid() then
			T.msg(L["入团共享"])
		else
			local sharestr = share
			for k, j in pairs(ARM_CDB[share]) do
				for i, v in pairs(j) do
					sharestr = sharestr.."^"..k.."~"..i.."~"..v
				end
			end
			SendAddonMessage("arm_share", sharestr, "RAID")		
		end
	end)

	bu:RegisterEvent("CHAT_MSG_ADDON")
	bu:SetScript("OnEvent", function(self, event, ...)	
		if event == "CHAT_MSG_ADDON" then
			local prefix, message, channel, sender = ... 
			if prefix == "arm_share" then		
				local optionlines = {string.split("^", message)}
				local share_title = optionlines[1]
				if share_title == share then
					if G.PlayerName == string.split("-", sender) then 
						T.msg(L["已共享"])
					else
						StaticPopupDialogs[G.addon_name.."Import Confirm"].text = format(L["导入确认"], name, sender)
						StaticPopupDialogs[G.addon_name.."Import Confirm"].OnAccept = function()
							for i = 2, #optionlines do
								local k, j, v = string.split("~", optionlines[i])
								if ARM_CDB[share][tonumber(k)][tonumber(j)] then
									ARM_CDB[share][tonumber(k)][tonumber(j)] = v
								end
							end
							parent:Hide()
							parent:Show()
						end
						StaticPopup_Show(G.addon_name.."Import Confirm")
					end
				end
			end
		end
	end)
end