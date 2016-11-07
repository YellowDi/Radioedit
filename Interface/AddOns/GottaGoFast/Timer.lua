function GottaGoFast.InitState()
  -- Default AddOn Globals
  GottaGoFast.inTW = false;
  GottaGoFast.inCM = false;
  GottaGoFast.minWidth = 200;
  GottaGoFast.unlocked = false;
  GottaGoFast.defaultTooltip = "Not In A CM";
  GottaGoFast.tooltip = GottaGoFast.defaultTooltip;
  GottaGoFast.demoMode = false;
  GottaGoFast.Models = {};
end

function GottaGoFast.TooltipOnEnter(self)
  GameTooltip:SetOwner(self, "ANCHOR_CURSOR");
  GameTooltip:SetText(GottaGoFast.tooltip, nil, nil, nil, nil, 1);
  GameTooltip:Show();
end

function GottaGoFast.TooltipOnLeave(self)
  GameTooltip_Hide();
end


function GottaGoFast.InitFrame()
  -- Register Textures
  GottaGoFastFrame.texture = GottaGoFastFrame:CreateTexture(nil,"BACKGROUND");
  GottaGoFastTimerFrame.texture = GottaGoFastTimerFrame:CreateTexture(nil, "BACKGROUND");
  GottaGoFastObjectiveFrame.texture = GottaGoFastObjectiveFrame:CreateTexture(nil, "BACKGROUND");

  -- Register Fonts
  GottaGoFastTimerFrame.font = GottaGoFastTimerFrame:CreateFontString(nil, "OVERLAY");
  GottaGoFastObjectiveFrame.font = GottaGoFastObjectiveFrame:CreateFontString(nil, "OVERLAY");

  -- Move Frame When Unlocked
  GottaGoFastFrame:SetScript("OnMouseDown", function(self, button)
    if GottaGoFast.unlocked and button == "LeftButton" and not self.isMoving then
     self:StartMoving();
     self.isMoving = true;
    end
  end);

  GottaGoFastFrame:SetScript("OnMouseUp", function(self, button)
    if button == "LeftButton" and self.isMoving then
     self:StopMovingOrSizing();
     self.isMoving = false;
     local point, relativeTo, relativePoint, xOffset, yOffset = GottaGoFastFrame:GetPoint(1);

     GottaGoFast.db.profile.FrameAnchor = point;
     GottaGoFast.db.profile.FrameX = xOffset;
     GottaGoFast.db.profile.FrameY = yOffset;
    end
  end);

  GottaGoFastFrame:SetScript("OnHide", function(self)
    if ( self.isMoving ) then
     self:StopMovingOrSizing();
     self.isMoving = false;
    end
  end);

  -- Set Frame Width / Height
  GottaGoFastFrame:SetHeight(340);
  GottaGoFastFrame:SetWidth(GottaGoFast.minWidth);
  GottaGoFastFrame:SetPoint(GottaGoFast.db.profile.FrameAnchor, GottaGoFast.db.profile.FrameX, GottaGoFast.db.profile.FrameY);
  GottaGoFastFrame:SetMovable(GottaGoFast.unlocked);
  GottaGoFastFrame:EnableMouse(GottaGoFast.unlocked);
  GottaGoFastTimerFrame:SetHeight(40);
  GottaGoFastTimerFrame:SetWidth(GottaGoFast.minWidth);
  GottaGoFastTimerFrame:SetPoint("TOP", GottaGoFast.db.profile.TimerX, GottaGoFast.db.profile.TimerY);
  GottaGoFastObjectiveFrame:SetHeight(300);
  GottaGoFastObjectiveFrame:SetWidth(GottaGoFast.minWidth);
  GottaGoFastObjectiveFrame:SetPoint("TOP", GottaGoFast.db.profile.ObjectiveX, GottaGoFast.db.profile.ObjectiveY);

  -- Set Font Settings
  GottaGoFastTimerFrame.font:SetAllPoints(true);
  GottaGoFastTimerFrame.font:SetJustifyH(GottaGoFast.db.profile.TimerAlign);
  GottaGoFastTimerFrame.font:SetJustifyV("BOTTOM");
  GottaGoFastTimerFrame.font:SetFont(GottaGoFast.LSM:Fetch("font", GottaGoFast.db.profile.TimerFont), GottaGoFast.db.profile.TimerFontSize, GottaGoFast.db.profile.TimerFontFlag);
  GottaGoFastTimerFrame.font:SetTextColor(1, 1, 1, 1);

  GottaGoFastObjectiveFrame.font:SetAllPoints(true);
  GottaGoFastObjectiveFrame.font:SetJustifyH(GottaGoFast.db.profile.ObjectiveAlign);
  GottaGoFastObjectiveFrame.font:SetJustifyV("TOP");
  GottaGoFastObjectiveFrame.font:SetFont(GottaGoFast.LSM:Fetch("font", GottaGoFast.db.profile.ObjectiveFont), GottaGoFast.db.profile.ObjectiveFontSize, GottaGoFast.db.profile.ObjectiveFontFlag);
  GottaGoFastObjectiveFrame.font:SetTextColor(1, 1, 1, 1);

  -- Remove Frame Background
  GottaGoFastFrame.texture:SetAllPoints(GottaGoFastFrame);
  GottaGoFastFrame.texture:SetTexture(0.5, 0.5, 0.5, 0);
  GottaGoFastTimerFrame.texture:SetAllPoints(GottaGoFastTimerFrame);
  GottaGoFastTimerFrame.texture:SetTexture(0, 1, 0, 0);
  GottaGoFastObjectiveFrame.texture:SetAllPoints(GottaGoFastObjectiveFrame);
  GottaGoFastObjectiveFrame.texture:SetTexture(0, 1, 0, 0);

  -- Create Tooltip
  GottaGoFastTimerFrame:SetScript("OnEnter", GottaGoFast.TooltipOnEnter);
  GottaGoFastTimerFrame:SetScript("OnLeave", GottaGoFast.TooltipOnLeave);

