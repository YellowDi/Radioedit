local E, L, V, P, G = unpack(ElvUI);
local UFB = E:GetModule('BuiUnits');

function UFB:Configure_Threat(frame)
	local threat = frame.ThreatIndicator
	local db = frame.db

	if db.threatStyle ~= 'NONE' and db.threatStyle ~= nil then
		threat:SetFrameStrata('MEDIUM')
		threat.glow:SetFrameStrata('MEDIUM')

		if db.threatStyle == "GLOW" then
			threat:SetFrameStrata('LOW')
			threat.glow:SetFrameStrata('LOW')
			threat.glow:ClearAllPoints()
			if frame.USE_POWERBAR_OFFSET then
				if frame.ORIENTATION == "RIGHT" then
					threat.glow:Point("TOPLEFT", frame.Health.backdrop, "TOPLEFT", -frame.SHADOW_SPACING - frame.SPACING, frame.SHADOW_SPACING + frame.SPACING + (frame.USE_CLASSBAR and (frame.USE_MINI_CLASSBAR and 0 or frame.CLASSBAR_HEIGHT)))
					threat.glow:Point("BOTTOMRIGHT", frame.Health.backdrop, "BOTTOMRIGHT", frame.SHADOW_SPACING + frame.SPACING, -frame.SHADOW_SPACING - frame.SPACING)
				else
					threat.glow:Point("TOPLEFT", frame.Health.backdrop, "TOPLEFT", -frame.SHADOW_SPACING - frame.SPACING, frame.SHADOW_SPACING + frame.SPACING + (frame.USE_CLASSBAR and (frame.USE_MINI_CLASSBAR and 0 or frame.CLASSBAR_HEIGHT) or 0))
					threat.glow:Point("BOTTOMRIGHT", frame.Health.backdrop, "BOTTOMRIGHT", frame.SHADOW_SPACING + frame.SPACING, -frame.SHADOW_SPACING - frame.SPACING)
				end

				threat.powerGlow:ClearAllPoints()
				threat.powerGlow:Point("TOPLEFT", frame.Power.backdrop, "TOPLEFT", -frame.SHADOW_SPACING - frame.SPACING, frame.SHADOW_SPACING + frame.SPACING)
				threat.powerGlow:Point("BOTTOMRIGHT", frame.Power.backdrop, "BOTTOMRIGHT", frame.SHADOW_SPACING + frame.SPACING, -frame.SHADOW_SPACING - frame.SPACING)
			else
				if frame.PORTRAIT_HEIGHT > 0 then
					threat:SetFrameStrata('MEDIUM')
					threat.glow:SetFrameStrata('MEDIUM')
					if frame.ORIENTATION == "RIGHT" then
						threat.glow:Point("TOPRIGHT", frame.Health.backdrop, "TOPRIGHT", frame.SHADOW_SPACING, frame.SHADOW_SPACING)
					else
						threat.glow:Point("TOPLEFT", frame.Health.backdrop, "TOPLEFT", -frame.SHADOW_SPACING, frame.SHADOW_SPACING)
					end
				else
					threat.glow:Point("TOPLEFT", -frame.SHADOW_SPACING, frame.SHADOW_SPACING-(frame.USE_MINI_CLASSBAR and frame.CLASSBAR_YOFFSET or 0))
				end
				
				if frame.USE_MINI_POWERBAR then
					threat.glow:Point("BOTTOMLEFT", -frame.SHADOW_SPACING, -frame.SHADOW_SPACING + (frame.POWERBAR_HEIGHT/2))
					threat.glow:Point("BOTTOMRIGHT", frame.SHADOW_SPACING, -frame.SHADOW_SPACING + (frame.POWERBAR_HEIGHT/2))
				else
					threat.glow:Point("BOTTOMLEFT", -frame.SHADOW_SPACING, -frame.SHADOW_SPACING)
					threat.glow:Point("BOTTOMRIGHT", frame.SHADOW_SPACING, -frame.SHADOW_SPACING)
				end
			end
		elseif db.threatStyle == "ICONTOPLEFT" or db.threatStyle == "ICONTOPRIGHT" or db.threatStyle == "ICONBOTTOMLEFT" or db.threatStyle == "ICONBOTTOMRIGHT" or db.threatStyle == "ICONTOP" or db.threatStyle == "ICONBOTTOM" or db.threatStyle == "ICONLEFT" or db.threatStyle == "ICONRIGHT" then
			threat:SetFrameStrata('HIGH')
			local point = db.threatStyle
			point = point:gsub("ICON", "")

			threat.texIcon:ClearAllPoints()
			threat.texIcon:Point(point, frame.Health, point)
		end
	end
end