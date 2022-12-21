--[[ local impatient_ok, impatient = pcall(require, "impatient") ]]
--[[ if impatient_ok then ]]
--[[ 	impatient.enable_profile() ]]
--[[ end ]]

require("user.core.options")
require("user.core.keymaps")
require("user.core.plugins")

require("user.lsp")

require("user.theme")

-- TODO: Move to lsp folder?
require("user.plugins.null-ls")

require("user.plugins.lualine")
require("user.plugins.comment")
require("user.plugins.indent-blankline")
require("user.plugins.gitsigns")
require("user.plugins.telescope")
require("user.plugins.treesitter")
require("user.plugins.nvim-tree")
require("user.plugins.navigator")
require("user.plugins.bufferline")
require("user.plugins.autopairs")
require("user.plugins.better-escape")
require("user.plugins.todo-comments")
require("user.plugins.which-key")
require("user.plugins.surround")
require("user.plugins.alpha")
