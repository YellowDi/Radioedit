-- Title: Rematch ElvUI Skin
-- Author: Gello
-- Version: 1.0.2
local skin = {}

local rematch = Rematch

local E, L, P, G = unpack(ElvUI)
local S = E:GetModule("Skins")

skin.panels = {

	Frame = function(self)
		self:StripTextures()
		self:SetTemplate("Transparent")
		self.TitleBar:StripTextures()
		S:HandleCloseButton(self.TitleBar.CloseButton)
		S:HandleCloseButton(self.TitleBar.MinimizeButton,nil,"-")
		S:HandleCloseButton(self.TitleBar.LockButton,nil,"")
		S:HandleCloseButton(self.TitleBar.SinglePanelButton,nil,"=")
		skin:SetButtonIcon(self.TitleBar.LockButton,"Locked")
		for _,tab in ipairs(self.PanelTabs.Tabs) do
			skin:HandlePanelTab(tab)
		end
		hooksecurefunc(Rematch.Frame,"Update",function()
			local titlebar = rematch.Frame.TitleBar
			skin:SetButtonIcon(titlebar.LockButton,RematchSettings.LockPosition and "Locked" or "Unlocked")
			titlebar.SinglePanelButton:SetShown(not RematchSettings.Minimized)
		end)
	end,

	Journal = function(self)
		self:StripTextures()
		self:SetTemplate("Default") -- MUST be COMPLETELY opaque for journal background, non negotiable
		for _,tab in ipairs(self.PanelTabs.Tabs) do
			skin:HandlePanelTab(tab)
		end
		RematchJournalPortrait:Hide()
		S:HandleCloseButton(self.CloseButton)
		local handled
		self:HookScript("OnEvent",function()
			if not handled and UseRematchButton then
				S:HandleCheckBox(UseRematchButton)
				handled = true
			end
		end)
		-- added in Rematch 4.3.4
		if self.OtherAddonJournalStuff then
			hooksecurefunc(self,"OtherAddonJournalStuff",function()
				if self.CollectMeButton then
					S:HandleButton(self.CollectMeButton,true)
					self.CollectMeButton:SetHeight(20)
					self.CollectMeButton:SetPoint("RIGHT",rematch.BottomPanel.SaveButton,"LEFT",-2,0)
				end
				if self.PetTrackerJournalButton then
					S:HandleCheckBox(self.PetTrackerJournalButton)
				end
			end)
		end
	end,

	BottomPanel = function(self)
		for _,button in ipairs({"SummonButton","SaveButton","SaveAsButton","FindBattleButton"}) do
			S:HandleButton(self[button],true)
			self[button]:SetHeight(20)
		end
		S:HandleCheckBox(self.UseDefault)
	end,

	Toolbar = function(self)
		for _,button in ipairs(self.Buttons) do
			S:HandleButton(button)
			button.IconBorder:SetAlpha(0)
		end
		S:HandleButton(self.PetCount,true)
	end,

	PetCard = function(self)
		self:StripTextures()
		self:SetTemplate("Transparent")
		S:HandleCloseButton(self.CloseButton)
		S:HandleCloseButton(self.PinButton,nil,"")
		skin:SetButtonIcon(self.PinButton,"Pinned")
		self.Title.TitleBG:SetDrawLayer("BACKGROUND",2)
		local r,g,b = 0.05, 0.05, 0.05
		self.Front:SetBackdrop({edgeFile="Interface\\ChatFrame\\ChatFrameBackground",edgeSize=4})
		self.Front:SetBackdropBorderColor(r,g,b)
		self.Back:SetBackdrop({})
		self.Back:SetBackdrop({edgeFile="Interface\\ChatFrame\\ChatFrameBackground",edgeSize=4})
		self.Back:SetBackdropBorderColor(r,g,b)
		-- also reskinning ability card here
		local abilityCard = RematchAbilityCard
		abilityCard:SetBackdrop({edgeFile="Interface\\ChatFrame\\ChatFrameBackground",edgeSize=4})
		abilityCard:SetBackdropBorderColor(r,g,b)
		-- change all the horizontal divider lines to solid black lines
		for _,frame in ipairs({self.Front.Bottom,self.Front.Middle,self.Back.Source,self.Back.Bottom,self.Back.Middle,abilityCard,abilityCard.Hints}) do
		  for _,region in ipairs({frame:GetRegions()}) do
		    local anchorPoint,relativeTo = region:GetPoint()
		    if region:GetObjectType()=="Texture" and region:GetDrawLayer()=="ARTWORK" and anchorPoint=="LEFT" and relativeTo==frame then
		      region:SetTexture(r,g,b)
		      region:SetHeight(4)
		    end
		  end
		end
	end,


	PetPanel = function(self)
		self.List:StripTextures()
		self.List:SetTemplate("Transparent")
		S:HandleScrollBar(self.List.ScrollFrame.ScrollBar)
		-- top
		self.Top:StripTextures()
		self.Top.TypeBar:StripTextures()
		S:HandleButton(self.Top.Filter)
		S:HandleButton(self.Top.Toggle)
		S:HandleEditBox(self.Top.SearchBox,true)
		self.Top.SearchBox:SetBackdrop({})
		for _,region in ipairs({self.Top.SearchBox:GetRegions()}) do
			if region:GetDrawLayer()=="BACKGROUND" then
				region:Hide()
			end
		end
		self.Top.SearchBox:SetHeight(22)
		self.Top.SearchBox:SetPoint("LEFT",self.Top.Toggle,"RIGHT",4,0)
		self.Top.SearchBox:SetPoint("RIGHT",self.Top.Filter,"LEFT",-4,0)
		self.Results:StripTextures()
		self.Results:SetTemplate("Transparent")
		-- typebar requires a bit of extra work
		self.Top.TypeBar:SetPoint("BOTTOM",0,-2)
		for _,button in ipairs(self.Top.TypeBar.Tabs) do
			S:HandleButton(button)
			button:SetWidth(78)
		end
		for _,button in ipairs(self.Top.TypeBar.Tabs) do
		  button.Selected:ClearAllPoints()
		  button.Selected:SetPoint("TOPLEFT",2,-2)
		  button.Selected:SetPoint("BOTTOMRIGHT",-2,2)
		  for _,texture in ipairs({"LeftSelected","RightSelected","MidSelected"}) do
		    button.Selected[texture]:SetTexture(1,1,1,0.25)
		    button.Selected[texture]:SetHeight(20)
		  end
			for _,region in ipairs({button.Selected:GetRegions()}) do
				if region:GetDrawLayer()=="ARTWORK" then
					region:Hide()
				end
			end
		  for _,region in ipairs({button:GetRegions()}) do
		    if region:GetDrawLayer()=="HIGHLIGHT" then
		      region:Hide()
		    end
		  end
		  button.HasStuff:SetPoint("TOPLEFT",3,-18)
			button.HasStuff:SetAlpha(1)
		end
		for _,button in ipairs(self.Top.TypeBar.Buttons) do
			S:HandleButton(button)
			button.IconBorder:Hide()
		end
		for _,button in ipairs(self.List.ScrollFrame.buttons) do
			S:HandleButton(button)
		end
		hooksecurefunc(self,"UpdateList",function() skin.ColorPetListBorders(self.List.ScrollFrame) end)
		self.List.ScrollFrame:HookScript("OnVerticalScroll",skin.ColorPetListBorders)
		self.List.ScrollFrame:HookScript("OnMouseWheel",skin.ColorPetListBorders)
	end,

	LoadoutPanel = function(self)
		self:StripTextures()
		self.Target:StripTextures()
		self.Target:SetTemplate("Transparent")
	  for i=1,3 do
	    self.Loadouts[i]:StripTextures()
	    self.Loadouts[i]:SetTemplate("Default")
	  end
		S:HandleButton(self.Target.TargetButton)
		S:HandleButton(self.Target.LoadSaveButton)
		for i=1,3 do
		  for j=1,3 do
		    S:HandleButton(self.Loadouts[i].Abilities[j])
		    self.Loadouts[i].Abilities[j].IconBorder:Hide()
		  end
		end
		self.Flyout:SetTemplate("Transparent")
		for i=1,2 do
			S:HandleButton(self.Flyout.Abilities[i])
			self.Flyout.Abilities[i].IconBorder:Hide()
		end
	end,

	LoadedTeamPanel = function(self)
		self:StripTextures()
		self:SetTemplate("Transparent")
		self.Footnotes:StripTextures()
		self.Footnotes:SetTemplate("Transparent")
		S:HandleCloseButton(self.Footnotes.Close)
		S:HandleCloseButton(self.Footnotes.Maximize,nil,"-")
	end,

	TeamPanel = function(self)
		self:StripTextures()
		self.List:StripTextures()
		self.List:SetTemplate("Transparent")
		S:HandleScrollBar(self.List.ScrollFrame.ScrollBar)

		self.Top:StripTextures()
		S:HandleButton(self.Top.Teams)
		S:HandleButton(self.Top.Toggle)
		S:HandleEditBox(self.Top.SearchBox,true)
		self.Top.SearchBox:SetBackdrop({})
		for _,region in ipairs({self.Top.SearchBox:GetRegions()}) do
			if region:GetDrawLayer()=="BACKGROUND" then
				region:Hide()
			end
		end
		self.Top.SearchBox:SetHeight(22)
		self.Top.SearchBox:SetPoint("LEFT",self.Top.Toggle,"RIGHT",4,0)
		self.Top.SearchBox:SetPoint("RIGHT",self.Top.Teams,"LEFT",-4,0)
		local function shiftpets(button)
			if not button.slim then
				for i=1,3 do
					local anchorPoint,relativeTo,relativePoint,x,y = button.Pets[i]:GetPoint()
					button.Pets[i]:SetPoint(anchorPoint,relativeTo,relativePoint,x-3,0)
				end
			end
		end
		S:HandleButton(self.Top.Team)
		shiftpets(self.Top.Team)
		for _,button in ipairs(self.List.ScrollFrame.buttons) do
			S:HandleButton(button)
			shiftpets(button)
		end
		local function blackborders()
			for _,button in ipairs(self.List.ScrollFrame.buttons) do
				button:SetBackdropBorderColor(0,0,0)
			end
		end
		hooksecurefunc(self,"UpdateList",blackborders)
		self.List.ScrollFrame:HookScript("OnVerticalScroll",blackborders)
		self.List.ScrollFrame:HookScript("OnMouseWheel",blackborders)
	end,

	MiniPanel = function(self)
		self.Background:StripTextures()
		self.Background:SetTemplate("Transparent")
		self.Target:StripTextures()
		self.Target:SetTemplate("Transparent")
		S:HandleButton(self.Target.LoadButton)
		for i=1,3 do
		  for j=1,3 do
		    S:HandleButton(self.Pets[i].Abilities[j])
		    self.Pets[i].Abilities[j].IconBorder:Hide()
		  end
		end
		self.Flyout:SetTemplate("Transparent")
		for i=1,2 do
			S:HandleButton(self.Flyout.Abilities[i])
			self.Flyout.Abilities[i].IconBorder:Hide()
		end

	end,

	MiniQueue = function(self)
		self.Top:StripTextures()
		self.Top:SetTemplate("Transparent")
		S:HandleButton(self.Top.QueueButton)
		self.Status:StripTextures()
		self.Status:SetTemplate("Transparent")
		self.List:StripTextures()
		self.List:SetTemplate("Transparent")
		S:HandleScrollBar(self.List.ScrollFrame.ScrollBar)
		for _,button in ipairs(self.List.ScrollFrame.buttons) do
			S:HandleButton(button)
			if button.slim then
				button:GetChildren():Hide()
			end
		end
		hooksecurefunc(self,"UpdateList",function() skin.ColorPetListBorders(self.List.ScrollFrame) end)
		self.List.ScrollFrame:HookScript("OnVerticalScroll",skin.ColorPetListBorders)
		self.List.ScrollFrame:HookScript("OnMouseWheel",skin.ColorPetListBorders)
	end,

	QueuePanel = function(self)
		self.List:StripTextures()
		self.List:SetTemplate("Transparent")
		S:HandleScrollBar(self.List.ScrollFrame.ScrollBar)
		self.Top:StripTextures()
		S:HandleButton(self.Top.QueueButton)
		S:HandleButton(self.Top.Toggle)
		S:HandleButton(self.Top.LevelingSlot)
		self.Status:StripTextures()
		self.Status:SetTemplate("Transparent")
		for _,button in ipairs(self.List.ScrollFrame.buttons) do
			S:HandleButton(button)
		end
		hooksecurefunc(self,"UpdateList",function() skin.ColorPetListBorders(self.List.ScrollFrame) end)
		self.List.ScrollFrame:HookScript("OnVerticalScroll",skin.ColorPetListBorders)
		self.List.ScrollFrame:HookScript("OnMouseWheel",skin.ColorPetListBorders)
	end,

	OptionPanel = function(self)
		self.List:StripTextures()
		self.List:SetTemplate("Transparent")
		S:HandleScrollBar(self.List.ScrollFrame.ScrollBar)
		for _,button in ipairs(self.List.ScrollFrame.buttons) do
			button:StripTextures()
			for _,region in ipairs({button.Header:GetRegions()}) do
				if region:GetDrawLayer()=="BACKGROUND" then
					region:SetTexture(0.15,0.15,0.15)
				end
			end
			S:HandleCheckBox(button.CheckButton)
		end
		S:HandleButton(self.CustomScale.ScaleButton)
		S:HandleCheckBox(self.CustomScale.CheckButton)
	end,

	TeamTabs = function(self)
		hooksecurefunc(self,"Update",function(self)
			if RematchSettings.TeamTabsToLeft and RematchSettings.AlwaysTeamTabs and self:GetParent()==rematch.Frame then
				local anchorPoint,relativeTo,relativePoint,x,y = self:GetPoint()
				self:SetPoint(anchorPoint,relativeTo,relativePoint,x+5,y)
			end
			for _,button in ipairs(self.Tabs) do
			  S:HandleButton(button)
			  button:SetSize(40,40)
			  button.Icon:SetPoint("CENTER")
			  if button:GetID()==RematchSettings.SelectedTab then
			    button.backdropTexture:SetVertexColor(1,0.82,0)
			  else
			    button.backdropTexture:SetVertexColor(0.1,0.1,0.1)
			  end
			end
		end)
	end,

	Dialog = function(self)
		self:StripTextures()
		self:SetTemplate("Default")
		S:HandleCloseButton(self.CloseButton)
		S:HandleButton(self.Accept,true)
		S:HandleButton(self.Cancel,true)
		S:HandleButton(self.Other,true)
		self.Prompt:StripTextures()
		self.Prompt:SetTemplate("Transparent")
		S:HandleEditBox(self.EditBox)
		self.EditBox:SetBackdrop({})
		S:HandleButton(self.TabPicker)
		self.TabPicker.Icon:SetDrawLayer("ARTWORK")
		self.TeamTabIconPicker:StripTextures()
		self.TeamTabIconPicker:SetTemplate("Transparent")
		S:HandleScrollBar(self.TeamTabIconPicker.ScrollFrame.ScrollBar)
		S:HandleEditBox(self.TeamTabIconPicker.Search)
		self.TeamTabIconPicker.Search:SetBackdrop({})
		S:HandleEditBox(self.MultiLine)
		self.MultiLine:SetTemplate("Transparent")
		S:HandleScrollBar(self.MultiLine.ScrollBar)
		for _,child in ipairs({self.MultiLine:GetChildren()}) do
		  if child:GetObjectType()=="Button" then
		    child:SetBackdrop({})
		  end
		end
		S:HandleCheckBox(self.CheckButton)
		self.CollectionReport.ChartTypeComboBox:SetBackdrop({})
		self.CollectionReport.Chart:SetBackdrop({})
		S:HandleEditBox(self.SaveAs.Name)
		self.SaveAs.Name:SetBackdrop({})
		S:HandleEditBox(self.SaveAs.Target)
		self.SaveAs.Target:StripTextures()
		self.SaveAs.Target:SetTemplate("Transparent")
		S:HandleEditBox(self.ScriptFilter.Name)
		self.ScriptFilter.Name:SetBackdrop({})
		for i=1,3 do
		  S:HandleButton(self.ScriptFilter.ReferenceButtons[i])
		end
		for _,button in ipairs({"MinHP","MaxHP","MinXP","MaxXP"}) do
		  S:HandleEditBox(self.Preferences[button])
		  self.Preferences[button]:SetBackdrop({})
		end
		S:HandleCheckBox(self.Preferences.AllowMM)
		local handledExpectedDD
		hooksecurefunc(Rematch,"ShowPreferencesDialog",function()
			if not handledExpectedDD then
				for i=1,10 do
					S:HandleButton(self.Preferences.expectedDD[i])
					self.Preferences.expectedDD[i].IconBorder:Hide()
				end
				handledExpectedDD = true
			end
		end)
	end,

	Notes = function(self)
		self:StripTextures()
		self:SetTemplate("Transparent")
		S:HandleButton(self.Controls.SaveButton)
		S:HandleButton(self.Controls.UndoButton)
		S:HandleButton(self.Controls.DeleteButton)
		S:HandleCloseButton(self.CloseButton)
		S:HandleCloseButton(self.LockButton,nil,"")
		hooksecurefunc(self,"UpdateLockState",function()
			skin:SetButtonIcon(self.LockButton,RematchSettings.LockNotesPosition and "Locked" or "Unlocked")
		end)
		self.Content:StripTextures()
		self.Content:SetTemplate("Transparent")
		for _,region in ipairs({self.Content:GetRegions()}) do
		  if region:GetDrawLayer()=="ARTWORK" then
		    if region:GetObjectType()=="Texture" then -- restore thin gold border around icons
		      region:SetTexture("Interface\\PetBattles\\PetBattleHUD")
		      region:SetTexCoord(0.884765625,0.943359375,0.681640625,0.798828125)
		    end
		  end
		end
	end,

}


