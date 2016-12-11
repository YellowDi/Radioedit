--------------------------
-- Version: 7.0.3 r804
-- Title: DejaCharacterStats
-- Authors: Dejablue 
-- Modify by eui.cc
--------------------------
local E, L = unpack(ElvUI)

----------------------------
-- DCS Functions & Arrays --
----------------------------

function PaperDollFrame_UpdateStats()
	local level = UnitLevel("player");
	local categoryYOffset = -5;
	local statYOffset = 0;

	PaperDollFrame_SetItemLevel(CharacterStatsPane.ItemLevelFrame, "player");
	CharacterStatsPane.ItemLevelFrame.Value:SetTextColor(GetItemLevelColor());
	CharacterStatsPane.ItemLevelCategory:Show();
	CharacterStatsPane.ItemLevelFrame:Show();
	CharacterStatsPane.AttributesCategory:SetPoint("TOP", 0, -76);

	local spec = GetSpecialization();
	local role = GetSpecializationRole(spec);

	CharacterStatsPane.statsFramePool:ReleaseAll();
	-- we need a stat frame to first do the math to know if we need to show the stat frame
	-- so effectively we'll always pre-allocate
	local statFrame = CharacterStatsPane.statsFramePool:Acquire();

	local lastAnchor;

	for catIndex = 1, #PAPERDOLL_STATCATEGORIES do
		local catFrame = CharacterStatsPane[PAPERDOLL_STATCATEGORIES[catIndex].categoryFrame];
		local numStatInCat = 0;
		for statIndex = 1, #PAPERDOLL_STATCATEGORIES[catIndex].stats do
			local stat = PAPERDOLL_STATCATEGORIES[catIndex].stats[statIndex];
			local showStat = true;
			if ( showStat and stat.primary ) then
				local primaryStat = select(7, GetSpecializationInfo(spec, nil, nil, nil, UnitSex("player")));
				if ( stat.primary ~= primaryStat ) then
					showStat = false;
				end
			end
			if ( showStat and stat.roles ) then
				local foundRole = false;
				for _, statRole in pairs(stat.roles) do
					if ( role == statRole ) then
						foundRole = true;
						break;
					end
				end
				showStat = foundRole;
			end
			if ( showStat ) then
				statFrame.onEnterFunc = nil;
				if stat.stat then
					PAPERDOLL_STATINFO[stat.stat].updateFunc(statFrame, "player");
				end
				if ( not stat.hideAt or stat.hideAt ~= statFrame.numericValue ) then
					if ( numStatInCat == 0 ) then
						if ( lastAnchor ) then
							catFrame:SetPoint("TOP", lastAnchor, "BOTTOM", 0, categoryYOffset);
						end
						lastAnchor = catFrame;
						statFrame:SetPoint("TOP", catFrame, "BOTTOM", 0, -2);
					else
						statFrame:SetPoint("TOP", lastAnchor, "BOTTOM", 0, statYOffset);
					end
					if statFrame:IsShown() then
						numStatInCat = numStatInCat + 1;
						statFrame.Background:SetShown((numStatInCat % 2) == 0);
						lastAnchor = statFrame;
					end
					-- done with this stat frame, get the next one
					statFrame = CharacterStatsPane.statsFramePool:Acquire();
				end
			end
		end
		catFrame:SetShown(numStatInCat > 0);
	end
	-- release the current stat frame
	CharacterStatsPane.statsFramePool:Release(statFrame);
end

