local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- LSP and autocomplete
  use 'neovim/nvim-lspconfig'
  use 'kabouzeid/nvim-lspinstall'
  use 'hrsh7th/nvim-compe'
  use 'hrsh7th/vim-vsnip'

  -- Snippets
  use "rafamadriz/friendly-snippets"

  -- HTML expansion
  use 'mattn/emmet-vim'

  -- File explorer
  use 'kyazdani42/nvim-tree.lua'

  -- Fuzzy finder
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }

  -- Syntax highlighting
  -- TODO: Find something for twig
  use {
    'nvim-treesitter/nvim-treesitter',
    branch = '0.5-compat',
    run = ':TSUpdate'
  }

  -- Markdown syntax
  use 'godlygeek/tabular'
  use 'plasticboy/vim-markdown'

  -- Auto pairs and surround
  use {
    'windwp/nvim-autopairs',
    config = function() require('nvim-autopairs').setup() end
  }
  use 'tpope/vim-surround'

  -- Comments
  use {
    'terrortylor/nvim-comment',
    config = function() require('nvim_comment').setup() end
  }

  -- Git fugitive
  use 'tpope/vim-fugitive'

  -- Git decorations
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = function()
      require('gitsigns').setup()
    end
  }

  -- Color schemes
  use { 'embark-theme/vim', as = 'embark' }
end)
