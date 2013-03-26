execute pathogen#infect()
syntax on
filetype plugin indent on

colorscheme molokai

set guifont=Anonymous\ Pro\ 11

set ts=2 sts=2 sw=2 expandtab

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

noremap h <NOP>
noremap j <NOP>
noremap k <NOP>
noremap l <NOP>

let mapleader = ","

set nowrap
set backspace=indent,eol,start
set autoindent
set copyindent
set number
set showmatch
set ignorecase
set smartcase
set hlsearch
set incsearch

set history=1000
set undolevels=1000
set nobackup
set noswapfile

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

nmap <silent> ,/ :nohlsearch<CR>

cmap w!! w !sudo tee % > /dev/null
