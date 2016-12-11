local E, L = unpack(ElvUI) -- Import Functions/Constants, Config, Locales
local S = E:NewModule('AutoButton', 'AceEvent-3.0')

local _G = _G
local setglobal = setglobal
local wipe = table.wipe
local tinsert = table.insert
local tonumber,pairs,select,gsub = tonumber,pairs,select,string.gsub
local CreateFrame = CreateFrame
local CreateButton = CreateButton
local GetNumQuestWatches = GetNumQuestWatches
local GetQuestWatchInfo = GetQuestWatchInfo
local GetQuestLogSpecialItemInfo = GetQuestLogSpecialItemInfo
local GetItemSpell = GetItemSpell
local GetItemInfo = GetItemInfo
local InCombatLockdown = InCombatLockdown
local GetItemCount = GetItemCount
local GetCurrentMapAreaID = GetCurrentMapAreaID
local GetItemIcon = GetItemIcon
local GetQuestLogSpecialItemCooldown = GetQuestLogSpecialItemCooldown
local GetItemCooldown = GetItemCooldown
local CooldownFrame_SetTimer = CooldownFrame_Set
local IsItemInRange = IsItemInRange
local GetInventoryItemTexture = GetInventoryItemTexture
local GetItemQualityColor = GetItemQualityColor
local GetInventoryItemCooldown = GetInventoryItemCooldown
local GetBindingKey = GetBindingKey

--Binding Variables
BINDING_HEADER_AutoSlotButton = "|cffC495DDEUI|r".. L["Auto InventoryItem Button"];
BINDING_HEADER_AutoQuestButton = "|cffC495DDEUI|r".. L["Auto QuestItem Button"];

for i = 1, 12 do
	_G["BINDING_NAME_CLICK AutoSlotButton"..i..":LeftButton"] = L["Auto InventoryItem Button"]..i
	_G["BINDING_NAME_CLICK AutoQuestButton"..i..":LeftButton"] = L["Auto QuestItem Button"]..i
end

----------------------------------------------------------------------------------------
--	AutoButton (by eui.cc at 2015/02/07)
----------------------------------------------------------------------------------------
local QuestItemList = {}
local garrisonsmv = {118897, 118903}
local garrisonsc = {114116, 114119, 114120, 120301, 120302}

local function GetQuestItemList()
	wipe(QuestItemList)
	for i = 1, GetNumQuestWatches() do
		local questID, title, questLogIndex, numObjectives, requiredMoney, isComplete, startEvent, isAutoComplete, failureTime, timeElapsed, questType, isTask, isStory, isOnMap, hasLocalPOI = GetQuestWatchInfo(i);
		if questLogIndex then
			local link, item, charges, showItemWhenComplete = GetQuestLogSpecialItemInfo(questLogIndex);
			if link then
				local itemID = tonumber(link:match(":(%d+):"))
				QuestItemList[itemID] = {
					['isComplete'] = isComplete,
					['showItemWhenComplete'] = showItemWhenComplete,
					['questLogIndex'] = questLogIndex,
				}
			end
		end
	end
	S:ScanItem()
end

local function haveIt(num, spellName)
	if not spellName then return false; end

	for i = 1, num do
		local AutoButton = _G["AutoQuestButton"..i]
		if not AutoButton then break; end
		if AutoButton.spellName == spellName then
			return false;
		end
	end
	return true;
end		
		
local function IsUsableItem(itemId)
	local itemSpell = GetItemSpell(itemId)
	if not itemSpell then return false; end
	
	return itemSpell
end

local function IsSlotItem(itemId)
	local itemSpell = IsUsableItem(itemId)
	local itemName = GetItemInfo(itemId)
	
	return itemSpell
end

local function AutoButtonHide(AutoButton)
	if not AutoButton then return end
	AutoButton:SetAlpha(0)
	if not InCombatLockdown() then
		AutoButton:EnableMouse(false)
	else
		AutoButton:RegisterEvent("PLAYER_REGEN_ENABLED")
		AutoButton:SetScript("OnEvent", function(self, event) 
			if event == "PLAYER_REGEN_ENABLED" then
				self:EnableMouse(false) 
				self:UnregisterEvent("PLAYER_REGEN_ENABLED") 
			end
		end)
	end
end

