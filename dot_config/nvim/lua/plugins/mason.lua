-- LSP servers (emmet, twiggy) are installed automatically from lspconfig.lua and
-- the lang extras; only tools that aren't LSP servers are listed here.
return {
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "phpstan",
        "rustywind",
      },
    },
  },
}
