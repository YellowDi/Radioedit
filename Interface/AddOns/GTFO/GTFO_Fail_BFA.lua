--------------------------------------------------------------------------
-- GTFO_Fail_BFA.lua 
--------------------------------------------------------------------------
--[[
GTFO Fail List - Battle for Azeroth
Author: Zensunim of Malygos
]]--


--- ******************************
--- * Battle for Azeroth (World) *
--- ******************************


GTFO.SpellID["268216"] = {
  --desc = "Earth Shattering (Azerite War Machine)";
  sound = 3;
};

GTFO.SpellID["269560"] = {
  --desc = "Landmine Explosion ";
  sound = 3;
};

GTFO.SpellID["262250"] = {
  --desc = "Blinded by the Light";
  applicationOnly = true;
  sound = 3;
};

GTFO.SpellID["263626"] = {
  --desc = "Icy Glare (Lady Jaina Proudmoore)";
  applicationOnly = true;
  sound = 3;
};

GTFO.SpellID["263874"] = {
  --desc = "Blizzard (Lady Jaina Proudmoore)";
  sound = 3;
};

GTFO.SpellID["264973"] = {
  --desc = "Frost Barrage (Lady Jaina Proudmoore)";
  sound = 3;
};

-- ***********************
-- * Shrine of the Storm *
-- ***********************

GTFO.SpellID["267973"] = {
  --desc = "Wash Away (Temple Attendant)";
  sound = 3;
};

GTFO.SpellID["268059"] = {
  --desc = "Anchor of Binding (Tidesage Spiritualist)";
  sound = 3;
};

GTFO.SpellID["264773"] = {
  --desc = "Choking Brine (Aqu'sirr)";
  applicationOnly = true;
  sound = 3;
};

GTFO.SpellID["267899"] = {
  --desc = "Hindering Cleave (Brother Ironhull)";
  sound = 3;
  tankSound = 0;
};

GTFO.SpellID["268280"] = {
  --desc = "Tidal Pod (Tidesage Enforcer)";
  sound = 3;
};

GTFO.SpellID["268391"] = {
  --desc = "Mental Assault (Abyssal Cultist)";
  applicationOnly = true;
  test = true; -- Is this actually avoidable?
  sound = 3;
};

GTFO.SpellID["269104"] = {
  --desc = "Explosive Void (Lord Stormsong)";
  sound = 3;
};

GTFO.SpellID["267956"] = {
  --desc = "Zap (Jellyfish)";
  sound = 3;
};

GTFO.SpellID["267385"] = {
  --desc = "Tentacle Slam (Vol'zith the Whisperer)";
  sound = 3;
};

-- ******************
-- * Waycrest Manor *
-- ******************

GTFO.SpellID["263905"] = {
  --desc = "Marking Cleave (Heartsbane Runeweaver)";
  sound = 3;
  tankSound = 0;
  test = true;
};

GTFO.SpellID["264531"] = {
  --desc = "Shrapnel Trap (Maddened Survivalist)";
  sound = 3;
  test = true;
};

GTFO.SpellID["264476"] = {
  --desc = "Tracking Explosive (Crazed Marksman)";
  sound = 3;
  test = true;
};

GTFO.SpellID["271174"] = {
  --desc = "Retch (Pallid Gorger)";
  sound = 3;
  test = true;
};

GTFO.SpellID["264923"] = {
  --desc = "Tenderize (Raal the Gluttonous)";
  sound = 3;
};

GTFO.SpellID["265757"] = {
  --desc = "Splinter Spike (Matron Bryndle)";
  sound = 3;
};

GTFO.SpellID["264150"] = {
  --desc = "Shatter (Thornguard)";
  sound = 3;
  test = true;
};

GTFO.SpellID["265372"] = {
  --desc = "Shadow Cleave (Enthralled Guard)";
  sound = 3;
  tankSound = 0;
};

-- ************
-- * Freehold *
-- ************

GTFO.SpellID["258673"] = {
  --desc = "Azerite Grenade (Irontide Crackshot)";
  sound = 3;
};

GTFO.SpellID["256106"] = {
  --desc = "Azerite Powder Shot (Skycap'n Kragg)";
  sound = 3;
  tankSound = 0;
  test = true;
};

GTFO.SpellID["258773"] = {
  --desc = "Charrrrrge (Skycap'n Kragg)";
  sound = 3;
};

GTFO.SpellID["258779"] = {
  --desc = "Sea Spout (Irontide Oarsman)";
  sound = 3;
  negatingDebuffSpellID = 274389;  -- Rat Trap
  -- negatingDebuffSpellID = 274400; -- Duelist Dash
  -- TODO: Add support for multiple spell IDs
};

GTFO.SpellID["272374"] = {
  --desc = "Whirlpool of Blades (Captain Jolly)";
  sound = 3;
};

GTFO.SpellID["267523"] = {
  --desc = "Cutting Surge (Captain Jolly)";
  sound = 3;
  applicationOnly = true;
};

GTFO.SpellID["256594"] = {
  --desc = "Barrel Smash (Captain Raoul)";
  sound = 3;
  test = true;
};

