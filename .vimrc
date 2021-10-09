" ':help $option' displays how to use

"------------------------------------------------
" General
"------------------------------------------------

" Don't create a swap file
set noswapfile
" Display line numbers
set number

"------------------------------------------------
" Mouse operation
"------------------------------------------------

set mouse=a
set clipboard&
set clipboard^=unnamedplus
set ttymouse=xterm2

"------------------------------------------------
" Syntax
"------------------------------------------------

" Syntax highlighting
syntax on
" ColorScheme
colorscheme koehler
" Overwrite color in the Terminal,'cterm',
highlight Comment ctermfg=Cyan

"------------------------------------------------
" Search
"------------------------------------------------

" Incremental search
set incsearch
" Highlighting the text matching the pattern
set hlsearch
" Highlighting the opposite of a bracket & jump there by '%'
set showmatch
" Ignorecase when searching in lowercase
set ignorecase
set smartcase

"------------------------------------------------
" Tab
"------------------------------------------------

" Inherit the previous indent level
set autoindent
" Auto indent for {}
set smartindent
" Insert space instead of tab
set expandtab
" Set a number of space in case 'tab' pushed
set tabstop=2
" Set a number of space in case '<<' or '>>' pushed
set shiftwidth=2

"------------------------------------------------
" Bar
"------------------------------------------------

" Display a menu-bar at command line
set wildmenu
" Display a status-bar (2: always)
set laststatus=2

"------------------------------------------------
" Key bindings
"------------------------------------------------

" Move to the other window"
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Auto completion
"inoremap ( ()<LEFT>
"inoremap [ []<LEFT>
"inoremap { {}<LEFT>
"inoremap < <><LEFT>
"inoremap ' ''<LEFT>
"inoremap " ""<LEFT>
"inoremap ` ``<LEFT>

" Emacs-like key bindings in the insert mode
imap <C-p> <Up>
imap <C-n> <Down>
imap <C-b> <Left>
imap <C-f> <Right>
imap <C-a> <HOME>
imap <C-e> <End>
imap <C-d> <Del>
imap <C-h> <BS>

" Escape key"
imap jj <ESC>
