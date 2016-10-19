--[[

	This file is part of 'Masque: Onyx', an add-on for World of Warcraft. For license information,
	please see the included License.txt file.

	* File...: Onyx.lua
	* Date...: 2016-07-26T00:48:09Z
	* Hash...: ec07169
	* Author.: StormFX

]]

local MSQ = LibStub("Masque", true)
if not MSQ then return end

-- Onyx
MSQ:AddSkin("Onyx", {
	Author = "StormFX",
	Version = "7.0.0",
	Shape = "Square",
	Masque_Version = 60200,
	Backdrop = {
		Width = 40,
		Height = 40,
		Texture = [[Interface\AddOns\Masque\SkinsModule\OnyxTextures\Backdrop]],
	},
	Icon = {
		Width = 32,
		Height = 32,
	},
	Flash = {
		Width = 40,
		Height = 40,
		Color = {1, 0, 0, 0.3},
		Texture = [[Interface\AddOns\Masque\SkinsModule\OnyxTextures\Overlay]],
	},
	Cooldown = {
		Width = 36,
		Height = 36,
	},
	ChargeCooldown = {
		Width = 36,
		Height = 36,
	},
	Pushed = {
		Width = 40,
		Height = 40,
		Color = {0, 0, 0, 0.5},
		Texture = [[Interface\AddOns\Masque\SkinsModule\OnyxTextures\Overlay]],
	},
	Normal = {
		Width = 40,
		Height = 40,
		Texture = [[Interface\AddOns\Masque\SkinsModule\OnyxTextures\Classic]],
	},
	Disabled = {
		Hide = true,
	},
	Checked = {
		Width = 40,
		Height = 40,
		BlendMode = "ADD",
		Color = {0, 0.8, 1, 0.5},
		Texture = [[Interface\AddOns\Masque\SkinsModule\OnyxTextures\Arrow]],
	},
	Border = {
		Width = 40,
		Height = 40,
		BlendMode = "ADD",
		Texture = [[Interface\AddOns\Masque\SkinsModule\OnyxTextures\Arrow]],
	},
	Gloss = {
		Width = 40,
		Height = 40,
		Texture = [[Interface\AddOns\Masque\SkinsModule\OnyxTextures\Gloss]],
	},
	AutoCastable = {
		Width = 54,
		Height = 54,
		OffsetX = 0.5,
		OffsetY = -0.5,
		Texture = [[Interface\Buttons\UI-AutoCastableOverlay]],
	},
	Highlight = {
		Width = 40,
		Height = 40,
		BlendMode = "ADD",
		Color = {1, 0.9, 0, 0.8},
		Texture = [[Interface\AddOns\Masque\SkinsModule\OnyxTextures\Arrow]],
	},
	Name = {
		Width = 40,
		Height = 10,
		OffsetY = 5,
	},
	Count = {
		Width = 40,
		Height = 10,
		OffsetX = -4,
		OffsetY = 4,
	},
	HotKey = {
		Width = 40,
		Height = 10,
		OffsetX = -6,
		OffsetY = -5,
	},
	Duration = {
		Width = 40,
		Height = 10,
	},
	Shine = {
		Width = 24,
		Height = 24,
	},
}, true)

-- Onyx Redux
MSQ:AddSkin("Onyx Redux", {
	Template = "Onyx",
	Normal = {
		Width = 40,
		Height = 40,
		Texture = [[Interface\AddOns\Masque\SkinsModule\OnyxTextures\Redux]],
	},
	Checked = {
		Width = 40,
		Height = 40,
		BlendMode = "ADD",
		Color = {0, 0.75, 1, 0.5},
		Texture = [[Interface\AddOns\Masque\SkinsModule\OnyxTextures\Border]],
	},
	Border = {
		Width = 40,
		Height = 40,
		BlendMode = "ADD",
		Texture = [[Interface\AddOns\Masque\SkinsModule\OnyxTextures\Border]],
	},
	Highlight = {
		Width = 40,
		Height = 40,
		BlendMode = "ADD",
		Texture = [[Interface\AddOns\Masque\SkinsModule\OnyxTextures\Highlight]],
	},
}, true)
