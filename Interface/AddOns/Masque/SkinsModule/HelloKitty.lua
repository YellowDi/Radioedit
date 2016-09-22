--[[
	This file is part of the Hello Kitty Skin for Masque, a World of Warcraft addon.
	File: HelloKitty.lua
	License: License.txt
	Change Log: ChangeLog.txt
]]

local MSQ = LibStub("Masque", true)
if not MSQ then return end

MSQ:AddSkin("Hello Kitty", {
	Author = "At",
	Version = "6.2.03",
	Shape = "Circle",
	Masque_Version = 60201,


	Backdrop = {
		Width = 36,
		Height = 36,
	},
	Icon = {
		Width = 21,
		Height = 21,
		OffsetY = -2,
		TexCoords = {0.07,0.93,0.07,0.93},
	},
	Flash = {
		Width = 36,
		Height = 36,
		Texture = [[Interface\AddOns\Masque\SkinsModule\HelloKittyTextures\Default\HKFlash]],
	},
	Cooldown = {
		Width = 21,
		Height = 21,
		OffsetX = 0,
		OffsetY = -2,
	},
	ChargeCooldown = {
		Width = 21,
		Height = 21,
		OffsetX = 0,
		OffsetY = -2,
	},
	Pushed = {
		Width = 36,
		Height = 36,
		Texture = [[Interface\AddOns\Masque\SkinsModule\HelloKittyTextures\Default\HKPushed]],
	},
	Normal = {
		Width = 36,
		Height = 36,
		Texture = [[Interface\AddOns\Masque\SkinsModule\HelloKittyTextures\Default\HKNormal]],
		Static = true,
		Color = {0.65, 0.65, 0.7, 1},
	},
	Disabled = {
		Hide = true,
	},
	Checked = {
		Width = 36,
		Height = 36,
		Texture = [[Interface\AddOns\Masque\SkinsModule\HelloKittyTextures\Default\HKNormal]],
	},
	Border = {
		Width = 36,
		Height = 36,
		Texture = [[Interface\AddOns\Masque\SkinsModule\HelloKittyTextures\Default\HKNormal]],
	},
	AutoCastable = {
		Width = 32,
		Height = 32,
		Texture = [[Interface\Buttons\UI-AutoCastableOverlay]],
	},
	Highlight = {
		Width = 36,
		Height = 36,
		Texture = [[Interface\AddOns\Masque\SkinsModule\HelloKittyTextures\Default\HKHighlight]],
	},
	Gloss = {
		Width = 36,
		Height = 36,
		Texture = [[Interface\AddOns\Masque\SkinsModule\HelloKittyTextures\Default\HKGloss]],
	},
	HotKey = {
		Width = 32,
		Height = 10,
		OffsetX = 3,
		OffsetY = -4,
	},
	Count = {
		Width = 21,
		Height = 10,
		OffsetX = -1,
		OffsetY = 2,
	},
	Name = {
		Width = 32,
		Height = 10,
		OffsetY = 4,
	},
	Duration = {
		Width = 21,
		Height = 8,
		OffsetY = -4,
	},
	Shine = {
		Width = 32,
		Height = 32,
		OffsetX = 0.5,
		OffsetY = -0.5
	},
}, true)

MSQ:AddSkin("Hello Kitty Xmas", {
	Author = "At",
	Version = "6.2.03",
	Shape = "Circle",
	Masque_Version = 60200,


	Backdrop = {
		Width = 36,
		Height = 36,
	},
	Icon = {
		Width = 21,
		Height = 21,
		OffsetY = -2,
		TexCoords = {0.07,0.93,0.07,0.93},
	},
	Flash = {
		Width = 36,
		Height = 36,
		Texture = [[Interface\AddOns\Masque\SkinsModule\HelloKittyTextures\Default\HKFlash]],
	},
	Cooldown = {
		Width = 21,
		Height = 21,
		OffsetX = 0,
		OffsetY = -2,
	},
	Pushed = {
		Width = 36,
		Height = 36,
		Texture = [[Interface\AddOns\Masque\SkinsModule\HelloKittyTextures\XmasKitty\HKXmasPushed]],
	},
	Normal = {
		Width = 36,
		Height = 36,
		Texture = [[Interface\AddOns\Masque\SkinsModule\HelloKittyTextures\XmasKitty\HKXmasNormal]],
		Static = true,
		Color = {0.65, 0.65, 0.7, 1},
	},
	Disabled = {
		Hide = true,
	},
	Checked = {
		Width = 36,
		Height = 36,
		Texture = [[Interface\AddOns\Masque\SkinsModule\HelloKittyTextures\XmasKitty\HKXmasNormal]],
	},
	Border = {
		Width = 36,
		Height = 36,
		Texture = [[Interface\AddOns\Masque\SkinsModule\HelloKittyTextures\XmasKitty\HKXmasNormal]],
	},
	AutoCastable = {
		Width = 32,
		Height = 32,
		Texture = [[Interface\Buttons\UI-AutoCastableOverlay]],
	},
	Highlight = {
		Width = 36,
		Height = 36,
		Texture = [[Interface\AddOns\Masque\SkinsModule\HelloKittyTextures\XmasKitty\HKXmasNormal]],
	},
	Gloss = {
		Width = 36,
		Height = 36,
		Texture = [[Interface\AddOns\Masque\SkinsModule\HelloKittyTextures\Default\HKGloss]],
	},
	HotKey = {
		Width = 32,
		Height = 10,
		OffsetX = 3,
		OffsetY = -4,
	},
	Count = {
		Width = 21,
		Height = 10,
		OffsetX = -1,
		OffsetY = 2,
	},
	Name = {
		Width = 32,
		Height = 10,
		OffsetY = 4,
	},
	Duration = {
		Width = 21,
		Height = 8,
		OffsetY = -4,
	},
	AutoCast = {
		Width = 32,
		Height = 32,
		OffsetX = 0.5,
		OffsetY = -0.5
	},
}, true)