local function HideAllButton()
	local i
	for i = 1, 12 do
		AutoButtonHide(_G["AutoQuestButton"..i])
	end
	for i = 1, 12 do
		AutoButtonHide(_G["AutoSlotButton"..i])
	end
end

local function AutoButtonShow(AutoButton)
	if not AutoButton then return end
	AutoButton:SetAlpha(1)
	AutoButton:SetScript("OnEnter", function(self)
		if InCombatLockdown() then return; end
		GameTooltip:SetOwner(self, 'ANCHOR_BOTTOMRIGHT', 0, -2)
		GameTooltip:ClearLines()
		if self.slotID then
			GameTooltip:SetInventoryItem('player', self.slotID)
		else
			GameTooltip:SetItemByID(self.itemID)
		end
		GameTooltip:Show()
	end)
	AutoButton:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)
	
	if not InCombatLockdown() then
		AutoButton:EnableMouse(true)
		if AutoButton.slotID then
			AutoButton:SetAttribute("type", "macro")
			AutoButton:SetAttribute("macrotext", "/use "..AutoButton.slotID)
		elseif AutoButton.itemName then
			AutoButton:SetAttribute("type", "item")
			AutoButton:SetAttribute("item", AutoButton.itemName)
		end
	else
		AutoButton:RegisterEvent("PLAYER_REGEN_ENABLED")
		AutoButton:SetScript("OnEvent", function(self, event) 
			if event == "PLAYER_REGEN_ENABLED" then
				self:EnableMouse(true) 
				if self.slotID then
					self:SetAttribute("type", "macro")
					self:SetAttribute("macrotext", "/use "..self.slotID)
				elseif self.itemName then
					self:SetAttribute("type", "item")
					self:SetAttribute("item", self.itemName)
				end
				self:UnregisterEvent("PLAYER_REGEN_ENABLED") 
			end
		end)
	end
end

local function CreateButton(name, size)
	if _G[name] then
		_G[name]:Size(size)
		_G[name].c:FontTemplate(nil, E.db.euiscript.autobutton.countFontSize, 'OUTLINE')
		_G[name].k:FontTemplate(nil, E.db.euiscript.autobutton.bindFontSize, 'OUTLINE')
		return _G[name]
	end
	
	-- Create button
	local AutoButton = CreateFrame("Button", name, E.UIParent, "SecureActionButtonTemplate")
	AutoButton:Size(size)
	AutoButton:SetTemplate("Default")
	AutoButton:StyleButton()
	AutoButton:SetClampedToScreen(true)
	AutoButton:SetAttribute("type", "item")
	AutoButton:SetAlpha(0)
	AutoButton:EnableMouse(false)
	AutoButton:RegisterForClicks('AnyUp')

	-- Texture for our button
	AutoButton.t = AutoButton:CreateTexture(nil, "OVERLAY", nil)
	AutoButton.t:Point("TOPLEFT", AutoButton, "TOPLEFT", 2, -2)
	AutoButton.t:Point("BOTTOMRIGHT", AutoButton, "BOTTOMRIGHT", -2, 2)
	AutoButton.t:SetTexCoord(0.1, 0.9, 0.1, 0.9)

	-- Count text for our button
	AutoButton.c = AutoButton:CreateFontString(nil, "OVERLAY")
	AutoButton.c:FontTemplate(nil, E.db.euiscript.autobutton.countFontSize, 'OUTLINE')
	AutoButton.c:SetTextColor(1, 1, 1, 1)
	AutoButton.c:Point("BOTTOMRIGHT", AutoButton, "BOTTOMRIGHT", 0.5, 0)
	AutoButton.c:SetJustifyH("CENTER")	

	-- Binding text for our button
	AutoButton.k = AutoButton:CreateFontString(nil, "OVERLAY")
	AutoButton.k:FontTemplate(nil, E.db.euiscript.autobutton.bindFontSize, 'OUTLINE')
	AutoButton.k:SetTextColor(0.6, 0.6, 0.6)
	AutoButton.k:Point("TOPRIGHT", AutoButton, "TOPRIGHT", 1, -3)
	AutoButton.k:SetJustifyH("RIGHT")		
	
	-- Cooldown
	AutoButton.Cooldown = CreateFrame("Cooldown", nil, AutoButton, "CooldownFrameTemplate")
	AutoButton.Cooldown:Point("TOPLEFT", AutoButton, "TOPLEFT", 2, -2)
	AutoButton.Cooldown:Point("BOTTOMRIGHT", AutoButton, "BOTTOMRIGHT", -2, 2)
	AutoButton.Cooldown:SetSwipeColor(0, 0, 0, 0)
	AutoButton.Cooldown:SetDrawBling(false)
	
	E:RegisterCooldown(AutoButton.Cooldown)
	
	E.FrameLocks[name] = true;
	return AutoButton
