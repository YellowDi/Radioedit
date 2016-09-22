local _,L = ...

if GetLocale()=="deDE" then

-- New strings in 4.3.5
	L["%s Click to search for all versions of this pet."] = nil
	L["Use the pet card on the unit frames during a pet battle instead of the default tooltip."] = nil
	L["Use Pet Cards In Battle"] = nil
	L["Use the pet card when viewing a link of a pet someone else sent you instead of the default link."] = nil
	L["%s Click to search for all teams that include this pet."] = nil
	L["Use Pet Cards For Links"] = nil

-- Strings removed in 4.3.5
	L["The number of Rematch teams that includes this pet."] = nil

-- New strings in 4.3.4
	L["Automatically track whether the loaded team won or lost only in a PVP battle and never for a PVE battle."] = nil
	L["Also prefer uninjured pets when loading pets from the queue."] = nil
	L["Show a card with team details when you mouseover a team.\n\n%sIMPORTANT:\124r While this option is enabled, clicking a team will lock the team card instead of loading it. %sDouble-Click\124r to load a team with this option enabled, just as you would Double-Click a pet to summon it."] = nil
	L["Show Team Cards"] = nil
	L["While pinned, the pet card will display where you last moved it.\n\nClick this to unpin the pet card and snap it back to the pets."] = nil
	L["Totals Across All Teams"] = nil
	L["Show Pet Card"] = nil
	L["And At Full Health"] = nil

-- Strings removed in 4.3.4
	L["While pinned, pet cards will display where you last moved it.\n\nClick this to unpin the pet card and snap it back to the pets."] = nil
	L["Automatically track whether the loaded team won or lost only in a PVP battle and never for a PVP battle."] = nil

-- New strings in 4.3.1
	L["Hide the win record button displayed to the right of each team.\n\nYou can still manually edit a team's win record from its right-click menu and automatic tracking will continue if enabled."] = nil
	L["For PVP Battles Only"] = nil
	L["Instead of displaying the win percentage of a team on the win record button, display the total number of wins.\n\nTeam tabs that are sorted by win record will sort by total wins also."] = nil
	L["Sort teams in this tab by their wins.\n\nFavorited teams will still list at the top."] = nil
	L["Sort By Wins"] = nil
	L["Automatically track whether the loaded team won or lost only in a PVP battle and never for a PVP battle."] = nil
	L["Hide Win Record Buttons"] = nil
	L["At the end of each battle, automatically record whether the loaded team won or lost.\n\nForfeits always count as a loss.\n\nYou can still manually update a team's win record at any time."] = nil

-- Strings removed in 4.3.1
	L["Hide Win Record"] = nil
	L["Hide the win record displayed beside each team. You can still manually edit a team's win record from its right-click menu and automatic tracking will continue if enabled."] = nil
	L["At the end of each battle, automatically record whether the loaded team won or lost.\n\nForfeits always count as a loss.\n\nThe game doesn't recognize a draw and will mark any battles you don't win as a loss.\n\nYou can still manually update a team's win record at any time to adjust these discrepancies."] = nil
	L["Sort By Win Record"] = nil
	L["Sort teams in this tab by the percent of battles they've won in their Win Record.\n\nFavorited teams will still list at the top."] = nil
	L["Instead of displaying the win percentage of a team, display the total number of wins."] = nil

-- New strings in 4.3.0
	L["A filter must be active before it can be saved."] = nil
	L["Injured pets cannot be caged."] = nil
	L["Auto Track Win Record"] = nil
	L["Sharing is disabled in options."] = nil
	L["This will look for teams with names that may include win-loss-draw stats and pull those into an actual win record before removing the numbers from the team name.\n\nDo you want to convert these teams?\n\nThe currently loaded team will be unloaded to prevent major complications.\n\n\124cffff1111Please backup your teams before attempting this!"] = nil
	L["Hide the win record displayed beside each team. You can still manually edit a team's win record from its right-click menu and automatic tracking will continue if enabled."] = nil
	L["+1 Loss"] = nil
	L["%s%d teams and %d battles were converted."] = nil
	L["+1 Draw"] = nil
	L["The Leveling Queue is empty."] = nil
	L["Edit Win Record"] = nil
	L["Are you sure?"] = nil
	L["Draws:"] = nil
	L["Sort By Win Record"] = nil
	L["This is already the top-most leveling pet."] = nil
	L["Are you sure you want to remove the custom sort order?\n\nThe saved order of teams will be lost and turning this option back on will not restore the old order."] = nil
	L["+1 Win"] = nil
	L["Targeting Options"] = nil
	L["Convert Team Names To Win Records"] = nil
	L["Done!"] = nil
	L["This will remove win record data for all teams and cannot be undone!"] = nil
	L["Instead of displaying the win percentage of a team, display the total number of wins."] = nil
	L["Press Ctrl+C to copy these teams to the clipboard. Then paste them into an email to yourself or a text file someplace safe.\n\nIf you ever need to restore your teams, paste them back in with Import Teams."] = nil
	L["Convert"] = nil
	L["Please Wait..."] = nil
	L["Sort teams in this tab by the percent of battles they've won in their Win Record.\n\nFavorited teams will still list at the top."] = nil
	L["This option is disabled while Custom Sort is active."] = nil
	L["While checked, you can rearrange the order of teams within this tab from the teams' right-click menu."] = nil
	L["Reset Win Record"] = nil
	L["Backup All Teams"] = nil
	L["Reset All Win Records"] = nil
	L["Slotted pets cannot be caged."] = nil
	L["This will export all teams across all tabs into text that you can paste elsehwere, such as an email to yourself or a text file someplace safe. You can later restore these teams with the Import Teams option."] = nil
	L["Display Total Wins Instead"] = nil
	L["Are you sure you want to remove all wins, losses and draws from the team \"%s\"?"] = nil
	L["At the end of each battle, automatically record whether the loaded team won or lost.\n\nForfeits always count as a loss.\n\nThe game doesn't recognize a draw and will mark any battles you don't win as a loss.\n\nYou can still manually update a team's win record at any time to adjust these discrepancies."] = nil
	L["Note: These are just your teams and their notes and preferences. Tab information, sort orders, win records, specific breeds and other settings are not included.\n\nFor the most complete backup of all your addon data, please backup your Word of Warcraft\\WTF folder."] = nil
	L["Slotted pets cannot be released."] = nil
	L["Losses:"] = nil
	L["%s%s\124r Battles"] = nil
	L["Wins:"] = nil
	L["Win Record"] = nil
	L["Hide Win Record"] = nil

-- Strings removed in 4.3.0
	L["While checked, you can rearrange the order of teams within this tab."] = nil
	L["Are you sure you want to sort teams alphabetically in this tab?\n\nThe custom sort order will be lost and cannot be undone."] = nil
	L["Team & Targeting Options"] = nil

-- New strings in 4.2.0
	L["Fill the leveling queue with one of each version of a pet that can level from the filtered pet list, regardless whether you have any at level 25 or one in the queue already."] = nil
	L["Fill the leveling queue with one of each version of a pet that can level from the filtered pet list, and for which you don't have a level 25 or one in the queue already."] = nil

-- Strings removed in 4.2.0
	L["Fill the leveling queue with one of each species that can level from the filtered pet browser, regardless whether you have any at level 25 already."] = nil
	L["Fill the leveling queue with one of each species that can level from the filtered pet browser, and for which you don't have a level 25 already."] = nil

-- New strings in 4.1.10
	L["In addition to the filters in this menu, you can further refine the pet list with the search box. Some search examples:\n\nPets: %sBlack Tabby\124r\nZones: %sSilithus\124r\nAbilities: %sSandstorm\124r\nText in abilities: %sBleed\124r\nLevels: %slevel=21-23\124r\nStats: %sspeed>300\124r\n\nSearches in \"quotes\" will limit results to only complete matches."] = nil
	L["Find Pets With This Ability"] = nil
	L["When pets are sorted by name, sort them by the name given with the Rename option instead of their original name."] = nil
	L["Sort By Chosen Name"] = nil

-- Strings removed in 4.1.10
	L["In addition to the filters in this menu, you can further refine the pet list with the search box. Some search examples:\n\nPets: %sBlack Tabby\124r\nZones: %sSilithus\124r\nAbilities: %sSandstorm\124r\nText in abilities: %sBleed\124r\nLevels: %slevel=21-23\124r\nStats: %sspeed>300\124r"] = nil

-- New strings in 4.1.9
	L["Rematch Debug Info"] = nil
	L["Draw attention to the safari hat button while a pet below max level is loaded.\n\nAlso show the Rematch window when a low level pet loads and the safari hat is not equipped."] = nil

-- Strings removed in 4.1.9
	L["Draw attention to the safari hat button while a team with a leveling pet is loaded and the hat is not equipped.\n\nAlso show the Rematch window when a team with a leveling pet loads and the safari hat is not equipped."] = nil

-- New strings in 4.1.8
	L["Safari Hat Reminder"] = nil
	L["Draw attention to the safari hat button while a team with a leveling pet is loaded and the hat is not equipped.\n\nAlso show the Rematch window when a team with a leveling pet loads and the safari hat is not equipped."] = nil

-- Strings removed in 4.1.8
	L["The Leveling Queue Is Empty"] = nil

-- New strings in 4.1.7
	L["Total Pets"] = nil
	L["Move Toolbar To Bottom"] = nil
	L["Toolbar Options"] = nil
	L["Move the toolbar buttons (Revive Battle Pets, Battle Pet Bandages, Safari Hat, etc) to the bottom of the standalone window.\n\nAlso convert the red panel buttons (Save, Save As, Find Battle) to toolbar buttons."] = nil
	L["You can also double-click a pet to summon or dismiss it."] = nil
	L["Pet Filter Options"] = nil

-- Strings removed in 4.1.7
	L["Pet Filters"] = nil

