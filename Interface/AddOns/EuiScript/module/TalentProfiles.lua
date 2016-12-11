-------------------- Vars -------------------- 
local E = unpack(EUI)
local S = E:GetModule('Skins')
local AddOn = LibStub("AceAddon-3.0"):NewAddon("TalentProfiles", "AceConsole-3.0", "AceEvent-3.0", "AceHook-3.0");
local const__numTalentCols = 3 -- TODO: Get this from the API
local cdn, playerClass, cid = UnitClass("player"); -- playerClass is localisation independent
local DB = {}
local L = {}

--WOW API Cache
local GetSpecialization = GetSpecialization
local GetNumSpecializations = GetNumSpecializations
local GetMaxTalentTier = GetMaxTalentTier
local tinsert, tremove = table.insert, table.remove
local GetTalentInfo = GetTalentInfo
local GetActiveSpecGroup = GetActiveSpecGroup
local GetLocale = GetLocale

if GetLocale() == 'zhCN' then
	L["Error: Too many talents selected"] = "错误：太多天赋被选项"
	L["Added a new profile: "] = "添加新配置"
	L["Unable to load the selected profile"] = "不能载入选择的配置"
	L["Saved profile: "] = "保存配置"
	L["Removed a profile: "] = "移除一个配置"
	L["Enter Profile Name:"] = "输入配置名称："
	L["Save"] = "保存"
	L["Cancel"] = "取消"
	L["Do you want to remove the profile '%s'?"] = "你想移除配置文件 '%s'?"
	L["Yes"] = "是"
	L["No"] = "否"
	L["Unable to load talent configuration for the selected profile"] = "不能截入选择配置中的天赋设置"
	L["Activated profile: "] = "已激活配置: "
	L["Add new profile"] = "添加新配置"
	L["Apply"] = "应用"
	L["Save"] = "保存"
	L["Remove"] = "移除"
	L["Migration: Starting"] = "迁移：开始"
	L["Migration: Done: No specs found for this character"] = "迁移：当前角色无天赋"
	L["Migration: Info: No profiles found for spec #"] = "迁移：当前专精无配置 #"
	L["Migration: Info: Migrated profile "] = "迁移：合并配置 "
	L["Migration: Done: Successfully migrated "] = "迁移：成功合并 "
elseif GetLocale() == 'zhTW' then
	L["Error: Too many talents selected"] = "錯誤：太多天賦被選項"
	L["Added a new profile: "] = "添加新配置"
	L["Unable to load the selected profile"] = "不能載入選擇的配置"
	L["Saved profile: "] = "保存配置"
	L["Removed a profile: "] = "移除一個配置"
	L["Enter Profile Name:"] = "輸入配置名稱："
	L["Save"] = "保存"
	L["Cancel"] = "取消"
	L["Do you want to remove the profile '%s'?"] = "你想移除設定檔 '%s'?"
	L["Yes"] = "是"
	L["No"] = "否"
	L["Unable to load talent configuration for the selected profile"] = "不能截入選擇配置中的天賦設置"
	L["Activated profile: "] = "已啟動配置: "
	L["Add new profile"] = "添加新配置"
	L["Apply"] = "應用"
	L["Save"] = "保存"
	L["Remove"] = "移除"
	L["Migration: Starting"] = "遷移：開始"
	L["Migration: Done: No specs found for this character"] = "遷移：當前角色無天賦"
	L["Migration: Info: No profiles found for spec #"] = "遷移：當前專精無配置 #"
	L["Migration: Info: Migrated profile "] = "遷移：合併配置 "
	L["Migration: Done: Successfully migrated "] = "遷移：成功合併" 
