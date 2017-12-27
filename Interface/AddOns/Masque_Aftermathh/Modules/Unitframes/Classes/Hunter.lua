local A, C, M, L = select(2, ...):unpack()

local Class = select(2, UnitClass("player"))

if (Class ~= "HUNTER") then return end

A.ClassFeature["HUNTER"] = function(self)

end