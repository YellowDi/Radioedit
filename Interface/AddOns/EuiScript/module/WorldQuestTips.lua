
local addonName
WorldQuestTips = CreateFrame("Frame"), {};

local version = 1.17
local versionSuffix = ""

local profileKey = UnitName("player").."-"..GetRealmName()
local gender = UnitSex("player");

local locale = GetLocale()
local L = {		-- Default english
	TITLE = "World Quest Tips & Timers",
	AVERAGE = "Average",
	COMPLETED_IN = "completed in",
	PER_MINUTE = "per minute",
	WAYPOINT_PATH = "Path to",
	WAYPOINT_CAVE = "Cave entrance to",
	WAYPOINT_STAIRS = "Stairs to",
	WAYPOINT_BUILDING = "Building entrance to",
	WAYPOINT_PORTAL = "Portal to",
	OPTIONS_Q_INFO = "Quest Information",
	OPTIONS_Q_ID = "Quest ID",
	OPTIONS_Q_NOTE = "Set note for this quest",
	OPTIONS_Q_NOTE_TIP = "Alt-Click on a world quest or enter an ID",
	OPTIONS_Q_TT = "Total time spent, in Seconds",
	OPTIONS_Q_TC = "Number of times completed",
	OPTIONS_P_FOOTER = "You can ignore up to 3 tamers for each achievement",
	OPTIONS_G_REP_EX = "Continue to show faction after reaching exalted",
	OPTIONS_G_REP_CUR = "Show current reputation beside faction names",
	OPTIONS_G_TIMES = "Show current and/or average times",
	OPTIONS_G_OPEN_INFO = "Alt-Click on World Quest to open information",
}
if locale == 'zhCN' then
	L = {
		TITLE = "世界任务提示和计时",
		AVERAGE = "平均",
		COMPLETED_IN = "完成",
		PER_MINUTE = "每分钟",
		WAYPOINT_PATH = "路径",
		WAYPOINT_CAVE = "洞口",
		WAYPOINT_STAIRS = "台阶",
		WAYPOINT_BUILDING = "入口",
		WAYPOINT_PORTAL = "门户",
		OPTIONS_Q_INFO = "任务信息",
		OPTIONS_Q_ID = "任务ID",
		OPTIONS_Q_NOTE = "设置任务备注",
		OPTIONS_Q_NOTE_TIP = "Alt-点击一个世界任务或输入ID",
		OPTIONS_Q_TT = "总花费时间, 按秒",
		OPTIONS_Q_TC = "多次完成",
		OPTIONS_P_FOOTER = "You can ignore up to 3 tamers for each achievement",
		OPTIONS_G_REP_EX = "继续显示声望在崇拜后",
		OPTIONS_G_REP_CUR = "显示当前阵营声望",
		OPTIONS_G_TIMES = "显示当前或平均时间",
		OPTIONS_G_OPEN_INFO = "Alt-点击世界任务查看信息",
	}
elseif locale == 'zhTW' then
	L = {
		TITLE = "世界任務提示和計時",
		AVERAGE = "平均",
		COMPLETED_IN = "完成",
		PER_MINUTE = "每分鐘",
		WAYPOINT_PATH = "路徑",
		WAYPOINT_CAVE = "洞口",
		WAYPOINT_STAIRS = "臺階",
		WAYPOINT_BUILDING = "入口",
		WAYPOINT_PORTAL = "門戶",
		OPTIONS_Q_INFO = "任務資訊",
		OPTIONS_Q_ID = "任務ID",
		OPTIONS_Q_NOTE = "設置任務備註",
		OPTIONS_Q_NOTE_TIP = "Alt-點擊一個世界任務或輸入ID",
		OPTIONS_Q_TT = "總花費時間, 按秒",
		OPTIONS_Q_TC = "多次完成",
		OPTIONS_P_FOOTER = "You can ignore up to 3 tamers for each achievement",
		OPTIONS_G_REP_EX = "繼續顯示聲望在崇拜後",
		OPTIONS_G_REP_CUR = "顯示當前陣營聲望",
		OPTIONS_G_TIMES = "顯示當前或平均時間",
		OPTIONS_G_OPEN_INFO = "Alt-點擊世界任務查看資訊",
	}
end


local wowhead = "www.wowhead.com/quest="
if locale ~= "enUS" then wowhead = locale:sub(1,2) .. ".wowhead.com/quest=" end

local debugging

local brokenIsleZones = {1015,1021,1014,1096,1024,1017,1033,1018} -- 1007 -- 1007 is the broken isles map. left out because it gives the wrong coords.

local leyraceWP = {
	[1018] = { -- Val'Sharah
		questID = 43753,
		waypoints = {
			{ 58.2, 88.8 },{ 58.2, 88.8 },{ 57.7, 87.0 },{ 57.2, 85.5 },{ 56.8, 83.4 },{ 56.4, 81.5 },{ 56.7, 79.5 },{ 57.2, 78.5 },{ 57.7, 76.2 },{ 56.8, 71.0 },
			{ 56.2, 69.5 },{ 56.5, 67.3 },{ 57.3, 64.6 },{ 56.8, 62.5 },{ 56.1, 61.6 },{ 55.9, 59.8 },{ 56.0, 57.7 },{ 55.0, 53.7 },{ 54.7, 51.5 },{ 53.3, 50.3 }
		}
	},
	[1024] = { -- Highmountain
		questID = 43764,
		waypoints = {
			{ 59.99, 31.80},{ 59.28, 30.77},{ 58.23, 30.15},{ 57.12, 29.23},{ 57.79, 27.39},{ 56.87, 27.16},{ 55.26, 28.68},{ 50.34, 30.35},{ 47.55, 30.64},{ 43.96, 31.03},
			{ 41.67, 31.58},{ 40.42, 30.46},{ 37.55, 31.03},{ 35.26, 30.96},{ 33.59, 29.50},{ 34.52, 29.08},{ 35.18, 28.41},{ 36.39, 28.69},{ 37.49, 28.32}
		}
	},
	[1015] = { -- Azsuna
		questID = 43325,
		waypoints = {
			{ 63.6, 28.0 },{ 64.9, 25.9 },{ 64.7, 25.4 },{ 64.0, 25.6 },{ 62.4, 24.4 },{ 60.7, 21.2 },{ 58.8, 19.3 },{ 55.6, 17.0 },{ 52.6, 16.9 },{ 50.5, 15.4 },
			{ 48.4, 14.3 },{ 47.4, 11.4 },{ 45.5, 10.3 },{ 44.1, 9.2  },{ 42.5, 9.8  },{ 41.3, 12.2 },{ 39.5, 13.0 },{ 38.7, 15.7 },{ 37.1, 16.6 },{ 36.0, 19.1 }
		}
	},
	[1033] = { -- Suramar
		questID = 43774,
		waypoints = {
			{ 31.5, 45.4 },{ 31.0, 44.0 },{ 31.2, 40.9 },{ 32.0, 37.6 },{ 30.3, 37.4 },{ 32.4, 39.8 },{ 34.7, 42.6 },{ 36.3, 44.9 },{ 39.5, 44.6 },{ 41.9, 43.3 },
			{ 44.2, 43.2 },{ 46.3, 42.4 },{ 46.3, 40.3 },{ 45.6, 36.4 },{ 45.2, 33.4 },{ 44.8, 32.7 },{ 44.7, 31.2 },{ 45.5, 30.0 },{ 45.4, 28.3 },{ 42.7, 25.0 }
		}
	},
	[1017] = { -- Stormheim
		questID = 43769,
		waypoints = {
			{ 35.8, 69.1 },{ 36.9, 67.0 },{ 39.8, 63.0 },{ 42.9, 59.1 },{ 44.9, 56.4 },{ 44.9, 49.9 },{ 44.3, 48.0 },{ 44.0, 44.9 },{ 42.5, 42.8 },{ 41.5, 42.0 },
			{ 41.1, 40.6 },{ 41.4, 39.2 },{ 41.3, 36.1 },{ 40.2, 34.5 },{ 38.8, 33.5 },{ 38.1, 32.9 },{ 36.1, 30.7 },{ 33.4, 31.9 },{ 33.7, 33.8 },{ 33.4, 35.0 }
		}
	}
}

