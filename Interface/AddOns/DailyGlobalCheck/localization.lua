-- Daily Global Check
-- Localization

local addonName, addonTable = ...
local debug
--[===[@debug@
--debug = true
--@end-debug@]===]

local L = {}
addonTable.L = L

--if debug then
L["addbtntooltip"] = "Add the selected quest to your Daily Global Check Custom List"
L["added"] = "added"
L["size"] = "Size"
L["repeatable"] = "Repeatable"
L["availablelists"] = "Available Lists"
L["bf_err1"] = "|cff11DDFFDaily Global Check|r - You need to enter either the quest ID and its name."
L["b_questid"] = "Quest ID"
L["b_questname"] = "Quest Name"
L["chars_deleted"] = "|cff11DDFFDaily Global Check|r - Character |cff00FF00%s|r is now in the blacklist"
L["chars_restored"] = "|cff11DDFFDaily Global Check|r - Character |cff00FF00%s|r has been removed from the blacklist"
L["customlist"] = "Custom List"
L["deleted"] = "deleted"
L["lclicktoopen"] = "Left-click to open the main frame"
L["namemissing"] = "<name missing>"
L["nextpage"] = "Next Page"
L["nolist"] = "No list selected"
L["notitle"] = "<no title>"
L["opt_blacklist_remove"] = "Remove a character from the black list"
L["opt_characters"] = "Characters"
L["opt_characters_short"] = "(Alt)"
L["opt_help"] = "Help"
L["opt_hidecompleted"] = "Hide completed quests"
L["opt_map_all"] = "Only show world map icons from selected list"
L["plugin_opt_none"] = "The selected plugin doesn't have any specific option"
L["plugin_opt_title"] = "Options for the selected plugin:"
L["prevpage"] = "Previous Page"
L["questdatamissing"] = "<quest data missing>"
L["rclicktoopen"] = "Right-click to open the quick list selection menu"
L["remmenuheader"] = "- Select the quest to remove -"
L["s_tomtomset"] = "|cff11DDFFDaily Global Check|r - Waypoint added to TomTom"
L["opt_coords"] = "Show coordinates"
L["opt_map"] = "Show world map icons"
L["opt_minimap"] = "Show minimap button"
L["opt_prefix"] = "Show prefix"
L["opt_questtype"] = "Show quest type"
L["opt_showquestbtn"] = "Show the 'Add quest to Custom List' button in the Quest Log Frame"
L["opt_suffix"] = "Show suffix"
L["opt_zonename"] = "Show zone name"
L["tomtom_button"] = "Set TomTom waypoints"
L["opt_minimap_icons"] = "Show minimap icons"
L["list_visibility"] = "List Visibility"
L["tools"]           = "Tools"
L["edit_quest"]      = "Edit Quest"
L["new_quest"]       = "New Quest"
L["quests_limit"]    = "Quests limit reached (%s)"
L["delete_list"]     = "Delete List"
L["create_new_list"] = "Create a new list"
L["questlog_quest_added"] = "|cff11DDFFDaily Global Check|r - Quest %s added to the custom quests pool."
L["newlist"] = "New List"
L["add_quest"] = "Add Quest"
L["new_group"] = "New Group"
L["new_page"] = "New Page"
L["del_page"] = "Delete Page"
L["move_up"] = "Move Selection Up"
L["move_down"] = "Move Selection Down"
L["edit_mode"] = "Edit Mode"
L["lists_limit"] = "Lists limit reached (%s)"
L["blacklist"] = "Blacklist"

-- news frame
L["news_bottomtext1"] = "|cff11DDFFLeft-Click|cffFFFFFF: |cff00FF00Next"
L["news_bottomtext2"] = "|cff11DDFFRight-Click|cffFFFFFF: |cff00FF00Hide|r"
L["news_#1"] = "Hi! I'm your assistant and I will show you the most important news about Daily Global Check"
L["news_#2"] = "You can print the current DGC page output in the chatframe by typing '/dgc print'"
L["news_#3"] = "Daily Global Check can track Instance Lockouts since v1.3.5! The related plugin can be found on Curse"
L["news_#4"] = "Weekly follower and Herb/Mining node counters are available in the Daily Global Check_Professions plugin"
L["news_#5"] = "The Rare Mobs plugin, as of v1.3.2, has two specific options available in the Options->Plugin panel"
L["news_#6"] = "Check out |cff00ff00DailyGlobalCheck_Hallow's End|r if you're interested in tracking Hallow's End dailies and candy buckets"
L["news_#7"] = "|cff00ffffMay 2016|r - |cffAAAAAAv|cff00ff001.5|r - Daily Global Check got a massive technical overhaul in preparation for Legion. The older plugins are incompatible and they will also need to be updated to the newer version, apologies for the inconvenience :)"
L["news_#8"] = "Groups can be collapsed by clicking on their title in the main frame, collapsed groups are hidden in mouseovering views"
L["news_#9"] = "You can hide map icons for chosen pages of any list through its Plugin Options"
L["news_#10"] = "World map icons from adjacent and continent maps are now hidden by default.\nThere is a new option in the Map Options panel to restore them"

L["quest_options"]   = "Quest Options"
L["plugin_options"]  = "Plugin Options"
L["map_options"]     = "Map Options"
L["b_prefix"] = "Prefix"
L["b_suffix"] = "Suffix"
L["bf_err2"] = "|cff11DDFFDaily Global Check|r - This quest already exists."
L["coordinates"] = "Coordinates"

L["help_edt_1"] = "You can create a new custom list by using the %s button."
L["help_edt_2"] = "You can rename the selected list by using the %s button."
L["help_edt_3"] = "This button permanently deletes the currently selected custom list."
L["help_edt_4"] = "This is the quest pool, you can drag any quest from here and drop it on the currently selected list.\n- The %s button permanently deletes the relative custom quest from the quest pool.\n- The %s button is used to edit the relative |cff00ff00custom|r quest."
L["help_edt_5"] = "This is the selected custom list\n- Quests can be repositioned by simply dragging them.\n- A group of quests can be moved by using the %s buttons at the header's left.\n- The %s button deletes the relative quest (it will still be available in the quest pool) or entire group from the list.\n- The %s button is used to edit the relative |cff00ff00custom|r quest or rename the relative group.\n- The 'New Quest' button creates a new quest in the quest pool and inserts it at the button's location, ready to be edited.\n- The 'New Group' button simply creates a new group."
L["help_edt_6"] = "These buttons are used to create or delete pages within the currently selected list."
L["help_edt_7"] = "Here you can select which section of the quest you wish to modify."
L["help_edt_8"] = "This frame can be used to edit the chosen quest section."
L["help_edt_9"] = "Click Okay to save your changes, or Cancel to revert them."

L["edit_questID_info"] = "You can insert multiple quest IDs each separated by one of the following keywords:\n %s : this element will result complete if at least one of the quests is completed.\n %s : this element will result complete only when all the quests are completed."
L["collapsed"] = "Collapsed"
	
L["map_icons_visibility_list"] = "Map icons visibility for this List"
L["toggle_all_pages"] = "Toggle All Pages"
L["account_wide_options"] = "(Account-Wide Options)"
L["character_specific_options"] = "(Character-specific options)"

L["edit_spell_info"] = "Tracks the cooldown of a spell, mostly useful with profession based spells"
L["spell_id"] = "Spell ID"
L["generating_database"] = "Generating the %s database..."
L["classic"] = "Classic"
L["search_by_name"] = "Search by name"
L["currency_id"] = "Currency ID"
L["map_id"] = "Map ID"
L["show_adjacent_map_icons"] = "Show on adjacent/continent maps"
L["shown"] = "Shown"
L["hidden"] = "Hidden"
L["worldmap_icons"] = "Worldmap Icons"
L["minimap_icons"] = "Minimap Icons"
L["news_#11"] = "Want to save talent sets and change talents with a click? Check out my new addon, |cff00ff00Talent Set Manager|r!"
--end

local locale = GetLocale()

if locale == "esES" then 
-- General
L["add"] = "Añadir"
L["add_quest"] = "Añadir misión"
L["addbtntooltip"] = "Añadir la misión seleccionada a tu lista personalizada de Daily Global Check"
L["added"] = "añadido"
L["availablelists"] = "Listas disponibles"
L["b_prefix"] = "Prefijo"
L["b_questid"] = "ID de misión"
L["b_questname"] = "Nombre de misión"
L["b_suffix"] = "Sufijo"
L["bf_err1"] = "|cff11DDFFDaily Global Check|r - Necesita introducir la ID de la misión y su nombre."
L["bf_err2"] = "|cff11DDFFDaily Global Check|r - Esta misión ya existe."
--Translation missing 
L["blacklist"] = "Blacklist"
L["buildframe"] = "Modificar lista personalizada"
L["chars_deleted"] = "|cff11DDFFDaily Global Check|r - Personaje |cff00FF00%s|r añadido a la lista negra."
L["chars_restored"] = "cff11DDFFDaily Global Check|r - Personaje |cff00FF00%s|r eliminado de la lista negra"
L["classic"] = "Tradicional"
--Translation missing 
L["collapsed"] = "Collapsed"
--Translation missing 
L["coordinates"] = "Coordinates"
--Translation missing 
L["create_new_list"] = "Create a new list"
L["currency_id"] = "Id de moneda"
L["customlist"] = "Lista personalizada"
L["del_page"] = "Eliminar página"
--Translation missing 
L["delete_list"] = "Delete List"
L["deleted"] = "eliminado"
L["edit_mode"] = "Modo edición"
--Translation missing 
L["edit_quest"] = "Edit Quest"
--Translation missing 
L["edit_questID_info"] = [=[You can insert multiple quest IDs each separated by one of the following keywords:
 %s : this element will result complete if at least one of the quests is completed.
 %s : this element will result complete only when all the quests are completed.]=]
--Translation missing 
L["edit_spell_info"] = "Tracks the cooldown of a spell, mostly useful with profession based spells"
--Translation missing 
L["generating_database"] = "Generating the %s database..."
L["help_edt_1"] = "Puedes crear una nueva lista personalizada utilizando el botón %s."
L["help_edt_2"] = "Puedes eliminar la lista seleccionada utilizando el botón %s."
L["help_edt_3"] = "Este botón borra permanentemente la lista personalizada seleccionada actualmente."
L["help_edt_4"] = [=[Este es el grupo de misiones, puedes arrastrar cualquier misión de aquí y soltarla en la lista seleccionada actualmente.
- El botón %s borra permanentemente la búsqueda personalizada relativa del conjunto de misiones.
- El botón %s se utiliza para editar la búsqueda relativa |cff00ff00custom|r.]=]
L["help_edt_5"] = [=[Esta es la lista personalizada seleccionada
- Las misiones pueden colocarse con solo arrastrarlas.
- Pueden moverse un grupo de misiones utilizando los botones %s situados a la izquierda de la cabecera.
- El botón %s elimina la búsqueda relativa (todavía estará disponible en el grupo de misiones) o todo el grupo de la lista.
- El botón %s se utiliza para editar la búsqueda relativa |cff00ff00custom|r o cambiar el nombre del grupo relativo.
- El botón 'Nueva misión' crea una nueva misión en el grupo de misiones y la inserta en la ubicación del botón, lista para ser editada.
- El botón "Grupo nuevo" simplemente crea un nuevo grupo.]=]
L["help_edt_6"] = "Estos botones se utilizan para crear o eliminar páginas dentro de la lista seleccionada actualmente."
--Translation missing 
L["help_edt_7"] = "Here you can select which section of the quest you wish to modify."
--Translation missing 
L["help_edt_8"] = "This frame can be used to edit the chosen quest section."
--Translation missing 
L["help_edt_9"] = "Click Okay to save your changes, or Cancel to revert them."
L["hidden"] = "Oculto"
L["lclicktoopen"] = "Haga clic con el botón izquierdo para abrir el marco principal"
--Translation missing 
L["list_visibility"] = "List Visibility"
--Translation missing 
L["lists_limit"] = "Lists limit reached (%s)"
L["map_id"] = "ID de mapa"
--Translation missing 
L["map_options"] = "Map Options"
L["minimap_icons"] = "Iconos del minimapa"
L["move_down"] = "Mover selección abajo"
L["move_up"] = "Mover selección arriba"
L["namemissing"] = "<falta nombre>"
L["new_group"] = "Grupo nuevo"
L["new_page"] = "Página nueva"
--Translation missing 
L["new_quest"] = "New Quest"
L["newlist"] = "Lista nueva"
--Translation missing 
L["news_#1"] = "Hi! I'm your assistant and I will show you the most important news about Daily Global Check"
--Translation missing 
L["news_#10"] = [=[World map icons from adjacent and continent maps are now hidden by default.
There is a new option in the Map Options panel to restore them]=]
--Translation missing 
L["news_#11"] = "Want to save talent sets and change talents with a click? Check out my new addon, |cff00ff00Talent Set Manager|r!"
--Translation missing 
L["news_#2"] = "You can print the current DGC page output in the chatframe by typing '/dgc print'"
--Translation missing 
L["news_#3"] = "Daily Global Check can track Instance Lockouts since v1.3.5! The related plugin can be found on Curse"
--Translation missing 
L["news_#4"] = "Weekly follower and Herb/Mining node counters are available in the Daily Global Check_Professions plugin"
--Translation missing 
L["news_#5"] = "The Rare Mobs plugin, as of v1.3.2, has two specific options available in the Options->Plugin panel"
--Translation missing 
L["news_#6"] = "Check out |cff00ff00DailyGlobalCheck_Hallow's End|r if you're interested in tracking Hallow's End dailies and candy buckets"
--Translation missing 
L["news_#7"] = "|cff00ffffMay 2016|r - |cffAAAAAAv|cff00ff001.5|r - Daily Global Check got a massive technical overhaul in preparation for Legion. The older plugins are incompatible and they will also need to be updated to the newer version, apologies for the inconvenience :)"
--Translation missing 
L["news_#8"] = "Groups can be collapsed by clicking on their title in the main frame, collapsed groups are hidden in mouseovering views"
--Translation missing 
L["news_#9"] = "You can hide map icons for chosen pages of any list through its Plugin Options"
--Translation missing 
L["news_bottomtext1"] = "|cff11DDFFLeft-Click|cffFFFFFF: |cff00FF00Next"
--Translation missing 
L["news_bottomtext2"] = "|cff11DDFFRight-Click|cffFFFFFF: |cff00FF00Hide|r"
L["nextpage"] = "Página siguiente"
L["nolist"] = "Ninguna lista seleccionada"
L["notitle"] = "<sin título>"
L["opt_blacklist_remove"] = "Eliminar personaje de la lista negra"
L["opt_characters"] = "Personajes"
L["opt_characters_short"] = "(Alt)"
L["opt_help"] = "Ayuda"
L["opt_hidecompleted"] = "Ocultar misiones completadas"
L["opt_map_all"] = "Solo mostrar iconos de la lista seleccionada"
L["plugin_opt_none"] = "El complemento seleccionado no tiene opciones específicas"
L["plugin_opt_title"] = "Opciones para el complemento seleccionado:"
--Translation missing 
L["plugin_options"] = "Plugin Options"
L["prevpage"] = "Página anterior"
--Translation missing 
L["quest_options"] = "Quest Options"
L["questdatamissing"] = "<faltan datos de misión>"
L["questlog_quest_added"] = "|cff11DDFFDaily Global Check|r - Misión %s añadida al conjunto de misiones personalizadas."
--Translation missing 
L["quests_limit"] = "Quests limit reached (%s)"
L["questwindow"] = "- Seleccione la posición de la misión -"
L["rclicktoopen"] = "Haga clic con el botón derecho para abrir el menú de selección de listas rápidas"
L["rem"] = "Eliminar"
L["remmenuheader"] = "- Seleccione una misión para eliminar -"
--Translation missing 
L["repeatable"] = "Repeatable"
L["s_tomtomset"] = "|cff11DDFFDaily Global Check|r - Añadida ubicación al TomTom"
L["search_by_name"] = "Búsqueda por nombre"
L["show_adjacent_map_icons"] = "Mostrar mapas contiguos/Continentes"
L["shown"] = "Mostrado"
L["spell_id"] = "ID de Hechizo"
--Translation missing 
L["tools"] = "Tools"
L["worldmap_icons"] = "Iconos del minimapa"

