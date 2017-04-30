local L = LibStub("AceLocale-3.0"):GetLocale("TipTop")
local f = CreateFrame("FRAME")
local LSM = LibStub("LibSharedMedia-3.0")
local widgetLists = AceGUIWidgetLSMlists
local db, mover

local positions = {"TOP", "TOPRIGHT", "TOPLEFT",
					"BOTTOM", "BOTTOMRIGHT", "BOTTOMLEFT",
					"RIGHT", "LEFT", "CENTER"}
local formats = {"100/100", "100%", "100/100 (100%)", "万/亿", "万/亿(100%)", "萬/億", "萬/億(100%)", "1.2k/1.2k", "1.2k/1.2k (100%)"}
local fontFlags = {L["None"], L["Outline"], L["Monochrome Outline"]}	--, "Monochrome"}
local classIconStyles = {"Default UI", "Bright Class Color", "Dark Grey", "Dark", "Light Grey", "Medium Grey", "Muted Class Color", "WoW Website"}


local defaults = {
	alpha = 1,
	scale = 1,
	font = "Friz Quadrata TT",
	fontFlag = "None",
	fontSize = 12,
	bg = "brushed",
	bgColor = {r=.09, g=.09, b=.19},	--TOOLTIP_DEFAULT_BACKGROUND_COLOR
	border = "Seerah Solid",
	borderWidth = 2.5,
	inset = 0,
	diffColor = true,
	classColor = true,
	npcClassColor = true,
	classIcon = false,
	npcClassIcon = true,
	classIconStyle = "Default UI",
	guildRank = false,
	itemColor = true,
	borderColor = {r=.6, g=.6, b=.6, a=1},
	healthBar = "TipTop Default",
	sbarcolor = {r=0, g=1, b=0, a=1},
	sbarbg = "TipTop Default",
	sbarbgcolor = {r=0, g=0, b=0, a=.4},
	sbarclass = true,
	topBar = false,
	insideBar = false,
	raidIconSize = 16,
	raidIconPosition = "TOP",
	raidIconX = "0",
	raidIconY = "0",
	factionIcon = false,
	factionIconSize = 32,
	factionIconPosition = "TOPRIGHT",
	factionIconX = "-16",
	factionIconY = "-4",
	onCursor = false,
	anchor = "BOTTOMRIGHT",
	offsetX = "-2",
	offsetY = "109",
	showTargetText = true,
	you = true,
	showTalentText = true,
	elite = true,
	healthText = true,
	textformat = "100%",
	healthSize = 12,
}


local function SetUpDB()
	TipTopDB = TipTopDB or {}
	TipTopPCDB = TipTopPCDB or {}
		if TipTopPCDB.charSpec == nil then
			TipTopPCDB.charSpec = false
		end
	for k,v in pairs(defaults) do
	    if type(TipTopDB[k]) == "nil" then
	        TipTopDB[k] = v
	    end
	end
	if TipTopPCDB.charSpec then
		--set defaults if new charSpec DB
		for k,v in pairs(defaults) do
			if type(TipTopPCDB[k]) == "nil" then
				TipTopPCDB[k] = v
			end
		end
		db = TipTopPCDB
	else
		db = TipTopDB
	end
end

local function CreateMover()
	--mover = CreateFrame("Frame", nil, UIParent)
	mover = CreateFrame("Frame", "TipTopMover", UIParent)
	mover:SetSize(200, 100)
	mover:SetPoint(db.anchor, UIParent, db.anchor, db.offsetX, db.offsetY)
	mover.t = mover:CreateTexture()
	mover.t:SetAllPoints()
	mover.t:SetTexture("Interface\\Buttons\\WHITE8x8")
	mover.t:SetVertexColor(0,0,1,.4)
	mover:EnableMouse(true)
	mover:SetMovable(true)
	mover:SetClampedToScreen(true)
	mover:SetScript("OnMouseDown", function(self) self:StartMoving() end)
	mover:SetScript("OnMouseUp", function(self) self:StopMovingOrSizing() end)
	
	--close and confirm--
	StaticPopupDialogs["TIPTOP_MOVER"] = {
		text = L["Save tooltip position."],
		button1 = L["Save"],
		button2 = L["Cancel"],
		OnAccept = function()
				db.anchor, _, _, x, y = mover:GetPoint()
				db.offsetX, db.offsetY = tostring(x), tostring(y)
				mover:Hide()
				InterfaceOptionsFrame:Show()
			end,
		OnCancel = function()
				mover:Hide()
				InterfaceOptionsFrame:Show()
			end,
		timeout = 0,
		whileDead = true,
		hideOnEscape = true,
	}