else
	L["Error: Too many talents selected"] = "Error: Too many talents selected"
	L["Added a new profile: "] = "Added a new profile: "
	L["Unable to load the selected profile"] = "Unable to load the selected profile"
	L["Saved profile: "] = "Saved profile: "
	L["Removed a profile: "] = "Removed a profile: "
	L["Enter Profile Name:"] = "Enter Profile Name:"
	L["Save"] = "Save"
	L["Cancel"] = "Cancel"
	L["Do you want to remove the profile '%s'?"] = "Do you want to remove the profile '%s'?"
	L["Yes"] = "Yes"
	L["No"] = "No"
	L["Unable to load talent configuration for the selected profile"] = "Unable to load talent configuration for the selected profile"
	L["Activated profile: "] = "Activated profile: : "
	L["Add new profile"] = "Add new profile"
	L["Apply"] = "Apply"
	L["Save"] = "Save"
	L["Remove"] = "Remove"
	L["Migration: Starting"] = "Migration: Starting"
	L["Migration: Done: No specs found for this character"] = "Migration: Done: No specs found for this character"
	L["Migration: Info: No profiles found for spec #"] = "Migration: Info: No profiles found for spec #"
	L["Migration: Info: Migrated profile "] ="Migration: Info: Migrated profile "
	L["Migration: Done: Successfully migrated "] = "Migration: Done: Successfully migrated "
end

-------------------- LUA Extensions -------------------- 