-- Options
--Translation missing 
L["account_wide_options"] = "(Account-Wide Options)"
--Translation missing 
L["character_specific_options"] = "(Character-specific options)"
--Translation missing 
L["map_icons_visibility_list"] = "Map icons visibility for this List"
L["opt_coords"] = "Mostrar coordenadas"
L["opt_main"] = "Opciones"
L["opt_map"] = "Mostrar iconos del mapa"
L["opt_minimap"] = "Mostrar botón en minimapa"
--Translation missing 
L["opt_minimap_icons"] = "Show minimap icons"
L["opt_prefix"] = "Mostrar prefijo"
L["opt_questtype"] = "Mostrar tipo de misión"
L["opt_showquestbtn"] = "Mostrar el botón \"Añadir misión a la lista personalizada\" en el panel de registro"
L["opt_suffix"] = "Mostrar sufijo"
L["opt_zonename"] = "Mostrar zona"
--Translation missing 
L["plugin_mapicons"] = "World map icons for this Plugin"
--Translation missing 
L["plugin_mapicons_minimap"] = "Minimap icons for this Plugin"
--Translation missing 
L["size"] = "Size"
--Translation missing 
L["toggle_all_pages"] = "Toggle All Pages"
L["tomtom_button"] = "Establecer ubicaciones para TomTom"

elseif locale == "esMX" then 
-- General
--Translation missing 
L["add"] = "Add"
--Translation missing 
L["add_quest"] = "Add Quest"
--Translation missing 
L["addbtntooltip"] = "Add the selected quest to your Daily Global Check Custom List"
--Translation missing 
L["added"] = "added"
--Translation missing 
L["availablelists"] = "Available Lists"
--Translation missing 
L["b_prefix"] = "Prefix"
--Translation missing 
L["b_questid"] = "Quest ID"
--Translation missing 
L["b_questname"] = "Quest Name"
--Translation missing 
L["b_suffix"] = "Suffix"
--Translation missing 
L["bf_err1"] = "|cff11DDFFDaily Global Check|r - You need to enter either the quest ID and its name."
--Translation missing 
L["bf_err2"] = "|cff11DDFFDaily Global Check|r - This quest already exists."
--Translation missing 
L["blacklist"] = "Blacklist"
--Translation missing 
L["buildframe"] = "Modify Custom List"
--Translation missing 
L["chars_deleted"] = "|cff11DDFFDaily Global Check|r - Character |cff00FF00%s|r is now in the blacklist"
--Translation missing 
L["chars_restored"] = "|cff11DDFFDaily Global Check|r - Character |cff00FF00%s|r has been removed from the blacklist"
--Translation missing 
L["classic"] = "Classic"
--Translation missing 
L["collapsed"] = "Collapsed"
--Translation missing 
L["coordinates"] = "Coordinates"
--Translation missing 
L["create_new_list"] = "Create a new list"
--Translation missing 
L["currency_id"] = "Currency ID"
--Translation missing 
L["customlist"] = "Custom List"
--Translation missing 
L["del_page"] = "Delete Page"
--Translation missing 
L["delete_list"] = "Delete List"
--Translation missing 
L["deleted"] = "deleted"
--Translation missing 
L["edit_mode"] = "Edit Mode"
--Translation missing 
L["edit_quest"] = "Edit Quest"
--Translation missing 
L["edit_questID_info"] = [=[You can insert multiple quest IDs each separated by one of the following keywords:
 %s : this element will result complete if at least one of the quests is completed.
 %s : this element will result complete only when all the quests are completed.]=]
--Translation missing 
L["edit_spell_info"] = "Tracks the cooldown of a spell, mostly useful with profession based spells"
--Translation missing 
L["generating_database"] = "Generating the %s database..."
--Translation missing 
L["help_edt_1"] = "You can create a new custom list by using the %s button."
--Translation missing 
L["help_edt_2"] = "You can rename the selected list by using the %s button."
--Translation missing 
L["help_edt_3"] = "This button permanently deletes the currently selected custom list."
--Translation missing 
L["help_edt_4"] = [=[This is the quest pool, you can drag any quest from here and drop it on the currently selected list.
- The %s button permanently deletes the relative custom quest from the quest pool.
- The %s button is used to edit the relative |cff00ff00custom|r quest.]=]
--Translation missing 
L["help_edt_5"] = [=[This is the selected custom list
- Quests can be repositioned by simply dragging them.
- A group of quests can be moved by using the %s buttons at the header's left.
- The %s button deletes the relative quest (it will still be available in the quest pool) or entire group from the list.
- The %s button is used to edit the relative |cff00ff00custom|r quest or rename the relative group.
- The 'New Quest' button creates a new quest in the quest pool and inserts it at the button's location, ready to be edited.
- The 'New Group' button simply creates a new group.]=]
--Translation missing 
L["help_edt_6"] = "These buttons are used to create or delete pages within the currently selected list."
--Translation missing 
L["help_edt_7"] = "Here you can select which section of the quest you wish to modify."
--Translation missing 
L["help_edt_8"] = "This frame can be used to edit the chosen quest section."
--Translation missing 
L["help_edt_9"] = "Click Okay to save your changes, or Cancel to revert them."
--Translation missing 
L["hidden"] = "Hidden"
--Translation missing 
L["lclicktoopen"] = "Left-click to open the main frame"
--Translation missing 
L["list_visibility"] = "List Visibility"
--Translation missing 
L["lists_limit"] = "Lists limit reached (%s)"
--Translation missing 
L["map_id"] = "Map ID"
--Translation missing 
L["map_options"] = "Map Options"
--Translation missing 
L["minimap_icons"] = "Minimap Icons"
--Translation missing 
L["move_down"] = "Move Selection Down"
--Translation missing 
L["move_up"] = "Move Selection Up"
--Translation missing 
L["namemissing"] = "<name missing>"
--Translation missing 
L["new_group"] = "New Group"
--Translation missing 
L["new_page"] = "New Page"
--Translation missing 
L["new_quest"] = "New Quest"
--Translation missing 
L["newlist"] = "New List"
--Translation missing 
L["news_#1"] = "Hi! I'm your assistant and I will show you the most important news about Daily Global Check"
--Translation missing 
L["news_#10"] = [=[World map icons from adjacent and continent maps are now hidden by default.
There is a new option in the Map Options panel to restore them]=]
--Translation missing 
L["news_#11"] = "Want to save talent sets and change talents with a click? Check out my new addon, |cff00ff00Talent Set Manager|r!"
--Translation missing 
L["news_#2"] = "You can print the current DGC page output in the chatframe by typing '/dgc print'"
--Translation missing 
L["news_#3"] = "Daily Global Check can track Instance Lockouts since v1.3.5! The related plugin can be found on Curse"
--Translation missing 
L["news_#4"] = "Weekly follower and Herb/Mining node counters are available in the Daily Global Check_Professions plugin"
--Translation missing 
L["news_#5"] = "The Rare Mobs plugin, as of v1.3.2, has two specific options available in the Options->Plugin panel"
--Translation missing 
L["news_#6"] = "Check out |cff00ff00DailyGlobalCheck_Hallow's End|r if you're interested in tracking Hallow's End dailies and candy buckets"
--Translation missing 
L["news_#7"] = "|cff00ffffMay 2016|r - |cffAAAAAAv|cff00ff001.5|r - Daily Global Check got a massive technical overhaul in preparation for Legion. The older plugins are incompatible and they will also need to be updated to the newer version, apologies for the inconvenience :)"
--Translation missing 
L["news_#8"] = "Groups can be collapsed by clicking on their title in the main frame, collapsed groups are hidden in mouseovering views"
--Translation missing 
L["news_#9"] = "You can hide map icons for chosen pages of any list through its Plugin Options"
--Translation missing 
L["news_bottomtext1"] = "|cff11DDFFLeft-Click|cffFFFFFF: |cff00FF00Next"
--Translation missing 
L["news_bottomtext2"] = "|cff11DDFFRight-Click|cffFFFFFF: |cff00FF00Hide|r"
--Translation missing 
L["nextpage"] = "Next Page"
--Translation missing 
L["nolist"] = "No list selected"
--Translation missing 
L["notitle"] = "<no title>"
--Translation missing 
L["opt_blacklist_remove"] = "Remove a character from the black list"
--Translation missing 
L["opt_characters"] = "Characters"
--Translation missing 
L["opt_characters_short"] = "(Alt)"
--Translation missing 
L["opt_help"] = "Help"
--Translation missing 
L["opt_hidecompleted"] = "Hide completed quests"
--Translation missing 
L["opt_map_all"] = "Only show world map icons from selected list"
--Translation missing 
L["plugin_opt_none"] = "The selected plugin doesn't have any specific options"
--Translation missing 
L["plugin_opt_title"] = "Options for the selected plugin:"
--Translation missing 
L["plugin_options"] = "Plugin Options"
--Translation missing 
L["prevpage"] = "Previous Page"
--Translation missing 
L["quest_options"] = "Quest Options"
--Translation missing 
L["questdatamissing"] = "<quest data missing>"
--Translation missing 
L["questlog_quest_added"] = "|cff11DDFFDaily Global Check|r - Quest %s added to the custom quests pool."
--Translation missing 
L["quests_limit"] = "Quests limit reached (%s)"
--Translation missing 
L["questwindow"] = "- Select quest position -"
--Translation missing 
L["rclicktoopen"] = "Right-click to open the quick list selection menu"
--Translation missing 
L["rem"] = "Remove"
--Translation missing 
L["remmenuheader"] = "- Select the quest to remove -"
--Translation missing 
L["repeatable"] = "Repeatable"
--Translation missing 
L["s_tomtomset"] = "|cff11DDFFDaily Global Check|r - Waypoint added to TomTom"
--Translation missing 
L["search_by_name"] = "Search by name"
--Translation missing 
L["show_adjacent_map_icons"] = "Show on adjacent/continent maps"
--Translation missing 
L["shown"] = "Shown"
--Translation missing 
L["spell_id"] = "Spell ID"
--Translation missing 
L["tools"] = "Tools"
--Translation missing 
L["worldmap_icons"] = "Worldmap Icons"

-- Options
--Translation missing 
L["account_wide_options"] = "(Account-Wide Options)"
--Translation missing 
L["character_specific_options"] = "(Character-specific options)"
--Translation missing 
L["map_icons_visibility_list"] = "Map icons visibility for this List"
--Translation missing 
L["opt_coords"] = "Show coordinates"
--Translation missing 
L["opt_main"] = "Options"
--Translation missing 
L["opt_map"] = "Show world map icons"
--Translation missing 
L["opt_minimap"] = "Show minimap button"
--Translation missing 
L["opt_minimap_icons"] = "Show minimap icons"
--Translation missing 
L["opt_prefix"] = "Show prefix"
--Translation missing 
L["opt_questtype"] = "Show quest type"
--Translation missing 
L["opt_showquestbtn"] = "Show the 'Add quest to Custom List' button in the Quest Log Frame"
--Translation missing 
L["opt_suffix"] = "Show suffix"
--Translation missing 
L["opt_zonename"] = "Show zone name"
--Translation missing 
L["plugin_mapicons"] = "World map icons for this Plugin"
--Translation missing 
L["plugin_mapicons_minimap"] = "Minimap icons for this Plugin"
--Translation missing 
L["size"] = "Size"
--Translation missing 
L["toggle_all_pages"] = "Toggle All Pages"
--Translation missing 
L["tomtom_button"] = "Set TomTom waypoints"