-- New strings in 4.1.6
	L["Show the Rematch window after leaving a pet battle."] = nil
	L["Show After Pet Battle"] = nil
	L["Alternate Lore Font"] = nil
	L["When a toolbar button is used with a right click, dismiss the Rematch window after performing its action."] = nil
	L["This treat's buff is already active."] = nil
	L["Use a more normal-looking font for lore text on the back of the pet card."] = nil
	L["Use an alternate style of lists for Pets, Teams and Queue to display more on the screen at once.\n\n\124cffff4040This option requires a Reload."] = nil
	L["Hide On Toolbar Right Click"] = nil
	L["Summons a random pet from your favorites."] = nil
	L["Auto load upon targeting only, not mouseover.\n\n\124cffff4040WARNING!\124r This is not recommended! It can be too late to load pets if you target with right click!"] = nil

-- Strings removed in 4.1.6
	L["Use an alternate style of lists for Pets, Teams and Queue that shrinks each list item to display more on the screen at once.\n\n\124cffff4040This option requires a Reload."] = nil

-- New strings in 4.1.4
	L["Are you sure you want to delete the script named %s%s\124r?"] = nil
	L["Pet Filter Script Error"] = nil
	L["Hybrid Counters"] = nil
	L["Create a new pet filter."] = nil
	L["\124TInterface\\RaidFrame\\ReadyCheck-Ready:16\124t Script ran without errors!"] = nil
	L["New Script"] = nil
	L["line "] = nil
	L["Script"] = nil
	L["Partially Leveled"] = nil
	L["Unique Abilities"] = nil
	L["Error in %s"] = nil
	L["Delete Script"] = nil
	L["These variables are defined as the script runs for each pet:\n\n\124cffffd200owned\124r \124cffaaaaaa(boolean)\124r\nWhether the pet is owned by the player.\n\n\124cffffd200petID\124r \124cffaaaaaa(string)\124r\nUnique ID of the owned pet, such as \"BattlePet-0-000004A98F18\".\n\n\124cffffd200speciesID\124r \124cffaaaaaa(number)\124r\nShared ID of the pet's family. Black Tabby Cats are species 42.\n\n\124cffffd200customName\124r \124cffaaaaaa(string)\124r\nName given to the pet by the player.\n\n\124cffffd200level\124r \124cffaaaaaa(number)\124r\nLevel of the pet, or nil for uncollected pets.\n\n\124cffffd200xp\124r \124cffaaaaaa(number)\124r\nAmount of xp the pet has in its current level.\n\n\124cffffd200maxXp\124r \124cffaaaaaa(number)\124r\nTotal amount of xp required to reach the pet's next level.\n\n\124cffffd200displayID\124r \124cffaaaaaa(number)\124r\nA numeric representation of a pet's model skin.\n\n\124cffffd200isFavorite\124r \124cffaaaaaa(boolean)\124r\nWhether the pet is favorited by the player.\n\n\124cffffd200name\124r \124cffaaaaaa(string)\124r\nTrue name of the pet species.\n\n\124cffffd200icon\124r \124cffaaaaaa(string)\124r\nTexture path of the pet's icon.\n\n\124cffffd200petType\124r \124cffaaaaaa(number)\124r\nValue between 1 and 10 for its type. 1=Humanoid, 2=Dragonkin, etc.\n\n\124cffffd200creatureID\124r \124cffaaaaaa(number)\124r\nThe npcID of the pet when it's summoned.\n\n\124cffffd200sourceText\124r \124cffaaaaaa(string)\124r\nFormatted text describing where the pet is from.\n\n\124cffffd200description\124r \124cffaaaaaa(string)\124r\nLore text of the species.\n\n\124cffffd200isWild\124r \124cffaaaaaa(boolean)\124r\nWhether the pet was a captured wild pet.\n\n\124cffffd200canBattle\124r \124cffaaaaaa(boolean)\124r\nWhether the pet can battle.\n\n\124cffffd200tradable\124r \124cffaaaaaa(boolean)\124r\nWhether the pet can be caged.\n\n\124cffffd200unique\124r \124cffaaaaaa(boolean)\124r\nWhether no more than one of the pet can be known at a time.\n\n\124cffffd200abilityList\124r \124cffaaaaaa(table)\124r\nArray of abilityIDs used by the species.\n\n\124cffffd200levelList\124r \124cffaaaaaa(table)\124r\nArray of levels the abilityIDs are learned."] = nil
	L["\124cffffd200-\124r Scripts are a way to create custom pet filters.\n\n\124cffffd200-\124r Scripts are Lua code and require some knowledge of the language and API to create your own filters.\n\n\124cffffd200-\124r Scripts run for each pet and should return true if the pet is to be listed.\n\n\124cffffd200-\124r Some variables are filled in as the script runs for each pet. See \124cffffd200Pet Variables\124r.\n\n\124cffffd200-\124r Scripts run in a restricted environment with no access outside its environment. See \124cffffd200Exposed API\124r.\n\n\124cffffd200-\124r All variables/tables created exist only in this environment and disappear when the filter finishes.\n\n\124cffffd200-\124r If the first line of the script is a --comment, it will be used as a tooltip in the Script menu."] = nil
	L["\124TInterface\\RaidFrame\\ReadyCheck-NotReady:16\124t Error %s"] = nil
	L["Unnamed Pets"] = nil
	L["Pets Without Rares"] = nil
	L["Test"] = nil
	L["The script environment is restricted with access to only common Lua and the following:\n\n\124cffffd200C_PetJournal \124cffaaaaaa(table)\124r\nThe default API for journal functions.\n\n\124cffffd200C_PetBattles \124cffaaaaaa(table)\124r\nThe default API for the battle UI.\n\n\124cffffd200GetBreed \124cffaaaaaa(function)\nArgument:\124r petID\n\124cffaaaaaaReturns:\124r The numeric breed (3-12) of a petID if one of the supported breed addons is enabled.\n\n\124cffffd200GetSource \124cffaaaaaa(function)\nArgument:\124r speciesID\n\124cffaaaaaaReturns:\124r The numeric source (1-10) of a speciesID. 1=Drop, 2=Quest, etc.\n\nA few iterator functions are also provided if you need to compare a pet against others. These are used in a for loop such as:\n\n\124cffcccccc    for speciesID in \124cffffd200AllSpeciesIDs()\124cffcccccc do\n      -- do something with speciesID\n    end\124r\n\n\124cffffd200AllSpeciesIDs \124cffaaaaaa(iterator function)\nReturns:\124r The next speciesID of all existing unique pets.\n\n\124cffffd200AllPetIDs \124cffaaaaaa(iterator function)\nReturns:\124r The next petID of all owned pets.\n\n\124cffffd200AllPets \124cffaaaaaa(iterator function)\nReturns:\124r The next petID or speciesID of all pets in the master list. Owned pets return a petID string, uncollected pets return a speciesID number.\n\n\124cffffd200AllAbilities \124cffaaaaaa(iterator function)\nArgument:\124r speciesID\n\124cffaaaaaaReturns:\124r The next abilityID and level of the ability for a speciesID.\n\124cffffd200Note:\124r abilityList and levelList are already defined for each pet as your script runs. Use this iterator if you need to gather abilities of other pets for comparison. See the Unique Abilities script for an example.\n\n\124cffffd200If you would like anything else exposed please post a comment on wowinterface, curse or warcraftpet's Rematch 4.0 thread."] = nil
	L["Pet Variables"] = nil
	L["Exposed API"] = nil

-- New strings in 4.1.2
	L["Current Scale: %d%%"] = nil
	L["Change the relative size of the standalone window to anywhere between 50% and 200% of its standard size."] = nil
	L["Click here to choose a different scale for the standalone window."] = nil
	L["This scale determines the relative size of the standalone window, where 100% is the standard size."] = nil
	L["Use Custom Scale"] = nil
	L["\n\n%sThis will close the journal and open the standalone window."] = nil
	L["Custom Scale"] = nil
	L["Keep this scale?"] = nil

-- Strings removed in 4.1.2
	L["Smaller Standalone Window"] = nil
	L["Shrink the standalone window and pet cards by 20%."] = nil
	L["No Preferences"] = nil

-- New strings in 4.1.1
	L["%s%s Preferences Paused"] = nil
	L["%s Resume Preferences"] = nil
	L["%s Pause Preferences"] = nil
	L["Pause Preferences"] = nil

