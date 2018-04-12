/* | Sphinx and the Cursed Mummy PC/Windows 2018.03.18+ LiveSplit Auto-Splitter
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

    /* swy: we are done, tell the world about it */
    vars.DebugOutput("Alright. Running «startup».");
}

init
{
    print("init");

    var sw = new Stopwatch(); sw.Start();
 
    var ptr = IntPtr.Zero;
    vars.foundPointers = false;

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

/*
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
      (IntPtr)game.ReadValue<int>(ptr + (4 * 0))
    );

    vars.levelHash = new MemoryWatcher<uint>(
      (IntPtr)game.ReadValue<int>(ptr + (4 * 1))
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
    return true; //(vars.gameTimer.Current == vars.gameTimer.Old);
}

gameTime
{
    return TimeSpan.FromSeconds(vars.gameTimer.Current / 60.0);
}

split
{
    /* swy: stop the timer whenever Set is dealt with (the last split of the run, i hope!)
            this is an autoincrementing variable, for simplicity */
    return (vars.defeatSet.Current > vars.defeatSet.Old);
}