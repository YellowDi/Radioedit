local me,ns=...
local lang=GetLocale()
local l=LibStub("AceLocale-3.0")
local L=l:NewLocale(me,"enUS",true,true)
L["Always counter increased resource cost"] = true
L["Always counter increased time"] = true
L["Always counter kill troops (ignored if we can only use troops with just 1 durability left)"] = true
L["Always counter no bonus loot threat"] = true
L["Artifact shown value is the base value without considering knowledge multiplier"] = true
L["Attempts to use less champions for missions, in order to fill more missions"] = true
L["Base Chance"] = true
L["Better parties available in next future"] = true
L["Blacklisted"] = true
L["Blacklisted missions are ignored in Mission Control"] = true
L["Bonus Chance"] = true
L["Building Final report"] = true
L["but using troops with just one durability left"] = true
L["Capped %1$s. Spend at least %2$d of them"] = true
L["Changes the sort order of missions in Mission panel"] = true
L["Combat ally is proposed for missions so you can consider unassigning him"] = true
L["Complete all missions without confirmation"] = true
L["Configuration for mission party builder"] = true
L["Cost reduced"] = true
L["Disables warning: "] = true
L["Dont kill Troops"] = true
L["Don't use troops"] = true
L["Duration reduced"] = true
L["Duration Time"] = true
L["Empty missions sorted as last"] = true
L["Empty or 0% success mission are sorted as last. Does not apply to \"original\" method"] = true
L["Expiration Time"] = true
L["Favours leveling follower for xp missions"] = true
L["Followers status "] = true
L["For better experience, lock your desired follower to get filled only the missions you want"] = true
L["General"] = true
L["Global approx. xp reward"] = true
L["Global approx. xp reward per hour"] = true
L["HallComander Quick Mission Completion"] = true
L["If bonus chance is lower than this, then we try to not overcap the mission."] = true
L["If not checked, inactive followers are used as last chance"] = true
L[ [=[If you %s, you will lose them
Click on %s to abort]=] ] = true
L["Ignore busy followers"] = true
L["Ignore inactive followers"] = true
L["Keep cost low"] = true
L["Keep extra bonus"] = true
L["Keep time short"] = true
L["Keep time VERY short"] = true
L["Launch all ready missions"] = true
L["Level"] = true
L["Make Order Hall Mission Panel movable"] = true
L["Max champions"] = true
L["Maximize filled missions"] = true
L["Maximize xp gain"] = true
L["Mission duration reduced"] = true
L["Missions"] = true
L["No follower gained xp"] = true
L["Not blacklisted"] = true
L["Not enough troops, raise maximum champions' number"] = true
L["Nothing to report"] = true
L["Notifies you when you have troops ready to be collected"] = true
L["Only accept missions with time improved"] = true
L["Only consider Elite missions"] = true
L["Only use champions even if troops are available"] = true
L[ [=[OrderHallCommander overrides GarrisonCommander for Order Hall Management.
 You can revert to GarrisonCommander simply disabling OrderhallCommander.
If instead you like OrderHallCommander remember to add it to Curse client and keep it updated]=] ] = true
L["Original method"] = true
L["Position is not saved on logout"] = true
L["Release notes"] = true
L["Remove no champions warning"] = true
L["Resurrect troops effect"] = true
L["Reward type"] = true
L["Right-Click to blacklist"] = true
L["Right-Click to remove from blacklist"] = true
L["Show/hide OrderHallCommander mission menu"] = true
L["Sort missions by:"] = true
L["Success Chance"] = true
L["Troop ready alert"] = true
L["Unable to fill missions, raise maximum champions' number"] = true
L["Unable to fill missions. Check your switches"] = true
L["Unlock all"] = true
L["Unlocks all follower at once"] = true
L["Upgrading to |cff00ff00%d|r"] = true
L["URL Copy"] = true
L["Use at most this many champions"] = true
L["Use combat ally"] = true
L["When no free followers are available shows empty follower"] = true
L["When we cant achieve the requested bonus chance, we try to reach at least this one"] = true
L["You are wasting |cffff0000%d|cffffd200 point(s)!!!"] = true
L["You have no troops"] = true

L=l:NewLocale(me,"ptBR")
if (L) then
L["Always counter increased resource cost"] = "Sempre contra o aumento do custo de recursos"
L["Always counter increased time"] = "Sempre contra o aumento do tempo"
L["Always counter kill troops (ignored if we can only use troops with just 1 durability left)"] = "Sempre counter kill tropas (ignorado se podemos apenas usar tropas com apenas 1 durabilidade à esquerda)"
--Translation missing 
L["Always counter no bonus loot threat"] = "Always counter no bonus loot threat"
--Translation missing 
L["Artifact shown value is the base value without considering knowledge multiplier"] = "Artifact shown value is the base value without considering knowledge multiplier"
--Translation missing 
L["Attempts to use less champions for missions, in order to fill more missions"] = "Attempts to use less champions for missions, in order to fill more missions"
--Translation missing 
L["Base Chance"] = "Base Chance"
L["Better parties available in next future"] = "Festas melhores disponíveis no próximo futuro"
--Translation missing 
L["Blacklisted"] = "Blacklisted"
--Translation missing 
L["Blacklisted missions are ignored in Mission Control"] = "Blacklisted missions are ignored in Mission Control"
--Translation missing 
L["Bonus Chance"] = "Bonus Chance"
L["Building Final report"] = "Relatório final do edifício"
--Translation missing 
L["but using troops with just one durability left"] = "but using troops with just one durability left"
L["Capped %1$s. Spend at least %2$d of them"] = "Capped% 1 $ s. Gaste pelo menos% 2 $ d deles"
L["Changes the sort order of missions in Mission panel"] = "Altera a ordem de classificação das missões no painel da Missão"
--Translation missing 
L["Combat ally is proposed for missions so you can consider unassigning him"] = "Combat ally is proposed for missions so you can consider unassigning him"
L["Complete all missions without confirmation"] = "Complete todas as missões sem confirmação"
L["Configuration for mission party builder"] = "Configuração para o construtor de parte da missão"
--Translation missing 
L["Cost reduced"] = "Cost reduced"
--Translation missing 
L["Disables warning: "] = "Disables warning: "
L["Dont kill Troops"] = "Não mate tropas"
--Translation missing 
L["Don't use troops"] = "Don't use troops"
L["Duration reduced"] = "Duração reduzida"
L["Duration Time"] = "Tempo de duração"
--Translation missing 
L["Empty missions sorted as last"] = "Empty missions sorted as last"
--Translation missing 
L["Empty or 0% success mission are sorted as last. Does not apply to \"original\" method"] = "Empty or 0% success mission are sorted as last. Does not apply to \"original\" method"
L["Expiration Time"] = "Data de validade"
L["Favours leveling follower for xp missions"] = "Favors leveling follower para missões xp"
--Translation missing 
L["Followers status "] = "Followers status "
--Translation missing 
L["For better experience, lock your desired follower to get filled only the missions you want"] = "For better experience, lock your desired follower to get filled only the missions you want"
L["General"] = "Geral"
L["Global approx. xp reward"] = "Global aprox. Recompensa xp"
--Translation missing 
L["Global approx. xp reward per hour"] = "Global approx. xp reward per hour"
L["HallComander Quick Mission Completion"] = "Conclusão Rápida da Missão HallComander"
--Translation missing 
L["If bonus chance is lower than this, then we try to not overcap the mission."] = "If bonus chance is lower than this, then we try to not overcap the mission."
--Translation missing 
L["If not checked, inactive followers are used as last chance"] = "If not checked, inactive followers are used as last chance"
--Translation missing 
L[ [=[If you %s, you will lose them
Click on %s to abort]=] ] = [=[If you %s, you will lose them
Click on %s to abort]=]
--Translation missing 
L["Ignore busy followers"] = "Ignore busy followers"
--Translation missing 
L["Ignore inactive followers"] = "Ignore inactive followers"
L["Keep cost low"] = "Mantenha o custo baixo"
--Translation missing 
L["Keep extra bonus"] = "Keep extra bonus"
L["Keep time short"] = "Mantenha o tempo curto"
L["Keep time VERY short"] = "Mantenha o tempo MUITO curto"
--Translation missing 
L["Launch all ready missions"] = "Launch all ready missions"
L["Level"] = "Nível"
L["Make Order Hall Mission Panel movable"] = "Faça a encomenda Hall Missão Painel móvel"
--Translation missing 
L["Max champions"] = "Max champions"
--Translation missing 
L["Maximize filled missions"] = "Maximize filled missions"
L["Maximize xp gain"] = "Maximize o ganho de xp"
--Translation missing 
L["Mission duration reduced"] = "Mission duration reduced"
L["Missions"] = "Missões"
L["No follower gained xp"] = "Nenhum seguidor ganhou xp"
--Translation missing 
L["Not blacklisted"] = "Not blacklisted"
--Translation missing 
L["Not enough troops, raise maximum champions' number"] = "Not enough troops, raise maximum champions' number"
L["Nothing to report"] = "Nada a declarar"
L["Notifies you when you have troops ready to be collected"] = "Notifica você quando você tem tropas prontas para serem coletadas"
L["Only accept missions with time improved"] = "Aceitar apenas missões com o tempo melhorado"
--Translation missing 
L["Only consider Elite missions"] = "Only consider Elite missions"
--Translation missing 
L["Only use champions even if troops are available"] = "Only use champions even if troops are available"
--Translation missing 
L[ [=[OrderHallCommander overrides GarrisonCommander for Order Hall Management.
 You can revert to GarrisonCommander simply disabling OrderhallCommander.
If instead you like OrderHallCommander remember to add it to Curse client and keep it updated]=] ] = [=[OrderHallCommander overrides GarrisonCommander for Order Hall Management.
 You can revert to GarrisonCommander simply disabling OrderhallCommander.
If instead you like OrderHallCommander remember to add it to Curse client and keep it updated]=]
L["Original method"] = "Método original"
L["Position is not saved on logout"] = "A posição não é salva no logout"
--Translation missing 
L["Release notes"] = "Release notes"
--Translation missing 
L["Remove no champions warning"] = "Remove no champions warning"
L["Resurrect troops effect"] = "Resurrect efeito tropas"
L["Reward type"] = "Tipo de recompensa"
--Translation missing 
L["Right-Click to blacklist"] = "Right-Click to blacklist"
--Translation missing 
L["Right-Click to remove from blacklist"] = "Right-Click to remove from blacklist"
L["Show/hide OrderHallCommander mission menu"] = "Mostrar / ocultar o menu da missão OrderHallCommander"
L["Sort missions by:"] = "Classifique missões por:"
L["Success Chance"] = "Chance de sucesso"
L["Troop ready alert"] = "Alerta de tropas"
--Translation missing 
L["Unable to fill missions, raise maximum champions' number"] = "Unable to fill missions, raise maximum champions' number"
--Translation missing 
L["Unable to fill missions. Check your switches"] = "Unable to fill missions. Check your switches"
--Translation missing 
L["Unlock all"] = "Unlock all"
--Translation missing 
L["Unlocks all follower at once"] = "Unlocks all follower at once"
L["Upgrading to |cff00ff00%d|r"] = "Atualizando para | cff00ff00% d | r"
--Translation missing 
L["URL Copy"] = "URL Copy"
--Translation missing 
L["Use at most this many champions"] = "Use at most this many champions"
--Translation missing 
L["Use combat ally"] = "Use combat ally"
--Translation missing 
L["When no free followers are available shows empty follower"] = "When no free followers are available shows empty follower"
--Translation missing 
L["When we cant achieve the requested bonus chance, we try to reach at least this one"] = "When we cant achieve the requested bonus chance, we try to reach at least this one"
L["You are wasting |cffff0000%d|cffffd200 point(s)!!!"] = "Você está desperdiçando | cffff0000% d | cffffd200 point (s) !!!"
--Translation missing 
L["You have no troops"] = "You have no troops"

