" Section: Plugins initialization {{{
" ------------------------------------

call plug#begin('~/.local/share/nvim/plugged')
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf' }
Plug 'junegunn/fzf.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'lervag/vimtex'
Plug 'rhysd/vim-grammarous', { 'for': 'tex' }
Plug 'Konfekt/FastFold', { 'for': 'tex' }
Plug 'junegunn/goyo.vim', { 'for': 'tex' }
call plug#end()

"}}}
" Section: Options {{{
" ---------------------

" Global settings {{{
set shortmess+=c
set lazyredraw
set scrolloff=1
set clipboard+=unnamedplus
set sidescrolloff=5
set autoread
set title
set incsearch
set number
set relativenumber
set hidden
set backspace=indent,eol,start
set wildmenu
set wildmode=longest:full,full
set foldmethod=marker
set autoindent
set smarttab
set tabstop=2
set shiftwidth=2
set expandtab
set smarttab
set nowrap
set noshowmode
set showcmd
set laststatus=2
set showbreak=↪
set list
set listchars=tab:→\ ,nbsp:␣,trail:•,extends:⟩,precedes:⟨
set fillchars=vert:┃
set splitbelow
set splitright
set background=dark
set termguicolors
set pumheight=10
"}}}

let mapleader = "\<Space>"
let maplocalleader = ";"
set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,
      \i-ci:ver25-Cursor/lCursor-blinkwait700-blinkoff400-blinkon250,
      \r-cr:hor20-Cursor/lCursor
let g:gruvbox_italic=1
colorscheme gruvbox

" Plugins settings {{{
" Customize fzf colors to match your color scheme
let g:fzf_colors = {
      \ 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'border':  ['fg', 'Ignore'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment']
      \ }
let g:fzf_layout = { 'down': '~25%' }

let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1

let g:fastfold_savehook = 1

let g:tex_flavor = 'latex'
let g:vimtex_view_method = 'zathura'
let g:vimtex_quickfix_mode = 2
let g:vimtex_fold_enabled = 1
let g:vimtex_complete_enabled = 1
let g:vimtex_quickfix_open_on_warning = 0
let g:vimtex_quickfix_latexlog = {
      \ 'overfull' : 0,
      \ 'underfull' : 0
      \}
let g:vimtex_compiler_latexmk = {
      \ 'build_dir': 'out'
      \}

" let g:deoplete#complete_method = 'omnifunc'
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
let g:deoplete#omni#input_patterns.tex = g:vimtex#re#deoplete

let g:lightline = {}
let g:lightline.colorscheme = 'gruvbox'
let g:lightline.component = {
      \ 'filename': '%<%t'}

function! s:goyo_enter()
  set scrolloff=999
endfunction

function! s:goyo_leave()
  set scrolloff=4
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

"}}}
"}}}
" Section: Mappings {{{
" ----------------------

" Terminal stuff
command! -nargs=* T split | terminal <args>
command! -nargs=* VT vsplit | terminal <args>
noremap <Leader>t :T<CR>i
tnoremap <M-q> <C-\><C-n>
tnoremap <M-Q> <C-\><C-n>

" Disable Arrow keys in Normal and Insert mode
noremap <up> <Nop>
noremap <down> <Nop>
noremap <left> <Nop>
noremap <right> <Nop>
inoremap <up> <Nop>
inoremap <down> <Nop>
inoremap <left> <Nop>
inoremap <right> <Nop>
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

nmap <silent> <Leader>p :Files<CR>
nmap <silent> <Leader>b :Buffers<CR>

" Super fast window movement shortcuts
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-h> <C-W>h
nmap <C-l> <C-W>l

" Easy saving
nmap <leader>w :w!<CR>
noremap <silent> <C-S> :update<CR>
vnoremap <silent> <C-S> <C-C>:update<CR>
inoremap <silent> <C-S> <C-O>:update<CR>

" Paragraph navigation
nnoremap <silent> ç {
nnoremap <silent> à }
vnoremap <silent> ç {
vnoremap <silent> à }

" Scroll the viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" Delete to the black hole register (thus not cutting)
nnoremap <Leader>d "_d
vnoremap <Leader>d "_d
nnoremap <Leader>x "_x
vnoremap <Leader>x "_x

" Toggle spell check
map <silent> <F5> :setl spell!<CR>

" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>

" Buffers stuff
nnoremap <silent> <Leader>n :bn<CR>
nnoremap <silent> <Leader>v :bp<CR>

" Open Grammarous info window
nnoremap <Leader>g <Plug>(grammarous-open-info-window)

" Better handling of the Popup Menu
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"}}}
" Section: Autocommands {{{
" --------------------------

if has('autocmd')
  filetype plugin indent on

  autocmd! FileType fzf
  autocmd  FileType fzf set laststatus=0 noshowmode noruler
        \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

  autocmd! TermOpen *
  autocmd TermOpen * setlocal nonumber norelativenumber

  " Highlight too long lines and trailing spaces
  augroup ErrorsHighlighting
    autocmd!
    autocmd WinEnter,BufEnter * call clearmatches() |
          \ call matchadd('ErrorMsg', '\s\+$', 98) |
    autocmd WinEnter,BufEnter * if &filetype !~# '\v(tex|qf|help)' |
          \ call matchadd('ErrorMsg', '\%101v.', 100) |
          \ endif
  augroup END

  augroup CursorLine
    autocmd!
    autocmd InsertEnter * setlocal cul
    autocmd InsertLeave * setlocal nocul
  augroup END

  " Help File speedups, <enter> to follow tag, delete for back
  augroup HelpFileType
    autocmd!
    autocmd FileType help nnoremap <buffer><CR> <c-]>
    autocmd FileType help nnoremap <buffer><BS> <c-T>
    autocmd FileType help nnoremap <buffer>q :q<CR>
    autocmd FileType help set nonumber
    autocmd FileType help wincmd _ " Maximze the help on open
  augroup END

  " Some configuration when editing a LaTeX file
  augroup TexFileType
    autocmd!
    autocmd FileType tex set showbreak=
    autocmd FileType tex set fillchars=vert:\|,fold:\ 
    autocmd FileType tex set wildignore+=*/out/*
    autocmd FileType tex setlocal wrap
    autocmd FileType tex setlocal linebreak
    autocmd FileType tex setlocal formatoptions+=l
    autocmd FileType tex setlocal foldmethod=expr
    autocmd FileType tex setlocal foldexpr=vimtex#fold#level(v:lnum)
    autocmd FileType tex setlocal foldtext=vimtex#fold#text()
    autocmd FileType tex setlocal spell
    autocmd FileType tex setlocal spelllang=en,fr
  augroup END

endif
"}}}
