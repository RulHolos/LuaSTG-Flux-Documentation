---@diagnostic disable: missing-return, duplicate-set-field

--------------------------------------------------------------------------------
--- LuaSTG Sub and Flux API
--------------------------------------------------------------------------------

---@class lstg
local M = {}

---@diagnostic disable-next-line: lowercase-global
lstg = M

--------------------------------------------------------------------------------
--- Command Line Arguments  

--- Available external command line arguments  
--- 1. --log-window      Enable engine log window  
--- 2. --log-window-wait Do not close the engine log window immediately after closing the program  
--- Command line arguments  
---@type string[]
M.args = {}

--------------------------------------------------------------------------------
--- Engine startup sequence

-- 1. Initialize the game framework and start the lua vm
-- 2a. Load the launch initialization script (optional)
-- 2b. Load the config.json initialization file (optional)
-- 3. Load the game engine
-- 4. Search for and load the entry point script in the order: core.lua -> main.lua -> src/main.lua
-- Only the first script found will be loaded.
-- 5. Execute GameInit function to start the game loop.
-- 6. Execute the game loop in the sequence FrameFunc -> RenderFunc -> FrameFunc -> ...
-- 7. Exit the game loop and execute GameExit function (optional)
-- 8. Unload all resources, shut down the game engine, close the lua vm and terminate the game framework.

--------------------------------------------------------------------------------
--- Global callback functions (defined in the global scope for invoking by the engine)

---Called once before the game loop begins.
function GameInit()
end

---Called once per frame in the game loop, before RenderFunc
---@return boolean @Returns true to exit the game loop
function FrameFunc()
	return false
end

---Called once per frame in the game loop, after FrameFunc.
function RenderFunc()
end

---After the game loop ends, call once before exiting.
function GameExit()
end

---Called when the window loses focus
function FocusLoseFunc()
end

---Called when the window gains focus
function FocusGainFunc()
end

--------------------------------------------------------------------------------

local DegreesMath = require("legacy.DegreesMath")

M.sin = DegreesMath.sin
M.cos = DegreesMath.cos
M.asin = DegreesMath.asin
M.acos = DegreesMath.acos
M.tan = DegreesMath.tan
M.atan = DegreesMath.atan
M.atan2 = DegreesMath.atan2

--------------------------------------------------------------------------------

local Framework = require("legacy.Framework")

M.GetVersionNumber = Framework.GetVersionNumber
M.GetVersionName = Framework.GetVersionName

M.Log = Framework.Log
M.SystemLog = Framework.SystemLog
M.Print = Framework.Print

M.SetWindowed = Framework.SetWindowed
M.SetVsync = Framework.SetVsync
M.SetResolution = Framework.SetResolution
M.SetPreferenceGPU = Framework.SetPreferenceGPU

M.SetFPS = Framework.SetFPS
M.GetFPS = Framework.GetFPS
M.SetSplash = Framework.SetSplash
M.SetTitle = Framework.SetTitle
---@diagnostic disable-next-line: deprecated
M.EnumResolutions = Framework.EnumResolutions
M.EnumGPUs = Framework.EnumGPUs
M.ChangeGPU = Framework.ChangeGPU
M.ChangeVideoMode = Framework.ChangeVideoMode

M.DoFile = Framework.DoFile
M.LoadTextFile = Framework.LoadTextFile
M.LoadPack = Framework.LoadPack
M.UnloadPack = Framework.UnloadPack
M.ExtractRes = Framework.ExtractRes
M.FindFiles = Framework.FindFiles

--------------------------------------------------------------------------------

require("legacy.Archive")
local FileManager = require("legacy.FileManager")

M.FileManager = FileManager

--------------------------------------------------------------------------------

require("legacy.GameObject")
local GameObjectManager = require("legacy.GameObjectManager")