elseif locale == "itIT" then 
-- General
L["add"] = "Aggiungi"
L["add_quest"] = "Aggiungi Quest"
L["addbtntooltip"] = "Aggiungi la quest selezionata alla tua Lista Personalizzata di Daily Global Check"
L["added"] = "aggiunto"
L["availablelists"] = "Liste Disponibili"
L["b_prefix"] = "Prefisso (opzionale)"
L["b_questid"] = "Quest ID"
L["b_questname"] = "Nome Quest"
L["b_suffix"] = "Suffisso (opzionale)"
L["bf_err1"] = "|cff11DDFFDaily Global Check|r - Devi inserire l'ID e il nome della quest"
L["bf_err2"] = "|cff11DDFFDaily Global Check|r - La quest e' gia' in lista."
L["blacklist"] = "Lista nera"
L["buildframe"] = "Modifica Lista Personalizzata"
L["chars_deleted"] = "|cff11DDFFDaily Global Check|r - Il personaggio |cff00FF00%s|r è ora nella lista nera"
L["chars_restored"] = "|cff11DDFFDaily Global Check|r - Il personaggio |cff00FF00%s|r è stato rimosso dalla lista nera"
L["classic"] = "Classica"
L["collapsed"] = "Ridotto"
L["coordinates"] = "Coordinate"
L["create_new_list"] = "Crea una nuova lista"
--Translation missing 
L["currency_id"] = "Currency ID"
L["customlist"] = "Lista Personalizzata"
L["del_page"] = "Elimina Pagina"
L["delete_list"] = "Elimina lista"
L["deleted"] = "eliminato"
L["edit_mode"] = "Edit Mode"
L["edit_quest"] = "Modifica Quest"
L["edit_questID_info"] = "Puoi inserire più quest ID separati da una delle seguenti parole chiave:\\n %s : questo elemento risulterà completo se almeno una delle quest è completata.\\n %s : questo elemento risulterà completo solo se tutte le quest sono completate."
L["edit_spell_info"] = "Tiene traccia del tempo di recupero di un incantesimo, maggiormente utili con incantesimi di professioni"
L["generating_database"] = "Generazione del database di %s..."
L["help_edt_1"] = "Puoi creare una nuova lista personalizzata usando il pulsante %s"
L["help_edt_2"] = "Puoi rinominare la lista selezionata usando il pulsante %s"
L["help_edt_3"] = "Questo pulsante elimina in modo permanente la lista selezionata."
L["help_edt_4"] = "Questo è il database delle quest, puoi trascinare qualsiasi quest da quì e inserirla nella lista selezionata.\\n- Il pulsante %s elimina in modo permanente la quest dal database.\\n- Il pulsante %s è usato per modificare la quest |cff00ff00personalizzata|r relativa."
--Translation missing 
L["help_edt_5"] = [=[This is the selected custom list
- Quests can be repositioned by simply dragging them.
- A group of quests can be moved by using the %s buttons at the header's left.
- The %s button deletes the relative quest (it will still be available in the quest pool) or entire group from the list.
- The %s button is used to edit the relative |cff00ff00custom|r quest or rename the relative group.
- The 'New Quest' button creates a new quest in the quest pool and inserts it at the button's location, ready to be edited.
- The 'New Group' button simply creates a new group.]=]
L["help_edt_6"] = "Questi pulsanti servono a creare o eliminare pagine nella lista selezionata."
L["help_edt_7"] = "Qui puoi selezionare quale sezione della quest modificare."
L["help_edt_8"] = "Questo pannello può essere utilizzato per modificare la sezione di quest selezionata."
L["help_edt_9"] = "Clicca OK per salvare le modifiche, o Annulla per annullarle."
--Translation missing 
L["hidden"] = "Hidden"
L["lclicktoopen"] = "Click sinistro per aprire il frame principale"
L["list_visibility"] = "Visibilità Liste"
L["lists_limit"] = "Limite delle liste raggiunto (%s)"
--Translation missing 
L["map_id"] = "Map ID"
L["map_options"] = "Opzioni Mappa"
--Translation missing 
L["minimap_icons"] = "Minimap Icons"
L["move_down"] = "Sposta Selezione Giù"
L["move_up"] = "Sposta Selezione Su"
L["namemissing"] = "<nome mancante>"
L["new_group"] = "Nuovo Gruppo"
L["new_page"] = "Nuova Pagina"
L["new_quest"] = "Nuova Quest"
L["newlist"] = "Nuova Lista"
L["news_#1"] = "Ciao! Sono il tuo assistente e ti mostrerò le novità più importanti riguardo Daily Global Check"
--Translation missing 
L["news_#10"] = [=[World map icons from adjacent and continent maps are now hidden by default.
There is a new option in the Map Options panel to restore them]=]
--Translation missing 
L["news_#11"] = "Want to save talent sets and change talents with a click? Check out my new addon, |cff00ff00Talent Set Manager|r!"
L["news_#2"] = "Puoi stampare la pagina corrente di DGC in chat digitando '/dgc print'"
--Translation missing 
L["news_#3"] = "Daily Global Check can track Instance Lockouts since v1.3.5! The related plugin can be found on Curse"
--Translation missing 
L["news_#4"] = "Weekly follower and Herb/Mining node counters are available in the Daily Global Check_Professions plugin"
--Translation missing 
L["news_#5"] = "The Rare Mobs plugin, as of v1.3.2, has two specific options available in the Options->Plugin panel"
--Translation missing 
L["news_#6"] = "Check out |cff00ff00DailyGlobalCheck_Hallow's End|r if you're interested in tracking Hallow's End dailies and candy buckets"
L["news_#7"] = "|cff00ffffMaggio 2016|r - |cffAAAAAAv|cff00ff001.5|r - Daily Global Check ha ricevuto una massiccia revisione tecnica in preparazione per Legion. Le vecchie plugin sono incompatibili e devono essere aggiornate alla versione più recente, mi scuso per il disagio :)"
L["news_#8"] = "I gruppi possono essere ridotti cliccando sul loro titolo nel pannello principale, i gruppi ridotti sono nascosti nelle visualizzazioni tramite cursore"
L["news_#9"] = "Puoi nascondere le icone della mappa per pagine a scelta di qualunque lista tramite le sue Opzioni Plugin"
L["news_bottomtext1"] = "|cff11DDFFClick-Sinistro|cffFFFFFF: |cff00FF00Prossimo"
L["news_bottomtext2"] = "|cff11DDFFClick-Destro|cffFFFFFF: |cff00FF00Nascondi|r"
L["nextpage"] = "Pagina successiva"
L["nolist"] = "Nessuna lista selezionata"
L["notitle"] = "<nessun titolo>"
L["opt_blacklist_remove"] = "Rimuovi un personaggio dalla lista nera"
L["opt_characters"] = "Personaggi"
L["opt_characters_short"] = "(Alt)"
L["opt_help"] = "Aiuto"
L["opt_hidecompleted"] = "Nascondi quest completate"
L["opt_map_all"] = "Mostra solo le icone della mappa dalla lista selezionata"
L["plugin_opt_none"] = "Il plugin selezionato non ha opzioni specifiche"
L["plugin_opt_title"] = "Opzioni per il plugin selezionato:"
L["plugin_options"] = "Opzioni Plugin"
L["prevpage"] = "Pagina precedente"
L["quest_options"] = "Opzioni Quest"
L["questdatamissing"] = "<dati quest mancanti>"
L["questlog_quest_added"] = "|cff11DDFFDaily Global Check|r - Quest %s aggiunta."
L["quests_limit"] = "Limite Quest raggiunto (%s)"
L["questwindow"] = "- Seleziona la posizione -"
L["rclicktoopen"] = "Click destro per aprire il menù di selezione rapida"
L["rem"] = "Rimuovi"
L["remmenuheader"] = "- Seleziona la quest da eliminare -"
L["repeatable"] = "Ripetibile"
L["s_tomtomset"] = "|cff11DDFFDaily Global Check|r - Waypoint aggiunto a TomTom"
--Translation missing 
L["search_by_name"] = "Search by name"
--Translation missing 
L["show_adjacent_map_icons"] = "Show on adjacent/continent maps"
--Translation missing 
L["shown"] = "Shown"
--Translation missing 
L["spell_id"] = "Spell ID"
L["tools"] = "Strumenti"
--Translation missing 
L["worldmap_icons"] = "Worldmap Icons"

-- Options
L["account_wide_options"] = "(Opzioni Account-Wide)"
L["character_specific_options"] = "(Opzioni del personaggio)"
L["map_icons_visibility_list"] = "Visibilità delle icone della mappa per questa Lista"
L["opt_coords"] = "Mostra coordinate"
L["opt_main"] = "Opzioni"
L["opt_map"] = "Mostra icone sulla mappa globale"
L["opt_minimap"] = "Mostra pulsante sulla minimappa"
--Translation missing 
L["opt_minimap_icons"] = "Show minimap icons"
L["opt_prefix"] = "Mostra prefisso"
L["opt_questtype"] = "Mostra tipo di quest"
L["opt_showquestbtn"] = "Mostra il pulsante 'Aggiungi quest alla Lista Personalizzata' nel registro missioni"
L["opt_suffix"] = "Mostra suffisso"
L["opt_zonename"] = "Mostra nome della zona"
--Translation missing 
L["plugin_mapicons"] = "World map icons for this Plugin"
--Translation missing 
L["plugin_mapicons_minimap"] = "Minimap icons for this Plugin"
L["size"] = "Dimensioni"
--Translation missing 
L["toggle_all_pages"] = "Toggle All Pages"
L["tomtom_button"] = "Imposta waypoints su TomTom"

elseif locale == "ptBR" then 
-- General
--Translation missing 
L["add"] = "Add"
--Translation missing 
L["add_quest"] = "Add Quest"
--Translation missing 
L["addbtntooltip"] = "Add the selected quest to your Daily Global Check Custom List"
--Translation missing 
L["added"] = "added"
--Translation missing 
L["availablelists"] = "Available Lists"
--Translation missing 
L["b_prefix"] = "Prefix"
--Translation missing 
L["b_questid"] = "Quest ID"
--Translation missing 
L["b_questname"] = "Quest Name"
--Translation missing 
L["b_suffix"] = "Suffix"
--Translation missing 
L["bf_err1"] = "|cff11DDFFDaily Global Check|r - You need to enter either the quest ID and its name."
--Translation missing 
L["bf_err2"] = "|cff11DDFFDaily Global Check|r - This quest already exists."
--Translation missing 
L["blacklist"] = "Blacklist"
--Translation missing 
L["buildframe"] = "Modify Custom List"
--Translation missing 
L["chars_deleted"] = "|cff11DDFFDaily Global Check|r - Character |cff00FF00%s|r is now in the blacklist"
--Translation missing 
L["chars_restored"] = "|cff11DDFFDaily Global Check|r - Character |cff00FF00%s|r has been removed from the blacklist"
--Translation missing 
L["classic"] = "Classic"
--Translation missing 
L["collapsed"] = "Collapsed"
--Translation missing 
L["coordinates"] = "Coordinates"
--Translation missing 
L["create_new_list"] = "Create a new list"
--Translation missing 
L["currency_id"] = "Currency ID"
--Translation missing 
L["customlist"] = "Custom List"
--Translation missing 
L["del_page"] = "Delete Page"
--Translation missing 
L["delete_list"] = "Delete List"
--Translation missing 
L["deleted"] = "deleted"
--Translation missing 
L["edit_mode"] = "Edit Mode"
--Translation missing 
L["edit_quest"] = "Edit Quest"
--Translation missing 
L["edit_questID_info"] = [=[You can insert multiple quest IDs each separated by one of the following keywords:
 %s : this element will result complete if at least one of the quests is completed.
 %s : this element will result complete only when all the quests are completed.]=]