--[[ Stuff that needs to be done on login that has no panel goes here (menus, tooltips, etc) ]]

skin.misc = {

	Menu = function()
		-- menu framepool is local, going to force the creation of three levels of menus and skin them
		for i=1,3 do
			local menu = rematch:GetMenuFrame(i,UIParent)
			menu:StripTextures()
			menu:SetTemplate("Default")
			for _,region in ipairs({menu.Title:GetRegions()}) do
				if region:GetObjectType()=="Texture" and region:GetDrawLayer()=="BACKGROUND" then
					region:SetTexture()
				end
			end
		end
	end,

	Tooltip = function()
		RematchTooltip:StripTextures()
		RematchTooltip:SetTemplate("Default")
		RematchTableTooltip:StripTextures()
		RematchTableTooltip:SetTemplate("Default")
	end,

	WinRecordCard = function()
		local self = RematchWinRecordCard
		self:StripTextures()
		self:SetTemplate("Transparent")
		for _,button in ipairs({"SaveButton","CancelButton","ResetButton"}) do
			S:HandleButton(self.Controls[button])
			self.Controls[button]:SetHeight(20)
		end
		S:HandleCloseButton(self.CloseButton)
		self.Content:StripTextures()
		self.Content:SetTemplate("Default")
		for _,stat in ipairs({"Wins","Losses","Draws"}) do
			S:HandleEditBox(self.Content[stat].EditBox)
			self.Content[stat].EditBox:SetBackdrop({bgFile="Interface\\ChatFrame\\ChatFrameBackground",insets={left=3,right=3,top=3,bottom=3}})
			self.Content[stat].EditBox:SetBackdropColor(0,0,0)
			S:HandleButton(self.Content[stat].Add)
			self.Content[stat].Add.IconBorder:Hide()
		end
	end,

}

