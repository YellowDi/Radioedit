		------------------------------------------------
		-- Paragon Reputation 1.16 by Sev US-Drakkari --
		------------------------------------------------

		  --[[	  Special thanks to Ammako for
				  helping me with the vars and
				  the options.						]]--		

local L = ParagonReputation -- SetStrings
local LOCALE = GetLocale() -- GetClientLocale

-- Spanish
if LOCALE == "esES" or LOCALE == "esMX" then
	L["PARAGON"] = "Paragón"
	L["OPTIONDESC"] = "Estas opciones te permiten personalizar algunas cosas de Paragon Reputation."
	L["TOASTDESC"] = "Activa o desactiva una ventana que te avisara cuando tengas una recompensa Paragón."
	L["LABEL001"] = "Colores de las Barras"
	L["LABEL002"] = "Formato del Texto"
	L["LABEL003"] = "Aviso de Recompensa"
	L["BLUE"] = "Azul Paragón"
	L["GREEN"] = "Verde Predeterminado"
	L["YELLOW"] = "Amarillo Neutral"
	L["ORANGE"] = "Naranja Adverso"
	L["RED"] = "Rojo Clarito"
	L["DEFICIT"] = "Déficit de Reputación"
	L["SOUND"] = "Sonido de Advertencia"
	L["ANCHOR"] = "Posicionar el Ancla"
	
-- Italian (MISSING TRANSLATIONS)
elseif LOCALE == "itIT" then
	L["PARAGON"] = "Eccellenza"
	L["OPTIONDESC"] = "This options allow you to customize some settings of Paragon Reputation."
	L["TOASTDESC"] = "Toggle a toast window that will warn you when you have a Paragon Reward."
	L["LABEL001"] = "Bars Color"
	L["LABEL002"] = "Text Format"
	L["LABEL003"] = "Reward Toast"
	L["BLUE"] = "Paragon Blue"
	L["GREEN"] = "Default Green"
	L["YELLOW"] = "Neutral Yellow"
	L["ORANGE"] = "Unfriendly Orange"
	L["RED"] = "Lightish Red"
	L["DEFICIT"] = "Reputation Deficit"
	L["SOUND"] = "Sound Warning"
	L["ANCHOR"] = "Toggle Anchor"

-- Portuguese (Thanks tiagopl)
elseif LOCALE == "ptBR" then
	L["PARAGON"] = "Paragão"
	L["OPTIONDESC"] = "Essas opções permitem que você customize algumas configurações do Paragon Reputation."
	L["TOASTDESC"] = "Ativa uma janela que vai te avisar quando você tiver uma Recompensa de Paragão."
	L["LABEL001"] = "Cor das Barras"
	L["LABEL002"] = "Formato do Texto"
	L["LABEL003"] = "Janela de Recompensa"
	L["BLUE"] = "Azul Paragão"
	L["GREEN"] = "Verde Padrão"
	L["YELLOW"] = "Amarelo Neutro"
	L["ORANGE"] = "Laranja Hostil"
	L["RED"] = "Vermelho Lavado"
	L["DEFICIT"] = "Déficit de Reputação"
	L["SOUND"] = "Aviso Sonoro"
	L["ANCHOR"] = "Alternar Âncora"

-- German (Thanks flow0284 & z3r0t3n)
elseif LOCALE == "deDE" then
	L["PARAGON"] = "Huldigend"
	L["OPTIONDESC"] = "Mit diesen Einstellungen können einige Anpassungen an Paragon Reputation vorgenommen werden."
	L["TOASTDESC"] = "Aktiviert/Deaktiviert die Benachrichtigung, die angezeigt wird wenn eine Huldigend Rufbelohnung verfügbar ist."
	L["LABEL001"] = "Balkenfarbe"
	L["LABEL002"] = "Textformatierung"
	L["LABEL003"] = "Benachrichtigung"
	L["BLUE"] = "Blau"
	L["GREEN"] = "Grün"
	L["YELLOW"] = "Gelb"
	L["ORANGE"] = "Orange"
	L["RED"] = "Leuchtendrot"
	L["DEFICIT"] = "Rufdefizit"
	L["SOUND"] = "Benachrichtungston"
	L["ANCHOR"] = "Position zeigen/verbergen"

-- French (Thanks HipNoTiK_007)
elseif LOCALE == "frFR" then
	L["PARAGON"] = "Parangon"
	L["OPTIONDESC"] = "Ces options permettent de régler plusieurs paramètres de l'addon."
	L["TOASTDESC"] = "Affiche une alerte lorsque vous avez une récompenses de Parangon disponible."
	L["LABEL001"] = "Couleur Barres"
	L["LABEL002"] = "Format Texte"
	L["LABEL003"] = "Notification Récompense"
	L["BLUE"] = "Bleu Parangon"
	L["GREEN"] = "Vert Par défaut"
	L["YELLOW"] = "Jaune Neutre"
	L["ORANGE"] = "Orange Inamical"
	L["RED"] = "Rosé"
	L["DEFICIT"] = "Réputation manquante"
	L["SOUND"] = "Alerte sonore"
	L["ANCHOR"] = "Activer/Désactiver Ancre"

