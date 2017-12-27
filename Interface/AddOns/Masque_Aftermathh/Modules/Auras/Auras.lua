local A, C, M, L = select(2, ...):unpack()

local CustomAuras = CreateFrame("Frame")

local BuffSize = 32
local DebuffSize = 34
local BuffsPerRow = 12
local SortMethod = "TIME"
local SortDirection = "-"

CustomAuras.Headers = {}

function CustomAuras:DisableBlizzardAuras()
	BuffFrame:Kill()
	TemporaryEnchantFrame:Kill()
end

function CustomAuras:StartOrStopFlash(TimeLeft)
	if (TimeLeft < 30) then
		if(not self:IsPlaying()) then
			self:Play()
		end
	elseif (self:IsPlaying()) then
		self:Stop()
	end
end

function CustomAuras:OnUpdate(elapsed)
	local TimeLeft

	if (self.Enchant) then
		local Expiration = select(self.Enchant, GetWeaponEnchantInfo())

		if(Expiration) then
			TimeLeft = Expiration / 1e3
		else
			TimeLeft = 0
		end
	else
		TimeLeft = self.TimeLeft - elapsed
	end

	self.TimeLeft = TimeLeft

	if (TimeLeft <= 0) then
		self.TimeLeft = nil
		self.Duration:SetText("")
		
		if (self.Enchant) then
			self.Dur = nil
		end

		return self:SetScript("OnUpdate", nil)
	else
		if (TimeLeft < 60.5) then
			if (C.Auras.Flash) then
				CustomAuras.StartOrStopFlash(self.Animation, TimeLeft)
			end
		else
			if self.Animation and self.Animation:IsPlaying() then
				self.Animation:Stop()
			end
		end
		
		if (10 > self.TimeLeft) then
			self.Duration:SetVertexColor(unpack(C.Cooldowns.ExpireColor))
		elseif (30 > self.TimeLeft) then	
			self.Duration:SetVertexColor(unpack(C.Cooldowns.SecondsColor))
		elseif (60 > self.TimeLeft) then
			self.Duration:SetVertexColor(unpack(C.Cooldowns.SecondsColor2))
		else 
			self.Duration:SetVertexColor(unpack(C.Cooldowns.NormalColor))
		end
		
		local Text = A.FormatTime(self.TimeLeft)
		self.Duration:SetText(Text)
	end
end

function CustomAuras:UpdateAura(index)
	local Name, Rank, Texture, Count, DType, Duration, ExpirationTime, Caster, IsStealable, ShouldConsolidate, SpellID, CanApplyAura, IsBossDebuff = UnitAura(self:GetParent():GetAttribute("unit"), index, self.Filter)

	if (Name) then		
		if (Duration > 0 and ExpirationTime and not ShouldConsolidate) then
			local TimeLeft = ExpirationTime - GetTime()
	
			if (not self.TimeLeft) then
				self.TimeLeft = TimeLeft
				self:SetScript("OnUpdate", CustomAuras.OnUpdate)
			else
				self.TimeLeft = TimeLeft
			end

			self.Dur = Duration

			if (C.Auras.Flash) then
				CustomAuras.StartOrStopFlash(self.Animation, TimeLeft)
			end
		else
			if (C.Auras.Flash) then
				self.Animation:Stop()
			end

			self.TimeLeft = nil
			self.Dur = nil
			self.Duration:SetText("")
			self:SetScript("OnUpdate", nil)
		end

		if (Count > 1) then
			self.Count:SetText(Count)
		else
			self.Count:SetText("")
		end

		if (self.Filter == "HARMFUL") then
			local Color = DebuffTypeColor[DType or "none"]
			self:SetColorTemplate(Color.r, Color.g, Color.b)
		end

		self.Icon:SetTexture(Texture)
	end
end

function CustomAuras:UpdateTempEnchant(slot)
	local Enchant = (slot == 16 and 2) or 6
	local Expiration = select(Enchant, GetWeaponEnchantInfo())
	local Icon = GetInventoryItemTexture("player", slot)

	if (Expiration) then
		if not (self.Dur) then
			self.Dur = Expiration / 1e3
		end

		self.Enchant = Enchant
		self:SetScript("OnUpdate", CustomAuras.OnUpdate)
	else
		self.Dur = nil
		self.Enchant = nil
		self.TimeLeft = nil
		self:SetScript("OnUpdate", nil)
	end

	if (Icon) then
		self:SetAlpha(1)
		self.Icon:SetTexture(Icon)
	else
		self:SetAlpha(0)
	end
end

function CustomAuras:OnAttributeChanged(attribute, value)
	if (attribute == "index") then
		return CustomAuras.UpdateAura(self, value)
	elseif (attribute == "target-slot") then
		return CustomAuras.UpdateTempEnchant(self, value)
	end
