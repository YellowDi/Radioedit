local A, C, M, L = select(2, ...):unpack()

if C.Theme.ThemeMod then else return end

local TicketStatus = _G["TicketStatusFrame"]
TicketStatus:ClearAllPoints()
TicketStatus:SetPoint("TOPLEFT", UIParent, 6, -6)

local TicketStatusButton = _G["TicketStatusFrameButton"]
TicketStatusButton:CreateBackdrop()

local TicketStatusIcon = _G["TicketStatusFrameIcon"]
TicketStatusIcon:ClearAllPoints()
TicketStatusIcon:SetPoint("TOPRIGHT", TicketStatusButton)