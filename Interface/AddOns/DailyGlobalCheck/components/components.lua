-- Daily Global Check
-- by Vildiesel EU - Well of Eternity

local addonName, addonTable = ...

local L = addonTable.L
local C = addonTable.C
local ng = NyxGUI(C.NyxGUIVersion)

function addonTable.GetQuestCompletionText(cstring)
 return questtype == 13 and addonTable.AddColor(L["repeatable"], o.Colors[9]) or cstring
end

local function fillData(self, data, cstring, overrideOptions)
 local questtype = data[7]
 local o = DailyGlobalCheck_Options
 local left_spacer = ""

 if o["show_questtype"] or overrideOptions then
  -- Interface\\CHATFRAME\\UI-ChatIcon-Battlenet   account wide icon?
  
  if questtype == 1 or questtype == 14 then
   self.questtype:SetTexCoord(0.125, 0.256, 0.125, 0.256)
  elseif questtype == 3 or questtype == 16 then
   self.questtype:SetTexCoord(0.625, 0.75, 0.125, 0.256)
  else
   self.questtype:SetTexCoord(0.375, 0.5, 0.125, 0.256)
  end
  left_spacer = "  "
  self.questtype:Show()
 else
  self.questtype:Hide()
 end
 self.prefix:SetText(left_spacer..addonTable.AddColor(((o["show_prefix"] or overrideOptions) and data[3] or ""), o.Colors[3]))
 self.zone:SetText((o["show_zone"] or overrideOptions) and (addonTable.AddColor(data[1], o.Colors[1]).." ") or "")
 self.name:SetText(addonTable.AddColor(data[2], o.Colors[2]))
 self.suffix:SetText(addonTable.AddColor((o["show_suffix"] or overrideOptions) and data[4] or "", o.Colors[4]))
 self.coords:SetText((o["show_coordinates"] or overrideOptions) and (" "..addonTable.AddColor(DailyGlobalCheck:GetCoord(data), o.Colors[5])) or "")
 self.completed:SetText(questtype == 13 and addonTable.AddColor(L["repeatable"], o.Colors[9]) or cstring)
 local info = DailyGlobalCheck.QuestFunctions:GetOverlayInfo(self.questID, data)
 if info then
  self.overlayInfo = info
  self.overlay:Show()
 else
  self.overlay:Hide()
 end
end

local function fillDataByID(self, questID, cstring, list)
 self.questID = questID
 self.list = list
 local data = DailyGlobalCheck:getQData(questID, list)
 self:FillData(data, cstring)
end

local function fillText(self, left, right)
 self.questtype:Hide()
 self.prefix:SetText(left or "")
 self.zone:SetText("")
 self.name:SetText("")
 self.suffix:SetText("")
 self.coords:SetText("")
 self.completed:SetText(right or "")

 self.prefix:SetWidth(self.prefix:GetStringWidth())
 self.completed:SetWidth(self.completed:GetStringWidth())
end

local function fillHeader(self, s)
 self:FillText(AddColor(s, "GOLD"))
end

local questbutton_meta = {}

function DGCPluginListButton_OnLoad(self)
 self.btnvisibility:SetNormalFontObject(ng:GetFont(addonName, "main", "button"))
end

function DGCPluginListButton_Visibility_OnClick(self)
 local p = self:GetParent()

 DailyGlobalCheck.Tools:CycleListVisibilityByListIndex(p.index)
end

function DGCQuestButton_OnLoad(self)
 self.prefix:SetPoint("LEFT", self, "LEFT", 2, 0)
 self.zone:SetPoint("LEFT", self.prefix, "RIGHT")
 self.name:SetPoint("LEFT", self.zone, "RIGHT")
 self.suffix:SetPoint("LEFT", self.name, "RIGHT")
 self.coords:SetPoint("LEFT", self.suffix, "RIGHT")
 self.completed:ClearAllPoints()
 self.completed:SetPoint("RIGHT", self, "RIGHT", -2, 0)				
 
 self.FillData = fillData
 self.FillDataByID = fillDataByID
 self.FillText = fillText 
 
 self.folding.highlight = self.folding:CreateTexture()
 self.folding.highlight:SetAllPoints()
 self.folding.highlight:SetTexture("Interface\\Buttons\\UI-Listbox-Highlight2")
 self.folding.highlight:SetBlendMode("ADD")
 self.folding.highlight:SetVertexColor(1,1,1,1)
 ng:AnimateHighlight(self.folding)
end

function DGCEditQuestListButton_OnLoad(self)
 self.name:SetPoint("TOPLEFT", self, "TOPLEFT", 22, -3)
 self.zone:SetPoint("BOTTOMLEFT", self, "BOTTOMLEFT", 22, 3)
 self.edit:SetText(EDIT) 
 self.remove:SetText(REMOVE)
end

function DGCEditQuestPoolListButton_OnLoad(self)
 self.name:SetPoint("TOPLEFT", self, "TOPLEFT", 28, -3)
 self.zone:SetPoint("BOTTOMLEFT", self, "BOTTOMLEFT", 28, 3)
end

function DGCQuestButtonOverlay_OnMouseUp(self)
 if IsModifiedClick("CHATLINK") and ACTIVE_CHAT_EDIT_BOX and self:GetParent().overlayInfo then
  local m = self:GetParent().overlayInfo:match("(\|cff.+\|H.+\|h\|r)")
  if m then
   ACTIVE_CHAT_EDIT_BOX:SetText(ACTIVE_CHAT_EDIT_BOX:GetText()..m)
  end
 end
end