--Translation missing 
L["edit_spell_info"] = "Tracks the cooldown of a spell, mostly useful with profession based spells"
--Translation missing 
L["generating_database"] = "Generating the %s database..."
--Translation missing 
L["help_edt_1"] = "You can create a new custom list by using the %s button."
--Translation missing 
L["help_edt_2"] = "You can rename the selected list by using the %s button."
--Translation missing 
L["help_edt_3"] = "This button permanently deletes the currently selected custom list."
--Translation missing 
L["help_edt_4"] = [=[This is the quest pool, you can drag any quest from here and drop it on the currently selected list.
- The %s button permanently deletes the relative custom quest from the quest pool.
- The %s button is used to edit the relative |cff00ff00custom|r quest.]=]
--Translation missing 
L["help_edt_5"] = [=[This is the selected custom list
- Quests can be repositioned by simply dragging them.
- A group of quests can be moved by using the %s buttons at the header's left.
- The %s button deletes the relative quest (it will still be available in the quest pool) or entire group from the list.
- The %s button is used to edit the relative |cff00ff00custom|r quest or rename the relative group.
- The 'New Quest' button creates a new quest in the quest pool and inserts it at the button's location, ready to be edited.
- The 'New Group' button simply creates a new group.]=]
--Translation missing 
L["help_edt_6"] = "These buttons are used to create or delete pages within the currently selected list."
--Translation missing 
L["help_edt_7"] = "Here you can select which section of the quest you wish to modify."
--Translation missing 
L["help_edt_8"] = "This frame can be used to edit the chosen quest section."
--Translation missing 
L["help_edt_9"] = "Click Okay to save your changes, or Cancel to revert them."
--Translation missing 
L["hidden"] = "Hidden"
--Translation missing 
L["lclicktoopen"] = "Left-click to open the main frame"
--Translation missing 
L["list_visibility"] = "List Visibility"
--Translation missing 
L["lists_limit"] = "Lists limit reached (%s)"
--Translation missing 
L["map_id"] = "Map ID"
--Translation missing 
L["map_options"] = "Map Options"
--Translation missing 
L["minimap_icons"] = "Minimap Icons"
--Translation missing 
L["move_down"] = "Move Selection Down"
--Translation missing 
L["move_up"] = "Move Selection Up"
--Translation missing 
L["namemissing"] = "<name missing>"
--Translation missing 
L["new_group"] = "New Group"
--Translation missing 
L["new_page"] = "New Page"
--Translation missing 
L["new_quest"] = "New Quest"
--Translation missing 
L["newlist"] = "New List"
--Translation missing 
L["news_#1"] = "Hi! I'm your assistant and I will show you the most important news about Daily Global Check"
--Translation missing 
L["news_#10"] = [=[World map icons from adjacent and continent maps are now hidden by default.
There is a new option in the Map Options panel to restore them]=]
--Translation missing 
L["news_#11"] = "Want to save talent sets and change talents with a click? Check out my new addon, |cff00ff00Talent Set Manager|r!"
--Translation missing 
L["news_#2"] = "You can print the current DGC page output in the chatframe by typing '/dgc print'"
--Translation missing 
L["news_#3"] = "Daily Global Check can track Instance Lockouts since v1.3.5! The related plugin can be found on Curse"
--Translation missing 
L["news_#4"] = "Weekly follower and Herb/Mining node counters are available in the Daily Global Check_Professions plugin"
--Translation missing 
L["news_#5"] = "The Rare Mobs plugin, as of v1.3.2, has two specific options available in the Options->Plugin panel"
--Translation missing 
L["news_#6"] = "Check out |cff00ff00DailyGlobalCheck_Hallow's End|r if you're interested in tracking Hallow's End dailies and candy buckets"
--Translation missing 
L["news_#7"] = "|cff00ffffMay 2016|r - |cffAAAAAAv|cff00ff001.5|r - Daily Global Check got a massive technical overhaul in preparation for Legion. The older plugins are incompatible and they will also need to be updated to the newer version, apologies for the inconvenience :)"
--Translation missing 
L["news_#8"] = "Groups can be collapsed by clicking on their title in the main frame, collapsed groups are hidden in mouseovering views"
--Translation missing 
L["news_#9"] = "You can hide map icons for chosen pages of any list through its Plugin Options"
--Translation missing 
L["news_bottomtext1"] = "|cff11DDFFLeft-Click|cffFFFFFF: |cff00FF00Next"
--Translation missing 
L["news_bottomtext2"] = "|cff11DDFFRight-Click|cffFFFFFF: |cff00FF00Hide|r"
--Translation missing 
L["nextpage"] = "Next Page"
--Translation missing 
L["nolist"] = "No list selected"
--Translation missing 
L["notitle"] = "<no title>"
--Translation missing 
L["opt_blacklist_remove"] = "Remove a character from the black list"
--Translation missing 
L["opt_characters"] = "Characters"
--Translation missing 
L["opt_characters_short"] = "(Alt)"
--Translation missing 
L["opt_help"] = "Help"
--Translation missing 
L["opt_hidecompleted"] = "Hide completed quests"
--Translation missing 
L["opt_map_all"] = "Only show world map icons from selected list"
--Translation missing 
L["plugin_opt_none"] = "The selected plugin doesn't have any specific options"
--Translation missing 
L["plugin_opt_title"] = "Options for the selected plugin:"
--Translation missing 
L["plugin_options"] = "Plugin Options"
--Translation missing 
L["prevpage"] = "Previous Page"
--Translation missing 
L["quest_options"] = "Quest Options"
--Translation missing 
L["questdatamissing"] = "<quest data missing>"
--Translation missing 
L["questlog_quest_added"] = "|cff11DDFFDaily Global Check|r - Quest %s added to the custom quests pool."
--Translation missing 
L["quests_limit"] = "Quests limit reached (%s)"
--Translation missing 
L["questwindow"] = "- Select quest position -"
--Translation missing 
L["rclicktoopen"] = "Right-click to open the quick list selection menu"
--Translation missing 
L["rem"] = "Remove"
--Translation missing 
L["remmenuheader"] = "- Select the quest to remove -"
--Translation missing 
L["repeatable"] = "Repeatable"
--Translation missing 
L["s_tomtomset"] = "|cff11DDFFDaily Global Check|r - Waypoint added to TomTom"
--Translation missing 
L["search_by_name"] = "Search by name"
--Translation missing 
L["show_adjacent_map_icons"] = "Show on adjacent/continent maps"
--Translation missing 
L["shown"] = "Shown"
--Translation missing 
L["spell_id"] = "Spell ID"
--Translation missing 
L["tools"] = "Tools"
--Translation missing 
L["worldmap_icons"] = "Worldmap Icons"

-- Options
--Translation missing 
L["account_wide_options"] = "(Account-Wide Options)"
--Translation missing 
L["character_specific_options"] = "(Character-specific options)"
--Translation missing 
L["map_icons_visibility_list"] = "Map icons visibility for this List"
--Translation missing 
L["opt_coords"] = "Show coordinates"
--Translation missing 
L["opt_main"] = "Options"
--Translation missing 
L["opt_map"] = "Show world map icons"
--Translation missing 
L["opt_minimap"] = "Show minimap button"
--Translation missing 
L["opt_minimap_icons"] = "Show minimap icons"
--Translation missing 
L["opt_prefix"] = "Show prefix"
--Translation missing 
L["opt_questtype"] = "Show quest type"
--Translation missing 
L["opt_showquestbtn"] = "Show the 'Add quest to Custom List' button in the Quest Log Frame"
--Translation missing 
L["opt_suffix"] = "Show suffix"
--Translation missing 
L["opt_zonename"] = "Show zone name"
--Translation missing 
L["plugin_mapicons"] = "World map icons for this Plugin"
--Translation missing 
L["plugin_mapicons_minimap"] = "Minimap icons for this Plugin"
--Translation missing 
L["size"] = "Size"
--Translation missing 
L["toggle_all_pages"] = "Toggle All Pages"
--Translation missing 
L["tomtom_button"] = "Set TomTom waypoints"

elseif locale == "frFR" then
-- General
L["add"] = "Ajouter"
--Translation missing 
L["add_quest"] = "Add Quest"
L["addbtntooltip"] = "Ajouter la quête sélectionnée à votre liste personnelle de Daily Global Check "
L["added"] = "ajoutée"
L["availablelists"] = "Listes disponibles"
L["b_prefix"] = "Préfix (optionnel)"
L["b_questid"] = "ID de la quête"
L["b_questname"] = "Nom de la quête"
L["b_suffix"] = "Suffix (optionnel)"
L["bf_err1"] = "|cff11DDFFDaily Global Check|r - Vous devez entrer l'ID de la quête et son nom."
L["bf_err2"] = "|cff11DDFFDaily Global Check|r - Cette quête est déjà présente dans la liste."
--Translation missing 
L["blacklist"] = "Blacklist"
L["buildframe"] = "Modifier la liste personnelle"
L["chars_deleted"] = "|cff11DDFFDaily Global Check|r - Personnage |cff00FF00%s|r dans la liste des exclus"
L["chars_restored"] = "|cff11DDFFDaily Global Check|r - Personnage |cff00FF00%s|r retiré de la liste des exclus"
--Translation missing 
L["classic"] = "Classic"
--Translation missing 
L["collapsed"] = "Collapsed"
--Translation missing 
L["coordinates"] = "Coordinates"
--Translation missing 
L["create_new_list"] = "Create a new list"
--Translation missing 
L["currency_id"] = "Currency ID"
L["customlist"] = "Liste personnelle"
--Translation missing 
L["del_page"] = "Delete Page"
--Translation missing 
L["delete_list"] = "Delete List"
L["deleted"] = "supprimée"
--Translation missing 
L["edit_mode"] = "Edit Mode"
--Translation missing 
L["edit_quest"] = "Edit Quest"
--Translation missing 
L["edit_questID_info"] = [=[You can insert multiple quest IDs each separated by one of the following keywords:
 %s : this element will result complete if at least one of the quests is completed.
 %s : this element will result complete only when all the quests are completed.]=]
--Translation missing 
L["edit_spell_info"] = "Tracks the cooldown of a spell, mostly useful with profession based spells"
--Translation missing 
L["generating_database"] = "Generating the %s database..."
--Translation missing 
L["help_edt_1"] = "You can create a new custom list by using the %s button."
--Translation missing 
L["help_edt_2"] = "You can rename the selected list by using the %s button."
--Translation missing 
L["help_edt_3"] = "This button permanently deletes the currently selected custom list."
--Translation missing 
L["help_edt_4"] = [=[This is the quest pool, you can drag any quest from here and drop it on the currently selected list.
- The %s button permanently deletes the relative custom quest from the quest pool.
- The %s button is used to edit the relative |cff00ff00custom|r quest.]=]
--Translation missing 
L["help_edt_5"] = [=[This is the selected custom list
- Quests can be repositioned by simply dragging them.
- A group of quests can be moved by using the %s buttons at the header's left.
- The %s button deletes the relative quest (it will still be available in the quest pool) or entire group from the list.
- The %s button is used to edit the relative |cff00ff00custom|r quest or rename the relative group.
- The 'New Quest' button creates a new quest in the quest pool and inserts it at the button's location, ready to be edited.
- The 'New Group' button simply creates a new group.]=]
--Translation missing 
L["help_edt_6"] = "These buttons are used to create or delete pages within the currently selected list."
--Translation missing 
L["help_edt_7"] = "Here you can select which section of the quest you wish to modify."
--Translation missing 
L["help_edt_8"] = "This frame can be used to edit the chosen quest section."
--Translation missing 
L["help_edt_9"] = "Click Okay to save your changes, or Cancel to revert them."
--Translation missing 
L["hidden"] = "Hidden"
L["lclicktoopen"] = "Click gauche pour ouvrir la fenêtre principale"
--Translation missing 
L["list_visibility"] = "List Visibility"
--Translation missing 
L["lists_limit"] = "Lists limit reached (%s)"
--Translation missing 
L["map_id"] = "Map ID"
--Translation missing 
L["map_options"] = "Map Options"
--Translation missing 
L["minimap_icons"] = "Minimap Icons"
--Translation missing 
L["move_down"] = "Move Selection Down"
--Translation missing 
L["move_up"] = "Move Selection Up"
L["namemissing"] = "<nom manquant>"
--Translation missing 
L["new_group"] = "New Group"
--Translation missing 
L["new_page"] = "New Page"
--Translation missing 
L["new_quest"] = "New Quest"
--Translation missing 
L["newlist"] = "New List"
--Translation missing 
L["news_#1"] = "Hi! I'm your assistant and I will show you the most important news about Daily Global Check"
--Translation missing 
L["news_#10"] = [=[World map icons from adjacent and continent maps are now hidden by default.
There is a new option in the Map Options panel to restore them]=]
--Translation missing 
L["news_#11"] = "Want to save talent sets and change talents with a click? Check out my new addon, |cff00ff00Talent Set Manager|r!"
--Translation missing 
L["news_#2"] = "You can print the current DGC page output in the chatframe by typing '/dgc print'"
--Translation missing 
L["news_#3"] = "Daily Global Check can track Instance Lockouts since v1.3.5! The related plugin can be found on Curse"
--Translation missing 
L["news_#4"] = "Weekly follower and Herb/Mining node counters are available in the Daily Global Check_Professions plugin"
--Translation missing 
L["news_#5"] = "The Rare Mobs plugin, as of v1.3.2, has two specific options available in the Options->Plugin panel"
--Translation missing 
L["news_#6"] = "Check out |cff00ff00DailyGlobalCheck_Hallow's End|r if you're interested in tracking Hallow's End dailies and candy buckets"
--Translation missing 
L["news_#7"] = "|cff00ffffMay 2016|r - |cffAAAAAAv|cff00ff001.5|r - Daily Global Check got a massive technical overhaul in preparation for Legion. The older plugins are incompatible and they will also need to be updated to the newer version, apologies for the inconvenience :)"
--Translation missing 
L["news_#8"] = "Groups can be collapsed by clicking on their title in the main frame, collapsed groups are hidden in mouseovering views"
--Translation missing 
L["news_#9"] = "You can hide map icons for chosen pages of any list through its Plugin Options"
--Translation missing 
L["news_bottomtext1"] = "|cff11DDFFLeft-Click|cffFFFFFF: |cff00FF00Next"
--Translation missing 
L["news_bottomtext2"] = "|cff11DDFFRight-Click|cffFFFFFF: |cff00FF00Hide|r"
L["nextpage"] = "page suivante"
L["nolist"] = "Aucune liste sélectionnée"
L["notitle"] = "<sans titre>"
L["opt_blacklist_remove"] = "retirer un personnage de la liste des exclus"
L["opt_characters"] = "personnages"
L["opt_characters_short"] = "(Alt)"
L["opt_help"] = "Aide"
L["opt_hidecompleted"] = "Cacher les quêtes achevées"
L["opt_map_all"] = "Afficher seulement les icônes des listes sélectionnées"
L["plugin_opt_none"] = "Le Plugin sélectionné n'as pas d'options spécifiques"
L["plugin_opt_title"] = "Options pour le plugin sélectionné"
--Translation missing 
L["plugin_options"] = "Plugin Options"
L["prevpage"] = "Page précédente"
--Translation missing 
L["quest_options"] = "Quest Options"
L["questdatamissing"] = "<données de la quête manquantes>"
--Translation missing 
L["questlog_quest_added"] = "|cff11DDFFDaily Global Check|r - Quest %s added to the custom quests pool."
--Translation missing 
L["quests_limit"] = "Quests limit reached (%s)"
L["questwindow"] = "- Sélectionnez la position de la quête -"
L["rclicktoopen"] = "Click droite pour ouvrir le menu de sélection des listes rapides"
L["rem"] = "Supprimer"
L["remmenuheader"] = "- Sélectionnez la quête à supprimer -"
--Translation missing 
L["repeatable"] = "Repeatable"
L["s_tomtomset"] = "|cff11DDFFDaily Global Check|r - Chemin ajouté à TomTom"
--Translation missing 
L["search_by_name"] = "Search by name"
--Translation missing 
L["show_adjacent_map_icons"] = "Show on adjacent/continent maps"
--Translation missing 
L["shown"] = "Shown"
--Translation missing 
L["spell_id"] = "Spell ID"
--Translation missing 
L["tools"] = "Tools"
--Translation missing 
L["worldmap_icons"] = "Worldmap Icons"

-- Options
--Translation missing 
L["account_wide_options"] = "(Account-Wide Options)"
--Translation missing 
L["character_specific_options"] = "(Character-specific options)"
--Translation missing 
L["map_icons_visibility_list"] = "Map icons visibility for this List"
L["opt_coords"] = "Voir les coordonnées"
L["opt_main"] = "Options"
L["opt_map"] = "Voir les icônes sur la carte du monde"
L["opt_minimap"] = "Voir l'icône sur la minimap"
--Translation missing 
L["opt_minimap_icons"] = "Show minimap icons"
L["opt_prefix"] = "Voir le préfix"
L["opt_questtype"] = "Voir le type de quête"
L["opt_showquestbtn"] = "Voir le bouton \"Ajouter la quête à votre liste personnelle\" dans la fenêtre du journal des quêtes"
L["opt_suffix"] = "Voir le suffix"
L["opt_zonename"] = "Voir le nom de la zone"
--Translation missing 
L["plugin_mapicons"] = "World map icons for this Plugin"
--Translation missing 
L["plugin_mapicons_minimap"] = "Minimap icons for this Plugin"
--Translation missing 
L["size"] = "Size"
--Translation missing 
L["toggle_all_pages"] = "Toggle All Pages"
L["tomtom_button"] = "Configurer les chemins TomTom"

