local A, C, M, L = select(2, ...):unpack()

local ObjectiveTracker = CreateFrame("Frame")

local Class = select(2, UnitClass("player"))
local CustomClassColor = A.Colors.class[Class]

local Font = C.Media.Font
local Font2 = C.Media.Font2

function ObjectiveTracker:SkinMinimizeButton()
	local MinimizeButton = ObjectiveTrackerFrame.HeaderMenu.MinimizeButton
	MinimizeButton:Point("TOPRIGHT", ObjectiveTrackerFrame, 32, -14)
	MinimizeButton:Size(12, 12)
	MinimizeButton:CreateBackdrop()
	MinimizeButton:SkinButton()

	local MinimizeText = MinimizeButton:CreateFontString(nil, "OVERLAY")
	MinimizeText:Point("CENTER", 1.4, -0.2)
	MinimizeText:SetFontTemplate(Font, 18)
	MinimizeText:SetText("-")
end

function ObjectiveTracker:SetPoint()
	local ObjectiveFrame = _G["ObjectiveTrackerFrame"]
	local GetTop = ObjectiveFrame:GetTop() or 0
	local ScreenHeight = GetScreenHeight()
	local GapFromTop = ScreenHeight - GetTop
	local MaxHeight = ScreenHeight - GapFromTop
	local SetObjectiveFrameHeight = min(MaxHeight, 480)

	local ObjectiveFrameHolder = CreateFrame("Frame", nil, UIParent)
	ObjectiveFrameHolder:Width(130)
	ObjectiveFrameHolder:Height(22)
	ObjectiveFrameHolder:Point("TOPRIGHT", UIParent, -92, -242)

	ObjectiveFrame:ClearAllPoints()
	ObjectiveFrame:Point("TOP", ObjectiveFrameHolder)
	ObjectiveFrame:Height(SetObjectiveFrameHeight)

	hooksecurefunc(ObjectiveTrackerFrame, "SetPoint", function(_,_, Parent)
		if (Parent ~= ObjectiveFrameHolder) then
			ObjectiveFrame:ClearAllPoints()
			ObjectiveFrame:Point("TOP", ObjectiveFrameHolder, 0, 0)
		end
	end)
end

function ObjectiveTracker:Skin()
	local Frame = ObjectiveTrackerFrame.MODULES

	if (Frame) then
		for i = 1, #Frame do
		
			local Modules = Frame[i]
			if (Modules) then
				local Header = Modules.Header
				Header:SetFrameStrata("HIGH")
				Header:SetFrameLevel(5)
				
				local Background = Modules.Header.Background	
				Background:SetAtlas(nil)
			
				local Text = Modules.Header.Text
				Text:SetFontTemplate(Font2, 16)
				Text:SetDrawLayer("OVERLAY", 7)
				Text:SetParent(Header)

				if not (Modules.IsSkinned) then			
					local HeaderPanel = CreateFrame("Frame", nil, Modules.Header)
					HeaderPanel:SetFrameLevel(Modules.Header:GetFrameLevel() - 1)
					HeaderPanel:SetFrameStrata("BACKGROUND")
					HeaderPanel:SetOutside()

					local Background = HeaderPanel:CreateTexture(nil, "LOW")
					Background:Size(232, 8)
					Background:Point("CENTER", HeaderPanel, -6, -9)
					Background:SetTexture("Interface\\Buttons\\WHITE8x8")
					Background:SetVertexColor(unpack(CustomClassColor))

					local BackgroundBorder = CreateFrame("Frame", nil, HeaderPanel)
					BackgroundBorder:Size(232, 8)
					BackgroundBorder:Point("CENTER", HeaderPanel, -6, -9)
					BackgroundBorder:SetTemplate(nil, nil, nil, nil, true)
					
					Modules.IsSkinned = true
				end
			end
		end
	end
end

