local A, C, M, L = select(2, ...):unpack()

local CustomLoot = CreateFrame("Frame")

function CustomLoot:SkinLootFrame()
	local LootFrame = _G["LootFrame"]
	LootFrame:StripTexture()

	local LootFrameInset = _G["LootFrameInset"]
	LootFrameInset:StripTexture()
	LootFrameInset:CreateBackdrop()

	LootFramePortraitOverlay:SetAlpha(0)
	LootFrameNext:SetAlpha(0)
	LootFramePrev:SetAlpha(0)

	LootFrameDownButton:StripTexture()
	LootFrameDownButton:Size(LootFrame:GetWidth() - 10, 23)
	LootFrameDownButton:SkinButton()

	local LootFrameDownButtonText = LootFrameDownButton:CreateFontString(nil, "OVERLAY")
	LootFrameDownButtonText:SetFontTemplate(C.Media.Font, 12)
	LootFrameDownButtonText:SetPoint("CENTER")
	LootFrameDownButtonText:SetText(NEXT)

	LootFrameDownButton:ClearAllPoints()
	LootFrameDownButton:Point("TOP", LootFrame, "BOTTOM", -1, 0)

	LootFrameUpButton:StripTexture()
	LootFrameUpButton:Size(LootFrame:GetWidth() - 10, 23)
	LootFrameUpButton:SkinButton()

	local LootFrameUpButtonText = LootFrameUpButton:CreateFontString(nil, "OVERLAY")
	LootFrameUpButtonText:SetFontTemplate(C.Media.Font, 12)
	LootFrameUpButtonText:SetPoint("CENTER")
	LootFrameUpButtonText:SetText(PREV)

	LootFrameUpButton:ClearAllPoints()
	LootFrameUpButton:Point("TOP", LootFrameDownButton, "BOTTOM", 0, -4)

	local TopFrame = CreateFrame("Frame", nil, LootFrame)
	TopFrame:Size(LootFrame:GetWidth() - 10, 23)
	TopFrame:SetFrameLevel(LootFrame:GetFrameLevel())
	TopFrame:Point("TOPLEFT", 4, -33)
	TopFrame:CreateBackdrop(true)

	LootFrameCloseButton:SkinCloseButton()
	LootFrameCloseButton:ClearAllPoints()
	LootFrameCloseButton:Point("RIGHT", TopFrame, -4, 0)

	local ItemText = select(19, LootFrame:GetRegions())
	ItemText:ClearAllPoints()
	ItemText:SetPoint("LEFT", TopFrame, "LEFT", 6, 0)

	for i = 1, 4 do
		local Text = _G["LootButton"..i.."Text"]
		if (Text) then
			Text:SetFontTemplate(C.Media.Font, 12)
		end

		local Count = _G["LootButton"..i.."Count"]
		if (Count) then
			Count:SetFontTemplate(C.Media.Font, 12)
			Count:ClearAllPoints()
			Count:Point("BOTTOMRIGHT", -2, 4)
		end
	end
end

function CustomLoot:SkinLootFrameButtons(i)
	for i = 1, LootFrame.numLootItems do
		local Button = _G["LootButton" .. i]
		local Slot = (LOOTFRAME_NUMBUTTONS * (LootFrame.page - 1)) + i

		if (Button) then
			local Icon = _G["LootButton"..i.."IconTexture"]
			local Quest = _G["LootButton"..i.."IconQuestTexture"]
			local Border = _G["LootButton"..i.."IconBorder"]
			local IconTexture = Icon:GetTexture()
			local Texture, Item, Quantity, Quality, Locked, IsQuestItem, QuestID, IsActive = GetLootSlotInfo(Slot)

			if (not Button.IsSkinned) then
			    Button:SetNormalTexture("")
				Button:StripTexture()
				
				Button:StyleButton()
				Button:CreateButtonPanel(true, 37, 37)
				
				Icon:SetTexture(IconTexture)
				Icon:SetTexCoord(unpack(A.TexCoords))
			
				Quest:SetAlpha(0)

				Button.IsSkinned = true
			end
		
			if (IsQuestItem or QuestID) then
				Button.ButtonPanel:SetColorTemplate(1.0, 0.82, 0)
			else
				Button.ButtonPanel:SetColorTemplate(unpack(C.General.BorderColor))
            end
		end
	end
end

function CustomLoot:AddHooks()
	hooksecurefunc("LootFrame_UpdateButton", CustomLoot.SkinLootFrameButtons)
end

function CustomLoot:Enable()
	self:SkinLootFrame()
	self:AddHooks()
end

CustomLoot:RegisterEvent("PLAYER_LOGIN")
CustomLoot:RegisterEvent("PLAYER_ENTERING_WORLD")
CustomLoot:RegisterEvent("ADDON_LOADED")
 
CustomLoot:SetScript("OnEvent", function(self, event)
	if (event == "PLAYER_LOGIN") then
		CustomLoot:Enable()
	end
end)