PAPERDOLL_STATINFO = {

	-- General
	["HEALTH"] = {
		updateFunc = function(statFrame, unit) PaperDollFrame_SetHealth(statFrame, unit); end
	},
	["POWER"] = {
		updateFunc = function(statFrame, unit) PaperDollFrame_SetPower(statFrame, unit); end
	},
	["ALTERNATEMANA"] = {
		-- Only appears for Druids when in shapeshift form
		updateFunc = function(statFrame, unit) PaperDollFrame_SetAlternateMana(statFrame, unit); end
	},
	["ITEMLEVEL"] = {
		updateFunc = function(statFrame, unit) PaperDollFrame_SetItemLevel(statFrame, unit); end
	},
	["MOVESPEED"] = {
		updateFunc = function(statFrame, unit) PaperDollFrame_SetMovementSpeed(statFrame, unit); end
	},

	-- Base stats
	["STRENGTH"] = {
		updateFunc = function(statFrame, unit) PaperDollFrame_SetStat(statFrame, unit, LE_UNIT_STAT_STRENGTH); end
	},
	["AGILITY"] = {
		updateFunc = function(statFrame, unit) PaperDollFrame_SetStat(statFrame, unit, LE_UNIT_STAT_AGILITY); end
	},
	["INTELLECT"] = {
		updateFunc = function(statFrame, unit) PaperDollFrame_SetStat(statFrame, unit, LE_UNIT_STAT_INTELLECT); end
	},
	["STAMINA"] = {
		updateFunc = function(statFrame, unit) PaperDollFrame_SetStat(statFrame, unit, LE_UNIT_STAT_STAMINA); end
	},

	-- Enhancements
	["CRITCHANCE"] = {
		updateFunc = function(statFrame, unit) PaperDollFrame_SetCritChance(statFrame, unit); end
	},
	["HASTE"] = {
		updateFunc = function(statFrame, unit) PaperDollFrame_SetHaste(statFrame, unit); end
	},
	["MASTERY"] = {
		updateFunc = function(statFrame, unit) PaperDollFrame_SetMastery(statFrame, unit); end
	},
	["VERSATILITY"] = {
		updateFunc = function(statFrame, unit) PaperDollFrame_SetVersatility(statFrame, unit); end
	},
	["LIFESTEAL"] = {
		updateFunc = function(statFrame, unit) PaperDollFrame_SetLifesteal(statFrame, unit); end
	},
	["AVOIDANCE"] = {
		updateFunc = function(statFrame, unit) PaperDollFrame_SetAvoidance(statFrame, unit); end
	},

	-- Attack
	["ATTACK_DAMAGE"] = {
		updateFunc = function(statFrame, unit) PaperDollFrame_SetDamage(statFrame, unit); end
	},
	["ATTACK_AP"] = {
		updateFunc = function(statFrame, unit) PaperDollFrame_SetAttackPower(statFrame, unit); end
	},
	["ATTACK_ATTACKSPEED"] = {
		updateFunc = function(statFrame, unit) PaperDollFrame_SetAttackSpeed(statFrame, unit); end
	},
	["ENERGY_REGEN"] = {
		updateFunc = function(statFrame, unit) PaperDollFrame_SetEnergyRegen(statFrame, unit); end
	},
	["RUNE_REGEN"] = {
		updateFunc = function(statFrame, unit) PaperDollFrame_SetRuneRegen(statFrame, unit); end
	},
	["FOCUS_REGEN"] = {
		updateFunc = function(statFrame, unit) PaperDollFrame_SetFocusRegen(statFrame, unit); end
	},

	-- Spell
	["SPELLPOWER"] = {
		updateFunc = function(statFrame, unit) PaperDollFrame_SetSpellPower(statFrame, unit); end
	},
	["MANAREGEN"] = {
		updateFunc = function(statFrame, unit) PaperDollFrame_SetManaRegen(statFrame, unit); end
	},

	-- Defense
	["ARMOR"] = {
		updateFunc = function(statFrame, unit) PaperDollFrame_SetArmor(statFrame, unit); end
	},
	["DODGE"] = {
		updateFunc = function(statFrame, unit) PaperDollFrame_SetDodge(statFrame, unit); end
	},
	["PARRY"] = {
		updateFunc = function(statFrame, unit) PaperDollFrame_SetParry(statFrame, unit); end
	},
	["BLOCK"] = {
		updateFunc = function(statFrame, unit) PaperDollFrame_SetBlock(statFrame, unit); end
	},
	
	-- Durability & Repair
	["DURABILITY"] = {
		updateFunc = function(statFrame, unit) PaperDollFrame_SetDurability(statFrame, unit); end
	},
	["REPAIRTOTAL"] = {
		updateFunc = function(statFrame, unit) PaperDollFrame_SetRepairTotal(statFrame, unit); end
	},
};