M.GetnObj = GameObjectManager.GetnObj
M.ObjList = GameObjectManager.ObjList
M.ResetPool = GameObjectManager.ResetPool
M.ObjFrame = GameObjectManager.ObjFrame
M.ObjRender = GameObjectManager.ObjRender
M.BoundCheck = GameObjectManager.BoundCheck
M.SetBound = GameObjectManager.SetBound
M.CollisionCheck = GameObjectManager.CollisionCheck
M.UpdateXY = GameObjectManager.UpdateXY
M.AfterFrame = GameObjectManager.AfterFrame

M.New = GameObjectManager.New
M.Del = GameObjectManager.Del
M.Kill = GameObjectManager.Kill
M.IsValid = GameObjectManager.IsValid

M.BoxCheck = GameObjectManager.BoxCheck
M.ColliCheck = GameObjectManager.ColliCheck

M.SetAttr = GameObjectManager.SetAttr
M.GetAttr = GameObjectManager.GetAttr

M.SetV = GameObjectManager.SetV
M.GetV = GameObjectManager.GetV
M.Angle = GameObjectManager.Angle
M.Dist = GameObjectManager.Dist

M.SetImgState = GameObjectManager.SetImgState
M.DefaultRenderFunc = GameObjectManager.DefaultRenderFunc

M.SetParState = GameObjectManager.SetParState
M.ParticleStop = GameObjectManager.ParticleStop
M.ParticleFire = GameObjectManager.ParticleFire
M.ParticleGetn = GameObjectManager.ParticleGetn
M.ParticleSetEmission = GameObjectManager.ParticleSetEmission
M.ParticleGetEmission = GameObjectManager.ParticleGetEmission

M.SetSuperPause = GameObjectManager.SetSuperPause
M.AddSuperPause = GameObjectManager.AddSuperPause
M.GetSuperPause = GameObjectManager.GetSuperPause
M.GetCurrentSuperPause = GameObjectManager.GetCurrentSuperPause

M.SetWorldFlag = GameObjectManager.SetWorldFlag
M.GetWorldFlag = GameObjectManager.GetWorldFlag
M.IsSameWorld = GameObjectManager.IsSameWorld
M.SetActiveWorlds = GameObjectManager.SetActiveWorlds

--------------------------------------------------------------------------------

require("legacy.ResourceTexture")
require("legacy.ResourceSprite")
require("legacy.ResourceSpriteSequence")
require("legacy.ResourceCollection")
local ResourceManager = require("legacy.ResourceManager")

M.SetResLoadInfo = ResourceManager.SetResLoadInfo
M.SetResourceStatus = ResourceManager.SetResourceStatus
M.GetResourceStatus = ResourceManager.GetResourceStatus
M.RemoveResource = ResourceManager.RemoveResource
M.CheckRes = ResourceManager.CheckRes
M.EnumRes = ResourceManager.EnumRes

M.LoadTexture = ResourceManager.LoadTexture
M.CreateRenderTarget = ResourceManager.CreateRenderTarget
M.IsRenderTarget = ResourceManager.IsRenderTarget
M.GetTextureSize = ResourceManager.GetTextureSize
M.SaveTexture = ResourceManager.SaveTexture
M.Snapshot = ResourceManager.Snapshot
M.SetTextureSamplerState = ResourceManager.SetTextureSamplerState

M.LoadImage = ResourceManager.LoadImage
M.SetImageState = ResourceManager.SetImageState
M.SetImageCenter = ResourceManager.SetImageCenter
M.SetImageScale = ResourceManager.SetImageScale
M.GetImageScale = ResourceManager.GetImageScale

M.LoadAnimation = ResourceManager.LoadAnimation
M.SetAnimationState = ResourceManager.SetAnimationState
M.SetAnimationCenter = ResourceManager.SetAnimationCenter
M.SetAnimationScale = ResourceManager.SetAnimationScale
M.GetAnimationScale = ResourceManager.GetAnimationScale

M.LoadPS = ResourceManager.LoadPS

M.LoadFont = ResourceManager.LoadFont
M.SetFontState = ResourceManager.SetFontState

M.LoadTTF = ResourceManager.LoadTTF
M.CacheTTFString = ResourceManager.CacheTTFString

