local AceAddon = LibStub("AceAddon-3.0")
local LookingForGroup = AceAddon:GetAddon("LookingForGroup")
local LookingForGroup_Auto = AceAddon:GetAddon("LookingForGroup_Auto")
local LookingForGroup_InvasionPoint = AceAddon:NewAddon("LookingForGroup_InvasionPoint","AceEvent-3.0")

function LookingForGroup_InvasionPoint:OnInitialize()
end

function LookingForGroup_InvasionPoint:OnEnable()
	if LookingForGroup.db.profile.enable_invasionpoint then
		self:RegisterEvent("LOADING_SCREEN_DISABLED")
	else
		self:UnregisterAllEvents()
	end
end

function LookingForGroup_InvasionPoint.callback(secure)
	local mfn = GetMapInfo()
	if mfn and mfn:find("InvasionPoint") then
		local name = GetMapNameByID(GetCurrentMapAreaID())
		local enfnm = mfn:gsub ("InvasionPoint", "")
		local function create()
			C_LFGList.CreateListing(16,"Invasion Point: "..enfnm,0,0,"","LookingForGroup "..name,true,false)
		end
		if IsInGroup() then
			if not C_LFGList.GetActiveEntryInfo() and UnitIsGroupLeader("player") then
				LookingForGroup_Auto.hardware_api(START_A_GROUP,create)
			end
		else
			LookingForGroup_Auto.accepted(function()
				LookingForGroup.Search(function()
					LookingForGroup_Auto.apply(create)
				end,6,{{matches = {name,enfnm}}},0,0)
			end,secure)
		end
	else
		local active, activityID, iLevel, honorLevel, name, comment, voiceChat, expiration, oldAutoAccept, privateGroup, questID = C_LFGList.GetActiveEntryInfo()
		if active then
			if strfind(comment,"Invasion Point") then
				LookingForGroup_Auto.done()
			end
		end
	end
end

function LookingForGroup_InvasionPoint:LOADING_SCREEN_DISABLED()
	C_Timer.After(2,LookingForGroup_InvasionPoint.callback)
end
