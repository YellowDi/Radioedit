local A, C, M, L = select(2, ...):unpack()

local Class = select(2, UnitClass("player"))

if (Class ~= "DRUID") then return end

A.ClassFeature["DRUID"] = function(self)

end