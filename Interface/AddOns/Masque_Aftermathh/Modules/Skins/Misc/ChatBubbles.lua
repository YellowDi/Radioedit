local A, C, M, L = select(2, ...):unpack()

local ChatBubbles = CreateFrame("Frame")

local function SkinBubbles(self)
	for i = 1, self:GetNumRegions() do
		local Region = select(i, self:GetRegions())
		if (Region:GetObjectType() == "Texture") then
			Region:SetTexture(nil)
		elseif (Region:GetObjectType() == "FontString") then
			Region:SetFontTemplate(C.Media.Font, 14)
			self.Text = Region
		end
	end
	
	local Scale = UIParent:GetScale()
	self:SetScale(Scale)
	self:SetBackdrop({
		bgFile = "Interface\\Buttons\\WHITE8x8",
	})
	self:SetBackdropColor(unpack(C.General.BackdropColor))
	self:SetTemplate()
end

function ChatBubbles:OnUpdate(Elapsed)
	self.LastUpdate = (self.LastUpdate or -2) + Elapsed
	
	if (self.LastUpdate < .1) then
	    return 
	end

	local C_ChatBubbles_GetAllChatBubbles = C_ChatBubbles and C_ChatBubbles.GetAllChatBubbles
	for _, Bubbles in pairs(C_ChatBubbles_GetAllChatBubbles()) do
		if not Bubbles.IsSkinned then
			SkinBubbles(Bubbles)
		end
	end
	
	self.LastUpdate = 0
end

function ChatBubbles:Enable()
	if not (C.Theme.ThemeMod) then 
		return
	end

	ChatBubbles:SetScript("OnUpdate", ChatBubbles.OnUpdate)
end

ChatBubbles:RegisterEvent("PLAYER_LOGIN")
ChatBubbles:RegisterEvent("PLAYER_ENTERING_WORLD")
ChatBubbles:RegisterEvent("ADDON_LOADED")

ChatBubbles:SetScript("OnEvent", function(self, event)
	if (event == "PLAYER_LOGIN") then
		self:Enable()
	end
end)