--------------------------
-- Show All Stats Array --
--------------------------
local PAPERDOLL_AttributesIndexDefaultStats = {"HEALTH", "POWER", "ARMOR", "STRENGTH", "AGILITY", "INTELLECT", "STAMINA", "ATTACK_DAMAGE", "ATTACK_AP", "ATTACK_ATTACKSPEED", "SPELLPOWER", "MANAREGEN", "ENERGY_REGEN", "RUNE_REGEN", "FOCUS_REGEN", "MOVESPEED", "DURABILITY", "REPAIRTOTAL"}
local PAPERDOLL_EnhancementsIndexDefaultStats = {"CRITCHANCE", "HASTE", "VERSATILITY", "MASTERY", "LIFESTEAL", "AVOIDANCE", "DODGE", "PARRY", "BLOCK"}
local PAPERDOLL_HideAT = {
	["MANAREGEN"] = true, 
	["ENERGY_REGEN"] = true, 
	["RUNE_REGEN"] = true, 
	["FOCUS_REGEN"] = true,
}

local function DCS_AllStats()
	if not E.db.euiscript.CharacterStats then return; end

	PAPERDOLL_STATCATEGORIES = nil

	PAPERDOLL_STATCATEGORIES= {
		[1] = {
			categoryFrame = "AttributesCategory",
			stats = {
			},
		},
		[2] = {
			categoryFrame = "EnhancementsCategory",
			stats = {
			},
		},
	}
	
	for i = 1, #PAPERDOLL_AttributesIndexDefaultStats do
		local value = PAPERDOLL_AttributesIndexDefaultStats[i]
		if E.db.euiscript.CharacterStatsList[value] then
			if PAPERDOLL_HideAT[value] then
				table.insert(PAPERDOLL_STATCATEGORIES[1].stats, { stat = value, hideAt = 0 })
			else
				table.insert(PAPERDOLL_STATCATEGORIES[1].stats, { stat = value})
			end
		end
	end
	for i = 1, #PAPERDOLL_EnhancementsIndexDefaultStats do
		if E.db.euiscript.CharacterStatsList[PAPERDOLL_EnhancementsIndexDefaultStats[i]] then
			table.insert(PAPERDOLL_STATCATEGORIES[2].stats, { stat = PAPERDOLL_EnhancementsIndexDefaultStats[i] })
		end
	end

	PaperDollFrame_UpdateStats();
end

-- Attack Speed --
function PaperDollFrame_SetAttackSpeed(statFrame, unit)
	local meleeHaste = GetMeleeHaste();
	local speed, offhandSpeed = UnitAttackSpeed(unit);

	local displaySpeed = format("%.2f", speed);
	if ( offhandSpeed ) then
		offhandSpeed = format("%.2f", offhandSpeed);
	end
	if ( offhandSpeed ) then
		displaySpeedxt =  BreakUpLargeNumbers(displaySpeed).." / ".. offhandSpeed;
	else
		displaySpeedxt =  BreakUpLargeNumbers(displaySpeed);
	end
	PaperDollFrame_SetLabelAndText(statFrame, WEAPON_SPEED, displaySpeed, false, speed);

	statFrame.tooltip = HIGHLIGHT_FONT_COLOR_CODE..format(PAPERDOLLFRAME_TOOLTIP_FORMAT, ATTACK_SPEED).." "..displaySpeed..FONT_COLOR_CODE_CLOSE;
	statFrame.tooltip2 = format(STAT_ATTACK_SPEED_BASE_TOOLTIP, BreakUpLargeNumbers(meleeHaste));
	
	statFrame:Show();
end

