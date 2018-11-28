local SLE, T, E, L, V, P, G = unpack(select(2, ...))
local LT = SLE:NewModule('Loot','AceHook-3.0', 'AceEvent-3.0')
local M = E:GetModule('Misc')
--GLOBALS: hooksecurefunc, ChatFrame_AddMessageEventFilter, ChatFrame_RemoveMessageEventFilter, UIParent
local _G = _G
local ConfirmLootSlot = ConfirmLootSlot

LT.PlayerLevel = 0
LT.MaxPlayerLevel = 0
LT.LootItems = 0 --To determine how many items are in our loot cache
LT.LootEvents = { --Events to handle with rolls and stuff
	"CONFIRM_DISENCHANT_ROLL", --Group
	"CONFIRM_LOOT_ROLL", --Group
	"LOOT_BIND_CONFIRM", --Solo
}
LT.Loot = {}
LT.LootTemp = {}
LT.Numbers = {}
local check = false
local QUEUED_STATUS_UNKNOWN = QUEUED_STATUS_UNKNOWN
local LOOT_ROLL_TYPE_GREED = LOOT_ROLL_TYPE_GREED
local IsShiftKeyDown, IsControlKeyDown, IsAltKeyDown = IsShiftKeyDown, IsControlKeyDown, IsAltKeyDown
local SendChatMessage = SendChatMessage
local RollOnLoot, ConfirmLootRoll, CloseLoot = RollOnLoot, ConfirmLootRoll, CloseLoot

LT.IconChannels = {
	"CHAT_MSG_BN_CONVERSATION","CHAT_MSG_BN_WHISPER","CHAT_MSG_BN_WHISPER_INFORM",
	"CHAT_MSG_CHANNEL","CHAT_MSG_EMOTE","CHAT_MSG_GUILD","CHAT_MSG_INSTANCE_CHAT",
	"CHAT_MSG_INSTANCE_CHAT_LEADER","CHAT_MSG_LOOT","CHAT_MSG_OFFICER","CHAT_MSG_PARTY",
	"CHAT_MSG_PARTY_LEADER","CHAT_MSG_RAID","CHAT_MSG_RAID_LEADER","CHAT_MSG_RAID_WARNING",
	"CHAT_MSG_SAY","CHAT_MSG_SYSTEM","CHAT_MSG_WHISPER","CHAT_MSG_WHISPER_INFORM","CHAT_MSG_YELL",
}

--Checking for master looter/raid leadr/assist role.
--Since ML was removed, this is pretty much useless
local function Check()
	for x = 1, T.GetNumGroupMembers() do
		local name, rank, _, _, _, _, _, _, _, _, isML = T.GetRaidRosterInfo(x)
		if name == E.myname then
			if isML then
				return true
			elseif rank == 1 then
				return true
			elseif rank == 2 then
				return true
			end
		end
	end
	return false
end

--Checks for modifier keys presse. Required for override option
function LT:ModifierCheck()
	local heldModifier = LT.db.announcer.override
	local shiftDown = IsShiftKeyDown();
	local ctrlDown = IsControlKeyDown();
	local altDown = IsAltKeyDown();

	if heldModifier == '3' and shiftDown then
		return true
	elseif heldModifier == '5' and ctrlDown then
		return true
	elseif heldModifier == '4' and altDown then
		return true
	elseif heldModifier == '2' then
		return true
	end

	return false
end

--Function to merge multiple identical items into the single line of report
local function Merge()
	-- local checking
	for i = 1, #(LT.Loot) do
		local checking = 1
		--Going through the loot list untill we find something in the previous entries then is equal to current item we are checking for duplicated
		while LT.Loot[i] ~= LT.Loot[checking] do checking = checking + 1 end
		--Check to make sure we didn't find the exact same item we are looking duplicates for
		if i ~= checking then
			LT.Numbers[i] = LT.Numbers[i] + LT.Numbers[checking] --Increase item count by whatever dupe's count was
			--Remove found item from both item list and item count cache
			T.tremove(LT.Numbers, checking)
			T.tremove(LT.Loot, checking)
			--Now we have one less line to announce
			LT.LootItems = LT.LootItems - 1
		end
	end
