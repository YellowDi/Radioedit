-- SavedVariables: BigFootMarkMappingDB
-- SavedVariablesPerCharacter: BigFootMarkDB
--for wod 6.0fix by eui.cc at 20141122
local _
BFMark = LibStub('AceAddon-3.0'):NewAddon('BigFootMark', 'AceEvent-3.0', 'AceConsole-3.0') 

local BigFootMark_1e41ab854b6901e6397b4db24aacd161 = {
	[MAP_MARK_FLY1] = MAP_MARK_FLY, 
	[MAP_MARK_FLY2] = MAP_MARK_FLY, 
	[MAP_MARK_FLY3] = MAP_MARK_FLY, 
	[MAP_MARK_FLY4] = MAP_MARK_FLY, 
	[MAP_MARK_FLY5] = MAP_MARK_FLY, 
	[MAP_MARK_FLYING] = MAP_MARK_PROF_RIDING, 
	[MAP_MARK_DAIBI1] = MAP_MARK_ZHENFU, 
	[MAP_MARK_DAIBI2] = MAP_MARK_ZHENFU, 
	[MAP_MARK_DAIBI3] = MAP_MARK_ZHENFU, 
	[MAP_MARK_DAIBI4] = MAP_MARK_ZHENFU, 
	[MAP_MARK_DAIBI5] = MAP_MARK_ZHENFU, 
	[MAP_MARK_DAIBI6] = MAP_MARK_ZHENFU, 
	[MAP_MARK_GLADIUS]= MAP_MARK_ZHENFU, 
} 
BigFootMarkMappingDB = BigFootMarkMappingDB or BigFootMark_1e41ab854b6901e6397b4db24aacd161 
local MAP_MARK_TEXTURE = {
	[MAP_MARK_PROF_MAGE] = "Interface\\AddOns\\BigFootMark\\icon\\26.tga", 
	[MAP_MARK_PROF_PRIEST] = "Interface\\AddOns\\BigFootMark\\icon\\31.tga", 
	[MAP_MARK_PROF_WARLOCK] = "Interface\\AddOns\\BigFootMark\\icon\\32.tga", 
	[MAP_MARK_PROF_ROGUE] = "Interface\\AddOns\\BigFootMark\\icon\\27.tga", 
	[MAP_MARK_PROF_DRUID] = "Interface\\AddOns\\BigFootMark\\icon\\28.tga", 
	[MAP_MARK_PROF_HUNTER] = "Interface\\AddOns\\BigFootMark\\icon\\29.tga", 
	[MAP_MARK_PROF_SHAMAN] = "Interface\\AddOns\\BigFootMark\\icon\\30.tga", 
	[MAP_MARK_PROF_WARRIOR] = "Interface\\AddOns\\BigFootMark\\icon\\25.tga", 
	[MAP_MARK_PROF_PALADIN] = "Interface\\AddOns\\BigFootMark\\icon\\33.tga", 
	[MAP_MARK_PROF_DEATHKNIGHT] = "Interface\\AddOns\\BigFootMark\\icon\\34.tga", 
	[MAP_MARK_SKILL_ALCHE] = "Interface\\AddOns\\BigFootMark\\icon\\2.tga", 
	[MAP_MARK_PROF_BLACKSMITH] = "Interface\\AddOns\\BigFootMark\\icon\\17.tga", 
	[MAP_MARK_PROF_ENCHANTING] = "Interface\\AddOns\\BigFootMark\\icon\\19.tga", 
	[MAP_MARK_PROF_ENGINEERING] = "Interface\\AddOns\\BigFootMark\\icon\\18.tga", 
	[MAP_MARK_PROF_HERBALISM] = "Interface\\AddOns\\BigFootMark\\icon\\21.tga", 
	[MAP_MARK_PROF_INSCRIPTION] = "Interface\\AddOns\\BigFootMark\\icon\\9.tga", 
	[MAP_MARK_PROF_JEWEL] = "Interface\\AddOns\\BigFootMark\\icon\\12.tga", 
	[MAP_MARK_PROF_LEATHERWORKING] = "Interface\\AddOns\\BigFootMark\\icon\\22.tga", 
	[MAP_MARK_PROF_MINING] = "Interface\\AddOns\\BigFootMark\\icon\\23.tga", 
	[MAP_MARK_PROF_SKINNING] = "Interface\\AddOns\\BigFootMark\\icon\\13.tga", 
	[MAP_MARK_PROF_TAILORING] = "Interface\\AddOns\\BigFootMark\\icon\\24.tga", 
	[MAP_MARK_PROF_ARCHAEOLOGY] = "Interface\\AddOns\\BigFootMark\\icon\\36.tga", 
	[MAP_MARK_PROF_COOKING] = "Interface\\AddOns\\BigFootMark\\icon\\11.tga", 
	[MAP_MARK_PROF_FIRSTAID] = "Interface\\AddOns\\BigFootMark\\icon\\1.tga", 
	[MAP_MARK_PROF_FISHING] = "Interface\\AddOns\\BigFootMark\\icon\\20.tga", 
	[MAP_MARK_PROF_RIDING] = "Interface\\AddOns\\BigFootMark\\icon\\16.tga", 
	[MAP_MARK_INN] = "Interface\\AddOns\\BigFootMark\\icon\\35.tga", 
	[MAP_MARK_FLY] = "Interface\\AddOns\\BigFootMark\\icon\\3.tga", 
	[MAP_MARK_PORTAL] = "Interface\\AddOns\\BigFootMark\\icon\\15.tga", 
	[MAP_MARK_AUCTION] = "Interface\\AddOns\\BigFootMark\\icon\\7.tga", 
	[MAP_MARK_BANK] = "Interface\\AddOns\\BigFootMark\\icon\\14.tga", 
	[MAP_MARK_BARBER] = "Interface\\AddOns\\BigFootMark\\icon\\8.tga", 
	[MAP_MARK_MATERIAL] = "Interface\\AddOns\\BigFootMark\\icon\\10.tga", 
	[MAP_MARK_STABLE] = "Interface\\AddOns\\BigFootMark\\icon\\4.tga", 
	[MAP_MARK_REFORGE] = "Interface\\AddOns\\BigFootMark\\icon\\40.tga", 
	[MAP_MARK_DUMMY] = "Interface\\AddOns\\BigFootMark\\icon\\38.tga", 
	[MAP_MARK_ZHENFU] = "Interface\\AddOns\\BigFootMark\\icon\\37.tga", 
	[MAP_MARK_HUANHUA] = "Interface\\AddOns\\BigFootMark\\icon\\41.tga", 
	[MAP_MARK_XUKONGYINHANG] = "Interface\\AddOns\\BigFootMark\\icon\\42.tga",
} 
local MAP_MARK_MAPPING = {
	[BFM_ALCHE] = MAP_MARK_SKILL_ALCHE, 
	[BFM_BLACKSMITH] = MAP_MARK_PROF_BLACKSMITH, 
	[BFM_ENCHANTING] = MAP_MARK_PROF_ENCHANTING, 
	[BFM_ENGINEERING] = MAP_MARK_PROF_ENGINEERING, 
	[BFM_HERBALISM] = MAP_MARK_PROF_HERBALISM, 
	[BFM_INSCRIPTION] = MAP_MARK_PROF_INSCRIPTION, 
	[BFM_JEWEL] = MAP_MARK_PROF_JEWEL, 
	[BFM_LEATHERWORKING] = MAP_MARK_PROF_LEATHERWORKING, 
	[BFM_MINING] = MAP_MARK_PROF_MINING, 
	[BFM_SKINNING] = MAP_MARK_PROF_SKINNING, 
	[BFM_TAILORING] = MAP_MARK_PROF_TAILORING, 
	[BFM_ARCHAEOLOGY] = MAP_MARK_PROF_ARCHAEOLOGY,
} 
local MAP_MARK_MAPPING_TABLE = {
	MAP_MARK_PROF_MAGE, 
	MAP_MARK_PROF_PRIEST, 
	MAP_MARK_PROF_WARLOCK, 
	MAP_MARK_PROF_ROGUE, 
	MAP_MARK_PROF_DRUID, 
	MAP_MARK_PROF_HUNTER, 
	MAP_MARK_PROF_SHAMAN, 
	MAP_MARK_PROF_WARRIOR, 
	MAP_MARK_PROF_PALADIN, 
	MAP_MARK_PROF_DEATHKNIGHT, 
	MAP_MARK_SKILL_ALCHE, 
	MAP_MARK_PROF_BLACKSMITH, 
	MAP_MARK_PROF_ENCHANTING, 
	MAP_MARK_PROF_ENGINEERING, 
	MAP_MARK_PROF_HERBALISM, 
	MAP_MARK_PROF_INSCRIPTION, 
	MAP_MARK_PROF_JEWEL, 
	MAP_MARK_PROF_LEATHERWORKING, 
	MAP_MARK_PROF_MINING, 
	MAP_MARK_PROF_SKINNING, 
	MAP_MARK_PROF_TAILORING, 
	MAP_MARK_PROF_ARCHAEOLOGY, 
	MAP_MARK_PROF_COOKING, 
	MAP_MARK_PROF_FIRSTAID, 
	MAP_MARK_PROF_FISHING, 
	MAP_MARK_PROF_RIDING, 
	MAP_MARK_INN, 
	MAP_MARK_FLY, 
	MAP_MARK_PORTAL, 
	MAP_MARK_AUCTION, 
	MAP_MARK_BANK, 
	MAP_MARK_BARBER, 
	MAP_MARK_MATERIAL, 
	MAP_MARK_STABLE, 
	MAP_MARK_REFORGE, 
	MAP_MARK_DUMMY, 
	MAP_MARK_ZHENFU, 
	MAP_MARK_HUANHUA, 
	MAP_MARK_XUKONGYINHANG,
} 
local BigFootMark_0ff1475236b21cc42bc579ef6b84a020,node_index,BigFootMark_3657b630f9b53060aa76a1ee4510bd5f,BigFootMark_9ca550a56becdad16e94feb95e9237b0 
local BigFootMark_4b7e2bce87cb1e096550a2c098d5f6be = 20 
local BFMark_Version = 1; 
local BigFootMark_69dc0ff56f05b8a9c0dc97f0140b0336 = {
	["Orc"] = 1, 
	["Tauren"] = 1, 
	["Scourge"] = 1, 
	["BloodElf"] = 1, 
	["Troll"] = 1, 
	["Goblin"] = 1, 
	["Human"] = 2, 
	["NightElf"] = 2, 
	["Dwarf"] = 2, 
	["Gnome"] = 2, 
	["Draenei"] = 2, 
	["Worgen"] = 2,
} 
local function BigFootMark_cecd484ed994ee493c136b4358a71f4f(BigFootMark_eab765600dfa4f607423084a1db7c624) 
	if BigFootMark_eab765600dfa4f607423084a1db7c624 and BigFootMark_69dc0ff56f05b8a9c0dc97f0140b0336[BigFootMark_eab765600dfa4f607423084a1db7c624] then
		return BigFootMark_69dc0ff56f05b8a9c0dc97f0140b0336[BigFootMark_eab765600dfa4f607423084a1db7c624];
	end
