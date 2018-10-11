--[[----------------------------------------------------------------------------
	AzeritePowerWeights

	Helps you pick the best Azerite powers on your gear for your class and spec.

	(c) 2018 -
	Sanex @ EU-Arathor / ahak @ Curseforge
----------------------------------------------------------------------------]]--
local ADDON_NAME, n = ...

local _G = _G
local L = {}
n.L = L

local LOCALE = GetLocale()
do -- enUS / enGB
	-- Data.lua
	L.DefaultScaleName_Default = "Default"
	L.DefaultScaleName_Defensive = "Defensive"
	L.DefaultScaleName_Offensive = "Offensive"

	-- UI.lua
	L.ScaleWeightEditor_Title = "%s Scale Weight Editor" -- %s = ADDON_NAME

	-- Core.lua
	L.ScalesList_CustomGroupName = "Custom Scales"
	L.ScalesList_DefaultGroupName = "Default Scales"
	L.ScalesList_CreateImportText = "Create New / Import"

	L.ScaleName_Unnamed = "Unnamed"
	L.ScaleName_Unknown = "Unknown"

	L.ExportPopup_Title = "Export Scale"
	L.ExportPopup_Desc = "Exporting scale %1$s\nPress %2$sCtrl+C%3$s to copy the string and %4$sCtrl+V%5$s to paste it somewhere" -- %1$s = scaleName, rest are color codes

	L.ImportPopup_Title = "Import Scale"
	L.ImportPopup_Desc = "Importing scale from string\nPress %1$sCtrl+V%2$s to paste string to the editbox and press %3$s" -- %1$s and %2$s are color codes and %3$s = _G.ACCEPT
	L.ImportPopup_Error_OldStringVersion = "ERROR: \"Import string\" -version is too old or malformed import string!"
	L.ImportPopup_Error_MalformedString = "ERROR: Malformed import string!"
	L.ImportPopup_UpdatedScale = "Updated existing scale \"%s\"" -- %s = scaleName
	L.ImportPopup_CreatedNewScale = "Imported new scale \"%s\"" -- %s = scaleName

	L.CreatePopup_Title = "Create Scale"
	L.CreatePopup_Desc = "Creating new scale. Select class and specialization from dropdown and then enter name for the new scale and press %1$s" -- %s = _G.ACCEPT
	L.CreatePopup_Error_UnknownError = "ERROR: Something went wrong creating new scale \"%s\"!" -- %s = scaleName
	L.CreatePopup_Error_CreatedNewScale = "Created new scale \"%s\"" -- %s = scaleName

	L.RenamePopup_Title = "Rename Scale"
	L.RenamePopup_Desc = "Renaming scale %1$s\nEnter new name to the editbox and press %2$s" -- %1$s = old (current) scaleName, %2$s = _G.ACCEPT
	L.RenamePopup_RenamedScale = "Renamed scale \"%1$s\" to \"%2$s\"" -- %1$s = old scaleName, %2$s = new scaleName

	L.DeletePopup_Title = "Delete Scale"
	L.DeletePopup_Desc = "Deleting scale %1$s\nPress %2$s to confirm.\nAll characters using this scale for their specialization will be reverted back to Default scale." -- %1$s = scaleName, %2$s = _G.ACCEPT
	L.DeletePopup_Warning = " ! This action is permanent and cannot be reversed ! "
	L.DeletePopup_DeletedScale = "Deleted scale \"%s\"" -- %s = scaleName
	L.DeletePopup_DeletedDefaultScale = "Deleted scale was in use, reverting back to Default-option for your class and specialization!"

	L.WeightEditor_VersionText = "Version %s" -- %s = version
	L.WeightEditor_CreateNewText = "Create New"
	L.WeightEditor_ImportText = "Import"
	L.WeightEditor_EnableScaleText = "Use this Scale"
	L.WeightEditor_ExportText = "Export"
	L.WeightEditor_RenameText = "Rename"
	L.WeightEditor_DeleteText = "Delete"
	L.WeightEditor_TooltipText = "Show in Tooltips"
	L.WeightEditor_CurrentScale = "Current scale: %s" -- %s current scaleName

	L.PowersTitles_Class = "Class Powers"
	L.PowersTitles_Defensive = "Defensive Powers"
	L.PowersTitles_Role = "Role Powers"
	L.PowersTitles_Zone = "Raid and Zone Powers"
	L.PowersTitles_Profession = "Profession Powers"
	L.PowersTitles_PvP = "PvP Powers"

	L.PowersScoreString = "Current score: %1$s/%2$s\nMaximum score: %3$s\nAzerite level: %4$d/%5$d" -- %1$s = currentScore, %2$s = currentPotential, %3$s = maximumScore, %4$d = currentLevel, %5$d = maxLevel
	L.ItemToolTip_AzeriteLevel = "Azerite level: %1$d / %2$d" -- %1$d = currentLevel, %2$d = maxLevel
	L.ItemToolTip_Legend = "Current score / Current potetial / Maximum score"

	L.Config_SettingsAddonExplanation = "This addon calculates \"Current score\", \"Current potetial\" and \"Maximum score\" for Azerite gear based on your selected scale's weights."
	L.Config_SettingsScoreExplanation = "\"Current score\" is the sum of the currently selected Azerite powers in the item.\n\"Current potetial\" is the sum of the highest weighted Azerite powers from each tier you have access to in the item.\n\"Maximum score\" is the sum of the highest weighted Azerite powers from each tier, including the locked ones, in the item."
	L.Config_SettingsSavedPerChar = "All these settings here are saved per character.\nCustom scales are shared between all characters."

	L.Config_Scales_Title = "Scales list"
	L.Config_Scales_Desc = "Following settings only affects the list of Default scales. All Custom scales will be always listed to every class."
	L.Config_Scales_OwnClassDefaultsOnly = "List own class Default-scales only"
	L.Config_Scales_OwnClassDefaultsOnly_Desc = "List Default-scales for your own class only, instead of listing all of them."

	L.Config_Importing_Title = "Importing"
	L.Config_Importing_ImportingCanUpdate = "Importing can update existing scales"
	L.Config_Importing_ImportingCanUpdate_Desc = "When importing scale with same name, class and specialization as pre-existing scale, existing scale will be updated with the new weights instead of creating new scale."
	L.Config_Importing_ImportingCanUpdate_Desc_Clarification = "There can be multiple scales with same name as long as they are for different specializations or classes."

	L.Config_WeightEditor_Title = "Scales weight editor"
	L.Config_WeightEditor_Desc = "Following settings only affects the powers shown in the scale weight editor. Even if you disable them, all and any Azerite powers will be still scored if they have weight set to them in the active scale."
	L.Config_WeightEditor_ShowDefensive = "Show Defensive powers"
	L.Config_WeightEditor_ShowDefensive_Desc = "Show common and class specific Defensive powers in the scale weight editor."
	L.Config_WeightEditor_ShowRole = "Show Role specific powers"
	L.Config_WeightEditor_ShowRole_Desc = "Show Role specific powers in the scale weight editor."
	L.Config_WeightEditor_ShowRolesOnlyForOwnSpec = "Show Role specific powers only for my own specializations role"
	L.Config_WeightEditor_ShowRolesOnlyForOwnSpec_Desc = "Show common and current specialization related specific Role specific powers in the scale weight editor. Enabling this setting e.g. hides healer only specific powers from damagers and tanks etc."
	L.Config_WeightEditor_ShowZone = "Show Zone specific powers"
	L.Config_WeightEditor_ShowZone_Desc = "Show Zone specific powers in the scale weight editor. These powers can only appear in items acquired in particular zones related to the power."
	L.Config_WeightEditor_ShowZone_Desc_Proc = "Zone specific powers can activate/proc everywhere, but raid powers have secondary effect which will activate only while inside their related raid instance (e.g. Uldir powers secondary effect will only proc while inside Uldir raid instance).\nRaid powers are marked with an asterisk (*) next to their name in the scale weight editor."
	L.Config_WeightEditor_ShowProfession = "Show Profession specific powers"
	L.Config_WeightEditor_ShowProfession_Desc = "Show Profession specific powers in the scale weight editor. These powers can only appear in items created with professions. Currently these can only appear in Engineering headgear."
	L.Config_WeightEditor_ShowPvP = "Show PvP specific powers"
	L.Config_WeightEditor_ShowPvP_Desc = "Show PvP specific powers in the scale weight editor. You'll only see your own factions powers, but changes made to them will be mirrored to both factions."
	L.Config_WeightEditor_ShowPvP_Desc_Import = "When Exporting, the resulting export-string will only include your own factions pvp powers, but they are interchangeable with opposing factions pvp-powerIDs.\nWhen Importing import-string with pvp powers only from one faction, powers will get their weights mirrored to both factions on Import."

	L.Config_Score_Title = "Score"
	L.Config_Score_AddItemLevelToScore = "Add itemlevel to all scores"
	L.Config_Score_AddItemLevelToScore_Desc = "Add Azerite items itemlevel to all current score, current potential and maximum score calculations."
	L.Config_Score_ScaleByAzeriteEmpowered = "Scale itemlevel score by the weight of %s in the scale" -- %s Name of Azerite Empowered, returned by _G.GetSpellInfo(263978)
	L.Config_Score_ScaleByAzeriteEmpowered_Desc = "When adding itemlevel to the scores, use the weight of %s of the scale to calculate value of +1 itemlevel instead of using +1 itemlevel = +1 score." -- %s Name of Azerite Empowered, returned by _G.GetSpellInfo(263978)
	L.Config_Score_AddPrimaryStatToScore = "Add primary stat to all scores"
	L.Config_Score_AddPrimaryStatToScore_Desc = "Add Azerite items amount of primary stat (%s/%s/%s) to all current score, current potential and maximum score calculations." -- %s, %s, %s = _G.ITEM_MOD_AGILITY_SHORT, _G.ITEM_MOD_INTELLECT_SHORT, _G.ITEM_MOD_STRENGTH_SHORT
	L.Config_Score_RelativeScore = "Show relative values in tooltips instead of absolute values"
	L.Config_Score_RelativeScore_Desc = "Instead of showing absolute values of scales in tooltips, calculate the relative value compared to currently equiped items and show them in percentages."
	L.Config_Score_ShowOnlyUpgrades = "Show tooltips only for upgrades"
	L.Config_Score_ShowOnlyUpgrades_Desc = "Show scales values in tooltips only if it is an upgrade compared to currently equiped item. This works only with relative values enabled."
	L.Config_Score_ShowTooltipLegend = "Show legend in tooltips"
	L.Config_Score_ShowTooltipLegend_Desc = "Show reminder for \"Current score / Current potetial / Maximum score\" in tooltips."

	L.Slash_Command = "/azerite" -- If you need localized slash-command, this doesn't replace the existing /azerite
	L.Slash_RemindConfig = "Check ESC -> Interface -> AddOns -> %s for settings." -- %s = ADDON_NAME
	L.Slash_Error_Unkown = "ERROR: Something went wrong!"
end

