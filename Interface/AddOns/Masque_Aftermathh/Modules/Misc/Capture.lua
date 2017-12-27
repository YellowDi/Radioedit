local A, C, M, L = select(2, ...):unpack()	

local Capture = CreateFrame("Frame")

function Capture:UpdateAlwaysUpFrame()
    local Frame = _G["WorldStateAlwaysUpFrame"]
	Frame:ClearAllPoints()
	Frame:Point("TOP", UIParent, -42, -24)
end

function Capture:UpdateCaptureBar()
	local Frame = NUM_EXTENDED_UI_FRAMES

	if (Frame) then
		for i = 1, Frame do
			local Bar = _G["WorldStateCaptureBar"..i]

			if (Bar) and Bar:IsVisible() then
				if (i == 1) then
					Bar:ClearAllPoints()
					Bar:Point("TOP", UIParent, "TOP", 0, -120)
				else
					Bar:ClearAllPoints()
					Bar:Point("TOPLEFT", _G["WorldStateCaptureBar"..i-1], "TOPLEFT", 0, -25)
				end
			end
		end
	end
end

function Capture:Enable()
	hooksecurefunc("UIParent_ManageFramePositions", Capture.UpdateCaptureBar)
	hooksecurefunc("WorldStateAlwaysUpFrame_Update", Capture.UpdateAlwaysUpFrame)
end

Capture:RegisterEvent("PLAYER_LOGIN")
Capture:RegisterEvent("PLAYER_ENTERING_WORLD")
Capture:RegisterEvent("ADDON_LOADED")

Capture:SetScript("OnEvent", function(self, event)
    if (event == "PLAYER_LOGIN") then
		Capture:Enable()
	end
end)
