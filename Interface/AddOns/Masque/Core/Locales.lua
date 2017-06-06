--[[
	This file is part of 'Masque', an add-on for World of Warcraft. For license information,
	please see the included License.txt file.

	* File...: Core\Locales.lua
	* Author.: StormFX

	[ Notes ]

	The contents of this file are automatically generated. Please use the localization application on WoWAce.com
	to submit translations. http://www.wowace.com/projects/masque/localization/
]]

local _, Core = ...

-- Locales Table
local L = {}

-- Thanks, Tekkub/Rabbit.
Core.Locale = setmetatable(L, {
	__index = function(self, k)
		self[k] = k
		return k
	end
})

--[[ enUS/enGB: For reference only.
L = {
	["Addon Settings"] = "Addon Settings",
	["Adjust the skin of all buttons registered to %s. This will overwrite any per-group settings."] = "Adjust the skin of all buttons registered to %s. This will overwrite any per-group settings.",
	["Adjust the skin of all buttons registered to %s: %s."] = "Adjust the skin of all buttons registered to %s: %s.",
	["Adjust the skin of all registered buttons. This will overwrite any per-add-on settings."] = "Adjust the skin of all registered buttons. This will overwrite any per-add-on settings.",
	["Backdrop Settings"] = "Backdrop Settings",
	["Causes Masque to preload its options instead of having them loaded on demand."] = "Causes Masque to preload its options instead of having them loaded on demand.",
	["Causes Masque to throw Lua errors whenever it encounters a problem with an add-on or skin."] = "Causes Masque to throw Lua errors whenever it encounters a problem with an add-on or skin.",
	["Checked"] = "Checked",
	["Click this button to load Masque's options. You can also use the %s or %s chat command."] = "Click this button to load Masque's options. You can also use the %s or %s chat command.",
	["Click to open Masque's options window."] = "Click to open Masque's options window.",
	["Color"] = "Color",
	["Colors"] = "Colors",
	["Debug Mode"] = "Debug Mode",
	["Disable"] = "Disable",
	["Disable the skinning of this group."] = "Disable the skinning of this group.",
	["Disabled"] = "Disabled",
	["Enable"] = "Enable",
	["Enable fonts provided by skins."] = "Enable fonts provided by skins.",
	["Enable the backdrop texture."] = "Enable the backdrop texture.",
	["Enable the minimap icon."] = "Enable the minimap icon.",
	["Flash"] = "Flash",
	["General"] = "General",
	["Global"] = "Global",
	["Gloss Settings"] = "Gloss Settings",
	["Highlight"] = "Highlight",
	["Load Masque Options"] = "Load Masque Options",
	["Loading Masque Options..."] = "Loading Masque Options...",
	["Masque debug mode disabled."] = "Masque debug mode disabled.",
	["Masque debug mode enabled."] = "Masque debug mode enabled.",
	["Masque is a dynamic button skinning add-on."] = "Masque is a dynamic button skinning add-on.",
	["Minimap Icon"] = "Minimap Icon",
	["Normal"] = "Normal",
	["Opacity"] = "Opacity",
	["Preload Options"] = "Preload Options",
	["Profile Settings"] = "Profile Settings",
	["Pushed"] = "Pushed",
	["Reset Skin"] = "Reset Skin",
	["Reset all skin options to the defaults."] = "Reset all skin options to the defaults.",
	["Set the color of the backdrop texture."] = "Set the color of the backdrop texture.",
	["Set the color of the checked texture."] = "Set the color of the checked texture.",
	["Set the color of the disabled texture."] = "Set the color of the disabled texture.",
	["Set the color of the flash texture."] = "Set the color of the flash texture.",
	["Set the color of the gloss texture."] = "Set the color of the gloss texture.",
	["Set the color of the highlight texture."] = "Set the color of the highlight texture.",
	["Set the color of the normal texture."] = "Set the color of the normal texture.",
	["Set the color of the pushed texture."] = "Set the color of the pushed texture.",
	["Set the intensity of the gloss color."] = "Set the intensity of the gloss color.",
	["Set the skin for this group."] = "Set the skin for this group.",
	["Skin"] = "Skin",
	["This section will allow you to skin the buttons of the add-ons and add-on groups registered with Masque."] = "This section will allow you to skin the buttons of the add-ons and add-on groups registered with Masque.",
}
]]

