"=================================================
" Defaults 
"=================================================

set hidden " Default is off
set number relativenumber " Enable line numbers
set scrolloff=5 " Padding betwewn cursor and top/bottom
set cursorline " Highlight current line
" set splitbelow " New windows below current one
set splitright " New windows to the right of current one
" set linebreak " Don't split words when breaking lines
set cmdheight=2 " Always show command line
set updatetime=300
set shortmess+=c
" set signcolumn=yes " Show sign column all the time, so it doesn't jump when signs are shown
set ignorecase " Ignore case when searching
set smartcase " Override ignorecase if search term contains uppercase letters

"=================================================
" Indentation
"=================================================

set tabstop=2 " Number of spaces that a tab counts for
set softtabstop=2 " Number of spaces that a tab counts for when editing
set shiftwidth=2 " Number of spaces to use for autoindent
set expandtab " Use spaces instead of tabs
set smartindent

"=================================================
" Key mappings
"=================================================

" Map leader to comma
let mapleader=','

" Use jk to escape insert mode
imap jk <Esc>

" Next and previous line includes wrapped lines
nnoremap j gj
nnoremap k gk

" Clear search highlight
nnoremap <silent> <leader>/ :nohlsearch<CR>

" Faster tab and split navigation
nnoremap <silent> <leader>t :tabedit<CR>
nnoremap <silent> <leader>v :vsplit<CR>
nnoremap <silent> <leader>h :split<CR>

"=================================================
" Commands
"=================================================

:command FormatJson %!jq " Requires jq

"=================================================
" Plugins
"=================================================

call plug#begin()

" Plug 'tpope/vim-repeat' " Repeat plugin actions
" Plug 'tpope/vim-surround' " Surround things
" Plug 'tomtom/tcomment_vim' " Better commenting
" Plug 'jiangmiao/auto-pairs' " Automatic pair closing
" Plug 'sheerun/vim-polyglot' " Syntax packages
" Plug 'mattn/emmet-vim' " HTML and CSS expansion
" Plug 'christoomey/vim-tmux-navigator'
" Plug 'honza/vim-snippets'
" Plug 'yggdroot/indentline'

" Plug 'neoclide/coc.nvim', {'branch': 'release'}



" Colors
Plug 'embark-theme/vim', { 'as': 'embark' }
" Plug 'chriskempson/base16-vim'
"
" Plug 'itchyny/lightline.vim'
"
" Plug 'tpope/vim-fugitive'
"
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'


" Experiments
Plug 'terrortylor/nvim-comment'
require('nvim_comment').setup()


call plug#end()

"=================================================
" Colorscheme
"=================================================

set termguicolors
colorscheme embark
" set background=light

"=================================================
" Plugin config
"=================================================

"Emmet
" imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

"CHADTree
" nnoremap <c-b> <cmd>CHADopen<cr>

" Lightline
" set noshowmode
" let g:lightline = {
"       \ 'colorscheme': 'embark',
"       \ }
" let g:lightline.separator = { 'left': "", 'right': "" }
" let g:lightline.tabline_separator = { 'left': "", 'right': "" }
" let g:lightline.tabline_subseparator = { 'left': "/", 'right': "/" }
" let g:lightline.subseparator = { 'left': '\\', 'right': '\\' }

" INdentLine
" let g:indentLine_char = '|'

" CoC

" :nmap <c-b> :CocCommand explorer<CR>

" use <tab> for trigger completion and navigate to the next complete item
" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~ '\s'
" endfunction
"
" inoremap <silent><expr> <Tab>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<Tab>" :
"       \ coc#refresh()
"
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"


" FZF {{
" nnoremap <c-p> :Files<cr>
" nnoremap <silent> <C-t> :Ag <cr>

" Twig
" This is a fix for tcomment, which does not use twig style comments when
" the file consists of mixed html and twig code
" autocmd FileType html.twig setlocal commentstring=\{#%s#\}
" autocmd FileType html.twig TComment
" autocmd FileType html.twig TComment
" autocmd FileType html.twig let g:tcomment#filetype#map['html.twig'] = 'twig'

" Scan syntax from start in vue files to avoid syntax highlighting errors
" autocmd FileType vue syntax sync fromstart
" let g:vue_disable_pre_processors=1

