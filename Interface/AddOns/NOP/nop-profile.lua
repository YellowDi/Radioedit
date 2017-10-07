--[[ LUA variables in WTF ]]
local _
local ADDON, private = ...
local NOP = LibStub("AceAddon-3.0"):GetAddon(ADDON)
function NOP:ProfileChanged() -- LUA stored variables changed
  self.DB = self.AceDB.profile.char.settings
  self:ButtonLoad()
  self:QBUpdate()
  self:QBSkin()
  wipe(NOP.T_CHECK)
  self:ItemShowNew()
end
function NOP:ProfileLoad() -- LUA stored variables load and init
  local defaults = {
    profile = {
      ["iconSize"] = private.DEFAULT_ICON_SIZE, -- default size
      ["lockButton"] = false, -- unlock
      ["skinButton"] = false, -- buttons are skinned
      ["masque"] = true, -- if Masque addon is loaded then hand skinning to addon
      ["button"] = {"CENTER", nil, "CENTER", 0, 0}, -- Item Button anchor and location
      ["qb"] = {"CENTER", nil, "CENTER", 0, 0}, -- Quest Bar location if not qb_sticky
      ["qb_sticky"] = true, -- Quest Bar is anchored to Item Button
      ["T_BLACKLIST"] = {}, -- Permanent blacklist for items button
      ["T_BLACKLIST_Q"] = {}, -- Permanent blacklist for quest items
      ["Skip"] = false,
      ["zoneUnlock"] = true,
      ["glowButton"] = true,
      ["backdrop"] = true,
      ["profession"] = true,
      ["verbose"] = false,
      ["cofeeStacks"] = 1,
      ["quest"] = false,
      ["visible"] = false,
      ["swap"] = false,
      -- not need anymore ["script"] = false,
      ["autoquest"] = false,
      ["slots"] = 10,
      ["direction"] = "RIGHT",
      ["keyBind"] = "ALT-Q",
      ["expand"] = 1,
      ["spacing"] = 1,
    },
  }

  self.AceDB = LibStub("AceDB-3.0"):New("NewOpenablesProfile",defaults,true)
  self.AceDB.RegisterCallback(self, "OnProfileChanged", "ProfileChanged")
  self.AceDB.RegisterCallback(self, "OnProfileCopied",  "ProfileChanged")
  self.AceDB.RegisterCallback(self, "OnProfileReset",   "ProfileChanged")
  if self.AceDB.profile.char then -- one-time migration
    local dst = self.AceDB.profile -- new location 
    for key,val in pairs(self.AceDB.profile.char.settings) do
      dst[key] = val
    end
    self.AceDB.profile.char = nil -- remove it from saved variables
  end
  self.DB = self.AceDB.profile -- profile
  self.profileOn = self.DB.profiling