do
	local LOC = GetLocale()
	if LOC == "deDE" then
L["Addons"] = "Addons"
L["Adjust the skin of all buttons registered to %s. This will overwrite any per-group settings."] = "Passe die Optik aller Buttons, die auf %s registriert sind, an. Dies überschreibt alle gruppenspezifischen Einstellungen."
L["Adjust the skin of all buttons registered to %s: %s."] = "Passe die Optik aller Buttons, die auf %s: %s registriert sind, an."
L["Adjust the skin of all registered buttons. This will overwrite any per-add-on settings."] = "Passe den Optik aller registrierten Buttons an. Dies überschreibt alle addonspezifischen Einstellungen."
L["Backdrop Settings"] = "Hintergruneinstellungen"
L["Causes Masque to preload its options instead of having them loaded on demand."] = "Veranlasst Masque, die Optionen im Voraus zu laden, anstatt bei Bedarf."
L["Causes Masque to throw Lua errors whenever it encounters a problem with an add-on or skin."] = "Veranlasst Masque Lua-Fehler auszugeben, wann immer es ein Problem mit einem Addon oder einer Optik gibt."
L["Checked"] = "Ausgewählt"
L["Click this button to load Masque's options. You can also use the %s or %s chat command."] = "Klicken, um die Masque-Optionen zu laden. Du kannst dazu auch den Chatbefehl %s oder %s verwenden."
L["Click to open Masque's options window."] = "Klicken, um Masques Optionensfenster zu öffnen."
L["Color"] = "Farbe"
L["Colors"] = "Farben"
L["Debug Mode"] = "Debugmodus"
L["Disable"] = "Deaktivieren"
L["Disable the skinning of this group."] = "Deaktiviert die Aussehensveränderung dieser Gruppe."
L["Disabled"] = "Deaktiviert"
L["Enable"] = "Aktivieren"
L["Enable fonts provided by skins."] = "Aktiviert Schriften, die von Optiken bereitgestellt werden"
L["Enable the backdrop texture."] = "Aktiviert die Hintergrundtextur."
L["Enable the minimap icon."] = "Aktiviert das Minikartensymbol"
L["Flash"] = "Leuchten"
L["General"] = "Allgemein"
L["Global"] = "Global"
L["Gloss Settings"] = "Glanzeinstellungen"
L["Highlight"] = "Hervorheben"
L["Load Masque Options"] = "Masque-Optionen laden"
L["Loading Masque Options..."] = "Lädt Masque-Optionen..."
L["Masque debug mode disabled."] = "Masque Debugmodus deaktiviert."
L["Masque debug mode enabled."] = "Masque Debugmodus aktiviert."
L["Masque is a dynamic button skinning add-on."] = "Masque ist ein Addon zur Anpassung der Buttonoptiken."
L["Minimap Icon"] = "Minikartensymbol"
L["Normal"] = "Normal"
L["Opacity"] = "Transparenz"
L["Preload Options"] = "Vorausladeoptionen"
L["Profiles"] = "Profile"
L["Pushed"] = "Gedrückt"
L["Reset all skin options to the defaults."] = "Setzt alle Optikoptionen auf Standard zurück."
L["Reset Skin"] = "Optik zurücksetzen"
L["Set the color of the backdrop texture."] = "Lege die Farbe der Hintergrundtextur fest"
L["Set the color of the checked texture."] = "Lege die Farbe der Markiert-Textur fest"
L["Set the color of the disabled texture."] = "Lege die Farbe der Deaktiviert-Textur fest"
L["Set the color of the flash texture."] = "Lege die Farbe der Leucht-Textur fest"
L["Set the color of the gloss texture."] = "Lege die Farbe der Glanz-Textur fest"
L["Set the color of the highlight texture."] = "Lege die Farbe Hervorgehoben-Textur"
L["Set the color of the normal texture."] = "Lege die Farbe der Normal-Textur fest"
L["Set the color of the pushed texture."] = "Lege die Farbe der Gedrückt-Textur fest"
L["Set the intensity of the gloss color."] = "Lege die Intensität der Glanzfarbe fest."
L["Set the skin for this group."] = "Lege die Optik dieser Gruppe fest"
L["Skin"] = "Optik"
L["This section will allow you to skin the buttons of the add-ons and add-on groups registered with Masque."] = "Dieser Abschnitt ermöglicht es dir, das Aussehen von Buttons der Addons und Addongruppen anzupassen, die mit Masque verbunden sind."

