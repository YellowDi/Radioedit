local A, C, M, L = select(2, ...):unpack()

if C.DataTexts.Date then else return end

local DateFrame = CreateFrame("Frame", nil, UIParent)
DateFrame:SetSize(160, 50)
DateFrame:SetPoint(unpack(C.DataTexts.DatePoint))

local DateFrameText = DateFrame:CreateFontString(nil, "OVERLAY")  
DateFrameText:SetPoint("CENTER", DateFrame)
DateFrameText:SetFontTemplate(C.Media.Font2, C.DataTexts.FontSize)
DateFrameText:SetTextColor(unpack(C.DataTexts.TextColor))

DateFrame:SetScript("OnUpdate", function(self, Elapsed)	
	self.Update = (self.Update or 0) + Elapsed

	if self.Update > 0.5 then
		self.Total = (self.Total or 0) + 1

		DateFrameText:SetFormattedText("%s", date( "%A |CFFFFFFFF%B %d|r"))

		self.Update = 0
	end
end)