return
end
L=l:NewLocale(me,"frFR")
if (L) then
L["Always counter increased resource cost"] = "Toujours contrer les coûts accrus des ressources"
L["Always counter increased time"] = "Toujours contrer le temps accru"
L["Always counter kill troops (ignored if we can only use troops with just 1 durability left)"] = "Toujours éviter de tuer les troupes (ignoré s'il ne reste qu'un seul point de vitalité aux troupes disponibles)"
L["Always counter no bonus loot threat"] = "Toujours contrer les malus au butin bonus"
L["Artifact shown value is the base value without considering knowledge multiplier"] = "Le montant de puissance prodigieuse affichée est la valeur de base, sans prendre en considération le niveau de connaissance de l'arme prodigieuse"
L["Attempts to use less champions for missions, in order to fill more missions"] = "Essayer d'utiliser moins de champions pour les missions, pour remplir plus de missions"
--Translation missing 
L["Base Chance"] = "Base Chance"
L["Better parties available in next future"] = "De meilleurs groupes seront disponibles plus tard"
--Translation missing 
L["Blacklisted"] = "Blacklisted"
--Translation missing 
L["Blacklisted missions are ignored in Mission Control"] = "Blacklisted missions are ignored in Mission Control"
--Translation missing 
L["Bonus Chance"] = "Bonus Chance"
L["Building Final report"] = "Rapport final du bâtiment"
--Translation missing 
L["but using troops with just one durability left"] = "but using troops with just one durability left"
L["Capped %1$s. Spend at least %2$d of them"] = "Plafonné% 1 $ s. Dépenser au moins% 2 $ d d'entre eux"
L["Changes the sort order of missions in Mission panel"] = "Modifie l'ordre de tri des missions dans le panneau Mission"
L["Combat ally is proposed for missions so you can consider unassigning him"] = "Le combattant allié est pris en compte pour le retirer et l'envoyer en mission"
L["Complete all missions without confirmation"] = "Terminer toutes les missions sans confirmation"
L["Configuration for mission party builder"] = "Configuration pour le constructeur de mission"
L["Cost reduced"] = "Coût réduit"
--Translation missing 
L["Disables warning: "] = "Disables warning: "
L["Dont kill Troops"] = "Ne pas tuer les troupes"
L["Don't use troops"] = "Ne pas utiliser les troupes"
L["Duration reduced"] = "Durée réduite"
L["Duration Time"] = "Durée"
--Translation missing 
L["Empty missions sorted as last"] = "Empty missions sorted as last"
--Translation missing 
L["Empty or 0% success mission are sorted as last. Does not apply to \"original\" method"] = "Empty or 0% success mission are sorted as last. Does not apply to \"original\" method"
L["Expiration Time"] = "Date d'expiration"
L["Favours leveling follower for xp missions"] = "Favoriser les champions à entraîner pour les missions rapportant de l'expérience"
L["Followers status "] = "État du sujet"
--Translation missing 
L["For better experience, lock your desired follower to get filled only the missions you want"] = "For better experience, lock your desired follower to get filled only the missions you want"
L["General"] = "Général"
L["Global approx. xp reward"] = "Global env. Xp récompense"
--Translation missing 
L["Global approx. xp reward per hour"] = "Global approx. xp reward per hour"
L["HallComander Quick Mission Completion"] = "Achèvement rapide de mission HallComander"
--Translation missing 
L["If bonus chance is lower than this, then we try to not overcap the mission."] = "If bonus chance is lower than this, then we try to not overcap the mission."
L["If not checked, inactive followers are used as last chance"] = "Si non coché, les sujets désactivé seront utilisé en dernier recours"
L[ [=[If you %s, you will lose them
Click on %s to abort]=] ] = [=[Si vous %s, vous allez les perdre.
Cliquez sur %s pour annuler.]=]
L["Ignore busy followers"] = "Ignorer les sujets occupés"
L["Ignore inactive followers"] = "Ignore les sujets désactivés"
L["Keep cost low"] = "Garder le coût bas"
L["Keep extra bonus"] = "Garder le butin bonus"
L["Keep time short"] = "Garde le temps court"
L["Keep time VERY short"] = "Gardez le temps très court"
--Translation missing 
L["Launch all ready missions"] = "Launch all ready missions"
L["Level"] = "Niveau"
L["Make Order Hall Mission Panel movable"] = "Panneau de missions de domaine déplaçable"
L["Max champions"] = "Champions max"
--Translation missing 
L["Maximize filled missions"] = "Maximize filled missions"
L["Maximize xp gain"] = "Maximiser le gain d'xp"
L["Mission duration reduced"] = "Durée de la mission réduite"
L["Missions"] = true
L["No follower gained xp"] = "Aucun sujet n'a gagné d'xp"
--Translation missing 
L["Not blacklisted"] = "Not blacklisted"
L["Not enough troops, raise maximum champions' number"] = "Pas assez de troupes, augmentez le nombre maximum de champions"
L["Nothing to report"] = "Rien à signaler"
L["Notifies you when you have troops ready to be collected"] = "Vous avertit lorsque vous avez des troupes prêtes à être récupérées"
L["Only accept missions with time improved"] = "N'acceptez que les missions avec le temps amélioré"
--Translation missing 
L["Only consider Elite missions"] = "Only consider Elite missions"
L["Only use champions even if troops are available"] = "Utiliser uniquement des champions même si des troupes sont disponibles"
--Translation missing 
L[ [=[OrderHallCommander overrides GarrisonCommander for Order Hall Management.
 You can revert to GarrisonCommander simply disabling OrderhallCommander.
If instead you like OrderHallCommander remember to add it to Curse client and keep it updated]=] ] = [=[OrderHallCommander overrides GarrisonCommander for Order Hall Management.
 You can revert to GarrisonCommander simply disabling OrderhallCommander.
If instead you like OrderHallCommander remember to add it to Curse client and keep it updated]=]
L["Original method"] = "Méthode originale"
L["Position is not saved on logout"] = "La position n'est pas enregistrée lors de la déconnexion"
--Translation missing 
L["Release notes"] = "Release notes"
--Translation missing 
L["Remove no champions warning"] = "Remove no champions warning"
L["Resurrect troops effect"] = "Effet Résurrection des troupes"
L["Reward type"] = "Type de récompense"
--Translation missing 
L["Right-Click to blacklist"] = "Right-Click to blacklist"
--Translation missing 
L["Right-Click to remove from blacklist"] = "Right-Click to remove from blacklist"
L["Show/hide OrderHallCommander mission menu"] = "Afficher / masquer le menu de mission OrderHallCommander"
L["Sort missions by:"] = "Trier les missions par:"
L["Success Chance"] = "Chance de succès"
L["Troop ready alert"] = "Alerte troupes prêtes"
--Translation missing 
L["Unable to fill missions, raise maximum champions' number"] = "Unable to fill missions, raise maximum champions' number"
L["Unable to fill missions. Check your switches"] = "Impossible de remplir les missions. Vérifiez les paramètres."
--Translation missing 
L["Unlock all"] = "Unlock all"
--Translation missing 
L["Unlocks all follower at once"] = "Unlocks all follower at once"
L["Upgrading to |cff00ff00%d|r"] = "Mise à niveau vers |cff00ff00%d|r"
--Translation missing 
L["URL Copy"] = "URL Copy"
L["Use at most this many champions"] = "Utilisé au maximum ce nombre de champions"
L["Use combat ally"] = "Utiliser le combattant allié"
L["When no free followers are available shows empty follower"] = "Quand aucun sujet n'est disponible afficher un sujet vide"
--Translation missing 
L["When we cant achieve the requested bonus chance, we try to reach at least this one"] = "When we cant achieve the requested bonus chance, we try to reach at least this one"
L["You are wasting |cffff0000%d|cffffd200 point(s)!!!"] = "Vous perdez |cffff0000%d|cffffd200 point (s) !!!"
L["You have no troops"] = "Vous n'avez pas de troupe"

