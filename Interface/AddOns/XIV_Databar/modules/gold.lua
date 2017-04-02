local AddOnName, XIVBar = ...;
local _G = _G;
local xb = XIVBar;
local L = XIVBar.L;

local GoldModule = xb:NewModule("GoldModule", 'AceEvent-3.0')

function GoldModule:GetName()
  return BONUS_ROLL_REWARD_MONEY;
end

function GoldModule:OnInitialize()
  if xb.db.factionrealm[xb.constants.playerName] == nil then
    xb.db.factionrealm[xb.constants.playerName] = { currentMoney = 0 }
  end
  xb.db.factionrealm[xb.constants.playerName].sessionMoney = 0
end

function GoldModule:OnEnable()
  if self.goldFrame == nil then
    self.goldFrame = CreateFrame("FRAME", nil, xb:GetFrame('bar'))
    xb:RegisterFrame('goldFrame', self.goldFrame)
  end
  self.goldFrame:Show()
  if xb.db.factionrealm[xb.constants.playerName].currentMoney == 0 then
    xb.db.factionrealm[xb.constants.playerName].currentMoney = GetMoney()
  end

  self:CreateFrames()
  self:RegisterFrameEvents()
  self:Refresh()
end

function GoldModule:OnDisable()
  self.goldFrame:Hide()
  self:UnregisterEvent('PLAYER_MONEY')
  self:UnregisterEvent('BAG_UPDATE')
end

function GoldModule:Refresh()
  local db = xb.db.profile
  if self.goldFrame == nil then return; end
  if not db.modules.gold.enabled then self:Disable(); return; end

  if InCombatLockdown() then
    self.goldText:SetFont(xb:GetFont(db.text.fontSize))
    self.goldText:SetText(self:FormatCoinText(GetMoney()))
    if db.modules.gold.showFreeBagSpace then
      local freeSpace = 0
      for i = 0, 4 do
        freeSpace = freeSpace + GetContainerNumFreeSlots(i)
      end
      self.bagText:SetFont(xb:GetFont(db.text.fontSize))
      self.bagText:SetText('('..tostring(freeSpace)..')')
    end
    return
  end

  local iconSize = db.text.fontSize + db.general.barPadding
  self.goldIcon:SetTexture(xb.constants.mediaPath..'datatexts\\gold')
  self.goldIcon:SetSize(iconSize, iconSize)
  self.goldIcon:SetPoint('LEFT')
  self.goldIcon:SetVertexColor(db.color.normal.r, db.color.normal.g, db.color.normal.b, db.color.normal.a)

  self.goldText:SetFont(xb:GetFont(db.text.fontSize))
  self.goldText:SetTextColor(db.color.inactive.r, db.color.inactive.g, db.color.inactive.b, db.color.inactive.a)
  self.goldText:SetText(self:FormatCoinText(GetMoney()))
  self.goldText:SetPoint('LEFT', self.goldIcon, 'RIGHT', 5, 0)

  local bagWidth = 0
  if db.modules.gold.showFreeBagSpace then
    local freeSpace = 0
    for i = 0, 4 do
      freeSpace = freeSpace + GetContainerNumFreeSlots(i)
    end
    self.bagText:SetFont(xb:GetFont(db.text.fontSize))
    self.bagText:SetTextColor(db.color.inactive.r, db.color.inactive.g, db.color.inactive.b, db.color.inactive.a)
    self.bagText:SetText('('..tostring(freeSpace)..')')
    self.bagText:SetPoint('LEFT', self.goldText, 'RIGHT', 5, 0)
    bagWidth = self.bagText:GetStringWidth()
  else
	self.bagText:SetFont(xb:GetFont(db.text.fontSize))
    self.bagText:SetText('')
    self.bagText:SetSize(0, 0)
  end

  self.goldButton:SetSize(self.goldText:GetStringWidth() + iconSize + 10 + bagWidth, iconSize)
  self.goldButton:SetPoint('LEFT')

  self.goldFrame:SetSize(self.goldButton:GetSize())

  local relativeAnchorPoint = 'LEFT'
  local xOffset = db.general.moduleSpacing
  local parentFrame = xb:GetFrame('travelFrame')
  if not xb.db.profile.modules.travel.enabled then
    parentFrame = self.goldFrame:GetParent()
    relativeAnchorPoint = 'RIGHT'
    xOffset = 0
  end
  self.goldFrame:SetPoint('RIGHT', parentFrame, relativeAnchorPoint, -(xOffset), 0)
end

function GoldModule:CreateFrames()
  self.goldButton = self.goldButton or CreateFrame("BUTTON", nil, self.goldFrame)
  self.goldIcon = self.goldIcon or self.goldButton:CreateTexture(nil, 'OVERLAY')
  self.goldText = self.goldText or self.goldButton:CreateFontString(nil, "OVERLAY")
  self.bagText = self.bagText or self.goldButton:CreateFontString(nil, "OVERLAY")
end

