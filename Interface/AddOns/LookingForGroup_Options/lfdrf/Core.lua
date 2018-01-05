local LookingForGroup_Options = LibStub("AceAddon-3.0"):GetAddon("LookingForGroup_Options")

local order = 0
local function get_order()
	local temp = order
	order = order +1
	return temp
end

local selected_dungeon
local selected_raids = {}
local dungeons_tb = {}
local lfr_tb = {}
local selected_lfr_tb = {}
local all_dg

LookingForGroup_Options:push("lfdrf",
{
	name = "LFD/RF",
	desc = LOOKING_FOR_DUNGEON..'/'..RAID_FINDER,
	type = "group",
	args =
	{
		lfd =
		{
			name = LFG_TYPE_RANDOM_DUNGEON,
			type = "select",
			order = get_order(),
			style = "radio",
			values = function()
				wipe(dungeons_tb)
				for i=1,GetNumRandomDungeons() do
					local id, name = GetLFGRandomDungeonInfo(i)
					if IsLFGDungeonJoinable(id) then
						dungeons_tb[id] = name
					end
				end
				if selected_dungeon == nil then
					selected_dungeon = GetRandomDungeonBestChoice()
				end
				return dungeons_tb
			end,
			get = function()
				return selected_dungeon
			end,
			set = function(_,key)
				selected_dungeon = key
			end,
			width = "full"
		},
		lfd_exec =
		{
			type = "execute",
			name = function()
				if GetLFGQueueStats(1) then
					return LEAVE_QUEUE
				else
					return FIND_A_GROUP
				end
			end,
			order = get_order(),
			func = function()
				if GetLFGQueueStats(1) then
					LeaveLFG(1)
				elseif selected_dungeon then
					ClearAllLFGDungeons(1)
					JoinSingleLFG(1,selected_dungeon)
				end
			end
		},
		rf =
		{
			type = "multiselect",
			name = RAID_FINDER,
			order = get_order(),
			tristate = true,
			values = function()
				wipe(lfr_tb)
				for i = 1,GetNumRFDungeons() do
					local id = GetRFDungeonInfo(i)
					if IsLFGDungeonJoinable(id) then
						if all_dg then
							lfr_tb[#lfr_tb + 1] = i
						else
							local numEncounters = GetLFGDungeonNumEncounters(id)
							local j = 1
							while j <= numEncounters do
								local _, _, isKilled = GetLFGDungeonEncounterInfo(id, j)
								if not isKilled then
									break
								end								
								j = j + 1
							end
							if j <= numEncounters then
								lfr_tb[#lfr_tb + 1] = i
							end
						end
					end
				end
				return lfr_tb
			end,
			width = "full",
			dialogControl = "LookingForGroup_Options_LFR"
		},
		lfr_apply =
		{
			type = "execute",
			name = SIGN_UP,
			order = get_order(),
			func = function()
				for k,v in pairs(selected_lfr_tb) do
					if v then
						if GetLFGMode(3,k) then
							LeaveSingleLFG(3,k)
							selected_lfr_tb[k] = nil
						end
					end
				end
				local k,v = next(selected_lfr_tb)
				if v then
					ClearAllLFGDungeons(3)
					SetLFGDungeon(3,k)
					JoinLFG(3)
				end
			end
		},
		rf_all =
		{
			type = "execute",
			name = ALL,
			order = get_order(),
			func = function()
				if next(selected_lfr_tb) then
					wipe(selected_lfr_tb)
					return
				end
				for i=1,#lfr_tb do
					local id = GetRFDungeonInfo(lfr_tb[i])
					if not GetLFGMode(3,id) then
						selected_lfr_tb[id] = true
					end
				end
			end
		},
		rf_leaveall =
		{
			type = "execute",
			name = LEAVE_ALL_QUEUES,
			order = get_order(),
			func = function()
				for i = 1,GetNumRFDungeons() do
					local id = GetRFDungeonInfo(i)
					if IsLFGDungeonJoinable(id) then
						LeaveSingleLFG(3,id)
					end
				end
				wipe(selected_lfr_tb)
			end
		},
		rf_cancel =
		{
			type = "execute",
			name = CANCEL,
			order = get_order(),
			func = function()
				wipe(selected_lfr_tb)			
			end
		},
		rf_sall =
		{
			type = "toggle",
			name = ALL,
			order = get_order(),
			set = function(_,val)
				if val then
					all_dg = true
				else
					all_dg = nil
				end
			end,
			get = function()
				return all_dg
			end,
		},
	}
})

function LookingForGroup_Options:LFG_UPDATE(...)
	local k,v = next(selected_lfr_tb)
	if v and GetLFGMode(3,k) then
		selected_lfr_tb[k] = nil
	end
	self.NotifyChangeIfSelected("lfdrf")
end

local AceGUI = LibStub("AceGUI-3.0")

AceGUI:RegisterWidgetType("LookingForGroup_Options_LFR", function()
	local control = AceGUI:Create("InlineGroup")
	control:SetLayout("Flow")
	control.width = "fill"
	control.SetList = function(self,values)
		self.values = values
	end
	control.SetLabel = function(self,value)
		self:SetTitle(value)
	end
	control.SetDisabled = function(self,disabled)
		self.disabled = disabled
	end
	control.SetMultiselect = function()end
	control.SetItemValue = function(self,key)
		local kval = self.values[key]
		local check = AceGUI:Create("CheckBox")
		check:SetTriState(true)
		local id, name, typeID, subtypeID, minLevel, maxLevel, recLevel, minRecLevel, 
			maxRecLevel, expansionLevel, groupID, textureFilename, difficulty, maxPlayers,
			description, isHoliday, bonusRepAmount, minPlayers, _, raidname, ilvl = GetRFDungeonInfo(kval)
		check:SetLabel('|cff8080cc'..raidname.."|r   "..name)
		local numEncounters = GetLFGDungeonNumEncounters(id)
		local state = selected_lfr_tb[id]
		if GetLFGMode(3,id) then
			if state then
				check:SetValue(false)
			else
				check:SetValue(nil)
			end
		else
			if state then
				check:SetValue(true)
			elseif state == nil then
				check:SetValue(false)
			end
		end
		check:SetCallback("OnValueChanged",function(self,_,val)
			if GetLFGMode(3,id) then
				if val == false then
					selected_lfr_tb[id] = true
					self:SetValue(false)
				else
					selected_lfr_tb[id] = nil
					self:SetValue(nil)
				end
			else
				if val then
					selected_lfr_tb[id] = true
					self:SetValue(true)
				else
					selected_lfr_tb[id] = nil
					self:SetValue(false)
				end
			end
		end)
		check:SetCallback("OnLeave", function(self,...)
			GameTooltip:Hide()
		end)
		check:SetCallback("OnEnter", function(self,...)
			GameTooltip:SetOwner(self.frame,"ANCHOR_TOPRIGHT")
			GameTooltip:ClearLines()
			GameTooltip:AddDoubleLine(name,id)
			GameTooltip:AddLine(raidname)
			GameTooltip:AddLine(description, 0.5, 0.5, 0.8, true)
			GameTooltip:AddLine(" ")
			if ilvl then
				GameTooltip:AddDoubleLine(LFG_LIST_ITEM_LEVEL_INSTR_SHORT,ilvl)
				GameTooltip:AddLine(" ")
			end
			GameTooltip:AddLine(numEncounters)
			for j = 1, numEncounters do
				local bossName, _, isKilled = GetLFGDungeonEncounterInfo(id, j);
				if isKilled then
					GameTooltip:AddLine(bossName,1,0,0,true)
				else
					GameTooltip:AddLine(bossName)
				end
			end
			GameTooltip:Show()
		end)
		check.width = "fill"
		self:AddChild(check)
	end
	return AceGUI:RegisterAsContainer(control)
end , 1)
