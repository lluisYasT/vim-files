set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle, required
Bundle 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails.git'
Plugin 'tpope/vim-commentary.git'
Plugin 'tpope/vim-dispatch.git'
Plugin 'tpope/vim-sensible.git'
Plugin 'tpope/vim-git.git'
Plugin 'tpope/vim-unimpaired.git'
Plugin 'tpope/vim-vinegar.git'
Plugin 'tpope/vim-obsession.git'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'mattn/emmet-vim'
Plugin 'mattn/gist-vim'
Plugin 'amdt/vim-niji'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/snipmate-snippets'
Plugin 'msanders/snipmate.vim'
Plugin 'jamessan/vim-gnupg'
"Plugin 'Valloric/MatchTagAlways'
Plugin 'bling/vim-airline'
Plugin 'airblade/vim-gitgutter'
Plugin 'Shougo/neocomplete.vim'
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'
Plugin 'altercation/vim-colors-solarized'
Plugin 'sheerun/vim-polyglot'
Plugin 'morhetz/gruvbox'

Plugin 'L9'
Plugin 'FuzzyFinder'

Plugin 'NLKNguyen/papercolor-theme'
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
colorscheme gruvbox
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

if has("gui_macvim")
	colorscheme solarized
	set guifont=Source\ Code\ Pro:h11
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

"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

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