return
end
L=l:NewLocale(me,"deDE")
if (L) then
L["Always counter increased resource cost"] = "Immer erhöhte Ressourcenkosten kontern"
L["Always counter increased time"] = "Immer erhöhte Missionsdauer kontern"
L["Always counter kill troops (ignored if we can only use troops with just 1 durability left)"] = "Töten der Trupps immer kontern (dies wird ignoriert, falls nur Truppen mit 1 Haltbarkeit benutzt werden können)"
L["Always counter no bonus loot threat"] = "Kontert immer Bedrohungen, die Bonusbeute verhindern"
L["Artifact shown value is the base value without considering knowledge multiplier"] = "Der angezeigte Wert ist der Grundwert ohne die Berücksichtigung von Artefakwissen."
--Translation missing 
L["Attempts to use less champions for missions, in order to fill more missions"] = "Attempts to use less champions for missions, in order to fill more missions"
--Translation missing 
L["Base Chance"] = "Base Chance"
L["Better parties available in next future"] = "Bessere Gruppen sind in absehbarer Zeit verfügbar"
--Translation missing 
L["Blacklisted"] = "Blacklisted"
--Translation missing 
L["Blacklisted missions are ignored in Mission Control"] = "Blacklisted missions are ignored in Mission Control"
--Translation missing 
L["Bonus Chance"] = "Bonus Chance"
L["Building Final report"] = "Erstelle Abschlussbericht"
--Translation missing 
L["but using troops with just one durability left"] = "but using troops with just one durability left"
L["Capped %1$s. Spend at least %2$d of them"] = "Maximal %1$ s. Gib mindestens %2$d davon aus"
L["Changes the sort order of missions in Mission panel"] = "Verändert die Sortierreihenfolge der Missionen in der Missionsübersicht"
L["Combat ally is proposed for missions so you can consider unassigning him"] = "Der Kampfgefährte wird für Missionen vorgeschlagen, du kannst dann entscheiden, ob du ihn abziehen möchtest"
L["Complete all missions without confirmation"] = "Alle Missionen ohne Bestätigung abschließen"
L["Configuration for mission party builder"] = "Konfiguration des Gruppenerstellers für Missionen"
L["Cost reduced"] = "Kosten reduziert"
--Translation missing 
L["Disables warning: "] = "Disables warning: "
L["Dont kill Troops"] = "Trupps nicht töten"
L["Don't use troops"] = "Keine Truppen verwenden"
L["Duration reduced"] = "Dauer reduziert"
L["Duration Time"] = "Dauer"
--Translation missing 
L["Empty missions sorted as last"] = "Empty missions sorted as last"
--Translation missing 
L["Empty or 0% success mission are sorted as last. Does not apply to \"original\" method"] = "Empty or 0% success mission are sorted as last. Does not apply to \"original\" method"
L["Expiration Time"] = "Ablaufzeit"
L["Favours leveling follower for xp missions"] = "Bevorzugt niedrigstufige Anhänger für EP-Missionen"
L["Followers status "] = "Anhängerstatus"
--Translation missing 
L["For better experience, lock your desired follower to get filled only the missions you want"] = "For better experience, lock your desired follower to get filled only the missions you want"
L["General"] = "Allgemein"
L["Global approx. xp reward"] = "EP-Belohnung gesamt"
L["Global approx. xp reward per hour"] = "EP-Belohnung pro Stunde"
L["HallComander Quick Mission Completion"] = "HallComander Schneller Missionsabschluss"
--Translation missing 
L["If bonus chance is lower than this, then we try to not overcap the mission."] = "If bonus chance is lower than this, then we try to not overcap the mission."
L["If not checked, inactive followers are used as last chance"] = "Wenn nicht ausgewählt, werden inaktive Anhänger als letzte Möglichkeit verwendet"
L[ [=[If you %s, you will lose them
Click on %s to abort]=] ] = [=[Wenn du %s, wirst du sie verlieren.
Klicke auf %s, um abzubrechen]=]
L["Ignore busy followers"] = "Beschäftigte Anhänger ignorieren"
L["Ignore inactive followers"] = "Untätige Anhänger ignorieren"
L["Keep cost low"] = "Kosten niedrig halten"
L["Keep extra bonus"] = "Bonusbeute behalten"
L["Keep time short"] = "Zeit kurz halten"
L["Keep time VERY short"] = "Zeit SEHR kurz halten"
--Translation missing 
L["Launch all ready missions"] = "Launch all ready missions"
L["Level"] = "Stufe"
L["Make Order Hall Mission Panel movable"] = "Ordenshallen-Missionsfenster beweglich machen"
L["Max champions"] = "Max. Anhänger"
--Translation missing 
L["Maximize filled missions"] = "Maximize filled missions"
L["Maximize xp gain"] = "Erfahrungszunahme maximieren"
L["Mission duration reduced"] = "Missionsdauer reduziert"
L["Missions"] = "Missionen"
L["No follower gained xp"] = "Kein Anhänger erhielt EP"
--Translation missing 
L["Not blacklisted"] = "Not blacklisted"
L["Not enough troops, raise maximum champions' number"] = "Du hast nicht genügend Trupps, erhöhe die maximale Anzahl von Anhängern pro Mission"
L["Nothing to report"] = "Nichts zu berichten"
L["Notifies you when you have troops ready to be collected"] = "Benachrichtigt, wenn Truppen bereit sind, gesammelt zu werden"
L["Only accept missions with time improved"] = "Nur Missionen mit verkürzter Dauer annehmen"
--Translation missing 
L["Only consider Elite missions"] = "Only consider Elite missions"
L["Only use champions even if troops are available"] = "Verwende nur Anhänger, auch wenn Trupps vorhanden sind"
L[ [=[OrderHallCommander overrides GarrisonCommander for Order Hall Management.
 You can revert to GarrisonCommander simply disabling OrderhallCommander.
If instead you like OrderHallCommander remember to add it to Curse client and keep it updated]=] ] = [=[OrderHallCommander überschreibt GarrisonCommaner für Mission in der Ordenshalle.
Du kannst OrderhallCommander einfach deaktvieren um wieder OrderhallCommander zu verwenden.
Wenn du OrderhallCommander allerdings gut findest, vergiss nicht es in deinem Curse Client hinzuzufügen und aktuell zu halten.]=]
L["Original method"] = "Standard"
L["Position is not saved on logout"] = "Die Position wird beim Ausloggen nicht gespeichert"
--Translation missing 
L["Release notes"] = "Release notes"
--Translation missing 
L["Remove no champions warning"] = "Remove no champions warning"
L["Resurrect troops effect"] = "Truppen wiederbeleben"
L["Reward type"] = "Belohnungsart"
--Translation missing 
L["Right-Click to blacklist"] = "Right-Click to blacklist"
--Translation missing 
L["Right-Click to remove from blacklist"] = "Right-Click to remove from blacklist"
L["Show/hide OrderHallCommander mission menu"] = "OrderHallCommander-Missionsmenü zeigen/ausblenden"
L["Sort missions by:"] = "Sortieren nach:"
L["Success Chance"] = "Erfolgschance"
L["Troop ready alert"] = "Warnung Trupp bereit"
--Translation missing 
L["Unable to fill missions, raise maximum champions' number"] = "Unable to fill missions, raise maximum champions' number"
L["Unable to fill missions. Check your switches"] = "Mit den aktuellen Einstellungen kann keine Mission besetzt werden"
--Translation missing 
L["Unlock all"] = "Unlock all"
--Translation missing 
L["Unlocks all follower at once"] = "Unlocks all follower at once"
L["Upgrading to |cff00ff00%d|r"] = "Erhöhe Stufe auf |cff00ff00%d|r"
L["URL Copy"] = "URL kopieren"
L["Use at most this many champions"] = "Verwende maximal so viele Anhänger pro Mission"
L["Use combat ally"] = "Kampfgefährten verwenden"
--Translation missing 
L["When no free followers are available shows empty follower"] = "When no free followers are available shows empty follower"
--Translation missing 
L["When we cant achieve the requested bonus chance, we try to reach at least this one"] = "When we cant achieve the requested bonus chance, we try to reach at least this one"
L["You are wasting |cffff0000%d|cffffd200 point(s)!!!"] = "Du verschwendst |cffff0000%d |cffffd200|4Punkt:Punkte;!"
L["You have no troops"] = "Du hast keine Trupps"

