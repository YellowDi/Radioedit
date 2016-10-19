function GottaGoFast.GetUnlocked(info)
  return GottaGoFast.unlocked;
end

function GottaGoFast.SetUnlocked(info, value)
  GottaGoFast.unlocked = value;
  GottaGoFastFrame:SetMovable(GottaGoFast.unlocked);
  GottaGoFastFrame:EnableMouse(GottaGoFast.unlocked);
end

function GottaGoFast.GetGoldTimer(info)
  return GottaGoFast.db.profile.GoldTimer;
end

function GottaGoFast.SetGoldTimer(info, value)
  GottaGoFast.db.profile.GoldTimer = value;
  GottaGoFast.UpdateCMTimer();
  GottaGoFast.UpdateCMObjectives();
end

function GottaGoFast.GetTrueTimer(info)
  return GottaGoFast.db.profile.TrueTimer;
end

function GottaGoFast.SetTrueTimer(info, value)
  GottaGoFast.db.profile.TrueTimer = value;
  GottaGoFast.UpdateCMTimer();
end

function GottaGoFast.GetTimerX(info)
  return GottaGoFast.db.profile.TimerX;
end

function GottaGoFast.SetTimerX(info, value)
  GottaGoFast.db.profile.TimerX = value;
  GottaGoFastTimerFrame:ClearAllPoints();
  GottaGoFastTimerFrame:SetPoint("TOP", GottaGoFast.db.profile.TimerX, GottaGoFast.db.profile.TimerY);
end

function GottaGoFast.GetTimerY(info)
  return GottaGoFast.db.profile.TimerY;
end

function GottaGoFast.SetTimerY(info, value)
  GottaGoFast.db.profile.TimerY = value;
  GottaGoFastTimerFrame:ClearAllPoints();
  GottaGoFastTimerFrame:SetPoint("TOP", GottaGoFast.db.profile.TimerX, GottaGoFast.db.profile.TimerY);
end

function GottaGoFast.GetTimerFont(info)
  return GottaGoFast.db.profile.TimerFont;
end

function GottaGoFast.SetTimerFont(info, value)
  GottaGoFast.db.profile.TimerFont = value;
  GottaGoFastTimerFrame.font:SetFont(GottaGoFast.LSM:Fetch("font", GottaGoFast.db.profile.TimerFont), GottaGoFast.db.profile.TimerFontSize, GottaGoFast.db.profile.TimerFontFlag);
end

function GottaGoFast.GetObjectiveFont(info)
  return GottaGoFast.db.profile.ObjectiveFont;
end

function GottaGoFast.SetObjectiveFont(info, value)
  GottaGoFast.db.profile.ObjectiveFont = value;
  GottaGoFastObjectiveFrame.font:SetFont(GottaGoFast.LSM:Fetch("font", GottaGoFast.db.profile.ObjectiveFont), GottaGoFast.db.profile.ObjectiveFontSize, GottaGoFast.db.profile.ObjectiveFontFlag);
end

function GottaGoFast.GetTimerFontSize(info)
  return GottaGoFast.db.profile.TimerFontSize;
end

function GottaGoFast.SetTimerFontSize(info, value)
  GottaGoFast.db.profile.TimerFontSize = value;
  GottaGoFastTimerFrame.font:SetFont(GottaGoFast.LSM:Fetch("font", GottaGoFast.db.profile.TimerFont), GottaGoFast.db.profile.TimerFontSize, GottaGoFast.db.profile.TimerFontFlag);
end

function GottaGoFast.GetTimerAlign(info)
  return GottaGoFast.db.profile.TimerAlign;
end

function GottaGoFast.SetTimerAlign(info, value)
  GottaGoFast.db.profile.TimerAlign = value;
  GottaGoFastTimerFrame.font:SetJustifyH(GottaGoFast.db.profile.TimerAlign);
end

function GottaGoFast.GetObjectiveX(info)
  return GottaGoFast.db.profile.ObjectiveX;
end

function GottaGoFast.SetObjectiveX(info, value)
  GottaGoFast.db.profile.ObjectiveX = value;
  GottaGoFastObjectiveFrame:ClearAllPoints();
  GottaGoFastObjectiveFrame:SetPoint("TOP", GottaGoFast.db.profile.ObjectiveX, GottaGoFast.db.profile.ObjectiveY);
end

function GottaGoFast.GetObjectiveY(info)
  return GottaGoFast.db.profile.ObjectiveY;
end

function GottaGoFast.SetObjectiveY(info, value)
  GottaGoFast.db.profile.ObjectiveY = value;
  GottaGoFastObjectiveFrame:ClearAllPoints();
  GottaGoFastObjectiveFrame:SetPoint("TOP", GottaGoFast.db.profile.ObjectiveX, GottaGoFast.db.profile.ObjectiveY);
