local function map(mode, key, command)
	local opts = { noremap = true, silent = true }
	vim.api.nvim_set_keymap(mode, key, command, opts)
end

-- Remap leader
map("n", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Exit insert mode faster
map("i", "jk", "<ESC>")

-- Turn off hlsearch
map("n", "<Leader>/", ":nohls<CR>")

-- Open splits and tabs
map("n", "<Leader>t", ":tabedit<CR>")
map("n", "<Leader>v", ":vsplit<CR>")
map("n", "<Leader>h", ":split<CR>")

-- Make J and K work on wrapped lines
map("n", "j", "gj")
map("n", "k", "gk")
