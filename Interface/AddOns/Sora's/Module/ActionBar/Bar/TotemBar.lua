-- Engine
local S, C, L, DB = unpack(select(2, ...))

-- Variables
local archon, totems, spells = nil, nil, nil
local totemIDs = {
    210643, -- 图腾掌握
    2484, -- 地缚图腾
    5394, -- 治疗之泉图腾
    98008, -- 灵魂连接图腾
    108280, -- 治疗之潮图腾
    192077, -- 狂风图腾
    192058, -- 闪电奔涌图腾
    51485, -- 陷地图腾
    196932, -- 巫毒图腾
    207399, -- 先祖护佑图腾
    198838, -- 大地之盾图腾
    157153, -- 暴雨图腾
    192222, -- 岩浆图腾
}

-- Begin
local function OnLeave(self, ...)
    GameTooltip_Hide()
end

local function OnEnter(self, ...)
    if self.spellID then
        GameTooltip:Hide()
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT", 0, 0)
        
        GameTooltip:ClearLines()
        GameTooltip:SetSpellByID(self.spellID)
        GameTooltip:Show()
    end
end

local function OnUpdate(self, elapsed, ...)
    local expires = self.start + self.duration - GetTime()
    
    if expires > 0 then
        self.bar:Show()
        self.bar:SetValue(expires)
    else
        self.bar:Hide()
        self:SetScript("OnUpdate", nil)
    end
end

local function UpdateTotems(self, ...)
    for i = 1, MAX_TOTEMS do
        local haveTotem, name, start, duration, icon = GetTotemInfo(i)
        
        for k, v in pairs(totems) do
            if v.name == name then
                local cdstart, cdduration = GetSpellCooldown(v.spellID)
                
                v.i = i
                v.start = start
                v.duration = duration
                
                v.bar:SetMinMaxValues(0, duration)
                v.cooldown:SetCooldown(cdstart, cdduration)
                v.icon:SetTexture(GetSpellTexture(v.spellID))
                
                v:SetScript("OnUpdate", OnUpdate)
            end
        end
    end
end

local function SetArchon(self, ...)
    archon = CreateFrame("Frame", nil, UIParent)
    archon:SetPoint("BOTTOMLEFT", MultiBarBottomRightButton1, "TOPLEFT", 0, C.ActionBar.Space)
    archon:SetSize(C.ActionBar.Size * MAX_TOTEMS + C.ActionBar.Space * (MAX_TOTEMS - 1), C.ActionBar.Size)
end

local function SetTotems(self, ...)
    totems, spells = {}, {}
    
    for k, v in pairs(totemIDs) do
        if IsSpellKnown(v) then
            table.insert(spells, v)
        end
    end
    
    for k, v in pairs(spells) do
        local name, rank, icon, castingTime, minRange, maxRange, spellID = GetSpellInfo(v)
        
        local totem = CreateFrame("Button", nil, archon, "SecureActionButtonTemplate")
        totem:SetSize(C.ActionBar.Size, C.ActionBar.Size)
        
        totem.icon = totem:CreateTexture(nil, "OVERLAY")
        totem.icon:SetAllPoints()
        totem.icon:SetTexture(GetSpellTexture(v))
        totem.icon:SetTexCoord(0.08, 0.92, 0.08, 0.92)
        
        totem.bar = CreateFrame("StatusBar", nil, totem)
        totem.bar:Hide()
        totem.bar:SetSize(totem:GetWidth(), 4)
        totem.bar:SetStatusBarTexture(DB.Statusbar)
        totem.bar:SetPoint("BOTTOM", totem, "TOP", 0, 4)
        totem.bar:SetStatusBarColor(RAID_CLASS_COLORS["SHAMAN"].r, RAID_CLASS_COLORS["SHAMAN"].g, RAID_CLASS_COLORS["SHAMAN"].b)
        
        totem.bar.bg = CreateFrame("StatusBar", nil, totem.bar)
        totem.bar.bg:SetAllPoints()
        totem.bar.bg:SetFrameLevel(0)
        totem.bar.bg:SetStatusBarTexture(DB.Statusbar)
        totem.bar.bg:SetStatusBarColor(0.12, 0.12, 0.12)
        
        totem.cooldown = CreateFrame("Cooldown", nil, totem, "CooldownFrameTemplate")
        totem.cooldown:SetAllPoints()
        
        totem.name = name
        totem.spellID = spellID
        
        totem.shadow = S.MakeShadow(totem, 2)
        totem.bar.shadow = S.MakeShadow(totem.bar, 2)
        
        totem:SetScript("OnLeave", OnLeave)
        totem:SetScript("OnEnter", OnEnter)
        
        totem:SetAttribute("type", "macro")
        totem:SetAttribute("macrotext", "/cast " .. name)
        
        if k == 1 then
            totem:SetPoint("LEFT", archon, "LEFT", 0, 0)
        else
            totem:SetPoint("LEFT", totems[k - 1], "RIGHT", C.ActionBar.Space, 0)
        end
        
        totems[k] = totem
    end
end

local function OnPlayerLogin(self, event, ...)
    SetArchon()
    SetTotems()
end

local function OnPlayerTotemUpdate(self, event, ...)
    UpdateTotems(self, ...)
end

local function OnPlayerTalentUpdate(self, event, ...)
    if totems and #totems > 0 and not UnitAffectingCombat("player") then
        for k, v in pairs(totems) do
            v:Hide()
            v:ClearAllPoints()
        end
        
        SetTotems()
    end
end

-- Event
local Event = CreateFrame("Frame")
Event:RegisterEvent("PLAYER_LOGIN")
Event:RegisterEvent("PLAYER_TOTEM_UPDATE")
Event:RegisterEvent("PLAYER_TALENT_UPDATE")
Event:SetScript("OnEvent", function(self, event, ...)
    if event == "PLAYER_LOGIN" then
        OnPlayerLogin(self, event, ...)
    elseif event == "PLAYER_TOTEM_UPDATE" then
        OnPlayerTotemUpdate(self, event, ...)
    elseif event == "PLAYER_TALENT_UPDATE" then
        OnPlayerTalentUpdate(self, event, ...)
    end
end)
