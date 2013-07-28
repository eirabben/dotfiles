
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

" Highlight statusbar in insert mode
if version >= 700
  au InsertEnter * hi StatusLine ctermfg=235 ctermbg=2
  au InsertLeave * hi StatusLine ctermbg=240 ctermfg=12
endif

"---Searching---"

" Ignore case when searching
set ignorecase

" Be smart about case when searching
set smartcase

" Incremental searching
set incsearch

" Highlight search phrase
set hlsearch

" Minimum lines above/below cursor
set scrolloff=4

"""""""""""""""""""""""""""""""""""""""""""""""""
" Colors and fonts
"""""""""""""""""""""""""""""""""""""""""""""""""

" Turn on syntax highlighting
syntax on

" Use Railscasts theme
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

"""""""""""""""""""""""""""""""""""""""""""""""""
" Text, tabs and indents
"""""""""""""""""""""""""""""""""""""""""""""""""

" Spaces instead of tabs
set expandtab

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