MSQ:AddSkin("Hello Kitty Ninja", {
	Author = "At",
	Version = "6.2.03",
	Shape = "Circle",
	Masque_Version = 60200,


	Backdrop = {
		Width = 36,
		Height = 36,
	},
	Icon = {
		Width = 21,
		Height = 21,
		OffsetY = -2,
		TexCoords = {0.07,0.93,0.07,0.93},
	},
	Flash = {
		Width = 36,
		Height = 36,
		Texture = [[Interface\AddOns\Masque\SkinsModule\HelloKittyTextures\Default\HKFlash]],
	},
	Cooldown = {
		Width = 21,
		Height = 21,
		OffsetX = 0,
		OffsetY = -2,
	},
	Pushed = {
		Width = 36,
		Height = 36,
		Texture = [[Interface\AddOns\Masque\SkinsModule\HelloKittyTextures\NinjaKitty\HKNinjaPushed]],
	},
	Normal = {
		Width = 36,
		Height = 36,
		Texture = [[Interface\AddOns\Masque\SkinsModule\HelloKittyTextures\NinjaKitty\HKNinjaNormal]],
		Static = true,
		Color = {0.65, 0.65, 0.7, 1},
	},
	Disabled = {
		Hide = true,
	},
	Checked = {
		Width = 36,
		Height = 36,
		Texture = [[Interface\AddOns\Masque\SkinsModule\HelloKittyTextures\NinjaKitty\HKNinjaNormal]],
	},
	Border = {
		Width = 36,
		Height = 36,
		Texture = [[Interface\AddOns\Masque\SkinsModule\HelloKittyTextures\NinjaKitty\HKNinjaNormal]],
	},
	AutoCastable = {
		Width = 32,
		Height = 32,
		Texture = [[Interface\Buttons\UI-AutoCastableOverlay]],
	},
	Highlight = {
		Width = 36,
		Height = 36,
		Texture = [[Interface\AddOns\Masque\SkinsModule\HelloKittyTextures\NinjaKitty\HKNinjaNormal]],
	},
	Gloss = {
		Width = 36,
		Height = 36,
		Texture = [[Interface\AddOns\Masque\SkinsModule\HelloKittyTextures\Default\HKGloss]],
	},
	HotKey = {
		Width = 32,
		Height = 10,
		OffsetX = 3,
		OffsetY = -4,
	},
	Count = {
		Width = 21,
		Height = 10,
		OffsetX = -1,
		OffsetY = 2,
	},
	Name = {
		Width = 32,
		Height = 10,
		OffsetY = 4,
	},
	Duration = {
		Width = 21,
		Height = 8,
		OffsetY = -4,
	},
	AutoCast = {
		Width = 32,
		Height = 32,
		OffsetX = 0.5,
		OffsetY = -0.5
	},
}, true)

MSQ:AddSkin("Hello Kitty Goth", {
	Author = "At",
	Version = "6.2.03",
	Shape = "Circle",
	Masque_Version = 60200,


	Backdrop = {
		Width = 36,
		Height = 36,
	},
	Icon = {
		Width = 21,
		Height = 21,
		OffsetY = -2,
		TexCoords = {0.07,0.93,0.07,0.93},
	},
	Flash = {
		Width = 36,
		Height = 36,
		Texture = [[Interface\AddOns\Masque\SkinsModule\HelloKittyTextures\Default\HKFlash]],
	},
	Cooldown = {
		Width = 21,
		Height = 21,
		OffsetX = 0,
		OffsetY = -2,
	},
	Pushed = {
		Width = 36,
		Height = 36,
		Texture = [[Interface\AddOns\Masque\SkinsModule\HelloKittyTextures\GothKitty\HKGothPushed]],
	},
	Normal = {
		Width = 36,
		Height = 36,
		Texture = [[Interface\AddOns\Masque\SkinsModule\HelloKittyTextures\GothKitty\HKGothNormal]],
		Static = true,
		Color = {0.65, 0.65, 0.7, 1},
	},
	Disabled = {
		Hide = true,
	},
	Checked = {
		Width = 36,
		Height = 36,
		Texture = [[Interface\AddOns\Masque\SkinsModule\HelloKittyTextures\GothKitty\HKGothNormal]],
	},
	Border = {
		Width = 36,
		Height = 36,
		Texture = [[Interface\AddOns\Masque\SkinsModule\HelloKittyTextures\GothKitty\HKGothNormal]],
	},
	AutoCastable = {
		Width = 32,
		Height = 32,
		Texture = [[Interface\Buttons\UI-AutoCastableOverlay]],
	},
	Highlight = {
		Width = 36,
		Height = 36,
		Texture = [[Interface\AddOns\Masque\SkinsModule\HelloKittyTextures\GothKitty\HKGothNormal]],
	},
	Gloss = {
		Width = 36,
		Height = 36,
		Texture = [[Interface\AddOns\Masque\SkinsModule\HelloKittyTextures\Default\HKGloss]],
	},
	HotKey = {
		Width = 32,
		Height = 10,
		OffsetX = 3,
		OffsetY = -4,
	},
	Count = {
		Width = 21,
		Height = 10,
		OffsetX = -1,
		OffsetY = 2,
	},
	Name = {
		Width = 32,
		Height = 10,
		OffsetY = 4,
	},
	Duration = {
		Width = 21,
		Height = 8,
		OffsetY = -4,
	},
	AutoCast = {
		Width = 32,
		Height = 32,
		OffsetX = 0.5,
		OffsetY = -0.5
	},
}, true)