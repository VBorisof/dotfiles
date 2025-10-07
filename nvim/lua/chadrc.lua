-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "solarized_osaka",

	hl_override = {
    Comment = { italic = true, fg = "#008800" },
    ["@comment"] = { italic = true, fg = "#008800" },

    ["@keyword"] = { fg = "#7777ff" },
    ["@string"] = { fg = "orange" },
	},
}

-- M.nvdash = { load_on_startup = true }
-- M.ui = {
--       tabufline = {
--          lazyload = false
--      }
--}

return M
