local E, L, V, P, G = unpack(ElvUI); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB
local DT = E:GetModule('DataTexts')

local datatexts = {}
local GetSpecializationInfo = GetSpecializationInfo
local GetNumEquipmentSets = GetNumEquipmentSets
local GetEquipmentSetInfo = GetEquipmentSetInfo

local function GetEquipmentList()
	local num = GetNumEquipmentSets()
	local list = {['NONE'] = NONE}
	if num == 0 then return list; end
	
	for i = 1, num do
		local name = GetEquipmentSetInfo(i)
		list[name] = name;
	end
	
	return list;
end

function DT:PanelLayoutOptions()
	for name, _ in pairs(DT.RegisteredDataTexts) do
		datatexts[name] = L[name]
	end
	datatexts[''] = NONE

	local order
	local table = E.Options.args.datatexts.args.panels.args
	for pointLoc, tab in pairs(P.datatexts.panels) do
		if not _G[pointLoc] then table[pointLoc] = nil; return; end
		if type(tab) == 'table' then
			if pointLoc:find("Chat") then
				order = 15
			else
				order = 20
			end
			table[pointLoc] = {
				type = 'group',
				args = {},
				name = L[pointLoc] or pointLoc,
				order = order,
			}
			for option, value in pairs(tab) do
				table[pointLoc].args[option] = {
					type = 'select',
					name = L[option] or option:upper(),
					values = datatexts,
					get = function(info) return E.db.datatexts.panels[pointLoc][ info[#info] ] end,
					set = function(info, value)
						E.db.datatexts.panels[pointLoc][ info[#info] ] = value;
						if pointLoc == 'TopDataTextsBar3' then E:StaticPopup_Show("PRIVATE_RL") end;
						DT:LoadDataTexts()
					end,
				}
			end
		elseif type(tab) == 'string' then
			table.smallPanels.args[pointLoc] = {
				type = 'select',
				name = L[pointLoc] or pointLoc,
				values = datatexts,
				get = function(info) return E.db.datatexts.panels[pointLoc] end,
				set = function(info, value) E.db.datatexts.panels[pointLoc] = value; DT:LoadDataTexts() end,
			}
		end
	end
end

E.Options.args.datatexts = {
	type = "group",
	name = '12.'..L["DataTexts"],
	childGroups = "tab",
	get = function(info) return E.db.datatexts[ info[#info] ] end,
	set = function(info, value) E.db.datatexts[ info[#info] ] = value; DT:LoadDataTexts() end,
	args = {
		intro = {
			order = 1,
			type = "description",
			name = L["DATATEXT_DESC"],
		},
		spacer = {
			order = 2,
			type = "description",
			name = "",
		},
		general = {
			order = 3,
			type = "group",
			name = L["General"],
			args = {
				header = {
					order = 1,
					type = "header",
					name = L["General"],
				},
				generalGroup = {
					order = 2,
					type = "group",
					guiInline = true,
					name = L["General"],
					args = {
						battleground = {
							order = 3,
							type = 'toggle',
							name = L["Battleground Texts"],
							desc = L["When inside a battleground display personal scoreboard information on the main datatext bars."],
						},
						panelTransparency = {
							order = 4,
							name = L["Panel Transparency"],
							type = 'toggle',
							set = function(info, value)
								E.db.datatexts[ info[#info] ] = value
								E:GetModule('Layout'):SetDataPanelStyle()
							end,
						},
						noCombatClick = {
							order = 5,
							type = "toggle",
							name = L["Block Combat Click"],
							desc = L["Blocks all click events while in combat."],
						},
						noCombatHover = {
							order = 6,
							type = "toggle",
							name = L["Block Combat Hover"],
							desc = L["Blocks datatext tooltip from showing in combat."],
						},
						goldFormat = {
							order = 7,
							type = 'select',
							name = L["Gold Format"],
							desc = L["The display format of the money text that is shown in the gold datatext and its tooltip."],
							values = {
								['SMART'] = L["Smart"],
								['FULL'] = L["Full"],
								['SHORT'] = L["Short"],
								['SHORTINT'] = L["Short (Whole Numbers)"],
								['CONDENSED'] = L["Condensed"],
								['BLIZZARD'] = L["Blizzard Style"],
							},
						},
						goldCoins = {
							order = 8,
							type = 'toggle',
							name = L["Show Coins"],
							desc = L["Use coin icons instead of colored text."],
						},
						width = {
							order = 16,
							name = L['TopInfobar width'],
							type = 'range',
							min = 20, max = 200, step = 1,
							set = function(info, value)
								E.db.infobar.width = value
								E:GetModule('Layout'):ChangeSize(TopDataTextsBar1);
								E:GetModule('Layout'):ChangeSize(TopDataTextsBar2);
								E:GetModule('Layout'):ChangeSize(TopDataTextsBar3, 3);
								E:GetModule('Layout'):ChangeSize(TopDataTextsBar4, 2);
								E:GetModule('Layout'):ChangePositon()
								DT:UpdateAllDimensions()
							end,
							get = function(info) return E.db.infobar.width; end,
						},
						height = {
							order = 17,
							type = 'range',
							min = 10, max = 100, step = 1,
							name = L['TopInfobar height'],
							set = function(info, value)
								E.db.infobar.height = value
								E:GetModule('Layout'):ChangeSize(TopDataTextsBar1);
								E:GetModule('Layout'):ChangeSize(TopDataTextsBar2);
								E:GetModule('Layout'):ChangeSize(TopDataTextsBar3, 3);
								E:GetModule('Layout'):ChangeSize(TopDataTextsBar4, 2);
								E:GetModule('Layout'):ChangePositon()
								DT:UpdateAllDimensions()
							end,
							get = function(info) return E.db.infobar.height; end,
						},
						alignABInfo = {
							order = 18,
							type = 'execute',
							name = L['Align Actionbar Infobar'],
							desc = L['Align Actionbar Infobar desc'],
							func = function() 
								if E.db.actionbar.euiabstyle ~= 'None' then
									E:SetupActionbar(E.db.actionbar.euiabstyle)
								end
							end,
						},
					},
				},
				fontGroup = {
					order = 3,
					type = 'group',
					guiInline = true,
					name = L["Fonts"],
					args = {
						font = {
							type = "select", dialogControl = 'LSM30_Font',
							order = 1,
							name = L["Font"],
							values = AceGUIWidgetLSMlists.font,
						},
						fontSize = {
							order = 2,
							name = L["Font Size"],
							type = "range",
							min = 4, max = 212, step = 1,
						},
						fontOutline = {
							order = 3,
							name = L["Font Outline"],
							desc = L["Set the font outline."],
							type = "select",
							values = {
								['NONE'] = L["None"],
								['OUTLINE'] = 'OUTLINE',
								['MONOCHROMEOUTLINE'] = 'MONOCROMEOUTLINE',
								['THICKOUTLINE'] = 'THICKOUTLINE',
							},
						},
						wordWrap = {
							order = 4,
							type = "toggle",
							name = L["Word Wrap"],
						},
					},
				},
			},
		},
		panels = {
			type = 'group',
			name = L["Panels"],
			order = 4,
			args = {
				header = {
					order = 1,
					type = "header",
					name = L["Panels"],
				},
				leftChatPanel = {
					order = 2,
					name = L["Datatext Panel (Left)"],
					desc = L["Display data panels below the chat, used for datatexts."],
					type = 'toggle',
					set = function(info, value)
						E.db.datatexts[ info[#info] ] = value
						if E.db.LeftChatPanelFaded then
							E.db.LeftChatPanelFaded = true;
							HideLeftChat()
						end
						E:GetModule('Chat'):UpdateAnchors()
						E:GetModule('Layout'):ToggleChatPanels()
					end,
				},
				rightChatPanel = {
					order = 3,
					name = L["Datatext Panel (Right)"],
					desc = L["Display data panels below the chat, used for datatexts."],
					type = 'toggle',
					set = function(info, value)
						E.db.datatexts[ info[#info] ] = value
						if E.db.RightChatPanelFaded then
							E.db.RightChatPanelFaded = true;
							HideRightChat()
						end
						E:GetModule('Chat'):UpdateAnchors()
						E:GetModule('Layout'):ToggleChatPanels()
					end,
				},
				minimapPanels = {
					order = 4,
					name = L["Minimap Panels"],
					desc = L["Display minimap panels below the minimap, used for datatexts."],
					type = 'toggle',
					set = function(info, value)
						E.db.datatexts[ info[#info] ] = value
						E:GetModule('Minimap'):UpdateSettings()
					end,
				},
				minimapTop = {
					order = 5,
					name = L["TopMiniPanel"],
					type = 'toggle',
					set = function(info, value)
						E.db.datatexts[ info[#info] ] = value
						E:GetModule('Minimap'):UpdateSettings()
					end,
				},
				minimapTopLeft = {
					order = 6,
					name = L["TopLeftMiniPanel"],
					type = 'toggle',
					set = function(info, value)
						E.db.datatexts[ info[#info] ] = value
						E:GetModule('Minimap'):UpdateSettings()
					end,
				},
				minimapTopRight = {
					order = 7,
					name = L["TopRightMiniPanel"],
					type = 'toggle',
					set = function(info, value)
						E.db.datatexts[ info[#info] ] = value
						E:GetModule('Minimap'):UpdateSettings()
					end,
				},
				minimapBottom = {
					order = 8,
					name = L["BottomMiniPanel"],
					type = 'toggle',
					set = function(info, value)
						E.db.datatexts[ info[#info] ] = value
						E:GetModule('Minimap'):UpdateSettings()
					end,
				},
				minimapBottomLeft = {
					order = 9,
					name = L["BottomLeftMiniPanel"],
					type = 'toggle',
					set = function(info, value)
						E.db.datatexts[ info[#info] ] = value
						E:GetModule('Minimap'):UpdateSettings()
					end,
				},
				minimapBottomRight = {
					order = 10,
					name = L["BottomRightMiniPanel"],
					type = 'toggle',
					set = function(info, value)
						E.db.datatexts[ info[#info] ] = value
						E:GetModule('Minimap'):UpdateSettings()
					end,
				},
				spacer = {
					order = 11,
					type = "description",
					name = "\n",
				},
				smallPanels = {
					type = "group",
					name = L["Small Panels"],
					order = 12,
					args = {},
				},
			},
		},
		currencies = {
			order = 5,
			type = "group",
			name = L["Currencies"], --Name of datatext, which isn't localized
			args = {
				header = {
					order = 1,
					type = "header",
					name = L["Currencies"],
				},
				displayedCurrency = {
					order = 2,
					type = "select",
					name = L["Displayed Currency"],
					get = function(info) return E.db.datatexts.currencies.displayedCurrency end,
					set = function(info, value) E.db.datatexts.currencies.displayedCurrency = value; DT:LoadDataTexts() end,
					values = function() return DT:Currencies_GetCurrencyList() end,
				},
				displayStyle = {
					order = 3,
					type = "select",
					name = L["Currency Format"],
					get = function(info) return E.db.datatexts.currencies.displayStyle end,
					set = function(info, value) E.db.datatexts.currencies.displayStyle = value; DT:LoadDataTexts() end,
					disabled = function() return (E.db.datatexts.currencies.displayedCurrency == "GOLD") end,
					values = {
						["ICON"] = L["Icons Only"],
						["ICON_TEXT"] = L["Icons and Text"],
						["ICON_TEXT_ABBR"] = L["Icons and Text (Short)"],
					},
				},
			},
		},
		time = {
			order = 6,
			type = "group",
			name = "Time", --Name of datatext, which isn't localized
			args = {
				header = {
					order = 1,
					type = "header",
					name = "Time",
				},
				time24 = {
					order = 2,
					type = 'toggle',
					name = L["24-Hour Time"],
					desc = L["Toggle 24-hour mode for the time datatext."],
					get = function(info) return E.db.datatexts.time24 end,
					set = function(info, value) E.db.datatexts.time24 = value; DT:LoadDataTexts() end,
				},
				localtime = {
					order = 3,
					type = 'toggle',
					name = L["Local Time"],
					desc = L["If not set to true then the server time will be displayed instead."],
					get = function(info) return E.db.datatexts.localtime end,
					set = function(info, value) E.db.datatexts.localtime = value; DT:LoadDataTexts() end,
				},
			},
		},
		spec = {
			order = 130,
			type = 'group',
			guiInline = true,
			name = L['Spec Binding Equipment'],
			args = {
				spec1 = {
					type = 'select',
					order = 1,
					name = select(2, GetSpecializationInfo(1)),
					values = GetEquipmentList,
					get = function(info, k) return E.db.datatexts.spec1; end,
					set = function(info, k, v) E.db.datatexts.spec1 = k; end,
				},
				spec2 = {
					type = 'select',
					order = 2,
					name = select(2, GetSpecializationInfo(2)),
					values = GetEquipmentList,
					get = function(info, k) return E.db.datatexts.spec2; end,
					set = function(info, k, v) E.db.datatexts.spec2 = k; end,
				},
				spec3 = {
					type = 'select',
					order = 1,
					name = select(2, GetSpecializationInfo(3)) or " ",
					hidden = function() return not GetSpecializationInfo(3) end,
					values = GetEquipmentList,
					get = function(info, k) return E.db.datatexts.spec3; end,
					set = function(info, k, v) E.db.datatexts.spec3 = k; end,
				},
				spec4 = {
					type = 'select',
					order = 2,
					name = select(2, GetSpecializationInfo(4)) or " ",
					hidden = function() return not GetSpecializationInfo(4) end,
					values = GetEquipmentList,
					get = function(info, k) return E.db.datatexts.spec4; end,
					set = function(info, k, v) E.db.datatexts.spec4 = k; end,
				},
			},
		},
	},
}

DT:PanelLayoutOptions()