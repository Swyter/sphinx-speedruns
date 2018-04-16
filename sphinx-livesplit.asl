/* | Sphinx and the Cursed Mummy PC/Windows 2018.03.12+ LiveSplit Auto-Splitter
 * | Created by Swyter -- Released under the public domain or MIT license. */

state("SphinxD_GL")
{
    /* swy: nothing to do here; we need to grab the pointers ourselves instead of hardcoding it */
}

startup
{
    // NOTE: Enable Log Output
    var DebugEnabled = false;
    /* swy: prefixed debug function; based on the Alan Wake auto-splitter by tduva */
    Action<string> DebugOutput = (text) =>
    {
        if (DebugEnabled)
        {
            print("[!!!] [Sphinx PC Auto-Splitter] " + text);
        }
    };
    vars.DebugOutput = DebugOutput;

    Action<List<Dictionary<String, dynamic>>, string, int, dynamic, bool, string, bool> AddOption = (list, id, offset, goal, on, name, debug) =>
    {
        var d = new Dictionary<String, dynamic>();
        d.Add("id", id);
        d.Add("offset", offset);
        d.Add("goal", goal);
        d.Add("on", on);
        d.Add("name", name);
        d.Add("debug", debug);
        list.Add(d);
    };

    Action<dynamic, string> AddToSettings = (options, parent) =>
    {
        foreach (Dictionary<String, dynamic> option in options)
        {
            settings.Add(option["id"], option["on"], option["name"], parent);
        }
    };

    /* swy: add a hierarchical list of splittable maps, indexed by their HT_File_* hashcode constant, less is more */
    settings.Add("loc",         true, "Locations");
    settings.Add("urk",         true, "Uruk",                                              "loc");
    settings.Add("0x010002be", false, "Uruk Intro",                                        "urk");  /* HT_File_Map_ur_intr  (urk_intr.edb) */
    settings.Add("0x010002a7",  true, "Uruk Canyon (Dark Area)",                           "urk");  /* HT_File_Map_hl_da2    (_hl_da2.edb) */
    settings.Add("0x010002a8",  true, "Uruk Islands + Geb Queen",                          "urk");  /* HT_File_Map_hl_da3    (_hl_da3.edb) */
    settings.Add("0x01000233", false, "Uruk Temple Trials",                                "urk");  /* HT_File_urk_4pat     (_ur_4pat.edb) */

    settings.Add("lux",         true, "Luxor",                                             "loc");
    settings.Add("0x01000265",  true, "Luxor Palace (Tut)",                                "lux");  /* HT_File_Map_lu_pala  (_lu_pala.edb) */
    settings.Add("0x0100024b",  true, "Luxor Pyramid",                                     "lux");  /* HT_File_Map_lu_pyra  (_lu_pyra.edb) */

    settings.Add("aby",         true, "Abydos",                                            "loc");
    settings.Add("0x01000269", false, "Abydos Sewer",                                      "aby");  /* HT_File_Map_ab_sewr  (_ab_sewr.edb) */
    settings.Add("0x010001b9", false, "Abydos Canals",                                     "aby");  /* HT_File_Map_ab_cana  (_ab_cana.edb) */
    settings.Add("0x01000268", false, "Abydos Monster Shop",                               "aby");  /* HT_File_Map_ab_shop  (_ab_shop.edb) */
    settings.Add("0x01000264", false, "Abydos Museum",                                     "aby");  /* HT_File_Map_ab_musm  (_ab_musm.edb) */
    settings.Add("0x010002c3",  true, "Abydos Council Chambers",                           "aby");  /* HT_File_Map_ab_cncl  (_ab_cncl.edb) */
    settings.Add("0x0100024d", false, "Abydos Boss Battle",                                "aby");  /* HT_File_Map_ak_du6    (_ak_du6.edb) */

    settings.Add("aby_mg",      true, "Abydos Minigames",                                  "aby");
    settings.Add("0x010002c8", false, "Tefnut's Target Tavern",                         "aby_mg");  /* HT_File_Map_mg_shoot (mg_shoot.edb) */
    settings.Add("0x010002c9", false, "Corridor of Champions",                          "aby_mg");  /* HT_File_Map_mg_walls (mg_walls.edb) */
    settings.Add("0x010002ca", false, "Sorkon's Sequence Shack",                        "aby_mg");  /* HT_File_Map_mg_simon (mg_simon.edb) */
    settings.Add("0x010002cb", false, "Paneb's Pair Matching Place",                    "aby_mg");  /* HT_File_Map_mg_pairs (mg_pairs.edb) */

    settings.Add("hel",         true, "Heliopolis",                                        "loc");
    settings.Add("0x01000262", false, "Heliopolis: Exterior",                              "hel");  /* HT_File_Map_hl_ext    (_hl_ext.edb) */
    settings.Add("0x010002a4", false, "Heliopolis: Cursed Palace",                         "hel");  /* HT_File_Map_hl_cp      (_hl_cp.edb) */
    settings.Add("0x01000294",  true, "Heliopolis: Great Wall Entrance I + Anubis Tower",  "hel");  /* HT_File_Map_hl_ws1    (_hl_ws1.edb) */
    settings.Add("0x010002dc",  true, "Heliopolis: Great Wall Entrance II (Access Room)",  "hel");  /* HT_File_Map_hl_rm1    (_hl_rm1.edb) */
    settings.Add("0x01000263",  true, "Heliopolis: Great Wall Entrance II (Wall section)", "hel");  /* HT_File_Map_hl_ws2    (_hl_ws2.edb) */
    settings.Add("0x010002a0",  true, "Heliopolis: Great Wall Entrance III",               "hel");  /* HT_File_Map_hl_ws3    (_hl_ws3.edb) */
    settings.Add("0x01000295",  true, "Heliopolis: Lost Temple",                           "hel");  /* HT_File_Map_hl_dng    (_hl_dng.edb) */

    settings.Add("mum",         true, "Mummy",                                             "loc");
    settings.Add("0x010002cd",  true, "Mummy: Uruk Castle Jail and Hub (All)",             "mum");  /* HT_File_Map_mu_cast  (_mu_cast.edb) */
    settings.Add("0x010001d6", false, "Mummy Visit #1: Impulse Planetarium",               "mum");  /* HT_File_Map_mu_imp2  (_mu_imp2.edb) */
    settings.Add("0x010002d5", false, "Mummy Visit #2: Treasure Chamber (Triple mummy)",   "mum");  /* HT_File_Map_mu_trei  (_mu_trei.edb) */
    settings.Add("0x01000175", false, "Mummy Visit #3: Uruk Tower Exterior",               "mum");  /* HT_File_mum_towr     (mum_towr.edb) */
    settings.Add("0x01000238", false, "Mummy Visit #3: Hang Train",                        "mum");  /* HT_File_Map_mu_htrn  (_mu_htrn.edb) */
    settings.Add("0x010002d8", false, "Mummy Visit #4: Sewer",                             "mum");  /* HT_File_Map_mu_sewr  (_mu_sewr.edb) */
    settings.Add("0x010002b0", false, "Mummy Visit #5: RotoHub",                           "mum");  /* HT_File_Map_mu_roto  (_mu_roto.edb) */
    settings.Add("0x01000172", false, "Mummy Visit #6: Eye Beam Intro Puzzle",             "mum");  /* HT_File_mum_eyei     (mum_eyei.edb) */
    settings.Add("0x010002d9", false, "Mummy Visit #6: Eye Beam",                          "mum");  /* HT_File_Map_mu_eye    (_mu_eye.edb) */

    settings.Add("set",         true, "Set",                                               "loc");
    settings.Add("0x010002a6",  true, "Uruk Castle Run",                                   "set");  /* HT_File_Map_ur_cast  (_ur_cast.edb) */
    settings.Add("0x010001bc",  true, "Final Battle",                                      "set");  /* HT_File_Map_cas_lowr   (_Set02.edb) */

    /* Add inventory and item related settings */
    /* Sphinx Abilities */
    vars.sphinxAbilityItems = new List<Dictionary<String, dynamic>>();
    AddOption(vars.sphinxAbilityItems,  "cap_beet",          0,     null,   true,   "Capture Beetles",          false);
    AddOption(vars.sphinxAbilityItems,  "blade",             1,     null,   true,   "Blade of Osiris",          false);
    AddOption(vars.sphinxAbilityItems,  "shield",            2,     null,   true,   "Shield of Osiris",         false);
    AddOption(vars.sphinxAbilityItems,  "pipe",              3,     null,   true,   "Blowpipe",                 false);
    AddOption(vars.sphinxAbilityItems,  "ibis",              4,     null,   true,   "Wings of Ibis",            false);
    AddOption(vars.sphinxAbilityItems,  "scales",            5,     null,   true,   "Crocodile Scales",         false);
    AddOption(vars.sphinxAbilityItems,  "wat_proj",          6,     null,   true,   "Underwater Projectile",    false);
    AddOption(vars.sphinxAbilityItems,  "amun",              7,     null,   true,   "Hands of Amun",            false);
    AddOption(vars.sphinxAbilityItems,  "scarab_bag",        8,     null,   true,   "Scarab Bag",               false);
    AddOption(vars.sphinxAbilityItems,  "lg_scarab_bag",     9,     null,   true,   "Large Scarab Bag",         false);
    AddOption(vars.sphinxAbilityItems,  "beet_pouch",        10,    null,   true,   "Beetle Pouch",             false);
    AddOption(vars.sphinxAbilityItems,  "beet_satch",        11,    null,   true,   "Beetle Satchel",           false);
    AddOption(vars.sphinxAbilityItems,  "dart_belt",         12,    null,   true,   "Dart Belt",                false);

    vars.sphinxDarts = new List<Dictionary<String, dynamic>>();
    AddOption(vars.sphinxDarts,         "bounce_dart",       1,     50,     true,   "Bouncing Darts",           false); // you get 50 on pickup
    AddOption(vars.sphinxDarts,         "ice_dart",          2,     30,     true,   "Ice Darts",                false); // You get 30 on pickup
    AddOption(vars.sphinxDarts,         "acid_dart",         3,     30,    false,   "Acid Darts",               false); // You get 30 on pickup

    settings.Add("sphx_abil",       true, "Sphinx Ability Items");
    AddToSettings(vars.sphinxAbilityItems, "sphx_abil");
    AddToSettings(vars.sphinxDarts, "sphx_abil");

    // /* Sphinx Quest Items (Not Variable Amounts / Not Consumables) */
    vars.sphinxQuestItems = new List<Dictionary<String, dynamic>>();
    AddOption(vars.sphinxQuestItems,    "sdes_key",         11,     null,   false,  "South Desert Key",          false);
    AddOption(vars.sphinxQuestItems,    "obelisk_key",      12,     null,   false,  "Obelisk Gate Key",          false);
    AddOption(vars.sphinxQuestItems,    "cave_key",         13,     null,   false,  "Cave Door Key",             false);
    AddOption(vars.sphinxQuestItems,    "u_crown",          15,     null,   true,   "Urukite Crown",             false);
    AddOption(vars.sphinxQuestItems,    "a_crown",          16,     null,   true,   "Abydosian Crown",           false);
    AddOption(vars.sphinxQuestItems,    "h_crown",          17,     null,   false,  "Helian Crown",              false);
    AddOption(vars.sphinxQuestItems,    "s_crown",          18,     null,   false,  "Set Crown",                 false);
    AddOption(vars.sphinxQuestItems,    "cstone_grey",      19,     null,   false,  "Curse Stone (Grey)",        false);
    AddOption(vars.sphinxQuestItems,    "cstone_green",     20,     null,   false,  "Curse Stone (Green)",       false);
    AddOption(vars.sphinxQuestItems,    "cstone_red",       21,     null,   false,  "Curse Stone (Red)",         false);
    AddOption(vars.sphinxQuestItems,    "cstone_yellow",    22,     null,   false,  "Curse Stone (Yellow)",      false);
    AddOption(vars.sphinxQuestItems,    "cstone_blue",      23,     null,   false,  "Curse Stone (Blue)",        false);
    AddOption(vars.sphinxQuestItems,    "cstone_purple",    24,     null,   false,  "Curse Stone (Purple)",      false);
    AddOption(vars.sphinxQuestItems,    "cstone_teal",      25,     null,   false,  "Curse Stone (Teal)",        false);
    AddOption(vars.sphinxQuestItems,    "jewel_mum1",       26,     null,   false,  "Stolen Jewel (Mummy 1)",    false);
    AddOption(vars.sphinxQuestItems,    "jewel_mum2",       27,     null,   false,  "Stolen Jewel (Mummy 2)",    false);
    AddOption(vars.sphinxQuestItems,    "jewel_mum3",       28,     null,   false,  "Stolen Jewel (Mummy 3)",    false);
    AddOption(vars.sphinxQuestItems,    "jewel_mum4",       29,     null,   false,  "Stolen Jewel (Mummy 4)",    false);
    AddOption(vars.sphinxQuestItems,    "jewel_mum5",       30,     null,   false,  "Stolen Jewel (Mummy 5)",    false);
    AddOption(vars.sphinxQuestItems,    "jewel_mum6",       31,     null,   false,  "Stolen Jewel (Mummy 6)",    false);
    AddOption(vars.sphinxQuestItems,    "skel_skull",       32,     null,   false,  "Skeletal Skull",            false);
    AddOption(vars.sphinxQuestItems,    "skel_pelvis",      33,     null,   false,  "Skeletal Pelvis",           false);
    AddOption(vars.sphinxQuestItems,    "skel_arm",         34,     null,   false,  "Skeletal Arm",              false);
    AddOption(vars.sphinxQuestItems,    "skel_leg",         35,     null,   false,  "Skeletal Leg",              false);
    AddOption(vars.sphinxQuestItems,    "ammy_myst",        37,     null,   true,   "Mysterious Amulet",         false);
    AddOption(vars.sphinxQuestItems,    "ammy_abydos",      38,     null,   true,   "Abydosian Amulet",          false);
    AddOption(vars.sphinxQuestItems,    "ammy_helio",       39,     null,   true,   "Heliopolis Amulet",         false);
    AddOption(vars.sphinxQuestItems,    "ammy_anubis",      40,     null,   false,  "Anubis Amulet",             false);
    AddOption(vars.sphinxQuestItems,    "basket",           41,     null,   false,  "Bas-Ket",                   false);
    AddOption(vars.sphinxQuestItems,    "book_dead",        43,     null,   false,  "Book of the Dead",          false);
    AddOption(vars.sphinxQuestItems,    "phys_note",        44,     null,   false,  "Physicians Note",           false);
    AddOption(vars.sphinxQuestItems,    "rosetta_stone",    45,     null,   false,  "Rosetta Stone",             false);
    AddOption(vars.sphinxQuestItems,    "pass_card",        46,     null,   false,  "Abydos Pass Card",          false);
    AddOption(vars.sphinxQuestItems,    "breeding_jar",     47,     null,   false,  "Beetle Breeding Jar",       false);
    AddOption(vars.sphinxQuestItems,    "loyality_card",    48,     null,   false,  "Loyality Card",             false);
    AddOption(vars.sphinxQuestItems,    "royal_invite",     49,     null,   true,   "Royal Invitation",          false);
    AddOption(vars.sphinxQuestItems,    "parasol",          50,     null,   false,  "Parasol",                   false);
    AddOption(vars.sphinxQuestItems,    "monster_1",        51,     null,   false,  "Monster List I",            false);
    AddOption(vars.sphinxQuestItems,    "monster_2",        52,     null,   false,  "Monster List II",           false);
    AddOption(vars.sphinxQuestItems,    "monster_3",        53,     null,   false,  "Monster List III",          false);
    AddOption(vars.sphinxQuestItems,    "zip_line",         54,     null,   false,  "Zip-line Handle",           false);
    AddOption(vars.sphinxQuestItems,    "old_key",          55,     null,   false,  "Old Key",                   false);
    AddOption(vars.sphinxQuestItems,    "stairs_key",       56,     null,   true,   "Stairs Key",                false);
    AddOption(vars.sphinxQuestItems,    "medicine_bag",     57,     null,   false,  "Medicine Bag",              false);
    AddOption(vars.sphinxQuestItems,    "atun_statue",      58,     null,   false,  "Atun Statue",               false);
    AddOption(vars.sphinxQuestItems,    "hathor_statue",    59,     null,   false,  "Hathor Statue",             false);
    AddOption(vars.sphinxQuestItems,    "eagle_stone",      60,     null,   false,  "Eagle Stone",               false);
    AddOption(vars.sphinxQuestItems,    "dark_stone",       61,     null,   false,  "Dark Stone",                false);
    AddOption(vars.sphinxQuestItems,    "marksman_medal",   62,     null,   false,  "Marksman Medal",            false);
    AddOption(vars.sphinxQuestItems,    "medal_memory",     63,     null,   false,  "Medal of Memory",           false);
    AddOption(vars.sphinxQuestItems,    "medal_champ",      64,     null,   false,  "Medal of Champions",        false);
    AddOption(vars.sphinxQuestItems,    "medal_seq",        65,     null,   false,  "Medal of Sequences",        false);
    AddOption(vars.sphinxQuestItems,    "master_hunt",      66,     null,   false,  "Master Hunter",             false);
    AddOption(vars.sphinxQuestItems,    "hunt_gold",        67,     null,   false,  "Hunter Gold Class",         false);
    AddOption(vars.sphinxQuestItems,    "hunt_silver",      68,     null,   false,  "Hunter Silver Class",       false);
    AddOption(vars.sphinxQuestItems,    "hunt_bronze",      69,     null,   false,  "Hunter Bronze Class",       false);

    settings.Add("sphx_quest", true,  "Sphinx Quest Items");
    AddToSettings(vars.sphinxQuestItems, "sphx_quest");

    /* Sphinx Quest Items (Variable Amounts) */
    vars.sphinxQuestItemsVar = new List<Dictionary<String, dynamic>>();
    AddOption(vars.sphinxQuestItemsVar, "gold_ankhs",       3,      20,     false,  "Gold Ankh Pieces (Split at 20)",    false);
    AddOption(vars.sphinxQuestItemsVar, "pearls",           4,      3,      false,  "Abydosian Pearls (Split at 3)",     false);
    AddOption(vars.sphinxQuestItemsVar, "herbs",            5,      5,      false,  "Healing Herbs (Split at 5)",        false);
    AddOption(vars.sphinxQuestItemsVar, "ros_stone",        6,      6,      false,  "Rosetta Stone Pieces (Split at 6)", false);
    AddOption(vars.sphinxQuestItemsVar, "coconut",          14,     3,      false,  "Coconuts (Split at 3)",             false);
    AddOption(vars.sphinxQuestItemsVar, "canopic_vase",     36,     6,      false,  "Canopic Vase (Split at 6)",         false);
    AddOption(vars.sphinxQuestItemsVar, "blue_diamond",     42,     4,      false,  "Blue Diamonds (Split at 4)",        false);

    settings.Add("sphx_quest_var", true, "Sphinx Quest Items (Consumables or Varying Amount)");
    AddToSettings(vars.sphinxQuestItemsVar, "sphx_quest_var");

    /* Mummy Items (Not Variable Amounts) */
    vars.mummyItems = new List<Dictionary<String, dynamic>>();
    AddOption(vars.mummyItems,          "mum_dark_stone",   0,      null,   false,  "Dark Stone",                   false);
    AddOption(vars.mummyItems,          "key_court",        2,      null,   false,  "Courtyard Key",                false);
    AddOption(vars.mummyItems,          "nef_letter",       3,      null,   true,   "Nefertiti's Letter",           false);
    AddOption(vars.mummyItems,          "key_sarco",        4,      null,   true,   "Sarcophagus Key",              false);
    AddOption(vars.mummyItems,          "key_ward",         5,      null,   false,  "Wardrobe Key",                 false);
    AddOption(vars.mummyItems,          "ammy_old",         7,      8,      true,   "Old Amulet (Split at 8)",      false);
    AddOption(vars.mummyItems,          "key_treasure",     9,      null,   true,   "Treasure Room Key",            false);
    AddOption(vars.mummyItems,          "key_solar",        12,     null,   false,  "Solar Key",                    false);
    AddOption(vars.mummyItems,          "key_earth",        13,     null,   false,  "Earth Key",                    false);
    AddOption(vars.mummyItems,          "key_lunar",        14,     null,   false,  "Lunar Key",                    false);
    AddOption(vars.mummyItems,          "key_cage",         16,     null,   false,  "Cage Key",                     false);
    AddOption(vars.mummyItems,          "mum_royal_invite", 26,     null,   false,  "Royal Invitation",             false);
    AddOption(vars.mummyItems,          "mum_ibis",         30,     null,   false,  "Wings of Ibis",                false);
    AddOption(vars.mummyItems,          "mum_medicine_bag", 31,     null,   false,  "Medicine Bag",                 false);
    AddOption(vars.mummyItems,          "mum_atun_statue",  32,     null,   false,  "Atun Statue",                  false);
    AddOption(vars.mummyItems,          "mum_jewel_mum1",   33,     null,   false,  "Stolen Jewel (Mummy 1)",       false);
    AddOption(vars.mummyItems,          "mum_jewel_mum2",   34,     null,   false,  "Stolen Jewel (Mummy 2)",       false);
    AddOption(vars.mummyItems,          "mum_jewel_mum3",   35,     null,   false,  "Stolen Jewel (Mummy 3)",       false);
    AddOption(vars.mummyItems,          "mum_jewel_mum4",   36,     null,   false,  "Stolen Jewel (Mummy 4)",       false);
    AddOption(vars.mummyItems,          "mum_jewel_mum5",   37,     null,   false,  "Stolen Jewel (Mummy 5)",       false);
    AddOption(vars.mummyItems,          "mum_jewel_mum6",   38,     null,   false,  "Stolen Jewel (Mummy 6)",       false);

    settings.Add("mum_items",           true,   "Mummy Items");
    AddToSettings(vars.mummyItems, "mum_items");

    /* swy: we are done, tell the world about it */
    vars.DebugOutput("Alright. Running «startup».");
}

