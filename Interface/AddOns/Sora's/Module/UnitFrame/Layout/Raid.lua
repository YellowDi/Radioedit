-- Engines
local _, ns = ...
local oUF = ns.oUF or oUF
local S, C, L, DB = unpack(select(2, ...))

-- Variables
local auraFilters = {
        -- (^.+zoneid, )|
        -- (\b\d{1}\b(,|\))){1,2}|
        -- (((true)|(false))(,|\))){1,2}
        [1] = {
        -- [774] = 22, -- Test
        -- [48438] = 1, -- Test
        },
        
        -- Broken Isles
        [1007] = {
            -- Calamir
            [218888] = 21, -- Impish Flames (non-dispellable)
            [217925] = 24, -- Icy Comet (non-dispellable) AoE Slow
            [217966] = 25, -- Howling Gale (non-dispellable)
            [218012] = 25, -- Arcanopulse (non-dispellable) DMG + Stun
            
            -- Drugon the Frostblood
            [219602] = 31, -- Snow Plow (non-dispellable) Fixate
            
            -- Flotsam
            [223373] = 41, -- Yaksam (non-dispellable) Cone AoE
            [223355] = 42, -- Oozing Bile (non-dispellable)
            
            -- Humongris
            [216430] = 51, -- Earthshake Stomp (non-dispellable) DMG + Stun
            [216467] = 52, -- Make the Snow (non-dispellable) AoE Frost DMG + Slow
            [216822] = 53, -- You Go Bang! (non-dispellable) Fire Bomb + DMG Increase Debuff
            
            -- Levantus
            [170196] = 61, -- Rending Whirl (non-dispellable) Rend
            [217362] = 63, -- Turbulent Vortex (dispellable)
            [217362] = 64, -- Rampaging Torrent (non-dispellable) DMG + DMG Increase Debuff Stacks
            
            -- Na'zak the Fiend
            [219349] = 71, -- Corroding Spray (non-dispellable) Cone AoE Stacks
            
            -- Nithogg
            [212867] = 81, -- Electrical Storm (non-dispellable) Ground AoE
            [212852] = 82, -- Storm Breath (non-dispellable) DMG + DMG Increase Debuff
            
            -- Shar'thos
            [215876] = 92, -- Burning Earth (non-dispellable) Ground AoE
            [216044] = 93, -- Cry of the Tormented (non-dispellable) AoE Fear
            
            -- The Soultakers
            [213665] = 93, -- Marauding Mists (non-dispellable) DMG + Disorient
        },
        
        -- The Emerald Nightmare
        [1094] = {
            -- Nythendra
            [204504] = 11, -- Infested
            [203045] = 12, -- Infested Ground (standing in pool)
            [203096] = 13, -- Rot (AoE people around you)
            [204463] = 14, -- Volatile Rot (exploding tank)
            [203646] = 15, -- Burst of Corruption
            
            -- Il'gynoth, Heart of Corruption
            [212886] = 21, -- Nightmare Corruption (standing in pool)
            [215845] = 22, -- Dispersed Spores (dot)
            [210099] = 23, -- Fixate (fixate)
            [209469] = 24, -- (dot, stacks, magic)
            [209471] = 25, -- Nightmare Explosion (dot, stacks)
            [210984] = 26, -- Eye of Fate (tank debuff, stacks)
            [208697] = 27, -- Mind Flay (dot)
            [208929] = 28, -- Spew Corruption (dot, drops pools)
            [215128] = 29, -- Cursed Blood (dot, weak bomb)
            
            -- Elerethe Renferal
            [215307] = 31, -- Web of Pain (link)
            [215460] = 32, -- Necrotic Venom (dot, drops pools)
            [213124] = 33, -- Venomous Pool (standing in pool)
            [210850] = 34, -- Twisting Shadows (dot)
            [215582] = 35, -- Raking Talons (tank debuff, stacks)
            [218519] = 36, -- Wind Burn (debuff, stacks)
            [210228] = 37, -- Dripping Fangs (dot, stacks)
            
            -- Ursoc
            [197943] = 41, -- Overwhelm (tank debuff, stacks)
            [204859] = 42, -- Rend Flesh (dot)
            [198006] = 43, -- Focused Gaze (fixate)
            [198108] = 44, -- Momentum (debuff)
            [197980] = 45, -- Nightmarish Cacophony (fear)
            [205611] = 46, -- Miasma (standing in)
            
            -- Dragons of Nightmare
            [203110] = 51, -- Slumbering Nightmare (stun)
            [203102] = 52, -- Mark of Ysondre (dot, stacks)
            [207681] = 53, -- Nightmare Bloom (standing in)
            [204731] = 54, -- Wasting Dread (debuff)
            [203770] = 55, -- Defiled Vines (root, magic)
            [203125] = 56, -- Mark of Emeriss (dot, stacks)
            [203787] = 57, -- Volatile Infection (AoE dot)
            [203086] = 58, -- Mark of Lethon (dot, stacks)
            [204044] = 59, -- Shadow Burst (dot, stacks)
            [203121] = 60, -- Mark of Taerar (dot, stacks)
            [205341] = 61, -- Seeping Fog (dot, sleep, magic)
            [204078] = 62, -- Bellowing Roar (fear)
            [214543] = 63, -- Collapsing Nightmare (debuff)
            
            -- Cenarius
            [212681] = 71, -- Cleansed Ground (buff)
            [210279] = 72, -- Creeping Nightmares (debuff, stacks)
            [210315] = 73, -- Nightmare Brambles (dot, root, magic)
            [213162] = 74, -- Nightmare Blast (tank debuff, stacks)
            [226821] = 75, -- Desiccating Stomp (melee debuff, stacks)
            [211507] = 76, -- Nightmare Javelin (dot, magic)
            [211471] = 77, -- Scorned Touch (dot, spreads)
            [216516] = 78, -- Ancient Dream (buff)
            [211989] = 79, -- Unbound Touch (buff, spreads)
            [211990] = 80, -- Unbound Essence (buff)
            [214529] = 81, -- Spear of Nightmares (tank debuff, stacks)
            
            -- Xavius
            [206005] = 91, -- Dream Simulacrum (buff)
            [206109] = 92, -- Awakening to the Nightmare (buff)
            [208431] = 93, -- Descent into Madness (buff)
            [207409] = 94, -- Madness (mind control)
            [206651] = 95, -- Darkening Soul (dot, magic)
            [211802] = 96, -- Nightmare Blades (fixate)
            [205771] = 97, -- Tormenting Fixation (fixate)
            [209158] = 98, -- Blackening Soul (dot, magic)
            [205612] = 99, -- Blackened? (debuff)
            [210451] = 100, -- Bonds of Terror (link)
            [208385] = 101, -- Tainted Discharge (standing in)
            [211634] = 102, -- The Infinite Dark (standing in?)
        },
        
        -- The Nighthold
        [1088] = {
            -- Skorpyron
            [204766] = 11, -- Energy Surge (non-dispellable, stacks) (DMG + Debuff)
            [214657] = 12, -- Acidic Fragments (non-dispellable) (DMG + Debuff)
            [214662] = 13, -- Volatile Fragments (non-dispellable) (DMG + Debuff)
            [211659] = 14, -- Arcane Tether (non-dispellable, stacks) (Stacking Ground AoE)
            [204471] = 15, -- Focused Blast (non-dispellable) (Frontal Cone AoE)
            
            -- Chronomatic Anomaly
            [206607] = 21, -- Chronometric Particles (non-dispellable, stacks) (Stacking DoT)
            [206609] = 22, -- Time Release (non-dispellable) (heal absorb)
            [206615] = 23, -- Time Bomb (non-dispellable) (Not a Debuff?)
            [212099] = 24, -- Temporal Charge (non-dispellable) (DoT)
            
            -- Trilliax
            [206482] = 31, -- Arcane Seepage (non-dispellable) (Ground AoE)
            [206788] = 32, -- Toxic Slice (non-dispellable) (DMG + Debuff Stacking DoT)
            
            -- Spellblade Aluriel
            [212492] = 41, -- Annihilate (non-dispellable) (DMG + Tank Debuff)
            [212587] = 42, -- Mark of Frost (non-dispellable) (DMG + Increase DMG taken per stack explodes if two people with it get close)
            [213083] = 44, -- Frozen Tempest (non-dispellable) (DoT)
            
            -- Tichondrius
            [206480] = 51, -- Carrion Plague (non-dispellable) (DoT)
            [213238] = 52, -- Seeker Swarm (non-dispellable) (DMG + Adds Carrion Plague DoT)
            [212795] = 53, -- Brand of Argus (non-dispellable) (Explodes if players clump)
            [208230] = 54, -- Feast of Blood (non-dispellable) (Increases DMG Taken)
            [216024] = 55, -- Volatile Wound (non-dispellable, Stacks) (DMG + Increases Future DMG Taken)
            [216040] = 56, -- Burning Soul (dispellable) (DMG + Mana Drain + Explode on Dispell)
            
            -- Krosus
            [208203] = 62, -- Isolated Rage (non-dispellable) (Ground AoE Not Avoidable)
            
            -- High Botanist Tel'arn
            [218502] = 71, -- Recursive Strikes (non-dispellable, stacks) (Increases DMG Taken)
            [219049] = 72, -- Toxic Spores (non-dispellable) (Ground AoE)
            [218424] = 73, -- Parasitic Fetter (dispellable) (Root + Increaseing DMG)
            
            -- Star Augur Etraeus
            [206585] = 81, -- Absolute Zero (non-dispellable, stacks) (DMG + Dispellable by Player Clump That then causes Chill)
            [206936] = 82, -- Icy Ejection (non-dispellable, stacks) (DoT + Slow-to-Stun)
            [206388] = 83, -- Felburst (non-dispellable, stacks) (DMG + DoT)
            [205649] = 84, -- Fel Ejection (non-dispellable, stacks) (DMG + DoT)
            [206965] = 85, -- Voidburst (non-dispellable) (DoT)
            [207143] = 86, -- Void Ejection (non-dispellable) (DMG + DoT)
            
            -- Gul'dan
            [212568] = 101, -- Drain (dispellable) (Life Steal)
            [206883] = 102, -- Soul Vortex (non-dispellable, stacks) (AoE DMG + DoT)
            [206222] = 103, -- Bonds of Fel (non-dispellable) (chain + Slow + Explosion when seperated)
            [206221] = 104, -- Empowered Bonds of Fel (non-dispellable) (chain + Slow + Explosion when seperated)
            [208672] = 105, -- Carrion Wave (non-dispellable) (AoE DMG + Sleep)
            [208903] = 106, -- Burning Claws (non-dispellable) (ground AoE)
            [208802] = 107, -- Soul Corrosion (non-dispellable) (DMG + DoT)
        },
        
        -- Trial of Valor
        [1114] = {
            --Trash
            [232450] = 1, -- Corrupted Axion
            
            -- Guarm
            [228226] = 11, -- Flame Lick
            [228246] = 12, -- Frost Lick
            [228250] = 13, -- Shadow Lick
            [227539] = 14, -- Fiery Phlegm
            [227566] = 15, -- Salty Spittle
            [227570] = 16, -- Dark Discharge
            
            -- Helya
            [227903] = 21, -- Orb of Corruption
            [228058] = 22, -- Orb of Corrosion
            [228054] = 23, -- Taint of the Sea
            [193367] = 24, -- Fetid Rot
            [227982] = 25, -- Bilewater Redox
            [228519] = 26, -- Anchor Slam
            [202476] = 27, -- Rabid
            [232450] = 28, -- Corrupted Axion
            
            -- Odyn
            [227959] = 31, -- Storm of Justice
            [227475] = 32, -- Cleansing Flame
            [192044] = 33, -- Expel Light
            [227781] = 34, -- Glowing Fragment
        },
}

