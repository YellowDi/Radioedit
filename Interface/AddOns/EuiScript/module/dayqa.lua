local E, L, V, P, G, _ = unpack(ElvUI); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB, Localize Underscore

local _G = _G


local realDB = {
	['zhCN'] = {
		['行尸鱼人'] = 4,
		['Belan shi'] = 4,
		['泰瑞纳斯·米奈希尔二世国王'] = 6,
		['卡莉莎·哈林顿'] = 4,
		['米亚·格雷迈恩王后'] = 6,
		['诺达希尔'] = 5,
		['塔拉克'] = 5,
		['蒂芬·艾莉安·乌瑞恩'] = 6,
		['基尔斯'] = 5,
		['萨亚德'] = 5,
		['磨齿'] = 4,
		['塔隆·血魔'] = 4,
		['缪萨拉'] = 5,
		['大德鲁伊'] = 5,
		['塞纳里奥议会'] = 6,
		['霍利亚·萨希尔德'] = 4,
		['锋利的爪子'] = 3,
		['格尔宾·梅卡托克'] = 3,
		['霜狼氏族'] = 5,
		['卡雷什'] = 3,
		['塔泰'] = 5,
		['德拉卡的狂怒'] = 3,
		['斯卡雷'] = 5,
		['玛格汉兽人'] = 3,
		['阿彻鲁斯'] = 3,
		['萨维斯'] = 5,
		['莫德雷萨'] = 6,
		['维拉努斯'] = 4,
		['红色天灾'] = 6,
		['被污染的粮食'] = 6,
		['盘牙水库'] = 5,
		['米拉多尔'] = 6,
		['塔尼布隆、维斯匹隆和沙德隆'] = 3,
		['诺甘农'] = 4,
		['蓝龙军团'] = 4,
		['残次的雷象粪便'] = 3,
		['努波顿'] = 6,
	},
	['zhTW'] = {
		['諾達希爾'] = 5,
		['維拉努斯'] = 4,
		['諾柏多'] = 6,
		['亞榭洛'] = 3,
		['默德雷薩'] = 6,
		['大德魯伊'] = 5,
		['屍化魚人'] = 4,
		['貝拉許'] = 4,
		['泰瑞納斯·米奈希爾二世'] = 6,
		['凱莉莎·哈林頓'] = 4,
		["米雅·葛雷邁恩皇后"] = 6, 
		['塞納里奧議會'] = 6,
		['塔拉科'] = 5,
		['蒂芬·艾蕾瑞安·烏瑞恩'] = 6,
		['基爾斯'] = 5,
		['薩亞德'] = 5,
		['磨齒羊'] = 4,
		['泰朗·血魔'] = 4,
		['繆薩拉'] = 5,
		['霍利亞·桑希爾德'] = 4,
		['鋒利的爪子'] = 3,
		['傑爾賓·梅卡托克'] = 3,
		['霜狼氏族'] = 5,
		['凱瑞西'] = 3,
		['塔泰'] = 5,
		["德拉卡之怒"] = 3,
		["史蓋瑞"] = 5,
		["瑪格哈"] = 3,
		['薩維斯'] = 5,
		["紅疹"] = 6,
		['受污染的穀物'] = 6,
		['盤牙蓄湖'] = 5,
		['米拉多爾'] = 6,
		['坦納伯朗、維斯佩朗和夏德朗'] = 3,
		['諾甘農'] = 4,
		['藍龍軍團'] = 4,
		['殘缺的伊萊克糞便'] = 3,
	},	
}

local function DayQA_OnEvent(self, event)
	if event == 'GOSSIP_SHOW' then
		for i = 3, 6 do
			local button = _G['GossipTitleButton'..i];
			if button and button:GetText() then
				if realDB[GetLocale()] and realDB[GetLocale()][button:GetText():gsub('。','')] then
					_G['GossipTitleButton'..i..'GossipIcon']:SetVertexColor(0, 0, 1)
				end
			end
		end
	else
		for i = 3, 6 do
			local button = _G['GossipTitleButton'..i];
			if button then
				_G['GossipTitleButton'..i..'GossipIcon']:SetVertexColor(1, 1, 1)
			end
		end
	end
end

local f = CreateFrame("Frame")
f:RegisterEvent("GOSSIP_SHOW");
f:RegisterEvent("GOSSIP_CLOSED");
f:RegisterEvent("QUEST_LOG_UPDATE");
f:SetScript("OnEvent", DayQA_OnEvent);