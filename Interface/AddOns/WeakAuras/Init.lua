WeakAuras = {}
WeakAuras.L = {}

local versionString = GetAddOnMetadata("WeakAuras", "Version");
--[===[@debug@
if versionString == "2.4.15" then
  versionString = "Development"
end
--@end-debug@]===]
WeakAuras.versionString = versionString

WeakAuras.PowerAurasPath = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Auras\\"
WeakAuras.PowerAurasSoundPath = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Sounds\\"

--These function stubs are defined here to reduce the number of errors that occur if WeakAuras.lua fails to compile
function WeakAuras.RegisterRegionType()
end

function WeakAuras.RegisterRegionOptions()
end