-- Begin
local function IsHealer(self, ...)
    local _, class = UnitClass("player")
    local specialization = GetSpecialization()
    
    local result = false
        or
        (class == "MONK" and specialization == 2)
        or
        (class == "DRUID" and specialization == 4)
        or
        (class == "SHAMAN" and specialization == 3)
        or
        (class == "PALADIN" and specialization == 1)
        or
        (class == "PRIEST" and (specialization == 1 or specialization == 2))
    
    return result
end

local function UpdateAura(self, event, unit, ...)
    local auras = {}
    
    for i = 1, 255 do
        local _, _, texture, count, _, duration, timeLeft, caster, _, _, spellID = UnitBuff(unit, i)
        
        if not spellID then
            break
        end
        
        for k, v in pairs(auraFilters) do
            if v[spellID] then
                table.insert(auras, {
                    priority = v[spellID],
                    count = count, texture = texture,
                    duration = duration, timeLeft = timeLeft,
                })
                break
            end
        end
    end
    
    for i = 1, 255 do
        local _, _, texture, count, _, duration, timeLeft, _, _, _, spellID = UnitDebuff(unit, i)
        
        if not spellID then
            break
        end
        
        for k, v in pairs(auraFilters) do
            if v[spellID] then
                table.insert(auras, {
                    priority = v[spellID],
                    count = count, texture = texture,
                    duration = duration, timeLeft = timeLeft,
                })
                break
            end
        end
    end
    
    
    table.sort(auras, function(l, r)
        return l.priority < r.priority
    end)
    
    if #auras == 0 then
        self.RaidDebuff:Hide()
        self.NameTag:SetAlpha(1.00)
        self.StatusTag:SetAlpha(1.00)
    else
        local aura = auras[1]
        local count, texture, duration, timeLeft = aura.count, aura.texture, aura.duration, aura.timeLeft
        
        if count and count > 0 then
            self.RaidDebuff.count:SetText(count)
        end
        
        self.RaidDebuff.icon:SetTexture(texture)
        self.RaidDebuff.cd:SetCooldown(timeLeft - duration, duration)
        
        self.RaidDebuff:Show()
        self.NameTag:SetAlpha(0.25)
        self.StatusTag:SetAlpha(0.25)
    end