-- Prints all the key value pairs in the given table (See python's dir() function)
function dir(t)
    for k, v in pairs(t) do
        print(k, v)
    end
end

-- Returns the length of the given table
function table.length(t)
    local count = 0
    for k, v in pairs(t) do
        count = count + 1
    end
    return count
end

function DB:Print(msg, arg1) --by eui.cc
	if L[msg] then
		msg = L[msg]
	end
	if arg1 then
		msg = msg.. arg1
	end
	print(msg)
end

---------- Database ----------

-- Ensure the database is valid
function DB:Verify()
    -- Make sure the base DB table exists
    if TalentProfilesGlobalDB == nil then TalentProfilesGlobalDB = {} end
    -- Make sure the current class DB exists
    if TalentProfilesGlobalDB[playerClass] == nil then TalentProfilesGlobalDB[playerClass] = {} end
    -- Make sure the current class' specs table exists
    if TalentProfilesGlobalDB[playerClass].specs == nil then TalentProfilesGlobalDB[playerClass].specs = {} end
    -- Make sure each spec exists
    for i = 1, GetNumSpecializations() do
        -- Make sure the current spec's table exists
        if TalentProfilesGlobalDB[playerClass].specs[i] == nil then TalentProfilesGlobalDB[playerClass].specs[i] = {} end
        -- Make sure the profiles DB exists
        if TalentProfilesGlobalDB[playerClass].specs[i].profiles == nil then TalentProfilesGlobalDB[playerClass].specs[i].profiles = {} end
    end
end

-- Returns a profile at the given index
function DB:GetProfile(index)
    return TalentProfilesGlobalDB[playerClass].specs[GetSpecialization()].profiles[index]
end

-- Returns a list of all profiles for the current spec
function DB:GetAllProfiles()
    return TalentProfilesGlobalDB[playerClass].specs[GetSpecialization()].profiles
end

-- Inserts a new profile into the current spec's DB
function DB:InsertProfile(profile)
    tinsert(TalentProfilesGlobalDB[playerClass].specs[GetSpecialization()].profiles, profile)
end

-- Removes the profile at the given index from the current spec's DB
function DB:RemoveProfile(index)
    tremove(TalentProfilesGlobalDB[playerClass].specs[GetSpecialization()].profiles, index)
end

-- Returns the talent info for each talent the user currently has available
function GetTalentInfos()
    local talentInfos = {}
    local k = 1
    for i = 1, GetMaxTalentTier() do
        for j = 1, const__numTalentCols do
            local talentID, name, texture, selected, available, spellid, tier, column = GetTalentInfo(i, j, GetActiveSpecGroup())
            talentInfos[k] = { }
            talentInfos[k].talentID = talentID
            talentInfos[k].name = name
            talentInfos[k].texture = texture
            talentInfos[k].selected = selected
            talentInfos[k].available = available
            talentInfos[k].spellid = spellid
            talentInfos[k].tier = tier
            talentInfos[k].column = column
            k = k + 1
        end
    end
    return talentInfos
end

-- Adds a new profile to the database
function AddProfile(name)
    -- Ensure the database is ready
    DB:Verify()
    -- Get basic info
    local talentInfos = GetTalentInfos()
    local profile = {}
    profile.name = name
    profile.talents = {}
    -- Get the currently selected talents
    local i = 1
    for k, v in pairs(talentInfos) do
        if v.selected == true then
            profile.talents[i] = v.talentID
            i = i + 1
        end
    end
    -- Make sure the data is valid
    if i > 8 then
        DB:Print("Error: Too many talents selected")
    end
    -- Save the profile to the database
    DB:InsertProfile(profile)
    -- Rebuild the frame with the new data
    BuildFrame()
    -- Inform the user a profile was added
    DB:Print("Added a new profile: ", profile.name)
end

-- Saves the current talent configuration to the current profile
function SaveProfile(index)
    -- Don't try and save a profile that doesn't exist
    if table.length(DB:GetAllProfiles()) == 0 then
        return
    end
    -- Don't activate the placeholder profile
    if index ~= "new" then
        -- Get the profile, checking for errors on the way
        local profile = DB:GetProfile(index)
        if profile == nil then
            DB:Print("Unable to load the selected profile")
            return
        end
        -- Update the selected talents
        local talentInfos = GetTalentInfos()
        local i = 1
        for k, v in pairs(talentInfos) do
            if v.selected == true then
                profile.talents[i] = v.talentID
                i = i + 1
            end
        end
        -- Inform the user a profile was activated
        DB:Print("Saved profile: ", profile.name)
    end
end

function PopupHandler_AddProfile(sender)
    AddProfile(sender.editBox:GetText())
end

-- Remove a profile from the database
function RemoveProfile(index)
    local key = nil
    local i = 1
    for k, v in pairs(DB:GetProfile(index)) do
        if i == index then
            key = k
        end
        i = i + 1
    end
    -- Cache the name
    local name = DB:GetProfile(index).name
    -- Remove the profile
    DB:RemoveProfile(index)
    BuildFrame()
    -- Inform the user a profile was removed
    DB:Print("Removed a profile: ", name)
end

function PopupHandler_RemoveProfile(sender)
    RemoveProfile(TalentProfiles_profilesDropDown.selectedID)
end

-- Dialogue that enables the user to name a new profile
StaticPopupDialogs["TALENTPROFILES_ADD_PROFILE"] = {
    text = L["Enter Profile Name:"],
    button1 = L["Save"],
    button2 = L["Cancel"],
    OnAccept = PopupHandler_AddProfile,
    timeout = 0,
    whileDead = true,
    hideOnEscape = true,
    preferredIndex = 3,
    hasEditBox = true,
}
function StaticPopupShow_Add()
    StaticPopup_Show("TALENTPROFILES_ADD_PROFILE")
end

-- Dialogue that enables the user to confirm the removal of a profile
StaticPopupDialogs["TALENTPROFILES_REMOVE_PROFILE"] = {
    text = L["Do you want to remove the profile '%s'?"],
    button1 = L["Yes"],
    button2 = L["No"],
    OnAccept = PopupHandler_RemoveProfile,
    timeout = 0,
    whileDead = true,
    hideOnEscape = true,
    preferredIndex = 3,
}
function StaticPopupShow_Remove()
    local index = TalentProfiles_profilesDropDown.selectedID
    local name = DB:GetProfile(index).name
    StaticPopup_Show("TALENTPROFILES_REMOVE_PROFILE", name)
end

-- Activates the profile at the given index
function ActivateProfile(index)
    -- Don't activate the placeholder profile
    if index ~= "new" then
        -- Get the profile, checking for errors on the way
        local profile = DB:GetProfile(index)
        if profile == nil or profile.talents == nil then
            DB:Print("Unable to load talent configuration for the selected profile")
            return
        end
        for i = 1, GetMaxTalentTier() do
            LearnTalent(profile.talents[i])
        end
        -- Inform the user a profile was activated
        DB:Print("Activated profile: ", profile.name)
    end
end

-------------------- TalentProfiles Event Handlers --------------------

-- Fired when the "Activate" button is clicked
function Handler_ActivateProfile(sender)
    DB:Verify()
    -- Check if any profiles exists
    if table.length(DB:GetAllProfiles()) == 0 then
        return
    end
    -- Activate the profile
    ActivateProfile(TalentProfiles_profilesDropDown.selectedID)
end

-- Fired when the "Save" button is clicked
function Handler_SaveProfile(sender)
    SaveProfile(TalentProfiles_profilesDropDown.selectedID)
end

-- Fired when the "Remove" button is clicked
function Handler_RemoveProfile(sender)
    DB:Verify()
    -- Check if any profiles exists
    if table.length(DB:GetAllProfiles()) == 0 then
        return
    end
    StaticPopupShow_Remove()
end

-------------------- Dropdown functions --------------------

function ProfilesDropDown_OnClick(sender)
    UIDropDownMenu_SetSelectedID(TalentProfiles_profilesDropDown, sender:GetID())
end

function ProfilesDropDown_OnClick_NewProfile(sender)
    StaticPopupShow_Add()
end

function ProfilesDropDown_Initialise(sender, level)
    DB:Verify()
    local items = DB:GetAllProfiles()
    local i = 1
    for k, v in pairs(items) do
        local info = UIDropDownMenu_CreateInfo()
        info.text = v.name
        info.value = i
        info.func = ProfilesDropDown_OnClick
        UIDropDownMenu_AddButton(info, level)
        i = i + 1
    end
    -- Add the new profile item
    local info = UIDropDownMenu_CreateInfo()
    info.text = "Add new profile"
    info.value = "new"
    info.func = ProfilesDropDown_OnClick_NewProfile
    info.rgb = { 1.0, 0.0, 1.0, 1.0 }
    UIDropDownMenu_AddButton(info, level)
end

function BuildFrame()
    -- Set up main frame, if it doesnt already exist
    local mainFrame = TalentProfiles_main
    if TalentProfiles_main == nil then
        mainFrame = CreateFrame("Frame", "TalentProfiles_main", PlayerTalentFrame)
        mainFrame:SetPoint("TOPLEFT", PlayerTalentFrame, "TOPLEFT", 50, -30)
        mainFrame:SetSize(400, 50)
    end

    -- Set up profiles dropdown, if it doesnt already exist
    local dropdown = TalentProfiles_profilesDropDown
    if TalentProfiles_profilesDropDown == nil then
        dropdown = CreateFrame("Button", "TalentProfiles_profilesDropDown", TalentProfiles_main, "UIDropDownMenuTemplate")
        UIDropDownMenu_SetWidth(dropdown, 125)
        UIDropDownMenu_SetButtonWidth(dropdown, 124)
    end
    -- Repopulate the dropdown, even if it already exists
    UIDropDownMenu_Initialize(dropdown, ProfilesDropDown_Initialise)
    UIDropDownMenu_SetSelectedID(dropdown, 1) -- TODO: select the currently active profile
    UIDropDownMenu_JustifyText(dropdown, "LEFT")
    dropdown:SetPoint("TOPLEFT", TalentProfiles_main, "TOPLEFT", 0, 0)
	if E.private.skins.blizzard.enable and E.private.skins.blizzard.talent then
		S:HandleDropDownBox(TalentProfiles_profilesDropDown, 125)
		TalentProfiles_profilesDropDownButton:SetWidth(24)
		TalentProfiles_profilesDropDownText:ClearAllPoints()
		TalentProfiles_profilesDropDownText:SetPoint("LEFT", TalentProfiles_profilesDropDownButton,"RIGHT", -60, 0)
	end
    dropdown:Show()

    -- Set up the action buttons
    local btnApply = TalentProfiles_btnApply
    if TalentProfiles_btnApply == nil then
        btnApply = CreateFrame("Button", "TalentProfiles_btnApply", TalentProfiles_main, "UIPanelButtonTemplate")
        btnApply:SetPoint("TOPLEFT", TalentProfiles_main, "TOPLEFT", 10 + 150 + 10, -1)
        btnApply:SetSize(100, 24)
        btnApply:SetText(L["Apply"])
        btnApply:SetScript("OnClick", Handler_ActivateProfile)
		S:HandleButton(btnApply)
        btnApply:Show()
    end
    local btnSave = TalentProfiles_btnSave
    if TalentProfiles_btnSave == nil then
        btnSave = CreateFrame("Button", "TalentProfiles_btnSave", TalentProfiles_main, "UIPanelButtonTemplate")
        btnSave:SetPoint("TOPLEFT", TalentProfiles_main, "TOPLEFT", 10 + 150 + 10 + 100 + 10, -1)
        btnSave:SetSize(100, 24)
        btnSave:SetText(L["Save"])
        btnSave:SetScript("OnClick", Handler_SaveProfile)
		S:HandleButton(btnSave)
        btnSave:Show()
    end
    local btnRemove = TalentProfiles_btnRemove
    if TalentProfiles_btnRemove == nil then
        btnRemove = CreateFrame("Button", "TalentProfiles_btnRemove", TalentProfiles_main, "UIPanelButtonTemplate")
        btnRemove:SetPoint("TOPLEFT", TalentProfiles_main, "TOPLEFT", 10 + 150 + 10 + 100 + 10 + 100 + 10, -1)
        btnRemove:SetSize(100, 24)
        btnRemove:SetText(L["Remove"])
        btnRemove:SetScript("OnClick", Handler_RemoveProfile)
		S:HandleButton(btnRemove)
        btnRemove:Show()
    end
end

-------------------- Wow API Events/Hooks -------------------- 

-- Fired when talent the talent frame is toggled
function AddOn:ToggleTalentFrame()
    -- This is raw hooked, so call the origanal function
    self.hooks.ToggleTalentFrame()

    -- Don't continue if the player doesn't have a talent frame yet (under level 10)
    if PlayerTalentFrame == nil then
        return
    end

    -- Build the frame
    BuildFrame()
    -- Set the visibility of the profile selector to that of the talent frame
    TalentProfiles_main:SetShown(PlayerTalentFrame:IsVisible())
end

-------------------- DB Migration --------------------

function DB:Migrate()
    if TalentProfilesDB ~= nil then
        DB:Print("Migration: Starting")
        if TalentProfilesDB.specs == nil then
            DB:Print("Migration: Done: No specs found for this character")
            TalentProfilesDB = nil
            return
        end
        local count = 0
        for k_spec, spec in pairs(TalentProfilesDB.specs) do
            if spec.profiles == nil then
                DB:Print("Migration: Info: No profiles found for spec #", k)
            else
                for k_profile, profile in pairs(spec.profiles) do
                    table.insert(TalentProfilesGlobalDB[playerClass].specs[k_spec].profiles, profile)
                    DB:Print("Migration: Info: Migrated profile ", profile.name)
                    count = count + 1
                end
            end
        end
        TalentProfilesDB = nil
        DB:Print("Migration: Done: Successfully migrated profiles: ",count) 
    end
end

-------------------- Ace Events --------------------

function AddOn:OnInitialize()
	if IsAddOnLoaded("TalentProfiles") then return; end
	if not E.db.euiscript.talentSetManager then return; end

    -- Load DB
    DB:Verify()

    -- Migrate old DB
    DB:Migrate()

    -- Hook functions
    self:RawHook("ToggleTalentFrame", true)

--    self:Print("Loaded")
end