end


local options = {
	name = L["TipTop Options"],
	type = "group",
	args = {
		general = {
			name = "|cff00ff96司马清源|r",
			type = "group",
			args = {
				header1 = {
					name = L["General"],
					type = "header",
					order = 1,
				},
				font = {
					name = L["Font"],
					desc = L["Select the font for the tooltip and health text."],
					type = "select",
					dialogControl = "LSM30_Font",
					values = widgetLists.font,
					get = function()
							return db.font
						end,
					set = function(self, font)
							db.font = font
							TipTop:SetFonts()
						end,
					order = 2,
				},
				fontFlag = {
					name = L["Font Flag"],
					desc = L["Set how to alter the tooltip's font."],
					type = "select",
					values = fontFlags,
					get = function()
								for k, v in pairs(fontFlags) do
									if db.fontFlag == v then
										return k
									end
								end
							end,
					set = function(_,key)
								db.fontFlag = fontFlags[key]
								TipTop:SetFonts()
							end,
					order = 3,
				},
				fontSize = {
					name = L["Font Size"],
					desc = L["The base size of the text in all tooltips."],
					type = "range",
					min = 6,
					max = 20,
					step = 1,
					get = function() return db.fontSize end,
					set = function(_, fontSize) 
								db.fontSize = fontSize
								TipTop:SetFonts()
							end,
					order = 3.5,
				},
				scale = {
					name = L["Tooltip scale"],
					desc = L["The scale of the entire tooltip."],
					type = "range",
					min = .5,
					max = 2,
					step = .05,
					get = function() return db.scale end,
					set = function(_, scale) 
								db.scale = scale
								TipTop:SetBackgrounds()
							end,
					order = 4,
				},
				bgColor = {
					name = L["Background Color/Alpha"],
					desc = L["The background color and transparency.\n\nIf you wish to use a custom background texture and do not want it colored, set this to white."],
					type = "color",
					hasAlpha = true,
					get = function() return db.bgColor.r, db.bgColor.g, db.bgColor.b, db.alpha end,
					set = function(_,r,g,b,a)
							db.bgColor.r = r
							db.bgColor.g = g
							db.bgColor.b = b
							db.alpha = a
							TipTop:SetBackgrounds()
						end,
					order = 5,
				},
				bg = {
					name = L["Background"],
					desc = L["Texture to use as the tip's background."],
					type = "select",
					dialogControl = "LSM30_Background",
					values = widgetLists.background,
					get = function()
							return db.bg
						end,
					set = function(self, bg)
							db.bg = bg
							TipTop:SetBackgrounds()
						end,
					order = 6,
				},
				empty1 = {
					name = "   ",
					type = "description",
					order = 7,
				},
				empty5 = {
					name = "   ",
					type = "description",
					order = 8,
				},
				header5 = {
					name = L["Tooltip Position"],
					type = "header",
					order = 9,
				},
				onCursor = {
					name = L["On Cursor"],
					desc = L["Whether you want the tooltip attached to the cursor or not.\n\nNote: If checked, anchor and offsets below do not apply."],
					type = "toggle",
					get = function() return db.onCursor end,
					set = function()
								db.onCursor = not db.onCursor
							end,
					order = 10,
				},
				anchor = {
					name = L["Anchor To..."],
					desc = L["What side of the screen you would like the tooltip located at."],
					type = "select",
					disabled = function() return db.onCursor end,
					values = positions,
					get = function()
								for k, v in pairs(positions) do
									if db.anchor == v then
										return k
									end
								end
							end,
					set = function(_, anchor)
								db.anchor = positions[anchor]
							end,
					order = 11,
				},
				empty1 = {
					name = " ",
					type = "description",
					order = 12,
				},
				offsetX = {
					name = L["X Offset"],
					desc = L["Offsets from the tooltip's anchor left/right"],
					type = "input",
					disabled = function() return db.onCursor end,
					get = function() return db.offsetX end,
					set = function(_,offsetX)
								if offsetX == nil or offsetX == "" then
									offsetX = "0"
								end
								db.offsetX = offsetX
							end,
					order = 13,
				},
				offsetY = {
					name = L["Y Offset"],
					desc = L["Offsets from the tooltip's anchor up/down"],
					type = "input",
					disabled = function() return db.onCursor end,
					get = function() return db.offsetY end,
					set = function(_,offsetY)
								if offsetY == nil or offsetY == "" then
									offsetY = "0"
								end
								db.offsetY = offsetY
							end,
					order = 14,
				},
				mover = {
					name = L["Draggable Mover"],
					desc = L["Shows an anchor to move the tooltip's position."],
					type = "execute",
					disabled = function() return db.onCursor end,
					func = function()
								print("clicked button")
								InterfaceOptionsFrame:Hide()
								if not mover then
									print("creating mover")
									CreateMover()
								end
								mover:ClearAllPoints()
								mover:SetPoint(db.anchor, UIParent, db.anchor, db.offsetX, db.offsetY)
								mover:Show()
								StaticPopup_Show("TIPTOP_MOVER")
							end,
					order = 15,
				},
			},
		},
		baropts = {
			name = L["Health Bar"],
			type = "group",
			args = {
				header2 = {
					name = "",
					type = "group",
					type = "header",
					order = 1,
				},
				healthBar = {
					name = L["Health bar texture"],
					desc = L["Texture to use for the status bar below the tooltip."],
					type = "select",
					dialogControl = "LSM30_Statusbar",
					values = widgetLists.statusbar,
					get = function()
							return db.healthBar
						end,
					set = function(self, healthBar)
							db.healthBar = healthBar
							TipTop:SBarCustom()
						end,
					order = 2,
				},
				sbarcolor = {
					name = L["Health bar color"],
					desc = L["The color of the health bar."],
					type = "color",
					hasAlpha = true,
					get = function() return db.sbarcolor.r, db.sbarcolor.g, db.sbarcolor.b, db.sbarcolor.a end,
					set = function(_,r,g,b,a)
							db.sbarcolor.r = r
							db.sbarcolor.g = g
							db.sbarcolor.b = b
							db.sbarcolor.a = a
							TipTop:SBarCustom()
						end,
					order = 3,
				},
				sbarclass = {
					name = L["Color By Class"],
					desc = L["Color the health bar by class."],
					type = "toggle",
					get = function() return db.sbarclass end,
					set = function()
								db.sbarclass = not db.sbarclass
								if not db.sbarclass then
									TipTop:SBarCustom()
								end
							end,
					order = 4,
				},
				sbarbg = {
					name = L["Background texture"],
					desc = L["Texture to use for the status bar's background."],
					type = "select",
					dialogControl = "LSM30_Statusbar",
					values = widgetLists.statusbar,
					get = function()
							return db.sbarbg
						end,
					set = function(self, sbarbg)
							db.sbarbg = sbarbg
							TipTop:SBarCustom()
						end,
					order = 5,
				},
				sbarbgcolor = {
					name = L["Background Color"],
					desc = L["The color of the health bar's background."],
					type = "color",
					hasAlpha = true,
					width = "double",
					get = function() return db.sbarbgcolor.r, db.sbarbgcolor.g, db.sbarbgcolor.b, db.sbarbgcolor.a end,
					set = function(_,r,g,b,a)
							db.sbarbgcolor.r = r
							db.sbarbgcolor.g = g
							db.sbarbgcolor.b = b
							db.sbarbgcolor.a = a
							TipTop:SBarCustom()
						end,
					order = 6,
				},
				empty1 = {
					name = " ",
					type = "description",
					order = 7,
				},
				empty2 = {
					name = " ",
					type = "description",
					order = 7.5,
				},
				topBar = {
					name = L["Health bar on top"],
					desc = L["If checked, the health bar will be displayed above the tooltip instead of below."],
					type = "toggle",
					get = function() return db.topBar end,
					set = function()
								db.topBar = not db.topBar
								TipTop:SBarPosition()
							end,
					order = 8,
				},
				insideBar = {
					name = L["Health bar inside"],
					desc = L["If checked, the health bar will be displayed within the tooltip frame."],
					type = "toggle",
					get = function() return db.insideBar end,
					set = function()
								db.insideBar = not db.insideBar
								TipTop:SBarPosition()
							end,
					order = 9,
				},
				empty3 = {
					name = " ",
					type = "description",
					order = 10,
				},
				healthText = {
					name = L["Health text"],
					desc = L["If checked, health amount will be displayed on the tooltip's status bar."],
					type = "toggle",
					get = function() return db.healthText end,
					set = function()
								db.healthText = not db.healthText
								if db.healthText == true then
									ttHealth:Show()
								else
									ttHealth:Hide()
								end
							end,
					order = 11,
				},
				textformat = {
					name = L["Text format"],
					desc = L["Select how you would like health text displayed."],
					type = "select",
					disabled = function() return not db.healthText end,
					values = formats,
					get = function()
								for k, v in pairs(formats) do
									if db.textformat == v then
										return k
									end
								end
							end,
					set = function(_, textformat)
							db.textformat = formats[textformat]
						end,
					order = 12,
				},
				healthSize = {
					name = L["Health Text Size"],
					desc = L["The size of the text on the statusbar."],
					type = "range",
					min = 6,
					max = 20,
					step = 1,
					get = function() return db.healthSize end,
					set = function(_, healthSize) 
								db.healthSize = healthSize
								TipTop:SetFonts()
							end,
					order = 13,
				},
			},
		},
		borderopts = {
			name = L["Borders"],
			type = "group",
			args = {
				header3 = {
					name = "",
					type = "header",
					order = 1,
				},
				border = {
					name = L["Border"],
					desc = L["Texture for the tooltip borders."],
					type = "select",
					width = "double",
					dialogControl = "LSM30_Border",
					values = widgetLists.border,
					get = function()
							return db.border
						end,
					set = function(self, border)
							db.border = border
							TipTop:SetBackgrounds()
						end,
					order = 2,
				},
				borderColor = {
					name = L["Border color"],
					desc = L["Color of the border when not class, difficulty, or item quality colored."],
					type = "color",
					hasAlpha = true,
					get = function() return db.borderColor.r, db.borderColor.g, db.borderColor.b, db.borderColor.a end,
					set = function(_,r,g,b,a)
								db.borderColor.r = r
								db.borderColor.g = g
								db.borderColor.b = b
								db.borderColor.a = a
								TipTop:SetBackgrounds()
							end,
					order = 3,
				},
				empty1 = {
					name = " ",
					type = "description",
					order = 3.5,
				},
				borderWidth = {
					name = L["Border Width"],
					desc = L["Width of the border."],
					type = "range",
					min = 1,
					max = 24,
					step = .5,
					get = function() return db.borderWidth end,
					set = function(_, borderWidth) 
								db.borderWidth = borderWidth
								TipTop:SetBackgrounds()
							end,
					order = 4,
				},
				inset = {
					name = L["Inset"],
					desc = L["The inset of the background from the border texture."],
					type = "range",
					min = 0,
					max = 10,
					step = .5,
					get = function() return db.inset end,
					set = function(_, inset) 
								db.inset = inset
								TipTop:SetBackgrounds()
							end,
					order = 5,
				},
				empty2 = {
					name = " ",
					type = "description",
					order = 6,
				},
				classColor = {
					name = L["Class-colored borders"],
					desc = L["If checked, the border is colored by class when mousing over a unit.\n\nIf difficulty-colored is also checked, difficulty coloring has priority for hostile units."],
					type = "toggle",
					get = function() return db.classColor end,
					set = function()
								db.classColor = not db.classColor
							end,
					order = 7,
				},
				npcClassColor = {
					name = L["NPCs Color"],
					desc = L["If checked, the border of NPCs will also be colored by class.\n\nIf difficulty-colored is also checked, difficulty coloring has priority for hostile units."],
					type = "toggle",
					disabled = function() return not db.classColor end,
					get = function() return db.npcClassColor end,
					set = function()
								db.npcClassColor = not db.npcClassColor
							end,
					order = 7.5,
				},
				diffColor = {
					name = L["Difficulty-colored borders"],
					desc = L["If checked, the border is colored by level difficulty when mousing over a unit.\n\nIf class-colored is also checked, class coloring has priority for friendly units."],
					type = "toggle",
					get = function() return db.diffColor end,
					set = function()
								db.diffColor = not db.diffColor
							end,
					order = 8,
				},
				itemColor = {
					name = L["Item quality borders"],
					desc = L["If checked, the border is colored by item quality when mousing over an item"],
					type = "toggle",
					get = function() return db.itemColor end,
					set = function()
								db.itemColor = not db.itemColor
							end,
					order = 9,
				},
			},
		},
		iconopts = {
			name = L["Icons"],
			type = "group",
			args = {
				header4 = {
					name = "",
					type = "header",
					order = 1,
				},
				cIconOpts = {
					name = L["Class Icon Settings"],
					type = "group",
					inline = true,
					order = 2,
					args = {
						classIcon = {
							name = L["Display Class Icon"],
							desc = L["Display a class icon next to the unit's name in the tooltip."],
							type = "toggle",
							get = function() return db.classIcon end,
							set = function()
										db.classIcon = not db.classIcon
									end,
							order = 1,
						},				
						npcClassIcon = {
							name = L["NPCs Icon"],
							desc = L["Display a class icon next to the unit's name in the tooltip for NPCs also."],
							type = "toggle",
							disabled = function() return not db.classIcon end,
							get = function() return db.npcClassIcon end,
							set = function()
										db.npcClassIcon = not db.npcClassIcon
									end,
							order = 2,
						},
						classIconStyle = {
							name = L["Class Icon Style"],
							desc = L["Select the style of class icon displayed."],
							type = "select",
							disabled = function() return not db.classIcon end,
							values = classIconStyles,
							get = function()
									for k, v in pairs(classIconStyles) do
										if db.classIconStyle == v then
											return k
										end
									end
								end,
							set = function(_, style)
									db.classIconStyle = classIconStyles[style]
								end,
							order = 3,
						},
					},
				},
				fIconOpts = {
					name = L["Faction Icon Settings"],
					type = "group",
					inline = true,
					order = 3,
					args = {
						factionIcon = {
							name = L["Display Faction Icon"],
							desc = L["Display the faction icon for player controlled characters."],
							type = "toggle",
							width = "full",
							get = function() return db.factionIcon end,
							set = function()
										db.factionIcon = not db.factionIcon
										TipTop:FactionIcon()
									end,
							order = 1,
						},
						factionIconSize = {
							name = L["Faction icon size"],
							desc = L["Width and height of the faction icon on the tooltip"],
							type = "range",
							disabled = function() return not db.factionIcon end,
							min = 8,
							max = 64,
							step = 1,
							get = function() return db.factionIconSize end,
							set = function(_, factionIconSize) 
										db.factionIconSize = factionIconSize
										TipTop:FactionIcon()
									end,
							order = 2,
						},
						factionIconPosition = {
							name = L["Faction icon position"],
							desc = L["What side of the tip you would like the icon located at."],
							type = "select",
							disabled = function() return not db.factionIcon end,
							values = positions,
							get = function()
										for k, v in pairs(positions) do
											if db.factionIconPosition == v then
												return k
											end
										end
									end,
							set = function(_, factionIconPosition)
										db.factionIconPosition = positions[factionIconPosition]
										TipTop:FactionIcon()
									end,
							order = 3,
						},
						factionIconX = {
							name = L["X Offset"],
							desc = L["Offsets from the icon's position left/right"],
							type = "input",
							width = "half",
							disabled = function() return not db.factionIcon end,
							get = function() return db.factionIconX end,
							set = function(_,factionIconX)
										if factionIconX == nil or factionIconX == "" then
											factionIconX = "0"
										end
										db.factionIconX = factionIconX
										TipTop:FactionIcon()
									end,
							order = 4,
						},
						factionIconY = {
							name = L["Y Offset"],
							desc = L["Offsets from the icon's position up/down"],
							type = "input",
							width = "half",
							disabled = function() return not db.factionIcon end,
							get = function() return db.factionIconY end,
							set = function(_,factionIconY)
										if factionIconY == nil or factionIconY == "" then
											factionIconY = "0"
										end
										db.factionIconY = factionIconY
										TipTop:FactionIcon()
									end,
							order = 5,
						},
					},
				},
				rIconOpts = {
					name = L["Raid Icon Settings"],
					type = "group",
					inline = true,
					order = 4,
					args = {
						raidIconSize = {
							name = L["Raid icon size"],
							desc = L["Width and height of the raid icon on the tooltip"],
							type = "range",
							min = 8,
							max = 32,
							step = 1,
							get = function() return db.raidIconSize end,
							set = function(_, raidIconSize) 
										db.raidIconSize = raidIconSize
										TipTop:RaidIcon()
									end,
							order = 1,
						},
						raidIconPosition = {
							name = L["Raid icon position"],
							desc = L["What side of the tip you would like the icon located at."],
							type = "select",
							values = positions,
							get = function()
										for k, v in pairs(positions) do
											if db.raidIconPosition == v then
												return k
											end
										end
									end,
							set = function(_, raidIconPosition)
										db.raidIconPosition = positions[raidIconPosition]
										TipTop:RaidIcon()
									end,
							order = 2,
						},
						raidIconX = {
							name = L["X Offset"],
							desc = L["Offsets from the icon's position left/right"],
							type = "input",
							width = "half",
							get = function() return db.raidIconX end,
							set = function(_,raidIconX)
										if raidIconX == nil or raidIconX == "" then
											raidIconX = "0"
										end
										db.raidIconX = raidIconX
										TipTop:RaidIcon()
									end,
							order = 3,
						},
						raidIconY = {
							name = L["Y Offset"],
							desc = L["Offsets from the icon's position up/down"],
							type = "input",
							width = "half",
							get = function() return db.raidIconY end,
							set = function(_,raidIconY)
										if raidIconY == nil or raidIconY == "" then
											raidIconY = "0"
										end
										db.raidIconY = raidIconY
										TipTop:RaidIcon()
									end,
							order = 4,
						},
					},
				},
			},
		},
		extraopts = {
			name = L["Extra Stuff"],
			type = "group",
			args = {
				header6 = {
					name = "",
					type = "header",
					order = 37,
				},
				showTargetText = {
					name = L["Target text"],
					desc = L["Whether you wish to view the mouseover unit's target in the tooltip"],
					type = "toggle",
					get = function() return db.showTargetText end,
					set = function()
								db.showTargetText = not db.showTargetText
							end,
					order = 38,
				},
				you = {
					name = L["Target emphasis"],
					desc = L["When checked, if the mouseover unit's target is you, it will be displayed as |c00E30016<<YOU>>|r."],
					type = "toggle",
					disabled = function() return not db.showTargetText end,
					get = function() return db.you end,
					set = function()
								db.you = not db.you
							end,
					order = 39,
				},
				showTalentText = {
					name = L["Talent text"],
					desc = L["Whether you wish to view the mouseover unit's talent specialization in the tooltip"],
					type = "toggle",
					get = function() return db.showTalentText end,
					set = function()
								db.showTalentText = not db.showTalentText
							end,
					order = 40,
				},
				elite = {
					name = L["Elite graphic"],
					desc = L["Will display the gold and silver elite dragons for elites and rare elites at the top left of the tooltip."],
					type = "toggle",
					get = function() return db.elite end,
					set = function()
								db.elite = not db.elite
							end,
					order = 44,
				},
				guildRank = {
					name = L["Guild Rank"],
					desc = L["Display the unit's rank next to the guild name in the tooltip."],
					type = "toggle",
					get = function() return db.guildRank end,
					set = function()
								db.guildRank = not db.guildRank
							end,
					order = 45,
				},
			},
		},
		profile = {
			name = L["Profile"],
			type = "group",
			args = {
				header7 = {
					name = "",
					type = "header",
					order = 42,
				},
				charSpec = {
					name = L["Character specific settings"],
					desc = L["Have this character use their own profile.  If checked, any changes made will not affect other characters.\n\n|c00E30016WARNING:|r Your UI will be reloaded in the process!"],
					type = "toggle",
					width = "full",
					confirm = true,
					get = function() return TipTopPCDB.charSpec end,
					set = function()
								TipTopPCDB.charSpec = not TipTopPCDB.charSpec
								ReloadUI()
							end,
					order = 43,
				},
--[[				warning = {
					name = "Have this character use their own profile.  If checked, any changes made will not affect other characters.\n\n|c00E30016WARNING:|r Your UI will be reloaded in the process!",
					type = "description",
					order = 44,
				},]]--
				copyProfile = {
					name = L["Copy from Default"],
					desc = L["Copy all settings from the default, global profile to this character's profile.  This will not effect other characters' specific profiles.\n\n|c00E30016WARNING:|r Your UI will be reloaded in the process!"],
					type = "execute",
					confirm = true,
					disabled = function() return not TipTopPCDB.charSpec end,
					func = function()
								TipTopPCDB = TipTopDB
								TipTopPCDB.charSpec = true
								ReloadUI()
							end,
					order = 44,
				},
				resetProfile = {
					name = L["Profile Reset"],
					desc = L["Reset this profile back to the out-of-the-box settings.  If you reset the character specific profile, the global profile will be untouched, and vice versa.  This will not effect other character specific profiles.\n\n|c00E30016WARNING:|r Your UI will be reloaded in the process!"],
					type = "execute",
					confirm = true,
					func = function()
								if TipTopPCDB.charSpec then
									TipTopPCDB = {charSpec = true}
								else
									TipTopDB = {}
								end
								ReloadUI()
							end,
					order = 45,
				},
			},
		},
	},
}

