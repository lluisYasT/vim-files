set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


" Let Vundle manage Vundle, required
Bundle 'VundleVim/Vundle.vim'

Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails.git'
Plugin 'tpope/vim-commentary.git'
Plugin 'tpope/vim-dispatch.git'
Plugin 'tpope/vim-git.git'
Plugin 'tpope/vim-unimpaired.git'
Plugin 'tpope/vim-vinegar.git'
Plugin 'tpope/vim-obsession.git'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'mattn/emmet-vim'
Plugin 'mattn/gist-vim'
Plugin 'raymond-w-ko/vim-niji'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/snipmate-snippets'
Plugin 'msanders/snipmate.vim'
Plugin 'jamessan/vim-gnupg'
Plugin 'Valloric/MatchTagAlways'
Plugin 'tpope/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'airblade/vim-gitgutter'
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'
Plugin 'altercation/vim-colors-solarized'
Plugin 'sheerun/vim-polyglot'
Plugin 'morhetz/gruvbox'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

Plugin 'L9'
Plugin 'FuzzyFinder'

Plugin 'NLKNguyen/papercolor-theme'

Plugin 'digitaltoad/vim-pug.git'

Plugin 'dracula/vim'
Plugin 'elzr/vim-json'
Plugin 'pangloss/vim-javascript'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'pearofducks/ansible-vim'

Plugin 'ycm-core/YouCompleteMe'

call vundle#end()
filetype plugin indent on
syntax on

set ts=2 sts=2 sw=2
set expandtab "Use spaces instead of tabs


set modelines=0
set nowrap
set copyindent
set number
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
set gdefault
set wrap
set textwidth=79
set formatoptions=qrnl
"set colorcolumn=85
set autowrite
set history=200

"au FocusLost * :wa

"Fast window switching
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"In case I forget to use sudo when editing a system file
cmap w!! w !sudo tee % > /dev/null

set t_Co=256

set background=dark
let g:dracula_colorterm = 0
colorscheme dracula
call togglebg#map("<F5>")

if has("gui_running")
  set lines=55
  set guioptions-=T
  set guioptions-=l
  set guioptions-=r
  set guioptions-=b
  set guioptions-=m
	set guifont=Consolas\ 10
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

set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"

"Sentences end with two spaces instead of one after .
"set cpo+=J


map <F6> :setlocal spell! spelllang=es<CR>
map <F7> :setlocal spell! spelllang=en<CR>

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

let g:airline_powerline_fonts = 1


" Clear the last search
"nnoremap <esc> :noh<return><esc>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

runtime macros/matchit.vim


set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_perl_checkers = ['perl']
let g:syntastic_enable_perl_checker = 1

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/snipmate-snippets/'

let g:indent_guides_enable_on_vim_startup = 0
let g:indent_guides_auto_colors = 0
let g:indent_guides_guide_size = 1
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=blue   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4

autocmd Filetype markdown map <F5> :!pandoc<space><C-r>%<space>-o<space><C-r>%.pdf<Enter><Enter>
autocmd Filetype rmd map <F5> :!echo<space>"require(rmarkdown);<space>render('<c-r>%')"<space>\|<space>R<space>--vanilla<enter>
let g:ansible_attribute_highlight = 'ab'
let g:ansible_name_highlight = 'b'
let g:ansible_extra_keywords_highlight = 1
