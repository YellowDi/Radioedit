local A, C, M, L = select(2, ...):unpack()

if C.DataTexts.Talent then else return end

local TalentFrame = CreateFrame("Frame", nil, UIParent)
TalentFrame:SetSize(160, 50)
TalentFrame:SetPoint(unpack(C.DataTexts.TalentPoint))

local TalentText = TalentFrame:CreateFontString(nil, "OVERLAY")
TalentText:SetPoint("CENTER", TalentFrame)
TalentText:SetFontTemplate(C.Media.Font2, C.DataTexts.FontSize)
TalentText:SetTextColor(unpack(C.DataTexts.TextColor))

local CharacterSpec = ""
local LootSpec = ""

local LastSpec
local LOOT = LOOT

local function Update(self)
	LastSpec = self

	local SpecIndex = GetSpecialization()
	if not SpecIndex then 
		TalentText:SetText("N/A")
		return 
	end

	local Active = GetActiveSpecGroup()

	local Talent, Loot = "", ""
	local Specialization = GetSpecialization(false, false, Active)
	if Specialization then
		Specialization = select(4, GetSpecializationInfo(Specialization))
		if Specialization then
			Talent = format("|T%s:14:14:0:0:64:64:4:60:4:60|t", Specialization)
		end
	end

	local Specialization = GetLootSpecialization()
	if Specialization == 0 then
		local SpecIndex = GetSpecialization()

		if SpecIndex then
			local _, _, _, IconTexture = GetSpecializationInfo(SpecIndex)

			if IconTexture then
				Loot = format("|T%s:14:14:0:0:64:64:4:60:4:60|t", IconTexture)
			else
				Loot = "N/A"
			end
		else
			Loot = "N/A"
		end
	else
		local _, _, _, IconTexture = GetSpecializationInfoByID(Specialization)
		
		if IconTexture then
			Loot = format("|T%s:14:14:0:0:64:64:4:60:4:60|t", IconTexture)
		else
			Loot = "N/A"
		end
	end
	
	CharacterSpec = Talent
	LootSpec = Loot

	TalentText:SetFormattedText("|CFFFFFFFF%s|r: %s |CFFFFFFFF%s|r: %s", "Spec", Talent, LOOT, Loot)
end

TalentFrame:SetScript("OnEnter", function(self)
	if InCombatLockdown() then
		return
	end

	if (CharacterSpec == "" or LootSpec == "") then
		return
	end

	GameTooltip:SetOwner(self, "ANCHOR_CURSOR", 0, -4)
	GameTooltip:ClearLines()

	GameTooltip:AddLine(format(LOOT_SPECIALIZATION_DEFAULT, CharacterSpec))
	GameTooltip:AddLine(format(ERR_LOOT_SPEC_CHANGED_S, LootSpec))

	GameTooltip:Show()
end)

TalentFrame:SetScript("OnLeave", function() GameTooltip:Hide() end)

TalentFrame:SetScript("OnMouseDown", function()
	if not PlayerTalentFrame then
		LoadAddOn("Blizzard_TalentUI")
	end

	if not PlayerTalentFrame:IsShown() then
		ShowUIPanel(PlayerTalentFrame)
	else
		HideUIPanel(PlayerTalentFrame)
	end
end)

TalentFrame:RegisterEvent("ACTIVE_TALENT_GROUP_CHANGED")
TalentFrame:RegisterEvent("CONFIRM_TALENT_WIPE")
TalentFrame:RegisterEvent("PLAYER_TALENT_UPDATE")
TalentFrame:RegisterEvent("PLAYER_LOOT_SPEC_UPDATED")

TalentFrame:SetScript("OnEvent", Update)