end

local function UpdateIndicator(self, event, unit, ...)
    local auras = {}
    local _, class = UnitClass("player")
    
    for i = 1, 255 do
        local _, _, texture, count, _, duration, timeLeft, caster, _, _, spellID = UnitBuff(unit, i)
        
        if not spellID then
            break
        end
        
        if C.UnitFrame.Raid.IndicatorFilters[class] and caster == "player" then
            for i = 1, #self.Indicators do
                if spellID == C.UnitFrame.Raid.IndicatorFilters[class][i] then
                    auras[i] = {
                        show = true,
                        texture = texture,
                        duration = duration, timeLeft = timeLeft,
                    }
                elseif not auras[i] then
                    auras[i] = {
                        show = false,
                        texture = nil,
                        duration = 0, timeLeft = 0,
                    }
                end
            end
        end
    end
    
    for i = 1, 255 do
        local _, _, texture, count, _, duration, timeLeft, caster, _, _, spellID = UnitDebuff(unit, i)
        
        if not spellID then
            break
        end
        
        if C.UnitFrame.Raid.IndicatorFilters[class] and caster == "player" then
            for i = 1, #self.Indicators do
                if spellID == C.UnitFrame.Raid.IndicatorFilters[class][i] then
                    auras[i] = {
                        show = true,
                        texture = texture,
                        duration = duration, timeLeft = timeLeft,
                    }
                elseif not auras[i] then
                    auras[i] = {
                        show = false,
                        texture = nil,
                        duration = 0, timeLeft = 0,
                    }
                end
            end
        end
    end
    
    for i = 1, #self.Indicators do
        local aura = auras[i]
        local indicator = self.Indicators[i]
        
        if aura and aura.show then
            indicator:Show()
            indicator.shadow:Show()
            indicator.icon:SetTexture(aura.texture)
            
            indicator.duration = aura.duration
            indicator.timeLeft = aura.timeLeft
            
            if indicator.timeLeft - GetTime() < indicator.duration * 0.3 then
                indicator.icon:SetVertexColor(1.00, 0.00, 0.00)
            else
                indicator.icon:SetVertexColor(1.00, 1.00, 1.00)
            end
            
            indicator.timer = 0
            indicator:SetScript("OnUpdate", function(self, elapsed, ...)
                self.timer = self.timer + elapsed
                
                if self.timer > 0.10 then
                    self.timer = 0
                    
                    if self.timeLeft - GetTime() < self.duration * 0.3 then
                        indicator.icon:SetVertexColor(1.00, 0.00, 0.00)
                    end
                end
            end)
        else
            indicator:Hide()
            indicator:SetScript("OnUpdate", nil)
        end
    end
