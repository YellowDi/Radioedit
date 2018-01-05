-------------------------------------------------
-- Controller hints/input handler for ConsolePort
-------------------------------------------------
-- This file manages support for controller input
-- using ConsolePort, providing input handler and
-- displaying on-screen hints.

-------------------------------------------------
-- Initialization
-------------------------------------------------
local NPC, _, L = ImmersionFrame, ...
local HANDLE, KEY
do 
	-- list of functions existing on the HANDLE
	local HANDLE_functions = {
		'AddHint';
		'RemoveHint';
		'IsHintFocus';
		'SetHintDisabled';
		'GetHintForKey';
		'ClearHintsForFrame';
	}
	-- list of local functions that need to exist
	local NPC_functions = {
		'ToggleHintState';
		'SetImmersionFocus';
		'ClearImmersionFocus';
		'ParseControllerCommand';
	}

	-- For programming convenience, set all these functions to no-op
	-- if ConsolePort isn't loaded, since they won't be doing anything useful.
	if not ConsolePort then
		local function noop() end
		for _, funcID in ipairs(HANDLE_functions) do
			NPC[funcID] = noop
		end
		for _, funcID in ipairs(NPC_functions) do
			NPC[funcID] = noop
		end
		return
	else
		HANDLE, KEY = ConsolePortUIHandle, ConsolePort:GetData().KEY
		-- If any of the HANDLE functions are missing, bail out. 
		for _, funcID in ipairs(HANDLE_functions) do
			if not HANDLE[funcID] then
				return
			end
		end
	end
end

-------------------------------------------------
local Inspector = NPC.Inspector
local Titles = NPC.TitleButtons
local controllerInterrupt
-------------------------------------------------

-------------------------------------------------
-- Hint management
-------------------------------------------------

function NPC:AddHint(buttonID, text)
	if controllerInterrupt then
		return HANDLE:AddHint(KEY[buttonID], text)
	end
end

function NPC:RemoveHint(buttonID)
	if controllerInterrupt then
		return HANDLE:RemoveHint(KEY[buttonID])
	end
end

function NPC:SetHintEnabled(buttonID)
	if controllerInterrupt then
		return HANDLE:SetHintEnabled(KEY[buttonID])
	end
end

function NPC:SetHintDisabled(buttonID)
	if controllerInterrupt then
		return HANDLE:SetHintDisabled(KEY[buttonID])
	end
end

function NPC:ToggleHintState(buttonID, enabled)
	if controllerInterrupt then
		if enabled then
			return self:SetHintEnabled(buttonID)
		else
			return self:SetHintDisabled(buttonID)
		end
	end
end

function NPC:GetHintForKey(buttonID)
	return HANDLE:GetHintForKey(KEY[buttonID])
end

-------------------------------------------------
-- Handle hintbar focus set/release
-------------------------------------------------
function NPC:SetImmersionFocus()
	controllerInterrupt = true
	if not L('hideui') then
		HANDLE:ShowUI()
		HANDLE:HideUI(ImmersionFrame, true)
	end
	return HANDLE:SetHintFocus(ImmersionFrame)
end

function NPC:ClearImmersionFocus()
	controllerInterrupt = false
	if HANDLE:IsHintFocus(ImmersionFrame) then
		HANDLE:HideHintBar()
		if not L('hideui') then
			HANDLE:ShowUI()
		end
	end
	return HANDLE:ClearHintsForFrame(ImmersionFrame)
end

-------------------------------------------------
local ControllerInput = {
-------------------------------------------------
	[KEY.UP] = function(self)
		self.TitleButtons:SetPrevious()
	end,
	[KEY.DOWN] = function(self)
		self.TitleButtons:SetNext()
	end,
	[KEY.LEFT] = function(self)
		if self.isInspecting then
			self.Inspector:SetPrevious()
		end
	end,
	[KEY.RIGHT] = function(self)
		if self.isInspecting then
			self.Inspector:SetNext()
		end
	end,
	[KEY.SQUARE] = function(self)
		local text = self.TalkBox.TextFrame.Text
		if text:IsSequence() then
			if text:GetNumRemaining() <= 1 then
				text:RepeatTexts()
			else
				text:ForceNext()
			end
		end
	end,
	[KEY.CIRCLE] = function(self)
		if self.isInspecting then
			self.Inspector:Hide()
		elseif self.hasItems then
			self:ShowItems()
		end
	end,
	[KEY.CROSS] = function(self)
		-- Gossip/multiple quest choices
		if self.TitleButtons:GetMaxIndex() > 0 then
			self.TitleButtons:ClickFocused()
		-- Item inspection
		elseif self.isInspecting then
			self.Inspector:ClickFocused()
			self.Inspector:Hide()
		-- Complete quest
		elseif self.lastEvent == 'QUEST_COMPLETE' then
			-- if multiple items to choose between and none chosen
			if self.TalkBox.Elements.itemChoice == 0 and GetNumQuestChoices() > 1 then
				self:ShowItems()
			else
				self.TalkBox.Elements:CompleteQuest()
			end
		-- Accept quest
		elseif ( self.lastEvent == 'QUEST_DETAIL' or self.lastEvent == 'QUEST_ACCEPTED' ) then
			self.TalkBox.Elements:AcceptQuest()
		-- Progress quest (why are these functions named like this?)
		elseif IsQuestCompletable() then
			CompleteQuest()
		end
	end,
	[KEY.TRIANGLE] = function(self) CloseGossip() CloseQuest() end,
	[KEY.OPTIONS] = function(self) CloseGossip() CloseQuest() end,
	[KEY.CENTER] = function(self) CloseGossip() CloseQuest() end,
	[KEY.SHARE] = function(self) CloseGossip() CloseQuest() end,
-------------------------------------------------
} -----------------------------------------------
-------------------------------------------------

