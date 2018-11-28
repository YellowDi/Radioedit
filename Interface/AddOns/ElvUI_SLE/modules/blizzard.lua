local SLE, T, E, L, V, P, G = unpack(select(2, ...))
local B = SLE:NewModule("Blizzard", 'AceHook-3.0', 'AceEvent-3.0')
local _G = _G

local EnableMouse = EnableMouse
local SetMovable = SetMovable
local SetClampedToScreen = SetClampedToScreen
local RegisterForDrag = RegisterForDrag
local StartMoving = StartMoving
local StopMovingOrSizing = StopMovingOrSizing

--Frames to move
B.Frames = {
	"AddonList",
	"AudioOptionsFrame",
	"BankFrame",
	"CharacterFrame",
	"ChatConfigFrame",
	"DressUpFrame",
	"FriendsFrame",
	"FriendsFriendsFrame",
	"GameMenuFrame",
	"GossipFrame",
	"GuildInviteFrame",
	"GuildRegistrarFrame",
	"HelpFrame",
	"InterfaceOptionsFrame",
	"ItemTextFrame",
	"LFDRoleCheckPopup",
	"LFGDungeonReadyDialog",
	"LFGDungeonReadyStatus",
	"LootFrame",
	"MailFrame",
	"MerchantFrame",
	"OpenMailFrame",
	"PVEFrame",
	"PetStableFrame",
	"PetitionFrame",
	"PVPReadyDialog",
	"QuestFrame",
	"QuestLogPopupDetailFrame",
	"RaidBrowserFrame",
	"RaidInfoFrame",
	"RaidParentFrame",
	"ReadyCheckFrame",
	"ReportCheatingDialog",
	"RolePollPopup",
	"ScrollOfResurrectionSelectionFrame",
	"SpellBookFrame",
	"SplashFrame",
	"StackSplitFrame",
	"StaticPopup1",
	"StaticPopup2",
	"StaticPopup3",
	"StaticPopup4",
	"TabardFrame",
	"TaxiFrame",
	"TimeManagerFrame",
	"TradeFrame",
	"TutorialFrame",
	"VideoOptionsFrame",
	"WorldMapFrame",
}

--These should be only temporary movable due to complications
B.TempOnly = {
	["BonusRollFrame"] = true,
	["BonusRollLootWonFrame"] = true,
	["BonusRollMoneyWonFrame"] = true,
}

--Blizz addons that load later
B.AddonsList = {
	["Blizzard_AchievementUI"] = { "AchievementFrame" },
	["Blizzard_AlliedRacesUI"] = { "AlliedRacesFrame" },
	["Blizzard_ArchaeologyUI"] = { "ArchaeologyFrame" },
	["Blizzard_AuctionUI"] = { "AuctionFrame" },
	["Blizzard_AzeriteUI"] = { "AzeriteEmpoweredItemUI" },
	["Blizzard_BarberShopUI"] = { "BarberShopFrame" },
	["Blizzard_BindingUI"] = { "KeyBindingFrame" },
	["Blizzard_BlackMarketUI"] = { "BlackMarketFrame" },
	["Blizzard_Calendar"] = { "CalendarCreateEventFrame", "CalendarFrame", "CalendarViewEventFrame", "CalendarViewHolidayFrame" },
	["Blizzard_ChallengesUI"] = { "ChallengesKeystoneFrame" }, -- 'ChallengesLeaderboardFrame'
	["Blizzard_Collections"] = { "CollectionsJournal" },
	["Blizzard_Communities"] = { "CommunitiesFrame" },
	["Blizzard_EncounterJournal"] = { "EncounterJournal" },
	["Blizzard_GarrisonUI"] = { "GarrisonLandingPage", "GarrisonMissionFrame", "GarrisonCapacitiveDisplayFrame", "GarrisonBuildingFrame", "GarrisonRecruiterFrame", "GarrisonRecruitSelectFrame", "GarrisonShipyardFrame" },
	["Blizzard_GMChatUI"] = { "GMChatStatusFrame" },
	["Blizzard_GMSurveyUI"] = { "GMSurveyFrame" },
	["Blizzard_GuildBankUI"] = { "GuildBankFrame" },
	["Blizzard_GuildControlUI"] = { "GuildControlUI" },
	["Blizzard_GuildUI"] = { "GuildFrame", "GuildLogFrame" },
	["Blizzard_InspectUI"] = { "InspectFrame" },
	["Blizzard_ItemAlterationUI"] = { "TransmogrifyFrame" },
	["Blizzard_ItemSocketingUI"] = { "ItemSocketingFrame" },
	["Blizzard_ItemUpgradeUI"] = { "ItemUpgradeFrame" },
	["Blizzard_LookingForGuildUI"] = { "LookingForGuildFrame" },
	["Blizzard_MacroUI"] = { "MacroFrame" },
	["Blizzard_OrderHallUI"] = { "OrderHallTalentFrame" },
	["Blizzard_QuestChoice"] = { "QuestChoiceFrame" },
	["Blizzard_ScrappingMachineUI"] = { "ScrappingMachineFrame" },
	["Blizzard_TalentUI"] = { "PlayerTalentFrame" },
	["Blizzard_TradeSkillUI"] = { "TradeSkillFrame" },
	["Blizzard_TrainerUI"] = { "ClassTrainerFrame" },
	["Blizzard_VoidStorageUI"] = { "VoidStorageFrame" },
}