end

function GottaGoFast.ResizeFrame()
  local width;
  local minWidth = GottaGoFast.minWidth;
  local timerWidth = GottaGoFastTimerFrame.font:GetStringWidth();
  local objectiveWidth = GottaGoFastObjectiveFrame.font:GetStringWidth();
  if (minWidth >= timerWidth and minWidth >= objectiveWidth) then
    -- minWidth
    width = minWidth;
  elseif (timerWidth >= minWidth and timerWidth >= objectiveWidth) then
    -- Timer Width
    width = timerWidth;
  else
    -- Objective Width
    width = objectiveWidth
  end
  GottaGoFastObjectiveFrame:SetWidth(width);
  GottaGoFastTimerFrame:SetWidth(width);
  GottaGoFastFrame:SetWidth(width);
end

function GottaGoFast.ShowFrames()
  if (GottaGoFastFrame:IsShown() == false) then
    GottaGoFastFrame:Show();
  end
  if (GottaGoFastTimerFrame:IsShown() == false) then
    GottaGoFastTimerFrame:Show();
  end
  if (GottaGoFastObjectiveFrame:IsShown() == false) then
    GottaGoFastObjectiveFrame:Show();
  end
end

function GottaGoFast.HideFrames()
  if (GottaGoFastFrame:IsShown()) then
    GottaGoFastFrame:Hide();
  end
  if (GottaGoFastTimerFrame:IsShown()) then
    GottaGoFastTimerFrame:Hide();
  end
  if (GottaGoFastObjectiveFrame:IsShown()) then
    GottaGoFastObjectiveFrame:Hide();
  end
end

function GottaGoFast.StringToTime(time)
  time = GottaGoFast.Utility.TrimStr(time);
  time = GottaGoFast.Utility.ExplodeStr(":", time);
  if (time[1] ~= nil and time[2] ~= nil) then
    local mins = tonumber(time[1]);
    local secs = tonumber(time[2]);
    time = (mins * 60) + secs;
    time = GetTime() - time;
  else
    time = -1;
  end
  return time;
