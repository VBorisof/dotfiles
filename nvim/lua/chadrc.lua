-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

local orange = "#f07710"
local color_kw = "#2288ff"
local color_type = "#22aaff"
local color_comment = "#008800"
local color_gray = "#afafaf"
local color_dark_gray = "#909090"
local color_light_gray = "#bfbfbf"
local color_dark_blue = "#030363"
local color_constant = "#8b60a8"
local color_function = "#c1c491"
local color_function_call = "#b1b471"

M.base46 = {
  transparency = true,
	theme = "solarized_osaka",

	hl_override = {
    -- Normal = { bg = color_black },
    Visual = { bg = color_dark_blue },
    CursorLine = { bg = color_dark_blue },
    -- ['@lsp.type.variable'] = {},
    ["@comment"] = { italic = true, fg = color_comment },
    ["@keyword"] = { fg = color_kw },
    ["@keyword.function"] = { fg = color_kw },
    ["@keyword.return"] = { fg = color_kw },
    ["@function.builtin"] = { fg = color_kw },
    ["@function"] = { fg = color_function },
    ["@function.call"] = { fg = color_function_call },
    ["@string"] = { fg = orange },
    ["@variable"] = { fg = color_gray },
    ["@variable.member"] = { fg = color_light_gray },

    ["Include"] = { fg = color_dark_gray },
    ["Comment"] = { italic = true, fg = color_comment },
    ["Keyword"] = { fg = color_kw },
    ["Type"] = { fg = color_type },
    ["Structure"] = { fg = color_kw },
    ["String"] = { fg = orange },

    ["@operator"] = { fg = color_gray },
    ["@constant"] = { fg = color_constant }
	},
  hl_add = {
    St_file_info = { fg = "yellow" },
  }
}

M.ui = {
  statusline = {
    modules = {
      file_info = function()
        local file_name = vim.fn.expand("%")

        local cur_line = vim.fn.line(".")
        local total_lines = vim.fn.line("$")
        -- local cursor_column = vim.call("col", '.')

        return "%#St_file_info#  "
          .. file_name
          .. " | "
          .. cur_line
          .. "/"
          .. total_lines
          .. "  %#RESET#"
      end,
    },
    order = {
      "mode",
      "git",
      "%=",
      "file_info",
      "%=",
      "lsp",
      --"cwd",
      --"cursor"
    },
  }
}

-- M.nvdash = { load_on_startup = true }
-- M.ui = {
--       tabufline = {
--          lazyload = false
--      }
--}

return M
