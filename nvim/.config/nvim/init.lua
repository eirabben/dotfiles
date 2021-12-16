local colorscheme = "rose-pine"

require("user.options")
require("user.keymaps")
require("user.plugins")
require("user.colorscheme").init(colorscheme)

require("plugins/config-lsp")
require("plugins/config-autocomplete")
require("plugins/config-telescope")
require("plugins/config-syntax")
require("plugins/config-explorer")
require("plugins/config-autopairs")
require("plugins/config-git")
require("plugins/config-navigator")
require("plugins/config-statusline")
require("plugins/config-surround")
require("plugins/config-todo")
require("plugins/config-terminal")
