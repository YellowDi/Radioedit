if not(GetLocale() == "ptBR") then
  return
end

local L = WeakAuras.L

-- WeakAuras/Options
	--[[Translation missing --]]
	L[" Configuration"] = " Configuration"
	L["-- Do not remove this comment, it is part of this trigger: "] = "-- Não remova este comentário, ele é parte deste gatilho:"
	L["% of Progress"] = "% do progresso"
	--[[Translation missing --]]
	L["%i auras selected"] = "%i auras selected"
	L["%i Matches"] = "%i resultados"
	L["%s Color"] = "%s Cor"
	L["%s total auras"] = "%s auras totais"
	L["1 Match"] = "1 resultado"
	L["1. Text"] = "1. Texto"
	L["1. Text Settings"] = "1. Configurações do texto"
	L["2. Text"] = "2. Texto"
	L["2. Text Settings"] = "2. Configurações do texto"
	L["A 20x20 pixels icon"] = "Um ícone de 20x20 pixels"
	L["A 32x32 pixels icon"] = "Um ícone de 32x32 pixels"
	L["A 40x40 pixels icon"] = "Um ícone de 40x40 pixels"
	L["A 48x48 pixels icon"] = "Um ícone de 48x48 pixels"
	L["A 64x64 pixels icon"] = "Um ícone de 64x64 pixels"
	L["A group that dynamically controls the positioning of its children"] = "Um grupo que controla dinamicamente o posicionamentos dos seus elementos"
	--[[Translation missing --]]
	L["A Unit ID (e.g., party1)."] = "A Unit ID (e.g., party1)."
	L["Actions"] = "Ações"
	L["Add a new display"] = "Adicionar um novo display"
	L["Add Condition"] = "Adicionar condição"
	--[[Translation missing --]]
	L["Add Option"] = "Add Option"
	--[[Translation missing --]]
	L["Add Overlay"] = "Add Overlay"
	L["Add Property Change"] = "Adicionar mudança de propriedade"
	L["Add to group %s"] = "Adicionar ao grupo %s"
	L["Add to new Dynamic Group"] = "Adicionar a um novo Grupo Dinâmico"
	L["Add to new Group"] = "Adicionar a um novo Grupo"
	L["Add Trigger"] = "Adicionar Gatilho"
	L["Addon"] = "Addon"
	L["Addons"] = "Addons"
	L["Advanced"] = "Avançado"
	L["Align"] = "Alinhar"
	L["All of"] = "Todos"
	L["Allow Full Rotation"] = "Habilitar rotação completa"
	L["Alpha"] = "Transparência"
	L["Anchor"] = "Âncora"
	L["Anchor Point"] = "Ponto da âncora"
	L["Anchored To"] = "Ancorado a"
	L["And "] = "E"
	L["and Trigger %s"] = "e gatilho %s"
	L["Angle"] = "Ângulo"
	L["Animate"] = "Animar"
	L["Animated Expand and Collapse"] = "Animação expande e esvai"
	L["Animates progress changes"] = "Anima mudanças no progresso"
	L["Animation relative duration description"] = [=[A duração da animação relativa ao tempo de duração do display, expresso como fração (1/2), porcentagem (50%), ou decimal. (0.5)
|cFFFF0000Nota:|r se um display não tiver progresso (o gatilho é não-temporal, é aura sem duração, etc), a animação não irá tocar.

|cFF4444FFFou Exemplo:|r
Se a duração da animação estiver setada para |cFF00CC0010%|r, e o display do gatilho for um benefício que dure 20 segundos, o começ da animação tocará por 2 segundos.
Se a duração da animação estiver setada para |cFF00C0010%|r, e o gatilho do display for um benefício que não tem duração, nenhum começõ de animação irá tocar (no entanto, tocaria se voce especificasse uma duração em segundos)."
WeakAuras → Opções → Opções ]=]
	L["Animation Sequence"] = "Sequência da animação"
	L["Animations"] = "Animações"
	L["Any of"] = "Qualquer"
	--[[Translation missing --]]
	L["Apply Template"] = "Apply Template"
	--[[Translation missing --]]
	L["Arcane Orb"] = "Arcane Orb"
	--[[Translation missing --]]
	L["At a position a bit left of Left HUD position."] = "At a position a bit left of Left HUD position."
	--[[Translation missing --]]
	L["At a position a bit left of Right HUD position"] = "At a position a bit left of Right HUD position"
	--[[Translation missing --]]
	L["At the same position as Blizzard's spell alert"] = "At the same position as Blizzard's spell alert"
	--[[Translation missing --]]
	L["Aura Name"] = "Aura Name"
	--[[Translation missing --]]
	L["Aura Name Pattern"] = "Aura Name Pattern"
	--[[Translation missing --]]
	L["Aura Type"] = "Aura Type"
	L["Aura(s)"] = "Aura(s)"
	--[[Translation missing --]]
	L["Author Options"] = "Author Options"
	L["Auto"] = "Auto"
	--[[Translation missing --]]
	L["Auto-Clone (Show All Matches)"] = "Auto-Clone (Show All Matches)"
	--[[Translation missing --]]
	L["Auto-cloning enabled"] = "Auto-cloning enabled"
	L["Automatic Icon"] = "Ícone automático"
	--[[Translation missing --]]
	L["Backdrop Color"] = "Backdrop Color"
	--[[Translation missing --]]
	L["Backdrop in Front"] = "Backdrop in Front"
	--[[Translation missing --]]
	L["Backdrop Style"] = "Backdrop Style"
	L["Background"] = "Fundo"
	L["Background Color"] = "Cor de fundo"
	L["Background Inset"] = "Inserção do fundo"
	L["Background Offset"] = "Posicionamento do fundo"
	L["Background Texture"] = "Textura do fundo"
	L["Bar Alpha"] = "Transparência da barra"
	L["Bar Color"] = "Cor da barra"
	--[[Translation missing --]]
	L["Bar Color Settings"] = "Bar Color Settings"
	L["Bar Texture"] = "Textura da barra"
	--[[Translation missing --]]
	L["Big Icon"] = "Big Icon"
	--[[Translation missing --]]
	L["Blend Mode"] = "Blend Mode"
	--[[Translation missing --]]
	L["Blue Rune"] = "Blue Rune"
	--[[Translation missing --]]
	L["Blue Sparkle Orb"] = "Blue Sparkle Orb"
	L["Border"] = "Borda"
	--[[Translation missing --]]
	L["Border Color"] = "Border Color"
	--[[Translation missing --]]
	L["Border in Front"] = "Border in Front"
	--[[Translation missing --]]
	L["Border Inset"] = "Border Inset"
	L["Border Offset"] = "Posicionamento da borda"
	--[[Translation missing --]]
	L["Border Settings"] = "Border Settings"
	--[[Translation missing --]]
	L["Border Size"] = "Border Size"
	--[[Translation missing --]]
	L["Border Style"] = "Border Style"
	L["Bottom Text"] = "Texto na base"
	--[[Translation missing --]]
	L["Bracket Matching"] = "Bracket Matching"
	L["Button Glow"] = "Iluminar botão"
	--[[Translation missing --]]
	L["Can be a name or a UID (e.g., party1). A name only works on friendly players in your group."] = "Can be a name or a UID (e.g., party1). A name only works on friendly players in your group."
	--[[Translation missing --]]
	L["Can be a Name or a Unit ID (e.g. party1). A name only works on friendly players in your group."] = "Can be a Name or a Unit ID (e.g. party1). A name only works on friendly players in your group."
	L["Cancel"] = "Cancelar"
	L["Channel Number"] = "Número do canal"
	--[[Translation missing --]]
	L["Chat Message"] = "Chat Message"
	L["Check On..."] = "Verificar..."
	--[[Translation missing --]]
	L["Children:"] = "Children:"
	L["Choose"] = "Escolher"
	L["Choose Trigger"] = "Escolher o gatilho"
	L["Choose whether the displayed icon is automatic or defined manually"] = "Escolher se o ícone mostrado é automático ou definido manualmente"
	--[[Translation missing --]]
	L["Clip Overlays"] = "Clip Overlays"
	--[[Translation missing --]]
	L["Clone option enabled dialog"] = "Clone option enabled dialog"
	L["Close"] = "Fechar"
	--[[Translation missing --]]
	L["Collapse"] = "Collapse"
	--[[Translation missing --]]
	L["Collapse all loaded displays"] = "Collapse all loaded displays"
	--[[Translation missing --]]
	L["Collapse all non-loaded displays"] = "Collapse all non-loaded displays"
	L["Color"] = "Cor"
	--[[Translation missing --]]
	L["color"] = "color"
	--[[Translation missing --]]
	L["Combinations"] = "Combinations"
	--[[Translation missing --]]
	L["Combine Matches Per Unit"] = "Combine Matches Per Unit"
	--[[Translation missing --]]
	L["Common Options"] = "Common Options"
	--[[Translation missing --]]
	L["Compare against the number of units affected."] = "Compare against the number of units affected."
	L["Compress"] = "Comprimir"
	--[[Translation missing --]]
	L["Condition %i"] = "Condition %i"
	--[[Translation missing --]]
	L["Conditions"] = "Conditions"
	--[[Translation missing --]]
	L["Configure what options appear on this pannel."] = "Configure what options appear on this pannel."
	L["Constant Factor"] = "Fator constante"
	--[[Translation missing --]]
	L["Control-click to select multiple displays"] = "Control-click to select multiple displays"
	L["Controls the positioning and configuration of multiple displays at the same time"] = "Controla o posicionamento e a configuração de múltiplos displays ao mesmo tempo"
	--[[Translation missing --]]
	L["Convert to New Aura Trigger"] = "Convert to New Aura Trigger"
	--[[Translation missing --]]
	L["Convert to..."] = "Convert to..."
	L["Cooldown"] = "Tempo de recarga"
	--[[Translation missing --]]
	L["Cooldown Edge"] = "Cooldown Edge"
	--[[Translation missing --]]
	L["Cooldown Settings"] = "Cooldown Settings"
	--[[Translation missing --]]
	L["Cooldown Swipe"] = "Cooldown Swipe"
	--[[Translation missing --]]
	L["Copy settings..."] = "Copy settings..."
	--[[Translation missing --]]
	L["Copy to all auras"] = "Copy to all auras"
	--[[Translation missing --]]
	L["Copy URL"] = "Copy URL"
	L["Count"] = "Contar"
	--[[Translation missing --]]
	L["Counts the number of matches over all units."] = "Counts the number of matches over all units."
	L["Creating buttons: "] = "Criando botões:"
	L["Creating options: "] = "Criando opções:"
	L["Crop X"] = "Cortar X"
	L["Crop Y"] = "Cortar Y"
	--[[Translation missing --]]
	L["Custom"] = "Custom"
	L["Custom Code"] = "Código personalizado"
	--[[Translation missing --]]
	L["Custom Configuration"] = "Custom Configuration"
	--[[Translation missing --]]
	L["Custom Function"] = "Custom Function"
	--[[Translation missing --]]
	L["Custom Options"] = "Custom Options"
	L["Custom Trigger"] = "Gatilho personalizado"
	--[[Translation missing --]]
	L["Custom trigger event tooltip"] = "Custom trigger event tooltip"
	--[[Translation missing --]]
	L["Custom trigger status tooltip"] = "Custom trigger status tooltip"
	--[[Translation missing --]]
	L["Custom Untrigger"] = "Custom Untrigger"
	--[[Translation missing --]]
	L["Custom Variables"] = "Custom Variables"
	L["Debuff Type"] = "Tipo de penalidade"
	--[[Translation missing --]]
	L["Default"] = "Default"
	--[[Translation missing --]]
	L["Delete"] = "Delete"
	L["Delete all"] = "Apagar tudo"
	--[[Translation missing --]]
	L["Delete children and group"] = "Delete children and group"
	L["Delete Trigger"] = "Apagar gatilho"
	L["Desaturate"] = "Descolorir"
	--[[Translation missing --]]
	L["Description"] = "Description"
	--[[Translation missing --]]
	L["Description Text"] = "Description Text"
	--[[Translation missing --]]
	L["Differences"] = "Differences"
	--[[Translation missing --]]
	L["Disable Import"] = "Disable Import"
	L["Disabled"] = "Desabilitar"
	L["Discrete Rotation"] = "Rotação discreta"
	L["Display"] = "Mostruário"
	L["Display Icon"] = "Ícone do mostruário"
	--[[Translation missing --]]
	L["Display Name"] = "Display Name"
	L["Display Text"] = "Texto do mostruário"
	--[[Translation missing --]]
	L["Displays a text, works best in combination with other displays"] = "Displays a text, works best in combination with other displays"
	L["Distribute Horizontally"] = "Distribuir horizontalmente"
	L["Distribute Vertically"] = "Distribuir verticalmente"
	--[[Translation missing --]]
	L["Do not group this display"] = "Do not group this display"
	--[[Translation missing --]]
	L["Done"] = "Done"
	--[[Translation missing --]]
	L["Down"] = "Down"
	--[[Translation missing --]]
	L["Drag to move"] = "Drag to move"
	--[[Translation missing --]]
	L["Duplicate"] = "Duplicate"
	--[[Translation missing --]]
	L["Duplicate All"] = "Duplicate All"
	L["Duration (s)"] = "Duração"
	L["Duration Info"] = "Informação da duração"
	--[[Translation missing --]]
	L["Dynamic Duration"] = "Dynamic Duration"
	L["Dynamic Group"] = "Grupo dinâmico"
	--[[Translation missing --]]
	L["Dynamic Information"] = "Dynamic Information"
	--[[Translation missing --]]
	L["Dynamic information from first active trigger"] = "Dynamic information from first active trigger"
	--[[Translation missing --]]
	L["Dynamic information from Trigger %i"] = "Dynamic information from Trigger %i"
	--[[Translation missing --]]
	L["Dynamic text tooltip"] = "Dynamic text tooltip"
	L["Enabled"] = "Habilitado"
	--[[Translation missing --]]
	L["End Angle"] = "End Angle"
	--[[Translation missing --]]
	L["Enter a Spell ID"] = "Enter a Spell ID"
	L["Enter an aura name, partial aura name, or spell id"] = "Entre um nome de aura, uma parte do nome da aura, ou id do feitiço"
	--[[Translation missing --]]
	L["Enter an Aura Name, partial Aura Name, or Spell ID. A Spell ID will match any spells with the same name."] = "Enter an Aura Name, partial Aura Name, or Spell ID. A Spell ID will match any spells with the same name."
	--[[Translation missing --]]
	L["Enter Author Mode"] = "Enter Author Mode"
	--[[Translation missing --]]
	L["Enter User Mode"] = "Enter User Mode"
	--[[Translation missing --]]
	L["Enter user mode."] = "Enter user mode."
	--[[Translation missing --]]
	L["Event"] = "Event"
	L["Event Type"] = "Tipo de evento"
	--[[Translation missing --]]
	L["Event(s)"] = "Event(s)"
	--[[Translation missing --]]
	L["Everything"] = "Everything"
	--[[Translation missing --]]
	L["Exact Spell ID(s)"] = "Exact Spell ID(s)"
	--[[Translation missing --]]
	L["Exact Spell Match"] = "Exact Spell Match"
	--[[Translation missing --]]
	L["Expand"] = "Expand"
	L["Expand all loaded displays"] = "Expandir todos os mostruários carregados"
	L["Expand all non-loaded displays"] = "Expandir todos os mostruários não carregados"
	--[[Translation missing --]]
	L["Expansion is disabled because this group has no children"] = "Expansion is disabled because this group has no children"
	--[[Translation missing --]]
	L["Export to Lua table..."] = "Export to Lua table..."
	--[[Translation missing --]]
	L["Export to string..."] = "Export to string..."
	--[[Translation missing --]]
	L["External"] = "External"
	L["Fade"] = "Sumir"
	--[[Translation missing --]]
	L["Fade In"] = "Fade In"
	--[[Translation missing --]]
	L["Fade Out"] = "Fade Out"
	--[[Translation missing --]]
	L["False"] = "False"
	--[[Translation missing --]]
	L["Fetch Affected/Unaffected Names"] = "Fetch Affected/Unaffected Names"
	--[[Translation missing --]]
	L["Filter by Group Role"] = "Filter by Group Role"
	L["Finish"] = "Finalizar"
	--[[Translation missing --]]
	L["Fire Orb"] = "Fire Orb"
	L["Font"] = "Fonte"
	--[[Translation missing --]]
	L["Font Flags"] = "Font Flags"
	--[[Translation missing --]]
	L["Font Size"] = "Font Size"
	--[[Translation missing --]]
	L["Font Type"] = "Font Type"
	L["Foreground Color"] = "Cor do primeiro plano"
	L["Foreground Texture"] = "Textura do primeiro plano"
	L["Frame"] = "Quadro"
	L["Frame Strata"] = "Camada do quadro"
	--[[Translation missing --]]
	L["From Template"] = "From Template"
	--[[Translation missing --]]
	L["General Text Settings"] = "General Text Settings"
	--[[Translation missing --]]
	L["Global Conditions"] = "Global Conditions"
	L["Glow Action"] = "Ação incandescente"
	--[[Translation missing --]]
	L["Glow Color"] = "Glow Color"
	--[[Translation missing --]]
	L["Glow Settings"] = "Glow Settings"
	--[[Translation missing --]]
	L["Glow Type"] = "Glow Type"
	--[[Translation missing --]]
	L["Green Rune"] = "Green Rune"
	--[[Translation missing --]]
	L["Group"] = "Group"
	--[[Translation missing --]]
	L["Group (verb)"] = "Group (verb)"
	--[[Translation missing --]]
	L["Group aura count description"] = "Group aura count description"
	L["Group Member Count"] = "Contagem dos membros do grupo"
	--[[Translation missing --]]
	L["Group Role"] = "Group Role"
	--[[Translation missing --]]
	L["Group Scale"] = "Group Scale"
	--[[Translation missing --]]
	L["Grow"] = "Grow"
	--[[Translation missing --]]
	L["Hawk"] = "Hawk"
	L["Height"] = "Altura"
	--[[Translation missing --]]
	L["Hide"] = "Hide"
	--[[Translation missing --]]
	L["Hide on"] = "Hide on"
	--[[Translation missing --]]
	L["Hide this group's children"] = "Hide this group's children"
	L["Hide When Not In Group"] = "Esconder quando em grupo"
	L["Horizontal Align"] = "Alinhamento horizontal"
	--[[Translation missing --]]
	L["Horizontal Bar"] = "Horizontal Bar"
	--[[Translation missing --]]
	L["Huge Icon"] = "Huge Icon"
	--[[Translation missing --]]
	L["Hybrid Position"] = "Hybrid Position"
	--[[Translation missing --]]
	L["Hybrid Sort Mode"] = "Hybrid Sort Mode"
	--[[Translation missing --]]
	L["Icon"] = "Icon"
	--[[Translation missing --]]
	L["Icon Alpha"] = "Icon Alpha"
	--[[Translation missing --]]
	L["Icon Color"] = "Icon Color"
	L["Icon Info"] = "Informação do ícone"
	--[[Translation missing --]]
	L["Icon Inset"] = "Icon Inset"
	--[[Translation missing --]]
	L["If"] = "If"
	--[[Translation missing --]]
	L["If this option is enabled, you are no longer able to import auras."] = "If this option is enabled, you are no longer able to import auras."
	--[[Translation missing --]]
	L["If Trigger %s"] = "If Trigger %s"
	--[[Translation missing --]]
	L["If unchecked, then a default color will be used (usually yellow)"] = "If unchecked, then a default color will be used (usually yellow)"
	--[[Translation missing --]]
	L["If unchecked, then this space will fill the entire line it is on in User Mode."] = "If unchecked, then this space will fill the entire line it is on in User Mode."
	--[[Translation missing --]]
	L["Ignore self"] = "Ignore self"
	--[[Translation missing --]]
	L["Ignore Self"] = "Ignore Self"
	L["Ignored"] = "Ignorado"
	L["Import"] = "Importar"
	L["Import a display from an encoded string"] = "Importar um display de um string codificado"
	--[[Translation missing --]]
	L["Invalid Item Name/ID/Link"] = "Invalid Item Name/ID/Link"
	--[[Translation missing --]]
	L["Invalid Spell ID"] = "Invalid Spell ID"
	--[[Translation missing --]]
	L["Invalid Spell Name/ID/Link"] = "Invalid Spell Name/ID/Link"
	--[[Translation missing --]]
	L["Inverse"] = "Inverse"
	--[[Translation missing --]]
	L["Inverse Slant"] = "Inverse Slant"
	--[[Translation missing --]]
	L["Is Stealable"] = "Is Stealable"
	L["Justify"] = "Justificar"
	--[[Translation missing --]]
	L["Keep Aspect Ratio"] = "Keep Aspect Ratio"
	--[[Translation missing --]]
	L["Key for aura_env.config at which the user value can be found."] = "Key for aura_env.config at which the user value can be found."
	--[[Translation missing --]]
	L["Leaf"] = "Leaf"
	--[[Translation missing --]]
	L["Left 2 HUD position"] = "Left 2 HUD position"
	--[[Translation missing --]]
	L["Left HUD position"] = "Left HUD position"
	L["Left Text"] = "Texto à esquerda"
	--[[Translation missing --]]
	L["Length"] = "Length"
	--[[Translation missing --]]
	L["Load"] = "Load"
	L["Loaded"] = "Carrregar"
	--[[Translation missing --]]
	L["Loop"] = "Loop"
	--[[Translation missing --]]
	L["Low Mana"] = "Low Mana"
	L["Main"] = "Principal"
	L["Manage displays defined by Addons"] = "Gerencia os displays definidos por addons"
	--[[Translation missing --]]
	L["Match Count"] = "Match Count"
	--[[Translation missing --]]
	L["Max"] = "Max"
	--[[Translation missing --]]
	L["Max Length"] = "Max Length"
	--[[Translation missing --]]
	L["Medium Icon"] = "Medium Icon"
	--[[Translation missing --]]
	L["Message"] = "Message"
	L["Message Prefix"] = "Prefixo de mensagem"
	L["Message Suffix"] = "Sufixo de mensagem"
	--[[Translation missing --]]
	L["Message Type"] = "Message Type"
	--[[Translation missing --]]
	L["Min"] = "Min"
	L["Mirror"] = "Espelho"
	L["Model"] = "Modelo"
	--[[Translation missing --]]
	L["Move Down"] = "Move Down"
	--[[Translation missing --]]
	L["Move this display down in its group's order"] = "Move this display down in its group's order"
	--[[Translation missing --]]
	L["Move this display up in its group's order"] = "Move this display up in its group's order"
	--[[Translation missing --]]
	L["Move Up"] = "Move Up"
	L["Multiple Displays"] = "Múltiplos displays"
	L["Multiple Triggers"] = "Múltiplos gatilhos"
	--[[Translation missing --]]
	L["Multiselect ignored tooltip"] = "Multiselect ignored tooltip"
	--[[Translation missing --]]
	L["Multiselect multiple tooltip"] = "Multiselect multiple tooltip"
	--[[Translation missing --]]
	L["Multiselect single tooltip"] = "Multiselect single tooltip"
	L["Name Info"] = "Informação do nome"
	--[[Translation missing --]]
	L["Name Pattern Match"] = "Name Pattern Match"
	--[[Translation missing --]]
	L["Name(s)"] = "Name(s)"
	L["Negator"] = "Negador"
	--[[Translation missing --]]
	L["Never"] = "Never"
	L["New"] = "Novo"
	--[[Translation missing --]]
	L["New Value"] = "New Value"
	L["No"] = "Não"
	--[[Translation missing --]]
	L["No Children"] = "No Children"
	--[[Translation missing --]]
	L["No tooltip text"] = "No tooltip text"
	--[[Translation missing --]]
	L["None"] = "None"
	--[[Translation missing --]]
	L["Not all children have the same value for this option"] = "Not all children have the same value for this option"
	L["Not Loaded"] = "Não carregado"
	--[[Translation missing --]]
	L["Offer a guided way to create auras for your class"] = "Offer a guided way to create auras for your class"
	L["Okay"] = "Okay"
	L["On Hide"] = "Quando sumir"
	--[[Translation missing --]]
	L["On Init"] = "On Init"
	L["On Show"] = "Quando mostrar"
	--[[Translation missing --]]
	L["Only match auras cast by people other than the player"] = "Only match auras cast by people other than the player"
	--[[Translation missing --]]
	L["Only match auras cast by the player"] = "Only match auras cast by the player"
	L["Operator"] = "Operador"
	--[[Translation missing --]]
	L["Option #"] = "Option #"
	--[[Translation missing --]]
	L["Option #%i"] = "Option #%i"
	--[[Translation missing --]]
	L["Option %i"] = "Option %i"
	--[[Translation missing --]]
	L["Option key"] = "Option key"
	--[[Translation missing --]]
	L["Option Type"] = "Option Type"
	--[[Translation missing --]]
	L["Options will open after combat ends."] = "Options will open after combat ends."
	--[[Translation missing --]]
	L["or"] = "or"
	--[[Translation missing --]]
	L["or Trigger %s"] = "or Trigger %s"
	--[[Translation missing --]]
	L["Orange Rune"] = "Orange Rune"
	L["Orientation"] = "Orientação"
	L["Outline"] = "Contorno"
	--[[Translation missing --]]
	L["Overflow"] = "Overflow"
	--[[Translation missing --]]
	L["Overlay %s Info"] = "Overlay %s Info"
	--[[Translation missing --]]
	L["Overlays"] = "Overlays"
	L["Own Only"] = "Apenas meu"
	--[[Translation missing --]]
	L["Paste Action Settings"] = "Paste Action Settings"
	--[[Translation missing --]]
	L["Paste Animations Settings"] = "Paste Animations Settings"
	--[[Translation missing --]]
	L["Paste Author Option Settings"] = "Paste Author Option Settings"
	--[[Translation missing --]]
	L["Paste Condition Settings"] = "Paste Condition Settings"
	--[[Translation missing --]]
	L["Paste Custom Configuration"] = "Paste Custom Configuration"
	--[[Translation missing --]]
	L["Paste Display Settings"] = "Paste Display Settings"
	--[[Translation missing --]]
	L["Paste Group Settings"] = "Paste Group Settings"
	--[[Translation missing --]]
	L["Paste Load Settings"] = "Paste Load Settings"
	--[[Translation missing --]]
	L["Paste Settings"] = "Paste Settings"
	--[[Translation missing --]]
	L["Paste text below"] = "Paste text below"
	--[[Translation missing --]]
	L["Paste Trigger Settings"] = "Paste Trigger Settings"
	L["Play Sound"] = "Reproduzir som"
	--[[Translation missing --]]
	L["Portrait Zoom"] = "Portrait Zoom"
	--[[Translation missing --]]
	L["Position Settings"] = "Position Settings"
	--[[Translation missing --]]
	L["Preferred Match"] = "Preferred Match"
	--[[Translation missing --]]
	L["Preset"] = "Preset"
	L["Prevents duration information from decreasing when an aura refreshes. May cause problems if used with multiple auras with different durations."] = "Impede que informação de duração diminua quando uma aura é atualizada. Pode causar problemas se usado com múltiplas auras com diferentes durações."
	--[[Translation missing --]]
	L["Processed %i chars"] = "Processed %i chars"
	L["Progress Bar"] = "Barra de progresso"
	L["Progress Texture"] = "Textura de progresso"
	--[[Translation missing --]]
	L["Purple Rune"] = "Purple Rune"
	--[[Translation missing --]]
	L["Put this display in a group"] = "Put this display in a group"
	--[[Translation missing --]]
	L["Radius"] = "Radius"
	L["Re-center X"] = "Recentralizar X"
	L["Re-center Y"] = "Recentralizar Y"
	--[[Translation missing --]]
	L["Regions of type \"%s\" are not supported."] = "Regions of type \"%s\" are not supported."
	--[[Translation missing --]]
	L["Remaining Time"] = "Remaining Time"
	L["Remaining Time Precision"] = "Precisão do tempo restante"
	--[[Translation missing --]]
	L["Remove"] = "Remove"
	--[[Translation missing --]]
	L["Remove this display from its group"] = "Remove this display from its group"
	--[[Translation missing --]]
	L["Remove this property"] = "Remove this property"
	--[[Translation missing --]]
	L["Rename"] = "Rename"
	--[[Translation missing --]]
	L["Repeat After"] = "Repeat After"
	--[[Translation missing --]]
	L["Repeat every"] = "Repeat every"
	--[[Translation missing --]]
	L["Required for Activation"] = "Required for Activation"
	--[[Translation missing --]]
	L["Reset all options in this group to their default values."] = "Reset all options in this group to their default values."
	--[[Translation missing --]]
	L["Reset all options to their default values."] = "Reset all options to their default values."
	--[[Translation missing --]]
	L["Reset ALL to Defaults"] = "Reset ALL to Defaults"
	--[[Translation missing --]]
	L["Reset to Defaults"] = "Reset to Defaults"
	--[[Translation missing --]]
	L["Right 2 HUD position"] = "Right 2 HUD position"
	--[[Translation missing --]]
	L["Right HUD position"] = "Right HUD position"
	L["Right Text"] = "Texto à direita"
	L["Right-click for more options"] = "Clique-direito para mais opções"
	L["Rotate"] = "Girar"
	L["Rotate In"] = "Girar para dentro"
	L["Rotate Out"] = "Girar para fora"
	L["Rotate Text"] = "Girar o texto"
	L["Rotation"] = "Rotação"
	--[[Translation missing --]]
	L["Rotation Mode"] = "Rotation Mode"
	L["Same"] = "Mesmo"
	--[[Translation missing --]]
	L["Scale"] = "Scale"
	L["Search"] = "Procurar"
	--[[Translation missing --]]
	L["Select the auras you always want to be listed first"] = "Select the auras you always want to be listed first"
	L["Send To"] = "Enviar para"
	--[[Translation missing --]]
	L["Set Parent to Anchor"] = "Set Parent to Anchor"
	--[[Translation missing --]]
	L["Set tooltip description"] = "Set tooltip description"
	--[[Translation missing --]]
	L["Sets the anchored frame as the aura's parent, causing the aura to inherit attributes such as visiblility and scale."] = "Sets the anchored frame as the aura's parent, causing the aura to inherit attributes such as visiblility and scale."
	--[[Translation missing --]]
	L["Settings"] = "Settings"
	--[[Translation missing --]]
	L["Shift-click to create chat link"] = "Shift-click to create chat link"
	L["Show all matches (Auto-clone)"] = "Mostrar todas as correspondências"
	--[[Translation missing --]]
	L["Show Cooldown Text"] = "Show Cooldown Text"
	--[[Translation missing --]]
	L["Show Glow Effect"] = "Show Glow Effect"
	--[[Translation missing --]]
	L["Show If Unit Does Not Exist"] = "Show If Unit Does Not Exist"
	--[[Translation missing --]]
	L["Show If Unit Is Invalid"] = "Show If Unit Is Invalid"
	--[[Translation missing --]]
	L["Show Matches for"] = "Show Matches for"
	--[[Translation missing --]]
	L["Show Matches for Units"] = "Show Matches for Units"
	--[[Translation missing --]]
	L["Show model of unit "] = "Show model of unit "
	--[[Translation missing --]]
	L["Show On"] = "Show On"
	--[[Translation missing --]]
	L["Show this group's children"] = "Show this group's children"
	L["Shows a 3D model from the game files"] = "Mostrar um modelo 3D dos arquivos do jogo"
	L["Shows a custom texture"] = "Mostrar uma textura personalizada"
	L["Shows a progress bar with name, timer, and icon"] = "Mostrar uma barra de progresso com nome, temporizador e ícone"
	L["Shows a spell icon with an optional cooldown overlay"] = "Mostrar um ícone de feitiço com o opcional do tempo de recarga sobreposto"
	L["Shows a texture that changes based on duration"] = "Mostrar uma textura que muda com base na duração"
	L["Shows one or more lines of text, which can include dynamic information such as progress or stacks"] = "Mostra uma ou mais linhas de texto, que podem incluir informações dinâmicas tal como progresso ou quantidades"
	--[[Translation missing --]]
	L["Simple"] = "Simple"
	L["Size"] = "Tamanho"
	--[[Translation missing --]]
	L["Slant Amount"] = "Slant Amount"
	--[[Translation missing --]]
	L["Slant Mode"] = "Slant Mode"
	--[[Translation missing --]]
	L["Slanted"] = "Slanted"
	L["Slide"] = "Deslizar"
	L["Slide In"] = "Deslizar para dentro"
	L["Slide Out"] = "Deslizar para fora"
	--[[Translation missing --]]
	L["Slider Step Size"] = "Slider Step Size"
	--[[Translation missing --]]
	L["Small Icon"] = "Small Icon"
	--[[Translation missing --]]
	L["Smooth Progress"] = "Smooth Progress"
	--[[Translation missing --]]
	L["Soft Max"] = "Soft Max"
	--[[Translation missing --]]
	L["Soft Min"] = "Soft Min"
	L["Sort"] = "Ordenar"
	L["Sound"] = "Som"
	L["Sound Channel"] = "Canal de som"
	L["Sound File Path"] = "Caminho do arquivo de som"
	--[[Translation missing --]]
	L["Sound Kit ID"] = "Sound Kit ID"
	L["Space"] = "Espaço"
	L["Space Horizontally"] = "Espaço horizontal"
	L["Space Vertically"] = "Espaçar Verticalmente"
	--[[Translation missing --]]
	L["Spark"] = "Spark"
	--[[Translation missing --]]
	L["Spark Settings"] = "Spark Settings"
	--[[Translation missing --]]
	L["Spark Texture"] = "Spark Texture"
	--[[Translation missing --]]
	L["Specific Unit"] = "Specific Unit"
	L["Spell ID"] = "ID da magia"
	L["Stack Count"] = "Contagem do Monte"
	L["Stack Info"] = "Informação do Monte"
	--[[Translation missing --]]
	L["Stacks"] = "Stacks"
	L["Stacks Settings"] = "Configurações do Monte"
	--[[Translation missing --]]
	L["Stagger"] = "Stagger"
	--[[Translation missing --]]
	L["Star"] = "Star"
	L["Start"] = "Início"
	--[[Translation missing --]]
	L["Start Angle"] = "Start Angle"
	--[[Translation missing --]]
	L["Status"] = "Status"
	--[[Translation missing --]]
	L["Stealable"] = "Stealable"
	--[[Translation missing --]]
	L["Step Size"] = "Step Size"
	--[[Translation missing --]]
	L["Sticky Duration"] = "Sticky Duration"
	--[[Translation missing --]]
	L["Stop Sound"] = "Stop Sound"
	--[[Translation missing --]]
	L["Symbol Settings"] = "Symbol Settings"
	L["Temporary Group"] = "Grupo temporário"
	L["Text"] = "Texto"
	L["Text Color"] = "Cor do texto"
	L["Text Position"] = "Posição do texto"
	--[[Translation missing --]]
	L["Texture"] = "Texture"
	--[[Translation missing --]]
	L["Texture Info"] = "Texture Info"
	--[[Translation missing --]]
	L["Texture Wrap"] = "Texture Wrap"
	--[[Translation missing --]]
	L["The duration of the animation in seconds."] = "The duration of the animation in seconds."
	--[[Translation missing --]]
	L["The duration of the animation in seconds. The finish animation does not start playing until after the display would normally be hidden."] = "The duration of the animation in seconds. The finish animation does not start playing until after the display would normally be hidden."
	--[[Translation missing --]]
	L["The type of trigger"] = "The type of trigger"
	--[[Translation missing --]]
	L["Then "] = "Then "
	--[[Translation missing --]]
	L["This adds %tooltip, %tooltip1, %tooltip2, %tooltip3 as text replacements."] = "This adds %tooltip, %tooltip1, %tooltip2, %tooltip3 as text replacements."
	--[[Translation missing --]]
	L["This display is currently loaded"] = "This display is currently loaded"
	--[[Translation missing --]]
	L["This display is not currently loaded"] = "This display is not currently loaded"
	--[[Translation missing --]]
	L["This region of type \"%s\" is not supported."] = "This region of type \"%s\" is not supported."
	--[[Translation missing --]]
	L["This setting controls what widget is generated in user mode."] = "This setting controls what widget is generated in user mode."
	--[[Translation missing --]]
	L["Time in"] = "Time in"
	--[[Translation missing --]]
	L["Tiny Icon"] = "Tiny Icon"
	--[[Translation missing --]]
	L["To Frame's"] = "To Frame's"
	--[[Translation missing --]]
	L["to group's"] = "to group's"
	--[[Translation missing --]]
	L["To Personal Ressource Display's"] = "To Personal Ressource Display's"
	--[[Translation missing --]]
	L["To Screen's"] = "To Screen's"
	--[[Translation missing --]]
	L["Toggle the visibility of all loaded displays"] = "Toggle the visibility of all loaded displays"
	--[[Translation missing --]]
	L["Toggle the visibility of all non-loaded displays"] = "Toggle the visibility of all non-loaded displays"
	--[[Translation missing --]]
	L["Toggle the visibility of this display"] = "Toggle the visibility of this display"
	--[[Translation missing --]]
	L["Tooltip"] = "Tooltip"
	--[[Translation missing --]]
	L["Tooltip Content"] = "Tooltip Content"
	--[[Translation missing --]]
	L["Tooltip on Mouseover"] = "Tooltip on Mouseover"
	--[[Translation missing --]]
	L["Tooltip Pattern Match"] = "Tooltip Pattern Match"
	--[[Translation missing --]]
	L["Tooltip Text"] = "Tooltip Text"
	--[[Translation missing --]]
	L["Tooltip Value"] = "Tooltip Value"
	--[[Translation missing --]]
	L["Tooltip Value #"] = "Tooltip Value #"
	--[[Translation missing --]]
	L["Top HUD position"] = "Top HUD position"
	--[[Translation missing --]]
	L["Top Text"] = "Top Text"
	--[[Translation missing --]]
	L["Total Time Precision"] = "Total Time Precision"
	--[[Translation missing --]]
	L["Trigger"] = "Trigger"
	--[[Translation missing --]]
	L["Trigger %d"] = "Trigger %d"
	--[[Translation missing --]]
	L["Trigger %s"] = "Trigger %s"
	--[[Translation missing --]]
	L["True"] = "True"
	--[[Translation missing --]]
	L["Type"] = "Type"
	--[[Translation missing --]]
	L["Ungroup"] = "Ungroup"
	--[[Translation missing --]]
	L["Unit"] = "Unit"
	--[[Translation missing --]]
	L["Unit Count"] = "Unit Count"
	--[[Translation missing --]]
	L["Unlike the start or finish animations, the main animation will loop over and over until the display is hidden."] = "Unlike the start or finish animations, the main animation will loop over and over until the display is hidden."
	--[[Translation missing --]]
	L["Up"] = "Up"
	--[[Translation missing --]]
	L["Update Custom Text On..."] = "Update Custom Text On..."
	--[[Translation missing --]]
	L["Use Full Scan (High CPU)"] = "Use Full Scan (High CPU)"
	--[[Translation missing --]]
	L["Use nth value from tooltip:"] = "Use nth value from tooltip:"
	--[[Translation missing --]]
	L["Use SetTransform"] = "Use SetTransform"
	--[[Translation missing --]]
	L["Use tooltip \"size\" instead of stacks"] = "Use tooltip \"size\" instead of stacks"
	--[[Translation missing --]]
	L["Use Tooltip Information"] = "Use Tooltip Information"
	--[[Translation missing --]]
	L["Used in Auras:"] = "Used in Auras:"
	--[[Translation missing --]]
	L["Used in auras:"] = "Used in auras:"
	--[[Translation missing --]]
	L["Value %i"] = "Value %i"
	--[[Translation missing --]]
	L["Values are in normalized rgba format."] = "Values are in normalized rgba format."
	--[[Translation missing --]]
	L["Values:"] = "Values:"
	--[[Translation missing --]]
	L["Variable Size"] = "Variable Size"
	--[[Translation missing --]]
	L["Version: "] = "Version: "
	--[[Translation missing --]]
	L["Vertical Align"] = "Vertical Align"
	--[[Translation missing --]]
	L["Vertical Bar"] = "Vertical Bar"
	--[[Translation missing --]]
	L["View"] = "View"
	--[[Translation missing --]]
	L["Width"] = "Width"
	--[[Translation missing --]]
	L["X Offset"] = "X Offset"
	--[[Translation missing --]]
	L["X Rotation"] = "X Rotation"
	--[[Translation missing --]]
	L["X Scale"] = "X Scale"
	--[[Translation missing --]]
	L["Y Offset"] = "Y Offset"
	--[[Translation missing --]]
	L["Y Rotation"] = "Y Rotation"
	--[[Translation missing --]]
	L["Y Scale"] = "Y Scale"
	--[[Translation missing --]]
	L["Yellow Rune"] = "Yellow Rune"
	--[[Translation missing --]]
	L["Yes"] = "Yes"
	--[[Translation missing --]]
	L["You are about to delete %d aura(s). |cFFFF0000This cannot be undone!|r Would you like to continue?"] = "You are about to delete %d aura(s). |cFFFF0000This cannot be undone!|r Would you like to continue?"
	--[[Translation missing --]]
	L["Z Offset"] = "Z Offset"
	--[[Translation missing --]]
	L["Z Rotation"] = "Z Rotation"
	--[[Translation missing --]]
	L["Zoom"] = "Zoom"
	--[[Translation missing --]]
	L["Zoom In"] = "Zoom In"
	--[[Translation missing --]]
	L["Zoom Out"] = "Zoom Out"

