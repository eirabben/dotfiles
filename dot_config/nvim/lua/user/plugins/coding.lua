return {
	-- Snippets
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"rafamadriz/friendly-snippets",
			config = function()
				require("luasnip.loaders.from_vscode").lazy_load()
			end,
		},
		opts = {
			history = true,
			delete_check_events = "TextChanged",
		},
    -- stylua: ignore
    keys = {
      -- {
      --   "<tab>",
      --   function()
      --     return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
      --   end,
      --   expr = true, silent = true, mode = "i",
      -- },
      -- { "<tab>", function() require("luasnip").jump(1) end, mode = "s" },
      -- { "<s-tab>", function() require("luasnip").jump(-1) end, mode = { "i", "s" } },
    },
	},

	-- auto completion
	{
		"hrsh7th/nvim-cmp",
		version = false, -- last release is way too old
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"saadparwaiz1/cmp_luasnip",
			"onsails/lspkind.nvim",
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			local lspkind = require("lspkind")

			-- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				completion = {
					completeopt = "menu,menuone,preview,noselect",
				},
				snippet = { -- configure how nvim-cmp interacts with snippet engine
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
					["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
					["<C-e>"] = cmp.mapping.abort(), -- close completion window
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				}),
				-- sources for autocompletion
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" }, -- snippets
					{ name = "buffer" }, -- text within current buffer
					{ name = "path" }, -- file system paths
				}),
				-- configure lspkind for vs-code like pictograms in completion menu
				formatting = {
					format = lspkind.cmp_format({
						maxwidth = 50,
						ellipsis_char = "...",
					}),
				},
			})

			-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
			cmp.setup.cmdline({ "/", "?" }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" },
				},
			})

			-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" },
				}, {
					{ name = "cmdline" },
				}),
			})
		end,
		-- opts = function()
		-- 	local cmp = require("cmp")
		-- 	return {
		-- 		completion = {
		-- 			completeopt = "menu,menuone,noinsert",
		-- 		},
		-- 		snippet = {
		-- 			expand = function(args)
		-- 				require("luasnip").lsp_expand(args.body)
		-- 			end,
		-- 		},
		-- 		mapping = cmp.mapping.preset.insert({
		-- 			-- ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
		-- 			-- ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
		-- 			["<C-b>"] = cmp.mapping.scroll_docs(-4),
		-- 			["<C-f>"] = cmp.mapping.scroll_docs(4),
		-- 			["<C-Space>"] = cmp.mapping.complete(),
		-- 			["<C-e>"] = cmp.mapping.abort(),
		-- 			["<CR>"] = cmp.mapping.confirm({
		--           behavior = cmp.ConfirmBehavior.Replace,
		--           select = true
		--         }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		-- 			["<S-CR>"] = cmp.mapping.confirm({
		-- 				behavior = cmp.ConfirmBehavior.Replace,
		-- 				select = true,
		-- 			}), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		-- 		}),
		-- 		sources = cmp.config.sources({
		-- 			{ name = "nvim_lsp" },
		-- 			{ name = "luasnip" },
		-- 			{ name = "buffer" },
		-- 			{ name = "path" },
		-- 		}),
		-- 		formatting = {
		-- 			format = function(_, item)
		-- 				-- local icons = require("lazyvim.config").icons.kinds
		-- 				-- if icons[item.kind] then
		-- 				--   item.kind = icons[item.kind] .. item.kind
		-- 				-- end
		-- 				return item
		-- 			end,
		-- 		},
		-- 		experimental = {
		-- 			ghost_text = {
		-- 				hl_group = "LspCodeLens",
		-- 			},
		-- 		},
		-- 	}
		-- end,
	},

	-- Better Escape
	{ "max397574/better-escape.nvim", event = "InsertEnter", opts = {
		mapping = { "jk" },
	} },

	-- Comments
	{
		"echasnovski/mini.comment",
		event = "VeryLazy",
		opts = {
			hooks = {
				pre = function()
					require("ts_context_commentstring.internal").update_commentstring({})
				end,
			},
		},
		config = function(_, opts)
			require("mini.comment").setup(opts)
		end,
	},

	-- Auto pairs
	{
		"echasnovski/mini.pairs",
		event = "VeryLazy",
		opts = {
			mappings = {
				[" "] = { action = "open", pair = "  ", neigh_pattern = "[%(%[{][%)%]}]" },
			},
		},
		config = function(_, opts)
			require("mini.pairs").setup(opts)
		end,
	},

	-- Surround
	-- TODO: Add keys for trigger and better mappings
	-- TODO: Maybe replace with kylechui/nvim-surround
	{
		"echasnovski/mini.surround",
		event = "VeryLazy",
		-- opts = {
		--   mappings = {
		--   },
		-- },
		config = function(_, opts)
			-- use gz mappings instead of s to prevent conflict with leap
			require("mini.surround").setup(opts)
		end,
	},
}
