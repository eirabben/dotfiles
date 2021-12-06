-- Remap leader
vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', { noremap = true, silent = true })
vim.g.mapleader = ' '

-- Exit insert mode faster
vim.api.nvim_set_keymap('i', 'jk', '<ESC>', { noremap = true })

-- Turn off hlsearch
vim.api.nvim_set_keymap('n', '<Leader>/', ':nohls<CR>', { noremap = true, silent = true })

-- Open splits and tabs
vim.api.nvim_set_keymap('n', '<Leader>t', ':tabedit<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>v', ':vsplit<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>h', ':split<CR>', { noremap = true, silent = true })

-- Make J and K work on wrapped lines
vim.api.nvim_set_keymap('n', 'j', 'gj', { noremap = true })
vim.api.nvim_set_keymap('n', 'k', 'gk', { noremap = true })