end 
local function BigFootMark_f6f8040d54edbe4fc64f71ead6dde464(BigFootMark_6d5e7d83d8358745ae4dcf61d16bd1f3) 
	if BigFootMarkMappingDB[BigFootMark_6d5e7d83d8358745ae4dcf61d16bd1f3] then
		return BigFootMarkMappingDB[BigFootMark_6d5e7d83d8358745ae4dcf61d16bd1f3]
	end
	for _,val in pairs(MAP_MARK_MAPPING_TABLE) do 
		if string.find(BigFootMark_6d5e7d83d8358745ae4dcf61d16bd1f3,val) or string.find(val,BigFootMark_6d5e7d83d8358745ae4dcf61d16bd1f3) then
			BigFootMarkMappingDB[BigFootMark_6d5e7d83d8358745ae4dcf61d16bd1f3] = val 
			return val
		end
	end
	return ""
end 
local function BigFootMark_9236e608897a51c47b0385bd340ee860()
	BigFootMarkDB = {} 
	BigFootMarkDB.showMarks = true; 
	BigFootMarkDB.version = BFMark_Version;
	_,localized = UnitClass("player"); 
	if _G["MAP_MARK_PROF_"..localized] then
		BigFootMarkDB[_G["MAP_MARK_PROF_"..localized]] = true
	end
	local professionList = {GetProfessions()}
	for _,_profIndex in pairs(professionList) do
		local skillName = GetProfessionInfo(_profIndex) 
		local mapping = MAP_MARK_MAPPING[skillName] 
		if mapping then BigFootMarkDB[mapping] = true end
	end 
	BigFootMarkDB[MAP_MARK_ZHENFU] = true
	BigFootMarkDB[MAP_MARK_DUMMY] = true 
	BigFootMarkDB[MAP_MARK_REFORGE] = true 
	BigFootMarkDB[MAP_MARK_PROF_RIDING] = true 
	BigFootMarkDB[MAP_MARK_INN] = true 
	BigFootMarkDB[MAP_MARK_FLY] = true 
	BigFootMarkDB[MAP_MARK_AUCTION] = true 
	BigFootMarkDB[MAP_MARK_BANK] = true 
	BigFootMarkDB[MAP_MARK_MATERIAL] = true 
	BigFootMarkDB[MAP_MARK_HUANHUA] = true 
	BigFootMarkDB[MAP_MARK_XUKONGYINHANG] = true