end

local function OnUnitAura(self, event, unit, ...)
    if self.unit ~= unit then
        return
    end
    
    UpdateAura(self, event, unit, ...)
    UpdateIndicator(self, event, unit, ...)
end

local function OnUnitThreatUpdate(self, event, unit, ...)
    if self.unit ~= unit then
        return
    end
    
    local r, g, b, a = 0.00, 0.00, 0.00, 1.00
    local _, status = UnitDetailedThreatSituation(unit, "target")
    
    if status and status > 1 then
        a = 0.75
        r, g, b = GetThreatStatusColor(status)
    end
    
    self.Power.shadow:SetBackdropBorderColor(r, g, b, a)
    self.Health.shadow:SetBackdropBorderColor(r, g, b, a)
end

local function SetPower(self, ...)
    local power = CreateFrame("StatusBar", nil, self)
    power:SetPoint("BOTTOM", self)
    power:SetSize(self:GetWidth(), 2)
    power:SetStatusBarTexture(DB.Statusbar)
    
    power.bg = power:CreateTexture(nil, "BACKGROUND")
    power.bg:SetTexture(DB.Statusbar)
    power.bg:SetAllPoints()
    power.bg:SetVertexColor(0.12, 0.12, 0.12)
    power.bg.multiplier = 0.12
    
    power.Smooth = true
    power.colorPower = true
    power.frequentUpdates = true
    power.shadow = S.MakeShadow(power, 2)
    
    self.Power = power
