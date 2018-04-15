/* | Sphinx and the Cursed Mummy PC/Windows 2018.03.12+ LiveSplit Auto-Splitter
 * | Created by Swyter -- Released under the public domain or MIT license. */

state("SphinxD_GL")
{
    /* swy: nothing to do here; we need to grab the pointers ourselves instead of hardcoding it */
}

startup
{
    /* swy: prefixed debug function; based on the Alan Wake auto-splitter by tduva */
    Action<string> DebugOutput = (text) =>
    {
        if (vars.DebugEnabled) 
        {
            print("[!!!] [Sphinx PC Auto-Splitter] " + text);
        }
    }; 
    vars.DebugEnabled = true;
    vars.DebugOutput = DebugOutput;

    /* swy: add a hierarchical list of splittable maps, indexed by their HT_File_* hashcode constant, less is more */
    settings.Add("loc",         true, "Locations");
    settings.Add("urk",         true, "Uruk",                                              "loc");
    settings.Add("0x010002be", false, "Uruk Intro",                                        "urk");  /* HT_File_Map_ur_intr  (urk_intr.edb) */
    settings.Add("0x010002a7", false, "Uruk Canyon (Dark Area)",                           "urk");  /* HT_File_Map_hl_da2    (_hl_da2.edb) */
    settings.Add("0x010002a8", false, "Uruk Islands + Geb Queen",                          "urk");  /* HT_File_Map_hl_da3    (_hl_da3.edb) */
    settings.Add("0x01000233", false, "Uruk Temple Trials",                                "urk");  /* HT_File_urk_4pat     (_ur_4pat.edb) */

    settings.Add("lux",         true, "Luxor",                                             "loc");
    settings.Add("0x01000265", false, "Luxor Palace (Tut)",                                "lux");  /* HT_File_Map_lu_pala  (_lu_pala.edb) */
    settings.Add("0x0100024b", false, "Luxor Pyramid",                                     "lux");  /* HT_File_Map_lu_pyra  (_lu_pyra.edb) */

    settings.Add("aby",         true, "Abydos",                                            "loc");
    settings.Add("0x01000269", false, "Abydos Sewer",                                      "aby");  /* HT_File_Map_ab_sewr  (_ab_sewr.edb) */
    settings.Add("0x010001b9", false, "Abydos Canals",                                     "aby");  /* HT_File_Map_ab_cana  (_ab_cana.edb) */
    settings.Add("0x01000268", false, "Abydos Monster Shop",                               "aby");  /* HT_File_Map_ab_shop  (_ab_shop.edb) */
    settings.Add("0x01000264", false, "Abydos Museum",                                     "aby");  /* HT_File_Map_ab_musm  (_ab_musm.edb) */
    settings.Add("0x010002c3", false, "Abydos Council Chambers",                           "aby");  /* HT_File_Map_ab_cncl  (_ab_cncl.edb) */
    settings.Add("0x0100024d", false, "Abydos Boss Battle",                                "aby");  /* HT_File_Map_ak_du6    (_ak_du6.edb) */

    settings.Add("aby_mg",      true, "Abydos Minigames",                                  "aby");
    settings.Add("0x010002c8", false, "Tefnut's Target Tavern",                         "aby_mg");  /* HT_File_Map_mg_shoot (mg_shoot.edb) */
    settings.Add("0x010002c9", false, "Corridor of Champions",                          "aby_mg");  /* HT_File_Map_mg_walls (mg_walls.edb) */
    settings.Add("0x010002ca", false, "Sorkon's Sequence Shack",                        "aby_mg");  /* HT_File_Map_mg_simon (mg_simon.edb) */
    settings.Add("0x010002cb", false, "Paneb's Pair Matching Place",                    "aby_mg");  /* HT_File_Map_mg_pairs (mg_pairs.edb) */

    settings.Add("hel",         true, "Heliopolis",                                        "loc");
    settings.Add("0x01000262", false, "Heliopolis: Exterior",                              "hel");  /* HT_File_Map_hl_ext    (_hl_ext.edb) */
    settings.Add("0x010002a4", false, "Heliopolis: Cursed Palace",                         "hel");  /* HT_File_Map_hl_cp      (_hl_cp.edb) */
    settings.Add("0x01000294", false, "Heliopolis: Great Wall Entrance I + Anubis Tower",  "hel");  /* HT_File_Map_hl_ws1    (_hl_ws1.edb) */
    settings.Add("0x010002dc", false, "Heliopolis: Great Wall Entrance II (Access Room)",  "hel");  /* HT_File_Map_hl_rm1    (_hl_rm1.edb) */
    settings.Add("0x01000263", false, "Heliopolis: Great Wall Entrance II (Wall section)", "hel");  /* HT_File_Map_hl_ws2    (_hl_ws2.edb) */
    settings.Add("0x010002a0", false, "Heliopolis: Great Wall Entrance III",               "hel");  /* HT_File_Map_hl_ws3    (_hl_ws3.edb) */
    settings.Add("0x01000295", false, "Heliopolis: Lost Temple",                           "hel");  /* HT_File_Map_hl_dng    (_hl_dng.edb) */

    settings.Add("mum",         true, "Mummy",                                             "loc");
    settings.Add("0x010002cd", false, "Mummy: Uruk Castle Jail and Hub (All)",             "mum");  /* HT_File_Map_mu_cast  (_mu_cast.edb) */
    settings.Add("0x010001d6", false, "Mummy Visit #1: Impulse Planetarium",               "mum");  /* HT_File_Map_mu_imp2  (_mu_imp2.edb) */
    settings.Add("0x010002d5", false, "Mummy Visit #2: Treasure Chamber (Triple mummy)",   "mum");  /* HT_File_Map_mu_trei  (_mu_trei.edb) */
    settings.Add("0x01000175", false, "Mummy Visit #3: Uruk Tower Exterior",               "mum");  /* HT_File_mum_towr     (mum_towr.edb) */
    settings.Add("0x01000238", false, "Mummy Visit #3: Hang Train",                        "mum");  /* HT_File_Map_mu_htrn  (_mu_htrn.edb) */
    settings.Add("0x010002d8", false, "Mummy Visit #4: Sewer",                             "mum");  /* HT_File_Map_mu_sewr  (_mu_sewr.edb) */
    settings.Add("0x010002b0", false, "Mummy Visit #5: RotoHub",                           "mum");  /* HT_File_Map_mu_roto  (_mu_roto.edb) */
    settings.Add("0x01000172", false, "Mummy Visit #6: Eye Beam Intro Puzzle",             "mum");  /* HT_File_mum_eyei     (mum_eyei.edb) */
    settings.Add("0x010002d9", false, "Mummy Visit #6: Eye Beam",                          "mum");  /* HT_File_Map_mu_eye    (_mu_eye.edb) */

    settings.Add("set",         true, "Set",                                               "loc");
    settings.Add("0x010002a6", false, "Uruk Castle Run",                                   "set");  /* HT_File_Map_ur_cast  (_ur_cast.edb) */
    settings.Add("0x010001bc", false, "Final Battle",                                      "set");  /* HT_File_Map_cas_lowr   (_Set02.edb) */

    settings.Add("sphx_abil",   true, "Sphinx Abilities");
    settings.Add("blade",       true, "Blade of Osiris",                             "sphx_abil");

    /* swy: we are done, tell the world about it */
    vars.DebugOutput("Alright. Running «startup».");
}

