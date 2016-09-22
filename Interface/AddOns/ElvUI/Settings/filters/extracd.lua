local E, L, V, P, G = unpack(select(2, ...)); --Engine

G.AnnounceSpells = {
	34477,	-- ��
	19801,	-- �������
	57934,	-- �޻�����
	633,	-- ʥ����
	20484,	-- ����
	61999,	-- ��������
	20707,	-- ���ʯ
--	2908,	-- ����
}

G['interruptSpell'] = {
	-- ��³��
	["DRUID"] = {
		[106839] = true, -- ӭͷʹ����Ұ�ԡ��ػ�ר������, �Ա���
		[78675] = true, -- �չ�����ƽ��ר��
		[770] = false, -- ����֮�𣨲���ģ�
		[106707] = false, -- �����Ⱥ������ģ�
	},
	-- ����
	["HUNTER"] = {
		[50318] = true, -- ����֮�����������
		[50479] = true, -- �����������������
		[26090] = true, -- ȭ������������
		[34490] = true, -- ��Ĭ������츳
		[147362] = true, -- �������
	},
	-- ��ʦ
	["MAGE"] = {
		[2139] = true, -- ��������
	},	
	-- ��ʿ
	["WARLOCK"] = {
		[103135] = true, -- ����������������Ȯ
		[119911] = true, -- ���ⱬը����ħ
	},
	-- ����
	["SHAMAN"] = {
		[57994] = true, -- ����������ģ�
	},
	-- ʥ��ʿ
	["PALADIN"] = {
		[96231] = true, -- ���ѣ������ģ�
		[31935] = true, -- ������֮�ܣ�����ר���������ģ�
	},
	-- ��ʦ
	["PRIEST"] = {
		[15487] = true, -- ��Ĭ����Ӱר��
	},
	-- սʿ
	["WARRIOR"] = {
		[102060] = true, -- �߽�ŭ���츳
		[6552] = true, -- ȭ��
	},
	-- ����
	["ROGUE"] = {
		[26679] = false, -- ����Ͷ�����츳����5������������������Բ��ӣ���CD����������ϵ�DZ�϶������ǵġ�
		[1766] = true, -- ����
	},
	-- ������ʿ
	["DEATHKNIGHT"] = {
		[47528] = true, -- �������
		[47476] = true, -- ��Ϯ
		[108194] = true, -- ��Ϣ���츳�������Ϯ
	},
	-- ��ɮ
	["MONK"] = {
		[116705] = true, -- �к���
	},
}

G['announcements'] = {
	['AnnounceToys'] = {
		[61031] = true,		-- Toy Train Set
		[49844] = true,		-- Direbrew's Remote
	},
	['AnnounceBots'] = {
		[22700] = true,		-- Field Repair Bot 74A
		[44389] = true,		-- Field Repair Bot 110G
		[54711] = true,		-- Scrapbot
		[67826] = true,		-- Jeeves
		[126459] = true,	-- Blingtron 4000
	},
	['AnnouncePortals'] = {
		-- Alliance
		[10059] = true,		-- Stormwind
		[11416] = true,		-- Ironforge
		[11419] = true,		-- Darnassus
		[32266] = true,		-- Exodar
		[49360] = true,		-- Theramore
		[33691] = true,		-- Shattrath
		[88345] = true,		-- Tol Barad
		[132620] = true,	-- Vale of Eternal Blossoms
		-- Horde
		[11417] = true,		-- Orgrimmar
		[11420] = true,		-- Thunder Bluff
		[11418] = true,		-- Undercity
		[32267] = true,		-- Silvermoon
		[49361] = true,		-- Stonard
		[35717] = true,		-- Shattrath
		[88346] = true,		-- Tol Barad
		[132626] = true,	-- Vale of Eternal Blossoms
		-- Alliance/Horde
		[53142] = true,		-- Dalaran
	},
}