-- Movement Speed Mouseover --
function MovementSpeed_OnEnter(statFrame)
	GameTooltip:SetOwner(statFrame, "ANCHOR_RIGHT");
	GameTooltip:SetText(HIGHLIGHT_FONT_COLOR_CODE..format(PAPERDOLLFRAME_TOOLTIP_FORMAT, STAT_MOVEMENT_SPEED).." "..format("%d%%", statFrame.speed+0.5)..FONT_COLOR_CODE_CLOSE);

	GameTooltip:AddLine(format(STAT_MOVEMENT_GROUND_TOOLTIP, statFrame.runSpeed+0.5));
	if (statFrame.unit ~= "pet") then
		GameTooltip:AddLine(format(STAT_MOVEMENT_FLIGHT_TOOLTIP, statFrame.flightSpeed+0.5));
	end
	GameTooltip:AddLine(format(STAT_MOVEMENT_SWIM_TOOLTIP, statFrame.swimSpeed+0.5));

	GameTooltip:Show();
end

-- Movement Speed --
function PaperDollFrame_SetMovementSpeed(statFrame, unit)
	statFrame.wasSwimming = nil;
	statFrame.unit = unit;
	MovementSpeed_OnUpdate(statFrame);
	
	statFrame.onEnterFunc = MovementSpeed_OnEnter;
	-- TODO: Fix if we decide to show movement speed
	-- statFrame:SetScript("OnUpdate", MovementSpeed_OnUpdate);

	statFrame:Show();
end

-- Energy Regen --
function PaperDollFrame_SetEnergyRegen(statFrame, unit)
	if ( unit ~= "player" ) then
		statFrame:Hide();
		return;
	end
	
	local powerType, powerToken = UnitPowerType(unit);
	if (powerToken ~= "ENERGY") then
		PaperDollFrame_SetLabelAndText(statFrame, STAT_ENERGY_REGEN, NOT_APPLICABLE, false, 0);
		statFrame.tooltip = nil;
		statFrame:Hide();
		return;
	end
	
	local regenRate = GetPowerRegen();
	local regenRateText = BreakUpLargeNumbers(regenRate);
	PaperDollFrame_SetLabelAndText(statFrame, STAT_ENERGY_REGEN, regenRateText, false, regenRate);
	statFrame.tooltip = HIGHLIGHT_FONT_COLOR_CODE..format(PAPERDOLLFRAME_TOOLTIP_FORMAT, STAT_ENERGY_REGEN).." "..regenRateText..FONT_COLOR_CODE_CLOSE;
	statFrame.tooltip2 = STAT_ENERGY_REGEN_TOOLTIP;
	statFrame:Show();
end

-- Focus Regen --
function PaperDollFrame_SetFocusRegen(statFrame, unit)
	if ( unit ~= "player" ) then
		statFrame:Hide();
		return;
	end
	
	local powerType, powerToken = UnitPowerType(unit);
	if (powerToken ~= "FOCUS") then
		PaperDollFrame_SetLabelAndText(statFrame, STAT_FOCUS_REGEN, NOT_APPLICABLE, false, 0);
		statFrame.tooltip = nil;
		statFrame:Hide();
		return;
	end
	
	local regenRate = GetPowerRegen();
	local regenRateText = BreakUpLargeNumbers(regenRate);
	PaperDollFrame_SetLabelAndText(statFrame, STAT_FOCUS_REGEN, regenRateText, false, regenRate);
	statFrame.tooltip = HIGHLIGHT_FONT_COLOR_CODE..format(PAPERDOLLFRAME_TOOLTIP_FORMAT, STAT_FOCUS_REGEN).." "..regenRateText..FONT_COLOR_CODE_CLOSE;
	statFrame.tooltip2 = STAT_FOCUS_REGEN_TOOLTIP;
	statFrame:Show();
end

-- Rune Speed --
function PaperDollFrame_SetRuneRegen(statFrame, unit)
	if ( unit ~= "player" ) then
		statFrame:Hide();
		return;
	end
	
	local _, class = UnitClass(unit);
	if (class ~= "DEATHKNIGHT") then
		PaperDollFrame_SetLabelAndText(statFrame, STAT_RUNE_REGEN, NOT_APPLICABLE, false, 0);
		statFrame.tooltip = nil;
		statFrame:Hide();
		return;
	end
	
	local _, regenRate = GetRuneCooldown(1); -- Assuming they are all the same for now
	local regenRateText = (format(STAT_RUNE_REGEN_FORMAT, regenRate));
	PaperDollFrame_SetLabelAndText(statFrame, STAT_RUNE_REGEN, regenRateText, false, regenRate);
	statFrame.tooltip = HIGHLIGHT_FONT_COLOR_CODE..format(PAPERDOLLFRAME_TOOLTIP_FORMAT, STAT_RUNE_REGEN).." "..regenRateText..FONT_COLOR_CODE_CLOSE;
	statFrame.tooltip2 = STAT_RUNE_REGEN_TOOLTIP;
	statFrame:Show();
