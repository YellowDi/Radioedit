local A, C, M, L = select(2, ...):unpack()

local Class = select(2, UnitClass("player"))

if (Class ~= "WARRIOR") then return end

A.ClassFeature["WARRIOR"] = function(self)

end