local A, C, M, L = select(2, ...):unpack()

local ReputationBar = CreateFrame("Frame")

function ReputationBar:CreateBar()
    local Panels = A["Panels"]

    local StatusBar = CreateFrame("StatusBar", nil, UIParent)
    StatusBar:SetOrientation("VERTICAL")
    StatusBar:Size(8, 74)
    StatusBar:Point("RIGHT", Panels.ActionBarPanel, 12, 0)
    StatusBar:SetStatusBarTexture("Interface\\Buttons\\WHITE8x8")
    StatusBar:CreateBackdrop()
	
	self:RegisterEvent("UPDATE_FACTION")
    self:RegisterEvent("LFG_BONUS_FACTION_ID_UPDATED") 
	self:RegisterEvent("QUEST_LOG_UPDATE")
	self:SetScript("OnEvent", ReputationBar.UpdateBar)

	StatusBar:SetScript("OnEnter", ReputationBar.OnEnter)
    StatusBar:SetScript("OnLeave", function() GameTooltip:Hide() end)

	self.StatusBar = StatusBar
end

function ReputationBar:UpdateBar()
	local Name, ID, Min, Max, Value, FactionID = GetWatchedFactionInfo()
	
	local IsFactionParagon = C_Reputation.IsFactionParagon
    local FactionParagonInfo = C_Reputation.GetFactionParagonInfo

	if (IsFactionParagon(FactionID)) then
		local ParaMin, ParaMax = FactionParagonInfo(FactionID)
		Min, Max, Value = 0, ParaMax, ParaMin
	end
	
	if (Name) then
		self.StatusBar:Show()
		self.StatusBar:SetMinMaxValues(Min, Max)
		self.StatusBar:SetValue(Value)
	
	    local ReactionColor = A.Colors.reaction[ID]
		self.StatusBar:SetStatusBarColor(unpack(ReactionColor))
	else
	    self.StatusBar:Hide()
	end
end
	
function ReputationBar:OnEnter()
	if InCombatLockdown() then
		return
	end

	local Name, ID, Min, Max, Value, FactionID = GetWatchedFactionInfo()
	local FriendID, _, _, _, _, _, FriendTextLevel = GetFriendshipReputation(FactionID)
	
	local IsFactionParagon = C_Reputation.IsFactionParagon
    local FactionParagonInfo = C_Reputation.GetFactionParagonInfo
	
	if (IsFactionParagon(FactionID)) then
		local ParaMin, ParaMax = FactionParagonInfo(FactionID)
		Min, Max, Value = 0, ParaMax, ParaMin
	end
	
	GameTooltip:ClearLines()
	GameTooltip:SetOwner(self, "ANCHOR_CURSOR", 0, -4)
	
	if (Name) then
		GameTooltip:AddLine(Name)
		GameTooltip:AddLine("")
	
	    local ReactionColor = A.Colors.reaction[ID]
		GameTooltip:AddDoubleLine(STANDING .. ":", FriendID and FriendTextLevel or _G["FACTION_STANDING_LABEL".. ID], 1, 1, 1, unpack(ReactionColor))
		GameTooltip:AddDoubleLine(REPUTATION .. ":", format("%d/%d (%d%%)", Value - Min, Max - Min, (Value - Min) / ((Max - Min == 0) and Max or (Max - Min)) * 100), 1, 1, 1, 1, 1, 1)
	end
	GameTooltip:Show()
end

function ReputationBar:Enable()
	if not (C.DataBars.ReputationBar) then
		return
	end

    if not (self.IsCreated) then
	    ReputationBar:CreateBar()
	
	    self.IsCreated = true
	end
end

ReputationBar:RegisterEvent("PLAYER_LOGIN")
ReputationBar:RegisterEvent("PLAYER_ENTERING_WORLD")
ReputationBar:RegisterEvent("ADDON_LOADED")
 
ReputationBar:SetScript("OnEvent", function(self, event)
	if (event == "PLAYER_LOGIN") then
		ReputationBar:Enable()
	end
end)