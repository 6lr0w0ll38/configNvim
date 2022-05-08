local g = vim.g
local mapLeader = function ()
    g.mapleader = ","
end

local loadDirectoryModules = function ()
--    require'plugin.install'
    require'setting.general'
end

local initialize = function ()
    mapLeader()
    loadDirectoryModules()
end

--initialize
initialize()
