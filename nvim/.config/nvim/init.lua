-- local colorscheme = "rose-pine"
local colorscheme = "catppuccin"

local impatient_ok, impatient = pcall(require, "impatient")
if impatient_ok then
	impatient.enable_profile()
end

-- Core
require("user.core.options")
require("user.core.keymaps")

-- Plugins
require("user.plugins")
require("user.cmp")
require("user.lsp")
require("user.telescope")
require("user.treesitter")
require("user.autopairs")
require("user.comment")
require("user.gitsigns")
require("user.nvim-tree")
require("user.bufferline")
require("user.nvim-surround")
-- require("user.neo-tree")
require("user.indent-blankline")
require("user.lualine")
require("user.toggleterm")
require("user.impatient")
require("user.whichkey")
require("user.navigator")
require("user.todo-comments")

-- Theme
require("user.theme.colorscheme").init(colorscheme)
