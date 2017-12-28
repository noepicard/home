" Section: Plugins initialization {{{1
" ------------------------------------
call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'

Plug 'ctrlpvim/ctrlp.vim'
Plug 'Shougo/neocomplete'
Plug 'scrooloose/nerdcommenter'
Plug 'jiangmiao/auto-pairs'
Plug 'rhysd/vim-grammarous', { 'for': 'tex' }
Plug 'Konfekt/FastFold', { 'for': 'tex' }
Plug 'lervag/vimtex', { 'for': 'tex' }

call plug#end()
"}}}1
" Section: Options {{{1
" ---------------------

set nocompatible
set termencoding=utf-8
set encoding=utf-8
set ttyfast
set lazyredraw
set mouse=
set scrolloff=1
set timeoutlen=3000
set ttimeoutlen=10
set title
set cursorline
set incsearch
set number
set relativenumber
set hidden
set clipboard=unnamedplus
set wildmenu
set wildmode=longest:full,full
set foldmethod=marker
set tabstop=2
set shiftwidth=2
set expandtab
set smarttab
set nowrap
set noshowmode
set showcmd
set laststatus=2
set showbreak=↪
set list listchars=tab:→\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨
set background=dark
set termguicolors
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set noruler

let mapleader = " "
let maplocalleader = ";"

" Plugins settings {{{2
let g:ctrlp_map = '<Leader>p'
let g:ctrlp_cmd = 'CtrlPCurWD'
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
"let g:ctrlp_buffer_func = {
      "\ 'enter': 'HideStatusLine',
      "\ 'exit': 'RestoreStatusLine'
      "\ }

function! HideStatusLine()
  let g:laststatus_last_value=&laststatus
  set laststatus=0
endfunction

function! RestoreStatusLine()
  let &laststatus=g:laststatus_last_value
endfunction

let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1

let g:fastfold_savehook = 1

let g:tex_flavor = 'latex'
let g:tex_comment_nospell = 1
let g:vimtex_view_method = 'zathura'
let g:vimtex_quickfix_mode = 2
let g:vimtex_fold_enabled = 1
let g:vimtex_quickfix_open_on_warning = 0
let g:vimtex_complete_close_braces = 1
let g:vimtex_compiler_latexmk = {
      \ 'build_dir' : 'out',
      \}
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
if exists('g:vimtex#re#neocomplete')
  let g:neocomplete#sources#omni#input_patterns.tex = g:vimtex#re#neocomplete
endif

let g:gruvbox_italic = 1
let g:gruvbox_vert_split = 'bg2'

" Lightline settings {{{3
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
      \     'right': [ ]
      \ },
      \ 'tabline': {
      \     'left': [ [ 'tabs' ] ],
      \     'right': []
      \ },
      \ 'component_visible_condition': {
      \     'paste': '&paste',
      \     'readonly': '&readonly',
      \     'spell': '&spell',
      \ },
      \ 'component_function': {
      \     'mode': 'LightlineMode',
      \     'readonly': 'LightlineReadonly',
      \     'dir': 'LightlineDir',
      \ },
      \ 'component': {
      \     'fileinfo': '%<%{LightlineFileinfo()}',
      \     'percent': '☰ %2p%%',
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

function! LightlineMode()
  return &ft == 'qf' ? 'QuickFix' : lightline#mode()
endfunction

function! LightlineDir()
  return &ft !~# '\v(help|qf)' ? pathshorten(fnamemodify(getcwd(), ":~")) : ''
endfunction

function! LightlineReadonly()
  return &ro && &ft !=# 'help' ? '🔒' : ''
endfunction

function! LightlineFileinfo()
  let file_name = expand('%') !=# '' ? pathshorten(fnamemodify(expand('%'), ":~:.")) : 'No name'
  let modified_sign = &modified ? ' ✱' : ''
  let file_type = &ft !=# '' ? &ft : 'no ft'
  return &ft !~# '\v(help|nerdtree|qf)' ? file_name.modified_sign.'  ['.file_type.']' : ''
endfunction

" }}}3
" }}}2
" }}}1
" Section: Mappings {{{1
" ----------------------

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
nnoremap <CR> o<Esc>
nnoremap <Leader><CR> O<Esc>

" Scroll the viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>
nnoremap e 3<C-e>
nnoremap y 3<C-y>

" Delete to the black hole register (thus not cutting)
nnoremap <Leader>d "_d
vnoremap <Leader>d "_d

" Toggle spell check
map <silent> <F5> :setl spell!<CR>

" Remove the highlighting until next search
"nnoremap <F3> :nohlsearch<CR>
nnoremap <silent> <F3> :silent! nohls<cr>

nnoremap <C-n> :NERDTreeToggle<CR>

" Plugin key-mappings.
inoremap <expr> <C-g> neocomplete#undo_completion()
inoremap <expr> <C-l> neocomplete#complete_common_string()
inoremap <silent><expr> <Nul>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Nul>" :
      \ neocomplete#start_manual_complete()
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr> <BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <silent> <CR> <C-r>=<SID>neocomplete_cr_function()<CR>

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

function! s:neocomplete_cr_function() abort
  return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction

" Buffers stuff
nnoremap  <C-^>
nnoremap <Leader>bb :ls<CR>:b<Space>
nnoremap <silent> <Leader>n :bn<CR>
nnoremap <silent> <Leader>v :bp<CR>
nnoremap <silent> <Leader>bd :bd<CR>

nnoremap <Leader>g <Plug>(grammarous-open-info-window)

" }}}1
" Section: Autocommands {{{1
" --------------------------

if has("autocmd")
  augroup NERDTreeAU
    autocmd!
    autocmd FileType nerdtree setlocal nolist
  augroup END

  augroup ErrorsHighlighting
    autocmd!
    autocmd WinEnter,BufEnter * call clearmatches() |
          \ call matchadd('ErrorMsg', '\s\+$', 100) |
    autocmd WinEnter,BufEnter * if &filetype != 'tex' |
          \ call matchadd('ErrorMsg', '\%101v.', 100) |
          \ endif
  augroup END

  " Some configuration when editing a LaTeX file
  augroup TexFileType
    autocmd!
    autocmd FileType tex setlocal wrap
    autocmd FileType tex setlocal linebreak
    autocmd FileType tex setlocal formatoptions+=l
    autocmd FileType tex setlocal foldmethod=expr
    autocmd FileType tex setlocal foldexpr=vimtex#fold#level(v:lnum)
    autocmd FileType tex setlocal foldtext=vimtex#fold#text()
    autocmd FileType tex setlocal showbreak=
    autocmd FileType tex setlocal spell
    autocmd FileType tex setlocal spelllang=en,fr
    autocmd FileType tex set wildignore+=*/out/*
  augroup END
endif

" }}}1
" Section: Visual {{{1
" --------------------

colorscheme gruvbox

" Some highlighting resets due to the colorscheme
if !has("gui_running")
  " Set the highlighting for spell error (necessary due to the termguicolors)
  hi SpellBad cterm=underline
  hi SpellCap cterm=underline
  hi SpellLocal cterm=underline
  hi SpellRare cterm=underline
endif
" }}}1