end

function GottaGoFast.SecondsToTime(seconds)
  local min = math.floor(seconds/60);
  local sec = seconds - (min * 60);
  return min, sec;
end

function GottaGoFast.FormatTimeNoMS(time)
  if (time < 10) then
    time = string.format("0%d", time);
  else
    time = string.format("%d", time);
  end
  return time;
end

function GottaGoFast.FormatTimeMS(time)
  if (time < 10) then
    time = string.format("0%.3f", time);
  else
    time = string.format("%.3f", time);
  end
  return time;
end

function GottaGoFast.RGBToHex(r, g, b, a)
	r = math.ceil(255 * r)
	g = math.ceil(255 * g)
	b = math.ceil(255 * b)
	if a == nil then
		return string.format("ff%02x%02x%02x", r, g, b)
	else
		a = math.ceil(255 * a)
		return string.format("%02x%02x%02x%02x", a, r, g, b)
	end
end

function GottaGoFast.HexToRGB(hex)
	if string.len(hex) == 8 then
		return tonumber("0x"..hex:sub(1,2)) / 255, tonumber("0x"..hex:sub(3,4)) / 255, tonumber("0x"..hex:sub(5,6)) / 255, tonumber("0x"..hex:sub(7,8)) / 255
	else
		return tonumber("0x"..hex:sub(1,2)) / 255, tonumber("0x"..hex:sub(3,4)) / 255, tonumber("0x"..hex:sub(5,6)) / 255
	end
end

function GottaGoFast.ObjectiveString(boss, curValue, finalValue)
  return string.format("|c%s%s - %d/%d|r", GottaGoFast.db.profile.ObjectiveColor, boss, curValue, finalValue);
end

function GottaGoFast.ObjectiveEnemyString(boss, curValue)
  return string.format("|c%s%s - %d%%|r", GottaGoFast.db.profile.ObjectiveColor, boss, curValue, finalValue);
end


function GottaGoFast.ObjectiveCompleteString(time)
  return string.format("%s", time);
end

function GottaGoFast.ObjectiveExtraString(value)
  return string.format("|c%s%s|r", GottaGoFast.db.profile.ObjectiveColor, value);
end

function GottaGoFast.ObjectiveCompletedString(time)
  return string.format("|c%s - |r|c%s%s|r", GottaGoFast.db.profile.ObjectiveColor, GottaGoFast.db.profile.ObjectiveCompleteColor, time);
end

function GottaGoFast.ColorTimer(time)
  return string.format("|c%s%s|r", GottaGoFast.db.profile.TimerColor, time);
end

function GottaGoFast.IncreaseColorString(value)
  return string.format("|c%s%s|r", GottaGoFast.db.profile.IncreaseColor, value);
end

function GottaGoFast.HideObjectiveTracker()
  ObjectiveTrackerFrame:SetParent(GottaGoFastHideFrame);
end

function GottaGoFast.ShowObjectiveTracker()
  ObjectiveTrackerFrame:SetParent(UIParent);
  if (GottaGoFast.db.profile.ObjectiveCollapsed == true) then
    ObjectiveTracker_Collapse();
  end
end

function GottaGoFast.ToggleDemoMode()
  if (GottaGoFast.inCM == false and GottaGoFast.inTW == false) then
    -- Demo Mode Goes Here
    if (GottaGoFast.demoMode == false) then
      GottaGoFast.SetupFakeCM();
      GottaGoFast.UpdateCMTimer();
      GottaGoFast.UpdateCMObjectives();
      GottaGoFastFrame:SetScript("OnUpdate", GottaGoFast.UpdateCM);
      GottaGoFast.ShowFrames();
      GottaGoFast.demoMode = true;
    else
      GottaGoFast.ResetState();
      GottaGoFast.demoMode = false;
    end
  end
end
