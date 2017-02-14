local _, private = ...

-- [[ Lua Globals ]]
local _G = _G
local select = _G.select

-- [[ Core ]]
local F, C = _G.unpack(private.Aurora)

_G.tinsert(C.themes["Aurora"], function()
	local function restyleGarrisonFollowerTooltipTemplate(frame)
		for i = 1, 9 do
			select(i, frame:GetRegions()):Hide()
		end

		F.CreateBD(frame)
	end

	local function restyleGarrisonFollowerAbilityTooltipTemplate(frame)
		for i = 1, 9 do
			select(i, frame:GetRegions()):Hide()
		end

		local icon = frame.Icon

		icon:SetTexCoord(.08, .92, .08, .92)
		F.CreateBG(icon)

		F.CreateBD(frame)
	end

	restyleGarrisonFollowerTooltipTemplate(_G.GarrisonFollowerTooltip)
	restyleGarrisonFollowerAbilityTooltipTemplate(_G.GarrisonFollowerAbilityTooltip)

	restyleGarrisonFollowerTooltipTemplate(_G.FloatingGarrisonFollowerTooltip)
	F.ReskinClose(_G.FloatingGarrisonFollowerTooltip.CloseButton)

	restyleGarrisonFollowerAbilityTooltipTemplate(_G.FloatingGarrisonFollowerAbilityTooltip)
	F.ReskinClose(_G.FloatingGarrisonFollowerAbilityTooltip.CloseButton)

	_G.hooksecurefunc("GarrisonFollowerTooltipTemplate_SetGarrisonFollower", function(tooltipFrame)
		-- Abilities

		if tooltipFrame.numAbilitiesStyled == nil then
			tooltipFrame.numAbilitiesStyled = 1
		end

		local numAbilitiesStyled = tooltipFrame.numAbilitiesStyled

		local abilities = tooltipFrame.Abilities

		local ability = abilities[numAbilitiesStyled]
		while ability do
			local icon = ability.Icon

			icon:SetTexCoord(.08, .92, .08, .92)
			F.CreateBG(icon)

			numAbilitiesStyled = numAbilitiesStyled + 1
			ability = abilities[numAbilitiesStyled]
		end

		tooltipFrame.numAbilitiesStyled = numAbilitiesStyled

		-- Traits

		if tooltipFrame.numTraitsStyled == nil then
			tooltipFrame.numTraitsStyled = 1
		end

		local numTraitsStyled = tooltipFrame.numTraitsStyled

		local traits = tooltipFrame.Traits

		local trait = traits[numTraitsStyled]
		while trait do
			local icon = trait.Icon

			icon:SetTexCoord(.08, .92, .08, .92)
			F.CreateBG(icon)

			numTraitsStyled = numTraitsStyled + 1
			trait = traits[numTraitsStyled]
		end

		tooltipFrame.numTraitsStyled = numTraitsStyled
	end)

	-- Mission tooltip

	restyleGarrisonFollowerTooltipTemplate(_G.FloatingGarrisonMissionTooltip)
	F.ReskinClose(_G.FloatingGarrisonMissionTooltip.CloseButton)
end)
