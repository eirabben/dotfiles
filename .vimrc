
"""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""

" Turn off compatible mode
set nocompatible

" Sets number of lines of history to remember
set history=500

" Set to autoread file when it is changed outside of VIM
set autoread

" Buffer becomes hidden when abandoned
set hidden

"""""""""""""""""""""""""""""""""""""""""""""""""
" User interface
"""""""""""""""""""""""""""""""""""""""""""""""""

" Turn on WiLd menu
set wildmenu

" Always show current position
set ruler

" Always show command bar
set showcmd

" Height of command bar
set cmdheight=2

" Always show status line
set laststatus=2

" Always show line numbers
set number

" Highlight current line 
set cursorline

" Configure backspace
set backspace=eol,start,indent

" Show matching bracket when cursor is on one
set showmatch

"---Searching---"

" Ignore case when searching
set ignorecase

" Be smart about case when searching
set smartcase

" Incremental searching
set incsearch

" Highlight search phrase
set hlsearch

"""""""""""""""""""""""""""""""""""""""""""""""""
" Colors and fonts
"""""""""""""""""""""""""""""""""""""""""""""""""

" Turn on syntax highlighting
syntax on

"""""""""""""""""""""""""""""""""""""""""""""""""
" Text, tabs and indents
"""""""""""""""""""""""""""""""""""""""""""""""""

" Spaces instead of tabs
" set expandtab

" Smart tabs
set smarttab

" Set tab length
set shiftwidth=4
set tabstop=4

" Indenting
set autoindent
set smartindent
set wrap

"""""""""""""""""""""""""""""""""""""""""""""""""
" Navigation, tabs and windows
"""""""""""""""""""""""""""""""""""""""""""""""""

" Map JK to Escape key
:imap jk <Esc>

