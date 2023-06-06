return {
  -- lspconfig
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      {
        "folke/neodev.nvim",
        config = true,
      },
      "mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      -- TODO: Enable after installing cmp
      -- "hrsh7th/cmp-nvim-lsp",
    },
    opts = {
      servers = {
         "tsserver", "lua_ls", "tailwindcss", "emmet_ls", "intelephense" 
      }
    },
    config = function(_, opts)
      local servers = opts.servers
      
      require("mason-lspconfig").setup({
        ensure_installed = servers,
      })
      
      for _, lsp in ipairs(servers) do
        require("lspconfig")[lsp].setup({
          on_attach = on_attach,
          capabilities = capabilities,
        })
      end

      require("lspconfig").emmet_ls.setup({
        -- on_attach = on_attach,
        capabilities = capabilities,
        filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "twig" },
      })
    end
  },
  
  -- null-ls
	{ 
    "jose-elias-alvarez/null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    -- TODO: Install mason-null-ls
    opts = {
     -- sources = {
     --   null_ls.builtins.formatting.stylua,
     --   null_ls.builtins.formatting.prettierd,
     --   null_ls.builtins.formatting.rustywind,
     --   null_ls.builtins.formatting.rustywind.with({
     --     filetypes = {
     --       "javascript",
     --       "javascriptreact",
     --       "typescript",
     --       "typescriptreact",
     --       "vue",
     --       "svelte",
     --       "html",
     --       "twig",
     --     },
     --   }),
     -- },
     -- on_attach = function(client, bufnr)
     --   if client.supports_method("textDocument/formatting") then
     --     vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
     --     vim.api.nvim_create_autocmd("BufWritePre", {
     --       group = augroup,
     --       buffer = bufnr,
     --       callback = function()
     --         lsp_formatting(bufnr)
     --       end,
     --     })
     --   end
     -- end,
     },
     config = function(_, opts)
      -- local lsp_formatting = function(bufnr)
      --   vim.lsp.buf.format({
      --     filter = function(client)
      --       -- apply whatever logic you want (in this example, we'll only use null-ls)
      --       return client.name == "null-ls"
      --     end,
      --     bufnr = bufnr,
      --   })
      -- end
      --
      -- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

      require('null-ls').setup(opts)
    end,
  },
  
  -- mason
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    build = ":MasonUpdate",
    opts = {
      -- ensure_installed = {
        -- "emmet-ls",
        -- "intelephense",
        -- "lua-language-server",
        -- "rustywind",
        -- "stylua",
        -- "tailwindcss-language-server",
        -- "typescript-language-server"
      -- }
    }
  },

  
  -- TODO: Maybe install j-hui/fidget. This should probably be in UI section
}