end

function S:InsertOpt()
	for k, v in pairs(E.db.euiscript.autobutton.itemList) do
		E.Options.args.euiscript.args.autobutton.args.itemList.values[k] = k
	end
	for k, v in pairs(E.db.euiscript.autobutton.slotList) do
		E.Options.args.euiscript.args.autobutton.args.slotList.values[k] = k
	end
end

function S:ScanItem(event)
	local db = E.db.euiscript.autobutton
	HideAllButton()

	-- Scan bags for Item matchs
	local questItemIDList = {}
	local minimapZoneText = GetMinimapZoneText()
	if minimapZoneText == L["Alliance Mine"] or minimapZoneText == L["Horde Mine"] then
		for i = 1, #garrisonsmv do
			local count = GetItemCount(garrisonsmv[i])
			if count and (count > 0) and (not db.blankList[garrisonsmv[i]]) then
				tinsert(questItemIDList, garrisonsmv[i])
			end
		end
	elseif minimapZoneText == L["Salvage Yard"] then
		for i = 1, #garrisonsc do
			local count = GetItemCount(garrisonsc[i])
			if count and (count > 0) and (not db.blankList[garrisonsc[i]]) then
				tinsert(questItemIDList, garrisonsc[i])
			end
		end
	else
		for k, v in pairs(QuestItemList) do
			if (not QuestItemList[k].isComplete) or (QuestItemList[k].isComplete and QuestItemList[k].showItemWhenComplete) then
				if not db.blankList[k] then
					tinsert(questItemIDList, k)
				end
			end
		end
		for k, v in pairs(E.db.euiscript.autobutton.whiteList) do
			local count = GetItemCount(k)
			if count and (count > 0) and v and (not db.blankList[k]) then
				tinsert(questItemIDList, k)
			end
		end
		if GetItemCount(123866) and (GetItemCount(123866) >= 5) and (not db.blankList[123866]) and (GetCurrentMapAreaID() == 945) then
			tinsert(questItemIDList, 123866)
		end			
	end
	
	sort(questItemIDList, function(v1, v2) 
		local itemType1 = select(7, GetItemInfo(v1))
		local itemType2 = select(7, GetItemInfo(v2))
		if itemType1 and itemType2 then
			return itemType1 > itemType2
		else
			return v1 > v2
		end
	end)
	
	if db.questNum > 0 then
		for i = 1, #questItemIDList do
			local itemID = questItemIDList[i]
			local itemName = GetItemInfo(itemID)

			if i > db.questNum then break; end
			
			local AutoButton = _G["AutoQuestButton"..i]
			
			local count = GetItemCount(itemID, nil, 1)
			local itemIcon = GetItemIcon(itemID)
			
			if not AutoButton then break end
			-- Set our texture to the item found in bags
			AutoButton.t:SetTexture(itemIcon)
			AutoButton.itemName = itemName
			AutoButton.itemID = itemID
			AutoButton.questLogIndex = QuestItemList[itemID] and QuestItemList[itemID].questLogIndex or -1
			AutoButton.spellName = IsUsableItem(itemID)
			AutoButton:SetBackdropBorderColor(1.0, 0.3, 0.3)

			-- Get the count if there is one
			if count and count > 1 then
				AutoButton.c:SetText(count)
			else
				AutoButton.c:SetText("")
			end
			
			AutoButton:SetScript("OnUpdate", function(self, elapsed)
				local start, duration, enable
				if self.questLogIndex > 0 then
					start, duration, enable = GetQuestLogSpecialItemCooldown(self.questLogIndex)
				else
					start, duration, enable = GetItemCooldown(self.itemID)
				end
				CooldownFrame_SetTimer(self.Cooldown, start, duration, enable)
				if ( duration and duration > 0 and enable and enable == 0 ) then
					self.t:SetVertexColor(0.4, 0.4, 0.4);
				elseif IsItemInRange(itemID, 'target') == 0 then
					self.t:SetVertexColor(1, 0, 0)
				else
					self.t:SetVertexColor(1, 1, 1)
				end
			end)
			AutoButtonShow(AutoButton)
		end
	end
	
	-- Scan inventory for Equipment matches
	local num = 0
	if db.slotNum > 0 then
		for w = 1, 18 do
			local slotID = GetInventoryItemID("player", w)
			if slotID and IsSlotItem(slotID) and not db.blankList[slotID] then
				local iSpell = GetItemSpell(slotID)
				local itemName, _, rarity = GetItemInfo(slotID)
				
				local itemIcon = GetInventoryItemTexture("player", w)
				num = num + 1
				if num > db.slotNum then break; end
				
				local AutoButton = _G["AutoSlotButton".. num]
				if not AutoButton then break; end

				if rarity and rarity > 1 then
					local r, g, b = GetItemQualityColor(rarity);
					AutoButton:SetBackdropBorderColor(r, g, b);
				end				
				-- Set our texture to the item found in bags
				AutoButton.t:SetTexture(itemIcon)
				AutoButton.c:SetText("")
			--	AutoButton.itemName = itemName
				AutoButton.slotID = w
				AutoButton.itemID = slotID
			--	AutoButton.itemLink = GetInventoryItemLink('player', w)
				AutoButton.spellName = IsUsableItem(slotID)
				
				AutoButton:SetScript("OnUpdate", function(self, elapsed)
					local cd_start, cd_finish, cd_enable = GetInventoryItemCooldown("player", self.slotID)
					CooldownFrame_SetTimer(AutoButton.Cooldown, cd_start, cd_finish, cd_enable)
				end)				
				AutoButtonShow(AutoButton)
			end
		end
	end
