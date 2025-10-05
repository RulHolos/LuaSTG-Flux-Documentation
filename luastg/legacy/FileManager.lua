--------------------------------------------------------------------------------
--- LuaSTG Sub 文件管理
--- 璀境石
--------------------------------------------------------------------------------

---@diagnostic disable: missing-return

--------------------------------------------------------------------------------
--- 文件管理

---@class lstg.FileManager
local M = {}

---Load a compressed file
---@param archivefilepath string Compressed file path
---@param password string|nil Optional parameter, default is nil, password for compressed archive
---@return lstg.Archive|nil @If loading is successful, return a compressed package object; otherwise, return null.
function M.LoadArchive(archivefilepath, password)
end

---Unload a compressed file
---@param archivefilepath string For the compressed archive file path, please refer to the first parameter of `lstg.FileManager.LoadArchive`.
---@return boolean @When the returned boolean value is true, it indicates that the compressed package was indeed loaded before being unloaded. Otherwise, it does not exist and no action is taken.
function M.UnloadArchive(archivefilepath)
end

---Unload all loaded compressed packages
function M.UnloadAllArchive()
end

---Determine whether the specified compressed package has been loaded
---@param archivename string For the archive filename, refer to the first parameter of `lstg.FileManager.LoadArchive`. Additionally, consult the return value of `lstg.Archive:GetName()`.
---@return boolean @True if the archive exists. Otherwise; false.
function M.ArchiveExist(archivename)
end

---List the already loaded compressed archives
---@return table<number, table> @In the returned table, each element is a regular table. The first item is the compressed package name, and the second item is the compressed package priority.
function M.EnumArchives()
    return {{ "sample.zip", 0 }, { "foo.zip", 9961 }}
end

---Retrieve the loaded archive and return an `lstg.Archive` object.
---@param archivename string For the archive filename, refer to the first parameter of `lstg.FileManager.LoadArchive`. Additionally, consult the return value of `lstg.Archive:GetName()`.
---@return lstg.Archive
function M.GetArchive(archivename)
end

--------------------------------------------------------------------------------
--- Check file exists; list files and directories

--- Check if the file exists
--- If `also_check_archive` is true, the method also checks if any Archive contain the specified file  
---@param filepath string
---@param also_check_archive boolean
---@return boolean
---@overload fun(filepath:string):boolean
function M.FileExist(filepath, also_check_archive)
end

--- List files and directories under search path   
--- If `extend` is true, the method ignore directories and match file extension name  
--- If `also_enum_archives` is true, the method also list files in Archive  
---@param searchpath string
---@param extend string
---@param also_enum_archives boolean
---@overload fun(searchpath:string)
---@overload fun(searchpath:string, extend:string)
---@overload fun(searchpath:string, extend:nil, also_enum_archives:boolean)
function M.EnumFiles(searchpath, extend, also_enum_archives)
    return {
        { "sample.ext"          , false },
        { "sampledir/"          , true  },
        { "sampledir/sample.txt", false },
    }
end

--------------------------------------------------------------------------------
--- Search path management
--- The engine will find from the search path when loading Lua scripts, texture files, audio files...

--- Add a search path
---@param search_path string
function M.AddSearchPath(search_path)
end

--- Remove a search path
---@param search_path string
function M.RemoveSearchPath(search_path)
end

--- Remove all search path
function M.ClearSearchPath()
end

--------------------------------------------------------------------------------
--- Directory management (not affecting directories in archive)

--- Create directories for every element of dirs that does not already exist
---@param dirs string
---@return boolean
function M.CreateDirectory(dirs)
end

--- Deletes a directory recursively, delete all subdirectory and all files contained in
---@param path string
---@return boolean
function M.RemoveDirectory(path)
end

--- Check if the directory exists
--- If `also_check_archive` is true, the method also checks if any Archive contain the specified directory
---@param path string
---@param also_check_archive boolean
---@return boolean
---@overload fun(path:string):boolean
function M.DirectoryExist(path, also_check_archive)
end

return M
