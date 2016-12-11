local E, L, V, P, G = unpack(select(2, ...)); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB
local S = E:GetModule('Skins')

--Cache global variables
--Lua functions
local _G = _G
local unpack = unpack

local function LoadSkin()
	if E.private.skins.blizzard.enable ~= true or E.private.skins.blizzard.tradeskill ~= true then return end
	
	-- MainFrame
	TradeSkillFramePortrait:Kill()
	TradeSkillFrame:StripTextures(true)
	TradeSkillFrame:SetTemplate("Transparent")
	TradeSkillFrame:Height(TradeSkillFrame:GetHeight() + 12)
	TradeSkillFrame.RankFrame:StripTextures()
	TradeSkillFrame.RankFrame:CreateBackdrop("Default")
	TradeSkillFrame.RankFrame:SetStatusBarTexture(E["media"].normTex)
	E:RegisterStatusBar(TradeSkillFrame.RankFrame)
	TradeSkillFrame.FilterButton:StripTextures(true)
	TradeSkillFrame.FilterButton:CreateBackdrop('Default', true)
	TradeSkillFrame.FilterButton.backdrop:SetAllPoints()
	TradeSkillFrame.LinkToButton:GetNormalTexture():SetTexCoord(0.25, 0.7, 0.37, 0.75)
	TradeSkillFrame.LinkToButton:GetPushedTexture():SetTexCoord(0.25, 0.7, 0.45, 0.8)
	TradeSkillFrame.LinkToButton:GetHighlightTexture():Kill()
	TradeSkillFrame.LinkToButton:CreateBackdrop("Default")
	TradeSkillFrame.LinkToButton:Size(17, 14)
	TradeSkillFrame.LinkToButton:SetPoint("BOTTOMRIGHT", TradeSkillFrame.FilterButton, "TOPRIGHT", -2, 4)

	S:HandleEditBox(TradeSkillFrame.SearchBox)
	S:HandleCloseButton(TradeSkillFrameCloseButton)

	-- RecipeList
	TradeSkillFrame.RecipeInset:StripTextures()
	TradeSkillFrame.RecipeInset:StripTextures()
	TradeSkillFrame.RecipeList.LearnedTab:StripTextures()
	TradeSkillFrame.RecipeList.UnlearnedTab:StripTextures()

	-- DetailsFrame
	TradeSkillFrame.DetailsFrame:StripTextures()
	TradeSkillFrame.DetailsInset:StripTextures()
	TradeSkillFrame.DetailsFrame.Background:Hide()
	S:HandleEditBox(TradeSkillFrame.DetailsFrame.CreateMultipleInputBox)
	TradeSkillFrame.DetailsFrame.CreateMultipleInputBox:DisableDrawLayer("BACKGROUND")

	S:HandleButton(TradeSkillFrame.DetailsFrame.CreateAllButton, true)
	S:HandleButton(TradeSkillFrame.DetailsFrame.CreateButton, true)
	S:HandleButton(TradeSkillFrame.DetailsFrame.ExitButton, true)

	-- S:HandleScrollBar(TradeSkillFrame.RecipeList.scrollBar) --This cannot be skinned due to issues on Blizzards end.
	S:HandleScrollBar(TradeSkillFrame.DetailsFrame.ScrollBar)

	S:HandleNextPrevButton(TradeSkillFrame.DetailsFrame.CreateMultipleInputBox.DecrementButton, nil, true)
	S:HandleNextPrevButton(TradeSkillFrame.DetailsFrame.CreateMultipleInputBox.IncrementButton)
	TradeSkillFrame.DetailsFrame.CreateMultipleInputBox.IncrementButton:Point("LEFT", TradeSkillFrame.DetailsFrame.CreateMultipleInputBox, "RIGHT", 4, 0)

	hooksecurefunc(TradeSkillFrame.DetailsFrame, "RefreshDisplay", function()
		local ResultIcon = TradeSkillFrame.DetailsFrame.Contents.ResultIcon
		ResultIcon:StyleButton()
		if ResultIcon:GetNormalTexture() then
			ResultIcon:GetNormalTexture():SetTexCoord(unpack(E.TexCoords))
			ResultIcon:GetNormalTexture():SetInside()
		end
		ResultIcon:SetTemplate("Default")
		ResultIcon.Background:SetTexture(nil)

		for i = 1, #TradeSkillFrame.DetailsFrame.Contents.Reagents do
			local Button = TradeSkillFrame.DetailsFrame.Contents.Reagents[i]
			local Icon = Button.Icon
			local Count = Button.Count
			
			Icon:SetTexCoord(unpack(E.TexCoords))
			Icon:SetDrawLayer("OVERLAY")
			if not Icon.backdrop then
				Icon.backdrop = CreateFrame("Frame", nil, Button)
				Icon.backdrop:SetFrameLevel(Button:GetFrameLevel() - 1)
				Icon.backdrop:SetTemplate("Default")
				Icon.backdrop:SetOutside(Icon)
			end
			
			Icon:SetParent(Icon.backdrop)
			Count:SetParent(Icon.backdrop)
			Count:SetDrawLayer("OVERLAY")
			
			Button.NameFrame:Kill()
		end
	end)

	--Guild Crafters
	S:HandleCloseButton(TradeSkillFrame.DetailsFrame.GuildFrame.CloseButton)
	S:HandleButton(TradeSkillFrame.DetailsFrame.ViewGuildCraftersButton)
	TradeSkillFrame.DetailsFrame.ViewGuildCraftersButton.LeftSeparator:SetTexture(nil)
	TradeSkillFrame.DetailsFrame.ViewGuildCraftersButton.RightSeparator:SetTexture(nil)
	TradeSkillFrame.DetailsFrame.GuildFrame:StripTextures()
	TradeSkillFrame.DetailsFrame.GuildFrame:SetTemplate("Transparent")
	TradeSkillFrame.DetailsFrame.GuildFrame.Container:StripTextures()
	TradeSkillFrame.DetailsFrame.GuildFrame.Container:SetTemplate("Transparent")
	-- S:HandleScrollBar(TradeSkillFrame.DetailsFrame.GuildFrame.Container.ScrollFrame.scrollBar) --This cannot be skinned due to issues on Blizzards end.

	--BUGFIX: TradeSkillFrame.RecipeList.scrollBar
	--Hide current scrollbar
	TradeSkillFrame.RecipeList.scrollBar.ScrollBarTop:Hide()
	TradeSkillFrame.RecipeList.scrollBar.ScrollBarTop = nil
	TradeSkillFrame.RecipeList.scrollBar.ScrollBarBottom:Hide()
	TradeSkillFrame.RecipeList.scrollBar.ScrollBarBottom = nil
	TradeSkillFrame.RecipeList.scrollBar.ScrollBarMiddle:Hide()
	TradeSkillFrame.RecipeList.scrollBar.thumbTexture:Hide()
	TradeSkillFrame.RecipeList.scrollBar.thumbTexture = nil
	TradeSkillFrameScrollUpButton:Hide()
	TradeSkillFrameScrollUpButton = nil
	TradeSkillFrameScrollDownButton:Hide()
	TradeSkillFrameScrollDownButton = nil

	--Create new one with fixed template
	TradeSkillFrame.RecipeList.scrollBar = CreateFrame("Slider", nil, TradeSkillFrame.RecipeList, "HybridScrollBarTemplateFixed")
	S:HandleScrollBar(TradeSkillFrame.RecipeList.scrollBar)
	TradeSkillFrame.RecipeList.scrollBar:SetFrameLevel(TradeSkillFrame.RecipeList.scrollBar.trackbg:GetFrameLevel()) --Fix issue with background intercepting clicks
	C_Timer.After(0.25, function()
		--Scroll back to top
		TradeSkillFrame.RecipeList.scrollBar:SetValue(1)
		TradeSkillFrame.RecipeList.scrollBar:SetValue(0)
	end)

	-- Title: FixTradeSkillSearch
	-- Author: Ketho (EU-Boulderfist)
	-- License: Public Domain
	-- Version: 1.0

	hooksecurefunc("ChatEdit_InsertLink", function(text) -- shift-clicked
		-- change from SearchBox:HasFocus to :IsShown again
		if text and TradeSkillFrame and TradeSkillFrame:IsShown() then
			local spellId = strmatch(text, "enchant:(%d+)")
			local spell = GetSpellInfo(spellId)
			local item = GetItemInfo(strmatch(text, "item:(%d+)") or 0)
			local search = spell or item
			if not search then return end
			
			-- search needs to be lowercase for .SetRecipeItemNameFilter
			TradeSkillFrame.SearchBox:SetText(search:lower())
			
			-- jump to the the recipe
			if spell then -- can only select recipes on the learned tab
				if PanelTemplates_GetSelectedTab(TradeSkillFrame.RecipeList) == 1 then
					TradeSkillFrame:SelectRecipe(tonumber(spellId))
				end
			elseif item then
				C_Timer.After(.1, function() -- wait a bit or we cant select the recipe yet
					for _, v in pairs(TradeSkillFrame.RecipeList.dataList) do
						if v.name == item then
							--TradeSkillFrame.RecipeList:RefreshDisplay() -- didnt seem to help
							TradeSkillFrame:SelectRecipe(v.recipeID)
							return
						end
					end
				end)
			end
		end
	end)

	-- increase search box width -- up from 112
	TradeSkillFrame.SearchBox:SetWidth(200)
end

S:AddCallbackForAddon("Blizzard_TradeSkillUI", "TradeSkill", LoadSkin)