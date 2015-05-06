" Use vim settings instead of Vi settings to enable functionality.
" This must always be first.
set nocompatible
"filetype on                     " Fix problem with filetype off with git
filetype off                    " Required for Vundle

"================================================
" General
"================================================

set history=500                 " Remember 500 lines of history.
set autoread                    " Autoread files when changed outside of Vim.
set fileformats+=mac            " In case we are on Linux
set hidden                      " Buffer becomes hidden when abandoned instead of unloaded.
set backupdir=~/.vim/backups	" Centralize backups.
set directory=~/.vim/swaps	    " Centralize swap files.
set mouse=a                     " Allow mouse navigation.
set ttimeout
set ttimeoutlen=100

"================================================
" User interface
"================================================

set number                      " Always show line numbers.
"set showmatch                  " Show matching bracket when cursor is on one.
"set mat=2                      " How many tenths of a second to blink when matching brackets.
set scrolloff=5                 " Minimum lines above/below cursor.
set colorcolumn=80              " Line length marker
"set gcr=a:blinkon0             " Disable cursor blink.
set visualbell                  " Turn off sounds.
"set splitbelow                 " Horizontal splits below.
"set splitright                 " Vertical splits to the right.
set nrformats-=octal            " Let <C-a> and <C-x> work on decimal numbers
set display+=lastline

" ========== Status bar ========== "
set cmdheight=2                 " Height of command bar.
set laststatus=2                " Always show status line.
set ruler                       " Always show current cursor position.
set showcmd                     " Always show command bar.
set wildmenu                    " Turn on WiLd menu.
set showmode                    " Show current mode.
"set cursorline                  " Highlight current line.

"if version >= 700               " Highlight statusbar in insert mode.
  "au InsertEnter * hi StatusLine ctermfg=235 ctermbg=2
  "au InsertLeave * hi StatusLine ctermbg=240 ctermfg=12
"endif

" ========== Searching ========== "
set ignorecase          " Ignore case when searching.
set smartcase           " Be smart about case when searching.
set incsearch           " Incremental searching.
set hlsearch            " Highlight search phrase.

" ========== Tabs and indents ========== "
set autoindent      " Auto indent
set backspace=indent,eol,start  " Configure backspace to work properly.
set smarttab        " Smart tabs.
set expandtab       " Use spaces instead of tabs.
set shiftwidth=4    " Number of spaces for autoindent.
set softtabstop=4   " Number of spaces a tab counts for (when editing).
set tabstop=4       " Number of spaces a tab counts for (in a file).
set wrap            " Wrap lines that are longer than the window.

"================================================
" Colors and fonts
"================================================

syntax on               " Turn on syntax highlighting.
syntax enable

" ========== Solarized theme ========== "

"set background=dark
"colorscheme base16-railscasts

"================================================
" Navigation, tabs and windows
"================================================

" Map leader to ,
let mapleader=","

" Map JK to Escape key
:imap jk <Esc>

" Go to next line even if wrapped.
nnoremap j gj
nnoremap k gk

" Clear search highlighting
nnoremap <silent> <Leader>/ :nohlsearch<CR>

"================================================
" Vundle configuration
"================================================

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle
" Required
Plugin 'gmarik/vundle'

" ========== Bundles ========== "

"Plugin 'scrooloose/nerdcommenter'
"Plugin 'tpope/vim-surround'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'

" Better syntax
"Plugin 'cakebaker/scss-syntax.vim'
"Plugin 'pangloss/vim-javascript'

" Vim snimpate and dependencies
"Plugin 'MarcWeber/vim-addon-mw-utils'
"Plugin 'tomtom/tlib_vim'
"Plugin 'garbas/vim-snipmate'
"Plugin 'honza/vim-snippets'

call vundle#end()
filetype plugin indent on       " Required for Vundle
filetype plugin on

"================================================
" Plugin config
"================================================

" ========== CtrlP ========== "

"let g:ctrlp_show_hidden = 1
