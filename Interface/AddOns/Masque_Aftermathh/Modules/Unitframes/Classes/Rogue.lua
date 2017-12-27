local A, C, M, L = select(2, ...):unpack()

local Class = select(2, UnitClass("player"))

if (Class ~= "ROGUE") then return end

A.ClassFeature["ROGUE"] = function(self)

end