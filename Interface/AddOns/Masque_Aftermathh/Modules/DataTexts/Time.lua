local A, C, M, L = select(2, ...):unpack()

if C.DataTexts.Time then else return end

local LocalTimeFrame = CreateFrame("Frame", nil, UIParent)
LocalTimeFrame:SetSize(160, 50)
LocalTimeFrame:SetPoint(unpack(C.DataTexts.TimePoint))

local LocalTimeText = LocalTimeFrame:CreateFontString(nil, "OVERLAY")
LocalTimeText:SetPoint("CENTER", LocalTimeFrame)
LocalTimeText:SetFontTemplate(C.Media.Font2, C.DataTexts.FontSize) 
LocalTimeText:SetTextColor(unpack(C.DataTexts.TextColor))

local function TimeOnUpdate(self, Elapsed)
	self.Update = (self.Update or 0) + Elapsed

	if self.Update > 0.5 then
		self.Total = (self.Total or 0) + 1

		LocalTimeText:SetFormattedText("%s", date( "|CFFFFFFFF%I|r:|CFFFFFFFF%M|r %p"))

		self.Update = 0
	end
end

LocalTimeFrame:SetScript("OnUpdate", TimeOnUpdate)