init
{
    //vars.DebugOutput("Reached «init». SphinxD_GL.exe is loaded.");

    var sw = new Stopwatch(); sw.Start();
    var exported_ptr = IntPtr.Zero;

    vars.foundPointers = false;

    /* swy: silly null-terminated marker that signals the start of the gExportBlock */
    byte[] marker = Encoding.ASCII.GetBytes("SPeeDRuNSaReFuN" + Char.MinValue);
    vars.DebugOutput(Encoding.UTF8.GetString(marker, 0, marker.Length));
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

    /* swy: looks like IntPtr.Size is 8 bytes/64 bits even if we are hooking a 32 bit
            process; use an uint instead and cast it */

    vars.gameTimer = new MemoryWatcher<uint>(
        (IntPtr) game.ReadValue<uint>(exported_ptr + (4 * 0))
    );

    vars.levelHash = new MemoryWatcher<uint>(
        (IntPtr) game.ReadValue<uint>(exported_ptr + (4 * 1))
    );

    vars.defeatSet = new MemoryWatcher<uint>(
                                      exported_ptr + (4 * 2)
    );

    vars.updaState = new MemoryWatcher<uint>(
        (IntPtr) game.ReadValue<uint>(exported_ptr + (4 * 3))
    );

    /* Find Inventory Related Blocks in Memory */
    // TODO: would be nice if pointers were returned in the exported block so searching for these magic bytes were not required
    /* this searches for the fire darts location and some surrounding bytes as the dart ammo count is at the top of the inventory portion of memory
       as well as hopefully these values are never modified so they are a fairly consistent thing to search for
       however, there are two instances in memory, we are interested in the second one as it is the one that actually reflects the inventory state */
    string fdarts_marker = "FF FF FF FF FF FF FF FF 8D 04 00 00 51 51 51 51"; //FF FF FF FF FF FF FF FF 8D 04 00 00 51 51 51 51
    vars.DebugOutput("Attempting to Find inventory stuff");
    var inven_ptr = IntPtr.Zero;
    var target = new SigScanTarget(0, fdarts_marker);
    foreach (var page in game.MemoryPages())
    {
        var scanner = new SignatureScanner(game, page.BaseAddress, (int)page.RegionSize);
        // NOTE: this may fail on an edge case where the second result is on a different memory page
        var results = scanner.ScanAll(target);
        if (results.Count() >= 2) {
            inven_ptr = results.ElementAt(2);
            break;
        }  
    }
    // TODO: Get offsets for each block, just testing right now

    vars.bladeTest = new MemoryWatcher<uint>(inven_ptr + 0x910);

    // vars.DebugOutput(String.Format("Found the Blade at 0x{0}", (inven_ptr + 0x910).ToString("x8")));
    // vars.bladeTest.Update(game);
    // vars.DebugOutput(String.Format("Blade Value {0}", vars.bladeTest.Current));

    vars.foundPointers = true; 
    sw.Stop();
    vars.DebugOutput("The game is compatible. ");
    vars.DebugOutput(String.Format("Found the gExportedBlock at 0x{0:x8}", exported_ptr));
    vars.DebugOutput(String.Format("Found Inventory Block at 0x{0}", inven_ptr.ToString("x8")));
    vars.DebugOutput(String.Format("It took {0} ms", sw.ElapsedMilliseconds));
}