return
end
L=l:NewLocale(me,"itIT")
if (L) then
L["Always counter increased resource cost"] = "Contrasta sempre incremento risorse"
L["Always counter increased time"] = "Contrasta sempre incremento durata"
L["Always counter kill troops (ignored if we can only use troops with just 1 durability left)"] = "Contrasta sempre morte milizie (ignorato tutte le milizie hanno solo una vita rimanente)"
L["Always counter no bonus loot threat"] = "Contrasta sempre il \"no bonus\""
L["Artifact shown value is the base value without considering knowledge multiplier"] = "Il valore mostrato è quello base, senza considerare il moltiplicatore dalla conoscenza"
L["Attempts to use less champions for missions, in order to fill more missions"] = "Cerca di usare meno campioni per poter completare un maggior numero di missioni"
L["Base Chance"] = "Percentuale base"
L["Better parties available in next future"] = "Ci sono combinazioni migliori nel futuro"
L["Blacklisted"] = "In lista nera"
L["Blacklisted missions are ignored in Mission Control"] = "Le missioni in lista nera vengono ignorate negli automatismi"
L["Bonus Chance"] = "Percentuale bonus"
L["Building Final report"] = "Sto preparando il rapporto finale"
L["but using troops with just one durability left"] = "ma uso truppe con solo un punto vita rimasto"
L["Capped %1$s. Spend at least %2$d of them"] = "%1$s ha un limite. Spendine almeno %2%d"
L["Changes the sort order of missions in Mission panel"] = "Cambia l'ordine delle mission nel Pannello Missioni"
L["Combat ally is proposed for missions so you can consider unassigning him"] = "Viene proposto l'alleato, per poter valutare se rimuoverlo dalla missione di scorta"
L["Complete all missions without confirmation"] = "Completa tutte le missioni senza chiedere conferma"
L["Configuration for mission party builder"] = "Configurazioni per il generatore di gruppi"
L["Cost reduced"] = "Costo ridotto"
L["Disables warning: "] = "Disabilita l'avviso:"
L["Dont kill Troops"] = "Non uccidere le truppe"
L["Don't use troops"] = "Non usare truppe"
L["Duration reduced"] = "Durata"
L["Duration Time"] = "Scadenza"
L["Empty missions sorted as last"] = "Le missioni senza campioni vengono ordinate come ultime"
L["Empty or 0% success mission are sorted as last. Does not apply to \"original\" method"] = "Le missioni senza campioni o con lo 0% o meno di possibilità di successo vengono ordinate come ultime. Non si applica all'ordinamento originale Blizzard"
L["Expiration Time"] = "Scadenza"
L["Favours leveling follower for xp missions"] = "Preferisci i campioni che devono livellare"
L["Followers status "] = "Stato del seguage"
--Translation missing 
L["For better experience, lock your desired follower to get filled only the missions you want"] = "For better experience, lock your desired follower to get filled only the missions you want"
L["General"] = "Generale"
L["Global approx. xp reward"] = "Approssimativi PE globali"
L["Global approx. xp reward per hour"] = "Approssimativi PE globali per ora"
L["HallComander Quick Mission Completion"] = "OrderHallCommander Completamento rapido"
--Translation missing 
L["If bonus chance is lower than this, then we try to not overcap the mission."] = "If bonus chance is lower than this, then we try to not overcap the mission."
L["If not checked, inactive followers are used as last chance"] = "Se non attivo, visualizzerà seguaci inattivi pur di riempire la missione"
L[ [=[If you %s, you will lose them
Click on %s to abort]=] ] = "Se %s le perderai. Clicca su %s per interrompere"
L["Ignore busy followers"] = "Ignora i seguaci occupati"
L["Ignore inactive followers"] = "Ignora i seguaci inattivi"
L["Keep cost low"] = "Mantieni il costo basso"
L["Keep extra bonus"] = "Ottieni il bonus aggiuntivo"
L["Keep time short"] = "Riduci la durata"
L["Keep time VERY short"] = "Riduci MOLTO la durata"
--Translation missing 
L["Launch all ready missions"] = "Launch all ready missions"
L["Level"] = "Livello"
L["Make Order Hall Mission Panel movable"] = "Rendi spostabile il pannello missioni"
L["Max champions"] = "Campioni massimi"
L["Maximize filled missions"] = "Massimizza il numero di missioni"
L["Maximize xp gain"] = "Massimizza il guadagno di PE"
L["Mission duration reduced"] = "Durata missione ridotta"
L["Missions"] = "Missioni"
L["No follower gained xp"] = "Nessun campione ha guaagnato PE"
--Translation missing 
L["Not blacklisted"] = "Not blacklisted"
L["Not enough troops, raise maximum champions' number"] = "Non hai abbastanza truppe, usa più campioni"
L["Nothing to report"] = "Niente da segnalare"
L["Notifies you when you have troops ready to be collected"] = "Notificami quando ho truppe pronte per essere raccolte"
L["Only accept missions with time improved"] = "Accetta solo missioni con bonus durata ridotta"
--Translation missing 
L["Only consider Elite missions"] = "Only consider Elite missions"
L["Only use champions even if troops are available"] = "Usa solo campioni anche se ci sono truppe disponibili"
L[ [=[OrderHallCommander overrides GarrisonCommander for Order Hall Management.
 You can revert to GarrisonCommander simply disabling OrderhallCommander.
If instead you like OrderHallCommander remember to add it to Curse client and keep it updated]=] ] = [=[OrderHallCommander sostituisce l'interfaccia di GarrisonComamnder per le missioni di classe
Disabilitalo se preferisci GarrisonCommander.
Se invece ti piace, aggiungilo al client Curse e tienilo aggiornato]=]
L["Original method"] = "Metodo originale"
L["Position is not saved on logout"] = "La posizione non è salvata alla disconnessione"
--Translation missing 
L["Release notes"] = "Release notes"
--Translation missing 
L["Remove no champions warning"] = "Remove no champions warning"
L["Resurrect troops effect"] = "Resurrezione truppe possibile"
L["Reward type"] = "Tipo ricompensa"
--Translation missing 
L["Right-Click to blacklist"] = "Right-Click to blacklist"
--Translation missing 
L["Right-Click to remove from blacklist"] = "Right-Click to remove from blacklist"
L["Show/hide OrderHallCommander mission menu"] = "Mostra/ascondi il menu di missione di OrderHallCommander"
L["Sort missions by:"] = "Ordina le missioni per:"
L["Success Chance"] = "Percentuale di successo"
L["Troop ready alert"] = "Avviso truppe pronte"
--Translation missing 
L["Unable to fill missions, raise maximum champions' number"] = "Unable to fill missions, raise maximum champions' number"
L["Unable to fill missions. Check your switches"] = "Impossibile riempire le missioni. Controlla le opzioni scelte"
--Translation missing 
L["Unlock all"] = "Unlock all"
--Translation missing 
L["Unlocks all follower at once"] = "Unlocks all follower at once"
L["Upgrading to |cff00ff00%d|r"] = "Incremento a |cff00ff00%d|r"
L["URL Copy"] = "Copia la URL"
L["Use at most this many champions"] = "Usa al massimo questo numero di campioni"
L["Use combat ally"] = "Usa l'alleato"
L["When no free followers are available shows empty follower"] = "Quando non ci sono seguaci disponibili mostra le caselle vuote"
--Translation missing 
L["When we cant achieve the requested bonus chance, we try to reach at least this one"] = "When we cant achieve the requested bonus chance, we try to reach at least this one"
L["You are wasting |cffff0000%d|cffffd200 point(s)!!!"] = "Stai sprecando |cffff0000%d|cffffd200 punti!!"
L["You have no troops"] = "Non hai truppe disponibili"

return
end
L=l:NewLocale(me,"koKR")
if (L) then
L["Always counter increased resource cost"] = "자원 비용 증가 항상 대응"
L["Always counter increased time"] = "소요 시간 증가 항상 대응"
L["Always counter kill troops (ignored if we can only use troops with just 1 durability left)"] = "병력 죽이기 항상 대응 (활력이 1만 남은 병력만 있을 땐 무시)"
L["Always counter no bonus loot threat"] = "추가 전리품 획득 불가 항상 대응"
L["Artifact shown value is the base value without considering knowledge multiplier"] = "표시된 유물력 값은 유물 지식 레벨을 고려하지 않은 기본 값입니다"
L["Attempts to use less champions for missions, in order to fill more missions"] = "더 많은 임무를 채우기 위해 임무에 최소한의 용사만 배치하도록 시도합니다"
L["Base Chance"] = "기본 성공 확률"
L["Better parties available in next future"] = "다음 시간 후엔 더 나은 파티가 가능합니다"
L["Blacklisted"] = "차단됨"
L["Blacklisted missions are ignored in Mission Control"] = "차단된 임무는 임무 제어에서 무시됩니다"
L["Bonus Chance"] = "보너스 주사위 확률"
L["Building Final report"] = "최종 보고서 작성"
L["but using troops with just one durability left"] = "활력이 하나만 남은 병력은 사용합니다"
L["Capped %1$s. Spend at least %2$d of them"] = "%1$s 상한선에 도달했습니다. 최소 %2$d개를 소모하세요"
L["Changes the sort order of missions in Mission panel"] = "임무 창 내 임무의 정렬 방법을 변경합니다"
L["Combat ally is proposed for missions so you can consider unassigning him"] = "전투 동료가 임무에 제안되며 전투 동료 지정 해제를 해야 할 수 있습니다"
L["Complete all missions without confirmation"] = "확인 없이 모든 임무를 완료합니다"
L["Configuration for mission party builder"] = "임무 파티 구성 설정"
L["Cost reduced"] = "비용 감소"
L["Disables warning: "] = "경고 비활성: "
L["Dont kill Troops"] = "병력 죽이지 않기"
L["Don't use troops"] = "병력 사용하지 않기"
L["Duration reduced"] = "소요 시간 감소"
L["Duration Time"] = "소요 시간"
L["Empty missions sorted as last"] = "빈 임무를 마지막에 정렬"
L["Empty or 0% success mission are sorted as last. Does not apply to \"original\" method"] = "비었거나 성공률이 0%인 임무가 마지막에 정렬됩니다. \"원래의 방법\"에는 적용되지 않습니다"
L["Expiration Time"] = "만료 시간"
L["Favours leveling follower for xp missions"] = "레벨 육성 중인 추종자를 경험치 임무에 우선 지정합니다"
L["Followers status "] = "추종자 상태"
L["For better experience, lock your desired follower to get filled only the missions you want"] = "더 나은 경험치를 위해 당신의 선호하는 추종자를 당신이 원하는 임무에만 채워지도록 고정합니다"
L["General"] = "일반"
L["Global approx. xp reward"] = "총 예상 경험치 보상"
L["Global approx. xp reward per hour"] = "시간 당 예상 경험치 보상"
L["HallComander Quick Mission Completion"] = "HallCommander 빠른 임무 완료"
L["If bonus chance is lower than this, then we try to not overcap the mission."] = "보너스 주사위 확률이 이 값보다 낮으면 임무 성공률이 초과되지 않도록 시도합니다."
L["If not checked, inactive followers are used as last chance"] = "선택하지 않으면 비활성 추종자가 확률 계산에 사용됩니다"
L[ [=[If you %s, you will lose them
Click on %s to abort]=] ] = [=[만약 %s|1이라면;라면; 그들을 잃게 됩니다
취소하려면 %s|1을;를; 클릭하세요]=]
L["Ignore busy followers"] = "바쁜 추종자 무시"
L["Ignore inactive followers"] = "비활성 추종자 무시"
L["Keep cost low"] = "비용 절감 유지"
L["Keep extra bonus"] = "추가 전리품 유지"
L["Keep time short"] = "시간 절약 유지"
L["Keep time VERY short"] = "시간 매우 절약 유지"
L["Launch all ready missions"] = "모든 준비된 임무 시작"
L["Level"] = "레벨"
L["Make Order Hall Mission Panel movable"] = "직업 전당 임무 창 이동 가능 설정"
L["Max champions"] = "최대 용사"
L["Maximize filled missions"] = "임무 채우기 최대화"
L["Maximize xp gain"] = "경험치 획득 최대화"
L["Mission duration reduced"] = "임무 소요 시간 감소"
L["Missions"] = "임무"
L["No follower gained xp"] = "경험치를 획득한 추종자 없음"
L["Not blacklisted"] = "차단되지 않음"
L["Not enough troops, raise maximum champions' number"] = "병력이 부족합니다, 최대 용사의 수를 늘리세요"
L["Nothing to report"] = "보고할 내용 없음"
L["Notifies you when you have troops ready to be collected"] = "병력을 회수할 준비가 되면 당신에게 알립니다"
L["Only accept missions with time improved"] = "소요 시간이 감소한 임무만 수락합니다"
L["Only consider Elite missions"] = "정예 임무만 고려"
L["Only use champions even if troops are available"] = "병력을 사용가능 해도 용사만 사용합니다"
L[ [=[OrderHallCommander overrides GarrisonCommander for Order Hall Management.
 You can revert to GarrisonCommander simply disabling OrderhallCommander.
If instead you like OrderHallCommander remember to add it to Curse client and keep it updated]=] ] = [=[OrderHallCommander는 직업 전당 관리에 GarrisonCommander보다 우선됩니다.
OrderHallCommander를 비활성하면 GarrisonCommander로 전환할 수 있습니다.
대신 당신이 OrderHallCommander를 좋아한다면 Curse 클라이언트에 추가하고 업데이트를 유지하세요]=]
L["Original method"] = "원래의 방법"
L["Position is not saved on logout"] = "접속 종료시 위치는 저장되지 않습니다"
L["Release notes"] = "버전 변경 사항"
L["Remove no champions warning"] = "용사 없음 경고 제거"
L["Resurrect troops effect"] = "병력 부활 효과"
L["Reward type"] = "보상 유형"
L["Right-Click to blacklist"] = "차단하려면 오른쪽-클릭"
L["Right-Click to remove from blacklist"] = "차단목록에서 제거하려면 오른쪽-클릭"
L["Show/hide OrderHallCommander mission menu"] = "OrderHallCommander 임무 메뉴 표시/숨기기"
L["Sort missions by:"] = "임무 정렬 방법:"
L["Success Chance"] = "성공 확률"
L["Troop ready alert"] = "병력 준비 경보"
L["Unable to fill missions, raise maximum champions' number"] = "임무를 채울 수 없습니다, 최대 용사 숫자를 키우세요"
L["Unable to fill missions. Check your switches"] = "임무를 채울 수 없습니다. 설정을 확인하세요"
L["Unlock all"] = "모두 잠금 해제"
L["Unlocks all follower at once"] = "모든 추종자를 한번에 잠금 해제합니다"
L["Upgrading to |cff00ff00%d|r"] = "|cff00ff00%d|r\\1241으로;로; 향상시키기"
L["URL Copy"] = "URL 복사"
L["Use at most this many champions"] = "되도록 이 숫자의 용사를 사용합니다"
L["Use combat ally"] = "전투 동료 사용"
L["When no free followers are available shows empty follower"] = "사용 가능한 추종자가 없으면 추종자 칸을 빈 상태로 표시합니다"
L["When we cant achieve the requested bonus chance, we try to reach at least this one"] = "요청된 보너스 주사위 확률을 달성하지 못하면 최소한 이 값에 근접하도록 시도합니다"
L["You are wasting |cffff0000%d|cffffd200 point(s)!!!"] = "|cffff0000%d|cffffd200점을 낭비하고 있습니다!!!"
L["You have no troops"] = "병력이 없습니다"