init
{
    vars.DebugOutput("Reached «init». SphinxD_GL.exe is loaded.");
    var sw = new Stopwatch(); sw.Start();
    var exported_ptr = IntPtr.Zero;

    vars.foundPointers = false;

    /* swy: silly null-terminated marker that signals the start of the gExportBlock */
    byte[] marker = Encoding.ASCII.GetBytes("SPeeDRuNSaReFuN" + Char.MinValue);
    exported_ptr = new SignatureScanner(game, modules.First().BaseAddress, modules.First().ModuleMemorySize).Scan(
        new SigScanTarget(marker.Length, marker)
    );

    if (exported_ptr == IntPtr.Zero)
    {
        vars.DebugOutput("Could not find the gExportedBlock marker address, is this an old Sphinx version? Bailing out."); sw.Reset();
        return false;
    }

    /* swy: this is the actual struct in a proper programming language:
        static struct exportedBlock
        {
            char  marker[16];
            void *gameTimer;
            void *levelHash;
            int   defeatSet;
            void *updaState;
            char  end[4];
        };
    */

    /* Find Inventory Related Blocks in Memory */
    // TODO: would be nice if pointers were returned in the exported block so searching for these magic bytes was not required
    /* this searches for the fire darts location and some surrounding bytes as the dart ammo counts are at the top of the inventory portion of memory
       as well as hopefully these values are never modified so they are a fairly consistent thing to search for
       however, there are multiple instances in memory, we are interested in the last one as it is the one that actually reflects the inventory state */
    string fdarts_marker = "FF FF FF FF FF FF FF FF 8D 04 00 00 51 51 51 51";
    vars.DebugOutput("Attempting to Find inventory stuff");
    var inven_ptr = IntPtr.Zero;
    var target = new SigScanTarget(0, fdarts_marker);
    foreach (var page in game.MemoryPages())
    {
        var scanner = new SignatureScanner(game, page.BaseAddress, (int)page.RegionSize);
        // NOTE: this may fail on an edge case where the real, final result is on a different memory page
        var results = scanner.ScanAll(target);
        if (results.Count() >= 2)
        {
            inven_ptr = results.Last();
            break;
        }
    }
    /* swy: looks like IntPtr.Size is 8 bytes/64 bits even if we are hooking a 32 bit
            process; use an uint instead and cast it */
    var watchers = new MemoryWatcherList {
        new MemoryWatcher<uint>((IntPtr) game.ReadValue<uint>(exported_ptr + (4 * 0))) { Name = "gameTimer" },
        new MemoryWatcher<uint>((IntPtr) game.ReadValue<uint>(exported_ptr + (4 * 1))) { Name = "levelHash" },
        new MemoryWatcher<uint>(exported_ptr + (4 * 2)) { Name = "defeatSet" },
        new MemoryWatcher<uint>((IntPtr) game.ReadValue<uint>(exported_ptr + (4 * 3))) { Name = "updaState" },
    };

    /* Add Inventory Watchers */
    Action<MemoryWatcherList, IntPtr, List<Dictionary<String, dynamic>>> AddMemoryWatchers = (memList, bPtr, options) =>
    {
        foreach (Dictionary<String, dynamic> option in options)
        {
            var finalOffset = bPtr + (option["offset"]) * 16;
            memList.Add(new MemoryWatcher<uint>(finalOffset) { Name = option["id"] });
            if (option["debug"] == true)
            {
                memList[option["id"]].Update(game);
                vars.DebugOutput(String.Format("Debug ({0}) -> ptr [{1}]; val [{2}]", option["id"], finalOffset.ToString("x8"), memList[option["id"]].Current));
            }
        }
    };

    var darts_ptr = inven_ptr - (4 * 0x10);
    AddMemoryWatchers(watchers, darts_ptr, vars.sphinxDarts);
    var sphx_item_ptr = inven_ptr + (14 * 0x10);
    vars.DebugOutput(String.Format("Item Ptr - {0}", sphx_item_ptr.ToString("x8")));
    AddMemoryWatchers(watchers, sphx_item_ptr, vars.sphinxQuestItems);
    AddMemoryWatchers(watchers, sphx_item_ptr, vars.sphinxQuestItemsVar);
    var sphx_abil_ptr = inven_ptr + (144 * 0x10);
    AddMemoryWatchers(watchers, sphx_abil_ptr, vars.sphinxAbilityItems);
    var mum_item_ptr = inven_ptr + (250 * 0x10);
    AddMemoryWatchers(watchers, mum_item_ptr, vars.mummyItems);

    vars.foundPointers = true;
    vars.watchers = watchers;
    sw.Stop();
    vars.DebugOutput("Script Initialized, Game Compatible.");
    vars.DebugOutput(String.Format("Found the gExportedBlock at 0x{0:x8}", exported_ptr));
    vars.DebugOutput(String.Format("Found Inventory Block at 0x{0}", inven_ptr.ToString("x8")));
    vars.DebugOutput(String.Format("It took {0} ms", sw.ElapsedMilliseconds));
}

