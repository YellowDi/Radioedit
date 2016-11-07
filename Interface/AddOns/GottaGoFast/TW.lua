function GottaGoFast.UpdateTW()
  if (GottaGoFast.CurrentTW) then
    if (not GottaGoFast.CurrentTW["StartTime"]) then
      GottaGoFast.CheckPositions(GottaGoFast.CurrentTW["CurrentZoneID"]);
    end
    GottaGoFast.UpdateTWTimer();
  end
end

function GottaGoFast.SetupTW(currentZoneID)
  local _, _, steps = C_Scenario.GetStepInfo();
  GottaGoFast.CurrentTW = {};
  GottaGoFast.CurrentTW["StartTime"] = nil;
  GottaGoFast.CurrentTW["CurrentTime"] = nil;
  GottaGoFast.CurrentTW["Time"] = nil;
  GottaGoFast.CurrentTW["LateStart"] = false;
  GottaGoFast.CurrentTW["String"] = nil;
  GottaGoFast.CurrentTW["Steps"] = steps;
  GottaGoFast.CurrentTW["CurrentZoneID"] = currentZoneID;
  GottaGoFast.CurrentTW["Completed"] = false;
  GottaGoFast.CurrentTW["CurrentValues"] = {};
  GottaGoFast.CurrentTW["FinalValues"] = {};
  GottaGoFast.CurrentTW["ObjectiveTimes"] = {};
  GottaGoFast.CurrentTW["Bosses"] = {};

  for i = 1, steps do
    local name, _, status, curValue, finalValue = C_Scenario.GetCriteriaInfo(i);
    name = string.gsub(name, " defeated", "");
    GottaGoFast.CurrentTW["CurrentValues"][i] = curValue;
    GottaGoFast.CurrentTW["FinalValues"][i] = finalValue;
    GottaGoFast.CurrentTW["Bosses"][i] = name;
    if (curValue ~= 0) then
      GottaGoFast.CurrentTW["LateStart"] = true;
      GottaGoFast.StartTW();
    end
  end

  if (GottaGoFast.CheckPositions(GottaGoFast.CurrentTW["CurrentZoneID"])) then
    GottaGoFast.CurrentTW["LateStart"] = true;
  end

  if (GottaGoFast.CurrentTW["LateStart"] == true) then
    --GottaGoFast:Print("Asked To Fix Timer");
    GottaGoFast:SendCommMessage("GottaGoFast", "FixMyTimer", "PARTY", nil, "ALERT");
  end

  GottaGoFast.HideObjectiveTracker();
end

function GottaGoFast.WipeTW()
  if (GottaGoFast.CurrentTW) then
    GottaGoFast.CurrentTW = table.wipe(GottaGoFast.CurrentTW);
  end
end

function GottaGoFast.StartTW()
  if (GottaGoFast.CurrentTW) then
    GottaGoFast.CurrentTW["StartTime"] = GetTime();
  end
end

function GottaGoFast.UpdateTWTimer()
  if (GottaGoFast.CurrentTW and GottaGoFast.CurrentTW["StartTime"]) then
    if (GottaGoFast.CurrentTW["Completed"] == false) then
      local time = "";
      local startMin, startSec;
      local currentTime = GetTime();
      local secs = currentTime - GottaGoFast.CurrentTW["StartTime"];
      GottaGoFast.CurrentTW["CurrentTime"] = secs;
      startMin, startSec = GottaGoFast.SecondsToTime(secs);
      if (GottaGoFast.CurrentTW["StartTime"] and GottaGoFast.db.profile.TrueTimer) then
        startMin = GottaGoFast.FormatTimeNoMS(startMin);
        startSec = GottaGoFast.FormatTimeMS(startSec);
      else
        startMin = GottaGoFast.FormatTimeNoMS(startMin);
        startSec = GottaGoFast.FormatTimeNoMS(startSec);
      end
      time = startMin .. ":" .. startSec;
      if (GottaGoFast.CurrentTW["LateStart"] == true) then
        time = time .. "*";
      end
      time = time .. " ";
      GottaGoFast.CurrentTW["Time"] = time;
      -- Update Frame
      GottaGoFastTimerFrame.font:SetText(GottaGoFast.ColorTimer(time));
      GottaGoFast.ResizeFrame();
    else
      GottaGoFastTimerFrame.font:SetText(GottaGoFast.ColorTimer(GottaGoFast.CurrentTW["Time"]));
    end
  else
    GottaGoFastTimerFrame.font:SetText(GottaGoFast.ColorTimer("00:00"));
  end