end

--Putting stuff in current loot table
function LT:PopulateTable(qualityPassed)
	for i = 1, T.GetNumLootItems() do
		if T.GetLootSlotType(i) == 1 then --If this loot is actually an item
			local _, item, quantity, _, quality = T.GetLootSlotInfo(i)
			local link, ilvl

			if quality >= qualityPassed then --If this is not a filthy grey (or whatever filtered quality is)
				link = T.GetLootSlotLink(i)
				ilvl = T.select(4, T.GetItemInfo(link)) or QUEUED_STATUS_UNKNOWN

				--Increasing how many items there were in da loot
				LT.LootItems = LT.LootItems + 1
				--Putting the message to show for this particular item together
				LT.Loot[LT.LootItems] = link --Item link for people to click
				LT.Loot[LT.LootItems] = LT.Loot[LT.LootItems].." (ilvl: "..ilvl..")" --Adding ilvl value on top of that, for proc stuff mostly
				LT.Numbers[LT.LootItems] = quantity or 1 --How many of this was looted
			end
		end
	end
	--When table is finish, it is time to purge it of hereti... duplicated
	Merge()
end

--Figuring out what channel to announce to
local function Channel()
	if LT.db.announcer.channel ~= "SAY" and T.IsPartyLFG() then
		return "INSTANCE_CHAT"
	end
	if LT.db.announcer.channel == "RAID" and not T.IsInRaid() then
		return "PARTY"
	end
	return LT.db.announcer.channel
end

--Throwing the booty in chat
function LT:AnnounceList()
	for i = 1, LT.LootItems do
		if LT.Numbers[i] == 1 then --One of this is looted
			SendChatMessage(i..". "..LT.Loot[i], Channel())
		elseif LT.Numbers[i] > 1 then --2+ looted
			SendChatMessage(i..". "..LT.Numbers[i].."x"..LT.Loot[i], Channel())
		end

		if i == LT.LootItems then --Table finished = announce complete => nuke it
			T.twipe(LT.Loot)
			T.twipe(LT.Numbers)
			LT.LootItems = 0
		end
	end
end

local t = 0
--Time to figure out what to announce
function LT:Announce(event)
	if not T.IsInGroup() then return end -- not in group, exit.

	local NumLootItems = T.GetNumLootItems()
	--Setting quality filter threshold
	local quality = LT.db.announcer.quality == "EPIC" and 4 or LT.db.announcer.quality == "RARE" and 3 or LT.db.announcer.quality == "UNCOMMON" and 2
	--If auto annouce and you are eligible or in group and modifier selected is pressed, do stuff
	if (Check() and LT.db.announcer.auto) or (LT:ModifierCheck() and (T.IsInGroup() or T.IsInRaid())) then
		--Seeing if this loot is currently being processed/announced
		for i = 1,NumLootItems do
			if T.GetLootSlotType(i) == 1 then
				for j = 1, t do --For 1 to num of looted items 
					if T.GetLootSlotLink(i) == LT.LootTemp[j] then
						check = true --we've seen this, quit
					end
				end 
			end
		end

		--If this should be announced
		if check == false or LT:ModifierCheck() then
			LT:PopulateTable(quality)
			if LT.LootItems ~= 0 then
				SendChatMessage(L["Loot Dropped:"], Channel())
				LT:AnnounceList()
			end
		end

		--Put all this stuff to temp table for check one of this function
		for i = 1, NumLootItems do
			if T.GetLootSlotType(i) == 1 then
				LT.LootTemp[i] = T.GetLootSlotLink(i)
			end
		end
		--Setting t for later checks and reseting announce state
		--@Darth: I wonder if this can be done via L.LootItems
		t = NumLootItems
		check = false
	end
end