end

function GottaGoFast.GetObjectiveFontSize(info)
  return GottaGoFast.db.profile.ObjectiveFontSize;
end

function GottaGoFast.SetObjectiveFontSize(info, value)
  GottaGoFast.db.profile.ObjectiveFontSize = value;
  GottaGoFastObjectiveFrame.font:SetFont(GottaGoFast.LSM:Fetch("font", GottaGoFast.db.profile.ObjectiveFont), GottaGoFast.db.profile.ObjectiveFontSize, GottaGoFast.db.profile.ObjectiveFontFlag);
end

function GottaGoFast.GetObjectiveAlign(info)
  return GottaGoFast.db.profile.ObjectiveAlign;
end

function GottaGoFast.SetObjectiveAlign(info, value)
  GottaGoFast.db.profile.ObjectiveAlign = value;
  GottaGoFastObjectiveFrame.font:SetJustifyH(GottaGoFast.db.profile.ObjectiveAlign);
end

function GottaGoFast.GetObjectiveCollapsed(info)
  return GottaGoFast.db.profile.ObjectiveCollapsed;
end

function GottaGoFast.SetObjectiveCollapsed(info, value)
  GottaGoFast.db.profile.ObjectiveCollapsed = value;
end

function GottaGoFast.GetTimerColor(info)
  local a, r, g, b = GottaGoFast.HexToRGB(GottaGoFast.db.profile.TimerColor);
  return r, g, b, a;
end

function GottaGoFast.SetTimerColor(info, r, g, b, a)
  GottaGoFast.db.profile.TimerColor = GottaGoFast.RGBToHex(r, g, b, a);
  GottaGoFast.UpdateCMTimer();
end

function GottaGoFast.GetObjectiveColor(info)
  local a, r, g, b = GottaGoFast.HexToRGB(GottaGoFast.db.profile.ObjectiveColor);
  return r, g, b, a;
end

function GottaGoFast.SetObjectiveColor(info, r, g, b, a)
  GottaGoFast.db.profile.ObjectiveColor = GottaGoFast.RGBToHex(r, g, b, a);
  GottaGoFast.UpdateCMObjectives();
end

function GottaGoFast.GetObjectiveCompleteColor(info)
  local a, r, g, b = GottaGoFast.HexToRGB(GottaGoFast.db.profile.ObjectiveCompleteColor);
  return r, g, b, a;
end

function GottaGoFast.SetObjectiveCompleteColor(info, r, g, b, a)
  GottaGoFast.db.profile.ObjectiveCompleteColor = GottaGoFast.RGBToHex(r, g, b, a);
  GottaGoFast.UpdateCMObjectives();
end

function GottaGoFast.GetIncreaseColor(info)
  local a, r, g, b = GottaGoFast.HexToRGB(GottaGoFast.db.profile.IncreaseColor);
  return r, g, b, a;
end

function GottaGoFast.SetIncreaseColor(info, r, g, b, a)
  GottaGoFast.db.profile.IncreaseColor = GottaGoFast.RGBToHex(r, g, b, a);
  GottaGoFast.UpdateCMObjectives();
end

function GottaGoFast.GetLevelInTimer(info)
  return GottaGoFast.db.profile.LevelInTimer;
end

function GottaGoFast.SetLevelInTimer(info, value)
  GottaGoFast.db.profile.LevelInTimer = value;
  GottaGoFast.UpdateCMTimer();
end

function GottaGoFast.GetLevelInObjectives(info)
  return GottaGoFast.db.profile.LevelInObjectives;
end

function GottaGoFast.SetLevelInObjectives(info, value)
  GottaGoFast.db.profile.LevelInObjectives = value;
  GottaGoFast.UpdateCMObjectives();
end

function GottaGoFast.GetAffixesInObjectives(info)
  return GottaGoFast.db.profile.AffixesInObjectives;
end

function GottaGoFast.SetAffixesInObjectives(info, value)
  GottaGoFast.db.profile.AffixesInObjectives = value;
  GottaGoFast.UpdateCMObjectives();
end

function GottaGoFast.GetIncreaseInObjectives(info)
  return GottaGoFast.db.profile.IncreaseInObjectives;
end

function GottaGoFast.SetIncreaseInObjectives(info, value)
  GottaGoFast.db.profile.IncreaseInObjectives = value;
  GottaGoFast.UpdateCMObjectives();
end

function GottaGoFast.GetObjectiveCompleteInObjectives(info)
  return GottaGoFast.db.profile.ObjectiveCompleteInObjectives;
end

function GottaGoFast.SetObjectiveCompleteInObjectives(info, value)
  GottaGoFast.db.profile.ObjectiveCompleteInObjectives = value;
  GottaGoFast.UpdateCMObjectives();
end

