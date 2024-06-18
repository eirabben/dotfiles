return {
	-- Snippets
	{
		"L3MON4D3/LuaSnip",
		lazy = true,
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
		keys = {
			{
				"<tab>",
				function()
					return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
				end,
				expr = true,
				silent = true,
				mode = "i",
			},
			{
				"<tab>",
				function()
					require("luasnip").jump(1)
				end,
				mode = "s",
			},
			{
				"<s-tab>",
				function()
					require("luasnip").jump(-1)
				end,
				mode = { "i", "s" },
			},
		},
	},

	-- auto completion
	-- @TODO: Add completion to command line
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
	},

	-- Better Escape
	{ "max397574/better-escape.nvim", event = "InsertEnter", opts = {
		mapping = { "jk" },
	} },

	-- Comments
  {
    "folke/ts-comments.nvim",
    opts = {},
    event = "VeryLazy",
  }
	-- {
	-- 	"echasnovski/mini.comment",
	-- 	event = "VeryLazy",
	-- 	opts = {
	-- 		options = {
	-- 			custom_commentstring = function()
	-- 				if vim.bo.filetype == "twig" then
	-- 					return "{# %s #}"
	-- 				end
	--
	-- 				return require("ts_context_commentstring").calculate_commentstring() or vim.bo.commentstring
	-- 			end,
	-- 		},
	-- 	},
	-- 	config = function(_, opts)
	-- 		require("mini.comment").setup(opts)
	-- 	end,
	-- },

	{
		"echasnovski/mini.ai",
		event = "VeryLazy",
		config = true,
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
		config = true,
	},
}
