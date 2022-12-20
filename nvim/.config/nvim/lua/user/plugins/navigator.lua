require('Navigator').setup()

vim.keymap.set({'n', 't'}, '<C-h>', require('Navigator').left)
vim.keymap.set({'n', 't'}, '<C-l>', require('Navigator').right)
vim.keymap.set({'n', 't'}, '<C-k>', require('Navigator').up)
vim.keymap.set({'n', 't'}, '<C-j>', require('Navigator').down)
