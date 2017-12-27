local AutoRelease = CreateFrame("Frame")
AutoRelease:RegisterEvent("PLAYER_DEAD")

AutoRelease:SetScript("OnEvent", function(self, event)
	local InBattlefield = false
	for i = 1, GetMaxBattlefieldID() do
		local BattlefieldStatus = GetBattlefieldStatus(i)
		if BattlefieldStatus == "active" then InBattlefield = true end
	end
	
	local HasSoulstone = HasSoulstone()
	local CanUseSoulstone = CanUseSoulstone()
	
	if not (HasSoulstone and CanUseSoulstone) then
		SetMapToCurrentZone()
		local AreaID = GetCurrentMapAreaID() or 0
		if AreaID == 501 or AreaID == 708 or AreaID == 978 or AreaID == 1009 or AreaID == 1011 or InBattlefield == true then
			RepopMe()
		end
	end
end)