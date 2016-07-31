" UI options
syntax on " Use syntax highlighting
set number " Always show line numbers
" set relativenumber " Use relative numbering
set scrolloff=5 " Minimum number of screen lines above or below the cursor
set cursorline " Hightlight the current line
set colorcolumn=80 " Highlight where the line should end
set splitbelow " New windows will be put below the current one
set splitright " New windows will be put to the right of the current one
set linebreak " Don't split words when breaking lines

" Status line
set cmdheight=2 " Number of screen lines to use for command line
set ruler " Show current cursor position

" Indentation
set expandtab " Use spaces instead of <Tab>
set tabstop=4 " Number of spaces that a <Tab> counts for
set softtabstop=4 " Number of spaces that a <Tab> counts for when editing
set shiftwidth=4 " Number of spaces to use for (auto)indent

" Indentation by file type
autocmd FileType html setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType css setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType scss setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType lua setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2

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
" Clear search highlight
nnoremap <silent> <Leader>/ :nohlsearch<CR>

" Colorscheme
set background=dark
let g:onedark_termcolors=256
let g:onedark_terminal_italics=1
colorscheme onedark

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Plugins
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree' " Sidebar and file browser
Plug 'tpope/vim-commentary' " Commenting
Plug 'tpope/vim-repeat' " Repeat plugin actions
Plug 'tpope/vim-surround' " Surround things
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " Fuzzy finder
Plug 'junegunn/fzf.vim'
Plug 'rstacruz/vim-closer' " Auto close braces, but only when pressing <CR>
Plug 'tikhomirov/vim-glsl' " GLSL syntax
Plug 'nelsyeung/twig.vim' " Twix syntax
" Plug 'Shougo/deoplete.nvim' " Completion
" Plug 'benekastah/neomake' " Linting
Plug 'mattn/emmet-vim' " HTML and CSS expansion

call plug#end()

" NERDTree
map <C-b> :NERDTreeToggle<CR>
let NERDTreeMapActivateNode='l'
let NERDTreeMapCloseDir='h'
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.DS_Store', '\config.codekit', '\.sass-cache']

" Deoplete
" let g:deoplete#enable_at_startup = 1

" GLSL.vim
let g:glsl_file_extensions = '*.glsl,*.vsh,*.fsh,*.vert,*.frag'

" FZF
nnoremap <c-p> :Files<cr>
nnoremap <silent> <C-p> :FZF -m<cr>
let g:fzf_action = {'ctrl-s': 'split', 'ctrl-v': 'vsplit'}

" Neomake
" autocmd! BufWritePost * Neomake
" let g:neomake_open_list = 2
" let g:neomake_cpp_clang_args = ['--std=c++14']
