local AceAddon = LibStub("AceAddon-3.0")
local LookingForGroup = AceAddon:GetAddon("LookingForGroup")
local LookingForGroup_Auto = AceAddon:GetAddon("LookingForGroup_Auto")
local LookingForGroup_Elite = AceAddon:NewAddon("LookingForGroup_Elite","AceEvent-3.0")
local UnitGUID = UnitGUID
local UnitTarget = UnitTarget
local UnitClassification = UnitClassification

function LookingForGroup_Elite:OnInitialize()
end

function LookingForGroup_Elite:OnEnable()
	if LookingForGroup.db.profile.enable_elite then
		self:RegisterEvent("PLAYER_TARGET_CHANGED")
	else
		self:UnregisterAllEvents()
	end
end

function LookingForGroup_Elite:PLAYER_TARGET_CHANGED()
	if IsInInstance() then
		return
	end
	local guid = UnitGUID("target")
	if guid then
		local classification = UnitClassification("target")
		if classification == "rareelite" then
			local npc_id = select(6,strsplit("-",guid))
			if npc_id then
				local name = UnitName("target")
				if name and UnitLevel("player") <= UnitLevel("target") then
					local function create()
						C_LFGList.CreateListing(16,name,LookingForGroup.db.profile.auto_ilvl or 0,0,"","LookingForGroup #NPCID"..npc_id,true,false)
					end
					LookingForGroup_Auto.accepted(create,function()
						LookingForGroup.Search(function()
							LookingForGroup_Auto.apply(create)
						end,6,{{matches = {"#NPCID"..npc_id,name}}},0,0)
					end,nil,"elite",guid)
					self:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
				end
			end
		end
	end
end

function LookingForGroup_Elite:COMBAT_LOG_EVENT_UNFILTERED(_,timeStamp, event, hideCaster, sourceGUID, sourceName, sourceFlags, sourceRaidFlags, destGUID, destName, destFlags, destRaidFlags)
	if event == "UNIT_DIED" and destGUID == LookingForGroup_Auto.db.profile.elite then
		self:UnregisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
		LookingForGroup_Auto.db.profile.elite = nil
		LookingForGroup_Auto.done()
	end
end