end 
function BFM_ToggleEnable(BigFootMark_7739b813d90aed43ab9d0eb84ec1c1ae) 
	if ( BigFootMark_7739b813d90aed43ab9d0eb84ec1c1ae == 1 ) then
		BigFootMark_3657b630f9b53060aa76a1ee4510bd5f = 1; 
		if (not BigFootMark_0ff1475236b21cc42bc579ef6b84a020) then 
			WorldMapFrame:HookScript("OnUpdate", BigFootMark_359af385f8090e4c5839f533807d0e06);
			BigFootMark_0ff1475236b21cc42bc579ef6b84a020 = true;
			if (WorldMapFrame:HasScript("OnShow")) then
				WorldMapFrame:HookScript("OnShow", BigFootMark_ae42389ca37ac306b6bc3f5dfc08ff0d);
			else
				WorldMapFrame:SetScript("OnShow", BigFootMark_ae42389ca37ac306b6bc3f5dfc08ff0d);
			end
		end
	else
		BigFootMark_3657b630f9b53060aa76a1ee4510bd5f = nil;
	end
end 
local MapMarkDDTable = {
	[MAP_MARK_PROF] = {
		[MAP_MARK_PROF_MAGE] = {func = true},
		[MAP_MARK_PROF_PRIEST] = {func = true},
		[MAP_MARK_PROF_WARLOCK] = {func = true}, 
		[MAP_MARK_PROF_ROGUE] = {func = true}, 
		[MAP_MARK_PROF_DRUID] = {func = true}, 
		[MAP_MARK_PROF_HUNTER] = {func = true}, 
		[MAP_MARK_PROF_SHAMAN] = {func = true}, 
		[MAP_MARK_PROF_WARRIOR] = {func = true}, 
		[MAP_MARK_PROF_PALADIN] = {func = true}, 
		[MAP_MARK_PROF_DEATHKNIGHT] = {func = true},
	}, 
	[MAP_MARK_SKILL] = {
		[MAP_MARK_SKILL_ALCHE] = {func = true}, 
		[MAP_MARK_PROF_BLACKSMITH] = {func = true}, 
		[MAP_MARK_PROF_ENCHANTING] = {func = true}, 
		[MAP_MARK_PROF_ENGINEERING] = {func = true}, 
		[MAP_MARK_PROF_HERBALISM] = {func = true}, 
		[MAP_MARK_PROF_INSCRIPTION] = {func = true}, 
		[MAP_MARK_PROF_JEWEL] = {func = trued}, 
		[MAP_MARK_PROF_LEATHERWORKING] = {func = true}, 
		[MAP_MARK_PROF_MINING] = {func = true}, 
		[MAP_MARK_PROF_SKINNING] = {func = true}, 
		[MAP_MARK_PROF_TAILORING] = {func = true}, 
		[MAP_MARK_PROF_ARCHAEOLOGY] = {func = true}, 
		[MAP_MARK_PROF_COOKING] = {func = true}, 
		[MAP_MARK_PROF_FIRSTAID] = {func = true}, 
		[MAP_MARK_PROF_FISHING] = {func = true},
	}, 
	[MAP_MARK_ZHENFU] = { func = true },
	[MAP_MARK_DUMMY] = { func = true }, 
	[MAP_MARK_REFORGE] = { func = true }, 
	[MAP_MARK_PROF_RIDING] = { func = true }, 
	[MAP_MARK_INN] = { func = true }, 
	[MAP_MARK_FLY] = { func = true }, 
	[MAP_MARK_PORTAL] = { func = true }, 
	[MAP_MARK_AUCTION] = { func = true }, 
	[MAP_MARK_BANK] = { func = true }, 
	[MAP_MARK_BARBER] = { func = true }, 
	[MAP_MARK_MATERIAL] = { func = true }, 
	[MAP_MARK_STABLE] = { func = true }, 
	[MAP_MARK_HUANHUA] = { func = true }, 
	[MAP_MARK_XUKONGYINHANG] = { func = true },
} 
function MapMarkDDInit(self,level)
	level = level or 1;
	if (level == 1) then
		for key, subarray in pairs(MapMarkDDTable) do
			local info = UIDropDownMenu_CreateInfo();
			info.text = key;
			if subarray.func then
				info.hasArrow = false;
				info.func = function() BigFootMarkDB[key] = not BigFootMarkDB[key] end
				info.checked = BigFootMarkDB[key] 
			else
				info.hasArrow = true;
				info.value = { ["Level1_Key"] = key; };
			end 
			UIDropDownMenu_AddButton(info, level);
		end
	end 
	if (level == 2) then
		local Level1_Key = UIDROPDOWNMENU_MENU_VALUE["Level1_Key"];
		local subarray = MapMarkDDTable[Level1_Key]; 
		for key, subsubarray in pairs(subarray) do
			local info = UIDropDownMenu_CreateInfo();
			info.hasArrow = false; 
			info.text = key 
			info.func = function() BigFootMarkDB[key] = not BigFootMarkDB[key] end
			info.checked = BigFootMarkDB[key]
			UIDropDownMenu_AddButton(info, level); 
		end
	end
