execute pathogen#infect()
syntax on
filetype plugin indent on

set ts=2 sts=2 sw=2 expandtab

"Better leader key for a spanish layout
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

