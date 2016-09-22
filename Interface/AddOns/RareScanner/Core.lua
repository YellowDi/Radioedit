-----------------------------------------------------------------------
-- AddOn namespace.
-----------------------------------------------------------------------
local LibStub = _G.LibStub
local RareScanner = LibStub("AceAddon-3.0"):NewAddon("RareScanner")

local ADDON_NAME, private = ...
local GARRISON_MAP_ID_HORDE = 976
local GARRISON_MAP_ID_ALLIANCE = 971
local DRAENOR_MAP_ID = 962
local ASHRAN_MAP_ID = 978
local NPC_VIGNETTE = 4733
local CONTAINER_VIGNETTE = 4715
local EVENT_VIGNETTE = 4716
local MAX_ITEMS_LOOT_BAR = 9

-- Locales
local AL = LibStub("AceLocale-3.0"):GetLocale("RareScanner");

-- Settings
local PROFILE_DEFAULTS = {
	char = {
		general = {
			scanRares = true,
			scanContainers = true,
			scanEvents = true,
			scanGarrison = false,
			scanAshran = true,
			filteredRares = {}
		},
		sound = {
			soundPlayed = "Siege Engineer Weapon",
			soundObjectPlayed = "PVP Horde",
			soundDisabled = true
		},
		display = {
			displayButton = true,
			autoHideButton = 0,
			displayLoot = true,
			lootTooltipPosition = "ANCHOR_LEFT",
			displayChatMessage = true,
			lootMinQuality = 3
		},
	},
}

-- Main button
local scanner_button = _G.CreateFrame("Button", "scanner_button", UIParent, "SecureActionButtonTemplate")
scanner_button:Hide();
scanner_button:SetFrameStrata("FULLSCREEN")
scanner_button:SetSize(200, 50)
scanner_button:SetScale(1.25)
-- Macro in order to target onclick
scanner_button:SetAttribute("type", "macro")

-- Textures
scanner_button:SetNormalTexture([[Interface\AchievementFrame\UI-Achievement-Parchment-Horizontal-Desaturated]])
scanner_button:SetBackdrop({
	tile = true,
	edgeSize = 16,
	edgeFile = [[Interface\Tooltips\UI-Tooltip-Border]]
})

scanner_button:SetBackdropBorderColor(0, 0, 0) -- Black

-- Effects hover
scanner_button:SetScript("OnEnter", function(self)
	self:SetBackdropBorderColor(0.9, 0.9, 0.9) -- White
end)

scanner_button:SetScript("OnLeave", function(self)
	self:SetBackdropBorderColor(0, 0, 0) -- Black
end)

-- Main frame position
scanner_button:SetPoint("BOTTOM", UIParent, 0, 128)

-- Model view
scanner_button.ModelView = _G.CreateFrame("PlayerModel", "mxpplayermodel", scanner_button)
scanner_button.ModelView:SetPoint("BOTTOMLEFT", scanner_button, "TOPLEFT", 0, -2) -- bottom left corner 2px separation from scanner_button's top left corner
scanner_button.ModelView:SetPoint("RIGHT")
scanner_button.ModelView:SetHeight(120)
scanner_button.ModelView:SetScale(1.25)

local Background = scanner_button:GetNormalTexture()
Background:SetDrawLayer("BACKGROUND")
Background:ClearAllPoints()
Background:SetPoint("BOTTOMLEFT", 3, 3)
Background:SetPoint("TOPRIGHT", -3, -3)
Background:SetTexCoord(0, 1, 0, 0.25)

-- Title
local TitleBackground = scanner_button:CreateTexture(nil, "BORDER")
TitleBackground:SetTexture([[Interface\AchievementFrame\UI-Achievement-RecentHeader]])
TitleBackground:SetPoint("TOPRIGHT", -5, -7)
TitleBackground:SetPoint("LEFT", 5, 0)
TitleBackground:SetSize(180, 10)
TitleBackground:SetTexCoord(0, 1, 0, 1)
TitleBackground:SetAlpha(0.8)

