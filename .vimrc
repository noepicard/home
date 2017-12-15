"""""""""""""""""""""""""""""""""""""""""""""""""""
"         __  ___         _                       "
"      /\ \ \/ _ \ __   _(_)_ __ ___  _ __ ___    "
"     /  \/ / /_)/ \ \ / / | '_ ` _ \| '__/ __|   "
"    / /\  / ___/   \ V /| | | | | | | | | (__    "
"    \_\ \/\/        \_/ |_|_| |_| |_|_|  \___|   "
"                                                 "
"""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""
"                                "
"     Plugins initialization     "
"                                "
""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Shougo/neocomplete'
Plug 'scrooloose/nerdcommenter'
Plug 'Raimondi/delimitMate'
Plug 'rhysd/vim-grammarous'
Plug 'Konfekt/vim-DetectSpellLang'
Plug 'lervag/vimtex'

call plug#end()



""""""""""""""""""""""""""""""""""
"                                "
"    General configuration       "
"                                "
""""""""""""""""""""""""""""""""""
set mouse=
set ttymouse=
set laststatus=2
set ttyfast
set timeout timeoutlen=3000 ttimeoutlen=10
set title
set cursorline
set number relativenumber
set hidden
set tabstop=4 shiftwidth=4 expandtab
set textwidth=0
set wrapmargin=0
set encoding=utf-8
set showcmd
set clipboard=unnamedplus
set list
set showbreak=↪\ 
set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨
set background=dark
set termguicolors
set wildmenu
set wildmode=longest:full,full

if has("gui_running")
    set guifont=Hack\ 11
    set guioptions-=r
    set guioptions-=L
    set guioptions-=T
    set guioptions-=m
endif

call matchadd('ColorColumn', '\%101v') "highlight the 101nth character

let mapleader = ","
let maplocalleader = ";"

augroup latex-filetype
    au!
    au FileType tex set shiftwidth=2
    au FileType tex set textwidth=100
    au FileType tex set foldmethod=expr
    au FileType tex set foldexpr=vimtex#fold#level(v:lnum)
    au FileType tex set foldtext=vimtex#fold#text()
    au FileType tex set fillchars+=fold:\ 
    "au FileType tex setlocal fo=aw2tq
    au FileType tex setlocal spell
augroup END

au FileType nerdtree setlocal nolist

au FileType qf setlocal nowrap 



""""""""""""""""""""""""""""""""""
"                                "
"     Plugins configuration      "
"                                "
""""""""""""""""""""""""""""""""""
let g:gruvbox_italic = 1
let g:gruvbox_color_column = 'red'
let g:gruvbox_vert_split = 'bg3'

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_theme='gruvbox'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_min_count = 2

let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1

let g:tex_flavor = 'latex'
let g:tex_comment_nospell=1
let g:vimtex_view_method = 'zathura'
let g:vimtex_quickfix_mode=2
let g:vimtex_complete_enabled=1
let g:vimtex_fold_enable=1
let g:vimtex_fold_manual=1
let g:vimtex_quickfix_open_on_warning=0
let g:vimtex_complete_close_braces=1
if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.tex = g:vimtex#re#neocomplete
let g:vimtex_compiler_latexmk = {
            \ 'build_dir' : 'out',
            \}

let g:guesslang_langs = ['en_us', 'fr']



""""""""""""""""""""""""""""""""""
"                                "
"       Mapping                  "
"                                "
""""""""""""""""""""""""""""""""""
" Disable Arrow keys in Escape mode
noremap <up> <Nop>
noremap <down> <Nop>
noremap <left> <Nop>
noremap <right> <Nop>

" Disable Arrow keys in Insert mode
inoremap <up> <Nop>
inoremap <down> <Nop>
inoremap <left> <Nop>
inoremap <right> <Nop>

" Disable the annoying mouse wheel in gnome-terminal
noremap <ScrollWheelUp> <Nop>
noremap <S-ScrollWheelUp> <Nop>
noremap <ScrollWheelDown> <Nop>
noremap <S-ScrollWheelDown> <Nop>

noremap <silent> <C-S> :update<CR>
vnoremap <silent> <C-S> <C-C>:update<CR>
inoremap <silent> <C-S> <C-O>:update<CR>

" Add line above or below the current line without entering the insert mode
nnoremap <CR> o<ESC>
nnoremap <Leader><CR> O<ESC>

" Scroll the viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>
nnoremap e 3<C-e>
nnoremap y 3<C-y>

" Delete to the black hole register (thus not cutting)
nnoremap <Leader>d "_d
vnoremap <Leader>d "_d

" Go to the end of the line in insert mode
inoremap <C-A> <Esc>A

nnoremap <F3> :nohlsearch<CR>

nnoremap <C-n> :NERDTreeToggle<CR>

" Plugin key-mappings.
inoremap <expr> <C-g> neocomplete#undo_completion()
inoremap <expr> <C-l> neocomplete#complete_common_string()
inoremap <expr> <Nul> neocomplete#start_manual_complete()
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr> <BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <silent> <CR> <C-r>=<SID>neocomplete_cr_function()<CR>

function! s:neocomplete_cr_function() abort
    return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction

nnoremap  <C-^>
nnoremap <Leader>l :ls<CR>
nnoremap <Leader>b :bp<CR>
nnoremap <Leader>f :bn<CR>

""""""""""""""""""""""""""""""""""
"                                "
"       Other config             "
"                                "
""""""""""""""""""""""""""""""""""
colorscheme gruvbox

if !has("gui_running")
    " Set the highlighting for spell error (necessary due to the termguicolors)
    hi SpellBad term=underline cterm=underline gui=undercurl
    hi SpellCap term=reverse cterm=reverse gui=undercurl
    hi SpellLocal term=underline cterm=underline gui=undercurl
    hi SpellRare term=reverse cterm=reverse gui=undercurl
endif
