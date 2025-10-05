---@diagnostic disable: missing-return, duplicate-set-field

--------------------------------------------------------------------------------
--- Class

--- 4 channels, 8-bits per channel, 32-bits color  
--- 
--- ```cpp
--- union Color {
---     struct ColorComponents {
---         uint8_t b;
---         uint8_t g;
---         uint8_t r;
---         uint8_t a;
---     } components;
---     uint32_t argb;
--- };
--- ```
---@class lstg.Color
local Color = {}

--- Alpha channel, from 0 to 255 integer,
--- smaller value is more transparent
Color.a = 0

--- Red channel, from 0 to 255 integer  
Color.r = 0

--- Green channel, from 0 to 255 integer  
Color.g = 0

--- Blue channel, from 0 to 255 integer  
Color.b = 0

--- 32-bits integer, in AARRGGBB hexadecimal format  
Color.argb = 0x00000000

--- Call without parameters, returns a, r, g, b channel values  
---@see lstg.Color.a
---@see lstg.Color.r
---@see lstg.Color.g
---@see lstg.Color.b
---@return number a
---@return number r
---@return number g
---@return number b
function Color:ARGB()
end

---@see lstg.Color.argb
---@param argb number
---@diagnostic disable-next-line: unused-local, redundant-parameter
function Color:ARGB(argb)
end

---@see lstg.Color.a
---@see lstg.Color.r
---@see lstg.Color.g
---@see lstg.Color.b
---@param a number
---@param r number
---@param g number
---@param b number
---@diagnostic disable-next-line: unused-local, redundant-parameter
function Color:ARGB(a, r, g, b)
end

local M = {}

---@see lstg.Color.argb
---@param argb number
---@return lstg.Color
function M.Color(argb)
end

---@see lstg.Color.a
---@see lstg.Color.r
---@see lstg.Color.g
---@see lstg.Color.b
---@param a number
---@param r number
---@param g number
---@param b number
---@return lstg.Color
function M.Color(a, r, g, b)
end

return M