end 
function BigFootMark_ae42389ca37ac306b6bc3f5dfc08ff0d()
	if (not BigFootMark_3657b630f9b53060aa76a1ee4510bd5f) then
		MapPlusDDList:Hide(); 
		MapMarkCheckButton:Hide(); 
		return;
	end
	if not BigFootMarkDB or not BigFootMarkDB.version or BigFootMarkDB.version < BFMark_Version then
		BigFootMarkMappingDB = BigFootMark_1e41ab854b6901e6397b4db24aacd161; 
		BigFootMark_9236e608897a51c47b0385bd340ee860();
	end
	UIDropDownMenu_Initialize(MapPlusDDList,MapMarkDDInit) 
	UIDropDownMenu_SetText(MapPlusDDList,MAPMARK_TITLE)
	MapPlusDDList:Show() 
	MapMarkCheckButton:Show()
end 
local function BigFootMark_29d25e5d8154c1c2dadff565b8168746(type)
	if BigFootMarkDB[BigFootMark_f6f8040d54edbe4fc64f71ead6dde464(type)] then
		return true
	end
	return false
end
local function coord_transform(width,height,x,y)
	return x*width/100,-y*height/100
end
local function showNodes(_type,name,...)
	local function BigFootMark_61b0f31e4b21af9208673d48030ca9bd(name,_type,x,y)
		local texture = MAP_MARK_TEXTURE[BigFootMark_f6f8040d54edbe4fc64f71ead6dde464(_type) ] 
		local button = _G["MapMark"..node_index]
		if not button then
			button = CreateFrame("Button","MapMark"..node_index,WorldMapDetailFrame,"MapMarkTemplate")
		end
		button:SetPoint("CENTER",WorldMapDetailFrame,"TOPLEFT",coord_transform(WorldMapDetailFrame:GetWidth(), WorldMapDetailFrame:GetHeight(),x,y))
		_G[button:GetName().."Icon"]:SetTexture(texture);
		button.text2 = name 
		button.text = _type
		node_index = node_index + 1 
		button:Show()
	end 
	local _coord = ...
	BigFootMark_61b0f31e4b21af9208673d48030ca9bd(name,_type,_coord[1],_coord[2])
