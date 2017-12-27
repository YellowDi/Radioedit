local A, C, M, L = select(2, ...):unpack()

C["Media"] = {
	["Font"] = [=[Interface\Addons\AftermathhUI\Medias\Fonts\Avant_Garde.ttf]=],
	["Font2"] = [=[Interface\Addons\AftermathhUI\Medias\Fonts\Franklin_Gothic.ttf]=],

	["Blank"] = "Interface\\Buttons\\WHITE8x8",
	["Blank2"] = [[Interface\AddOns\AftermathhUI\Medias\Textures\Blank.blp]],
	["Texture"] = [[Interface\AddOns\AftermathhUI\Medias\Textures\Texture.tga]],
	["Texture2"] = [[Interface\AddOns\AftermathhUI\Medias\Textures\Metal.tga]],
	["Backdrop"] = [[Interface\AddOns\AftermathhUI\Medias\Textures\BackdropBlizz.tga]],
	["BorderOverlay"] = [[Interface\AddOns\AftermathhUI\Medias\Textures\Overlay.tga]],
	["Shadow"] = [[Interface\AddOns\AftermathhUI\Medias\Textures\GlowTex.tga]],

	["Mail"] = [[Interface\AddOns\AftermathhUI\Medias\Textures\Mail.tga]],
	["LFD"] = [[Interface\AddOns\AftermathhUI\Medias\Textures\LFD.tga]],
	["ChatCopy"] = [[Interface\AddOns\AftermathhUI\Medias\Textures\ChatCopy.blp]],
	
	["ScrollArrowDown"] = [[Interface\AddOns\AftermathhUI\Medias\Textures\ArrowDown.blp]],
	["ScrollArrowUp"] = [[Interface\AddOns\AftermathhUI\Medias\Textures\ArrowUp.blp]],
	["PowerArrowUp"] = [[Interface\AddOns\AftermathhUI\Medias\Textures\ArrowAbove.blp]],
	["PowerArrowDown"] = [[Interface\AddOns\AftermathhUI\Medias\Textures\ArrowBelow.blp]],
	
	["Whisper"] = [[Interface\AddOns\AftermathhUI\Medias\Sounds\Whisper.mp3]],
}

local Region = GetLocale()

if (Region == "koKR" or Region == "zhTW" or Region == "zhCN" or Region == "ruRU") then
	C.Media.Font = STANDARD_TEXT_FONT
	C.Media.Font2 = STANDARD_TEXT_FONT
end