-- New strings in 4.1.0
	L["Tab"] = nil
	L["Tab Preferences"] = nil
	L["Leveling Preferences For %s:"] = nil
	L["Set leveling preferences for all teams within this tab.\n\nIf a team within this tab also has preferences, the tab's preferences will take priority over the team's preferences."] = nil
	L["Team Preferences"] = nil
	L["%s %sTab Preferences"] = nil
	L["Save Without Leveling Slots"] = nil

	-- 4.1.0-beta-04
	L["When manually clearing filters, don't clear the search box too.\n\nSome actions, such as logging in or Find Similar, will always clear search regardless of this setting."] = "Das Suchfeld nicht leeren wenn Filter manuell entfernt werden.\n\nManche Aktionen, wie zum Beispiel neu ins Spiel einloggen oder \"Ähnliche finden\", werden trotzdem das Suchfeld leeren."
	L["Use an alternate style of lists for Pets, Teams and Queue that shrinks each list item to display more on the screen at once.\n\n\124cffff4040This option requires a Reload."] = "Eine alternative Darstellungsmethode für Haustiere, Teams und die Liste darstellen. Diese Version schrumpft alle Listenelemente um mehr auf einmal anzuzeigen.\n\n\124cffff4040Diese Option erfordert, dass das Interface neu geladen wird."
	L["The%s icon indicates new options."] = "Das%s deutet auf neue Optionen hin."
	L["Compact List Format"] = "Kompakte Listen"
	L["You've chosen to change the setting for Compact List Format.\n\nThis change doesn't take effect until a reload or logout."] = "Du hast das kompakte Listenformat gewählt.\n\nDiese Änderung wird erst nach einem Login aktiv oder wenn das Interface neu geladen wird"
	L["Combine Pets And Queue"] = "Reiter Haustiere und Liste vereinen"
	L["Reload the UI now?"] = "Interface jetzt neu laden?"
	L["When loading pets from the queue, skip dead pets and load living ones first."] = "Wenn Haustiere aus der Liste geladen werden, nur lebendige nutzen."
	L["Pet Filters"] = "Haustierfilter"
	L["Don't Reset Search With Filters"] = "Suche nicht mit den Filtern leeren"
	L["Also use smaller text in the Compact List Format so more text displays on each button."] = "In der Kompaktanzeige auch kleineren Text verwenden um mehr Text an den Buttons darzustellen"
	L["Load Team"] = "Team laden"
	L["Expected Damage Taken"] = "Erwarteter Schaden"
	L["Has Notes"] = "Hat Notizen"
	L["Use Smaller Text Too"] = "Auch kleinere Schrift verwenden"
	L["Prefer Living Pets"] = "Lebendige Haustiere bevorzugen"
	L["Notes"] = "Notizen"
	L["In single panel mode, combine the Pets and Queue tabs together. A narrow queue will display to the right of the pet list instead of in a separate tab."] = "Reiter für Haustiere und Liste in der einzelnen Benutzeroberfläche zusammenfügen. Eine schmale Liste rechts von den Haustieren ersetzt die Liste."
	L["You have %s%.1f%%\124r of all unique pets."] = "Du hast %s%.1f%%\124r der einzigartigen Haustiere."

-- Main.lua
	L["Rematch"] = nil
	L["Toggle Window"] = "Ein-/ Ausschalten"
	L["Auto Load"] = "Automatisches Laden"
	L["Team Notes"] = "Team Notizen"
	L["Pets Tab"] = "Haustiere"
	L["Teams Tab"] = "Teams"
	L["Queue Tab"] = "Liste"
	L["Toggle Rematch"] = "Rematch ein-/ausschalten"
	L["Load this team?"] = "Dieses Team laden?"
	L["They do not appear to be online."] = "Sie scheinen nicht online zu sein."
	L["has also been added to your leveling queue!"] = "wurde ebenfalls Deiner Liste zum Leveln hinzugefügt!"
	L["The team named '%s' can't be found."] = "Das Team namens '%s' wurde nicht gefunden."

-- Utils.lua
	L["Leveling Pet"] = "Haustier zum Leveln"

-- Widgets\PetListButtons.lua
	L["The Leveling Queue Is Empty"] = "Die Liste ist leer"
	L["Empty Battle Pet Slot"] = "Leerer Haustierkampf-Slot"
	L["This pet can't level."] = "Dieses Haustier kann nicht kämpfen."
	L["Only pets that can battle and are under 25 can go in the leveling queue."] = "Nur Haustiere unter Stufe 25 die auch kämpfen können, können der Liste hinzugefügt werden."

-- Widgets\Toolbar.lua
	L["Dismiss Pet"] = "Haustier wegschicken"
	L["Summon Pet"] = "Haustier beschwören"
	L["Random Favorite"] = "Zufälliges Haustier aus den Favoriten"
	L["Random From All"] = "Zufälliges Haustier"
	L["All pets are at full health."] = "Alle Haustiere haben volles Leben."

-- Widgets\MinimapButton.lua
	L["Load Favorite Team"] = "Bevorzugtes Team laden"
	L["Favorite Teams"] = "Bevorzugte Teams"

-- Widgets\PanelTabs.lua

-- Process\PetLoading.lua
	L["You can't load a team during combat."] = "Im Kampf können keine Teams geladen werden."
	L["You can't load a team during a pet battle."] = "Während eines Haustierkampfes können keine Teams geladen werden."
	L["You can't load a team in a matched pet battle."] = "Während eines Haustierkampfes können keine Teams geladen werden."
	L["Loading..."] = "Lädt..."
	L["Pets are missing from this team!"] = "Haustiere aus diesem Team fehlen!"
	L["Substitutes were found. Please review the loaded team and click Save if you'd like to keep the chosen pets."] = "Alternativen wurden gefunden. Bitte prüfe das geladene Team und klicke auf Speichern wenn Du die ausgewählten Haustiere übernehmen möchtest."
	L["Don't Warn About Missing Pets"] = "Nicht bei fehlenden Haustieren warnen"

-- Process\Roster.lua
	L["Favorites"] = "Favoriten"
	L["Types"] = "Typen"
	L["Strong Vs"] = "Stark gegen"
	L["Tough Vs"] = "Zäh gegen"
	L["Breed"] = "Brut"
	L["Similar"] = "Ähnlich"
	L["Level"] = "Stufe"
	L["Leveling"] = "Wird geleveled"
	L["Tradable"] = "Handelbar"
	L["Battle"] = "Kampf"
	L["Quantity"] = "Menge"
	L["Team"] = nil
	L["Hidden"] = "Versteckt"
	L["Zone"] = "Zone"
	L["Search"] = "Suchen"
	L["Sort"] = "Sortieren"

-- Process\QueueProcess.lua
	L["All done leveling pets!"] = "Alle ausgewählten Haustiere sind auf 25!"
	L["Rematch's leveling queue is empty"] = "Die Liste zum Leveln ist leer"
	L["Now leveling:"] = "Jetzt am Leveln:"

-- Process\Sanctuary.lua

-- Menus\Menu.lua
	L["Help"] = "Hilfe"

-- Menus\TeamMenus.lua
	L["Unload Team"] = "Team aus den Slots entfernen"
	L["Edit Team"] = "Team editieren"
	L["Set Notes"] = "Notizen setzen"
	L["Set Preferences"] = "Einstellungen ändern"
	L["Move To"] = "Verschieben zu"
	L["Move To Top"] = "An den Anfang verschieben"
	L["Move Up"] = "Nach oben verschieben"
	L["Move Down"] = "Nach unten verschieben"
	L["Move To End"] = "Ans Ende verschieben"
	L["Share"] = "Teilen"
	L["Delete this team?"] = "Dieses Team löschen?"
	L["Put Leveling Pet Here"] = "Haustier zum Leveln hier einfügen"
	L["Add a leveling pet to this team?"] = "Diesem Team ein Haustier zum Leveln hinzufügen?"
	L["Export As Plain Text"] = "Als reinen Text exportieren"
	L["Export this team in plain text that you can copy elsewhere, such as forums or emails.\n\nThe plain text format is best for sharing a team with others that may not use Rematch.\n\nOther Rematch users can paste this team into their Rematch via Import Team."] = "Dieses Team als Text exportieren, den Du in Foren oder Mails kopieren kannst.\n\nDie Textversion ist ideal, um ein Team mit anderen zu teilen, die Rematch nicht benutzen.\n\nNutzer von Rematch können den Text direkt importieren."
	L["Export As String"] = "Als String exportieren"
	L["Export this team as a string you can copy elsewhere, such as forums or emails.\n\nThe string format is best for copying multiple teams to be imported together, or for sharing teams with someone in another language.\n\nOther Rematch users can paste this team into their Rematch via Import Team."] = "Dieses Team als String exportieren, den Du in Foren oder Mails kopieren kannst.\n\nDas String-Format ist ideal, um mehrere Teams auf einmal zu teilen oder Teams für Nutzer anderer Sprache zugänglich zu machen.\n\nNur Nutzer von Rematch können Strings direkt importieren."
	L["Import Team"] = "Team importieren"
	L["Import a single team or many teams that was exported from Rematch."] = "Ein einzelnes oder mehrere Teams importieren."
	L["Send Team"] = "Team senden"
	L["Send this team to another online user of Rematch."] = "Dieses Team an einen anderen Spieler senden der Rematch nutzt."
	L["Prompt To Load"] = "Aufforderung zum Laden von Teams anzeigen"
	L["When your new target has a saved team not already loaded, and the target panel isn't on screen, display a popup asking if you want to load the team.\n\nThis is only for the first interaction with a target. You can always load a target's team from the target panel."] = "Wenn ein neues Ziel ein Team gespeichert hat, das derzeit nicht aktiv ist, und Rematch nicht angezeigt wird, wird mit dieser Option ein Pop-Up Fenster angezeigt mit der Aufforderung das Team zu laden\n\nDies passiert nur bei der ersten Interaktion mit dem Ziel. Du kannst unabhängig davon jederzeit ein Ziel über das Rematch-Fenster laden."
	L["With Rematch Window"] = "Mit Rematch Fenster"
	L["Prompt to load with the Rematch window instead of a separate popup dialog."] = "Mit dem Rematch Fenster auffordern statt über ein separates Pop-Up."
	L["Always Prompt"] = "Immer auffordern"
	L["Prompt every time you interact with a target with a saved team not already loaded, instead of only the first time."] = "Bei jeder Interaktion mit einem Ziel eine Aufforderung anzeigen wenn das dafür gespeicherte Team nicht geladen ist, statt nur beim ersten Mal."
	L["When you mouseover a new target that has a saved team not already loaded, immediately load it.\n\nThis is only for the first interaction with a target. You can always load a target's team from the target panel."] = "Wenn mit der Maus über ein Ziel gefahren wird, das ein Team gespeichert hat aber derzeit nicht aktiv ist, direkt das Team laden.\n\nDies passiert nur bei der ersten Interaktion mit dem Ziel. Du kannst unabhängig davon jederzeit ein Ziel über das Rematch-Fenster laden."
	L["Show After Loading"] = "Nach dem Laden anzeigen"
	L["After a team auto loads, show the Rematch window."] = "Das Rematch Fenster anzeigen, nachdem ein Team automatisch geladen wurde."
	L["Show On Injured"] = "Anzeigen wenn verletzt"
	L["When a team auto loads, show the Rematch window if any pets are injured."] = "Wenn ein Team automatisch geladen wird, wird das Rematch angezeigt sofern Haustiere verletzt sind."
	L["On Target Only"] = "Nur beim Anvisieren."
	L["Auto load upon targeting only, not mouseover.\n\n\124cffff4040WARNING!\124r This is not recommended! It can be too late to load pets if you target with right-click!"] = "Teams werden nur automatisch geladen, wenn ein Ziel anvisiert wird, nicht aber wenn mit der Maus darübergefahren wird.\n\n\124cffff4040WARNUNG!\124r Diese Einstellung ist nicht empfohlen! Wenn ein Ziel mit Rechts-Klick aktiviert wird, kann es zu spät sein bis die Haustiere geladen werden und der Kampf bereits beginnt!"
	L["Export Listed Teams"] = "Aufgelistete Teams exportieren"
	L["Export all teams listed below to a string you can copy elsewhere, such as forums or emails.\n\nOther Rematch users can then paste these teams into their Rematch via Import Teams.\n\nYou can export a single team by right-clicking one and choosing its Share menu."] = "Exportiere alle unten aufgelisteten Teams zu einem String, den Du in Foren oder Mails kopieren kannst.\n\nAndere Nutzer von Rematch können Strings direkt importieren.\n\nDu kannst auch ein einzelnes Team exportieren indem Du darauf rechts-klickst und das Teilen Menü auswählst."
	L["Import Teams"] = "Teams importieren"
	L["Import From Pet Battle Teams"] = "Import From Pet Battle Teams"
	L["Copy your existing teams from Pet Battle Teams to Rematch."] = "Copy your existing teams from Pet Battle Teams to Rematch."