-- ToC
L["A dynamic button skinning add-on."] = "Ein Addon zur dynamischen Änderung der Buttonoptiken."

	elseif LOC == "esES" or LOC == "esMX" then
L["Addons"] = "Botones"
L["Adjust the skin of all buttons registered to %s. This will overwrite any per-group settings."] = "Ajusta la apariencia de todos los botones registrados a %s. Esto sobreescribirá la configuracion de los grupos."
L["Adjust the skin of all buttons registered to %s: %s."] = "Ajusta la apariencia de todos los botones registrados a %s: %s."
L["Adjust the skin of all registered buttons. This will overwrite any per-add-on settings."] = "Ajusta la apariencia de todos los botones registrados. Esto sobreescribirá la configuración de los grupos."
L["Backdrop Settings"] = "Opciones de Fondo"
L["Causes Masque to preload its options instead of having them loaded on demand."] = "Precargar las opciones de Masque, en vez de cargarlos bajo demando."
L["Causes Masque to throw Lua errors whenever it encounters a problem with an add-on or skin."] = "Mostrar errores Lua al encontrar una problema con un add-on o una tema."
L["Checked"] = "Activado"
L["Click this button to load Masque's options. You can also use the %s or %s chat command."] = "Haz click en este botón para cargar las opciones de Masque. Puedes también utilizar los comandos de chat %s o %s."
L["Click to open Masque's options window."] = "Clic para mostrar las opciones de Masque."
L["Color"] = "Color"
L["Colors"] = "Colores"
L["Debug Mode"] = "Depuración"
L["Disable"] = "Desactivado"
L["Disable the skinning of this group."] = "Deshabilitar las texturas para este grupo."
L["Disabled"] = "Desactivado"
L["Enable"] = "Activado"
L["Enable fonts provided by skins."] = "Usar las tipas de letra proporcionadas por temas."
L["Enable the backdrop texture."] = "Habilitar la textura de fondo."
L["Enable the minimap icon."] = "Mostrar un icono en el minimapa"
L["Flash"] = "Destello"
L["General"] = "General"
L["Global"] = "Global"
L["Gloss Settings"] = "Opciones de Brillo"
L["Highlight"] = "Resaltado"
L["Load Masque Options"] = "Cargar las opciones de Masque"
L["Loading Masque Options..."] = "Cargando las opciones de Masque"
L["Masque debug mode disabled."] = "La depuración de Masque se ha desactivada."
L["Masque debug mode enabled."] = "La depuración de Masque se ha activada."
L["Masque is a dynamic button skinning add-on."] = "Un add-on para cambiar la aparencia de botones."
L["Minimap Icon"] = "Icono en minimapa"
L["Normal"] = "Normal"
L["Opacity"] = "Opacidad"
L["Preload Options"] = "Precargar opciones"
L["Profiles"] = "Perfiles"
L["Pushed"] = "Pulsado"
L["Reset all skin options to the defaults."] = "Reestablece todos los colores a los predefinidos"
L["Reset Skin"] = "Restablecer Colores"
L["Set the color of the backdrop texture."] = "Cambiar el color de la textura del fondo."
L["Set the color of the checked texture."] = "Establece el color de la textura activada"
L["Set the color of the disabled texture."] = "Establece el color de la textura desactivada"
L["Set the color of the flash texture."] = "Establece el color del textura destelleando"
L["Set the color of the gloss texture."] = "Establece el color de la textura brillando"
L["Set the color of the highlight texture."] = "Establece el color de la textura resaltada"
L["Set the color of the normal texture."] = "Establece el color de la textura normal"
L["Set the color of the pushed texture."] = "Establece el color de la textura pulsada"
L["Set the intensity of the gloss color."] = "Cambiar la transparencia de la textura brillando"
L["Set the skin for this group."] = "Seleccionar la tema para este grupo."
L["Skin"] = "Textura"
L["This section will allow you to skin the buttons of the add-ons and add-on groups registered with Masque."] = "Estas opciones te permiten cambiar la aparencia de los botones de los add-ons que se han registrados en Masque."