elseif locale == "deDE" then 
-- General
L["add"] = "Hinzufügen"
L["add_quest"] = "Quest hinzufügen"
L["addbtntooltip"] = "Füge die ausgewählte Quest deiner eigenen Daily-Global-Check-Liste hinzu."
L["added"] = "hinzugefügt"
L["availablelists"] = "Verfügbare Listen"
L["b_prefix"] = "Vorsilbe (optional)"
L["b_questid"] = "Quest-ID"
L["b_questname"] = "Questname"
L["b_suffix"] = "Nachsilbe (optional)"
L["bf_err1"] = "|cff11DDFFDaily Global Check|r - Du must entweder die Quest-ID oder ihren Namen eingeben."
L["bf_err2"] = "|cff11DDFFDaily Global Check|r - Diese Quest ist schon in der Liste."
L["blacklist"] = "Schwarze Liste"
L["buildframe"] = "Eigene Liste bearbeiten"
L["chars_deleted"] = "|cff11DDFFDaily Global Check|r - Charakter |cff00FF00%s|r ist nun auf der Schwarzen Liste"
L["chars_restored"] = "|cff11DDFFDaily Global Check|r - Charakter |cff00FF00%s|r wurde von der Schwarzen Liste entfernt"
L["classic"] = "Classic"
--Translation missing 
L["collapsed"] = "Collapsed"
L["coordinates"] = "Koordinaten"
L["create_new_list"] = "Eine neue Liste erstellen"
L["currency_id"] = "Abzeichen-ID"
L["customlist"] = "Eigene Liste"
L["del_page"] = "Seite löschen"
L["delete_list"] = "Liste löschen"
L["deleted"] = "gelöscht"
L["edit_mode"] = "Bearbeitungsmodus"
L["edit_quest"] = "Quest bearbeiten"
--Translation missing 
L["edit_questID_info"] = [=[You can insert multiple quest IDs each separated by one of the following keywords:
 %s : this element will result complete if at least one of the quests is completed.
 %s : this element will result complete only when all the quests are completed.]=]
--Translation missing 
L["edit_spell_info"] = "Tracks the cooldown of a spell, mostly useful with profession based spells"
L["generating_database"] = "Die Datenbank %s wird erzeugt..."
L["help_edt_1"] = "Mit diesen Schaltflächen können Sie eine neue benutzerdefinierte Liste erstellen oder eine der unten folgenden ausgewählten Listen bearbeiten/entfernen/Aktivieren"
L["help_edt_2"] = [=[Dies ist die Liste der Listen! Es gibt zwei Arten von Listen:
- Pluginlisten: Diese Listen stammen aus den installierten Plugins und können nicht bearbeitet oder entfernt werden
- Benutzerdefinierte Listen: Die Listen, die Sie erstellt haben]=]
L["help_edt_3"] = "Die aktiven Listen (grünes Licht) werden im Daily-Global-Check-Fenster angezeigt, während die inaktiven Listen (rotes Licht) ausgeblendet werden"
L["help_edt_4"] = "Das ist eine Vorschau des ursprünglichen DGC-Fensters (Eigentlich ist es sogar das ursprüngliche DGC-Fenster)"
L["help_edt_5"] = "Diese Schaltfläche deaktiviert den Bearbeitungsmodus"
L["help_edt_6"] = "Hier können Sie den Titel der Liste ändern die gerade bearbeitet wird"
L["help_edt_7"] = "Klicken sie auf eine Spalte, um die Listen zu sortieren"
L["help_edt_8"] = "Dies ist die Liste der Quests. Sie enthält alle Plugin und persönlich hinzugefügte Quests."
L["help_edt_9"] = [=[Hier können Sie Quests hinzufügen oder bearbeiten.
Hinweis: Die bearbeitete Quest ist nicht unbedingt die ausgewählte Quest, es bezieht sich stattdessen auf die Quest, deren Quest-ID ins Bearbeitungsfeld geschrieben wurde.]=]
--Translation missing 
L["hidden"] = "Hidden"
L["lclicktoopen"] = "Linksklick zum Öffnen des Hauptfensters"
--Translation missing 
L["list_visibility"] = "List Visibility"
L["lists_limit"] = "Listenlimit erreicht (%s)"
L["map_id"] = "Karten-ID"
L["map_options"] = "Kartenoptionen"
--Translation missing 
L["minimap_icons"] = "Minimap Icons"
L["move_down"] = "Auswahl nach unten verschieben"
L["move_up"] = "Auswahl nach oben verschieben"
L["namemissing"] = "<Name fehlt>"
L["new_group"] = "Neue Gruppe"
L["new_page"] = "Neue Seite"
L["new_quest"] = "Neue Quest"
L["newlist"] = "Neue Liste"
L["news_#1"] = "Hi! ich bin dein Assistent und ich werde dir die wichtigsten Neuigkeiten von Daily Global Check zeigen"
--Translation missing 
L["news_#10"] = [=[World map icons from adjacent and continent maps are now hidden by default.
There is a new option in the Map Options panel to restore them]=]
--Translation missing 
L["news_#11"] = "Want to save talent sets and change talents with a click? Check out my new addon, |cff00ff00Talent Set Manager|r!"
L["news_#2"] = "Du kannst die momentane DGC-Seitenausgabe im Chatfenster ausgeben, wenn du '/dgc print' eintippst"
L["news_#3"] = "Daily Global Check kann seit v1.3.5 Instanzsperren verfolgen! Das dazugehörige Zusatzmodul (Daily Global Check_InstanceLockouts) kann bei Curse heruntergeladen werden"
--Translation missing 
L["news_#4"] = "Weekly follower and Herb/Mining node counters are available in the Daily Global Check_Professions plugin"
--Translation missing 
L["news_#5"] = "The Rare Mobs plugin, as of v1.3.2, has two specific options available in the Options->Plugin panel"
L["news_#6"] = "Probiere |cff00ff00DailyGlobalCheck_Hallow's End|r, wenn du Interesse daran hast, deine täglichen Quests des Ereignisses Schlotternächte zu verfolgen."
--Translation missing 
L["news_#7"] = "|cff00ffffMay 2016|r - |cffAAAAAAv|cff00ff001.5|r - Daily Global Check got a massive technical overhaul in preparation for Legion. The older plugins are incompatible and they will also need to be updated to the newer version, apologies for the inconvenience :)"
--Translation missing 
L["news_#8"] = "Groups can be collapsed by clicking on their title in the main frame, collapsed groups are hidden in mouseovering views"
--Translation missing 
L["news_#9"] = "You can hide map icons for chosen pages of any list through its Plugin Options"
L["news_bottomtext1"] = "|cff11DDFFLinksklick|cffFFFFFF: |cff00FF00Weiter"
L["news_bottomtext2"] = "|cff11DDFFRechtsklick|cffFFFFFF: |cff00FF00Verstecken|r"
L["nextpage"] = "Nächste Seite"
L["nolist"] = "Keine Liste ausgewählt"
L["notitle"] = "<kein Titel>"
L["opt_blacklist_remove"] = "Entferne einen Charakter von der Schwarzen Liste"
L["opt_characters"] = "Charaktere"
L["opt_characters_short"] = "(Alt)"
L["opt_help"] = "Hilfe"
L["opt_hidecompleted"] = "Verstecke fertige Quests"
L["opt_map_all"] = "Nur Weltkartensymbole der ausgewählten Liste anzeigen"
L["plugin_opt_none"] = "Das ausgewählte Plugin hat keine spezifischen Optionen"
L["plugin_opt_title"] = "Optionen für das ausgewählte Plugin:"
L["plugin_options"] = "Pluginoptionen"
L["prevpage"] = "Vorherige Seite"
L["quest_options"] = "Questoptionen"
L["questdatamissing"] = "<Questdaten fehlen>"
L["questlog_quest_added"] = "|cff11DDFFDaily Global Check|r - Quest %s hinzugefügt."
--Translation missing 
L["quests_limit"] = "Quests limit reached (%s)"
L["questwindow"] = "- Wähle die Questposition -"
L["rclicktoopen"] = "Rechtsklick zum Öffnen des Schnellauswahlmenüs."
L["rem"] = "Entfernen"
L["remmenuheader"] = "- Wähle die Quest, die entfernt werden soll -"
L["repeatable"] = "Wiederholbar"
L["s_tomtomset"] = "|cff11DDFFDaily Global Check|r - Wegpunkt für TomTom hinzugefügt"
--Translation missing 
L["search_by_name"] = "Search by name"
--Translation missing 
L["show_adjacent_map_icons"] = "Show on adjacent/continent maps"
--Translation missing 
L["shown"] = "Shown"
L["spell_id"] = "Zauber-ID"
L["tools"] = "Werkzeuge"
--Translation missing 
L["worldmap_icons"] = "Worldmap Icons"

-- Options
L["account_wide_options"] = "(Accountweite Optionen)"
L["character_specific_options"] = "(Characterspezifische Optionen)"
--Translation missing 
L["map_icons_visibility_list"] = "Map icons visibility for this List"
L["opt_coords"] = "Koordinaten anzeigen"
L["opt_main"] = "Einstellungen"
L["opt_map"] = "Weltkartensymbole anzeigen"
L["opt_minimap"] = "Minikartenbutton anzeigen"
L["opt_minimap_icons"] = "Minikartensymbol anzeigen"
L["opt_prefix"] = "Zeige Vorsilbe"
L["opt_questtype"] = "Questtyp anzeigen"
L["opt_showquestbtn"] = "Zeige die Schaltfläche \"Füge Quest zur Eigenen Liste hinzu\" im Questlog an"
L["opt_suffix"] = "Zeige Nachsilbe"
L["opt_zonename"] = "Zonenname anzeigen"
L["plugin_mapicons"] = "Weltkartensymbole für dieses Plugin"
L["plugin_mapicons_minimap"] = "Minikartensymbole für dieses Plugin"
L["size"] = "Größe"
--Translation missing 
L["toggle_all_pages"] = "Toggle All Pages"
L["tomtom_button"] = "TomTom-Wegpunkte setzen"

elseif locale == "ruRU" then 
-- General
L["add"] = "Добавить"
L["add_quest"] = "Добавить задание"
L["addbtntooltip"] = "Добавить выбранное задание в ваш пользовательский список Daily Global Check"
L["added"] = "Общий"
L["availablelists"] = "Доступные списки"
L["b_prefix"] = "Префикс"
L["b_questid"] = "ИД задания"
L["b_questname"] = "Имя задания"
L["b_suffix"] = "Суффикс"
L["bf_err1"] = "cff11DDFFDaily Global Check|r - Вам нужно ввести либо ИД задания, либо его имя."
L["bf_err2"] = "|cff11DDFFDaily Global Check|r - Это задание уже существует."
L["blacklist"] = "Чёрный список"
L["buildframe"] = "Изменить пользовательский список"
L["chars_deleted"] = "|cff11DDFFDaily Global Check|r - Персонаж |cff00FF00%s|r теперь в чёрном списке"
L["chars_restored"] = "|cff11DDFFDaily Global Check|r - Персонаж |cff00FF00%s|r был удалён из чёрного списка"
L["classic"] = "Классический"
L["collapsed"] = "Рухнул"
L["coordinates"] = "Координаты"
L["create_new_list"] = "Создать новый список"
L["currency_id"] = "ИД валюты"
L["customlist"] = "Пользовательский список"
L["del_page"] = "Удалить страницу"
L["delete_list"] = "Удалить список"
L["deleted"] = "Общий"
L["edit_mode"] = "Режим редактирования"
L["edit_quest"] = "Редактировать задание"
--Translation missing 
L["edit_questID_info"] = [=[You can insert multiple quest IDs each separated by one of the following keywords:
 %s : this element will result complete if at least one of the quests is completed.
 %s : this element will result complete only when all the quests are completed.]=]
