local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Common utilities
  use 'nvim-lua/plenary.nvim'
  use 'kyazdani42/nvim-web-devicons'

  -- Tmux navigation integration
  use 'numToStr/Navigator.nvim'

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'
  use 'onsails/lspkind-nvim'

  -- Autocomplete and snippets
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use 'rafamadriz/friendly-snippets'

  -- Syntax highlighting
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use 'JoosepAlviste/nvim-ts-context-commentstring'

  -- Tree, tabline, statusline
  -- TODO: Find a tabline
  use 'kyazdani42/nvim-tree.lua'
  use 'nvim-lualine/lualine.nvim'

  -- Fuzzy finding
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-fzy-native.nvim'

  -- Comments
  use 'numToStr/Comment.nvim'
  use 'folke/todo-comments.nvim'

  -- Git
  use 'lewis6991/gitsigns.nvim'
  use 'TimUntersberger/neogit'

  -- Auto pairs and surround
  use 'windwp/nvim-autopairs'
  use 'blackCauldron7/surround.nvim'

  -- Colorschemes
  -- use { 'embark-theme/vim', as = 'embark' }
  -- use 'sainnhe/sonokai'
  use { 'rose-pine/neovim', as = 'rose-pine' }
  -- use 'EdenEast/nightfox.nvim'
  -- use 'shaunsingh/nord.nvim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

  -- use 'mhartington/formatter.nvim'

  -- Markdown
  -- use 'dkarter/bullets.vim'

  -- Git integration
  -- use 'tpope/vim-fugitive'

  -- Color highlights
  -- use 'norcalli/nvim-colorizer.lua'

  -- TODO: Try https://github.com/andymass/vim-matchup