--These should not be on screen at the same time
B.ExlusiveFrames = {
	["QuestFrame"] = { "GossipFrame", },
	["GossipFrame"] = { "QuestFrame", },
	["GameMenuFrame"] = { "VideoOptionsFrame", "InterfaceOptionsFrame", "HelpFrame",},
	["VideoOptionsFrame"] = { "GameMenuFrame",},
	["InterfaceOptionsFrame"] = { "GameMenuFrame",},
	["HelpFrame"] = { "GameMenuFrame",},
}

--These should not be added to "close on escape" list cause this breaks a lot of shit
B.NoSpecialFrames = {
	["StaticPopup1"] = true,
	["StaticPopup2"] = true,
	["StaticPopup3"] = true,
	["StaticPopup4"] = true,
}

local function OnDragStart(self)
	self.IsMoving = true
	self:StartMoving()
end

--When stop moving (or hiding), remember frame's positions.
local function OnDragStop(self)
	self:StopMovingOrSizing()
	self.IsMoving = false
	local Name = self:GetName()
	--Saving positions only if option is enabled and frame is not temporary movable
	if E.private.sle.module.blizzmove.remember and not B.TempOnly[Name] then
		local a, b, c, d, e = self:GetPoint()
		if self:GetParent() then 
			b = self:GetParent():GetName() or UIParent
		else
			b = UIParent
		end
		--These 2 frames should always be in the same place. So aving coordinates for then at the same time
		if Name == "QuestFrame" or Name == "GossipFrame" then
			E.private.sle.module.blizzmove.points["GossipFrame"] = {a, b, c, d, e}
			E.private.sle.module.blizzmove.points["QuestFrame"] = {a, b, c, d, e}
		else
			E.private.sle.module.blizzmove.points[Name] = {a, b, c, d, e}
		end
	else
		self:SetUserPlaced(false)
	end
end

--On show set saved position
local function LoadPosition(self)
	if self.IsMoving == true then return end
	local Name = self:GetName()
	--Some frames don't have set positions when show script runs (e.g. CharacterFrame). For those set default position and save that.
	if not self:GetPoint() then
		self:SetPoint('TOPLEFT', 'UIParent', 'TOPLEFT', 16, -116, true)
		OnDragStop(self)
	end

	if E.private.sle.module.blizzmove.remember and E.private.sle.module.blizzmove.points[Name] then
		self:ClearAllPoints()
		local a,b,c,d,e = T.unpack(E.private.sle.module.blizzmove.points[Name])
		self:SetPoint(a,b,c,d,e, true)
	end

	--If this frame has others that showld not be shown at the same time, hide those
	if B.ExlusiveFrames[Name] then
		for _, name in T.pairs(B.ExlusiveFrames[Name]) do _G[name]:Hide() end
	end
end

--Hooking this to movable frames' SetPoint.
--Blizz love to move some frames when stuff happens, so if SetPoint is not passing an additional arg we call SetPoint again with saved position.
function B:RewritePoint(anchor, parent, point, x, y, SLEcalled)
	if not SLEcalled then LoadPosition(self) end
end

