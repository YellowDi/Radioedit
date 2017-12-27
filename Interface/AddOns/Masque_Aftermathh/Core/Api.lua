local A, C, M, L = select(2, ...):unpack()

-------------------------
-- API of AftermathhUI --
-------------------------

local Class = select(2, UnitClass("player"))
local CustomClassColor = A.Colors.class[Class]
local Noop = function() return end

----------
-- Kill --
----------

local function Kill(self)
	if self.UnregisterAllEvents then
		self:UnregisterAllEvents()
	end
	self.Show = Noop
	self:Hide()
end

local function StripTexture(self, Kill)
	for i = 1, self:GetNumRegions() do
		local Region = select(i, self:GetRegions())
		if Region:GetObjectType() == "Texture" then
			if (Kill) then
				Region:Kill()
			else
				Region:SetTexture(nil)
			end
		end
	end
end
	
--------------------
-- Font Templates --
--------------------

local function SetFontTemplate(self, Font, FontSize, ShadowOffsetX, ShadowOffsetY)
	self:SetFont(Font, A.Scale(FontSize), "THINOUTLINE")
	self:SetShadowColor(0, 0, 0, A.Scale(1))
    self:SetShadowOffset(A.Scale(ShadowOffsetX or 1), -A.Scale(ShadowOffsetY or 1))
end

-------------------
-- Size & Points --
-------------------

local function Size(self, width, height)
	self:SetSize(A.Scale(width), A.Scale(height or width))
end

local function Width(self, width)
	self:SetWidth(A.Scale(width))
end

local function Height(self, height)
	self:SetHeight(A.Scale(height))
end

local function Point(self, arg1, arg2, arg3, arg4, arg5)
	if type(arg1)=="number" then arg1 = A.Scale(arg1) end
	if type(arg2)=="number" then arg2 = A.Scale(arg2) end
	if type(arg3)=="number" then arg3 = A.Scale(arg3) end
	if type(arg4)=="number" then arg4 = A.Scale(arg4) end
	if type(arg5)=="number" then arg5 = A.Scale(arg5) end
	
	self:SetPoint(arg1, arg2, arg3, arg4, arg5)
end

local function SetOutside(self, anchor, xOffset, yOffset)
	xOffset = xOffset or 0
	yOffset = yOffset or 0
	anchor = anchor or self:GetParent()

	if self:GetPoint() then self:ClearAllPoints() end

	self:Point("TOPLEFT", anchor, "TOPLEFT", -xOffset, yOffset)
	self:Point("BOTTOMRIGHT", anchor, "BOTTOMRIGHT", xOffset, -yOffset)
end

local function SetInside(self, anchor, xOffset, yOffset)
	xOffset = xOffset or 0
	yOffset = yOffset or 0
	anchor = anchor or self:GetParent()

	if self:GetPoint() then self:ClearAllPoints() end

	self:Point("TOPLEFT", anchor, "TOPLEFT", xOffset, -yOffset)
	self:Point("BOTTOMRIGHT", anchor, "BOTTOMRIGHT", -xOffset, yOffset)
end

------------------------
-- Borders & Backdrop --
------------------------

local function SetTemplate(self, ShadowOverlay, ShadowOverlayWidth, ShadowOverlayHeight, ShadowOverlayAlpha, NoShadow)
	if not (self.HasBorder) then
		local Border = CreateFrame("Frame", nil, self)
		Border:SetInside()
		Border:SetBackdrop({
			edgeFile = "Interface\\Buttons\\WHITE8x8", edgeSize = A.Scale(1)
		})
		Border:SetBackdropBorderColor(unpack(C.General.BorderColor))
		
		local BorderInside = CreateFrame("Frame", nil, self)
		BorderInside:SetInside(self, 1, 1)
		BorderInside:SetBackdrop({
			edgeFile = "Interface\\Buttons\\WHITE8x8", edgeSize = A.Scale(1)
		})
		BorderInside:SetBackdropBorderColor(0, 0, 0, 1)

		local BorderOutside = CreateFrame("Frame", nil, self)
		BorderOutside:SetOutside(self, 1, 1)
		BorderOutside:SetBackdrop({
			edgeFile = "Interface\\Buttons\\WHITE8x8", edgeSize = A.Scale(1)
		})
		BorderOutside:SetBackdropBorderColor(0, 0, 0, 1)
		
		local Shadow = CreateFrame("Frame", nil, self)
		Shadow:SetOutside(self, 3, 3)
		--Shadow:SetFrameLevel(self:GetFrameLevel() - 1)
		Shadow:SetBackdrop({
			edgeFile = C.Media.Shadow, edgeSize = A.Scale(3),
		})
		Shadow:SetBackdropBorderColor(unpack(C.General.ShadowAlpha))

		if (NoShadow) then
			Shadow:SetBackdrop( {
				edgeFile = 0, edgeSize = 0,
			})
			Shadow:SetBackdropBorderColor(0, 0, 0, 0)
		end
		
		if (ShadowOverlay) then
			local ShadowOverlay = self:CreateTexture(nil, "OVERLAY", 7)
			ShadowOverlay:SetInside(self, 2, 2)
			ShadowOverlay:Width(ShadowOverlayWidth or 33)
			ShadowOverlay:Height(ShadowOverlayHeight or 33)
			ShadowOverlay:SetTexture(C.Media.BorderOverlay)
			ShadowOverlay:SetVertexColor(1, 1, 1, ShadowOverlayAlpha or 0.55)
		end
		
		self.Border = Border
		self.BorderInside = BorderInside
		self.BorderOutside = BorderOutside
		self.Shadow = Shadow
		self.ShadowOverlay = ShadowOverlay
		
		self.HasBorder = true
	end
