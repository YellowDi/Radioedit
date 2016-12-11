if IsAddOnLoaded('FollowerAssign') then return; end
--本地化 eui.cc 转载需保留
local L = {}
if GetLocale() == 'zhCN' then 
	L['=== Starting to Assign Followers === '] = '=== 开始分配追随者 === ';
	L['=== All done! === '] = '=== 全部完成! === ';
	L[' removed from  '] = ' 已移除从  ';
	L[' added to '] = ' 添加到 ';
	L["Followers assigned to buildings ("] = "追随者分配到建筑物 (";
elseif GetLocale() == 'zhTW' then
	L['=== Starting to Assign Followers === '] = '=== 开始分配追随者 === ';
	L['=== All done! === '] = '=== 全部完成! === ';
	L[' removed from  '] = ' 已移除从  ';
	L[' added to '] = ' 添加到 ';
	L["Followers assigned to buildings ("] = "追随者分配到建筑物 (";
else
	L['=== Starting to Assign Followers === '] = '=== Starting to Assign Followers === ';
	L['=== All done! === '] = '=== All done! === ';
	L[' removed from  '] = ' removed from  ';
	L[' added to '] = ' added to ';
	L["Followers assigned to buildings ("] = "Followers assigned to buildings (";
end

-- Helper Functions --
local function buildingsWithFollowerSlot()
	local buildings = C_Garrison.GetBuildings()
	local buildingsWithSlot = {}

	for i, building in ipairs(buildings) do
		local hasFollowerSlot = select(17, C_Garrison.GetBuildingInfo(building.buildingID))
		local notBarracks = (building.buildingID ~= 27) and (building.buildingID ~= 28)
		if hasFollowerSlot and notBarracks then
			table.insert(buildingsWithSlot, building)
		end
	end

	return buildingsWithSlot
end

local function getAvailableFollowers(tbl)
	local availableFollowers = {}
	for i,follower in ipairs(tbl) do
		if follower.status == nil then
			table.insert(availableFollowers, follower)
		end
	end

	return availableFollowers
end

local function levelSort(a, b)
	return a.level > b.level
end

local function highestLevelFollower(tbl)
	table.sort(tbl, levelSort)
	return tbl[1]
end

local function getBestFollower(followers)
	if #followers >= 1 then
		local availableFollowers = getAvailableFollowers(followers)
		if #availableFollowers == 1 then
			return availableFollowers[1]
		elseif #availableFollowers > 1 then
			return highestLevelFollower(availableFollowers)
		else
			return nil
		end
	end
end

local function getBuildingName(longName)
	local shortName = string.match(longName, "_%a+_")
	shortName = string.gsub(shortName, '_', '')
	return shortName
end

local function getFollowerInBuilding(building)
	return select(5, C_Garrison.GetFollowerInfoForBuilding(building.plotID))
end

local function FollowersInBuildingsMessage()
	local buildingsWithSlot = buildingsWithFollowerSlot()
	local numbFollowers = 0
	for i,building in ipairs(buildingsWithSlot) do
		local followerID = getFollowerInBuilding(building)
		if followerID then
			numbFollowers = numbFollowers + 1
		end
	end

	return L["Followers assigned to buildings ("] .. tostring(numbFollowers) .. ")"
end

local function addFollower(building)
	-- skip if there is already a follower
	if getFollowerInBuilding(building) then
		return nil
	end

	local followers = C_Garrison.GetPossibleFollowersForBuilding(building.plotID)
	local bestFollower = getBestFollower(followers)

	if bestFollower then
		local function addFollowerToBuilding()
			C_Garrison.AssignFollowerToBuilding(building.plotID, bestFollower.followerID)
			print('|cffffcc00' .. bestFollower.name .. L[' added to '] .. getBuildingName(building.texPrefix)  .. '|cffffcc00')
		end

		return addFollowerToBuilding
	else
		return nil
	end
end

local function removeFollower(building)
	local followerID = getFollowerInBuilding(building)

	if followerID then
		local follower = C_Garrison.GetFollowerInfo(followerID)
		local function removeFollowerFromBuilding()
			C_Garrison.RemoveFollowerFromBuilding(building.plotID, follower.followerID)
			print('|cffffcc00' .. follower.name .. L[' removed from  '] .. getBuildingName(building.texPrefix) .. '|cffffcc00')
		end
		return removeFollowerFromBuilding
	else
		return nil
	end
end

local function runFunctions(assignmentFunctions)
	local delay = 0
	for i,f in ipairs(assignmentFunctions) do
		if f ~= nil then
			C_Timer.After(delay, f)
			delay = delay + 0.6
		end
	end

	C_Timer.After(delay, function()
		print(L['=== All done! === '])
	end)
end

-- Main Functions --

local function assignFollowers(assign)
	FollowerAssignCheck = assign
	local buildingsWithSlot = buildingsWithFollowerSlot()
	
	print(L['=== Starting to Assign Followers === '])
	local assignmentFunctions = {}

	for i,building in ipairs(buildingsWithSlot) do
		if assign == true then
			table.insert(assignmentFunctions, addFollower(building))
		elseif assign == false then
			table.insert(assignmentFunctions, removeFollower(building))
		end
	end
	
	runFunctions(assignmentFunctions)

end

local function createToggleButton()
	
	if ArchitectTabledFirstOpen then
		FollowerAssignToggleFrame = CreateFrame("CheckButton", nil, GarrisonBuildingFrame, "InterfaceOptionsCheckButtonTemplate")
		FollowerAssignToggleFrame:SetChecked(FollowerAssignCheck)
		FollowerAssignToggleFrame:SetSize(24, 24)
		FollowerAssignToggleFrame:SetHitRectInsets(0,0,0,0)
		FollowerAssignToggleFrame:SetPoint("LEFT", GarrisonBuildingFrame.BuildingList.MaterialFrame, 10, 30)
		FollowerAssignToggleFrame.Text:SetText(FollowersInBuildingsMessage())
		FollowerAssignToggleFrame.Text:SetFontObject(GameFontHighlight)
		FollowerAssignToggleFrame:SetScript("OnClick", function(self)
			assignFollowers(self:GetChecked())
		end)

		ArchitectTabledFirstOpen = false
	end
	
end

local function handleEvents(self, event, ...)
	if event == "GARRISON_ARCHITECT_OPENED" then
		createToggleButton()
	elseif event == "GARRISON_BUILDING_UPDATE" then
		if FollowerAssignToggleFrame then
			FollowerAssignToggleFrame.Text:SetText(FollowersInBuildingsMessage())
		end
	end
end


-- Globals
ArchitectTabledFirstOpen = true
if FollowerAssignCheck == nil then
	FollowerAssignCheck = false
end

-- Set up Main Frame
FollowerAssignFrame = CreateFrame("Frame", "FollowerAssignFrame", GarrisonBuildingFrame)
FollowerAssignToggleFrame = nil
FollowerAssignFrame:RegisterEvent("GARRISON_ARCHITECT_OPENED")
FollowerAssignFrame:RegisterEvent("GARRISON_BUILDING_UPDATE")
FollowerAssignFrame:SetScript("OnEvent", handleEvents)