end

function GottaGoFast.UpdateTWObjectives()
  if (GottaGoFast.CurrentTW) then
    local objectiveString = "";
    for i = 1, GottaGoFast.CurrentTW["Steps"] do
      objectiveString = objectiveString .. GottaGoFast.ObjectiveString(GottaGoFast.CurrentTW["Bosses"][i], GottaGoFast.CurrentTW["CurrentValues"][i], GottaGoFast.CurrentTW["FinalValues"][i]);
      if (GottaGoFast.CurrentTW["ObjectiveTimes"][i]) then
        -- Completed Objective
        objectiveString = objectiveString .. GottaGoFast.ObjectiveCompletedString(GottaGoFast.CurrentTW["ObjectiveTimes"][i]);
      end
      objectiveString = objectiveString .. "\n";
    end
    GottaGoFastObjectiveFrame.font:SetText(objectiveString);
    GottaGoFast.ResizeFrame();
  end
end

function GottaGoFast.UpdateTWInformation()
  if (GottaGoFast.CurrentTW) then
    if (GottaGoFast.CurrentTW["Completed"] == false) then
      for i = 1, GottaGoFast.CurrentTW["Steps"] do
        local name, _, status, curValue, finalValue = C_Scenario.GetCriteriaInfo(i);
        if (finalValue == 0 or not finalValue) then
          -- Final Value = 0 Means TW Complete
          GottaGoFast.CompleteTW();
          return false;
        end
        if (GottaGoFast.CurrentTW["CurrentValues"][i] ~= curValue) then
          -- Update Value
          GottaGoFast.CurrentTW["CurrentValues"][i] = curValue;
          if (curValue == finalValue) then
            -- Add Objective Time
            GottaGoFast.CurrentTW["ObjectiveTimes"][i] = GottaGoFast.ObjectiveCompleteString(GottaGoFast.CurrentTW["Time"]);
          end
        elseif (GottaGoFast.CurrentTW["CurrentValues"][i] == GottaGoFast.CurrentTW["FinalValues"][i] and not GottaGoFast.CurrentTW["ObjectiveTimes"][i]) then
          -- Objective Already Complete But No Time Filled Out (Re-Log / Re-Zone)
          GottaGoFast.CurrentTW["ObjectiveTimes"][i] = "?";
        end
      end
    end
  end
end

function GottaGoFast.TWFinalParse()
  if (GottaGoFast.CurrentTW) then
    for i = 1, GottaGoFast.CurrentTW["Steps"] do
      GottaGoFast.CurrentTW["CurrentValues"][i] = GottaGoFast.CurrentTW["FinalValues"][i];
      if (not GottaGoFast.CurrentTW["ObjectiveTimes"][i]) then
        GottaGoFast.CurrentTW["ObjectiveTimes"][i] = GottaGoFast.ObjectiveCompleteString(GottaGoFast.CurrentTW["Time"]);
      end
    end
  end
end

function GottaGoFast.CompleteTW()
  if (GottaGoFast.CurrentTW) then
    GottaGoFast.CurrentTW["Completed"] = true;
    GottaGoFast.TWFinalParse();
  end
end

function GottaGoFast.CheckPositions(currentZoneID)
  local isAnyoneOutside = false;
  isAnyoneOutside = isAnyoneOutside or GottaGoFast.CheckUnitPosition(currentZoneID, "player");
  if (GetNumGroupMembers() ~= 0) then
  	for i = 1, GetNumGroupMembers() - 1
  	do
      isAnyoneOutside = isAnyoneOutside or GottaGoFast.CheckUnitPosition(currentZoneID, "party" .. i);
    end
  end
  if isAnyoneOutside then
    --time to start timer
    GottaGoFast.StartTW();
    return true;
  end
  return false;
end

function GottaGoFast.CheckUnitPosition(currentZoneID, unitName)
  if currentZoneID and unitName then
    local dx, dy, distance;
    local posX, posY, posZ, terrainMapID = UnitPosition(unitName);
    local startX = GottaGoFastInstanceInfo[currentZoneID]["startingArea"]["x"];
    local startY = GottaGoFastInstanceInfo[currentZoneID]["startingArea"]["y"];
    local safeZone = GottaGoFastInstanceInfo[currentZoneID]["startingArea"]["safeZone"];
    if (currentZoneID == terrainMapID) then
      dx = startX - posX;
      dy = startY - posY;
      distance = math.sqrt((dx * dx) + (dy * dy));
      return distance > safeZone;
    end
  end
  return false;
end
