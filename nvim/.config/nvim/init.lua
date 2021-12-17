local colorscheme = "rose-pine"

require("user.options")
require("user.keymaps")
require("user.plugins")
require("user.colorscheme").init(colorscheme)
require("user.cmp")
require("user.lsp")
require("user.telescope")
require("user.treesitter")
require("user.autopairs")
require("user.comment")
require("user.gitsigns")
require("user.nvim-tree")

-- require("plugins/config-explorer")
require("plugins/config-navigator")
require("plugins/config-statusline")
require("plugins/config-surround")
require("plugins/config-todo")
require("plugins/config-terminal")
