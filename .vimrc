"""""""""""""""""""""""""""""""""""""""""""""""""""
"                    _                     __     "
"       ____  ____  (_)________ __________/ /     "
"      / __ \/ __ \/ / ___/ __ `/ ___/ __  /      "
"     / / / / /_/ / / /__/ /_/ / /  / /_/ /       "
"    /_/ /_/ .___/_/\___/\__,_/_/   \__,_/        "
"         /_/                                     "
"                                                 "
"""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""
"                                "
"     Plugins initialization     "
"                                "
""""""""""""""""""""""""""""""""""
"{{{
call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'wincent/pinnacle'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'itchyny/lightline.vim'
Plug 'ap/vim-buftabline'
Plug 'Shougo/neocomplete'
Plug 'scrooloose/nerdcommenter'
Plug 'jiangmiao/auto-pairs'
Plug 'rhysd/vim-grammarous'
Plug 'Konfekt/vim-DetectSpellLang'
Plug 'lervag/vimtex'

call plug#end()
"}}}



""""""""""""""""""""""""""""""""""
"                                "
"    General configuration       "
"                                "
""""""""""""""""""""""""""""""""""
"{{{
set mouse=
set ttymouse=
set laststatus=2
set ttyfast
set timeout timeoutlen=3000 ttimeoutlen=0
set title
set cursorline
set number relativenumber
set hidden
set noshowmode
set laststatus=2
set tabstop=4 shiftwidth=4 expandtab
set textwidth=0
set wrapmargin=0
set encoding=utf-8
set showcmd
set clipboard=unnamedplus
set list
set showbreak=↪
set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨
set fillchars+=vert:\ 
set background=dark
set termguicolors
set wildmenu
set wildmode=longest:full,full
set foldmethod=marker

let mapleader = ","
let maplocalleader = ";"

2mat ColorColumn '\%101v.' "highlight the 101nth character

function! OneLineOneSentenceExpr(start, end)
    silent execute a:start.','.a:end.'s/[.!?]\zs /\r/g'
endfunction

augroup latex-autogroup
    au!
    au FileType tex call clearmatches()
    au FileType tex setl shiftwidth=2
    au FileType tex setl linebreak
    au FileType tex setl textwidth=9999999
    au FileType tex setl foldmethod=expr
    au FileType tex setl foldexpr=vimtex#fold#level(v:lnum)
    au FileType tex setl foldtext=vimtex#fold#text()
    au FileType tex setl fillchars+=fold:\ 
    au FileType tex setl formatexpr=OneLineOneSentenceExpr(v:lnum,v:lnum+v:count-1)
    au FileType tex setl spell
augroup END

au FileType nerdtree setlocal nolist

au FileType qf setlocal nowrap 
"}}}



""""""""""""""""""""""""""""""""""
"                                "
"     Plugins configuration      "
"                                "
""""""""""""""""""""""""""""""""""
"{{{
let g:buftabline_show = 1
let g:buftabline_numbers = 1
let g:buftabline_indicators = 1

" Lightline config {{{
let g:lightline = {
        \ 'colorscheme': 'gruvbox',
        \ 'active': {
        \     'left': [
        \         [ 'mode', 'paste' ],
        \         [ 'dir', 'readonly', 'spell' ],
        \         [ 'fileinfo' ]
        \     ],
        \     'right': [
        \         [ 'lineinfo' ],
        \         [ 'percent' ], 
        \     ]
        \ },
        \ 'inactive': {
        \     'left': [
        \         [ 'fileinfo' ]
        \     ],
        \     'right': [
        \         [ 'lineinfo' ],
        \         [ 'percent' ],
        \     ]
        \ },
        \ 'component_visible_condition': {
        \     'modified': '&modified||!&modifiable',
        \     'readonly': '&readonly',
        \     'paste': '&paste',
        \     'spell': '&spell',
        \ },
        \ 'component_function': {
        \     'readonly': 'LightlineReadonly',
        \     'dir': 'LightlineDir',
        \ },
        \ 'component': {
        \     'mode': '%{lightline#mode()}',
        \     'fileinfo': '%<%t%{&modified?" +":""} [%{&ft!=#""?&ft:"no ft"}]',
        \     'fileencoding': '%{&fenc!=#""?&fenc:&enc} [%{&ff}]',
        \     'percent': '☰ %3p%%',
        \     'spell': '✔ %{&spell?&spelllang:""}',
        \     'lineinfo': ' %3l:%-3v'
        \ },
        \ 'mode_map': {
        \     'n' : 'N',
        \     'i' : 'I',
        \     'R' : 'R',
        \     'v' : 'V',
        \     'V' : 'V-LINE',
        \     "\<C-v>": 'V-BLOCK',
        \     'c' : 'C',
        \     's' : 'S',
        \     'S' : 'S-LINE',
        \     "\<C-s>": 'S-BLOCK',
        \     't': 'T'
        \ },
        \ }

function! LightlineDir()
    return &filetype !=# 'help' ? pathshorten(fnamemodify(expand("%:h"), ":~")) : ''
endfunction

function! LightlineReadonly()
  return &readonly && &filetype !=# 'help' ? '🔒' : ''
endfunction
"}}}

let g:gruvbox_italic = 1
let g:gruvbox_vert_split = 'bg2'

let NERDTreeMinimalUI = 1

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
"}}}



""""""""""""""""""""""""""""""""""
"                                "
"       Mapping                  "
"                                "
""""""""""""""""""""""""""""""""""
"{{{
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

" Easy saving
noremap <silent> <C-S> :update<CR>
vnoremap <silent> <C-S> <C-C>:update<CR>
inoremap <silent> <C-S> <C-O>:update<CR>

" Paragraph navigation
nnoremap <silent> ç {
nnoremap <silent> à }
vnoremap <silent> ç {
vnoremap <silent> à }

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
inoremap a <Esc>A
nnoremap a <Esc>A

" Toggle spell check
map <silent> <F4> :setlocal spell!<CR>

" Remove the highlighting until next search
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
"}}}



""""""""""""""""""""""""""""""""""
"                                "
"       Other config             "
"                                "
""""""""""""""""""""""""""""""""""
"{{{
colorscheme gruvbox

if !has("gui_running")
    " Set the highlighting for spell error (necessary due to the termguicolors)
    hi SpellBad term=underline cterm=underline gui=undercurl
    hi SpellCap term=reverse cterm=reverse gui=undercurl
    hi SpellLocal term=underline cterm=underline gui=undercurl
    hi SpellRare term=reverse cterm=reverse gui=undercurl
endif
"}}}
