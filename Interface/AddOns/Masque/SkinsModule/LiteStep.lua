--[[

	This file is part of 'Masque: LiteStep', an add-on for World of Warcraft. For license information,
	please see the included License.txt file.

	* File...: LiteStep.lua
	* Date...: 2016-07-26T00:35:55Z
	* Hash...: 4a85baa
	* Author.: StormFX

]]

local MSQ = LibStub("Masque", true)
if not MSQ then return end

-- LiteStep
MSQ:AddSkin("LiteStep", {
	Author = "StormFX",
	Version = "7.0.0",
	Shape = "Square",
	Masque_Version = 60200,
	Backdrop = {
		Width = 36,
		Height = 36,
		Texture = [[Interface\AddOns\Masque\SkinsModule\LiteStepTextures\Backdrop]],
	},
	Icon = {
		Width = 32,
		Height = 32,
		TexCoords = {0.07,0.93,0.07,0.93},
	},
	Flash = {
		Width = 36,
		Height = 36,
		Color = {1, 0, 0, 0.3},
		Texture = [[Interface\AddOns\Masque\SkinsModule\LiteStepTextures\Overlay]],
	},
	Cooldown = {
		Width = 32,
		Height = 32,
	},
	ChargeCooldown = {
		Width = 32,
		Height = 32,
	},
	Pushed = {
		Width = 36,
		Height = 36,
		Color = {0, 0, 0, 0.5},
		Texture = [[Interface\AddOns\Masque\SkinsModule\LiteStepTextures\Overlay]],
	},
	Normal = {
		Width = 36,
		Height = 36,
		Texture = [[Interface\AddOns\Masque\SkinsModule\LiteStepTextures\Normal]],
	},
	Disabled = {
		Hide = true,
	},
	Checked = {
		Width = 36,
		Height = 36,
		BlendMode = "ADD",
		Color = {0, 0.8, 1, 0.8},
		Texture = [[Interface\AddOns\Masque\SkinsModule\LiteStepTextures\Border]],
	},
	Border = {
		Width = 36,
		Height = 36,
		BlendMode = "ADD",
		Texture = [[Interface\AddOns\Masque\SkinsModule\LiteStepTextures\Border]],
	},
	Gloss = {
		Width = 36,
		Height = 36,
		Texture = [[Interface\AddOns\Masque\SkinsModule\LiteStepTextures\Gloss]],
	},
	AutoCastable = {
		Width = 64,
		Height = 64,
		OffsetX = 0.5,
		OffsetY = -0.5,
		Texture = [[Interface\Buttons\UI-AutoCastableOverlay]],
	},
	Highlight = {
		Width = 36,
		Height = 36,
		BlendMode = "ADD",
		Color = {1, 1, 1, 0.5},
		Texture = [[Interface\AddOns\Masque\SkinsModule\LiteStepTextures\Border]],
	},
	Name = {
		Width = 36,
		Height = 10,
		OffsetY = 4,
	},
	Count = {
		Width = 36,
		Height = 10,
		OffsetX = -1,
		OffsetY = 4,
	},
	HotKey = {
		Width = 36,
		Height = 10,
		OffsetX = -2,
		OffsetY = -5,
	},
	Duration = {
		Width = 36,
		Height = 10,
		OffsetY = -2,
	},
	Shine = {
		Width = 32,
		Height = 32,
		OffsetX = 1,
		OffsetY = -1,
	},
}, true)

-- LiteStep XLT
MSQ:AddSkin("LiteStep XLT", {
	Template = "LiteStep",
	Normal = {
		Width = 36,
		Height = 36,
		Texture = [[Interface\AddOns\Masque\SkinsModule\LiteStepTextures\Lite]],
	},
}, true)
