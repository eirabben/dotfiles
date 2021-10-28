local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Tmux navigation integration
  use 'numToStr/Navigator.nvim'

  -- LSP
  use {
    'neovim/nvim-lspconfig',
    'williamboman/nvim-lsp-installer',
  }

  -- Autocomplete
  use "rafamadriz/friendly-snippets"
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/nvim-cmp'

  -- File explorer
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
  }

  -- Status line
  use {
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }

  -- Fuzzy finder
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }

  -- Syntax highlighting
  use {
    'nvim-treesitter/nvim-treesitter',
    branch = '0.5-compat',
    run = ':TSUpdate',
  }

  -- Auto pairs and surround
  use {
    'windwp/nvim-autopairs',
  }
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'

  -- Comments
  use {
    'numToStr/Comment.nvim',
  }
  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
  }

  -- Git integration
  use {
    'TimUntersberger/neogit',
    requires = 'nvim-lua/plenary.nvim'
  }
  use {
    'lewis6991/gitsigns.nvim',
    requires = 'nvim-lua/plenary.nvim'
  }

  -- Color schemes
  -- use { 'embark-theme/vim', as = 'embark' }
  -- use 'sainnhe/sonokai'
  use { 'rose-pine/neovim', as = 'rose-pine' }
  -- use 'EdenEast/nightfox.nvim'
  -- use 'shaunsingh/nord.nvim'

  if packer_bootstrap then
    require('packer').sync()
  end
end)