end 
local function BigFootMark_812d2af89b43bd82cf0624ad0b469cfb()
	local _i = 1
	while _G["MapMark".._i] do
		_G["MapMark".._i]:Hide()
		_i = _i + 1
	end
end 
local function BigFootMark_d818d134e9a84a0317a401c4f9b56394() 
	local BigFootMark_2d8ff25b2888f058a5d1486167a7958d = GetCurrentMapZone();
	if BigFootMark_2d8ff25b2888f058a5d1486167a7958d >0 then
		local BigFootMark_a190c73192fb348b1958a964b277b50f = GetCurrentMapDungeonLevel();
		if BigFootMark_a190c73192fb348b1958a964b277b50f == 0 then
			BigFootMark_a190c73192fb348b1958a964b277b50f = 1
		end
		if not HandyNotes then return; end
		if GetCurrentMapContinent() == 7 then return; end --skip WOD Zone
		return HandyNotes:GetCZToZone(GetCurrentMapContinent(), BigFootMark_2d8ff25b2888f058a5d1486167a7958d), BigFootMark_a190c73192fb348b1958a964b277b50f;
	end
end 

local BigFootMark_adf50fa6c4713aee1862a5c0c23c11ca, BigFootMark_a190c73192fb348b1958a964b277b50f
function BigFootMark_359af385f8090e4c5839f533807d0e06(self)
	if not MapPlusNodeData then
		BigFootMark_812d2af89b43bd82cf0624ad0b469cfb();
		return
	end 
	if not BigFootMark_3657b630f9b53060aa76a1ee4510bd5f then
		BigFootMark_812d2af89b43bd82cf0624ad0b469cfb();
		return
	end 
	if BigFootMark_9ca550a56becdad16e94feb95e9237b0 then
		BigFootMark_812d2af89b43bd82cf0624ad0b469cfb();
		return
	end
	local arg1, arg2 = BigFootMark_d818d134e9a84a0317a401c4f9b56394();
	if arg1 == BigFootMark_adf50fa6c4713aee1862a5c0c23c11ca and arg2 == BigFootMark_a190c73192fb348b1958a964b277b50f then
		return
	else
		BigFootMark_812d2af89b43bd82cf0624ad0b469cfb();
		BigFootMark_adf50fa6c4713aee1862a5c0c23c11ca = arg1
		BigFootMark_a190c73192fb348b1958a964b277b50f = arg2
	end
	node_index = 1; 
	if arg1 and MapPlusNodeData[arg1] then
		local BigFootMark_e3fa270ad54568d4711e0138168a0345 = MapPlusNodeData[arg1];
		for _,BigFootMark_a4ae8f1b50c7593a1bada9f62d1883fb in pairs(BigFootMark_e3fa270ad54568d4711e0138168a0345) do
			if BigFootMark_29d25e5d8154c1c2dadff565b8168746(BigFootMark_a4ae8f1b50c7593a1bada9f62d1883fb[1]) and BigFootMark_a4ae8f1b50c7593a1bada9f62d1883fb[4] and BigFootMark_a4ae8f1b50c7593a1bada9f62d1883fb[4] == arg2 then
				showNodes(BigFootMark_a4ae8f1b50c7593a1bada9f62d1883fb[1],BigFootMark_a4ae8f1b50c7593a1bada9f62d1883fb[2],select(3,unpack(BigFootMark_a4ae8f1b50c7593a1bada9f62d1883fb)))
			end
		end
	end