-- Russian (Thanks Wolfeg)
elseif LOCALE == "ruRU" then
	L["PARAGON"] = "Парагон"
	L["OPTIONDESC"] = "Эти опции позволяют вам кастомизировать настройки аддона Paragon Reputation."
	L["TOASTDESC"] = "Включить информационное окно о достижении достаточной репутации для получения награды."
	L["LABEL001"] = "Цвет полос"
	L["LABEL002"] = "Формат текста"
	L["LABEL003"] = "Окно награды"
	L["BLUE"] = "Совершенный голубой"
	L["GREEN"] = "Стандартный зеленый"
	L["YELLOW"] = "Нейтрально желтый"
	L["ORANGE"] = "Враждебный оранжевый"
	L["RED"] = "Высветленный красный"
	L["DEFICIT"] = "Необходимая репутация"
	L["SOUND"] = "Звуковое предупреждение"
	L["ANCHOR"] = "Показать фиксатор"

-- Korean (Thanks yuk6196)
elseif LOCALE == "koKR" then
	L["PARAGON"] = "불멸의 동맹"
	L["OPTIONDESC"] = "Paragon Reputation의 여러 설정을 변경할 수 있는 옵션입니다."
	L["TOASTDESC"] = "불멸의 동맹 보상을 받을 수 있을 때 알려주는 알림창을 켜고 끕니다."
	L["LABEL001"] = "바 색상"
	L["LABEL002"] = "문자 형식"
	L["LABEL003"] = "보상 알림창"
	L["BLUE"] = "불멸의 동맹 푸른색"
	L["GREEN"] = "기본 녹색"
	L["YELLOW"] = "중립 노란색"
	L["ORANGE"] = "적대적 주황색"
	L["RED"] = "밝은 붉은색"
	L["DEFICIT"] = "평판 결손치"
	L["SOUND"] = "소리 경보"
	L["ANCHOR"] = "고정기 위치"

-- Chinese (Simplified)
elseif LOCALE == "zhCN" then
	L["PARAGON"] = "巅峰"
	L["OPTIONDESC"] = "自定义巅峰声望条。"
	L["TOASTDESC"] = "获得声望奖励时弹出通知"
	L["LABEL001"] = "声望条颜色"
	L["LABEL002"] = "文字格式"
	L["LABEL003"] = "弹出奖励通知"
	L["BLUE"] = "蓝色"
	L["GREEN"] = "绿色"
	L["YELLOW"] = "黄色"
	L["ORANGE"] = "橘色"
	L["RED"] = "粉色"
	L["DEFICIT"] = "还需多少声望"
	L["SOUND"] = "音效通知"
	L["ANCHOR"] = "改变位置"

-- Chinese (Traditional) (Thanks gaspy10 & BNSSNB)
elseif LOCALE == "zhTW" then
	L["PARAGON"] = "巅峰"
	L["OPTIONDESC"] = "這些選項可讓你自訂巔峰聲望條的一些設定。"
	L["TOASTDESC"] = "切換獲得巔峰聲望獎勵時的彈出式通知。"
	L["LABEL001"] = "聲望條顏色"
	L["LABEL002"] = "文字格式"
	L["LABEL003"] = "彈出獎勵通知"
	L["BLUE"] = "巔峰藍"
	L["GREEN"] = "預設綠"
	L["YELLOW"] = "中立黃"
	L["ORANGE"] = "不友好橘"
	L["RED"] = "淡紅色"
	L["DEFICIT"] = "還需要多少聲望"
	L["SOUND"] = "音效通知"
	L["ANCHOR"] = "切換錨點"

-- English (DEFAULT)
else
	L["PARAGON"] = "Paragon"
	L["OPTIONDESC"] = "This options allow you to customize some settings of Paragon Reputation."
	L["TOASTDESC"] = "Toggle a toast window that will warn you when you have a Paragon Reward."
	L["LABEL001"] = "Bars Color"
	L["LABEL002"] = "Text Format"
	L["LABEL003"] = "Reward Toast"
	L["BLUE"] = "Paragon Blue"
	L["GREEN"] = "Default Green"
	L["YELLOW"] = "Neutral Yellow"
	L["ORANGE"] = "Unfriendly Orange"
	L["RED"] = "Lightish Red"
	L["DEFICIT"] = "Reputation Deficit"
	L["SOUND"] = "Sound Warning"
	L["ANCHOR"] = "Toggle Anchor"

end