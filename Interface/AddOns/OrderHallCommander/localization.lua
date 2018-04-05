local me,ns=...
local lang=GetLocale()
local l=LibStub("AceLocale-3.0")
local L=l:NewLocale(me,"enUS",true,true)
L["%1$d%% lower than %2$d%%. Lower %s"] = true
L["%s for a wowhead link popup"] = true
L["%s start the mission without even opening the mission page. No question asked"] = true
L["%s starts missions"] = true
L["%s to actually start mission"] = true
L["%s to blacklist"] = true
L["%s to remove from blacklist"] = true
L[ [=[%s, please review the tutorial
(Click the icon to dismiss this message and start the tutorial)]=] ] = true
L["%s, please review the tutorial\\n(Click the icon to dismiss this message)"] = true
L["Allow to start a mission directly from the mission list page (no single mission page shown)"] = true
L["Always counter increased resource cost"] = true
L["Always counter increased time"] = true
L["Always counter kill troops (ignored if we can only use troops with just 1 durability left)"] = true
L["Always counter no bonus loot threat"] = true
L["Artifact shown value is the base value without considering knowledge multiplier"] = true
L["Attempting %s"] = true
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
L["Could not fulfill mission, aborting"] = true
L["Counter kill Troops"] = true
L["Customization options (non mission related)"] = true
L["Disables warning: "] = true
L["Dont use this slot"] = true
L["Don't use troops"] = true
L["Duration reduced"] = true
L["Duration Time"] = true
L["Elite: Prefer overcap"] = true
L["Elites mission mode"] = true
L["Empty missions sorted as last"] = true
L["Empty or 0% success mission are sorted as last. Does not apply to \"original\" method"] = true
L["Equipped by following champions:"] = true
L["Expiration Time"] = true
L["Favours leveling follower for xp missions"] = true
L["For elite missions, tries hard to not go under 100% even at cost of overcapping"] = true
L["General"] = true
L["Global approx. xp reward"] = true
L["Global approx. xp reward per hour"] = true
L["HallComander Quick Mission Completion"] = true
L["If %1$s is lower than this, then we try to achieve at least %2$s without going over 100%%. Ignored for elite missions."] = true
L["If not checked, inactive followers are used as last chance"] = true
L[ [=[If you %s, you will lose them
Click on %s to abort]=] ] = true
L["Ignore busy followers"] = true
L["Ignore inactive followers"] = true
L["Keep cost low"] = true
L["Keep extra bonus"] = true
L["Keep time short"] = true
L["Keep time VERY short"] = true
L[ [=[Launch the first filled mission with at least one locked follower.
Keep %s pressed to actually launch, a simple click will only print mission name with its followers list]=] ] = true
L[ [=[Launch the first filled mission with at least one locked follower.
Keep SHIFT pressed to actually launch, a simple click will only print mission name with its followers list]=] ] = true
L["Level"] = true
L["Lock all"] = true
L["Lock this follower"] = true
L["Locked follower are only used in this mission"] = true
L["Make Order Hall Mission Panel movable"] = true
L["Makes sure that no troops will be killed"] = true
L["Max champions"] = true
L["Maximize xp gain"] = true
L["Mission duration reduced"] = true
L["Mission was capped due to total chance less than"] = true
L["Missions"] = true
L["Never kill Troops"] = true
L["No follower gained xp"] = true
L["No suitable missions. Have you reserved at least one follower?"] = true
L["Not blacklisted"] = true
L["Nothing to report"] = true
L["Notifies you when you have troops ready to be collected"] = true
L["Only accept missions with time improved"] = true
L["Only consider elite missions"] = true
L["Only need %s instead of %s to start a mission from mission list"] = true
L["Only use champions even if troops are available"] = true
L["Open configuration"] = true
L[ [=[OrderHallCommander overrides GarrisonCommander for Order Hall Management.
 You can revert to GarrisonCommander simply disabling OrderhallCommander.
If instead you like OrderHallCommander remember to add it to Curse client and keep it updated]=] ] = true
L["Original method"] = true
L["Position is not saved on logout"] = true
L["Prefer high durability"] = true
L["Quick start first mission"] = true
L["Remove no champions warning"] = true
L["Restart tutorial from beginning"] = true
L["Resume tutorial"] = true
L["Resurrect troops effect"] = true
L["Reward type"] = true
L["Sets all switches to a very permissive setup. Very similar to 1.4.4"] = true
L["Show tutorial"] = true
L["Show/hide OrderHallCommander mission menu"] = true
L["Sort missions by:"] = true
L["Started with "] = true
L["Success Chance"] = true
L["Troop ready alert"] = true
L["Unable to fill missions, raise \"%s\""] = true
L["Unable to fill missions. Check your switches"] = true
L["Unable to start mission, aborting"] = true
L["Unlock all"] = true
L["Unlock this follower"] = true
L["Unlocks all follower and slots at once"] = true
L["Unsafe mission start"] = true
L["Upgrading to |cff00ff00%d|r"] = true
L["URL Copy"] = true
L["Use at most this many champions"] = true
L["Use combat ally"] = true
L["Use this slot"] = true
L["Uses troops with the highest durability instead of the ones with the lowest"] = true
L["When no free followers are available shows empty follower"] = true
L["When we cant achieve the requested %1$s, we try to reach at least this one without (if possible) going over 100%%"] = true
L["Would start with "] = true
L["You are wasting |cffff0000%d|cffffd200 point(s)!!!"] = true
L[ [=[You need to close and restart World of Warcraft in order to update this version of OrderHallCommander.
Simply reloading UI is not enough]=] ] = true
L["You now need to press both %s and %s to start mission"] = true