function GottaGoFast.GetTimerFontFlag(info)
  return GottaGoFast.db.profile.TimerFontFlag;
end

function GottaGoFast.SetTimerFontFlag(info, value)
  GottaGoFast.db.profile.TimerFontFlag = value;
  GottaGoFastTimerFrame.font:SetFont(GottaGoFast.LSM:Fetch("font", GottaGoFast.db.profile.TimerFont), GottaGoFast.db.profile.TimerFontSize, GottaGoFast.db.profile.TimerFontFlag);
end

function GottaGoFast.GetObjectiveFontFlag(info)
  return GottaGoFast.db.profile.ObjectiveFontFlag;
end

function GottaGoFast.SetObjectiveFontFlag(info, value)
  GottaGoFast.db.profile.ObjectiveFontFlag = value;
  GottaGoFastObjectiveFrame.font:SetFont(GottaGoFast.LSM:Fetch("font", GottaGoFast.db.profile.ObjectiveFont), GottaGoFast.db.profile.ObjectiveFontSize, GottaGoFast.db.profile.ObjectiveFontFlag);
end

function GottaGoFast.InitOptions()
  GottaGoFast.LSM = LibStub:GetLibrary("LibSharedMedia-3.0");
--  GottaGoFast.LSM:Register("font", "Myriad Condensed Web", "Interface\\Addons\\GottaGoFast\\MyriadCondensedWeb.ttf")
  local defaults = {
    profile = {
      GoldTimer = true,
      TrueTimer = true,
      FrameAnchor = "RIGHT",
      FrameX = 0,
      FrameY = 0,
      TimerAlign = "CENTER",
      TimerX = -35, --by eui.cc
      TimerY = 0,
      TimerFont = "EUI",
      TimerFontSize = 29,
      TimerColor = "ffffffff",
      TimerFontFlag = "OUTLINE",
      ObjectiveAlign = "LEFT",
      ObjectiveX = -35, --by eui.cc
      ObjectiveY = -40,
      ObjectiveFont = "EUI",
      ObjectiveFontSize = 21,
      ObjectiveCollapsed = false,
      ObjectiveColor = "ffffffff",
      ObjectiveCompleteColor = "ff0ff000",
      ObjectiveFontFlag = "OUTLINE",
      IncreaseColor = "ffffffff",
      LevelInTimer = true,
      LevelInObjectives = false,
      AffixesInObjectives = true,
      IncreaseInObjectives = true,
      ObjectiveCompleteInObjectives = true,
      History = {},
    },
  }
  local options
  if GetLocale() == 'zhTW' then
	  options = {
		name = "GottaGoFast",
		handler = GottaGoFast,
		type = "group",
		args = {
		  cms = {
			name = "挑戰模式",
			type = "group",
			args = {
			  TrueTimer = {
				order = 1,
				type = "toggle",
				name = "精確計時",
				desc = "切換是否顯示毫秒",
				get = GottaGoFast.GetTrueTimer,
				set = GottaGoFast.SetTrueTimer,
			  },
			  GoldTimer = {
				order = 2,
				type = "toggle",
				name = "金牌計時",
				desc = "切換是否顯示金牌計時",
				get = GottaGoFast.GetGoldTimer,
				set = GottaGoFast.SetGoldTimer,
			  },
			  LevelInObjectives = {
				order = 3,
				type = "toggle",
				name = "挑戰等級顯示(目標)",
				desc = "在目標列表顯示目前挑戰等級",
				get = GottaGoFast.GetLevelInObjectives,
				set = GottaGoFast.SetLevelInObjectives,
			  },
			  AffixesInObjectives = {
				order = 4,
				type = "toggle",
				name = "詞綴顯示(目標)",
				desc = "在目標列表顯示目前詞綴",
				get = GottaGoFast.GetAffixesInObjectives,
				set = GottaGoFast.SetAffixesInObjectives,
			  },
			  LevelInTimer = {
				order = 5,
				type = "toggle",
				name = "挑戰等級顯示(計時)",
				desc = "在計時器開頭顯示目前挑戰等級",
				get = GottaGoFast.GetLevelInTimer,
				set = GottaGoFast.SetLevelInTimer,
			  },
			  IncreaseInObjectives = {
				order = 6,
				type = "toggle",
				name = "鑰石升級顯示(目標)",
				desc = "額外鑰石計時分離",
				get = GottaGoFast.GetIncreaseInObjectives,
				set = GottaGoFast.SetIncreaseInObjectives,
			  },
			  ObjectiveCompleteInObjectives = {
				order = 7,
				type = "toggle",
				name = "挑戰目標完成顯示(目標)",
				desc = "顯示我們已經完成的目標時間",
				get = GottaGoFast.GetObjectiveCompleteInObjectives,
				set = GottaGoFast.SetObjectiveCompleteInObjectives,
			  }
			}
		  },
		  display = {
			name = "顯示",
			type = "group",
			args = {
			  unlocked = {
				order = 1,
				type = "toggle",
				name = "不鎖定",
				desc = "切換計時器框架鎖定狀態",
				get = GottaGoFast.GetUnlocked,
				set = GottaGoFast.SetUnlocked,
			  },
			  ObjectiveCollapsed = {
				order = 2,
				type = "toggle",
				 name = "目標追蹤器收起",
				desc = "收起目標追蹤器當離開挑戰模式/時光漫遊",
				get = GottaGoFast.GetObjectiveCollapsed,
				set = GottaGoFast.SetObjectiveCollapsed,
			  },
			  TimerX = {
				order = 3,
				type = "range",
				name = "計時器水平位置",
				desc = "預設: 0",
				min = -100,
				max = 100,
				step = 1,
				get = GottaGoFast.GetTimerX,
				set = GottaGoFast.SetTimerX,
			  },
			  TimerY = {
				order = 4,
				type = "range",
				name = "計時器垂直位置",
				desc = "預設: 0",
				min = -100,
				max = 100,
				step = 1,
				get = GottaGoFast.GetTimerY,
				set = GottaGoFast.SetTimerY,
			  },
			  TimerFontSize = {
				order = 7,
				type = "range",
				 name = "計時器文字大小",
				desc = "預設: 29",
				min = 8,
				max = 32,
				step = 1,
				get = GottaGoFast.GetTimerFontSize,
				set = GottaGoFast.SetTimerFontSize,
			  },
			  TimerFontFlag = {
				order = 9,
				type = "select",
				name = "計時文字樣式",
				desc = "預設: 描邊",
				values = {["OUTLINE"] = "描邊", ["THICKOUTLINE"] = "粗描邊", ["MONOCHROME"] = "無消除鋸齒", ["NONE"] = "無"},
				get = GottaGoFast.GetTimerFontFlag,
				set = GottaGoFast.SetTimerFontFlag,
			  },
			  ObjectiveX = {
				order = 5,
				type = "range",
				name = "目標水平位置",
				desc = "預設: 0",
				min = -100,
				max = 100,
				step = 1,
				get = GottaGoFast.GetObjectiveX,
				set = GottaGoFast.SetObjectiveX,
			  },
			  ObjectiveY = {
				order = 6,
				type = "range",
				name = "目標垂直位置",
				desc = "預設: -40",
				min = -100,
				max = 100,
				step = 1,
				get = GottaGoFast.GetObjectiveY,
				set = GottaGoFast.SetObjectiveY,
			  },
			  ObjectiveFontSize = {
				order = 8,
				type = "range",
				name = "目標文字大小",
				desc = "預設: 21",
				min = 8,
				max = 32,
				step = 1,
				get = GottaGoFast.GetObjectiveFontSize,
				set = GottaGoFast.SetObjectiveFontSize,
			  },
			  ObjectiveFontFlag = {
				order = 10,
				type = "select",
				name = "目標文字樣式",
				desc = "預設: 描邊",
				values = {["OUTLINE"] = "描邊", ["THICKOUTLINE"] = "粗描邊", ["MONOCHROME"] = "無消除鋸齒", ["NONE"] = "無"},
				get = GottaGoFast.GetObjectiveFontFlag,
				set = GottaGoFast.SetObjectiveFontFlag,
			  },
			  TimerAlign = {
				order = 11,
				type = "select",
				name = "計時對齊",
				desc = "預設: 中央",
				values = {["LEFT"] = "左", ["CENTER"] = "中央", ["RIGHT"] = "右"},
				get = GottaGoFast.GetTimerAlign,
				set = GottaGoFast.SetTimerAlign,
			  },
			  ObjectiveAlign = {
				order = 12,
				type = "select",
				name = "目標對齊",
				desc = "預設: LEFT",
				values = {["LEFT"] = "左", ["CENTER"] = "中央", ["RIGHT"] = "右"},
				get = GottaGoFast.GetObjectiveAlign,
				set = GottaGoFast.SetObjectiveAlign,
			  },
			  TimerFont = {
				order = 13,
				type = "select",
				dialogControl = "LSM30_Font",
				name = "計時文字",
				desc = "預設: Arial, Monospaced Fonts like MyriadCondensedWeb are recommended",
				values = GottaGoFast.LSM:HashTable("font"),
				get = GottaGoFast.GetTimerFont,
				set = GottaGoFast.SetTimerFont,
			  },
			  ObjectiveFont = {
				order = 14,
				type = "select",
				dialogControl = "LSM30_Font",
				name = "目標文字",
				desc = "預設: Arial, Monospaced Fonts like MyriadCondensedWeb are recommended",
				values = GottaGoFast.LSM:HashTable("font"),
				get = GottaGoFast.GetObjectiveFont,
				set = GottaGoFast.SetObjectiveFont,
			  },
			  ObjectiveColor = {
				order = 15,
				type = "color",
				 name = "目標顏色",
				desc = "預設: 白",
				get = GottaGoFast.GetObjectiveColor,
				set = GottaGoFast.SetObjectiveColor,
				hasAlpha = false,
			  },
			  ObjectiveCompleteColor = {
				order = 16,
				type = "color",
				name = "目標完成顏色",
				desc = "預設: 綠",
				get = GottaGoFast.GetObjectiveCompleteColor,
				set = GottaGoFast.SetObjectiveCompleteColor,
				hasAlpha = false,
			  },
			  TimerColor = {
				order = 17,
				type = "color",
				name = "計時顏色",
				desc = "預設: 白",
				get = GottaGoFast.GetTimerColor,
				set = GottaGoFast.SetTimerColor,
				hasAlpha = false,
			  },
			  IncreaseColor = {
				order = 18,
				type = "color",
				name = "鑰石升級顏色",
				desc = "預設: 白",
				get = GottaGoFast.GetIncreaseColor,
				set = GottaGoFast.SetIncreaseColor,
				hasAlpha = false,
			  },
			  DemoMode = {
				order = 19,
				type = "execute",
				name = "演示模式",
				desc = "顯示GottaGoFast外部秘境來演示 / 設置目的",
				func = GottaGoFast.ToggleDemoMode,
			  },
			},
		  },
		},
	  };
  elseif GetLocale() == 'zhCN' then
	  options = {
		name = "GottaGoFast",
		handler = GottaGoFast,
		type = "group",
		args = {
		  cms = {
			name = "挑战模式",
			type = "group",
			args = {
			  TrueTimer = {
				order = 1,
				type = "toggle",
				name = "精确计时",
				desc = "切换是否显示毫秒",
				get = GottaGoFast.GetTrueTimer,
				set = GottaGoFast.SetTrueTimer,
			  },
			  GoldTimer = {
				order = 2,
				type = "toggle",
				name = "金牌计时",
				desc = "切换是否显示金牌计时",
				get = GottaGoFast.GetGoldTimer,
				set = GottaGoFast.SetGoldTimer,
			  },
			  LevelInObjectives = {
				order = 3,
				type = "toggle",
				name = "挑战等级显示(目标)",
				desc = "在目标列表显示目前挑战等级",
				get = GottaGoFast.GetLevelInObjectives,
				set = GottaGoFast.SetLevelInObjectives,
			  },
			  AffixesInObjectives = {
				order = 4,
				type = "toggle",
				name = "词缀显示(目标)",
				desc = "在目标列表显示目前词缀",
				get = GottaGoFast.GetAffixesInObjectives,
				set = GottaGoFast.SetAffixesInObjectives,
			  },
			  LevelInTimer = {
				order = 5,
				type = "toggle",
				name = "挑战等级显示(计时)",
				desc = "在定时器开头显示目前挑战等级",
				get = GottaGoFast.GetLevelInTimer,
				set = GottaGoFast.SetLevelInTimer,
			  },
			  IncreaseInObjectives = {
				order = 6,
				type = "toggle",
				name = "钥石升级显示(目标)",
				desc = "额外钥石计时分离",
				get = GottaGoFast.GetIncreaseInObjectives,
				set = GottaGoFast.SetIncreaseInObjectives,
			  },
			  ObjectiveCompleteInObjectives = {
				order = 7,
				type = "toggle",
				name = "挑战目标完成显示(目标)",
				desc = "显示我们已经完成的目标时间",
				get = GottaGoFast.GetObjectiveCompleteInObjectives,
				set = GottaGoFast.SetObjectiveCompleteInObjectives,
			  }
			}
		  },
		  display = {
			name = "显示",
			type = "group",
			args = {
			  unlocked = {
				order = 1,
				type = "toggle",
				name = "不锁定",
				desc = "切换定时器框架锁定状态",
				get = GottaGoFast.GetUnlocked,
				set = GottaGoFast.SetUnlocked,
			  },
			  ObjectiveCollapsed = {
				order = 2,
				type = "toggle",
				 name = "目标追踪器收起",
				desc = "收起目标追踪器当离开挑战模式/时光漫游",
				get = GottaGoFast.GetObjectiveCollapsed,
				set = GottaGoFast.SetObjectiveCollapsed,
			  },
			  TimerX = {
				order = 3,
				type = "range",
				name = "定时器水平位置",
				desc = "预设: 0",
				min = -100,
				max = 100,
				step = 1,
				get = GottaGoFast.GetTimerX,
				set = GottaGoFast.SetTimerX,
			  },
			  TimerY = {
				order = 4,
				type = "range",
				name = "定时器垂直位置",
				desc = "预设: 0",
				min = -100,
				max = 100,
				step = 1,
				get = GottaGoFast.GetTimerY,
				set = GottaGoFast.SetTimerY,
			  },
			  TimerFontSize = {
				order = 7,
				type = "range",
				 name = "定时器文字大小",
				desc = "预设: 29",
				min = 8,
				max = 32,
				step = 1,
				get = GottaGoFast.GetTimerFontSize,
				set = GottaGoFast.SetTimerFontSize,
			  },
			  TimerFontFlag = {
				order = 9,
				type = "select",
				name = "计时文字样式",
				desc = "预设: 描边",
				values = {["OUTLINE"] = "描边", ["THICKOUTLINE"] = "粗描边", ["MONOCHROME"] = "无消除锯齿", ["NONE"] = "无"},
				get = GottaGoFast.GetTimerFontFlag,
				set = GottaGoFast.SetTimerFontFlag,
			  },
			  ObjectiveX = {
				order = 5,
				type = "range",
				name = "目标水平位置",
				desc = "预设: 0",
				min = -100,
				max = 100,
				step = 1,
				get = GottaGoFast.GetObjectiveX,
				set = GottaGoFast.SetObjectiveX,
			  },
			  ObjectiveY = {
				order = 6,
				type = "range",
				name = "目标垂直位置",
				desc = "预设: -40",
				min = -100,
				max = 100,
				step = 1,
				get = GottaGoFast.GetObjectiveY,
				set = GottaGoFast.SetObjectiveY,
			  },
			  ObjectiveFontSize = {
				order = 8,
				type = "range",
				name = "目标文字大小",
				desc = "预设: 21",
				min = 8,
				max = 32,
				step = 1,
				get = GottaGoFast.GetObjectiveFontSize,
				set = GottaGoFast.SetObjectiveFontSize,
			  },
			  ObjectiveFontFlag = {
				order = 10,
				type = "select",
				name = "目标文字样式",
				desc = "预设: 描边",
				values = {["OUTLINE"] = "描边", ["THICKOUTLINE"] = "粗描边", ["MONOCHROME"] = "无消除锯齿", ["NONE"] = "无"},
				get = GottaGoFast.GetObjectiveFontFlag,
				set = GottaGoFast.SetObjectiveFontFlag,
			  },
			  TimerAlign = {
				order = 11,
				type = "select",
				name = "计时对齐",
				desc = "预设: 中央",
				values = {["LEFT"] = "左", ["CENTER"] = "中央", ["RIGHT"] = "右"},
				get = GottaGoFast.GetTimerAlign,
				set = GottaGoFast.SetTimerAlign,
			  },
			  ObjectiveAlign = {
				order = 12,
				type = "select",
				name = "目标对齐",
				desc = "预设: LEFT",
				values = {["LEFT"] = "左", ["CENTER"] = "中央", ["RIGHT"] = "右"},
				get = GottaGoFast.GetObjectiveAlign,
				set = GottaGoFast.SetObjectiveAlign,
			  },
			  TimerFont = {
				order = 13,
				type = "select",
				dialogControl = "LSM30_Font",
				name = "计时文字",
				desc = "预设: Arial, Monospaced Fonts like MyriadCondensedWeb are recommended",
				values = GottaGoFast.LSM:HashTable("font"),
				get = GottaGoFast.GetTimerFont,
				set = GottaGoFast.SetTimerFont,
			  },
			  ObjectiveFont = {
				order = 14,
				type = "select",
				dialogControl = "LSM30_Font",
				name = "目标文字",
				desc = "预设: Arial, Monospaced Fonts like MyriadCondensedWeb are recommended",
				values = GottaGoFast.LSM:HashTable("font"),
				get = GottaGoFast.GetObjectiveFont,
				set = GottaGoFast.SetObjectiveFont,
			  },
			  ObjectiveColor = {
				order = 15,
				type = "color",
				 name = "目标颜色",
				desc = "预设: 白",
				get = GottaGoFast.GetObjectiveColor,
				set = GottaGoFast.SetObjectiveColor,
				hasAlpha = false,
			  },
			  ObjectiveCompleteColor = {
				order = 16,
				type = "color",
				name = "目标完成颜色",
				desc = "预设: 绿",
				get = GottaGoFast.GetObjectiveCompleteColor,
				set = GottaGoFast.SetObjectiveCompleteColor,
				hasAlpha = false,
			  },
			  TimerColor = {
				order = 17,
				type = "color",
				name = "计时颜色",
				desc = "预设: 白",
				get = GottaGoFast.GetTimerColor,
				set = GottaGoFast.SetTimerColor,
				hasAlpha = false,
			  },
			  IncreaseColor = {
				order = 18,
				type = "color",
				name = "钥石升级颜色",
				desc = "预设: 白",
				get = GottaGoFast.GetIncreaseColor,
				set = GottaGoFast.SetIncreaseColor,
				hasAlpha = false,
			  },
			  DemoMode = {
				order = 19,
				type = "execute",
				name = "演示模式",
				desc = "显示GottaGoFast外部秘境来演示 / 设置目的",
				func = GottaGoFast.ToggleDemoMode,
			  },
			},
		  },
		},
	  };
  else
	  options = {
		name = "GottaGoFast",
		handler = GottaGoFast,
		type = "group",
		args = {
		  cms = {
			name = "Challenge Modes",
			type = "group",
			args = {
			  TrueTimer = {
				order = 1,
				type = "toggle",
				name = "True Timer",
				desc = "Toggles MS Precision",
				get = GottaGoFast.GetTrueTimer,
				set = GottaGoFast.SetTrueTimer,
			  },
			  GoldTimer = {
				order = 2,
				type = "toggle",
				name = "Gold Timer",
				desc = "Toggles Gold Timer",
				get = GottaGoFast.GetGoldTimer,
				set = GottaGoFast.SetGoldTimer,
			  },
			  LevelInObjectives = {
				order = 3,
				type = "toggle",
				name = "CM Level Display (Objectives)",
				desc = "Show the current CM Level in the objectives list",
				get = GottaGoFast.GetLevelInObjectives,
				set = GottaGoFast.SetLevelInObjectives,
			  },
			  AffixesInObjectives = {
				order = 4,
				type = "toggle",
				name = "Affix Display (Objectives)",
				desc = "Show the current Affixes in the objectives list",
				get = GottaGoFast.GetAffixesInObjectives,
				set = GottaGoFast.SetAffixesInObjectives,
			  },
			  LevelInTimer = {
				order = 5,
				type = "toggle",
				name = "CM Level Display (Timer)",
				desc = "Show the current CM Level at the start of the timer",
				get = GottaGoFast.GetLevelInTimer,
				set = GottaGoFast.SetLevelInTimer,
			  },
			  IncreaseInObjectives = {
				order = 6,
				type = "toggle",
				name = "Keystone Increase Display (Objectives)",
				desc = "Bonus Keystone Time Splits",
				get = GottaGoFast.GetIncreaseInObjectives,
				set = GottaGoFast.SetIncreaseInObjectives,
			  },
			  ObjectiveCompleteInObjectives = {
				order = 7,
				type = "toggle",
				name = "CM Objective Complete Display (Objectives)",
				desc = "Show the time objectives we're completed at",
				get = GottaGoFast.GetObjectiveCompleteInObjectives,
				set = GottaGoFast.SetObjectiveCompleteInObjectives,
			  }
			}
		  },
		  display = {
			name = "Display",
			type = "group",
			args = {
			  unlocked = {
				order = 1,
				type = "toggle",
				name = "Unlocked",
				desc = "Toggles Unlock State Of Timer Frame",
				get = GottaGoFast.GetUnlocked,
				set = GottaGoFast.SetUnlocked,
			  },
			  ObjectiveCollapsed = {
				order = 2,
				type = "toggle",
				name = "Objective Tracker Collapse",
				desc = "Collapse Objective Tracker When Leaving CM / Timewalker",
				get = GottaGoFast.GetObjectiveCollapsed,
				set = GottaGoFast.SetObjectiveCollapsed,
			  },
			  TimerX = {
				order = 3,
				type = "range",
				name = "Timer X Offset",
				desc = "Default: 0",
				min = -100,
				max = 100,
				step = 1,
				get = GottaGoFast.GetTimerX,
				set = GottaGoFast.SetTimerX,
			  },
			  TimerY = {
				order = 4,
				type = "range",
				name = "Timer Y Offset",
				desc = "Default: 0",
				min = -100,
				max = 100,
				step = 1,
				get = GottaGoFast.GetTimerY,
				set = GottaGoFast.SetTimerY,
			  },
			  TimerFontSize = {
				order = 7,
				type = "range",
				name = "Timer Font Size",
				desc = "Default: 29",
				min = 8,
				max = 32,
				step = 1,
				get = GottaGoFast.GetTimerFontSize,
				set = GottaGoFast.SetTimerFontSize,
			  },
			  TimerFontFlag = {
				order = 9,
				type = "select",
				name = "Timer Font Flag",
				desc = "Default: OUTLINE",
				values = {["OUTLINE"] = "OUTLINE", ["THICKOUTLINE"] = "THICKOUTLINE", ["MONOCHROME"] = "MONOCHROME", ["NONE"] = "NONE"},
				get = GottaGoFast.GetTimerFontFlag,
				set = GottaGoFast.SetTimerFontFlag,
			  },
			  ObjectiveX = {
				order = 5,
				type = "range",
				name = "Objective X Offset",
				desc = "Default: 0",
				min = -100,
				max = 100,
				step = 1,
				get = GottaGoFast.GetObjectiveX,
				set = GottaGoFast.SetObjectiveX,
			  },
			  ObjectiveY = {
				order = 6,
				type = "range",
				name = "Objective Y Offset",
				desc = "Default: -40",
				min = -100,
				max = 100,
				step = 1,
				get = GottaGoFast.GetObjectiveY,
				set = GottaGoFast.SetObjectiveY,
			  },
			  ObjectiveFontSize = {
				order = 8,
				type = "range",
				name = "Objective Font Size",
				desc = "Default: 21",
				min = 8,
				max = 32,
				step = 1,
				get = GottaGoFast.GetObjectiveFontSize,
				set = GottaGoFast.SetObjectiveFontSize,
			  },
			  ObjectiveFontFlag = {
				order = 10,
				type = "select",
				name = "Objective Font Flag",
				desc = "Default: OUTLINE",
				values = {["OUTLINE"] = "OUTLINE", ["THICKOUTLINE"] = "THICKOUTLINE", ["MONOCHROME"] = "MONOCHROME", ["NONE"] = nil},
				get = GottaGoFast.GetObjectiveFontFlag,
				set = GottaGoFast.SetObjectiveFontFlag,
			  },
			  TimerAlign = {
				order = 11,
				type = "select",
				name = "Timer Align",
				desc = "Default: CENTER",
				values = {["LEFT"] = "LEFT", ["CENTER"] = "CENTER", ["RIGHT"] = "RIGHT"},
				get = GottaGoFast.GetTimerAlign,
				set = GottaGoFast.SetTimerAlign,
			  },
			  ObjectiveAlign = {
				order = 12,
				type = "select",
				name = "Objective Align",
				desc = "Default: LEFT",
				values = {["LEFT"] = "LEFT", ["CENTER"] = "CENTER", ["RIGHT"] = "RIGHT"},
				get = GottaGoFast.GetObjectiveAlign,
				set = GottaGoFast.SetObjectiveAlign,
			  },
			  TimerFont = {
				order = 13,
				type = "select",
				dialogControl = "LSM30_Font",
				name = "Timer Font",
				desc = "Default: Arial, Monospaced Fonts like MyriadCondensedWeb are recommended",
				values = GottaGoFast.LSM:HashTable("font"),
				get = GottaGoFast.GetTimerFont,
				set = GottaGoFast.SetTimerFont,
			  },
			  ObjectiveFont = {
				order = 14,
				type = "select",
				dialogControl = "LSM30_Font",
				name = "Objective Font",
				desc = "Default: Arial, Monospaced Fonts like MyriadCondensedWeb are recommended",
				values = GottaGoFast.LSM:HashTable("font"),
				get = GottaGoFast.GetObjectiveFont,
				set = GottaGoFast.SetObjectiveFont,
			  },
			  ObjectiveColor = {
				order = 15,
				type = "color",
				name = "Objective Color",
				desc = "Default: White",
				get = GottaGoFast.GetObjectiveColor,
				set = GottaGoFast.SetObjectiveColor,
				hasAlpha = false,
			  },
			  ObjectiveCompleteColor = {
				order = 16,
				type = "color",
				name = "Objective Complete Color",
				desc = "Default: Green",
				get = GottaGoFast.GetObjectiveCompleteColor,
				set = GottaGoFast.SetObjectiveCompleteColor,
				hasAlpha = false,
			  },
			  TimerColor = {
				order = 17,
				type = "color",
				name = "Timer Color",
				desc = "Default: White",
				get = GottaGoFast.GetTimerColor,
				set = GottaGoFast.SetTimerColor,
				hasAlpha = false,
			  },
			  IncreaseColor = {
				order = 18,
				type = "color",
				name = "Keystone Increase Color",
				desc = "Default: White",
				get = GottaGoFast.GetIncreaseColor,
				set = GottaGoFast.SetIncreaseColor,
				hasAlpha = false,
			  },
			  DemoMode = {
				order = 19,
				type = "execute",
				name = "Demo Mode",
				desc = "Shows GottaGoFast Outside CM For Demo / Setup Purposes",
				func = GottaGoFast.ToggleDemoMode,
			  },
			},
		  },
		},
	  };
  end
  GottaGoFast.db = LibStub("AceDB-3.0"):New("GottaGoFastDB", defaults, true);
  LibStub("AceConfig-3.0"):RegisterOptionsTable("GottaGoFast", options);
  GottaGoFast.optionsFrame = LibStub("AceConfigDialog-3.0"):AddToBlizOptions("GottaGoFast", "GottaGoFast");
end
