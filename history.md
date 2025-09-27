# LuaSTG-Flux Changelog history

* LuaSTG-Flux v0.1.1 (pre-release)
    * API
        * `lstg.Execute()` got un-defined by default. A new flag `DEFINE_EXECUTE_API_FUNCTION` got added to define it
        * NEW: `lstg.Window:setCursorType()`
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