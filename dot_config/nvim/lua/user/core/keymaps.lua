-- Turn off hlsearch
-- vim.keymap.set("n", "<Leader>/", ":nohls<CR>", { silent = true })

-- Save and Quit
vim.keymap.set("n", "<Leader>s", ":wa<cr>", { desc = "[S]ave files" })
vim.keymap.set("n", "<Leader>q", ":qa<cr>", { desc = "[Q]uit" })
vim.keymap.set("n", "<Leader>x", ":q<cr>", { desc = "[X] Close buffer" })

-- Paste in visual mode and keep clipboard contents
vim.keymap.set("x", "<Leader>p", '"_dP')

-- Copy to system clipboard
vim.keymap.set("n", "<Leader>y", '"+y', { desc = "[Y]ank to Clipboard" })
vim.keymap.set("v", "<Leader>y", '"+y')
vim.keymap.set("n", "<Leader>Y", '"+Y')

-- Open splits and tabs
vim.keymap.set("n", "<Leader>t", ":tabedit<CR>", { silent = true, desc = "New [T]ab" })
vim.keymap.set("n", "<Leader>v", ":vsplit<CR>", { silent = true, desc = "[V]ertical Split" })
vim.keymap.set("n", "<Leader>h", ":split<CR>", { silent = true, desc = "[H]orizontal Split" })

-- Make J and K work on wrapped lines
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Go to last buffer
vim.keymap.set("n", "<Leader>bb", ":b#<CR>", { silent = true, desc = "Last [B]uffer" })
