-- Define Objects
-- TimeStamp
local TimeStamp = {}

function TimeStamp.New(month, day, year, hours, mins)
  local self = {}
  self.month = month;
  self.day = day;
  self.year = year;
  self.hours = hours;
  self.mins = mins;
  return self
end

function TimeStamp.GetMonth(self)
  return self.month
end

function TimeStamp.SetMonth(self, month)
  self.month = month
end

function TimeStamp.GetDay(self)
  return self.day
end

function TimeStamp.SetDay(self, day)
  self.day = day
end

function TimeStamp.GetYear(self)
  return self.year
end

function TimeStamp.SetYear(self, year)
  self.year = year
end

function TimeStamp.GetHours(self)
  return self.hours
end

function TimeStamp.SetHours(self, hours)
  self.hours = hours
end

function TimeStamp.GetMins(self)
  return self.mins
end

function TimeStamp.SetMins(self, mins)
  self.mins = mins
end

function GottaGoFast.InitModelTimeStamp()
  GottaGoFast.Models.TimeStamp = TimeStamp;
end