--This will roll for you on greens and shit. Hooked to start roll function
function LT:HandleRoll(event, id)
	if not LT.db.autoroll.enable then return end --Auto rolling disabled? GTFO
	if not (LT.db.autoroll.autogreed or LT.db.autoroll.autode) then return end --If not auto greed on stuff or auto DE shit, gtfo

	local _, name, _, quality, _, _, _, disenchant = T.GetLootRollItemInfo(id)
	local link = T.GetLootRollItemLink(id)
	local itemID = T.tonumber(T.match(link, 'item:(%d+)'))

	--if this is one of bullshit craft items from old dungeons (e.g. frost orb), you are rtolling greed regardless
	if itemID == 43102 or itemID == 52078 then
		RollOnLoot(id, LOOT_ROLL_TYPE_GREED)
	end

	--If XP gain is disabled, we count current level as max level
	if T.IsXPUserDisabled() then LT.MaxPlayerLevel = LT.PlayerLevel end
	--Don't roll if yout level is not high enough
	if (LT.db.autoroll.bylevel and LT.PlayerLevel < LT.db.autoroll.level) and LT.PlayerLevel ~= LT.MaxPlayerLevel then return end

	if LT.db.autoroll.bylevel then --If you are over selected level (Motly on leveling process, where you may need greens)
		if T.IsEquippableItem(link) then --If equippable, then figure out if this is an upgrade for you
			local _, _, _, ilvl, _, _, _, _, slot = T.GetItemInfo(link)
			local itemLink = T.GetInventoryItemLink('player', slot)
			local matchItemLevel = itemLink and T.select(4, T.GetItemInfo(itemLink)) or 1
			if quality ~= 7 and matchItemLevel < ilvl then return end --If legendary or have higher ilvl than item you have in the same slot, don't roll
		end
	end

	if quality <= LT.db.autoroll.autoqlty then --if lesser quality than is set in options
		if LT.db.autoroll.autode and disenchant then --If DE is available, roll DE
			RollOnLoot(id, 3)
		else --Otherwise roll greed
			RollOnLoot(id, 2)
		end
	end
end

--Dealing with events
function LT:HandleEvent(event, ...)
	if event == "LOOT_OPENED" then --We open loot, should we announce it?
		if LT.db.announcer.enable then
			LT:Announce(event)
		end
	end

	--No auto confirmation of BoP enabled? Not doing shit. Otherwise - confirm and loot
	if not LT.db.autoroll.autoconfirm then return end
	if event == "CONFIRM_LOOT_ROLL" or event == "CONFIRM_DISENCHANT_ROLL" then
		local arg1, arg2 = ...
		ConfirmLootRoll(arg1, arg2)
	elseif event == "LOOT_OPENED" or event == "LOOT_BIND_CONFIRM" then
		local count = T.GetNumLootItems()
		if count == 0 then CloseLoot() return end
		for numslot = 1, count do
			ConfirmLootSlot(numslot)
		end
	end
end

--If ElvUI's config is opened then do alterations and unregistering da event
local function LoadConfig(event, addon)
	if addon ~= "ElvUI_Config" then return end

	LT:Update()
	LT:UnregisterEvent("ADDON_LOADED")
end

--Toggle module on/off
function LT:Toggle()
	if LT.db.enable then
		self:RegisterEvent("LOOT_OPENED", "HandleEvent")
		self:RegisterEvent('PLAYER_ENTERING_WORLD', 'LootShow');
		if not T.IsAddOnLoaded("ElvUI_Config") then --How can this be not loaded at this point? On /rl or login into the game ofc
			self:RegisterEvent("ADDON_LOADED", LoadConfig)
		end
	else
		self:UnregisterEvent("LOOT_OPENED")
		self:UnregisterEvent('PLAYER_ENTERING_WORLD')
		self:UnregisterEvent("ADDON_LOADED")
	end
end

--Toggle auto roll
function LT:AutoToggle()
	for i = 1, 3 do
		if LT.db.autoroll.autoconfirm and LT.db.enable then
			self:RegisterEvent(LT.LootEvents[i], "HandleEvent")
			UIParent:UnregisterEvent(LT.LootEvents[i])
		else
			UIParent:RegisterEvent(LT.LootEvents[i])
			self:UnregisterEvent(LT.LootEvents[i])
		end
	end