scanner_button.Title = scanner_button:CreateFontString(nil, "OVERLAY", "GameFontNormal", 1)
scanner_button.Title:SetNonSpaceWrap(true)
scanner_button.Title:SetPoint("TOPLEFT", TitleBackground, 0, 0)
scanner_button.Title:SetPoint("RIGHT", TitleBackground)
scanner_button.Title:SetTextColor(1, 1, 1, 1)
scanner_button:SetFontString(scanner_button.Title)

local Description = scanner_button:CreateFontString(nil, "OVERLAY", "SystemFont_Tiny")
Description:SetPoint("BOTTOMLEFT", TitleBackground, 0, -12)
Description:SetPoint("RIGHT", -8, 0)
Description:SetTextHeight(6)
Description:SetTextColor(NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b)

scanner_button.Description_text = scanner_button:CreateFontString(nil, "OVERLAY", "GameFontWhiteTiny")
scanner_button.Description_text:SetPoint("TOPLEFT", Description, "BOTTOMLEFT", 0, -4)
scanner_button.Description_text:SetPoint("RIGHT", Description)

-- Mouse events
scanner_button:SetMovable(true)
scanner_button:SetUserPlaced(true)
scanner_button:SetClampedToScreen(true)
scanner_button:RegisterForDrag("LeftButton")
scanner_button:SetScript("OnDragStart", scanner_button.StartMoving)
scanner_button:SetScript("OnDragStop", scanner_button.StopMovingOrSizing)

-- Vignette events
scanner_button:RegisterEvent("VIGNETTE_ADDED")

-- Out of combat events
local pendingToShow
local pendingToHide
local nameToShow
local npcIDToShow
local pendingItemIdInfo = {}
scanner_button:RegisterEvent("PLAYER_REGEN_ENABLED")
scanner_button:RegisterEvent("GET_ITEM_INFO_RECEIVED")

-- Captures all events
scanner_button:SetScript("OnEvent", function(self, event, instanceid)
	if event == "VIGNETTE_ADDED" then
		self:CheckNotificationCache(self, instanceid)
	elseif event == "PLAYER_REGEN_ENABLED" then
		if pendingToShow then
			self:ShowButton(self, nameToShow, npcIDToShow)
			pendingToShow = nil
			pendingToHide = nil -- just in case it was pending too
		elseif pendingToHide then
			self:HideButton()
			pendingToHide = nil
		end
	elseif event == "GET_ITEM_INFO_RECEIVED" then
		if pendingItemIdInfo[instanceid] then
			self:LoadItemFrame(instanceid, pendingItemIdInfo[instanceid])
			pendingItemIdInfo[instanceid] = nil;
		end
	else
		return
	end
end)

local ignoreName = {
	["要塞储物箱"] = true,
	["要塞儲物箱"] = true,
}

