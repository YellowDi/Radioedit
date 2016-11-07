function GottaGoFast.InitModels()
  GottaGoFast.InitModelPlayer();
  GottaGoFast.InitModelDungeon();
  GottaGoFast.InitModelRun();
  GottaGoFast.InitModelTimeStamp();
end

function GottaGoFast.InitDungeon(name, zoneID, objectives)
  if (GottaGoFast.FindDungeonByZoneID(zoneID) == nil and name ~= nil and zoneID ~= nil and next(objectives) ~= nil) then
    GottaGoFast.db.profile.History[zoneID] = GottaGoFast.Models.Dungeon.New(name, zoneID, objectives);
  end
end

function GottaGoFast.StoreRun()
  if (GottaGoFast.CurrentCM and next(GottaGoFast.CurrentCM) ~= nil) then
    local cCM = GottaGoFast.CurrentCM;
    local k, d = GottaGoFast.FindDungeonByZoneID(cCM["ZoneID"]);
    if (cCM["Completed"] == true and d ~= nil) then
      local corrupt = false;
      local hours, mins = GetGameTime();
      local weekday, month, day, year = CalendarGetDate();
      local deaths = cCM["Deaths"];
      local startTime = cCM["StartTime"];
      local endTime = GetTime();
      local timeStamp = GottaGoFast.Models.TimeStamp.New(month, day, year, hours, mins);
      local level = cCM["Level"];
      local objectiveTimes = cCM["ObjectiveTimes"];
      local affixes = cCM["Affixes"];
      local players = GottaGoFast.GetPlayersFromGroup();
      if (startTime == nil) then
        corrupt = true;
        startTime = GottaGoFast.StringToTime(cCM["Time"]);
      end
      if (startTime ~= nil and endTime ~= nil and deaths ~= nil and level ~= nil and next(objectiveTimes) ~= nil and next(players) ~= nil and next(timeStamp) ~= nil) then
        local run = GottaGoFast.Models.Run.New(corrupt, startTime, endTime, timeStamp, deaths, level, objectiveTimes, affixes, players);
        GottaGoFast.Models.Dungeon.AddRun(k, run);
      end
    end
  end
end
