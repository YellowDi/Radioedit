local A, C, M, L = select(2, ...):unpack()

local Fonts = CreateFrame("Frame")

local function SetFont(self, Font, FontSize, FontStyle, ShadowOffsetX, ShadowOffsetY, R, G, B)
    --local FontName, Size, FontStyle = self:GetFont()
	--print(Size, FontStyle)
	self:SetFont(Font, A.Scale(FontSize), FontStyle)
	
	if (ShadowOffsetX and ShadowOffsetY) then
        self:SetShadowColor(0, 0, 0, A.Scale(1))
	    self:SetShadowOffset(A.Scale(ShadowOffsetX), A.Scale(ShadowOffsetY))
	end

	if (R and G and B) then
	    self:SetTextColor(R, G, B)
	end
end

function Fonts:UpdateFonts()
    local Class = select(2, UnitClass("player"))
    local CustomClassColor = A.Colors.class[Class]
    local FONT = C.Media.Font
    local FONT2 = C.Media.Font2
	local NORMALSIZE = 13.1
	local SMALLSIZE = 12

	--NAMEPLATE_FONT     = FONT2
	UNIT_NAME_FONT     = FONT2
	STANDARD_TEXT_FONT = FONT2
	DAMAGE_TEXT_FONT   = FONT2
	
	--UIDROPDOWNMENU_DEFAULT_TEXT_HEIGHT = 12
	--CHAT_FONT_HEIGHTS = {8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18}

	SetFont(NumberFont_OutlineThick_Mono_Small, FONT, SMALLSIZE, "THINOUTLINE", 1, -1)
	SetFont(NumberFont_Outline_Huge,            FONT, 30, "THICKOUTLINE")
	SetFont(NumberFont_Outline_Large,           FONT, NORMALSIZE, "THINOUTLINE", 1, -1)
	SetFont(NumberFont_Outline_Med,             FONT, NORMALSIZE, "THINOUTLINE", 1, -1)
	SetFont(NumberFont_Shadow_Med,              FONT, NORMALSIZE)
	SetFont(NumberFont_Shadow_Small,            FONT, SMALLSIZE)

	SetFont(SystemFont_Large,                   FONT, NORMALSIZE)
	SetFont(SystemFont_Med1,                    FONT, SMALLSIZE)
	SetFont(SystemFont_Med3,                    FONT, NORMALSIZE)
	SetFont(SystemFont_OutlineThick_Huge2,      FONT, 22, "THICKOUTLINE")
	SetFont(SystemFont_Outline_Small,           FONT, SMALLSIZE, "THINOUTLINE", 1, -1)
	SetFont(SystemFont_Shadow_Large,            FONT, NORMALSIZE)
	SetFont(SystemFont_Shadow_Med1,             FONT, SMALLSIZE)
	SetFont(SystemFont_Shadow_Med3,             FONT, NORMALSIZE)
	SetFont(SystemFont_Shadow_Outline_Huge2,    FONT, 22, "THINOUTLINE", 1, -1)
	SetFont(SystemFont_Shadow_Small,            FONT, SMALLSIZE)
	SetFont(SystemFont_Small,                   FONT, SMALLSIZE)
	SetFont(SystemFont_Tiny,                    FONT, SMALLSIZE)
	SetFont(SystemFont_Shadow_Huge1,            FONT2, 20, "THINOUTLINE", 1, -1) -- Raid Warning, Boss Emote etc.

	--SetFont(QuestFont_Large,                    FONT, 14, "THINOUTLINE", 0.8, 0.8, 0.8)
	--SetFont(QuestFont,                          FONT, 12, "THINOUTLINE", 0.8, 0.8, 0.8)
	--SetFont(QuestInfoObjectivesHeader,          FONT, 12, "THINOUTLINE", 0.8, 0.8, 0.8)
	--SetFont(QuestInfoDescriptionText,           FONT, 12, "THINOUTLINE", 0.8, 0.8, 0.8)
	--SetFont(QuestInfoDescriptionHeader,         FONT, 16, "THINOUTLINE", 1.0, 0.82, 0)
	--SetFont(QuestInfoTitleHeader,               FONT, 16, "THINOUTLINE", 1.0, 0.82, 0)
	--SetFont(QuestInfoObjectivesText,            FONT, 12, "THINOUTLINE", 0.8, 0.8, 0.8)
	--SetFont(QuestInfoQuestType,                 FONT, 12, "THINOUTLINE", 1.0, 0.82, 0)

	--SetFont(QuestProgressRequiredItemsText,     FONT, 12, "THINOUTLINE", 0.8, 0.8, 0.8)
	--SetFont(QuestProgressText,                  FONT, 12, "THINOUTLINE", 0.8, 0.8, 0.8)
	--SetFont(QuestProgressTitleText,             FONT, 12, "THINOUTLINE", 0.8, 0.8, 0.8)
	--SetFont(AvailableQuestsText,                FONT, 12, "THINOUTLINE", 0.8, 0.8, 0.8)
	--SetFont(CurrentQuestsText,                  FONT, 12, "THINOUTLINE", 0.8, 0.8, 0.8)
	--SetFont(QuestInfoRewardText,                FONT, 12, "THINOUTLINE", 0.8, 0.8, 0.8)
	--SetFont(QuestInfoGroupSize,                 FONT, 12, "THINOUTLINE", 0.8, 0.8, 0.8)
	--SetFont(QuestProgressTitleText,             FONT, 12, "THINOUTLINE", 0.8, 0.8, 0.8)
	--SetFont(GreetingText,                       FONT, 12, "THINOUTLINE", 0.8, 0.8, 0.8)
    --SetFont(QuestInfoObjective1,                 FONT, 12, "THINOUTLINE", 0.8, 0.8, 0.8)
	
	--SetFont(QuestInfoRewardsFrame.Header,       FONT, 12, "THINOUTLINE", 0.8, 0.8, 0.8)
	--SetFont(QuestInfoRewardsFrame.XPFrame.ReceiveText,  FONT, 12, "THINOUTLINE", 0.8, 0.8, 0.8)
	--SetFont(QuestInfoRewardsFrame.PlayerTitleText,      FONT, 12, "THINOUTLINE", 0.8, 0.8, 0.8)
	--SetFont(QuestInfoRewardsFrame.ItemReceiveText,      FONT, 12, "THINOUTLINE", 0.8, 0.8, 0.8)
	--SetFont(QuestInfoSpellObjectiveLearnLabel,          FONT, 12, "THINOUTLINE", 0.8, 0.8, 0.8)

	SetFont(ZoneTextString,                     FONT2, 36, "THINOUTLINE", 2, -2)
	SetFont(SubZoneTextString,                  FONT2, 30, "THINOUTLINE", 2, -2)
	SetFont(PVPInfoTextString,                  FONT2, 28, "THINOUTLINE", 2, -2)
	SetFont(PVPArenaTextString,                 FONT2, 30, "THINOUTLINE", 2, -2)
	SetFont(WorldMapFrameAreaLabel,             FONT2, 36, "THINOUTLINE", 1, -1)
	SetFont(WorldMapFrameAreaPetLevels,         FONT2, 24, "THINOUTLINE", 1, -1)

	SetFont(GameTooltipHeader,                  FONT, NORMALSIZE, "THINOUTLINE", 1, -1)
	SetFont(Tooltip_Med,                        FONT, SMALLSIZE, "THINOUTLINE", 1, -1)
	SetFont(Tooltip_Small,                      FONT, SMALLSIZE, "THINOUTLINE", 1, -1)

	SetFont(FriendsFont_Large,                  FONT, 15, "THINOUTLINE", 1, -1)	
	SetFont(FriendsFont_Normal,                 FONT, SMALLSIZE, "THINOUTLINE", 1, -1)
	SetFont(FriendsFont_Small,                  FONT, SMALLSIZE, "THINOUTLINE", 1, -1)
	SetFont(FriendsFont_UserText,               FONT, SMALLSIZE, "THINOUTLINE", 1, -1)

	SetFont(NumberFontNormalSmall,              FONT, SMALLSIZE, "THINOUTLINE", 1, -1)
	SetFont(NumberFontNormal,                   FONT, NORMALSIZE, "THINOUTLINE", 1, -1)
	SetFont(NumberFontNormalLarge,              FONT, NORMALSIZE, "THINOUTLINE", 1, -1)
	SetFont(NumberFontNormalHuge,               FONT, 30, "THINOUTLINE", 1, -1)

	SetFont(GameFontHighlightSmall,             FONT, SMALLSIZE, "THINOUTLINE", 1, -1)
	SetFont(GameFontNormalSmall,                FONT, SMALLSIZE, "THINOUTLINE", 1, -1)
	SetFont(GameFontDisableSmall,               FONT, SMALLSIZE, "THINOUTLINE", 1, -1)
	SetFont(GameFontNormalHuge,                 FONT, 20, "THINOUTLINE", 1, -1)
	SetFont(GameFontNormalLarge,                FONT, NORMALSIZE, "THINOUTLINE", 1, -1)
	SetFont(GameFontHighlight,                  FONT, SMALLSIZE, "THINOUTLINE", 1, -1)
	SetFont(GameFontDisable,                    FONT, SMALLSIZE, "THINOUTLINE", 1, -1)
	SetFont(GameFontNormal,                     FONT, SMALLSIZE, "THINOUTLINE", 1, -1)
	SetFont(GameFontBlackMedium,                FONT, NORMALSIZE, "THINOUTLINE")
	SetFont(GameFontHighlightMedium,            FONT, NORMALSIZE, "THINOUTLINE", 1, -1)
	SetFont(GameFontHighlightSmallLeft,         FONT, SMALLSIZE, "THINOUTLINE", 1, -1)
	SetFont(GameFontHighlightSmallRight,        FONT, SMALLSIZE, "THINOUTLINE", 1, -1)
	SetFont(GameFontHighlightCenter,            FONT, NORMALSIZE, "THINOUTLINE", 1, -1)
	SetFont(GameFontNormalMed3,                 FONT, NORMALSIZE, "THINOUTLINE", 1, -1)
	SetFont(GameFontNormalSmall2,               FONT, SMALLSIZE, "THINOUTLINE", 1, -1)

	SetFont(CharacterLevelText,                            FONT2, SMALLSIZE, "THINOUTLINE", 1, -1)
	SetFont(CharacterFrameTitleText,                       FONT2, NORMALSIZE, "THINOUTLINE", 1, -1, unpack(CustomClassColor))
	SetFont(CharacterStatsPane.ItemLevelFrame.Value,       FONT2, 16, "THINOUTLINE", 1, -1)
	SetFont(CharacterStatsPane.ItemLevelCategory.Title,    FONT2, 16, "THINOUTLINE", 1, -1)
	SetFont(CharacterStatsPane.AttributesCategory.Title,   FONT2, 16, "THINOUTLINE", 1, -1)
	SetFont(CharacterStatsPane.EnhancementsCategory.Title, FONT2, 16, "THINOUTLINE", 1, -1)
	
	PaperDollTitlesPane:HookScript("OnShow", function(self)
		for i, object in pairs(PaperDollTitlesPane.buttons) do
			object.text:SetFontTemplate(C.Media.Font2, 12)
			--hooksecurefunc(object.text, "SetFont", function(self, font, fontSize, fontStyle)
            --    self:SetFontTemplate(C.Media.Font2, 12)
			--end)
		end
	end)

	--[[
	SetFont(CoreAbilityFont,                    FONT, 32, "THINOUTLINE", 1, -1)
	SetFont(DestinyFontHuge,                    FONT, 32, "THINOUTLINE", 1, -1)
	SetFont(DestinyFontLarge,                   FONT, 18, "THINOUTLINE", 1, -1)
	SetFont(Game18Font,                         FONT, 18, "THINOUTLINE", 1, -1)
	SetFont(Game24Font,                         FONT, 24, "THINOUTLINE", 1, -1)
	SetFont(Game27Font,                         FONT, 27, "THINOUTLINE", 1, -1)
	SetFont(Game20Font,                         FONT, 20, "THINOUTLINE", 1, -1)
	SetFont(Game30Font,                         FONT, 30, "THINOUTLINE", 1, -1)
	SetFont(Fancy16Font,	                    FONT, 16, "THINOUTLINE", 1, -1)
	SetFont(Fancy22Font,                        FONT, 22, "THINOUTLINE", 1, -1)
	SetFont(Fancy24Font,                        FONT, 24, "THINOUTLINE", 1, -1)
	SetFont(Fancy32Font,                        FONT, 32, "THINOUTLINE", 1, -1)
	SetFont(Fancy48Font,                        FONT, 48, "THINOUTLINE", 1, -1)
	--]]
end

function Fonts:Enable()
	if not (C.Fonts.FontMod) then
		return
	end

	Fonts:UpdateFonts()
end

Fonts:Enable()

A["Fonts"] = Fonts