function NPC:ParseControllerCommand(button)
	if controllerInterrupt then 
		if button:match(L('inspect')) or button:match('SHIFT') then
			self.Inspector:ShowFocusedTooltip(true)
			return true
		end
		local keyID = ConsolePort:GetUIControlKey(GetBindingAction(button))
		local func = keyID and ControllerInput[keyID]
		if func then
			func(self)
			return true
		end
	end
end

----------------------------------
-- Button selector 
----------------------------------
local Selector = {}

function Selector:SetFocus(index)
	if self:IsVisible() and index then
		local focus = self:GetFocus()
		if focus then
			focus:UnlockHighlight()
			focus:OnLeave()
		end
		local max = self:GetMaxIndex() 
		self.index = ( index > max and max ) or ( index < 1 and 1 ) or index
		self:SetFocusHighlight()
		if max > 0 and self.HintText then
			NPC:AddHint('CROSS', self.HintText)
		else
			NPC:RemoveHint('CROSS')
		end
	end
end

function Selector:SetNext()
	local nextButton = self:GetNextButton(self.index, 1)
	self:SetFocus(nextButton and (nextButton.idx or nextButton:GetID()))
end

function Selector:SetPrevious()
	local prevButton = self:GetNextButton(self.index, -1)
	self:SetFocus(prevButton and (prevButton.idx or prevButton:GetID()))
end

function Selector:ClickFocused()
	local focus = self:GetFocus()
	if focus then
		focus:Click()
	end
end

function Selector:SetFocusHighlight()
	local focus = self:GetFocus()
	if focus then
		focus:LockHighlight()
		focus:OnEnter()
	end
end

function Selector:GetFocus()
	return self.Active[self.index]
end

function Selector:GetActive()
	return pairs(self.Active)
end

function Selector:GetNextButton(index, delta)
	if index then
		local modifier = delta
		while true do
			local key = index + delta
			if key < 1 or key > self.Threshold then
				return self.Active[self.index]
			end
			if self.Active[key] then
				return self.Active[key]
			else
				delta = delta + modifier
			end
		end
	end
end

function Selector:GetMaxIndex()
	local maxIndex = 0
	for i, button in pairs(self.Active) do
		if i > maxIndex then
			maxIndex = i
		end
	end
	return maxIndex
end



L.Mixin(Inspector, Selector)
L.Mixin(Titles, Selector)

----------------------------------
-- Extended script handlers
----------------------------------
-- Inspector
Inspector.Buttons = {}
Inspector.ignoreModifier = true

Inspector:HookScript('OnShow', function(self)
	local parent = self.parent
	self.CROSS = select(2, parent:GetHintForKey('CROSS'))
	self.CIRCLE = select(2, parent:GetHintForKey('CIRCLE'))
	self.SQUARE = select(2, parent:GetHintForKey('SQUARE'))

	parent.isInspecting = true
	parent:RemoveHint('SQUARE')
	parent:AddHint('CIRCLE', CLOSE)
	if ( parent.lastEvent == 'QUEST_PROGRESS' ) then
		parent:RemoveHint('CROSS')
	else
		parent:AddHint('CROSS', CHOOSE)
		HANDLE:AddHint('M1', CURRENTLY_EQUIPPED)
	end
end)

Inspector:HookScript('OnHide', function(self)
	local parent = self.parent

	parent.isInspecting = false
	HANDLE:RemoveHint('M1')
	if self.CROSS then
		parent:AddHint('CROSS', self.CROSS)
	end
	if self.SQUARE then
		parent:AddHint('SQUARE', self.SQUARE)
	end
	if self.CIRCLE then
		parent:AddHint('CIRCLE', self.CIRCLE)
	end
	self.CROSS = nil
	self.SQUARE = nil
	self.CIRCLE = nil
end)

function Inspector:ShowFocusedTooltip(showTooltip)
	local button = self:GetFocus()
	if button then
		if showTooltip then
			button:SetFocus()
		else
			button:ClearFocus()
		end
	end
end

-- Titles
Titles.Threshold = NUMGOSSIPBUTTONS
Titles.HintText = ACCEPT