end

local function SetHealth(self, ...)
    local health = CreateFrame("StatusBar", nil, self)
    health:SetPoint("TOP", self)
    health:SetStatusBarTexture(DB.Statusbar)
    health:SetSize(self:GetWidth(), self:GetHeight() - 4)
    
    health.bg = health:CreateTexture(nil, "BACKGROUND")
    health.bg:SetAllPoints()
    health.bg:SetTexture(DB.Statusbar)
    health.bg:SetVertexColor(0.12, 0.12, 0.12)
    health.bg.multiplier = 0.12
    
    health.Smooth = true
    health.colorTapping = true
    health.colorDisconnected = true
    health.colorClass = true
    health.colorReaction = true
    health.colorHealth = true
    health.frequentUpdates = true
    health.shadow = S.MakeShadow(health, 2)
    
    self.Health = health
end

local function SetAnchor(self, ...)
    if oUF_Sora_Raid_Anchor and not UnitAffectingCombat("player") then
        oUF_Sora_Raid_Anchor:ClearAllPoints()
        if not IsHealer() then
            oUF_Sora_Raid_Anchor:SetPoint(unpack(C.UnitFrame.Raid.Postion))
        else
            oUF_Sora_Raid_Anchor:SetPoint(unpack(C.UnitFrame.Raid.HealerPostion))
        end
    end
end

local function SetTag(self, ...)
    local nameTag = S.MakeText(self.Health, 10)
    nameTag:SetPoint("CENTER", 0, 0)
    
    self.NameTag = nameTag
    self:Tag(self.NameTag, "[Sora:Color][name]|r")
    
    local statusTag = S.MakeText(self.Health, 7)
    statusTag:SetPoint("CENTER", 0, -10)
    
    self.StatusTag = statusTag
    self:Tag(self.StatusTag, "[Sora:Color][Sora:Status]|r")
end

