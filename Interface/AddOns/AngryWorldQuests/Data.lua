local ADDON, Addon = ...
local Data = Addon:NewModule('Data')

local KNOWLEDGE_CURRENCY_ID = 1171
local fakeTooltip
local cachedItems = {}

local worldQuestReps = {[41896]=1900,[42014]=1900,[42018]=1900,[42019]=1900,[42021]=1900,[42022]=1900,[42024]=1900,[42026]=1900,[42027]=1900,[42063]=1900,[42101]=1900,[42105]=1900,[42108]=1900,[42112]=1900,[42119]=1900,[42123]=1900,[42146]=1900,[42148]=1900,[42154]=1900,[42159]=1900,[42160]=1900,[42165]=1900,[42172]=1900,[42211]=1900,[42274]=1900,[42275]=1900,[42276]=1900,[42277]=1900,[42506]=1900,[42511]=1900,[42620]={1894,1900},[42623]=1900,[42624]=1900,[42631]={1894,1900},[42633]={1894,1900},[42636]={1894,1900},[42652]=1900,[42711]=1900,[43192]=1900,[43193]=1900,[43325]={1090,1900},[43327]={1090,1900},[43328]={1090,1900},[43426]={1894,1900},[43427]={1894,1900},[43428]={1894,1900},[43429]={1894,1900},[43430]={1894,1900},[43431]={1894,1900},[43432]={1894,1900},[43605]={1894,1900},[43606]={1894,1900},[43607]={1894,1900},[43608]={1894,1900},[43609]={1894,1900},[43610]={1894,1900},[43611]={1894,1900},[43612]={1894,1900},[43613]={1894,1900},[43614]={1894,1900},[43615]={1894,1900},[43765]=1948,[43776]=1948,[43798]={1894,1900},[43801]={1894,1900},[43802]={1894,1900},[43803]={1894,1900},[43804]={1894,1900},[43805]={1894,1900},[44287]={1894,1900},[44737]={1900,1948},[44784]=1900,[44786]=1900,[44788]=1900,[44847]=1900,[44894]={1894,1900},[45046]={1090,1900},[45069]={1090,1900},[41267]=1900,[41287]=1900,[41288]=1900,[41311]=1900,[41315]=1900,[41326]=1900,[41327]=1900,[41633]=1900,[41639]=1900,[41645]=1900,[41651]=1900,[41657]=1900,[41663]=1900,[41669]=1900,[41675]=1900,[46134]=1090,[46135]=1090,[46136]=1090,[46137]=1090,[46138]=1090,[46139]=1090,[41638]=1090,[41644]=1090,[41650]=1090,[41656]=1090,[41662]=1090,[41668]=1090,[41674]=1090,[41680]=1090,[41983]=1859,[41986]=1859,[39424]=1828,[39462]=1828,[40280]=1828,[40282]=1828,[40850]=1828,[40896]=1828,[40920]=1828,[40925]=1828,[40951]=1828,[40966]=1828,[40978]=1828,[40980]=1828,[41011]=1828,[41013]=1828,[41014]=1828,[41024]=1828,[41025]=1828,[41026]=1828,[41055]=1828,[41057]=1828,[41076]=1828,[41077]=1828,[41078]=1828,[41089]=1828,[41090]=1828,[41091]=1828,[41093]={1894,1828},[41095]=1828,[41122]=1828,[41127]=1828,[41144]=1828,[41145]=1828,[41224]=1828,[41227]=1828,[41257]=1828,[41308]=1828,[41310]=1828,[41321]=1828,[41414]=1828,[41416]=1828,[41420]=1828,[41421]=1828,[41428]=1828,[41622]=1828,[41623]=1828,[41624]=1828,[41685]={1894,1828},[41686]={1894,1828},[41687]=1828,[41691]=1828,[41692]=1828,[41695]={1894,1828},[41696]={1894,1828},[41699]=1828,[41701]=1828,[41703]={1894,1828},[41705]=1828,[41706]=1828,[41766]=1828,[41789]=1828,[41816]={1894,1828},[41818]={1894,1828},[41819]={1894,1828},[41821]={1894,1828},[41824]={1894,1828},[41826]={1894,1828},[41828]={1894,1828},[41835]=1828,[41836]={1894,1828},[41838]={1894,1828},[41844]={1894,1828},[41882]=1828,[41884]=1828,[42064]=1828,[42086]=1828,[43448]=1828,[43455]={1894,1828},[43616]={1894,1828},[43617]={1894,1828},[43618]={1894,1828},[43619]={1894,1828},[43764]={1090,1828},[43766]={1090,1828},[43767]={1090,1828},[43985]=1828,[44289]={1894,1828},[44290]={1894,1828},[44291]={1894,1828},[44292]={1894,1828},[44293]={1894,1828},[44294]={1894,1828},[44746]={1828,1948},[44823]=1828,[44892]={1894,1828},[45048]={1090,1828},[45071]={1090,1828},[41206]=1828,[41207]=1828,[41223]=1828,[41235]=1828,[41237]=1828,[41240]=1828,[41635]=1828,[41641]=1828,[41647]=1828,[41653]=1828,[41659]=1828,[41665]=1828,[41671]=1828,[41677]=1828,[40278]=1948,[41427]=1948,[41451]=1948,[41794]=1948,[41925]=1948,[41926]=1948,[41927]=1948,[41930]=1948,[41935]=1948,[41936]=1948,[41938]=1948,[41944]=1948,[41948]=1948,[41949]=1948,[41950]=1948,[41958]=1948,[41984]=1948,[42004]=1948,[42013]=1948,[42025]=1948,[42067]=1948,[42173]=1948,[42176]=1948,[42177]=1948,[42178]=1948,[42182]=1948,[42183]=1948,[42269]=1948,[42270]=1948,[42785]={1894,1948},[42798]={1894,1948},[42806]={1894,1948},[42820]={1894,1948},[42861]={1894,1948},[42864]={1894,1948},[42953]={1894,1948},[42963]={1894,1948},[42964]={1894,1948},[42991]={1894,1948},[43434]={1894,1948},[43436]={1894,1948},[43437]={1894,1948},[43438]={1894,1948},[43450]={1894,1948},[43451]={1894,1948},[43452]={1894,1948},[43453]={1894,1948},[43454]={1894,1948},[43598]=1948,[43599]=1948,[43600]=1948,[43601]=1948,[43620]={1894,1948},[43621]={1894,1948},[43622]={1894,1948},[43623]={1894,1948},[43624]={1894,1948},[43625]={1894,1948},[43626]={1894,1948},[43627]={1894,1948},[43628]={1894,1948},[43710]=1948,[43721]=1948,[43722]=1948,[43745]=1948,[43751]=1948,[43752]=1948,[43769]={1090,1948},[43771]={1090,1948},[43772]={1090,1948},[43786]=1948,[43827]=1948,[43951]=1948,[43963]=1948,[43964]=1948,[44893]={1894,1948},[44923]=1948,[44943]=1948,[45049]={1090,1948},[45072]={1090,1948},[41277]=1948,[41297]=1948,[41298]=1948,[41313]=1948,[41317]=1948,[41344]=1948,[41345]=1948,[41636]=1948,[41642]=1948,[41648]=1948,[41654]=1948,[41660]=1948,[41666]=1948,[41672]=1948,[41678]=1948,[44748]=2045,[44751]=2045,[45035]=2045,[45178]=2045,[45358]=2045,[45379]=2045,[45472]=2045,[45473]=2045,[45520]=2045,[45531]=2045,[45541]=2045,[45542]=2045,[45549]=2045,[45550]=2045,[45559]=2045,[45626]=2045,[45653]=2045,[45743]=2045,[45744]=2045,[45776]=2045,[45791]=2045,[45797]=2045,[45805]=2045,[45837]=2045,[45878]=2045,[45929]=2045,[45930]=2045,[45934]=2045,[45970]=2045,[45973]=2045,[45977]=2045,[45985]=2045,[45988]=2045,[46001]=2045,[46032]=2045,[46046]=2045,[46063]=2045,[46066]=2045,[46068]=2045,[46073]=2045,[46075]=2045,[46076]=2045,[46077]=2045,[46109]=2045,[46111]=2045,[46112]=2045,[46113]=2045,[46126]=2045,[46160]=2045,[46175]=2045,[46180]=2045,[46198]=2045,[46201]=2045,[46209]=2045,[46236]=2045,[46308]=2045,[46325]=2045,[46360]=2045,[46707]=2045,[46750]=2045,[46752]=2045,[46754]=2045,[46755]=2045,[46756]=2045,[46761]=2045,[46762]=2045,[46817]=2045,[46821]=2045,[46825]=2045,[46829]=2045,[46833]=2045,[46866]=2045,[46932]=2045,[46933]=2045,[46942]=2045,[46945]=2045,[46948]=2045,[47061]=2045,[47132]=2045,[40279]=1883,[41700]={1894,1883},[41855]=1883,[41860]=1883,[41861]=1883,[41862]=1883,[41955]=1883,[41956]=1883,[41961]=1883,[41964]=1883,[41965]=1883,[41980]=1883,[41992]=1883,[41995]=1883,[41996]=1883,[42023]=1883,[42028]=1883,[42070]=1883,[42075]=1883,[42076]=1883,[42077]=1883,[42080]=1883,[42087]=1883,[42124]=1883,[42145]=1883,[42150]=1883,[42174]=1883,[42190]=1883,[42779]=1883,[42819]=1883,[42870]={1894,1883},[42927]={1894,1883},[43101]={1894,1883},[43152]={1894,1883},[43183]=1883,[43247]=1883,[43248]=1883,[43303]=1883,[43324]=1883,[43332]=1883,[43333]={1894,1883},[43336]=1883,[43344]={1894,1883},[43345]={1894,1883},[43346]={1894,1883},[43347]={1894,1883},[43456]={1894,1883},[43457]={1894,1883},[43458]={1894,1883},[43459]={1894,1883},[43460]={1894,1883},[43629]={1894,1883},[43630]={1894,1883},[43631]={1894,1883},[43632]={1894,1883},[43633]={1894,1883},[43709]=1883,[43738]=1883,[43753]={1090,1883},[43755]={1090,1883},[43756]={1090,1883},[43758]=1883,[43759]=1883,[43784]=1883,[44011]=1883,[44033]=1883,[44298]={1894,1883},[44299]={1894,1883},[44300]={1894,1883},[44301]={1894,1883},[44302]={1894,1883},[44303]={1894,1883},[44304]={1894,1883},[44305]={1894,1883},[44895]={1894,1883},[45047]={1090,1883},[45070]={1090,1883},[41339]=1883,[41272]=1883,[41292]=1883,[41293]=1883,[41312]=1883,[41316]=1883,[41338]=1883,[41634]=1883,[41640]=1883,[41646]=1883,[41652]=1883,[41658]=1883,[41664]=1883,[41670]=1883,[41676]=1883,[40337]=1859,[41697]={1894,1859},[41895]=1859,[41914]=1859,[41931]=1859,[41990]=1859,[42015]=1859,[42071]=1859,[42082]=1859,[42089]=1859,[42090]=1859,[42111]=1859,[42151]=1859,[42169]=1859,[42209]=1859,[42725]=1859,[42795]={1894,1859},[42796]={1894,1859},[42797]={1894,1859},[42799]={1894,1859},[42830]=1859,[42859]=1859,[42880]=1859,[42962]=1859,[42969]=1859,[43435]=1859,[43445]=1859,[43512]=1859,[43513]=1859,[43583]=1859,[43774]={1090,1859},[43777]={1090,1859},[43778]={1090,1859},[43807]=1859,[43814]=1859,[43930]=1859,[43932]=1859,[43943]=1859,[43959]=1859,[44002]=1859,[44010]={1894,1859},[44012]={1894,1859},[44013]={1894,1859},[44015]={1894,1859},[44016]={1894,1859},[44017]={1894,1859},[44018]={1894,1859},[44019]={1894,1859},[44021]={1894,1859},[44022]={1894,1859},[44023]={1894,1859},[44024]={1894,1859},[44025]={1894,1859},[44026]={1894,1859},[44027]={1894,1859},[44028]={1894,1859},[44029]={1894,1859},[44030]={1894,1859},[44031]={1894,1859},[44032]={1894,1859},[44067]=1859,[44113]={1894,1859},[44114]={1894,1859},[44118]={1894,1859},[44119]={1894,1859},[44121]={1894,1859},[44122]={1894,1859},[44157]=1859,[44158]=1859,[44185]={1894,1859},[44186]={1894,1859},[44744]=1859,[44769]=1859,[44780]=1859,[44799]=1859,[44801]=1859,[44802]=1859,[44805]=1859,[44811]=1859,[44812]=1859,[44813]=1859,[44815]=1859,[44816]=1859,[44817]=1859,[44856]=1859,[44857]=1859,[44867]=1859,[45032]={1090,1859},[45068]={1090,1859},[45307]=1859,[41282]=1859,[41302]=1859,[41303]=1859,[41314]=1859,[41318]=1859,[41350]=1859,[41351]=1859,[41637]=1859,[41643]=1859,[41649]=1859,[41655]=1859,[41661]=1859,[41667]=1859,[41673]=1859,[41679]=1859,[43027]={1894,1900},[43040]={1894,1900},[43059]={1894,1900},[43063]={1894,1900},[43072]={1894,1900},[43079]={1894,1900},[43091]={1894,1900},[43098]={1894,1900},[43121]={1894,1900},[43175]={1894,1900},[44044]={1894,1900},[44048]={1894,1900},[44049]={1894,1900},[44050]={1894,1900},[44054]={1894,1900},[44187]={1894,1900},[44189]={1894,1900},[44190]={1894,1900},[44191]={1894,1900},[44192]={1894,1900},[44193]={1894,1900},[44194]={1894,1900}}