L["edit_spell_info"] = "Отслеживает время перезарядки заклинания, в основном полезной профессии на основе заклинаний"
L["generating_database"] = "Создано %s базы данных..."
L["help_edt_1"] = "Вы можете создать новый пользовательский список, используя кнопку %s."
L["help_edt_2"] = "Вы можете переименовать выбранный список, используя кнопку %s."
L["help_edt_3"] = "Эта кнопка навсегда удаляет текущий выбранный пользовательский список."
--Translation missing 
L["help_edt_4"] = [=[This is the quest pool, you can drag any quest from here and drop it on the currently selected list.
- The %s button permanently deletes the relative custom quest from the quest pool.
- The %s button is used to edit the relative |cff00ff00custom|r quest.]=]
--Translation missing 
L["help_edt_5"] = [=[This is the selected custom list
- Quests can be repositioned by simply dragging them.
- A group of quests can be moved by using the %s buttons at the header's left.
- The %s button deletes the relative quest (it will still be available in the quest pool) or entire group from the list.
- The %s button is used to edit the relative |cff00ff00custom|r quest or rename the relative group.
- The 'New Quest' button creates a new quest in the quest pool and inserts it at the button's location, ready to be edited.
- The 'New Group' button simply creates a new group.]=]
L["help_edt_6"] = "Эти кнопки используются для создания или удаления страниц в выбранном списке."
L["help_edt_7"] = "Здесь вы можете выбрать, какую часть задания вы хотите изменить."
L["help_edt_8"] = "Эта рамка может быть использована для редактирования раздела выбранного задания."
L["help_edt_9"] = "Нажмите \"Принять\" для сохранения изменений, или \"Отмена\" для их возврата."
L["hidden"] = "Спрятанный"
L["lclicktoopen"] = "Нажмите левую кнопку мыши, чтобы открыть основное окно"
L["list_visibility"] = "Видимость списка"
L["lists_limit"] = "Лимит списков достигнут (%s)"
L["map_id"] = "ИД карты"
L["map_options"] = "Настройки карты"
L["minimap_icons"] = "Иконки у миникарты"
L["move_down"] = "Переместить выделение вниз"
L["move_up"] = "Переместить выделение вверх"
L["namemissing"] = "Нет имени"
L["new_group"] = "Новая группа"
L["new_page"] = "Новая страница"
L["new_quest"] = "Новое задание"
L["newlist"] = "Новый лист"
L["news_#1"] = "Привет! Я ваш ассистент, и я покажу вам наиболее важные новости о Daily Global Check"
L["news_#10"] = [=[Иконки на карте мира из карт континента и соседних карт скрыты по умолчанию.
Существует новая опция в панели настроек карты, чтобы восстановить их]=]
L["news_#11"] = "Хотите сохранять наборы талантов и изменять таланты по щелчку? Проверьте мой новый аддон, |cff00ff00Talent Set Manager|r!"
L["news_#2"] = "Вы можете вывести текущую страницу DGC, набрав в чате команду '/dgc print'"
L["news_#3"] = "Daily Global Check может отслеживать захват подземелий начиная с v1.3.5! Соответствующий плагин можно найти на Curse"
L["news_#4"] = "Еженедельный последователь и счётчики трав/горной руды доступны в плагине Daily Global Check_Professions"
L["news_#5"] = "Плагин \"Rare Mobs\", начиная с  v1.3.2, имеет два определенных варианта, доступных в Параметры -> Панель плагинов"
L["news_#6"] = "Check out |cff00ff00DailyGlobalCheck_Hallow's End|r если вы хотите отслеживать Тыкво-винские ежедневные задания и вёдра с конфетами"
L["news_#7"] = "|cff00ffffМай 2016|r - |cffAAAAAAv|cff00ff001.5|r - Daily Global Check получил огромное техническое обновление в рамках подготовки к Легиону. Старые плагины не совместимы, и они также должны быть обновлены до новой версии, приносим извинения за неудобства :)"
L["news_#8"] = "Группы могут быть свернуты, кликнув на название в основной рамке, свернутые группы скрыты в просмотре наведения мышкой"
L["news_#9"] = "Вы можете скрыть иконки на карте для выбранных страниц любого списка, через настройки этого плагина"
L["news_bottomtext1"] = "|cff11DDFFЛевое нажатие|cffFFFFFF: |cff00FF00Следующий"
L["news_bottomtext2"] = "|cff11DDFFПравое нажатие|cffFFFFFF: |cff00FF00Спрятать|r"
L["nextpage"] = "Следующая страница"
L["nolist"] = "Не выбран список"
L["notitle"] = "Нет названия"
L["opt_blacklist_remove"] = "Удалить персонажа из чёрного списка"
L["opt_characters"] = "Персонаж"
L["opt_characters_short"] = "(Alt)"
L["opt_help"] = "Помощь"
L["opt_hidecompleted"] = "Спрятать выполненные задания"
L["opt_map_all"] = "Показывать на карте мира только иконки из выбранного списка"
L["plugin_opt_none"] = "Выбранный модуль не имеет каких-либо конкретных параметров"
L["plugin_opt_title"] = "Параметры для выбранного плагина:"
L["plugin_options"] = "Настройки плагина"
L["prevpage"] = "Предыдущая страница"
L["quest_options"] = "Настройки задания"
L["questdatamissing"] = "Нет данных квеста"
L["questlog_quest_added"] = "|cff11DDFFDaily Global Check|r - Задание %s добавлено в пользовательские задания."
L["quests_limit"] = "Достигнут лимит заданий (%s)"
L["questwindow"] = "- Выберите позицию задания -"
L["rclicktoopen"] = "Нажмите правую кнопку мыши, чтобы открыть меню быстрого выбора"
L["rem"] = "Удалить"
L["remmenuheader"] = "- Выберите задание для удаления -"
L["repeatable"] = "Повторяющийся"
L["s_tomtomset"] = "|cff11DDFFDaily Global Check|r - в TomTom добавлено направление."
L["search_by_name"] = "Поиск по имени"
L["show_adjacent_map_icons"] = "Показать карты континента/соседних карт"
L["shown"] = "Показанный"
L["spell_id"] = "ИД заклинания"
L["tools"] = "Инструменты"
L["worldmap_icons"] = "Иконки мировой карты"

-- Options
L["account_wide_options"] = "(Аккаунт-настройки ширины)"
L["character_specific_options"] = "(Персонаж-определенные настройки)"
L["map_icons_visibility_list"] = "Обзор иконок карты для этого списка"
L["opt_coords"] = "Отображать координаты"
L["opt_main"] = "Настройки"
L["opt_map"] = "Показывать иконки на карте мира"
L["opt_minimap"] = "Включить кнопку у миникарты"
L["opt_minimap_icons"] = "Показывать иконку у миникарты"
L["opt_prefix"] = "Отображать префикс"
L["opt_questtype"] = "Отображать тип квеста"
L["opt_showquestbtn"] = "Показать кнопку \"Добавить задание в пользовательский список\" в рамку Журнала заданий"
L["opt_suffix"] = "Отображать суффикс"
L["opt_zonename"] = "Отображать название локации"
L["plugin_mapicons"] = "Иконка на мировой карте для этого плагина"
L["plugin_mapicons_minimap"] = "Иконки у миникарты для этого плагина"
L["size"] = "Размер"
L["toggle_all_pages"] = "Переключить все страницы"
L["tomtom_button"] = "Устанавливать направления в TomTom"

elseif locale == "zhCN" then 
-- General
--Translation missing 
L["add"] = "Add"
--Translation missing 
L["add_quest"] = "Add Quest"
--Translation missing 
L["addbtntooltip"] = "Add the selected quest to your Daily Global Check Custom List"
--Translation missing 
L["added"] = "added"
L["availablelists"] = "可用列表"
--Translation missing 
L["b_prefix"] = "Prefix"
--Translation missing 
L["b_questid"] = "Quest ID"
--Translation missing 
L["b_questname"] = "Quest Name"
--Translation missing 
L["b_suffix"] = "Suffix"
--Translation missing 
L["bf_err1"] = "|cff11DDFFDaily Global Check|r - You need to enter either the quest ID and its name."
--Translation missing 
L["bf_err2"] = "|cff11DDFFDaily Global Check|r - This quest already exists."
--Translation missing 
L["blacklist"] = "Blacklist"
--Translation missing 
L["buildframe"] = "Modify Custom List"
--Translation missing 
L["chars_deleted"] = "|cff11DDFFDaily Global Check|r - Character |cff00FF00%s|r is now in the blacklist"
--Translation missing 
L["chars_restored"] = "|cff11DDFFDaily Global Check|r - Character |cff00FF00%s|r has been removed from the blacklist"
--Translation missing 
L["classic"] = "Classic"
--Translation missing 
L["collapsed"] = "Collapsed"
--Translation missing 
L["coordinates"] = "Coordinates"
--Translation missing 
L["create_new_list"] = "Create a new list"
--Translation missing 
L["currency_id"] = "Currency ID"
--Translation missing 
L["customlist"] = "Custom List"
--Translation missing 
L["del_page"] = "Delete Page"
--Translation missing 
L["delete_list"] = "Delete List"
--Translation missing 
L["deleted"] = "deleted"
--Translation missing 
L["edit_mode"] = "Edit Mode"
--Translation missing 
L["edit_quest"] = "Edit Quest"
--Translation missing 
L["edit_questID_info"] = [=[You can insert multiple quest IDs each separated by one of the following keywords:
 %s : this element will result complete if at least one of the quests is completed.
 %s : this element will result complete only when all the quests are completed.]=]
--Translation missing 
L["edit_spell_info"] = "Tracks the cooldown of a spell, mostly useful with profession based spells"
--Translation missing 
L["generating_database"] = "Generating the %s database..."
--Translation missing 
L["help_edt_1"] = "You can create a new custom list by using the %s button."
--Translation missing 
L["help_edt_2"] = "You can rename the selected list by using the %s button."
--Translation missing 
L["help_edt_3"] = "This button permanently deletes the currently selected custom list."
--Translation missing 
L["help_edt_4"] = [=[This is the quest pool, you can drag any quest from here and drop it on the currently selected list.
- The %s button permanently deletes the relative custom quest from the quest pool.
- The %s button is used to edit the relative |cff00ff00custom|r quest.]=]
--Translation missing 
L["help_edt_5"] = [=[This is the selected custom list
- Quests can be repositioned by simply dragging them.
- A group of quests can be moved by using the %s buttons at the header's left.
- The %s button deletes the relative quest (it will still be available in the quest pool) or entire group from the list.
- The %s button is used to edit the relative |cff00ff00custom|r quest or rename the relative group.
- The 'New Quest' button creates a new quest in the quest pool and inserts it at the button's location, ready to be edited.
- The 'New Group' button simply creates a new group.]=]
--Translation missing 
L["help_edt_6"] = "These buttons are used to create or delete pages within the currently selected list."
--Translation missing 
L["help_edt_7"] = "Here you can select which section of the quest you wish to modify."
--Translation missing 
L["help_edt_8"] = "This frame can be used to edit the chosen quest section."
--Translation missing 
L["help_edt_9"] = "Click Okay to save your changes, or Cancel to revert them."
--Translation missing 
L["hidden"] = "Hidden"
L["lclicktoopen"] = "左键单击打开主框架"
--Translation missing 
L["list_visibility"] = "List Visibility"
--Translation missing 
L["lists_limit"] = "Lists limit reached (%s)"
--Translation missing 
L["map_id"] = "Map ID"
--Translation missing 
L["map_options"] = "Map Options"
--Translation missing 
L["minimap_icons"] = "Minimap Icons"
--Translation missing 
L["move_down"] = "Move Selection Down"
--Translation missing 
L["move_up"] = "Move Selection Up"
L["namemissing"] = "<名字丢失>"
--Translation missing 
L["new_group"] = "New Group"
--Translation missing 
L["new_page"] = "New Page"
--Translation missing 
L["new_quest"] = "New Quest"
--Translation missing 
L["newlist"] = "New List"
--Translation missing 
L["news_#1"] = "Hi! I'm your assistant and I will show you the most important news about Daily Global Check"
--Translation missing 
L["news_#10"] = [=[World map icons from adjacent and continent maps are now hidden by default.
There is a new option in the Map Options panel to restore them]=]
--Translation missing 
L["news_#11"] = "Want to save talent sets and change talents with a click? Check out my new addon, |cff00ff00Talent Set Manager|r!"
--Translation missing 
L["news_#2"] = "You can print the current DGC page output in the chatframe by typing '/dgc print'"
--Translation missing 
L["news_#3"] = "Daily Global Check can track Instance Lockouts since v1.3.5! The related plugin can be found on Curse"
--Translation missing 
L["news_#4"] = "Weekly follower and Herb/Mining node counters are available in the Daily Global Check_Professions plugin"
--Translation missing 
L["news_#5"] = "The Rare Mobs plugin, as of v1.3.2, has two specific options available in the Options->Plugin panel"
--Translation missing 
L["news_#6"] = "Check out |cff00ff00DailyGlobalCheck_Hallow's End|r if you're interested in tracking Hallow's End dailies and candy buckets"
--Translation missing 
L["news_#7"] = "|cff00ffffMay 2016|r - |cffAAAAAAv|cff00ff001.5|r - Daily Global Check got a massive technical overhaul in preparation for Legion. The older plugins are incompatible and they will also need to be updated to the newer version, apologies for the inconvenience :)"
--Translation missing 
L["news_#8"] = "Groups can be collapsed by clicking on their title in the main frame, collapsed groups are hidden in mouseovering views"
--Translation missing 
L["news_#9"] = "You can hide map icons for chosen pages of any list through its Plugin Options"
--Translation missing 
L["news_bottomtext1"] = "|cff11DDFFLeft-Click|cffFFFFFF: |cff00FF00Next"
--Translation missing 
L["news_bottomtext2"] = "|cff11DDFFRight-Click|cffFFFFFF: |cff00FF00Hide|r"
--Translation missing 
L["nextpage"] = "Next Page"
--Translation missing 
L["nolist"] = "No list selected"
L["notitle"] = "<没有标题>"
--Translation missing 
L["opt_blacklist_remove"] = "Remove a character from the black list"
--Translation missing 
L["opt_characters"] = "Characters"
--Translation missing 
L["opt_characters_short"] = "(Alt)"
--Translation missing 
L["opt_help"] = "Help"
--Translation missing 
L["opt_hidecompleted"] = "Hide completed quests"
--Translation missing 
L["opt_map_all"] = "Only show world map icons from selected list"
--Translation missing 
L["plugin_opt_none"] = "The selected plugin doesn't have any specific options"
--Translation missing 
L["plugin_opt_title"] = "Options for the selected plugin:"
--Translation missing 
L["plugin_options"] = "Plugin Options"
--Translation missing 
L["prevpage"] = "Previous Page"
--Translation missing 
L["quest_options"] = "Quest Options"
L["questdatamissing"] = "<任务数据丢失>"
--Translation missing 
L["questlog_quest_added"] = "|cff11DDFFDaily Global Check|r - Quest %s added to the custom quests pool."
--Translation missing 
L["quests_limit"] = "Quests limit reached (%s)"
--Translation missing 
L["questwindow"] = "- Select quest position -"
L["rclicktoopen"] = "右键单击打开快速列表选择菜单"
--Translation missing 
L["rem"] = "Remove"
--Translation missing 
L["remmenuheader"] = "- Select the quest to remove -"
--Translation missing 
L["repeatable"] = "Repeatable"
L["s_tomtomset"] = "|cff11DDFFDaily Global Check|r - 航点加入到TomTom"
--Translation missing 
L["search_by_name"] = "Search by name"
--Translation missing 
L["show_adjacent_map_icons"] = "Show on adjacent/continent maps"
--Translation missing 
L["shown"] = "Shown"
--Translation missing 
L["spell_id"] = "Spell ID"
--Translation missing 
L["tools"] = "Tools"
--Translation missing 
L["worldmap_icons"] = "Worldmap Icons"