end

local lastUpdate = 0
function S:ScanItemCount(elapsed)
	lastUpdate = lastUpdate + elapsed
	if lastUpdate < 0.5 then
		return
	end
	lastUpdate = 0
	for i = 1, E.db.euiscript.autobutton.questNum do
		local f = _G["AutoQuestButton"..i]
		if f and f.itemName then
			local count = GetItemCount(f.itemID, nil, 1)

			if count and count > 1 then
				f.c:SetText(count)
			else
				f.c:SetText("")
			end
		end
	end
end

function S:UpdateBind()
	local db = E.db.euiscript.autobutton
	if not db then return; end
	
	for i = 1, db.questNum do
		local bindButton = 'CLICK AutoQuestButton'..i..':LeftButton'
		local button = _G['AutoQuestButton'..i]
		local bindText = GetBindingKey(bindButton)
		if not bindText then
			bindText = ''
		else
			bindText = gsub(bindText, 'SHIFT--', 'S')
			bindText = gsub(bindText, 'CTRL--', 'C')
			bindText = gsub(bindText, 'ALT--', 'A')
		end
		
		if button then button.k:SetText(bindText) end
	end
	for i = 1, db.slotNum do
		local bindButton = 'CLICK AutoSlotButton'..i..':LeftButton'
		local button = _G['AutoSlotButton'..i]
		local bindText = GetBindingKey(bindButton)
		if not bindText then
			bindText = ''
		else
			bindText = gsub(bindText, 'SHIFT--', 'S')
			bindText = gsub(bindText, 'CTRL--', 'C')
			bindText = gsub(bindText, 'ALT--', 'A')
		end
		
		if button then button.k:SetText(bindText) end
	end
end

function S:ToggleAutoButton()
	if E.db.euiscript.autobutton.enable then
		self:RegisterEvent("BAG_UPDATE", "ScanItem")
		self:RegisterEvent("UNIT_INVENTORY_CHANGED", "ScanItem")
		self:RegisterEvent("ZONE_CHANGED", "ScanItem")
		self:RegisterEvent("ZONE_CHANGED_NEW_AREA", "ScanItem")		
		self:RegisterEvent("UPDATE_BINDINGS", "UpdateBind")
		self:RegisterEvent("QUEST_WATCH_LIST_CHANGED", GetQuestItemList);
		self:RegisterEvent("QUEST_LOG_UPDATE", GetQuestItemList);
		if not S.Update then S.Update = CreateFrame("Frame") end;
		self.Update:SetScript("OnUpdate", S.ScanItemCount)
		self:ScanItem();
		self:UpdateBind();
	else
		HideAllButton()
		self:UnregisterEvent("BAG_UPDATE")
		self:UnregisterEvent("UNIT_INVENTORY_CHANGED")
		self:UnregisterEvent("ZONE_CHANGED")
		self:UnregisterEvent("ZONE_CHANGED_NEW_AREA")		
		self:UnregisterEvent("UPDATE_BINDINGS")
		self:UnregisterEvent("QUEST_WATCH_LIST_CHANGED")
		self:UnregisterEvent("QUEST_LOG_UPDATE")
		if self.Update then self.Update:SetScript("OnUpdate", nil) end
	end