-- Checks if the rare has been found already in the last 5 minutes
local already_notified = {}
function scanner_button:CheckNotificationCache(self, id)	
	-- Get viggnette data
	local x, y, name, iconid = C_Vignettes.GetVignetteInfoFromInstanceID(id)
	-- Options disabled/enabled
	if iconid then
		-- disable every iconid that is not treasure, event or rare
		if iconid ~= CONTAINER_VIGNETTE and iconid ~= NPC_VIGNETTE and iconid ~= EVENT_VIGNETTE then
			return
		elseif iconid == CONTAINER_VIGNETTE and not private.db.general.scanContainers then
			return
		elseif iconid == NPC_VIGNETTE and not private.db.general.scanRares then
			return
		elseif iconid == EVENT_VIGNETTE and not private.db.general.scanEvents then
			return
		-- disable garrison container
		elseif iconid == CONTAINER_VIGNETTE and not private.db.general.scanGarrison then
			-- forze setting current map to the current zone
			-- if map is not laded yet the coordinates of the player will be 0 0
			local x, y = GetPlayerMapPosition("player")
			
			-- if not loaded try again after 1 second
			if x == 0 and y == 0 then
				C_Timer.After(1, function() self:CheckNotificationCache(self, id) end)
				return;
			end
			
			-- if map is loaded extract map ID
			SetMapToCurrentZone()
			local zone_id, boolean = GetCurrentMapAreaID()
			-- check if the player is at the garrison
			if (zone_id == GARRISON_MAP_ID_HORDE) or (zone_id == GARRISON_MAP_ID_ALLIANCE) or (zone_id == DRAENOR_MAP_ID) then
				return
			end
		-- disable alerts in Ashran
		elseif not private.db.general.scanAshran then
			-- forze setting current map to the current zone
			SetMapToCurrentZone()
			local zone_id, boolean = GetCurrentMapAreaID() 
			-- check if the player is at the garrison
			if zone_id == ASHRAN_MAP_ID then
				return
			end
		end
	else
		return
	end
	
	-- Check if we have found the NPC in the last 5 minutes
	if already_notified[id] or ignoreName[name] then
		return
	else
		already_notified[id] = true
	end
	
	-- Extract NPC id from database
	local npcID
	if name then
		npcID = AL["RARE_LIST"][name]
		
		-- Filters NPC
		if next(private.db.general.filteredRares) ~= nil and private.db.general.filteredRares[npcID] == false then
			return
		end
		
		-- Setup texts
		RaidNotice_AddMessage(RaidWarningFrame, name..AL["JUST_SPAWNED"], ChatTypeInfo["RAID_WARNING"])
		self.Title:SetText(name)

		-- If NPC identified properly load its model
		if npcID then
			local displayID = private.NPC_DISPLAY_IDS[npcID]
			if displayID and displayID ~= 0 then
				self.Description_text:SetText(AL["CLICK_TARGET"])
				self.ModelView:SetDisplayInfo(displayID)
			else
				self.Description_text:SetText(AL["NOT_TARGETEABLE"])
				npcID = nil
			end
		else
			self.Description_text:SetText(AL["NOT_TARGETEABLE"])
		end
		
		-- Print message in chat if user wants
		if private.db.display.displayChatMessage then
			print(name..AL["JUST_SPAWNED"].." "..AL["CHECK_MAP"])
		end
	else
		-- Unknown target
		RaidNotice_AddMessage(RaidWarningFrame, AL["ALARM_MESSAGE"], ChatTypeInfo["RAID_WARNING"])
		self.Title:SetText(AL["CHECK_MAP"])
		self.Description_text:SetText(AL["UNKNOWN_TARGET"])
	end
	
	-- Play the sound
	if iconid == CONTAINER_VIGNETTE or iconid == EVENT_VIGNETTE then
		if not private.db.sound.soundDisabled then --disabled
			PlaySoundFile(private.SOUNDS[private.db.sound.soundObjectPlayed], "Master")
		end
	else
		if not private.db.sound.soundDisabled then --disabled
			PlaySoundFile(private.SOUNDS[private.db.sound.soundPlayed], "Master")
		end
	end
	
	-- Show button / miniature / loot bar if not in combat
	if not InCombatLockdown() then	
		-- Wow API doesnt allow to call Show() (protected function) if you are under attack, so
		-- we check if this is the situation to avoid it and show the frames
		-- once the battle is over (pendingToShow)
		self:ShowButton(self, name, npcID)
	else
		-- Mark to show after combat
		nameToShow = name;
		npcIDToShow = npcID
		pendingToShow = true
	end
	
	-- timer to reset already found NPC
	C_Timer.After(350, function() already_notified[id] = false end)
end

-- Hide action
local autoHideTimer
function scanner_button:HideButton() 
	if not InCombatLockdown() then
		GameTooltip:Hide()
		scanner_button.ModelView:ClearModel()
		scanner_button.ModelView:Hide()
		scanner_button:Hide()
	else
		pendingToHide = true
	end
	
	autoHideTimer = nil
end

-- Show action
function scanner_button:ShowButton(self, name, npcID)
	-- Show button, model and loot panel
	if private.db.display.displayButton then
		if name and npcID then
			self:SetAttribute("macrotext", "/cleartarget\n/targetexact "..name.."\n/tm 8")
			-- show button
			self:Show()
		
			-- show model
			self.ModelView:Show()
			
			-- Show filter button
			self.FilterDisabledButton:Show()
			
			-- show loot bar
			if private.db.display.displayLoot then
				self:LoadLootBar(npcID)
			elseif not npcID then
				self:LoadLootBar(nil)	
			end
		else
			-- hide model if displayed
			self:SetAttribute("macrotext", private.macrotext)
			self.ModelView:ClearModel()
			self.ModelView:Hide()
			
			-- hide filter button if displayed
			self.FilterDisabledButton:Hide()
			
			-- hide loot items
			self:LoadLootBar(nil)
			
			-- show button
			self:Show()
		end
		
		-- set the time to auto hide
		if private.db.display.autoHideButton ~= 0 then
			if autoHideTimer then
				autoHideTimer:Cancel()
			end
			autoHideTimer = C_Timer.NewTimer(private.db.display.autoHideButton, function() scanner_button:HideButton() end)
		end	
	end