-- Menus\PetMenus.lua
	L["Find Similar"] = "Ähnliche finden"
	L["Enter a new name"] = "Neuen Namen angeben"
	L["List %d Teams"] = "%d Team(s) auflisten"
	L["Hide Pet"] = "Haustier verstecken"
	L["Unhide Pet"] = "Haustier nicht mehr verstecken"
	L["Release this pet?"] = "Dieses Haustier freilassen?"
	L["Once released, this pet is gone forever!"] = "Einmal freigelassen ist das Haustier für immer weg!"
	L["Start Leveling"] = "Anfangen zu Leveln"
	L["Add To Leveling Queue"] = "Der Liste fürs Leveln hinzufügen"
	L["Stop Leveling"] = "Aufhören zu Leveln"
	L["Only Favorites"] = "Nur Favoriten"
	L["Favorite Filters"] = "Bevorzugte Filter"
	L["Pet Filter"] = "Haustierfilter"
	L["In addition to the filters in this menu, you can further refine the pet list with the search box. Some search examples:\n\nPets: %sBlack Tabby\124r\nZones: %sSilithus\124r\nAbilities: %sSandstorm\124r\nText in abilities: %sBleed\124r\nLevels: %slevel=21-23\124r\nStats: %sspeed>300\124r"] = "Zusätzlich zu den Filtern in diesem Menü kannst Du die Haustierliste über das Suchfeld weiter verfeinern. Ein paar Beispiele:\n\nHaustiere: %sSchwarze Tigerkatze\124r\nZonen: %sSilithus\124r\nFähigkeiten: %sSandsturm\124r\nText in Fähigkeiten: %sBluten\124r\nStufen: %sStufe=21-23\124r\nStatuswerte: %sGeschwindigkeit>300\124r"
	L["Reset All"] = "Alle zurücksetzen"
	L["Checkbox Groups"] = "Kontrollkästchengruppen"
	L["In filter menus, checkbox groups assume if nothing is checked you want to view all choices.\n\nYou can also:\n\n%s[Shift]+Click\124r to check all except the box clicked.\n\n%s[Alt]+Click\124r to uncheck all except the box clicked."] = "Die Kontrollkästchengruppen in den Filtermenüs nehmen mit dieser Einstellung an, dass alles angezeigt wird, wenn du nichts angewählt hast.\n\nDu kannst alle Kontrollkästchen außer dem gewählten über %s[Umschalt]+Klick\124r aktivieren.\n\nÜber %s[Alt]+Klick\124r kannst du alle außer dem ausgewählten Kontrollkästchen abwählen."
	L["Low Level (1-7)"] = "Niedrigstufig (1-7)"
	L["Mid Level (8-14)"] = "Mittlere Stufe (8-14)"
	L["High Level (15-24)"] = "Hochstufig (15-24)"
	L["Max Level (25)"] = "Maximalstufe (25)"
	L["Without Any 25s"] = "Ohne Stufe 25"
	L["Moveset Not At 25"] = "Fähigkeiten nicht auf 25"
	L["You can filter to a specific level or range of levels in the search box. For example, search for:\n\n\%slevel=1\124r\nor\n\%slevel=21-23\124r"] = "Du kannst im Suchfeld nach einer bestimmten Stufe oder einem Stufenbereich filtern. Zum Beispiel: \n\n\%sStufe=1\124r\noder\n\%sStufe=21-23\124r"
	L["All breed data is pulled from your installed %s%s\124r addon.\n\nThe breed \"New\" categorizes pets with no breed data. Keep your breed addon up to date to see if they have new data."] = "Alle Brutdaten werden vom Add-On %s%s\124r ausgelesen.\n\nDie Brutkategorie \"Neu\" hat keine vorhanden Daten. Dies passiert meist bei neuen Haustieren und kann behoben werden, indem Du das Add-On aktualisierst."
	L["Not Leveling"] = "Nicht am Leveln"
	L["Not Tradable"] = "Nicht handelbar"
	L["Can Battle"] = "Kann kämpfen"
	L["Can't Battle"] = "Kann nicht kämpfen"
	L["One Copy"] = "Eine Kopie"
	L["Two+ Copies"] = "Zwei+ Kopien"
	L["Three+ Copies"] = "Drei+ Kopien"
	L["In A Team"] = "In einem Team"
	L["Not In A Team"] = "Nicht in einem Team"
	L["Current Zone"] = "Momentane Zone"
	L["Hidden Pets"] = "Versteckte Haustiere"
	L["Reverse Sort"] = "Sortierung umkehren"
	L["Favorites First"] = "Favoriten zuerst"
	L["Sort By"] = "Sortieren nach"
	L["You can filter to a specific range of stats too. For example, search for:\n\n\%shealth>500\124r\nor\n\%sspeed=200-300\124r\n\nThe sort order is not ordinarily reset when filters are reset. The option %sReset Sort With Filters\124r in the Options tab will reset the sort when you reset the filters."] = "Du kannst auch nach einem bestimmten Bereich an Statuswerten filtern. Zum Beispiel: \n\n\%sLebenspunkte>500\124r\noder\n\%sGeschwindigkeit=200-300\124r\n\nDie Sortierungsreihenfolge wird normalerweise nicht mit einem Filter zurückgesetzt. Mit der Option \"Sortierung mit den Filtern zurücksetzen\" kannst Du das ändern."
	L["Save Filter"] = "Filter speichern"
	L["Save this as a favorite filter?"] = "Diesen Filter als Favoriten speichern?"
	L["Filters: %s%s\124r\n\nChoose a name to use in the Favorite Filters menu:"] = "Filter:  %s%s\124r\n\nWähle einen Namen der in den Filter-Favoriten benutzt werden soll:"
	L["Note: Search text and Sort order are not included in the filter."] = "Hinweis: Suchtext und Sortierungsreihenfolge werden nicht mit einem Filter mitgespeichert"
	L["Delete Filter"] = "Filter löschen"
	L["Are you sure you want to delete the filter named %s%s\124r?"] = "Sicher, dass Du den Filter namens %s%s\124r löschen möchtest?"
	L["Hide this pet?"] = "Dieses Haustier verstecken?"
	L["Don't Ask When Hiding Pets"] = "Beim Verstecken von Haustieren nicht nachfragen"
	L["Are you sure you want to hide all versions of %s%s\124r?\n\nHidden pets will not show up in the pet list or searches. You can view or unhide these pets in the 'Other' filter."] = "Sicher, dass alle Versionen von %s%s\124r versteckt werden sollen?\n\nVersteckte Haustiere werden nicht mehr in der Liste oder in Suchen auftauchen. Du kannst versteckte Haustiere nur über den \"Anderes\" Filter einsehen."

-- Menus\Npcs.lua
	L["Eastern Kingdom"] = "Östliche Königreiche"
	L["Kalimdor"] = nil
	L["Outland"] = "Scherbenwelt"
	L["Northrend"] = "Nordend"
	L["Cataclysm"] = nil
	L["Pandaria"] = nil
	L["Beasts of Fable"] = "Fabelhafte Wesen"
	L["Celestial Tournament"] = "Turnier der Erhabenen"
	L["Draenor"] = nil
	L["Garrison"] = "Garnison"
	L["Menagerie"] = nil
	L["Tanaan Jungle"] = "Tanaandschungel"
	L["No Target"] = "Kein Ziel"
	L["Noteworthy Targets"] = "Nennenswerte Ziele"
	L["These are noteworthy targets such as tamers and legendary pets.\n\nChoose one to view the pets you would battle.\n\nTargets with a \124TInterface\\RaidFrame\\ReadyCheck-Ready:14\124t already have a team saved."] = "Dies sind nennenswerte Ziele wie zum Beispiel Haustiertrainer oder legendäre Haustiere.\n\nWähle ein Ziel aus um die Haustiere zu sehen, gegen die Du kämpfen würdest.\n\nZiele mit einem \124TInterface\\RaidFrame\\ReadyCheck-Ready:14\124t haben bereits ein gespeichertes Team."



-- Dialogs\Dialog.lua
	L["Tab:"] = "Reiter:"