--[[-- "WorldQuestWayPoints" - If user has TomTom, use these waypoints as exceptions to the the default PoI --]]--
local wqwp = {
	--[[
	To Do:
	-- investigate WANTED: Fathnyr
	
	[43959] = { [1] = { x = 50, y = 50 } }, -- test with available quest
	[] = { [1] = { x = ,	y = ,	str = "" } },				-- 			--unverified accuracy
	--]]
	
	-- "DANGER:" quests:
	[44190] = { [1] = { x = 41.65,	y = 73.45,	str = L.WAYPOINT_PATH, 		add = true } },	-- DANGER: Jade Darkhaven			--unverified accuracy
	[42964] = { [1] = { x = 60.9,	y = 71.8,	str = L.WAYPOINT_PATH, 		add = true } },	-- DANGER: Lagertha					--unverified accuracy
	[44114] = { [1] = { x = 46.49,	y = 76.22,	str = L.WAYPOINT_STAIRS, 	add = true } },	-- DANGER: Magistrix Vilessa		--unverified accuracy
	[41703] = { [1] = { x = 52.27,	y = 58.16,	str = L.WAYPOINT_CAVE, 		add = true } },	-- DANGER: Ormagrogg				--unverified accuracy
	[41816] = { [1] = { x = 48.2,	y = 68.3,	str = L.WAYPOINT_PATH, 		add = true } },	-- DANGER: Oubdob da Smasher		--unverified accuracy
	[42963] = { [1] = { x = 84,		y = 9,		str = L.WAYPOINT_CAVE, 		add = true } },	-- DANGER: Rulf Bonesnapper			--unverified accuracy
	[44193] = { [1] = { x = 40.5,	y = 85.9,	str = L.WAYPOINT_CAVE, 		add = true } },	-- DANGER: Sea King Tidross			--unverified accuracy
	[44122] = { [1] = { x = 29.0,	y = 84.3,	str = L.WAYPOINT_CAVE, 		add = true } },	-- DANGER: Sorallus					--unverified accuracy
	[42953] = { [1] = { x = 84.0,	y = 9.5,	str = L.WAYPOINT_CAVE, 		add = true } },	-- DANGER: Soulbinder Halldora		--unverified accuracy
	[43101] = { [1] = { x = 23.90,	y = 68.22,	str = L.WAYPOINT_CAVE, 		add = true } },	-- DANGER: Withdoctor Grgl-Brgl		--unverified accuracy
	
	-- "WANTED:" quests, most have rare and normal versions:
	[42636] = { [1] = { x = 41.1,	y = 35.3,	str = L.WAYPOINT_PATH, 		add = true } },	-- WANTED: Arcanist Shal'iman		--unverified accuracy
	[43605] = { [1] = { x = 41.1,	y = 35.3,	str = L.WAYPOINT_PATH, 		add = true } },	-- WANTED: Arcanist Shal'iman
	[41824] = {	[1] = { x = 48.67,	y = 49.96,	str = L.WAYPOINT_CAVE, 		add = true },	-- WANTED: Arru						--unverified accuracy
				[2] = { x = 46.29,	y = 49.60,	str = L.WAYPOINT_PATH, 		add = true } },	                   
	[44289] = {	[1] = { x = 48.67,	y = 49.96,	str = L.WAYPOINT_CAVE, 		add = true },	-- WANTED: Arru
				[2] = { x = 46.29,	y = 49.60,	str = L.WAYPOINT_PATH, 		add = true } },		                    
	[43426] = { [1] = { x = 58.9,	y = 50.0,	str = L.WAYPOINT_PATH, 		add = true } },	-- WANTED: Brogozog					--unverified accuracy
	[43607] = { [1] = { x = 58.9,	y = 50.0,	str = L.WAYPOINT_PATH, 		add = true } },	-- WANTED: Brogozog
	[43430] = { [1] = { x = 51.6,	y = 44.6,	str = L.WAYPOINT_PATH, 		add = true } },	-- WANTED: Captain Volo'ren			--unverified accuracy
	[43608] = { [1] = { x = 51.6,	y = 44.6,	str = L.WAYPOINT_PATH, 		add = true } },	-- WANTED: Captain Volo'ren
	[41826] = { [1] = { x = 49.57,	y = 39.74,	str = L.WAYPOINT_PATH, 		add = true } },	-- WANTED: Crawshuk the Hungry		--unverified accuracy
	[41826] = { [1] = { x = 49.57,	y = 39.74,	str = L.WAYPOINT_PATH, 		add = true } },	-- WANTED: Crawshuk the Hungry
	[43455] = { [1] = { x = 55.25,	y = 44.41,	str = L.WAYPOINT_CAVE, 		add = true } },	-- WANTED: Devouring Darkness		--unverified accuracy
	[43617] = { [1] = { x = 55.25,	y = 44.41,	str = L.WAYPOINT_CAVE, 		add = true } },	-- WANTED: Devouring Darkness
	[43428] = { [1] = { x = 46.7,	y = 28.2,	str = L.WAYPOINT_PATH, 		add = true } },	-- WANTED: Doomlord Kazrok			--unverified accuracy
	[43609] = { [1] = { x = 46.7,	y = 28.2,	str = L.WAYPOINT_PATH, 		add = true } },	-- WANTED: Doomlord Kazrok
	[43620] = { [1] = { x = 41.4,	y = 31.9,	str = L.WAYPOINT_CAVE, 		add = true } },	-- WANTED: Egyl the Enduring		--unverified accuracy
	[43454] = { [1] = { x = 41.4,	y = 31.9,	str = L.WAYPOINT_CAVE, 		add = true } },	-- WANTED: Egyl the Enduring
	[42631] = { [1] = { x = 26.82,	y = 49.06,	str = L.WAYPOINT_PORTAL, 	add = true } },	-- WANTED: Inquisitor Tivos			--confirmed
	[43611] = { [1] = { x = 26.82,	y = 49.06,	str = L.WAYPOINT_PORTAL, 	add = true } },	-- WANTED: Inquisitor Tivos
	[43612] = { [1] = { x = 50.20,	y = 07.80,	str = L.WAYPOINT_CAVE, 		add = true } },	-- WANTED: Normantis the Deposed	--unverified accuracy
	[43432] = { [1] = { x = 50.20,	y = 07.80,	str = L.WAYPOINT_CAVE, 		add = true } },	-- WANTED: Normantis the Deposed
	[42795] = { [1] = { x = 23.34,	y = 40.85,	str = L.WAYPOINT_CAVE, 		add = true } },	-- WANTED: Sanaar					--unverified accuracy
	[43429] = { [1] = { x = 66.4,	y = 50.1,	str = L.WAYPOINT_PATH, 		add = true } },	-- WANTED: Syphonus					--unverified accuracy
	[43613] = { [1] = { x = 66.4,	y = 50.1,	str = L.WAYPOINT_PATH,		add = true } },	-- WANTED: Syphonus
	[43437] = { [1] = { x = 41.94,	y = 71.16,	str = L.WAYPOINT_BUILDING,	add = true } },	-- WANTED: Thane Irglov				--unverified accuracy
	[43626] = { [1] = { x = 41.94,	y = 71.16,	str = L.WAYPOINT_BUILDING,	add = true } },	-- WANTED: Thane Irglov
	[43451] = { [1] = { x = 64.8,	y = 51.8 } },											-- WANTED: Urgev the Flayer			--unverified accuracy
	[43628] = { [1] = { x = 64.8,	y = 51.8 } },											-- WANTED: Urgev the Flayer
			                                                                                        
	[44002] = {	[1] = { x = 80.36,	y = 70.53,	str = "Southern pylon" },					-- Undersea Survey					--confirmed
				[2] = { x = 79.54,	y = 63.12,	str = "Eastern Pylon" },
				[3] = { x = 74.44,	y = 56.67,	str = "Western Pylon" },
				[4] = { x = 78.61,	y = 55.98,	str = "Northern Pylon" } },
			                                                                                        
	[44067] = {	[1] = { x = 59.8,	y = 58.1,	str = "Callus" },							-- Consolidating Power				--unverified accuracy
				[2] = { x = 61.9,	y = 60.8,	str = "Garion" },
				[3] = { x = 57.8,	y = 62.0,	str = "Leleyna" } },
				
	[41950] = { [1] = { x = 37.46,	y = 64.18 } },											-- Cry More Thunder!				--confirmed
			                                                                                        
	[44002] = {	[1] = { x = 40.7,	y = 68.9,	str = "Highmountain Prisoner" },			-- An Overdue Debt					--confirmed
				[2] = { x = 40.2,	y = 68.5,	str = "Highmountain Prisoner" },
				[3] = { x = 42.4,	y = 69.7,	str = "Highmountain Prisoner" },
				[4] = { x = 42.7,	y = 70.7,	str = "Highmountain Prisoner" },
				[5] = { x = 45.7,	y = 71.5,	str = "Highmountain Prisoner" },
				[6] = { x = 46.4,	y = 72.8,	str = "Highmountain Prisoner" },
				[7] = { x = 41.8,	y = 67.7,	str = "Highmountain Prisoner" },
				[8] = { x = 43.8,	y = 64.9,	str = "Highmountain Prisoner" },
				[9] = { x = 44.9,	y = 65.0,	str = "Highmountain Prisoner" },
				[10]= { x = 45.5,	y = 66.2,	str = "Highmountain Prisoner" } },
}
local awqwp = {} -- Active WorldQuestWayPoints

local zoneFactions = {
	[1015] = 1900, -- Azsuna		= Court of Farondis
	[1018] = 1883, -- Val'sharah	= Dreamweavers
	[1033] = 1859, -- Suramar	 	= The Nightfallen
	[1024] = 1828, -- Highmountain	= Highmountain Tribe
	[1017] = 1948  -- Stormheim		= Valarjar
}
local tracking = { }
local trackingNames = {}

local pets = {	-- links pet family to achievements (gets icons added too)
	[1]  = { achID = 9692 }, -- Humanoid
	[2]  = { achID = 9689 }, -- Dragonkin
	[3]  = { achID = 9691 }, -- Flying
	[4]  = { achID = 9695 }, -- Undead
	[5]  = { achID = 9688 }, -- Critter
	[6]  = { achID = 9693 }, -- Magic
	[7]  = { achID = 9690 }, -- Elemental
	[8]  = { achID = 9687 }, -- Beast
	[9]  = { achID = 9686 }, -- Aquatic
	[10] = { achID = 9694 }  -- Mechanical
}
local botbi = { }
local dataloaded = false

local pet_quests = {
	[1]  = 40279, -- "Durian Strongfruit",
	[2]  = 40278, -- "Robert Craig",
	[3]  = 40280, -- "Bredda Tenderhide",
	[4]  = 41990, -- "Varenne",
	[5]  = 41860, -- "Xorvasc",
	[6]  = 40337, -- "Master Tamer Flummox",
	[7]  = 40277, -- "Tiffany Nelson",
	[8]  = 40282, -- "Grixis Tinypop",
	[9]  = 42442, -- "Amalia",
	[10] = 40298, -- "Sir Galveston",
	[11] = 41944, -- "Trapper Jarrun",
	[12] = 40299, -- "Bodhi Sunwayver",
	[13] = 41895, -- "Aulier",
	[14] = 41687, -- "Odrogg",
	[15] = 42159, -- "Nightwatcher Merayl",
}

local pet_tamers = {}

