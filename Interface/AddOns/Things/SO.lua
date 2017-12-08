--------------------------
-- SO.lua
-- Author: CN-∞¢¬¸ƒ·-DeathKnight-» ’ﬂüoî≥:YY132359
-- Date: 2017/7/15
-- ÷ÿ‘ÿ√¸¡Ó/Õ¯∏Ò–£’˝"√¸¡Ó:/SO 32 /SO 64 /SO 128"
--------------------------
-- Slah Command for activation - Usage : /so <value>
SLASH_SOEREA1 = "/so"

-- local variables for frame and line points
local frame
local w
local h

SlashCmdList["SOEREA"] = function(msg, editbox)
	-- hiding grid if already enabled
	if frame then
		frame:Hide()
		frame = nil		
	else
	-- cases for grid size
		if msg == '128' then
			w = 128
			h = 72
		elseif msg == '96' then
			w = 96
			h = 54
		elseif msg == '64' then
			w = 64
			h = 36
		elseif msg == '32' then
			w = 32
			h = 18
		elseif msg == 'uw' then
			w = 128
			h = 54
		elseif msg == 'uw2' then
			w = 86
			h = 36
		elseif msg == '4k' then
			w = 128
			h = 72
		else
		-- grid size reset
			w = nil
			w = nil
		end
		-- check for corrrect grid case, if incorrect print usage and end
		if w == nil then
			print("Usage: '/so <value>' Value options are '32'/'64'/'96'/'128' or 'uw'/'uw2'/'4k' for Ultrawide Monitors")
		else
		-- determin grid line points
			local lines_w = GetScreenWidth() / w
			local lines_h = GetScreenHeight() / h
		-- create frame
			frame = CreateFrame('Frame', nil, UIParent) 
			frame:SetAllPoints(UIParent)
		-- build horizontal lines
			for i = 0, w do
				local line_texture = frame:CreateTexture(nil, 'BACKGROUND')
				if i == w/2 then
					line_texture:SetColorTexture(1, 0, 0, 0.5)
				else
					line_texture:SetColorTexture(0, 0, 0, 0.1)
				end
				line_texture:SetPoint('TOPLEFT', frame, 'TOPLEFT', i * lines_w - 1, 0)
				line_texture:SetPoint('BOTTOMRIGHT', frame, 'BOTTOMLEFT', i * lines_w + 1, 0)
			end
		-- build vertical lines
			for i = 0, h do
				local line_texture = frame:CreateTexture(nil, 'BACKGROUND')
				if i == h/2 then
					line_texture:SetColorTexture(1, 0, 0, 0.5)
				else
					line_texture:SetColorTexture(0, 0, 0, 0.5)
				end
					line_texture:SetPoint('TOPLEFT', frame, 'TOPLEFT', 0, -i * lines_h + 1)
					line_texture:SetPoint('BOTTOMRIGHT', frame, 'TOPRIGHT', 0, -i * lines_h - 1)
			end
		end	
	end
end