-- ToC
L["A dynamic button skinning add-on."] = "Cambiar dinamicamente la aparencia de botones."

	elseif LOC == "frFR" then
L["Addons"] = "Boutons"
L["Adjust the skin of all buttons registered to %s. This will overwrite any per-group settings."] = "Ajuster le skin (style) de tous les boutons enregistrés sous %s. Ceci va écraser les réglages \"par groupe\"."
L["Adjust the skin of all buttons registered to %s: %s."] = "Ajuster le skin (style) de tous les boutons enregistrés sous %s: %s."
L["Adjust the skin of all registered buttons. This will overwrite any per-add-on settings."] = "Ajuster le skin (style) de tous les boutons enregistrés. Ceci va écraser les réglages des autres addons."
L["Backdrop Settings"] = "Paramètres du fond"
L["Causes Masque to preload its options instead of having them loaded on demand."] = "Masque pré-chargera ses options au lieu de les charger sur demande."
L["Causes Masque to throw Lua errors whenever it encounters a problem with an add-on or skin."] = "Masque ignorera les erreurs Lua lorsqu'il rencontre un problème avec un add-on ou un skin (style)."
L["Checked"] = "Coché"
L["Click this button to load Masque's options. You can also use the %s or %s chat command."] = "Appuyez sur ce bouton pour charger les options de Masque. Vous pouvez aussi utiliser les commandes %s ou %s dans le chat (fenêtre de discussion)."
L["Click to open Masque's options window."] = "Cliquez pour ouvrir la fenêtre des options de Masque."
L["Color"] = "Couleur"
L["Colors"] = "Couleurs"
L["Debug Mode"] = "Mode débogage"
L["Disable"] = "Désactiver"
L["Disable the skinning of this group."] = "Désactiver le skin (style) de ce groupe."
L["Disabled"] = "Désactivé"
L["Enable"] = "Activer"
L["Enable fonts provided by skins."] = "Active les polices d'écriture fournies par les skins."
L["Enable the backdrop texture."] = "Activer la texture de fond."
L["Enable the minimap icon."] = "Active l'icône de la minicarte."
L["Flash"] = "Flash"
L["General"] = "Général"
L["Global"] = "Global"
L["Gloss Settings"] = "Paramètres du vernis"
L["Highlight"] = "Surbrillance"
L["Load Masque Options"] = "Charger les options de Masque"
L["Loading Masque Options..."] = "Chargement des options de Masque..."
L["Masque debug mode disabled."] = "Débogage de Masque désactivé."
L["Masque debug mode enabled."] = "Débogage de Masque activé."
L["Masque is a dynamic button skinning add-on."] = "Masque est un add-on modulaire destiné au skin (style)."
L["Minimap Icon"] = "Icône de la minicarte"
L["Normal"] = "Normal"
L["Opacity"] = "Opacité"
L["Preload Options"] = "Précharger les options."
L["Profiles"] = "Profils"
L["Pushed"] = "Enfoncé"
L["Reset all skin options to the defaults."] = "Restaure les couleurs par défauts."
L["Reset Skin"] = "Réinit. toutes les couleurs"
L["Set the color of the backdrop texture."] = "Définir la couleur de la texture de fond."
L["Set the color of the checked texture."] = "Définir la couleur de la texture cochée."
L["Set the color of the disabled texture."] = "Définir la couleur de la texture désactivée."
L["Set the color of the flash texture."] = "Définir la couleur de la texture clignotante."
L["Set the color of the gloss texture."] = "Définir la couleur de la texture du vernis. "
L["Set the color of the highlight texture."] = "Définir la couleur de la surbrillance."
L["Set the color of the normal texture."] = "Définir la couleur de la texture normale."
L["Set the color of the pushed texture."] = "Définir la couleur de la texture appuyée."
L["Set the intensity of the gloss color."] = "Définir l’intensité de la couleur du vernis."
L["Set the skin for this group."] = "Définir le skin (style) pour ce groupe."
L["Skin"] = "Skin"
L["This section will allow you to skin the buttons of the add-ons and add-on groups registered with Masque."] = "Cette section vous permet de définir le skin (style) des boutons des add-ons et des groupes d'add-ons enregistrés avec Masque."

