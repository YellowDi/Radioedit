local A, C, M, L = select(2, ...):unpack()

if C.Theme.ThemeMod then else return end

local Class = select(2, UnitClass("player"))
local CustomClassColor = A.Colors.class[Class]

local OtherAddOns = CreateFrame("Frame")
OtherAddOns:RegisterEvent("PLAYER_LOGIN")
OtherAddOns:RegisterEvent("PLAYER_ENTERING_WORLD")
OtherAddOns:RegisterEvent("ADDON_LOADED")

OtherAddOns:SetScript("OnEvent", function(self, event, AddOn)
    if (AddOn == "Skada") then
		local SkadaDisplayBar = Skada.displays["bar"]
	    hooksecurefunc(SkadaDisplayBar, "ApplySettings", function(self, win)
		    local Skada = win.bargroup
			Skada:SetFont(C.Media.Font2, 12, "THINOUTLINE")
			Skada:SetTexture(C.Media.Texture)
			TitleFontSkada:SetFont(C.Media.Font2, 12, "THINOUTLINE")
		
			if (self.IsSkinned) then
	            return
	        end
			
			local Panel = CreateFrame("Frame", nil, Skada)
	        Panel:SetOutside()
	        Panel:SetFrameLevel(Skada:GetFrameLevel() + 5)
			Panel:SetTemplate(nil, nil, nil, nil, true)
		
			self.IsSkinned = true
		end)
	end
end)