end

function CustomAuras:Skin()
	local Icon = self:CreateTexture(nil, "BORDER")
	Icon:SetInside()
	Icon:SetTexCoord(unpack(A.TexCoords))
	
	local Duration = self:CreateFontString(nil, "OVERLAY")
	Duration:Point("BOTTOM", self, 1, -16)
	Duration:SetFontTemplate(C.Media.Font2, 12)
	
	local Count = self:CreateFontString(nil, "OVERLAY")
	Count:Point("BOTTOMRIGHT", self, -1, 4)
	Count:SetFontTemplate(C.Media.Font2, 12)

	if (C.Auras.Flash) then
		local Animation = self:CreateAnimationGroup()
		Animation:SetLooping("BOUNCE")

		local FadeOut = Animation:CreateAnimation("Alpha")
		FadeOut:SetFromAlpha(1)
		FadeOut:SetToAlpha(0.6)
		FadeOut:SetDuration(0.8)
		FadeOut:SetSmoothing("IN_OUT")

		self.Animation = Animation
	end

	self.Icon = Icon
	self.Duration = Duration
	self.Count = Count
	self.Filter = self:GetParent():GetAttribute("filter")
	
	self:SetTemplate(true, self:GetWidth(), self:GetHeight())
	self:StyleButton()

	self:SetScript("OnAttributeChanged", CustomAuras.OnAttributeChanged)
end

CustomAuras.HeaderNames = {
	"CustomBuffsHeaders",
	"CustomDebuffsHeaders",
}

function CustomAuras:CreateHeaders()
	local Headers = CustomAuras.Headers

	for i = 1, 2 do
		local Header = CreateFrame("Frame", CustomAuras.HeaderNames[i], UIParent, "SecureAuraHeaderTemplate")	
		Header:SetAttribute("unit", "player")
		Header:SetAttribute("template", "CustomAuraTemplate")
		Header:SetAttribute("sortMethod", SortMethod)
		--Header:SetAttribute("sortDirection", SortDirection)
		Header:SetAttribute("point", "TOPRIGHT")
		Header:SetAttribute("wrapAfter", BuffsPerRow)
		Header:SetAttribute("minHeight", BuffSize)
		Header:SetAttribute("minWidth", BuffSize)
		Header:SetAttribute("wrapXOffset", 0)
		Header:SetAttribute("wrapYOffset", -A.Scale(73.5))
		Header:SetAttribute("xOffset", -A.Scale(38))
		Header:SetAttribute("yOffset", 0)
	
		Header:SetSize(BuffSize, BuffSize)
		Header:SetClampedToScreen(true)
		Header:SetFrameStrata("BACKGROUND")

		RegisterAttributeDriver(Header, "unit", "[vehicleui] vehicle; player")
	
		table.insert(Headers, Header)
	end
	
	local Buffs = Headers[1]
	local Debuffs = Headers[2]

	Buffs:SetAttribute("filter", "HELPFUL")
	Buffs:SetAttribute("includeWeapons", 1)
	Buffs:SetAttribute("consolidateDuration", -1)
	Buffs:SetAttribute("consolidateTo", 0)

	Buffs:SetPoint("TOPRIGHT", UIParent, -6, -18)
	Buffs:Show()

	Debuffs:SetAttribute("filter", "HARMFUL")
	Debuffs:SetPoint("TOPRIGHT", UIParent, -6, -162)
	Debuffs:Show()
end

function CustomAuras:HeadersUpdate()
	for _, Header in next, CustomAuras.Headers do
		local Child = Header:GetAttribute("child1")
		local i = 1
		while(Child) do
			CustomAuras.UpdateAura(Child, Child:GetID())

			i = i + 1
			Child = Header:GetAttribute("child" .. i)
		end
	end
end

function CustomAuras:Enable()
	if not (C.Auras.AuraMod) then
		return
	end

	self:DisableBlizzardAuras()
	self:CreateHeaders()
	
	local Update = CreateFrame("Frame")
	Update:RegisterEvent("PLAYER_ENTERING_WORLD")
	Update:SetScript("OnEvent", function(self, event)
		CustomAuras:HeadersUpdate()
	end)
end

CustomAuras:RegisterEvent("PLAYER_LOGIN")
CustomAuras:RegisterEvent("PLAYER_ENTERING_WORLD")
CustomAuras:RegisterEvent("ADDON_LOADED")

CustomAuras:SetScript("OnEvent", function(self, event)
    if (event == "PLAYER_LOGIN") then
		CustomAuras:Enable()
	end
end)

A["Auras"] = CustomAuras