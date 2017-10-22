-- Daily Global Check
-- by Vildiesel
-- EU-Well of Eternity

local format = string.format

local addonName, addonTable = ...
local L = addonTable.L

local ng

local function initializeButtons(self)
 DGCIconDialogPopup.buttons_per_row = 13
 DGCIconDialogPopup.numrows = 8
 
 self.buttons = {}
 
 local rows = 0

 local button = CreateFrame("CheckButton", "DGCIconDialogPopupButton1", DGCIconDialogPopup, "DGCIconPopupButtonTemplate")
 button:SetPoint("TOPLEFT", 20, -105)
 button.tex = ""
 tinsert(self.buttons, button)

 local lastPos
 for i = 2, DGCIconDialogPopup.buttons_per_row * DGCIconDialogPopup.numrows do
  button = CreateFrame("CheckButton", "DGCIconDialogPopupButton" .. i, DGCIconDialogPopup, "DGCIconPopupButtonTemplate")
  button.tex = ""

  lastPos = (i - 1) / DGCIconDialogPopup.buttons_per_row
  if lastPos == math.floor(lastPos) then
   button:SetPoint("TOPLEFT", self.buttons[i - DGCIconDialogPopup.buttons_per_row], "BOTTOMLEFT", 0, -8)
  else
   button:SetPoint("TOPLEFT", self.buttons[i - 1], "TOPRIGHT", 10, 0)
  end
  tinsert(self.buttons, button)
 end
end

function DGCIconDialogPopup_OnShow(self)
 --PlaySound("igCharacterInfoOpen")
 PlaySound(839)
 self.name = nil
 self.id = nil
 self.isEdit = false
 self.edt_search:SetText("")
 -- called manually
 --RecalculateDGCIconDialogPopup()
end

function addonTable:CreateIconSelectionFrame()
 ng = NyxGUI("1.0")

 local mf = ng:New(addonName, "Frame", "DGCIconDialogPopup", UIParent)--, "InsetFrameTemplate")
 mf:EnableMouse(true)
 mf:SetMovable(true)
 mf:RegisterForDrag("LeftButton")
 mf:SetClampedToScreen(true)
 mf:SetScript("OnDragStart", function(self) self:StartMoving() end)
 mf:SetScript("OnDragStop", function(self) self:StopMovingOrSizing() end)
 mf:SetSize(640, 512)
 mf:SetPoint("CENTER")
 mf:SetFrameStrata("DIALOG")

 mf:Hide()
 
 mf.title = mf:CreateFontString(nil, "BACKGROUND", "SystemFont_Shadow_Med3")
 mf.title:SetPoint("TOP", 0, -10)
 mf.title:SetText("Daily Global Check")
 
 local g = "|cffaafca3"
 
 -- search editbox
 mf.filter = ""
 
 mf.lbl_search = mf:CreateFontString(nil, "BACKGROUND", "Game11Font")
 mf.lbl_search:SetPoint("TOPLEFT", 30, -40)
 mf.lbl_search:SetText(g..L["search_icon"].."|r")
 
 --mf.edt_search = CreateFrame("EditBox", "DGCIconDialogPopupEditBox", mf, "InputBoxTemplate")
 mf.edt_search = ng:New(addonName, "Editbox", "DGCIconDialogPopupEditBox", mf)
 mf.edt_search:SetSize(182, 20)
 mf.edt_search:SetPoint("TOPLEFT", mf, "TOPLEFT", 25, -55)
 --mf.edt_search:SetFontObject("ChatFontNormal")
 mf.edt_search:SetAutoFocus(true)
 mf.edt_search:SetScript("OnTextChanged", function(self)
                                           mf.filter = self:GetText() 
                                           DGCIconDialogPopup_FilterList(true)
                                           FauxScrollFrame_OnVerticalScroll(DGCIconDialogPopupScrollFrame, 0, 36, nil)
                                          end)

 -- scrollframe
 mf.scrollFrame = CreateFrame("ScrollFrame", "DGCIconDialogPopupScrollFrame", mf, "FauxScrollFrameTemplate")
 mf.scrollFrame:SetSize(600, 350)
 mf.scrollFrame:SetPoint("TOPLEFT", mf, "TOPLEFT", 10, -100)
 mf.scrollFrame:SetScript("OnVerticalScroll", function(self, offset) FauxScrollFrame_OnVerticalScroll(self, offset, 36, DGCIconDialogPopup_Update) end)
 
 -- cancel
 mf.cancel = ng:New(addonName, "Button", "DGCIconDialogPopupCancel", mf)
 mf.cancel:SetPoint("BOTTOMRIGHT", mf, "BOTTOMRIGHT", -11, 13)
 mf.cancel:SetText(CANCEL)
 mf.cancel:SetSize(78, 22)
 mf.cancel:SetScript("OnClick", DGCIconDialogPopupCancel_OnClick)
 
 -- okay
 mf.okay = ng:New(addonName, "Button", "DGCIconDialogPopupOkay", mf)
 mf.okay:SetPoint("BOTTOMRIGHT", mf.cancel, "BOTTOMLEFT", -2, 0)
 mf.okay:SetText(OKAY)
 mf.okay:SetSize(78, 22)
 mf.okay:SetScript("OnClick", DGCIconDialogPopupOkay_OnClick)
 
 f = ng:New(addonName, "Button", nil, mf)
 f:SetPoint("TOPRIGHT", -1, -1)
 f:SetText("X")
 f:SetWidth(22)
 f:SetScript("OnClick", DGCIconDialogPopupCancel_OnClick)

 mf:SetScript("OnMouseUp", function(self, button) if button == "RightButton" then DGCIconDialogPopupCancel_OnClick() end end)
 mf:SetScript("OnShow", DGCIconDialogPopup_OnShow)
 mf:SetScript("OnHide", DGCIconDialogPopup_OnHide)
 
 initializeButtons(mf)
end