end

local function SetColorTemplate(self, R, G, B, A)
	self.Border:SetBackdropBorderColor(R, G, B, A)
end

local function CreateShadow(self)
	if (self.Shadow) then
	    return
	end

	local Shadow = CreateFrame("Frame", nil, self)
	Shadow:SetOutside(self, 3, 3)
	Shadow:SetFrameLevel(self:GetFrameLevel() - 1)
	Shadow:SetBackdrop({
		edgeFile = C.Media.Shadow, edgeSize = A.Scale(3),
	})
	Shadow:SetBackdropBorderColor(unpack(C.General.ShadowAlpha))
	
	self.Shadow = Shadow
end

local function CreateBackdrop(self, Texture, Shadows, NoBorder)
	if (self.Backdrop) then
	    return
	end
	
	if (Texture) then
		self:SetBackdrop({
			bgFile = C.Media.Texture2,
		})
		self:SetBackdropColor(unpack(C.General.PanelColor))
	else
		self:SetBackdrop({
			bgFile = "Interface\\Buttons\\WHITE8x8",
		})
		self:SetBackdropColor(unpack(C.General.BackdropColor))
	end

	local Backdrop = CreateFrame("Frame", nil, self)
	Backdrop:SetOutside()
	Backdrop:SetTemplate(nil, nil, nil, nil, Shadows)

	self.Backdrop = Backdrop
end

----------------------
-- ActionBars Style --
----------------------

local function CreateButtonPanel(self, ButtonOverlay, ButtonSize, ButtonSize, Shadows)
	if (self.ButtonPanel) then
		return
	end

	local ButtonPanel = CreateFrame("Frame", nil, self)
	ButtonPanel:SetOutside()
	ButtonPanel:SetFrameLevel(self:GetFrameLevel() + 1)
	ButtonPanel:SetTemplate(ButtonOverlay, ButtonSize, ButtonSize, nil, Shadows)

	self.ButtonPanel = ButtonPanel
end

local function CreateButtonBackdrop(self)
	if (self.ButtonBG) then
		return
	end

	local ButtonBG = CreateFrame("Frame", nil, self)
	ButtonBG:SetInside(self, 2, 2)
	ButtonBG:SetFrameLevel(self:GetFrameLevel() - 1)
	ButtonBG:SetBackdrop({
		bgFile = C.Media.Backdrop,
		insets = {top = A.Scale(-4), left = A.Scale(-4), bottom = A.Scale(-4), right = A.Scale(-4)},
	})
	
	self.ButtonBG = ButtonBG
end

local function StyleButton(self)
	if (self.SetHighlightTexture and not self.Highlight) then
		local Highlight = self:CreateTexture()
		Highlight:SetColorTexture(unpack(C.ActionBars.HighlightColor))
		Highlight:SetInside(self)
		self.Highlight = Highlight
		self:SetHighlightTexture(Highlight)
	end

	if (self.SetPushedTexture and not self.Pushed) then
		local Pushed = self:CreateTexture()
		Pushed:SetColorTexture(unpack(C.ActionBars.PushedColor))
		Pushed:SetInside()
		self.Pushed = Pushed
		self:SetPushedTexture(Pushed)
	end

	if (self.SetCheckedTexture and not self.Checked) then
		local Checked = self:CreateTexture()
		Checked:SetColorTexture(unpack(C.ActionBars.CheckedColor))
		Checked:SetInside()
		self.Checked = Checked
		self:SetCheckedTexture(Checked)
	end

	local Cooldown = self:GetName() and _G[self:GetName().."Cooldown"]
	if (Cooldown) then
		Cooldown:ClearAllPoints()
		Cooldown:SetInside()
		Cooldown:SetDrawEdge(true)
	end
end

local function StyleExtraButton(self)
	if (self.SetHighlightTexture and not self.Highlight) then
		local Highlight = self:CreateTexture()
		Highlight:SetColorTexture(unpack(C.ActionBars.HighlightColor))
		Highlight:SetInside(self, 2, 2)
		self.Highlight = Highlight
		self:SetHighlightTexture(Highlight)
	end

	if (self.SetPushedTexture and not self.Pushed) then
		local Pushed = self:CreateTexture()
		Pushed:SetColorTexture(unpack(C.ActionBars.PushedColor))
		Pushed:SetInside(self, 2, 2)
		self.Pushed = Pushed
		self:SetPushedTexture(Pushed)
	end

	if (self.SetCheckedTexture and not self.Checked) then
		local Checked = self:CreateTexture()
		Checked:SetColorTexture(unpack(C.ActionBars.CheckedColor))
		Checked:SetInside(self, 2, 2)
		self.Checked = Checked
		self:SetCheckedTexture(Checked)
	end

	local Cooldown = self:GetName() and _G[self:GetName().."Cooldown"]
	if (Cooldown) then
		Cooldown:ClearAllPoints()
		Cooldown:SetInside(self, 2, 2)
		Cooldown:SetDrawEdge(true)
	end
