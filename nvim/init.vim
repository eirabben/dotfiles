" UI options
syntax on " Syntax highlighting
set number " Alsays show line numbers
set relativenumber " Relative line numbers
set scrolloff=5 " Padding betwewn cursor and top/bottom
set cursorline " Highlight current line
set colorcolumn=80 " Highlight column length
set splitbelow " New windows below current one
set splitright " New windows to the right of current one
set linebreak " Don't split words when breaking lines

" Status line
set cmdheight=2 " Always show command line
set ruler " Show cursor position

" Indentation
set expandtab " Use spaces instead of tabs
set tabstop=2 " Number of spaces that a tab counts for
set softtabstop=2 " Number of spaces that a tab counts for when editing
set shiftwidth=2 " Number of spaces to use for autoindent

" Indentation by file type
autocmd FileType php setlocal shiftwidth=4 tabstop=4 softtabstop=4

" Search options
set ignorecase " Ignore case when searching
set smartcase " Override ignorecase if search term contains uppercase letters

" Clipboard options
"set clipboard+=unnamed " Yank to clipboard

" Key mappings
" Use jk to escape insert mode
imap jk <Esc>
" Map leader to comma
let mapleader=','
" Next and previous line includes wrapped lines
nnoremap j gj
nnoremap k gk
" Clear search highlight
nnoremap <silent> <leader>/ :nohlsearch<CR>

" Colorscheme
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set background=dark
colorscheme dracula

" Plugins
call plug#begin()

Plug 'scrooloose/nerdtree' " Sidebar and file browser
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " Fuzzy finder
Plug 'junegunn/fzf.vim'

Plug 'tpope/vim-commentary' " Commenting
Plug 'tpope/vim-repeat' " Repeat plugin actions
Plug 'tpope/vim-surround' " Surround things
Plug 'jiangmiao/auto-pairs' " Automatic pair closing

Plug 'mattn/emmet-vim' " HTML and CSS expansion
" Plug 'sheerun/vim-polyglot' " Language packs
Plug 'posva/vim-vue' " Vue syntax
Plug 'lumiliet/vim-twig' " Twig syntax

call plug#end()

" NERDTree
map <C-b> :NERDTreeToggle<CR>
let NERDTreeMapActivateNode='l'
let NERDTreeMapCloseDir='h'
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.DS_Store', '\config.codekit', '\.sass-cache']

" FZF
nnoremap <c-p> :Files<cr>
nnoremap <silent> <C-p> :FZF -m<cr>
let g:fzf_action = {'ctrl-s': 'split', 'ctrl-v': 'vsplit'}

" Twig
autocmd FileType html.twig setlocal commentstring={#\ %s\ #}