return
end
L=l:NewLocale(me,"esMX")
if (L) then
L["Always counter increased resource cost"] = "Siempre contrarreste el mayor costo de recursos"
L["Always counter increased time"] = "Siempre contrarreste el tiempo incrementado"
L["Always counter kill troops (ignored if we can only use troops with just 1 durability left)"] = "Siempre contra las tropas de matar (ignorado si sólo podemos utilizar tropas con sólo 1 durabilidad a la izquierda)"
--Translation missing 
L["Always counter no bonus loot threat"] = "Always counter no bonus loot threat"
--Translation missing 
L["Artifact shown value is the base value without considering knowledge multiplier"] = "Artifact shown value is the base value without considering knowledge multiplier"
--Translation missing 
L["Attempts to use less champions for missions, in order to fill more missions"] = "Attempts to use less champions for missions, in order to fill more missions"
--Translation missing 
L["Base Chance"] = "Base Chance"
L["Better parties available in next future"] = "Mejores fiestas disponibles en el próximo futuro"
--Translation missing 
L["Blacklisted"] = "Blacklisted"
--Translation missing 
L["Blacklisted missions are ignored in Mission Control"] = "Blacklisted missions are ignored in Mission Control"
--Translation missing 
L["Bonus Chance"] = "Bonus Chance"
L["Building Final report"] = "Informe final del edificio"
--Translation missing 
L["but using troops with just one durability left"] = "but using troops with just one durability left"
L["Capped %1$s. Spend at least %2$d of them"] = "% 1 $ s cubierto. Gasta al menos% 2 $ d de ellos"
L["Changes the sort order of missions in Mission panel"] = "Cambia el orden de las misiones en el panel de la Misión"
--Translation missing 
L["Combat ally is proposed for missions so you can consider unassigning him"] = "Combat ally is proposed for missions so you can consider unassigning him"
L["Complete all missions without confirmation"] = "Completa todas las misiones sin confirmación"
L["Configuration for mission party builder"] = "Configuración para el constructor de la misión"
--Translation missing 
L["Cost reduced"] = "Cost reduced"
--Translation missing 
L["Disables warning: "] = "Disables warning: "
L["Dont kill Troops"] = "No matar a las tropas"
--Translation missing 
L["Don't use troops"] = "Don't use troops"
L["Duration reduced"] = "Duración reducida"
L["Duration Time"] = "Duración"
--Translation missing 
L["Empty missions sorted as last"] = "Empty missions sorted as last"
--Translation missing 
L["Empty or 0% success mission are sorted as last. Does not apply to \"original\" method"] = "Empty or 0% success mission are sorted as last. Does not apply to \"original\" method"
L["Expiration Time"] = "Tiempo de expiración"
L["Favours leveling follower for xp missions"] = "Favors nivelando seguidor para las misiones xp"
--Translation missing 
L["Followers status "] = "Followers status "
--Translation missing 
L["For better experience, lock your desired follower to get filled only the missions you want"] = "For better experience, lock your desired follower to get filled only the missions you want"
L["General"] = true
L["Global approx. xp reward"] = "Global aprox. Recompensa xp"
--Translation missing 
L["Global approx. xp reward per hour"] = "Global approx. xp reward per hour"
L["HallComander Quick Mission Completion"] = "Conclusión de la misión rápida de HallComander"
--Translation missing 
L["If bonus chance is lower than this, then we try to not overcap the mission."] = "If bonus chance is lower than this, then we try to not overcap the mission."
--Translation missing 
L["If not checked, inactive followers are used as last chance"] = "If not checked, inactive followers are used as last chance"
--Translation missing 
L[ [=[If you %s, you will lose them
Click on %s to abort]=] ] = [=[If you %s, you will lose them
Click on %s to abort]=]
--Translation missing 
L["Ignore busy followers"] = "Ignore busy followers"
--Translation missing 
L["Ignore inactive followers"] = "Ignore inactive followers"
L["Keep cost low"] = "Mantenga el costo bajo"
--Translation missing 
L["Keep extra bonus"] = "Keep extra bonus"
L["Keep time short"] = "Mantenga el tiempo corto"
L["Keep time VERY short"] = "Mantener el tiempo muy corto"
--Translation missing 
L["Launch all ready missions"] = "Launch all ready missions"
L["Level"] = "Nivel"
L["Make Order Hall Mission Panel movable"] = "Hacer pedido Hall Misión Panel móvil"
--Translation missing 
L["Max champions"] = "Max champions"
--Translation missing 
L["Maximize filled missions"] = "Maximize filled missions"
L["Maximize xp gain"] = "Maximizar la ganancia de xp"
--Translation missing 
L["Mission duration reduced"] = "Mission duration reduced"
L["Missions"] = "Misiones"
L["No follower gained xp"] = "Ningún seguidor ganó xp"
--Translation missing 
L["Not blacklisted"] = "Not blacklisted"
--Translation missing 
L["Not enough troops, raise maximum champions' number"] = "Not enough troops, raise maximum champions' number"
L["Nothing to report"] = "Nada que reportar"
L["Notifies you when you have troops ready to be collected"] = "Notifica cuando hay tropas listas para ser recolectadas"
L["Only accept missions with time improved"] = "Sólo aceptar misiones mejoradas con el tiempo"
--Translation missing 
L["Only consider Elite missions"] = "Only consider Elite missions"
--Translation missing 
L["Only use champions even if troops are available"] = "Only use champions even if troops are available"
--Translation missing 
L[ [=[OrderHallCommander overrides GarrisonCommander for Order Hall Management.
 You can revert to GarrisonCommander simply disabling OrderhallCommander.
If instead you like OrderHallCommander remember to add it to Curse client and keep it updated]=] ] = [=[OrderHallCommander overrides GarrisonCommander for Order Hall Management.
 You can revert to GarrisonCommander simply disabling OrderhallCommander.
If instead you like OrderHallCommander remember to add it to Curse client and keep it updated]=]
L["Original method"] = "Método original"
L["Position is not saved on logout"] = "La posición no se guarda al cerrar la sesión"
--Translation missing 
L["Release notes"] = "Release notes"
--Translation missing 
L["Remove no champions warning"] = "Remove no champions warning"
L["Resurrect troops effect"] = "Efecto de las tropas de resurrección"
L["Reward type"] = "Tipo de recompensa"
--Translation missing 
L["Right-Click to blacklist"] = "Right-Click to blacklist"
--Translation missing 
L["Right-Click to remove from blacklist"] = "Right-Click to remove from blacklist"
L["Show/hide OrderHallCommander mission menu"] = "Mostrar / ocultar el menú de la misión OrderHallCommander"
L["Sort missions by:"] = "Ordenar misiones por:"
L["Success Chance"] = "Éxito"
L["Troop ready alert"] = "Alerta lista de tropas"
--Translation missing 
L["Unable to fill missions, raise maximum champions' number"] = "Unable to fill missions, raise maximum champions' number"
--Translation missing 
L["Unable to fill missions. Check your switches"] = "Unable to fill missions. Check your switches"
--Translation missing 
L["Unlock all"] = "Unlock all"
--Translation missing 
L["Unlocks all follower at once"] = "Unlocks all follower at once"
L["Upgrading to |cff00ff00%d|r"] = "Actualizando a | cff00ff00% d | r"
--Translation missing 
L["URL Copy"] = "URL Copy"
--Translation missing 
L["Use at most this many champions"] = "Use at most this many champions"
--Translation missing 
L["Use combat ally"] = "Use combat ally"
--Translation missing 
L["When no free followers are available shows empty follower"] = "When no free followers are available shows empty follower"
--Translation missing 
L["When we cant achieve the requested bonus chance, we try to reach at least this one"] = "When we cant achieve the requested bonus chance, we try to reach at least this one"
L["You are wasting |cffff0000%d|cffffd200 point(s)!!!"] = "Está perdiendo | cffff0000% d | cffffd200 punto (s)!"
--Translation missing 
L["You have no troops"] = "You have no troops"

