GottaGoFast = LibStub("AceAddon-3.0"):NewAddon("GottaGoFast", "AceConsole-3.0", "AceEvent-3.0", "AceTimer-3.0", "AceSerializer-3.0", "AceComm-3.0");

function GottaGoFast:OnInitialize()
    -- Called when the addon is loaded
    -- Register Frames
    GottaGoFastFrame = CreateFrame("Frame", "GottaGoFastFrame", UIParent);
    GottaGoFastTimerFrame = CreateFrame("Frame", "GottaGoFastTimerFrame", GottaGoFastFrame);
    GottaGoFastObjectiveFrame = CreateFrame("Frame", "GottaGoFastObjectiveFrame", GottaGoFastFrame);
    GottaGoFastHideFrame = CreateFrame("Frame");
    GottaGoFastHideFrame:Hide();
end

function GottaGoFast:OnEnable()
    -- Called when the addon is enabled

    -- Register Events
    RegisterAddonMessagePrefix("GottaGoFast");
    self:RegisterEvent("CHALLENGE_MODE_START");
    self:RegisterEvent("CHALLENGE_MODE_COMPLETED");
    self:RegisterEvent("CHALLENGE_MODE_RESET");
    self:RegisterEvent("PLAYER_ENTERING_WORLD");
    self:RegisterEvent("SCENARIO_POI_UPDATE");
    self:RegisterEvent("WORLD_STATE_TIMER_START");
    self:RegisterChatCommand("ggf", "ChatCommand");
    self:RegisterChatCommand("GottaGoFast", "ChatCommand");
    self:RegisterComm("GottaGoFast", "ChatComm");

    -- Setup AddOn
    GottaGoFast.InitState();
    GottaGoFast.InitOptions();
    GottaGoFast.InitFrame();
    GottaGoFast.InitModels();

end

function GottaGoFast:OnDisable()
  -- Called when the addon is disabled
end

function GottaGoFast:CHALLENGE_MODE_START()
  --self:Print("CM Start");
  GottaGoFast.WhereAmI();
  GottaGoFast.StartCM(10);
end

function GottaGoFast:CHALLENGE_MODE_COMPLETED()
  --self:Print("CM Complete");
  GottaGoFast.CompleteCM();
  GottaGoFast.StoreRun();
end

function GottaGoFast:CHALLENGE_MODE_RESET()
  --self:Print("CM Reset");
  local _, _, difficulty, _, _, _, _, currentZoneID = GetInstanceInfo();
  GottaGoFast.WipeCM();
  GottaGoFast.SetupCM(currentZoneID);
end

function GottaGoFast:PLAYER_ENTERING_WORLD()
  --self:Print("Player Entered World");
  GottaGoFast.CheckCount = 0;
  GottaGoFast.FirstCheck = false;
  GottaGoFast.ResetState();
  GottaGoFast.WhereAmI();
end

function GottaGoFast:SCENARIO_POI_UPDATE()
  if (GottaGoFast.inCM) then
    --self:Print("Scenario POI Update");
    if (GottaGoFast.CurrentCM["Steps"] == 0 and GottaGoFast.CurrentCM["Completed"] == false and next(GottaGoFast.CurrentCM["Bosses"]) == nil) then
      GottaGoFast.WhereAmI();
    end
    GottaGoFast.UpdateCMInformation();
    GottaGoFast.UpdateCMObjectives();
  elseif (GottaGoFast.inTW) then
    --Self:Print("Scenario POI Update");
    if (GottaGoFast.CurrentTW["Steps"] == 0 and GottaGoFast.CurrentTW["Completed"] == false and next(GottaGoFast.CurrentTW["Bosses"]) == nil) then
      -- Timewalking Must Be Resetup If You Enter First
      local _, _, difficulty, _, _, _, _, currentZoneID = GetInstanceInfo();
      GottaGoFast.WipeTW();
      GottaGoFast.SetupTW(currentZoneID);
    end
    GottaGoFast.UpdateTWInformation();
    GottaGoFast.UpdateTWObjectives();
  end
end

function GottaGoFast:WORLD_STATE_TIMER_START()
  if (GottaGoFast.inCM == true and GottaGoFast.CurrentCM["Completed"] == false) then
    local _, timeCM = GetWorldElapsedTime(1);
    if (timeCM <= 2) then
      GottaGoFast.StartCM(0);
    elseif (GottaGoFast.CurrentCM["Deaths"]) then
      GottaGoFast.CurrentCM["Deaths"] = GottaGoFast.CurrentCM["Deaths"] + 1;
    end
  end
end