end

--Setting loot history alpha
function LT:LootAlpha()
	_G["LootHistoryFrame"]:SetAlpha(LT.db.history.alpha or 1)
end

--Hide loot history frame on exiting dungeon
function LT:LootShow()
	local instance = T.IsInInstance()

	if (not instance and LT.db.history.autohide) then
		_G["LootHistoryFrame"]:Hide()
		if SLE._Compatibility["ElvUI_PagedLootHistory"] then _G["ElvUI_PagedLootHistoryFrame"]:Hide() end
	end
end

--Module update
function LT:Update()
	--Setting Elv's option to button that leads to my shit if the module is enabled
	if T.IsAddOnLoaded("ElvUI_Config") then
		if LT.db.autoroll.enable then
			E.Options.args.general.args.general.args.autoRoll = {
				order = 6,
				name = L["Auto Greed/DE"],
				desc = L["This option have been disabled by Shadow & Light. To return it you need to disable S&L's option. Click here to see it's location."],
				type = "execute",
				func = function() SLE.ACD:SelectGroup("ElvUI", "sle", "modules", "loot") end,
			}
		else
			E.Options.args.general.args.general.args.autoRoll = {
				order = 6,
				name = L["Auto Greed/DE"],
				desc = L["Automatically select greed or disenchant (when available) on green quality items. This will only work if you are the max level."],
				type = 'toggle',
				disabled = function() return not E.private.general.lootRoll end
			}
		end
	end

	LT:Toggle()
	LT:AutoToggle()
	LT:LootAlpha()
end

--Update what level player currently is
function LT:PLAYER_LEVEL_UP(event, level)
	LT.PlayerLevel = level
end

--Add icons to loot merssages in chat. This is filter. It always allowes the message to be seen, just alters it if needed
function LT:AddLootIcons(event, message, ...)
	--if icons are enabled in this channel, doing icon stuff
	if LT.db.looticons.channels[event] then
		local function IconForLink(link) --function to get the iconized message
			local texture = T.GetItemIcon(link)
			return (LT.db.looticons.position == "LEFT") and "\124T" .. texture .. ":" .. LT.db.looticons.size .. ":"..LT.db.looticons.size..":0:0:64:64:4:60:4:60\124t" .. link or link .. "\124T" .. texture .. ":" .. LT.db.looticons.size .. ":"..LT.db.looticons.size..":0:0:64:64:4:60:4:60\124t"
		end
		message = T.gsub(message, "(\124c%x+\124Hitem:.-\124h\124r)", IconForLink)
	end
	return false, message, ...
end

--Toggle loot icons option
function LT:LootIconToggle()
	if LT.db.looticons.enable then
		for i = 1, #LT.IconChannels do
			ChatFrame_AddMessageEventFilter(LT.IconChannels[i], LT.AddLootIcons)
		end
	else
		for i = 1, #LT.IconChannels do
			ChatFrame_RemoveMessageEventFilter(LT.IconChannels[i], LT.AddLootIcons)
		end
	end
end

function LT:Initialize()
	if not SLE.initialized then return end
	LT.db = E.db.sle.loot
	self:RegisterEvent("PLAYER_LEVEL_UP")

	function LT:ForUpdateAll()
		LT.db = E.db.sle.loot
		LT:Update()
		LT:LootShow()
		LT:LootIconToggle()
	end

	LT.MaxPlayerLevel = T.GetMaxPlayerLevel()
	LT.PlayerLevel = T.UnitLevel('player')

	--Azil made this, blame him if something fucked up
	if E.db.general and LT.db.autoroll.enable then
		E.db.general.autoRoll = false
	end
	LT:Update()
	hooksecurefunc(M, 'START_LOOT_ROLL', function(self, event, id) LT:HandleRoll(event, id) end)
	LT:LootIconToggle()
end

SLE:RegisterModule(LT:GetName())