end
function NOP:OptionsLoad() -- load options for UI config
  local NewOpenablesOptions = {
    type = "group",
    args = {
      ver = {
        name = private.NOP_VERSION,
        type = "header",
        order = 0,
        width = "full",    
      },
      toggle = {
        order = 1,
        name = private.L["Toggle"],
        type = "group",
        args = {
          skin = {
            name = private.L["Skin Button"],
            order = 1,
            type = "toggle",
            width = "full",    
            set = function(info,val) NOP.DB["skinButton"] = val; NOP:ButtonLoad(); NOP:QBSkin(); end,
            get = function(info) return NOP.DB.skinButton end,
          },
          masque = {
            name = private.L["Masque Enable"],
            order = 2,
            desc = private.L["Need UI reload or relogin to activate."],
            type = "toggle",
            width = "full",    
            set = function(info,val) NOP.DB["masque"] = val; end,
            get = function(info) return NOP.DB.masque end,
          },
          backdrop = {
            name = private.L["Backdrop Button"],
            order = 3,
            desc = private.L["Create or remove backdrop around button, need reload UI."],
            type = "toggle",
            width = "full",    
            set = function(info,val) NOP.DB["backdrop"] = val; end,
            get = function(info) return NOP.DB.backdrop end,
          },
          lock = {
            name = private.L["Lock Button"],
            order = 4,
            desc = private.L["Lock button in place to disbale drag."],
            type = "toggle",
            width = "full",    
            set = function(info,val) NOP.DB["lockButton"] = val; end,
            get = function(info) return NOP.DB.lockButton end,
          },
          glow = {
            name = private.L["Glow Button"],
            order = 5,
            desc = private.L["When item is placed by zone change, button will have glow effect."],
            type = "toggle",
            width = "full",    
            set = function(info,val) NOP.DB["glowButton"] = val; end,
            get = function(info) return NOP.DB.glowButton end,
          },
          skip = {
            name = private.L["Session skip"],
            order = 6,
            desc = private.L["Skipping item last until relog."],
            type = "toggle",
            width = "full",    
            set = function(info,val) NOP.DB["Skip"] = val; if NOP:BlacklistClear() then NOP:ItemShowNew() end; end,
            get = function(info) return NOP.DB.Skip end,
          },
          zoneUnlock = {
            name = private.L["Zone unlock"],
            order = 7,
            desc = private.L["Don't zone restrict openable items"],
            type = "toggle",
            width = "full",    
            set = function(info,val) NOP.DB["zoneUnlock"] = val; NOP:ItemShowNew(); end,
            get = function(info) return NOP.DB.zoneUnlock end,
          },
          profession = {
            name = private.L["Profession"],
            order = 8,
            desc = private.L["Place items usable by lockpicking"],
            type = "toggle",
            width = "full",    
            set = function(info,val) NOP.DB["profession"] = val; NOP:ItemShowNew(); end,
            get = function(info) return NOP.DB.profession end,
          },
          quest = {
            name = private.L["Quest bar"],
            order = 9,
            desc = private.L["Quest items placed on bar"],
            type = "toggle",
            width = "full",    
            set = function(info,val) NOP.DB["quest"] = val; NOP:QBUpdate(); end,
            get = function(info) return NOP.DB.quest end,
          },
          visible = {
            name = private.L["Visible"],
            order = 10,
            desc = private.L["Make button visible by placing fake item on it"],
            type = "toggle",
            width = "full",    
            set = function(info,val) NOP.DB["visible"] = val; NOP:ItemShowNew(); NOP:QBUpdate(); end,
            get = function(info) return NOP.DB.visible end,
          },
          swap = {
            name = private.L["Swap"],
            order = 11,
            desc = private.L["Swap location of numbers for count and cooldown timer"],
            type = "toggle",
            width = "full",    
            set = function(info,val) NOP.DB["swap"] = val; NOP:ButtonSwap(NOP.BF,NOP.DB.swap) end,
            get = function(info) return NOP.DB.swap end,
          },
          --[[ script = {
            name = private.L["Script"],
            order = 12,
            desc = private.L["Let button on use close unwanted windows like NPC trader, bank etc. You need enable custom scripts to run!"],
            type = "toggle",
            width = "full",    
            set = function(info,val) NOP.DB["script"] = val; end,
            get = function(info) return NOP.DB.script end,
          }, ]]
          autoquest = {
            name = private.L["AutoQuest"],
            order = 13,
            desc = private.L["Auto accept or hand out quests from AutoQuestPopupTracker!"],
            type = "toggle",
            width = "full",    
            set = function(info,val) NOP.DB["autoquest"] = val; end,
            get = function(info) return NOP.DB.autoquest end,
          },
          header1 = {
            type = "header",
            name = "",
            order = 14,
          },
          blacklist = {
            name = private.L["Clear Blacklist"],
            order = 15,
            desc = private.L["Reset Permanent blacklist."],
            type = "execute",
            func = function() NOP:BlacklistReset() end,
          },
        },
      },
      pos = {
        name = private.L["Button"],
        type = "group",
        order = 2,
        args = {
          header1 = {
            name = private.L["Buttom location"],
            type = "header",
            order = 1,
          },
          GMFx = {
            name = "X",
            type = "range",
            -- width = "full",    
            order = 2,
            min = -1000,
            max = 1000,
            step = 1,
            bigStep = 10,
            set = function(info,val) NOP.DB.button[4] = val; NOP:ButtonMove(); end,
            get = function(info) return NOP.DB.button[4] end,
          },
          GMFy = {
            name = "Y",
            type = "range",
            -- width = "full",    
            order = 3,
            min = -500,
            max = 500,
            step = 1,
            bigStep = 10,
            set = function(info,val) NOP.DB.button[5] = val; NOP:ButtonMove(); end,
            get = function(info) return NOP.DB.button[5] end,
          },
          header2 = {
            name = private.L["Button size"],
            type = "header",
            order = 4,
          },
          iconSize = {
            name = private.L["Width and Height"],
            desc = private.L["Button size in pixels"],
            width = "full",    
            type = "range",
            order = 5,
            min = 16,
            max = 64,
            step = 1,
            set = function(info,val) NOP.DB["iconSize"] = val; NOP:ButtonSize(); NOP:QBUpdate(); end,
            get = function(info) return NOP.DB.iconSize end,
          },
          header3 = {
            name = "",
            type = "header",
            order = 6,
          },
          cofeeStacks = {
            name = private.L["Miner's Coffee stacks"],
            desc = private.L["Allow buff up to this number of stacks"],
            type = "range",
            width = "full",    
            order = 7,
            min = 1,
            max = 5,
            step = 1,
            set = function(info,val) NOP.DB["cofeeStacks"] = val; end,
            get = function(info) return NOP.DB.cofeeStacks end,
          },
        },
      },
      quest = {
        order = 3,
        name = private.L["Quest bar"],
        type = "group",
        args = {
          sticky = {
            order = 1,
            name = private.L["Sticky"],
            desc = private.L["Anchor to Item button"],
            type = "toggle",
            width = "full",    
            set = function(info,val) NOP.DB["qb_sticky"] = val; NOP:QBUpdate(); end,
            get = function(info) return NOP.DB.qb_sticky end,
          },
          slots = {
            name = private.L["Buttons per row"],
            desc = private.L["Number of buttons placed in one row"],
            type = "range",
            order = 2,
            min = 5,
            max = 20,
            step = 1,
            set = function(info,val) NOP.DB["slots"] = val; NOP:QBUpdate(); end,
            get = function(info) return NOP.DB.slots end,
          },
          spacing = {
            name = private.L["Spacing"],
            desc = private.L["Space between buttons"],
            type = "range",
            order = 3,
            min = -10,
            max = 10,
            step = 1,
            set = function(info,val) NOP.DB["spacing"] = val; NOP:QBUpdate(); end,
            get = function(info) return NOP.DB.spacing end,
          },
          header1 = {
            name = "",
            type = "header",
            order = 4,
          },
          direction = {
            name = private.L["Direction"],
            desc = private.L["Expand bar to"],
            order = 5,
            type = "select",
            values = { UP = private.L["Up"], DOWN = private.L["Down"], LEFT = private.L["Left"], RIGHT = private.L["Right"] },
            set = function(info,val) NOP.DB["direction"] = val; NOP:QBUpdate(); end,
            get = function(info) return NOP.DB.direction end,
          },
          expand = {
            order = 6,
            type = "select",
            name = private.L["Add new row"],
            desc = private.L["Above or below last one"],
            values = { [1] = private.L["Up"], [-1] = private.L["Down"] },
            set = function(info,val) NOP.DB["expand"] = val; NOP:QBUpdate(); end,
            get = function(info) return NOP.DB.expand end,
          },
          header2 = {
            name = "",
            type = "header",
            order = 7,
          },
          keyBind = {
            order = 8,
            name = private.L["Hot-Key"],
            desc = private.L["Key to use for automatic key binding."],
            type = "keybinding",
            width = "full",    
            set = function(info,val) NOP.DB["keyBind"] = val; NOP:QBUpdate(); end,
            get = function(info) return NOP.DB.keyBind end,
          }
        },
      },
    },
  }
  NewOpenablesOptions.args.profiles = LibStub("AceDBOptions-3.0"):GetOptionsTable(self.AceDB)
  LibStub("AceConfig-3.0"):RegisterOptionsTable(private.NOP_TITLE, NewOpenablesOptions)
  LibStub("AceConfigDialog-3.0"):AddToBlizOptions(private.NOP_TITLE,ADDON,nil)
end
