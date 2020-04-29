" ':help $option' displays how to use

" Don't create a swap file
set noswapfile

" Display a row-number
set number 

" Can operate with a mouse
set mouse=a
set clipboard&
set clipboard^=unnamedplus

" [ Syntax ]
" Highlighting syntax
syntax on
" ColorScheme
colorscheme koehler
" Overwrite color in the Terminal,'cterm',
highlight Comment ctermfg=Cyan

"[ Search ]
" Incremental search
set incsearch
" Highlighting match pattern
set hlsearch
" Highlighting the opposite of a bracket & jump there by '%'
set showmatch
" Ignorecase in case of search with lowercase
set ignorecase
set smartcase

"[ Tab ]
" Inherit indent level of the previous row
set autoindent
" Auto indent for {}
set smartindent
" Insert space instead of tab
set expandtab
" Set a number of space in case 'tab' pushed
set tabstop=2
" Set a number of space in case '<<' or '>>' pushed
set shiftwidth=2

"[ Bar ]
" Display a menu-bar at command line
set wildmenu
" Display a status-bar (2: always)
set laststatus=2

"[ Key bind ]
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

" Emacs when in insert mode
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

