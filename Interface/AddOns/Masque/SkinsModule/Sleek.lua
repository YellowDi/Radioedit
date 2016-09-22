--[[ Sleek for Masque ]]

local MSQ = LibStub("Masque", true)
if not MSQ then return end

MSQ:AddSkin("Sleek",{
	Author = "Kallieen",
	Version = "6.2.0",
	Shape = "Square",
	Masque_Version = 60201,
	-- Skin data start.
	Backdrop = {
		Width = 28,
		Height = 28,
		Texture = [[Interface\AddOns\Masque\SkinsModule\SleekTextures\Background]],
		
	},
	Icon = {
		Width = 28,
		Height = 28,
		TexCoords = {0.09,0.90,0.09,0.90}, -- Keeps the icon from showing its "silvery" edges.
	},
	Border = {
		Width = 32,
		Height = 32,
		Texture = [[Interface\AddOns\Masque\SkinsModule\SleekTextures\Border]],
		BlendMode = "ADD",
	},
	Flash = {
		Width = 36,
		Height = 36,
		Texture = [[Interface\AddOns\Masque\SkinsModule\SleekTextures\Flash]],
	},
	Cooldown = {
		Width = 34,
		Height = 34,
	},
	ChargeCooldown = {
		Width = 34,
		Height = 34,
	},
	Shine = {
		Width = 30,
		Height = 30,
	},
	AutoCastable = {
		Width = 58,
		Height = 58,
		Texture = [[Interface\Buttons\UI-AutoCastableOverlay]],
	},
	Normal = {
		Width = 36,
		Height = 36,
		Static = true,
		Texture = [[Interface\AddOns\Masque\SkinsModule\SleekTextures\Normal]],
	},
	Pushed = {
		Width = 36,
		Height = 36,
		Texture = [[Interface\AddOns\Masque\SkinsModule\SleekTextures\Checked]],
		BlendMode = "ADD",
	},
	Disabled = {
		Hide = true,
	},
	Checked = {
		Width = 36,
		Height = 36,
		Texture = [[Interface\AddOns\Masque\SkinsModule\SleekTextures\Checked]],
		BlendMode = "ADD",
	},
	Gloss = {
		Height = 36,
		Width = 36,
		Texture = [[Interface\AddOns\Masque\SkinsModule\SleekTextures\Gloss]],
	},
	Highlight = {
		Width = 32,
		Height = 32,
		Texture = [[Interface\AddOns\Masque\SkinsModule\SleekTextures\Highlight]],
		BlendMode = "ADD",
	},
	HotKey = {
		Width = 36,
		Height = 5,
		OffsetX = 4,
		OffsetY = -1,
		Fontsize = 14,
	},
	Count = {
		Width = 36,
		Height = 5,
		OffsetX = 0,
		OffsetY = 5,
		Fontsize = 12,
	},
	Name = {
		Width = 36,
		Height = 10,
		OffsetY = 0,
	},
	-- Skin data end.

},true)
