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
        print("[!!!] [Sphinx PC Auto-Splitter] " + text);
    }; 
    vars.DebugOutput = DebugOutput;


	settings.Add("urk",          true, "Uruk");
	settings.Add("urk_intro",    true, "Uruk Intro",   "urk");
	settings.Add("urk_islands",  true, "Uruk Islands", "urk");

	settings.Add("lux",          true, "Luxor");
	settings.Add("lux_palace",   true, "Luxor Palace (Tut)",  "lux");
	settings.Add("lux_pyramid",  true, "Luxor Pyramid", "lux");

	settings.Add("aby",          true, "Abydos");
	settings.Add("aby_sewer",    true, "Abydos Sewer",            "aby");
	settings.Add("aby_canals",   true, "Abydos Canals",           "aby");
    settings.Add("aby_museum",   true, "Abydos Museum",           "aby");
	settings.Add("aby_council",  true, "Abydos Council Chambers", "aby");
	settings.Add("aby_ishka",  true, "Abydos Boss Battle", "aby");
	settings.Add("aby_mg",  true, "Abydos Minigames", "aby");
	settings.Add("aby_mg_pairs",  true, "Pairs", "aby_mg");
	settings.Add("aby_mg_shoot",  true, "Shoot", "aby_mg");
	settings.Add("aby_mg_simon",  true, "Simon", "aby_mg");
	settings.Add("aby_mg_walls",  true, "Corridor of Champions", "aby_mg");

	settings.Add("hel", true, "Heliopolis");
	settings.Add("hel_ext", true, "Heliopolis: Exterior",      "hel");
	settings.Add("hel_cp",  true, "Heliopolis: Cursed Palace", "hel");
	settings.Add("hel_anub",  true, "Heliopolis: Anubis", "hel");
	settings.Add("hel_ws2",  true, "Heliopolis: Wall Entrance II", "hel");
	settings.Add("hel_ws3",  true, "Heliopolis: Wall Entrance III", "hel");

	settings.Add("mum", true, "Mummy");
	settings.Add("mum_castle", true, "Mummy: Uruk Castle Jail and Hub (All)", "mum");
	settings.Add("mum_imp", true, "Mummy Visit #1: Impulse Planetarium", "mum");
	settings.Add("mum_r", true, "Mummy Visit #2: ", "mum");
	settings.Add("mum_rod", true, "Mummy Visit #3: Hang Train", "mum");
	settings.Add("mum_twer", true, "Mummy Visit #4: Uruk Tower Exterior", "mum");
	settings.Add("mum_sewr", true, "Mummy Visit #4: Sewer", "mum");
	settings.Add("mum_roto", true, "Mummy Visit #5: RotoHub", "mum");
	settings.Add("mum_eyei", true, "Mummy Visit #6: Eye Beam Intro Puzzle", "mum");
	settings.Add("mum_eye", true, "Mummy Visit #6: Eye Beam", "mum");

	settings.Add("set", true, "Set");
	settings.Add("set_castlerun", true, "Uruk Castle Run", "set");
	settings.Add("set_final", true, "Final Battle", "set");

    /* swy: we are done, tell the world about it */
    vars.DebugOutput("Alright. Running «startup».");
}

init
{
    print("init");

    var sw = new Stopwatch(); sw.Start();
    var ptr = IntPtr.Zero;

    vars.foundPointers = false;
    vars.gameTimerDelta = 0;

    /* swy: silly null-terminated marker that signals the start of the gExportBlock */
    byte[] marker = Encoding.ASCII.GetBytes("SPeeDRuNSaReFuN" + Char.MinValue);

    ptr = new SignatureScanner(game, modules.First().BaseAddress, modules.First().ModuleMemorySize).Scan(
        new SigScanTarget(marker.Length, marker)
    );

    if (ptr == IntPtr.Zero)
    {
        vars.DebugOutput("Could not find the gExportedBlock marker address, is this an old Sphinx version? Bailing out.");
        return false;
    }

    /* swy: this is the actual struct in a proper programming language:
        static struct exportedBlock
        {
            char  marker[16];
            void *gameTimer;
            void *levelHash;
            int   defeatSet;
            char  end[4];
        };
    */

    vars.gameTimer = new MemoryWatcher<uint>(
        (IntPtr) game.ReadValue<int>(ptr + (4 * 0))
    );

    vars.levelHash = new MemoryWatcher<uint>(
        (IntPtr) game.ReadValue<int>(ptr + (4 * 1))
    );

    vars.defeatSet = new MemoryWatcher<uint>(
        ptr + (4 * 2)
    );

    vars.foundPointers = true; sw.Stop();

    vars.DebugOutput(
        String.Format(
            "Found the gExportedBlock at 0x{0:x}; it took {1} ms, {2}, {3:x}/{4:x}/{5:x} {6:x}/{7:x}", ptr, sw.ElapsedMilliseconds, marker.Length, game.ReadValue<int>(ptr + (4 * 0)), game.ReadValue<int>(ptr + (4 * 1)), game.ReadValue<int>(ptr + (4 * 2)), game.ReadValue<int>(game.ReadValue<IntPtr>(ptr + (4 * 0))), game.ReadValue<int>(game.ReadValue<IntPtr>(ptr + (4 * 1)))
        )
    );
}

update
{
    if (!vars.foundPointers) return false;
    
    vars.gameTimer.Update(game);
    vars.levelHash.Update(game);
    vars.defeatSet.Update(game);

    if (vars.gameTimer.Current == 0) vars.gameTimerDelta = 0;
    
    //vars.DebugOutput(String.Format("gameTimer: 0x{0:x}", vars.gameTimer.Current));
    //vars.DebugOutput(String.Format("levelHash: 0x{0:x}", vars.levelHash.Current));
    //vars.DebugOutput(String.Format("defeatSet: 0x{0:x}", vars.defeatSet.Current));
}

reset
{
    /* swy: start the thing on a new game, the gameTimer doesn't change unless we are creating/loading something */
    return ((vars.gameTimer.Current != vars.gameTimer.Old) && vars.gameTimer.Current == 0);
}

start
{
    /* swy: start the thing on a new game, the gameTimer doesn't change unless we are creating/loading something */
    return ((vars.gameTimer.Current != vars.gameTimer.Old) && vars.gameTimer.Current == 0);
}


isLoading
{
    return true;
}

gameTime
{
    if (vars.gameTimer.Old > vars.gameTimer.Current)
        vars.gameTimerDelta += vars.gameTimer.Old - vars.gameTimer.Current;

    return TimeSpan.FromSeconds((vars.gameTimer.Current + vars.gameTimerDelta) / 60.0);
}

split
{
    /* swy: stop the timer whenever Set is dealt with (the last split of the run, i hope!)
            this is an autoincrementing variable, for simplicity */
    return (vars.defeatSet.Current > vars.defeatSet.Old);
}