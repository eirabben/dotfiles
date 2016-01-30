" UI options
syntax on " Use syntax highlighting
set number " Always show line numbers
" set relativenumber " Use relative numbering
set scrolloff=5 " Minimum number of screen lines above or below the cursor
" set cursorline " Hightlight the current line
" set colorcolumn=80 " Highlight where the line should end
set splitbelow " New windows will be put below the current one
set splitright " New windows will be put to the right of the current one

" Status line
set cmdheight=2 " Number of screen lines to use for command line
set ruler " Show current cursor position

" Indentation
set expandtab " Use spaces instead of <Tab>
set tabstop=4 " Number of spaces that a <Tab> counts for
set softtabstop=4 " Number of spaces that a <Tab> counts for when editing
set shiftwidth=4 " Number of spaces to use for (auto)indent

" Search options
set ignorecase " Ignore case when searching
set smartcase " Override ignorecase if search pattern contains upper case characters

" Clipboard options
set clipboard+=unnamed " Yank to clipboard

" Key mappings
" Use jk to exit insert mode
imap jk <Esc>
" Map leader to comma 
let mapleader=',' 
" Next and previous line includes wrapped lines
nnoremap j gj
nnoremap k gk

" Colorscheme


" Plugins
" call plug#begin()
" Example command:
" Plug 'scrooloose/nerdree'
" call plug#end()