-- Cards\PetCard.lua
	L["Vs"] = nil
	L["Damage\nTaken"] = "Schaden\nerhalten"
	L["from"] = "von"
	L["abilities"] = "Fähigkeiten"
	L["Unpin Pet Card"] = "Haustierkarte lösen"
	L["While pinned, pet cards will display where you last moved it.\n\nClick this to unpin the pet card and snap it back to the pets."] = "Angeheftete Haustierkarten werden dort angezeigt, wo Du sie zuletzt hingeschoben hast.\n\nWähl diese Option um die Haustierkarte loszulösen, dann wird sie wieder bei den Haustieren angezeigt."
	L["Pet Card"] = "Haustierkarte"
	L["Hold [Alt] to view more about this pet."] = "Halte [ALT] gedrückt um mehr Informationen über dieses Haustier zu erhalten"
	L["XP: %d/%d (%d%%)"] = nil
	L["Possible Breeds"] = "Mögliche Brutarten"
	L["Slotted"] = "Eingefügt"
	L["This pet is loaded in one of the three battle pet slots."] = "Dieses Haustier ist in einen der drei Haustierslots geladen."
	L["Favorite"] = "Favorit"
	L["This pet is marked as a Favorite from its right-click menu."] = "Dieses Haustier ist über das Rechtsklick-Menü als Favorit gewählt."
	L["This pet is in Rematch's leveling queue."] = "Dieses Haustier ist in der Liste zum Leveln."
	L["Determines how stats are distributed.  All breed data is pulled from your installed %s%s\124r addon."] = "Setzt fest wie Statuswerte verteilt werden. Alle Daten über Brutarten werden von %s%s\124r geladen."
	L["%d Teams"] = nil
	L["Teams"] = nil
	L["The number of Rematch teams that includes this pet."] = "Die Anzahl an Rematch Teams die dieses Haustier beinhalten."
	L["When this team loads, your current leveling pet will go in this spot."] = "Wenn dieses Team geladen wird, wird ein Haustier aus der Liste zum Leveln in diesen Slot gesetzt."
	L["This is an opponent pet."] = "Dies ist ein gegnerisches Haustier."
	L["All breed data pulled from %s%s\124r."] = "Alle Brutdaten werden geladen von %s%s\124r."
	L["Stats At Level 25 \124cff0070ddRare"] = "Statuswerte auf Stufe 25 \124cff0070ddRare"
	L["No known breeds :("] = "Keine bekannten Brutarten :("

-- Cards\Notes.lua
	L["Pet Notes"] = "Haustiernotizen"
	L["Delete Notes"] = "Notizen löschen"
	L["Are you sure you want to delete the notes for %s\124r?"] = "Sicher, dass Du die Notizen für %s\124r löschen möchtest?"

-- Panels\PetPanel.lua
	L["Strong vs"] = "Stark gegen"
	L["Tough vs"] = "Zäh gegen"
	L["Pets: %s%d"] = "Haustiere: %s%d"
	L["Filters: %s%s"] = "Filter:  %s%s"

-- Panels\LoadoutPanel.lua
	L["Target has a saved team"] = "Team gefunden"
	L["Load"] = "Laden"
	L["Load the team saved for this target."] = "Team laden, das für dieses Ziel gespeichert ist."
	L["This target has no saved team"] = "Kein gespeichertes Team"
	L["Save the currently loaded pets to this target."] = "Die derzeit aktiven Haustiere für dieses Ziel speichern."

-- Panels\TeamPanel.lua

-- Panels\QueuePanel.lua
	L["Ascending Level"] = "Aufsteigend nach Stufe"
	L["Descending Level"] = "Absteigend nach Stufe"
	L["Median Level"] = "Mittelwert Stufe"
	L["Type"] = "Typ"
	L["Queue paused."] = "Liste pausiert."
	L["Queue paused while in combat."] = "Die Liste ist im Kampf pausiert."
	L["Queue paused while in a pet battle."] = "Die Liste ist im Kampf pausiert."
	L["Queue paused while queued for pet pvp."] = "Die Liste ist im Kampf pausiert."
	L["Drag pets you want to level here.\n\nWhen a team is saved with one of these pets, the current leveling pet will take its place when the team is loaded.\n\nWhen a pet reaches level 25 (gratz!) it will leave the queue and the next pet in the queue will become the current leveling pet.\n\nSlots with a \124cffffd200gold\124r border are controlled by the leveling queue."] = "Ziehe Haustiere, die du Leveln möchtest, hierher.\n\nWenn ein Team mit einem solchen Haustier gespeichert wird, wird immer ein Haustier aus der Liste dort eingesetzt.\n\nSobald ein Haustier Stufe 25 erreicht (gz!) wird es aus der Liste verschwinden und das nächste Haustier wird seinen Platz einnehmen.\n\nSlots mit einem \124cffffd200gold\124r Rahmen werden von der Liste kontrolliert."
	L["Sort by:"] = "Sortieren nach:"
	L["Sort all pets in the queue from level 1 to level 24."] = "Alle Haustiere in der Liste sortieren von Stufe 1 bis Stufe 24."
	L["Sort all pets in the queue for levels closest to 10.5."] = "Alle Haustiere sortieren, mit Priorität je näher sie an Stufe 10,5 sind."
	L["Sort all pets in the queue from level 24 to level 1."] = "Alle Haustiere in der Liste sortieren von Stufe 24 bis Stufe 1."
	L["Sort all pets in the queue by their types."] = "Alle Haustiere in der Liste nach ihrem Typ sortieren."
	L["Active Sort"] = "Aktive Sortierung"
	L["The queue will stay sorted in the order chosen. The order of pets may automatically change as they gain xp or get added/removed from the queue.\n\nYou cannot manually change the order of pets while the queue is actively sorted."] = "Die Liste wird nach der gewählten Option sortiert bleiben. Die Reihenfolge der Haustiere wird automatisch angepasst wenn Sie Erfahrung erhalten oder Haustiere hinzugefügt bzw. von der Liste entfernt werden.\n\nMit dieser Einstellung kann die Reihenfolge nicht mehr manuell geändert werden."
	L["No Preferences"] = "Keine Präferenzen"
	L["Suspend all preferred loading of pets from the queue, except for pets that can't load."] = "Das Laden bevorzugter Haustiere aussetzen für alle Haustiere aus der Liste, außer wenn ein Haustier nicht geladen werden kann."
	L["Fill Queue"] = "Liste auffüllen"
	L["Fill the leveling queue with one of each species that can level from the filtered pet browser, and for which you don't have a level 25 already."] = "Die Liste mit einem Haustier aus jeder Familie füllen, ausgehend von den aktiven Filtern und nur wenn noch kein solches auf Stufe 25 vorhanden ist."
	L["Fill Queue More"] = "Liste weiter auffüllen"
	L["Fill the leveling queue with one of each species that can level from the filtered pet browser, regardless whether you have any at level 25 already."] = "Die Liste mit einem Haustier aus jeder Familie füllen, ausgehend von den aktiven Filtern, egal ob schon ein Stufe 25 davon vorhanden ist oder nicht."
	L["Empty Queue"] = "Liste leeren"
	L["Remove all leveling pets from the queue."] = "Entfernt alle Haustiere aus der derzeitigen Liste."
	L["Are you sure you want to remove all pets from the leveling queue?"] = "Sicher, dass Du alle Haustiere aus der Liste entfernen möchtest?"
	L["No Active Sort"] = "Keine aktive Sortierung"
	L["Turn off Active Sort. Queued pets can then be rearranged and will not automatically reorder themselves.\n\nTo turn Active Sort back on, check %sActive Sort\124r in the Queue menu."] = "Deaktiviert die aktive Sortierung. Haustiere in der Liste können dann manuell sortiert werden, und werden nicht automatisch anhand der Einstellungen sortiert.\n\nUm die aktive Sortierung wieder zu aktivieren, klicke auf %sActive Sort\124r im Listen Menü."
	L["Turn Off Active Sort?"] = "Aktive Sortierung deaktivieren?"
	L["Leveling Pets: %s%s"] = "Haustiere am leveln: %s%s"
	L["Active Sort:"] = "Aktive Sortierung:"
	L["Add these pets to the queue?"] = "Diese Haustiere der Liste anfügen?"
	L["This will add %s%d\124r pets to the leveling queue.\n\nYou can be more selective by filtering pets.\n\nFor instance, if you filter pets to High Level (15-24) and Rare, Fill Queue will only add rare pets between level 15 and 24."] = "Dies fügt %s%d\124r Haustiere der Liste hinzu.\n\nDu kannst über die Haustierfilter genauere Einstellungen vornehmen.\n\nZum Beispiel, wenn Du nach seltenen, hochstufigen Haustieren (15-24) filterst, wird die Option zum Auffüllen der Liste nur seltene Haustiere zwischen Stufe 15 und 24 einfügen."
	L["This will add %s%d\124r pets to the leveling queue."] = "Diese Option wird der Liste %s%d\124r Haustiere hinzufügen."

-- Panels\MiniPanel.lua
	L["This target has a saved team"] = "Ziel hat ein Team"