-- Options
--Translation missing 
L["account_wide_options"] = "(Account-Wide Options)"
--Translation missing 
L["character_specific_options"] = "(Character-specific options)"
--Translation missing 
L["map_icons_visibility_list"] = "Map icons visibility for this List"
L["opt_coords"] = "显示坐标"
L["opt_main"] = "选项"
L["opt_map"] = "显示世界地图图标"
L["opt_minimap"] = "显示小地图按钮"
--Translation missing 
L["opt_minimap_icons"] = "Show minimap icons"
L["opt_prefix"] = "显示前缀"
L["opt_questtype"] = "显示任务类型"
--Translation missing 
L["opt_showquestbtn"] = "Show the 'Add quest to Custom List' button in the Quest Log Frame"
L["opt_suffix"] = "显示后缀"
L["opt_zonename"] = "显示区域名称"
--Translation missing 
L["plugin_mapicons"] = "World map icons for this Plugin"
--Translation missing 
L["plugin_mapicons_minimap"] = "Minimap icons for this Plugin"
--Translation missing 
L["size"] = "Size"
--Translation missing 
L["toggle_all_pages"] = "Toggle All Pages"
L["tomtom_button"] = "设置TomTom航点"

elseif locale == "zhTW" then 
-- General
L["add"] = "新增"
L["add_quest"] = "新增任務"
L["addbtntooltip"] = "將選擇的任務新增至你自訂的艾澤拉斯日常清單"
L["added"] = "已新增"
L["availablelists"] = "可用的清單"
L["b_prefix"] = "前置詞 (選擇性)"
L["b_questid"] = "任務ID"
L["b_questname"] = "任務名稱"
L["b_suffix"] = "後置詞 (選擇性)"
L["bf_err1"] = "|cff11DDFF艾澤拉斯的日常|r - 請輸入任務ID或名稱。"
L["bf_err2"] = "|cff11DDFF艾澤拉斯的日常|r - 任務已經在清單中。"
L["blacklist"] = "黑名單"
L["buildframe"] = "更改自訂清單"
L["chars_deleted"] = "|cff11DDFF艾澤拉斯的日常|r - 角色 |cff00FF00%s|r 已加入黑名單"
L["chars_restored"] = "|cff11DDFF艾澤拉斯的日常|r - 角色 |cff00FF00%s|r 已經從黑名單中移除"
--Translation missing 
L["classic"] = "Classic"
--Translation missing 
L["collapsed"] = "Collapsed"
--Translation missing 
L["coordinates"] = "Coordinates"
--Translation missing 
L["create_new_list"] = "Create a new list"
--Translation missing 
L["currency_id"] = "Currency ID"
L["customlist"] = "自訂清單"
L["del_page"] = "刪除頁面"
--Translation missing 
L["delete_list"] = "Delete List"
L["deleted"] = "已刪除"
L["edit_mode"] = "編輯模式"
--Translation missing 
L["edit_quest"] = "Edit Quest"
--Translation missing 
L["edit_questID_info"] = [=[You can insert multiple quest IDs each separated by one of the following keywords:
 %s : this element will result complete if at least one of the quests is completed.
 %s : this element will result complete only when all the quests are completed.]=]
--Translation missing 
L["edit_spell_info"] = "Tracks the cooldown of a spell, mostly useful with profession based spells"
--Translation missing 
L["generating_database"] = "Generating the %s database..."
L["help_edt_1"] = "使用按鈕來建立新的自訂清單，或選擇下面的清單來編輯/移除/啟用。"
--Translation missing 
L["help_edt_2"] = "You can rename the selected list by using the %s button."
--Translation missing 
L["help_edt_3"] = "This button permanently deletes the currently selected custom list."
--Translation missing 
L["help_edt_4"] = [=[This is the quest pool, you can drag any quest from here and drop it on the currently selected list.
- The %s button permanently deletes the relative custom quest from the quest pool.
- The %s button is used to edit the relative |cff00ff00custom|r quest.]=]
--Translation missing 
L["help_edt_5"] = [=[This is the selected custom list
- Quests can be repositioned by simply dragging them.
- A group of quests can be moved by using the %s buttons at the header's left.
- The %s button deletes the relative quest (it will still be available in the quest pool) or entire group from the list.
- The %s button is used to edit the relative |cff00ff00custom|r quest or rename the relative group.
- The 'New Quest' button creates a new quest in the quest pool and inserts it at the button's location, ready to be edited.
- The 'New Group' button simply creates a new group.]=]
--Translation missing 
L["help_edt_6"] = "These buttons are used to create or delete pages within the currently selected list."
--Translation missing 
L["help_edt_7"] = "Here you can select which section of the quest you wish to modify."
--Translation missing 
L["help_edt_8"] = "This frame can be used to edit the chosen quest section."
--Translation missing 
L["help_edt_9"] = "Click Okay to save your changes, or Cancel to revert them."
--Translation missing 
L["hidden"] = "Hidden"
L["lclicktoopen"] = "左鍵開啟主視窗"
--Translation missing 
L["list_visibility"] = "List Visibility"
L["lists_limit"] = "達到清單上限 (%s)"
--Translation missing 
L["map_id"] = "Map ID"
--Translation missing 
L["map_options"] = "Map Options"
--Translation missing 
L["minimap_icons"] = "Minimap Icons"
L["move_down"] = "選取範圍往下移"
L["move_up"] = "選取範圍往上移"
L["namemissing"] = "<沒有名稱>"
L["new_group"] = "新的群組"
L["new_page"] = "新的頁面"
--Translation missing 
L["new_quest"] = "New Quest"
L["newlist"] = "新的清單"
L["news_#1"] = "Hi! 我是您的小助理，要和您說說艾澤拉斯的日常 Daily Global Check 最重要的新消息"
--Translation missing 
L["news_#10"] = [=[World map icons from adjacent and continent maps are now hidden by default.
There is a new option in the Map Options panel to restore them]=]
--Translation missing 
L["news_#11"] = "Want to save talent sets and change talents with a click? Check out my new addon, |cff00ff00Talent Set Manager|r!"
L["news_#2"] = "要將目前的艾澤拉斯的日常頁面顯示出來，只要在聊天視窗輸入 '/dgc print'"
L["news_#3"] = "艾澤拉斯的日常從版本 v1.3.5 開始可以追蹤副本開放進度! 在 Curse 網站可以找到相關的模組"
L["news_#4"] = "每週招募追隨者和草藥/礦坑的日常都在 Daily Global Check_Professions 模組"
L["news_#5"] = "稀有怪模組從版本 v1.3.2 開始有兩個特別的選項，可從 選項 -> 模組 面板來設定。"
L["news_#6"] = "追蹤萬鬼節的每日和糖果桶，一定不能錯過 |cff00ff00DailyGlobalCheck_Hallow's End|r"
--Translation missing 
L["news_#7"] = "|cff00ffffMay 2016|r - |cffAAAAAAv|cff00ff001.5|r - Daily Global Check got a massive technical overhaul in preparation for Legion. The older plugins are incompatible and they will also need to be updated to the newer version, apologies for the inconvenience :)"
--Translation missing 
L["news_#8"] = "Groups can be collapsed by clicking on their title in the main frame, collapsed groups are hidden in mouseovering views"
--Translation missing 
L["news_#9"] = "You can hide map icons for chosen pages of any list through its Plugin Options"
L["news_bottomtext1"] = "|cff11DDFF左鍵|cffFFFFFF: |cff00FF00下一個"
L["news_bottomtext2"] = "|cff11DDFF右鍵|cffFFFFFF: |cff00FF00隱藏|r"
L["nextpage"] = "下一頁"
L["nolist"] = "尚未選取任何清單"
L["notitle"] = "<沒有標題>"
L["opt_blacklist_remove"] = "從黑名單中移除角色"
L["opt_characters"] = "角色"
L["opt_characters_short"] = "(Alt)"
L["opt_help"] = "說明"
L["opt_hidecompleted"] = "隱藏已完成的任務"
L["opt_map_all"] = "只顯示選取清單中的世界地圖圖示"
L["plugin_opt_none"] = "選擇的模組沒有任何特別的選項"
L["plugin_opt_title"] = "選擇模組的選項:"
--Translation missing 
L["plugin_options"] = "Plugin Options"
L["prevpage"] = "上一頁"
--Translation missing 
L["quest_options"] = "Quest Options"
L["questdatamissing"] = "<無法找到任務資料>"
L["questlog_quest_added"] = "|cff11DDFF艾澤拉斯的日常|r - 已經新增任務 %s。"
--Translation missing 
L["quests_limit"] = "Quests limit reached (%s)"
L["questwindow"] = "- 選擇任務位置 -"
L["rclicktoopen"] = "右鍵開啟快速選擇清單"
L["rem"] = "移除"
L["remmenuheader"] = "- 選擇要移除的任務 -"
L["repeatable"] = "可重複的"
L["s_tomtomset"] = "|cff11DDFF艾澤拉斯的日常|r - 已經新增 TomTom 航點"
--Translation missing 
L["search_by_name"] = "Search by name"
--Translation missing 
L["show_adjacent_map_icons"] = "Show on adjacent/continent maps"
--Translation missing 
L["shown"] = "Shown"
--Translation missing 
L["spell_id"] = "Spell ID"
--Translation missing 
L["tools"] = "Tools"
--Translation missing 
L["worldmap_icons"] = "Worldmap Icons"

-- Options
--Translation missing 
L["account_wide_options"] = "(Account-Wide Options)"
--Translation missing 
L["character_specific_options"] = "(Character-specific options)"
--Translation missing 
L["map_icons_visibility_list"] = "Map icons visibility for this List"
L["opt_coords"] = "顯示座標"
L["opt_main"] = "選項"
L["opt_map"] = "顯示世界地圖圖示"
L["opt_minimap"] = "顯示小地圖按鈕"
L["opt_minimap_icons"] = "顯示小地圖圖示"
L["opt_prefix"] = "顯示前置詞"
L["opt_questtype"] = "顯示任務類型"
L["opt_showquestbtn"] = "在任務記錄視窗中顯示 '新增任務到自訂清單' 按鈕"
L["opt_suffix"] = "顯示後置詞"
L["opt_zonename"] = "顯示地區名稱"
L["plugin_mapicons"] = "這個模組的世界地圖圖示"
L["plugin_mapicons_minimap"] = "這個模組的小地圖圖示"
L["size"] = "大小"
--Translation missing 
L["toggle_all_pages"] = "Toggle All Pages"
L["tomtom_button"] = "設定 TomTom 航點"

elseif locale == "koKR" then
-- General
--Translation missing 
L["add"] = "Add"
--Translation missing 
L["add_quest"] = "Add Quest"
--Translation missing 
L["addbtntooltip"] = "Add the selected quest to your Daily Global Check Custom List"
--Translation missing 
L["added"] = "added"
--Translation missing 
L["availablelists"] = "Available Lists"
--Translation missing 
L["b_prefix"] = "Prefix"
--Translation missing 
L["b_questid"] = "Quest ID"
--Translation missing 
L["b_questname"] = "Quest Name"
--Translation missing 
L["b_suffix"] = "Suffix"
--Translation missing 
L["bf_err1"] = "|cff11DDFFDaily Global Check|r - You need to enter either the quest ID and its name."
--Translation missing 
L["bf_err2"] = "|cff11DDFFDaily Global Check|r - This quest already exists."
--Translation missing 
L["blacklist"] = "Blacklist"
--Translation missing 
L["buildframe"] = "Modify Custom List"
--Translation missing 
L["chars_deleted"] = "|cff11DDFFDaily Global Check|r - Character |cff00FF00%s|r is now in the blacklist"
--Translation missing 
L["chars_restored"] = "|cff11DDFFDaily Global Check|r - Character |cff00FF00%s|r has been removed from the blacklist"
--Translation missing 
L["classic"] = "Classic"
--Translation missing 
L["collapsed"] = "Collapsed"
--Translation missing 
L["coordinates"] = "Coordinates"
--Translation missing 
L["create_new_list"] = "Create a new list"
--Translation missing 
L["currency_id"] = "Currency ID"
--Translation missing 
L["customlist"] = "Custom List"
--Translation missing 
L["del_page"] = "Delete Page"
--Translation missing 
L["delete_list"] = "Delete List"
--Translation missing 
L["deleted"] = "deleted"
--Translation missing 
L["edit_mode"] = "Edit Mode"
--Translation missing 
L["edit_quest"] = "Edit Quest"
--Translation missing 
L["edit_questID_info"] = [=[You can insert multiple quest IDs each separated by one of the following keywords:
 %s : this element will result complete if at least one of the quests is completed.
 %s : this element will result complete only when all the quests are completed.]=]