end

-- Close button
scanner_button.CloseButton = _G.CreateFrame("Button", "CloseButton", scanner_button, "UIPanelCloseButton")
scanner_button.CloseButton:SetPoint("BOTTOMRIGHT")
scanner_button.CloseButton:SetSize(32, 32)
scanner_button.CloseButton:SetScale(0.8)
scanner_button.CloseButton:SetHitRectInsets(8, 8, 8, 8)

-- Filter disabled button
scanner_button.FilterDisabledButton = _G.CreateFrame("Button", "FilterDisabledButton", scanner_button, "GameMenuButtonTemplate")
scanner_button.FilterDisabledButton:SetPoint("BOTTOMLEFT", 5, 5)
scanner_button.FilterDisabledButton:SetSize(16, 16)
scanner_button.FilterDisabledButton:SetNormalTexture([[Interface\WorldMap\Dash_64]])
scanner_button.FilterDisabledButton:SetScript("OnClick", function(self)
	npcID = AL["RARE_LIST"][self:GetParent().Title:GetText()]
	if (npcID) then
		private.db.general.filteredRares[npcID] = false
		print(AL["DISABLED_SEARCHING_RARE"]..self:GetParent().Title:GetText())
		self:Hide()
		self:GetParent().FilterEnabledButton:Show()
	end
end)
scanner_button.FilterDisabledButton:SetScript("OnEnter", function(self)
	GameTooltip:SetOwner(self, "ANCHOR_CURSOR")
	GameTooltip:SetText(AL["DISABLE_SEARCHING_RARE_TOOLTIP"])
	GameTooltip:Show()
end)

scanner_button.FilterDisabledButton:SetScript("OnLeave", function(self)
	GameTooltip:Hide()
end)

-- Filter enabled button
scanner_button.FilterEnabledButton = _G.CreateFrame("Button", "FilterEnabledButton", scanner_button, "GameMenuButtonTemplate")
scanner_button.FilterEnabledButton:SetPoint("BOTTOMLEFT", 5, 5)
scanner_button.FilterEnabledButton:SetSize(16, 16)
scanner_button.FilterEnabledButton:SetScript("OnClick", function(self)
	npcID = AL["RARE_LIST"][self:GetParent().Title:GetText()]
	if (npcID) then
		private.db.general.filteredRares[npcID] = true
		print(AL["ENABLED_SEARCHING_RARE"]..self:GetParent().Title:GetText())
		self:Hide()
		self:GetParent().FilterDisabledButton:Show()
	end
end)
scanner_button.FilterEnabledButton:SetScript("OnEnter", function(self)
	GameTooltip:SetOwner(self, "ANCHOR_CURSOR")
	GameTooltip:SetText(AL["ENABLE_SEARCHING_RARE_TOOLTIP"])
	GameTooltip:Show()
end)

scanner_button.FilterEnabledButton:SetScript("OnLeave", function(self)
	GameTooltip:Hide()
end)

scanner_button.FilterEnabledTexture = scanner_button.FilterEnabledButton:CreateTexture()
scanner_button.FilterEnabledTexture:SetTexture([[Interface\WorldMap\Skull_64]])
scanner_button.FilterEnabledTexture:SetSize(12, 12)
scanner_button.FilterEnabledTexture:SetTexCoord(0,0.5,0,0.5)
scanner_button.FilterEnabledTexture:SetPoint("CENTER")
scanner_button.FilterEnabledButton:SetNormalTexture(scanner_button.FilterEnabledTexture)
scanner_button.FilterEnabledButton:Hide()