-- ToC
L["A dynamic button skinning add-on."] = "Un add-on de skinnage dynamique des boutons."

	elseif LOC == "koKR" then
L["Addons"] = "애드온"
L["Adjust the skin of all buttons registered to %s. This will overwrite any per-group settings."] = "%s|1으로;로; 등록된 모든 버튼의 스킨을 조절합니다. 이 옵션은 그룹당 설정은 어떤 것이던지 덧씌우게 됩니다."
L["Adjust the skin of all buttons registered to %s: %s."] = "%s: %s|1으로;로; 등록된 모든 버튼의 스킨을 조절합니다."
L["Adjust the skin of all registered buttons. This will overwrite any per-add-on settings."] = "등록된 모든 버튼의 스킨을 조절합니다. 이 옵션은 애드온당 설정은 어떤 것이던지 덧씌우게 됩니다."
L["Backdrop Settings"] = "바탕 설정"
L["Causes Masque to preload its options instead of having them loaded on demand."] = "Masque가 그것의 옵션을 요청시 불러들이는 대신에 미리 불러들이도록 합니다.  "
L["Causes Masque to throw Lua errors whenever it encounters a problem with an add-on or skin."] = "Masque가 애드온 혹은 스킨과의 문제에 부닥칠 때마다 언제든지 Lua 오류화하도록 합니다. "
L["Checked"] = "선택된 버튼"
L["Click this button to load Masque's options. You can also use the %s or %s chat command."] = "Masque 옵션을 불러들이려면 이 버튼을 클릭하세요. %s 혹은 %s 대화 명령어 또한 사용할 수 있습니다."
L["Click to open Masque's options window."] = "Masque의 옵션창을 열려면 클릭하세요."
L["Color"] = "색상"
L["Colors"] = "색상"
L["Debug Mode"] = "디버그 모드"
L["Disable"] = "비활성화"
L["Disable the skinning of this group."] = "이 그룹의 스킨 씌우기를 비활성화합니다."
L["Disabled"] = "비활성화된 버튼"
L["Enable"] = "활성화"
L["Enable fonts provided by skins."] = "스킨에 의해 제공되는 글꼴을 활성화 합니다."
L["Enable the backdrop texture."] = "바탕 텍스쳐를 활성화합니다."
L["Enable the minimap icon."] = "미니맵 아이콘을 활성화 합니다."
L["Flash"] = "번쩍임"
L["General"] = "일반"
L["Global"] = "공통 옵션"
L["Gloss Settings"] = "광택 효과 설정"
L["Highlight"] = "강조된 버튼"
L["Load Masque Options"] = "Masque 옵션 불러들이기"
L["Loading Masque Options..."] = "Masque 옵션을 불려 오는 중..."
L["Masque debug mode disabled."] = "Masque 디버그 모드를 비활성화합니다."
L["Masque debug mode enabled."] = "Masque 디버그 모드를 활성화합니다."
L["Masque is a dynamic button skinning add-on."] = "Masque는 동적인 버튼 스킨 입히기 애드온 입니다."
L["Minimap Icon"] = "미니맵 아이콘"
L["Normal"] = "평상 시 버튼"
L["Opacity"] = "불투명도"
L["Preload Options"] = "미리 불러들이기 옵션"
L["Profiles"] = "프로필"
L["Pushed"] = "눌려진 버튼"
L["Reset all skin options to the defaults."] = "모든 색상을 기본값으로 초기화 합니다."
L["Reset Skin"] = "스킨 초기화"
L["Set the color of the backdrop texture."] = "바탕 텍스쳐의 색상을 설정합니다."
L["Set the color of the checked texture."] = "선택된 버튼 텍스처의 색상을 변경합니다."
L["Set the color of the disabled texture."] = "비활성화된 버튼 텍스처의 색상을 변경합니다."
L["Set the color of the flash texture."] = "번쩍임 텍스처의 색상을 변경합니다."
L["Set the color of the gloss texture."] = "광택 효과 텍스처의 색상을 변경합니다."
L["Set the color of the highlight texture."] = "강조된 버튼 텍스처의 색상을 변경합니다."
L["Set the color of the normal texture."] = "평상 시 버튼 텍스처의 색상을 변경합니다."
L["Set the color of the pushed texture."] = "눌려진 버튼 텍스처의 색상을 변경합니다."
L["Set the intensity of the gloss color."] = "번들거림 색상의 농도를 설정합니다."
L["Set the skin for this group."] = "이 그룹을 위한 스킨을 설정합니다."
L["Skin"] = "스킨"
L["This section will allow you to skin the buttons of the add-ons and add-on groups registered with Masque."] = "이 항목은 Masque와 함께 등록된 애드온과 애드온 그룹의 버튼의 스킨을 씌울 수 있도록 합니다."

