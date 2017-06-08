
-------------------------------------
-- InspectCore Author: M
-------------------------------------

local LibEvent = LibStub:GetLibrary("LibEvent.7000")
local LibSchedule = LibStub:GetLibrary("LibSchedule.7000")
local LibItemInfo = LibStub:GetLibrary("LibItemInfo.7000")

local guids, inspecting = {}, false

-- Global API
function GetInspectInfo(unit, timelimit)
    local guid = UnitGUID(unit)
    if (guid and guids[guid]) then
        if (not timelimit or timelimit == 0) then
            return guids[guid]
        end
        if (guids[guid].timer > time()-timelimit) then
            return guids[guid]
        end
    end
end

local inuse = { inuse = true }

-- Global API
function GetInspecting()
    if (InspectFrame and InspectFrame.unit) then
        return inuse
    end
    if (inspecting and inspecting.expired > time()) then
        return inspecting
    end
end

-- Global API @trigger UNIT_REINSPECT_READY
function ReInspect(unit)
    local guid = UnitGUID(unit)
    if (not guid) then return end
    local data = guids[guid]
    if (not data) then return end
    LibSchedule:AddTask({
        identity  = guid,
        timer     = 0.5,
        elasped   = 0.5,
        expired   = GetTime() + 3,
        data      = data,
        unit      = unit,
        onExecute = function(self)
            local count, ilevel = LibItemInfo:GetUnitItemLevel(self.unit)
            if (ilevel < 0) then return true end
            if (count == 0 and ilevel > 0) then
                self.data.timer = time()
                self.data.ilevel = ilevel
                LibEvent:trigger("UNIT_REINSPECT_READY", self.data)
                return true
            end
        end,
    })
end

-- Get Inspect Specialization
local function GetInspectSpec(unit)
    if (UnitLevel(unit) > 10) then
        local specID, specName
        if (unit == "player") then
            specID = GetSpecialization()
            specName = select(2, GetSpecializationInfo(specID))
        else
            specID = GetInspectSpecialization(unit)
            if (specID and specID > 0) then
                specName = select(2, GetSpecializationInfoByID(specID))
            end
        end
        return specName
    end
end

-- Clear
hooksecurefunc("ClearInspectPlayer", function()
    inspecting = false
end)

-- @trigger UNIT_INSPECT_STARTED
hooksecurefunc("NotifyInspect", function(unit)
    local guid = UnitGUID(unit)
    if (not guid) then return end
    local data = guids[guid]
    if (data) then
        data.unit = unit
        data.name = UnitName(unit)
    else
        data = {
            unit   = unit,
            guid   = guid,
            name   = UnitName(unit),
            class  = select(2, UnitClass(unit)),
            level  = UnitLevel(unit),
            ilevel = -1,
            spec   = nil,
            hp     = UnitHealthMax(unit),
            timer  = time(),
        }
        guids[guid] = data
    end
    data.expired = time() + 5
    inspecting = data
    LibEvent:trigger("UNIT_INSPECT_STARTED", data)
end)

-- @trigger UNIT_INSPECT_READY
LibEvent:attachEvent("INSPECT_READY", function(this, guid)
    if (not guids[guid]) then return end
    LibSchedule:AddTask({
        identity  = guid,
        timer     = 0.5,
        elasped   = 0.8,
        expired   = GetTime() + 4,
        data      = guids[guid],
        onTimeout = function(self) inspecting = false end,
        onExecute = function(self)
            local count, ilevel = LibItemInfo:GetUnitItemLevel(self.data.unit)
            if (ilevel < 0) then return true end
            if (count == 0 and ilevel > 0) then
                if (UnitIsVisible(self.data.unit) or self.data.ilevel == ilevel) then
                    self.data.timer = time()
                    self.data.name = UnitName(self.data.unit)
                    self.data.class = select(2, UnitClass(self.data.unit))
                    self.data.ilevel = ilevel
                    self.data.spec = GetInspectSpec(self.data.unit)
                    self.data.hp = UnitHealthMax(self.data.unit)
                    LibEvent:trigger("UNIT_INSPECT_READY", self.data)
                    inspecting = false
                    return true
                else
                    self.data.ilevel = ilevel
                end
            end
        end,
    })
end)
