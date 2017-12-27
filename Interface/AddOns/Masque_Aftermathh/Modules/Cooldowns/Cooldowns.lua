local A, C, M, L = select(2, ...):unpack()

if C.Cooldowns.CooldownMod then else return end

local CD = {}
local ActionButtonEF = _G["ActionBarButtonEventsFrame"]
local ActionButtonCD = _G["ActionButton1Cooldown"] 

local ICON_SIZE = 36
local MIN_SCALE = 0.5
local MIN_DURATION = 1.5

local function TimerStop(self)
	self.Enabled = nil
	self:Hide()
end

local function TimerForceUpdate(self)
	self.NextUpdate = 0
	self:Show()
end

local function TimerOnSizeChanged(self, Width)
	local FontScale = floor(Width +.5) / ICON_SIZE
	if (FontScale == self.FontScale) then
		return
	end
	
	self.FontScale = FontScale

	if (FontScale < MIN_SCALE) then
		self:Hide()
	else
		self.Text:SetFontTemplate(C.Media.Font2, FontScale * C.Cooldowns.FontSize)

		if (self.Enabled) then
			TimerForceUpdate(self)
		end
	end
end

local function TimerOnUpdate(self, Elapsed)
	if (self.NextUpdate > 0) then
		self.NextUpdate = self.NextUpdate - Elapsed
		return
	end
	
	local TimeLeft = self.Duration - (GetTime() - self.Start)

	if (TimeLeft > 0.05) then
		if (self.FontScale * self:GetEffectiveScale() / UIParent:GetScale()) < MIN_SCALE then
			self.Text:SetText("")
			self.NextUpdate = 500
		else
			local TimeText = A.FormatTime(TimeLeft)
			self.Text:SetText(TimeText)
		end
	
		if (TimeLeft <= 10) then
			self.Text:SetTextColor(unpack(C.Cooldowns.ExpireColor))
		elseif (TimeLeft <= 30) then
			self.Text:SetTextColor(unpack(C.Cooldowns.SecondsColor))
		elseif (TimeLeft <= 60) then
			self.Text:SetTextColor(unpack(C.Cooldowns.SecondsColor2))
		else
			self.Text:SetTextColor(unpack(C.Cooldowns.NormalColor))
		end
	else
		TimerStop(self)
	end
end

local function TimerCreate(self)
	local Scaler = CreateFrame("Frame", nil, self)
	Scaler:SetAllPoints(self)

	local Timer = CreateFrame("Frame", nil, Scaler) 
	Timer:Hide()
	Timer:SetAllPoints(Scaler)
	Timer:SetFrameStrata("HIGH")
	Timer:SetScript("OnUpdate", TimerOnUpdate)

	local Text = Timer:CreateFontString(nil, "OVERLAY")
	Text:Point("CENTER", Timer, 1, 0)
	Timer.Text = Text

	TimerOnSizeChanged(Timer, Scaler:GetSize())
	Scaler:SetScript("OnSizeChanged", function(self, ...) TimerOnSizeChanged(Timer, ...) end)

	self.Timer = Timer
	return Timer
end

local function TimerStart(self, Start, Duration)
	if (self.noOCC) then 
		return 
	end
	
	if (Start > 0 and Duration > MIN_DURATION) then
		local Timer = self.Timer or TimerCreate(self)
		Timer.Start = Start
		Timer.Duration = Duration
		Timer.Enabled = true
		Timer.NextUpdate = 0
		
		if (Timer.FontScale >= MIN_SCALE) then 
			Timer:Show() 
		end
	else
		local Timer = self.Timer
		if (Timer) then
			TimerStop(Timer)
		end
	end
end

hooksecurefunc(getmetatable(ActionButtonCD).__index, "SetCooldown", TimerStart)

local function CooldownOnShow(self)
	CD[self] = true
end

local function CooldownOnHide(self)
	CD[self] = nil
end

local function CooldownShouldUpdateTimer(self, Start, Duration)
	local Timer = self.Timer
	if not (Timer) then return true end
	return Timer.Start ~= Start
end

local function CooldownUpdate(self)
	local Button = self:GetParent()
	local Start, Duration, Enable = GetActionCooldown(Button.action)

	if CooldownShouldUpdateTimer(self, Start, Duration) then
		TimerStart(self, Start, Duration)
	end
end

local EventWatcher = CreateFrame("Frame")
EventWatcher:RegisterEvent("ACTIONBAR_UPDATE_COOLDOWN")
EventWatcher:SetScript("OnEvent", function(self, event)
	for Cooldown in pairs(CD) do
		CooldownUpdate(Cooldown)
	end
end)

local function ActionButtonRegister(self)
	local Cooldown = self.cooldown
	if not (Cooldown.IsHooked) then
		Cooldown:HookScript("OnShow", CooldownOnShow)
		Cooldown:HookScript("OnHide", CooldownOnHide)
	
		Cooldown.IsHooked = true
	end
end

if (ActionButtonEF.frames) then
	for i, Frame in pairs(ActionButtonEF.frames) do
		ActionButtonRegister(Frame)
	end
end

hooksecurefunc("ActionBarButtonEventsFrame_RegisterFrame", ActionButtonRegister)