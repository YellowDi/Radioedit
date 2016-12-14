----------------------------------------- Shadow skin for 6.2.2 ------------------------------------------

local MSQ = LibStub("Masque", true)
if not MSQ then return end
----------------------------------------------------------------------------------------------------------
--------------------------------------------- Masque: Shadow ---------------------------------------------
----------------------------------------------------------------------------------------------------------
MSQ:AddSkin("Masque: Shadow", 
{
	Author = "Fedorenko R.D. Афем-ЧерныйШрам",
	Version = "6.2.2",
	Shape = "Square",
	Masque_Version = 60201,
	Backdrop = {
		Width = 42,
		Height = 42,
		Color = {0.3, 0.3, 0.3, 1},
		Texture = [[Interface\Addons\Masque\SkinsModule\ShadowTextures\Shadow\Backdrop]],
	},
	Icon = {
		Width = 32,
		Height = 32,
		TexCoords = {0.08, 0.92, 0.08, 0.92},
	},
	Flash = {
		Width = 42,
		Height = 42,
		BlendMode = "ADD",
		Color = {0.5, 0, 1, 0.6},
		Texture = [[Interface\Addons\Masque\SkinsModule\ShadowTextures\Shadow\Overlay]],
	},
	Cooldown = {
		Width = 32,
		Height = 32,
	},
	ChargeCooldown = {
		Width = 32,
		Height = 32,
	},
	Shine = {
		Width = 32,
		Height = 32,
	},
	Normal = {
		Width = 42,
		Height = 42,
		Color = {0, 0, 0, 1},
		Texture = [[Interface\Addons\Masque\SkinsModule\ShadowTextures\Shadow\Normal]],
	},
	Pushed = {
		Width = 42,
		Height = 42,
		BlendMode = "ADD",
		Color = {1, 1, 1, 1},
		Texture = [[Interface\Addons\Masque\SkinsModule\ShadowTextures\Shadow\Highlight]],
	},
	Border = {
		Width = 42,
		Height = 42,
		BlendMode = "BLEND",
		Texture = [[Interface\Addons\Masque\SkinsModule\ShadowTextures\Shadow\Border]],
	},
	Disabled = {
		Width = 42,
		Height = 42,
		BlendMode = "BLEND",
		Color = {0.77, 0.12, 0.23, 1},
		Texture = [[Interface\Addons\Masque\SkinsModule\ShadowTextures\Shadow\Border]],
	},
	Checked = {
		Width = 42,
		Height = 42,
		BlendMode = "BLEND",
		Color = {0, 0.12, 1, 1},
		Texture = [[Interface\Addons\Masque\SkinsModule\ShadowTextures\Shadow\Border]],
	},
	AutoCastable = {
		Width = 42,
		Height = 42,
		Texture = [[Interface\Buttons\UI-AutoCastableOverlay]],
	},
	Highlight = {
		Width = 42,
		Height = 42,
		BlendMode = "ADD",
		Color = {0.5, 0, 1, 1},
		Texture = [[Interface\Addons\Masque\SkinsModule\ShadowTextures\Shadow\Highlight]],
	},
	Gloss = {
		Width = 42,
		Height = 42,
		BlendMode = "ADD",
		Color = {1, 1, 1, 1},
		Texture = [[Interface\Addons\Masque\SkinsModule\ShadowTextures\Shadow\Gloss]],
	},
	HotKey = {
		Width = 42,
		Height = 10,
		JustifyH = "RIGHT",
		JustifyV = "TOP",
		OffsetX = -2,
		OffsetY = -2,
	},
	Count = {
		Width = 42,
		Height = 10,
		JustifyH = "RIGHT",
		JustifyV = "BOTTOM",
		OffsetY = 1,
	},
	Name = {
		Width = 42,
		Height = 10,
		JustifyH = "CENTER",
		JustifyV = "BOTTOM",
		OffsetY = 2,
	},
}, true)
----------------------------------------------------------------------------------------------------------
-------------------------------------------- Masque: Shadow 1 --------------------------------------------
----------------------------------------------------------------------------------------------------------
MSQ:AddSkin("Masque: Shadow 1", 
{
	Author = "Fedorenko R.D. Афем-ЧерныйШрам",
	Version = "6.2.2",
	Shape = "Square",
	Masque_Version = 60201,
	Backdrop = {
		Width = 32,
		Height = 32,
		Texture = [[Interface\AddOns\Masque\SkinsModule\ShadowTextures\Shadow 1\Backdrop]],
	},
	Icon = {
		Width = 32,
		Height = 32,
		TexCoords = {0.08, 0.92, 0.08, 0.92},
	},
	Flash = {
		Width = 40,
		Height = 40,
		Color = {1, 0, 0, 1},
		Texture = [[Interface\AddOns\Masque\SkinsModule\ShadowTextures\Shadow 1\Overlay]],
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
		Width = 40,
		Height = 40,
		Color = {1, 1, 1, 1},
		Texture = [[Interface\AddOns\Masque\SkinsModule\ShadowTextures\Shadow 1\Overlay]],
	},
	Normal = {
		Width = 40,
		Height = 40,
		Texture = [[Interface\AddOns\Masque\SkinsModule\ShadowTextures\Shadow 1\Normal]],
	},
	Disabled = {
		Hide = true,
	},
	Checked = {
		Width = 40,
		Height = 40,
		BlendMode = "ADD",
		Color = {1, 1, 1, 0.2},
		Texture = [[Interface\AddOns\Masque\SkinsModule\ShadowTextures\Shadow 1\Highlight]],
	},
	Border = {
		Width = 40,
		Height = 40,
		BlendMode = "ADD",
		Texture = [[Interface\AddOns\Masque\SkinsModule\ShadowTextures\Shadow 1\Border]],
	},
	Gloss = {
		Width = 40,
		Height = 40,
		Texture = [[Interface\AddOns\Masque\SkinsModule\ShadowTextures\Shadow 1\Gloss]],
	},
	AutoCastable = {
		Width = 40,
		Height = 40,
		Texture = [[Interface\Buttons\UI-AutoCastableOverlay]],
	},
	Highlight = {
		Width = 40,
		Height = 40,
		BlendMode = "ADD",
		Color = {1, 1, 1, 1},
		Texture = [[Interface\AddOns\Masque\SkinsModule\ShadowTextures\Shadow 1\Highlight]],
	},
	Name = {
		Width = 42,
		Height = 10,
		JustifyH = "CENTER",
		JustifyV = "BOTTOM",
		OffsetY = 2,
	},
	Count = {
		Width = 42,
		Height = 10,
		JustifyH = "RIGHT",
		JustifyV = "BOTTOM",
		OffsetY = 1,
	},
	HotKey = {
		Width = 42,
		Height = 10,
		JustifyH = "RIGHT",
		JustifyV = "TOP",
		OffsetX = -2,
		OffsetY = -2,
	},
	Duration = {
		Width = 40,
		Height = 10,
		OffsetY = -2,
	},
	Shine = {
		Width = 38,
		Height = 38,
		OffsetX = 1,
		OffsetY = -1,
	},
}, true)
----------------------------------------------------------------------------------------------------------
-------------------------------------------- Masque: Shadow 2 --------------------------------------------
----------------------------------------------------------------------------------------------------------
MSQ:AddSkin("Masque: Shadow 2", 
{
	Author = "Fedorenko R.D. Афем-ЧерныйШрам",
	Version = "6.2.2",
	Shape = "Square",
	Masque_Version = 60201,
	Backdrop = {
		Width = 42,
		Height = 42,
		Color = {0.3, 0.3, 0.3, 1},
		Texture = [[Interface\Addons\Masque\SkinsModule\ShadowTextures\Shadow 2\Backdrop]],
	},
	Icon = {
		Width = 32,
		Height = 32,
		TexCoords = {0.08, 0.92, 0.08, 0.92},
	},
	Flash = {
		Width = 42,
		Height = 42,
		BlendMode = "ADD",
		Color = {0.5, 0, 1, 0.6},
		Texture = [[Interface\Addons\Masque\SkinsModule\ShadowTextures\Shadow 2\Overlay]],
	},
	Cooldown = {
		Width = 32,
		Height = 32,
	},
	ChargeCooldown = {
		Width = 32,
		Height = 32,
	},
	Shine = {
		Width = 32,
		Height = 32,
	},
	Normal = {
		Width = 42,
		Height = 42,
		Color = {0, 0, 0, 1},
		Texture = [[Interface\Addons\Masque\SkinsModule\ShadowTextures\Shadow 2\Normal]],
	},
	Pushed = {
		Width = 42,
		Height = 42,
		BlendMode = "ADD",
		Color = {1, 1, 1, 1},
		Texture = [[Interface\Addons\Masque\SkinsModule\ShadowTextures\Shadow 2\Highlight]],
	},
	Border = {
		Width = 42,
		Height = 42,
		BlendMode = "BLEND",
		Texture = [[Interface\Addons\Masque\SkinsModule\ShadowTextures\Shadow 2\Border]],
	},
	Disabled = {
		Width = 42,
		Height = 42,
		BlendMode = "BLEND",
		Color = {0.77, 0.12, 0.23, 1},
		Texture = [[Interface\Addons\Masque\SkinsModule\ShadowTextures\Shadow 2\Border]],
	},
	Checked = {
		Width = 42,
		Height = 42,
		BlendMode = "BLEND",
		Color = {0, 0.12, 1, 1},
		Texture = [[Interface\Addons\Masque\SkinsModule\ShadowTextures\Shadow 2\Border]],
	},
	AutoCastable = {
		Width = 42,
		Height = 42,
		Texture = [[Interface\Buttons\UI-AutoCastableOverlay]],
	},
	Highlight = {
		Width = 42,
		Height = 42,
		BlendMode = "ADD",
		Color = {0.5, 0, 1, 1},
		Texture = [[Interface\Addons\Masque\SkinsModule\ShadowTextures\Shadow 2\Highlight]],
	},
	Gloss = {
		Width = 42,
		Height = 42,
		BlendMode = "ADD",
		Color = {1, 1, 1, 1},
		Texture = [[Interface\Addons\Masque\SkinsModule\ShadowTextures\Shadow 2\Gloss]],
	},
	HotKey = {
		Width = 42,
		Height = 10,
		JustifyH = "RIGHT",
		JustifyV = "TOP",
		OffsetX = -2,
		OffsetY = -2,
	},
	Count = {
		Width = 42,
		Height = 10,
		JustifyH = "RIGHT",
		JustifyV = "BOTTOM",
		OffsetY = 1,
	},
	Name = {
		Width = 42,
		Height = 10,
		JustifyH = "CENTER",
		JustifyV = "BOTTOM",
		OffsetY = 2,
	},
}, true)
----------------------------------------------------------------------------------------------------------
-------------------------------------------- Masque: Shadow 3 --------------------------------------------
----------------------------------------------------------------------------------------------------------
MSQ:AddSkin("Masque: Shadow 3", 
{
	Author = "Fedorenko R.D. Афем-ЧерныйШрам",
	Version = "6.2.2",
	Shape = "Square",
	Masque_Version = 60201,
	Backdrop = {
		Width = 33,
		Height = 33,
		Color = {0.3, 0.3, 0.3, 1},
		Texture = [[Interface\Addons\Masque\SkinsModule\ShadowTextures\Shadow 3\Backdrop]],
	},
	Icon = {
		Width = 32,
		Height = 32,
		TexCoords = {0.08, 0.92, 0.08, 0.92},
	},
	Flash = {
		Width = 33,
		Height = 33,
		BlendMode = "ADD",
		Color = {0.5, 0, 1, 0.6},
		Texture = [[Interface\Addons\Masque\SkinsModule\ShadowTextures\Shadow 3\Overlay]],
	},
	Cooldown = {
		Width = 33,
		Height = 33,
	},
	Shine = {
		Width = 33,
		Height = 33,
	},
	Normal = {
		Width = 33,
		Height = 33,
		Color = {0, 0, 0, 1},
		Texture = [[Interface\Addons\Masque\SkinsModule\ShadowTextures\Shadow 3\Normal]],
	},
	Pushed = {
		Width = 33,
		Height = 33,
		BlendMode = "ADD",
		Color = {1, 1, 1, 1},
		Texture = [[Interface\Addons\Masque\SkinsModule\ShadowTextures\Shadow 3\Highlight]],
	},
	Border = {
		Width = 33,
		Height = 33,
		BlendMode = "BLEND",
		Texture = [[Interface\Addons\Masque\SkinsModule\ShadowTextures\Shadow 3\Border]],
	},
	Disabled = {
		Width = 33,
		Height = 33,
		BlendMode = "BLEND",
		Color = {0.77, 0.12, 0.23, 1},
		Texture = [[Interface\Addons\Masque\SkinsModule\ShadowTextures\Shadow 3\Border]],
	},
	Checked = {
		Width = 33,
		Height = 33,
		BlendMode = "BLEND",
		Color = {0, 0.12, 1, 1},
		Texture = [[Interface\Addons\Masque\SkinsModule\ShadowTextures\Shadow 3\Border]],
	},
	AutoCastable = {
		Width = 33,
		Height = 33,
		Texture = [[Interface\Buttons\UI-AutoCastableOverlay]],
	},
	Highlight = {
		Width = 33,
		Height = 33,
		BlendMode = "ADD",
		Color = {0.5, 0, 1, 1},
		Texture = [[Interface\Addons\Masque\SkinsModule\ShadowTextures\Shadow 3\Highlight]],
	},
	Gloss = {
		Width = 33,
		Height = 33,
		BlendMode = "ADD",
		Color = {1, 1, 1, 1},
		Texture = [[Interface\Addons\Masque\SkinsModule\ShadowTextures\Shadow 3\Gloss]],
	},
	HotKey = {
		Width = 33,
		Height = 10,
		JustifyH = "RIGHT",
		JustifyV = "TOP",
		OffsetX = -2,
		OffsetY = -2,
	},
	Count = {
		Width = 33,
		Height = 10,
		JustifyH = "RIGHT",
		JustifyV = "BOTTOM",
		OffsetY = 1,
	},
	Name = {
		Width = 33,
		Height = 10,
		JustifyH = "CENTER",
		JustifyV = "BOTTOM",
		OffsetY = 2,
	},
}, true)