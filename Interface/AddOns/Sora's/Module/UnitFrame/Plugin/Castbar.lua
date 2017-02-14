-- Engines
local _, ns = ...
local oUF = ns.oUF or oUF
local S, C, L, DB = unpack(select(2, ...))

-- Begin
S.Castbar = {}

-- special thanks to Allez for coming up with this solution
local channelingTicks = {
        -- warlock
        -- [GetSpellInfo(103103)] = 5, -- drain soul
        [GetSpellInfo(689)] = 5, -- drain life
        [GetSpellInfo(5740)] = 4, -- rain of fire
        -- druid
        [GetSpellInfo(740)] = 4, -- Tranquility
        -- [GetSpellInfo(16914)] = 10, -- Hurricane
        -- priest
        [GetSpellInfo(15407)] = 3, -- mind flay
        [GetSpellInfo(48045)] = 5, -- mind sear
        [GetSpellInfo(47540)] = 2, -- penance
        -- mage
        [GetSpellInfo(5143)] = 5, -- arcane missiles
        -- [GetSpellInfo(10)] = 5, -- blizzard
        [GetSpellInfo(12051)] = 4, -- evocation
        -- shaman
        [GetSpellInfo(61882)] = 8, -- earthquake
        --monk
        [GetSpellInfo(115175)] = 9 -- soothing mists
}

local ticks = {}

S.Castbar.setBarTicks = function(castBar, ticknum)
    if ticknum and ticknum > 0 then
        local delta = castBar:GetWidth() / ticknum
        for k = 1, ticknum do
            if not ticks[k] then
                ticks[k] = castBar:CreateTexture(nil, 'OVERLAY')
                ticks[k]:SetTexture(DB.Statusbar)
                ticks[k]:SetVertexColor(0, 0, 0)
                ticks[k]:SetWidth(1)
                ticks[k]:SetHeight(castBar:GetHeight())
            end
            ticks[k]:ClearAllPoints()
            ticks[k]:SetPoint("CENTER", castBar, "LEFT", delta * k, 0)
            ticks[k]:Show()
        end
    else
        for k, v in pairs(ticks) do
            v:Hide()
        end
    end
end

S.Castbar.OnCastbarUpdate = function(self, elapsed)
    local currentTime = GetTime()
    if self.casting or self.channeling then
        local parent = self:GetParent()
        local duration = self.casting and self.duration + elapsed or self.duration - elapsed
        if (self.casting and duration >= self.max) or (self.channeling and duration <= 0) then
            self.casting = nil
            self.channeling = nil
            return
        end
        if parent.unit == 'player' then
            if self.delay ~= 0 then
                self.Time:SetFormattedText('%.1f / |cffff0000%.1f|r', duration, self.casting and self.max + self.delay or self.max - self.delay)
            else
                self.Time:SetFormattedText('%.1f / %.1f', duration, self.max)
            --self.Lag:SetFormattedText("%d ms", self.SafeZone.timeDiff * 1000)
            end
        else
            self.Time:SetFormattedText('%.1f / %.1f', duration, self.casting and self.max + self.delay or self.max - self.delay)
        end
        self.duration = duration
        self:SetValue(duration)
    -- self.Spark:SetPoint('CENTER', self, 'LEFT', (duration / self.max) * self:GetWidth(), 0)
    else
        -- self.Spark:Hide()
        local alpha = self:GetAlpha() - 0.02
        if alpha > 0 then
            self:SetAlpha(alpha)
        else
            self.fadeOut = nil
            self:Hide()
        end
    end
end

S.Castbar.OnCastSent = function(self, event, unit, spell, rank)
    if self.unit ~= unit or not self.Castbar.SafeZone then return end
    self.Castbar.SafeZone.sendTime = GetTime()
end

S.Castbar.PostCastStart = function(self, unit, name, rank, text)
    local pcolor = {255 / 255, 128 / 255, 128 / 255}
    local interruptcb = {95 / 255, 182 / 255, 255 / 255}
    self:SetAlpha(1.0)
    -- self.Spark:Show()
    self:SetStatusBarColor(unpack(self.casting and self.CastingColor or self.ChannelingColor))
    if unit == "player" then
        local sf = self.SafeZone
        if sf.sendTime then
            sf.timeDiff = GetTime() - sf.sendTime
            sf.timeDiff = sf.timeDiff > self.max and self.max or sf.timeDiff
            sf:SetWidth(self:GetWidth() * sf.timeDiff / self.max)
            sf:Show()
        end
        if self.casting then
            S.Castbar.setBarTicks(self, 0)
        else
            local spell = UnitChannelInfo(unit)
            self.channelingTicks = channelingTicks[spell] or 0
            S.Castbar.setBarTicks(self, self.channelingTicks)
        end
    elseif (unit == "target" or unit == "focus" or unit == "boss") and not self.interrupt then
        self:SetStatusBarColor(interruptcb[1], interruptcb[2], interruptcb[3], 1)
    else
        self:SetStatusBarColor(pcolor[1], pcolor[2], pcolor[3], 1)
    end
end

S.Castbar.PostCastStop = function(self, unit, name, rank, castid)
    if not self.fadeOut then
        self:SetStatusBarColor(unpack(self.CompleteColor))
        self.fadeOut = true
    end
    self:SetValue(self.max)
    self:Show()
end

S.Castbar.PostChannelStop = function(self, unit, name, rank)
    self.fadeOut = true
    self:SetValue(0)
    self:Show()
end

S.Castbar.PostCastFailed = function(self, event, unit, name, rank, castid)
    self:SetStatusBarColor(unpack(self.FailColor))
    self:SetValue(self.max)
    if not self.fadeOut then
        self.fadeOut = true
    end
    self:Show()
end
