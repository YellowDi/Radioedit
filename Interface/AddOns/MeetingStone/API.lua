
BuildEnv(...)

local memorize = require('NetEaseMemorize-1.0')
local nepy = require('NetEasePinyin-1.0')

local AceSerializer = LibStub('AceSerializer-3.0')

function GetClassColorText(className, text)
    local color = RAID_CLASS_COLORS[className]
    return format('|c%s%s|r', color.colorStr, text)
end

function IsGroupLeader()
    return  not IsInGroup(LE_PARTY_CATEGORY_HOME) or UnitIsGroupLeader('player', LE_PARTY_CATEGORY_HOME)
end

function IsActivityManager()
    return UnitIsGroupLeader('player', LE_PARTY_CATEGORY_HOME) or (IsInRaid(LE_PARTY_CATEGORY_HOME) and UnitIsGroupAssistant('player', LE_PARTY_CATEGORY_HOME))
end

function ToggleCreatePanel(activityId)
    MainPanel:SelectPanel(ManagerPanel)
    if not CreatePanel:IsActivityCreated() then
        CreatePanel:SelectActivity(activityId)
    end
end

function GetPlayerClass()
    return (select(3, UnitClass('player')))
end

function GetPlayerItemLevel(isPvP)
    if isPvP then
        return floor(select(3, GetAverageItemLevel()))
    else
        return floor(GetAverageItemLevel())
    end
end

DecodeCommetData = memorize.multirets(function(comment)
    if not comment or comment == '' then
        return nil
    end
    local summary, data = comment:match('^(.*)%((^1^.+^^)%)$')
    if data then
        return summary, AceSerializer:Deserialize(data)
    else
        return comment
    end
end)

function CompressNumber(n)
    n = tonumber(n)
    return n and n > 0 and n or nil
end

function CodeCommentData(activity)
    local activityId = activity:GetActivityID()
    local customId = activity:GetCustomID()
    local data = format('(%s)', AceSerializer:Serialize(
        CompressNumber(customId),
        ADDON_VERSION_SHORT,
        activity:GetMode(),
        activity:GetLoot(),
        GetPlayerClass(),
        GetPlayerItemLevel(activity:IsUseHonorLevel()),
        GetPlayerRaidProgression(activityId, customId),
        GetPlayerPvPRating(activityId),
        CompressNumber(activity:GetMinLevel()),
        CompressNumber(activity:GetMaxLevel()),
        CompressNumber(activity:GetPvPRating()),
        GetAddonSource(),
        GetPlayerFullName(),
        GetPlayerSavedInstance(customId),
        format('%s-%s-%s', activity:GetModeText(), activity:GetLootText(), activity:GetName()),
        CompressNumber(activity:IsUseHonorLevel() and UnitHonorLevel('player') or nil)
    ))
    return data
end

function GetSafeSummaryLength(activityId, customId, mode, loot)
    local data = format('(%s)', AceSerializer:Serialize(
        customId,
        ADDON_VERSION_SHORT,
        mode,
        loot,
        GetPlayerClass(),
        GetPlayerItemLevel(IsUseHonorLevel(activityId)),
        GetPlayerRaidProgression(activityId, customId),
        GetPlayerPvPRating(activityId),
        999,
        999,
        IsUsePvPRating(activityId) and 9999 or nil,
        GetAddonSource(),
        GetPlayerFullName(),
        GetPlayerSavedInstance(customId),
        format('%s-%s-%s', GetModeName(mode), GetLootName(loot), GetActivityName(activityId, customId)),
        CompressNumber(IsUseHonorLevel(activityId) and UnitHonorLevel('player') or nil)
    ))
    return MAX_SUMMARY_LETTERS - strlenutf8(data)
end

function GetPlayerFullName()
    return (format('%s-%s', UnitName('player'), GetRealmName()):gsub('%s+', ''))
end

function CodeDescriptionData(activity)
    if not activity:IsMeetingStone() then
        return nil, 0
    else
        local activityId = activity:GetActivityID()
        local data = format('(%s)', AceSerializer:Serialize(GetPlayerRaidProgression(activityId, activity:GetCustomID()), GetPlayerPvPRating(activityId), GetAddonSource()))
        return data, strlenutf8(data)
    end
end

function DecodeDescriptionData(description)
    if not description or description == '' then
        return
    end
    local summary, data = description:match('^(.*)%((.+)%)$')
    if data then
        return summary, AceSerializer:Deserialize(data)
    else
        return description
    end
end

function GetClassColoredText(class, text)
    if not class or not text then
        return text
    end
    local color = RAID_CLASS_COLORS[class]
    if color then
        return format('|c%s%s|r', color.colorStr, text)
    end
    return text
end

function GetActivityCode(activityId, customId, categoryId, groupId)
    if activityId and (not categoryId or not groupId) then
        categoryId, groupId = select(3, C_LFGList.GetActivityInfo(activityId))
    end
    return format('%d-%d-%d-%d', categoryId or 0, groupId or 0, activityId or 0, customId or 0)
end

function GetRaidBossNames(eventCode)
    return _RAID_DATA[eventCode].bossNames
end

function IsUseHonorLevel(activityId)
    return activityId and select(11, C_LFGList.GetActivityInfo(activityId))
end

local PVP_INDEXS = {
    [6] = 1,
    [7] = 1,
    [8] = 1,
    [19] = 2,
}

function IsUsePvPRating(activityId)
    return PVP_INDEXS[activityId]
end