-- Loot bar
scanner_button.LootBar = _G.CreateFrame("Frame", "LootBar", scanner_button)
scanner_button.LootBar:SetSize(200, 20)
scanner_button.LootBar:SetPoint("TOPLEFT", scanner_button, "BOTTOMLEFT", 7, -3)

-- Loot tooltip
scanner_button.LootBar.LootBarToolTip = _G.CreateFrame("GameTooltip", "LootBarToolTip", nil, "GameTooltipTemplate")

-- Loot items
local itemFrames = {}
for i=1, MAX_ITEMS_LOOT_BAR do 
	local itemFrame = _G.CreateFrame("Frame", "LootBarItem"..i, scanner_button.LootBar)
	itemFrame:SetSize(20, 20)
	itemFrame:SetPoint("LEFT", (5+16)* (i-1), 0)
	-- icon
	itemFrame.texture = itemFrame:CreateTexture()
	itemFrame.texture:SetAllPoints(itemFrame)
	-- tooltip
	itemFrame:SetScript("OnEnter", function(self)
		if self.link then
			scanner_button.LootBar.LootBarToolTip:SetOwner(scanner_button, private.db.display.lootTooltipPosition)
			scanner_button.LootBar.LootBarToolTip:SetHyperlink(self.link)
			scanner_button.LootBar.LootBarToolTip:SetParent(self)
			scanner_button.LootBar.LootBarToolTip:Show()
		end
	end)
	itemFrame:SetScript("OnLeave", function(self)
		if self.link then
			scanner_button.LootBar.LootBarToolTip:Hide()
		end
	end)
					
	itemFrames[i] = itemFrame
end

-- Loot bar
function scanner_button:LoadLootBar(npcID) 
	-- Hide every icon
	for i, itemFrame in ipairs(itemFrames) do
		if itemFrame:IsShown() then
			itemFrame:Hide()
		end
	end

	-- Extract NPC loot
	if npcID then
		local itemsIds = private.LOOT_TABLE_IDS[npcID]
		if itemsIds then
			for i, itemId in ipairs(itemsIds) do
				if (i <= MAX_ITEMS_LOOT_BAR) then
					scanner_button:LoadItemFrame(itemId, i)
				else 
					break
				end
			end
		end
	end
end

function scanner_button:LoadItemFrame(itemId, index)
	local _, itemLink, qualityId, _, _, _, _, _, _, itemTexture, _ = GetItemInfo(itemId)
	if not itemTexture then
		pendingItemIdInfo[itemId] = index
	elseif (qualityId >= tonumber(private.db.display.lootMinQuality)) then
		-- Set item icon
		itemFrames[index].texture:SetTexture(itemTexture)
		-- Set item hyperlink
		itemFrames[index].link = itemLink	
		itemFrames[index]:Show()
	end
end

function RareScanner:OnInitialize() 
	-- Initialize rare filter list
	for k, v in pairs(AL["RARE_LIST"]) do 
		PROFILE_DEFAULTS.char.general.filteredRares[v] = true
	end

	self.db = LibStub("AceDB-3.0"):New("RareScannerDB", PROFILE_DEFAULTS, true)
	
	-- Adds about panel to wow options
	local about_panel = LibStub:GetLibrary("LibAboutPanel", true)
	if about_panel then
		self.optionsFrame = about_panel.new(nil, "RareScanner")
	end
	
	-- Load saved variables
	self:SetupOptions()
	private.db = self.db.char
	
	-- save a copy of the original list to clear filter searching box
	private.FILTERED_LIST = private.db.general.filteredRares
	
--	print("RareScanner loaded")
end

function RareScanner:Test() 
	local testId = 26711
	local npcId = 32491
	local testName = "Time-Lost Proto-Drake"
	
	RaidNotice_AddMessage(RaidWarningFrame, AL["ALARM_MESSAGE"], ChatTypeInfo["RAID_WARNING"])
	PlaySoundFile(private.SOUNDS[private.db.sound.soundPlayed], "Master")
	scanner_button.ModelView:SetDisplayInfo(testId)
	scanner_button.FilterDisabledButton:Hide()
	scanner_button.Title:SetText(testName)
	scanner_button.Description_text:SetText(AL["CLICK_TARGET"])
	scanner_button:ShowButton(scanner_button, testName, npcId)
	
	print("RareScanner test launched")
end