function ObjectiveTracker:SkinScenario()
	local StageBlock = _G["ScenarioStageBlock"]
	StageBlock:StripTexture()
	--StageBlock:SetHeight(50)

	local StageText = StageBlock.Stage
	--StageText:SetHeight(14)
	StageText:SetFontTemplate(Font2, 16)

	local NameText = StageBlock.Name
	NameText:SetFontTemplate(Font2, 14)
end

function ObjectiveTracker:UpdateQuestItem(block)
	local QuestItemButton = block.itemButton
	
	if (QuestItemButton) then
		local Icon = QuestItemButton.icon
		local Count = QuestItemButton.Count
	
		if not (QuestItemButton.IsSkinned) then
			QuestItemButton:Size(26, 26)
			QuestItemButton:SetTemplate(true, 26, 26)
			QuestItemButton:StyleButton()
			QuestItemButton:SetNormalTexture(nil)
			
			if (Icon) then
				Icon:SetTexCoord(unpack(A.TexCoords))
			end
		
			if (Count) then
				Count:ClearAllPoints()
				Count:Point("BOTTOMRIGHT", QuestItemButton, 0, 3)
				Count:SetFontTemplate(Font2, 12)
			end

			QuestItemButton.IsSkinned = true
		end
	end
end
	
function ObjectiveTracker:UpdateProgressBar(_, line) 
	local Progress = line.ProgressBar
	local Bar = Progress.Bar
	
	if (Bar) then
		local Label = Bar.Label
		local Icon = Bar.Icon
		local IconBG = Bar.IconBG
		local Backdrop = Bar.BarBG
		local Glow = Bar.BarGlow
		local Sheen = Bar.Sheen
		local Frame = Bar.BarFrame
		local Frame2 = Bar.BarFrame2
		local Frame3 = Bar.BarFrame3
		local BorderLeft = Bar.BorderLeft
		local BorderRight = Bar.BorderRight
		local BorderMid = Bar.BorderMid
	
		if not (Bar.IsSkinned) then
			if (Backdrop) then Backdrop:Hide() Backdrop:SetAlpha(0) end
			if (IconBG) then IconBG:SetAlpha(0) end
			if (Glow) then Glow:Hide() end
			if (Sheen) then Sheen:Hide() end
			if (Frame) then Frame:Hide() end
			if (Frame2) then Frame2:Hide() end
			if (Frame3) then Frame3:Hide() end
			if (BorderLeft) then BorderLeft:SetAlpha(0) end
			if (BorderRight) then BorderRight:SetAlpha(0) end
			if (BorderMid) then BorderMid:SetAlpha(0) end
	
			Bar:Height(20)
			Bar:SetStatusBarTexture("Interface\\Buttons\\WHITE8x8")
			Bar:SetTemplate()
		
			Bar.NewBackdrop = CreateFrame("Frame", nil, Bar)
			Bar.NewBackdrop:SetInside()
			Bar.NewBackdrop:SetFrameLevel(Bar:GetFrameLevel() - 1)
			Bar.NewBackdrop:SetBackdrop({
				bgFile = "Interface\\Buttons\\WHITE8x8",
			})
			Bar.NewBackdrop:SetBackdropColor(unpack(C.General.BackdropColor))
		
			if (Label) then
				Label:ClearAllPoints()
				Label:Point("CENTER", Bar, 0, 0)
				Label:SetFontTemplate(Font2, 12)
			end
	
			if (Icon) then
				Icon:Size(20, 20)
				Icon:SetMask("")
				Icon:SetTexCoord(unpack(A.TexCoords))
				Icon:ClearAllPoints()
				Icon:Point("RIGHT", Bar, 26, 0)
		
				if not (Bar.NewBorder) then
					Bar.NewBorder = CreateFrame("Frame", nil, Bar)
					Bar.NewBorder:SetTemplate()
					Bar.NewBorder:SetOutside(Icon)
					Bar.NewBorder:SetShown(Icon:IsShown())
				end
			end
		
			Bar.IsSkinned = true
		elseif (Icon and Bar.NewBorder) then
			Bar.NewBorder:SetShown(Icon:IsShown())
		end
	end
