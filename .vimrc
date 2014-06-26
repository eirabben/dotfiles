
" Use vim settings instead of Vi settings to enable functionality.
" This must always be first.
set nocompatible
filetype on                     " Fix problem with filetype off with git
filetype off                    " Required for Vundle

"================================================
" General
"================================================

set history=500                 " Remember 500 lines of history.
set autoread                    " Autoread files when changed outside of Vim.
set hidden                      " Buffer becomes hidden when abandoned instead of unloaded.
set backspace=eol,start,indent  " Configure backspace to work properly.
set backupdir=~/.vim_tmp
set directory=~/.vim_tmp

"================================================
" User interface
"================================================

" set number                    " Always show line numbers.
set relativenumber              " Show relative line numbers.
set showmatch                   " Show matching bracket when cursor is on one.
set mat=2                       " How many tenths of a second to blink when matching brackets.
set scrolloff=8                 " Minimum lines above/below cursor.
set colorcolumn=80              " Line length marker
set gcr=a:blinkon0              " Disable cursor blink.
set visualbell                  " Turn off sounds.
set splitbelow                  " Horizontal splits below.
set splitright                  " Vertical splits to the right.
set nrformats=hex               " Let <C-a> and <C-x> work on decimal numbers

" ========== Status bar ========== "
set wildmenu                    " Turn on WiLd menu.
set ruler                       " Always show current cursor position.
set showcmd                     " Always show command bar.
set showmode                    " Show current mode.
set cmdheight=2                 " Height of command bar.
set laststatus=2                " Always show status line.
set cursorline                  " Highlight current line.

if version >= 700               " Highlight statusbar in insert mode.
  au InsertEnter * hi StatusLine ctermfg=235 ctermbg=2
  au InsertLeave * hi StatusLine ctermbg=240 ctermfg=12
endif

" ========== Searching ========== "
set ignorecase          " Ignore case when searching.
set smartcase           " Be smart about case when searching.
set incsearch           " Incremental searching.
set hlsearch            " Highlight search phrase.

" ========== Tabs and indents ========== "
set autoindent      " Auto indent
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

" ========== Theme ========== "
set t_Co=256
set background=dark
colorscheme base16-railscasts

highlight clear SignColumn
highlight VertSplit    ctermbg=236
highlight ColorColumn  ctermbg=237
highlight LineNr       ctermbg=236 ctermfg=240
highlight CursorLineNr ctermbg=236 ctermfg=240
highlight CursorLine   ctermbg=236
highlight StatusLineNC ctermbg=238 ctermfg=0
highlight StatusLine   ctermbg=240 ctermfg=12
highlight IncSearch    ctermbg=0   ctermfg=3
highlight Search       ctermbg=0   ctermfg=9
highlight Visual       ctermbg=3   ctermfg=0
highlight Pmenu        ctermbg=240 ctermfg=12
highlight PmenuSel     ctermbg=0   ctermfg=3
highlight SpellBad     ctermbg=0   ctermfg=1
highlight ModeMsg      ctermbg=0   ctermfg=4

"================================================
" Navigation, tabs and windows
"================================================

" Map leader to ,
let mapleader=","

" Map JK to Escape key
:imap jk <Esc>

" Clear search highlighting
nnoremap <silent> <Leader>/ :nohlsearch<CR>

" Make new line after current line without entering insert mode
nmap <S-Enter> o<Esc>

"================================================
" Vundle configuration
"================================================

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Let Vundle manage Vundle
" Required
Bundle 'gmarik/vundle'

" ========== Bundles ========== "

Bundle 'scrooloose/nerdcommenter'
Bundle 'tpope/vim-surround'
Bundle 'kien/ctrlp.vim'
let g:ctrlp_show_hidden = 1

filetype plugin indent on       " Required for Vundle
filetype plugin on




