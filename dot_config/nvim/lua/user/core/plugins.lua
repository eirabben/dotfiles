return {
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate", -- :MasonUpdate updates registry contents
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"j-hui/fidget.nvim",
		},
	},
	{ "jose-elias-alvarez/null-ls.nvim" },
	{ "folke/neodev.nvim" },

	-- Copilot
	-- { "zbirenbaum/copilot.lua" },
	-- {
	-- 	"zbirenbaum/copilot-cmp",
	-- 	dependencies = {
	-- 		"zbirenbaum/copilot.lua",
	-- 	},
	-- },

	-- Autocomplete
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"rafamadriz/friendly-snippets",
		},
	},


	-- Tabs and statusline
	{ "akinsho/bufferline.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },
	{ "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },
	{
		"SmiteshP/nvim-navic",
		dependencies = "neovim/nvim-lspconfig",
	},

	-- Terminal
	{ "akinsho/toggleterm.nvim" },

	-- Comments
	{ "numToStr/Comment.nvim" },
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	-- Autopairs and surround
	{ "windwp/nvim-autopairs" },
	{ "kylechui/nvim-surround" },

	-- Git
	{ "lewis6991/gitsigns.nvim" },
	{
		"sindrets/diffview.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	-- TODO: Add a git plugin / Maybe not? Just use diffview and lg?
	-- use("tpope/vim-fugitive")
	-- use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }

	-- Indentation
	{ "lukas-reineke/indent-blankline.nvim" },
	{ "RRethy/vim-illuminate" },

	-- Colors

	-- Tmux navigation integration
	{ "numToStr/Navigator.nvim" },

	-- TODO: Other
	{ "max397574/better-escape.nvim" },
	--[[ use("lewis6991/impatient.nvim") ]]
	{ "folke/which-key.nvim" },
	{ "goolord/alpha-nvim" },
}
