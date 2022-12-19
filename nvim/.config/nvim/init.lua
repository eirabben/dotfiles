local colorscheme = "catppuccin"

local impatient_ok, impatient = pcall(require, "impatient")
if impatient_ok then
	impatient.enable_profile()
end

-- Core
require("user.core.options")
require("user.core.keymaps")
require("user.plugins")

-- LSP
require("user.lsp")

-- Plugins
require("user.plugins")
require("user.config")

-- Theme
require("user.theme").init(colorscheme)