end

function ObjectiveTracker:UpdateProgressBarColors(Min)
	if (self.Bar and Min) then		
		local R, G, B = A.ColorGradient(Min, 100, 0.8, 0, 0, 0.8, 0.8, 0, 0, 0.8, 0)
		self.Bar:SetStatusBarColor(R, G, B)
	end
end

local function SkinGroupFindButton(block)
	local HasGroupFinderButton = block.hasGroupFinderButton
	local GroupFinderButton = block.groupFinderButton

	if (HasGroupFinderButton and GroupFinderButton) then
		if not (GroupFinderButton.IsSkinned) then
			GroupFinderButton:SkinButton()
			GroupFinderButton:Size(18)
	
			GroupFinderButton.IsSkinned = true
		end
	end
end

local function UpdatePositions(block)
	local GroupFinderButton = block.groupFinderButton
	local ItemButton = block.itemButton

	if (ItemButton) then
		local PointA, PointB, PointC, PointD, PointE = ItemButton:GetPoint()
		ItemButton:Point(PointA, PointB, PointC, 2, -10)
	end
	
	if (GroupFinderButton) then
		local GPointA, GPointB, GPointC, GPointD, GPointE = GroupFinderButton:GetPoint()
		GroupFinderButton:Point(GPointA, GPointB, GPointC, 22, -4)
	end
end

function ObjectiveTracker:AddHooks()
	hooksecurefunc("ObjectiveTracker_Update", self.Skin)
	hooksecurefunc("ScenarioBlocksFrame_OnLoad", self.SkinScenario)
	hooksecurefunc(SCENARIO_CONTENT_TRACKER_MODULE, "Update", self.SkinScenario)
	hooksecurefunc(QUEST_TRACKER_MODULE, "SetBlockHeader", self.UpdateQuestItem)
	hooksecurefunc(WORLD_QUEST_TRACKER_MODULE, "AddObjective", self.UpdateQuestItem)
	hooksecurefunc(DEFAULT_OBJECTIVE_TRACKER_MODULE, "AddProgressBar", self.UpdateProgressBar)
	hooksecurefunc(BONUS_OBJECTIVE_TRACKER_MODULE, "AddProgressBar", self.UpdateProgressBar)
	hooksecurefunc(WORLD_QUEST_TRACKER_MODULE, "AddProgressBar", self.UpdateProgressBar)
	hooksecurefunc(SCENARIO_TRACKER_MODULE, "AddProgressBar", self.UpdateProgressBar)
	hooksecurefunc("BonusObjectiveTrackerProgressBar_SetValue", self.UpdateProgressBarColors)
	hooksecurefunc("ObjectiveTrackerProgressBar_SetValue", self.UpdateProgressBarColors)
	hooksecurefunc("ScenarioTrackerProgressBar_SetValue", self.UpdateProgressBarColors)
	hooksecurefunc("QuestObjectiveSetupBlockButton_FindGroup", SkinGroupFindButton)
	hooksecurefunc("QuestObjectiveSetupBlockButton_AddRightButton", UpdatePositions)
end

function ObjectiveTracker:Enable()
	if (C.ObjectiveTracker.ObjectiveTrackerMod) then
		self:SkinMinimizeButton()
		self:AddHooks()
	end

	self:SetPoint()
end

ObjectiveTracker:RegisterEvent("PLAYER_LOGIN")
ObjectiveTracker:RegisterEvent("PLAYER_ENTERING_WORLD")
ObjectiveTracker:RegisterEvent("ADDON_LOADED")

ObjectiveTracker:SetScript("OnEvent", function(self, event)
	if (event == "PLAYER_LOGIN") then
		self:Enable()
	end
end)