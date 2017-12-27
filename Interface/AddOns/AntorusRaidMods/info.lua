local T, C, L, G = unpack(select(2, ...))

local addon_name = G.addon_name

local options = T.CreateOptions(L["制作"], G.gui)

local info = T.createtext(options, "OVERLAY", 25, "OUTLINE", "CENTER")
info:SetPoint("CENTER", options, "CENTER")
info:SetText(L["制作文本"])













