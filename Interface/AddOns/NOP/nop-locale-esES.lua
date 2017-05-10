-- localization file for esES made by annthizze
local ADDON = ...
local _ ;
local AceLocale = LibStub:GetLibrary("AceLocale-3.0");
local L = AceLocale:NewLocale(ADDON, "esES");
if not L then return end

L["NOP_TITLE"] = "New Openables"
L["NOP_VERSION"] = "|cFFFFFFFF%s use |cFFFF00FF/nop|cFFFFFFFF"

L["ALT-LeftClick and drag to move."] = "ALT-ClicIzq y arrastre para mover."
L["LeftClick to open or use."] = "ClicIzq para abrir o usar."
L["RightClick to skip item."] = "ClicDcho para omitir el objeto."
L["CTRL-RightClick to blacklist item."] = "CTRL-ClicDcho para la lista negra de objetos."
L["No openable items!"] = "¡No hay objetos que pueden abrirse!"
L["Reset and move button to middle of screen!"] = "!Resetea el botón y lo mueve al medio de la pantalla!"
L["Use: "] = "Utilizar: "
L["Spell:"] = "Hechizo:"
L["|cFFFF00FFPermanently blacklisted items:"] = "|cFFFF00FFObjetos Añadidos de forma permante a la lista negra:"
L["|cFFFF00FFPermanent blacklist is empty"] = "|cFFFF00FFLa lista negra esta vacía"
L["Permanently Blacklisted:|cFF00FF00"] = "Añadidos a la lista negra permanentemente:|cFF00FF00"
L["Session Blacklisted:|cFF00FF00"] = "Añadidos esta sesión a la Lista negra:|cFF00FF00"
L["Temporary Blacklisted:|cFF00FF00"] = "Añadidos a la lista negra temporal:|cFF00FF00"
L["|cFFFF0000Error loading tooltip for|r "] = "|cFFFF0000Se ha producido un error al cargar la ventana emergente de|r "
L["Plans, patterns and recipes cache update."] = "Cache de planos, patrones y recetas actualizada."
L["Spell patterns cache update."] = "Cache de patrones de hechizo actualizada."
L["|cFFFF0000Error loading tooltip for spell |r "] = "|cFFFF0000Se ha producido un error al cargar la ventana emergente de hechizos |r "
L["|cFFFF0000Error loading tooltip for spellID %d"] = "|cFFFF0000Se ha producido un error al cargar la ventana emergente del hechizo idientificado como %d"
L["Toggle"] = "Cambiar"
L["Skin Button"] = "Diseño del botón"
L["Masque Enable"] = true
L["Need UI reload or relogin to activate."] = true
L["Lock Button"] = "Bloquear botón"
L["Lock button in place to disbale drag."] = "Bloquea la posición del botón, no permitiendo su reubicación."
L["Glow Button"] = "Resplandor del botón"
L["When item is placed by zone change, button will have glow effect."] = "Cuando un objeto es mostrado al cambiar de zona, el botón resplandecerá."
L["Backdrop Button"] = "Backdrop Button"
L["Create or remove backdrop around button, need reload UI."] = "Create or remove backdrop around button, need reload UI."
L["Session skip"] = "Saltar sesión"
L["Skipping item last until relog."] = "Saltarse el último elemento hasta volver a conectarse."
L["Clear Blacklist"] = "Limpiar lista negra"
L["Reset Permanent blacklist."] = "Reinicia la lista negra"
L["Zone unlock"] = "Desbloquear zona"
L["Don't zone restrict openable items"] = "No restringir la zona de objetos que puedan abrirse"
L["Profession"] = "Profesión"
L["Place items usable by lockpicking"] = "Coloca los artículos puedan ser utilizados con ganzúas"
L["Button"] = "Botón"
L["Buttom location"] = "Ubicadión del botón"
L["Button size"] = "Tamaño del botón"
L["Width and Height"] = "Altura y anchura"
L["Button size in pixels"] = "Tamaño del botón en píxeles"
L["Miner's Coffee stacks"] = "Montones de Café del minero"
L["Allow buff up to this number of stacks"] = "Permite trabajar con este número de montones"
L["Quest bar"] = "Barra de objetos de misión"
L["Quest items placed on bar"] = "Los objetos de misión se colocan en la barra"
L["Visible"] = "Visible"
L["Make button visible by placing fake item on it"] = "Hace visible el botón colocando un artículo falso en él"
L["Swap"] = "Intercambiar"
L["Swap location of numbers for count and cooldown timer"] = "Intercambia la ubicación de los números para contador y temporizador de tiempo de reutilización"
L["Script"] = "Script"
L["Let button on use close unwanted windows like NPC trader, bank etc. You need enable custom scripts to run!"] = "Deje que el botón de uso cerrar ventanas no deseadas como NPC comerciante, banco, etc Usted necesita habilitar scripts personalizados para ejecutar!"
L["AutoQuest"]  = "Búsqueda automática"
L["Auto accept or hand out quests from AutoQuestPopupTracker!"] = "¡Acepte automáticamente o entregue las misiones de AutoQuestPopupTracker!"
L["Buttons per row"] = "Número de botones por línea"
L["Number of buttons placed in one row"] = "Número de botones colocados en una línea"
L["Spacing"] = "Espaciado"
L["Space between buttons"] = "Espaciado entre botones"
L["Sticky"] = "Adherir"
L["Anchor to Item button"] = "Anchura del botón de objeto"
L["Direction"] = "Dirección"
L["Expand bar to"] = "Expandir barra hacia"
L["Up"] = "Arriba"
L["Down"] = "Abajo"
L["Left"] = "Izquierda"
L["Right"] = "Derecha"
L["Add new row"] = "Añadir fila nueva"
L["Above or below last one"] = "Encima o debajo de la última"
L["Hot-Key"] = "Tecla de acceso"
L["Key to use for automatic key binding."] = "Tecla para utilizar como atajo de teclado."
L["Quest"] = "Misión"
L["Quest not found for this item."] = "No se encuentra la misión relacionada con este objeto."
L["Items cache update run |cFF00FF00%d."] = "Actualizados los objetos de cache |cFF00FF00%d."
L["Spells cache update run |cFF00FF00%d."] = "Actualizados los hechizos de cache |cFF00FF00%d."

L["CONSOLE_USAGE"] = [=[ [reset|skin|lock|clear|list|unlist|skip|glow|zone|quest|show]
reset  - Resetea la posición del botón colocándolo en el medio de la pantalla
skin   - Activa/desactiva el diseño del botón
lock   - Bloquea/desboquea el movvimiento del botón
clear  - Limpia la lista de objetos omitidos
list   - Listado de los objetos omitidos
unlist - remove single item from blacklist based on itemID
skip   - Omite temporalmente un objeto hasta su recargar la interface
glow   - Activa/desactiva el resplandor del botón al cambiar de zona
zone   - Muestra/oculta zone restriction on items
quest  - Muestra/oculta la barra de objetos de misión
show   - Muestra/oculta el botón vacío]=];