-- ToC
L["A dynamic button skinning add-on."] = "동적인 버튼 스킨 입히기 애드온 입니다."

	elseif LOC == "ruRU" then
L["Addons"] = "Модификации"
L["Adjust the skin of all buttons registered to %s. This will overwrite any per-group settings."] = "Позволяет редактировать скины всех панелей, под управлением %s. Это переопределит все групповые настройки."
L["Adjust the skin of all buttons registered to %s: %s."] = "Позволяет редактировать скины всех панелей, под управлением %s: %s."
L["Adjust the skin of all registered buttons. This will overwrite any per-add-on settings."] = "Позволяет редактировать скины всех доступных панелей. Это переопределит все настройки отдельных аддонов."
L["Backdrop Settings"] = "Настройки фона"
L["Causes Masque to preload its options instead of having them loaded on demand."] = "Заставляет Masque загружать настройки при старте игры, вместо загрузки по запросу."
L["Causes Masque to throw Lua errors whenever it encounters a problem with an add-on or skin."] = "Заставляет Masque выдавать ошибки Lua, с чем бы они не были связаны: аддоном или скином."
L["Checked"] = "При выделении"
L["Click this button to load Masque's options. You can also use the %s or %s chat command."] = "Нажмите эту кнопку, чтобы загрузить настройки Masque. Также можно использовать команды %s или %s."
L["Click to open Masque's options window."] = "ЛКМ для открытия настроек Masque."
L["Color"] = "Цвет"
L["Colors"] = "Цвета"
L["Debug Mode"] = "Режим отладки"
L["Disable"] = "Отключить"
L["Disable the skinning of this group."] = "Отключить скины для этой группы."
L["Disabled"] = "Отключенный"
L["Enable"] = "Включить"
L["Enable fonts provided by skins."] = "Использовать шрифты, прикрепленные к скинам."
L["Enable the backdrop texture."] = "Включить настройки фона текстуры."
L["Enable the minimap icon."] = "Отображать иконку у миникарты."
L["Flash"] = "Сверкание"
L["General"] = "Общее"
L["Global"] = "Общее"
L["Gloss Settings"] = "Настройки глянца"
L["Highlight"] = "При наведении"
L["Load Masque Options"] = "Загрузить настройки"
L["Loading Masque Options..."] = "Загрузка настроек..."
L["Masque debug mode disabled."] = "Режим отладки Masque отключен."
L["Masque debug mode enabled."] = "Режим отладки Masque включен."
L["Masque is a dynamic button skinning add-on."] = "Masque - аддон, позволяющий добавлять скины к панелям команд."
L["Minimap Icon"] = "Иконка у миникарты"
L["Normal"] = "Нормальный"
L["Opacity"] = "Непрозрачность"
L["Preload Options"] = "Загрузка настроек при запуске"
L["Profiles"] = "Профили"
L["Pushed"] = "При нажатии"
L["Reset all skin options to the defaults."] = "Установить значения цветов по умолчанию."
L["Reset Skin"] = "Сбросить цвета"
L["Set the color of the backdrop texture."] = "Установить цвет фона текстуры."
L["Set the color of the checked texture."] = "Установить цвет текстуры при выделении."
L["Set the color of the disabled texture."] = "Установить цвет отключенной текстуры."
L["Set the color of the flash texture."] = "Установить цвет текстуры с подсветкой."
L["Set the color of the gloss texture."] = "Задать цвет для глянца текстур."
L["Set the color of the highlight texture."] = "Установить цвет текстуры при наведении."
L["Set the color of the normal texture."] = "Установить нормальный цвет текстуры."
L["Set the color of the pushed texture."] = "Установить цвет текстуры при нажатии."
L["Set the intensity of the gloss color."] = "Установить интенсивность глянца."
L["Set the skin for this group."] = "Установить скин для данной группы."
L["Skin"] = "Скины"
L["This section will allow you to skin the buttons of the add-ons and add-on groups registered with Masque."] = "Этот раздел позволяет настроить скины для панелей команд аддонов и групп аддонов, использующих Masque."

