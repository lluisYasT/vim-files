execute pathogen#infect()
syntax on
filetype plugin indent on

set ts=2 sts=2 sw=2
"set expandtab "Use spaces instead of tabs

"Better leader key for a spanish layout
"let mapleader = ","

set nocompatible
set modelines=0
set nowrap
set copyindent
set number
"set ignorecase
set smartcase
set hlsearch
set undolevels=1000
set nobackup
set nowritebackup
set noswapfile
set showmode
set hidden
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set relativenumber
set gdefault
set wrap
set textwidth=79
set formatoptions=qrnl
"set colorcolumn=85
set autowrite

au FocusLost * :wa

"Fast window switching
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"In case I forget to use sudo when editing a system file
cmap w!! w !sudo tee % > /dev/null

set t_Co=256 

colorscheme ir_black

if has("gui_running")
  set lines=55
  set guioptions-=T
  set guioptions-=l
  set guioptions-=r
  set guioptions-=b
  "set guioptions-=m
	set guifont=Source\ Code\ Pro\ Medium\ 8
	colorscheme pyte
endif

if has("gui_macvim")
	set guifont=Source\ Code\ Pro:h12
endif

"call togglebg#map("<F5>")

nnoremap <leader>w <C-w>v<C-w>l

"Yankring maps
nnoremap <silent> <F3> :YRShow<CR>
inoremap <silent> <F3> <ESC>:YRShow<CR>


"Ctags
let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_WinWidth = 50
map <F4> :TlistToggle<cr>
map <F8> :!/usr/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"

"Sentences end with two spaces instead of one after .
"set cpo+=J


"If the only window left open is NERDTRee, close vim
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
"
"Map F1 to NERDTree
nnoremap <silent> <F1> :NERDTreeToggle<CR>

map <F6> :setlocal spell! spelllang=es<CR>

""""""""""""""""""""""""""""""""
"		GnuPG Extensions		"
""""""""""""""""""""""""""""""""

" Tell the GnuPG plugin to armor new files.
let g:GPGPreferArmor=1

" Tell the GnuPG plugin to sign new files.
let g:GPGPreferSign=1

augroup GnuPGExtra
" Set extra file options.
	autocmd BufReadCmd,FileReadCmd *.\(gpg\|asc\|pgp\) call SetGPGOptions()
" Automatically close unmodified files after inactivity.
	autocmd CursorHold *.\(gpg\|asc\|pgp\) quit
augroup END

function SetGPGOptions()
" Set updatetime to 1 minute.
	set updatetime=60000
" Fold at markers.
	set foldmethod=marker
" Automatically close all folds.
	set foldclose=all
" Only open folds with insert commands.
	set foldopen=insert
endfunction

" Yank WORD to system clipboard in normal mode
nmap <leader>y "+yE

" Yank selection to system clipboard in visual mode
vmap <leader>y "+y

" PW Generation :r!pwgen -sy 24 1

" Decrease Window Size with _
nmap _ <C-w>-
" Increase Window size with +
nmap + <C-w>+

let g:signify_vcs_list = ['git']

" Very Magic regexes always
nnoremap / /\v
vnoremap / /\v
