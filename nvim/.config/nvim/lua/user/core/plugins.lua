local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")

	-- LSP
	use({
		"neovim/nvim-lspconfig",
		requires = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"j-hui/fidget.nvim",
		},
	})
	use("jose-elias-alvarez/null-ls.nvim")

	-- Autocomplete
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"rafamadriz/friendly-snippets",
		},
	})

	-- Syntax highlight
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			pcall(require("nvim-treesitter.install").update({ with_sync = true }))
		end,
	})
	use({
		"nvim-treesitter/nvim-treesitter-textobjects",
		after = "nvim-treesitter",
	})
	use({
		"nvim-treesitter/playground",
		after = "nvim-treesitter",
	})
	--[[  TODO: Add commentstring? ]]
	--[[ use("JoosepAlviste/nvim-ts-context-commentstring") ]]

	-- Fuzzy Finder (files, lsp, etc)
	use({
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		requires = { "nvim-lua/plenary.nvim" },
	})
	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "make",
		cond = vim.fn.executable("make") == 1,
	})
	use("nvim-telescope/telescope-live-grep-args.nvim")

	-- Explorer
	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons", -- optional, for file icons
		},
	})

	-- Tabs and statusline
	use({ "akinsho/bufferline.nvim", tag = "v3.*", requires = "nvim-tree/nvim-web-devicons" })
	use({ "nvim-lualine/lualine.nvim", requires = "kyazdani42/nvim-web-devicons" })

	-- Terminal
	use({ "akinsho/toggleterm.nvim", tag = "*" })

	-- Comments
	use("numToStr/Comment.nvim")
	use({
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
	})

	-- Autopairs and surround
	use("windwp/nvim-autopairs")
	use("kylechui/nvim-surround")

	-- Git
	use("lewis6991/gitsigns.nvim")
	-- TODO: Add a git plugin
	-- use("tpope/vim-fugitive")
	-- use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })
	-- use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }
	-- https://github.com/kdheepak/lazygit.nvim

	-- Indentation
	use("lukas-reineke/indent-blankline.nvim")

	-- Colors
	use({ "catppuccin/nvim", as = "catppuccin" })
	--[[ use({ "embark-theme/vim", as = "embark" }) ]]
	--[[ use("sainnhe/sonokai") ]]
	--[[ use({ "rose-pine/neovim", as = "rose-pine" }) ]]
	--[[ use("EdenEast/nightfox.nvim") ]]
	--[[ use("sam4llis/nvim-tundra") ]]

	-- Tmux navigation integration
	use("numToStr/Navigator.nvim")

	-- TODO: Other
	use("max397574/better-escape.nvim")
	--[[ use("lewis6991/impatient.nvim") ]]
	use("folke/which-key.nvim")
	use("goolord/alpha-nvim")

	-- TODO: Try some of these
	-- https://github.com/ggandor/leap.nvim

	if packer_bootstrap then
		require("packer").sync()
	end
end)
