# LuaSTG-Flux Changelog history

* LuaSTG-Flux v0.1.2 (pre-release)
    * Multi World API
        * CHANGE: `SetWorldFlag()` now sets the set world as context for all objects created after setting it.
    * SQLite3
        * NEW: Addition of sqlite3 support as a module you can load.
        * NEW: `sqlite3.open()` Create or open a database at the specified path.
        * NEW: `sqlite3.exec()` Execute a sql request on the database.
        * NEW: `sqlite3.close()` Closes the current database.

* LuaSTG-Flux v0.1.1 (pre-release)
    * API
        * `lstg.Execute()` got un-defined by default. A new flag `DEFINE_EXECUTE_API_FUNCTION` got added to define it
        * NEW: `lstg.Window:setCursorType()`
        * NEW: `lstg.GetBranchName()` returns the name of the branch.
    * Windowing
        * Fixed borderless for good (hopefully)

* LuaSTG-Flux v0.1.0 (pre-release)
    * Windowing
        * Borderless windowing (semi-working)
        * `lstg.ChangeVideoMode()` changed to `lstg.ChangeVideoMode(width:number, height:number, window_mode:"windowed"|"borderless"|"fullscreen", vsync:boolean)`
        * API addition: `lstg.Window:setCentered()`
    * Startup
        * Launch file can now have the `.lua` file extension
    * Misc
        * Translation of the entire console