--[[ Helper functions ]]

local icons = {
	Locked = {0, 0.5, 0, 0.25},
	Unlocked = {0.5, 1, 0, 0.25},
	Minimized = {0, 0.5, 0.25, 0.5},
	Maximized = {0.5, 1, 0.25, 0.5},
	SinglePanel = {0, 0.5, 0.5, 0.75},
	DualPanel = {0.5, 1, 0.5, 0.75},
	Pinned = {0, 0.5, 0.75, 1},
}

function skin:SetButtonIcon(button,icon)
	if not button.RematchElvUISkinIcon then
		button.RematchElvUISkinIcon = button:CreateTexture(nil,"ARTWORK")
		button.RematchElvUISkinIcon:SetPoint("TOPLEFT",button,"TOPLEFT",10,-10)
		button.RematchElvUISkinIcon:SetPoint("BOTTOMRIGHT",button,"BOTTOMRIGHT",-10,10)
		button.RematchElvUISkinIcon:SetTexture("Interface\\AddOns\\ElvUI\\modules\\addons\\Rematch_icons.tga")
	end
	if icons[icon] then
		button.RematchElvUISkinIcon:SetTexCoord(unpack(icons[icon]))
	end
end

function skin:ColorPetListBorders()
	for _,button in ipairs(self.buttons) do
		button:SetBackdropBorderColor(0,0,0)
		if button.slim then
			local petID = button.petID
			local r,g,b = 0.3, 0.3, 0.3
			if type(petID)=="string" then
				local rarity = select(5,C_PetJournal.GetPetStats(petID))
				if rarity then
					local c = ITEM_QUALITY_COLORS[rarity-1]
					r,g,b = c.r, c.g, c.b
				end
			end
			button.backdropTexture:SetVertexColor(r/3,g/3,b/3)
		end
	end