-- Tutorial
L[ [=[%1$s and %2$s switches work together to customize how you want your mission filled

The value you set for %1$s (right now %3$s%%) is the minimum acceptable chance for attempting to achieve bonus while the value to set for %2$s (right now %4$s%%) is the chance you want achieve when you are forfaiting bonus (due to not enough powerful followers)]=] ] = true
L[ [=[A requested window is not open
Tutorial will resume as soon as possible]=] ] = true
L[ [=[Clicking a party button will assign its followers to the current mission.
Use it to verify OHC calculated chance with Blizzard one.
If they differs please take a screenshot and open a ticket :).]=] ] = true
L[ [=[Equipment and upgrades are listed here as clickable buttons.
Due to an issue with Blizzard Taint system, drag and drop from bags raise an error.
if you drag and drop an item from a bag, you receive an error.
In order to assign equipments which are not listed (I update the list often but sometimes Blizzard is faster), you can right click the item in the bag and the left click the follower.
This way you dont receive any error]=] ] = true
L[ [=[Equipment and upgrades are listed here as clickable buttons.
Due to an issue with Blizzard Taint system, if you drag and drop an item from a bag, you receive an error.
In order to assign equipment which are not listed (I updated the list often but sometimes Blizzard is faster), you can right click the item in the bag and the left click the follower.
This way you dont receive any error]=] ] = true
L[ [=[For example, let's say a mission can reach 95%%, 130%% and 180%% success chance.
If %1$s is set to 170%%, the 180%% one will be choosen.
If %1$s is set to 200%% OHC will try to find the nearest to 100%% respecting %2$s setting
If for example %2$s is set to 100%%, then the 130%% one will be choosen, but if %2$s is set to 90%% then the 95%% one will be choosen]=] ] = true
L["If instead you just want to always see the best available mission just set %1$s to 100%% and %2$s to 0%%"] = true
L[ [=[If you dont understand why OHC choosed a setup for a mission, you can request a full analysis.
Analyze party will show all the possible combinations and how OHC evaluated them]=] ] = true
L["Prefer high durability"] = true
L["Restart the tutorial"] = true
L[ [=[Slots (non the follower in it but just the slot) can be banned.
When you ban a slot, that slot will not be filled for that mission.
Exploiting the fact that troops are always in the leftmost slot(s) you can achieve a nice degree of custom tailoring, reducing the overall number of followers used for a mission]=] ] = true
L["Terminate the tutorial. You can resume it anytime clicking on the info icon in the side menu"] = true
L["Thank you for reading this, enjoy %s"] = true
L["There are %d tutorial step you didnt read"] = true
L[ [=[Usually OrderHallCOmmander tries to use troops with the lowest durability in order to let you enque new troops request as soon as possible.
Checking %1$s reverse it and OrderHallCOmmander will choose for each mission troops with the highest possible durability]=] ] = true
L[ [=[Welcome to a new release of OrderHallCommander
Please follow this short tutorial to discover all new functionalities.
You will not regret it]=] ] = true
L[ [=[With %1$s you ask to always counter the Hazard kill troop.
This means that OHC will try to counter it OR use a troop with just one durability left.
The target for this switch is to avoid wasting durability point, NOT to avoid troops' death.]=] ] = true
L[ [=[With %2$s you ask to never let a troop die.
This not only implies %1$s and %3$s, but force OHC to never send to mission a troop which will die.
The target for this switch is to totally avoid killing troops, even it for this we cant fill the party]=] ] = true
L[ [=[You can blacklist missions right clicking mission button.
Since 1.5.1 you can start a mission witout passing from mission page shift-clicking the mission button.
Be sure you liked the party because no confirmation is asked]=] ] = true
L["You can choose not to use a troop type clicking its icon"] = true
L[ [=[You can choose to limit how much champions are sent together.
Right now OHC is not using more than %3$s champions in the same mission-

Note that %2$s overrides it.]=] ] = true

L=l:NewLocale(me,"ptBR")
if (L) then
L["%1$d%% lower than %2$d%%. Lower %s"] = "%1$d%% mais baixo que %2$d%%. Mais Baixo %s"
L["%s for a wowhead link popup"] = "%s para o pop-up de link do wowhead"
L["%s start the mission without even opening the mission page. No question asked"] = "%s iniciar a missão sem sequer abrir a página da missão. Nenhuma pergunta foi feita."
L["%s starts missions"] = "%s inicia missões."
L["%s to actually start mission"] = "%s para realmente iniciar a missão"
L["%s to blacklist"] = "%s para a lista negra"
L["%s to remove from blacklist"] = "%s para remover da lista negra"
L[ [=[%s, please review the tutorial
(Click the icon to dismiss this message and start the tutorial)]=] ] = [=[%s, Por Favor, reveja o tutorial
(Clique no ícone para descartar esta mensagem e iniciar o tutorial)]=]
L["%s, please review the tutorial\\n(Click the icon to dismiss this message)"] = "%s, Por Favor reveja o tutorial\\n(Clique no ícone para descartar esta mensagem)"
L["Allow to start a mission directly from the mission list page (no single mission page shown)"] = "Permitir iniciar uma missão diretamente da página da lista de missão (nenhuma página de missão única mostrada)"
L["Always counter increased resource cost"] = "Sempre contornar o aumento do custo dos recursos"
L["Always counter increased time"] = "Sempre contornar o aumento do tempo"
L["Always counter kill troops (ignored if we can only use troops with just 1 durability left)"] = "Sempre evitar matança de tropas (ignorado se só pudermos usar tropas com apenas 1 de durabilidade)"
L["Always counter no bonus loot threat"] = "Sempre contornar ameaça sem bônus de saque"
L["Artifact shown value is the base value without considering knowledge multiplier"] = "O valor mostrado do artefato é o valor base sem considerar o multiplicador de conhecimento"
L["Attempting %s"] = "Tentativa %s"
L["Base Chance"] = "Chance Base"
L["Better parties available in next future"] = "Melhores festas disponíveis no futuro próximo."
L["Blacklisted"] = "Na Lista Negra"
L["Blacklisted missions are ignored in Mission Control"] = "As missões da lista negra são ignoradas no controle de missão"
L["Bonus Chance"] = "Chance de Bônus"
L["Building Final report"] = "Relatório final do edifício"
L["but using troops with just one durability left"] = "mas usando tropas com apenas 1 de durabilidade"
L["Capped %1$s. Spend at least %2$d of them"] = "Lotado de %1$s. Gaste pelo menos %2$d deles."
L["Changes the sort order of missions in Mission panel"] = "Altera a ordem de classificação das missões no painel da Missão"
L["Combat ally is proposed for missions so you can consider unassigning him"] = "O aliado de combate é proposto para missões, então você pode considerar desatribui-lo."
L["Complete all missions without confirmation"] = "Complete todas as missões sem confirmação"
L["Configuration for mission party builder"] = "Configuração para missão do construtor de facção"
L["Cost reduced"] = "Custo reduzido"
L["Could not fulfill mission, aborting"] = "Não foi possível cumprir a missão, abortar"
L["Counter kill Troops"] = "Contornar morte das tropas"
L["Customization options (non mission related)"] = "Opções de personalização (não relacionadas à missão)"
L["Disables warning: "] = "Desativar o aviso:"
L["Dont use this slot"] = "Não use este espaço."
L["Don't use troops"] = "Não use tropas"
L["Duration reduced"] = "Duração reduzida"
L["Duration Time"] = "Tempo de duração"
L["Elite: Prefer overcap"] = "Elite: Prefira sobrecapacidade"
L["Elites mission mode"] = "Modo de missão Elites"
L["Empty missions sorted as last"] = "Missões vazias classificadas como últimas"
L["Empty or 0% success mission are sorted as last. Does not apply to \"original\" method"] = "A missão vazio ou 0% de sucesso está classificada como a última. Não se aplica ao método \"original\""
L["Equipped by following champions:"] = "Equipado pelos seguintes campeões:"
L["Expiration Time"] = "Data de validade"
L["Favours leveling follower for xp missions"] = "Favorecer seguindo upando em missões de XP"
L["For elite missions, tries hard to not go under 100% even at cost of overcapping"] = "Para missões de elite, tentar não ultrapassar 100% mesmo ao custo da sobrecapacidade"
L["General"] = "Geral"
L["Global approx. xp reward"] = "Recompensa Global Aproximada de XP"
L["Global approx. xp reward per hour"] = "Recompensa Global Aproximada de XP por Hora"
L["HallComander Quick Mission Completion"] = "Conclusão Rápida da Missão HallComander"
L["If %1$s is lower than this, then we try to achieve at least %2$s without going over 100%%. Ignored for elite missions."] = "Se %1$s for menor do que isso, então tentaremos alcançar pelo menos %2$s sem ultrapassar 100%%. Ignorado para missões de elite."
L["If not checked, inactive followers are used as last chance"] = "Se não for Marcado, os seguidores inativos são usados como última chance"
L[ [=[If you %s, you will lose them
Click on %s to abort]=] ] = [=[Se você for %s, você vai perder
Clique em %s para abortar]=]
L["Ignore busy followers"] = "Ignore os seguidores ocupados"
L["Ignore inactive followers"] = "Ignore os seguidores inactivos"
L["Keep cost low"] = "Mantenha o custo baixo"
L["Keep extra bonus"] = "Mantenha o bônus extra"
L["Keep time short"] = "Mantenha o tempo curto"
L["Keep time VERY short"] = "Mantenha o tempo MUITO curto"
L[ [=[Launch the first filled mission with at least one locked follower.
Keep %s pressed to actually launch, a simple click will only print mission name with its followers list]=] ] = [=[Inicie a primeira missão preenchida com pelo menos um seguidor bloqueado.
Mantenha %s pressionado para realmente iniciar, um simples clique apenas imprimirá o nome da missão com sua lista de seguidores]=]
L[ [=[Launch the first filled mission with at least one locked follower.
Keep SHIFT pressed to actually launch, a simple click will only print mission name with its followers list]=] ] = [=[Inicie a primeira missão preenchida com pelo menos um seguidor bloqueado.
Mantenha SHIFT pressionado para realmente iniciar, um simples clique apenas imprimirá o nome da missão com sua lista de seguidores]=]
L["Level"] = "Nível"
L["Lock all"] = "Bloquear tudo"
L["Lock this follower"] = "Bloqueie esse seguidor"
L["Locked follower are only used in this mission"] = "O seguidor bloqueado só é usado nesta missão"
L["Make Order Hall Mission Panel movable"] = "Faça o Painel da Missão do Salão móvel"
L["Makes sure that no troops will be killed"] = "Certifique-se de que as tropas não serão mortas"
L["Max champions"] = "Campeões máximos"
L["Maximize xp gain"] = "Maximize o ganho de xp"
L["Mission duration reduced"] = "Duração da missão reduzida"
L["Mission was capped due to total chance less than"] = "A missão foi limitada devido a chance total de menos de"
L["Missions"] = "Missões"
L["Never kill Troops"] = "Nunca mate tropas"
L["No follower gained xp"] = "Nenhum seguidor ganhou xp"
L["No suitable missions. Have you reserved at least one follower?"] = "Nenhuma missão adequada. Você reservou pelo menos um seguidor?"
L["Not blacklisted"] = "Não listado na lista negra"
L["Nothing to report"] = "Nada a declarar"
L["Notifies you when you have troops ready to be collected"] = "Notifica você quando você tem tropas prontas para serem coletadas"
L["Only accept missions with time improved"] = "Aceitar apenas missões com o tempo melhorado"
L["Only consider elite missions"] = "Apenas considere missões de elite"
L["Only need %s instead of %s to start a mission from mission list"] = "Só precisa %s em vez de %s para iniciar uma missão da lista de missões."
L["Only use champions even if troops are available"] = "Use apenas campeões, mesmo que as tropas estejam disponíveis"
L["Open configuration"] = "Abrir configuração"
L[ [=[OrderHallCommander overrides GarrisonCommander for Order Hall Management.
 You can revert to GarrisonCommander simply disabling OrderhallCommander.
If instead you like OrderHallCommander remember to add it to Curse client and keep it updated]=] ] = [=[OrderHallCommander substitui GarrisonCommander pela Order Hall Management.
Você pode reverter para GarrisonCommander simplesmente desabilitando o  OrderhallCommander.
Se ao invés disso você gostar de OrderHallCommander, lembre-se de adicioná-lo ao cliente Curse e mantê-lo atualizado]=]
L["Original method"] = "Método original"
L["Position is not saved on logout"] = "A posição não é salva no logout"
L["Prefer high durability"] = "Preferir alta durabilidade"
L["Quick start first mission"] = "Primeira missão de início rápido"
L["Remove no champions warning"] = "Não remova nenhum aviso de campeão"
L["Restart tutorial from beginning"] = "Reinicie o tutorial desde o início"
L["Resume tutorial"] = "Retomar tutorial"
L["Resurrect troops effect"] = "Ressuscitar o efeito das tropas"
L["Reward type"] = "Tipo de recompensa"
L["Sets all switches to a very permissive setup. Very similar to 1.4.4"] = "Define todos os switches para uma configuração muito permissiva. Muito parecido com 1.4.4"
L["Show tutorial"] = "Mostrar tutorial"
L["Show/hide OrderHallCommander mission menu"] = "Mostrar / ocultar o menu da missão OrderHallCommander"
L["Sort missions by:"] = "Classifique missões por:"
L["Started with "] = "Começou com"
L["Success Chance"] = "Chance de sucesso"
L["Troop ready alert"] = "Alerta de tropas"
L["Unable to fill missions, raise \"%s\""] = "Não é possível preencher missões, aumentar \"%s\""
L["Unable to fill missions. Check your switches"] = "Incapaz de preencher missões. Verifique os seus switches"
L["Unable to start mission, aborting"] = "Não foi possível iniciar a missão, abortar"
L["Unlock all"] = "Desbloquear tudo"
L["Unlock this follower"] = "Desbloqueie esse seguidor"
L["Unlocks all follower and slots at once"] = "Desbloqueia todos os seguidores e slots ao mesmo tempo"
L["Unsafe mission start"] = "Começar missão insegura"
L["Upgrading to |cff00ff00%d|r"] = "Atualizando para | cff00ff00% d | r"
L["URL Copy"] = "Copia de URL"
L["Use at most this many champions"] = "Use ao máximo esses muitos campeões"
L["Use combat ally"] = "Use aliado de combate"
L["Use this slot"] = "Use este slot"
L["Uses troops with the highest durability instead of the ones with the lowest"] = "Usa tropas com maior durabilidade em vez das mais baixas"
L["When no free followers are available shows empty follower"] = "Quando nenhum seguidor gratuito está disponível, mostra o seguidor vazio"
L["When we cant achieve the requested %1$s, we try to reach at least this one without (if possible) going over 100%%"] = "Quando não podemos alcançar o %1$s solicitado, tentamos alcançar pelo menos esse (se possível) passar de 100%"
L["Would start with "] = "Começaria com"
L["You are wasting |cffff0000%d|cffffd200 point(s)!!!"] = "Você está desperdiçando | cffff0000% d | cffffd200 ponto(s) !!!"
L[ [=[You need to close and restart World of Warcraft in order to update this version of OrderHallCommander.
Simply reloading UI is not enough]=] ] = [=[Você precisa fechar e reiniciar o World of Warcraft para atualizar esta versão do OrderHallCommander.
Recarregar UI não é suficiente]=]
L["You now need to press both %s and %s to start mission"] = "Agora você precisa pressionar %s e %s para iniciar a missão"

-- Tutorial
L[ [=[%1$s and %2$s switches work together to customize how you want your mission filled

The value you set for %1$s (right now %3$s%%) is the minimum acceptable chance for attempting to achieve bonus while the value to set for %2$s (right now %4$s%%) is the chance you want achieve when you are forfaiting bonus (due to not enough powerful followers)]=] ] = [=[%1$s e %2$s trabalham em conjunto para personalizar a forma como deseja que a sua missão seja preenchida.

O valor que você definiu para %1$s (agora %3$s%%) é a chance mínima aceitável para tentar obter bônus.
Enquanto o valor a ser definido para %2$s (agora $4$s%%) é a chance que você deseja alcançar quando você esta sem bônus (devido a você não ter seguidores poderosos suficientes)]=]
L[ [=[A requested window is not open
Tutorial will resume as soon as possible]=] ] = [=[Uma janela solicitada não está aberta
O tutorial retomará o mais rápido possível]=]
L[ [=[Clicking a party button will assign its followers to the current mission.
Use it to verify OHC calculated chance with Blizzard one.
If they differs please take a screenshot and open a ticket :).]=] ] = [=[Ao clicar no botão festa, os seus seguidores atribuirão a missão atual.
Use-o para verificar a chance calculada da OHC com a Blizzard.
Se eles diferirem, pegue uma captura de tela e abra um ticket :).]=]
L[ [=[Equipment and upgrades are listed here as clickable buttons.
Due to an issue with Blizzard Taint system, drag and drop from bags raise an error.
if you drag and drop an item from a bag, you receive an error.
In order to assign equipments which are not listed (I update the list often but sometimes Blizzard is faster), you can right click the item in the bag and the left click the follower.
This way you dont receive any error]=] ] = [=[Os equipamento e as Melhorias estão listadas aqui como botões clicáveis.
Devido a um problema com o sistema de arrastar e soltar da Blizzardt.
Se você arrastar e soltar um item de uma bolsa, você receberá um erro.
Para atribuir equipamentos que não estão listados (atualizo a lista com freqüência, mas às vezes o Blizzard é mais rápida), você pode clicar com o botão direito do mouse no item na bolsa e clicar no seguidor em seguida. Desta forma, você não recebe nenhum erro]=]
L[ [=[Equipment and upgrades are listed here as clickable buttons.
Due to an issue with Blizzard Taint system, if you drag and drop an item from a bag, you receive an error.
In order to assign equipment which are not listed (I updated the list often but sometimes Blizzard is faster), you can right click the item in the bag and the left click the follower.
This way you dont receive any error]=] ] = [=[O equipamento e as melhorias estão listadas aqui como botões clicáveis.
Devido a um problema com o sistema Blizzard Taint, se você arrastar e soltar um item de uma bolsa, você receberá um erro.
Para atribuir equipamentos que não estão listados (eu atualizei a lista com frequência, mas às vezes o Blizzard é mais rápido), você pode clicar com o botão direito do mouse no item na bolsa e clicar no seguidor.
Desta forma, você não receberá nenhum erro.]=]
L[ [=[For example, let's say a mission can reach 95%%, 130%% and 180%% success chance.
If %1$s is set to 170%%, the 180%% one will be choosen.
If %1$s is set to 200%% OHC will try to find the nearest to 100%% respecting %2$s setting
If for example %2$s is set to 100%%, then the 130%% one will be choosen, but if %2$s is set to 90%% then the 95%% one will be choosen]=] ] = [=[Por exemplo, digamos que uma missão pode atingir chances de sucesso de 95%%, 130%% e 180%%.
Se %1$s estiver definido para 170%%, o 180%% será escolhido.
Se %1$s estiver configurado para 200%%, o OHC tentará encontrar a configuração mais próxima de 100%% respeitando %2$s.
Se, por exemplo, %2$s estiver definido para 100%%, então o 130%% será escolhido, mas se %2$s estiver definido para 90%%, então o 95%% um será escolhido]=]
L["If instead you just want to always see the best available mission just set %1$s to 100%% and %2$s to 0%%"] = "Se em vez disso você quiser sempre ver a melhor missão disponível, basta definir %1$s para 100 %% e %2$s para 0%%"
L[ [=[If you dont understand why OHC choosed a setup for a mission, you can request a full analysis.
Analyze party will show all the possible combinations and how OHC evaluated them]=] ] = [=[Se você não entender por que OHC escolheu uma configuração para uma missão, você pode solicitar uma análise completa.
A parte de análise mostrará todas as combinações possíveis e como a OHC as avaliou]=]
L["Prefer high durability"] = "Preferir alta durabilidade"
L["Restart the tutorial"] = "Reinicie o tutorial"
L[ [=[Slots (non the follower in it but just the slot) can be banned.
When you ban a slot, that slot will not be filled for that mission.
Exploiting the fact that troops are always in the leftmost slot(s) you can achieve a nice degree of custom tailoring, reducing the overall number of followers used for a mission]=] ] = [=[Slots (não o seguidor, mas apenas o slot) podem ser banidos.
Quando você proíbe um slot, esse slot não será preenchido para essa missão.
Explorando o fato de que as tropas estão sempre no (s) slot (s) mais à esquerda, você pode alcançar um bom grau de alfaiataria personalizada, reduzindo o número total de seguidores usados para uma missão]=]
L["Terminate the tutorial. You can resume it anytime clicking on the info icon in the side menu"] = "Terminar o tutorial. Você pode retomá-lo clicando no ícone de informações no menu lateral"
L["Thank you for reading this, enjoy %s"] = "Obrigado por ler isso, aproveite %s"
L["There are %d tutorial step you didnt read"] = "Existe(m) %d passo(s) no tutorial que você não leu"
L[ [=[Usually OrderHallCOmmander tries to use troops with the lowest durability in order to let you enque new troops request as soon as possible.
Checking %1$s reverse it and OrderHallCOmmander will choose for each mission troops with the highest possible durability]=] ] = [=[Normalmente, OrderHallCOmmander tenta usar tropas com a menor durabilidade para permitir que as tropas novas sejam solicitadas o mais rápido possível.
Marcando %1$s inverter e OrderHallCOmmander escolherá para cada missão tropas com a maior durabilidade possível]=]
L[ [=[Welcome to a new release of OrderHallCommander
Please follow this short tutorial to discover all new functionalities.
You will not regret it]=] ] = [=[Bem-vindo a uma nova versão do OrderHallCommander
Siga este breve tutorial para descobrir todas as novas funcionalidades.
Você não vai se arrepender]=]
L[ [=[With %1$s you ask to always counter the Hazard kill troop.
This means that OHC will try to counter it OR use a troop with just one durability left.
The target for this switch is to avoid wasting durability point, NOT to avoid troops' death.]=] ] = [=[Com %1$s, você pede para sempre contornar a Tropa de perigosidade.
Isso significa que a OHC tentará neutraliza-lo OU usar uma tropa com apenas uma durabilidade.
O alvo para este Switch é evitar perder o ponto de durabilidade, NÃO para evitar a morte das tropas.]=]
L[ [=[With %2$s you ask to never let a troop die.
This not only implies %1$s and %3$s, but force OHC to never send to mission a troop which will die.
The target for this switch is to totally avoid killing troops, even it for this we cant fill the party]=] ] = [=[Com %2$s você pede para nunca deixar uma tropa morrer.
Isso não implica apenas %1$s e %3$s, mas force OHC para nunca enviar para missão uma tropa que irá morrer.
O objetivo dessa mudança é evitar totalmente matar tropas, mesmo assim não podemos completar a tarefa]=]
L[ [=[You can blacklist missions right clicking mission button.
Since 1.5.1 you can start a mission witout passing from mission page shift-clicking the mission button.
Be sure you liked the party because no confirmation is asked]=] ] = [=[Você pode criar uma lista negra das missões clicando no botão da missão.
Desde 1.5.1 você pode iniciar uma missão sem passar da página da missão clicando no botão missão.
Certifique-se de que gostou do grupo porque não é feita nenhuma confirmação]=]
L["You can choose not to use a troop type clicking its icon"] = "Você pode optar por não usar um tipo de tropa clicando em seu ícone"
L[ [=[You can choose to limit how much champions are sent together.
Right now OHC is not using more than %3$s champions in the same mission-

Note that %2$s overrides it.]=] ] = [=[Você pode escolher limitar a quantidade de campeões enviados.
Agora, a OHC não está usando campeões de mais de $3$ na mesma missão

Observe que %2$s o substitui.]=]

return
end
L=l:NewLocale(me,"frFR")
if (L) then
--Translation missing 
L["%1$d%% lower than %2$d%%. Lower %s"] = "%1$d%% lower than %2$d%%. Lower %s"
--Translation missing 
L["%s for a wowhead link popup"] = "%s for a wowhead link popup"
--Translation missing 
L["%s start the mission without even opening the mission page. No question asked"] = "%s start the mission without even opening the mission page. No question asked"
--Translation missing 
L["%s starts missions"] = "%s starts missions"
--Translation missing 
L["%s to actually start mission"] = "%s to actually start mission"
L["%s to blacklist"] = "%s pour ajouter à la liste noire"
L["%s to remove from blacklist"] = "%s pour retirer de la liste noire"
--Translation missing 
L[ [=[%s, please review the tutorial
(Click the icon to dismiss this message and start the tutorial)]=] ] = [=[%s, please review the tutorial
(Click the icon to dismiss this message and start the tutorial)]=]
--Translation missing 
L["%s, please review the tutorial\\n(Click the icon to dismiss this message)"] = "%s, please review the tutorial\\n(Click the icon to dismiss this message)"
--Translation missing 
L["Allow to start a mission directly from the mission list page (no single mission page shown)"] = "Allow to start a mission directly from the mission list page (no single mission page shown)"
L["Always counter increased resource cost"] = "Toujours contrer les coûts accrus des ressources"
L["Always counter increased time"] = "Toujours contrer le temps accru"
L["Always counter kill troops (ignored if we can only use troops with just 1 durability left)"] = "Toujours éviter de tuer les troupes (ignoré s'il ne reste qu'un seul point de vitalité aux troupes disponibles)"
L["Always counter no bonus loot threat"] = "Toujours contrer les malus au butin bonus"
L["Artifact shown value is the base value without considering knowledge multiplier"] = "Le montant de puissance prodigieuse affiché est la valeur de base, sans prendre en considération le niveau de connaissance de l'arme prodigieuse"
--Translation missing 
L["Attempting %s"] = "Attempting %s"
--Translation missing 
L["Base Chance"] = "Base Chance"
L["Better parties available in next future"] = "De meilleurs groupes seront disponibles plus tard"
L["Blacklisted"] = "Ajoutée en liste noire"
L["Blacklisted missions are ignored in Mission Control"] = "Les missions ajoutées à la liste noire sont ignorées dans Mission Control"
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
L["Could not fulfill mission, aborting"] = "Could not fulfill mission, aborting"
--Translation missing 
L["Counter kill Troops"] = "Counter kill Troops"
--Translation missing 
L["Customization options (non mission related)"] = "Customization options (non mission related)"
--Translation missing 
L["Disables warning: "] = "Disables warning: "
--Translation missing 
L["Dont use this slot"] = "Dont use this slot"
L["Don't use troops"] = "Ne pas utiliser les troupes"
L["Duration reduced"] = "Durée réduite"
L["Duration Time"] = "Durée"
--Translation missing 
L["Elite: Prefer overcap"] = "Elite: Prefer overcap"
--Translation missing 
L["Elites mission mode"] = "Elites mission mode"
--Translation missing 
L["Empty missions sorted as last"] = "Empty missions sorted as last"
--Translation missing 
L["Empty or 0% success mission are sorted as last. Does not apply to \"original\" method"] = "Empty or 0% success mission are sorted as last. Does not apply to \"original\" method"
--Translation missing 
L["Equipped by following champions:"] = "Equipped by following champions:"
L["Expiration Time"] = "Date d'expiration"
L["Favours leveling follower for xp missions"] = "Favoriser les champions à entraîner pour les missions rapportant de l'expérience"
--Translation missing 
L["For elite missions, tries hard to not go under 100% even at cost of overcapping"] = "For elite missions, tries hard to not go under 100% even at cost of overcapping"
L["General"] = "Général"
L["Global approx. xp reward"] = "Global env. Xp récompense"
--Translation missing 
L["Global approx. xp reward per hour"] = "Global approx. xp reward per hour"
L["HallComander Quick Mission Completion"] = "Achèvement rapide de mission HallComander"
--Translation missing 
L["If %1$s is lower than this, then we try to achieve at least %2$s without going over 100%%. Ignored for elite missions."] = "If %1$s is lower than this, then we try to achieve at least %2$s without going over 100%%. Ignored for elite missions."
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
L[ [=[Launch the first filled mission with at least one locked follower.
Keep %s pressed to actually launch, a simple click will only print mission name with its followers list]=] ] = [=[Launch the first filled mission with at least one locked follower.
Keep %s pressed to actually launch, a simple click will only print mission name with its followers list]=]
--Translation missing 
L[ [=[Launch the first filled mission with at least one locked follower.
Keep SHIFT pressed to actually launch, a simple click will only print mission name with its followers list]=] ] = [=[Launch the first filled mission with at least one locked follower.
Keep SHIFT pressed to actually launch, a simple click will only print mission name with its followers list]=]
L["Level"] = "Niveau"
--Translation missing 
L["Lock all"] = "Lock all"
--Translation missing 
L["Lock this follower"] = "Lock this follower"
--Translation missing 
L["Locked follower are only used in this mission"] = "Locked follower are only used in this mission"
L["Make Order Hall Mission Panel movable"] = "Panneau de missions de domaine déplaçable"
L["Makes sure that no troops will be killed"] = "S'assurer qu'aucune troupe ne soit tuée"
L["Max champions"] = "Champions max"
L["Maximize xp gain"] = "Maximiser le gain d'xp"
L["Mission duration reduced"] = "Durée de la mission réduite"
--Translation missing 
L["Mission was capped due to total chance less than"] = "Mission was capped due to total chance less than"
L["Missions"] = true
L["Never kill Troops"] = "Ne jamais tuer les troupes"
L["No follower gained xp"] = "Aucun sujet n'a gagné d'xp"
--Translation missing 
L["No suitable missions. Have you reserved at least one follower?"] = "No suitable missions. Have you reserved at least one follower?"
L["Not blacklisted"] = "Pas en liste noire"
L["Nothing to report"] = "Rien à signaler"
L["Notifies you when you have troops ready to be collected"] = "Vous avertit lorsque vous avez des troupes prêtes à être récupérées"
L["Only accept missions with time improved"] = "N'acceptez que les missions avec le temps amélioré"
--Translation missing 
L["Only consider elite missions"] = "Only consider elite missions"
--Translation missing 
L["Only need %s instead of %s to start a mission from mission list"] = "Only need %s instead of %s to start a mission from mission list"
L["Only use champions even if troops are available"] = "Utiliser uniquement des champions même si des troupes sont disponibles"
--Translation missing 
L["Open configuration"] = "Open configuration"
L[ [=[OrderHallCommander overrides GarrisonCommander for Order Hall Management.
 You can revert to GarrisonCommander simply disabling OrderhallCommander.
If instead you like OrderHallCommander remember to add it to Curse client and keep it updated]=] ] = [=[OrderHallCommander remplace GarrisonCommander pour la gestion du Domaine de Classe.
Vous pouvez rétablir GarrisonCommander en désactivant simplement OrderHallCommander.
Si vous préférez plutôt OrderHallCommander, souvenez vous de l'ajouter au client Curse et de le garder à jour.]=]
L["Original method"] = "Méthode originale"
L["Position is not saved on logout"] = "La position n'est pas enregistrée lors de la déconnexion"
L["Prefer high durability"] = "Préférer une haute vitalité"
--Translation missing 
L["Quick start first mission"] = "Quick start first mission"
--Translation missing 
L["Remove no champions warning"] = "Remove no champions warning"
L["Restart tutorial from beginning"] = "Relancer le tutoriel depuis le début"
L["Resume tutorial"] = "Reprendre le tutoriel"
L["Resurrect troops effect"] = "Effet Résurrection des troupes"
L["Reward type"] = "Type de récompense"
--Translation missing 
L["Sets all switches to a very permissive setup. Very similar to 1.4.4"] = "Sets all switches to a very permissive setup. Very similar to 1.4.4"
--Translation missing 
L["Show tutorial"] = "Show tutorial"
L["Show/hide OrderHallCommander mission menu"] = "Afficher / masquer le menu de mission OrderHallCommander"
L["Sort missions by:"] = "Trier les missions par:"
--Translation missing 
L["Started with "] = "Started with "
L["Success Chance"] = "Chance de succès"
L["Troop ready alert"] = "Alerte troupes prêtes"
--Translation missing 
L["Unable to fill missions, raise \"%s\""] = "Unable to fill missions, raise \"%s\""
L["Unable to fill missions. Check your switches"] = "Impossible de remplir les missions. Vérifiez les paramètres."
--Translation missing 
L["Unable to start mission, aborting"] = "Unable to start mission, aborting"
--Translation missing 
L["Unlock all"] = "Unlock all"
--Translation missing 
L["Unlock this follower"] = "Unlock this follower"
--Translation missing 
L["Unlocks all follower and slots at once"] = "Unlocks all follower and slots at once"
--Translation missing 
L["Unsafe mission start"] = "Unsafe mission start"
L["Upgrading to |cff00ff00%d|r"] = "Mise à niveau vers |cff00ff00%d|r"
--Translation missing 
L["URL Copy"] = "URL Copy"
L["Use at most this many champions"] = "Utilisé au maximum ce nombre de champions"
L["Use combat ally"] = "Utiliser le combattant allié"
--Translation missing 
L["Use this slot"] = "Use this slot"
L["Uses troops with the highest durability instead of the ones with the lowest"] = "Utilise les troupes avec le plus vitalité au lieu de celles avec le moins de vitalité "
L["When no free followers are available shows empty follower"] = "Quand aucun sujet n'est disponible afficher un sujet vide"
--Translation missing 
L["When we cant achieve the requested %1$s, we try to reach at least this one without (if possible) going over 100%%"] = "When we cant achieve the requested %1$s, we try to reach at least this one without (if possible) going over 100%%"
--Translation missing 
L["Would start with "] = "Would start with "
L["You are wasting |cffff0000%d|cffffd200 point(s)!!!"] = "Vous perdez |cffff0000%d|cffffd200 point (s) !!!"
L[ [=[You need to close and restart World of Warcraft in order to update this version of OrderHallCommander.
Simply reloading UI is not enough]=] ] = [=[Vous devez fermer et redémarrer World of Warcraft pour mettre à jour cette version de OrderHallCommander.
Recharger l'interface n'est pas suffisant.]=]
--Translation missing 
L["You now need to press both %s and %s to start mission"] = "You now need to press both %s and %s to start mission"

-- Tutorial
--Translation missing 
L[ [=[%1$s and %2$s switches work together to customize how you want your mission filled

The value you set for %1$s (right now %3$s%%) is the minimum acceptable chance for attempting to achieve bonus while the value to set for %2$s (right now %4$s%%) is the chance you want achieve when you are forfaiting bonus (due to not enough powerful followers)]=] ] = [=[%1$s and %2$s switches work together to customize how you want your mission filled

The value you set for %1$s (right now %3$s%%) is the minimum acceptable chance for attempting to achieve bonus while the value to set for %2$s (right now %4$s%%) is the chance you want achieve when you are forfaiting bonus (due to not enough powerful followers)]=]
--Translation missing 
L[ [=[A requested window is not open
Tutorial will resume as soon as possible]=] ] = [=[A requested window is not open
Tutorial will resume as soon as possible]=]
--Translation missing 
L[ [=[Clicking a party button will assign its followers to the current mission.
Use it to verify OHC calculated chance with Blizzard one.
If they differs please take a screenshot and open a ticket :).]=] ] = [=[Clicking a party button will assign its followers to the current mission.
Use it to verify OHC calculated chance with Blizzard one.
If they differs please take a screenshot and open a ticket :).]=]
--Translation missing 
L[ [=[Equipment and upgrades are listed here as clickable buttons.
Due to an issue with Blizzard Taint system, drag and drop from bags raise an error.
if you drag and drop an item from a bag, you receive an error.
In order to assign equipments which are not listed (I update the list often but sometimes Blizzard is faster), you can right click the item in the bag and the left click the follower.
This way you dont receive any error]=] ] = [=[Equipment and upgrades are listed here as clickable buttons.
Due to an issue with Blizzard Taint system, drag and drop from bags raise an error.
if you drag and drop an item from a bag, you receive an error.
In order to assign equipments which are not listed (I update the list often but sometimes Blizzard is faster), you can right click the item in the bag and the left click the follower.
This way you dont receive any error]=]
--Translation missing 
L[ [=[Equipment and upgrades are listed here as clickable buttons.
Due to an issue with Blizzard Taint system, if you drag and drop an item from a bag, you receive an error.
In order to assign equipment which are not listed (I updated the list often but sometimes Blizzard is faster), you can right click the item in the bag and the left click the follower.
This way you dont receive any error]=] ] = [=[Equipment and upgrades are listed here as clickable buttons.
Due to an issue with Blizzard Taint system, if you drag and drop an item from a bag, you receive an error.
In order to assign equipment which are not listed (I updated the list often but sometimes Blizzard is faster), you can right click the item in the bag and the left click the follower.
This way you dont receive any error]=]
--Translation missing 
L[ [=[For example, let's say a mission can reach 95%%, 130%% and 180%% success chance.
If %1$s is set to 170%%, the 180%% one will be choosen.
If %1$s is set to 200%% OHC will try to find the nearest to 100%% respecting %2$s setting
If for example %2$s is set to 100%%, then the 130%% one will be choosen, but if %2$s is set to 90%% then the 95%% one will be choosen]=] ] = [=[For example, let's say a mission can reach 95%%, 130%% and 180%% success chance.
If %1$s is set to 170%%, the 180%% one will be choosen.
If %1$s is set to 200%% OHC will try to find the nearest to 100%% respecting %2$s setting
If for example %2$s is set to 100%%, then the 130%% one will be choosen, but if %2$s is set to 90%% then the 95%% one will be choosen]=]
--Translation missing 
L["If instead you just want to always see the best available mission just set %1$s to 100%% and %2$s to 0%%"] = "If instead you just want to always see the best available mission just set %1$s to 100%% and %2$s to 0%%"
--Translation missing 
L[ [=[If you dont understand why OHC choosed a setup for a mission, you can request a full analysis.
Analyze party will show all the possible combinations and how OHC evaluated them]=] ] = [=[If you dont understand why OHC choosed a setup for a mission, you can request a full analysis.
Analyze party will show all the possible combinations and how OHC evaluated them]=]
--Translation missing 
L["Prefer high durability"] = "Prefer high durability"
L["Restart the tutorial"] = "Relancer le tutoriel"
--Translation missing 
L[ [=[Slots (non the follower in it but just the slot) can be banned.
When you ban a slot, that slot will not be filled for that mission.
Exploiting the fact that troops are always in the leftmost slot(s) you can achieve a nice degree of custom tailoring, reducing the overall number of followers used for a mission]=] ] = [=[Slots (non the follower in it but just the slot) can be banned.
When you ban a slot, that slot will not be filled for that mission.
Exploiting the fact that troops are always in the leftmost slot(s) you can achieve a nice degree of custom tailoring, reducing the overall number of followers used for a mission]=]
L["Terminate the tutorial. You can resume it anytime clicking on the info icon in the side menu"] = "Termine le tutorial. Vous pouvez y revenir n'importe quand en cliquant sur l'icône d'information dans le menu latéral."
--Translation missing 
L["Thank you for reading this, enjoy %s"] = "Thank you for reading this, enjoy %s"
--Translation missing 
L["There are %d tutorial step you didnt read"] = "There are %d tutorial step you didnt read"
L[ [=[Usually OrderHallCOmmander tries to use troops with the lowest durability in order to let you enque new troops request as soon as possible.
Checking %1$s reverse it and OrderHallCOmmander will choose for each mission troops with the highest possible durability]=] ] = [=[Normalement, OrderHallCommander essaie d'utiliser les troupes avec le moins de points de vitalité, pour vous permettre de placer des commandes pour de nouvelles troupes dès que possible.
Cocher %1$s inverse cette règle et OrderHallCommander va choisir pour chaque mission des troupes avec le plus de points de vitalité.]=]
L[ [=[Welcome to a new release of OrderHallCommander
Please follow this short tutorial to discover all new functionalities.
You will not regret it]=] ] = [=[Bienvenue dans une nouvelle version de OrderHallCommander.
Veuillez consulter ce court tutorial pour découvrir toutes les nouvelles fonctionnalités.
Vous n'allez pas le regretter.]=]
L[ [=[With %1$s you ask to always counter the Hazard kill troop.
This means that OHC will try to counter it OR use a troop with just one durability left.
The target for this switch is to avoid wasting durability point, NOT to avoid troops' death.]=] ] = [=[Avec %1$s, vous demandez à toujours contrer le Danger qui tue les troupes.
Cela signifie que OHC va essayer de contrer le Danger OU va utiliser des troupes avec un seul point de vitalité restant.
L'idée de cette option est d'éviter de gâcher des points de vitalité, PAS d'éviter de tuer des troupes.]=]
L[ [=[With %2$s you ask to never let a troop die.
This not only implies %1$s and %3$s, but force OHC to never send to mission a troop which will die.
The target for this switch is to totally avoid killing troops, even it for this we cant fill the party]=] ] = [=[Avec %2$s, vous demandez à ne jamais laisser les troupes mourir.
Cela inclue non seulement %1$s et %3$s, mais force également OHC à ne jamais envoyer en mission des troupes qui en mourraient.
L'idée de cette option est d'éviter complètement de tuer des troupes, même si cela empêche de compléter un groupe.]=]
L[ [=[You can blacklist missions right clicking mission button.
Since 1.5.1 you can start a mission witout passing from mission page shift-clicking the mission button.
Be sure you liked the party because no confirmation is asked]=] ] = [=[Vous pouvez ajouter une mission à la liste noire en faisant un clic-droit dessus.
Depuis la 1.5.1, vous pouvez démarrer une mission directement, sans passer par la page de la mission, en cliquant dessus avec la touche majuscule enfoncée.
Vérifiez bien que le groupe vous plait car il n'y aura pas de confirmation.]=]
L["You can choose not to use a troop type clicking its icon"] = "Vous pouvez décider de ne pas utiliser un type de troupe en cliquant sur son icône."
L[ [=[You can choose to limit how much champions are sent together.
Right now OHC is not using more than %3$s champions in the same mission-

Note that %2$s overrides it.]=] ] = [=[Vous pouvez décider de limiter le nombre de champions qui sont envoyés en même temps.
Actuellement, HOC n'utilise pas plus de %3$s pour la même mission.

À noter que %2$s écrase cette option.]=]

return
end
L=l:NewLocale(me,"deDE")
if (L) then
--Translation missing 
L["%1$d%% lower than %2$d%%. Lower %s"] = "%1$d%% lower than %2$d%%. Lower %s"
--Translation missing 
L["%s for a wowhead link popup"] = "%s for a wowhead link popup"
--Translation missing 
L["%s start the mission without even opening the mission page. No question asked"] = "%s start the mission without even opening the mission page. No question asked"
--Translation missing 
L["%s starts missions"] = "%s starts missions"
--Translation missing 
L["%s to actually start mission"] = "%s to actually start mission"
--Translation missing 
L["%s to blacklist"] = "%s to blacklist"
--Translation missing 
L["%s to remove from blacklist"] = "%s to remove from blacklist"
--Translation missing 
L[ [=[%s, please review the tutorial
(Click the icon to dismiss this message and start the tutorial)]=] ] = [=[%s, please review the tutorial
(Click the icon to dismiss this message and start the tutorial)]=]
--Translation missing 
L["%s, please review the tutorial\\n(Click the icon to dismiss this message)"] = "%s, please review the tutorial\\n(Click the icon to dismiss this message)"
--Translation missing 
L["Allow to start a mission directly from the mission list page (no single mission page shown)"] = "Allow to start a mission directly from the mission list page (no single mission page shown)"
L["Always counter increased resource cost"] = "Immer erhöhte Ressourcenkosten kontern"
L["Always counter increased time"] = "Immer erhöhte Missionsdauer kontern"
L["Always counter kill troops (ignored if we can only use troops with just 1 durability left)"] = "Töten der Trupps immer kontern (dies wird ignoriert, falls nur Truppen mit 1 Haltbarkeit benutzt werden können)"
L["Always counter no bonus loot threat"] = "Kontert immer Bedrohungen, die Bonusbeute verhindern"
L["Artifact shown value is the base value without considering knowledge multiplier"] = "Der angezeigte Wert ist der Grundwert ohne die Berücksichtigung von Artefakwissen."
--Translation missing 
L["Attempting %s"] = "Attempting %s"
L["Base Chance"] = "Basis-Chance"
L["Better parties available in next future"] = "Bessere Gruppen sind in absehbarer Zeit verfügbar"
--Translation missing 
L["Blacklisted"] = "Blacklisted"
--Translation missing 
L["Blacklisted missions are ignored in Mission Control"] = "Blacklisted missions are ignored in Mission Control"
L["Bonus Chance"] = "Bonus-Chance"
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
L["Could not fulfill mission, aborting"] = "Could not fulfill mission, aborting"
L["Counter kill Troops"] = "Kontere Tödlich"
--Translation missing 
L["Customization options (non mission related)"] = "Customization options (non mission related)"
L["Disables warning: "] = "Deaktiviert Warnung:"
--Translation missing 
L["Dont use this slot"] = "Dont use this slot"
L["Don't use troops"] = "Keine Truppen verwenden"
L["Duration reduced"] = "Dauer reduziert"
L["Duration Time"] = "Dauer"
--Translation missing 
L["Elite: Prefer overcap"] = "Elite: Prefer overcap"
--Translation missing 
L["Elites mission mode"] = "Elites mission mode"
--Translation missing 
L["Empty missions sorted as last"] = "Empty missions sorted as last"
--Translation missing 
L["Empty or 0% success mission are sorted as last. Does not apply to \"original\" method"] = "Empty or 0% success mission are sorted as last. Does not apply to \"original\" method"
--Translation missing 
L["Equipped by following champions:"] = "Equipped by following champions:"
L["Expiration Time"] = "Ablaufzeit"
L["Favours leveling follower for xp missions"] = "Bevorzugt niedrigstufige Anhänger für EP-Missionen"
--Translation missing 
L["For elite missions, tries hard to not go under 100% even at cost of overcapping"] = "For elite missions, tries hard to not go under 100% even at cost of overcapping"
L["General"] = "Allgemein"
L["Global approx. xp reward"] = "EP-Belohnung gesamt"
L["Global approx. xp reward per hour"] = "EP-Belohnung pro Stunde"
L["HallComander Quick Mission Completion"] = "HallComander Schneller Missionsabschluss"
--Translation missing 
L["If %1$s is lower than this, then we try to achieve at least %2$s without going over 100%%. Ignored for elite missions."] = "If %1$s is lower than this, then we try to achieve at least %2$s without going over 100%%. Ignored for elite missions."
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
L[ [=[Launch the first filled mission with at least one locked follower.
Keep %s pressed to actually launch, a simple click will only print mission name with its followers list]=] ] = [=[Launch the first filled mission with at least one locked follower.
Keep %s pressed to actually launch, a simple click will only print mission name with its followers list]=]
--Translation missing 
L[ [=[Launch the first filled mission with at least one locked follower.
Keep SHIFT pressed to actually launch, a simple click will only print mission name with its followers list]=] ] = [=[Launch the first filled mission with at least one locked follower.
Keep SHIFT pressed to actually launch, a simple click will only print mission name with its followers list]=]
L["Level"] = "Stufe"
--Translation missing 
L["Lock all"] = "Lock all"
--Translation missing 
L["Lock this follower"] = "Lock this follower"
--Translation missing 
L["Locked follower are only used in this mission"] = "Locked follower are only used in this mission"
L["Make Order Hall Mission Panel movable"] = "Ordenshallen-Missionsfenster beweglich machen"
--Translation missing 
L["Makes sure that no troops will be killed"] = "Makes sure that no troops will be killed"
L["Max champions"] = "Max. Anhänger"
L["Maximize xp gain"] = "Erfahrungszunahme maximieren"
L["Mission duration reduced"] = "Missionsdauer reduziert"
--Translation missing 
L["Mission was capped due to total chance less than"] = "Mission was capped due to total chance less than"
L["Missions"] = "Missionen"
L["Never kill Troops"] = "Töte nie Truppen"
L["No follower gained xp"] = "Kein Anhänger erhielt EP"
--Translation missing 
L["No suitable missions. Have you reserved at least one follower?"] = "No suitable missions. Have you reserved at least one follower?"
--Translation missing 
L["Not blacklisted"] = "Not blacklisted"
L["Nothing to report"] = "Nichts zu berichten"
L["Notifies you when you have troops ready to be collected"] = "Benachrichtigt, wenn Truppen bereit sind, gesammelt zu werden"
L["Only accept missions with time improved"] = "Nur Missionen mit verkürzter Dauer annehmen"
--Translation missing 
L["Only consider elite missions"] = "Only consider elite missions"
--Translation missing 
L["Only need %s instead of %s to start a mission from mission list"] = "Only need %s instead of %s to start a mission from mission list"
L["Only use champions even if troops are available"] = "Verwende nur Anhänger, auch wenn Trupps vorhanden sind"
--Translation missing 
L["Open configuration"] = "Open configuration"
L[ [=[OrderHallCommander overrides GarrisonCommander for Order Hall Management.
 You can revert to GarrisonCommander simply disabling OrderhallCommander.
If instead you like OrderHallCommander remember to add it to Curse client and keep it updated]=] ] = [=[OrderHallCommander überschreibt GarrisonCommaner für Mission in der Ordenshalle.
Du kannst OrderhallCommander einfach deaktvieren um wieder OrderhallCommander zu verwenden.
Wenn du OrderhallCommander allerdings gut findest, vergiss nicht es in deinem Curse Client hinzuzufügen und aktuell zu halten.]=]
L["Original method"] = "Standard"
L["Position is not saved on logout"] = "Die Position wird beim Ausloggen nicht gespeichert"
L["Prefer high durability"] = "Bevorzuge hohe Haltbarkeit"
--Translation missing 
L["Quick start first mission"] = "Quick start first mission"
--Translation missing 
L["Remove no champions warning"] = "Remove no champions warning"
--Translation missing 
L["Restart tutorial from beginning"] = "Restart tutorial from beginning"
--Translation missing 
L["Resume tutorial"] = "Resume tutorial"
L["Resurrect troops effect"] = "Truppen wiederbeleben"
L["Reward type"] = "Belohnungsart"
--Translation missing 
L["Sets all switches to a very permissive setup. Very similar to 1.4.4"] = "Sets all switches to a very permissive setup. Very similar to 1.4.4"
L["Show tutorial"] = "Zeige Tutorial"
L["Show/hide OrderHallCommander mission menu"] = "OrderHallCommander-Missionsmenü zeigen/ausblenden"
L["Sort missions by:"] = "Sortieren nach:"
L["Started with "] = "Startet mit"
L["Success Chance"] = "Erfolgschance"
L["Troop ready alert"] = "Warnung Trupp bereit"
--Translation missing 
L["Unable to fill missions, raise \"%s\""] = "Unable to fill missions, raise \"%s\""
L["Unable to fill missions. Check your switches"] = "Mit den aktuellen Einstellungen kann keine Mission besetzt werden"
--Translation missing 
L["Unable to start mission, aborting"] = "Unable to start mission, aborting"
--Translation missing 
L["Unlock all"] = "Unlock all"
--Translation missing 
L["Unlock this follower"] = "Unlock this follower"
--Translation missing 
L["Unlocks all follower and slots at once"] = "Unlocks all follower and slots at once"
--Translation missing 
L["Unsafe mission start"] = "Unsafe mission start"
L["Upgrading to |cff00ff00%d|r"] = "Erhöhe Stufe auf |cff00ff00%d|r"
L["URL Copy"] = "URL kopieren"
L["Use at most this many champions"] = "Verwende maximal so viele Anhänger pro Mission"
L["Use combat ally"] = "Kampfgefährten verwenden"
--Translation missing 
L["Use this slot"] = "Use this slot"
--Translation missing 
L["Uses troops with the highest durability instead of the ones with the lowest"] = "Uses troops with the highest durability instead of the ones with the lowest"
--Translation missing 
L["When no free followers are available shows empty follower"] = "When no free followers are available shows empty follower"
--Translation missing 
L["When we cant achieve the requested %1$s, we try to reach at least this one without (if possible) going over 100%%"] = "When we cant achieve the requested %1$s, we try to reach at least this one without (if possible) going over 100%%"
--Translation missing 
L["Would start with "] = "Would start with "
L["You are wasting |cffff0000%d|cffffd200 point(s)!!!"] = "Du verschwendst |cffff0000%d |cffffd200|4Punkt:Punkte;!"
--Translation missing 
L[ [=[You need to close and restart World of Warcraft in order to update this version of OrderHallCommander.
Simply reloading UI is not enough]=] ] = [=[You need to close and restart World of Warcraft in order to update this version of OrderHallCommander.
Simply reloading UI is not enough]=]
--Translation missing 
L["You now need to press both %s and %s to start mission"] = "You now need to press both %s and %s to start mission"

-- Tutorial
--Translation missing 
L[ [=[%1$s and %2$s switches work together to customize how you want your mission filled

The value you set for %1$s (right now %3$s%%) is the minimum acceptable chance for attempting to achieve bonus while the value to set for %2$s (right now %4$s%%) is the chance you want achieve when you are forfaiting bonus (due to not enough powerful followers)]=] ] = [=[%1$s and %2$s switches work together to customize how you want your mission filled

The value you set for %1$s (right now %3$s%%) is the minimum acceptable chance for attempting to achieve bonus while the value to set for %2$s (right now %4$s%%) is the chance you want achieve when you are forfaiting bonus (due to not enough powerful followers)]=]
--Translation missing 
L[ [=[A requested window is not open
Tutorial will resume as soon as possible]=] ] = [=[A requested window is not open
Tutorial will resume as soon as possible]=]
--Translation missing 
L[ [=[Clicking a party button will assign its followers to the current mission.
Use it to verify OHC calculated chance with Blizzard one.
If they differs please take a screenshot and open a ticket :).]=] ] = [=[Clicking a party button will assign its followers to the current mission.
Use it to verify OHC calculated chance with Blizzard one.
If they differs please take a screenshot and open a ticket :).]=]
--Translation missing 
L[ [=[Equipment and upgrades are listed here as clickable buttons.
Due to an issue with Blizzard Taint system, drag and drop from bags raise an error.
if you drag and drop an item from a bag, you receive an error.
In order to assign equipments which are not listed (I update the list often but sometimes Blizzard is faster), you can right click the item in the bag and the left click the follower.
This way you dont receive any error]=] ] = [=[Equipment and upgrades are listed here as clickable buttons.
Due to an issue with Blizzard Taint system, drag and drop from bags raise an error.
if you drag and drop an item from a bag, you receive an error.
In order to assign equipments which are not listed (I update the list often but sometimes Blizzard is faster), you can right click the item in the bag and the left click the follower.
This way you dont receive any error]=]
--Translation missing 
L[ [=[Equipment and upgrades are listed here as clickable buttons.
Due to an issue with Blizzard Taint system, if you drag and drop an item from a bag, you receive an error.
In order to assign equipment which are not listed (I updated the list often but sometimes Blizzard is faster), you can right click the item in the bag and the left click the follower.
This way you dont receive any error]=] ] = [=[Equipment and upgrades are listed here as clickable buttons.
Due to an issue with Blizzard Taint system, if you drag and drop an item from a bag, you receive an error.
In order to assign equipment which are not listed (I updated the list often but sometimes Blizzard is faster), you can right click the item in the bag and the left click the follower.
This way you dont receive any error]=]
--Translation missing 
L[ [=[For example, let's say a mission can reach 95%%, 130%% and 180%% success chance.
If %1$s is set to 170%%, the 180%% one will be choosen.
If %1$s is set to 200%% OHC will try to find the nearest to 100%% respecting %2$s setting
If for example %2$s is set to 100%%, then the 130%% one will be choosen, but if %2$s is set to 90%% then the 95%% one will be choosen]=] ] = [=[For example, let's say a mission can reach 95%%, 130%% and 180%% success chance.
If %1$s is set to 170%%, the 180%% one will be choosen.
If %1$s is set to 200%% OHC will try to find the nearest to 100%% respecting %2$s setting
If for example %2$s is set to 100%%, then the 130%% one will be choosen, but if %2$s is set to 90%% then the 95%% one will be choosen]=]
--Translation missing 
L["If instead you just want to always see the best available mission just set %1$s to 100%% and %2$s to 0%%"] = "If instead you just want to always see the best available mission just set %1$s to 100%% and %2$s to 0%%"
--Translation missing 
L[ [=[If you dont understand why OHC choosed a setup for a mission, you can request a full analysis.
Analyze party will show all the possible combinations and how OHC evaluated them]=] ] = [=[If you dont understand why OHC choosed a setup for a mission, you can request a full analysis.
Analyze party will show all the possible combinations and how OHC evaluated them]=]
--Translation missing 
L["Prefer high durability"] = "Prefer high durability"
L["Restart the tutorial"] = "Startet das Tutorial neu"
--Translation missing 
L[ [=[Slots (non the follower in it but just the slot) can be banned.
When you ban a slot, that slot will not be filled for that mission.
Exploiting the fact that troops are always in the leftmost slot(s) you can achieve a nice degree of custom tailoring, reducing the overall number of followers used for a mission]=] ] = [=[Slots (non the follower in it but just the slot) can be banned.
When you ban a slot, that slot will not be filled for that mission.
Exploiting the fact that troops are always in the leftmost slot(s) you can achieve a nice degree of custom tailoring, reducing the overall number of followers used for a mission]=]
--Translation missing 
L["Terminate the tutorial. You can resume it anytime clicking on the info icon in the side menu"] = "Terminate the tutorial. You can resume it anytime clicking on the info icon in the side menu"
--Translation missing 
L["Thank you for reading this, enjoy %s"] = "Thank you for reading this, enjoy %s"
--Translation missing 
L["There are %d tutorial step you didnt read"] = "There are %d tutorial step you didnt read"
--Translation missing 
L[ [=[Usually OrderHallCOmmander tries to use troops with the lowest durability in order to let you enque new troops request as soon as possible.
Checking %1$s reverse it and OrderHallCOmmander will choose for each mission troops with the highest possible durability]=] ] = [=[Usually OrderHallCOmmander tries to use troops with the lowest durability in order to let you enque new troops request as soon as possible.
Checking %1$s reverse it and OrderHallCOmmander will choose for each mission troops with the highest possible durability]=]
--Translation missing 
L[ [=[Welcome to a new release of OrderHallCommander
Please follow this short tutorial to discover all new functionalities.
You will not regret it]=] ] = [=[Welcome to a new release of OrderHallCommander
Please follow this short tutorial to discover all new functionalities.
You will not regret it]=]
--Translation missing 
L[ [=[With %1$s you ask to always counter the Hazard kill troop.
This means that OHC will try to counter it OR use a troop with just one durability left.
The target for this switch is to avoid wasting durability point, NOT to avoid troops' death.]=] ] = [=[With %1$s you ask to always counter the Hazard kill troop.
This means that OHC will try to counter it OR use a troop with just one durability left.
The target for this switch is to avoid wasting durability point, NOT to avoid troops' death.]=]
--Translation missing 
L[ [=[With %2$s you ask to never let a troop die.
This not only implies %1$s and %3$s, but force OHC to never send to mission a troop which will die.
The target for this switch is to totally avoid killing troops, even it for this we cant fill the party]=] ] = [=[With %2$s you ask to never let a troop die.
This not only implies %1$s and %3$s, but force OHC to never send to mission a troop which will die.
The target for this switch is to totally avoid killing troops, even it for this we cant fill the party]=]
--Translation missing 
L[ [=[You can blacklist missions right clicking mission button.
Since 1.5.1 you can start a mission witout passing from mission page shift-clicking the mission button.
Be sure you liked the party because no confirmation is asked]=] ] = [=[You can blacklist missions right clicking mission button.
Since 1.5.1 you can start a mission witout passing from mission page shift-clicking the mission button.
Be sure you liked the party because no confirmation is asked]=]
--Translation missing 
L["You can choose not to use a troop type clicking its icon"] = "You can choose not to use a troop type clicking its icon"
--Translation missing 
L[ [=[You can choose to limit how much champions are sent together.
Right now OHC is not using more than %3$s champions in the same mission-

Note that %2$s overrides it.]=] ] = [=[You can choose to limit how much champions are sent together.
Right now OHC is not using more than %3$s champions in the same mission-

Note that %2$s overrides it.]=]

return
end
L=l:NewLocale(me,"itIT")
if (L) then
L["%1$d%% lower than %2$d%%. Lower %s"] = "%1$d%% è inferiore a %2$d%%. Abbassa %s"
--Translation missing 
L["%s for a wowhead link popup"] = "%s for a wowhead link popup"
--Translation missing 
L["%s start the mission without even opening the mission page. No question asked"] = "%s start the mission without even opening the mission page. No question asked"
--Translation missing 
L["%s starts missions"] = "%s starts missions"
--Translation missing 
L["%s to actually start mission"] = "%s to actually start mission"
L["%s to blacklist"] = "Clicca col destro per mettere in blacklist"
L["%s to remove from blacklist"] = "Clicca col destro per rimuovere dalla blacklist"
--Translation missing 
L[ [=[%s, please review the tutorial
(Click the icon to dismiss this message and start the tutorial)]=] ] = [=[%s, please review the tutorial
(Click the icon to dismiss this message and start the tutorial)]=]
--Translation missing 
L["%s, please review the tutorial\\n(Click the icon to dismiss this message)"] = "%s, please review the tutorial\\n(Click the icon to dismiss this message)"
--Translation missing 
L["Allow to start a mission directly from the mission list page (no single mission page shown)"] = "Allow to start a mission directly from the mission list page (no single mission page shown)"
L["Always counter increased resource cost"] = "Contrasta sempre incremento risorse"
L["Always counter increased time"] = "Contrasta sempre incremento durata"
L["Always counter kill troops (ignored if we can only use troops with just 1 durability left)"] = "Contrasta sempre morte milizie (ignorato tutte le milizie hanno solo una vita rimanente)"
L["Always counter no bonus loot threat"] = "Contrasta sempre il \"no bonus\""
L["Artifact shown value is the base value without considering knowledge multiplier"] = "Il valore mostrato è quello base, senza considerare il moltiplicatore dalla conoscenza"
L["Attempting %s"] = "Provo %s"
L["Base Chance"] = "Percentuale base"
L["Better parties available in next future"] = "Ci sono combinazioni migliori nel futuro"
L["Blacklisted"] = "In blacklist"
L["Blacklisted missions are ignored in Mission Control"] = "Le missioni in blacklist vengono ignorate negli automatismi"
L["Bonus Chance"] = "Percentuale globale"
L["Building Final report"] = "Sto preparando il rapporto finale"
L["but using troops with just one durability left"] = "ma uso truppe con solo un punto vita rimasto"
L["Capped %1$s. Spend at least %2$d of them"] = "%1$s ha un limite. Spendine almeno %2%d"
L["Changes the sort order of missions in Mission panel"] = "Cambia l'ordine delle mission nel Pannello Missioni"
L["Combat ally is proposed for missions so you can consider unassigning him"] = "Viene proposto l'alleato, per poter valutare se rimuoverlo dalla missione di scorta"
L["Complete all missions without confirmation"] = "Completa tutte le missioni senza chiedere conferma"
L["Configuration for mission party builder"] = "Configurazioni per il generatore di gruppi"
L["Cost reduced"] = "Costo ridotto"
L["Could not fulfill mission, aborting"] = "Non riesco a completare il party per la missione, rinuncio"
L["Counter kill Troops"] = "Contrasta \"Uccide le truppe\""
--Translation missing 
L["Customization options (non mission related)"] = "Customization options (non mission related)"
L["Disables warning: "] = "Disabilita l'avviso:"
L["Dont use this slot"] = "Non usare questo slot"
L["Don't use troops"] = "Non usare truppe"
L["Duration reduced"] = "Durata ridotta"
L["Duration Time"] = "Durata"
--Translation missing 
L["Elite: Prefer overcap"] = "Elite: Prefer overcap"
L["Elites mission mode"] = "Modalità missioni \"elite\""
L["Empty missions sorted as last"] = "Le missioni senza campioni vengono ordinate come ultime"
L["Empty or 0% success mission are sorted as last. Does not apply to \"original\" method"] = "Le missioni senza campioni o con lo 0% o meno di possibilità di successo vengono ordinate come ultime. Non si applica all'ordinamento originale Blizzard"
L["Equipped by following champions:"] = "Usato da questi campioni:"
L["Expiration Time"] = "Scadenza"
L["Favours leveling follower for xp missions"] = "Preferisci i campioni che devono livellare"
--Translation missing 
L["For elite missions, tries hard to not go under 100% even at cost of overcapping"] = "For elite missions, tries hard to not go under 100% even at cost of overcapping"
L["General"] = "Generale"
L["Global approx. xp reward"] = "Approssimativi PE globali"
L["Global approx. xp reward per hour"] = "Approssimativi PE globali per ora"
L["HallComander Quick Mission Completion"] = "OrderHallCommander Completamento rapido"
L["If %1$s is lower than this, then we try to achieve at least %2$s without going over 100%%. Ignored for elite missions."] = "Se %1$s è inferiore a questa, allora cerchiamo di raggiungere almeno %2$s senza superare il 100%%. Viene ignorato nelle missioni elite."
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
L[ [=[Launch the first filled mission with at least one locked follower.
Keep %s pressed to actually launch, a simple click will only print mission name with its followers list]=] ] = [=[Launch the first filled mission with at least one locked follower.
Keep %s pressed to actually launch, a simple click will only print mission name with its followers list]=]
--Translation missing 
L[ [=[Launch the first filled mission with at least one locked follower.
Keep SHIFT pressed to actually launch, a simple click will only print mission name with its followers list]=] ] = [=[Launch the first filled mission with at least one locked follower.
Keep SHIFT pressed to actually launch, a simple click will only print mission name with its followers list]=]
L["Level"] = "Livello"
L["Lock all"] = "Riserva tutti"
L["Lock this follower"] = "Riserva questo seguace"
L["Locked follower are only used in this mission"] = "I seguaci riservati saranno usati solo in questa missione"
L["Make Order Hall Mission Panel movable"] = "Rendi spostabile il pannello missioni"
L["Makes sure that no troops will be killed"] = "Si accerta che nessuna truppa venga uccisa"
L["Max champions"] = "Campioni massimi"
L["Maximize xp gain"] = "Massimizza il guadagno di PE"
L["Mission duration reduced"] = "Durata missione ridotta"
L["Mission was capped due to total chance less than"] = "La percentuale di success è stata ridotta perché era comunque inferiore a"
L["Missions"] = "Missioni"
L["Never kill Troops"] = "Non uccidere mai le truppe"
L["No follower gained xp"] = "Nessun campione ha guaagnato PE"
L["No suitable missions. Have you reserved at least one follower?"] = "Nessuna missione valida. Hai riservato almeno un seguace?"
L["Not blacklisted"] = "Non blacklistata"
L["Nothing to report"] = "Niente da segnalare"
L["Notifies you when you have troops ready to be collected"] = "Notificami quando ho truppe pronte per essere raccolte"
L["Only accept missions with time improved"] = "Accetta solo missioni con bonus durata ridotta"
L["Only consider elite missions"] = "Visualizza solo missioni elite"
--Translation missing 
L["Only need %s instead of %s to start a mission from mission list"] = "Only need %s instead of %s to start a mission from mission list"
L["Only use champions even if troops are available"] = "Usa solo campioni anche se ci sono truppe disponibili"
--Translation missing 
L["Open configuration"] = "Open configuration"
L[ [=[OrderHallCommander overrides GarrisonCommander for Order Hall Management.
 You can revert to GarrisonCommander simply disabling OrderhallCommander.
If instead you like OrderHallCommander remember to add it to Curse client and keep it updated]=] ] = [=[OrderHallCommander sostituisce l'interfaccia di GarrisonComamnder per le missioni di classe
Disabilitalo se preferisci GarrisonCommander.
Se invece ti piace, aggiungilo al client Curse e tienilo aggiornato]=]
L["Original method"] = "Metodo originale"
L["Position is not saved on logout"] = "La posizione non è salvata alla disconnessione"
L["Prefer high durability"] = "Alta durabilità preferita"
L["Quick start first mission"] = "Avvio rapido prima missione"
L["Remove no champions warning"] = "Rimuovi avviso campioni insufficienti"
--Translation missing 
L["Restart tutorial from beginning"] = "Restart tutorial from beginning"
--Translation missing 
L["Resume tutorial"] = "Resume tutorial"
L["Resurrect troops effect"] = "Resurrezione truppe possibile"
L["Reward type"] = "Tipo ricompensa"
--Translation missing 
L["Sets all switches to a very permissive setup. Very similar to 1.4.4"] = "Sets all switches to a very permissive setup. Very similar to 1.4.4"
--Translation missing 
L["Show tutorial"] = "Show tutorial"
L["Show/hide OrderHallCommander mission menu"] = "Mostra/ascondi il menu di missione di OrderHallCommander"
L["Sort missions by:"] = "Ordina le missioni per:"
L["Started with "] = "Avviata con"
L["Success Chance"] = "Percentuale di successo"
L["Troop ready alert"] = "Avviso truppe pronte"
L["Unable to fill missions, raise \"%s\""] = "Non riesco ad assegnare seguaci alle mission, incrementa \"%s\""
L["Unable to fill missions. Check your switches"] = "Impossibile riempire le missioni. Controlla le opzioni scelte"
L["Unable to start mission, aborting"] = "Non riesco a far partire la missione, rinuncio"
L["Unlock all"] = "Libera tutti"
L["Unlock this follower"] = "Libera questo seguace"
L["Unlocks all follower and slots at once"] = "Libera tutti i seguaci riservati e gli slot vietati in un colpo solo"
--Translation missing 
L["Unsafe mission start"] = "Unsafe mission start"
L["Upgrading to |cff00ff00%d|r"] = "Incremento a |cff00ff00%d|r"
L["URL Copy"] = "Copia la URL"
L["Use at most this many champions"] = "Usa al massimo questo numero di campioni"
L["Use combat ally"] = "Usa l'alleato"
L["Use this slot"] = "Usa questo slot"
L["Uses troops with the highest durability instead of the ones with the lowest"] = "Sceglie la truppe con durabilità residua piu' alta anziché quelle con durabilità residua piu' bassa"
L["When no free followers are available shows empty follower"] = "Quando non ci sono seguaci disponibili mostra le caselle vuote"
L["When we cant achieve the requested %1$s, we try to reach at least this one without (if possible) going over 100%%"] = "Se non è possibile raggiungere la percentuale di successo globale, si cerca di raggiungere almeno questa senza superare il 100%"
L["Would start with "] = "Avvierei con"
L["You are wasting |cffff0000%d|cffffd200 point(s)!!!"] = "Stai sprecando |cffff0000%d|cffffd200 punti!!"
--Translation missing 
L[ [=[You need to close and restart World of Warcraft in order to update this version of OrderHallCommander.
Simply reloading UI is not enough]=] ] = [=[You need to close and restart World of Warcraft in order to update this version of OrderHallCommander.
Simply reloading UI is not enough]=]
--Translation missing 
L["You now need to press both %s and %s to start mission"] = "You now need to press both %s and %s to start mission"

-- Tutorial
--Translation missing 
L[ [=[%1$s and %2$s switches work together to customize how you want your mission filled

The value you set for %1$s (right now %3$s%%) is the minimum acceptable chance for attempting to achieve bonus while the value to set for %2$s (right now %4$s%%) is the chance you want achieve when you are forfaiting bonus (due to not enough powerful followers)]=] ] = [=[%1$s and %2$s switches work together to customize how you want your mission filled

The value you set for %1$s (right now %3$s%%) is the minimum acceptable chance for attempting to achieve bonus while the value to set for %2$s (right now %4$s%%) is the chance you want achieve when you are forfaiting bonus (due to not enough powerful followers)]=]
--Translation missing 
L[ [=[A requested window is not open
Tutorial will resume as soon as possible]=] ] = [=[A requested window is not open
Tutorial will resume as soon as possible]=]
--Translation missing 
L[ [=[Clicking a party button will assign its followers to the current mission.
Use it to verify OHC calculated chance with Blizzard one.
If they differs please take a screenshot and open a ticket :).]=] ] = [=[Clicking a party button will assign its followers to the current mission.
Use it to verify OHC calculated chance with Blizzard one.
If they differs please take a screenshot and open a ticket :).]=]
--Translation missing 
L[ [=[Equipment and upgrades are listed here as clickable buttons.
Due to an issue with Blizzard Taint system, drag and drop from bags raise an error.
if you drag and drop an item from a bag, you receive an error.
In order to assign equipments which are not listed (I update the list often but sometimes Blizzard is faster), you can right click the item in the bag and the left click the follower.
This way you dont receive any error]=] ] = [=[Equipment and upgrades are listed here as clickable buttons.
Due to an issue with Blizzard Taint system, drag and drop from bags raise an error.
if you drag and drop an item from a bag, you receive an error.
In order to assign equipments which are not listed (I update the list often but sometimes Blizzard is faster), you can right click the item in the bag and the left click the follower.
This way you dont receive any error]=]
--Translation missing 
L[ [=[Equipment and upgrades are listed here as clickable buttons.
Due to an issue with Blizzard Taint system, if you drag and drop an item from a bag, you receive an error.
In order to assign equipment which are not listed (I updated the list often but sometimes Blizzard is faster), you can right click the item in the bag and the left click the follower.
This way you dont receive any error]=] ] = [=[Equipment and upgrades are listed here as clickable buttons.
Due to an issue with Blizzard Taint system, if you drag and drop an item from a bag, you receive an error.
In order to assign equipment which are not listed (I updated the list often but sometimes Blizzard is faster), you can right click the item in the bag and the left click the follower.
This way you dont receive any error]=]
--Translation missing 
L[ [=[For example, let's say a mission can reach 95%%, 130%% and 180%% success chance.
If %1$s is set to 170%%, the 180%% one will be choosen.
If %1$s is set to 200%% OHC will try to find the nearest to 100%% respecting %2$s setting
If for example %2$s is set to 100%%, then the 130%% one will be choosen, but if %2$s is set to 90%% then the 95%% one will be choosen]=] ] = [=[For example, let's say a mission can reach 95%%, 130%% and 180%% success chance.
If %1$s is set to 170%%, the 180%% one will be choosen.
If %1$s is set to 200%% OHC will try to find the nearest to 100%% respecting %2$s setting
If for example %2$s is set to 100%%, then the 130%% one will be choosen, but if %2$s is set to 90%% then the 95%% one will be choosen]=]
--Translation missing 
L["If instead you just want to always see the best available mission just set %1$s to 100%% and %2$s to 0%%"] = "If instead you just want to always see the best available mission just set %1$s to 100%% and %2$s to 0%%"
--Translation missing 
L[ [=[If you dont understand why OHC choosed a setup for a mission, you can request a full analysis.
Analyze party will show all the possible combinations and how OHC evaluated them]=] ] = [=[If you dont understand why OHC choosed a setup for a mission, you can request a full analysis.
Analyze party will show all the possible combinations and how OHC evaluated them]=]
--Translation missing 
L["Prefer high durability"] = "Prefer high durability"
--Translation missing 
L["Restart the tutorial"] = "Restart the tutorial"
--Translation missing 
L[ [=[Slots (non the follower in it but just the slot) can be banned.
When you ban a slot, that slot will not be filled for that mission.
Exploiting the fact that troops are always in the leftmost slot(s) you can achieve a nice degree of custom tailoring, reducing the overall number of followers used for a mission]=] ] = [=[Slots (non the follower in it but just the slot) can be banned.
When you ban a slot, that slot will not be filled for that mission.
Exploiting the fact that troops are always in the leftmost slot(s) you can achieve a nice degree of custom tailoring, reducing the overall number of followers used for a mission]=]
--Translation missing 
L["Terminate the tutorial. You can resume it anytime clicking on the info icon in the side menu"] = "Terminate the tutorial. You can resume it anytime clicking on the info icon in the side menu"
--Translation missing 
L["Thank you for reading this, enjoy %s"] = "Thank you for reading this, enjoy %s"
--Translation missing 
L["There are %d tutorial step you didnt read"] = "There are %d tutorial step you didnt read"
--Translation missing 
L[ [=[Usually OrderHallCOmmander tries to use troops with the lowest durability in order to let you enque new troops request as soon as possible.
Checking %1$s reverse it and OrderHallCOmmander will choose for each mission troops with the highest possible durability]=] ] = [=[Usually OrderHallCOmmander tries to use troops with the lowest durability in order to let you enque new troops request as soon as possible.
Checking %1$s reverse it and OrderHallCOmmander will choose for each mission troops with the highest possible durability]=]
--Translation missing 
L[ [=[Welcome to a new release of OrderHallCommander
Please follow this short tutorial to discover all new functionalities.
You will not regret it]=] ] = [=[Welcome to a new release of OrderHallCommander
Please follow this short tutorial to discover all new functionalities.
You will not regret it]=]
--Translation missing 
L[ [=[With %1$s you ask to always counter the Hazard kill troop.
This means that OHC will try to counter it OR use a troop with just one durability left.
The target for this switch is to avoid wasting durability point, NOT to avoid troops' death.]=] ] = [=[With %1$s you ask to always counter the Hazard kill troop.
This means that OHC will try to counter it OR use a troop with just one durability left.
The target for this switch is to avoid wasting durability point, NOT to avoid troops' death.]=]
--Translation missing 
L[ [=[With %2$s you ask to never let a troop die.
This not only implies %1$s and %3$s, but force OHC to never send to mission a troop which will die.
The target for this switch is to totally avoid killing troops, even it for this we cant fill the party]=] ] = [=[With %2$s you ask to never let a troop die.
This not only implies %1$s and %3$s, but force OHC to never send to mission a troop which will die.
The target for this switch is to totally avoid killing troops, even it for this we cant fill the party]=]
--Translation missing 
L[ [=[You can blacklist missions right clicking mission button.
Since 1.5.1 you can start a mission witout passing from mission page shift-clicking the mission button.
Be sure you liked the party because no confirmation is asked]=] ] = [=[You can blacklist missions right clicking mission button.
Since 1.5.1 you can start a mission witout passing from mission page shift-clicking the mission button.
Be sure you liked the party because no confirmation is asked]=]
--Translation missing 
L["You can choose not to use a troop type clicking its icon"] = "You can choose not to use a troop type clicking its icon"
--Translation missing 
L[ [=[You can choose to limit how much champions are sent together.
Right now OHC is not using more than %3$s champions in the same mission-

Note that %2$s overrides it.]=] ] = [=[You can choose to limit how much champions are sent together.
Right now OHC is not using more than %3$s champions in the same mission-

Note that %2$s overrides it.]=]

return
end
L=l:NewLocale(me,"koKR")
if (L) then
L["%1$d%% lower than %2$d%%. Lower %s"] = "%2$d%%보다 %1$d%% 낮습니다. %3$s 낮습니다"
L["%s for a wowhead link popup"] = "%s - wowhead 링크 팝업"
L["%s start the mission without even opening the mission page. No question asked"] = "%s - 임무 페이지를 열지 않고 임무를 시작합니다. 아무것도 묻지 않습니다"
L["%s starts missions"] = "%s - 임무 시작"
--Translation missing 
L["%s to actually start mission"] = "%s to actually start mission"
L["%s to blacklist"] = "차단하려면 %s"
L["%s to remove from blacklist"] = "차단목록에서 제거하려면 %s"
L[ [=[%s, please review the tutorial
(Click the icon to dismiss this message and start the tutorial)]=] ] = [=[%s님, 설명서를 살펴봐주세요
(아이콘을 클릭하면 이 메시지를 닫고 설명서를 시작합니다)]=]
L["%s, please review the tutorial\\n(Click the icon to dismiss this message)"] = [=[%s님, 설명서를 살펴봐주세요
(이 메시지를 닫으려면 아이콘을 클릭하세요)]=]
L["Allow to start a mission directly from the mission list page (no single mission page shown)"] = "임무 목록 페이지에서 임무를 바로 시작할 수 있도록 허용합니다 (단일 임무 페이지가 표시되지 않습니다)"
L["Always counter increased resource cost"] = "자원 비용 증가 항상 대응"
L["Always counter increased time"] = "소요 시간 증가 항상 대응"
L["Always counter kill troops (ignored if we can only use troops with just 1 durability left)"] = "병력 죽이기 항상 대응 (활력이 1만 남은 병력만 있을 땐 무시)"
L["Always counter no bonus loot threat"] = "추가 전리품 획득 불가 항상 대응"
L["Artifact shown value is the base value without considering knowledge multiplier"] = "표시된 유물력 수치는 유물 지식 레벨을 고려하지 않은 기본 수치입니다"
L["Attempting %s"] = "%s 시도 중"
L["Base Chance"] = "기본 성공 확률"
L["Better parties available in next future"] = "다음 시간 후엔 더 나은 파티가 가능합니다"
L["Blacklisted"] = "차단됨"
L["Blacklisted missions are ignored in Mission Control"] = "차단된 임무는 임무 제어에서 무시됩니다"
L["Bonus Chance"] = "보너스 주사위"
L["Building Final report"] = "최종 보고서 작성"
L["but using troops with just one durability left"] = "활력이 하나만 남은 병력은 사용합니다"
L["Capped %1$s. Spend at least %2$d of them"] = "%1$s에 도달했습니다. 최소 %2$d|1을;를; 소모하세요"
L["Changes the sort order of missions in Mission panel"] = "임무 창 내 임무의 정렬 방법을 변경합니다"
L["Combat ally is proposed for missions so you can consider unassigning him"] = "전투 동료가 임무에 제안되며 전투 동료 지정 해제를 해야 할 수 있습니다"
L["Complete all missions without confirmation"] = "확인 없이 모든 임무를 완료합니다"
L["Configuration for mission party builder"] = "임무 파티 구성 설정"
L["Cost reduced"] = "비용 감소"
L["Could not fulfill mission, aborting"] = "임무를 완료할 수 없습니다, 취소합니다"
L["Counter kill Troops"] = "병력 죽이기 대응"
--Translation missing 
L["Customization options (non mission related)"] = "Customization options (non mission related)"
L["Disables warning: "] = "경고 비활성: "
L["Dont use this slot"] = "이 칸 사용하지 않기"
L["Don't use troops"] = "병력 사용하지 않기"
L["Duration reduced"] = "소요 시간 감소"
L["Duration Time"] = "소요 시간"
--Translation missing 
L["Elite: Prefer overcap"] = "Elite: Prefer overcap"
L["Elites mission mode"] = "정예 임무 모드"
L["Empty missions sorted as last"] = "빈 임무를 마지막에 정렬"
L["Empty or 0% success mission are sorted as last. Does not apply to \"original\" method"] = "비었거나 성공률이 0%인 임무가 마지막에 정렬됩니다. \"원래의 방법\"에는 적용되지 않습니다"
L["Equipped by following champions:"] = "다음 용사가 장착함:"
L["Expiration Time"] = "만료 시간"
L["Favours leveling follower for xp missions"] = "레벨 육성 중인 추종자를 경험치 임무에 우선 지정합니다"
--Translation missing 
L["For elite missions, tries hard to not go under 100% even at cost of overcapping"] = "For elite missions, tries hard to not go under 100% even at cost of overcapping"
L["General"] = "일반"
L["Global approx. xp reward"] = "총 예상 경험치 보상"
L["Global approx. xp reward per hour"] = "시간 당 예상 경험치 보상"
L["HallComander Quick Mission Completion"] = "HallCommander 빠른 임무 완료"
L["If %1$s is lower than this, then we try to achieve at least %2$s without going over 100%%. Ignored for elite missions."] = "%1$s|1이;가; 이 값보다 낮으면 100%%를 넘기지 않고 최소 %2$s|1을;를; 달성하도록 시도합니다. 정예 임무는 무시합니다."
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
L[ [=[Launch the first filled mission with at least one locked follower.
Keep %s pressed to actually launch, a simple click will only print mission name with its followers list]=] ] = [=[최소 한명의 추종자가 고정된 첫번째로 채워진 임무를 시작합니다.
%s|1을;를; 누르고 있어야 실제로 시작하며, 단순히 클릭만 하면 임무 이름과 배정된 추종자 명단만 출력합니다]=]
--Translation missing 
L[ [=[Launch the first filled mission with at least one locked follower.
Keep SHIFT pressed to actually launch, a simple click will only print mission name with its followers list]=] ] = [=[Launch the first filled mission with at least one locked follower.
Keep SHIFT pressed to actually launch, a simple click will only print mission name with its followers list]=]
L["Level"] = "레벨"
L["Lock all"] = "모두 고정"
L["Lock this follower"] = "이 추종자 고정"
L["Locked follower are only used in this mission"] = "고정된 추종자는 이 임무에서만 사용됩니다"
L["Make Order Hall Mission Panel movable"] = "직업 전당 임무 창 이동 가능 설정"
L["Makes sure that no troops will be killed"] = "병력이 죽지 않게 합니다"
L["Max champions"] = "최대 용사"
L["Maximize xp gain"] = "경험치 획득 최대화"
L["Mission duration reduced"] = "임무 소요 시간 감소"
L["Mission was capped due to total chance less than"] = "전체 확률이 다음보다 낮아서 임무가 제한되었습니다:"
L["Missions"] = "임무"
L["Never kill Troops"] = "병력 죽이지 않기"
L["No follower gained xp"] = "경험치를 획득한 추종자 없음"
L["No suitable missions. Have you reserved at least one follower?"] = "적절한 임무가 없습니다. 최소 한명의 추종자를 예약했나요?"
L["Not blacklisted"] = "차단되지 않음"
L["Nothing to report"] = "보고할 내용 없음"
L["Notifies you when you have troops ready to be collected"] = "병력을 회수할 준비가 되면 당신에게 알립니다"
L["Only accept missions with time improved"] = "소요 시간이 감소한 임무만 수락합니다"
L["Only consider elite missions"] = "정예 임무만 고려"
--Translation missing 
L["Only need %s instead of %s to start a mission from mission list"] = "Only need %s instead of %s to start a mission from mission list"
L["Only use champions even if troops are available"] = "병력을 사용가능 해도 용사만 사용합니다"
L["Open configuration"] = "설정 열기"
L[ [=[OrderHallCommander overrides GarrisonCommander for Order Hall Management.
 You can revert to GarrisonCommander simply disabling OrderhallCommander.
If instead you like OrderHallCommander remember to add it to Curse client and keep it updated]=] ] = [=[OrderHallCommander는 직업 전당 관리에 GarrisonCommander보다 우선됩니다.
OrderHallCommander를 비활성하면 GarrisonCommander로 전환할 수 있습니다.
대신 당신이 OrderHallCommander를 좋아한다면 Curse 클라이언트에 추가하고 업데이트를 유지하세요]=]
L["Original method"] = "원래의 방법"
L["Position is not saved on logout"] = "접속 종료시 위치는 저장되지 않습니다"
L["Prefer high durability"] = "높은 활력 선호"
L["Quick start first mission"] = "첫번째 임무 빠른 시작"
L["Remove no champions warning"] = "용사 없음 경고 제거"
L["Restart tutorial from beginning"] = "처음부터 설명서 다시 시작"
L["Resume tutorial"] = "설명서 이어서 시작"
L["Resurrect troops effect"] = "병력 부활 효과"
L["Reward type"] = "보상 유형"
L["Sets all switches to a very permissive setup. Very similar to 1.4.4"] = "모든 전환 설정을 허용적인 구성으로 설정"
L["Show tutorial"] = "살명서 보기"
L["Show/hide OrderHallCommander mission menu"] = "OrderHallCommander 임무 메뉴 표시/숨기기"
L["Sort missions by:"] = "임무 정렬 방법:"
L["Started with "] = "다음과 함께 시작:"
L["Success Chance"] = "성공 확률"
L["Troop ready alert"] = "병력 준비 경보"
L["Unable to fill missions, raise \"%s\""] = "임무를 채울 수 없습니다, \"%s\"|1을;를; 늘리세요"
L["Unable to fill missions. Check your switches"] = "임무를 채울 수 없습니다. 설정을 확인하세요"
L["Unable to start mission, aborting"] = "임무를 시작할 수 없습니다, 취소합니다"
L["Unlock all"] = "모두 고정 해제"
L["Unlock this follower"] = "이 추종자 고정 해제"
L["Unlocks all follower and slots at once"] = "모든 추종자와 칸을 한번에 고정 해제"
--Translation missing 
L["Unsafe mission start"] = "Unsafe mission start"
L["Upgrading to |cff00ff00%d|r"] = "|cff00ff00%d|r|1으로;로; 향상시키기"
L["URL Copy"] = "URL 복사"
L["Use at most this many champions"] = "되도록 이 숫자의 용사를 사용합니다"
L["Use combat ally"] = "전투 동료 사용"
L["Use this slot"] = "이 칸 사용"
L["Uses troops with the highest durability instead of the ones with the lowest"] = "가장 낮은 활력을 가진 병력 대신 가장 높은 활력을 가진 병력을 사용합니다"
L["When no free followers are available shows empty follower"] = "사용 가능한 추종자가 없으면 추종자 칸을 빈 상태로 표시합니다"
L["When we cant achieve the requested %1$s, we try to reach at least this one without (if possible) going over 100%%"] = "요청된 %1$s|1을;를; 달성하지 못했을 때 (가능하다면) 100%%를 넘기지 않고 최소한 이 값에 근접하도록 시도합니다"
L["Would start with "] = "다음과 같이 시작할 예정:"
L["You are wasting |cffff0000%d|cffffd200 point(s)!!!"] = "|cffff0000%d|cffffd200점을 낭비하고 있습니다!!!"
L[ [=[You need to close and restart World of Warcraft in order to update this version of OrderHallCommander.
Simply reloading UI is not enough]=] ] = [=[이 버전의 OrderHallCommander를 업데이트하기 위해 월드 오브 워크래프트를 종료한 후 다시 시작해야 합니다.
UI를 다시 불러오는 것으로 충분하지 않습니다]=]
L["You now need to press both %s and %s to start mission"] = "임무를 시작하려면 %s|1과;와; %s|1을;를; 같이 눌러야 합니다"

-- Tutorial
L[ [=[%1$s and %2$s switches work together to customize how you want your mission filled

The value you set for %1$s (right now %3$s%%) is the minimum acceptable chance for attempting to achieve bonus while the value to set for %2$s (right now %4$s%%) is the chance you want achieve when you are forfaiting bonus (due to not enough powerful followers)]=] ] = [=[당신이 원하는 임무를 채우는 방법을 사용자 설정할 수 있도록 %1$s|1과;와; %2$s|1은;는; 함께 작동합니다

%1$s에 설정된 추가 전리품을 얻는 데 시도하는 최소 허용 확률(현재 %3$s%%)을 강력한 추종자가 충분하지 않아서 달성하지 못하면 %2$s(현재 %4$s%%)에 맞춥니다]=]
L[ [=[A requested window is not open
Tutorial will resume as soon as possible]=] ] = [=[요청된 창이 열리지 않았습니다
가능하다면 설명서가 다시 시작됩니다]=]
L[ [=[Clicking a party button will assign its followers to the current mission.
Use it to verify OHC calculated chance with Blizzard one.
If they differs please take a screenshot and open a ticket :).]=] ] = "파티 버튼을 클릭하면 현재 임무에 추종자를 지정합니다. 사용하면 OHC가 블리자드의 확률로 성공률을 계산하도록 허용합니다. 차이가 있다면 스크린샷을 찍고 티켓을 열어주세요 :)."
L[ [=[Equipment and upgrades are listed here as clickable buttons.
Due to an issue with Blizzard Taint system, drag and drop from bags raise an error.
if you drag and drop an item from a bag, you receive an error.
In order to assign equipments which are not listed (I update the list often but sometimes Blizzard is faster), you can right click the item in the bag and the left click the follower.
This way you dont receive any error]=] ] = [=[추종자 장비와 레벨 아이템은 여기에 클릭할 수 있는 버튼으로 나열됩니다.
블리자드 코드 보호 체계에 의해 가방에서 끌어다 놓으면 오류가 발생됩니다.
가방에서 아이템을 끌어다 놓으면 오류가 발생합니다.
목록에 없는 장비를 지정하려면 가방에서 아이템을 오른쪽 클릭한 후 추종자를 클릭하세요. (목록을 종종 업데이트하지만 가끔 블리자드가 더 빠릅니다)
이 방법은 오류를 발생하지 않습니다]=]
L[ [=[Equipment and upgrades are listed here as clickable buttons.
Due to an issue with Blizzard Taint system, if you drag and drop an item from a bag, you receive an error.
In order to assign equipment which are not listed (I updated the list often but sometimes Blizzard is faster), you can right click the item in the bag and the left click the follower.
This way you dont receive any error]=] ] = [=[장비와 강화 아이템을 클릭할 수 있는 버튼 목록이 이곳에 나타납니다.
블리자드 코드 보호 체계때문에 아이템을 가방에서 끌어다 놓으면 오류가 발생합니다.
목록에 나타나지 않는 장비를 지정하려면 가방에 있는 아이템을 오른쪽 클릭한 후 추종자를 왼쪽 클릭하세요.(종종 목록을 업데이트하지만 가끔 블리자드가 더 빠릅니다)
이 방법으로는 오류가 발생하지 않습니다]=]
L[ [=[For example, let's say a mission can reach 95%%, 130%% and 180%% success chance.
If %1$s is set to 170%%, the 180%% one will be choosen.
If %1$s is set to 200%% OHC will try to find the nearest to 100%% respecting %2$s setting
If for example %2$s is set to 100%%, then the 130%% one will be choosen, but if %2$s is set to 90%% then the 95%% one will be choosen]=] ] = [=[예를 들어, 성공 확률이 95%%, 130%% 그리고 180%%에 도달할 수 있는 임무가 있다고 가정해봅시다.
%1$s|1이;가; 170%%로 설정되어 있다면 180%%의 임무가 선택됩니다.
%1$s|1이;가; 200%%로 설정되어 있다면 OHC는 %2$s 설정에 의하여 100%%에 가장 근접한 임무를 찾습니다
%2$s|1이;가; 100%%로 설정되어 있다고 가정한다면 130%%의 임무가 선택되지만, %2$s|1이;가; 90%%로 설정되어 있다면 95%%의 임무가 선택됩니다]=]
L["If instead you just want to always see the best available mission just set %1$s to 100%% and %2$s to 0%%"] = "사용 가능 한 임무를 항상 가장 많이 보고 싶다면 %1$s|1을;를; 100%%로 %2$s|1을;를; 0%%로 설정하세요"
L[ [=[If you dont understand why OHC choosed a setup for a mission, you can request a full analysis.
Analyze party will show all the possible combinations and how OHC evaluated them]=] ] = [=[OHC가 선택한 임무 구성을 이해할 수 없다면 전체 분석을 요청할 수 있습니다.
파티 분석은 모든 가능한 조합을 표시하고 OHC의 연산 방법을 보여줍니다]=]
--Translation missing 
L["Prefer high durability"] = "Prefer high durability"
L["Restart the tutorial"] = "설명서 재시작"
L[ [=[Slots (non the follower in it but just the slot) can be banned.
When you ban a slot, that slot will not be filled for that mission.
Exploiting the fact that troops are always in the leftmost slot(s) you can achieve a nice degree of custom tailoring, reducing the overall number of followers used for a mission]=] ] = [=[칸(속해 있는 추종자가 아닌 그냥 칸)이 제외되었습니다.
제외된 칸은 그 임무에서 채워지지 않습니다.
병력은 항상 가장 왼쪽 칸에 있다는 사실을 이용하면 임무에 사용하는 추종자의 전체 숫자를 줄일 수 있습니다]=]
L["Terminate the tutorial. You can resume it anytime clicking on the info icon in the side menu"] = "설명서를 종료합니다. 가장자리 메뉴에 있는 정보 아이콘을 클릭하면 언제든 다시 진행할 수 있습니다"
L["Thank you for reading this, enjoy %s"] = "읽어주셔서 감사합니다, 즐거운 %s 되세요"
--Translation missing 
L["There are %d tutorial step you didnt read"] = "There are %d tutorial step you didnt read"
L[ [=[Usually OrderHallCOmmander tries to use troops with the lowest durability in order to let you enque new troops request as soon as possible.
Checking %1$s reverse it and OrderHallCOmmander will choose for each mission troops with the highest possible durability]=] ] = [=[OrderHallCommander는 일반적으로 가능한 한 새로운 병력을 요청할 수 있도록 가장 낮은 활력의 병력을 사용합니다.
%1$s|1을;를; 선택하면 반대로 OrderHallCommander가 각 임무에 가장 높은 활력의 병력을 선택합니다]=]
L[ [=[Welcome to a new release of OrderHallCommander
Please follow this short tutorial to discover all new functionalities.
You will not regret it]=] ] = [=[OrderHallCommander의 새로운 배포 버전에 오신 걸 환영합니다
모든 새로운 기능에 대해 알아 보기 위해 간단한 설명서를 따라주세요.
후회하지 않을겁니다]=]
L[ [=[With %1$s you ask to always counter the Hazard kill troop.
This means that OHC will try to counter it OR use a troop with just one durability left.
The target for this switch is to avoid wasting durability point, NOT to avoid troops' death.]=] ] = [=[%1$s|1을;를; 사용하면 병력을 죽이는 위협 요소를 항상 대응합니다.
OHC가 위협 요소를 대응하거나 활력이 하나 남은 병력만 사용하는 걸 의미합니다.
이 설정의 목표는 병력의 죽음을 피하는 게 아닌 활력의 낭비를 피하는 것입니다.]=]
L[ [=[With %2$s you ask to never let a troop die.
This not only implies %1$s and %3$s, but force OHC to never send to mission a troop which will die.
The target for this switch is to totally avoid killing troops, even it for this we cant fill the party]=] ] = [=[%2$s|1을;를; 사용하면 병력이 죽지 않도록 보호합니다.
%1$s|1과;와; %3$s|1을;를; 의미하는 것만은 아니며, OHC가 임무를 보내면 죽게 될 병력은 절대 보내지 않도록 강제합니다.
이 설정의 목적은 이것때문에 파티를 채우지 못하더라도 완벽히 병력을 죽이지 않기 위함입니다.]=]
L[ [=[You can blacklist missions right clicking mission button.
Since 1.5.1 you can start a mission witout passing from mission page shift-clicking the mission button.
Be sure you liked the party because no confirmation is asked]=] ] = [=[임무 버튼을 오른쪽 클릭하여 임무를 차단할 수 있습니다.
1.5.1 버전부터 임무 버튼을 Shift-클릭하여 임무 페이지를 보지 않고 임무를 시작할 수 있습니다.
동의를 구하지 않기 때문에 파티가 올바른지 확인해주세요]=]
L["You can choose not to use a troop type clicking its icon"] = "해당 아이콘을 클릭하여 병력을 사용하지 않도록 선택할 수 있습니다"
L[ [=[You can choose to limit how much champions are sent together.
Right now OHC is not using more than %3$s champions in the same mission-

Note that %2$s overrides it.]=] ] = [=[몇 명의 용사를 함께 임무에 보낼 지 숫자를 선택할 수 있습니다.
OHC는 이제 같은 임무에 %3$s명을 초과하여 용사를 사용하지 않습니다-

%2$s|1이;가; 우선됩니다.]=]

return
end
L=l:NewLocale(me,"esMX")
if (L) then
--Translation missing 
L["%1$d%% lower than %2$d%%. Lower %s"] = "%1$d%% lower than %2$d%%. Lower %s"
--Translation missing 
L["%s for a wowhead link popup"] = "%s for a wowhead link popup"
--Translation missing 
L["%s start the mission without even opening the mission page. No question asked"] = "%s start the mission without even opening the mission page. No question asked"
--Translation missing 
L["%s starts missions"] = "%s starts missions"
--Translation missing 
L["%s to actually start mission"] = "%s to actually start mission"
--Translation missing 
L["%s to blacklist"] = "%s to blacklist"
--Translation missing 
L["%s to remove from blacklist"] = "%s to remove from blacklist"
--Translation missing 
L[ [=[%s, please review the tutorial
(Click the icon to dismiss this message and start the tutorial)]=] ] = [=[%s, please review the tutorial
(Click the icon to dismiss this message and start the tutorial)]=]
--Translation missing 
L["%s, please review the tutorial\\n(Click the icon to dismiss this message)"] = "%s, please review the tutorial\\n(Click the icon to dismiss this message)"
--Translation missing 
L["Allow to start a mission directly from the mission list page (no single mission page shown)"] = "Allow to start a mission directly from the mission list page (no single mission page shown)"
L["Always counter increased resource cost"] = "Siempre contrarreste el mayor costo de recursos"
L["Always counter increased time"] = "Siempre contrarreste el tiempo incrementado"
L["Always counter kill troops (ignored if we can only use troops with just 1 durability left)"] = "Siempre contra las tropas de matar (ignorado si sólo podemos utilizar tropas con sólo 1 durabilidad a la izquierda)"
--Translation missing 
L["Always counter no bonus loot threat"] = "Always counter no bonus loot threat"
--Translation missing 
L["Artifact shown value is the base value without considering knowledge multiplier"] = "Artifact shown value is the base value without considering knowledge multiplier"
--Translation missing 
L["Attempting %s"] = "Attempting %s"
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
L["Could not fulfill mission, aborting"] = "Could not fulfill mission, aborting"
--Translation missing 
L["Counter kill Troops"] = "Counter kill Troops"
--Translation missing 
L["Customization options (non mission related)"] = "Customization options (non mission related)"
--Translation missing 
L["Disables warning: "] = "Disables warning: "
--Translation missing 
L["Dont use this slot"] = "Dont use this slot"
--Translation missing 
L["Don't use troops"] = "Don't use troops"
L["Duration reduced"] = "Duración reducida"
L["Duration Time"] = "Duración"
--Translation missing 
L["Elite: Prefer overcap"] = "Elite: Prefer overcap"
--Translation missing 
L["Elites mission mode"] = "Elites mission mode"
--Translation missing 
L["Empty missions sorted as last"] = "Empty missions sorted as last"
--Translation missing 
L["Empty or 0% success mission are sorted as last. Does not apply to \"original\" method"] = "Empty or 0% success mission are sorted as last. Does not apply to \"original\" method"
--Translation missing 
L["Equipped by following champions:"] = "Equipped by following champions:"
L["Expiration Time"] = "Tiempo de expiración"
L["Favours leveling follower for xp missions"] = "Favors nivelando seguidor para las misiones xp"
--Translation missing 
L["For elite missions, tries hard to not go under 100% even at cost of overcapping"] = "For elite missions, tries hard to not go under 100% even at cost of overcapping"
L["General"] = true
L["Global approx. xp reward"] = "Global aprox. Recompensa xp"
--Translation missing 
L["Global approx. xp reward per hour"] = "Global approx. xp reward per hour"
L["HallComander Quick Mission Completion"] = "Conclusión de la misión rápida de HallComander"
--Translation missing 
L["If %1$s is lower than this, then we try to achieve at least %2$s without going over 100%%. Ignored for elite missions."] = "If %1$s is lower than this, then we try to achieve at least %2$s without going over 100%%. Ignored for elite missions."
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
L[ [=[Launch the first filled mission with at least one locked follower.
Keep %s pressed to actually launch, a simple click will only print mission name with its followers list]=] ] = [=[Launch the first filled mission with at least one locked follower.
Keep %s pressed to actually launch, a simple click will only print mission name with its followers list]=]
--Translation missing 
L[ [=[Launch the first filled mission with at least one locked follower.
Keep SHIFT pressed to actually launch, a simple click will only print mission name with its followers list]=] ] = [=[Launch the first filled mission with at least one locked follower.
Keep SHIFT pressed to actually launch, a simple click will only print mission name with its followers list]=]
L["Level"] = "Nivel"
--Translation missing 
L["Lock all"] = "Lock all"
--Translation missing 
L["Lock this follower"] = "Lock this follower"
--Translation missing 
L["Locked follower are only used in this mission"] = "Locked follower are only used in this mission"
L["Make Order Hall Mission Panel movable"] = "Hacer pedido Hall Misión Panel móvil"
--Translation missing 
L["Makes sure that no troops will be killed"] = "Makes sure that no troops will be killed"
--Translation missing 
L["Max champions"] = "Max champions"
L["Maximize xp gain"] = "Maximizar la ganancia de xp"
--Translation missing 
L["Mission duration reduced"] = "Mission duration reduced"
--Translation missing 
L["Mission was capped due to total chance less than"] = "Mission was capped due to total chance less than"
L["Missions"] = "Misiones"
--Translation missing 
L["Never kill Troops"] = "Never kill Troops"
L["No follower gained xp"] = "Ningún seguidor ganó xp"
--Translation missing 
L["No suitable missions. Have you reserved at least one follower?"] = "No suitable missions. Have you reserved at least one follower?"
--Translation missing 
L["Not blacklisted"] = "Not blacklisted"
L["Nothing to report"] = "Nada que reportar"
L["Notifies you when you have troops ready to be collected"] = "Notifica cuando hay tropas listas para ser recolectadas"
L["Only accept missions with time improved"] = "Sólo aceptar misiones mejoradas con el tiempo"
--Translation missing 
L["Only consider elite missions"] = "Only consider elite missions"
--Translation missing 
L["Only need %s instead of %s to start a mission from mission list"] = "Only need %s instead of %s to start a mission from mission list"
--Translation missing 
L["Only use champions even if troops are available"] = "Only use champions even if troops are available"
--Translation missing 
L["Open configuration"] = "Open configuration"
--Translation missing 
L[ [=[OrderHallCommander overrides GarrisonCommander for Order Hall Management.
 You can revert to GarrisonCommander simply disabling OrderhallCommander.
If instead you like OrderHallCommander remember to add it to Curse client and keep it updated]=] ] = [=[OrderHallCommander overrides GarrisonCommander for Order Hall Management.
 You can revert to GarrisonCommander simply disabling OrderhallCommander.
If instead you like OrderHallCommander remember to add it to Curse client and keep it updated]=]
L["Original method"] = "Método original"
L["Position is not saved on logout"] = "La posición no se guarda al cerrar la sesión"
--Translation missing 
L["Prefer high durability"] = "Prefer high durability"
--Translation missing 
L["Quick start first mission"] = "Quick start first mission"
--Translation missing 
L["Remove no champions warning"] = "Remove no champions warning"
--Translation missing 
L["Restart tutorial from beginning"] = "Restart tutorial from beginning"
--Translation missing 
L["Resume tutorial"] = "Resume tutorial"
L["Resurrect troops effect"] = "Efecto de las tropas de resurrección"
L["Reward type"] = "Tipo de recompensa"
--Translation missing 
L["Sets all switches to a very permissive setup. Very similar to 1.4.4"] = "Sets all switches to a very permissive setup. Very similar to 1.4.4"
--Translation missing 
L["Show tutorial"] = "Show tutorial"
L["Show/hide OrderHallCommander mission menu"] = "Mostrar / ocultar el menú de la misión OrderHallCommander"
L["Sort missions by:"] = "Ordenar misiones por:"
--Translation missing 
L["Started with "] = "Started with "
L["Success Chance"] = "Éxito"
L["Troop ready alert"] = "Alerta lista de tropas"
--Translation missing 
L["Unable to fill missions, raise \"%s\""] = "Unable to fill missions, raise \"%s\""
--Translation missing 
L["Unable to fill missions. Check your switches"] = "Unable to fill missions. Check your switches"
--Translation missing 
L["Unable to start mission, aborting"] = "Unable to start mission, aborting"
--Translation missing 
L["Unlock all"] = "Unlock all"
--Translation missing 
L["Unlock this follower"] = "Unlock this follower"
--Translation missing 
L["Unlocks all follower and slots at once"] = "Unlocks all follower and slots at once"
--Translation missing 
L["Unsafe mission start"] = "Unsafe mission start"
L["Upgrading to |cff00ff00%d|r"] = "Actualizando a | cff00ff00% d | r"
--Translation missing 
L["URL Copy"] = "URL Copy"
--Translation missing 
L["Use at most this many champions"] = "Use at most this many champions"
--Translation missing 
L["Use combat ally"] = "Use combat ally"
--Translation missing 
L["Use this slot"] = "Use this slot"
--Translation missing 
L["Uses troops with the highest durability instead of the ones with the lowest"] = "Uses troops with the highest durability instead of the ones with the lowest"
--Translation missing 
L["When no free followers are available shows empty follower"] = "When no free followers are available shows empty follower"
--Translation missing 
L["When we cant achieve the requested %1$s, we try to reach at least this one without (if possible) going over 100%%"] = "When we cant achieve the requested %1$s, we try to reach at least this one without (if possible) going over 100%%"
--Translation missing 
L["Would start with "] = "Would start with "
L["You are wasting |cffff0000%d|cffffd200 point(s)!!!"] = "Está perdiendo | cffff0000% d | cffffd200 punto (s)!"
--Translation missing 
L[ [=[You need to close and restart World of Warcraft in order to update this version of OrderHallCommander.
Simply reloading UI is not enough]=] ] = [=[You need to close and restart World of Warcraft in order to update this version of OrderHallCommander.
Simply reloading UI is not enough]=]
--Translation missing 
L["You now need to press both %s and %s to start mission"] = "You now need to press both %s and %s to start mission"

-- Tutorial
--Translation missing 
L[ [=[%1$s and %2$s switches work together to customize how you want your mission filled

The value you set for %1$s (right now %3$s%%) is the minimum acceptable chance for attempting to achieve bonus while the value to set for %2$s (right now %4$s%%) is the chance you want achieve when you are forfaiting bonus (due to not enough powerful followers)]=] ] = [=[%1$s and %2$s switches work together to customize how you want your mission filled

The value you set for %1$s (right now %3$s%%) is the minimum acceptable chance for attempting to achieve bonus while the value to set for %2$s (right now %4$s%%) is the chance you want achieve when you are forfaiting bonus (due to not enough powerful followers)]=]
--Translation missing 
L[ [=[A requested window is not open
Tutorial will resume as soon as possible]=] ] = [=[A requested window is not open
Tutorial will resume as soon as possible]=]
--Translation missing 
L[ [=[Clicking a party button will assign its followers to the current mission.
Use it to verify OHC calculated chance with Blizzard one.
If they differs please take a screenshot and open a ticket :).]=] ] = [=[Clicking a party button will assign its followers to the current mission.
Use it to verify OHC calculated chance with Blizzard one.
If they differs please take a screenshot and open a ticket :).]=]
--Translation missing 
L[ [=[Equipment and upgrades are listed here as clickable buttons.
Due to an issue with Blizzard Taint system, drag and drop from bags raise an error.
if you drag and drop an item from a bag, you receive an error.
In order to assign equipments which are not listed (I update the list often but sometimes Blizzard is faster), you can right click the item in the bag and the left click the follower.
This way you dont receive any error]=] ] = [=[Equipment and upgrades are listed here as clickable buttons.
Due to an issue with Blizzard Taint system, drag and drop from bags raise an error.
if you drag and drop an item from a bag, you receive an error.
In order to assign equipments which are not listed (I update the list often but sometimes Blizzard is faster), you can right click the item in the bag and the left click the follower.
This way you dont receive any error]=]
--Translation missing 
L[ [=[Equipment and upgrades are listed here as clickable buttons.
Due to an issue with Blizzard Taint system, if you drag and drop an item from a bag, you receive an error.
In order to assign equipment which are not listed (I updated the list often but sometimes Blizzard is faster), you can right click the item in the bag and the left click the follower.
This way you dont receive any error]=] ] = [=[Equipment and upgrades are listed here as clickable buttons.
Due to an issue with Blizzard Taint system, if you drag and drop an item from a bag, you receive an error.
In order to assign equipment which are not listed (I updated the list often but sometimes Blizzard is faster), you can right click the item in the bag and the left click the follower.
This way you dont receive any error]=]
--Translation missing 
L[ [=[For example, let's say a mission can reach 95%%, 130%% and 180%% success chance.
If %1$s is set to 170%%, the 180%% one will be choosen.
If %1$s is set to 200%% OHC will try to find the nearest to 100%% respecting %2$s setting
If for example %2$s is set to 100%%, then the 130%% one will be choosen, but if %2$s is set to 90%% then the 95%% one will be choosen]=] ] = [=[For example, let's say a mission can reach 95%%, 130%% and 180%% success chance.
If %1$s is set to 170%%, the 180%% one will be choosen.
If %1$s is set to 200%% OHC will try to find the nearest to 100%% respecting %2$s setting
If for example %2$s is set to 100%%, then the 130%% one will be choosen, but if %2$s is set to 90%% then the 95%% one will be choosen]=]
--Translation missing 
L["If instead you just want to always see the best available mission just set %1$s to 100%% and %2$s to 0%%"] = "If instead you just want to always see the best available mission just set %1$s to 100%% and %2$s to 0%%"
--Translation missing 
L[ [=[If you dont understand why OHC choosed a setup for a mission, you can request a full analysis.
Analyze party will show all the possible combinations and how OHC evaluated them]=] ] = [=[If you dont understand why OHC choosed a setup for a mission, you can request a full analysis.
Analyze party will show all the possible combinations and how OHC evaluated them]=]
--Translation missing 
L["Prefer high durability"] = "Prefer high durability"
--Translation missing 
L["Restart the tutorial"] = "Restart the tutorial"
--Translation missing 
L[ [=[Slots (non the follower in it but just the slot) can be banned.
When you ban a slot, that slot will not be filled for that mission.
Exploiting the fact that troops are always in the leftmost slot(s) you can achieve a nice degree of custom tailoring, reducing the overall number of followers used for a mission]=] ] = [=[Slots (non the follower in it but just the slot) can be banned.
When you ban a slot, that slot will not be filled for that mission.
Exploiting the fact that troops are always in the leftmost slot(s) you can achieve a nice degree of custom tailoring, reducing the overall number of followers used for a mission]=]
--Translation missing 
L["Terminate the tutorial. You can resume it anytime clicking on the info icon in the side menu"] = "Terminate the tutorial. You can resume it anytime clicking on the info icon in the side menu"
--Translation missing 
L["Thank you for reading this, enjoy %s"] = "Thank you for reading this, enjoy %s"
--Translation missing 
L["There are %d tutorial step you didnt read"] = "There are %d tutorial step you didnt read"
--Translation missing 
L[ [=[Usually OrderHallCOmmander tries to use troops with the lowest durability in order to let you enque new troops request as soon as possible.
Checking %1$s reverse it and OrderHallCOmmander will choose for each mission troops with the highest possible durability]=] ] = [=[Usually OrderHallCOmmander tries to use troops with the lowest durability in order to let you enque new troops request as soon as possible.
Checking %1$s reverse it and OrderHallCOmmander will choose for each mission troops with the highest possible durability]=]
--Translation missing 
L[ [=[Welcome to a new release of OrderHallCommander
Please follow this short tutorial to discover all new functionalities.
You will not regret it]=] ] = [=[Welcome to a new release of OrderHallCommander
Please follow this short tutorial to discover all new functionalities.
You will not regret it]=]
--Translation missing 
L[ [=[With %1$s you ask to always counter the Hazard kill troop.
This means that OHC will try to counter it OR use a troop with just one durability left.
The target for this switch is to avoid wasting durability point, NOT to avoid troops' death.]=] ] = [=[With %1$s you ask to always counter the Hazard kill troop.
This means that OHC will try to counter it OR use a troop with just one durability left.
The target for this switch is to avoid wasting durability point, NOT to avoid troops' death.]=]
--Translation missing 
L[ [=[With %2$s you ask to never let a troop die.
This not only implies %1$s and %3$s, but force OHC to never send to mission a troop which will die.
The target for this switch is to totally avoid killing troops, even it for this we cant fill the party]=] ] = [=[With %2$s you ask to never let a troop die.
This not only implies %1$s and %3$s, but force OHC to never send to mission a troop which will die.
The target for this switch is to totally avoid killing troops, even it for this we cant fill the party]=]
--Translation missing 
L[ [=[You can blacklist missions right clicking mission button.
Since 1.5.1 you can start a mission witout passing from mission page shift-clicking the mission button.
Be sure you liked the party because no confirmation is asked]=] ] = [=[You can blacklist missions right clicking mission button.
Since 1.5.1 you can start a mission witout passing from mission page shift-clicking the mission button.
Be sure you liked the party because no confirmation is asked]=]
--Translation missing 
L["You can choose not to use a troop type clicking its icon"] = "You can choose not to use a troop type clicking its icon"
--Translation missing 
L[ [=[You can choose to limit how much champions are sent together.
Right now OHC is not using more than %3$s champions in the same mission-

Note that %2$s overrides it.]=] ] = [=[You can choose to limit how much champions are sent together.
Right now OHC is not using more than %3$s champions in the same mission-

Note that %2$s overrides it.]=]

return
end
L=l:NewLocale(me,"ruRU")
if (L) then
L["%1$d%% lower than %2$d%%. Lower %s"] = "%1$d%% ниже чем %2$d%%. Ниже %s"
L["%s for a wowhead link popup"] = "%s чтобы показать ссылку на WowHead"
L["%s start the mission without even opening the mission page. No question asked"] = "%s начать задание, ничего не спрашивая"
L["%s starts missions"] = "%s начинает задания"
L["%s to actually start mission"] = "%s чтобы действительно начать задание"
L["%s to blacklist"] = "%s в черный список"
L["%s to remove from blacklist"] = "%s для удаления из чёрного списка"
L[ [=[%s, please review the tutorial
(Click the icon to dismiss this message and start the tutorial)]=] ] = [=[%s, пожалуйста, пройдите обучение
(Нажмите на иконку, чтобы убрать это сообщение и начать обучение)]=]
L["%s, please review the tutorial\\n(Click the icon to dismiss this message)"] = "%s, пожалуйста, пройдите обучение.\\n(Нажмите на иконку, чтобы убрать это сообщение)"
L["Allow to start a mission directly from the mission list page (no single mission page shown)"] = "Разрешить начинать задание прямо из списка заданий (не показывать страницу задания)"
L["Always counter increased resource cost"] = "Парировать увеличение цены"
L["Always counter increased time"] = "Парировать увеличение времени"
L["Always counter kill troops (ignored if we can only use troops with just 1 durability left)"] = "Парировать смерть отрядов (игнорируется, когда есть только одна единица здоровья)"
L["Always counter no bonus loot threat"] = "Парировать отсутствие бонусной добычи"
L["Artifact shown value is the base value without considering knowledge multiplier"] = "Показывать силу артефакта без учета множителя знания"
L["Attempting %s"] = "Пытаемся %s"
L["Base Chance"] = "Базовый шанс"
L["Better parties available in next future"] = "Лучшая группа будет доступна скоро"
L["Blacklisted"] = "В черном списке"
L["Blacklisted missions are ignored in Mission Control"] = "Задания из чёрного списка игнорируются на тактической карте"
L["Bonus Chance"] = "Бонусный бросок"
L["Building Final report"] = "Готовим отчёт"
L["but using troops with just one durability left"] = "но использовать отряды с 1 единицей здоровья"
L["Capped %1$s. Spend at least %2$d of them"] = "Достигнуто %1$. Потратьте хотя бы 2%$"
L["Changes the sort order of missions in Mission panel"] = "Сортирует задания на тактической карте"
L["Combat ally is proposed for missions so you can consider unassigning him"] = "Использовать боевого спутника в расчетах - его нужно будет отпустить."
L["Complete all missions without confirmation"] = "Завершить все задания без подтверждения"
L["Configuration for mission party builder"] = "Настройка сбора группы"
L["Cost reduced"] = "Стоимость уменьшена"
L["Could not fulfill mission, aborting"] = "Не удалось выполнить задание, прерывание"
L["Counter kill Troops"] = "Парировать смерть отрядов"
L["Customization options (non mission related)"] = "Вариативные настройки (не касающиеся заданий)"
L["Disables warning: "] = "Отключает предупреждение:"
L["Dont use this slot"] = "Не использовать этот слот"
L["Don't use troops"] = "Не использовать отряды"
L["Duration reduced"] = "Время уменьшено"
L["Duration Time"] = "Продолжительность"
L["Elite: Prefer overcap"] = "Элитный: предпочесть избыточный шанс успеха "
L["Elites mission mode"] = "Режим элитных заданий"
L["Empty missions sorted as last"] = "Задания без группы в конец списка"
L["Empty or 0% success mission are sorted as last. Does not apply to \"original\" method"] = "Задание без группы и с 0% успеха в конец списка. Кроме \"обычного\" метода"
L["Equipped by following champions:"] = "Надето на следующих защитниках:"
L["Expiration Time"] = [=[Время окончания срока действия
]=]
L["Favours leveling follower for xp missions"] = "Предпочесть набор уровня защитником в заданиях на опыт"
L["For elite missions, tries hard to not go under 100% even at cost of overcapping"] = "Для элитных заданий стараться не опускаться ниже 100% даже за счёт избыточного шанса успеха"
L["General"] = "Общие"
L["Global approx. xp reward"] = "опыту"
L["Global approx. xp reward per hour"] = "опыту в час"
L["HallComander Quick Mission Completion"] = "Быстрое завершение заданий OHC"
L["If %1$s is lower than this, then we try to achieve at least %2$s without going over 100%%. Ignored for elite missions."] = "Если %1$s меньше этого значения, то мы попробуем получить хотя бы %2$s не превосходя 100%%. Игнорируется для элитных заданий"
L["If not checked, inactive followers are used as last chance"] = "Если флажок снят, то резервные защитники используются в последнюю очередь"
L[ [=[If you %s, you will lose them
Click on %s to abort]=] ] = [=[Если ваш %s слишком мал, вы можете потерять их.
Щелкните %s для отмены]=]
L["Ignore busy followers"] = "Игнорировать занятых"
L["Ignore inactive followers"] = "Игнорировать резерв"
L["Keep cost low"] = "Снижать цену"
L["Keep extra bonus"] = "Бонусная добыча"
L["Keep time short"] = "Уменьшать время наполовину"
L["Keep time VERY short"] = "Уменьшить время"
L[ [=[Launch the first filled mission with at least one locked follower.
Keep %s pressed to actually launch, a simple click will only print mission name with its followers list]=] ] = "Начать первое заполненное задание с одним назначенным защитником. Удерживайте %s, чтобы начать, простое нажатие только напишет название и список защитников"
L[ [=[Launch the first filled mission with at least one locked follower.
Keep SHIFT pressed to actually launch, a simple click will only print mission name with its followers list]=] ] = "Начать первое заполненное задание с одним назначенным защитником. Удерживайте Shift, чтобы начать, простое нажатие только напишет название и список защитников"
L["Level"] = "Уровень"
L["Lock all"] = "Назначить всех"
L["Lock this follower"] = "Назначить этого защитника"
L["Locked follower are only used in this mission"] = "Назначенный защитник используется только в этом задании"
L["Make Order Hall Mission Panel movable"] = "Открепить панель OHC"
L["Makes sure that no troops will be killed"] = "Гарантирует, что отряды не умрут"
L["Max champions"] = "Максимум защитников"
L["Maximize xp gain"] = "Максимизировать опыт"
L["Mission duration reduced"] = "Время сокращено"
L["Mission was capped due to total chance less than"] = "Задание ограничено из-за вероятности меньше чем"
L["Missions"] = "Задания"
L["Never kill Troops"] = "Не убивать отряды"
L["No follower gained xp"] = "Защитники не получили опыт"
L["No suitable missions. Have you reserved at least one follower?"] = "Нет подходящих заданий. Вы зарезервировали хотя бы одного защитника?"
L["Not blacklisted"] = "Не в чёрном списке"
L["Nothing to report"] = "Без отчёта"
L["Notifies you when you have troops ready to be collected"] = "Уведомлять, когда есть готовые отряды"
L["Only accept missions with time improved"] = "Принимать только задания с улучшенным временем"
L["Only consider elite missions"] = "Учитывать только элитные задания"
L["Only need %s instead of %s to start a mission from mission list"] = "Нужно только %s вместо %s, чтобы начать задание"
L["Only use champions even if troops are available"] = "Использовать только защитников, даже если есть отряды"
L["Open configuration"] = "Открыть настройки"
L[ [=[OrderHallCommander overrides GarrisonCommander for Order Hall Management.
 You can revert to GarrisonCommander simply disabling OrderhallCommander.
If instead you like OrderHallCommander remember to add it to Curse client and keep it updated]=] ] = [=[Order Hall Commander переопределяет Garrison Commander для управления заказами.
 Вы можете вернуться к Garrison Commander, просто отключив Orderhall Commander.
Если вам нравится Order Hall Commander, не забудьте добавить его в клиент Twitch и обновить его]=]
L["Original method"] = "Обычный метод"
L["Position is not saved on logout"] = "Положение не сохраняется при выходе"
L["Prefer high durability"] = "Предпочесть войска с большим количеством единиц здоровья"
L["Quick start first mission"] = "Быстрое начало первого задания"
L["Remove no champions warning"] = "Отключить предупреждение об отсутствии защитников"
L["Restart tutorial from beginning"] = "Перезапустить инструкции с начала"
L["Resume tutorial"] = "Возобновить инструкции"
L["Resurrect troops effect"] = "Эффект воскрешения отрядов"
L["Reward type"] = "Тип награды"
L["Sets all switches to a very permissive setup. Very similar to 1.4.4"] = [=[Выставить настройки для большей гибкости.
Очень похоже на 1.4.4]=]
L["Show tutorial"] = "Показать обучение"
L["Show/hide OrderHallCommander mission menu"] = "Показать/скрыть меню заданий OrderHallCommander"
L["Sort missions by:"] = "Сортировать задания по:"
L["Started with "] = "Начали с"
L["Success Chance"] = "Вероятность успеха"
L["Troop ready alert"] = "Оповещение о готовности отрядов"
L["Unable to fill missions, raise \"%s\""] = "Не удается заполнить группы заданий. Повысьте %s"
L["Unable to fill missions. Check your switches"] = "Не удается заполнить задания. Проверьте настройки"
L["Unable to start mission, aborting"] = "Невозможно начать задание, отменяем"
L["Unlock all"] = "Разблокировать всех"
L["Unlock this follower"] = "Разблокировать этого защитника"
L["Unlocks all follower and slots at once"] = "Разблокировать всех защитников и слоты"
L["Unsafe mission start"] = "Небезопасное начало задания"
L["Upgrading to |cff00ff00%d|r"] = "Обновление до |cff00ff00%d|r"
L["URL Copy"] = "Копировать ссылку"
L["Use at most this many champions"] = "Защитников не больше, чем"
L["Use combat ally"] = "Использовать боевого спутника"
L["Use this slot"] = "Использовать этот слот"
L["Uses troops with the highest durability instead of the ones with the lowest"] = "Использовать отряды с наибольшим здоровьем"
L["When no free followers are available shows empty follower"] = "Если нет свободных защитников, то отображается пустое место"
L["When we cant achieve the requested %1$s, we try to reach at least this one without (if possible) going over 100%%"] = "Если не получается достичь нужный %1$s, то попробуем хотя бы получить больше 100%%"
L["Would start with "] = "Началось бы с"
L["You are wasting |cffff0000%d|cffffd200 point(s)!!!"] = "Вы теряете |cffff0000%d|cffffd200 очков!"
L[ [=[You need to close and restart World of Warcraft in order to update this version of OrderHallCommander.
Simply reloading UI is not enough]=] ] = [=[Вам необходимо перезапустить World of Warcraft, чтобы обновить OrderHallCommander.
Перезапуска графического интерфейса не достаточно]=]
L["You now need to press both %s and %s to start mission"] = "Необходимо нажать и %s, и %s для запуска задания"

-- Tutorial
L[ [=[%1$s and %2$s switches work together to customize how you want your mission filled

The value you set for %1$s (right now %3$s%%) is the minimum acceptable chance for attempting to achieve bonus while the value to set for %2$s (right now %4$s%%) is the chance you want achieve when you are forfaiting bonus (due to not enough powerful followers)]=] ] = "Настройки %1$s и %2$s вместе определяют, как выполнять задания. Значение %1$s (сейчас равно %3$s%%) является минимальным желаемым шансом получить бонус, а значение %2$s (сейчас равно %4$s%%) соответствует шансу без бонуса (из-за недостаточного количества сильных соратников)."
L[ [=[A requested window is not open
Tutorial will resume as soon as possible]=] ] = [=[Запрошенное окно не открыто.
Обучение продолжится, когда будет возможно.]=]
L[ [=[Clicking a party button will assign its followers to the current mission.
Use it to verify OHC calculated chance with Blizzard one.
If they differs please take a screenshot and open a ticket :).]=] ] = "Щёлкните на кнопку группы, чтобы начать задание. Используйте это, чтобы сравнить, как OHC и Blizzard вычисляют вероятности. Если они отличаются, пожалуйста, сделайте скриншот и откройте задачу на CurseForge."
L[ [=[Equipment and upgrades are listed here as clickable buttons.
Due to an issue with Blizzard Taint system, drag and drop from bags raise an error.
if you drag and drop an item from a bag, you receive an error.
In order to assign equipments which are not listed (I update the list often but sometimes Blizzard is faster), you can right click the item in the bag and the left click the follower.
This way you dont receive any error]=] ] = [=[Снаряжение и обновления перечислены в виде кнопок. Из-за проблем с Blizzard Taint перетаскивание и использование из сумок вызывает ошибку.
Если вы перетаскиваете из сумки предмет, которого нет в списке (мы обновляем список достаточно часто, но иногда Blizzard быстрее), вы можете кликнуть правой кнопкой на вещи в сумке и левой - на защитнике.
Таким образом ошибка не появится.]=]
L[ [=[Equipment and upgrades are listed here as clickable buttons.
Due to an issue with Blizzard Taint system, if you drag and drop an item from a bag, you receive an error.
In order to assign equipment which are not listed (I updated the list often but sometimes Blizzard is faster), you can right click the item in the bag and the left click the follower.
This way you dont receive any error]=] ] = [=[Снаряжение и обновления перечислены в виде кнопок. Из-за проблем с Blizzard Taint перетаскивание и использование из сумок вызывает ошибку.
Если вы перетаскиваете из сумки предмет, которого нет в списке (мы обновляем список достаточно часто, но иногда Blizzard быстрее), вы можете кликнуть правой кнопкой на вещи в сумке и левой - на защитнике.
Таким образом ошибка не появится.
Таким образом, Вы не получите никаких ошибок]=]
L[ [=[For example, let's say a mission can reach 95%%, 130%% and 180%% success chance.
If %1$s is set to 170%%, the 180%% one will be choosen.
If %1$s is set to 200%% OHC will try to find the nearest to 100%% respecting %2$s setting
If for example %2$s is set to 100%%, then the 130%% one will be choosen, but if %2$s is set to 90%% then the 95%% one will be choosen]=] ] = [=[Например, задание может иметь 95%%, 130%% и 180%% вероятности успеха.
Если %1$s равно 170%%, то будет выбрана та, что со 180%%.
Если %1$s равно 200%% OHC попытается найти ближайшую к 100%%, соблюдая %2$s.
Если %2$s имеет значение 100%%, то будет выбрана 130%%-ная, но если %2$s равняется 90%%, то 95%%-ная.]=]
L["If instead you just want to always see the best available mission just set %1$s to 100%% and %2$s to 0%%"] = "Чтобы показывать только лучшие доступные задания, установите %1$s в 100%% и %2$s в 0%%."
L[ [=[If you dont understand why OHC choosed a setup for a mission, you can request a full analysis.
Analyze party will show all the possible combinations and how OHC evaluated them]=] ] = [=[Если вы не понимаете, почему OHC выбрал такую группу для задания, то запросите полный анализ.
Анализ группы покажет все возможные комбинации и метод их подбора]=]
L["Prefer high durability"] = "Предпочесть помощников с большим количеством здоровья "
L["Restart the tutorial"] = "Перезапустить сборник инструкций."
L[ [=[Slots (non the follower in it but just the slot) can be banned.
When you ban a slot, that slot will not be filled for that mission.
Exploiting the fact that troops are always in the leftmost slot(s) you can achieve a nice degree of custom tailoring, reducing the overall number of followers used for a mission]=] ] = "Слот (а не защитник в нём) может быть исключён. Заблокированный в этом задании слот не заполняется. Используя тот факт, что отряды всегда находятся слева, вы можете добиться тонкой настройки, уменьшая количество защитников для задания"
L["Terminate the tutorial. You can resume it anytime clicking on the info icon in the side menu"] = "Завершить обучение. Вы сможете продолжить, нажав на иконку информации в боковом меню."
L["Thank you for reading this, enjoy %s"] = "Спасибо, что прочитали. Наслаждайтесь %s"
L["There are %d tutorial step you didnt read"] = "Осталось %d шагов обучения, которые вы не прочли"
L[ [=[Usually OrderHallCOmmander tries to use troops with the lowest durability in order to let you enque new troops request as soon as possible.
Checking %1$s reverse it and OrderHallCOmmander will choose for each mission troops with the highest possible durability]=] ] = "Обычно OHC использует отряды с наименьшим здоровьем, чтобы вы могли скорее ввести в бой новые войска. Выбор %1$s обращает это, аддон выберет для задания войска с наибольшим здоровьем"
L[ [=[Welcome to a new release of OrderHallCommander
Please follow this short tutorial to discover all new functionalities.
You will not regret it]=] ] = [=[Вас приветствует новый выпуск OrderHallCommander!
Пройдите краткое обучение, чтобы узнать о новых функциях.
Вы не пожалеете об этом]=]
L[ [=[With %1$s you ask to always counter the Hazard kill troop.
This means that OHC will try to counter it OR use a troop with just one durability left.
The target for this switch is to avoid wasting durability point, NOT to avoid troops' death.]=] ] = [=[Используя %1$s, вы просите учитывать опасность смерти войск. Это означает, что OHC будет парировать её или использовать войска с 1 единицей здоровья.
Цель - избежать потери здоровья, а не смерть отрядов.]=]
L[ [=[With %2$s you ask to never let a troop die.
This not only implies %1$s and %3$s, but force OHC to never send to mission a troop which will die.
The target for this switch is to totally avoid killing troops, even it for this we cant fill the party]=] ] = [=[Используя %2$s, вы просите не давать отрядам умирать.
Это подразумевает не только %1$s и %3$s, но и заставляет OHC не отправлять на задани; войска, которые могут погибнуть.
Цель - полностью избежать смерть отрядов, даже если не получается собрать группу]=]
L[ [=[You can blacklist missions right clicking mission button.
Since 1.5.1 you can start a mission witout passing from mission page shift-clicking the mission button.
Be sure you liked the party because no confirmation is asked]=] ] = [=[Вы можете занести задания в чёрный список, щёлкнув правой кнопкой.
Начиная с 1.5.1, можно начать задание не заходя на экран заданий, нажав кнопку Shift и щёлкнув на нём мышью.
Проверьте, что предлагаемая группа вас устраивает, так как задание начнётся без подтверждения.]=]
L["You can choose not to use a troop type clicking its icon"] = "Вы можете отказаться от использования типа отрядов, щёлкнув по его иконке"
L[ [=[You can choose to limit how much champions are sent together.
Right now OHC is not using more than %3$s champions in the same mission-

Note that %2$s overrides it.]=] ] = [=[Вы можете ограничить количество используемых одновременно в задании защитников. Сейчас OHC использует не более %3$s защитников в одном задании.
Обратите внимание, что %2$s имеет больший приоритет.]=]

return
end
L=l:NewLocale(me,"zhCN")
if (L) then
L["%1$d%% lower than %2$d%%. Lower %s"] = "%1$d%%低于%2$d%%，降低%s"
--Translation missing 
L["%s for a wowhead link popup"] = "%s for a wowhead link popup"
L["%s start the mission without even opening the mission page. No question asked"] = "Shift-点击可以不打开任务页面就启动任务。没有问题"
--Translation missing 
L["%s starts missions"] = "%s starts missions"
--Translation missing 
L["%s to actually start mission"] = "%s to actually start mission"
L["%s to blacklist"] = "点击右键加入黑名单"
L["%s to remove from blacklist"] = "点击右键从黑名单中删除"
--Translation missing 
L[ [=[%s, please review the tutorial
(Click the icon to dismiss this message and start the tutorial)]=] ] = [=[%s, please review the tutorial
(Click the icon to dismiss this message and start the tutorial)]=]
L["%s, please review the tutorial\\n(Click the icon to dismiss this message)"] = "%s，请检查教程\\n（单击图标取消此消息）"
--Translation missing 
L["Allow to start a mission directly from the mission list page (no single mission page shown)"] = "Allow to start a mission directly from the mission list page (no single mission page shown)"
L["Always counter increased resource cost"] = "总是反制增加资源花费"
L["Always counter increased time"] = "总是反制增加任务时间"
L["Always counter kill troops (ignored if we can only use troops with just 1 durability left)"] = "总是反制杀死部队(如果我们用只剩一次耐久的部队则忽略)"
L["Always counter no bonus loot threat"] = "总是反制没有额外奖励的威胁"
L["Artifact shown value is the base value without considering knowledge multiplier"] = "神器显示的值是基础值，没有经过神器知识的加成"
L["Attempting %s"] = "尝试%s"
L["Base Chance"] = "基础机率"
L["Better parties available in next future"] = "在将来有更好的队伍"
L["Blacklisted"] = "加入黑名单"
L["Blacklisted missions are ignored in Mission Control"] = "加入黑名单的任务将会在任务面板被忽略"
L["Bonus Chance"] = "额外奖励机率"
L["Building Final report"] = "构建最终报告"
L["but using troops with just one durability left"] = "使用只有一个生命值的部队"
L["Capped %1$s. Spend at least %2$d of them"] = "%1$s封顶了。花费至少%2$d在它身上"
L["Changes the sort order of missions in Mission panel"] = "改变任务面板上的任务排列顺序"
L["Combat ally is proposed for missions so you can consider unassigning him"] = "战斗盟友被建议到任务，所以你可以考虑取消指派他"
L["Complete all missions without confirmation"] = "完成所有任务不须确认"
L["Configuration for mission party builder"] = "任务队伍构建设置"
L["Cost reduced"] = "已降低花费"
L["Could not fulfill mission, aborting"] = "任务无法执行被忽略"
L["Counter kill Troops"] = "反制危害（致命）防止部队阵亡"
--Translation missing 
L["Customization options (non mission related)"] = "Customization options (non mission related)"
L["Disables warning: "] = "停用警告："
L["Dont use this slot"] = "不要使用这个空位"
L["Don't use troops"] = "不要使用部队"
L["Duration reduced"] = "持续时间已缩短"
L["Duration Time"] = "持续时间"
--Translation missing 
L["Elite: Prefer overcap"] = "Elite: Prefer overcap"
L["Elites mission mode"] = "精英任务模式"
L["Empty missions sorted as last"] = "空的任务排在最后"
L["Empty or 0% success mission are sorted as last. Does not apply to \"original\" method"] = "空或者0%成功率的任务排在最后，对于\\\"原始\\\"方式排序无效。"
--Translation missing 
L["Equipped by following champions:"] = "Equipped by following champions:"
L["Expiration Time"] = "到期时间"
L["Favours leveling follower for xp missions"] = "倾向于使用升级中追隨者在经验值任务"
--Translation missing 
L["For elite missions, tries hard to not go under 100% even at cost of overcapping"] = "For elite missions, tries hard to not go under 100% even at cost of overcapping"
L["General"] = "一般"
L["Global approx. xp reward"] = "整体大约经验值奖励"
L["Global approx. xp reward per hour"] = "每小时获得的整体经验值奖励"
L["HallComander Quick Mission Completion"] = "大厅指挥官快速任务完成"
L["If %1$s is lower than this, then we try to achieve at least %2$s without going over 100%%. Ignored for elite missions."] = "如果 %1$s 低于此值，那么我们至少尝试达到 %2$s 而不超过100%%。 忽略精英任务。"
L["If not checked, inactive followers are used as last chance"] = "不勾选时，未激活的追随者会成为最后的考虑"
L[ [=[If you %s, you will lose them
Click on %s to abort]=] ] = [=[如果你继续，你会失去它们
点击%s來取消]=]
L["Ignore busy followers"] = "忽略任务中的追随者"
L["Ignore inactive followers"] = "忽略未激活的追随者"
L["Keep cost low"] = "节省大厅资源"
L["Keep extra bonus"] = "优先额外奖励"
L["Keep time short"] = "减少任务时间"
L["Keep time VERY short"] = "最短任务时间"
--Translation missing 
L[ [=[Launch the first filled mission with at least one locked follower.
Keep %s pressed to actually launch, a simple click will only print mission name with its followers list]=] ] = [=[Launch the first filled mission with at least one locked follower.
Keep %s pressed to actually launch, a simple click will only print mission name with its followers list]=]
--Translation missing 
L[ [=[Launch the first filled mission with at least one locked follower.
Keep SHIFT pressed to actually launch, a simple click will only print mission name with its followers list]=] ] = [=[Launch the first filled mission with at least one locked follower.
Keep SHIFT pressed to actually launch, a simple click will only print mission name with its followers list]=]
L["Level"] = "等级"
L["Lock all"] = "全部锁定"
L["Lock this follower"] = "锁定此追随者"
L["Locked follower are only used in this mission"] = "锁定只用于此任务的追随者"
L["Make Order Hall Mission Panel movable"] = "让大厅任务面板可移动"
L["Makes sure that no troops will be killed"] = "确保没有部队会阵亡"
L["Max champions"] = "最多的勇士数量"
L["Maximize xp gain"] = "获取最多的经验"
L["Mission duration reduced"] = "任务执行时间已缩短"
L["Mission was capped due to total chance less than"] = "任务限制由于总的几率少于"
L["Missions"] = "任务"
L["Never kill Troops"] = "确保部队绝不阵亡"
L["No follower gained xp"] = "没有追随者获得经验"
L["No suitable missions. Have you reserved at least one follower?"] = "没有合适的任务。 您是否至少保留了一位追随者？"
L["Not blacklisted"] = "未加入黑名单"
L["Nothing to report"] = "没什么可报告"
L["Notifies you when you have troops ready to be collected"] = "当部队已准备好获取时提醒你"
L["Only accept missions with time improved"] = "只允许有时间改善的任务"
L["Only consider elite missions"] = "只考虑精英任务"
--Translation missing 
L["Only need %s instead of %s to start a mission from mission list"] = "Only need %s instead of %s to start a mission from mission list"
L["Only use champions even if troops are available"] = "有可用的部队时，仍然只使用追随者"
L["Open configuration"] = "打开配置"
--Translation missing 
L[ [=[OrderHallCommander overrides GarrisonCommander for Order Hall Management.
 You can revert to GarrisonCommander simply disabling OrderhallCommander.
If instead you like OrderHallCommander remember to add it to Curse client and keep it updated]=] ] = [=[OrderHallCommander overrides GarrisonCommander for Order Hall Management.
 You can revert to GarrisonCommander simply disabling OrderhallCommander.
If instead you like OrderHallCommander remember to add it to Curse client and keep it updated]=]
L["Original method"] = "原始方法"
L["Position is not saved on logout"] = "位置不会在登出后储存"
L["Prefer high durability"] = "喜欢高生命值"
L["Quick start first mission"] = "快速开始第一个任务"
L["Remove no champions warning"] = "取消没有追随者警告"
--Translation missing 
L["Restart tutorial from beginning"] = "Restart tutorial from beginning"
--Translation missing 
L["Resume tutorial"] = "Resume tutorial"
L["Resurrect troops effect"] = "复活部队效果"
L["Reward type"] = "奖励类型"
--Translation missing 
L["Sets all switches to a very permissive setup. Very similar to 1.4.4"] = "Sets all switches to a very permissive setup. Very similar to 1.4.4"
L["Show tutorial"] = "显示教程"
L["Show/hide OrderHallCommander mission menu"] = "显示/隐藏大厅指挥官任务选单"
L["Sort missions by:"] = "排列任务根据："
L["Started with "] = "开始"
L["Success Chance"] = "成功机率"
L["Troop ready alert"] = "部队装备提醒"
L["Unable to fill missions, raise \"%s\""] = "无法指派任务，请提升 \\\"%s\\"
L["Unable to fill missions. Check your switches"] = "无法指派任务，请检查您的设定选项"
L["Unable to start mission, aborting"] = "无法开始任务，中止"
L["Unlock all"] = "全部解除锁定"
L["Unlock this follower"] = "解锁此追随者"
L["Unlocks all follower and slots at once"] = "一次性解锁所有追随者和空位"
--Translation missing 
L["Unsafe mission start"] = "Unsafe mission start"
L["Upgrading to |cff00ff00%d|r"] = "升级到|cff00ff00%d|r"
L["URL Copy"] = "复制网址"
L["Use at most this many champions"] = "最多使用不超过这个数量的勇士"
L["Use combat ally"] = "使用战斗盟友"
L["Use this slot"] = "使用这个空位"
L["Uses troops with the highest durability instead of the ones with the lowest"] = "使用最高生命值的部队，而不是最低的部队"
--Translation missing 
L["When no free followers are available shows empty follower"] = "When no free followers are available shows empty follower"
--Translation missing 
L["When we cant achieve the requested %1$s, we try to reach at least this one without (if possible) going over 100%%"] = "When we cant achieve the requested %1$s, we try to reach at least this one without (if possible) going over 100%%"
L["Would start with "] = "将开始"
L["You are wasting |cffff0000%d|cffffd200 point(s)!!!"] = "你浪费了|cffff0000%d|cffffd200 点数!!!"
--Translation missing 
L[ [=[You need to close and restart World of Warcraft in order to update this version of OrderHallCommander.
Simply reloading UI is not enough]=] ] = [=[You need to close and restart World of Warcraft in order to update this version of OrderHallCommander.
Simply reloading UI is not enough]=]
--Translation missing 
L["You now need to press both %s and %s to start mission"] = "You now need to press both %s and %s to start mission"

-- Tutorial
--Translation missing 
L[ [=[%1$s and %2$s switches work together to customize how you want your mission filled

The value you set for %1$s (right now %3$s%%) is the minimum acceptable chance for attempting to achieve bonus while the value to set for %2$s (right now %4$s%%) is the chance you want achieve when you are forfaiting bonus (due to not enough powerful followers)]=] ] = [=[%1$s and %2$s switches work together to customize how you want your mission filled

The value you set for %1$s (right now %3$s%%) is the minimum acceptable chance for attempting to achieve bonus while the value to set for %2$s (right now %4$s%%) is the chance you want achieve when you are forfaiting bonus (due to not enough powerful followers)]=]
--Translation missing 
L[ [=[A requested window is not open
Tutorial will resume as soon as possible]=] ] = [=[A requested window is not open
Tutorial will resume as soon as possible]=]
--Translation missing 
L[ [=[Clicking a party button will assign its followers to the current mission.
Use it to verify OHC calculated chance with Blizzard one.
If they differs please take a screenshot and open a ticket :).]=] ] = [=[Clicking a party button will assign its followers to the current mission.
Use it to verify OHC calculated chance with Blizzard one.
If they differs please take a screenshot and open a ticket :).]=]
--Translation missing 
L[ [=[Equipment and upgrades are listed here as clickable buttons.
Due to an issue with Blizzard Taint system, drag and drop from bags raise an error.
if you drag and drop an item from a bag, you receive an error.
In order to assign equipments which are not listed (I update the list often but sometimes Blizzard is faster), you can right click the item in the bag and the left click the follower.
This way you dont receive any error]=] ] = [=[Equipment and upgrades are listed here as clickable buttons.
Due to an issue with Blizzard Taint system, drag and drop from bags raise an error.
if you drag and drop an item from a bag, you receive an error.
In order to assign equipments which are not listed (I update the list often but sometimes Blizzard is faster), you can right click the item in the bag and the left click the follower.
This way you dont receive any error]=]
--Translation missing 
L[ [=[Equipment and upgrades are listed here as clickable buttons.
Due to an issue with Blizzard Taint system, if you drag and drop an item from a bag, you receive an error.
In order to assign equipment which are not listed (I updated the list often but sometimes Blizzard is faster), you can right click the item in the bag and the left click the follower.
This way you dont receive any error]=] ] = [=[Equipment and upgrades are listed here as clickable buttons.
Due to an issue with Blizzard Taint system, if you drag and drop an item from a bag, you receive an error.
In order to assign equipment which are not listed (I updated the list often but sometimes Blizzard is faster), you can right click the item in the bag and the left click the follower.
This way you dont receive any error]=]
--Translation missing 
L[ [=[For example, let's say a mission can reach 95%%, 130%% and 180%% success chance.
If %1$s is set to 170%%, the 180%% one will be choosen.
If %1$s is set to 200%% OHC will try to find the nearest to 100%% respecting %2$s setting
If for example %2$s is set to 100%%, then the 130%% one will be choosen, but if %2$s is set to 90%% then the 95%% one will be choosen]=] ] = [=[For example, let's say a mission can reach 95%%, 130%% and 180%% success chance.
If %1$s is set to 170%%, the 180%% one will be choosen.
If %1$s is set to 200%% OHC will try to find the nearest to 100%% respecting %2$s setting
If for example %2$s is set to 100%%, then the 130%% one will be choosen, but if %2$s is set to 90%% then the 95%% one will be choosen]=]
L["If instead you just want to always see the best available mission just set %1$s to 100%% and %2$s to 0%%"] = "相反，如果你只想总是看到最好的可用任务，只需要设置%1$s到100%，%2$s到0%。"
--Translation missing 
L[ [=[If you dont understand why OHC choosed a setup for a mission, you can request a full analysis.
Analyze party will show all the possible combinations and how OHC evaluated them]=] ] = [=[If you dont understand why OHC choosed a setup for a mission, you can request a full analysis.
Analyze party will show all the possible combinations and how OHC evaluated them]=]
--Translation missing 
L["Prefer high durability"] = "Prefer high durability"
L["Restart the tutorial"] = "重新启动教程"
--Translation missing 
L[ [=[Slots (non the follower in it but just the slot) can be banned.
When you ban a slot, that slot will not be filled for that mission.
Exploiting the fact that troops are always in the leftmost slot(s) you can achieve a nice degree of custom tailoring, reducing the overall number of followers used for a mission]=] ] = [=[Slots (non the follower in it but just the slot) can be banned.
When you ban a slot, that slot will not be filled for that mission.
Exploiting the fact that troops are always in the leftmost slot(s) you can achieve a nice degree of custom tailoring, reducing the overall number of followers used for a mission]=]
L["Terminate the tutorial. You can resume it anytime clicking on the info icon in the side menu"] = "终止教程。您可以随时点击侧边菜单的信息图标恢复它"
--Translation missing 
L["Thank you for reading this, enjoy %s"] = "Thank you for reading this, enjoy %s"
--Translation missing 
L["There are %d tutorial step you didnt read"] = "There are %d tutorial step you didnt read"
--Translation missing 
L[ [=[Usually OrderHallCOmmander tries to use troops with the lowest durability in order to let you enque new troops request as soon as possible.
Checking %1$s reverse it and OrderHallCOmmander will choose for each mission troops with the highest possible durability]=] ] = [=[Usually OrderHallCOmmander tries to use troops with the lowest durability in order to let you enque new troops request as soon as possible.
Checking %1$s reverse it and OrderHallCOmmander will choose for each mission troops with the highest possible durability]=]
--Translation missing 
L[ [=[Welcome to a new release of OrderHallCommander
Please follow this short tutorial to discover all new functionalities.
You will not regret it]=] ] = [=[Welcome to a new release of OrderHallCommander
Please follow this short tutorial to discover all new functionalities.
You will not regret it]=]
--Translation missing 
L[ [=[With %1$s you ask to always counter the Hazard kill troop.
This means that OHC will try to counter it OR use a troop with just one durability left.
The target for this switch is to avoid wasting durability point, NOT to avoid troops' death.]=] ] = [=[With %1$s you ask to always counter the Hazard kill troop.
This means that OHC will try to counter it OR use a troop with just one durability left.
The target for this switch is to avoid wasting durability point, NOT to avoid troops' death.]=]
--Translation missing 
L[ [=[With %2$s you ask to never let a troop die.
This not only implies %1$s and %3$s, but force OHC to never send to mission a troop which will die.
The target for this switch is to totally avoid killing troops, even it for this we cant fill the party]=] ] = [=[With %2$s you ask to never let a troop die.
This not only implies %1$s and %3$s, but force OHC to never send to mission a troop which will die.
The target for this switch is to totally avoid killing troops, even it for this we cant fill the party]=]
--Translation missing 
L[ [=[You can blacklist missions right clicking mission button.
Since 1.5.1 you can start a mission witout passing from mission page shift-clicking the mission button.
Be sure you liked the party because no confirmation is asked]=] ] = [=[You can blacklist missions right clicking mission button.
Since 1.5.1 you can start a mission witout passing from mission page shift-clicking the mission button.
Be sure you liked the party because no confirmation is asked]=]
--Translation missing 
L["You can choose not to use a troop type clicking its icon"] = "You can choose not to use a troop type clicking its icon"
--Translation missing 
L[ [=[You can choose to limit how much champions are sent together.
Right now OHC is not using more than %3$s champions in the same mission-

Note that %2$s overrides it.]=] ] = [=[You can choose to limit how much champions are sent together.
Right now OHC is not using more than %3$s champions in the same mission-

Note that %2$s overrides it.]=]

return
end
L=l:NewLocale(me,"esES")
if (L) then
--Translation missing 
L["%1$d%% lower than %2$d%%. Lower %s"] = "%1$d%% lower than %2$d%%. Lower %s"
--Translation missing 
L["%s for a wowhead link popup"] = "%s for a wowhead link popup"
--Translation missing 
L["%s start the mission without even opening the mission page. No question asked"] = "%s start the mission without even opening the mission page. No question asked"
--Translation missing 
L["%s starts missions"] = "%s starts missions"
--Translation missing 
L["%s to actually start mission"] = "%s to actually start mission"
--Translation missing 
L["%s to blacklist"] = "%s to blacklist"
--Translation missing 
L["%s to remove from blacklist"] = "%s to remove from blacklist"
--Translation missing 
L[ [=[%s, please review the tutorial
(Click the icon to dismiss this message and start the tutorial)]=] ] = [=[%s, please review the tutorial
(Click the icon to dismiss this message and start the tutorial)]=]
--Translation missing 
L["%s, please review the tutorial\\n(Click the icon to dismiss this message)"] = "%s, please review the tutorial\\n(Click the icon to dismiss this message)"
--Translation missing 
L["Allow to start a mission directly from the mission list page (no single mission page shown)"] = "Allow to start a mission directly from the mission list page (no single mission page shown)"
L["Always counter increased resource cost"] = "Siempre contrarreste el mayor costo de recursos"
L["Always counter increased time"] = "Siempre contrarreste el tiempo incrementado"
L["Always counter kill troops (ignored if we can only use troops with just 1 durability left)"] = "Siempre contrarrestar la muerte de tropas (ignorado si sólo podemos utilizar tropas con un solo punto de durabilidad)"
L["Always counter no bonus loot threat"] = "Siempre contrarresta la falta de bonificación de botín"
--Translation missing 
L["Artifact shown value is the base value without considering knowledge multiplier"] = "Artifact shown value is the base value without considering knowledge multiplier"
--Translation missing 
L["Attempting %s"] = "Attempting %s"
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
L["Could not fulfill mission, aborting"] = "Could not fulfill mission, aborting"
--Translation missing 
L["Counter kill Troops"] = "Counter kill Troops"
--Translation missing 
L["Customization options (non mission related)"] = "Customization options (non mission related)"
--Translation missing 
L["Disables warning: "] = "Disables warning: "
--Translation missing 
L["Dont use this slot"] = "Dont use this slot"
--Translation missing 
L["Don't use troops"] = "Don't use troops"
L["Duration reduced"] = "Duración reducida"
L["Duration Time"] = "Duración"
--Translation missing 
L["Elite: Prefer overcap"] = "Elite: Prefer overcap"
--Translation missing 
L["Elites mission mode"] = "Elites mission mode"
--Translation missing 
L["Empty missions sorted as last"] = "Empty missions sorted as last"
--Translation missing 
L["Empty or 0% success mission are sorted as last. Does not apply to \"original\" method"] = "Empty or 0% success mission are sorted as last. Does not apply to \"original\" method"
--Translation missing 
L["Equipped by following champions:"] = "Equipped by following champions:"
L["Expiration Time"] = "Tiempo de expiración"
L["Favours leveling follower for xp missions"] = "Favors nivelando seguidor para las misiones xp"
--Translation missing 
L["For elite missions, tries hard to not go under 100% even at cost of overcapping"] = "For elite missions, tries hard to not go under 100% even at cost of overcapping"
L["General"] = true
L["Global approx. xp reward"] = "Global aprox. Recompensa xp"
--Translation missing 
L["Global approx. xp reward per hour"] = "Global approx. xp reward per hour"
L["HallComander Quick Mission Completion"] = "Conclusión de la misión rápida de HallComander"
--Translation missing 
L["If %1$s is lower than this, then we try to achieve at least %2$s without going over 100%%. Ignored for elite missions."] = "If %1$s is lower than this, then we try to achieve at least %2$s without going over 100%%. Ignored for elite missions."
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
L[ [=[Launch the first filled mission with at least one locked follower.
Keep %s pressed to actually launch, a simple click will only print mission name with its followers list]=] ] = [=[Launch the first filled mission with at least one locked follower.
Keep %s pressed to actually launch, a simple click will only print mission name with its followers list]=]
--Translation missing 
L[ [=[Launch the first filled mission with at least one locked follower.
Keep SHIFT pressed to actually launch, a simple click will only print mission name with its followers list]=] ] = [=[Launch the first filled mission with at least one locked follower.
Keep SHIFT pressed to actually launch, a simple click will only print mission name with its followers list]=]
L["Level"] = "Nivel"
--Translation missing 
L["Lock all"] = "Lock all"
--Translation missing 
L["Lock this follower"] = "Lock this follower"
--Translation missing 
L["Locked follower are only used in this mission"] = "Locked follower are only used in this mission"
L["Make Order Hall Mission Panel movable"] = "Hacer pedido Hall Misión Panel móvil"
--Translation missing 
L["Makes sure that no troops will be killed"] = "Makes sure that no troops will be killed"
--Translation missing 
L["Max champions"] = "Max champions"
L["Maximize xp gain"] = "Maximizar la ganancia de xp"
--Translation missing 
L["Mission duration reduced"] = "Mission duration reduced"
--Translation missing 
L["Mission was capped due to total chance less than"] = "Mission was capped due to total chance less than"
L["Missions"] = "Misiones"
--Translation missing 
L["Never kill Troops"] = "Never kill Troops"
L["No follower gained xp"] = "Ningún seguidor ganó xp"
--Translation missing 
L["No suitable missions. Have you reserved at least one follower?"] = "No suitable missions. Have you reserved at least one follower?"
--Translation missing 
L["Not blacklisted"] = "Not blacklisted"
L["Nothing to report"] = "Nada que reportar"
L["Notifies you when you have troops ready to be collected"] = "Notifica cuando hay tropas listas para ser recolectadas"
L["Only accept missions with time improved"] = "Sólo aceptar misiones mejoradas con el tiempo"
--Translation missing 
L["Only consider elite missions"] = "Only consider elite missions"
--Translation missing 
L["Only need %s instead of %s to start a mission from mission list"] = "Only need %s instead of %s to start a mission from mission list"
--Translation missing 
L["Only use champions even if troops are available"] = "Only use champions even if troops are available"
--Translation missing 
L["Open configuration"] = "Open configuration"
--Translation missing 
L[ [=[OrderHallCommander overrides GarrisonCommander for Order Hall Management.
 You can revert to GarrisonCommander simply disabling OrderhallCommander.
If instead you like OrderHallCommander remember to add it to Curse client and keep it updated]=] ] = [=[OrderHallCommander overrides GarrisonCommander for Order Hall Management.
 You can revert to GarrisonCommander simply disabling OrderhallCommander.
If instead you like OrderHallCommander remember to add it to Curse client and keep it updated]=]
L["Original method"] = "Método original"
L["Position is not saved on logout"] = "La posición no se guarda al cerrar la sesión"
--Translation missing 
L["Prefer high durability"] = "Prefer high durability"
--Translation missing 
L["Quick start first mission"] = "Quick start first mission"
--Translation missing 
L["Remove no champions warning"] = "Remove no champions warning"
--Translation missing 
L["Restart tutorial from beginning"] = "Restart tutorial from beginning"
--Translation missing 
L["Resume tutorial"] = "Resume tutorial"
L["Resurrect troops effect"] = "Efecto de las tropas de resurrección"
L["Reward type"] = "Tipo de recompensa"
--Translation missing 
L["Sets all switches to a very permissive setup. Very similar to 1.4.4"] = "Sets all switches to a very permissive setup. Very similar to 1.4.4"
--Translation missing 
L["Show tutorial"] = "Show tutorial"
L["Show/hide OrderHallCommander mission menu"] = "Mostrar / ocultar el menú de la misión OrderHallCommander"
L["Sort missions by:"] = "Ordenar misiones por:"
--Translation missing 
L["Started with "] = "Started with "
L["Success Chance"] = "Éxito"
L["Troop ready alert"] = "Alerta lista de tropas"
--Translation missing 
L["Unable to fill missions, raise \"%s\""] = "Unable to fill missions, raise \"%s\""
--Translation missing 
L["Unable to fill missions. Check your switches"] = "Unable to fill missions. Check your switches"
--Translation missing 
L["Unable to start mission, aborting"] = "Unable to start mission, aborting"
--Translation missing 
L["Unlock all"] = "Unlock all"
--Translation missing 
L["Unlock this follower"] = "Unlock this follower"
--Translation missing 
L["Unlocks all follower and slots at once"] = "Unlocks all follower and slots at once"
--Translation missing 
L["Unsafe mission start"] = "Unsafe mission start"
L["Upgrading to |cff00ff00%d|r"] = "Actualizando a | cff00ff00% d | r"
--Translation missing 
L["URL Copy"] = "URL Copy"
--Translation missing 
L["Use at most this many champions"] = "Use at most this many champions"
L["Use combat ally"] = "Usar aliado de combate"
--Translation missing 
L["Use this slot"] = "Use this slot"
--Translation missing 
L["Uses troops with the highest durability instead of the ones with the lowest"] = "Uses troops with the highest durability instead of the ones with the lowest"
--Translation missing 
L["When no free followers are available shows empty follower"] = "When no free followers are available shows empty follower"
--Translation missing 
L["When we cant achieve the requested %1$s, we try to reach at least this one without (if possible) going over 100%%"] = "When we cant achieve the requested %1$s, we try to reach at least this one without (if possible) going over 100%%"
--Translation missing 
L["Would start with "] = "Would start with "
L["You are wasting |cffff0000%d|cffffd200 point(s)!!!"] = "Está perdiendo | cffff0000% d | cffffd200 punto (s)!"
--Translation missing 
L[ [=[You need to close and restart World of Warcraft in order to update this version of OrderHallCommander.
Simply reloading UI is not enough]=] ] = [=[You need to close and restart World of Warcraft in order to update this version of OrderHallCommander.
Simply reloading UI is not enough]=]
--Translation missing 
L["You now need to press both %s and %s to start mission"] = "You now need to press both %s and %s to start mission"

-- Tutorial
--Translation missing 
L[ [=[%1$s and %2$s switches work together to customize how you want your mission filled

The value you set for %1$s (right now %3$s%%) is the minimum acceptable chance for attempting to achieve bonus while the value to set for %2$s (right now %4$s%%) is the chance you want achieve when you are forfaiting bonus (due to not enough powerful followers)]=] ] = [=[%1$s and %2$s switches work together to customize how you want your mission filled

The value you set for %1$s (right now %3$s%%) is the minimum acceptable chance for attempting to achieve bonus while the value to set for %2$s (right now %4$s%%) is the chance you want achieve when you are forfaiting bonus (due to not enough powerful followers)]=]
--Translation missing 
L[ [=[A requested window is not open
Tutorial will resume as soon as possible]=] ] = [=[A requested window is not open
Tutorial will resume as soon as possible]=]
--Translation missing 
L[ [=[Clicking a party button will assign its followers to the current mission.
Use it to verify OHC calculated chance with Blizzard one.
If they differs please take a screenshot and open a ticket :).]=] ] = [=[Clicking a party button will assign its followers to the current mission.
Use it to verify OHC calculated chance with Blizzard one.
If they differs please take a screenshot and open a ticket :).]=]
--Translation missing 
L[ [=[Equipment and upgrades are listed here as clickable buttons.
Due to an issue with Blizzard Taint system, drag and drop from bags raise an error.
if you drag and drop an item from a bag, you receive an error.
In order to assign equipments which are not listed (I update the list often but sometimes Blizzard is faster), you can right click the item in the bag and the left click the follower.
This way you dont receive any error]=] ] = [=[Equipment and upgrades are listed here as clickable buttons.
Due to an issue with Blizzard Taint system, drag and drop from bags raise an error.
if you drag and drop an item from a bag, you receive an error.
In order to assign equipments which are not listed (I update the list often but sometimes Blizzard is faster), you can right click the item in the bag and the left click the follower.
This way you dont receive any error]=]
--Translation missing 
L[ [=[Equipment and upgrades are listed here as clickable buttons.
Due to an issue with Blizzard Taint system, if you drag and drop an item from a bag, you receive an error.
In order to assign equipment which are not listed (I updated the list often but sometimes Blizzard is faster), you can right click the item in the bag and the left click the follower.
This way you dont receive any error]=] ] = [=[Equipment and upgrades are listed here as clickable buttons.
Due to an issue with Blizzard Taint system, if you drag and drop an item from a bag, you receive an error.
In order to assign equipment which are not listed (I updated the list often but sometimes Blizzard is faster), you can right click the item in the bag and the left click the follower.
This way you dont receive any error]=]
--Translation missing 
L[ [=[For example, let's say a mission can reach 95%%, 130%% and 180%% success chance.
If %1$s is set to 170%%, the 180%% one will be choosen.
If %1$s is set to 200%% OHC will try to find the nearest to 100%% respecting %2$s setting
If for example %2$s is set to 100%%, then the 130%% one will be choosen, but if %2$s is set to 90%% then the 95%% one will be choosen]=] ] = [=[For example, let's say a mission can reach 95%%, 130%% and 180%% success chance.
If %1$s is set to 170%%, the 180%% one will be choosen.
If %1$s is set to 200%% OHC will try to find the nearest to 100%% respecting %2$s setting
If for example %2$s is set to 100%%, then the 130%% one will be choosen, but if %2$s is set to 90%% then the 95%% one will be choosen]=]
--Translation missing 
L["If instead you just want to always see the best available mission just set %1$s to 100%% and %2$s to 0%%"] = "If instead you just want to always see the best available mission just set %1$s to 100%% and %2$s to 0%%"
--Translation missing 
L[ [=[If you dont understand why OHC choosed a setup for a mission, you can request a full analysis.
Analyze party will show all the possible combinations and how OHC evaluated them]=] ] = [=[If you dont understand why OHC choosed a setup for a mission, you can request a full analysis.
Analyze party will show all the possible combinations and how OHC evaluated them]=]
--Translation missing 
L["Prefer high durability"] = "Prefer high durability"
--Translation missing 
L["Restart the tutorial"] = "Restart the tutorial"
--Translation missing 
L[ [=[Slots (non the follower in it but just the slot) can be banned.
When you ban a slot, that slot will not be filled for that mission.
Exploiting the fact that troops are always in the leftmost slot(s) you can achieve a nice degree of custom tailoring, reducing the overall number of followers used for a mission]=] ] = [=[Slots (non the follower in it but just the slot) can be banned.
When you ban a slot, that slot will not be filled for that mission.
Exploiting the fact that troops are always in the leftmost slot(s) you can achieve a nice degree of custom tailoring, reducing the overall number of followers used for a mission]=]
--Translation missing 
L["Terminate the tutorial. You can resume it anytime clicking on the info icon in the side menu"] = "Terminate the tutorial. You can resume it anytime clicking on the info icon in the side menu"
--Translation missing 
L["Thank you for reading this, enjoy %s"] = "Thank you for reading this, enjoy %s"
--Translation missing 
L["There are %d tutorial step you didnt read"] = "There are %d tutorial step you didnt read"
--Translation missing 
L[ [=[Usually OrderHallCOmmander tries to use troops with the lowest durability in order to let you enque new troops request as soon as possible.
Checking %1$s reverse it and OrderHallCOmmander will choose for each mission troops with the highest possible durability]=] ] = [=[Usually OrderHallCOmmander tries to use troops with the lowest durability in order to let you enque new troops request as soon as possible.
Checking %1$s reverse it and OrderHallCOmmander will choose for each mission troops with the highest possible durability]=]
--Translation missing 
L[ [=[Welcome to a new release of OrderHallCommander
Please follow this short tutorial to discover all new functionalities.
You will not regret it]=] ] = [=[Welcome to a new release of OrderHallCommander
Please follow this short tutorial to discover all new functionalities.
You will not regret it]=]
--Translation missing 
L[ [=[With %1$s you ask to always counter the Hazard kill troop.
This means that OHC will try to counter it OR use a troop with just one durability left.
The target for this switch is to avoid wasting durability point, NOT to avoid troops' death.]=] ] = [=[With %1$s you ask to always counter the Hazard kill troop.
This means that OHC will try to counter it OR use a troop with just one durability left.
The target for this switch is to avoid wasting durability point, NOT to avoid troops' death.]=]
--Translation missing 
L[ [=[With %2$s you ask to never let a troop die.
This not only implies %1$s and %3$s, but force OHC to never send to mission a troop which will die.
The target for this switch is to totally avoid killing troops, even it for this we cant fill the party]=] ] = [=[With %2$s you ask to never let a troop die.
This not only implies %1$s and %3$s, but force OHC to never send to mission a troop which will die.
The target for this switch is to totally avoid killing troops, even it for this we cant fill the party]=]
--Translation missing 
L[ [=[You can blacklist missions right clicking mission button.
Since 1.5.1 you can start a mission witout passing from mission page shift-clicking the mission button.
Be sure you liked the party because no confirmation is asked]=] ] = [=[You can blacklist missions right clicking mission button.
Since 1.5.1 you can start a mission witout passing from mission page shift-clicking the mission button.
Be sure you liked the party because no confirmation is asked]=]
--Translation missing 
L["You can choose not to use a troop type clicking its icon"] = "You can choose not to use a troop type clicking its icon"
--Translation missing 
L[ [=[You can choose to limit how much champions are sent together.
Right now OHC is not using more than %3$s champions in the same mission-

Note that %2$s overrides it.]=] ] = [=[You can choose to limit how much champions are sent together.
Right now OHC is not using more than %3$s champions in the same mission-

Note that %2$s overrides it.]=]

return
end
L=l:NewLocale(me,"zhTW")
if (L) then
L["%1$d%% lower than %2$d%%. Lower %s"] = "%1$d%%低於%2$d%%，降低%s"
L["%s for a wowhead link popup"] = "%s跳出wowhead連結"
L["%s start the mission without even opening the mission page. No question asked"] = "按下 %s 一鍵派出任務。不用打開任務頁面，不做任何詢問。"
L["%s starts missions"] = "按下 %s 派出任務"
L["%s to actually start mission"] = "按下 %s 馬上派出任務"
L["%s to blacklist"] = "%s 加入忽略清單"
L["%s to remove from blacklist"] = "%s 從忽略清單移除"
L[ [=[%s, please review the tutorial
(Click the icon to dismiss this message and start the tutorial)]=] ] = [=[%s，請查看教學說明
(點擊圖示關閉這個訊息並且打開教學說明)]=]
L["%s, please review the tutorial\\n(Click the icon to dismiss this message)"] = "%s，請查看教學說明\\n(點擊圖示這個關閉訊息)"
L["Allow to start a mission directly from the mission list page (no single mission page shown)"] = "允許直接從任務列表頁面啟動任務（不會顯示個別任務頁面）"
L["Always counter increased resource cost"] = "總是反制增加資源花費"
L["Always counter increased time"] = "總是反制增加任務時間"
L["Always counter kill troops (ignored if we can only use troops with just 1 durability left)"] = "總是反制殺死部隊(如果我們用只剩一次耐久的部隊則忽略)"
L["Always counter no bonus loot threat"] = "總是反制沒有額外獎勵的威脅"
L["Artifact shown value is the base value without considering knowledge multiplier"] = "神兵顯示的值是基礎值，沒有經過神兵知識的加成。"
L["Attempting %s"] = "嘗試%s"
L["Base Chance"] = "基礎機率"
L["Better parties available in next future"] = "在將來有更好的隊伍"
L["Blacklisted"] = "已在忽略清單"
L["Blacklisted missions are ignored in Mission Control"] = "任務控制會忽略在忽略清單內的任務"
L["Bonus Chance"] = "額外獎勵機率"
L["Building Final report"] = "建立總結報告"
L["but using troops with just one durability left"] = "但使用只有一個耐久度的部隊"
L["Capped %1$s. Spend at least %2$d of them"] = "%1$s封頂了。花費至少%2$d在它身上"
L["Changes the sort order of missions in Mission panel"] = "改變任務面板上的任務排列順序"
L["Combat ally is proposed for missions so you can consider unassigning him"] = "戰鬥盟友被建議到任務，所以你可以考慮取消指派他"
L["Complete all missions without confirmation"] = "完成所有任務不須確認"
L["Configuration for mission party builder"] = "任務隊伍構建設置"
L["Cost reduced"] = "花費已降低"
L["Could not fulfill mission, aborting"] = "任務無法履行，忽略"
L["Counter kill Troops"] = "反制殺死部隊"
L["Customization options (non mission related)"] = "自定義選項（非任務相關）"
L["Disables warning: "] = "停用警告："
L["Dont use this slot"] = "不要使用這個空槽"
L["Don't use troops"] = "不要使用部隊"
L["Duration reduced"] = "持續時間已縮短"
L["Duration Time"] = "持續時間"
L["Elite: Prefer overcap"] = "精英: 寧願增加花費"
L["Elites mission mode"] = "精英任務模式"
L["Empty missions sorted as last"] = "空的任務排在最後"
L["Empty or 0% success mission are sorted as last. Does not apply to \"original\" method"] = "空的或成功率 0% 的任務排列在最後面。不要套用到  \"原始方法\"。"
L["Equipped by following champions:"] = "已裝備在下列勇士："
L["Expiration Time"] = "到期時間"
L["Favours leveling follower for xp missions"] = "傾向於使用升級中追隨者在經驗值任務"
L["For elite missions, tries hard to not go under 100% even at cost of overcapping"] = "對於精英任務，就算花費會增加，也別讓成功率低於 100%。"
L["General"] = "(G) 一般"
L["Global approx. xp reward"] = "整體大約經驗值獎勵"
L["Global approx. xp reward per hour"] = "每小時獲得整體經驗值獎勵"
L["HallComander Quick Mission Completion"] = "大廳任務快速完成"
L["If %1$s is lower than this, then we try to achieve at least %2$s without going over 100%%. Ignored for elite missions."] = "如果%1$s低於此值，那麼我們嘗試至少達到%2$s而不超過100%%。 忽視精英任務。"
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
L[ [=[Launch the first filled mission with at least one locked follower.
Keep %s pressed to actually launch, a simple click will only print mission name with its followers list]=] ] = [=[至少使用一個鎖定的追隨者來出第一個任務。
按住 %s 會實際派出，點一下只會顯示任務名稱和和追隨者清單。]=]
L[ [=[Launch the first filled mission with at least one locked follower.
Keep SHIFT pressed to actually launch, a simple click will only print mission name with its followers list]=] ] = [=[至少使用一個鎖定的追隨者來出第一個任務。
按住 SHIFT 會實際派出，點一下只會顯示任務名稱和和追隨者清單。]=]
L["Level"] = "等級"
L["Lock all"] = "全部鎖定"
L["Lock this follower"] = "鎖定此追隨者"
L["Locked follower are only used in this mission"] = "鎖定只用於此任務的追隨者"
L["Make Order Hall Mission Panel movable"] = "讓大廳任務面板可移動"
L["Makes sure that no troops will be killed"] = "確保沒有部隊會被殺害"
L["Max champions"] = "最多勇士"
L["Maximize xp gain"] = "最大化經驗獲取"
L["Mission duration reduced"] = "任務時間已縮短"
L["Mission was capped due to total chance less than"] = "任務花費提高了，因為總成功率低於"
L["Missions"] = "(M) 任務"
L["Never kill Troops"] = "絕不殺死部隊"
L["No follower gained xp"] = "沒有追隨者獲得經驗"
L["No suitable missions. Have you reserved at least one follower?"] = "沒有合適的任務。 您是否至少保留一位追隨者？"
L["Not blacklisted"] = "不在忽略清單"
L["Nothing to report"] = "沒什麼可報告"
L["Notifies you when you have troops ready to be collected"] = "當部隊已準備好獲取時提醒你"
L["Only accept missions with time improved"] = "只允許有時間改善的任務"
L["Only consider elite missions"] = "只考慮精英任務"
L["Only need %s instead of %s to start a mission from mission list"] = "要從任務清單派出任務，只需要 %s 而不是 %s。"
L["Only use champions even if troops are available"] = "有可用的部隊時，仍然只要使用勇士。"
L["Open configuration"] = "開啟設置選項"
L[ [=[OrderHallCommander overrides GarrisonCommander for Order Hall Management.
 You can revert to GarrisonCommander simply disabling OrderhallCommander.
If instead you like OrderHallCommander remember to add it to Curse client and keep it updated]=] ] = [=[職業大廳指揮官已經取代要塞指揮官來管理職業大廳。
要返回使用要塞指揮官，只要停用職業大廳指揮官插件就可以了。]=]
L["Original method"] = "原始方式"
L["Position is not saved on logout"] = "位置不會在登出後儲存"
L["Prefer high durability"] = "喜好高耐久度"
L["Quick start first mission"] = "快速開始第一個任務"
L["Remove no champions warning"] = "移除缺少勇士警告"
L["Restart tutorial from beginning"] = "從開始的地方重啟指南"
L["Resume tutorial"] = "繼續指南"
L["Resurrect troops effect"] = "復活部隊效果"
L["Reward type"] = "獎勵類型"
L["Sets all switches to a very permissive setup. Very similar to 1.4.4"] = "所有設定都更改為非常寬鬆的設定，和 1.44 版非常相似。"
L["Show tutorial"] = "顯示指南"
L["Show/hide OrderHallCommander mission menu"] = "顯示/隱藏大廳指揮官任務選單"
L["Sort missions by:"] = "任務排序依據："
L["Started with "] = "已經派出 "
L["Success Chance"] = "成功機率"
L["Troop ready alert"] = "部隊整備提醒"
L["Unable to fill missions, raise \"%s\""] = "無法指派任務，請提升 \"%s\""
L["Unable to fill missions. Check your switches"] = "無法分派任務，請檢查你的設定選項。"
L["Unable to start mission, aborting"] = "無法開始任務，中止"
L["Unlock all"] = "全部解除鎖定"
L["Unlock this follower"] = "解鎖此追隨者"
L["Unlocks all follower and slots at once"] = "一次解鎖所有追隨者和空槽"
L["Unsafe mission start"] = "不安全的一鍵派出"
L["Upgrading to |cff00ff00%d|r"] = "升級到|cff00ff00%d|r"
L["URL Copy"] = "複製網址"
L["Use at most this many champions"] = "至少使用這個數量的勇士"
L["Use combat ally"] = "使用戰鬥盟友"
L["Use this slot"] = "使用此空槽"
L["Uses troops with the highest durability instead of the ones with the lowest"] = "使用最高耐久性的部隊，而不是最低的部隊"
L["When no free followers are available shows empty follower"] = "沒有可用的追隨者時，顯示空欄位。"
L["When we cant achieve the requested %1$s, we try to reach at least this one without (if possible) going over 100%%"] = "當我們無法實現請求的%1$s時, 我們嘗試至少達到這一目標, 而不 (如果可能) 超過100%%"
L["Would start with "] = "將會派出 "
L["You are wasting |cffff0000%d|cffffd200 point(s)!!!"] = "你浪費了|cffff0000%d|cffffd200 點數!!!"
L[ [=[You need to close and restart World of Warcraft in order to update this version of OrderHallCommander.
Simply reloading UI is not enough]=] ] = [=[您需要關閉並重新啟動魔獸世界才能更新此版本的OrderHallCommander。
簡單的重新載入UI是不夠的]=]
L["You now need to press both %s and %s to start mission"] = "您現在需要同時按下%s和%s來啟動任務"

-- Tutorial
L[ [=[%1$s and %2$s switches work together to customize how you want your mission filled

The value you set for %1$s (right now %3$s%%) is the minimum acceptable chance for attempting to achieve bonus while the value to set for %2$s (right now %4$s%%) is the chance you want achieve when you are forfaiting bonus (due to not enough powerful followers)]=] ] = [=[%1$s與%2$s一起交換運作以定制你想要任務如何分派

你為 %1$s 設置的值(目前為 %3$s%%)是最低可接受的額外獎勵機率，而為為 %2$s 設置的值(目前為 %4$s%%)是你想要實現的機率，當你是為了爭取獎勵（由於沒有足夠強大的追隨者）]=]
L[ [=[A requested window is not open
Tutorial will resume as soon as possible]=] ] = [=[請求的視窗未打開
指南將盡快恢復]=]
L[ [=[Clicking a party button will assign its followers to the current mission.
Use it to verify OHC calculated chance with Blizzard one.
If they differs please take a screenshot and open a ticket :).]=] ] = [=[點擊一個隊伍按鈕將會將其追隨者分配給當前的任務。
使用它來比較驗證OHC與暴雪計算的機率。
如果他們不同，請拍攝截圖並開啟一個問題回報:)。]=]
L[ [=[Equipment and upgrades are listed here as clickable buttons.
Due to an issue with Blizzard Taint system, drag and drop from bags raise an error.
if you drag and drop an item from a bag, you receive an error.
In order to assign equipments which are not listed (I update the list often but sometimes Blizzard is faster), you can right click the item in the bag and the left click the follower.
This way you dont receive any error]=] ] = [=[設備和升級在這裡被列為可點擊的按鈕。
由於Blizzard 系統汙染的問題，從包中拖放會導致錯誤。
如果您從包中拖放了一個物品，則會收到錯誤。
為了指定未列出的設備（我經常更新列表，但有時暴雪更快），您可以右鍵單擊包中的物品，然後左鍵單擊跟隨者。
這種方式您不會收到任何錯誤]=]
L[ [=[Equipment and upgrades are listed here as clickable buttons.
Due to an issue with Blizzard Taint system, if you drag and drop an item from a bag, you receive an error.
In order to assign equipment which are not listed (I updated the list often but sometimes Blizzard is faster), you can right click the item in the bag and the left click the follower.
This way you dont receive any error]=] ] = [=[這裡列出的裝備和升級物品是可以點擊的按鈕。
因為暴雪本身的問題，如果從背包將物品拖曳過來會發生錯誤。
為了避免有些裝備不會列出 (我已經很常更新清單了，但有時暴雪的手腳更快)，可以使用右鍵點擊背包內的物品，然後用左鍵點擊追隨者。
使用這種操作方式便不會發生錯誤。]=]
L[ [=[For example, let's say a mission can reach 95%%, 130%% and 180%% success chance.
If %1$s is set to 170%%, the 180%% one will be choosen.
If %1$s is set to 200%% OHC will try to find the nearest to 100%% respecting %2$s setting
If for example %2$s is set to 100%%, then the 130%% one will be choosen, but if %2$s is set to 90%% then the 95%% one will be choosen]=] ] = [=[例如，假設一個任務可以達到95%%，130%%和180%%的成功機會。
如果%1$s設置為170%%，則會選擇180%%。 如果%1$s 被設置為200%% OHC將嘗試找到最接近100%%
至於%2$s設置
假設%2$s設置為100%%，那麼將會選擇130%%，但如果%2$s設置為90%%，那麼將選擇95%%
假設％2$s設置為100%%，那麼將會選擇130%%，但如果％2$s設置為90%%，那麼將選擇95%%]=]
L["If instead you just want to always see the best available mission just set %1$s to 100%% and %2$s to 0%%"] = "如果您只是希望始終看到最佳可用任務，只需將%1$s設置為100%%，將%2$s設置為0%%"
L[ [=[If you dont understand why OHC choosed a setup for a mission, you can request a full analysis.
Analyze party will show all the possible combinations and how OHC evaluated them]=] ] = [=[如果你不明白OHC如何選擇一個任務的設置，你可以要求一個完整的分析。
分析隊伍將顯示所有可能的組合, 以及OHC如何評估他們]=]
L["Prefer high durability"] = "高耐久度優先"
L["Restart the tutorial"] = "重啟指南"
L[ [=[Slots (non the follower in it but just the slot) can be banned.
When you ban a slot, that slot will not be filled for that mission.
Exploiting the fact that troops are always in the leftmost slot(s) you can achieve a nice degree of custom tailoring, reducing the overall number of followers used for a mission]=] ] = [=[可以禁用欄位 (不放入追隨者，只有空的欄位)。
禁用欄位時，任務的這個欄位不會放入追隨者。
利用部隊總是從最左邊開始的原則，可以很方便的達到控制人員的效果，減少任務所需的追隨者數量。]=]
L["Terminate the tutorial. You can resume it anytime clicking on the info icon in the side menu"] = "終止本指南。您可以隨時點擊側面選單中的訊息圖標來恢復"
L["Thank you for reading this, enjoy %s"] = "感謝您的閱讀，享受%s"
L["There are %d tutorial step you didnt read"] = "還有 %d 個教學說明尚未閱讀"
L[ [=[Usually OrderHallCOmmander tries to use troops with the lowest durability in order to let you enque new troops request as soon as possible.
Checking %1$s reverse it and OrderHallCOmmander will choose for each mission troops with the highest possible durability]=] ] = "通常，OrderHallCOmmander嘗試使用最低耐久性的部隊，以便盡快請求新的部隊。 勾選%1$s反向操作，OrderHallCOmmander將為每個任務選擇盡可能高耐久度的部隊"
L[ [=[Welcome to a new release of OrderHallCommander
Please follow this short tutorial to discover all new functionalities.
You will not regret it]=] ] = [=[歡迎使用新版本的職業大廳指揮官
請閱讀這個簡短的教學說明來認識所有新功能。
保證不會後悔!]=]
L[ [=[With %1$s you ask to always counter the Hazard kill troop.
This means that OHC will try to counter it OR use a troop with just one durability left.
The target for this switch is to avoid wasting durability point, NOT to avoid troops' death.]=] ] = "至於%1$s你要求總是反制危險殺死部隊。 這意味著OHC將試圖對付它，或者使用一個只有一個耐久度的部隊。 這種切換的目標是避免浪費耐久度，而不是避免部隊死亡。"
L[ [=[With %2$s you ask to never let a troop die.
This not only implies %1$s and %3$s, but force OHC to never send to mission a troop which will die.
The target for this switch is to totally avoid killing troops, even it for this we cant fill the party]=] ] = [=[至於%2$s你要求不要讓部隊死亡。
這不僅意味著%1$s和%3$s，而且強制OHC永遠不會派一個部隊會死亡的任務。
這個轉變的目標是完全避免殺死部隊，即使這樣我們也不能填補隊伍]=]
L[ [=[You can blacklist missions right clicking mission button.
Since 1.5.1 you can start a mission witout passing from mission page shift-clicking the mission button.
Be sure you liked the party because no confirmation is asked]=] ] = [=[右鍵點擊任務可以加入忽略清單。
從 1.5.1 版開始，使用 Shift-右鍵點擊可以直接派出任務，不用進入任務頁面。
請先確定你喜歡任務的隊伍，因為不會有任何確認和詢問。
]=]
L["You can choose not to use a troop type clicking its icon"] = "您可以單擊其圖標選擇不使用的部隊類型"
L[ [=[You can choose to limit how much champions are sent together.
Right now OHC is not using more than %3$s champions in the same mission-

Note that %2$s overrides it.]=] ] = [=[您可以選擇限制一起分派的勇士數量。 現在OHC沒有在同一個任務中使用超過 %3$s 的勇士 -

請注意，%2$s會覆蓋它。]=]

return
end
