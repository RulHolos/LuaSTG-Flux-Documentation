--------------------------------------------------------------------------------
--- LuaSTG Flux exclusive
--------------------------------------------------------------------------------

---@diagnostic disable: missing-return, unused-local

--------------------------------------------------------------------------------
--- lstg.DiscordRPC

---@class lstg.DiscordRPC
local DiscordRPC = {}

---Initializes the Discord RPC client for this game instance.
---@param app_id string Application ID created from the Discord developer portal.
function DiscordRPC.Initialize(app_id)
end

---Change the Discord presence texts and images.
---@param state string
---@param details string
---@param large_image_key string?
---@param large_image_text string?
---@param small_image_key string?
---@param small_image_text string?
---@param start_timestamp integer?
---@return boolean @True if the presence was set. Otherwise; false.
function DiscordRPC.SetPresence(
    state,
    details,
    large_image_key,
    large_image_text,
    small_image_key,
    small_image_text,
    start_timestamp)
end

---Clears the current presence data.
function DiscordRPC.ClearPresence()
end

---Shutdowns the current DiscordRPC instance.
---
---Make sure not to call any discord related functions after this function gets called.
function DiscordRPC.Shutdown()
end

---@return boolean @True if the RPC is initialized. Otherwise; false.
function DiscordRPC.IsInitialized()
end