-- Remap leader
vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', { noremap = true, silent = true })
vim.g.mapleader = ' '

-- Exit insert mode faster
vim.api.nvim_set_keymap('i', 'jk', '<ESC>', { noremap = true })

-- Turn off hlsearch
vim.api.nvim_set_keymap('n', '<Leader>/', ':nohls<CR>', { noremap = true, silent = true })

-- Better window navigation
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { silent = true })

-- Open splits and tabs
vim.api.nvim_set_keymap('n', '<Leader>t', ':tabedit<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>v', ':vsplit<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>h', ':split<CR>', { noremap = true, silent = true })

-- Make copy behave like delete and change
vim.api.nvim_set_keymap('n', 'Y', 'y$', { noremap = true })

-- Move lines up and down
vim.api.nvim_set_keymap('v', 'J', ':m \'>+1<CR>gv=gv', { noremap = true })
vim.api.nvim_set_keymap('v', 'K', ':m \'<-2<CR>gv=gv', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>j', ':m .+1<CR>==', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>k', ':m .-2<CR>==', { noremap = true })

-- Make J and K work on wrapped lines
vim.api.nvim_set_keymap('n', 'j', 'gj', { noremap = true })
vim.api.nvim_set_keymap('n', 'k', 'gk', { noremap = true })
