" UI options
syntax on " Syntax highlighting
set number " Alsays show line numbers
set relativenumber " Relative line numbers
set scrolloff=5 " Padding betwewn cursor and top/bottom
set cursorline " Highlight current line
" set colorcolumn=80 " Highlight column length
set splitbelow " New windows below current one
set splitright " New windows to the right of current one
set linebreak " Don't split words when breaking lines
set nobackup " Don't backup
set nowritebackup

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
autocmd FileType blade setlocal shiftwidth=2 tabstop=2 softtabstop=2

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

Plug 'neoclide/coc.nvim', {'branch': 'release'} " Intellisense

Plug 'tomtom/tcomment_vim' " Better commenting
Plug 'tpope/vim-repeat' " Repeat plugin actions
Plug 'tpope/vim-surround' " Surround things
Plug 'jiangmiao/auto-pairs' " Automatic pair closing

" Plug 'mattn/emmet-vim' " HTML and CSS expansion
Plug 'sheerun/vim-polyglot' " Syntax packages

" Plug 'prettier/vim-prettier', {
"   \ 'do': 'yarn install',
"   \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

call plug#end()


" Prettier
" let g:prettier#autoformat = 0
" autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync


" Emmet
" imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

" NERDTree
map <C-b> :NERDTreeToggle<CR>
let NERDTreeMapActivateNode='l'
let NERDTreeMapCloseDir='h'
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.DS_Store', '\config.codekit', '\.sass-cache']

" FZF
nnoremap <c-p> :Files<cr>
nnoremap <silent> <C-p> :FZF -m<cr>
nnoremap <silent> <C-t> :Ag <cr>
let g:fzf_action = {'ctrl-s': 'split', 'ctrl-v': 'vsplit'}

" Twig
" This is a fix for tcomment, which does not use twig style comments when
" the file consists of mixed html and twig code
autocmd FileType html.twig setlocal commentstring=\{#%s#\}
autocmd FileType html.twig TComment
autocmd FileType html.twig TComment
autocmd FileType html.twig let g:tcomment#filetype#map['html.twig'] = 'twig'
" Blade comments
let g:tcomment#filetype#guess_blade=0

" Scan syntax from start in vue files to avoid syntax highlighting errors
autocmd FileType vue syntax sync fromstart
let g:vue_disable_pre_processors=1

" Coc Autocomplete
inoremap <silent><expr> <Tab> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<Tab>"

" hi Pmenu ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi PmenuSel ctermbg=234 cterm=NONE guifg=NONE guibg=#44475a gui=NONE