function B:MakeMovable(Name)
	local frame = _G[Name]
	if not frame then --Frame in the list was removed since the last time I checked
		SLE:Print("Frame to move doesn't exist: "..(frameName or "Unknown"), "error")
		return
	end

	if Name == "AchievementFrame" then AchievementFrameHeader:EnableMouse(false) end --Cause achievement frame is a bitch

	frame:EnableMouse(true)
	frame:SetMovable(true)
	frame:SetClampedToScreen(true)
	frame:RegisterForDrag("LeftButton")
	frame:HookScript("OnShow", LoadPosition)
	frame:HookScript("OnDragStart", OnDragStart)
	frame:HookScript("OnDragStop", OnDragStop)
	frame:HookScript("OnHide", OnDragStop)
	hooksecurefunc(frame, "SetPoint", B.RewritePoint)

	--Removing stuff from auto positioning and putting them in "close on esc" list
	if E.private.sle.module.blizzmove.remember then
		frame.ignoreFramePositionManager = true
		if UIPanelWindows[Name] then
			for Key in T.pairs(UIPanelWindows[Name]) do
				if Key == 'area' or Key == "pushable" then
					UIPanelWindows[Name][Key] = nil
				end
			end
		end
		--Putting to the "close on esc" list. Unless frames are specificallu excluded.
		if not B.NoSpecialFrames[Name] and not UISpecialFrames[Name] then T.tinsert(UISpecialFrames, Name) end
	end

	--Putting stuff on respected saved positions
	C_Timer.After(0, function()
		if E.private.sle.module.blizzmove.remember and E.private.sle.module.blizzmove.points[Name] then
			if not frame:GetPoint() then
				frame:SetPoint('TOPLEFT', 'UIParent', 'TOPLEFT', 16, -116, true)
				OnDragStop(frame)
			end

			frame:ClearAllPoints()
			local a,b,c,d,e = T.unpack(E.private.sle.module.blizzmove.points[Name])
			frame:SetPoint(a,b,c,d,e, true)
		end
	end)

end

function B:Addons(event, addon)
	addon = B.AddonsList[addon]
	if not addon then return end
	if T.type(addon) == "table" then
		for i = 1, #addon do
			B:MakeMovable(addon[i])
		end
	else
		B:MakeMovable(addon)
	end
	B.addonCount = B.addonCount + 1
	--If every blizz addon is loaded we don't need to listen to thise event
	if B.addonCount == #B.AddonsList then B:UnregisterEvent(event) end
end

function B:VehicleScale()
	local frame = _G["VehicleSeatIndicator"]
	local frameScale = B.db.vehicleSeatScale
	frame:SetScale(frameScale)
	if frame.mover then
		frame.mover:SetSize(frameScale * frame:GetWidth(), frameScale * frame:GetHeight())
	end
end

function B:ErrorFrameSize()
	_G["UIErrorsFrame"]:SetSize(B.db.errorframe.width, B.db.errorframe.height) --512 x 60
end

function B:Initialize()
	B.db = E.db.sle.blizzard
	if not SLE.initialized then return end
	B.addonCount = 0
	--DB conversion
	if E.private.sle.module.blizzmove and T.type(E.private.sle.module.blizzmove) == "boolean" then E.private.sle.module.blizzmove = V.sle.module.blizzmove end --Old setting conversions
	E.global.sle.pvpreadydialogreset = nil
	if not E.private.sle.pvpreadydialogreset then E.private.sle.module.blizzmove.points["PVPReadyDialog"] = nil; E.private.sle.pvpreadydialogreset = true end

	PVPReadyDialog:Hide()

	if E.private.sle.module.blizzmove.enable then
		--Remove these from saved variables so the script will not attempt to mess with them
		for Name, _ in T.pairs(B.TempOnly) do
			if E.private.sle.module.blizzmove.points[Name] then E.private.sle.module.blizzmove.points[Name] = nil end
		end
		for i = 1, #B.Frames do
			B:MakeMovable(B.Frames[i])
		end
		self:RegisterEvent("ADDON_LOADED", "Addons")

		-- Check Forced Loaded AddOns
		for AddOn, Table in T.pairs(B.AddonsList) do
			if IsAddOnLoaded(AddOn) then
				for _, frame in T.pairs(Table) do
					B:MakeMovable(frame)
				end
			end
		end
	end

	hooksecurefunc(VehicleSeatIndicator,"SetPoint", B.VehicleScale)
	B:ErrorFrameSize()
	function B:ForUpdateAll()
		B.db = E.db.sle.blizzard
		B:VehicleScale()
		B:ErrorFrameSize()
	end
end

SLE:RegisterModule(B:GetName())