return
end
L=l:NewLocale(me,"ruRU")
if (L) then
L["Always counter increased resource cost"] = "Учитывать увеличение стоимости ресурсов."
L["Always counter increased time"] = "Учитывать увеличение времени на задание"
L["Always counter kill troops (ignored if we can only use troops with just 1 durability left)"] = "Всегда учитывать смерть войска. (Игнорируется, если остались войска только с 1 ед.здоровья)"
L["Always counter no bonus loot threat"] = [=[Игнорировать миссии, если
нет шанса на дополнительную добычу]=]
L["Artifact shown value is the base value without considering knowledge multiplier"] = "Показывать базовое значение артефакта без учета множителя знания"
L["Attempts to use less champions for missions, in order to fill more missions"] = "Попытаться использовать меньше чемпионов для миссий, для того чтобы выполнить больше миссий"
--Translation missing 
L["Base Chance"] = "Base Chance"
L["Better parties available in next future"] = "Лучшая партия будет скоро доступна"
--Translation missing 
L["Blacklisted"] = "Blacklisted"
--Translation missing 
L["Blacklisted missions are ignored in Mission Control"] = "Blacklisted missions are ignored in Mission Control"
--Translation missing 
L["Bonus Chance"] = "Bonus Chance"
L["Building Final report"] = "Создать отчет."
--Translation missing 
L["but using troops with just one durability left"] = "but using troops with just one durability left"
L["Capped %1$s. Spend at least %2$d of them"] = "Достигнуто %1$. Потратьте  по крайней мере 2%$"
L["Changes the sort order of missions in Mission panel"] = "Изменяет порядок сортировки миссий на панели"
L["Combat ally is proposed for missions so you can consider unassigning him"] = [=[Использовать боевого соратника в расчетах.
Перед отправкой освободите соратника.]=]
L["Complete all missions without confirmation"] = "Завершить все миссии без подтверждения"
L["Configuration for mission party builder"] = "Конфигурация для создания, групповой миссии"
L["Cost reduced"] = "Стоимость уменьшена"
--Translation missing 
L["Disables warning: "] = "Disables warning: "
L["Dont kill Troops"] = "Не убивать войска"
L["Don't use troops"] = "Не использовать войска"
L["Duration reduced"] = "Продолжительность уменьшена"
L["Duration Time"] = "Продолжительность"
--Translation missing 
L["Empty missions sorted as last"] = "Empty missions sorted as last"
--Translation missing 
L["Empty or 0% success mission are sorted as last. Does not apply to \"original\" method"] = "Empty or 0% success mission are sorted as last. Does not apply to \"original\" method"
L["Expiration Time"] = "Время окончания"
L["Favours leveling follower for xp missions"] = "В миссиях на опыт, использовать гибкую прокачку соратников"
L["Followers status "] = "Статус соратников"
--Translation missing 
L["For better experience, lock your desired follower to get filled only the missions you want"] = "For better experience, lock your desired follower to get filled only the missions you want"
L["General"] = "Основные"
L["Global approx. xp reward"] = "Общая прибл. награда опыта"
L["Global approx. xp reward per hour"] = "Общий прибл. опыт в час"
L["HallComander Quick Mission Completion"] = "HallComander Быстрое завершение миссий"
--Translation missing 
L["If bonus chance is lower than this, then we try to not overcap the mission."] = "If bonus chance is lower than this, then we try to not overcap the mission."
L["If not checked, inactive followers are used as last chance"] = "Если этот флажок не установлен, неактивные соратники используются как последний шанс"
L[ [=[If you %s, you will lose them
Click on %s to abort]=] ] = [=[Если Ваш %s слишком мал, вы можете потерять их
Щелкните %s для прерывания]=]
L["Ignore busy followers"] = "Игнорировать занятых соратников"
L["Ignore inactive followers"] = "Игнорировать неактивных соратников"
L["Keep cost low"] = "Дешевые миссии"
L["Keep extra bonus"] = "Дополнительная добыча"
L["Keep time short"] = "Короткие миссии"
L["Keep time VERY short"] = "Быстрые миссии"
--Translation missing 
L["Launch all ready missions"] = "Launch all ready missions"
L["Level"] = "Уровень"
L["Make Order Hall Mission Panel movable"] = "Сделать панель оплота класса передвигаемой"
L["Max champions"] = "Макс. защитников"
L["Maximize filled missions"] = "Максимизировать заполненые миссий"
L["Maximize xp gain"] = "Максимальный опыт"
L["Mission duration reduced"] = "Сокращена продолжительность миссии"
L["Missions"] = "Миссии"
L["No follower gained xp"] = "Соратник не получает опыт"
--Translation missing 
L["Not blacklisted"] = "Not blacklisted"
L["Not enough troops, raise maximum champions' number"] = "Недостаточное количество войск, максимальное число чемпионов"
L["Nothing to report"] = "Без отчета"
L["Notifies you when you have troops ready to be collected"] = "Уведомлять вас, когда имеются готовые войска, и готовы к сбору"
L["Only accept missions with time improved"] = "Принимать, только миссии с улучшенным временем"
--Translation missing 
L["Only consider Elite missions"] = "Only consider Elite missions"
L["Only use champions even if troops are available"] = "Использовать только защитников, даже если войска доступны"
L[ [=[OrderHallCommander overrides GarrisonCommander for Order Hall Management.
 You can revert to GarrisonCommander simply disabling OrderhallCommander.
If instead you like OrderHallCommander remember to add it to Curse client and keep it updated]=] ] = [=[OrderHallCommander переопределяет GarrisonCommander для управления заказами.
 Вы можете вернуться к GarrisonCommander, просто отключив OrderhallCommander.
Если вам нравится OrderHallCommander, не забудьте добавить его в Curse client и обновить его]=]
L["Original method"] = "Обычный метод"
L["Position is not saved on logout"] = "Положение не сохраняется при выходе"
--Translation missing 
L["Release notes"] = "Release notes"
--Translation missing 
L["Remove no champions warning"] = "Remove no champions warning"
L["Resurrect troops effect"] = "Эффект воскрешения войск"
L["Reward type"] = "Награда"
--Translation missing 
L["Right-Click to blacklist"] = "Right-Click to blacklist"
--Translation missing 
L["Right-Click to remove from blacklist"] = "Right-Click to remove from blacklist"
L["Show/hide OrderHallCommander mission menu"] = "Показать/скрыть меню миссий OrderHallCommander"
L["Sort missions by:"] = "Сортировать миссии по:"
L["Success Chance"] = "Шанс успеха"
L["Troop ready alert"] = "Оповещение о готовности войск"
--Translation missing 
L["Unable to fill missions, raise maximum champions' number"] = "Unable to fill missions, raise maximum champions' number"
L["Unable to fill missions. Check your switches"] = "Не удается заполнить миссии. Проверьте параметры"
--Translation missing 
L["Unlock all"] = "Unlock all"
--Translation missing 
L["Unlocks all follower at once"] = "Unlocks all follower at once"
L["Upgrading to |cff00ff00%d|r"] = "Обновление до |cff00ff00%d|r"
L["URL Copy"] = "Копировать ссылку"
L["Use at most this many champions"] = "На сколько много использовать защитников"
L["Use combat ally"] = "Боевой соратник"
L["When no free followers are available shows empty follower"] = "Если свободные соратники недоступны, отображается пустой соратник"
--Translation missing 
L["When we cant achieve the requested bonus chance, we try to reach at least this one"] = "When we cant achieve the requested bonus chance, we try to reach at least this one"
L["You are wasting |cffff0000%d|cffffd200 point(s)!!!"] = "Вы тратите |cffff0000%d|cffffd200 очков !!!"
L["You have no troops"] = "У вас нет войск"