update
{
    if (!vars.foundPointers)
    {
        return false;
    }

    /* swy: don't forget that every MemoryWatcher has
            re-scan its value every now and then */
    vars.watchers.UpdateAll(game);
}

reset
{
    /* swy: start the thing on a new game, the gameTimer doesn't change unless we are creating/loading something */
    return (vars.watchers["gameTimer"].Current != vars.watchers["gameTimer"].Old) && vars.watchers["gameTimer"].Current == 0;
}

start
{
    /* swy: start the thing on a new game, the gameTimer doesn't change unless we are creating/loading something */
    return (vars.watchers["gameTimer"].Current != vars.watchers["gameTimer"].Old) && vars.watchers["gameTimer"].Current == 0;
}

isLoading
{
    /* swy: if we are going through a level transition or waiting for a submap to load then just stop the clock */
    return vars.watchers["updaState"].Current == 9 || vars.watchers["updaState"].Current == 11;
}

split
{
    /* swy: split when a new map loads; ensure that it has been enabled in the advanced options first */
    if (vars.watchers["levelHash"].Current != vars.watchers["levelHash"].Old)
    {
        vars.DebugOutput(String.Format("Changing levels; deloading 0x{0:x8}, loading 0x{1:x8}", vars.watchers["levelHash"].Old, vars.watchers["levelHash"].Current));

        /* swy: probably not the most optimal thing you will see today,
                but this is what hash indexing looks like */
        if (settings["0x" + vars.watchers["levelHash"].Current.ToString("x8")])
        {
            return true;
        }
    }
    // Iterate and check inventory related options using those lists we made before
    Func<List<Dictionary<String, dynamic>>, bool> InspectValues = (list) =>
    {
        foreach (Dictionary<String, dynamic> option in list)
        {
            var watcher = vars.watchers[option["id"]];
            if (settings[option["id"]])
            {
                // If we don't care about the amount just that we've acquired it once, just check for change from 2^32-1 (max 32 int)
                if (option["goal"] == null && watcher.Current != watcher.Old && watcher.Old == Math.Pow(2, 32)-1)
                {
                    return true;
                }
                // Else, make sure we've hit that goal amount
                else if (option["goal"] != null && watcher.Current != watcher.Old && watcher.Current == option["goal"])
                {
                    return true;
                }
            }
        }
        return false;
    };

    if(InspectValues(vars.sphinxAbilityItems)) return true;
    if(InspectValues(vars.sphinxDarts)) return true;
    if(InspectValues(vars.sphinxQuestItems)) return true;
    if(InspectValues(vars.sphinxQuestItemsVar)) return true;
    if(InspectValues(vars.mummyItems)) return true;

    /* swy: stop the timer whenever Set is dealt with (the last split of the run, i hope!)
            this is an autoincrementing variable, for simplicity */
    return (vars.watchers["defeatSet"].Current > vars.watchers["defeatSet"].Old);
}