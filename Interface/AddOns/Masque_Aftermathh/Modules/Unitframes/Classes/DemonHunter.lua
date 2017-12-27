local A, C, M, L = select(2, ...):unpack()

local Class = select(2, UnitClass("player"))

if (Class ~= "DEMONHUNTER") then return end

A.ClassFeature["DEMONHUNTER"] = function(self)

end