local A, C, L = select(2, ...):unpack()

--[[
local DataBars = CreateFrame("Frame")
DataBars:RegisterEvent("PLAYER_LOGIN")
DataBars:RegisterEvent("PLAYER_ENTERING_WORLD")
DataBars:RegisterEvent("ADDON_LOADED")

DataBars:SetScript("OnEvent", function(self, event)
	if (event == "PLAYER_LOGIN") then
	    
	end
end)

A["DataBars"] = DataBars
--]]