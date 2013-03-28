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

"Enable HardMode
autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()
nnoremap <leader>h <Esc>:call ToggleHardMode()<CR>

set encoding=utf-8

set laststatus=2

set t_Co=256

if has("gui_running")
  set lines=40
  colorscheme slate
  set guioptions-=T
else
  colorscheme molokai
endif

nnoremap <leader>w <C-w>v<C-w>l