local invtype_locations = {
	INVTYPE_HEAD = { INVSLOT_HEAD },
	INVTYPE_NECK = { INVSLOT_NECK },
	INVTYPE_SHOULDER = { INVSLOT_SHOULDER },
	INVTYPE_BODY = { INVSLOT_BODY },
	INVTYPE_CHEST = { INVSLOT_CHEST },
	INVTYPE_ROBE = { INVSLOT_CHEST },
	INVTYPE_WAIST = { INVSLOT_WAIST },
	INVTYPE_LEGS = { INVSLOT_LEGS },
	INVTYPE_FEET = { INVSLOT_FEET },
	INVTYPE_WRIST = { INVSLOT_WRIST },
	INVTYPE_HAND = { INVSLOT_HAND },
	INVTYPE_FINGER = { INVSLOT_FINGER1, INVSLOT_FINGER2 },
	INVTYPE_TRINKET = { INVSLOT_TRINKET1, INVSLOT_TRINKET2 },
	INVTYPE_CLOAK = { INVSLOT_BACK },
	INVTYPE_WEAPON = { INVSLOT_MAINHAND, INVSLOT_OFFHAND },
	INVTYPE_SHIELD = { INVSLOT_OFFHAND },
	INVTYPE_2HWEAPON = { INVSLOT_MAINHAND },
	INVTYPE_WEAPONMAINHAND = { INVSLOT_MAINHAND },
	INVTYPE_WEAPONOFFHAND = { INVSLOT_OFFHAND },
	INVTYPE_HOLDABLE = { INVSLOT_OFFHAND },
}

