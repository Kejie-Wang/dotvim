""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" ===> Options
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" enable file number display
set nu

" disable compatible
set nocompatible

" disable highlight search
set nohlsearch

" tab setting
set tabstop=2 "set tab display width
set expandtab "use space to replace tab
set shiftwidth=2 "set the autoindent width
set softtabstop=2

"set backspace=2

"
set bg=dark

" set encoding utf 8
set encoding=utf-8

set cmdheight=2

" coc.nvim
set nobackup
set nowritebackup
set shortmess+=c
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" ===> Syntax
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" ===> Key mapping 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" move between windows.
"map <C-j> <C-W>j
"map <C-k> <C-W>k
"map <C-h> <C-W>h
"map <C-l> <C-W>l

" move between tabs.
nnoremap ( :tabp <cr>
nnoremap ) :tabn <cr>

let mapleader=","