-- Panels\OptionPanel.lua
	L["All Options"] = "Alle Optionen"
	L["Team & Targeting Options"] = "Team & Ziel Optionen"
	L["Always Show When Targeting"] = "Beim Anvisieren von Zielen immer zeigen"
	L["Regardless whether a target's team is already loaded, show the Rematch window when you target something with a saved team."] = "Zeigt das Rematch Fenster immer wenn ein Ziel anvisiert wird, für das ein Team gespeichert wurde, selbst wenn dieses Team bereits geladen ist."
	L["Preferred Window Mode"] = "Bevorzugter Anzeigemodus"
	L["Minimized Standalone"] = "Minimiert freistehend"
	L["When automatically showing the Rematch window, show the minimized standalone window."] = "Wenn das Rematch Fenster automatisch geöffnet wird, zeige die minimierte und freihstehende Version."
	L["Maximized Standalone"] = "Maximiert freistehend"
	L["When automatically showing the Rematch window, show the maximized standalone window."] = "Wenn das Rematch Fenster automatisch geöffnet wird, zeige die maximierte und freihstehende Version."
	L["Pet Journal"] = "Wildierführer"
	L["When automatically showing the Rematch window, show the pet journal."] = "Wenn das Rematch Fenster automatisch geöffnet wird, zeige den Wildtierführer"
	L["Standalone Window Options"] = "Optionen für das freistehende Fenster"
	L["Single Panel Mode"] = "Einzelnes Benutzerfeld"
	L["Collapse the maximized standalone window to one panel instead of two side by side.\n\nUsers of earlier versions of Rematch may find this mode more familiar."] = "Verbindet das maximierte, freistehende Fenster zu einer Benutzeroberfläche, statt zweien nebeneinander.\n\nNutzern einer früheren Version von Rematch könnte diese Version vertrauter sein."
	L["Keep Window On Screen"] = "Fenster im Vordergrund lassen"
	L["Don't hide the standalone window when the ESCape key is pressed or most other times it would hide, such as going to the game menu."] = "Das freistehende Fenster wird nicht versteckt, wenn die ESCape Taste gedrückt wird oder bei anderen Aktionen die es normalerweise schließen würden, wie zum Beispiel beim Öffnen des Spielmenüs."
	L["Even For Pet Battles"] = "Auch während Haustierkämpfen"
	L["Keep the standalone window on the screen even when you enter pet battles."] = "Das freistehende Fenster wird selbst beim Starten von Haustierkämpfen nicht geschlossen."
	L["Even Across Sessions"] = "Auch über Spielsitzungen hinaus"
	L["If the standalone window was on screen when logging out, automatically summon it on next login."] = "Das freistehende Fenster wird beim Login geöffnet, wenn es beim vorherigen Logout auch offen war."
	L["Don't Minimize With ESC Key"] = "Bei ESC nicht minimieren"
	L["Don't minimize the standalone window when the ESCape key is pressed."] = "Das freistehende Fenster wird nicht minimiert, wenn die ESCape Taste benutzt wird"
	L["Lower Window Behind UI"] = "Fenster nach hinten verschieben"
	L["Push the standalone window back behind other parts of the UI so other parts of the UI can appear ontop."] = "Das freistehende Fenster wird hinter andere Interface-Elemente geschoben, so dass diese darübergelagert werden können."
	L["Move Panel Tabs To Right"] = "Reiteroptionen auf die rechte Seite"
	L["Align the Pets, Teams, Queue and Options tabs to the right side of the standalone window."] = "Verschiebt die Reiterschaltflächen für Haustiere, Teams, Liste und Optionen auf die rechte Seite des freistehenden Fensters."
	L["Smaller Standalone Window"] = "Kleineres freistehendes Fenster"
	L["Shrink the standalone window and pet cards by 20%."] = "Schrumpft das freistehende Fenster und die Haustierkarten um 20%."
	L["Minimal Minimized Window"] = "Minimales, verkleinertes Fenster"
	L["Remove the titlebar and tabs when the standalone window is minimized."] = "Entfernt die Titelleiste und Reiter für das minimierte, freistehende Fenster."
	L["Appearance Options"] = "Erscheinungsoptionen"
	L["Color Pet Names By Rarity"] = "Haustiernamen nach Seltenheit einfärben"
	L["Make the names of pets you own the same color as its rarity. Blue for rare, green for uncommon, etc."] = "Lässt die Namen der Haustiere in ihrer Qualität erscheinen. Blau für selten, grün für ungewöhnlich, etc."
	L["Hide Rarity Borders"] = "Rahmen für Seltenheit verstecken"
	L["Don't color the icon border for pets you own in the same color as its rarity."] = "Entfernt den eingefärbten Rahmen um Haustiersymbole, die normalerweise die Seltenheit anzeigen."
	L["Hide Level At Max Level"] = "Stufenanzeige auf 25 verstecken"
	L["If a pet is level 25, don't show its level on the pet icon."] = "Wenn ein Haustier Stufe 25 ist, wird mit dieser Option die Zahl nicht mehr am Symbol angezeigt."
	L["Hide Targets Below Teams"] = "Zielnamen an Teams verstecken"
	L["Hide the target name that appears beneath a team that is not named the same as its target."] = "Versteckt den Namen des Ziels eines Teams, der normalerweise unterhalb des Teams angezeigt wird sofern die Namen nicht identisch sind."
	L["Show Ability Numbers"] = "Fähigkeitsnummern anzeigen"
	L["In the ability flyout, show the numbers 1 and 2 to help with the common notation such as \"Pet Name 122\" to know which abilities to use."] = "Zeigt die Nummer einer Fähigkeit in der Fähigkeitsanzeige (1 oder 2). Diese Option kann nützlich sein für die häufig verwendete Schreibweise von Fähigkeiten wie zum Beispiel \"Haustiername 122\"."
	L["Reverse Toolbar Buttons"] = "Werkzeugleiste umkehren"
	L["Reverse the order of the toolbar buttons (Revive Battle Pets, Battle Pet Bandages, Safari Hat, etc)."] = "Kehrt die Reihenfolge der Schaltflächen auf der Werkzeugleiste um (Haustiere heilen, Haustierbandagen, Safarihut, etc.)"
	L["Always Show Team Tabs"] = "Teams immer zeigen"
	L["Show team tabs along the right side of the window even if you're not on the team panel."] = "Reiter der Teams an der rechten Seite des Fensters immer anzeigen, selbst wenn das Teamfenster nicht offen ist."
	L["Move Team Tabs To Left"] = "Teamreiter links"
	L["Move the team tabs along the right side of the standalone window to the left side."] = "Verschiebt die Schaltflächen für Teams von der rechten auf die linke Seite des freistehenden Fensters."
	L["Pet Card & Notes Options"] = "Optionen für Haustierkarten und Notizen"
	L["Allow Pet Cards To Be Pinned"] = "Haustierkarten können angeheftet werden."
	L["When dragging a pet card to another part of the screen, pin the card so all future pet cards display in the same spot, until the pet card is moved again or the unpin button is clicked."] = "Wenn eine Haustierkarte auf einen anderen Teil des Bildschirms gezogen wird, wird die Karte dort angeheftet und alle Karten werden dann an diesem Punkt angezeigt, bis die Haustierkarte erneut verschoben wird oder losgelöst wird."
	L["Faster Pet Cards & Notes"] = "Schnellere Haustierkarten und Notizen"
	L["Instead of a small delay before showing pet cards and notes, immediately show them as you mouseover pets and notes buttons."] = "Statt einer kleinen Verzögerung bevor Haustierkarten und Notizen angezeigt werden, sofort beim Drüberfahren mit der Maus anzeigen."
	L["Click For Pet Cards & Notes"] = "Klicken für Haustierkarten und Notizen"
	L["Instead of automatically showing pet cards and notes when you mouseover them, require clicking the pet or notes button to display them."] = "Mit dieser Option wird ein Klick benötigt um Haustierkarten oder Notizen anzuzeigen, statt sonst beim Drüberfahren mit der Maus."
	L["Keep Notes On Screen"] = "Notizen offen halten"
	L["Don't hide notes when the ESCape key is pressed or other times it would hide, such as changing tabs or closing Rematch."] = "Notizen nicht verstecken wenn die ESCape Taste gedrückt wird oder bei anderen Aktionen, wie zum Beispiel Wechseln des Reiters oder beim Schließen von Rematch."
	L["Show Notes Upon Targeting"] = "Notizen beim Anvisieren zeigen"
	L["When your target has a saved team with notes, automatically display and lock the notes."] = "Wenn ein Ziel ein Team gespeichert hat, das Notizen enthält, werden die Notizen automatisch angezeigt."
	L["Show Notes In Battle"] = "Notizen auch im Kampf anzeigen"
	L["If the loaded team has notes, display and lock the notes when you enter a pet battle."] = "Wenn ein geladenes Team Notizen enthält, diese beim Starten eines Haustierkampfes anzeigen und anheften."
	L["Only Once Per Team"] = "Nur einmal pro Team"
	L["Only display notes automatically the first time entering battle, until another team is loaded."] = "Notizen werden nur beim ersten Betreten des Kampfes automatisch geladen, bis das Team gewechselt wird."
	L["Leveling Queue Options"] = "Listenoptionen"
	L["Double Click To Send To Top"] = "Mit Doppelklick an den Anfang senden"
	L["When a pet in the queue panel is double clicked, send it to the top of the queue instead of summoning it."] = "Wenn ein Haustier in der Listenliste doppelgeklickt wird, wird es nicht beschworen sondern an den Anfang der Liste gesetzt."
	L["Hide Leveling Pet Toast"] = "Erfolgsmeldung beim Leveln verstecken"
	L["Don't display the popup 'toast' when a new pet is automatically loaded from the leveling queue."] = "Zeigt kein aufploppendes Erfolgsfenster mehr, wenn ein Haustier automatisch aus der Listenliste geladen wird."
	L["Automatically Level New Pets"] = "Neue Pets automatisch Leveln"
	L["When you capture or learn a pet, automatically add it to the leveling queue."] = "Wenn ein Haustier gelernt oder gefangen wird, automatisch der Liste hinzufügen."
	L["Only Pets Without A 25"] = "Nur Haustiere ohne Stufe 25"
	L["Only automatically level pets which don't have a version already at 25 or in the queue."] = "Nur Haustiere leveln von denen noch keine Kopie auf Stufe 25 vorhanden ist."
	L["Only Rare Pets"] = "Nur seltene Haustiere"
	L["Only automatically level rare quality pets."] = "Nur Haustiere von seltener Qualität automatisch leveln."
	L["Miscellaneous Options"] = "Sonstige Optionen"
	L["Disable Sharing"] = "Teilen von Teams deaktivieren"
	L["Disable the Send button and also block any incoming pets sent by others. Import and Export still work."] = "Die Funktion zum Senden von Teams deaktivieren und das Empfangen von Teams anderer Rematch-Nutzer blockieren. Manueller Import und Export bleibt unberührt."
	L["Don't display a popup when a team loads and a pet within the team can't be found."] = "Keine Warnung anzeigen wenn ein Team geladen wird aber eines der benutzten Haustiere nicht verfügbar ist."
	L["Don't ask for confirmation when hiding a pet.\n\nYou can view hidden pets in the 'Other' pet filter."] = "Beim Verstecken von Haustieren nicht nachfragen.\n\nVersteckte Haustiere können über den \"Sonstiges\" Filter angezeigt werden."
	L["Use Minimap Button"] = "Minimap Button nutzen"
	L["Place a button on the minimap to toggle Rematch and load favorite teams."] = "Schaltfläche für Rematch an die Minikarte heften um das Rematch Fenster anzuzeigen und Teams zu laden."
	L["Keep Companion"] = "Haustier an der Seite behalten"
	L["After a team is loaded, summon back the companion that was at your side before the load; or dismiss the pet if you had none summoned."] = "Nachdem ein Team geladen wird, beschwöre das Haustier, das davor an Deiner Seite war; falls kein Haustier aktiv war, wird dieser Zustand wiederhergestellt."
	L["Reset Filters On Login"] = "Filter beim Login zurücksetzen"
	L["When logging in, start with all pets listed and no filters active."] = "Beim Einloggen alle Haustiere anzeigen und Filter deaktivieren."
	L["Reset Sort With Filters"] = "Sortierung mit den Filtern zurücksetzen"
	L["When clearing filters, also reset the sort back to the default: Sort by Name, Favorites First."] = "Wenn Filter deaktiviert werden, auch die Sortierung auf den Standard zurücksetzen (erst nach Name, dann nach Favoriten)."
	L["Hide Tooltips"] = "Tooltips deaktivieren"
	L["Hide the more common tooltips in Rematch."] = "Nur gewöhnliche Tooltips in Rematch deaktivieren."
	L["Hide Extra Help"] = "Extra Hilfe deaktivieren"
	L["Hide the informational \"Help\" items found in many menus and on the pet card."] = "Hilfs-Informationen in vielen Menus und an den Haustierkarten deaktivieren"
	L["Use Default Pet Journal"] = "Standard Wildtierführer verwenden"
	L["Turn off Rematch integration with the default pet journal.\n\nYou can still use Rematch in its standalone window, accessed via key binding, /rematch command or from the Minimap button if enabled in options."] = "Deaktiviere die Integration von Rematch in den Wildtierführer.\n\nDu kannst Rematch weiterhin über dass freistehende Fenster benutzen, das Du über einen Tastaturbefehl (falls eingestellt), /rematch, oder über das Symbol an der Minikarte erreichen kannst (sofern aktiviert)."
	L["Anchor"] = "Anker"
	L["Bottom Right"] = "Unten Rechts"
	L["Top Right"] = "Oben Rechts"
	L["Bottom Left"] = "Unten Links"
	L["Top Left"] = "Oben Links"
	L["Anchor: %s"] = "Anker: %s"
	L["When the standlone window is minimized, send it to the %s corner."] = "Wenn das freistehende Fenster für Rematch minimiert ist, in diese Ecke senden: %s."
	L["Rematch version %s"] = "Rematch Version %s"

