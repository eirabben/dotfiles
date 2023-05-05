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

	-- Copilot
	{ "zbirenbaum/copilot.lua" },
	{
		"zbirenbaum/copilot-cmp",
		dependencies = {
			"zbirenbaum/copilot.lua",
		},
	},

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

	-- Syntax highlight
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		-- after = "nvim-treesitter",
	},
	-- {
	-- 	"nvim-treesitter/playground",
	--    dependencies = { "nvim-lua/plenary.nvim" },
	-- },
	--[[  TODO: Add commentstring? ]]
	--[[ use("JoosepAlviste/nvim-ts-context-commentstring") ]]

	-- Fuzzy Finder (files, lsp, etc)
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		-- init = "make",
		-- cond = vim.fn.executable("make") == 1,
	},
	{ "nvim-telescope/telescope-live-grep-args.nvim" },

	-- Explorer
	{
		"nvim-neo-tree/neo-tree.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
			"s1n7ax/nvim-window-picker",
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
	-- TODO: Add a git plugin
	-- use("tpope/vim-fugitive")
	-- use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }

	-- Indentation
	{ "lukas-reineke/indent-blankline.nvim" },

	-- Colors
	{ "catppuccin/nvim", name = "catppuccin" },
	{ "EdenEast/nightfox.nvim" },
	{ "rose-pine/neovim", name = "rose-pine" },
	{ "rebelot/kanagawa.nvim" },
	-- { "loctvl842/monokai-pro.nvim" },
	--[[ use({ "embark-theme/vim", as = "embark" }) ]]
	--[[ use("sainnhe/sonokai") ]]
	--[[ use("sam4llis/nvim-tundra") ]]

	-- Tmux navigation integration
	{ "numToStr/Navigator.nvim" },

	-- TODO: Other
	{ "max397574/better-escape.nvim" },
	--[[ use("lewis6991/impatient.nvim") ]]
	{ "folke/which-key.nvim" },
	{ "goolord/alpha-nvim" },
}
