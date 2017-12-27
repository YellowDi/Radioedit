local A, C, M, L = select(2, ...):unpack()

if C.DataTexts.System then else return end

local SystemFrame = CreateFrame("Frame", nil, UIParent)
SystemFrame:SetSize(160, 50)
SystemFrame:SetPoint(unpack(C.DataTexts.SystemPoint))

local SystemText = SystemFrame:CreateFontString(nil, "OVERLAY")
SystemText:SetPoint("CENTER", SystemFrame)
SystemText:SetFontTemplate(C.Media.Font2, C.DataTexts.FontSize)
SystemText:SetTextColor(unpack(C.DataTexts.TextColor))

SystemFrame:SetScript("OnUpdate", function(self, Elapsed)
	self.Update = (self.Update or 0) - Elapsed
	
	if (self.Update <= 0) then
		local FPS = GetFramerate()
		local MS = select(3, GetNetStats())
		
		SystemText:SetFormattedText("|CFFFFFFFFFramerate|r: %.0f|r |CFFFFFFFFLatency|r: %.0f|r", FPS, MS)

		self.Update = 1
	end
end)

--[[
local SortAddons = function(A, B)
	return A.Memory > B.Memory
end
	
SystemFrame:SetScript("OnEnter", function(self)
	collectgarbage()
	UpdateAddOnMemoryUsage()
	
	local Entry
	local Total = 0
	local AddOns = {}
	for i = 1, GetNumAddOns() do
		if IsAddOnLoaded(i) then
			local Memory = GetAddOnMemoryUsage(i)
			Total = Total + Memory
			
			Entry = {
			Name = GetAddOnInfo(i), 
			Memory = Memory
			}
			tinsert(AddOns, Entry)
		end
	end
	table.sort(AddOns, SortAddons)
   
	GameTooltip:ClearLines()
	GameTooltip:SetOwner(self, "ANCHOR_CURSOR", 0, -4)

	for _, Content in pairs(AddOns) do
		local R, G, B = A.ColorGradientNeav((Content.Memory / 1250), 0, 1, 0, 1, 1, 0, 1, 0, 0)
		GameTooltip:AddDoubleLine(Content.Name, A.FormVal(Content.Memory), 1, 1, 1, R, G, B)
	end

	local R, G, B = A.ColorGradientNeav((Entry.Memory / 1250), 0, 1, 0, 1, 1, 0, 1, 0, 0)
	GameTooltip:AddLine(" ")
	GameTooltip:AddDoubleLine("AddOn Memory Usage:", A.FormVal(Total), 1.0, 0.82, 0, R, G, B)
	
	GameTooltip:Show()
end)

SystemFrame:SetScript("OnLeave", function() GameTooltip:Hide() end)
--]]