local T, C, L, G = unpack(select(2, ...))

local addon_name = G.addon_name

local options = T.CreateOptions(L["制作"], G.gui)

local info = T.createtext(options, "OVERLAY", 25, "OUTLINE", "CENTER")
info:SetPoint("CENTER", options, "CENTER")
info:SetText(L["制作文本"])

model = CreateFrame("PlayerModel", nil, options)
model:SetSize(200,200)
model:SetPoint("BOTTOM", options, "CENTER", 0, 100)

model:SetPosition(0, 0, 0)
model:SetFacing(1)
model:SetCreature(112144)

model.text = T.createtext(model, "HIGHLIGHT", 20, "NONE", "CENTER")
model.text:SetPoint("BOTTOM", model, "BOTTOM", 0, 25)
model.text:SetTextColor(1, 1, 1)
model.text:SetText(L["汪汪"])

model.glow = model:CreateTexture(nil, "HIGHLIGHT")
model.glow:SetSize(30, 30)
model.glow:SetPoint("CENTER", model.text, "TOPRIGHT", -3, -5)
model.glow:SetTexture("Interface\\Cooldown\\star4")
model.glow:SetVertexColor(1, 1, 1, .7)
model.glow:SetBlendMode("ADD")

model:SetScript("OnEnter", function(self) self:SetFacing(0) end)
model:SetScript("OnLeave", function(self) self:SetFacing(1) end)
	
model:EnableMouse(true)










