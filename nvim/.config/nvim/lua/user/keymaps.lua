local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- Remap leader
keymap("n", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Exit insert mode faster
keymap("i", "jk", "<ESC>", opts)

-- Turn off hlsearch
keymap("n", "<Leader>/", ":nohls<CR>", opts)

-- Open splits and tabs
keymap("n", "<Leader>t", ":tabedit<CR>", opts)
keymap("n", "<Leader>v", ":vsplit<CR>", opts)
keymap("n", "<Leader>h", ":split<CR>", opts)

-- Make J and K work on wrapped lines
keymap("n", "j", "gj", { noremap = true })
keymap("n", "k", "gk", { noremap = true })