-- ToC
L["A dynamic button skinning add-on."] = "Аддон для добавления скинов к панелям команд."

	elseif LOC == "zhCN" then
L["Addons"] = "插件"
L["Adjust the skin of all buttons registered to %s. This will overwrite any per-group settings."] = "将皮肤应用到所有已注册到%s的按钮上。这会覆盖所有群组的设定。"
L["Adjust the skin of all buttons registered to %s: %s."] = "将皮肤应用到所有已注册到%s：%s的按钮上。"
L["Adjust the skin of all registered buttons. This will overwrite any per-add-on settings."] = "将皮肤应用到所有已注册的按钮上。这会覆盖所有插件的设定。"
L["Backdrop Settings"] = "背景设置"
L["Causes Masque to preload its options instead of having them loaded on demand."] = "让 Masque 预载入其选项，而不是需要的时候才载入。"
L["Causes Masque to throw Lua errors whenever it encounters a problem with an add-on or skin."] = "无论何时 Masque 遇到了一个插件问题或者皮肤问题，都让其屏蔽 Lua 错误。"
L["Checked"] = "已选中"
L["Click this button to load Masque's options. You can also use the %s or %s chat command."] = "单击这个按钮来载入 Masque 的选项。你也可以使用%s或%s命令来实现。"
L["Click to open Masque's options window."] = "点击打开 Masque 选项窗口。"
L["Color"] = "颜色"
L["Colors"] = "颜色"
L["Debug Mode"] = "调试模式"
L["Disable"] = "禁用"
L["Disable the skinning of this group."] = "禁用此群组换肤。"
L["Disabled"] = "已禁用"
L["Enable"] = "启用"
L["Enable fonts provided by skins."] = "启用皮肤提供的字体。"
L["Enable the backdrop texture."] = "启用背景材质。"
L["Enable the minimap icon."] = "启用小地图图标。"
L["Flash"] = "闪光"
L["General"] = "一般"
L["Global"] = "全局"
L["Gloss Settings"] = "光泽设置"
L["Highlight"] = "高亮"
L["Load Masque Options"] = "载入 Masque 选项"
L["Loading Masque Options..."] = "Masque 选项载入中……"
L["Masque debug mode disabled."] = "Masque 调试模式禁用。"
L["Masque debug mode enabled."] = "Masque 调试模式启用。"
L["Masque is a dynamic button skinning add-on."] = "Masque 是一款模块化插件换肤引擎。"
L["Minimap Icon"] = "小地图图标"
L["Normal"] = "正常"
L["Opacity"] = "不透明度"
L["Preload Options"] = "预载入选项"
L["Profiles"] = "配置文件"
L["Pushed"] = "加粗"
L["Reset all skin options to the defaults."] = "重置所有皮肤选项为默认。"
L["Reset Skin"] = "重置皮肤"
L["Set the color of the backdrop texture."] = "设置背景材质颜色"
L["Set the color of the checked texture."] = "设置已选中材质颜色。"
L["Set the color of the disabled texture."] = "设置已禁用材质颜色。"
L["Set the color of the flash texture."] = "设置闪光材质颜色。"
L["Set the color of the gloss texture."] = "设置光泽材质颜色。"
L["Set the color of the highlight texture."] = "设置高亮材质颜色。"
L["Set the color of the normal texture."] = "设置一般材质颜色。"
L["Set the color of the pushed texture."] = "设置加粗材质颜色。"
L["Set the intensity of the gloss color."] = "设置光泽颜色亮度。"
L["Set the skin for this group."] = "为此群组设置皮肤。"
L["Skin"] = "皮肤"
L["This section will allow you to skin the buttons of the add-ons and add-on groups registered with Masque."] = "这个部分将允许你将使用 Masque 注册的插件与插件群组的按钮进行换肤。"