function GetPlayerPvPRating(activityId)
    local ratingType = PVP_INDEXS[activityId]
    if not ratingType then
        return
    end

    if ratingType == 2 then
        return (GetPersonalRatedInfo(4))
    else
        return max((GetPersonalRatedInfo(1)), (GetPersonalRatedInfo(2)), (GetPersonalRatedInfo(3)))
    end
end

function GetPlayerBattleTag()
    return (select(2, BNGetInfo()))
end

function GetRaidProgressionData(activityId, customId)
    return CUSTOM_PROGRESSION_LIST[customId] or RAID_PROGRESSION_LIST[activityId]
end

function GetPlayerRaidProgression(activityId, customId)
    local list = GetRaidProgressionData(activityId, customId)
    if not list then
        return
    end

    local result = 0
    for i, v in ipairs(list) do
        if tonumber((GetStatistic(v.id))) or (v.id2 and tonumber((GetStatistic(v.id2)))) then
            result = bit.bor(result, bit.lshift(1, i - 1))
        end
    end
    return result
end

function GetPlayerSavedInstance(customId)
    local data = ACTIVITY_CUSTOM_INSTANCE[customId]
    if not data then
        return
    end

    for i = 1, GetNumSavedInstances() do
        local name, id, _, difficulty, locked, extended, _, _, _, difficultyName, numEncounters = GetSavedInstanceInfo(i)
        if name == data.instance and (not data.difficulty or data.difficulty == difficultyName) then
            local result = 0
            for bossIndex = 1, numEncounters do
                if select(3, GetSavedInstanceEncounterInfo(i, bossIndex)) then
                    result = bit.bor(result, bit.lshift(1, bossIndex - 1)) 
                end
            end
            return result ~= 0 and result or nil
        end
    end
end

function GetProgressionTex(value, bossIndex)
    local killed = bit.band(value, bit.lshift(1, bossIndex-1)) > 0

    return killed and [[|TINTERFACE\FriendsFrame\StatusIcon-Online:16|t]] or [[|TINTERFACE\FriendsFrame\StatusIcon-Offline:16|t]]
end

function GetActivityName(activityId, customId)
    return customId and ACTIVITY_CUSTOM_NAMES[customId] or ACTIVITY_NAME_CACHE[activityId]
end

function GetActivityShortName(activityId, customId)
    return customId and ACTIVITY_CUSTOM_SHORT_NAMES[customId] or select(2, C_LFGList.GetActivityInfo(activityId))
end

function GetModeName(mode)
    return ACTIVITY_MODE_NAMES[mode]
end

function GetLootName(loot)
    return ACTIVITY_LOOT_LONG_NAMES[loot]
end

function GetLootShortName(loot)
    return ACTIVITY_LOOT_NAMES[loot]
end

function CodeActivityTitle(activityId, customId, mode, loot)
    return format('%s-%s-%s-%s', L['集合石'], GetLootName(loot), GetModeName(mode), GetActivityName(activityId, customId))
end

function GetFullVersion(version)
    return version:gsub('(%d)(%d)(%d%d)', '%10%200.%3')
end

function FormatActivitiesSummaryUrl(summary, url)
    return (summary:gsub('{URL([^}]*)}', function(info)
        local path, text = info:match('^(.*):(.+)$')
        if not path then
            path = info
            text = url .. path
        end
        return format('|Hurl:%s%s|h|cff00ffff[%s]|r|h', url, path, text)
    end):gsub('{QR([^:}]+):([^}]+)}', function(title, info)
        return format('|Hqrcode:%s|h|cffff64ec[%s]|r|h', info, title)
    end))
end

function SummaryToHtml(text)
    return text:gsub('^', '<html><body><p>　　'):gsub('$', '</p></body></html>'):gsub('[\r\n]+', '</p><p>　　')
end

CheckSpamWord, ClearSpamWordCache = memorize.normal(function(word)
    if not word then
        return
    end
    for i, v in ipairs(Profile:GetSpamWords()) do
        if strfind(word, v.text, 1, v.pain) then
            return true
        end
    end
    return false
end)

CheckContent, ClearCheckContentCache = memorize.normal(function(content)
    if content == nil then
        return
    end
    local filterPinyin, filterNormal = Addon:GetFilterData()
    if filterPinyin then
        local pinyin = nepy.utf8topinyin(nepy.unchinesefilter(nepy.toutf8(content:lower():gsub('[\001-\127]+', ''))))

        for i, v in ipairs(filterPinyin) do
            if pinyin:match(v) then
                return true
            end
        end
    end
    if filterNormal then
        for i, v in ipairs(filterNormal) do
            if content:match(v) then
                return true
            end
        end
    end
    return false
end)

function PlayerHasPet(name)
    return select(2, C_PetJournal.FindPetIDByName(name)) ~= nil
end

function PlayerHasItem(id)
    for i = -3, 11 do
        for j = 1, GetContainerNumSlots(i) do
            if GetContainerItemID(i, j) == id then
                return true
            end
        end
    end
end

function PlayerHasMount(id)
    return Addon:FindMount(id)
end

function IsSoloCustomID(customId)
    return customId == SOLO_HIDDEN_CUSTOM_ID or customId == SOLO_VISIBLE_CUSTOM_ID
end


function GetAddonSource()
    for line in gmatch('\066\105\103\070\111\111\116\058\049\010\033\033\033\049\054\051\085\073\033\033\033\058\050\010\068\117\111\119\097\110\058\052\010\069\108\118\085\073\058\056', '[^\r\n]+') do
        local n, v = line:match('^(.+):(%d+)$')
        if IsAddOnLoaded(n) then
            return tonumber(v)
        end
    end
    return 0
end