if LOCALE == "deDE" then -- Sinusquell (42), Tiggi2702 (6), Vivan (2)
L["Config_Importing_ImportingCanUpdate"] = "Beim Importieren können vorhandene Skalierung aktualisiert werden."
L["Config_Importing_ImportingCanUpdate_Desc"] = "Wenn Sie eine Skalierung mit demselben Namen, derselben Klasse und Spezialisierung wie eine bereits vorhandene Skalierung importieren, wird die vorhandene Skalierung mit den neuen Gewichtungen aktualisiert, anstatt eine neue Skalierung zu erstellen. "
L["Config_Importing_ImportingCanUpdate_Desc_Clarification"] = "Es kann mehrere Skalierungen mit demselben Namen geben, solange sie für verschiedene Spezialisierungen oder Klassen gelten. "
L["Config_Importing_Title"] = "Importieren "
L["Config_Scales_Desc"] = "Die folgenden Einstellungen betreffen nur die Liste der Standardskalierungen. Alle benutzerdefinierten Skalierungen werden immer für jede Klasse aufgelistet. "
L["Config_Scales_OwnClassDefaultsOnly"] = "Zeige nur Standardskalierung für die eigene Klasse. "
L["Config_Scales_OwnClassDefaultsOnly_Desc"] = "Zeige nur Standardskalierung für die eigene Klasse anstelle von allen anderen. "
L["Config_Scales_Title"] = "Skalierungsliste "
--[[Translation missing --]]
--[[ L["Config_Score_AddItemLevelToScore"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_Score_AddItemLevelToScore_Desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_Score_AddPrimaryStatToScore"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_Score_AddPrimaryStatToScore_Desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_Score_RelativeScore"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_Score_RelativeScore_Desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_Score_ScaleByAzeriteEmpowered"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_Score_ScaleByAzeriteEmpowered_Desc"] = ""--]] 
L["Config_Score_ShowOnlyUpgrades"] = "Zeige Tooltip Information nur bei Upgrades an"
--[[Translation missing --]]
--[[ L["Config_Score_ShowOnlyUpgrades_Desc"] = ""--]] 
L["Config_Score_ShowTooltipLegend"] = "Zeige eine Legende in Tooltips an"
--[[Translation missing --]]
--[[ L["Config_Score_ShowTooltipLegend_Desc"] = ""--]] 
L["Config_Score_Title"] = "Punkte"
--[[Translation missing --]]
--[[ L["Config_SettingsAddonExplanation"] = ""--]] 
L["Config_SettingsSavedPerChar"] = [=[Alle Einstellungen sind für den Charakter gespeichert. 
Benutzerdefinierte Einstellungen werden geteilt zwischen allen Charaktern.]=]
--[[Translation missing --]]
--[[ L["Config_SettingsScoreExplanation"] = ""--]] 
L["Config_WeightEditor_Desc"] = "Die folgenden Einstellungen wirken sich nur auf die im Editor angezeigten Fähigkeiten aus. Selbst wenn du sie deaktivierst, werden alle Azeritermächtigungen immer noch gewertet, wenn sie auf der aktiven Skala Werte haben."
L["Config_WeightEditor_ShowDefensive"] = "Zeige defensive Fähigkeiten"
L["Config_WeightEditor_ShowDefensive_Desc"] = "Zeige gemeinsame und klassenspezifische Defensivfähigkeiten im Editor."
L["Config_WeightEditor_ShowProfession"] = "Zeige berufsspezifische Fähigkeiten "
--[[Translation missing --]]
--[[ L["Config_WeightEditor_ShowProfession_Desc"] = ""--]] 
L["Config_WeightEditor_ShowPvP"] = "Zeige PVP spezifische Fähigkeiten "
--[[Translation missing --]]
--[[ L["Config_WeightEditor_ShowPvP_Desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_WeightEditor_ShowPvP_Desc_Import"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_WeightEditor_ShowRole"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_WeightEditor_ShowRole_Desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_WeightEditor_ShowRolesOnlyForOwnSpec"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_WeightEditor_ShowRolesOnlyForOwnSpec_Desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_WeightEditor_ShowZone"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_WeightEditor_ShowZone_Desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_WeightEditor_ShowZone_Desc_Proc"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_WeightEditor_Title"] = ""--]] 
--[[Translation missing --]]
--[[ L["CreatePopup_Desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["CreatePopup_Error_CreatedNewScale"] = ""--]] 
--[[Translation missing --]]
--[[ L["CreatePopup_Error_UnknownError"] = ""--]] 
--[[Translation missing --]]
--[[ L["CreatePopup_Title"] = ""--]] 
--[[Translation missing --]]
--[[ L["DefaultScaleName_Default"] = ""--]] 
--[[Translation missing --]]
--[[ L["DefaultScaleName_Defensive"] = ""--]] 
--[[Translation missing --]]
--[[ L["DefaultScaleName_Offensive"] = ""--]] 
--[[Translation missing --]]
--[[ L["DeletePopup_DeletedDefaultScale"] = ""--]] 
--[[Translation missing --]]
--[[ L["DeletePopup_DeletedScale"] = ""--]] 
--[[Translation missing --]]
--[[ L["DeletePopup_Desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["DeletePopup_Title"] = ""--]] 
--[[Translation missing --]]
--[[ L["DeletePopup_Warning"] = ""--]] 
--[[Translation missing --]]
--[[ L["ExportPopup_Desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["ExportPopup_Title"] = ""--]] 
--[[Translation missing --]]
--[[ L["ImportPopup_CreatedNewScale"] = ""--]] 
--[[Translation missing --]]
--[[ L["ImportPopup_Desc"] = ""--]] 
L["ImportPopup_Error_MalformedString"] = "ERROR: Fehlerhafter Import-String!"
L["ImportPopup_Error_OldStringVersion"] = "ERROR: \"Import-String\" -Version ist zu alt oder fehlerhafter Import-String!"
L["ImportPopup_Title"] = "Importiere Skalierung"
L["ImportPopup_UpdatedScale"] = "Skalierung \"%s\" wurde aktualisiert"
L["ItemToolTip_AzeriteLevel"] = "Azeritlevel: %1$d / %2$d"
--[[Translation missing --]]
--[[ L["ItemToolTip_Legend"] = ""--]] 
L["PowersScoreString"] = [=[Aktuelle Punkte: %1$d/%2$d
Maximale Punkte: %3$d
Azeritlevel: %4$d/%5$d]=]
L["PowersTitles_Class"] = "Klassentalente"
L["PowersTitles_Defensive"] = "Defensivtalente"
L["PowersTitles_Profession"] = "Berufstalente"
L["PowersTitles_PvP"] = "PVPtalente"
L["PowersTitles_Role"] = "Spezialisierungstalente"
L["PowersTitles_Zone"] = "Schlatzugs und Zonen Fähigkeiten"
L["RenamePopup_Desc"] = [=[Benenne Skalierung %1$s um
Trage neuen Namen in das Editierfeld ein und drücke %2$s]=]
L["RenamePopup_RenamedScale"] = "Skalierung umbenennen von \"%1$s\" zu  \"%2$s\" "
L["RenamePopup_Title"] = "Skalierung umbenennen"
L["ScaleName_Unknown"] = "Unbekannt"
L["ScaleName_Unnamed"] = "Unbenannt"
L["ScalesList_CreateImportText"] = "Erstelle Neu / Importieren"
L["ScalesList_CustomGroupName"] = "Benutzerdefinierte Skalierung"
L["ScalesList_DefaultGroupName"] = "Standardskalierungen"
L["ScaleWeightEditor_Title"] = "%s Editor"
L["Slash_Command"] = "/azerite"
L["Slash_Error_Unkown"] = "ERROR: Irgendwas war fehlerhaft! "
L["Slash_RemindConfig"] = "Prüfe ESC -> Interface -> Addons -> %s für weiter Einstellungen."
L["WeightEditor_CreateNewText"] = "Neu erstellen"
L["WeightEditor_CurrentScale"] = "Aktuelle Skalierung: %s"
L["WeightEditor_DeleteText"] = "Löschen"
L["WeightEditor_EnableScaleText"] = "Benutze diese Skalierung"
L["WeightEditor_ExportText"] = "Exportieren"
L["WeightEditor_ImportText"] = "Importieren"
L["WeightEditor_RenameText"] = "Umbenennen"
L["WeightEditor_TooltipText"] = "Angezeigt im Tooltip"
L["WeightEditor_VersionText"] = "Version %s"


elseif LOCALE == "esES" then -- isaracho (4)
L["Config_Importing_ImportingCanUpdate"] = "Importar puede causar que cambien las escalas actuales"
L["Config_Importing_ImportingCanUpdate_Desc"] = "Cunado importes una escala con el mismo nombre, clase y especialización que una existente, la escala existente será actualizada con los nuevos valores en lugar de crear una nueva escala."
L["Config_Importing_ImportingCanUpdate_Desc_Clarification"] = "Puede haber múltiples escalas con el mismo nombre mientras sean para diferentes especializaciones o clases."
L["Config_Importing_Title"] = "Importando"
--[[Translation missing --]]
--[[ L["Config_Scales_Desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_Scales_OwnClassDefaultsOnly"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_Scales_OwnClassDefaultsOnly_Desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_Scales_Title"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_Score_AddItemLevelToScore"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_Score_AddItemLevelToScore_Desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_Score_AddPrimaryStatToScore"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_Score_AddPrimaryStatToScore_Desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_Score_RelativeScore"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_Score_RelativeScore_Desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_Score_ScaleByAzeriteEmpowered"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_Score_ScaleByAzeriteEmpowered_Desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_Score_ShowOnlyUpgrades"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_Score_ShowOnlyUpgrades_Desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_Score_ShowTooltipLegend"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_Score_ShowTooltipLegend_Desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_Score_Title"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_SettingsAddonExplanation"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_SettingsSavedPerChar"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_SettingsScoreExplanation"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_WeightEditor_Desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_WeightEditor_ShowDefensive"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_WeightEditor_ShowDefensive_Desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_WeightEditor_ShowProfession"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_WeightEditor_ShowProfession_Desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_WeightEditor_ShowPvP"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_WeightEditor_ShowPvP_Desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_WeightEditor_ShowPvP_Desc_Import"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_WeightEditor_ShowRole"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_WeightEditor_ShowRole_Desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_WeightEditor_ShowRolesOnlyForOwnSpec"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_WeightEditor_ShowRolesOnlyForOwnSpec_Desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_WeightEditor_ShowZone"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_WeightEditor_ShowZone_Desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_WeightEditor_ShowZone_Desc_Proc"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_WeightEditor_Title"] = ""--]] 
--[[Translation missing --]]
--[[ L["CreatePopup_Desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["CreatePopup_Error_CreatedNewScale"] = ""--]] 
--[[Translation missing --]]
--[[ L["CreatePopup_Error_UnknownError"] = ""--]] 
--[[Translation missing --]]
--[[ L["CreatePopup_Title"] = ""--]] 
--[[Translation missing --]]
--[[ L["DefaultScaleName_Default"] = ""--]] 
--[[Translation missing --]]
--[[ L["DefaultScaleName_Defensive"] = ""--]] 
--[[Translation missing --]]
--[[ L["DefaultScaleName_Offensive"] = ""--]] 
--[[Translation missing --]]
--[[ L["DeletePopup_DeletedDefaultScale"] = ""--]] 
--[[Translation missing --]]
--[[ L["DeletePopup_DeletedScale"] = ""--]] 
--[[Translation missing --]]
--[[ L["DeletePopup_Desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["DeletePopup_Title"] = ""--]] 
--[[Translation missing --]]
--[[ L["DeletePopup_Warning"] = ""--]] 
--[[Translation missing --]]
--[[ L["ExportPopup_Desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["ExportPopup_Title"] = ""--]] 
--[[Translation missing --]]
--[[ L["ImportPopup_CreatedNewScale"] = ""--]] 
--[[Translation missing --]]
--[[ L["ImportPopup_Desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["ImportPopup_Error_MalformedString"] = ""--]] 
--[[Translation missing --]]
--[[ L["ImportPopup_Error_OldStringVersion"] = ""--]] 
--[[Translation missing --]]
--[[ L["ImportPopup_Title"] = ""--]] 
--[[Translation missing --]]
--[[ L["ImportPopup_UpdatedScale"] = ""--]] 
--[[Translation missing --]]
--[[ L["ItemToolTip_AzeriteLevel"] = ""--]] 
--[[Translation missing --]]
--[[ L["ItemToolTip_Legend"] = ""--]] 
--[[Translation missing --]]
--[[ L["PowersScoreString"] = ""--]] 
--[[Translation missing --]]
--[[ L["PowersTitles_Class"] = ""--]] 
--[[Translation missing --]]
--[[ L["PowersTitles_Defensive"] = ""--]] 
--[[Translation missing --]]
--[[ L["PowersTitles_Profession"] = ""--]] 
--[[Translation missing --]]
--[[ L["PowersTitles_PvP"] = ""--]] 
--[[Translation missing --]]
--[[ L["PowersTitles_Role"] = ""--]] 
--[[Translation missing --]]
--[[ L["PowersTitles_Zone"] = ""--]] 
--[[Translation missing --]]
--[[ L["RenamePopup_Desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["RenamePopup_RenamedScale"] = ""--]] 
--[[Translation missing --]]
--[[ L["RenamePopup_Title"] = ""--]] 
--[[Translation missing --]]
--[[ L["ScaleName_Unknown"] = ""--]] 
--[[Translation missing --]]
--[[ L["ScaleName_Unnamed"] = ""--]] 
--[[Translation missing --]]
--[[ L["ScalesList_CreateImportText"] = ""--]] 
--[[Translation missing --]]
--[[ L["ScalesList_CustomGroupName"] = ""--]] 
--[[Translation missing --]]
--[[ L["ScalesList_DefaultGroupName"] = ""--]] 
--[[Translation missing --]]
--[[ L["ScaleWeightEditor_Title"] = ""--]] 
--[[Translation missing --]]
--[[ L["Slash_Command"] = ""--]] 
--[[Translation missing --]]
--[[ L["Slash_Error_Unkown"] = ""--]] 
--[[Translation missing --]]
--[[ L["Slash_RemindConfig"] = ""--]] 
--[[Translation missing --]]
--[[ L["WeightEditor_CreateNewText"] = ""--]] 
--[[Translation missing --]]
--[[ L["WeightEditor_CurrentScale"] = ""--]] 
--[[Translation missing --]]
--[[ L["WeightEditor_DeleteText"] = ""--]] 
--[[Translation missing --]]
--[[ L["WeightEditor_EnableScaleText"] = ""--]] 
--[[Translation missing --]]
--[[ L["WeightEditor_ExportText"] = ""--]] 
--[[Translation missing --]]
--[[ L["WeightEditor_ImportText"] = ""--]] 
--[[Translation missing --]]
--[[ L["WeightEditor_RenameText"] = ""--]] 
--[[Translation missing --]]
--[[ L["WeightEditor_TooltipText"] = ""--]] 
--[[Translation missing --]]
--[[ L["WeightEditor_VersionText"] = ""--]] 


elseif LOCALE == "esMX" then
--[[Translation missing --]]
--[[ L["Config_Importing_ImportingCanUpdate"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_Importing_ImportingCanUpdate_Desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_Importing_ImportingCanUpdate_Desc_Clarification"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_Importing_Title"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_Scales_Desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_Scales_OwnClassDefaultsOnly"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_Scales_OwnClassDefaultsOnly_Desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_Scales_Title"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_Score_AddItemLevelToScore"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_Score_AddItemLevelToScore_Desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_Score_AddPrimaryStatToScore"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_Score_AddPrimaryStatToScore_Desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_Score_RelativeScore"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_Score_RelativeScore_Desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_Score_ScaleByAzeriteEmpowered"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_Score_ScaleByAzeriteEmpowered_Desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_Score_ShowOnlyUpgrades"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_Score_ShowOnlyUpgrades_Desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_Score_ShowTooltipLegend"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_Score_ShowTooltipLegend_Desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_Score_Title"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_SettingsAddonExplanation"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_SettingsSavedPerChar"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_SettingsScoreExplanation"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_WeightEditor_Desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_WeightEditor_ShowDefensive"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_WeightEditor_ShowDefensive_Desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_WeightEditor_ShowProfession"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_WeightEditor_ShowProfession_Desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_WeightEditor_ShowPvP"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_WeightEditor_ShowPvP_Desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_WeightEditor_ShowPvP_Desc_Import"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_WeightEditor_ShowRole"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_WeightEditor_ShowRole_Desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_WeightEditor_ShowRolesOnlyForOwnSpec"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_WeightEditor_ShowRolesOnlyForOwnSpec_Desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_WeightEditor_ShowZone"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_WeightEditor_ShowZone_Desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_WeightEditor_ShowZone_Desc_Proc"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_WeightEditor_Title"] = ""--]] 
--[[Translation missing --]]
--[[ L["CreatePopup_Desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["CreatePopup_Error_CreatedNewScale"] = ""--]] 
--[[Translation missing --]]
--[[ L["CreatePopup_Error_UnknownError"] = ""--]] 
--[[Translation missing --]]
--[[ L["CreatePopup_Title"] = ""--]] 
--[[Translation missing --]]
--[[ L["DefaultScaleName_Default"] = ""--]] 
--[[Translation missing --]]
--[[ L["DefaultScaleName_Defensive"] = ""--]] 
--[[Translation missing --]]
--[[ L["DefaultScaleName_Offensive"] = ""--]] 
--[[Translation missing --]]
--[[ L["DeletePopup_DeletedDefaultScale"] = ""--]] 
--[[Translation missing --]]
--[[ L["DeletePopup_DeletedScale"] = ""--]] 
--[[Translation missing --]]
--[[ L["DeletePopup_Desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["DeletePopup_Title"] = ""--]] 
--[[Translation missing --]]
--[[ L["DeletePopup_Warning"] = ""--]] 
--[[Translation missing --]]
--[[ L["ExportPopup_Desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["ExportPopup_Title"] = ""--]] 
--[[Translation missing --]]
--[[ L["ImportPopup_CreatedNewScale"] = ""--]] 
--[[Translation missing --]]
--[[ L["ImportPopup_Desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["ImportPopup_Error_MalformedString"] = ""--]] 
--[[Translation missing --]]
--[[ L["ImportPopup_Error_OldStringVersion"] = ""--]] 
--[[Translation missing --]]
--[[ L["ImportPopup_Title"] = ""--]] 
--[[Translation missing --]]
--[[ L["ImportPopup_UpdatedScale"] = ""--]] 
--[[Translation missing --]]
--[[ L["ItemToolTip_AzeriteLevel"] = ""--]] 
--[[Translation missing --]]
--[[ L["ItemToolTip_Legend"] = ""--]] 
--[[Translation missing --]]
--[[ L["PowersScoreString"] = ""--]] 
--[[Translation missing --]]
--[[ L["PowersTitles_Class"] = ""--]] 
--[[Translation missing --]]
--[[ L["PowersTitles_Defensive"] = ""--]] 
--[[Translation missing --]]
--[[ L["PowersTitles_Profession"] = ""--]] 
--[[Translation missing --]]
--[[ L["PowersTitles_PvP"] = ""--]] 
--[[Translation missing --]]
--[[ L["PowersTitles_Role"] = ""--]] 
--[[Translation missing --]]
--[[ L["PowersTitles_Zone"] = ""--]] 
--[[Translation missing --]]
--[[ L["RenamePopup_Desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["RenamePopup_RenamedScale"] = ""--]] 
--[[Translation missing --]]
--[[ L["RenamePopup_Title"] = ""--]] 
--[[Translation missing --]]
--[[ L["ScaleName_Unknown"] = ""--]] 
--[[Translation missing --]]
--[[ L["ScaleName_Unnamed"] = ""--]] 
--[[Translation missing --]]
--[[ L["ScalesList_CreateImportText"] = ""--]] 
--[[Translation missing --]]
--[[ L["ScalesList_CustomGroupName"] = ""--]] 
--[[Translation missing --]]
--[[ L["ScalesList_DefaultGroupName"] = ""--]] 
--[[Translation missing --]]
--[[ L["ScaleWeightEditor_Title"] = ""--]] 
--[[Translation missing --]]
--[[ L["Slash_Command"] = ""--]] 
--[[Translation missing --]]
--[[ L["Slash_Error_Unkown"] = ""--]] 
--[[Translation missing --]]
--[[ L["Slash_RemindConfig"] = ""--]] 
--[[Translation missing --]]
--[[ L["WeightEditor_CreateNewText"] = ""--]] 
--[[Translation missing --]]
--[[ L["WeightEditor_CurrentScale"] = ""--]] 
--[[Translation missing --]]
--[[ L["WeightEditor_DeleteText"] = ""--]] 
--[[Translation missing --]]
--[[ L["WeightEditor_EnableScaleText"] = ""--]] 
--[[Translation missing --]]
--[[ L["WeightEditor_ExportText"] = ""--]] 
--[[Translation missing --]]
--[[ L["WeightEditor_ImportText"] = ""--]] 
--[[Translation missing --]]
--[[ L["WeightEditor_RenameText"] = ""--]] 
--[[Translation missing --]]
--[[ L["WeightEditor_TooltipText"] = ""--]] 
--[[Translation missing --]]
--[[ L["WeightEditor_VersionText"] = ""--]] 


elseif LOCALE == "frFR" then -- tthegarde (20), Marechoux (9)
L["Config_Importing_ImportingCanUpdate"] = "Importer peut modifier les échelles existantes."
L["Config_Importing_ImportingCanUpdate_Desc"] = "Quand vous importez une échelle avec les mêmes nom, classe et spécialisation qu'une échelle pré-définie, l'échelle pré-définie sera mise à jour avec les nouveaux poids au lieu qu'une nouvelle échelle soit créée."
L["Config_Importing_ImportingCanUpdate_Desc_Clarification"] = "Il peut y avoir plusieurs échelles avec le même nom tant qu'elles sont pour des classes ou spécialisations différentes."
L["Config_Importing_Title"] = "Import"
L["Config_Scales_Desc"] = "Les réglages suivants n'affectent que la liste des échelles par défaut. Toutes les échelles personnalisées seront toujours listées pour toutes les classes."
L["Config_Scales_OwnClassDefaultsOnly"] = "N'afficher que les échelles par défaut de votre classe"
L["Config_Scales_OwnClassDefaultsOnly_Desc"] = "Cache les échelles par défaut qui ne correspondent pas à votre classe au lieu de toutes les afficher."
L["Config_Scales_Title"] = "Liste des échelles"
L["Config_Score_AddItemLevelToScore"] = "Ajouter le niveau d'objet à tous les scores"
L["Config_Score_AddItemLevelToScore_Desc"] = "Ajouter le niveau d'objet des objets azéritiques au calcul des scores actuels, potentiels et maximaux."
L["Config_Score_AddPrimaryStatToScore"] = "Ajouter la stat principale à tous les scores"
--[[Translation missing --]]
--[[ L["Config_Score_AddPrimaryStatToScore_Desc"] = ""--]] 
L["Config_Score_RelativeScore"] = "Afficher des valeurs relatives dans les infobulles à la place des valeurs absolues"
L["Config_Score_RelativeScore_Desc"] = "À la place de montrer la valeur absolue des échelles dans les infobulles, calculer la valeur relative comparée aux objets actuellement équipés et les montrer en pourcentage."
--[[Translation missing --]]
--[[ L["Config_Score_ScaleByAzeriteEmpowered"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_Score_ScaleByAzeriteEmpowered_Desc"] = ""--]] 
L["Config_Score_ShowOnlyUpgrades"] = "N'afficher les infobulles que pour les améliorations"
--[[Translation missing --]]
--[[ L["Config_Score_ShowOnlyUpgrades_Desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_Score_ShowTooltipLegend"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_Score_ShowTooltipLegend_Desc"] = ""--]] 
L["Config_Score_Title"] = "Score"
--[[Translation missing --]]
--[[ L["Config_SettingsAddonExplanation"] = ""--]] 
L["Config_SettingsSavedPerChar"] = [=[Tous ces réglages sont sauvegardés par personnage.
Les échelles personnalisées sont partagées entre tous vos personnages.]=]
--[[Translation missing --]]
--[[ L["Config_SettingsScoreExplanation"] = ""--]] 
L["Config_WeightEditor_Desc"] = "Les réglages suivants ne concernent que les traits affichés dans l'éditeur d'échelle. Même si vous les désactivez, chaque trait d'Azérite sera quand même évalué si il a une valeur associée dans l'échelle active."
L["Config_WeightEditor_ShowDefensive"] = "Afficher les traits Défensifs"
L["Config_WeightEditor_ShowDefensive_Desc"] = "Affiche les traits Défensifs communs et spécifiques à une classe dans l'éditeur d'échelle."
L["Config_WeightEditor_ShowProfession"] = "Afficher les traits de Profession"
L["Config_WeightEditor_ShowProfession_Desc"] = "Affiche les traits de Profession dans l'éditeur d'échelle. Ces traits n'apparaissent que sur les objets produits par des professions. A l'heure actuelle, ils n'apparaissent que sur les casques d’ingénierie."
L["Config_WeightEditor_ShowPvP"] = "Afficher les traits JcJ"
L["Config_WeightEditor_ShowPvP_Desc"] = "Affiche les traits JcJ dans l'éditeur d'échelle. Vous ne verrez que les traits concernant votre propre faction, mais les changements de valeurs affecteront les traits des deux factions."
L["Config_WeightEditor_ShowPvP_Desc_Import"] = [=[Lors d'un Export, la chaîne de texte n’inclura que les traits de votre propre faction, mais ils sont interchangeables avec les traits JcJ de la faction opposée.
Lors d'un Import, la valeur des traits JcJ sera appliquée aux deux factions.]=]
L["Config_WeightEditor_ShowRole"] = "Afficher les traits de Rôle"
L["Config_WeightEditor_ShowRole_Desc"] = "Affiche les traits de Rôle dans l'éditeur d'échelle."
L["Config_WeightEditor_ShowRolesOnlyForOwnSpec"] = "Affiche les traits de Rôle uniquement pour votre spécialisation"
--[[Translation missing --]]
--[[ L["Config_WeightEditor_ShowRolesOnlyForOwnSpec_Desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_WeightEditor_ShowZone"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_WeightEditor_ShowZone_Desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_WeightEditor_ShowZone_Desc_Proc"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_WeightEditor_Title"] = ""--]] 
--[[Translation missing --]]
--[[ L["CreatePopup_Desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["CreatePopup_Error_CreatedNewScale"] = ""--]] 
--[[Translation missing --]]
--[[ L["CreatePopup_Error_UnknownError"] = ""--]] 
--[[Translation missing --]]
--[[ L["CreatePopup_Title"] = ""--]] 
--[[Translation missing --]]
--[[ L["DefaultScaleName_Default"] = ""--]] 
--[[Translation missing --]]
--[[ L["DefaultScaleName_Defensive"] = ""--]] 
--[[Translation missing --]]
--[[ L["DefaultScaleName_Offensive"] = ""--]] 
--[[Translation missing --]]
--[[ L["DeletePopup_DeletedDefaultScale"] = ""--]] 
--[[Translation missing --]]
--[[ L["DeletePopup_DeletedScale"] = ""--]] 
--[[Translation missing --]]
--[[ L["DeletePopup_Desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["DeletePopup_Title"] = ""--]] 
--[[Translation missing --]]
--[[ L["DeletePopup_Warning"] = ""--]] 
--[[Translation missing --]]
--[[ L["ExportPopup_Desc"] = ""--]] 
L["ExportPopup_Title"] = "Exporter l'échelle"
--[[Translation missing --]]
--[[ L["ImportPopup_CreatedNewScale"] = ""--]] 
--[[Translation missing --]]
--[[ L["ImportPopup_Desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["ImportPopup_Error_MalformedString"] = ""--]] 
--[[Translation missing --]]
--[[ L["ImportPopup_Error_OldStringVersion"] = ""--]] 
L["ImportPopup_Title"] = "Importer l'échelle"
--[[Translation missing --]]
--[[ L["ImportPopup_UpdatedScale"] = ""--]] 
--[[Translation missing --]]
--[[ L["ItemToolTip_AzeriteLevel"] = ""--]] 
--[[Translation missing --]]
--[[ L["ItemToolTip_Legend"] = ""--]] 
--[[Translation missing --]]
--[[ L["PowersScoreString"] = ""--]] 
--[[Translation missing --]]
--[[ L["PowersTitles_Class"] = ""--]] 
--[[Translation missing --]]
--[[ L["PowersTitles_Defensive"] = ""--]] 
--[[Translation missing --]]
--[[ L["PowersTitles_Profession"] = ""--]] 
--[[Translation missing --]]
--[[ L["PowersTitles_PvP"] = ""--]] 
--[[Translation missing --]]
--[[ L["PowersTitles_Role"] = ""--]] 
--[[Translation missing --]]
--[[ L["PowersTitles_Zone"] = ""--]] 
--[[Translation missing --]]
--[[ L["RenamePopup_Desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["RenamePopup_RenamedScale"] = ""--]] 
--[[Translation missing --]]
--[[ L["RenamePopup_Title"] = ""--]] 
--[[Translation missing --]]
--[[ L["ScaleName_Unknown"] = ""--]] 
--[[Translation missing --]]
--[[ L["ScaleName_Unnamed"] = ""--]] 
--[[Translation missing --]]
--[[ L["ScalesList_CreateImportText"] = ""--]] 
--[[Translation missing --]]
--[[ L["ScalesList_CustomGroupName"] = ""--]] 
--[[Translation missing --]]
--[[ L["ScalesList_DefaultGroupName"] = ""--]] 
--[[Translation missing --]]
--[[ L["ScaleWeightEditor_Title"] = ""--]] 
--[[Translation missing --]]
--[[ L["Slash_Command"] = ""--]] 
--[[Translation missing --]]
--[[ L["Slash_Error_Unkown"] = ""--]] 
--[[Translation missing --]]
--[[ L["Slash_RemindConfig"] = ""--]] 
--[[Translation missing --]]
--[[ L["WeightEditor_CreateNewText"] = ""--]] 
--[[Translation missing --]]
--[[ L["WeightEditor_CurrentScale"] = ""--]] 
--[[Translation missing --]]
--[[ L["WeightEditor_DeleteText"] = ""--]] 
--[[Translation missing --]]
--[[ L["WeightEditor_EnableScaleText"] = ""--]] 
--[[Translation missing --]]
--[[ L["WeightEditor_ExportText"] = ""--]] 
--[[Translation missing --]]
--[[ L["WeightEditor_ImportText"] = ""--]] 
--[[Translation missing --]]
--[[ L["WeightEditor_RenameText"] = ""--]] 
--[[Translation missing --]]
--[[ L["WeightEditor_TooltipText"] = ""--]] 
--[[Translation missing --]]
--[[ L["WeightEditor_VersionText"] = ""--]] 


elseif LOCALE == "itIT" then
--[[Translation missing --]]
--[[ L["Config_Importing_ImportingCanUpdate"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_Importing_ImportingCanUpdate_Desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_Importing_ImportingCanUpdate_Desc_Clarification"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_Importing_Title"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_Scales_Desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_Scales_OwnClassDefaultsOnly"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_Scales_OwnClassDefaultsOnly_Desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_Scales_Title"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_Score_AddItemLevelToScore"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_Score_AddItemLevelToScore_Desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_Score_AddPrimaryStatToScore"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_Score_AddPrimaryStatToScore_Desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_Score_RelativeScore"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_Score_RelativeScore_Desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_Score_ScaleByAzeriteEmpowered"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_Score_ScaleByAzeriteEmpowered_Desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_Score_ShowOnlyUpgrades"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_Score_ShowOnlyUpgrades_Desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_Score_ShowTooltipLegend"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_Score_ShowTooltipLegend_Desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_Score_Title"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_SettingsAddonExplanation"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_SettingsSavedPerChar"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_SettingsScoreExplanation"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_WeightEditor_Desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_WeightEditor_ShowDefensive"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_WeightEditor_ShowDefensive_Desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_WeightEditor_ShowProfession"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_WeightEditor_ShowProfession_Desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_WeightEditor_ShowPvP"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_WeightEditor_ShowPvP_Desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_WeightEditor_ShowPvP_Desc_Import"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_WeightEditor_ShowRole"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_WeightEditor_ShowRole_Desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_WeightEditor_ShowRolesOnlyForOwnSpec"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_WeightEditor_ShowRolesOnlyForOwnSpec_Desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_WeightEditor_ShowZone"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_WeightEditor_ShowZone_Desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_WeightEditor_ShowZone_Desc_Proc"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_WeightEditor_Title"] = ""--]] 
--[[Translation missing --]]
--[[ L["CreatePopup_Desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["CreatePopup_Error_CreatedNewScale"] = ""--]] 
--[[Translation missing --]]
--[[ L["CreatePopup_Error_UnknownError"] = ""--]] 
--[[Translation missing --]]
--[[ L["CreatePopup_Title"] = ""--]] 
--[[Translation missing --]]
--[[ L["DefaultScaleName_Default"] = ""--]] 
--[[Translation missing --]]
--[[ L["DefaultScaleName_Defensive"] = ""--]] 
--[[Translation missing --]]
--[[ L["DefaultScaleName_Offensive"] = ""--]] 
--[[Translation missing --]]
--[[ L["DeletePopup_DeletedDefaultScale"] = ""--]] 
--[[Translation missing --]]
--[[ L["DeletePopup_DeletedScale"] = ""--]] 
--[[Translation missing --]]
--[[ L["DeletePopup_Desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["DeletePopup_Title"] = ""--]] 
--[[Translation missing --]]
--[[ L["DeletePopup_Warning"] = ""--]] 
--[[Translation missing --]]
--[[ L["ExportPopup_Desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["ExportPopup_Title"] = ""--]] 
--[[Translation missing --]]
--[[ L["ImportPopup_CreatedNewScale"] = ""--]] 
--[[Translation missing --]]
--[[ L["ImportPopup_Desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["ImportPopup_Error_MalformedString"] = ""--]] 
--[[Translation missing --]]
--[[ L["ImportPopup_Error_OldStringVersion"] = ""--]] 
--[[Translation missing --]]
--[[ L["ImportPopup_Title"] = ""--]] 
--[[Translation missing --]]
--[[ L["ImportPopup_UpdatedScale"] = ""--]] 
--[[Translation missing --]]
--[[ L["ItemToolTip_AzeriteLevel"] = ""--]] 
--[[Translation missing --]]
--[[ L["ItemToolTip_Legend"] = ""--]] 
--[[Translation missing --]]
--[[ L["PowersScoreString"] = ""--]] 
--[[Translation missing --]]
--[[ L["PowersTitles_Class"] = ""--]] 
--[[Translation missing --]]
--[[ L["PowersTitles_Defensive"] = ""--]] 
--[[Translation missing --]]
--[[ L["PowersTitles_Profession"] = ""--]] 
--[[Translation missing --]]
--[[ L["PowersTitles_PvP"] = ""--]] 
--[[Translation missing --]]
--[[ L["PowersTitles_Role"] = ""--]] 
--[[Translation missing --]]
--[[ L["PowersTitles_Zone"] = ""--]] 
--[[Translation missing --]]
--[[ L["RenamePopup_Desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["RenamePopup_RenamedScale"] = ""--]] 
--[[Translation missing --]]
--[[ L["RenamePopup_Title"] = ""--]] 
--[[Translation missing --]]
--[[ L["ScaleName_Unknown"] = ""--]] 
--[[Translation missing --]]
--[[ L["ScaleName_Unnamed"] = ""--]] 
--[[Translation missing --]]
--[[ L["ScalesList_CreateImportText"] = ""--]] 
--[[Translation missing --]]
--[[ L["ScalesList_CustomGroupName"] = ""--]] 
--[[Translation missing --]]
--[[ L["ScalesList_DefaultGroupName"] = ""--]] 
--[[Translation missing --]]
--[[ L["ScaleWeightEditor_Title"] = ""--]] 
--[[Translation missing --]]
--[[ L["Slash_Command"] = ""--]] 
--[[Translation missing --]]
--[[ L["Slash_Error_Unkown"] = ""--]] 
--[[Translation missing --]]
--[[ L["Slash_RemindConfig"] = ""--]] 
--[[Translation missing --]]
--[[ L["WeightEditor_CreateNewText"] = ""--]] 
--[[Translation missing --]]
--[[ L["WeightEditor_CurrentScale"] = ""--]] 
--[[Translation missing --]]
--[[ L["WeightEditor_DeleteText"] = ""--]] 
--[[Translation missing --]]
--[[ L["WeightEditor_EnableScaleText"] = ""--]] 
--[[Translation missing --]]
--[[ L["WeightEditor_ExportText"] = ""--]] 
--[[Translation missing --]]
--[[ L["WeightEditor_ImportText"] = ""--]] 
--[[Translation missing --]]
--[[ L["WeightEditor_RenameText"] = ""--]] 
--[[Translation missing --]]
--[[ L["WeightEditor_TooltipText"] = ""--]] 
--[[Translation missing --]]
--[[ L["WeightEditor_VersionText"] = ""--]] 


elseif LOCALE == "koKR" then -- Killberos (53)
L["Config_Importing_ImportingCanUpdate"] = "불러오기로 현재 값을 갱신합니다"
L["Config_Importing_ImportingCanUpdate_Desc"] = "같은 이름으로 값을 불러올경우, 이미 존재하는 직업과 전문화 값들은 새로운 값으로 만들어 지는 대신에, 갱신 될것 입니다."
--[[Translation missing --]]
--[[ L["Config_Importing_ImportingCanUpdate_Desc_Clarification"] = ""--]] 
L["Config_Importing_Title"] = "불러오기"
--[[Translation missing --]]
--[[ L["Config_Scales_Desc"] = ""--]] 
L["Config_Scales_OwnClassDefaultsOnly"] = "자신 직업의 기본값만 표시"
L["Config_Scales_OwnClassDefaultsOnly_Desc"] = "모든 직업들의 기본값을 표시하는 대신에, 자신 직업에만 해당되는 기본값을 표시합니다."
L["Config_Scales_Title"] = "값 목록"
--[[Translation missing --]]
--[[ L["Config_Score_AddItemLevelToScore"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_Score_AddItemLevelToScore_Desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_Score_AddPrimaryStatToScore"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_Score_AddPrimaryStatToScore_Desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_Score_RelativeScore"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_Score_RelativeScore_Desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_Score_ScaleByAzeriteEmpowered"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_Score_ScaleByAzeriteEmpowered_Desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_Score_ShowOnlyUpgrades"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_Score_ShowOnlyUpgrades_Desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_Score_ShowTooltipLegend"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_Score_ShowTooltipLegend_Desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_Score_Title"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_SettingsAddonExplanation"] = ""--]] 
L["Config_SettingsSavedPerChar"] = [=[이 곳에 모든 설정은 캐릭터별로 저장됩니다.
사용자 값은 모든 캐릭터에게 공유됩니다.]=]
--[[Translation missing --]]
--[[ L["Config_SettingsScoreExplanation"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_WeightEditor_Desc"] = ""--]] 
L["Config_WeightEditor_ShowDefensive"] = "방어적 능력들 표시 "
--[[Translation missing --]]
--[[ L["Config_WeightEditor_ShowDefensive_Desc"] = ""--]] 
L["Config_WeightEditor_ShowProfession"] = "특정 전문 능력들 표시"
L["Config_WeightEditor_ShowProfession_Desc"] = [=[가중치 편집기 안에 있는 특정 전문 능력들을 표시합니다. 
이 능력들은 전문기술로 만들어진 아이템에서만 나타납니다. 현재 기계공학 머리부위에서만
나타납니다.]=]
L["Config_WeightEditor_ShowPvP"] = "PvP 전용 능력 보기"
--[[Translation missing --]]
--[[ L["Config_WeightEditor_ShowPvP_Desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_WeightEditor_ShowPvP_Desc_Import"] = ""--]] 
L["Config_WeightEditor_ShowRole"] = "직업별 능력들 표시"
L["Config_WeightEditor_ShowRole_Desc"] = "가중치 편집기 안에 있는 직업별 능력들을 표시합니다."
--[[Translation missing --]]
--[[ L["Config_WeightEditor_ShowRolesOnlyForOwnSpec"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_WeightEditor_ShowRolesOnlyForOwnSpec_Desc"] = ""--]] 
L["Config_WeightEditor_ShowZone"] = "특정 지역 능력"
--[[Translation missing --]]
--[[ L["Config_WeightEditor_ShowZone_Desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_WeightEditor_ShowZone_Desc_Proc"] = ""--]] 
L["Config_WeightEditor_Title"] = "가중치 편집기"
--[[Translation missing --]]
--[[ L["CreatePopup_Desc"] = ""--]] 
L["CreatePopup_Error_CreatedNewScale"] = "만들어진 새로운 값 \"%s\""
--[[Translation missing --]]
--[[ L["CreatePopup_Error_UnknownError"] = ""--]] 
L["CreatePopup_Title"] = "값 만들기"
L["DefaultScaleName_Default"] = "기본적"
L["DefaultScaleName_Defensive"] = "방어적"
L["DefaultScaleName_Offensive"] = "공격적"
--[[Translation missing --]]
--[[ L["DeletePopup_DeletedDefaultScale"] = ""--]] 
L["DeletePopup_DeletedScale"] = "\"%s\"  값이 삭제 되었습니다."
--[[Translation missing --]]
--[[ L["DeletePopup_Desc"] = ""--]] 
L["DeletePopup_Title"] = "값 삭제하기 "
--[[Translation missing --]]
--[[ L["DeletePopup_Warning"] = ""--]] 
--[[Translation missing --]]
--[[ L["ExportPopup_Desc"] = ""--]] 
L["ExportPopup_Title"] = "값 내보내기"
L["ImportPopup_CreatedNewScale"] = "\"%s\" 새로운 값이 입력되었습니다. "
--[[Translation missing --]]
--[[ L["ImportPopup_Desc"] = ""--]] 
L["ImportPopup_Error_MalformedString"] = "에러: 형식에 맞지 않아 불러올 수 없습니다!"
--[[Translation missing --]]
--[[ L["ImportPopup_Error_OldStringVersion"] = ""--]] 
L["ImportPopup_Title"] = "값 불러오기 "
L["ImportPopup_UpdatedScale"] = "\"%s\" 현재 값이 갱신 되었습니다."
L["ItemToolTip_AzeriteLevel"] = "아제라이트 레벨: %1$d / %2$d "
--[[Translation missing --]]
--[[ L["ItemToolTip_Legend"] = ""--]] 
L["PowersScoreString"] = [=[현재 점수: %1$d/%2$d
최고 점수: %3$d
아제라이트 레벨: %4$d/%5$d]=]
L["PowersTitles_Class"] = "직업 능력들"
L["PowersTitles_Defensive"] = "방어적 능력들"
L["PowersTitles_Profession"] = "전문기술 능력들"
L["PowersTitles_PvP"] = "PvP 능력들"
--[[Translation missing --]]
--[[ L["PowersTitles_Role"] = ""--]] 
L["PowersTitles_Zone"] = "레이드와 지역 능력들 "
--[[Translation missing --]]
--[[ L["RenamePopup_Desc"] = ""--]] 
L["RenamePopup_RenamedScale"] = "\"%1$s\" 에서 \"%2$s\" 으로 값 이름이 변경되었습니다."
L["RenamePopup_Title"] = "값 이름바꾸기 "
L["ScaleName_Unknown"] = "알수없음 "
L["ScaleName_Unnamed"] = "이름없음"
L["ScalesList_CreateImportText"] = "새로만들기 / 불러오기"
L["ScalesList_CustomGroupName"] = "사용자값들"
L["ScalesList_DefaultGroupName"] = "기본값들 "
L["ScaleWeightEditor_Title"] = "%s 가중치 편집기 "
L["Slash_Command"] = "/아제라이트 "
L["Slash_Error_Unkown"] = "에러: 무언가 잘못되었습니다! "
--[[Translation missing --]]
--[[ L["Slash_RemindConfig"] = ""--]] 
L["WeightEditor_CreateNewText"] = "새로 만들기  "
L["WeightEditor_CurrentScale"] = "현재 값: %s "
L["WeightEditor_DeleteText"] = "삭제 "
L["WeightEditor_EnableScaleText"] = "이 값을 사용 "
L["WeightEditor_ExportText"] = "내보내기"
L["WeightEditor_ImportText"] = "불러오기 "
L["WeightEditor_RenameText"] = "이름 바꾸기 "
L["WeightEditor_TooltipText"] = "툴팁에 표시하기 "
L["WeightEditor_VersionText"] = "버전 %s "


elseif LOCALE == "ptBR" then -- mariogusman (74)
L["Config_Importing_ImportingCanUpdate"] = "Importar pode atualizar pesos já existentes"
L["Config_Importing_ImportingCanUpdate_Desc"] = "Ao importar pesos com o mesmo nome, a configuração existente será atualizada com os novos pesos em vez de criar uma nova."
L["Config_Importing_ImportingCanUpdate_Desc_Clarification"] = "Você pode ter vários pesos com o mesmo nome, desde que sejam para diferentes especializações ou classes."
L["Config_Importing_Title"] = "Importando "
L["Config_Scales_Desc"] = "As configurações a seguir afetam apenas a lista de pesos padrão. Todas os pesos personalizados serão sempre listados para todas as classes."
L["Config_Scales_OwnClassDefaultsOnly"] = "Listar apenas os Pesos Padrão da sua classe"
L["Config_Scales_OwnClassDefaultsOnly_Desc"] = "Lista apenas os Pesos Padrão da sua classe, ao invés de listar todos."
L["Config_Scales_Title"] = "Lista de Pesos"
--[[Translation missing --]]
--[[ L["Config_Score_AddItemLevelToScore"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_Score_AddItemLevelToScore_Desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_Score_AddPrimaryStatToScore"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_Score_AddPrimaryStatToScore_Desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_Score_RelativeScore"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_Score_RelativeScore_Desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_Score_ScaleByAzeriteEmpowered"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_Score_ScaleByAzeriteEmpowered_Desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_Score_ShowOnlyUpgrades"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_Score_ShowOnlyUpgrades_Desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_Score_ShowTooltipLegend"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_Score_ShowTooltipLegend_Desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_Score_Title"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_SettingsAddonExplanation"] = ""--]] 
L["Config_SettingsSavedPerChar"] = [=[Todas as configurações aqui são salvas individualmente por personagem.
Pesos personalizadas são compartilhados entre todos os personagens.]=]
--[[Translation missing --]]
--[[ L["Config_SettingsScoreExplanation"] = ""--]] 
L["Config_WeightEditor_Desc"] = "As configurações a seguir afetam apenas os poderes mostrados no editor de pesos. Mesmo se você desativá-los, todos os poderes de Azerita ainda serão marcados se tiverem peso definido para eles na escala ativa."
L["Config_WeightEditor_ShowDefensive"] = "Mostrar poderes defensivos"
L["Config_WeightEditor_ShowDefensive_Desc"] = "Mostrar poderes defensivos genéricos e específicos da classe no editor de pesos de escala"
L["Config_WeightEditor_ShowProfession"] = "Mostrar poderes específicos de profissão"
L["Config_WeightEditor_ShowProfession_Desc"] = "Mostrar poderes específicos de profissão no editor de pesos. Esses poderes só podem aparecer em itens criados com profissões. Por hora, estes só podem aparecer nos Capacetes criados com Engenharia."
L["Config_WeightEditor_ShowPvP"] = "Mostrar poderes específicos de JxJ (PvP)"
L["Config_WeightEditor_ShowPvP_Desc"] = "Mostra poderes específicos de JxJ (PvP) no editor de pesos. Você só verá os poderes da sua própria facção, mas as mudanças feitas a estes pesos serão refletidas para ambas as facções."
L["Config_WeightEditor_ShowPvP_Desc_Import"] = [=[Ao exportar, a Linha de Expostação incluirá apenas os poderes JxJ (PvP) de sua próprias facção, mas eles são alternaveis com os pvp-powerIDs da facção oposta.
Ao importar uma configuração com poderes JxJ(PvP) de uma das facções, os poderes terão seus pesos espelhados para ambas as facções.]=]
L["Config_WeightEditor_ShowRole"] = "Mostrar poderes específicos de Função"
L["Config_WeightEditor_ShowRole_Desc"] = "Mostrar poderes específicos de função no editor de pesos."
L["Config_WeightEditor_ShowRolesOnlyForOwnSpec"] = "Mostrar poderes específicos de função apenas para minha própria especialização"
L["Config_WeightEditor_ShowRolesOnlyForOwnSpec_Desc"] = "Mostrar poderes específicos da especialização atual no editor de pesos. Ativando esta opção, por exemplo, esconderá pesos e poderes específicos para Curandeiros(Healers) caso você seja um Tank ou DPS."
L["Config_WeightEditor_ShowZone"] = "Mostrar poderes específicos da zona"
L["Config_WeightEditor_ShowZone_Desc"] = "Mostrar poderes específicos da Zona no editor de pesos. Esses poderes só podem aparecer em itens adquiridos em zonas específicas relacionadas ao poder."
L["Config_WeightEditor_ShowZone_Desc_Proc"] = [=[Poderes específicos da zonas normais podem ativar/procar em todos os lugares, mas os poderes de Raid só serão ativados enquanto você estiver dentro de Raid relacionada (por exemplo, os poderes Uldir somente serão ativados dentro da raid Uldir).
Poderes específicos de Raid estão marcados com um asterisco (*) ao lado do nome no editor de pesos.]=]
L["Config_WeightEditor_Title"] = "Editor de pesos"
L["CreatePopup_Desc"] = "Criando nova configuração. Selecione a Classe e Especialização no menu e então digite o nome da nova configuração e pressione %1$s."
L["CreatePopup_Error_CreatedNewScale"] = "Nova configuração \"%s\" criada!"
L["CreatePopup_Error_UnknownError"] = "ERRO:  Algo de errado aconteceu ao criar a configuração \"%s\"!"
L["CreatePopup_Title"] = "Criar configuração"
L["DefaultScaleName_Default"] = "Padrão"
L["DefaultScaleName_Defensive"] = "Defensivos"
L["DefaultScaleName_Offensive"] = "Ofensivos"
L["DeletePopup_DeletedDefaultScale"] = "A Configuração excluída estava em uso, portanto a configuração Padrão foi ativada para sua classe e especialização!"
L["DeletePopup_DeletedScale"] = "Excluir configuração \"%s\"."
L["DeletePopup_Desc"] = [=[Excluindo configuração %1$s!
Pressione %2$s para confirmar.
Todos os personagens utilizando esta configuração para suas especializações terão seus pesos revertidos para a configuração Padrão.]=]
L["DeletePopup_Title"] = "Excluir configuração"
L["DeletePopup_Warning"] = "! Esta ação é permanente e NÃO pode ser revertida !"
L["ExportPopup_Desc"] = [=[Exportando configuração %1$s!
Pressione %2$sCtrl+C%3$s para copiar a Linha de Código e %4$sCtrl+V%5$s para colá-a em outro lugar.]=]
L["ExportPopup_Title"] = "Exportar configuração"
L["ImportPopup_CreatedNewScale"] = "Nova configuração \"%s\" importada."
L["ImportPopup_Desc"] = [=[Importando configuração à partir do código...
Pressione %1$sCtrl+V%2$s para colar o código na caixa de edição e pressione %3$s.]=]
L["ImportPopup_Error_MalformedString"] = "ERRO: Código de importação errado ou imcompleto."
L["ImportPopup_Error_OldStringVersion"] = "ERRO: \"Código de Importação\" -Versão muito antiga ou com problemas no código!"
L["ImportPopup_Title"] = "Importar configuração"
L["ImportPopup_UpdatedScale"] = "Escala existente \"%s\" atualizada"
L["ItemToolTip_AzeriteLevel"] = "Nível de Azerita: %1$d / %2$d"
--[[Translation missing --]]
--[[ L["ItemToolTip_Legend"] = ""--]] 
L["PowersScoreString"] = [=[Pontuação Atual: %1$s/%2$s
Pontuação Máxima: %3$s
Nível de Azerita: %4$d/%5$d]=]
L["PowersTitles_Class"] = "Poderes de Classe"
L["PowersTitles_Defensive"] = "Poderes Defensivos"
L["PowersTitles_Profession"] = "Poderes de Profissão"
L["PowersTitles_PvP"] = "Poderes de JxJ(PvP)"
L["PowersTitles_Role"] = "Poderes de Função"
L["PowersTitles_Zone"] = "Poderes de Zona e Raid"
L["RenamePopup_Desc"] = [=[Renomeando configuração %1$s
Insira um novo nome na caixa de texto e precione %2$s]=]
L["RenamePopup_RenamedScale"] = "Configuração renomeada de \"%1$s\" para \"%2$s\""
L["RenamePopup_Title"] = "Renomear configuração"
L["ScaleName_Unknown"] = "Desconhecido"
L["ScaleName_Unnamed"] = "Sem nome"
L["ScalesList_CreateImportText"] = "Criar Nova ou Importar"
L["ScalesList_CustomGroupName"] = "Pesos Personalizados"
L["ScalesList_DefaultGroupName"] = "Pesos Padrão"
L["ScaleWeightEditor_Title"] = "%s Editor de Pesos"
L["Slash_Command"] = "/azerite"
L["Slash_Error_Unkown"] = "ERRO: Algo de errado aconteceu!"
L["Slash_RemindConfig"] = "Vá até ESC -> Interface -> AddOns -> %s para ver as configurações."
L["WeightEditor_CreateNewText"] = "Criar Novo"
L["WeightEditor_CurrentScale"] = "Configuração atual: %s"
L["WeightEditor_DeleteText"] = "Deletar"
L["WeightEditor_EnableScaleText"] = "Usar esta configuração"
L["WeightEditor_ExportText"] = "Exoprtar"
L["WeightEditor_ImportText"] = "Importar"
L["WeightEditor_RenameText"] = "Renomear"
L["WeightEditor_TooltipText"] = "Mostrar na descrição dos itens"
L["WeightEditor_VersionText"] = "Versão %s"


elseif LOCALE == "ruRU" then -- dartraiden (70), Hubbotu (18), rtim0905 (1), Wolfeg (1)
L["Config_Importing_ImportingCanUpdate"] = "Обновлять уже существующие наборы при импорте"
L["Config_Importing_ImportingCanUpdate_Desc"] = "При импорте набора, совпадающего с существующим по имени, классу и специализации, вместо создания нового набора будет обновлён уже существующий набор."
L["Config_Importing_ImportingCanUpdate_Desc_Clarification"] = "Допустимы наборы с одинаковыми названиями, если они предназначены для разных специализаций или классов."
L["Config_Importing_Title"] = "Импорт"
L["Config_Scales_Desc"] = "Следующие настройки влияют лишь на наборы по умолчанию. Все созданные вами наборы всегда видны любому классу."
L["Config_Scales_OwnClassDefaultsOnly"] = "Показывать наборы по умолчанию, предназначенные лишь для моего класса"
L["Config_Scales_OwnClassDefaultsOnly_Desc"] = "Показывать не все наборы по умолчанию, а только подходящие для вашего класса."
L["Config_Scales_Title"] = "Список наборов"
L["Config_Score_AddItemLevelToScore"] = "Добавить уровень предмета ко всем рейтингам"
L["Config_Score_AddItemLevelToScore_Desc"] = "Добавить уровень азеритовых предметов к текущему, потенциальному и максимальному рейтингам."
L["Config_Score_AddPrimaryStatToScore"] = "Добавить основную характеристику ко всем рейтингам"
L["Config_Score_AddPrimaryStatToScore_Desc"] = "Добавить количество основных характеристик азеритового предмета к текущему, потенциальному и максимальному рейтингам."
L["Config_Score_RelativeScore"] = "Показывать в подсказке относительные значения вместо абсолютных"
L["Config_Score_RelativeScore_Desc"] = "Вместо абсолютных значений вычислять относительные (по сравнению с надетыми предметами) значения и показывать их в процентах."
L["Config_Score_ScaleByAzeriteEmpowered"] = "Масштабировать прибавляемый уровень предмета с помощью ценности %s"
L["Config_Score_ScaleByAzeriteEmpowered_Desc"] = "При добавлении уровня предметов к рейтингу, использовать ценность %s для вычисления прибавляемого значения, вместо того, чтобы просто прибавлять уровень предмета к рейтингу."
L["Config_Score_ShowOnlyUpgrades"] = "Показывать подсказки только для улучшений"
L["Config_Score_ShowOnlyUpgrades_Desc"] = "Показывать значения в подсказках только в том случае, если они превышают те, что имеются у надетого предмета. Эта настройка будет работать, только если включён показ относительные значений."
L["Config_Score_ShowTooltipLegend"] = "Показывать легенду в подсказках"
L["Config_Score_ShowTooltipLegend_Desc"] = "Показывать в подсказках слова \"Текущий рейтинг / потенциальный рейтинг / максимальный рейтинг\" над соответствующими числами."
L["Config_Score_Title"] = "Рейтинг"
L["Config_SettingsAddonExplanation"] = "Модификация высчитывает \"текущий\", \"потенциальный\" и \"максимальный\" рейтинги азеритовых предметов, исходя из ценности азеритовых талантов."
L["Config_SettingsSavedPerChar"] = [=[Все эти настройки сохраняются отдельно для каждого персонажа.
Созданные вами наборы являются общими для всех персонажей.]=]
L["Config_SettingsScoreExplanation"] = [=["Текущий рейтинг" — сумма азеритовых талантов предмета, задействованных в настоящий момент.
"Потенциальный рейтинг" — сумма азеритовых талантов предмета, наилучших в каждом тире и доступных в настоящий момент.
"Максимальный рейтинг" — сумма азеритовых талантов предмета, наилучших в каждом тире, включая те, что ещё не разблокированы.]=]
L["Config_WeightEditor_Desc"] = "Следующие настройки влияют лишь на показ талантов в редакторе наборов. Даже если вы отключите их, ценность азеритовых талантов будет учтена, если она у них указана."
L["Config_WeightEditor_ShowDefensive"] = "Показывать защитные таланты"
L["Config_WeightEditor_ShowDefensive_Desc"] = "Показывать в редакторе наборов общие и специфичные для класса защитные таланты."
L["Config_WeightEditor_ShowProfession"] = "Показывать таланты, специфичные для профессий"
L["Config_WeightEditor_ShowProfession_Desc"] = "Показывать в редакторе наборов таланты, специфичные для профессий. Эти таланты присутствуют только у предметов, созданных с помощью профессий. В настоящий момент они присутствуют только у головных уборов, созданных инженерами."
L["Config_WeightEditor_ShowPvP"] = "Показывать таланты, специфичные для PvP"
L["Config_WeightEditor_ShowPvP_Desc"] = "Показывать в редакторе наборов таланты, специфичные для PvP. Будут видны лишь таланты вашей фракции, но внесённые изменения применяются к обеим фракциям."
L["Config_WeightEditor_ShowPvP_Desc_Import"] = [=[Экспортируемая строка содержит только PvP-таланты вашей фракции, но они соответствуют по ID PvP-талантам вражеской фракции.
При импорте строки, содержащей PvP-таланты лишь одной фракции, аналогичные таланты противоположной фракции получат такую же ценность.]=]
L["Config_WeightEditor_ShowRole"] = "Показывать таланты, специфичные для роли"
L["Config_WeightEditor_ShowRole_Desc"] = "Показывать в редакторе наборов таланты, специфичные для роли."
L["Config_WeightEditor_ShowRolesOnlyForOwnSpec"] = "Показывать таланты, подходящие только для моей специализации"
L["Config_WeightEditor_ShowRolesOnlyForOwnSpec_Desc"] = "Показывать в редакторе наборов общие и специфичные для текущей специализации ролевые таланты. Включение этой настройки, например, скрывает таланты лекарей от бойцов и танков."
L["Config_WeightEditor_ShowZone"] = "Показывать таланты, специфичные для локаций"
L["Config_WeightEditor_ShowZone_Desc"] = "Показывать в редакторе наборов таланты, специфичные для локаций. Эти таланты присутствуют только у предметов, добытых в определённой локации, связанной с талантом."
L["Config_WeightEditor_ShowZone_Desc_Proc"] = [=[Обычные таланты работают и срабатывают везде, но рейдовые таланты работают только внутри связанных с ними рейдов (например, таланты Ульдира срабатывают только внутри Ульдира).
В редакторе наборов рейдовые таланты отмечены звёздочкой (*).]=]
L["Config_WeightEditor_Title"] = "Редактор наборов"
L["CreatePopup_Desc"] = "Создание нового набора. Выберите класс и специализацию из выпадающего меню, введите название набора, а затем нажмите %1$s"
L["CreatePopup_Error_CreatedNewScale"] = "Создан новый набор \"%s\""
L["CreatePopup_Error_UnknownError"] = "ОШИБКА: при создании нового набора \"%s\" что-то пошло не так!"
L["CreatePopup_Title"] = "Создать набор"
L["DefaultScaleName_Default"] = "По умолчанию"
L["DefaultScaleName_Defensive"] = "Защита"
L["DefaultScaleName_Offensive"] = "Атака"
L["DeletePopup_DeletedDefaultScale"] = "Удалённый набор использовался, поэтому возвращаю обратно набор по умолчанию для вашего класса и специализации!"
L["DeletePopup_DeletedScale"] = "Удалён набор \"%s\""
L["DeletePopup_Desc"] = [=[Удаление набора %1$s
Нажмите %2$s для подтверждения.
Все персонажи, которые использовали этот набор, вернутся к набору по умолчанию.]=]
L["DeletePopup_Title"] = "Удалить набор"
L["DeletePopup_Warning"] = "Это действие невозможно отменить!"
L["ExportPopup_Desc"] = [=[Экспорт набора %1$s
Нажмите %2$sCtrl+C%3$s, чтобы скопировать строку и %4$sCtrl+V%5$s, чтобы куда-нибудь её вставить]=]
L["ExportPopup_Title"] = "Экспортировать набор"
L["ImportPopup_CreatedNewScale"] = "Импортирован новый набор \"%s\""
L["ImportPopup_Desc"] = [=[Импорт набора из строки
Нажмите %1$sCtrl+V%2$s, чтобы вставить строку в поле ввода, а затем нажмите %3$s]=]
L["ImportPopup_Error_MalformedString"] = "ОШИБКА: импортируемая строка некорректна!"
L["ImportPopup_Error_OldStringVersion"] = "ОШИБКА: импортируемая строка некорректна или импортируется из старой версии!"
L["ImportPopup_Title"] = "Импортировать набор"
L["ImportPopup_UpdatedScale"] = "Обновлён существующий набор \"%s\""
L["ItemToolTip_AzeriteLevel"] = "Уровень Сердца Азерота: %1$d / %2$d"
L["ItemToolTip_Legend"] = "Текущий рейтинг / потенциальный рейтинг / максимальный рейтинг"
L["PowersScoreString"] = [=[Текущий рейтинг: %1$d/%2$d
Максимальный рейтинг: %3$d
Уровень Сердца Азерота: %4$d/%5$d]=]
L["PowersTitles_Class"] = "Классовые таланты"
L["PowersTitles_Defensive"] = "Защитные таланты"
L["PowersTitles_Profession"] = "Таланты профессий"
L["PowersTitles_PvP"] = "PvP-таланты"
L["PowersTitles_Role"] = "Ролевые таланты"
L["PowersTitles_Zone"] = "Таланты рейдов и локаций"
L["RenamePopup_Desc"] = [=[Переименование набора %1$s
Введите новое название в поле ввода и нажмите %2$s]=]
L["RenamePopup_RenamedScale"] = "Набор \"%1$s\" переименован в \"%2$s\""
L["RenamePopup_Title"] = "Переименовать набор"
L["ScaleName_Unknown"] = "Неизвестный"
L["ScaleName_Unnamed"] = "Без названия"
L["ScalesList_CreateImportText"] = "Создать / Импортировать"
L["ScalesList_CustomGroupName"] = "Ваши наборы"
L["ScalesList_DefaultGroupName"] = "Наборы по умолчанию"
L["ScaleWeightEditor_Title"] = "Редактор набора %s"
L["Slash_Command"] = "/azerite"
L["Slash_Error_Unkown"] = "ОШИБКА: что-то пошло не так!"
L["Slash_RemindConfig"] = "Настройки в Esc → Интерфейс → Модификации →%s."
L["WeightEditor_CreateNewText"] = "Создать новый"
L["WeightEditor_CurrentScale"] = "Текущий набор: %s"
L["WeightEditor_DeleteText"] = "Удалить"
L["WeightEditor_EnableScaleText"] = "Использовать этот"
L["WeightEditor_ExportText"] = "Экспортировать"
L["WeightEditor_ImportText"] = "Импортировать"
L["WeightEditor_RenameText"] = "Переименовать"
L["WeightEditor_TooltipText"] = "Показывать в подсказке"
L["WeightEditor_VersionText"] = "Версия %s"


elseif LOCALE == "zhCN" then -- plok245 (27), riggzh (29), xlfd2008 (34)
L["Config_Importing_ImportingCanUpdate"] = "允许导入覆盖现有配置"
L["Config_Importing_ImportingCanUpdate_Desc"] = "当导入配置名称相同并且职业专精一致时，将覆盖现有配置，而不是新建配置。"
L["Config_Importing_ImportingCanUpdate_Desc_Clarification"] = "可以有多个同名配置，只要它们用于不同的专精或职业。"
L["Config_Importing_Title"] = "导入"
L["Config_Scales_Desc"] = "以下设置仅影响默认配置。所有自定义配置在每个职业中都显示。"
L["Config_Scales_OwnClassDefaultsOnly"] = "只显示自己职业的默认配置"
L["Config_Scales_OwnClassDefaultsOnly_Desc"] = "只显示您自己职业的默认配置，而不是显示所有的默认配置。"
L["Config_Scales_Title"] = "配置列表"
L["Config_Score_AddItemLevelToScore"] = "将物品等级计入所有分数中"
L["Config_Score_AddItemLevelToScore_Desc"] = "将艾泽里特护甲的物品等级计入到所有当前已选分数、当前可选最高分和全部解锁最高分的计算中。"
L["Config_Score_AddPrimaryStatToScore"] = "将主属性计入到所有分数中"
L["Config_Score_AddPrimaryStatToScore_Desc"] = "将艾泽里特护甲的主属性值(%s/%s/%s)计入所有当前已选分数、当前可选最高分和全部解锁最高分的计算中。"
L["Config_Score_RelativeScore"] = "在鼠标提示中显示相对值而不是绝对值"
L["Config_Score_RelativeScore_Desc"] = "不在鼠标提示中显示权值的绝对值，而是计算与当前装备相比的相对值，并以百分比显示。"
L["Config_Score_ScaleByAzeriteEmpowered"] = "按％s的权值计算物品等级分数"
L["Config_Score_ScaleByAzeriteEmpowered_Desc"] = "将物品等级计入分数中时，使用“艾泽里特强化”的权值来计算+1物品等级的分数，而不是按照“1物品等级=1分”来计算。"
L["Config_Score_ShowOnlyUpgrades"] = "只显示有提升的鼠标提示"
L["Config_Score_ShowOnlyUpgrades_Desc"] = "只有在与当前装备的物品相比有提升时，才显示鼠标提示中的权值。 仅适用于启用了相对值。"
L["Config_Score_ShowTooltipLegend"] = "在鼠标提示中显示详细说明"
L["Config_Score_ShowTooltipLegend_Desc"] = "在鼠标提示中显示“当前已选分数/当前可选最高分/全部解锁最高分”。"
L["Config_Score_Title"] = "分数"
L["Config_SettingsAddonExplanation"] = "此插件根据您选择的特质权重来计算艾泽里特护甲的“当前已选分数”，“当前可选最高分”和“全部解锁最高分”。"
L["Config_SettingsSavedPerChar"] = [=[此处所有设置都是每个角色分开保存。
自定义配置则为所有角色共享。]=]
L["Config_SettingsScoreExplanation"] = [=[“当前已选分数”是该艾泽里特护甲中当前选择特质的分数之和。
“当前可选最高分”是该艾泽里特护甲已解锁层中特质最高分数之和。
“全部解锁最高分”是该艾泽里特护甲每一层中特质最高分数之和，包括未解锁的。]=]
L["Config_WeightEditor_Desc"] = [=[以下设置只适用于显示在配置权值编辑器的特质。
即使你禁用了它们，如果它们在启用配置中设置了权值，所有的艾泽里特特质仍会计算分数。]=]
L["Config_WeightEditor_ShowDefensive"] = "显示防御性特质"
L["Config_WeightEditor_ShowDefensive_Desc"] = "在配置权值编辑器中显示通用与职业特定的防御性特质。"
L["Config_WeightEditor_ShowProfession"] = "显示专业技能专有特质"
L["Config_WeightEditor_ShowProfession_Desc"] = "在配置权值编辑器中显示专业技能专有特质。这些特质只会出现在专业技能制造的装备中。目前只有工程头。"
L["Config_WeightEditor_ShowPvP"] = "显示PvP专有特质"
L["Config_WeightEditor_ShowPvP_Desc"] = "在配置权值编辑器中显示PvP专有特质。你只会看到自己的阵营特质，但对它们进行更改会应用到双方阵营特质。"
L["Config_WeightEditor_ShowPvP_Desc_Import"] = [=[当导出生成的字符串时，只包含你自己阵营的PvP特质，但它们可以与对立阵营PvP特质ID互换。
当导入一个具有PvP特质的字符串时，权值会镜像导入到双方阵营特质中。]=]
L["Config_WeightEditor_ShowRole"] = "显示角色专有特质"
L["Config_WeightEditor_ShowRole_Desc"] = "在配置权值编辑器中显示角色专有特质。"
L["Config_WeightEditor_ShowRolesOnlyForOwnSpec"] = "只显示自己专精职责的角色专有特质"
L["Config_WeightEditor_ShowRolesOnlyForOwnSpec_Desc"] = "在配置权值编辑器中显示通用与当前专精相关的角色专有特质。启用此设置的话，例如治疗专有特质将会在DPS与坦克上隐藏等。"
L["Config_WeightEditor_ShowZone"] = "显示区域专有特质"
L["Config_WeightEditor_ShowZone_Desc"] = "在配置权值编辑器中显示区域专有特质。这些特质只会出现在与特质相关的特定区域中获得的装备上。"
L["Config_WeightEditor_ShowZone_Desc_Proc"] = [=[普通特质可以在任何地方生效，但团本特质的部分效果只能在相应的团本内生效（例如：奥迪尔特质的[重组阵列]效果只能在奥迪尔内生效）
团本特质将在配置权值编辑器的名称旁标有星号（*）]=]
L["Config_WeightEditor_Title"] = "配置权值编辑器"
L["CreatePopup_Desc"] = "创建新配置。请从下拉列表中选择职业和天赋，然后输入新配置的名称并点击%1$s"
L["CreatePopup_Error_CreatedNewScale"] = "创建新配置“%s”"
L["CreatePopup_Error_UnknownError"] = "错误：无法创建新配置“%s”"
L["CreatePopup_Title"] = "添加配置"
L["DefaultScaleName_Default"] = "默认"
L["DefaultScaleName_Defensive"] = "防御"
L["DefaultScaleName_Offensive"] = "输出"
L["DeletePopup_DeletedDefaultScale"] = "删除的配置正在使用中，现已恢复为您职业和专精的默认选项！"
L["DeletePopup_DeletedScale"] = "删除配置“%s”"
L["DeletePopup_Desc"] = [=[正在删除配置“%1$s”
点击%2$s确认
所有使用此配置的职业和专精将恢复默认]=]
L["DeletePopup_Title"] = "删除配置"
L["DeletePopup_Warning"] = "！这项操作是永久的且不可恢复！"
L["ExportPopup_Desc"] = [=[导出配置%1$s
点击%2$sCtrl+C%3$s复制字符串，%4$sCtrl+V%5$s在其他地方粘贴]=]
L["ExportPopup_Title"] = "导出配置"
L["ImportPopup_CreatedNewScale"] = "导入新配置“%s”"
L["ImportPopup_Desc"] = [=[正在从字符串导入配置
按下 %1$sCtrl+V%2$s 来粘贴字符串到编辑框并点击 %3$s]=]
L["ImportPopup_Error_MalformedString"] = "错误：导入的字符串格式错误"
L["ImportPopup_Error_OldStringVersion"] = "错误：\"导入字符串\" -版本太旧或是导入字符串格式错误！"
L["ImportPopup_Title"] = "导入配置"
L["ImportPopup_UpdatedScale"] = "更新现有的配置 \"%s\""
L["ItemToolTip_AzeriteLevel"] = "艾泽里特等级: %1$d / %2$d"
L["ItemToolTip_Legend"] = "当前已选分数/当前可选最高分/全部解锁最高分"
L["PowersScoreString"] = [=[当前已选分数: %1$s/%2$s
全部解锁最高分: %3$s
艾泽里特等级: %4$d/%5$d]=]
L["PowersTitles_Class"] = "职业特质"
L["PowersTitles_Defensive"] = "防御性特质"
L["PowersTitles_Profession"] = "专业技能特质"
L["PowersTitles_PvP"] = "PvP特质"
L["PowersTitles_Role"] = "角色特质"
L["PowersTitles_Zone"] = "团本与区域特质"
L["RenamePopup_Desc"] = [=[正在重命名配置 %1$s
在编辑框中输入新名称并按下 %2$s]=]
L["RenamePopup_RenamedScale"] = "已重命名配置 \"%1$s\" 为 \"%2$s\""
L["RenamePopup_Title"] = "重命名配置"
L["ScaleName_Unknown"] = "未知"
L["ScaleName_Unnamed"] = "未命名"
L["ScalesList_CreateImportText"] = "新建/导入"
L["ScalesList_CustomGroupName"] = "自定义配置"
L["ScalesList_DefaultGroupName"] = "默认配置"
L["ScaleWeightEditor_Title"] = "%s 配置权值编辑器"
L["Slash_Command"] = "/azerite"
L["Slash_Error_Unkown"] = "错误：出现一些错误！"
L["Slash_RemindConfig"] = "到 ESC -> 界面 -> 插件 -> %s 来设置"
L["WeightEditor_CreateNewText"] = "新建"
L["WeightEditor_CurrentScale"] = "当前配置：%s"
L["WeightEditor_DeleteText"] = "删除"
L["WeightEditor_EnableScaleText"] = "启用配置"
L["WeightEditor_ExportText"] = "导出"
L["WeightEditor_ImportText"] = "导入"
L["WeightEditor_RenameText"] = "重命名"
L["WeightEditor_TooltipText"] = "在鼠标提示中显示"
L["WeightEditor_VersionText"] = "版本 %s"


elseif LOCALE == "zhTW" then -- BNSSNB (89), Sinusquell (1)
L["Config_Importing_ImportingCanUpdate"] = "導入可以更新現有比例"
L["Config_Importing_ImportingCanUpdate_Desc"] = "當導入具有相同名稱，職業和專精的比例作為預先存在的比例時，現有比例將使用新權值更新，而不是建立新比例。"
L["Config_Importing_ImportingCanUpdate_Desc_Clarification"] = "可以有多個具有相同名稱的比例，只要它們用於不同的專精或職業。"
L["Config_Importing_Title"] = "導入"
L["Config_Scales_Desc"] = "以下設置僅影響清單的預設比例。所有自訂比例將在每個職業列出。"
L["Config_Scales_OwnClassDefaultsOnly"] = "只列出自己職業的預設比例"
L["Config_Scales_OwnClassDefaultsOnly_Desc"] = "只列出你自己職業的預設比例，而非列出所有。"
L["Config_Scales_Title"] = "比例清單"
L["Config_Score_AddItemLevelToScore"] = "添加物品等級到所有分數"
L["Config_Score_AddItemLevelToScore_Desc"] = "添加艾澤萊護甲的物品等級到所有當前分數，當前潛力與最高分數計算。"
L["Config_Score_AddPrimaryStatToScore"] = "主屬性計入所有分數"
L["Config_Score_AddPrimaryStatToScore_Desc"] = "將艾澤萊護甲的主屬性值(%s/%s/%s)計算加入當前分數，當前潛力以及最大分數。"
L["Config_Score_RelativeScore"] = "在工具提示中顯示相對值而不是絕對值"
L["Config_Score_RelativeScore_Desc"] = "不是在工具提示中顯示比例的絕對值，而是計算與當前裝備物品相比的相對值，並以百分比顯示差異。"
L["Config_Score_ScaleByAzeriteEmpowered"] = "按比例中的％s權值縮放物品等級計分"
L["Config_Score_ScaleByAzeriteEmpowered_Desc"] = "將物品等級計入到分數時，使用比例的％s的權值來計算+1物品等級的值，而不是使用+1物品等級 = +1分數。"
L["Config_Score_ShowOnlyUpgrades"] = "只顯示有升級的工具提示"
L["Config_Score_ShowOnlyUpgrades_Desc"] = "只有在與當前裝備的物品相比是升級時，才顯示工具提示中的比例值。 這僅適用於啟用了相對值。"
L["Config_Score_ShowTooltipLegend"] = "在工具提示中顯示詳細說明"
L["Config_Score_ShowTooltipLegend_Desc"] = "在工具提示中顯示\"當前分數 / 當前潛力 / 最大分數\"的提醒。"
L["Config_Score_Title"] = "分數"
L["Config_SettingsAddonExplanation"] = "此插件根據你選擇的特質比重計算艾澤萊護甲的\"當前分數\"，\"當前潛力\"以及\"最大分數\"。"
L["Config_SettingsSavedPerChar"] = [=[這裡所有設置都是每個角色分開儲存。
自訂比例則為所有角色共享。]=]
L["Config_SettingsScoreExplanation"] = [=["當前分數" 是當前物品所選的艾澤萊晶岩之力分數總計。
"當前潛力" 是當前物品所可能選擇的最高艾澤萊晶岩之力分數總計。
"最大分數" 是每個物品中最高比重艾澤萊晶岩之力的總計，包含尚未開鎖的。]=]
L["Config_WeightEditor_Desc"] = [=[以下設置只適用於顯示在比例權值編輯器的特質。
即使你停用了它們，如果它們在啟用比例中設置了權值，所有的艾澤萊特質仍會計算分數。]=]
L["Config_WeightEditor_ShowDefensive"] = "顯示防禦性特質"
L["Config_WeightEditor_ShowDefensive_Desc"] = "在比例權值編輯器中顯示通用與職業特定的防禦性特質。"
L["Config_WeightEditor_ShowProfession"] = "顯示專業技能專有特質"
L["Config_WeightEditor_ShowProfession_Desc"] = "在比例權值編輯器中顯示專業技能專有特質。這些特質只會出現在專業技能製作物品中。目前只有出現在工程學頭部裝備。"
L["Config_WeightEditor_ShowPvP"] = "顯示PvP專有特質"
L["Config_WeightEditor_ShowPvP_Desc"] = "在比例權值編輯器中顯示PvP專有特質。你只會看到自己的陣營特質，但對它們做的變動會反映到雙方陣營。"
L["Config_WeightEditor_ShowPvP_Desc_Import"] = [=[當導出生成的字串時，只包含你自己陣營的PvP特質，但它們可以與對立的陣營pvp-powerID互換。
當從一個陣營導入具有pvp特質的字串時，特質會將其權值鏡像導入到雙方陣營。]=]
L["Config_WeightEditor_ShowRole"] = "顯示角色類型專有特質"
L["Config_WeightEditor_ShowRole_Desc"] = "在比例權值編輯器中顯示角色類型專有特質。"
L["Config_WeightEditor_ShowRolesOnlyForOwnSpec"] = "只顯示我自己專精職責的角色類型專有特質"
L["Config_WeightEditor_ShowRolesOnlyForOwnSpec_Desc"] = "在比例權值編輯器中顯示共通與當前專精相關的角色類型專有特質。啟用此設置的話像是治療專有專精將會在傷害與坦克上隱藏等等。"
L["Config_WeightEditor_ShowZone"] = "顯示區域專有特質"
L["Config_WeightEditor_ShowZone_Desc"] = "在比例權值編輯器中顯示區域專有特質。這些特質只會出現在與特質相關特定區域中獲得的物品上。"
L["Config_WeightEditor_ShowZone_Desc_Proc"] = [=[正常區域專有特質可以在任何地方啟動/觸發，但團隊特質只會在與它們相關的團隊副本中進行(例如：奧杜爾特質只會在奧杜爾團隊副本中觸發)。
團隊特質在比例權值編輯器中的名稱旁標有星號(*)。]=]
L["Config_WeightEditor_Title"] = "比例權值編輯器"
L["CreatePopup_Desc"] = "建立新的比例。從下拉選單選擇職業與專精並輸入新比例的名稱然後按下 %1$s"
L["CreatePopup_Error_CreatedNewScale"] = "已建立新比例 \"%s\""
L["CreatePopup_Error_UnknownError"] = "錯誤：建立新比例“％s”出了點問題！"
L["CreatePopup_Title"] = "建立比例"
L["DefaultScaleName_Default"] = "預設"
L["DefaultScaleName_Defensive"] = "防禦性"
L["DefaultScaleName_Offensive"] = "攻擊性"
L["DeletePopup_DeletedDefaultScale"] = "刪除的比例正在使用中，恢復為您的職業和專精的預設選項！"
L["DeletePopup_DeletedScale"] = "已刪除比例 \"%s\""
L["DeletePopup_Desc"] = [=[正刪除比例 %1$s
按下 %2$s 以確認。
所有使用此專精比例的角色將恢復為預設比例。]=]
L["DeletePopup_Title"] = "刪除比例"
L["DeletePopup_Warning"] = "！ 這個動作是永久性的，無法逆轉！"
L["ExportPopup_Desc"] = [=[正導出比例 %1$s
按下 %2$sCtrl+C%3$s 來複製字串並且 %4$sCtrl+V%5$s 來貼上到某處]=]
L["ExportPopup_Title"] = "導出比例"
L["ImportPopup_CreatedNewScale"] = "導入新的比例 \"%s\""
L["ImportPopup_Desc"] = [=[正從字串導入比例
按下 %1$sCtrl+V%2$s 來貼上字串到編輯框並按下 %3$s]=]
L["ImportPopup_Error_MalformedString"] = "錯誤：導入的字串格式錯誤"
L["ImportPopup_Error_OldStringVersion"] = "錯誤：\"導入字串\" -版本太舊或是導入字串格式錯誤！"
L["ImportPopup_Title"] = "導入比例"
L["ImportPopup_UpdatedScale"] = "更新現有的比例 \"%s\""
L["ItemToolTip_AzeriteLevel"] = "艾澤萊等級: %1$d / %2$d"
L["ItemToolTip_Legend"] = "當前分數 / 當前潛力 / 最大分數"
L["PowersScoreString"] = [=[當前分數: %1$d/%2$d
最大分數: %3$d
艾澤萊等級: %4$d/%5$d]=]
L["PowersTitles_Class"] = "職業特質"
L["PowersTitles_Defensive"] = "防禦性特質"
L["PowersTitles_Profession"] = "專業技能特質"
L["PowersTitles_PvP"] = "PvP特質"
L["PowersTitles_Role"] = "角色類型特質"
L["PowersTitles_Zone"] = "團隊與區域特質"
L["RenamePopup_Desc"] = [=[正重新命名比例 %1$s
在編輯框中輸入新名稱並按下 %2$s]=]
L["RenamePopup_RenamedScale"] = "已重命名比例 \"%1$s\" 為 \"%2$s\""
L["RenamePopup_Title"] = "重命名比例"
L["ScaleName_Unknown"] = "未知"
L["ScaleName_Unnamed"] = "未命名"
L["ScalesList_CreateImportText"] = "建立新的 / 導入"
L["ScalesList_CustomGroupName"] = "自訂比例"
L["ScalesList_DefaultGroupName"] = "預設比例"
L["ScaleWeightEditor_Title"] = "%s 比例權值編輯器"
L["Slash_Command"] = "/azerite"
L["Slash_Error_Unkown"] = "錯誤：出了些問題了！"
L["Slash_RemindConfig"] = "到ESC -> 介面 -> 插件 -> %s來設置"
L["WeightEditor_CreateNewText"] = "建立新的"
L["WeightEditor_CurrentScale"] = "當前比例: %s"
L["WeightEditor_DeleteText"] = "刪除"
L["WeightEditor_EnableScaleText"] = "使用此比例"
L["WeightEditor_ExportText"] = "導出"
L["WeightEditor_ImportText"] = "導入"
L["WeightEditor_RenameText"] = "重命名"
L["WeightEditor_TooltipText"] = "在提示中顯示"
L["WeightEditor_VersionText"] = "版本 %s"


end

--#EOF