end 
local function IsButtonsAdjacent(button1, button2)
	local BigFootMark_bb09ff53f73097f772bbad85ab4789a3, BigFootMark_8564354d3dfe092927e7594edd6b33ae = button1:GetCenter();
	local BigFootMark_05a093d743a51039be6b1ba936768e35, BigFootMark_a42ee07c25fc8757c49710ea97cea40d = button2:GetCenter();
	return ((BigFootMark_bb09ff53f73097f772bbad85ab4789a3-BigFootMark_05a093d743a51039be6b1ba936768e35)^2 + (BigFootMark_8564354d3dfe092927e7594edd6b33ae-BigFootMark_a42ee07c25fc8757c49710ea97cea40d)^2 <200)
end 
function MapMarkPoint_OnEnter(self)
	local BigFootMark_b254e387cf58e982ba24fcb3e8a63995, BigFootMark_a0f453fd098c0b0fda780f69cda6ffbf = self:GetCenter();
	local BigFootMark_bef0afa8f0e35507e468dab3fd56505f = self:GetParent():GetCenter();
	if ( BigFootMark_b254e387cf58e982ba24fcb3e8a63995 > BigFootMark_bef0afa8f0e35507e468dab3fd56505f ) then
		BFMTooltip:SetOwner(self, "ANCHOR_LEFT");
	else
		BFMTooltip:SetOwner(self, "ANCHOR_RIGHT");
	end
	BFMTooltip:AddLine(self.text)
	local font = _G["BFMTooltipTextLeft"..BFMTooltip:NumLines()]:GetFontObject()
	BFMTooltip:AddLine(self.text2)
	_G["BFMTooltipTextLeft"..BFMTooltip:NumLines()]:SetTextColor(TOOLTIP_DEFAULT_COLOR.r, TOOLTIP_DEFAULT_COLOR.g, TOOLTIP_DEFAULT_COLOR.b)
	_i = 1 
	while _G["MapMark".._i] do
		local button = _G["MapMark".._i] 
		if button:IsShown() and button ~= self and IsButtonsAdjacent(button,self) then
			BFMTooltip:AddLine(" ") 
			BFMTooltip:AddLine(button.text) 
			_G["BFMTooltipTextLeft"..BFMTooltip:NumLines()]:SetFontObject(font) 
			BFMTooltip:AddLine(button.text2)
			_G["BFMTooltipTextLeft"..BFMTooltip:NumLines()]:SetTextColor(TOOLTIP_DEFAULT_COLOR.r, TOOLTIP_DEFAULT_COLOR.g, TOOLTIP_DEFAULT_COLOR.b)
		end 
		_i = _i + 1
	end 
	BFMTooltip:Show();