update
{
    if (!vars.foundPointers) return false;
    
    /* swy: don't forget that every MemoryWatcher has
            re-scan its value every now and then */
    vars.gameTimer.Update(game);
    vars.levelHash.Update(game);
    vars.defeatSet.Update(game);
    vars.updaState.Update(game);
    vars.bladeTest.Update(game);

    // vars.DebugOutput(String.Format("gameTimer: 0x{0:x}", vars.gameTimer.Current));
    // vars.DebugOutput(String.Format("levelHash: 0x{0:x}", vars.levelHash.Current));
    // vars.DebugOutput(String.Format("defeatSet: 0x{0:x}", vars.defeatSet.Current));
    // vars.DebugOutput(String.Format("updaState: 0x{0:x}", vars.updaState.Current));
}

reset
{
    /* swy: start the thing on a new game, the gameTimer doesn't change unless we are creating/loading something */
    return (vars.gameTimer.Current != vars.gameTimer.Old) && vars.gameTimer.Current == 0;
}

start
{
    /* swy: start the thing on a new game, the gameTimer doesn't change unless we are creating/loading something */
    return (vars.gameTimer.Current != vars.gameTimer.Old) && vars.gameTimer.Current == 0;
}

isLoading
{
    /* swy: if we are going through a level transition or waiting for a submap to load then just stop the clock */
    return vars.updaState.Current == 9 || vars.updaState.Current == 11;
}

split
{
    /* swy: split when a new map loads; ensure that it has been enabled in the advanced options first */
    if (vars.levelHash.Current != vars.levelHash.Old)
    {
        vars.DebugOutput(
            String.Format("Changing levels; deloading 0x{0:x8}, loading 0x{1:x8}", vars.levelHash.Old, vars.levelHash.Current)
        );
        
        /* swy: probably not the most optimal thing you will see today,
                but this is what hash indexing looks like */
        if (settings["0x" + vars.levelHash.Current.ToString("x8")])
        {
            vars.DebugOutput("Splitting!"); 
            return true;
        }
    }
    // vars.DebugOutput(String.Format("Current Blade Value {0}; Old Blade Value {1}; Setting Option {2}", vars.bladeTest.Current, vars.bladeTest.Old, settings["blade"]));
    if (vars.bladeTest.Current != vars.bladeTest.Old && vars.bladeTest.Current == 1 && settings["blade"]) {
        return true; // this should split when we get the blade of osiris
    }

    /* swy: stop the timer whenever Set is dealt with (the last split of the run, i hope!)
            this is an autoincrementing variable, for simplicity */
    return (vars.defeatSet.Current > vars.defeatSet.Old);
}