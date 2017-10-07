local _, L = ...
local NPC = L.frame
----------------------------------
-- Events
----------------------------------
function NPC:GOSSIP_SHOW(...)
	self:UpdateTalkingHead(GetUnitName('npc'), GetGossipText(), 'GossipGossip')
	if self:IsGossipAvailable() then
		self:PlayIntro('GOSSIP_SHOW')
	end
end

function NPC:GOSSIP_CLOSED(...)
	CloseGossip()
	self:PlayOutro()
	if self:IsGossipOnTheFly() and self.lastEvent == 'GOSSIP_SHOW' then
		return self:OnEvent('GOSSIP_ONTHEFLY')
	end
end

function NPC:GOSSIP_ONTHEFLY(...) -- not a real event, but treat it like one.
	self.TalkBox:SetExtraOffset(0)
	self:PlayIntro('GOSSIP_ONTHEFLY', true)
	return 'GOSSIP_ONTHEFLY'
end

function NPC:QUEST_GREETING(...)
	self:PlayIntro('QUEST_GREETING')
	self:UpdateTalkingHead(GetUnitName('questnpc') or GetUnitName('npc'), GetGreetingText(), 'AvailableQuest')
end

function NPC:QUEST_PROGRESS(...) -- special case, doesn't use QuestInfo
	self:PlayIntro('QUEST_PROGRESS')
	self:UpdateTalkingHead(GetTitleText(), GetProgressText(), IsQuestCompletable() and 'ActiveQuest' or 'IncompleteQuest')
	local elements = self.TalkBox.Elements
	local hasItems = elements:ShowProgress('Stone')
	elements:UpdateBoundaries()
	if hasItems then
		local width, height = elements.Progress:GetSize()
		-- Extra: 32 padding + 8 offset from talkbox + 8 px bottom offset
		self.TalkBox:SetExtraOffset((height + 48) * L('elementscale')) 
		return
	end
	self:ResetElements()
end

function NPC:QUEST_COMPLETE(...)
	self:PlayIntro('QUEST_COMPLETE')
	self:UpdateTalkingHead(GetTitleText(), GetRewardText(), 'ActiveQuest')
	self:AddQuestInfo('QUEST_REWARD')
end

function NPC:QUEST_ACCEPTED(...)
	if self:IsGossipOnTheFly() then
		return self:OnEvent('GOSSIP_ONTHEFLY')
	end
end

function NPC:QUEST_FINISHED(...)
	CloseQuest()
	self:PlayOutro()
end

function NPC:QUEST_DETAIL(...)
	if self:IsQuestAutoAccepted(...) then
		self:PlayOutro()
		return
	end
	self:PlayIntro('QUEST_DETAIL')
	self:UpdateTalkingHead(GetTitleText(), GetQuestText(), 'AvailableQuest')
	self:AddQuestInfo('QUEST_DETAIL')
end


function NPC:QUEST_ITEM_UPDATE()
	local questEvent = (self.lastEvent ~= 'QUEST_ITEM_UPDATE') and self.lastEvent or self.questEvent
	self.questEvent = questEvent

	if questEvent and self[questEvent] then
		self[questEvent](self)
		return questEvent
	end
end

function NPC:ITEM_TEXT_BEGIN()
	local title = ItemTextGetItem()
	local creator = ItemTextGetCreator()
	if creator then
		title = title .. ' (' .. FROM .. ' ' .. creator .. ')'
	end
	DoEmote('read')
	self:RegisterEvent('PLAYER_STARTED_MOVING')
	self:PlayIntro('ITEM_TEXT_BEGIN')
	self:UpdateTalkingHead(title, '', 'TrainerGossip', 'player')
	-- add book model? (75431)
end

function NPC:ITEM_TEXT_READY()
	-- special case: pages need to be concatened together before displaying them.
	-- each new page re-triggers this event, so keep changing page until we run out.
	self.itemText = (self.itemText or '') .. '\n' .. (ItemTextGetText() or '')
	if ItemTextHasNextPage() then
		ItemTextNextPage()
		return
	end
	-- set text directly instead of updating talking head
	self.TalkBox.TextFrame.Text:SetText(self.itemText)
end


function NPC:ITEM_TEXT_CLOSED()
	local time = GetTime()
	if not self.readEmoteCancelled and ( self.lastTextClosed ~= time ) then
		DoEmote('read')
	end
	self.lastTextClosed = time
	self.readEmoteCancelled = nil
	self.itemText = nil
	self:UnregisterEvent('PLAYER_STARTED_MOVING')
	self:PlayOutro()
end

function NPC:PLAYER_STARTED_MOVING()
	self.readEmoteCancelled = true
	return 'ITEM_TEXT_READY'
end