return
end
L=l:NewLocale(me,"zhCN")
if (L) then
L["Always counter increased resource cost"] = "总是反制增加资源花费"
L["Always counter increased time"] = "总是反制增加任务时间"
L["Always counter kill troops (ignored if we can only use troops with just 1 durability left)"] = "总是反制杀死部队(如果我们用只剩一次耐久的部队则忽略)"
L["Always counter no bonus loot threat"] = "总是反制没有额外奖励的威胁"
--Translation missing 
L["Artifact shown value is the base value without considering knowledge multiplier"] = "Artifact shown value is the base value without considering knowledge multiplier"
--Translation missing 
L["Attempts to use less champions for missions, in order to fill more missions"] = "Attempts to use less champions for missions, in order to fill more missions"
--Translation missing 
L["Base Chance"] = "Base Chance"
L["Better parties available in next future"] = "在将来有更好的队伍"
--Translation missing 
L["Blacklisted"] = "Blacklisted"
--Translation missing 
L["Blacklisted missions are ignored in Mission Control"] = "Blacklisted missions are ignored in Mission Control"
--Translation missing 
L["Bonus Chance"] = "Bonus Chance"
L["Building Final report"] = "构建最终报告"
--Translation missing 
L["but using troops with just one durability left"] = "but using troops with just one durability left"
L["Capped %1$s. Spend at least %2$d of them"] = "%1$s封顶了。花费至少%2$d在它身上"
L["Changes the sort order of missions in Mission panel"] = "改变任务面板上的任务排列顺序"
L["Combat ally is proposed for missions so you can consider unassigning him"] = "战斗盟友被建议到任务，所以你可以考虑取消指派他"
L["Complete all missions without confirmation"] = "完成所有任务不须确认"
L["Configuration for mission party builder"] = "任务队伍构建设置"
--Translation missing 
L["Cost reduced"] = "Cost reduced"
--Translation missing 
L["Disables warning: "] = "Disables warning: "
L["Dont kill Troops"] = "别让部队被杀死"
--Translation missing 
L["Don't use troops"] = "Don't use troops"
L["Duration reduced"] = "持续时间已缩短"
L["Duration Time"] = "持续时间"
--Translation missing 
L["Empty missions sorted as last"] = "Empty missions sorted as last"
--Translation missing 
L["Empty or 0% success mission are sorted as last. Does not apply to \"original\" method"] = "Empty or 0% success mission are sorted as last. Does not apply to \"original\" method"
L["Expiration Time"] = "到期时间"
L["Favours leveling follower for xp missions"] = "倾向于使用升级中追隨者在经验值任务"
--Translation missing 
L["Followers status "] = "Followers status "
--Translation missing 
L["For better experience, lock your desired follower to get filled only the missions you want"] = "For better experience, lock your desired follower to get filled only the missions you want"
L["General"] = "一般"
L["Global approx. xp reward"] = "整体大约经验值奖励"
--Translation missing 
L["Global approx. xp reward per hour"] = "Global approx. xp reward per hour"
L["HallComander Quick Mission Completion"] = "大厅指挥官快速任务完成"
--Translation missing 
L["If bonus chance is lower than this, then we try to not overcap the mission."] = "If bonus chance is lower than this, then we try to not overcap the mission."
--Translation missing 
L["If not checked, inactive followers are used as last chance"] = "If not checked, inactive followers are used as last chance"
L[ [=[If you %s, you will lose them
Click on %s to abort]=] ] = [=[如果你继续，你会失去它们
点击%s來取消]=]
--Translation missing 
L["Ignore busy followers"] = "Ignore busy followers"
--Translation missing 
L["Ignore inactive followers"] = "Ignore inactive followers"
L["Keep cost low"] = "节省大厅资源"
L["Keep extra bonus"] = "优先额外奖励"
L["Keep time short"] = "减少任务时间"
L["Keep time VERY short"] = "最短任务时间"
--Translation missing 
L["Launch all ready missions"] = "Launch all ready missions"
L["Level"] = "等级"
L["Make Order Hall Mission Panel movable"] = "让大厅任务面板可移动"
--Translation missing 
L["Max champions"] = "Max champions"
--Translation missing 
L["Maximize filled missions"] = "Maximize filled missions"
L["Maximize xp gain"] = "最大化经验获取"
--Translation missing 
L["Mission duration reduced"] = "Mission duration reduced"
L["Missions"] = "任务"
L["No follower gained xp"] = "没有追随者获得经验"
--Translation missing 
L["Not blacklisted"] = "Not blacklisted"
--Translation missing 
L["Not enough troops, raise maximum champions' number"] = "Not enough troops, raise maximum champions' number"
L["Nothing to report"] = "没什么可报告"
L["Notifies you when you have troops ready to be collected"] = "当部队已准备好获取时提醒你"
L["Only accept missions with time improved"] = "只允许有时间改善的任务"
--Translation missing 
L["Only consider Elite missions"] = "Only consider Elite missions"
--Translation missing 
L["Only use champions even if troops are available"] = "Only use champions even if troops are available"
--Translation missing 
L[ [=[OrderHallCommander overrides GarrisonCommander for Order Hall Management.
 You can revert to GarrisonCommander simply disabling OrderhallCommander.
If instead you like OrderHallCommander remember to add it to Curse client and keep it updated]=] ] = [=[OrderHallCommander overrides GarrisonCommander for Order Hall Management.
 You can revert to GarrisonCommander simply disabling OrderhallCommander.
If instead you like OrderHallCommander remember to add it to Curse client and keep it updated]=]
L["Original method"] = "原始方法"
L["Position is not saved on logout"] = "位置不会在登出后储存"
--Translation missing 
L["Release notes"] = "Release notes"
--Translation missing 
L["Remove no champions warning"] = "Remove no champions warning"
L["Resurrect troops effect"] = "复活部队效果"
L["Reward type"] = "奖励类型"
--Translation missing 
L["Right-Click to blacklist"] = "Right-Click to blacklist"
--Translation missing 
L["Right-Click to remove from blacklist"] = "Right-Click to remove from blacklist"
L["Show/hide OrderHallCommander mission menu"] = "显示/隐藏大厅指挥官任务选单"
L["Sort missions by:"] = "排列任务根据："
L["Success Chance"] = "成功机率"
L["Troop ready alert"] = "部队装备提醒"
--Translation missing 
L["Unable to fill missions, raise maximum champions' number"] = "Unable to fill missions, raise maximum champions' number"
--Translation missing 
L["Unable to fill missions. Check your switches"] = "Unable to fill missions. Check your switches"
--Translation missing 
L["Unlock all"] = "Unlock all"
--Translation missing 
L["Unlocks all follower at once"] = "Unlocks all follower at once"
L["Upgrading to |cff00ff00%d|r"] = "升级到|cff00ff00%d|r"
--Translation missing 
L["URL Copy"] = "URL Copy"
--Translation missing 
L["Use at most this many champions"] = "Use at most this many champions"
L["Use combat ally"] = "使用战斗盟友"
--Translation missing 
L["When no free followers are available shows empty follower"] = "When no free followers are available shows empty follower"
--Translation missing 
L["When we cant achieve the requested bonus chance, we try to reach at least this one"] = "When we cant achieve the requested bonus chance, we try to reach at least this one"
L["You are wasting |cffff0000%d|cffffd200 point(s)!!!"] = "你浪费了|cffff0000%d|cffffd200 点数!!!"
--Translation missing 
L["You have no troops"] = "You have no troops"

return
end
L=l:NewLocale(me,"esES")
if (L) then
L["Always counter increased resource cost"] = "Siempre contrarreste el mayor costo de recursos"
L["Always counter increased time"] = "Siempre contrarreste el tiempo incrementado"
L["Always counter kill troops (ignored if we can only use troops with just 1 durability left)"] = "Siempre contrarrestar la muerte de tropas (ignorado si sólo podemos utilizar tropas con un solo punto de durabilidad)"
L["Always counter no bonus loot threat"] = "Siempre contrarresta la falta de bonificación de botín"
--Translation missing 
L["Artifact shown value is the base value without considering knowledge multiplier"] = "Artifact shown value is the base value without considering knowledge multiplier"
--Translation missing 
L["Attempts to use less champions for missions, in order to fill more missions"] = "Attempts to use less champions for missions, in order to fill more missions"
--Translation missing 
L["Base Chance"] = "Base Chance"
L["Better parties available in next future"] = "Mejores fiestas disponibles en el próximo futuro"
--Translation missing 
L["Blacklisted"] = "Blacklisted"
--Translation missing 
L["Blacklisted missions are ignored in Mission Control"] = "Blacklisted missions are ignored in Mission Control"
--Translation missing 
L["Bonus Chance"] = "Bonus Chance"
L["Building Final report"] = "Informe final del edificio"
--Translation missing 
L["but using troops with just one durability left"] = "but using troops with just one durability left"
L["Capped %1$s. Spend at least %2$d of them"] = "% 1 $ s cubierto. Gasta al menos% 2 $ d de ellos"
L["Changes the sort order of missions in Mission panel"] = "Cambia el orden de las misiones en el panel de la Misión"
--Translation missing 
L["Combat ally is proposed for missions so you can consider unassigning him"] = "Combat ally is proposed for missions so you can consider unassigning him"
L["Complete all missions without confirmation"] = "Completa todas las misiones sin confirmación"
L["Configuration for mission party builder"] = "Configuración para el constructor de la misión"
--Translation missing 
L["Cost reduced"] = "Cost reduced"
--Translation missing 
L["Disables warning: "] = "Disables warning: "
L["Dont kill Troops"] = "No matar a las tropas"
--Translation missing 
L["Don't use troops"] = "Don't use troops"
L["Duration reduced"] = "Duración reducida"
L["Duration Time"] = "Duración"
--Translation missing 
L["Empty missions sorted as last"] = "Empty missions sorted as last"
--Translation missing 
L["Empty or 0% success mission are sorted as last. Does not apply to \"original\" method"] = "Empty or 0% success mission are sorted as last. Does not apply to \"original\" method"
L["Expiration Time"] = "Tiempo de expiración"
L["Favours leveling follower for xp missions"] = "Favors nivelando seguidor para las misiones xp"
--Translation missing 
L["Followers status "] = "Followers status "
--Translation missing 
L["For better experience, lock your desired follower to get filled only the missions you want"] = "For better experience, lock your desired follower to get filled only the missions you want"
L["General"] = true
L["Global approx. xp reward"] = "Global aprox. Recompensa xp"
--Translation missing 
L["Global approx. xp reward per hour"] = "Global approx. xp reward per hour"
L["HallComander Quick Mission Completion"] = "Conclusión de la misión rápida de HallComander"
--Translation missing 
L["If bonus chance is lower than this, then we try to not overcap the mission."] = "If bonus chance is lower than this, then we try to not overcap the mission."
--Translation missing 
L["If not checked, inactive followers are used as last chance"] = "If not checked, inactive followers are used as last chance"
--Translation missing 
L[ [=[If you %s, you will lose them
Click on %s to abort]=] ] = [=[If you %s, you will lose them
Click on %s to abort]=]
--Translation missing 
L["Ignore busy followers"] = "Ignore busy followers"
--Translation missing 
L["Ignore inactive followers"] = "Ignore inactive followers"
L["Keep cost low"] = "Mantenga el costo bajo"
L["Keep extra bonus"] = "Mantener bonificación extra"
L["Keep time short"] = "Mantenga el tiempo corto"
L["Keep time VERY short"] = "Mantener el tiempo muy corto"
--Translation missing 
L["Launch all ready missions"] = "Launch all ready missions"
L["Level"] = "Nivel"
L["Make Order Hall Mission Panel movable"] = "Hacer pedido Hall Misión Panel móvil"
--Translation missing 
L["Max champions"] = "Max champions"
--Translation missing 
L["Maximize filled missions"] = "Maximize filled missions"
L["Maximize xp gain"] = "Maximizar la ganancia de xp"
--Translation missing 
L["Mission duration reduced"] = "Mission duration reduced"
L["Missions"] = "Misiones"
L["No follower gained xp"] = "Ningún seguidor ganó xp"
--Translation missing 
L["Not blacklisted"] = "Not blacklisted"
--Translation missing 
L["Not enough troops, raise maximum champions' number"] = "Not enough troops, raise maximum champions' number"
L["Nothing to report"] = "Nada que reportar"
L["Notifies you when you have troops ready to be collected"] = "Notifica cuando hay tropas listas para ser recolectadas"
L["Only accept missions with time improved"] = "Sólo aceptar misiones mejoradas con el tiempo"
--Translation missing 
L["Only consider Elite missions"] = "Only consider Elite missions"
--Translation missing 
L["Only use champions even if troops are available"] = "Only use champions even if troops are available"
--Translation missing 
L[ [=[OrderHallCommander overrides GarrisonCommander for Order Hall Management.
 You can revert to GarrisonCommander simply disabling OrderhallCommander.
If instead you like OrderHallCommander remember to add it to Curse client and keep it updated]=] ] = [=[OrderHallCommander overrides GarrisonCommander for Order Hall Management.
 You can revert to GarrisonCommander simply disabling OrderhallCommander.
If instead you like OrderHallCommander remember to add it to Curse client and keep it updated]=]
L["Original method"] = "Método original"
L["Position is not saved on logout"] = "La posición no se guarda al cerrar la sesión"
--Translation missing 
L["Release notes"] = "Release notes"
--Translation missing 
L["Remove no champions warning"] = "Remove no champions warning"
L["Resurrect troops effect"] = "Efecto de las tropas de resurrección"
L["Reward type"] = "Tipo de recompensa"
--Translation missing 
L["Right-Click to blacklist"] = "Right-Click to blacklist"
--Translation missing 
L["Right-Click to remove from blacklist"] = "Right-Click to remove from blacklist"
L["Show/hide OrderHallCommander mission menu"] = "Mostrar / ocultar el menú de la misión OrderHallCommander"
L["Sort missions by:"] = "Ordenar misiones por:"
L["Success Chance"] = "Éxito"
L["Troop ready alert"] = "Alerta lista de tropas"
--Translation missing 
L["Unable to fill missions, raise maximum champions' number"] = "Unable to fill missions, raise maximum champions' number"
--Translation missing 
L["Unable to fill missions. Check your switches"] = "Unable to fill missions. Check your switches"
--Translation missing 
L["Unlock all"] = "Unlock all"
--Translation missing 
L["Unlocks all follower at once"] = "Unlocks all follower at once"
L["Upgrading to |cff00ff00%d|r"] = "Actualizando a | cff00ff00% d | r"
--Translation missing 
L["URL Copy"] = "URL Copy"
--Translation missing 
L["Use at most this many champions"] = "Use at most this many champions"
L["Use combat ally"] = "Usar aliado de combate"
--Translation missing 
L["When no free followers are available shows empty follower"] = "When no free followers are available shows empty follower"
--Translation missing 
L["When we cant achieve the requested bonus chance, we try to reach at least this one"] = "When we cant achieve the requested bonus chance, we try to reach at least this one"
L["You are wasting |cffff0000%d|cffffd200 point(s)!!!"] = "Está perdiendo | cffff0000% d | cffffd200 punto (s)!"
--Translation missing 
L["You have no troops"] = "You have no troops"