--[[
id, name, points, completed, month, day, year, description, flags, icon, rewardText, isGuildAch, wasEarnedByMe, earnedBy = GetAchievementInfo(id)
description, type, completed, quantity, requiredQuantity, characterName, flags, assetID, quantityString, criteriaID = GetAchievementCriteriaInfo(achievementID, index)
		(Index of one of the achievement's criteria (between 1 and GetAchievementNumCriteria(id))
--]]
local function getdata()
	if debugging then print("Getting data for achievement tips...") end
	
	local _,botbiName,_,botbiAchcompleted = GetAchievementInfo(10876)
	botbi.name = botbiName
	botbi.complete = botbiAchcompleted
	botbi.count = 0
	if not botbiAchcompleted then
		for i = 1, GetAchievementNumCriteria(10876) do
			local _,_,botbiCompleted,_,_,_,_,botbiID = GetAchievementCriteriaInfo(10876, i)
			botbi[botbiID] = botbiCompleted
			if botbiCompleted then botbi.count = botbi.count + 1 end
		end
	end
	for i = 1, GetAchievementNumCriteria(9692) do
		local description, type, completed, quantity, requiredQuantity, characterName, flags, assetID, quantityString, criteriaID = GetAchievementCriteriaInfo(9692, i)
		pet_tamers[description] = { }
		local quest = pet_quests[i]
		pet_quests[quest] = description
	end
	
	--	local description, type, completed, quantity, requiredQuantity, characterName, flags, assetID, quantityString, criteriaID = GetAchievementCriteriaInfo(9692, i)
	for f = 1, 10 do
		pets[f].icon = format("\124TInterface\\Icons\\Pet_Type_%s:16\124t",PET_TYPE_SUFFIX[f])
		pets[f].count = 0
		pets[f].ignored = 0
		local _,achname,_,achcompleted = GetAchievementInfo(pets[f].achID)
		pets[f].achName = achname
		for i = 1, GetAchievementNumCriteria(pets[f].achID) do
			local description, _, completed = GetAchievementCriteriaInfo(pets[f].achID, i)
			if WorldQuestTipsData.global.pets.ff[description] == nil then WorldQuestTipsData.global.pets.ff[description] = { } end
			if WorldQuestTipsData.global.pets.ff[description][f] == nil then WorldQuestTipsData.global.pets.ff[description][f] = true end
			if achcompleted then completed = true end
			pet_tamers[description][f] = completed
			if completed then pets[f].count = pets[f].count + 1 end
		end
	end
	
	dataloaded = true
end

local function wayPointsEnabled( source )
	local wayPointsEnabled = true
	if not TomTom then wayPointsEnabled = false
	elseif source == "auto" then wayPointsEnabled = WorldQuestTipsData.global.options.TomTomAQ
	elseif source == "click" then wayPointsEnabled = WorldQuestTipsData.global.options.TomTomMP
	elseif source == "leyrace" then wayPointsEnabled = WorldQuestTipsData.global.options.TomTomLR end
	return wayPointsEnabled
end

local function addWayPoints( questID, source, m, f, x, y, title )
	if wayPointsEnabled( source ) then
		if awqwp[questID] == nil then awqwp[questID] = {} end
		if wqwp[questID] then
			local m = GetCurrentMapAreaID()
			for i,quest in pairs( wqwp[questID] ) do
				local wp = wqwp[questID][i]
				title = C_TaskQuest.GetQuestInfoByQuestID(questID)
				if wp.str then
					if wp.add then title = wp.str .. " " .. title
					else title = wp.str end
				end
				awqwp[questID][i] = TomTom:AddMFWaypoint(m, 0, wp.x/100, wp.y/100, {title=title, persistent=false })
			end
		elseif source == "click" then
			awqwp[questID][1] = TomTom:AddMFWaypoint(m, f, x, y, {title=title, persistent=false })
		elseif source == "leyrace" then
			for i in pairs( awqwp[questID] ) do TomTom:RemoveWaypoint( awqwp[questID][i] ) end
			for i, wp in pairs( leyraceWP[ m ].waypoints ) do
				awqwp[questID][i] = TomTom:AddMFWaypoint(m, 0, wp[1]/100, wp[2]/100, {title=title, persistent=false })
			end
		end
	end
end


local function addWorldQuest(id)
	local title, level, suggestedGroup, isHeader, isCollapsed, isComplete, frequency, questID, startEvent, displayQuestID, isOnMap, hasLocalPOI, isTask, isStory = GetQuestLogTitle(id)
	local tagID, tagName, worldQuestType, rarity, isElite, tradeskillLineIndex = GetQuestTagInfo(questID);
	if worldQuestType then
		
		if debugging then print("WQT-Dedugging: Attempting to add World Quest - "..questID) end
		
		addWayPoints( questID, "auto" )
		
		--[[ -- consider option to remove generic waypoints on quest pickup?
		if awqwp[questID] and wqwp[questID] == nil then
			for i in pairs( awqwp[questID] ) do
				TomTom:RemoveWaypoint( awqwp[questID][i] )
			end
			awqwp[questID] = nil
		end
		-]]
				
		table.insert(trackingNames, title)
		local isInArea, isOnMap, numObjectives = GetTaskInfo(questID)
		local objectives = {}
		for obj = 1, numObjectives do
			local objectiveText, objectiveType, finished = GetQuestObjectiveInfo(questID, obj, false);
			objectives[obj] = objectiveText
			if debugging then print(objectiveText) end
		end
		local percent = C_TaskQuest.GetQuestProgressBarInfo(questID);
		objectives.percent = percent
		if tracking[questID] == nil then
			tracking[questID] = {
				progressed = false,
				duration = 0,
				expires = C_TaskQuest.GetQuestTimeLeftMinutes(questID)*60 + time(),
				objectives = objectives,
				objectivesInit = objectives
			}
		end
		if not tracking[questID].active then
			tracking[questID].active = true
			tracking[questID].start = time()
		end
		if tracking[questID].expires < time() then
			tracking[questID].duration = 0
			tracking[questID].expires = C_TaskQuest.GetQuestTimeLeftMinutes(questID)*60 + time()
		end
	end
end

local function findQuest( questID )
--local function findQuest( questID, m )
--	if questID == nil then
		for _,mapID in pairs(brokenIsleZones) do
			
			local viewedZone = GetCurrentMapAreaID()
		--	SetMapToCurrentZone()
		--	local thisZone = GetCurrentMapAreaID()
		--	SetMapByID( mapID )
			
			-- /run for _,mapID in pairs({1015,1021,1014,1096,1024,1017,1033,1018,1007}) do print(mapID, C_TaskQuest.GetQuestLocation( 41938, mapID )) end
			-- /run print(C_TaskQuest.GetQuestZoneID(41938))
			-- /run local taskInfo = C_TaskQuest.GetQuestsForPlayerByMapID(1007) for i,info in pairs(taskInfo) do print(info.questId) end
			
			
		--	local taskInfo = C_TaskQuest.GetQuestsForPlayerByMapID( 1007 )
			local taskInfo = C_TaskQuest.GetQuestsForPlayerByMapID( mapID )
			if taskInfo then
				for i, info in pairs(taskInfo) do
					if info.questId then
					--	print( info.questId )
						local _, questZoneId = C_TaskQuest.GetQuestZoneID( info.questId )
						local x, y = C_TaskQuest.GetQuestLocation( info.questId, questZoneId )
						if WorldQuestTipsData.global.worldQuests[info.questId] == nil then
							if debugging then print("WQT-Dedugging - New quest found: "..info.questId) end
							WorldQuestTipsData.global.worldQuests[info.questId] = {
								completed = 0,
								timespent = 0,
								coords = {
									default = {
										x = x,
									--	x = info.x,
										y = y,
									--	y = info.y,
										f = info.floor,
									--	m = mapID,
										m = questZoneId,
									}
								}
							}
					--	elseif WorldQuestTipsData.global.worldQuests[info.questId].coords == nil then
						else
							WorldQuestTipsData.global.worldQuests[info.questId].coords = {
								default = {
									x = x,
								--	x = info.x,
									y = y,
								--	y = info.y,
									f = info.floor,
								--	m = mapID,
									m = questZoneId,
								}
							}
						end
					end
				end
			end
		--	SetMapByID( viewedZone )
		end
		--[[
	else
		for _,mapID in pairs(brokenIsleZones) do
			local taskInfo = C_TaskQuest.GetQuestsForPlayerByMapID( mapID )
			for i, info in pairs(taskInfo) do
				if info.questId == questID then
					return info, mapID;
				end
			end
		end
	end
	return nil--]]
end

function WorldQuestTips:PLAYER_LOGIN(...)
	local defaultOptions = {
					debugging = false,
					TomTomAQ = true,
					TomTomMP = true,
					TomTomLR = true,
					PetFF = true,
					EditOnC = true,
					showExalted = true,
					showTimes = true,
					showCurrentRep = true,
					hideSmallGold = true,
					hideSmallGoldThreshold = 10,
				}
	if WorldQuestTipsData == nil then
		WorldQuestTipsData = {
			version = version,
			global = {
				options = defaultOptions,
				worldQuests = {},
				pets = { ff = {} },
			}
		}
	end
	for option, default in pairs( defaultOptions ) do
		if WorldQuestTipsData.global.options[option] == nil then WorldQuestTipsData.global.options[option] = default end
	end
	
	--[[	-- Do stuff here if users data needs altering with update (or one of messages)
	if WorldQuestTipsData.version == nil or version > WorldQuestTipsData.version then
	--	WorldQuestTipsData.version = version
	end
	--]]

	if WorldQuestTipsData[profileKey] == nil then WorldQuestTipsData[profileKey] = { worldQuestPartial = { } } end
	debugging = WorldQuestTipsData.global.options.debugging
	for questID, data in pairs(WorldQuestTipsData[profileKey].worldQuestPartial) do
		if data.expires > time() then
			if data.active then
				data.start = time()
			end
			tracking[questID] = data;
		end
	end
	
	local o = CreateFrame("FRAME")
	o.name = L.TITLE
	InterfaceOptions_AddCategory(o)
	o.title = o:CreateFontString(nil, o, "GameFontNormalLarge" )
	o.title:SetText( L.TITLE )
	o.title:SetPoint("CENTER",0,20)
	o.version = o:CreateFontString(nil, o, "GameFontWhite" )
	o.version:SetText("v" .. format("%.2f",version) .. versionSuffix );
	o.version:SetPoint("TOP", o.title, "BOTTOM" )
	o.loadBtn = CreateFrame("BUTTON", nil, o, "UIPanelButtonTemplate")
	o.loadBtn:SetWidth(98)
	o.loadBtn:SetHeight(24)
	o.loadBtn:SetText( GAMEOPTIONS_MENU )
	o.loadBtn:SetPoint("TOP", o.version, "BOTTOM", 0, -12)
	o.loadBtn:SetScript("OnClick", function() WorldQuestTips:loadOptions() ;InterfaceOptionsFrame:Hide();ToggleGameMenu() end)
end

function WorldQuestTips:PLAYER_LOGOUT(...)
	for questID, data in pairs(tracking) do
		if data.active then
			local isInArea, isOnMap, numObjectives = GetTaskInfo(questID)
			local progressed = false
			local objectives = {}
			for obj = 1, numObjectives do
				local objectiveText, objectiveType, finished = GetQuestObjectiveInfo(questID, obj, false);
				if objectiveText ~= data.objectives[obj] then progressed = true end
				objectives[obj] = objectiveText
			end
			local percent = C_TaskQuest.GetQuestProgressBarInfo(questID);
			if percent and percent ~= data.objectives.percent then
				progressed = true
				objectives.percent = percent
			end
			if progressed then
				data.objectives = objectives
				tracking[questID].duration = data.duration + ( time() - data.start )
			end
		end
	end
	WorldQuestTipsData[profileKey].worldQuestPartial = tracking
end

--[[-- Checks for world quests on load --]]--
function WorldQuestTips:PLAYER_ENTERING_WORLD()
	if debugging then print("WQT-Dedugging: Checking quest log for World Quests - "..GetNumQuestLogEntries().." quest log entries found...") end
	for q = 1, GetNumQuestLogEntries() do
		addWorldQuest(q)
	end
	for questID, data in pairs(tracking) do
		if GetQuestLogIndexByID(questID) == 0 then
			data.active = false;
		end
	end
end

--[[-- Filter System Message (quest completed string) --]]--
local filter = function(frame, event, message, ...)
	-- Filter function:
	--		return true to remove message
	--		return false with new message to ammend message
	--		return false to leave message unchanged
	local questFound = false;
	for _, questName in ipairs(trackingNames) do
		if (string.match(message, questName)) then
			questFound = true;
		end
	end
	if message:match("wqt:") then
        local newmessage = message:gsub("wqt:", "")
        return false, newmessage, ...
    else
		return questFound
	end
end
ChatFrame_AddMessageEventFilter("CHAT_MSG_SYSTEM", filter)

--[[-- For filter debugging (prints system all messages) --]]--[[
function WorldQuestTips:CHAT_MSG_SYSTEM(message)
	print( message )
end--]]

--[[ Checks chat links for customlink --]]
local OldSetItemRef = SetItemRef  
function SetItemRef(link, text, button, chatFrame) 
	local func, questID = strmatch(link, "^quest:(%a+)(%d+)") 
	if func == "wqtLink" then 
		WorldQuestTips:loadOptions( tonumber(questID) )
	else 
		OldSetItemRef(link, text, button, chatFrame) 
	end 
end 


function WorldQuestTips:QUEST_TURNED_IN(questID)
	if pet_quests[questID] or botbi[questID] == false then dataloaded = false end
	if tracking[questID] then
		local totaltime = tracking[questID].duration + ( time() - tracking[questID].start )
		if WorldQuestTipsData.global.worldQuests[questID] == nil then WorldQuestTipsData.global.worldQuests[questID] = { completed = 0, timespent = 0} end
		WorldQuestTipsData.global.worldQuests[questID].completed = WorldQuestTipsData.global.worldQuests[questID].completed + 1;
		WorldQuestTipsData.global.worldQuests[questID].timespent = WorldQuestTipsData.global.worldQuests[questID].timespent + totaltime;
		local averageTime = math.floor( WorldQuestTipsData.global.worldQuests[questID].timespent/WorldQuestTipsData.global.worldQuests[questID].completed )
		local title, factionID, capped = C_TaskQuest.GetQuestInfoByQuestID(questID);
		
		local completionString = "wqt:\124cffffff00\124Hquest:wqtLink"..questID..":110\124h["..title.."]\124h\124r "..L.COMPLETED_IN.." "..SecondsToTime(totaltime).. "."
		if WorldQuestTipsData.global.options.showTimes and WorldQuestTipsData.global.worldQuests[questID].completed > 1 then
			completionString = completionString .. " ("..L.AVERAGE..": "..SecondsToTime(averageTime)..")"
		end
		SendSystemMessage( completionString );
		if WorldQuestTipsData.global.options.showTimes and totaltime > 60 then
			local timeInMin = totaltime/60;
			local money = GetQuestLogRewardMoney(questID);
			if ( money > 100000 ) then -- don't bother displaying for low values of gold
				money = math.floor( money / timeInMin )
				SendSystemMessage(YOU_EARNED_LABEL.." "..GetCoinTextureString(money).." "..L.PER_MINUTE..".")
			end
			local name, texture, numItems = GetQuestLogRewardCurrencyInfo(1, questID);
			if name ~= nil then	
				numItems = math.floor( numItems / timeInMin )
				local text = BONUS_OBJECTIVE_REWARD_WITH_COUNT_FORMAT:format(texture, numItems, name);
				SendSystemMessage(YOU_EARNED_LABEL.." ".. text .." "..L.PER_MINUTE..".")
			end
		end
		tracking[questID] = nil
	end
end

--[[ function progress:UNIT_ENTERING_VEHICLE()
	local collectingEnergy = GetSpellInfo(218813)
	if UnitDebuff("player", collectingEnergy) then
	
		local viewedZone = GetCurrentMapAreaID()
		SetMapToCurrentZone()
		local thisZone = GetCurrentMapAreaID()
		SetMapByID( viewedZone )
		
		if leyraceWP[ thisZone ] then
			addWayPoints( leyraceWP[ thisZone ].questID, "leyrace", thisZone, nil, nil, nil, "Ley Line Node" )
		end
		TomTom:SetClosestWaypoint()
	--else
	--	print("bar")
	end
end ]]

local function addpetlines( tt, name, botbip )
	if WorldQuestTipsData.global.options.PetFF then
		local tamer = pet_tamers[name]
		tt:AddLine("\n"..ACHIEVEMENT_PROGRESSED..":")
		if botbip == false and not botbi.complete then
			tt:AddDoubleLine("|cffffff00[" .. botbi.name .. "]", "|cffffffff(".. botbi.count .. "/30)")
		end
		if tamer ~= nil then
			for f, complete in pairs(tamer) do
				if not complete and WorldQuestTipsData.global.pets.ff[name][f] ~= false then
					tt:AddDoubleLine(pets[f].icon .. "|cffffff00[" .. pets[f].achName .. "]", "|cffffffff(".. pets[f].count .. "/12)")
				end
			end
		end
	end
end

function WorldQuestTips:UNIT_QUEST_LOG_CHANGED(unitID)
	if unitID == "player" then
		for q = 1, GetNumQuestLogEntries() do
			local title, level, suggestedGroup, isHeader, isCollapsed, isComplete, frequency, questID, startEvent, displayQuestID, isOnMap, hasLocalPOI, isTask, isStory = GetQuestLogTitle(q)
			local tagID, tagName, worldQuestType, rarity, isElite, tradeskillLineIndex = GetQuestTagInfo(questID);
			if worldQuestType and tracking[questID] then
				local isInArea, isOnMap, numObjectives = GetTaskInfo(questID)
				for obj = 1, numObjectives do
					local objectiveText, objectiveType, finished = GetQuestObjectiveInfo(questID, obj, false);
					if objectiveText ~= tracking[questID].objectives[obj] and objectiveText ~= tracking[questID].objectivesInit[obj] then
						tracking[questID].objectives[obj] = objectiveText;
						tracking[questID].progressed = true;
					end
				end
				local percent = C_TaskQuest.GetQuestProgressBarInfo(questID);
				if percent and percent ~= tracking[questID].objectives.percent and percent > 0 then
					tracking[questID].objectives.percent = percent;
					tracking[questID].progressed = true;
				end
			end
		end
	end
end

function WorldQuestTips:QUEST_REMOVED(questID)
	if awqwp[questID] then
		for i in pairs( awqwp[questID] ) do
			TomTom:RemoveWaypoint( awqwp[questID][i] )
		end
	end
	if tracking[questID] then
		if tracking[questID].progressed then
			tracking[questID].duration = tracking[questID].duration + ( time() - tracking[questID].start )
			tracking[questID].start = time()
		end
		if debugging then print( "QUEST_REMOVED :"..questID.." - timer should pause at:"..tracking[questID].duration ) end
		tracking[questID].progressed = false
		tracking[questID].active = false
	end
end

function WorldQuestTips:QUEST_ACCEPTED(self)
	addWorldQuest(self)
end

hooksecurefunc ("WorldMap_UpdateQuestBonusObjectives", function ()
	findQuest()
end)

hooksecurefunc ("TaskPOI_OnClick", function (self, button)
	if self.worldQuest and button == "LeftButton" then
		if IsAltKeyDown() and WorldQuestTipsData.global.options.EditOnC then
			WorldQuestTips:loadOptions( self.questID )
		else
			local info = WorldQuestTipsData.global.worldQuests[ self.questID ].coords.default
			local title, factionID, capped = C_TaskQuest.GetQuestInfoByQuestID(self.questID);
			addWayPoints( self.questID, "click", info.m, info.f, info.x, info.y, title )
			--[[
			local info, m = findQuest( self.questID )
			if info then
				local title, factionID, capped = C_TaskQuest.GetQuestInfoByQuestID(self.questID);
				addWayPoints( self.questID, "click", m, info.x, info.y, title )
			end
			--]]
		end
	end
end)

--[[-- Adds tooltip to world quests on map --]]--
hooksecurefunc ("TaskPOI_OnEnter", function (self)
--function TaskPOI_OnEnter(self)
	
	WorldMapTooltip:SetOwner(self, "ANCHOR_RIGHT");

	if ( not HaveQuestData(self.questID) ) then
		WorldMapTooltip:SetText(RETRIEVING_DATA, RED_FONT_COLOR.r, RED_FONT_COLOR.g, RED_FONT_COLOR.b);
		WorldMapTooltip:Show();
		return;
	end
	
	local title, factionID, capped = C_TaskQuest.GetQuestInfoByQuestID(self.questID);
	
	-- Handling other addons changing the PoI frame name willynillily
	if WorldQuestTrackerAddon then
		local mtable = GetMouseFocus()
		local orginalScript = mtable:GetScript("OnClick")
		mtable:SetScript("OnClick", function (self, button)
			if IsAltKeyDown() and WorldQuestTipsData.global.options.EditOnC then
				WorldQuestTips:loadOptions( self.questID )
			else
				local info = WorldQuestTipsData.global.worldQuests[ self.questID ].coords.default
				local title, factionID, capped = C_TaskQuest.GetQuestInfoByQuestID(self.questID);
				addWayPoints( self.questID, "click", info.m, info.f, info.x, info.y, title )
				--[[
				local info, m = findQuest( self.questID )
				if info then
					addWayPoints( self.questID, "click", m, info.x, info.y, title )
				end
				--]]
				orginalScript( self )
			end
		end)
	end
	
	if ( self.worldQuest ) then
		if not dataloaded then getdata() end
		local averageTime
		if WorldQuestTipsData.global.worldQuests[self.questID] and WorldQuestTipsData.global.worldQuests[self.questID].completed > 0 then
			averageTime = math.floor( WorldQuestTipsData.global.worldQuests[self.questID].timespent/WorldQuestTipsData.global.worldQuests[self.questID].completed )
		end
		local tagID, tagName, worldQuestType, rarity, isElite, tradeskillLineIndex = GetQuestTagInfo(self.questID);
		local color = WORLD_QUEST_QUALITY_COLORS[rarity];
		WorldMapTooltip:SetText(title, color.r, color.g, color.b);
		if ( factionID ) then
			--name, description, standingID, barMin, barMax, barValue, atWarWith, canToggleAtWar, isHeader, isCollapsed, hasRep, isWatched, isChild, factionID, hasBonusRepGain, canBeLFGBonus = GetFactionInfoByID(factionID)
			local factionName,_,factionStanding,barMin,barMax,value = GetFactionInfoByID(factionID);
			barMax = (barMax - barMin)/1000;
			local barValue = math.floor( (value - barMin)/100 ) / 10
			local factionStandingtext = GetText("FACTION_STANDING_LABEL"..factionStanding, gender);
			if ( factionName ) then
				if capped then
					if WorldQuestTipsData.global.options.showCurrentRep then
						factionName = factionName.." ("..factionStandingtext..")"
					end
					if WorldQuestTipsData.global.options.showExalted then
						WorldMapTooltip:AddLine(factionName, GRAY_FONT_COLOR:GetRGB());
					end
				else
					if WorldQuestTipsData.global.options.showCurrentRep then
						factionName = factionName.." ("..factionStandingtext.." "..barValue.."k /"..barMax.."k)";
					end
					if factionStanding == 8 and not WorldQuestTipsData.global.options.showExalted then
						factionName = nil;
					end
					WorldMapTooltip:AddLine(factionName);
				end
			end
			
			local fmap
	--		if WorldQuestTipsData.global.worldQuests[self.questID] and WorldQuestTipsData.global.worldQuests[self.questID].coords then
				fmap = WorldQuestTipsData.global.worldQuests[self.questID].coords.default.m
	--		else
	--			_, fmap = findQuest( self.questID )
	--		end
		--	local fmap = WorldQuestTipsData.global.worldQuests[self.questID].coords.default.m
			if zoneFactions[fmap] and zoneFactions[fmap] ~= factionID then
				local factionName2,_,factionStanding2,barMin2,barMax2,value2 = GetFactionInfoByID(zoneFactions[fmap]);
				barMax2 = (barMax2 - barMin2)/1000;
				local barValue2 = math.floor( (value2 - barMin2)/100 ) / 10
				local factionStandingtext2 = GetText("FACTION_STANDING_LABEL"..factionStanding2, gender);
				if ( factionName2 ) then
					if value2 == 42999 then
						if WorldQuestTipsData.global.options.showCurrentRep then
							factionName2 = factionName2.." ("..factionStandingtext2..")"
						end
						if WorldQuestTipsData.global.options.showExalted then
							WorldMapTooltip:AddLine(factionName2, GRAY_FONT_COLOR:GetRGB());
						end
					else
						if WorldQuestTipsData.global.options.showCurrentRep then
							factionName2 = factionName2.." ("..factionStandingtext2.." "..barValue2.."k /"..barMax2.."k)";
						end
						if factionStanding2 == 8 and not WorldQuestTipsData.global.options.showExalted then
							factionName2 = nil;
						end
						WorldMapTooltip:AddLine(factionName2);
					end
				end
			end
		end
		
		local currentTime = 0
		if tracking[self.questID] then
			if tracking[self.questID].active then
				currentTime = tracking[self.questID].duration + ( time() - tracking[self.questID].start )
			else
				currentTime = tracking[self.questID].duration
			end
		end
		if WorldQuestTipsData.global.options.showTimes and ( ( averageTime and averageTime > 0 ) or currentTime > 0 ) then
			if ( averageTime and averageTime > 0 ) and currentTime > 0 then
				WorldMapTooltip:AddDoubleLine( TIME_LABEL.." "..SecondsToTime(currentTime), "("..L.AVERAGE..": "..SecondsToTime(averageTime)..")" )
			elseif ( averageTime and averageTime > 0 ) then
				WorldMapTooltip:AddLine( L.AVERAGE..": "..SecondsToTime(averageTime) )
			else
				WorldMapTooltip:AddLine( TIME_LABEL.." "..SecondsToTime(currentTime) )
			end
		end
			
		WorldMap_AddQuestTimeToTooltip(self.questID);
	else
		WorldMapTooltip:SetText(title);
	end

	if tracking[self.questID] then
		for k,v in pairs(tracking[self.questID].objectives) do
			if k ~= "percent" then
				local color = HIGHLIGHT_FONT_COLOR;
				WorldMapTooltip:AddLine(QUEST_DASH .. v, color.r, color.g, color.b, true);
			end
		end
	else		
		for objectiveIndex = 1, self.numObjectives do
			local objectiveText, objectiveType, finished = GetQuestObjectiveInfo(self.questID, objectiveIndex, false);
			if ( objectiveText and #objectiveText > 0 ) then
				local color = finished and GRAY_FONT_COLOR or HIGHLIGHT_FONT_COLOR;
				WorldMapTooltip:AddLine(QUEST_DASH .. objectiveText, color.r, color.g, color.b, true);
			end
		end
	end
	
	local percent
	if tracking[self.questID] then
		percent = tracking[self.questID].objectives.percent;
	else
		percent = C_TaskQuest.GetQuestProgressBarInfo(self.questID);
	end
	if ( percent ) then
		GameTooltip_InsertFrame(WorldMapTooltip, WorldMapTaskTooltipStatusBar);
		WorldMapTaskTooltipStatusBar.Bar:SetValue(percent);
		WorldMapTaskTooltipStatusBar.Bar.Label:SetFormattedText(PERCENTAGE_STRING, percent);
	end

	if pet_tamers[pet_quests[self.questID]] ~= nil or botbi[self.questID] == false then 
		addpetlines( WorldMapTooltip, pet_quests[self.questID], botbi[self.questID] )
	end
	
	if WorldQuestTipsData.global.worldQuests[self.questID] and WorldQuestTipsData.global.worldQuests[self.questID].note ~= nil then
		WorldMapTooltip:AddLine("|cffffff00"..LABEL_NOTE..": |cffffffff"..WorldQuestTipsData.global.worldQuests[self.questID].note,1,1,1, true)
	end
	
	WorldMap_AddQuestRewardsToTooltip(self.questID);

	if ( self.worldQuest and WorldMapTooltip.AddDebugWorldQuestInfo ) then
		WorldMapTooltip:AddDebugWorldQuestInfo(self.questID);
	end
	WorldMapTooltip:Show();
end)

hooksecurefunc ("WorldMap_AddQuestRewardsToTooltip", function (questID)
--function WorldMap_AddQuestRewardsToTooltip(questID)
	local averageTime
	local averageTimeInMin
	if WorldQuestTipsData.global.worldQuests[questID] and WorldQuestTipsData.global.worldQuests[questID].completed > 0 then
		averageTime = math.floor( WorldQuestTipsData.global.worldQuests[questID].timespent/WorldQuestTipsData.global.worldQuests[questID].completed )
		averageTimeInMin = averageTime/60;
	end
	
	-- money
	local money = GetQuestLogRewardMoney(questID);
	if ( money > 0 ) then
		local moneyString = GetCoinTextureString(money);
		local moneyAverage = ""
		if money > 100000 and WorldQuestTipsData.global.options.showTimes and averageTime and averageTimeInMin > 1 then
			local averageMoney = math.floor( ( (money/10000) / averageTimeInMin ) + 0.5 )
			moneyAverage = "(".. averageMoney.." "..L.PER_MINUTE..")"
			WorldMapTooltipMoneyFrame1SuffixText:SetText(" "..moneyAverage)
			WorldMapTooltipMoneyFrame1SuffixText:SetPoint("LEFT", WorldMapTooltipMoneyFrame1CopperButton, "RIGHT",5, 0);
			WorldMapTooltipMoneyFrame1SuffixText:Show()
		end
		if WorldQuestTipsData.global.options.hideSmallGold and money < WorldQuestTipsData.global.options.hideSmallGoldThreshold*10000 then
			GameTooltip_ClearMoney(WorldMapTooltip)
			if _G["WorldMapTooltipTextLeft"..WorldMapTooltip:NumLines()]:GetText() == " " then _G["WorldMapTooltipTextLeft"..WorldMapTooltip:NumLines()]:SetText() end
			if _G["WorldMapTooltipTextLeft"..WorldMapTooltip:NumLines()-1]:GetText() == " " then _G["WorldMapTooltipTextLeft"..WorldMapTooltip:NumLines()-1]:SetText() end
		end
	end
	
	-- currency
	local numQuestCurrencies = GetNumQuestLogRewardCurrencies(questID);
	if numQuestCurrencies > 0 and averageTime and averageTimeInMin > 1 then
		local name, texture, numItems = GetQuestLogRewardCurrencyInfo(1, questID);
		local averageNumItems = math.floor( numItems / averageTimeInMin )
		local text = _G["WorldMapTooltipTextLeft"..WorldMapTooltip:NumLines()]:GetText()
		if WorldQuestTipsData.global.options.showTimes then text = text .. " (" .. averageNumItems .. " "..L.PER_MINUTE..")" end
		_G["WorldMapTooltipTextLeft"..WorldMapTooltip:NumLines()]:SetText( text )
	end

	-- items
	local numQuestRewards = GetNumQuestLogRewards(questID);
	if numQuestRewards > 0 then
		local artifactPower
		local itemType = WorldMapTooltipTooltipTextLeft2:GetText()
		if (itemType and itemType:match ("|cFFE6CC80")) then -- If itemType is Artifact colour
			local ap = string.match(WorldMapTooltipTooltipTextLeft4:GetText(), '%d+,?%d+,?%d+'):gsub(",","")
			artifactPower = tonumber ( ap )
		end
		if WorldQuestTipsData.global.options.showTimes and artifactPower and averageTime and averageTimeInMin > 1 then
			local averageArtifactPower = math.floor( artifactPower / averageTimeInMin )
		--	WorldMapTooltip.ItemTooltip.Tooltip:AddLine("|cffe6cc80"..averageArtifactPower.. " Artifact Power per minute")
		--	WorldMapTooltip:AddLine("|cffffffff"..averageArtifactPower.." "..itemType.."|cffffffff per min")
			WorldMapTooltipTooltipTextLeft2:SetText( itemType.." ("..averageArtifactPower.." "..L.PER_MINUTE..")" )
		end
		if debugging then WorldMapTooltip.ItemTooltip.Tooltip:AddDoubleLine("QuestID:", questID) end
		WorldMapTooltip.ItemTooltip.Tooltip:Show()
	else
		if debugging then WorldMapTooltip:AddDoubleLine("QuestID:", questID) end
	end
end)

local closedtimer = 0
local refreshing = false
local refreshingblock
local function onUpdate(self,elapsed)
    closedtimer = closedtimer + elapsed
	if closedtimer >= 1 and refreshing then
		BonusObjectiveTracker_ShowRewardsTooltip(refreshingblock);
        closedtimer = 0
    end
end
local f = CreateFrame("frame")
f:SetScript("OnUpdate", onUpdate)

hooksecurefunc ("BonusObjectiveTracker_OnBlockClick", function (self)
	if IsAltKeyDown() and WorldQuestTipsData.global.options.EditOnC then
		WorldQuestTips:loadOptions( self.id )
	end
end)

hooksecurefunc ("BonusObjectiveTracker_OnBlockLeave", function (self)
	refreshing = false
end)

hooksecurefunc ("BonusObjectiveTracker_ShowRewardsTooltip", function (self)
	local tagID, tagName, worldQuestType, rarity, isElite, tradeskillLineIndex = GetQuestTagInfo(self.id);
	if worldQuestType then
		local title, factionID, capped = C_TaskQuest.GetQuestInfoByQuestID(self.id);
		local faction1, faction2 = "", "";
	--	local info, zone = findQuest( self.id )
		if ( factionID ) then
			--name, description, standingID, barMin, barMax, barValue, atWarWith, canToggleAtWar, isHeader, isCollapsed, hasRep, isWatched, isChild, factionID, hasBonusRepGain, canBeLFGBonus = GetFactionInfoByID(factionID)
			local factionName,_,factionStanding,barMin,barMax,value = GetFactionInfoByID(factionID);
			barMax = (barMax - barMin)/1000;
			local barValue = math.floor( (value - barMin)/100 ) / 10
			local factionStandingtext = GetText("FACTION_STANDING_LABEL"..factionStanding, gender);
			if ( factionName ) then
				if (capped) then
					if WorldQuestTipsData.global.options.showExalted then
						if WorldQuestTipsData.global.options.showCurrentRep then
							faction1 = factionName.." ("..factionStandingtext..")"
						else
							faction1 = factionName
						end
					end
				else
					if WorldQuestTipsData.global.options.showCurrentRep then
						faction1 = factionName.." ("..factionStandingtext.." "..barValue.."k /"..barMax.."k)"
					else
						faction1 = factionName
					end
					if factionStanding == 8 and not WorldQuestTipsData.global.options.showExalted then
						faction1 = "";
					end
				end
			end
		--	if WorldQuestTipsData.global.worldQuests[self.id].coords then 
				local zone = WorldQuestTipsData.global.worldQuests[self.id].coords.default.m
		--	end
			if zoneFactions[zone] and zoneFactions[zone] ~= factionID then
				local factionName2,_,factionStanding2,barMin2,barMax2,value2 = GetFactionInfoByID(zoneFactions[zone]);
				barMax2 = (barMax2 - barMin2)/1000;
				local barValue2 = math.floor( (value2 - barMin2)/100 ) / 10
				local factionStandingtext2 = GetText("FACTION_STANDING_LABEL"..factionStanding2, gender);
				if ( factionName2 ) then
					if value2 == 42999 then
						if WorldQuestTipsData.global.options.showExalted then
							if WorldQuestTipsData.global.options.showCurrentRep then
								faction2 = factionName2.." ("..factionStandingtext2..")"
							else
								faction2 = factionName2
							end
						end
					else
						if WorldQuestTipsData.global.options.showCurrentRep then
							faction2 = factionName2.." ("..factionStandingtext2.." "..barValue2.."k /"..barMax2.."k)"
						else
							faction2 = factionName2
						end
						if factionStanding2 == 8 and not WorldQuestTipsData.global.options.showExalted then
							faction2 = "";
						end
					end
					if faction1 ~= "" then faction1 = faction1.."\n" end
				end
			end
		end
		local timeLeftMinutes = C_TaskQuest.GetQuestTimeLeftMinutes(self.id) * 60
		if timeLeftMinutes then
			if faction1 ~= "" or faction2 ~= "" then
				GameTooltipTextLeft2:SetText("|cffffd100"..faction1..faction2.."\n"..BONUS_OBJECTIVE_TIME_LEFT:format(SecondsToTime(timeLeftMinutes)))
			else
				GameTooltipTextLeft2:SetText("|cffffd100"..BONUS_OBJECTIVE_TIME_LEFT:format(SecondsToTime(timeLeftMinutes)).."\n ")
			end
		end
		refreshing = true
		refreshingblock = self
		if not dataloaded then getdata() end
		if pet_tamers[pet_quests[self.id] ] ~= nil or botbi[self.id] == false then
			addpetlines( GameTooltip, pet_quests[self.id], botbi[self.id] )
		end
		
		if WorldQuestTipsData.global.worldQuests[self.id] and WorldQuestTipsData.global.worldQuests[self.id].note ~= nil then
			GameTooltip:AddLine("|cffffff00"..LABEL_NOTE..": |cffffffff"..WorldQuestTipsData.global.worldQuests[self.id].note,1,1,1, true)
		end
		
		local averageTime
		local averageTimeStr = " "
		local currentTimeStr = " "
		if WorldQuestTipsData.global.worldQuests[self.id] and WorldQuestTipsData.global.worldQuests[self.id].completed > 0 then
			averageTime = math.floor( WorldQuestTipsData.global.worldQuests[self.id].timespent/WorldQuestTipsData.global.worldQuests[self.id].completed )
			if averageTime > 0 then averageTimeStr = "("..L.AVERAGE..": "..SecondsToTime(averageTime)..")" end
		end
		if tracking[self.id] then
			local currentTime
			if tracking[self.id].active then
				currentTime = tracking[self.id].duration + ( time() - tracking[self.id].start )
			else
				currentTime = tracking[self.id].duration
			end
			if currentTime > 0 then currentTimeStr = TIME_LABEL.." "..SecondsToTime(currentTime) end
		end
		if WorldQuestTipsData.global.options.showTimes and (averageTime or tracking[self.id]) then GameTooltip:AddDoubleLine( currentTimeStr, averageTimeStr ) end
		
		GameTooltip:Show()
	end
end)

-- This snipet is thanks to Vildiesel - EU Well of Eternity "Precise World Quest Timer"
hooksecurefunc("WorldMap_AddQuestTimeToTooltip", function(questID)
	local timeLeftMinutes = C_TaskQuest.GetQuestTimeLeftMinutes(questID) * 60
	if timeLeftMinutes then
		_G["WorldMapTooltipTextLeft"..WorldMapTooltip:NumLines()]:SetText(BONUS_OBJECTIVE_TIME_LEFT:format(SecondsToTime(timeLeftMinutes)).."\n")
	end
end)

--[[ Adds tooltip to NPCs --]]
GameTooltip:HookScript("OnTooltipSetUnit", function(self)
	if not dataloaded then getdata() end
	if C_PetBattles.IsInBattle() then return end
	local unit = select(2, self:GetUnit())
	if unit then
		local name = UnitName(unit) or ""
		if pet_tamers[name] ~= nil then
			local questID
			for k, v in pairs(pet_quests) do
				if v == name then questID = k end
			end
			addpetlines( GameTooltip, name, botbi[questID] )
			GameTooltip:Show()
		end
	end
end)

WorldMapFrame:HookScript("OnShow", function(self)
	if wqto then
		wqto:SetParent("WorldMapFrame")
		wqto:SetFrameLevel(999)
	end
end)

WorldMapFrame:HookScript("OnHide", function(self)
	if wqto then
		wqto:SetParent("UIParent")
	end
end)

--[[
local function getQuestInfo( questID )
	local tagID, tagName, worldQuestType, rarity, isElite, tradeskillLineIndex = GetQuestTagInfo(questID);
	local title, factionID, capped = C_TaskQuest.GetQuestInfoByQuestID(questID);
	return title
end
-]]

local currentQuestEdit

local function fillQuestInfo( questID )
	if questID ~= nil then
		currentQuestEdit = questID
	else
		currentQuestEdit = wqto.q.qid:GetNumber()
	end
	local title = C_TaskQuest.GetQuestInfoByQuestID( currentQuestEdit )
	if title then
		wqto.q.qlink.name:SetText( "[ "..title.." ]" )
	end
	if WorldQuestTipsData.global.worldQuests[currentQuestEdit] ~= nil then
		if WorldQuestTipsData.global.worldQuests[currentQuestEdit].note then
			wqto.q.qnote:SetText( WorldQuestTipsData.global.worldQuests[currentQuestEdit].note )
		else
			wqto.q.qnote:SetText( "" )
			WorldQuestTipsData.global.worldQuests[currentQuestEdit].note = nil
		end
		if wqto.q.qid:GetNumber() ~= currentQuestEdit then wqto.q.qid:SetNumber( currentQuestEdit ) end
		wqto.q.qnote:Enable()
		wqto.q.qnote:SetTextColor( 1,1,1 )
		wqto.q.qwowhead:SetText( wowhead .. currentQuestEdit )
		wqto.q.qtc:Enable()
		wqto.q.qtc:SetTextColor( 1,1,1 )
		wqto.q.qtc:SetText( WorldQuestTipsData.global.worldQuests[currentQuestEdit].completed )
		wqto.q.qtt:Enable()
		wqto.q.qtt:SetTextColor( 1,1,1 )
		wqto.q.qtt:SetText( WorldQuestTipsData.global.worldQuests[currentQuestEdit].timespent )
		local averageTime = math.floor( WorldQuestTipsData.global.worldQuests[currentQuestEdit].timespent/WorldQuestTipsData.global.worldQuests[currentQuestEdit].completed )
		if WorldQuestTipsData.global.worldQuests[currentQuestEdit].completed > 0 then
			wqto.q.qave:SetText( L.AVERAGE..": "..SecondsToTime(averageTime) )
		else
			wqto.q.qave:SetText( "" )
		end
	else
		if currentQuestEdit == 0 then wqto.q.qlink.name:SetText( " " )
		else wqto.q.qlink.name:SetText( "Data not found for ".. L.OPTIONS_Q_ID ..": "..currentQuestEdit ) end
		currentQuestEdit = nil
		wqto.q.qnote:SetText( L.OPTIONS_Q_NOTE_TIP .. "..." )
		wqto.q.qnote:SetTextColor( GRAY_FONT_COLOR:GetRGB() )
		wqto.q.qnote:Disable()
		wqto.q.qtc:SetText( "" )
		wqto.q.qtc:Disable()
		wqto.q.qtt:SetText( "" )
		wqto.q.qtt:Disable()
		wqto.q.qwowhead:SetText( "" )
		wqto.q.qave:SetText( "" )
	end
	if botbi[currentQuestEdit] then wqto.q.qxufu:Show(); wqto.q.qxufu:SetText("www.wow-petguide.com/index.php?m=LegionWQ") else wqto.q.qxufu:Hide() end
end

function WorldQuestTips:loadOptions( questID )
	
	if not dataloaded then getdata() end
	
	local tablist = { g = GENERAL, o = TOOLTIP_BATTLE_PET, q = QUESTS_LABEL }
	if wqto == nil then
		local initParent = UIParent
		if WorldMapFrame:IsShown() then initParent = WorldMapFrame end
		
		wqto = CreateFrame("FRAME", nil, initParent)
		wqto:SetWidth(410)
		wqto:SetHeight(440)
		wqto:SetPoint("CENTER", UIParent, "CENTER")
		wqto:SetBackdrop({
			bgFile = "Interface/DialogFrame/UI-DialogBox-Background",
			edgeFile = "Interface/DialogFrame/UI-DialogBox-Border",
			tile = true, tileSize = 32, edgeSize = 32,
			insets = { left = 11, right = 12, top = 12, bottom = 11 }
		})
		wqto:SetFrameLevel(999)
		  
		wqto.tabs = CreateFrame("FRAME", nil, wqto)
		wqto.tabs:SetWidth(200)
		wqto.tabs:SetHeight(440)
		wqto.tabs:SetPoint("RIGHT", wqto, "LEFT", 16, 0)
		wqto.tabs:SetBackdrop({
			bgFile = "Interface/DialogFrame/UI-DialogBox-Background",
			edgeFile = "Interface/DialogFrame/UI-DialogBox-Border",
			tile = true, tileSize = 32, edgeSize = 32,
			insets = { left = 11, right = 12, top = 12, bottom = 11 }
		  })
		wqto.tabs.footer = wqto.tabs:CreateFontString(nil, wqto.tabs, "GameFontWhite" )
		wqto.tabs.footer:SetText("v" .. format("%.2f",version) .. versionSuffix );
		wqto.tabs.footer:SetPoint("BOTTOM", 0, 20 )
		  
		wqto.header = CreateFrame("FRAME", nil, wqto)
		wqto.header:SetWidth(384)
		wqto.header:SetHeight(64)
		wqto.header:SetBackdrop({ bgFile = "Interface/DialogFrame/UI-DialogBox-Header" })
		wqto.header:SetPoint("TOP", wqto, "TOP", 0, 12)
		wqto.header.text = wqto.header:CreateFontString(nil, wqto.header, "GameFontNormal" )
		wqto.header.text:SetText( L.TITLE )
		wqto.header.text:SetPoint("TOP", 0, -14)
		
		wqto.dragRegion = wqto:CreateTitleRegion()
		wqto:EnableMouse(true)
		wqto.dragRegion:SetSize(384, 64)
		wqto.dragRegion:SetPoint("TOPLEFT", wqto.header )
		
		local tabbtnoffset = -32;
		local function makeTabBtns( x, v )
			wqto.tabBtno = CreateFrame("BUTTON", nil, wqto.tabs, "UIPanelButtonTemplate")
			wqto.tabBtno:SetWidth(150)
			wqto.tabBtno:SetHeight(24)
			wqto.tabBtno:SetText( v )
			wqto.tabBtno:SetPoint("TOP", wqto.tabs, 0, tabbtnoffset )
			wqto.tabBtno:SetScript("OnClick", function() for z in pairs(tablist) do wqto[z]:Hide() end wqto[x]:Show() end)
			wqto.tabBtno:SetAlpha(1)
			wqto.tabBtno:Show()
		end
		for x, v in pairs(tablist) do
			makeTabBtns( x, v )
			tabbtnoffset = tabbtnoffset - 32
		end
		
		local g = CreateFrame("FRAME", nil, wqto)
		g:SetWidth(410)
		g:SetHeight(440)
		g:SetPoint("CENTER", wqto, "CENTER")
		g.subtitle_tomtom = g:CreateFontString(nil, g, "GameFontNormal" )
		g.subtitle_tomtom:SetText("TomTom support:");
		g.subtitle_tomtom:SetPoint("TOPLEFT", 20, -60 )
		
		g.option_TomTomMP = CreateFrame("CheckButton", nil, g, "UICheckButtonTemplate");
		g.option_TomTomMP:SetPoint("TOPLEFT", g.subtitle_tomtom, "BOTTOMLEFT", 10, -5);
		g.option_TomTomMP.text:SetText("Add way point on World Map quest Left Click");
		g.option_TomTomMP.text:SetFontObject("GameFontNormal")
		g.option_TomTomMP:SetScript("OnEnter", function(self) GameTooltip:SetOwner(self, "ANCHOR_RIGHT",0,-32);  GameTooltip:SetText("Adds a useful waypoint if there's data for it\ne.g. \"Cave entrance to WANTED:x\"\n\nAdds a waypoint to Blizzards PoI if there's no data"); GameTooltip:Show() end)
		g.option_TomTomMP:SetScript("OnLeave", function(self) GameTooltip:Hide() end)
		if WorldQuestTipsData.global.options.TomTomMP then g.option_TomTomMP:SetChecked(true) end
		g.option_TomTomMP:SetScript("OnClick", function() if g.option_TomTomMP:GetChecked() then WorldQuestTipsData.global.options.TomTomMP = true; else WorldQuestTipsData.global.options.TomTomMP = false end end);
		
		g.option_TomTomAQ = CreateFrame("CheckButton", nil, g, "UICheckButtonTemplate");
		g.option_TomTomAQ:SetPoint("TOPLEFT", g.subtitle_tomtom, "BOTTOMLEFT", 10, -30);
		g.option_TomTomAQ.text:SetText("Add way point on World Quest auto accept");
		g.option_TomTomAQ.text:SetFontObject("GameFontNormal")
		g.option_TomTomAQ:SetScript("OnEnter", function(self) GameTooltip:SetOwner(self, "ANCHOR_RIGHT",0,-32);  GameTooltip:SetText("Adds a useful waypoint if there's data for it\ne.g. \"Cave entrance to WANTED:x\""); GameTooltip:Show() end)
		g.option_TomTomAQ:SetScript("OnLeave", function(self) GameTooltip:Hide() end)
		if WorldQuestTipsData.global.options.TomTomAQ then g.option_TomTomAQ:SetChecked(true) end
		g.option_TomTomAQ:SetScript("OnClick", function() if g.option_TomTomAQ:GetChecked() then WorldQuestTipsData.global.options.TomTomAQ = true; else WorldQuestTipsData.global.options.TomTomAQ = false end end);
		
		g.option_TomTomLR = CreateFrame("CheckButton", nil, g, "UICheckButtonTemplate");
		g.option_TomTomLR:SetPoint("TOPLEFT", g.subtitle_tomtom, "BOTTOMLEFT", 10, -55);
		g.option_TomTomLR.text:SetText("Add way points for Ley Races");
		g.option_TomTomLR.text:SetFontObject("GameFontNormal")
	--	g.option_TomTomLR:SetScript("OnEnter", function(self) GameTooltip:SetOwner(self, "ANCHOR_RIGHT",0,-32);  GameTooltip:SetText("Adds waypoints for"); GameTooltip:Show() end)
	--	g.option_TomTomLR:SetScript("OnLeave", function(self) GameTooltip:Hide() end)
		if WorldQuestTipsData.global.options.TomTomLR then g.option_TomTomLR:SetChecked(true) end
		g.option_TomTomLR:SetScript("OnClick", function() if g.option_TomTomLR:GetChecked() then WorldQuestTipsData.global.options.TomTomLR = true; else WorldQuestTipsData.global.options.TomTomLR = false end end);
		
		g.subtitle_EditQ = g:CreateFontString(nil, g, "GameFontNormal" )
		g.subtitle_EditQ:SetText( L.OPTIONS_Q_INFO ..":" );
		g.subtitle_EditQ:SetPoint("TOPLEFT", g, 20, -165 )
		
		g.option_EditOnC = CreateFrame("CheckButton", nil, g, "UICheckButtonTemplate");
		g.option_EditOnC:SetPoint("TOPLEFT", g.subtitle_EditQ, "BOTTOMLEFT", 10, -5);
		g.option_EditOnC.text:SetText( L.OPTIONS_G_OPEN_INFO );
		g.option_EditOnC.text:SetFontObject("GameFontNormal")
		--g.option_EditOnC:SetScript("OnEnter", function(self) GameTooltip:SetOwner(self, "ANCHOR_RIGHT",0,-32);  GameTooltip:SetText("You can alt click on the Wolrd Quest on the world map\nor on the World Quest in the objective tracker"); GameTooltip:Show() end)
		--g.option_EditOnC:SetScript("OnLeave", function(self) GameTooltip:Hide() end)
		if WorldQuestTipsData.global.options.EditOnC then g.option_EditOnC:SetChecked(true) end
		g.option_EditOnC:SetScript("OnClick", function() if g.option_EditOnC:GetChecked() then WorldQuestTipsData.global.options.EditOnC = true; else WorldQuestTipsData.global.options.EditOnC = false end end);
		
		g.subtitle_ShowT = g:CreateFontString(nil, g, "GameFontNormal" )
		g.subtitle_ShowT:SetText( QUEST_TIMERS .. ":");
		g.subtitle_ShowT:SetPoint("TOPLEFT", g, 20, -220 )
		
		g.option_ShowT = CreateFrame("CheckButton", nil, g, "UICheckButtonTemplate");
		g.option_ShowT:SetPoint("TOPLEFT", g.subtitle_ShowT, "BOTTOMLEFT", 10, -5);
		g.option_ShowT.text:SetText( L.OPTIONS_G_TIMES );
		g.option_ShowT.text:SetFontObject("GameFontNormal")
		--g.option_ShowT:SetScript("OnEnter", function(self) GameTooltip:SetOwner(self, "ANCHOR_RIGHT",0,-32);  GameTooltip:SetText("Disable if you're not interested in seeing\ntimes in the tooltips or at quest completion"); GameTooltip:Show() end)
		--g.option_ShowT:SetScript("OnLeave", function(self) GameTooltip:Hide() end)
		if WorldQuestTipsData.global.options.showTimes then g.option_ShowT:SetChecked(true) end
		g.option_ShowT:SetScript("OnClick", function() if g.option_ShowT:GetChecked() then WorldQuestTipsData.global.options.showTimes = true; else WorldQuestTipsData.global.options.showTimes = false end end);
		
		g.subtitle_Rep = g:CreateFontString(nil, g, "GameFontNormal" )
		g.subtitle_Rep:SetText( REPUTATION .. ":");
		g.subtitle_Rep:SetPoint("TOPLEFT", g, 20, -275 )
		
		g.option_CurRep = CreateFrame("CheckButton", nil, g, "UICheckButtonTemplate");
		g.option_CurRep:SetPoint("TOPLEFT", g.subtitle_Rep, "BOTTOMLEFT", 10, -5);
		g.option_CurRep.text:SetText( L.OPTIONS_G_REP_CUR );
		g.option_CurRep.text:SetFontObject("GameFontNormal")
		--g.option_CurRep:SetScript("OnEnter", function(self) GameTooltip:SetOwner(self, "ANCHOR_RIGHT",0,-32);  GameTooltip:SetText("Show your current standing with the relevant faction\nin tooltips, in the format \"Standing (#k / #k)\""); GameTooltip:Show() end)
		--g.option_CurRep:SetScript("OnLeave", function(self) GameTooltip:Hide() end)
		if WorldQuestTipsData.global.options.showCurrentRep then g.option_CurRep:SetChecked(true) end
		g.option_CurRep:SetScript("OnClick", function() if g.option_CurRep:GetChecked() then WorldQuestTipsData.global.options.showCurrentRep = true; else WorldQuestTipsData.global.options.showCurrentRep = false end end);
		
		g.option_ShowEx = CreateFrame("CheckButton", nil, g, "UICheckButtonTemplate");
		g.option_ShowEx:SetPoint("TOPLEFT", g.subtitle_Rep, "BOTTOMLEFT", 10, -30);
		g.option_ShowEx.text:SetText( L.OPTIONS_G_REP_EX );
		g.option_ShowEx.text:SetFontObject("GameFontNormal")
		--g.option_ShowEx:SetScript("OnEnter", function(self) GameTooltip:SetOwner(self, "ANCHOR_RIGHT",0,-32);  GameTooltip:SetText("Disable to stop showing faction names in\ntooltips once you've reached exalted"); GameTooltip:Show() end)
		--g.option_ShowEx:SetScript("OnLeave", function(self) GameTooltip:Hide() end)
		if WorldQuestTipsData.global.options.showExalted then g.option_ShowEx:SetChecked(true) end
		g.option_ShowEx:SetScript("OnClick", function() if g.option_ShowEx:GetChecked() then WorldQuestTipsData.global.options.showExalted = true; else WorldQuestTipsData.global.options.showExalted = false end end);
		
		g.subtitle_Other = g:CreateFontString(nil, g, "GameFontNormal" )
		g.subtitle_Other:SetText( OTHER .. ":"); --BONUS_ROLL_REWARD_MONEY ="Gold"
		g.subtitle_Other:SetPoint("TOPLEFT", g, 20, -355 )
		
		g.option_HideSG = CreateFrame("CheckButton", nil, g, "UICheckButtonTemplate");
		g.option_HideSG:SetPoint("TOPLEFT", g.subtitle_Other, "BOTTOMLEFT", 10, -5);
		g.option_HideSG.text:SetText( "Hide small gold rewards from tooltip" );
		g.option_HideSG.text:SetFontObject("GameFontNormal")
		--g.option_HideSG:SetScript("OnEnter", function(self) GameTooltip:SetOwner(self, "ANCHOR_RIGHT",0,-32);  GameTooltip:SetText("Disable if you're not interested in seeing\ntimes in the tooltips or at quest completion"); GameTooltip:Show() end)
		--g.option_HideSG:SetScript("OnLeave", function(self) GameTooltip:Hide() end)
		if WorldQuestTipsData.global.options.hideSmallGold then g.option_HideSG:SetChecked(true) end
		g.option_HideSG:SetScript("OnClick", function() if g.option_HideSG:GetChecked() then WorldQuestTipsData.global.options.hideSmallGold = true; else WorldQuestTipsData.global.options.hideSmallGold = false end end);
		
		wqto.g = g;
		
		
		local q = CreateFrame("FRAME", nil, wqto)
		q:SetWidth(410)
		q:SetHeight(440)
		q:SetPoint("CENTER", wqto, "CENTER")
		q.subtitle_qi = q:CreateFontString(nil, q, "GameFontNormal" )
		q.subtitle_qi:SetText( L.OPTIONS_Q_INFO .. ":" );
		q.subtitle_qi:SetPoint("TOPLEFT", 20, -60 )
		
		q.qid = CreateFrame("EditBox", nil, q, "InputBoxTemplate");
		q.qid:SetPoint("TOPRIGHT", -20, -54);
		q.qid:SetFontObject("GameFontWhite")
		q.qid:SetMaxLetters(6)
		q.qid:SetNumeric(true)
		q.qid:SetAutoFocus(false)
		q.qid:SetWidth(64)
		q.qid:SetHeight(24)
		q.qid:SetCursorPosition(0)
		q.qid:SetJustifyH("CENTER")
		q.qidt = q:CreateFontString();
		q.qidt:SetPoint("RIGHT", q.qid, "LEFT", -10, 0);
		q.qidt:SetFontObject("GameFontNormal");
		q.qidt:SetText( L.OPTIONS_Q_ID .. ":" )
		q.qid:SetScript("OnEnterPressed", function(self)
			self:ClearFocus();
			currentQuestEdit = self:GetNumber()
			fillQuestInfo( currentQuestEdit )
		end);
	
		q.qlink = CreateFrame("FRAME", nil, q)
		q.qlink:SetWidth(410)
		q.qlink:SetHeight(24)
		q.qlink:SetPoint("TOP", q, 0, -100 )
		q.qlink.name = q.qlink:CreateFontString(nil, q, "GameFontNormalLarge" )
		q.qlink.name:SetPoint("CENTER", q.qlink)
		
		q.qnotet = q.qlink:CreateFontString(nil, q, "GameFontNormal" )
		q.qnotet:SetText( L.OPTIONS_Q_NOTE .. ":");
		q.qnotet:SetPoint("TOP", q.qlink, "BOTTOM", 0, -10)
		
		q.qnote = CreateFrame("EditBox", nil, q, "InputBoxTemplate");
		q.qnote:SetPoint("TOP", q.qnotet, "BOTTOM");
		q.qnote:SetMaxLetters(256)
		q.qnote:SetAutoFocus(false)
		q.qnote:SetWidth(360)
		q.qnote:SetHeight(24)
		q.qnote:SetCursorPosition(0)
		q.qnote:SetJustifyH("LEFT")
		q.qnote:SetText( L.OPTIONS_Q_NOTE_TIP .. "..." )
		q.qnote:SetTextColor( GRAY_FONT_COLOR:GetRGB() )
	--	q.qnote:SetScript("OnEnter", function(self) GameTooltip:SetOwner(self, "ANCHOR_RIGHT",0,-32);  GameTooltip:SetText(""); GameTooltip:Show() end)
	--	q.qnote:SetScript("OnLeave", function(self) GameTooltip:Hide() end)
		
		q.qnote:SetScript("OnKeyDown", function(self, key)
			local oldNote = WorldQuestTipsData.global.worldQuests[currentQuestEdit].note or ""
			q.qnote:SetTextColor( 1,1,1 )
			if key == "ESCAPE" then q.qnote:SetText( oldNote )
			elseif key == "ENTER" then 
				q.qnote:ClearFocus()
				local newNote = q.qnote:GetText()
				if newNote == nil or newNote == "" then
					WorldQuestTipsData.global.worldQuests[currentQuestEdit].note = nil
				else WorldQuestTipsData.global.worldQuests[currentQuestEdit].note = newNote end
			else
			q.qnote:SetTextColor( GREEN_FONT_COLOR:GetRGB() )
			end
		end)
		
		q.qnote:Disable()
		
	--	g.option_TomTomMP:SetScript("OnEnter", function(self) GameTooltip:SetOwner(self, "ANCHOR_RIGHT",0,-32);  GameTooltip:SetText("Adds a useful waypoint if there's data for it\ne.g. \"Cave entrance to WANTED:x\"\n\nAdds a waypoint to Blizzards PoI if there's no data"); GameTooltip:Show() end)
	--	g.option_TomTomMP:SetScript("OnLeave", function(self) GameTooltip:Hide() end)
		
		q.qwowhead = CreateFrame("EditBox", nil, q, "InputBoxTemplate");
		q.qwowhead:SetPoint("BOTTOM", q, "BOTTOM", 0, 60);
		q.qwowhead:SetMaxLetters(256)
		q.qwowhead:SetAutoFocus(false)
		q.qwowhead:SetWidth(360)
		q.qwowhead:SetHeight(24)
		q.qwowhead:SetCursorPosition(0)
		q.qwowhead:SetJustifyH("CENTER")
		q.qwowhead:SetTextColor( 1,1,1 )
		
		q.qxufu = CreateFrame("EditBox", nil, q, "InputBoxTemplate");
		q.qxufu:SetPoint("BOTTOM", q.qwowhead, "TOP");
		q.qxufu:SetMaxLetters(256)
		q.qxufu:SetAutoFocus(false)
		q.qxufu:SetWidth(360)
		q.qxufu:SetHeight(24)
		q.qxufu:SetCursorPosition(0)
		q.qxufu:SetJustifyH("CENTER")
		q.qxufu:SetTextColor( 1,1,1 )
		q.qxufu:Hide()
		
		q.qave = q:CreateFontString(nil, q, "GameFontNormal" )
		q.qave:SetPoint("BOTTOMLEFT", q.qxufu, "TOPLEFT", 90, 20)
		
		q.qtc = CreateFrame("EditBox", nil, q, "InputBoxTemplate");
		q.qtc:SetPoint("BOTTOMLEFT", q.qave, "TOPLEFT");
		q.qtc:SetMaxLetters(6)
		q.qtc:SetAutoFocus(false)
		q.qtc:SetNumeric(true)
		q.qtc:SetWidth(36)
		q.qtc:SetHeight(24)
		q.qtc:SetCursorPosition(0)
		q.qtc:SetJustifyH("CENTER")
		q.qtc:SetScript("OnKeyDown", function(self, key)
			local oldVal = WorldQuestTipsData.global.worldQuests[currentQuestEdit].completed or 0
			self:SetTextColor( 1,1,1 )
			if key == "ESCAPE" then self:SetNumber( oldVal )
			elseif key == "ENTER" then 
				self:ClearFocus()
				local newVal = math.floor(math.abs(self:GetNumber()))
				if newVal == nil or newVal == "" then
					WorldQuestTipsData.global.worldQuests[currentQuestEdit].completed = 0
				else WorldQuestTipsData.global.worldQuests[currentQuestEdit].completed = newVal end
				fillQuestInfo( currentQuestEdit )
			else
			self:SetTextColor( GREEN_FONT_COLOR:GetRGB() )
			end
		end)
		q.qtc:Disable()
		
		q.qtc.text = q.qtc:CreateFontString(nil, q, "GameFontNormal" )
		q.qtc.text:SetText( L.OPTIONS_Q_TC );
		q.qtc.text:SetPoint("LEFT", q.qtc, "RIGHT", 5, 0)
		
		q.qtt = CreateFrame("EditBox", nil, q, "InputBoxTemplate");
		q.qtt:SetPoint("BOTTOMLEFT", q.qtc, "TOPLEFT");
		q.qtt:SetMaxLetters(6)
		q.qtt:SetAutoFocus(false)
		q.qtt:SetNumeric(true)
		q.qtt:SetWidth(36)
		q.qtt:SetHeight(24)
		q.qtt:SetCursorPosition(0)
		q.qtt:SetJustifyH("CENTER")
		q.qtt:SetScript("OnKeyDown", function(self, key)
			local oldVal = WorldQuestTipsData.global.worldQuests[currentQuestEdit].timespent or 0
			self:SetTextColor( 1,1,1 )
			if key == "ESCAPE" then self:SetNumber( oldVal )
			elseif key == "ENTER" then 
				self:ClearFocus()
				local newVal = math.floor(math.abs(self:GetNumber()))
				if newVal == nil or newVal == "" then
					WorldQuestTipsData.global.worldQuests[currentQuestEdit].timespent = 0
				else WorldQuestTipsData.global.worldQuests[currentQuestEdit].timespent = newVal end
				fillQuestInfo( currentQuestEdit )
			else
			self:SetTextColor( GREEN_FONT_COLOR:GetRGB() )
			end
		end)
		q.qtt:Disable()
		
		q.qtt.text = q.qtt:CreateFontString(nil, q, "GameFontNormal" )
		q.qtt.text:SetText( L.OPTIONS_Q_TT );
		q.qtt.text:SetPoint("LEFT", q.qtt, "RIGHT", 5, 0)
		
		q:Hide()
		wqto.q = q;
		
		
		local o = CreateFrame("FRAME", nil, wqto)
		o:SetWidth(410)
		o:SetHeight(440)
		o:SetPoint("CENTER", wqto, "CENTER")
			
		o.option_PetFF = CreateFrame("CheckButton", nil, o, "UICheckButtonTemplate");
		o.option_PetFF:SetPoint("TOPLEFT", o, "TOPLEFT", 25, -25);
		o.option_PetFF.text:SetText( BATTLE_PETS_ACHIEVEMENT .. " " .. TRACKING );
		o.option_PetFF.text:SetFontObject("GameFontNormal")
		if WorldQuestTipsData.global.options.PetFF then o.option_PetFF:SetChecked(true) end
		o.option_PetFF:SetScript("OnClick", function() if o.option_PetFF:GetChecked() then WorldQuestTipsData.global.options.PetFF = true; else WorldQuestTipsData.global.options.PetFF = false end end);
		
		local y = 80
		local x = 0
		for k, tamer in pairs(pet_tamers) do
		for f, complete in pairs(tamer) do
			o[k] = o:CreateFontString(nil, o, "GameFontNormal" )
			o[k]:SetText(k);
			o[k]:SetPoint("TOPLEFT", 20, -y )
			o[k..f] = CreateFrame("CheckButton", nil, o, "UICheckButtonTemplate");
			o[k..f]:SetPoint("LEFT", o[k], "LEFT", 200+x, 0);
			o[k..f]:SetScale(0.75);
			if WorldQuestTipsData.global.pets.ff[k][f] ~= false or complete then o[k..f]:SetChecked(true) else pets[f].ignored = pets[f].ignored + 1 end
			
			if o[f] == nil then
				o[f] = CreateFrame("FRAME", nil, o)
				o[f]:SetWidth(16)
				o[f]:SetHeight(16)
				o[f]:SetPoint("TOP", o[k..f], 0, 15);
				o[f].icon = o[f]:CreateFontString(nil, o, "GameFontNormal" )
				o[f].icon:SetText(pets[f].icon);
				o[f].icon:SetPoint("CENTER");
				o[f]:SetScript("OnEnter", function(self) GameTooltip:SetOwner(self, "ANCHOR_TOPRIGHT",0,0);  GameTooltip:SetAchievementByID(pets[f].achID); GameTooltip:AddLine(ACHIEVEMENT_PROGRESSED .. ": "..pets[f].count.." / "..( 15 - pets[f].ignored )); GameTooltip:Show() end)
				o[f]:SetScript("OnLeave", function(self) GameTooltip:Hide() end)
			end
	
	--		o[k..f]:SetScript("OnEnter", function(self) GameTooltip:SetOwner(self, "ANCHOR_RIGHT",0,-32);  GameTooltip:SetToyByItemID(k); GameTooltip:AddLine(c, 1, 0, 0); GameTooltip:Show() end)
	--		o[k..f]:SetScript("OnLeave", function(self) GameTooltip:Hide() end)
			o[k..f]:SetScript("OnClick", function()
											o.footer:SetTextColor(1,1,1);
											if o[k..f]:GetChecked() then
												WorldQuestTipsData.global.pets.ff[k][f] = true
												pets[f].ignored = pets[f].ignored - 1
											else
												if pets[f].ignored == 3 then
													o.footer:SetTextColor(1,0,0);
													o[k..f]:SetChecked(true)
												else
													WorldQuestTipsData.global.pets.ff[k][f] = false
													pets[f].ignored = pets[f].ignored + 1
												end
											end
										end);
			if complete then
				o[k..f]:Disable();
			end
			x = x + 30
		end
			x = 0
			y = y + 20
		end
		
		o.footer = o:CreateFontString(nil, o, "GameFontWhite" )
		o.footer:SetText( L.OPTIONS_P_FOOTER );
		o.footer:SetPoint("BOTTOM", 0, 50 )
		o:Hide()
		wqto.o = o;
		
		wqto.doneBtn = CreateFrame("BUTTON", nil, wqto, "UIPanelButtonTemplate")
		wqto.doneBtn:SetWidth(64)
		wqto.doneBtn:SetHeight(24)
		wqto.doneBtn:SetText( DONE )
		wqto.doneBtn:SetPoint("BOTTOM", wqto, 0, 12)
		wqto.doneBtn:SetScript("OnClick", function() wqto:Hide(); currentQuestEdit = 0 end)
		
	--	tinsert(UISpecialFrames, "wqto") 
	end
	
	wqto:Show()
		
	if questID then
		if questID == currentQuestEdit then
			wqto:Hide()
			currentQuestEdit = 0
		else 
			fillQuestInfo( questID )
			for z in pairs(tablist) do wqto[z]:Hide() end wqto.q:Show()
		end
	else
		fillQuestInfo()
	end
end

SLASH_WorldQuestTips1= "/wqt";
function SlashCmdList.WorldQuestTips(msg)
	if msg == "" then
		WorldQuestTips:loadOptions()
	else
		if msg == 'debug true' then debugging = true; print('WorldQuestTips: Debugging messages on')
		elseif msg == 'debug false' then debugging = false; print('WorldQuestTips: Debugging messages off') end
		--[[
		if msg == 'test' then 
			print("test fired")
			for i = 1, GetAchievementNumCriteria(9692) do
				local description, type, completed, quantity, requiredQuantity, characterName, flags, assetID, quantityString, criteriaID = GetAchievementCriteriaInfo(9692, i)
				print(description)
			end
		end
		--]]
		WorldQuestTipsData.global.options.debugging = debugging;
	end
end


 ----------------------------------------------
--[[-- Register events and call functions --]]--
 ----------------------------------------------
WorldQuestTips:SetScript("OnEvent", function(self, event, ...)
 WorldQuestTips[event](self, ...);
end);
for k, v in pairs(WorldQuestTips) do
 WorldQuestTips:RegisterEvent(k); -- Registers all events for which handlers have been defined
end