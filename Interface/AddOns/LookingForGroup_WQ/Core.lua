local AceAddon = LibStub("AceAddon-3.0")
local LookingForGroup = AceAddon:GetAddon("LookingForGroup")
local LookingForGroup_Auto = AceAddon:GetAddon("LookingForGroup_Auto")
local LookingForGroup_WQ = AceAddon:NewAddon("LookingForGroup_WQ","AceEvent-3.0")

function LookingForGroup_WQ:OnInitialize()
end

function LookingForGroup_WQ:OnEnable()
	if LookingForGroup.db.profile.enable_wq then
		self:RegisterEvent("QUEST_ACCEPTED")
		self:RegisterEvent("QUEST_REMOVED")
		self:RegisterEvent("QUEST_TURNED_IN")
		self:RegisterEvent("LFG_LIST_ENTRY_EXPIRED_TOO_MANY_PLAYERS")
	else
		self:UnregisterAllEvents()
		LookingForGroup_Auto.db.profile.wq = nil
	end
end

local function is_group_wq(id)
	if id == 43943 or id == 45379 then
		return false
	end
	local wq_type = select(3,GetQuestTagInfo(id))
	if wq_type == nil or wq_type == LE_QUEST_TAG_TYPE_PET_BATTLE or wq_type == LE_QUEST_TAG_TYPE_PROFESSION or wq_type == LE_QUEST_TAG_TYPE_DUNGEON or wq_type == LE_QUEST_TAG_TYPE_RAID then
		return false
	end
	if select(2,C_TaskQuest.GetQuestInfoByQuestID(id)) == 1090 then
		return false
	end
	return true
end

function LookingForGroup_WQ:QUEST_ACCEPTED(info,index,wq_id)
	if wq_id and (info == LookingForGroup or is_group_wq(wq_id)) then
		local activityID, categoryID, filters, questName = LFGListUtil_GetQuestCategoryData(wq_id)
		if activityID then
			if LookingForGroup_Auto.db.profile.doing_wq == wq_id  then
				LookingForGroup_Auto.restore()
			end
			local function create()
				local profile = LookingForGroup.db.profile
				local wqgf,wqt = profile.addon_wqgf,profile.addon_wqt
				local comment
				if wqft or wqt then
					local tb = {}
					if wqgf then
						tb[#tb+1] = "#WQ:"
						tb[#tb+1] = wq_id
						tb[#tb+1] = "#PVE#"
					end
					if wqt then
						tb[#tb+1] = "#ID"
						tb[#tb+1] = wq_id
						tb[#tb+1] = "#PVE"
					end
					comment = table.concat(tb)
				else
					comment = ""
				end
				C_LFGList.CreateListing(activityID,"",profile.auto_ilvl or 0,0,"",comment,true,false,wq_id)
			end
			LookingForGroup_Auto.accepted(create,function()
				local patterns = {{matches = {questName}}}
				local auto_pve = LookingForGroup.db.profile.auto_pve
				if auto_pve then
					patterns[#patterns+1] = {matches={"PVE"}}
				elseif auto_pve == false then
					patterns[#patterns+1] = {matches={"PVP"}}
				end
				LookingForGroup.Search(function()
					if LookingForGroup_Auto.db.profile.wq == wq_id then
						LookingForGroup_Auto.apply(create)
					end
				end,categoryID,patterns,0,filters)
			end,info==LookingForGroup,"wq",wq_id)
		end
	end
end

function LookingForGroup_WQ:QUEST_REMOVED(info,id)
	C_Timer.After(0.1,function()
		if LookingForGroup_Auto.db.profile.wq == id then
			if (LookingForGroup_Auto.abandon(function()
				LeaveParty()
				if LookingForGroup_Auto.db.profile.wq == id then
					LookingForGroup_Auto.db.profile.wq = nil
				end
			end)) then
				LookingForGroup_Auto.db.profile.wq = nil
			end
		end
	end)
end

function LookingForGroup_WQ:QUEST_TURNED_IN(info,id)
	if LookingForGroup_Auto.db.profile.wq == id then
		LookingForGroup_Auto.db.profile.wq = nil
		LookingForGroup_Auto.done()
	end
end

function LookingForGroup_WQ:LFG_LIST_ENTRY_EXPIRED_TOO_MANY_PLAYERS()
	local wq = LookingForGroup_Auto.db.profile.wq
	if wq and IsInGroup() and UnitIsGroupLeader("player") then
		if LookingForGroup.db.profile.hardware then
			local dialog = StaticPopupDialogs.LookingForGroup_HardwareAPIDialog
			dialog.text = START_A_GROUP
			dialog.OnAccept = function()
				C_LFGList.CreateListing(LFGListUtil_GetQuestCategoryData(wq),"",LookingForGroup.db.profile.auto_ilvl or 0,0,"","",true,false,wq)
			end
			StaticPopup_Show("LookingForGroup_HardwareAPIDialog")
		else
			C_LFGList.CreateListing(LFGListUtil_GetQuestCategoryData(wq),"",LookingForGroup.db.profile.auto_ilvl or 0,0,"","",true,false,wq)
		end
	end
end
