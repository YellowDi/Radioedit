local AceAddon = LibStub("AceAddon-3.0")
local LookingForGroup = AceAddon:GetAddon("LookingForGroup")
local LookingForGroup_SF = AceAddon:NewAddon("LookingForGroup_SF")

LookingForGroup_SF.addon_filters =
{
	": %d+/%d+$",
	"：%d+/%d+$",
	"^%[WQGF%]",
	"^大脚任务进度提示:",
	"^进度:",
	"^<大脚团队提示>",
	"^<大脚组队提示>",
	"^<BF Party hint>",
	"^<BF Raid hint>",
	"^PS 死亡:",
	"%(任务完成%)$",
	"^【网%.易%.有%.爱】",
	"^Quest progress:",
	"^EUI:",
	"^%[WQA%]",
}

local chatbubbles

local function restore_chat_bubble()
	if chatbubbles ~= nil then
		chatbubbles = SetCVar("chatBubbles",chatbubbles)
		chatbubbles = nil
	end
end

local chatBubblesParty

local function restore_chat_bubble_party()
	if chatBubblesParty ~= nil then
		chatBubblesParty = SetCVar("chatBubblesParty",chatBubblesParty)
		chatBubblesParty = nil
	end
end

local function disable_chat_bubble_party()
	if chatBubblesParty == nil then
		chatBubblesParty = GetCVarBool("chatBubblesParty")
		SetCVar("chatBubblesParty",false)
		C_Timer.NewTimer(0.01,restore_chat_bubble_party)
	end
	return true
end

local function language_filter(msg)
	local profile = LookingForGroup.db.profile
	local string_find = string.find
	if profile.spam_filter_language then
		if string_find(msg,"[\128-\255]") then
			local f
			if profile.spam_filter_language_russian and string_find(msg,"\208") then
				f = true
			end
			if profile.spam_filter_language_chinese and string_find(msg,"\228-\233") then
				f = true
			end
			if profile.spam_filter_language_korean and string_find(msg,"\234-\237") then
				f = true
			end
			if not f then
				return true
			end
		elseif not profile.spam_filter_language_english then
			return true
		end
	end
end

local function keyword_filter(msg)
	msg = msg:gsub(" ",""):lower()
	local filters = LookingForGroup.db.profile.spam_filter_keywords
	local n = #filters
	local string_find = string.find
	for i=1,n do
		if string_find(msg,filters[i]) then
			return true
		end
	end
end

local function addon_filter(_, _, msg)
	local filters = LookingForGroup_SF.addon_filters
	local i
	local n = #filters
	local string_find = string.find
	for i=1,n do
		if string_find(msg,filters[i]) then
			return true
		end
	end
	if language_filter(msg) then
		return true
	end
end

local function addon_party_filter(_, _, msg)
	if addon_filter(_, _, msg) then
		return disable_chat_bubble_party()
	end
end

local function msg_filter(_, _, msg, player, _, _, _, _, _, _, _, _, _, guid)
	if addon_filter(_, _, msg) then
		return true
	end
	if guid and guid:find("^Player") then
		if (IsGuildMember(guid) or IsCharacterFriend(guid) or UnitInRaid(player) or UnitInParty(player) or guid == UnitGUID("player") or select(2,BNGetGameAccountInfoByGUID(guid))) then
			return
		end
	end
	return keyword_filter(msg)
end

local function guild_filter(_, _, msg, player, _, _, _, _, _, _, _, _, _, guid)
	if addon_filter(_, _, msg) then
		return true
	end
	if language_filter(msg) then
		return true
	end
	return keyword_filter(msg)
end


local function msg_bubble_filter(...)
	if msg_filter(...) then
		if chatbubbles == nil then
			chatbubbles = GetCVarBool("chatBubbles")
			SetCVar("chatBubbles",false)
			C_Timer.NewTimer(0.01,restore_chat_bubble)
		end
		return true
	end
end

function LookingForGroup_SF:OnInitialize()
end

function LookingForGroup_SF:OnEnable()
	local api = ChatFrame_RemoveMessageEventFilter
	api("CHAT_MSG_GUILD",guild_filter)
	if LookingForGroup.db.profile.enable_sf then
		api = ChatFrame_AddMessageEventFilter
		if LookingForGroup.db.profile.spam_filter_channel_guild then
			ChatFrame_AddMessageEventFilter("CHAT_MSG_GUILD",guild_filter)
		end
	end
	api("CHAT_MSG_WHISPER",msg_filter)
	api("CHAT_MSG_SAY",msg_bubble_filter)
	api("CHAT_MSG_DND",msg_bubble_filter)
	api("CHAT_MSG_YELL",msg_bubble_filter)
	api("CHAT_MSG_AFK",msg_bubble_filter)
	api("CHAT_MSG_CHANNEL",msg_filter)
	api("CHAT_MSG_RAID",addon_filter)
	api("CHAT_MSG_RAID_LEADER",addon_filter)
	api("CHAT_MSG_PARTY",addon_party_filter)
	api("CHAT_MSG_PARTY_LEADER",addon_party_filter)
	api("CHAT_MSG_INSTANCE_CHAT",addon_filter)
	api("CHAT_MSG_INSTANCE_CHAT_LEADER",addon_filter)
	api("CHAT_MSG_RAID_WARNING",addon_filter)
end