-- Widgets\TopPanel.lua
	L["Total Collected Pets"] = "Alle Haustiere im Besitz"
	L["Unique Collected Pets"] = "Einzigartige Haustiere im Besitz"
	L["Pets Not Collected"] = "Fehlende Haustiere"
	L["Percent Collected"] = "Prozent gesammelt"
	L["Max Level Pets"] = "Haustiere auf Stufe 25"
	L["Rare Quality Pets"] = "Rare Qualität"
	L["Unique Pets In The Game"] = "Einzigartige Haustiere im Spiel"
	L["Unique Pets"] = "Einzigartige"
	L["%s\n\nPets At Max Level: %s%d\124r\nPets Not Collected: %s%d\124r\n\n%s Click to display more about your collection."] = "%s\n\nHaustiere auf Maximalstufe: %s%d\124r\nNicht gesammelte Haustiere: %s%d"
	L["Collection Statistics"] = "Statistiken der Sammlung"
	L["There are %s%d\124r unique pets in the game."] = "Es gibt %s%d\124r einzigartige Haustiere im Spiel."
	L["Pets Collected"] = "Deine Haustiere"
	L["Pets At Max Level"] = "Auf Stufe 25"
	L["Total"] = "Gesamt"
	L["Unique"] = "Einzigartig"
	L["Duplicate Collected Pets"] = "Doppelte Haustiere"
	L["Average Battle Pet Level"] = "Durchschnittliche Stufe"
	L["All unique pets in the game."] = "Alle einzigartigen Haustiere im Spiel"
	L["All pets you've collected, including duplicates."] = "Alle gesammelten Haustiere, inklusive doppelt vorhandenen."
	L["The unique pets you've collected, not including duplicates."] = "Die einzigartigen Haustiere in Deiner Sammlung, ohne Duplikate."
	L["The unique pets you're missing."] = "Die einzigartigen Haustiere die Dir noch fehlen."
	L["How much of each category's unique pets you've collected as a percent."] = "Prozentangaben an einzigartigen Haustieren, die Dir pro Kategorie noch fehlen."
	L["All of your level 25 pets, including duplicates."] = "Alle Stufe 25 Haustiere, inklusive doppelt vorhandenen."
	L["All of your rare quality pets, including duplicates."] = "Alle Deine raren Haustiere, inklusive doppelt vorhandenen."
	L["Pet Types"] = "Typ"
	L["Sources"] = "Quellen"

-- Widgets\BottomPanel.lua
	L["Save As..."] = "Speichern als..."
	L["Save the currently loaded pets to a new team."] = "Die derzeit aktiven Pets als neues Team speichern."
	L["Save the currently loaded pets to the loaded team."] = "Die derzeit aktiven Pets als derzeit geladenes Team speichern."
	L["Disable Rematch"] = "Rematch deaktivieren"
	L["Uncheck this to restore the default pet journal.\n\nYou can still use Rematch in its standlone window, accessed via key binding, /rematch command or from the Minimap button if enabled in options."] = "Deaktiviere diese Option um den normalen Wildtierführer wiederherzustellen.\n\nDu kannst Rematch weiterhin über dass freistehende Fenster benutzen, das Du über einen Tastaturbefehl (falls eingestellt), /rematch, oder über das Symbol an der Minikarte erreichen kannst (sofern aktiviert)."

-- Widgets\TeamTabs.lua
	L["Edit Tab"] = "Reiter editieren"
	L["Change the name or icon of this tab."] = "Name oder Symbol des Reiters ändern."
	L["Custom Sort"] = "Manuell sortieren"
	L["Remove Custom Sort"] = "Manuelle Sortierung entfernen"
	L["Are you sure you want to sort teams alphabetically in this tab?\n\nThe custom sort order will be lost and cannot be undone."] = "Sicher, dass die Teams in diesem Reiter alphabetisch sortiert werden sollen?\n\nJede manuelle Sortierung wird dabei unwiederbringlich verlorengehen."
	L["While checked, you can rearrange the order of teams within this tab."] = "Wenn aktiviert, kannst Du die Reihenfolge der Teams innerhalb dieses Reiters verändern."
	L["Export Tab"] = "Reiter exportieren"
	L["Export all teams in this tab to a string you can copy elsewhere, such as forums or emails.\n\nOther Rematch users can then paste these teams into their Rematch via Import Teams.\n\nYou can export a single team by right-clicking one and choosing its Share menu."] = "Alle Teams in diesem Reiter in einen String exportieren, den Du in Foren oder Mails kopieren kannst.\n\nAndere Nutzer von Rematch können diesen String importieren.\n\nDu kannst ein einzelnes Team exportieren indem Du darauf rechtsklickst und das \"Teilen\" Menü wählst."
	L["Delete Tab"] = "Reiter löschen"
	L["Delete this tab and move all of its teams to the default tab."] = "Diesen Reiter löschen und alle Teams daraus in den Standardreiter verschieben."
	L["Create New Tab"] = "Neuen Reiter erstellen"
	L["Teams: %d"] = nil
	L["New Tab"] = "Neuer Reiter"
	L["Choose a name and icon"] = "Wähle einen Namen und ein Symbol"
	L["Delete this tab?"] = "Diesen Reiter löschen?"
	L["Deleting this tab will move its teams to the %s tab."] = "Wenn Du diesen Reiter löschst, werden die Teams daraus nach %s verschoben."

-- Widgets\LoadedTeamPanel.lua
	L["Reload Team"] = "Team neu laden"
	L["Team Options"] = "Team Optionen"
	L["When a team is loaded its name goes here. You can reload the team by clicking here or right-click for team options such as setting notes."] = "Wenn ein Team geladen wird, erscheint dessen Name hier. Du kannst das Team neu laden indem du hier klickst. Mit einem Rechtsklick kannst Du die Optionen und Notizen verwalten."
	L["Last Loaded Team"] = "Zuletzt aktives Team"

-- Widgets\NarrowPanel.lua

