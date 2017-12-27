local A, C, L = unpack(select(2, ...))

local parent, ns = ...
local oUF = ns.oUF or oUF

local Tags = oUF.Tags.Methods or oUF.Tags
local TagsEvents = oUF.TagEvents or oUF.Tags.Events

local function UTF8Sub(self, i, dots)
	if not self then return end
	local Bytes = self:len()
	if (Bytes <= i) then
		return self
	else
		local Len, Pos = 0, 1
		while(Pos <= Bytes) do
			Len = Len + 1
			local c = self:byte(Pos)
			if (c > 0 and c <= 127) then
				Pos = Pos + 1
			elseif (c >= 192 and c <= 223) then
				Pos = Pos + 2
			elseif (c >= 224 and c <= 239) then
				Pos = Pos + 3
			elseif (c >= 240 and c <= 247) then
				Pos = Pos + 4
			end
			if (Len == i) then break end
		end
		if (Len == i and Pos <= Bytes) then
			return self:sub(1, Pos - 1)..(dots and "..." or "")
		else
			return self
		end
	end
end

Tags["Aftermathh:Deficit"] = function(unit)
	if (not unit) then return end
    local Deficit = oUF.Tags.Methods["missinghp"](unit)
	local Status
	if (UnitIsDead(unit)) then
	    Status = ""
	elseif (not UnitIsConnected(unit)) then
        Status = ""
    elseif (UnitIsGhost(unit)) then
        Status = ""
	elseif (Deficit) then
		Status = "|cff559655-"..A.ShortNumbers(Deficit)
	end
	return Status
end
TagsEvents["Aftermathh:Deficit"] = "UNIT_HEALTH UNIT_MAXHEALTH"

Tags["Aftermathh:Name"] = function(unit)
    local Name = UnitName(unit)
    if (not UnitIsConnected(unit)) then
        Name = "|CFF707070Offline|r"
    elseif (UnitIsDead(unit)) then
        Name = "|CFF707070Dead|r"
    elseif (UnitIsGhost(unit)) then
        Name = "|CFF707070Ghost|r"
    else
	    return UTF8Sub(Name, 22)
	end
	return Name
end
TagsEvents["Aftermathh:Name"] = "UNIT_NAME_UPDATE UNIT_HEALTH"

Tags["Aftermathh:ShortName"] = function(unit)
    local Name = UnitName(unit)
    if (not UnitIsConnected(unit)) then
        Name = "|CFF707070Offline|r"
    elseif (UnitIsDead(unit)) then
        Name = "|CFF707070Dead|r"
    elseif (UnitIsGhost(unit)) then
        Name = "|CFF707070Ghost|r"
    else
	    return UTF8Sub(Name, 12)
	end
    return Name
end
TagsEvents["Aftermathh:ShortName"] = "UNIT_NAME_UPDATE UNIT_HEALTH"

Tags["Aftermathh:RaidName"] = function(unit)
    local Name = UnitName(unit)
    if (not UnitIsConnected(unit)) then
        Name = "|CFF707070Offline|r"
    elseif (UnitIsDead(unit)) then
        Name = "|CFF707070Dead|r"
    elseif (UnitIsGhost(unit)) then
        Name = "|CFF707070Ghost|r"
    else
	    return UTF8Sub(Name, 6)
	end
	return Name
end
TagsEvents["Aftermathh:RaidName"] = "UNIT_NAME_UPDATE UNIT_HEALTH"

Tags["Aftermathh:Level"] = function(unit) 
    local R, G, B
    local Level = UnitLevel(unit)
    local ColorL = GetQuestDifficultyColor(Level)
    if (Level < 0) then
        R, G, B = 1, 0, 0
        Level = "??B"
    elseif (Level == 0) then
        R, G, B = ColorL.r, ColorL.g, ColorL.b
        Level = "?"
    else
        R, G, B = ColorL.r, ColorL.g, ColorL.b
        Level = Level
    end
    return format("|cff%02x%02x%02x%s|r", R*255, G*255, B*255, Level)
end
TagsEvents["Aftermathh:Level"] = "UNIT_LEVEL PLAYER_LEVEL_UP"