local function SetAuras(self, ...)
    local raidDebuff = CreateFrame("Frame", nil, self.Health)
    raidDebuff:Hide()
    raidDebuff:SetSize(20, 20)
    raidDebuff:SetFrameStrata("HIGH")
    raidDebuff:SetPoint("CENTER", 0, 0)
    
    raidDebuff.cd = CreateFrame("Cooldown", "$parentCooldown", raidDebuff, "CooldownFrameTemplate")
    raidDebuff.cd:SetAllPoints()
    
    raidDebuff.icon = raidDebuff:CreateTexture(nil, "OVERLAY")
    raidDebuff.icon:SetAllPoints()
    
    raidDebuff.count = S.MakeText(raidDebuff, 8)
    raidDebuff.count:SetPoint("BOTTOMRIGHT", raidDebuff, "BOTTOMRIGHT", 1, 1)
    
    raidDebuff.shadow = S.MakeShadow(raidDebuff, 1)
    
    self.RaidDebuff = raidDebuff
end

local function SetRange(self, ...)
    self.Range = {
        insideAlpha = 1.00,
        outsideAlpha = 0.40,
    }
end

local function SetIndicator(self, ...)
    local indicators = {}
    
    for i = 1, 6 do
        local indicator = CreateFrame("Frame", nil, self)
        indicator:Hide()
        indicator:SetSize(8, 8)
        indicator:SetFrameStrata("HIGH")
        
        indicator.icon = indicator:CreateTexture(nil, "OVERLAY")
        indicator.icon:SetAllPoints()
        indicator.shadow = S.MakeShadow(indicator, 1)
        
        if i == 1 then
            indicator:SetPoint("BOTTOMLEFT", self.Health, "BOTTOMLEFT", 2.5, 2.0)
        elseif i == 4 then
            indicator:SetPoint("BOTTOMRIGHT", self.Health, "BOTTOMRIGHT", -2.5, 2.0)
        elseif i == 2 or i == 3 then
            indicator:SetPoint("LEFT", indicators[i - 1], "RIGHT", 2.0, 0.0)
        elseif i == 5 or i == 6 then
            indicator:SetPoint("RIGHT", indicators[i - 1], "LEFT", -2.0, 0.0)
        end
        
        indicators[i] = indicator
    end
    
    self.Indicators = indicators
end

local function SetCompactRaidFrame(self, ...)
    if not UnitAffectingCombat("player") then
        CompactRaidFrameManager:UnregisterAllEvents()
        CompactRaidFrameManager.Show = function() end
        CompactRaidFrameManager:Hide()
        
        CompactRaidFrameContainer:UnregisterAllEvents()
        CompactRaidFrameContainer.Show = function() end
        CompactRaidFrameContainer:Hide()
    end
end

local function SetLeaderIndicator(self, ...)
    local anchor = CreateFrame("Frame", nil, self)
    anchor:SetAllPoints()
    anchor:SetFrameLevel(self.Health:GetFrameLevel() + 1)
    
    local indicator = anchor:CreateTexture(nil, "ARTWORK")
    indicator:SetSize(12, 12)
    indicator:SetPoint("CENTER", anchor, "TOPLEFT", 0, 1)
    
    self.LeaderIndicator = indicator
end

local function SetAssistantIndicator(self, ...)
    local anchor = CreateFrame("Frame", nil, self)
    anchor:SetAllPoints()
    anchor:SetFrameLevel(self.Health:GetFrameLevel() + 1)
    
    local indicator = anchor:CreateTexture(nil, "ARTWORK")
    indicator:SetSize(12, 12)
    indicator:SetPoint("CENTER", anchor, "TOPLEFT", 0, 1)
    
    self.AssistantIndicator = indicator
end

local function SetGroupRoleIndicator(self, ...)
    local anchor = CreateFrame("Frame", nil, self)
    anchor:SetAllPoints()
    anchor:SetFrameLevel(self.Health:GetFrameLevel() + 1)
    
    local indicator = anchor:CreateTexture(nil, "ARTWORK")
    indicator:SetSize(12, 12)
    indicator:SetPoint("CENTER", anchor, "TOPRIGHT", 0, 1)
    
    self.GroupRoleIndicator = indicator
end

