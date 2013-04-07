execute pathogen#infect()
syntax on
filetype plugin indent on

set ts=2 sts=2 sw=2 expandtab

"Better leader key for a spanish layout
let mapleader = ","

set nocompatible
set modelines=0
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
set scrolloff=3
set history=1000
set undolevels=1000
set nobackup
set noswapfile
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set relativenumber
set undofile
set gdefault
set wrap
set textwidth=79
set formatoptions=qrnl
set colorcolumn=85
set autowrite

au FocusLost * :wa

"Fast window switching
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"Removes search highlight when you're done with it
nmap <silent> ,/ :nohlsearch<CR>

"In case I forget to use sudo when editing a system file
cmap w!! w !sudo tee % > /dev/null

set encoding=utf-8

set laststatus=2

set t_Co=256

if has("gui_running")
  set lines=40
  colorscheme slate
  set guioptions-=T
  set guioptions-=l
  set guioptions-=r
  set guioptions-=b
  set guioptions-=m
  set guifont=Anonymous\ Pro\ 8
else
  colorscheme tir_black
endif

nnoremap <leader>w <C-w>v<C-w>l

"Yankring maps
nnoremap <silent> <F3> :YRShow<CR>
inoremap <silent> <F3> <ESC>:YRShow<CR>


"Ctags
let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_WinWidth = 50
map <F4> :TlistToggle<cr>
map <F8> :!/usr/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