function GottaGoFast:ChatCommand(input)
  InterfaceOptionsFrame_OpenToCategory(GottaGoFast.optionsFrame);
  InterfaceOptionsFrame_OpenToCategory(GottaGoFast.optionsFrame);
end

function GottaGoFast:ChatComm(prefix, input, distribution, sender)
  -- Right Now This Is Only Used For Syncing Timer
  --GottaGoFast:Print("Message Received");
  if (input == "FixMyTimer" and GottaGoFast.inTW == true and GottaGoFast.CurrentTW) then
    -- Someone asked for a timer, send it to them!
    if (GottaGoFast.CurrentTW["LateStart"] == false and GottaGoFast.CurrentTW["StartTime"] and GottaGoFast.CurrentTW["CurrentTime"]) then
      local CurrentTWString = GottaGoFast:Serialize(GottaGoFast.CurrentTW);
      --GottaGoFast:Print("Timer Sent");
      GottaGoFast:SendCommMessage("GottaGoFast", CurrentTWString, "PARTY", nil, "ALERT");
    end
  else
    -- Received Timer, See If You Need It, Then Update
    if (GottaGoFast.inTW == true and GottaGoFast.CurrentTW) then
      if (GottaGoFast.CurrentTW["LateStart"] == true) then
        --GottaGoFast:Print("Replacing Timer");
        -- Set Table
        GottaGoFast:Deserialize(input);
        local DIW, ETW = GottaGoFast:Deserialize(input);
        if (DIW) then
          local CurrentTime = GetTime();
          ETW["StartTime"] = CurrentTime - ETW["CurrentTime"];
          GottaGoFast.CurrentTW = ETW;
          -- Update Timer
          GottaGoFast.UpdateTWTimer();
          GottaGoFast.UpdateTWObjectives();
        end
      end
    end
  end
end

function GottaGoFast.ResetState()
  GottaGoFast.WipeCM();
  GottaGoFast.WipeTW();
  GottaGoFast.inCM = false;
  GottaGoFast.inTW = false;
  GottaGoFast.demoMode = false;
  GottaGoFast.tooltip = GottaGoFast.defaultTooltip;
  GottaGoFastFrame:SetScript("OnUpdate", nil);
  GottaGoFast.HideFrames();
  GottaGoFast.ShowObjectiveTracker();
end

function GottaGoFast.WhereAmI()
  local _, _, difficulty, _, _, _, _, currentZoneID = GetInstanceInfo();
  --GottaGoFast:Print("Difficulty: " .. difficulty);
  --GottaGoFast:Print("Zone ID: " .. currentZoneID);
  if (GottaGoFast.FirstCheck == false) then
    GottaGoFast.FirstCheck = true;
    GottaGoFast:ScheduleTimer(GottaGoFast.WhereAmI, 0.1);
  elseif (difficulty == 8) then
      --GottaGoFast:Print("Player Entered Challenge Mode");
      GottaGoFast.WipeCM();
      --GottaGoFast:Print("Wiping CM");
      GottaGoFast.SetupCM(currentZoneID);
      --GottaGoFast:Print("Setting Up CM");
      GottaGoFast.UpdateCMTimer();
      --GottaGoFast:Print("Setting Up Timer");
      GottaGoFast.UpdateCMObjectives();
      --GottaGoFast:Print("Setting Up Objectives");
      GottaGoFast.inCM = true;
      GottaGoFast.inTW = false;
      GottaGoFastFrame:SetScript("OnUpdate", GottaGoFast.UpdateCM);
      --GottaGoFast:Print("Setting Up Update Script");
      GottaGoFast.ShowFrames();
      --GottaGoFast:Print("Showing Frames");
  elseif (difficulty == 24 and GottaGoFastInstanceInfo[currentZoneID]) then
    -- Difficutly 24 for Timewalking
    if (GottaGoFastInstanceInfo[currentZoneID]["TW"]) then
      --GottaGoFast:Print("Player Entered Timewalking Dungeon");
      GottaGoFast.WipeTW();
      GottaGoFast.SetupTW(currentZoneID);
      GottaGoFast.UpdateTWTimer();
      GottaGoFast.UpdateTWObjectives();
      GottaGoFast.inCM = false;
      GottaGoFast.inTW = true;
      GottaGoFastFrame:SetScript("OnUpdate", GottaGoFast.UpdateTW);
      -- Hiding Frames For Now
      GottaGoFast.ShowFrames();
    end
  elseif (GottaGoFast.CheckCount < 20 and GottaGoFastInstanceInfo[currentZoneID]) then
    GottaGoFast.CheckCount = GottaGoFast.CheckCount + 1;
    GottaGoFast:ScheduleTimer(GottaGoFast.WhereAmI, 0.1);
  else
    GottaGoFast.ResetState();
  end
end