local function OnInitialize()
	SetUpDB()
	
	LibStub("AceConfig-3.0"):RegisterOptionsTable("TipTop", options)
	TipTop.optionsFrame = LibStub("AceConfigDialog-3.0"):AddToBlizOptions("TipTop", "TipTop", nil, "general")
	TipTop.optionsFrame.baropts = LibStub("AceConfigDialog-3.0"):AddToBlizOptions("TipTop", L["Health Bar"], "TipTop", "baropts")
	TipTop.optionsFrame.borderopts = LibStub("AceConfigDialog-3.0"):AddToBlizOptions("TipTop", L["Borders"], "TipTop", "borderopts")
	TipTop.optionsFrame.iconopts = LibStub("AceConfigDialog-3.0"):AddToBlizOptions("TipTop", L["Icons"], "TipTop", "iconopts")
	TipTop.optionsFrame.extraopts = LibStub("AceConfigDialog-3.0"):AddToBlizOptions("TipTop", L["Extra Stuff"], "TipTop", "extraopts")
	TipTop.optionsFrame.profile = LibStub("AceConfigDialog-3.0"):AddToBlizOptions("TipTop", L["Profile"], "TipTop", "profile")
	
	SlashCmdList["TIPTOP"] = function()
		InterfaceOptionsFrame_OpenToCategory("TipTop")
		InterfaceOptionsFrame_OpenToCategory("TipTop")
	end
	SLASH_TIPTOP1 = "/tiptop"
	SLASH_TIPTOP2 = "/tip"
end

--register media with LibSharedMedia
LSM:Register("statusbar", "TipTop Default", "Interface\\AddOns\\TipTop\\media\\bar2.blp")
LSM:Register("statusbar", "TipTop Alt", "Interface\\AddOns\\TipTop\\media\\bar1.blp")
LSM:Register("border", "Seerah Solid", "Interface\\AddOns\\TipTop\\media\\SeerahSolidBorder.blp")
LSM:Register("background", "brushed", "Interface\\AddOns\\TipTop\\media\\brushed.tga")

	
f:SetScript("OnEvent", OnInitialize)
f:RegisterEvent("PLAYER_LOGIN")