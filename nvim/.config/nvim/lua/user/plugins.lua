local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
end

local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return packer.startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- Common utilities
	use("nvim-lua/plenary.nvim")
	use("nvim-lua/popup.nvim")
	use("kyazdani42/nvim-web-devicons")
	use("lewis6991/impatient.nvim")
	use("folke/which-key.nvim")
	use("numToStr/Navigator.nvim")

	-- Completion
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("saadparwaiz1/cmp_luasnip")
	use("hrsh7th/cmp-nvim-lsp")

	-- Snippets
	use("L3MON4D3/LuaSnip")
	use("rafamadriz/friendly-snippets")
	use("mattn/emmet-vim")

	-- LSP
	use("neovim/nvim-lspconfig")
	use("williamboman/nvim-lsp-installer")
	use("tamago324/nlsp-settings.nvim")
	use("jose-elias-alvarez/null-ls.nvim")
	-- use("onsails/lspkind-nvim")

	-- Telescope
	use("nvim-telescope/telescope.nvim")
	use("nvim-telescope/telescope-fzy-native.nvim")

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("JoosepAlviste/nvim-ts-context-commentstring")
	use("nvim-treesitter/playground")

	-- NvimTree
	use("kyazdani42/nvim-tree.lua")

	-- Comments
	use("numToStr/Comment.nvim")
	use("folke/todo-comments.nvim")

	-- Autopairs and surround
	use("windwp/nvim-autopairs")
	use("blackCauldron7/surround.nvim")

	-- Git
	use("lewis6991/gitsigns.nvim")

	-- TODO: Find a tabline
	-- Lualine
	use("nvim-lualine/lualine.nvim")

	-- Terminal
	use("akinsho/toggleterm.nvim")

	-- Colorschemes
	-- use { 'embark-theme/vim', as = 'embark' }
	use("sainnhe/sonokai")
	use({ "rose-pine/neovim", as = "rose-pine" })
	use("EdenEast/nightfox.nvim")
	-- use 'shaunsingh/nord.nvim'

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require("packer").sync()
	end
end)