end 
function MapMarkPoint_OnLeave(self)
	BFMTooltip:Hide();
end 
function MapMarkToggleEnable(tog) 
	if tog then
		BigFootMark_9ca550a56becdad16e94feb95e9237b0 = false
		BigFootMark_0ff1475236b21cc42bc579ef6b84a020 = true
		BigFootMark_359af385f8090e4c5839f533807d0e06()
	else 
		BigFootMark_9ca550a56becdad16e94feb95e9237b0 = true
	end
	BigFootMarkDB.showMarks = tog
end 
local function BigFootMark_edfa68f7ef48f8ae29759b006ee71b34(BigFootMark_be37ab0a08e250377f09b21f7f74a71e,BigFootMark_d0864e7a52e7f3d322cf456b509d48bf)
	return (BigFootMark_be37ab0a08e250377f09b21f7f74a71e[1]-BigFootMark_d0864e7a52e7f3d322cf456b509d48bf[1])^2 + (BigFootMark_be37ab0a08e250377f09b21f7f74a71e[2]-BigFootMark_d0864e7a52e7f3d322cf456b509d48bf[2])^2
end 
local function BigFootMark_1c45ec5041638b82e077003f76943218(BigFootMark_c1b30b66a595a35d35ab304c8daa9664, BigFootMark_209d9f753a029c679126b146ee03333d)
	if not BigFootMark_c1b30b66a595a35d35ab304c8daa9664 or not BigFootMark_c1b30b66a595a35d35ab304c8daa9664[BigFootMark_f6f8040d54edbe4fc64f71ead6dde464(BigFootMark_209d9f753a029c679126b146ee03333d[1])] then
		return false
	end 
	for _,BigFootMark_bb21ccee710d89f1dd77348af145dc7d in pairs(BigFootMark_c1b30b66a595a35d35ab304c8daa9664[BigFootMark_f6f8040d54edbe4fc64f71ead6dde464(BigFootMark_209d9f753a029c679126b146ee03333d[1])]) do
		if BigFootMark_edfa68f7ef48f8ae29759b006ee71b34(BigFootMark_bb21ccee710d89f1dd77348af145dc7d,BigFootMark_209d9f753a029c679126b146ee03333d[3]) < BigFootMark_4b7e2bce87cb1e096550a2c098d5f6be then
			return true
		end
	end
	return false