end

function skin:HandlePanelTab(tab)
  if not tab then return end
  for _,texture in ipairs({tab:GetRegions()}) do
    if texture:GetDrawLayer()=="BACKGROUND" then
      texture:SetTexture(nil)
    end
  end
  -- following is taken from ElvUI\modules\skins\skins.lua S:HandleTab(tab) function
	-- (custom tabs don't have named textures it's looking for)
  if tab.GetHighlightTexture and tab:GetHighlightTexture() then
      tab:GetHighlightTexture():SetTexture(nil)
  else
      tab:StripTextures()
  end
  tab.backdrop = CreateFrame("Frame", nil, tab)
  tab.backdrop:SetTemplate("Default")
  tab.backdrop:SetFrameLevel(tab:GetFrameLevel() - 1)
  tab.backdrop:Point("TOPLEFT", 10, E.PixelMode and -1 or -3)
  tab.backdrop:Point("BOTTOMRIGHT", -10, 3)
  if tab.GetHighlightTexture and tab:GetHighlightTexture() then
    tab:GetHighlightTexture():SetTexture(nil)
  else
    tab:StripTextures()
  end
  tab.backdrop = CreateFrame("Frame", nil, tab)
  tab.backdrop:SetTemplate("Default")
  tab.backdrop:SetFrameLevel(tab:GetFrameLevel() - 1)
  tab.backdrop:Point("TOPLEFT", 10, E.PixelMode and -1 or -3)
  tab.backdrop:Point("BOTTOMRIGHT", -10, 3)
end


-- wait until the game starts rendering to go through and reskin everything
local s = CreateFrame("Frame")
s:RegisterEvent("ADDON_LOADED")
s:SetScript("OnEvent", function(self, name)
	if name == "Rematch" then
		C_Timer.After(0.5,function()
			for panel,func in pairs(skin.panels) do
				func(rematch[panel])
			end
			for _,func in pairs(skin.misc) do
				func()
			end
		end)
		self:UnregisterAllEvents()
	end
end)
