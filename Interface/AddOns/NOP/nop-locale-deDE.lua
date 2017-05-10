-- German localization file for deDE by Ragnar_F
local ADDON = ...
local _ ;
local AceLocale = LibStub:GetLibrary("AceLocale-3.0");
local L = AceLocale:NewLocale(ADDON, "deDE");
if not L then return; end

L["NOP_TITLE"] = "New Openables"
L["NOP_VERSION"] = "|cFFFFFFFF%s - benutze |cFFFF00FF/nop|cFFFFFFFF"

L["ALT-LeftClick and drag to move."] = "ALT-Linksklick und ziehen, um zu verschieben."
L["LeftClick to open or use."] = "Linksklick, um Gegenstand zu öffnen oder benutzen."
L["RightClick to skip item."] = "Rechtsklick, um Gegenstand zu überspringen."
L["CTRL-RightClick to blacklist item."] = "STRG-Rechtsklick, um Gegenstand dauerhaft zu ignorieren."
L["No openable items!"] = "Keine Gegenstände, die geöffnet werden können!"
L["Reset and move button to middle of screen!"] = "Schaltfläche auf die Mitte des Bildschirms zurückgesetzt!"
L["Use: "] = "Benutze: "
L["Spell:"] = "Zauber:"
L["|cFFFF00FFPermanently blacklisted items:"] = "|cFFFF00FFDauerhaft ignorierte Gegenstände:"
L["|cFFFF00FFPermanent blacklist is empty"] = "|cFFFF00FFKeine ignorierten Gegenstände"
L["Permanently Blacklisted:|cFF00FF00"] = "Dauerhaft ignoriert:|cFF00FF00"
L["Session Blacklisted:|cFF00FF00"] = "Für diese Session ignoriert:|cFF00FF00"
L["Temporary Blacklisted:|cFF00FF00"] = "Temporär ignoriert:|cFF00FF00"
L["|cFFFF0000Error loading tooltip for|r "] = "|cFFFF0000Fehler beim Laden des Tooltips für|r "
L["Plans, patterns and recipes cache update."] = "Cache-Aktualisierung von Plänen, Mustern und Rezepten."
L["Spell patterns cache update."] = "Cache-Aktualisierung von Zaubermustern."
L["|cFFFF0000Error loading tooltip for spell |r "] = "|cFFFF0000Fehler beim Laden des Tooltips für Zauber |r "
L["|cFFFF0000Error loading tooltip for spellID %d"] = "|cFFFF0000Fehler beim Laden des Tooltips für Zauber-ID %d"
L["Toggle"] = "Optionen"
L["Skin Button"] = "Schaltfläche mit Skin versehen"
L["Masque Enable"] = true
L["Need UI reload or relogin to activate."] = true
L["Lock Button"] = "Schaltfläche sperren"
L["Lock button in place to disbale drag."] = "Schaltfläche auf aktueller Position sperren, um Ziehen zu deaktivieren."
L["Glow Button"] = "Schaltfläche aufleuchten lassen"
L["When item is placed by zone change, button will have glow effect."] = "Gegenstand wird bei Zonenwechsel aufleuchten."
L["Backdrop Button"] = "Schaltfläche einrahmen"
L["Create or remove backdrop around button, need reload UI."] = "Erstellt oder entfernt den Rahmen bei der Schaltfläche; benötigt /reload."
L["Session skip"] = "Die ganze Session lang überspringen"
L["Skipping item last until relog."] = "Gegenstände werden bis zum nächsten Einloggen übersprungen."
L["Clear Blacklist"] = "Ignorierliste leeren"
L["Reset Permanent blacklist."] = "Dauerhaftes Ignorieren von Gegenständen aufheben."
L["Zone unlock"] = "Zonenabhängigkeit entsperren"
L["Don't zone restrict openable items"] = "Gegenstände können überall geöffnet werden"
L["Profession"] = "Beruf"
L["Place items usable by lockpicking"] = "Gegenstände anzeigen, die via 'Schloss knacken' geöffnet werden können"
L["Button"] = "Schaltfläche"
L["Buttom location"] = "Position der Schaltfläche"
L["Button size"] = "Größe der Schaltfläche"
L["Width and Height"] = "Breite und Höhe"
L["Button size in pixels"] = "Größe der Schaltfläche in Pixel"
L["Miner's Coffee stacks"] = "Stapelmenge von Minenarbeiterkaffee"
L["Allow buff up to this number of stacks"] = "Die maximal erlaubte Stapelmenge des Minenarbeiterkaffee-Effekts"
L["Quest bar"] = "Quest-Leiste"
L["Quest items placed on bar"] = "Auf einer Leiste platzierte Quest-Gegenstände"
L["Visible"] = "Sichtbar machen"
L["Make button visible by placing fake item on it"] = "Schaltfläche mithilfe eines Fake-Gegenstandes sichtbar machen"
L["Swap"] = "Tauschen"
L["Swap location of numbers for count and cooldown timer"] = "Position von Anzahl und Abklingzeit tauschen"
L["Script"] = "Skript"
L["Let button on use close unwanted windows like NPC trader, bank etc. You need enable custom scripts to run!"] = "Schaltfläche bei Benutzung ungewollte Fenster wie NPC-Händler, Bank usw. schließen lassen. Benutzerdefinierte Skripte müssen dabei aktiviert sein!"
L["AutoQuest"]  = "Automatische Suche"
L["Auto accept or hand out quests from AutoQuestPopupTracker!"] = "Automatische Annahme oder Abgabe von Quests aus AutoQuestPopupTracker"
L["Buttons per row"] = "Schaltflächen pro Reihe"
L["Number of buttons placed in one row"] = "Wie viele Schaltflächen auf einer Reihe angezeigt werden sollen"
L["Spacing"] = "Abstand"
L["Space between buttons"] = "Abstand zwischen Schaltflächen"
L["Sticky"] = "Anheften"
L["Anchor to Item button"] = "Mit Gegenstand-Schaltfläche verankern"
L["Direction"] = "Richtung"
L["Expand bar to"] = "In welche Richtung soll die Leiste erweitert werden"
L["Up"] = "Nach oben"
L["Down"] = "Nach unten"
L["Left"] = "Nach links"
L["Right"] = "Nach rechts"
L["Add new row"] = "Neue Reihe hinzufügen"
L["Above or below last one"] = "Ober- oder unterhalb der letzten Reihe"
L["Hot-Key"] = "Hotkey"
L["Key to use for automatic key binding."] = "Taste zum automatischen Aktivieren des Gegenstandes."
L["Quest"] = "Quest"
L["Quest not found for this item."] = "Quest für diesen Gegenstand nicht gefunden."
L["Items cache update run |cFF00FF00%d."] = "Cache-Aktualisierung von Gegenständen |cFF00FF00%d."
L["Spells cache update run |cFF00FF00%d."] = "Cache-Aktualisierung von Zaubern |cFF00FF00%d."

L["CONSOLE_USAGE"] = [=[ [reset|skin|lock|clear|list|unlist|skip|glow|zone|quest|show]
reset  - setzt die Schaltfläche auf die Mitte des Bildschirms zurück
skin   - versieht die Schaltfläche mit einem Skin
lock   - sperrt/entsperrt die Position der Schaltfläche
clear  - leert die Liste von dauerhaft ignorierten Gegenständen
list   - listet dauerhaft ignorierte Gegenstände auf
unlist - remove single item from blacklist based on itemID
skip   - schaltet das Rechtsklick-Überspringen zwischen temporär oder bis zum Neu-Einloggen um
glow   - aktiviert/deaktiviert Aufleuchten der Schaltfläche bei Zonenwechsel
zone   - aktiviert/deaktiviert Zonenabhängigkeit bei Gegenständen
quest  - aktiviert/deaktiviert Quest-Leiste
show   - macht die Schaltfläche sichtbar]=];