local function SetReadyCheckIndicator(self, ...)
    local anchor = CreateFrame("Frame", nil, self.Health)
    anchor:SetAllPoints()
    anchor:SetFrameLevel(self.Health:GetFrameLevel() + 1)
    
    local indicator = anchor:CreateTexture(nil, "ARTWORK")
    indicator:SetSize(16, 16)
    indicator:SetPoint("CENTER", anchor, "CENTER", 0, 0)
    
    self.ReadyCheckIndicator = indicator
end

local function SetRaidTargetIndicator(self, ...)
    local anchor = CreateFrame("Frame", nil, self)
    anchor:SetAllPoints()
    anchor:SetFrameLevel(self.Health:GetFrameLevel() + 1)
    
    local indicator = anchor:CreateTexture(nil, "ARTWORK")
    indicator:SetSize(12, 12)
    indicator:SetPoint("CENTER", anchor, "TOP", 0, 0)
    
    self.RaidTargetIndicator = indicator
end

local function RegisterForEvent(self, ...)
    self:SetScript("OnLeave", UnitFrame_OnLeave)
    self:SetScript("OnEnter", UnitFrame_OnEnter)
    self:RegisterEvent("UNIT_AURA", OnUnitAura)
    self:RegisterEvent("UNIT_THREAT_LIST_UPDATE", OnUnitThreatUpdate)
    self:RegisterEvent("UNIT_THREAT_SITUATION_UPDATE", OnUnitThreatUpdate)
end

local function RegisterForClicks(self, ...)
    self:RegisterForClicks("AnyUp")
end

local function RegisterStyle(self, ...)
    SetPower(self, ...)
    SetHealth(self, ...)
    SetAnchor(self, ...)
    
    SetTag(self, ...)
    SetAuras(self, ...)
    SetRange(self, ...)
    SetIndicator(self, ...)
    SetCompactRaidFrame(self, ...)
    
    SetLeaderIndicator(self, ...)
    SetAssistantIndicator(self, ...)
    SetGroupRoleIndicator(self, ...)
    SetReadyCheckIndicator(self, ...)
    SetRaidTargetIndicator(self, ...)
    
    RegisterForEvent(self, ...)
    RegisterForClicks(self, ...)
end

local function OnPlayerLogin(self, event, ...)
    oUF:RegisterStyle("oUF_Sora_Raid", RegisterStyle)
    oUF:SetActiveStyle("oUF_Sora_Raid")
    
    local width = C.UnitFrame.Raid.Width
    local height = C.UnitFrame.Raid.Height
    local anchor = CreateFrame("Frame", "oUF_Sora_Raid_Anchor", UIParent)
    anchor:SetSize(width * 5 + 8 * 4, height * 6 + 8 * 5)
    
    local oUFFrame = oUF:SpawnHeader("oUF_Sora_Raid", nil, "raid,party,solo",
        "showSolo", true, "showRaid", true, "showParty", true, "showPlayer", true,
        "xoffset", 8, "yoffset", -8,
        "sortMethod", "INDEX", "point", "LEFT",
        "groupBy", "GROUP", "groupFilter", "1,2,3,4,5,6", "groupingOrder", "1,2,3,4,5,6",
        "maxColumns", 5, "columnSpacing", 8, "unitsPerColumn", 5, "columnAnchorPoint", "TOP",
        "oUF-initialConfigFunction", ([[ self:SetWidth(%d) self:SetHeight(%d) ]]):format(width, height)
    )
    oUFFrame:SetPoint("TOPLEFT", anchor, "TOPLEFT", 0, 0)
end

local function OnPlayerTalentUpdate(self, event, ...)
    SetAnchor(self, ...)
end

local Event = CreateFrame("Frame", nil, UIParent)
Event:RegisterEvent("PLAYER_LOGIN")
Event:RegisterEvent("PLAYER_TALENT_UPDATE")
Event:SetScript("OnEvent", function(self, event, ...)
    if event == "PLAYER_LOGIN" then
        OnPlayerLogin(self, event, ...)
    elseif event == "PLAYER_TALENT_UPDATE" then
        OnPlayerTalentUpdate(self, event, ...)
    end
end)