end 
local function BigFootMark_1067d4f42bf9e87dc11131765aa8e9d0(_table)
	if type(_table) ~= "table" then
		return
	end
	local BigFootMark_b5085455be65cc330a574cd792f9b28e = {} 
	local BigFootMark_06a53a26ccf4c2754a46f883c434b6f6 ={} 
	for _,BigFootMark_209d9f753a029c679126b146ee03333d in pairs(_table) do
		BigFootMark_b5085455be65cc330a574cd792f9b28e[BigFootMark_f6f8040d54edbe4fc64f71ead6dde464(BigFootMark_209d9f753a029c679126b146ee03333d[1])] = BigFootMark_b5085455be65cc330a574cd792f9b28e[BigFootMark_f6f8040d54edbe4fc64f71ead6dde464(BigFootMark_209d9f753a029c679126b146ee03333d[1])] or {} 
		if not BigFootMark_1c45ec5041638b82e077003f76943218(BigFootMark_b5085455be65cc330a574cd792f9b28e,BigFootMark_209d9f753a029c679126b146ee03333d) and (BigFootMark_209d9f753a029c679126b146ee03333d[5] and BigFootMark_209d9f753a029c679126b146ee03333d[5] ~= BigFootMark_cecd484ed994ee493c136b4358a71f4f(select(2,UnitRace("player"))) or not BigFootMark_209d9f753a029c679126b146ee03333d[5]) then
			tinsert(BigFootMark_b5085455be65cc330a574cd792f9b28e[BigFootMark_f6f8040d54edbe4fc64f71ead6dde464(BigFootMark_209d9f753a029c679126b146ee03333d[1])],BigFootMark_209d9f753a029c679126b146ee03333d[3])
			tinsert(BigFootMark_06a53a26ccf4c2754a46f883c434b6f6,BigFootMark_209d9f753a029c679126b146ee03333d)
		end
	end 
	return BigFootMark_06a53a26ccf4c2754a46f883c434b6f6
end 
local function BigFootMark_7b09dafd8709fb460af554a05f285f0e()
	for BigFootMark_8983c60d66c8593ec7165ea9dbedb584,BigFootMark_49ccc92cd1bef60d860c1c7f84aaab89 in pairs(MapPlusNodeData) do
		MapPlusNodeData[BigFootMark_8983c60d66c8593ec7165ea9dbedb584] = BigFootMark_1067d4f42bf9e87dc11131765aa8e9d0(BigFootMark_49ccc92cd1bef60d860c1c7f84aaab89)
	end
end 
function BFMark:OnInitialize() 
	BigFootMark_7b09dafd8709fb460af554a05f285f0e()
	BFM_ToggleEnable(1)
end 
function BFMark:OnEnable()
	BFM_ToggleEnable(1)
end 
function BFMark:OnDisable()
	BFM_ToggleEnable(0)
end