function GoldModule:RegisterFrameEvents()

  self.goldButton:EnableMouse(true)
  self.goldButton:RegisterForClicks("AnyUp")

  self:RegisterEvent('PLAYER_MONEY')
  self:RegisterEvent('BAG_UPDATE', 'Refresh')

  self.goldButton:SetScript('OnEnter', function()
    if InCombatLockdown() then return; end
    self.goldText:SetTextColor(unpack(xb:HoverColors()))
    self.bagText:SetTextColor(unpack(xb:HoverColors()))

    GameTooltip:SetOwner(GoldModule.goldFrame, 'ANCHOR_'..xb.miniTextPosition)
    GameTooltip:AddLine("[|cff6699FF"..BONUS_ROLL_REWARD_MONEY.."|r - |cff82c5ff"..xb.constants.playerFactionLocal.." "..xb.constants.playerRealm.."|r]")
    GameTooltip:AddLine(" ")

    GameTooltip:AddDoubleLine(L['Session Total'], GoldModule:FormatCoinText(xb.db.factionrealm[xb.constants.playerName].sessionMoney), 1, 1, 0, 1, 1, 1)
    GameTooltip:AddLine(" ")

    local totalGold = 0
    for charName, goldData in pairs(xb.db.factionrealm) do
      GameTooltip:AddDoubleLine(charName, GoldModule:FormatCoinText(goldData.currentMoney), 1, 1, 0, 1, 1, 1)
      totalGold = totalGold + goldData.currentMoney
    end
    GameTooltip:AddLine(" ")
    GameTooltip:AddDoubleLine(TOTAL, GoldModule:FormatCoinText(totalGold), 1, 1, 0, 1, 1, 1)
    GameTooltip:AddDoubleLine('<'..L['Left-Click']..'>', L['Toggle Bags'], 1, 1, 0, 1, 1, 1)
    GameTooltip:Show()
  end)

  self.goldButton:SetScript('OnLeave', function()
    if InCombatLockdown() then return; end
    local db = xb.db.profile
    self.goldText:SetTextColor(db.color.inactive.r, db.color.inactive.g, db.color.inactive.b, db.color.inactive.a)
    self.bagText:SetTextColor(db.color.inactive.r, db.color.inactive.g, db.color.inactive.b, db.color.inactive.a)
    GameTooltip:Hide()
  end)

  self.goldButton:SetScript('OnClick', function(_, button)
    if InCombatLockdown() then return; end
    ToggleAllBags()
  end)

  self:RegisterMessage('XIVBar_FrameHide', function(_, name)
    if name == 'travelFrame' then
      self:Refresh()
    end
  end)

  self:RegisterMessage('XIVBar_FrameShow', function(_, name)
    if name == 'travelFrame' then
      self:Refresh()
    end
  end)
end

function GoldModule:PLAYER_MONEY()
  local gdb = xb.db.factionrealm[xb.constants.playerName]
  local curMoney = gdb.currentMoney
  local tmpMoney = GetMoney()
  local moneyDiff = tmpMoney - curMoney
  gdb.sessionMoney = gdb.sessionMoney + moneyDiff

  --[[local weekday, month, day, year = CalendarGetDate()

  if gdb.curDay == nil or (gdb.curMonth == month and gdb.curDay < day) or (gdb.curMonth < month) or gdb.curYear < year then
    if gdb.curDay then
      gdb.
    end
  end]]--
  gdb.currentMoney = tmpMoney
  self:Refresh()
end

local function shortenNumber(num)
	if num < 1000 then
		return tostring(num)
	elseif num < 1000000 then
		return format("%.1f"..L['k'],num/1000)
	elseif num < 1000000000 then
		return format("%.2f"..L['M'],num/1000000)
	else
		return format("%.3f"..L['B'],num/1000000000)
	end
end

function GoldModule:FormatCoinText(money)
  local showSC = xb.db.profile.modules.gold.showSmallCoins
  if money == 0 then
	return showSC and string.format("%s"..GOLD_AMOUNT_SYMBOL.." %s"..SILVER_AMOUNT_SYMBOL.." %s"..COPPER_AMOUNT_SYMBOL,0,0,0) or money..GOLD_AMOUNT_SYMBOL
  end

  local shortThousands = xb.db.profile.modules.gold.shortThousands
  local g, s, c = self:SeparateCoins(money)

  if showSC then
	return (shortThousands and shortenNumber(g) or BreakUpLargeNumbers(g))..GOLD_AMOUNT_SYMBOL..' '..s..SILVER_AMOUNT_SYMBOL..' '..c..COPPER_AMOUNT_SYMBOL
  else
	return g > 0 and (shortThousands and shortenNumber(g)..GOLD_AMOUNT_SYMBOL) or BreakUpLargeNumbers(g)..GOLD_AMOUNT_SYMBOL
  end
end

function GoldModule:SeparateCoins(money)
  local gold, silver, copper = floor(abs(money / 10000)), floor(abs(mod(money / 100, 100))), floor(abs(mod(money, 100)))
  return gold, silver, copper
end

function GoldModule:GetDefaultOptions()
  return 'gold', {
      enabled = true,
      showSmallCoins = false,
      showFreeBagSpace = true,
      shortThousands = false
    }
end

function GoldModule:GetConfig()
  return {
    name = self:GetName(),
    type = "group",
    args = {
      enable = {
        name = ENABLE,
        order = 0,
        type = "toggle",
        get = function() return xb.db.profile.modules.gold.enabled; end,
        set = function(_, val)
          xb.db.profile.modules.gold.enabled = val
          if val then
            self:Enable()
          else
            self:Disable()
          end
        end,
        width = "full"
      },
      showSmallCoins = {
        name = L['Always Show Silver and Copper'],
        order = 1,
        type = "toggle",
        get = function() return xb.db.profile.modules.gold.showSmallCoins; end,
        set = function(_, val) xb.db.profile.modules.gold.showSmallCoins = val; self:Refresh(); end
      },
      showFreeBagSpace = {
        name = DISPLAY_FREE_BAG_SLOTS,
        order = 1,
        type = "toggle",
        get = function() return xb.db.profile.modules.gold.showFreeBagSpace; end,
        set = function(_, val) xb.db.profile.modules.gold.showFreeBagSpace = val; self:Refresh(); end
      },
      shortThousands = {
        name = L['Shorten Gold'],
        order = 1,
        type = "toggle",
        get = function() return xb.db.profile.modules.gold.shortThousands; end,
        set = function(_, val) xb.db.profile.modules.gold.shortThousands = val; self:Refresh(); end
      }
    }
  }
end