M.LoadSound = ResourceManager.LoadSound

M.LoadMusic = ResourceManager.LoadMusic

M.LoadFX = ResourceManager.LoadFX

M.LoadModel = ResourceManager.LoadModel

M.ResourceManager = ResourceManager.ResourceManager

--------------------------------------------------------------------------------

local Renderer = require("legacy.Renderer")

M.BeginScene = Renderer.BeginScene
M.EndScene = Renderer.EndScene

M.SetFog = Renderer.SetFog
M.SetViewport = Renderer.SetViewport
M.SetScissorRect = Renderer.SetScissorRect
M.SetOrtho = Renderer.SetOrtho
M.SetPerspective = Renderer.SetPerspective
M.SetZBufferEnable = Renderer.SetZBufferEnable

M.RenderClear = Renderer.RenderClear
M.ClearZBuffer = Renderer.ClearZBuffer
M.PushRenderTarget = Renderer.PushRenderTarget
M.PopRenderTarget = Renderer.PopRenderTarget

M.RenderRect = Renderer.RenderRect
M.Render = Renderer.Render
M.RenderAnimation = Renderer.RenderAnimation
M.Render4V = Renderer.Render4V
M.RenderTexture = Renderer.RenderTexture

M.RenderText = Renderer.RenderText

M.RenderTTF = Renderer.RenderTTF

M.RenderModel = Renderer.RenderModel

M.DrawCollider = Renderer.DrawCollider
M.RenderGroupCollider = Renderer.RenderGroupCollider

M.PostEffect = Renderer.PostEffect

--------------------------------------------------------------------------------

local AudioSystem = require("legacy.AudioSystem")

M.PlaySound = AudioSystem.PlaySound
M.StopSound = AudioSystem.StopSound
M.PauseSound = AudioSystem.PauseSound
M.ResumeSound = AudioSystem.ResumeSound
M.GetSoundState = AudioSystem.GetSoundState

M.PlayMusic = AudioSystem.PlayMusic
M.StopMusic = AudioSystem.StopMusic
M.PauseMusic = AudioSystem.PauseMusic
M.ResumeMusic = AudioSystem.ResumeMusic
M.GetMusicState = AudioSystem.GetMusicState

M.SetSEVolume = AudioSystem.SetSEVolume
M.SetBGMVolume = AudioSystem.SetBGMVolume

--------------------------------------------------------------------------------

local Input = require("legacy.Input")

M.GetKeyState = Input.GetKeyState
M.GetMousePosition = Input.GetMousePosition
M.GetMouseState = Input.GetMouseState
M.GetMouseWheelDelta = Input.GetMouseWheelDelta
---@diagnostic disable-next-line: deprecated
M.GetLastKey = Input.GetLastKey

M.Input = Input.Input

--------------------------------------------------------------------------------

local Platform = require("legacy.Platform")

M.Execute = Platform.Execute
M.MessageBox = Platform.MessageBox

--------------------------------------------------------------------------------

local Rand = require("legacy.Rand")

M.Rand = Rand.Rand

--------------------------------------------------------------------------------

local StopWatch = require("legacy.StopWatch")

M.StopWatch = StopWatch.StopWatch

--------------------------------------------------------------------------------

local Color = require("legacy.Color")

---@diagnostic disable-next-line: assign-type-mismatch
M.Color = Color.Color

--------------------------------------------------------------------------------

local CurveLaser = require("legacy.CurveLaser")

M.BentLaserData = CurveLaser.BentLaserData

--------------------------------------------------------------------------------

local ParticleSystem = require("legacy.ParticleSystem")

M.ParticleSystemData = ParticleSystem.ParticleSystemData

--------------------------------------------------------------------------------

local PostEffectShader = require("legacy.PostEffectShader")

M.CreatePostEffectShader = PostEffectShader.CreatePostEffectShader
M.PostEffect = PostEffectShader.PostEffect

--------------------------------------------------------------------------------

return M
