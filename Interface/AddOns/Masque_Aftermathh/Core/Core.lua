local A, C, L = select(2, ...):unpack()

local reverse = string.reverse
local match = string.match
local modf = math.modf
local select = select
local format = format
local floor = floor
local gsub = gsub
local ceil = ceil

A.ColorGradient = function(Min, Max, ...)
	local Percent

	if (Max == 0) then
		Percent = 0
	else
		Percent = Min/Max
	end

	if (Percent >= 1) then
		local R, G, B = select(select("#", ...) - 2, ...)
		return R, G, B
	elseif Percent <= 0 then
		local R, G, B = ...
		return R, G, B
	end

	local Num = (select("#", ...) / 3)
	local Segment, RelPercent = modf(Percent * (Num - 1))
	local R1, G1, B1, R2, G2, B2 = select((Segment * 3) + 1, ...)

	return R1 + (R2 - R1) * RelPercent, G1 + (G2 - G1) * RelPercent, B1 + (B2 - B1) * RelPercent
end

A.RGBToHex = function(R, G, B)
	R = R <= 1 and R >= 0 and R or 0
	G = G <= 1 and G >= 0 and G or 0
	B = B <= 1 and B >= 0 and B or 0
	return format("|cff%02x%02x%02x", R * 255, G * 255, B * 255)
end

A.ShortNumbers = function(Value)
	if (Value >= 1e6) then
		return format("%.1fm", Value / 1e6)
	elseif (Value >= 1e3) then
		return format("%.1fk", Value / 1e3)
	else
		return format("%d", Value)
	end
end

A.FormVal = function(Value)
    if (Value > 1024) then
        return format('%.2f MB', Value/1024)
    else
        return format('%.2f KB', Value)
    end
end

A.Round = function(Number, Decimals)
	if not (Decimals) then
		Decimals = 0
	end
	return format(format("%%.%df", Decimals), Number)
end

A.FormatTime = function(Seconds)
	local Day, Hour, Minutes = 0, 0, 0
	
	if (Seconds >= 86400) then
		Day = Seconds / 86400
		Seconds = Seconds % 86400
	end

	if (Seconds >= 3600) then
		Hour = Seconds / 3600
		Seconds = Seconds % 3600
	end
	
	if (Seconds >= 60) then
		Minutes = Seconds / 60
		Seconds = Seconds % 60
	end
	
	if (Day > 0) then
		return format("%.2d:%.2d", Day, Hour)
	elseif (Hour > 0) then
		return format("%.2d:%.2d", Hour, Minutes)
	elseif (Minutes > 0) then
		return format("%.1d:%.2d", Minutes, Seconds)
	else
		if (Seconds < 10) then
			return format("%.1f", Seconds) 
		else
			return format("%d", Seconds)
		end
	end
end

A.FormatTimeShort = function(Seconds)
	local Day, Hour, Minute = 86400, 3600, 60

	if (Seconds >= Day) then
		return format("%dd", ceil(Seconds / Day))
	elseif (Seconds >= Hour) then
		return format("%dh", ceil(Seconds / Hour))
	elseif (Seconds >= Minute) then
		return format("%dm", ceil(Seconds / Minute))
	elseif (Seconds >= Minute / 12) then
		return floor(Seconds)
	end

	return format("%.1f", Seconds)
end