return
end
L=l:NewLocale(me,"zhTW")
if (L) then
L["Always counter increased resource cost"] = "總是反制增加資源花費"
L["Always counter increased time"] = "總是反制增加任務時間"
L["Always counter kill troops (ignored if we can only use troops with just 1 durability left)"] = "總是反制殺死部隊(如果我們用只剩一次耐久的部隊則忽略)"
L["Always counter no bonus loot threat"] = "總是反制沒有額外獎勵的威脅"
L["Artifact shown value is the base value without considering knowledge multiplier"] = "神兵顯示的值是基礎值，沒有經過神兵知識的加成。"
L["Attempts to use less champions for missions, in order to fill more missions"] = "嘗試使用較少的勇士來出任務，以便能夠派出更多任務。"
L["Base Chance"] = "基礎機率"
L["Better parties available in next future"] = "在將來有更好的隊伍"
L["Blacklisted"] = "列入黑名單"
L["Blacklisted missions are ignored in Mission Control"] = "列入黑名單的任務會在任務面板忽略"
L["Bonus Chance"] = "額外獎勵機率"
L["Building Final report"] = "構建最終報告"
L["but using troops with just one durability left"] = "但使用只有一個耐久度的部隊"
L["Capped %1$s. Spend at least %2$d of them"] = "%1$s封頂了。花費至少%2$d在它身上"
L["Changes the sort order of missions in Mission panel"] = "改變任務面板上的任務排列順序"
L["Combat ally is proposed for missions so you can consider unassigning him"] = "戰鬥盟友被建議到任務，所以你可以考慮取消指派他"
L["Complete all missions without confirmation"] = "完成所有任務不須確認"
L["Configuration for mission party builder"] = "任務隊伍構建設置"
L["Cost reduced"] = "花費已降低"
L["Disables warning: "] = "停用警告："
L["Dont kill Troops"] = "別讓部隊被殺死"
L["Don't use troops"] = "不要使用部隊"
L["Duration reduced"] = "持續時間已縮短"
L["Duration Time"] = "持續時間"
L["Empty missions sorted as last"] = "空的任務排在最後"
L["Empty or 0% success mission are sorted as last. Does not apply to \"original\" method"] = "空或0%成功率的任務排列在最後，對於\"原始\"方式排序無效。"
L["Expiration Time"] = "到期時間"
L["Favours leveling follower for xp missions"] = "傾向於使用升級中追隨者在經驗值任務"
L["Followers status "] = "追隨者狀態"
L["For better experience, lock your desired follower to get filled only the missions you want"] = "為了獲得更佳經驗，你期望的追隨者只鎖定派發到你想要的任務"
L["General"] = "(G) 一般"
L["Global approx. xp reward"] = "整體大約經驗值獎勵"
L["Global approx. xp reward per hour"] = "每小時獲得整體經驗值獎勵"
L["HallComander Quick Mission Completion"] = "大廳指揮官快速任務完成"
L["If bonus chance is lower than this, then we try to not overcap the mission."] = "如果額外獎勵機率低於此，那將盡量不要派發任務。"
L["If not checked, inactive followers are used as last chance"] = "不勾選時，閒置的追隨者會成為最後的考量。"
L[ [=[If you %s, you will lose them
Click on %s to abort]=] ] = [=[如果您繼續，您會失去它們
點擊%s來取消]=]
L["Ignore busy followers"] = "忽略任務中的追隨者"
L["Ignore inactive followers"] = "忽略閒置的追隨者"
L["Keep cost low"] = "保持低花費"
L["Keep extra bonus"] = "保持額外獎勵"
L["Keep time short"] = "保持短時間"
L["Keep time VERY short"] = "保持非常短的時間"
L["Launch all ready missions"] = "啟動所有準備好的任務"
L["Level"] = "等級"
L["Make Order Hall Mission Panel movable"] = "讓大廳任務面板可移動"
L["Max champions"] = "最多勇士"
L["Maximize filled missions"] = "盡可能分派較多的任務"
L["Maximize xp gain"] = "最大化經驗獲取"
L["Mission duration reduced"] = "任務時間已縮短"
L["Missions"] = "(M) 任務"
L["No follower gained xp"] = "沒有追隨者獲得經驗"
L["Not blacklisted"] = "未列入黑名單"
L["Not enough troops, raise maximum champions' number"] = "部隊不足，增加勇士的數量上限。"
L["Nothing to report"] = "沒什麼可報告"
L["Notifies you when you have troops ready to be collected"] = "當部隊已準備好獲取時提醒你"
L["Only accept missions with time improved"] = "只允許有時間改善的任務"
L["Only consider Elite missions"] = "只考慮精英任務"
L["Only use champions even if troops are available"] = "有可用的部隊時，仍然只要使用勇士。"
L[ [=[OrderHallCommander overrides GarrisonCommander for Order Hall Management.
 You can revert to GarrisonCommander simply disabling OrderhallCommander.
If instead you like OrderHallCommander remember to add it to Curse client and keep it updated]=] ] = [=[職業大廳指揮官已經取代要塞指揮官來管理職業大廳。
要返回使用要塞指揮官，只要停用職業大廳指揮官插件就可以了。]=]
L["Original method"] = "原始方式"
L["Position is not saved on logout"] = "位置不會在登出後儲存"
L["Release notes"] = "更新說明"
L["Remove no champions warning"] = "移除沒有勇士警告"
L["Resurrect troops effect"] = "復活部隊效果"
L["Reward type"] = "獎勵類型"
L["Right-Click to blacklist"] = "右鍵點擊加入黑名單"
L["Right-Click to remove from blacklist"] = "右鍵點擊從黑名單移除"
L["Show/hide OrderHallCommander mission menu"] = "顯示/隱藏大廳指揮官任務選單"
L["Sort missions by:"] = "排列任務根據："
L["Success Chance"] = "成功機率"
L["Troop ready alert"] = "部隊整備提醒"
L["Unable to fill missions, raise maximum champions' number"] = "無法分派任務，提升最大追隨者數量"
L["Unable to fill missions. Check your switches"] = "無法分派任務，請檢查你的設定選項。"
L["Unlock all"] = "全部解除鎖定"
L["Unlocks all follower at once"] = "一次解鎖所有追隨者"
L["Upgrading to |cff00ff00%d|r"] = "升級到|cff00ff00%d|r"
L["URL Copy"] = "複製網址"
L["Use at most this many champions"] = "至少使用這個數量的勇士"
L["Use combat ally"] = "使用戰鬥盟友"
L["When no free followers are available shows empty follower"] = "沒有可用的追隨者時，顯示空欄位。"
L["When we cant achieve the requested bonus chance, we try to reach at least this one"] = "當無法達到要求的額外獎勵機率時，嘗試至少達到100成功率"
L["You are wasting |cffff0000%d|cffffd200 point(s)!!!"] = "你浪費了|cffff0000%d|cffffd200 點數!!!"
L["You have no troops"] = "你沒有部隊"

return
end
