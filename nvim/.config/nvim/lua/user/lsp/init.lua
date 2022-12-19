local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("mason").setup()
require("user.lsp.null-ls")
require("user.lsp.cmp")