end

--------------
-- Skinning --
--------------

local function SkinButton(self, Shadows)
	self:SetNormalTexture("")
	self:SetHighlightTexture("")
	self:SetPushedTexture("")
	self:SetDisabledTexture("")

	if self.Left then self.Left:SetAlpha(0) end
	if self.Middle then self.Middle:SetAlpha(0) end
	if self.Right then self.Right:SetAlpha(0) end
	if self.LeftSeparator then self.LeftSeparator:SetAlpha(0) end
	if self.RightSeparator then self.RightSeparator:SetAlpha(0) end

	self:CreateBackdrop(true, Shadows)
	
	self:HookScript("OnEnter", function() self.Backdrop:SetColorTemplate(unpack(CustomClassColor)) end)
	self:HookScript("OnLeave", function() self.Backdrop:SetColorTemplate(unpack(C.General.BorderColor)) end)
end

local function SkinCloseButton(self, OffsetX, OffsetY, CloseSize)		
	self:SetNormalTexture("")
	self:SetPushedTexture("")
	self:SetHighlightTexture("")
	self:SetDisabledTexture("")
	
	self:Size(CloseSize or 16, CloseSize or 16)
	self:ClearAllPoints()
	self:Point("TOPRIGHT", OffsetX or 0, OffsetY or 0)
	self:CreateBackdrop()
	
	--CloseButtonBackdrop = CreateFrame("Frame", nil, self)
	--CloseButtonBackdrop:Point("TOPLEFT", 7, -8)
	--CloseButtonBackdrop:Point("BOTTOMRIGHT", -8, 8)
	--CloseButtonBackdrop:CreateBackdrop()
	
	local CloseButtonFont = self:CreateFontString(nil, "OVERLAY")
	CloseButtonFont:SetFontTemplate(C.Media.Font, 12)
	CloseButtonFont:Point("CENTER", 1, 1)
	CloseButtonFont:SetText("x")
	
	self:HookScript("OnEnter", function(self) CloseButtonFont:SetTextColor(1, 0, 0) self.Backdrop:SetColorTemplate(1, 0, 0) end)
	self:HookScript("OnLeave", function(self) CloseButtonFont:SetTextColor(1, 1, 1) self.Backdrop:SetColorTemplate(unpack(C.General.BorderColor)) end)
end

--------------------------------
-- Merge our API with WoW API --
--------------------------------

local function AddAPI(object)
	local mt = getmetatable(object).__index
	
	-- Kill
	if not object.Kill then mt.Kill = Kill end
	if not object.StripTexture then mt.StripTexture = StripTexture end
	
	-- Font
	if not object.SetFontTemplate then mt.SetFontTemplate = SetFontTemplate end

	-- Size & Point
	if not object.Size then mt.Size = Size end
	if not object.Width then mt.Width = Width end
	if not object.Height then mt.Height = Height end
	if not object.Point then mt.Point = Point end
	if not object.SetOutside then mt.SetOutside = SetOutside end
	if not object.SetInside then mt.SetInside = SetInside end
	
	-- Borders & Backdrop
	if not object.SetTemplate then mt.SetTemplate = SetTemplate end
	if not object.SetColorTemplate then mt.SetColorTemplate = SetColorTemplate end
	if not object.CreateShadow then mt.CreateShadow = CreateShadow end
	if not object.CreateBackdrop then mt.CreateBackdrop = CreateBackdrop end
	
	-- ActionBars
	if not object.CreateButtonPanel then mt.CreateButtonPanel = CreateButtonPanel end
	if not object.CreateButtonBackdrop then mt.CreateButtonBackdrop = CreateButtonBackdrop end
	if not object.StyleButton then mt.StyleButton = StyleButton end
	if not object.StyleExtraButton then mt.StyleExtraButton = StyleExtraButton end
	
	-- Skining
	if not object.SkinButton then mt.SkinButton = SkinButton end
	if not object.SkinCloseButton then mt.SkinCloseButton = SkinCloseButton end
end

local Handled = {["Frame"] = true}

local Object = CreateFrame("Frame")
AddAPI(Object)
AddAPI(Object:CreateTexture())
AddAPI(Object:CreateFontString())

Object = EnumerateFrames()

while Object do
	if not Object:IsForbidden() and not Handled[Object:GetObjectType()] then
		AddAPI(Object)
		Handled[Object:GetObjectType()] = true
	end
	Object = EnumerateFrames(Object)
end