end

--DCSScrollframe.lua
-- Scroll Frame	
-- Scrollframe Parent Frame
	local DCS_ScrollframeParentFrame = CreateFrame("Frame", "DCS_ScrollframeParentFrame", CharacterFrameInsetRight)
		DCS_ScrollframeParentFrame:SetSize(198, 352)
		DCS_ScrollframeParentFrame:SetPoint("TOP", CharacterFrameInsetRight, "TOP", 0, -4)

 -- Scrollframe 
	local DCS_ScrollFrame = CreateFrame("ScrollFrame", nil, DCS_ScrollframeParentFrame)
		DCS_ScrollFrame:SetPoint("TOP")
		DCS_ScrollFrame:SetSize(DCS_ScrollframeParentFrame:GetSize())

-- DCS_Scrollbar 
	local DCS_Scrollbar = CreateFrame("Slider", nil, DCS_ScrollFrame, "UIPanelScrollBarTemplate") 
		DCS_Scrollbar:SetPoint("TOPLEFT", CharacterFrameInsetRight, "TOPRIGHT", -18, -20) 
		DCS_Scrollbar:SetPoint("BOTTOMLEFT", CharacterFrameInsetRight, "BOTTOMRIGHT", -18, 18) 
		DCS_Scrollbar:SetValueStep(1) 
		DCS_Scrollbar.scrollStep = 1
		DCS_Scrollbar:SetValue(0) 
		DCS_Scrollbar:SetWidth(16) 
		DCS_Scrollbar:Hide()
		DCS_Scrollbar:SetMinMaxValues(0, 128)
	
	DCS_Scrollbar:SetScript("OnValueChanged", function (self, value) 
		DCS_Scrollbar:SetMinMaxValues(0, 128)
		self:GetParent():SetVerticalScroll(value) 
	end) 

 
-- DCS_ScrollChild Frame
	local DCS_ScrollChild = CreateFrame("Frame", nil, DCS_ScrollFrame)
		DCS_ScrollChild:SetSize(DCS_ScrollFrame:GetSize())
		DCS_ScrollFrame:SetScrollChild(DCS_ScrollChild)

	CharacterStatsPane:ClearAllPoints()
	CharacterStatsPane:SetParent(DCS_ScrollChild)
	CharacterStatsPane:SetSize(DCS_ScrollChild:GetSize())
	CharacterStatsPane:SetPoint("TOP", DCS_ScrollChild, "TOP", 0, 0) 

	CharacterStatsPane.ClassBackground:ClearAllPoints()
	CharacterStatsPane.ClassBackground:SetParent(CharacterFrameInsetRight)
	CharacterStatsPane.ClassBackground:SetPoint("CENTER")
	
-- Enable mousewheel scrolling
	DCS_ScrollFrame:EnableMouseWheel(true)
	DCS_ScrollFrame:SetScript("OnMouseWheel", function(self, delta)
		local cur_val = DCS_Scrollbar:GetValue()
		local min_val, max_val = DCS_Scrollbar:GetMinMaxValues()

		if delta < 0 and cur_val < max_val then
			if IsShiftKeyDown() then
				DCS_Scrollbar:SetValue(128)
			else
				cur_val = math.min(max_val, cur_val + 22)
				DCS_Scrollbar:SetValue(cur_val)
			end
		elseif delta > 0 and cur_val > min_val then
			if IsShiftKeyDown() then
				DCS_Scrollbar:SetValue(0)
			else
				cur_val = math.max(min_val, cur_val - 22)
				DCS_Scrollbar:SetValue(cur_val)
			end
		end
	end)
	
