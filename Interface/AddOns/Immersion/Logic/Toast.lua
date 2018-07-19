local _, L = ...
local NPC, Text = ImmersionFrame, ImmersionFrame.TalkBox.TextFrame.Text
----------------------------------
local playbackQueue, textCache = {}, {}
----------------------------------

local function GetCreatureID(unit)
	local guid = UnitGUID(unit)
	return guid and select(6, strsplit('-', guid))
end

local function IsTextCached(text)
	for i, toast in ipairs(playbackQueue) do
		if toast.text == text then
			return i
		end
	end
end

local function IsFrameReady()
	local event = NPC.lastEvent or ''
	local notInGossip = event:match('GOSSIP') and not UnitExists('npc')
	local notInQuest = event:match('QUEST') and GetQuestID() == 0
	return notInGossip or notInQuest
end

local function CanToastPlay()
	return IsFrameReady() and #playbackQueue > 0
end

local function RemoveToastByKey(key, value)
	local i = 1
	while playbackQueue[i] do
		if playbackQueue[i][key] == value then
			tremove(playbackQueue, i)
		else
			i = i + 1
		end
	end
end

----------------------------------

function NPC:PlayToast(obstructingFrameOpen)
	if CanToastPlay() and not obstructingFrameOpen and not self:IsToastObstructed() then
		local toast = playbackQueue[1]
		if toast then
			self:PlayIntro('IMMERSION_TOAST', true)
			self:UpdateTalkingHead(toast.title, toast.text, toast.npcType, toast.display, true)
		end
	end
end

function NPC:QueueToast(title, text, npcType, unit)
	if not IsTextCached(text) then
		tinsert(playbackQueue, {
			title 	= title;
			text 	= text;
			npcType = npcType;
			questID = GetQuestID();
			youSaid = L.ClickedTitleCache or {};
			display = GetCreatureID(unit);
		})
	end
end

function NPC:RemoveToastByText(text)
	RemoveToastByKey('text', text)
	if CanToastPlay() then
		self:PlayToast()
	elseif IsFrameReady() then
		self:PlayOutro()
	end
end

function NPC:ClearToasts()
	wipe(playbackQueue)
end

----------------------------------

do	-- OBSTRUCTION:
	-- The toast should not play text while *obstructing* frames are showing.
	-- The user should be limited to one focal point at a time, so the case where
	-- multiple frames are playing text at the same time must be handled.
	local obstructorsShowing = 0
	local function ObstructorOnShow()
		obstructorsShowing = obstructorsShowing + 1
		if ( obstructorsShowing > 0 ) and ( NPC.playbackEvent == 'IMMERSION_TOAST' ) then
			NPC:PlayOutro(true)
			Text:PauseTimer()
		end
	end

	local function ObstructorOnHide()
		obstructorsShowing = obstructorsShowing - 1
		if ( obstructorsShowing < 1 ) and ( NPC.playbackEvent == 'IMMERSION_TOAST' ) then
			NPC:PlayToast()
		end
	end

	local function AddToastObstructor(frame)
		assert(C_Widget.IsFrameWidget(frame), 'ImmersionToast:AddObstructor(frame): invalid frame widget')
		frame:HookScript('OnShow', ObstructorOnShow)
		frame:HookScript('OnHide', ObstructorOnHide)

		obstructorsShowing = obstructorsShowing + (frame:IsVisible() and 1 or 0)
	end

	function NPC:IsToastObstructed()
		return obstructorsShowing > 0
	end

	-- Force base frames and TalkingHeadFrame.
	AddToastObstructor(LevelUpDisplay)
	AddToastObstructor(AlertFrame)

	if TalkingHeadFrame then
		Toast:AddObstructor(TalkingHeadFrame)
	else
		hooksecurefunc('TalkingHead_LoadUI', function() AddToastObstructor(TalkingHeadFrame) end)
	end
end