-- ToC
L["A dynamic button skinning add-on."] = "一个动态按钮皮肤插件。"

	elseif LOC == "zhTW" then
L["Addons"] = "插件"
L["Adjust the skin of all buttons registered to %s. This will overwrite any per-group settings."] = "將所有按鈕的佈景主題套用到%s。這會覆蓋所有群組的設定。"
L["Adjust the skin of all buttons registered to %s: %s."] = "將所有按鈕的佈景主題套用到%s：%s。"
L["Adjust the skin of all registered buttons. This will overwrite any per-add-on settings."] = "將佈景主題套用到所有按鈕。這會覆蓋所有的插件設定。"
L["Backdrop Settings"] = "背景設定"
L["Causes Masque to preload its options instead of having them loaded on demand."] = "讓Masque預先載入設定，而不是需要的時候才載入。"
L["Causes Masque to throw Lua errors whenever it encounters a problem with an add-on or skin."] = "每當遭遇插件或是佈景問題都會讓Masque丟出Lua錯誤。"
L["Checked"] = "已勾選"
L["Click this button to load Masque's options. You can also use the %s or %s chat command."] = "點擊按鈕載入Masque的設定。你也可以使用%s或是%s聊天指令。"
L["Click to open Masque's options window."] = "點擊開啟Masque的設定視窗。"
L["Color"] = "顏色"
L["Colors"] = "顏色"
L["Debug Mode"] = "除錯模式"
L["Disable"] = "禁用"
L["Disable the skinning of this group."] = "禁止佈景主題套用在此群組。"
L["Disabled"] = "已禁用"
L["Enable"] = "啟用"
L["Enable fonts provided by skins."] = "啟用由佈景主題提供的字型。"
L["Enable the backdrop texture."] = "啟用背景材質。"
L["Enable the minimap icon."] = "啟用小地圖圖示。"
L["Flash"] = "閃光"
L["General"] = "一般"
L["Global"] = "全域"
L["Gloss Settings"] = "光澤設定"
L["Highlight"] = "高亮"
L["Load Masque Options"] = "載入Masque設定"
L["Loading Masque Options..."] = "正在載入Masque設定中..."
L["Masque debug mode disabled."] = "Masque除錯模式已禁用。"
L["Masque debug mode enabled."] = "Masque除錯模式已啟用。"
L["Masque is a dynamic button skinning add-on."] = "Masque 為可動態變換按鈕佈景主題的插件。"
L["Minimap Icon"] = "小地圖圖示"
L["Normal"] = "一般"
L["Opacity"] = "不透明度"
L["Preload Options"] = "預載設定"
L["Profiles"] = "設定檔"
L["Pushed"] = "按下"
L["Reset all skin options to the defaults."] = "重置所有佈景主題為預設值。"
L["Reset Skin"] = "重置佈景主題"
L["Set the color of the backdrop texture."] = "設定背景材質顏色。"
L["Set the color of the checked texture."] = "設定已勾選材質顏色。"
L["Set the color of the disabled texture."] = "設定已禁用材質顏色。"
L["Set the color of the flash texture."] = "設定閃光材質顏色。"
L["Set the color of the gloss texture."] = "設定光澤材質顏色。"
L["Set the color of the highlight texture."] = "設定高亮材質顏色。"
L["Set the color of the normal texture."] = "設定一般材質顏色。"
L["Set the color of the pushed texture."] = "設定按下材質顏色。"
L["Set the intensity of the gloss color."] = "設定光澤顏色亮度。"
L["Set the skin for this group."] = "設定佈景主題套用在此群組。"
L["Skin"] = "佈景主題"
L["This section will allow you to skin the buttons of the add-ons and add-on groups registered with Masque."] = "此區塊允許使用者將註冊在Masque底下的插件按鈕套用佈景主題。"

-- ToC
L["A dynamic button skinning add-on."] = "動態套用按鈕佈景主題的插件。"

	end
end
