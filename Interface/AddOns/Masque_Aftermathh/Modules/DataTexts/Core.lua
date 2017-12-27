local A, C, M, L = select(2, ...):unpack()

--[[
local DataTexts = CreateFrame("Frame")

DataTexts:RegisterEvent("PLAYER_LOGIN")
DataTexts:RegisterEvent("PLAYER_ENTERING_WORLD")
DataTexts:RegisterEvent("ADDON_LOADED")

DataTexts:SetScript("OnEvent", function(self, event)
	if (event == "PLAYER_LOGIN") then
	    
	end
end)

A["DataTexts"] = DataTexts
--]]