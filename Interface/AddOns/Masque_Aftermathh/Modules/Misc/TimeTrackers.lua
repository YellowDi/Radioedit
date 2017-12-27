local A, C, M, L = select(2, ...):unpack()

local TimeTrackers = CreateFrame("Frame")

function TimeTrackers:UpdateMirrorBar()
	for i = 1, MIRRORTIMER_NUMTIMERS, 1 do
		local Bar = _G["MirrorTimer"..i]

	    if (Bar) then
			if not (Bar.IsSkinned) then
				Bar:SetSize(300, 28)
				Bar:StripTexture()
				Bar:CreateBackdrop()
			
				Bar:ClearAllPoints()
				Bar:Point("TOP", UIParent, 0, -118)
				
				local StatusBar = _G[Bar:GetName().."StatusBar"]
				StatusBar:ClearAllPoints()
				StatusBar:SetAllPoints(Bar)
				StatusBar:SetStatusBarTexture(C.Media.Texture)

				local Text = _G[Bar:GetName().."Text"]
				Text:SetFontTemplate(C.Media.Font2, 14)
				Text:ClearAllPoints()
				Text:Point("CENTER", Bar, 0, 1)

				local Border = _G[Bar:GetName().."Border"]
				Border:SetTexture(nil)

				Bar.IsSkinned = true
			end
		end
	end
end

function TimeTrackers:UpdateBar()
	for i = 1, self:GetNumRegions() do
		local Region = select(i, self:GetRegions())
		if (Region:GetObjectType() == "Texture") then
			Region:SetTexture(nil)
		elseif (Region:GetObjectType() == "FontString") then
			Region:SetFontTemplate(C.Media.Font2, 14)
			Region:ClearAllPoints()
			Region:Point("CENTER", self, 0, 1)
		end
	end
	
	self:SetSize(300, 28)
	self:ClearAllPoints()
	self:Point("TOP", UIParent, 0, -118)	
	self:SetStatusBarTexture(C.Media.Texture)
	self:SetStatusBarColor(170/255, 10/255, 10/255)
	self:CreateBackdrop()
end

function TimeTrackers:Update()
	for _, Bars in pairs(TimerTracker.timerList) do
		if not Bars["bar"].IsSkinned then
			self.UpdateBar(Bars["bar"])
	
			Bars["bar"].IsSkinned = true
		end
	end
end

function TimeTrackers:AddHooks()
    hooksecurefunc("MirrorTimer_Show", TimeTrackers.UpdateMirrorBar)
end

function TimeTrackers:Enable()
	TimeTrackers:AddHooks()
	
	self:RegisterEvent("START_TIMER")
	self:SetScript("OnEvent", TimeTrackers.Update)
end

TimeTrackers:RegisterEvent("PLAYER_LOGIN")
TimeTrackers:RegisterEvent("PLAYER_ENTERING_WORLD")
TimeTrackers:RegisterEvent("ADDON_LOADED")

TimeTrackers:SetScript("OnEvent", function(self, event)
    if (event == "PLAYER_LOGIN") then
		TimeTrackers:Enable()
	end
end)