--[[

	This file is part of 'Masque: Apathy', an add-on for World of Warcraft. For license information,
	please see the included License.txt file.

	* File...: Apathy.lua
	* Date...: 2016-07-25T23:55:25Z
	* Hash...: 9b26b44
	* Author.: StormFX

]]

local MSQ = LibStub("Masque", true)
if not MSQ then return end

-- Apathy
MSQ:AddSkin("Apathy", {
	Author = "StormFX",
	Version = "7.0.0",
	Shape = "Square",
	Masque_Version = 60200,
	Backdrop = {
		Width = 32,
		Height = 32,
		Texture = [[Interface\AddOns\Masque\SkinsModule\ApathyTextures\Backdrop]],
	},
	Icon = {
		Width = 28,
		Height = 28,
	},
	Flash = {
		Width = 32,
		Height = 32,
		Color = {1, 0, 0, 0.3},
		Texture = [[Interface\AddOns\Masque\SkinsModule\ApathyTextures\Overlay]],
	},
	Cooldown = {
		Width = 28,
		Height = 28,
	},
	ChargeCooldown = {
		Width = 28,
		Height = 28,
	},
	Pushed = {
		Width = 32,
		Height = 32,
		Color = {0, 0, 0, 0.5},
		Texture = [[Interface\AddOns\Masque\SkinsModule\ApathyTextures\Overlay]],
	},
	Normal = {
		Width = 32,
		Height = 32,
		Color = {0.3, 0.3, 0.3, 1},
		Texture = [[Interface\AddOns\Masque\SkinsModule\ApathyTextures\Normal]],
	},
	Disabled = {
		Hide = true,
	},
	Checked = {
		Width = 32,
		Height = 32,
		BlendMode = "ADD",
		Color = {0, 0.8, 1, 0.5},
		Texture = [[Interface\AddOns\Masque\SkinsModule\ApathyTextures\Border]],
	},
	Border = {
		Width = 32,
		Height = 32,
		BlendMode = "ADD",
		Texture = [[Interface\AddOns\Masque\SkinsModule\ApathyTextures\Border]],
	},
	Gloss = {
		Width = 32,
		Height = 32,
		Texture = [[Interface\AddOns\Masque\SkinsModule\ApathyTextures\Gloss]],
	},
	AutoCastable = {
		Width = 54,
		Height = 54,
		OffsetX = 0.5,
		OffsetY = -0.5,
		Texture = [[Interface\Buttons\UI-AutoCastableOverlay]],
	},
	Highlight = {
		Width = 32,
		Height = 32,
		BlendMode = "ADD",
		Color = {1, 1, 1, 0.5},
		Texture = [[Interface\AddOns\Masque\SkinsModule\ApathyTextures\Highlight]],
	},
	Name = {
		Width = 32,
		Height = 10,
		OffsetX = 1,
		OffsetY = 6,
	},
	Count = {
		Width = 32,
		Height = 10,
		OffsetX = -4,
		OffsetY = 7,
	},
	HotKey = {
		Width = 32,
		Height = 10,
		OffsetY = -7,
	},
	Duration = {
		Width = 32,
		Height = 10,
		OffsetY = -2,
	},
	Shine = {
		Width = 26,
		Height = 26,
		OffsetX = 1,
		OffsetY = -1,
	},
}, true)

-- Apathy: No Shadow
MSQ:AddSkin("Apathy: No Shadow", {
	Template = "Apathy",
	Normal = {
		Width = 32,
		Height = 32,
		Color = {0.3, 0.3, 0.3, 1},
		Texture = [[Interface\AddOns\Masque\SkinsModule\ApathyTextures\Normal_NS]],
	},
}, true)
