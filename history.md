# LuaSTG-Flux Changelog history

* LuaSTG-Flux v0.1.4 (pre-release)
    * API
        * NEW: `lstg.CreateResourcePool(name)` Creates a resource pool for loading resource. Can be used in `lstg.SetResourceStatus()` and `lstg.RemoveResource()`.
        * NEW: `lstg.RemoveResourcePool(name)` Deletes a resource pool and frees all the resources created in its scope.

* LuaSTG-Flux v0.1.3 (pre-release)
    * API
        * NEW: `lstg.GetBound()` Returns 4 numbers representing the current world bounds in order: Left, Right, Bottom, Top.
    * Multi World API
        * CHANGE: The API now uses real bitmasks instead of tables. Increasing the limit of active worlds to 64 instead of 4.
        * DEPRECATED: `lstg.IsInWorld(a, b)` got deprecated in favor of `lstg.IsSameWorld(a, b)`. Can take `object` or `object.world`
        * NEW: `lstg.SetActiveWorlds(mask)` takes a bit mask to restrict or allow usage of worlds. Default is 0xFFFFFFFF (all worlds).
        * Default world is now 0x0001 (1).
    * Package
        * New example package script based on LuaSTG-Sub.

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