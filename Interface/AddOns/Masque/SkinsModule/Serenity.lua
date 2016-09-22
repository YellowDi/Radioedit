--[[

	This file is part of 'Masque: Serenity', an add-on for World of Warcraft. For license information,
	please see the included License.txt file.

	* File...: Serenity.lua
	* Date...: 2016-07-26T00:41:58Z
	* Hash...: 8cdd45b
	* Author.: StormFX

]]

local MSQ = LibStub("Masque", true)
if not MSQ then return end

-- Serenity
MSQ:AddSkin("Serenity", {
	Author = "StormFX",
	Version = "7.0.0",
	Shape = "Circle",
	Masque_Version = 60200,
	Backdrop = {
		Width = 44,
		Height = 44,
		Texture = [[Interface\AddOns\Masque\SkinsModule\SerenityTextures\Round\Backdrop]],
	},
	Icon = {
		Width = 26,
		Height = 26,
		TexCoords = {0.07,0.93,0.07,0.93},
	},
	Flash = {
		Width = 44,
		Height = 44,
		Color = {1, 0, 0, 1},
		Texture = [[Interface\AddOns\Masque\SkinsModule\SerenityTextures\Round\Overlay]],
	},
	Cooldown = {
		Width = 26,
		Height = 26,
	},
	ChargeCooldown = {
		Width = 26,
		Height = 26,
	},
	Pushed = {
		Width = 44,
		Height = 44,
		Color = {0, 0, 0, 1},
		Texture = [[Interface\AddOns\Masque\SkinsModule\SerenityTextures\Round\Overlay]],
	},
	Normal = {
		Width = 44,
		Height = 44,
		Texture = [[Interface\AddOns\Masque\SkinsModule\SerenityTextures\Round\Normal]],
	},
	Disabled = {
		Hide = true,
	},
	Checked = {
		Width = 44,
		Height = 44,
		BlendMode = "ADD",
		Color = {0, 0.8, 1, 0.8},
		Texture = [[Interface\AddOns\Masque\SkinsModule\SerenityTextures\Round\Border]],
	},
	Border = {
		Width = 44,
		Height = 44,
		BlendMode = "ADD",
		Texture = [[Interface\AddOns\Masque\SkinsModule\SerenityTextures\Round\Border]],
	},
	Gloss = {
		Width = 44,
		Height = 44,
		Texture = [[Interface\AddOns\Masque\SkinsModule\SerenityTextures\Round\Gloss]],
	},
	AutoCastable = {
		Width = 48,
		Height = 48,
		Texture = [[Interface\Buttons\UI-AutoCastableOverlay]],
	},
	Highlight = {
		Width = 44,
		Height = 44,
		BlendMode = "ADD",
		Texture = [[Interface\AddOns\Masque\SkinsModule\SerenityTextures\Round\Highlight]],
	},
	Name = {
		Width = 44,
		Height = 12,
	},
	Count = {
		Width = 44,
		Height = 10,
	},
	HotKey = {
		Width = 44,
		Height = 10,
		OffsetX = -8,
		OffsetY = -3,
	},
	Duration = {
		Width = 44,
		Height = 10,
	},
	Shine = {
		Width = 24,
		Height = 24,
		OffsetX = 1,
		OffsetY = -1,
	},
}, true)

-- Serenity Redux
MSQ:AddSkin("Serenity Redux", {
	Template = "Serenity",
	Border = {
		Width = 44,
		Height = 44,
		BlendMode = "ADD",
		Texture = [[Interface\AddOns\Masque\SkinsModule\SerenityTextures\Round\Highlight]],
	},
}, true)

-- Serenity: Square
MSQ:AddSkin("Serenity: Square", {
	Author = "StormFX",
	Version = "7.0.0",
	Shape = "Square",
	Masque_Version = 60200,
	Backdrop = {
		Width = 40,
		Height = 40,
		Texture = [[Interface\AddOns\Masque\SkinsModule\SerenityTextures\Square\Backdrop]],
	},
	Icon = {
		Width = 26,
		Height = 26,
		TexCoords = {0.07,0.93,0.07,0.93},
	},
	Flash = {
		Width = 40,
		Height = 40,
		Color = {1, 0, 0, 1},
		Texture = [[Interface\AddOns\Masque\SkinsModule\SerenityTextures\Square\Overlay]],
	},
	Cooldown = {
		Width = 26,
		Height = 26,
	},
	ChargeCooldown = {
		Width = 24,
		Height = 24,
	},
	Pushed = {
		Width = 40,
		Height = 40,
		Color = {0, 0, 0, 1},
		Texture = [[Interface\AddOns\Masque\SkinsModule\SerenityTextures\Square\Overlay]],
	},
	Normal = {
		Width = 40,
		Height = 40,
		Texture = [[Interface\AddOns\Masque\SkinsModule\SerenityTextures\Square\Normal]],
	},
	Disabled = {
		Hide = true,
	},
	Checked = {
		Width = 40,
		Height = 40,
		BlendMode = "ADD",
		Color = {0, 0.8, 1, 0.8},
		Texture = [[Interface\AddOns\Masque\SkinsModule\SerenityTextures\Square\Border]],
	},
	Border = {
		Width = 40,
		Height = 40,
		BlendMode = "ADD",
		Texture = [[Interface\AddOns\Masque\SkinsModule\SerenityTextures\Square\Border]],
	},
	Gloss = {
		Width = 40,
		Height = 40,
		Texture = [[Interface\AddOns\Masque\SkinsModule\SerenityTextures\Square\Gloss]],
	},
	AutoCastable = {
		Width = 48,
		Height = 48,
		Texture = [[Interface\Buttons\UI-AutoCastableOverlay]],
	},
	Highlight = {
		Width = 40,
		Height = 40,
		BlendMode = "ADD",
		Texture = [[Interface\AddOns\Masque\SkinsModule\SerenityTextures\Square\Highlight]],
	},
	Name = {
		Width = 40,
		Height = 10,
		OffsetY = 6,
	},
	Count = {
		Width = 40,
		Height = 10,
		OffsetX = -4,
		OffsetY = 5,
	},
	HotKey = {
		Width = 40,
		Height = 10,
		OffsetX = -7,
		OffsetY = -7,
	},
	Duration = {
		Width = 40,
		Height = 10,
	},
	Shine = {
		Width = 26,
		Height = 26,
		OffsetX = 1,
		OffsetY = -1,
	},
}, true)

-- Serenity: Square Redux
MSQ:AddSkin("Serenity: Square Redux", {
	Template = "Serenity: Square",
	Border = {
		Width = 40,
		Height = 40,
		BlendMode = "ADD",
		Texture = [[Interface\AddOns\Masque\SkinsModule\SerenityTextures\Square\Highlight]],
	},
}, true)