GTFO.SpellID["257310"] = {
  --desc = "Cannon Barrage (Harlan Sweete)";
  sound = 3;
  test = true;
};

GTFO.SpellID["257315"] = {
  --desc = "Black Powder Bomb (Harlan Sweete)";
  sound = 3;
  test = true;
};

-- *************
-- * Tol Dagor *
-- *************

GTFO.SpellID["257119"] = {
  --desc = "Sand Trap (The Sand Queen)";
  applicationOnly = true;
  sound = 1;
};

GTFO.SpellID["257785"] = {
  --desc = "Flashing Daggers (Jes Howlis)";
  sound = 3;
};

GTFO.SpellID["256710"] = {
  --desc = "Burning Arsenal (nil)";
  sound = 3;
};

GTFO.SpellID["256955"] = {
  --desc = "Cinderflame (Knight Captain Valyri)";
  sound = 3;
  test = true; -- Avoidable by tank?
};

GTFO.SpellID["256976"] = {
  --desc = "Ignition (Knight Captain Valyri)";
  sound = 3;
};

GTFO.SpellID["258917"] = {
  --desc = "Righteous Flames (Ashvane Priest)";
  applicationOnly = true;
  sound = 3;
};

GTFO.SpellID["259711"] = {
  --desc = "Lockdown (Ashvane Warden)";
  applicationOnly = true;
  sound = 3;
};

-- ****************
-- * The Underrot *
-- ****************

GTFO.SpellID["265019"] = {
  --desc = "Savage Cleave (Chosen Blood Matron)";
  applicationOnly = true;
  sound = 3;
};

GTFO.SpellID["265665"] = {
  --desc = "Foul Sludge (Living Rot)";
  sound = 3;
};

GTFO.SpellID["260793"] = {
  --desc = "Indigestion (Cragmaw the Infested)";
  sound = 3;
};

GTFO.SpellID["259720"] = {
  --desc = "Upheaval (Sporecaller Zancha)";
  sound = 3;
};

GTFO.SpellID["273226"] = {
  --desc = "Decaying Spores (Sporecaller Zancha)";
  applicationOnly = true;
  sound = 3;
  minimumStacks = 3;
  test = true;
};

GTFO.SpellID["265511"] = {
  --desc = "Spirit Drain (Spirit Drain Totem)";
  applicationOnly = true;
  sound = 3;
};

GTFO.SpellID["272609"] = {
  --desc = "Maddening Gaze (Faceless Corruptor)";
  sound = 3;
  applicationOnly = true;
};

-- ************************
-- * Temple of Sethraliss *
-- ************************

GTFO.SpellID["273225"] = {
  --desc = "Volley (Sandswept Marksman)";
  sound = 3;
};

GTFO.SpellID["264206"] = {
  --desc = "Burrow (Merektha)";
  sound = 3;
};

GTFO.SpellID["269970"] = {
  --desc = "Blinding Sand (Merektha)";
  applicationOnly = true;
  sound = 3;
};

GTFO.SpellID["267483"] = {
  --desc = "Loose Sparks (Loose Spark)";
  sound = 3;
};

GTFO.SpellID["264763"] = {
  --desc = "Spark (Static-charged Dervish)";
  sound = 3;
};

GTFO.SpellID["272821"] = {
  --desc = "Call Lightning (Imbued Stormcaller)";
  sound = 3;
};

-- ********************
-- * The MOTHERLODE!! *
-- ********************

GTFO.SpellID["256137"] = {
  --desc = "Timed Detonation (Azerite Footbomb)";
  sound = 3;
};

GTFO.SpellID["268365"] = {
  --desc = "Mining Charge";
  sound = 3;
};

GTFO.SpellID["271583"] = {
  --desc = "Black Powder Special";
  sound = 3;
};

GTFO.SpellID["263105"] = {
  --desc = "Blowtorch (Feckless Assistant)";
  sound = 3;
  tankSound = 0;
};

GTFO.SpellID["269092"] = {
  --desc = "Artillery Barrage (Ordnance Specialist)";
  applicationOnly = true;
  sound = 3;
};

GTFO.SpellID["262377"] = {
  --desc = "Seek and Destroy (Crawler Mine)";
  applicationOnly = true;
  sound = 3;
  tankSound = 0;
};

-- **************
-- * Atal'Dazar *
-- **************

GTFO.SpellID["255558"] = {
  --desc = "Tainted Blood (Gilded Priestess)";
  applicationOnly = true;
  sound = 3;
  test = true; -- Negating debuff during boss ability?
};

GTFO.SpellID["255620"] = {
  --desc = "Festering Eruption (Reanimated Honor Guard)";
  sound = 3;
};

GTFO.SpellID["255620"] = {
  --desc = "Festering Eruption (Reanimated Honor Guard)";
  applicationOnly = true;
  sound = 3;
};

GTFO.SpellID["257483"] = {
  --desc = "Pile of Bones (Rezan)";
  applicationOnly = true;
  sound = 3;
};

GTFO.SpellID["255371"] = {
  --desc = "Terrifying Visage (Rezan)";
  applicationOnly = true;
  sound = 3;
  test = true; -- Bugged?
};

