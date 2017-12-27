local A, C, M, L = select(2, ...):unpack()

local Class = select(2, UnitClass("player"))

if (Class ~= "PRIEST") then return end

A.ClassFeature["PRIEST"] = function(self)

end