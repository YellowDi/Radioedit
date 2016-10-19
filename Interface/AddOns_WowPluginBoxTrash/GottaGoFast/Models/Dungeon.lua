-- Define Objects
-- Dungeon
local Dungeon = {}

function Dungeon.New(name, zoneID, objectives)
  local self = setmetatable({}, Dungeon)
  self.name = name;
  self.zoneID = zoneID;
  self.objectives = objectives;
  self.runs = {};
  return self
end

function Dungeon.GetName(self)
  return self.name
end

function Dungeon.SetName(self, name)
  self.name = name
end

function Dungeon.GetZoneID(self)
  return self.zoneID
end

function Dungeon.SetZoneID(self, zoneID)
  self.zoneID = zoneID
end

function Dungeon.GetObjectives(self)
  return self.objectives
end

function Dungeon.SetObjectives(self, objectives)
  self.objectives = objectives
end

function Dungeon.GetRuns(self)
  return self.runs
end

function Dungeon.SetRuns(self, runs)
  self.runs = runs
end

function Dungeon.AddRun(self, run)
  table.insert(GottaGoFast.db.profile.History[self].runs, run);
end

function GottaGoFast.InitModelDungeon()
  GottaGoFast.Models.Dungeon = Dungeon;
end

function GottaGoFast.FindDungeonByZoneID(zoneID)
  if (next(GottaGoFast.db.profile.History) ~= nil) then
    if (GottaGoFast.db.profile.History[zoneID] and next(GottaGoFast.db.profile.History[zoneID]) ~= nil) then
      return zoneID, GottaGoFast.db.profile.History[zoneID];
    end
  end
  return nil, nil;
end
