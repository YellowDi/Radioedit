local E, L, V, P, G = unpack(ElvUI); --Import: Engine, Locales, PrivateDB, ProfileDB, GlobalDB, Localize Underscore
local TT = E:GetModule('Tooltip')

local tiers = { "翡翠梦魇", "暗夜要塞", "勇气试炼","萨格拉斯之墓",}
local levels = { 
	"M", 
	"H", 
	"PT",
	"随机",
}

local task={
	{ -- 挑战模式
		7399,"大秘境",
	},
}
local bosses = {
	{ -- Emerald Nightmare
		{ --Mythic
			10914, 10923, 10927, 10919, 10931, 10935, 10939, 
		},
		{ -- Herioc
			10913, 10922, 10926, 10917, 10930, 10934, 10938, 
		},
		{ -- Normal
			10912, 10921, 10925, 10916, 10929, 10933, 10937, 
		},
		{ -- LFR
			10911, 10920, 10924, 10915, 10928, 10932, 10936, 
		},
	},
	{ -- Nighthold
		{ --Mythic
			10943, 10947, 10951, 10955, 10960, 10964, 10968, 10972, 10976, 10980,
		},
		{ -- Herioc
			10942, 10946, 10950, 10954, 10959, 10963, 10967, 10971, 10975, 10979,
		},
		{ -- Normal
			10941, 10945, 10949, 10953, 10957, 10962, 10966, 10970, 10974, 10978,
		},
		{ -- LFR
			10940, 10944, 10948, 10952, 10956, 10961, 10965, 10969, 10973, 10977,
		},
	},
	{ -- Trial of Valor
		{ --Mythic
			11410, 11414, 11418,
		},
		{ -- Herioc
			11409, 11413, 11417,
		},
		{ -- Normal
			11408, 11412, 11416,
		},
		{ -- LFR
			11407, 11411, 11415,
		},
	},
	{ -- Tomb of Sargeras
		{ --Mythic
			11880,11884, 11888, 11892, 11896, 11900, 11904, 11908, 11912,
		},
		{ -- Herioc
			11879,11883, 11887, 11891, 11895, 11899, 11903, 11907, 11911,
		},
		{ -- Normal
			11878,11882, 11886, 11890, 11894, 11898, 11902, 11906, 11910,
		},
		{ -- LFR
			11877,11881, 11885, 11889, 11893, 11897, 11901, 11905, 11909,
		},
	},
}

local playerGUID = UnitGUID("player")
local progressCache = {}
local highest = 0

local function GetProgression(guid)
	local kills, complete = false, 0
	local statFunc = guid == playerGUID and GetStatistic or GetComparisonStatistic
	local j=0
	
	
	for tier = 1, #tiers do
		
		progressCache[guid].header[tier] = {}
		progressCache[guid].info[tier] = {}

		for level = 1,#levels  do
			level=#levels-level+1
			local progres=0
			
			for statInfo = 1, #bosses[tier][level] do
				kills = tonumber((statFunc(bosses[tier][level][statInfo])))
				if kills and kills > 0 then					
					progres = progres + 1
					highest = highest + 1
				end
			end
			
			if (progres > 0) then
				progressCache[guid].header[tier][level] = ("%s [%s]:"):format(tiers[tier], levels[level])
				progressCache[guid].info[tier][level] = ("%d/%d"):format(progres, #bosses[tier][level])
			end
			
		end
	end	
	for i = 1, #task do

		local count= tonumber((statFunc(task[i][1])))
		if count~=nil and count>0 then
			j=#(progressCache[guid].header)
			progressCache[guid].header[j+i] = {}
			progressCache[guid].info[j+i] = {}
			progressCache[guid].header[j+i][1] = task[i][2]
			progressCache[guid].info[j+i][1] = count
			
			highest = highest + 1
		end

	end	
end

local function UpdateProgression(guid)
	progressCache[guid] = progressCache[guid] or {}
	progressCache[guid].header = progressCache[guid].header or {}
	progressCache[guid].info =  progressCache[guid].info or {}
	progressCache[guid].timer = GetTime()
		
	GetProgression(guid)	
end

local function SetProgressionInfo(guid, tt)
	if progressCache[guid] then
		local updated = 0
		local j=1
		for i=1, tt:NumLines() do
			local leftTipText = _G["GameTooltipTextLeft"..i]
			if leftTipText==nil then
				break
			end
			if leftTipText:GetText() and leftTipText:GetText():find("]:") then
				if progressCache[guid].header[j] then
					for level,v in pairs(progressCache[guid].header[j]) do
						if leftTipText:GetText():find(progressCache[guid].header[j][level]) then
							local rightTipText = _G["GameTooltipTextRight"..i]
							leftTipText:SetText(progressCache[guid].header[j][level])
							rightTipText:SetText(progressCache[guid].info[j][level])
							updated = 1
							j=j+1
							break
						end
						

					end
					
				end

			end
			for k = 1, #task do
				if leftTipText:GetText() and leftTipText:GetText():find(task[k][2]) then
					local rightTipText = _G["GameTooltipTextRight"..i]
					leftTipText:SetText(progressCache[guid].header[j][1])
					rightTipText:SetText(progressCache[guid].info[j][1])
					updated = 1
					j=j+1
					break
				end
				
			end	

			
		end
		if updated == 1 then return end
		-- add progression tooltip line
		if highest > 0 then tt:AddLine(" ") end
		

		
		
		
		for tier = 1, #(progressCache[guid].header) do
			local j=1
			for level,v in pairs(progressCache[guid].header[tier]) do
				if j<=2 then
					tt:AddDoubleLine(progressCache[guid].header[tier][level], progressCache[guid].info[tier][level], nil, nil, nil, 1, 1, 1)
				end
				j=j+1
			end

		end
		
		
		--print(table.toString(progressCache[guid]))
	end
end

function TT:INSPECT_ACHIEVEMENT_READY(event, GUID)
	if (self.compareGUID ~= GUID) then return end

	local unit = "mouseover"
	if UnitExists(unit) then
		UpdateProgression(GUID)
		GameTooltip:SetUnit(unit)
	end
	ClearAchievementComparisonUnit()
	self:UnregisterEvent("INSPECT_ACHIEVEMENT_READY")
end

hooksecurefunc(TT, 'ShowInspectInfo', function(self, tt, unit, level, r, g, b, numTries)
	if InCombatLockdown() then return end
	if not E.db.tooltip.progressInfo then return end
	if not level or level < MAX_PLAYER_LEVEL then return end
	if not (unit and CanInspect(unit)) then return end
	
	local guid = UnitGUID(unit)
	if not progressCache[guid] or (GetTime() - progressCache[guid].timer) > 600 then
		if guid == playerGUID then
			UpdateProgression(guid)
		else
			ClearAchievementComparisonUnit()		
			if not self.loadedComparison and select(2, IsAddOnLoaded("Blizzard_AchievementUI")) then
				AchievementFrame_DisplayComparison(unit)
				HideUIPanel(AchievementFrame)
				ClearAchievementComparisonUnit()
				self.loadedComparison = true
			end
			
			self.compareGUID = guid
			if SetAchievementComparisonUnit(unit) then
				self:RegisterEvent("INSPECT_ACHIEVEMENT_READY")
			end
			return
		end
	end

	SetProgressionInfo(guid, tt)
end)
