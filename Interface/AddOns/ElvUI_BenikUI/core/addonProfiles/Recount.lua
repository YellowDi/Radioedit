﻿local E, L, V, P, G = unpack(ElvUI);
local BUI = E:GetModule('BenikUI');

function BUI:LoadRecountProfile()
	local font
	local key = BUI.AddonProfileKey

	if E.private.benikui.expressway == true then
		font = "Expressway"
	else
		font = "Bui Prototype"
	end

	if RecountDB['profiles'][key] == nil then
		RecountDB['profiles'][key] = {
			['Colors'] = {
				['Other Windows'] = {
					['Title Text'] = {
						['g'] = 0.5,
						['b'] = 0,
					},
				},
				['Window'] = {
					['Title Text'] = {
						['g'] = 0.5,
						['b'] = 0,
					},
				},
				['Bar'] = {
					['Bar Text'] = {
						['a'] = 1,
					},
					['Total Bar'] = {
						['a'] = 1,
					},
				},
			},
			['DetailWindowY'] = 0,
			['DetailWindowX'] = 0,
			['GraphWindowX'] = 0,
			['Locked'] = true,
			['FrameStrata'] = '2-LOW',
			['BarTextColorSwap'] = true,
			['BarTexture'] = 'BuiEmpty',
			['CurDataSet'] = 'OverallData',
			['ClampToScreen'] = true,
			['Font'] = font,
		}
		Recount.db:SetProfile(key)

		if BUI.isInstallerRunning == false then -- don't print during Install, when applying profile that doesn't exist
			print(BUI.profileStrings[1]..L['Recount'])
		end
	else
		print(BUI.Title.."- "..L['Recount']..BUI.profileStrings[2])
	end
end