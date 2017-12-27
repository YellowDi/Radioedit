local A, C, M, L = select(2, ...):unpack()

local Class = select(2, UnitClass("player"))

if (Class ~= "SHAMAN") then return end

A.ClassFeature["SHAMAN"] = function(self)

end