function Data:QuestHasFaction(questID, factionID)
	local reps = worldQuestReps[questID]
	if reps then
		if (type(reps) == "table") then
			for _, fID in ipairs(reps) do
				if fID == factionID then return true end
			end
			return false
		else
			return reps == factionID
		end
	else
		return false
	end
end

function Data:RewardIsUpgrade(itemID, questID)
	local _, _, _, _, _, _, _, _, equipSlot, _, _ = GetItemInfo(itemID)
	local ilvl = self:RewardItemLevel(itemID, questID)

	if equipSlot and invtype_locations[equipSlot] then
		local isUpgrade = false

		for _, slotID in ipairs(invtype_locations[equipSlot]) do
			local currentItem = GetInventoryItemLink("player", slotID)
			if currentItem then
				local currentIlvl = select(4, GetItemInfo(currentItem))
				if not currentIlvl or ilvl >= (currentIlvl - Addon.Config.lootUpgradesLevel) then
					isUpgrade = true
				end
			else
				isUpgrade = true
			end
		end

		return isUpgrade
	else
		return true
	end
end

function Data:RewardItemLevel(itemID, questID)
	local key = itemID..":"..questID
	if cachedItems[key] == nil then
		fakeTooltip:SetOwner(UIParent, "ANCHOR_NONE")
		fakeTooltip:SetQuestLogItem("reward", 1, questID)

		-- local itemLink = select(2, fakeTooltip:GetItem())
		if false and itemLink then
			local itemName, _, _, itemLevel, _, _, _, _, itemEquipLoc, _, _, itemClassID, itemSubClassID = GetItemInfo(itemLink)
			if itemName then
				if (itemClassID == 3 and itemSubClassID == 11) or (itemEquipLoc ~= nil and itemEquipLoc ~= "") then
					cachedItems[key] = itemLevel
				else
					cachedItems[key] = false
				end
			end
		else
			local textLine2 = AWQFakeTooltipTextLeft2 and AWQFakeTooltipTextLeft2:IsShown() and AWQFakeTooltipTextLeft2:GetText()
			local textLine3 = AWQFakeTooltipTextLeft3 and AWQFakeTooltipTextLeft3:IsShown() and AWQFakeTooltipTextLeft3:GetText()
			local textLine4 = AWQFakeTooltipTextLeft4 and AWQFakeTooltipTextLeft4:IsShown() and AWQFakeTooltipTextLeft4:GetText()
			local matcher = string.gsub(ITEM_LEVEL_PLUS, "%%d%+", "(%%d+)+?")
			local itemLevel

			if textLine2 then
				itemLevel = tonumber(textLine2:match(matcher))
			end
			if textLine3 and not itemLevel then
				itemLevel = tonumber(textLine3:match(matcher))
			end
			if textLine4 and not itemLevel then
				itemLevel = tonumber(textLine4:match(matcher))
			end

			cachedItems[key] = itemLevel or false
		end
	end
	return cachedItems[key]
end

function Data:UNIT_QUEST_LOG_CHANGED(arg1)
	if arg1 == "player" then
		wipe(cachedItems)
	end
end
function Data:PLAYER_ENTERING_WORLD()
	wipe(cachedItems)
end

function Data:Startup()
	fakeTooltip = CreateFrame('GameTooltip', 'AWQFakeTooltip', UIParent, 'GameTooltipTemplate')
	fakeTooltip:Hide()

	self:RegisterEvent('UNIT_QUEST_LOG_CHANGED')
	self:RegisterEvent('PLAYER_ENTERING_WORLD')
end
