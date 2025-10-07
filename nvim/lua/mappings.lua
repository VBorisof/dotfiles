require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local autocmd = vim.api.nvim_create_autocmd

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

vim.keymap.del({"i"}, "<Tab>")

--------------------------
-- Buffers
map("n", "<S-l>", ":bn<CR>", { desc = "Buffer next" })
map("n", "<S-h>", ":bp<CR>", { desc = "Buffer previous" })
map("n", "qb", ":bn<CR>:bd #<CR>", { desc = "Buffer quit" })

--------------------------
-- Window
map("n", "<c-w>h", ":vertical resize +5<CR>", { desc = "Window grow to the left" })
map("n", "<c-w>l", ":vertical resize -5<CR>", { desc = "Window shrink to the right" })
map("n", "<c-w>k", ":res +5<CR>", { desc = "Window grow vertically" })
map("n", "<c-w>j", ":res -5<CR>", { desc = "Window shrink vertically" })

--------------------------
-- Common editing stuff
map("n", "<c-a>", "ggVG", { desc = "Select all" })
map({ "n", "i" }, "<c-d>", "Vyp", { desc = "Line duplicate" })
map({ "i", "c" }, "<c-bs>", "<c-w>", { noremap = true, desc = "Word Ctrl-BS deletes previous." })

--------------------------
-- Programming
vim.api.nvim_set_keymap('n', '<C-b>', '<cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true, desc="Go to definition" })

vim.api.nvim_set_keymap('n', '?', '<cmd>lua vim.diagnostic.open_float()<CR>', { silent = true, desc="Window open diagnostic" })

--------------------------
-- C/C++

local c_pattern = { "cpp", "c", "h", "hpp" }
autocmd("FileType", {
  pattern = c_pattern,
  callback = function (event)
    map("n", "<c-k><c-o>", ":ClangdSwitchSourceHeader<CR>", { buffer = event.buf, desc="C/C++ switch source/header" })
  end
})

--------------------------
-- Golang

local go_pattern = { "go" }
autocmd("FileType", {
  pattern = go_pattern,
  callback = function ()
    map("n", "rn", ":GoRename<CR>", { desc="Go rename symbol" })
  end
})


--------------------------
-- Etc.
-- local cmp = require "cmp"