-- Dialogs\Save.lua
	L["Target For This Team"] = "Ziel für dieses Team"
	L["A target stored in a team is used to decide which team to load when you return to that target.\n\nYou can save an unlimited number of teams to fight a target, but a target can only be saved in one team."] = "Wenn ein Ziel für ein Team eingetragen wurde, wird das jeweilige Team geladen sobald Du zu diesem Ziel zurückkehrst.\n\nDu kannst beliebig viele Teams für ein Ziel erstellen, aber ein Ziel kann immer nur ein dafür dediziertes Team haben."
	L["Save As.."] = "Speichern als.."
	L["Save this team?"] = "Dieses Team speichern?"
	L["Save Notes & Preferences Too"] = "Notizen und Einstellungen"
	L["All teams must have a name."] = "Alle Teams müssen einen Namen haben."
	L["This target already has a team."] = "Dieses Ziel hat bereits ein Team."
	L["A team already has this name."] = "Dieser Name ist bereits vergeben"
	L["Overwrite Team"] = "Team überschreiben"
	L["Overwrite this team?"] = "Dieses Team überschreiben?"
	L["The target %s%s\124r already has a team.\n\nA target can only have one team."] = "Das Ziel %s%s\124r hat bereits ein dafür gespeichertes Team.\n\nEin Ziel kann immer nur ein spezifisches Team dafür haben."
	L["A team named %s%s\124r already exists.\n\nTeams without a target must have a unique name."] = "Ein Team mit dem Namen %s%s\124r existiert bereits.\n\nTeams ohne ein Ziel müssen einen einmaligen Namen haben."

-- Dialogs\Preferences.lua
	L["Minimum Health"] = "Minimale Trefferpunkte"
	L["This is the minimum health preferred for a leveling pet.\n\nThe queue will prefer leveling pets with at least this much health (adjusted by expected damage taken if any chosen)."] = "Dieser Wert zeigt die minimale Menge an Trefferpunkten an, die ein Haustier zum Leveln haben sollte.\n\nDie Liste wird immer Haustiere bevorzugen die mindestens diesen Wert an Trefferpunkten besitzen. Sofern ein Wert für den erwarteten Schaden gesetzt wird, wird dies mit berücksichtigt."
	L["Minimum Level"] = "Minimale Stufe"
	L["This is the minimum level preferred for a leveling pet.\n\nLevels can be partial amounts. Level 4.33 is level 4 with 33% xp towards level 5."] = "Dies ist die bevorzugte, minimale Stufe für ein Haustier zum Leveln.\n\nStufen können auch Kommawerte enthalten. Stufe 4,33 bedeutet Stufe 4 mit 33% Erfahrung bis Stufe 5."
	L["Maximum Health"] = "Maximale Trefferpunkte"
	L["This is the maximum health preferred for a leveling pet."] = "Dieser Wert zeigt die höchste, bevorzugte Menge an Trefferpunkten für ein Haustier zum Leveln."
	L["Maximum Level"] = "Maximale Stufe"
	L["This is the maximum level preferred for a leveling pet.\n\nLevels can be partial amounts. Level 23.45 is level 23 with 45% xp towards level 24."] = "Dies ist die bevorzugte, höchste Stufe für ein Haustier zum Leveln.\n\nStufen können auch Kommawerte enthalten. Stufe 23,45 bedeutet Stufe 23 mit 45% Erfahrung bis Stufe 24."
	L["Or any"] = "Oder irgendeines"
	L["Allow low-health Magic and Mechanical pets to ignore the Minimum Health, since their racials allow them to often survive a hit that would ordinarily kill them."] = "Erlaube magischen und mechanischen Pets die Mindestgrenze an Lebenspunkten zu ignorieren, da ihre Familienboni ihnen erlauben einen Schlag zu überleben der sonst tödlich wäre."
	L["Leveling Preferences"] = "Einstellungen für die Liste"
	L["  For %s pets: %s%d%s"] = "  Für %s Haustiere: %s%d%s"
	L["Expected damage taken"] = "Erwarteter Schaden"
	L["The minimum health of pets can be adjusted by the type of damage they are expected to receive."] = "Die minimale Menge an Lebenspunkten der Haustiere kann editiert werden durch den erwarteten Wert an eingehendem Schaden."
	L["Damage expected"] = "Erwarteter Schaden"
	L["  For %s pets: \124cffffd200%d"] = "  Für %s Haustiere: \124cffffd200%d"

-- Dialogs\Sideline.lua
	L["New Team"] = "Neues Team"

-- Dialogs\Share.lua
	L["^(.-)%(.-NPC#(%d+)%)"] = nil
	L[":([^\n]-)[%(%[]*([12]).([12]).([12])[%)%]]*.-[\n]*"] = nil
	L[":([^\n]+)"] = nil
	L["\n%s*Preferred leveling pets: ([^\n]+)%."] = "\n%s*Bevorzugte Haustiere zum Leveln: ([^\n]+)%."
	L["at least (%d+) health"] = "mindestens (%d+) Trefferpunkte"
	L["or any Magic/Mechanical"] = "oder irgendein magisches/mechanisches"
	L[".+[,%(](.-)damage expected%)"] = ".+[,%(](.-)Schaden erwartet%)"
	L["at most (%d+) health"] = "höchstens (%d+) Lebenspunkte"
	L["at least level ([%d%.]+)"] = "mindestens Stufe ([%d%.]+)"
	L["at most level ([%d%.]+)"] = "höchstens Stufe ([%d%.]+)"
	L["^[Ll][Ee][Vv][Ee][Ll][Ii][Nn][Gg] [Pp][Ee][Tt]$"] = nil
	L["^[Cc][Aa][Rr][Rr][Yy] [Pp][Ee][Tt]$"] = nil
	L["%s (NPC#%d)"] = nil
	L["%s (%s NPC#%d)"] = nil
	L["%d: %s"] = nil
	L["%d: %s (%d,%d,%d)"] = nil
	L["Preferred leveling pets: %s."] = "Bevorzugte Haustiere zum Leveln: %s."
	L["at least %d health"] = "mindestens %d Lebenspunkte"
	L["at least %d health (or any Magic/Mechanical)"] = "mindestens %d Lebenspunkte (oder irgendein magisches/mechanisches Haustier)"
	L["at least %d health (%s damage expected)"] = "mindestens %d Lebenspunkte (%s Schaden wird erwartet)"
	L["at least %d health (or any Magic/Mechanical, %s damage expected)"] = "mindestens %d Lebenspunkte (oder irgendein magisches/mechanisches Haustier, %s Schaden wird erwartet)"
	L["at most %d health"] = "höchstens %d Lebenspunkte"
	L["at least level %s"] = "mindestens Stufe %s"
	L["at most level %s"] = "höchstens Stufe %s"
	L["Export Team"] = "Team exportieren"
	L["Press Ctrl+C to copy these teams to the clipboard."] = "Strg+C um diese Teams in die Zwischenablage zu kopieren."
	L["Press Ctrl+C to copy this team to the clipboard."] = "Strg+C um dieses Team in die Zwischenablage zu kopieren."
	L["Include Preferences"] = "Einstellungen"
	L["Include Notes"] = "Notizen"
	L["Press Ctrl+V to paste a team from the clipboard."] = "Strg+V um ein Team aus der Zwischenablage einzufügen."
	L["This is not a recognizable team."] = "Es konnte kein Team erkannt werden."
	L["An existing team already has this %s."] = "Ein bestehendes Team hat bereits diese %s."
	L["target"] = "Ziel"
	L["name"] = "Name"
	L["Create a new copy"] = "Neue Kopie erstellen"
	L["Overwrite existing team"] = "Bestehendes Team überschreiben"
	L["%s%d\124r teams are in this import."] = "%s%d\124r Teams sind in dieser Importdatei."
	L["%s%d\124r have a name or target already used."] = "%s%d\124r hat einen Namen oder ein Ziel das bereits benutzt wird."
	L["Create new copies"] = "Neue Kopien erstellen"
	L["Overwrite existing teams"] = "Bestehende Teams überschreiben"
	L["Send"] = "Senden"
	L["Who do you want to send this team to?"] = "An wen möchtest Du dieses Team senden?"
	L["Sending..."] = "Sendet..."
	L["No response. Lag or they don't have Rematch?"] = "Keine Antwort. Hohe Latenz oder der Empfänger hat kein Rematch."
	L["Team successfully received!"] = "Team erfolgreich empfangen!"
	L["Sending...%d%%"] = "Sendet...%d%%"
	L["They're busy. Try again later."] = "Empfänger ist beschäftig. Versuch es später noch einmal."
	L["They're in combat. Try again later."] = "Empfänger ist im Kampf. Versuch es später noch einmal."
	L["They have team sharing disabled."] = "Empfänger haben das Tauschen von Teams deaktiviert."
	L["Incoming Rematch Team!"] = "Rematch Teams werden empfangen!"
	L["%s%s\124r has sent you a team named \"%s\" (for %s)."] = "%s%s\124r hat Dir ein Team namens \"%s\" (für %s) geschickt."
	L["%s%s\124r has sent you a team for %s."] = "%s%s\124r hat Dir ein Team für %s geschickt."
	L["%s%s\124r has sent you a team named \"%s\"."] = "%s%s\124r hat Dir ein Team namens \"%s\" geschickt."
	L["Import these teams?"] = "Diese teams importieren?"
	L["Import"] = "Importieren"
	L["%s%d\124r Rematch teams have the same name."] = "%s%d\124r Rematch Teams haben den selben Namen."

-- Dialogs\Tooltip.lua

-- Frames\Frame.lua
	L["Pets"] = "Haustiere"
	L["Queue"] = "Liste"
	L["Options"] = "Optionen"
	L["Toggle Single Panel Mode"] = "Einzelne Benutzeroberfläche aktivieren bzw. deaktivieren"
	L["Toggle between one panel or two panels side by side."] = "Zwischen einer bzw. zwei nebeneinander dargestellten Benutzeroberflächen wechseln."

-- Frames\Journal.lua
	L["Enable Rematch"] = "Rematch aktivieren"
	L["Check this to use Rematch in the pet journal."] = "Aktivieren um Rematch im Wildtierführer zu nutzen."

end