-- DejaCharacterStats
  
	CharacterStatsPane.ItemLevelCategory:Hide()
	CharacterStatsPane.ItemLevelCategory.Title:Hide()
	CharacterStatsPane.ItemLevelCategory.Background:Hide()

	CharacterStatsPane.ItemLevelFrame:ClearAllPoints()
	CharacterStatsPane.ItemLevelFrame:SetWidth(186)
	CharacterStatsPane.ItemLevelFrame:SetHeight(28)
	CharacterStatsPane.ItemLevelFrame:SetPoint(
		"TOP", CharacterStatsPane, "TOP", 0, -8)

	CharacterStatsPane.ItemLevelFrame.Background:ClearAllPoints()
	CharacterStatsPane.ItemLevelFrame.Background:SetWidth(186)
	CharacterStatsPane.ItemLevelFrame.Background:SetHeight(28)
	CharacterStatsPane.ItemLevelFrame.Background:SetPoint(
		"CENTER", CharacterStatsPane.ItemLevelFrame, "CENTER", 0, 0)

	CharacterStatsPane.ItemLevelFrame.Value:SetFont(
		"Fonts\\ARHei.TTF", 22, "THINOUTLINE")

	hooksecurefunc(CharacterStatsPane.AttributesCategory,"SetPoint",function(self,_,_,_,_,_,flag)
		if flag~="CharacterStatsPane" then
			self:ClearAllPoints()
			self:SetWidth(186)
			self:SetHeight(28)
			self:SetPoint(
				"TOP", CharacterStatsPane.ItemLevelFrame, "BOTTOM", 0, -2, "CharacterStatsPane")
			-- Reset DCS_Scrollbar when the CharacterStatsPane is closed and reopened.
		--	DCS_Scrollbar:SetValue(0) --会导致属性自动滚到顶 by eui.cc
		end
	end)

	hooksecurefunc(CharacterStatsPane.AttributesCategory.Background,"SetPoint",function(self,_,_,_,_,_,flag)
		if flag~="CharacterStatsPane" then
			self:ClearAllPoints()
			self:SetPoint(
				"CENTER", CharacterStatsPane.AttributesCategory, "CENTER", 0, 2, "CharacterStatsPane")
		end
	end)
	
	CharacterStatsPane.AttributesCategory.Background:SetWidth(186)
	CharacterStatsPane.AttributesCategory.Background:SetHeight(28)
		
	CharacterStatsPane.EnhancementsCategory:SetWidth(186)
	CharacterStatsPane.EnhancementsCategory:SetHeight(28)

	CharacterStatsPane.EnhancementsCategory.Background:SetWidth(186)
	CharacterStatsPane.EnhancementsCategory.Background:SetHeight(28)
	
	PaperDollSidebarTab1:HookScript("OnShow", function(self,event) 
		DCS_ScrollframeParentFrame:Show()
	end)

	PaperDollSidebarTab1:HookScript("OnClick", function(self,event) 
		DCS_ScrollframeParentFrame:Show()
	end)
	
	PaperDollSidebarTab2:HookScript("OnClick", function(self,event) 
		DCS_ScrollframeParentFrame:Hide()
	end)

	PaperDollSidebarTab3:HookScript("OnClick", function(self,event) 
		DCS_ScrollframeParentFrame:Hide()
	end)

---DCSDuraRepair.lua
-- ---------------------------
-- -- DCS Durability Frames --
-- ---------------------------

local DCSITEM_SLOT_FRAMES = {
	CharacterHeadSlot,CharacterShoulderSlot,CharacterChestSlot,CharacterWristSlot,CharacterSecondaryHandSlot,
	CharacterHandsSlot,CharacterWaistSlot,CharacterLegsSlot,CharacterFeetSlot,CharacterMainHandSlot,
}

local DCSITEM_SLOT_FRAMES_RIGHT = {
	CharacterHeadSlot,CharacterShoulderSlot,CharacterChestSlot,CharacterWristSlot,CharacterSecondaryHandSlot,
}