end

function S:UpdateAutoButton()
	local db = E.db.euiscript.autobutton
	local i = 0
	
	local lastButton, lastColumnButton, buttonsPerRow;
	for i = 1, db.questNum do
		local f = CreateButton("AutoQuestButton"..i, db.questSize)
		buttonsPerRow = db.questPerRow
		lastButton = _G["AutoQuestButton"..i-1];
		lastColumnButton = _G["AutoQuestButton"..i-buttonsPerRow];
		
		if db.questNum < db.questPerRow then
			buttonsPerRow = db.questNum;
		end		
		f:ClearAllPoints()
		
		if i == 1 then
			f:Point("LEFT", AutoButtonAnchor, "LEFT", 0, 0)
		elseif (i-1) % buttonsPerRow == 0 then
			f:Point("TOP", lastColumnButton, "BOTTOM", 0, -3)
		else
			f:Point("LEFT", lastButton, "RIGHT", 3, 0)
		end
	end
	
	for i = 1, db.slotNum do
		local f = CreateButton("AutoSlotButton"..i, db.slotSize)
		buttonsPerRow = db.slotPerRow
		lastButton = _G["AutoSlotButton"..i-1];
		lastColumnButton = _G["AutoSlotButton"..i-buttonsPerRow];
		
		if db.slotNum < db.slotPerRow then
			buttonsPerRow = db.questNum;
		end		
		f:ClearAllPoints()
		
		if i == 1 then
			f:Point("LEFT", AutoButtonAnchor2, "LEFT", 0, 0)
		elseif (i-1) % buttonsPerRow == 0 then
			f:Point("TOP", lastColumnButton, "BOTTOM", 0, -3)
		else
			f:Point("LEFT", lastButton, "RIGHT", 3, 0)
		end
	end
	self:ToggleAutoButton()
end

function S:Initialize()
	local db = E.db.euiscript.autobutton
	
	--Convert old ver.
	if E.db.euiscript.auto_quest_button == false then
		db.enable = false
		E.db.euiscript.auto_quest_button = nil
	end
	
	-- Create anchor
	local AutoButtonAnchor = CreateFrame("Frame", "AutoButtonAnchor", UIParent)
	AutoButtonAnchor:SetClampedToScreen(true)
	AutoButtonAnchor:Point("BOTTOMLEFT", RightChatPanel or LeftChatPanel, "TOPLEFT", 0, 4)
	AutoButtonAnchor:Size(db.questNum > 0 and db.questSize * db.questNum or 260, db.questNum > 0 and db.questSize or 40)
	E:CreateMover(AutoButtonAnchor, "AutoButtonAnchorMover", L["Auto QuestItem Button"], nil, nil, nil, "ALL,EUI", function() return E.db.euiscript.autobutton.enable; end)
	
	-- Create anchor2
	local AutoButtonAnchor2 = CreateFrame("Frame", "AutoButtonAnchor2", UIParent)
	AutoButtonAnchor2:SetClampedToScreen(true)
	AutoButtonAnchor2:Point("BOTTOMLEFT", RightChatPanel or LeftChatPanel, "TOPLEFT", 0, 48)
	AutoButtonAnchor2:Size(db.slotNum > 0 and db.slotSize * db.slotNum or 260, db.slotNum > 0 and db.slotSize or 40)
	E:CreateMover(AutoButtonAnchor2, "AutoButtonAnchor2Mover", L["Auto InventoryItem Button"], nil, nil, nil, "ALL,EUI", function() return E.db.euiscript.autobutton.enable; end)
	
	self:UpdateAutoButton()
end

E:RegisterModule(S:GetName())