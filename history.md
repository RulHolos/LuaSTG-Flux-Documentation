# LuaSTG-Flux Changelog history

* LuaSTG-Flux v0.3.0
    * API
        * NEW: `lstg.Collect_Group(group, checking_world, tab)` Used to collect all objects in a group fast. Returns the number of objects, fills the `tab` pre-created table in-place.
        * NEW: `lstg.SnapshotToTexture(tex_name)` Allows capturing a screenshot of the entire viewport (screen) and save it as a texture. Analog to `lstg.Snapshot()` which saves it to a file.
        * NEW: `lstg.TransferResource(src_pool, dest_pool, res_type, res_name)` Transfers a resource from a pool to another one.
    * Steam API Updates (RichPresence)
        * For all those API calls, see the equivalent calls to [ISteamFriends API](https://partner.steamgames.com/doc/api/ISteamFriends)
        * NEW: `steam.SteamRichPresence.SetRichPresence(key, value)` Set rich presence values
        * NEW: `steam.SteamRichPresence.ClearRichPresence()` Clears the current rich presence values.
        * NEW: `steam.SteamRichPresence.GetFriendRichPresence(uid, key)` Get the rich presence value of a friend.
        * NEW: `steam.SteamRichPresence.GetFriendRichPresenceKeyCount(uid)` Gets the number of keys set of a friend's rich presence.
        * NEW: `steam.SteamRichPresence.GetFriendRichPresenceKeyByIndex(uid, idx)` Self explanatory.
        * NEW: `steam.SteamRichPresence.RequestFriendRichPresence(uid)` Self explanatory.
    * New Resource loader: Asynchronous loading
        * Async loading is a way to load multiple resources at the same time, making loading lag less of a concern. It doesn't support ALL resource types, but most of them.
        * To use async loading, you provide a request, defaults, and a pool.
        * "request" is a table of individual resources you want to load, all the same type for a single call.
        * A call to a `Load[...]Async()` returns a LoadingTask object. See the Lapi.lua to see how this works.
        * NEW: `lstg.LoadTextureAsync(requests, defaults, pool): LoadingTask` Asynchronously loads one or more textures. `requests` is a table of request entries, `defaults` is an optional table of default parameters, `pool` is an optional target resource pool name.
        * NEW: `lstg.LoadSpriteAsync(requests, defaults, pool): LoadingTask` Asynchronously loads one or more sprites.
        * NEW: `lstg.LoadAnimationAsync(requests, defaults, pool): LoadingTask` Asynchronously loads one or more animations.
        * NEW: `lstg.LoadMusicAsync(requests, defaults, pool): LoadingTask` Asynchronously loads one or more music tracks.
        * NEW: `lstg.LoadSoundAsync(requests, defaults, pool): LoadingTask` Asynchronously loads one or more sound effects.
        * NEW: `lstg.LoadFontAsync(requests, defaults, pool): LoadingTask` Asynchronously loads one or more TrueType fonts.
        * NEW: `lstg.LoadSpriteFontAsync(requests, defaults, pool): LoadingTask` Asynchronously loads one or more sprite fonts.
        * NEW: `lstg.LoadFXAsync(requests, defaults, pool): LoadingTask` Asynchronously loads one or more FX (shader effect) resources.
        * NEW: `lstg.LoadModelAsync(requests, defaults, pool): LoadingTask` Asynchronously loads one or more 3D models.
        * NEW: `lstg.LoadParticleAsync(requests, defaults, pool): LoadingTask` Asynchronously loads one or more particle definitions.
        * NEW: `lstg.LoadVideoAsync(requests, defaults, pool): LoadingTask` Asynchronously loads one or more video files.
        * NEW: `lstg.GetAsyncLoaderThreadCount(): number` Returns the number of worker threads used by the async loader.
        * NEW: `lstg.SetAsyncLoaderMaxItemsPerFrame(count)` Sets the maximum number of GPU-side upload items processed per frame. Must be at least 1.
        * NEW: `lstg.GetAsyncLoaderMaxItemsPerFrame(): number` Returns the current max GPU upload items per frame limit.
        * NEW: `lstg.ClearAsyncLoaderTasks()` Cancels and clears all pending async loader tasks.
        * NEW: `LoadingTask:getId(): number` Returns the unique integer ID of this loading task.
        * NEW: `LoadingTask:getProgress(): number, number` Returns two values: completed count and total count.
        * NEW: `LoadingTask:isCompleted(): boolean` Returns true if all items in the task have finished loading.
        * NEW: `LoadingTask:isCancelled(): boolean` Returns true if the task was cancelled.
        * NEW: `LoadingTask:getStatus(): string` Returns the task status as a string: `"pending"`, `"loading"`, `"completed"`, `"failed"`, or `"cancelled"`.
        * NEW: `LoadingTask:cancel()` Requests cancellation of the loading task.
        * NEW: `LoadingTask:wait()` Blocks the calling thread until the task completes or is cancelled.
        * NEW: `LoadingTask:getResults(): table` Returns a table of result entries, each with `name`, `success`, `type`, and optionally `error` fields.
    * New Resource type: Video support
        * Videos are a new type of resources. They are... well, videos. It currently supports `mp4`, `mov`, `mkv` and `avi`. Be careful to use h.264 codecs for max compatibility.
        * NEW: `lstg.LoadVideo(name, path)` Loads a video file into the active resource pool.
        * NEW: `lstg.PlayVideo(name)` Starts video playback.
        * NEW: `lstg.StopVideo(name)` Stops video playback.
        * NEW: `lstg.PauseVideo(name)` Pauses video playback.
        * NEW: `lstg.ResumeVideo(name)` Resumes a paused video.
        * NEW: `lstg.GetVideoState(name): string` Returns the current playback state: `"playing"`, `"paused"`, or `"stopped"`.
        * NEW: `lstg.SeekVideo(name, time)` Seeks the video to the given time position in seconds.
        * NEW: `lstg.UpdateVideo(name)` Decodes and uploads the next video frame. Must be called every game frame.
        * NEW: `lstg.SetVideoVolume(name, volume)` Sets the audio volume of the video. Range is 0.0 to 1.0.
        * NEW: `lstg.GetVideoVolume(name): number` Returns the audio volume of the video.
        * NEW: `lstg.SetVideoLoop(name, loop)` Enables or disables looping for the video.
        * NEW: `lstg.GetVideoTime(name): number` Returns the current playback position in seconds.
        * NEW: `lstg.GetVideoTotalTime(name): number` Returns the total duration of the video in seconds.
        * NEW: `lstg.GetVideoSize(name): number, number` Returns the width and height in pixels of the video.
        * NEW: `lstg.RenderVideo(name, x, y, hscale, rot, vscale, z)` Renders a video centered at (x, y). `hscale` defaults to 1.0, `rot` in degrees (default 0.0), `vscale` defaults to `hscale`, `z` defaults to 0.5.
        * NEW: `lstg.RenderVideoRect(name, left, right, top, bottom, z)` Renders a video filling the specified rectangle (similar to `lstg.RenderRect()`). `z` defaults to 0.5.
        * NEW: `lstg.RenderVideo4V(name, x1, y1, z1, x2, y2, z2, x3, y3, z3, x4, y4, z4)` Renders a video in 4V. (Similar to `lstg.Render4V()`.)
    * Fixed
        * Fixed another issue with `lstg.ChangeVideoMode()` having some other weird viewport issues.
        * Fixed the rescaling of Render Targets being wrong on resizing the window in certain conditions.
    * Changes
        * Thlib-Ryannlib
            * Added background plugins to match SharpX backgrounds.

* LuaSTG-Flux v0.2.3
    * Fixed
        * Fixed an issue where `lstg.ChangeVideoMode()` didn't scale the viewport correctly.
        * Fixed a major memory leak related to Tracy. (Yes it was affecting you, even if you didn't know it.)
    * Tracy
        * Added D3D11 debug tracy zones.

* LuaSTG-Flux v0.2.2
    * Fixed
        * Fixed an issue where `lstg.Render3D` crashed when called.
        * Fixed an issue where the the entry-point script couldn't be found in specific conditions.
    * Changes
        * `lstg.ObjList` can now take `world` number as argument #2 to filter object's worlds.
        * Internal building setup changed to support Visual Studio 2026.
        * Minimum cmake version updated to 4.0.
        * Switched to a fork of discord-rpc (to support updated build logic).

* LuaSTG-Flux v0.2.1
    * API
        * NEW: `lstg.Render3D(img, x, y, z, rotx, roty, rotz, scalex, scaley)` Renders a texture in 3d space. Helper function using Render4V under the hood.
        * NEW: Added a `name` attribute to all objects. If set in lua side (example: `self.name = "HUDRenderer"` in the init function), it will appear in tracy. This is mainly a debug feature.
    * Fixes
        * Fixed an issue with `lstg.ChangeVideoMode()` always taking the width both times instead of width and height.
    * Changes
        * Updated Tracy to 0.13.1
        * Made Tracy support better (memory profiling, base and lua heap, and more zones)

* LuaSTG-Flux v0.2.0 (Initial Release)
    * API
        * NEW: `lstg.CreateResourcePool(name)` Creates a resource pool for loading resource. Can be used in `lstg.SetResourceStatus()` and `lstg.RemoveResource()`.
        * NEW: `lstg.RemoveResourcePool(name)` Deletes a resource pool and frees all the resources created in its scope.
        * NEW: `lstg.Window.SetBorderless()` Sets the screen to borderless mode. Use `lstg.Window.SetWindowed()` to go back out of it.
    * Fixes
        * Fixed an memory leak issue related to engine shutdown sequence.
        * Translated more console logs.
    * Changes
        * `lstg.AfterFrame()` and `lstg.ObjFrame()` are now world-mask aware.
    * Removed
        * `EventFunc` will not be called anymore by the engine.
    * Discord RPC
        * Newly added Discord Rich Presence support with lua bindings.
        * There is no default app id. Please create it yourself in the discord developer portal.
        * NEW: `lstg.DiscordRPC.Initialize(app_id)` Initializes the RPC client with your own app id.
        * NEW: `lstg.DiscordRPC.SetPresence(state, details, ...)` Sets the presence with string state and string details and optional image fields.
        * NEW: `lstg.DiscordRPC.ClearPresence()` Clears the current RPC presence.
        * NEW: `lstg.DiscordRPC.Shutdown()` Shutdowns the RPC client. Call it only once, in GameExit().
        * NEW: `lstg.DiscordRPC.IsInitialize(): boolean` Returns true if the RPC client is currently initialized.
    * Initial release specific
        * Including a modified THlib version for compatibility with Flux.

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