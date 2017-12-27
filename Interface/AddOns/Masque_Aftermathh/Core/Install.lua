local A, C, M, L = select(2, ...):unpack()

local Install = CreateFrame("Frame")

function Install:Init()
	SetCVar("useUiScale", 1)
	SetCVar("uiScale", C.General.UIScale)
	
	SetCVar("countdownForCooldowns", 0)
	SetCVar("scriptErrors", 1)
	SetCVar("screenshotQuality", 10)
	SetCVar("chatStyle", "classic")
	SetCVar("showTutorials", 0)
	SetCVar("autoQuestWatch", 1)
	SetCVar("autoQuestProgress", 1)
	SetCVar("UberTooltips", 1)
	SetCVar("removeChatDelay", 1)
	SetCVar("showArenaEnemyFrames", 0)
	SetCVar("alwaysShowActionBars", 0)
	SetCVar("autoOpenLootHistory", 0)
	SetCVar("spamFilter", 0)
	SetCVar("violenceLevel", 5)
	
	-- Setup names
	
	FCF_OpenNewWindow(ChatFrame3)
	
    FCF_SetWindowName(ChatFrame1, "G & W")
	FCF_SetWindowName(ChatFrame3, "Spam")
	
	-- Remove Spamm from tab "General"
	
	ChatFrame_RemoveChannel(ChatFrame1, "General")
	ChatFrame_RemoveChannel(ChatFrame1, "Trade")
	ChatFrame_RemoveChannel(ChatFrame1, "LocalDefense")
 	ChatFrame_RemoveChannel(ChatFrame1, "GuildRecruitment")
	ChatFrame_RemoveChannel(ChatFrame1, "LookingForGroup")

    -- Lets add the channel"s to the "Spamm" tab.
	
	ChatFrame_AddChannel(ChatFrame3, "General") 
	ChatFrame_AddChannel(ChatFrame3, "Trade")
	ChatFrame_AddChannel(ChatFrame3, "LocalDefense") 
	ChatFrame_AddChannel(ChatFrame3, "GuildRecruitment") 
	ChatFrame_AddChannel(ChatFrame3, "LookingForGroup")

    -- Chat Frame 1 "General"	
	
	ChatFrame_RemoveAllMessageGroups(ChatFrame1)
	
	ChatFrame_AddMessageGroup(ChatFrame1, "WHISPER")
	ChatFrame_AddMessageGroup(ChatFrame1, "SAY")
	ChatFrame_AddMessageGroup(ChatFrame1, "EMOTE")
	ChatFrame_AddMessageGroup(ChatFrame1, "YELL")
	ChatFrame_AddMessageGroup(ChatFrame1, "GUILD")
	ChatFrame_AddMessageGroup(ChatFrame1, "OFFICER")
	
	ChatFrame_AddMessageGroup(ChatFrame1, "PARTY")
    ChatFrame_AddMessageGroup(ChatFrame1, "PARTY_LEADER")
	ChatFrame_AddMessageGroup(ChatFrame1, "INSTANCE_CHAT")
	ChatFrame_AddMessageGroup(ChatFrame1, "INSTANCE_CHAT_LEADER")		
	ChatFrame_AddMessageGroup(ChatFrame1, "RAID")
	ChatFrame_AddMessageGroup(ChatFrame1, "RAID_LEADER")
	ChatFrame_AddMessageGroup(ChatFrame1, "RAID_WARNING")
	
	ChatFrame_AddMessageGroup(ChatFrame1, "BN_WHISPER")
    ChatFrame_AddMessageGroup(ChatFrame1, "BN_CONVERSATION")
	ChatFrame_AddMessageGroup(ChatFrame1, "BN_INLINE_TOAST_ALERT")
	
	ChatFrame_AddMessageGroup(ChatFrame1, "SYSTEM")
	ChatFrame_AddMessageGroup(ChatFrame1, "ERRORS")
	ChatFrame_AddMessageGroup(ChatFrame1, "AFK")
	ChatFrame_AddMessageGroup(ChatFrame1, "DND")
	ChatFrame_AddMessageGroup(ChatFrame1, "IGNORED")

	ChatFrame_AddMessageGroup(ChatFrame1, "MONSTER_SAY")
	ChatFrame_AddMessageGroup(ChatFrame1, "MONSTER_EMOTE")
	ChatFrame_AddMessageGroup(ChatFrame1, "MONSTER_YELL")
	ChatFrame_AddMessageGroup(ChatFrame1, "MONSTER_WHISPER")
	ChatFrame_AddMessageGroup(ChatFrame1, "MONSTER_BOSS_EMOTE")
	ChatFrame_AddMessageGroup(ChatFrame1, "MONSTER_BOSS_WHISPER")

	ChatFrame_AddMessageGroup(ChatFrame1, "BATTLEGROUND")
	ChatFrame_AddMessageGroup(ChatFrame1, "BATTLEGROUND_LEADER")
	ChatFrame_AddMessageGroup(ChatFrame1, "BG_HORDE")
	ChatFrame_AddMessageGroup(ChatFrame1, "BG_ALLIANCE")
	ChatFrame_AddMessageGroup(ChatFrame1, "BG_NEUTRAL")
	
	-- Setup Spamm

	ChatFrame_RemoveAllMessageGroups(ChatFrame3)
	
    ChatFrame_AddMessageGroup(ChatFrame3, "WHISPER")
	ChatFrame_AddMessageGroup(ChatFrame3, "SAY")
	ChatFrame_AddMessageGroup(ChatFrame3, "EMOTE")
	ChatFrame_AddMessageGroup(ChatFrame3, "YELL")
	ChatFrame_AddMessageGroup(ChatFrame3, "GUILD")
    ChatFrame_AddMessageGroup(ChatFrame3, "OFFICER")
	ChatFrame_AddMessageGroup(ChatFrame3, "PARTY")
    ChatFrame_AddMessageGroup(ChatFrame3, "PARTY_LEADER")
	ChatFrame_AddMessageGroup(ChatFrame3, "INSTANCE_CHAT")
	ChatFrame_AddMessageGroup(ChatFrame3, "INSTANCE_CHAT_LEADER")
	ChatFrame_AddMessageGroup(ChatFrame3, "RAID")
	ChatFrame_AddMessageGroup(ChatFrame3, "RAID_LEADER")
	ChatFrame_AddMessageGroup(ChatFrame3, "RAID_WARNING")
	
	ChatFrame_AddMessageGroup(ChatFrame3, "ACHIEVEMENT")
	ChatFrame_AddMessageGroup(ChatFrame3, "GUILD_ACHIEVEMENT")

	ChatFrame_AddMessageGroup(ChatFrame3, "BN_WHISPER")
	ChatFrame_AddMessageGroup(ChatFrame3, "BN_CONVERSATION")
	ChatFrame_AddMessageGroup(ChatFrame3, "BN_INLINE_TOAST_ALERT")
	
	ChatFrame_AddMessageGroup(ChatFrame3, "SKILL")
	ChatFrame_AddMessageGroup(ChatFrame3, "MONEY")
	ChatFrame_AddMessageGroup(ChatFrame3, "CURRENCY")

	ChatFrame_AddMessageGroup(ChatFrame3, "SYSTEM")
	ChatFrame_AddMessageGroup(ChatFrame3, "ERRORS")
	ChatFrame_AddMessageGroup(ChatFrame3, "AFK")
	ChatFrame_AddMessageGroup(ChatFrame3, "DND")
	ChatFrame_AddMessageGroup(ChatFrame3, "IGNORED")
	
	ChatFrame_AddMessageGroup(ChatFrame3, "MONSTER_SAY")
	ChatFrame_AddMessageGroup(ChatFrame3, "MONSTER_EMOTE")
	ChatFrame_AddMessageGroup(ChatFrame3, "MONSTER_YELL")
	ChatFrame_AddMessageGroup(ChatFrame3, "MONSTER_WHISPER")
	ChatFrame_AddMessageGroup(ChatFrame3, "MONSTER_BOSS_EMOTE")
	ChatFrame_AddMessageGroup(ChatFrame3, "MONSTER_BOSS_WHISPER")
	
    ChatFrame_AddMessageGroup(ChatFrame3, "BATTLEGROUND")
	ChatFrame_AddMessageGroup(ChatFrame3, "BATTLEGROUND_LEADER")
	ChatFrame_AddMessageGroup(ChatFrame3, "BG_HORDE")
	ChatFrame_AddMessageGroup(ChatFrame3, "BG_ALLIANCE")
	ChatFrame_AddMessageGroup(ChatFrame3, "BG_NEUTRAL")

	ChatFrame_AddMessageGroup(ChatFrame3, "LOOT")
    ChatFrame_AddMessageGroup(ChatFrame3, "COMBAT_XP_GAIN")
    ChatFrame_AddMessageGroup(ChatFrame3, "COMBAT_GUILD_XP_GAIN")
	ChatFrame_AddMessageGroup(ChatFrame3, "COMBAT_HONOR_GAIN")
    ChatFrame_AddMessageGroup(ChatFrame3, "COMBAT_FACTION_CHANGE")

	ToggleChatColorNamesByClassGroup(true, "SAY")
	ToggleChatColorNamesByClassGroup(true, "EMOTE")
	ToggleChatColorNamesByClassGroup(true, "YELL")
	ToggleChatColorNamesByClassGroup(true, "GUILD")
	ToggleChatColorNamesByClassGroup(true, "OFFICER")
	ToggleChatColorNamesByClassGroup(true, "GUILD_ACHIEVEMENT")
	ToggleChatColorNamesByClassGroup(true, "ACHIEVEMENT")
	ToggleChatColorNamesByClassGroup(true, "WHISPER")
	ToggleChatColorNamesByClassGroup(true, "PARTY")
	ToggleChatColorNamesByClassGroup(true, "PARTY_LEADER")
	ToggleChatColorNamesByClassGroup(true, "INSTANCE_CHAT")
	ToggleChatColorNamesByClassGroup(true, "INSTANCE_CHAT_LEADER")
	ToggleChatColorNamesByClassGroup(true, "RAID")
	ToggleChatColorNamesByClassGroup(true, "RAID_LEADER")
	ToggleChatColorNamesByClassGroup(true, "RAID_WARNING")
	ToggleChatColorNamesByClassGroup(true, "BATTLEGROUND")
	ToggleChatColorNamesByClassGroup(true, "BATTLEGROUND_LEADER")	
    ToggleChatColorNamesByClassGroup(true, "CHANNEL1")
    ToggleChatColorNamesByClassGroup(true, "CHANNEL2")
	ToggleChatColorNamesByClassGroup(true, "CHANNEL3")
    ToggleChatColorNamesByClassGroup(true, "CHANNEL4")
    ToggleChatColorNamesByClassGroup(true, "CHANNEL5")
	ToggleChatColorNamesByClassGroup(true, "CHANNEL6")
	ToggleChatColorNamesByClassGroup(true, "CHANNEL7")
	
	for i = 1, NUM_CHAT_WINDOWS do
		local ChatFrames = _G["ChatFrame"..i]
		ChatFrames:SetPoint("BOTTOMLEFT", UIParent, 8.5, 22.5)
		ChatFrames:SetSize(406, 122)
		
		if (not ChatFrames.isLocked) then
			FCF_SetLocked(ChatFrames, 1)
		end
	end
	
	AftermathhUIInstalled = true
	ReloadUI()
end

StaticPopupDialogs["A_Init"] = {
	text = "Welcome to AftermathhUI this the first time your using it on this character. You most reload your UI to setup chat settings.",
	button1 = ACCEPT,
	button2 = CANCEL,
    OnAccept = Install.Init,
	OnCancel = function() end,
    timeout = 0,
    whileDead = 1,
	hideOnEscape = true,
}

Install:RegisterEvent("PLAYER_LOGIN")
Install:RegisterEvent("PLAYER_ENTERING_WORLD")
Install:RegisterEvent("ADDON_LOADED")

Install:SetScript("OnEvent", function(self, event)
    self:UnregisterEvent("PLAYER_ENTERING_WORLD")

	if not (AftermathhUIInstalled) then
		StaticPopup_Show("A_Init")
	end
end)

SlashCmdList["CONFIGUI"] = function() StaticPopup_Show("A_Init") end
SLASH_CONFIGUI1 = "/setupui"