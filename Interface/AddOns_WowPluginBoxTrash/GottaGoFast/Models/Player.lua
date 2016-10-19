-- Define Objects
-- Player
local Player = {}

function Player.New(name, class, role)
  local self = {}
  self.name = name;
  self.class = class;
  self.role = role;
  return self
end

function Player.GetName(self)
  return self.name
end

function Player.SetName(self, name)
  self.name = name
end

function Player.GetClass(self)
  return self.class
end

function Player.SetClass(self, class)
  self.class = class
end

function Player.GetRole(self)
  return self.role
end

function Player.SetRole(self, role)
  self.role = role
end

function GottaGoFast.InitModelPlayer()
  GottaGoFast.Models.Player = Player;
end

function GottaGoFast.GetGroupPrefix()
  if IsInRaid() then
    return "raid";
  else
    return "party";
  end
end

function GottaGoFast.GetPlayer(unit)
  local name = GetUnitName(unit, false);
  local class = UnitClass(unit);
  local role = UnitGroupRolesAssigned(unit);
  return GottaGoFast.Models.Player.New(name, class, role);
end

function GottaGoFast.GetPlayersFromGroup()
  local players = {};
  local members = GetNumGroupMembers();
  local prefix = GottaGoFast.GetGroupPrefix();
  for i = 1, members - 1 do
    table.insert(players, GottaGoFast.GetPlayer(prefix .. i));
  end
  table.insert(players, GottaGoFast.GetPlayer("player"));
  return players;
end