--Translation missing 
L["edit_spell_info"] = "Tracks the cooldown of a spell, mostly useful with profession based spells"
--Translation missing 
L["generating_database"] = "Generating the %s database..."
--Translation missing 
L["help_edt_1"] = "You can create a new custom list by using the %s button."
--Translation missing 
L["help_edt_2"] = "You can rename the selected list by using the %s button."
--Translation missing 
L["help_edt_3"] = "This button permanently deletes the currently selected custom list."
--Translation missing 
L["help_edt_4"] = [=[This is the quest pool, you can drag any quest from here and drop it on the currently selected list.
- The %s button permanently deletes the relative custom quest from the quest pool.
- The %s button is used to edit the relative |cff00ff00custom|r quest.]=]
--Translation missing 
L["help_edt_5"] = [=[This is the selected custom list
- Quests can be repositioned by simply dragging them.
- A group of quests can be moved by using the %s buttons at the header's left.
- The %s button deletes the relative quest (it will still be available in the quest pool) or entire group from the list.
- The %s button is used to edit the relative |cff00ff00custom|r quest or rename the relative group.
- The 'New Quest' button creates a new quest in the quest pool and inserts it at the button's location, ready to be edited.
- The 'New Group' button simply creates a new group.]=]
--Translation missing 
L["help_edt_6"] = "These buttons are used to create or delete pages within the currently selected list."
--Translation missing 
L["help_edt_7"] = "Here you can select which section of the quest you wish to modify."
--Translation missing 
L["help_edt_8"] = "This frame can be used to edit the chosen quest section."
--Translation missing 
L["help_edt_9"] = "Click Okay to save your changes, or Cancel to revert them."
--Translation missing 
L["hidden"] = "Hidden"
--Translation missing 
L["lclicktoopen"] = "Left-click to open the main frame"
--Translation missing 
L["list_visibility"] = "List Visibility"
--Translation missing 
L["lists_limit"] = "Lists limit reached (%s)"
--Translation missing 
L["map_id"] = "Map ID"
--Translation missing 
L["map_options"] = "Map Options"
--Translation missing 
L["minimap_icons"] = "Minimap Icons"
--Translation missing 
L["move_down"] = "Move Selection Down"
--Translation missing 
L["move_up"] = "Move Selection Up"
--Translation missing 
L["namemissing"] = "<name missing>"
--Translation missing 
L["new_group"] = "New Group"
--Translation missing 
L["new_page"] = "New Page"
--Translation missing 
L["new_quest"] = "New Quest"
--Translation missing 
L["newlist"] = "New List"
--Translation missing 
L["news_#1"] = "Hi! I'm your assistant and I will show you the most important news about Daily Global Check"
--Translation missing 
L["news_#10"] = [=[World map icons from adjacent and continent maps are now hidden by default.
There is a new option in the Map Options panel to restore them]=]
--Translation missing 
L["news_#11"] = "Want to save talent sets and change talents with a click? Check out my new addon, |cff00ff00Talent Set Manager|r!"
--Translation missing 
L["news_#2"] = "You can print the current DGC page output in the chatframe by typing '/dgc print'"
--Translation missing 
L["news_#3"] = "Daily Global Check can track Instance Lockouts since v1.3.5! The related plugin can be found on Curse"
--Translation missing 
L["news_#4"] = "Weekly follower and Herb/Mining node counters are available in the Daily Global Check_Professions plugin"
--Translation missing 
L["news_#5"] = "The Rare Mobs plugin, as of v1.3.2, has two specific options available in the Options->Plugin panel"
--Translation missing 
L["news_#6"] = "Check out |cff00ff00DailyGlobalCheck_Hallow's End|r if you're interested in tracking Hallow's End dailies and candy buckets"
--Translation missing 
L["news_#7"] = "|cff00ffffMay 2016|r - |cffAAAAAAv|cff00ff001.5|r - Daily Global Check got a massive technical overhaul in preparation for Legion. The older plugins are incompatible and they will also need to be updated to the newer version, apologies for the inconvenience :)"
--Translation missing 
L["news_#8"] = "Groups can be collapsed by clicking on their title in the main frame, collapsed groups are hidden in mouseovering views"
--Translation missing 
L["news_#9"] = "You can hide map icons for chosen pages of any list through its Plugin Options"
--Translation missing 
L["news_bottomtext1"] = "|cff11DDFFLeft-Click|cffFFFFFF: |cff00FF00Next"
--Translation missing 
L["news_bottomtext2"] = "|cff11DDFFRight-Click|cffFFFFFF: |cff00FF00Hide|r"
--Translation missing 
L["nextpage"] = "Next Page"
--Translation missing 
L["nolist"] = "No list selected"
--Translation missing 
L["notitle"] = "<no title>"
--Translation missing 
L["opt_blacklist_remove"] = "Remove a character from the black list"
--Translation missing 
L["opt_characters"] = "Characters"
--Translation missing 
L["opt_characters_short"] = "(Alt)"
--Translation missing 
L["opt_help"] = "Help"
--Translation missing 
L["opt_hidecompleted"] = "Hide completed quests"
--Translation missing 
L["opt_map_all"] = "Only show world map icons from selected list"
--Translation missing 
L["plugin_opt_none"] = "The selected plugin doesn't have any specific options"
--Translation missing 
L["plugin_opt_title"] = "Options for the selected plugin:"
--Translation missing 
L["plugin_options"] = "Plugin Options"
--Translation missing 
L["prevpage"] = "Previous Page"
--Translation missing 
L["quest_options"] = "Quest Options"
--Translation missing 
L["questdatamissing"] = "<quest data missing>"
--Translation missing 
L["questlog_quest_added"] = "|cff11DDFFDaily Global Check|r - Quest %s added to the custom quests pool."
--Translation missing 
L["quests_limit"] = "Quests limit reached (%s)"
--Translation missing 
L["questwindow"] = "- Select quest position -"
--Translation missing 
L["rclicktoopen"] = "Right-click to open the quick list selection menu"
--Translation missing 
L["rem"] = "Remove"
--Translation missing 
L["remmenuheader"] = "- Select the quest to remove -"
--Translation missing 
L["repeatable"] = "Repeatable"
--Translation missing 
L["s_tomtomset"] = "|cff11DDFFDaily Global Check|r - Waypoint added to TomTom"
--Translation missing 
L["search_by_name"] = "Search by name"
--Translation missing 
L["show_adjacent_map_icons"] = "Show on adjacent/continent maps"
--Translation missing 
L["shown"] = "Shown"
--Translation missing 
L["spell_id"] = "Spell ID"
--Translation missing 
L["tools"] = "Tools"
--Translation missing 
L["worldmap_icons"] = "Worldmap Icons"

-- Options
--Translation missing 
L["account_wide_options"] = "(Account-Wide Options)"
--Translation missing 
L["character_specific_options"] = "(Character-specific options)"
--Translation missing 
L["map_icons_visibility_list"] = "Map icons visibility for this List"
--Translation missing 
L["opt_coords"] = "Show coordinates"
--Translation missing 
L["opt_main"] = "Options"
--Translation missing 
L["opt_map"] = "Show world map icons"
--Translation missing 
L["opt_minimap"] = "Show minimap button"
--Translation missing 
L["opt_minimap_icons"] = "Show minimap icons"
--Translation missing 
L["opt_prefix"] = "Show prefix"
--Translation missing 
L["opt_questtype"] = "Show quest type"
--Translation missing 
L["opt_showquestbtn"] = "Show the 'Add quest to Custom List' button in the Quest Log Frame"
--Translation missing 
L["opt_suffix"] = "Show suffix"
--Translation missing 
L["opt_zonename"] = "Show zone name"
--Translation missing 
L["plugin_mapicons"] = "World map icons for this Plugin"
--Translation missing 
L["plugin_mapicons_minimap"] = "Minimap icons for this Plugin"
--Translation missing 
L["size"] = "Size"
--Translation missing 
L["toggle_all_pages"] = "Toggle All Pages"
--Translation missing 
L["tomtom_button"] = "Set TomTom waypoints"

else -- enUS
-- General
L["add"] = "Add"
L["add_quest"] = "Add Quest"
L["addbtntooltip"] = "Add the selected quest to your Daily Global Check Custom List"
L["added"] = "added"
L["availablelists"] = "Available Lists"
L["b_prefix"] = "Prefix"
L["b_questid"] = "Quest ID"
L["b_questname"] = "Quest Name"
L["b_suffix"] = "Suffix"
L["bf_err1"] = "|cff11DDFFDaily Global Check|r - You need to enter either the quest ID and its name."
L["bf_err2"] = "|cff11DDFFDaily Global Check|r - This quest already exists."
L["blacklist"] = "Blacklist"
L["buildframe"] = "Modify Custom List"
L["chars_deleted"] = "|cff11DDFFDaily Global Check|r - Character |cff00FF00%s|r is now in the blacklist"
L["chars_restored"] = "|cff11DDFFDaily Global Check|r - Character |cff00FF00%s|r has been removed from the blacklist"
L["classic"] = "Classic"
L["collapsed"] = "Collapsed"
L["coordinates"] = "Coordinates"
L["create_new_list"] = "Create a new list"
L["currency_id"] = "Currency ID"
L["customlist"] = "Custom List"
L["del_page"] = "Delete Page"
L["delete_list"] = "Delete List"
L["deleted"] = "deleted"
L["edit_mode"] = "Edit Mode"
L["edit_quest"] = "Edit Quest"
L["edit_questID_info"] = [=[You can insert multiple quest IDs each separated by one of the following keywords:
 %s : this element will result complete if at least one of the quests is completed.
 %s : this element will result complete only when all the quests are completed.]=]
L["edit_spell_info"] = "Tracks the cooldown of a spell, mostly useful with profession based spells"
L["generating_database"] = "Generating the %s database..."
L["help_edt_1"] = "You can create a new custom list by using the %s button."
L["help_edt_2"] = "You can rename the selected list by using the %s button."
L["help_edt_3"] = "This button permanently deletes the currently selected custom list."
L["help_edt_4"] = [=[This is the quest pool, you can drag any quest from here and drop it on the currently selected list.
- The %s button permanently deletes the relative custom quest from the quest pool.
- The %s button is used to edit the relative |cff00ff00custom|r quest.]=]
L["help_edt_5"] = [=[This is the selected custom list
- Quests can be repositioned by simply dragging them.
- A group of quests can be moved by using the %s buttons at the header's left.
- The %s button deletes the relative quest (it will still be available in the quest pool) or entire group from the list.
- The %s button is used to edit the relative |cff00ff00custom|r quest or rename the relative group.
- The 'New Quest' button creates a new quest in the quest pool and inserts it at the button's location, ready to be edited.
- The 'New Group' button simply creates a new group.]=]
L["help_edt_6"] = "These buttons are used to create or delete pages within the currently selected list."
L["help_edt_7"] = "Here you can select which section of the quest you wish to modify."
L["help_edt_8"] = "This frame can be used to edit the chosen quest section."
L["help_edt_9"] = "Click Okay to save your changes, or Cancel to revert them."
L["hidden"] = "Hidden"
L["lclicktoopen"] = "Left-click to open the main frame"
L["list_visibility"] = "List Visibility"
L["lists_limit"] = "Lists limit reached (%s)"
L["map_id"] = "Map ID"
L["map_options"] = "Map Options"
L["minimap_icons"] = "Minimap Icons"
L["move_down"] = "Move Selection Down"
L["move_up"] = "Move Selection Up"
L["namemissing"] = "<name missing>"
L["new_group"] = "New Group"
L["new_page"] = "New Page"
L["new_quest"] = "New Quest"
L["newlist"] = "New List"
L["news_#1"] = "Hi! I'm your assistant and I will show you the most important news about Daily Global Check"
L["news_#10"] = [=[World map icons from adjacent and continent maps are now hidden by default.
There is a new option in the Map Options panel to restore them]=]
L["news_#11"] = "Want to save talent sets and change talents with a click? Check out my new addon, |cff00ff00Talent Set Manager|r!"
L["news_#2"] = "You can print the current DGC page output in the chatframe by typing '/dgc print'"
L["news_#3"] = "Daily Global Check can track Instance Lockouts since v1.3.5! The related plugin can be found on Curse"
L["news_#4"] = "Weekly follower and Herb/Mining node counters are available in the Daily Global Check_Professions plugin"
L["news_#5"] = "The Rare Mobs plugin, as of v1.3.2, has two specific options available in the Options->Plugin panel"
L["news_#6"] = "Check out |cff00ff00DailyGlobalCheck_Hallow's End|r if you're interested in tracking Hallow's End dailies and candy buckets"
L["news_#7"] = "|cff00ffffMay 2016|r - |cffAAAAAAv|cff00ff001.5|r - Daily Global Check got a massive technical overhaul in preparation for Legion. The older plugins are incompatible and they will also need to be updated to the newer version, apologies for the inconvenience :)"
L["news_#8"] = "Groups can be collapsed by clicking on their title in the main frame, collapsed groups are hidden in mouseovering views"
L["news_#9"] = "You can hide map icons for chosen pages of any list through its Plugin Options"
L["news_bottomtext1"] = "|cff11DDFFLeft-Click|cffFFFFFF: |cff00FF00Next"
L["news_bottomtext2"] = "|cff11DDFFRight-Click|cffFFFFFF: |cff00FF00Hide|r"
L["nextpage"] = "Next Page"
L["nolist"] = "No list selected"
L["notitle"] = "<no title>"
L["opt_blacklist_remove"] = "Remove a character from the black list"
L["opt_characters"] = "Characters"
L["opt_characters_short"] = "(Alt)"
L["opt_help"] = "Help"
L["opt_hidecompleted"] = "Hide completed quests"
L["opt_map_all"] = "Only show world map icons from selected list"
L["plugin_opt_none"] = "The selected plugin doesn't have any specific options"
L["plugin_opt_title"] = "Options for the selected plugin:"
L["plugin_options"] = "Plugin Options"
L["prevpage"] = "Previous Page"
L["quest_options"] = "Quest Options"
L["questdatamissing"] = "<quest data missing>"
L["questlog_quest_added"] = "|cff11DDFFDaily Global Check|r - Quest %s added to the custom quests pool."
L["quests_limit"] = "Quests limit reached (%s)"
L["questwindow"] = "- Select quest position -"
L["rclicktoopen"] = "Right-click to open the quick list selection menu"
L["rem"] = "Remove"
L["remmenuheader"] = "- Select the quest to remove -"
L["repeatable"] = "Repeatable"
L["s_tomtomset"] = "|cff11DDFFDaily Global Check|r - Waypoint added to TomTom"
L["search_by_name"] = "Search by name"
L["show_adjacent_map_icons"] = "Show on adjacent/continent maps"
L["shown"] = "Shown"
L["spell_id"] = "Spell ID"
L["tools"] = "Tools"
L["worldmap_icons"] = "Worldmap Icons"

-- Options
L["account_wide_options"] = "(Account-Wide Options)"
L["character_specific_options"] = "(Character-specific options)"
L["map_icons_visibility_list"] = "Map icons visibility for this List"
L["opt_coords"] = "Show coordinates"
L["opt_main"] = "Options"
L["opt_map"] = "Show world map icons"
L["opt_minimap"] = "Show minimap button"
L["opt_minimap_icons"] = "Show minimap icons"
L["opt_prefix"] = "Show prefix"
L["opt_questtype"] = "Show quest type"
L["opt_showquestbtn"] = "Show the 'Add quest to Custom List' button in the Quest Log Frame"
L["opt_suffix"] = "Show suffix"
L["opt_zonename"] = "Show zone name"
L["plugin_mapicons"] = "World map icons for this Plugin"
L["plugin_mapicons_minimap"] = "Minimap icons for this Plugin"
L["size"] = "Size"
L["toggle_all_pages"] = "Toggle All Pages"
L["tomtom_button"] = "Set TomTom waypoints"

end
