" ':help $option' displays how to use

"Display a row-number
set number 

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