local DCSITEM_SLOT_FRAMES_LEFT = {
	CharacterHandsSlot,CharacterWaistSlot,CharacterLegsSlot,CharacterFeetSlot,CharacterMainHandSlot,
}

local duraMean
local duraTotal
local duraMaxTotal

---------------------------------
-- Durability Mean Calculation --
---------------------------------
local function DCS_Mean_DurabilityCalc()
	duraMean = 0
	duraTotal = 0
	duraMaxTotal = 0
	for k, v in ipairs(DCSITEM_SLOT_FRAMES) do
		local slotId = v:GetID()
		local durCur, durMax = GetInventoryItemDurability(slotId)
		-- --------------------------
		-- -- Mean Durability Calc --
		-- --------------------------
		if durCur == nil then durCur = 0 end
		if durMax == nil then durMax = 0 end
		if duraTotal == nil then duraTotal = 0 end
		if duraMaxTotal == nil then duraMaxTotal = 0 end
		if duraMean == nil then duraMean = 0 end
		
		duraTotal = duraTotal + durCur
		duraMaxTotal = duraMaxTotal + durMax
		if duraMaxTotal == 0 then duraMaxTotal = 1 	end
		duraMean = ((duraTotal/duraMaxTotal)*100)
	end
end		

-----------------------
-- Durability "Stat" --
-----------------------
function PaperDollFrame_SetDurability(statFrame, unit)
	DCS_Mean_DurabilityCalc()

	if ( unit ~= "player" ) then
		statFrame:Hide();
		return;
	end

	local displayDura = format("%.2f%%", duraMean);

	PaperDollFrame_SetLabelAndText(statFrame, (L["Durability"]), displayDura, false, duraMean);
	statFrame.tooltip = HIGHLIGHT_FONT_COLOR_CODE..format(PAPERDOLLFRAME_TOOLTIP_FORMAT, format(L["Durability %s"], displayDura));
	statFrame.tooltip2 = (L["Average equipped item durability percentage."]);

	statFrame:Show();
end

-----------------------
-- Total Repair Cost --
-----------------------
local repairitemCostTotal
local function DCS_Item_RepairTotal()
	for k, v in ipairs(DCSITEM_SLOT_FRAMES) do
		local slotId = v:GetID()
		local scanTool = CreateFrame("GameTooltip")
			scanTool:ClearLines()
		local repairnewitemCost = select(3, scanTool:SetInventoryItem("player", slotId))
		if repairitemCostTotal == nil then
			repairitemCostTotal = 0
		end
		local repairTotal = repairitemCostTotal + repairnewitemCost
		repairitemCostTotal = repairTotal
		--print(repairitemCostTotal)
	end
end

-------------------------
-- Repair Total "Stat" --
-------------------------
function PaperDollFrame_SetRepairTotal(statFrame, unit)
	if ( unit ~= "player" ) then
		statFrame:Hide();
		return;
	end
	DCS_Item_RepairTotal()
	local gold = floor(abs(repairitemCostTotal / 10000))
	local silver = floor(abs(mod(repairitemCostTotal / 100, 100)))
	local copper = floor(abs(mod(repairitemCostTotal, 100)))
	--print(format("I have %d gold %d silver %d copper.", gold, silver, copper))

	local displayRepairTotal = format("%dg %ds %dc", gold, silver, copper);

	--STAT_FORMAT
	-- PaperDollFrame_SetLabelAndText(statFrame, label, text, isPercentage, numericValue) -- Formatting

	PaperDollFrame_SetLabelAndText(statFrame, (L["Repair Total"]), displayRepairTotal, false, repairitemCostTotal);
	statFrame.tooltip = HIGHLIGHT_FONT_COLOR_CODE..format(PAPERDOLLFRAME_TOOLTIP_FORMAT, format(L["Repair Total %s"], displayRepairTotal));
	statFrame.tooltip2 = (L["Total equipped item repair cost before discounts."]);

	statFrame:Show();
	repairitemCostTotal = 0
end


--EUI Interface
function E:ToggleCharacterStats(toggle)
	if toggle then
		DCS_AllStats()	
	else
		E:StaticPopup_Show("CONFIG_RL");
	end
end