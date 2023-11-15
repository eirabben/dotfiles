-- Options
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- User Interface
vim.wo.number = true
vim.o.termguicolors = true
vim.o.cmdheight = 1
vim.o.cursorline = true
vim.wo.signcolumn = "yes"
vim.o.splitbelow = false
vim.o.splitright = true
vim.o.scrolloff = 5
vim.o.pumheight = 10
vim.o.showtabline = 2

-- Indentation
vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.smartindent = true
vim.o.breakindent = true

-- Searching
vim.o.hlsearch = false
vim.o.ignorecase = true
vim.o.smartcase = true

-- Misc
vim.o.timeoutlen = 500
vim.o.swapfile = false
vim.o.updatetime = 250
vim.o.completeopt = "menuone,noselect"
vim.o.mouse = ""

-- Remap leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