--[[ Keep in case of reimplementing this functionality

function Toast:DisplayClickableQuest(questID)
	local hasQuestID 	= ( questID and questID ~= 0)
	local logIndex 		= ( hasQuestID and GetQuestLogIndexByID(questID) )
	local isQuestActive = ( logIndex and logIndex ~= 0 )
	local isQuestTurnIn = ( hasQuestID and IsQuestComplete(questID) )
	local isQuestCompleted = ( hasQuestID and IsQuestFlaggedCompleted(questID) )

	if hasQuestID then
		self.Subtitle:SetVertexColor(1, .82, 0)
		self.ToastType:SetTexture(nil)
	else
		self.Subtitle:SetVertexColor(.75, .75, .75)
	end

	self.logIndex = nil
	self.questID = nil
	self.QuestButton:Hide()

	if isQuestTurnIn or isQuestActive then
		self.logIndex = logIndex
		self.questID = questID
		self.CacheType:SetTexture(nil)
		self.QuestButton:Show()
	elseif isQuestCompleted then
		self.CacheType:SetTexture('Interface\\GossipFrame\\BankerGossipIcon')
	elseif hasQuestID then
		self.CacheType:SetTexture('Interface\\GossipFrame\\AvailableQuestIcon')
	end
end

-- Show quest details if available.
function Toast:OnQuestButtonClicked()
	if self.logIndex and self.questID then
		SetSuperTrackedQuestID(self.questID)
	end
end

local QUEST_ICONS
do 	local QUEST_ICONS_FILE = 'Interface\\QuestFrame\\QuestTypeIcons'
	local QUEST_ICONS_FILE_WIDTH = 128
	local QUEST_ICONS_FILE_HEIGHT = 64
	local QUEST_ICON_SIZE = 18

	local function CreateQuestIconTextureMarkup(left, right, top, bottom)
		return CreateTextureMarkup(
			QUEST_ICONS_FILE, 
			QUEST_ICONS_FILE_WIDTH, 
			QUEST_ICONS_FILE_HEIGHT, 
			QUEST_ICON_SIZE, QUEST_ICON_SIZE, 
			left / QUEST_ICONS_FILE_WIDTH,
			right / QUEST_ICONS_FILE_WIDTH,
			top / QUEST_ICONS_FILE_HEIGHT,
			bottom / QUEST_ICONS_FILE_HEIGHT) .. ' '
	end

	QUEST_ICONS = {
		item 	= CreateQuestIconTextureMarkup(18, 36, 36, 54);
		object 	= CreateQuestIconTextureMarkup(72, 90,  0, 18);
		event 	= CreateQuestIconTextureMarkup(36, 54, 18, 36);
		monster = CreateQuestIconTextureMarkup(0,  18, 36, 54);
	--	reputation = CreateQuestIconTextureMarkup();
	--	log = CreateQuestIconTextureMarkup();
	-- 	player = CreateQuestIconTextureMarkup();
	}
end

function Toast:OnQuestButtonMouseover()
	if self.questID then
		local logIndex = GetQuestLogIndexByID(self.questID)
		if logIndex then
			local title, level, suggestedGroup, isHeader, isCollapsed, isComplete, frequency, questID = GetQuestLogTitle(logIndex)

			GameTooltip:SetOwner(self.QuestButton, 'ANCHOR_TOPLEFT')
			GameTooltip:AddLine(title)

			if isComplete and isComplete > 0 then
				local completionText = GetQuestLogCompletionText(logIndex) or QUEST_WATCH_QUEST_READY
				GameTooltip:AddLine(completionText, 1, 1, 1, true)
			else
				local _, objectiveText = GetQuestLogQuestText(logIndex)
				GameTooltip:AddLine(objectiveText, 1, 1, 1, true)

				local requiredMoney = GetQuestLogRequiredMoney(logIndex)
				local numObjectives = GetNumQuestLeaderBoards(logIndex)

				if numObjectives > 0 then
					GameTooltip:AddLine(' ')
				end

				for i = 1, numObjectives do
					local text, objectiveType, finished = GetQuestLogLeaderBoard(i, logIndex)
					if text then
						local color = HIGHLIGHT_FONT_COLOR
						local marker = QUEST_ICONS[objectiveType] or QUEST_DASH
						if finished then
							color = GRAY_FONT_COLOR
						end
						GameTooltip:AddLine(marker..text, color.r, color.g, color.b, true)
					end
				end
				if 	requiredMoney > 0 then
					local playerMoney = GetMoney()
					local color = HIGHLIGHT_FONT_COLOR
					if 	requiredMoney <= playerMoney then
						playerMoney = requiredMoney
						color = GRAY_FONT_COLOR
					end
					GameTooltip:AddLine(QUEST_DASH..GetMoneyString(playerMoney)..' / '..GetMoneyString(requiredMoney), color.r, color.g, color.b)
				end
				GameTooltip:Show()
			end
		end
	end
end
]]--
