local _,L = ...
local rematch = Rematch
local card = RematchTeamCard


rematch:InitModule(function()
	rematch.TeamCard = card
	local font,size,flag = card.Title.Name:GetFont()
	card.Title.Name:SetFont(font,size+2,flag)
	card.TeamCardTitle:SetText(L["Team Card"])
end)