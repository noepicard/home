" Section: Plugins initialization {{{
" ------------------------------------

call plug#begin('~/.local/share/nvim/plugged')
Plug 'morhetz/gruvbox'
" Plug 'nanotech/jellybeans.vim'
" Plug 'joshdick/onedark.vim'
Plug 'itchyny/lightline.vim'
Plug '/usr/bin/fzf'
Plug 'junegunn/fzf.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'lervag/vimtex'
Plug 'rhysd/vim-grammarous', { 'for': 'tex' }
Plug 'Konfekt/FastFold', { 'for': 'tex' }
call plug#end()

"}}}
" Section: Options {{{
" ---------------------

" Global settings {{{
set lazyredraw                 " Only redraw when necessary
set scrolloff=1                " Always keep one line above and below the cursor
set clipboard+=unnamedplus     " Use the system clipboard
set autoread                   " Read the changes automatically
set title                      " Set the title of the window
set incsearch                  " Incremental search
set number                     " Set line numbers
set relativenumber             " Relative numbering from the current line
set hidden                     " Allow hidden buffers
set shortmess+=c               " Disable the completion messages
set backspace=indent,eol,start " Make backspace behaves normally
set wildmenu                   " Better command line completion
set wildmode=longest:full,full " Better wild mode for command line completion
set foldmethod=marker          " Use marker (i.e. triple brackets) to fold code
set autoindent                 " Keep the indentation of the current line to a new one
set smarttab                   " Use shiftwidth when using <Tab>
set tabstop=2                  " Tab size
set shiftwidth=2               " Identation size
set expandtab                  " Use space instead of tab
set nowrap                     " Don't wrap the code according to the window size
set showcmd                    " Useful for showing pending command
set laststatus=2               " Always show the status line
set showbreak=↪                " Character to show when lines are wrapped
set list                       " Show hidden character
set listchars=tab:→\ ,nbsp:␣,trail:•,extends:⟩,precedes:⟨
set fillchars=vert:┃
set splitbelow                 " Split horizontally below
set splitright                 " Split vertically on the right
set pumheight=10               " Max size of the completion popup
set background=dark            " Color of the general background
set termguicolors              " Use the GUI color inside terminal

let mapleader = "\<Space>"
let maplocalleader = ";"
let g:gruvbox_contrast_light = 'soft'
let g:gruvbox_italic=1
colorscheme gruvbox
"}}}
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

let g:grammarous#disabled_rules = {
            \ '*' : ['WHITESPACE_RULE', 'EN_QUOTES']
            \}

if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
let g:deoplete#omni#input_patterns.tex = g:vimtex#re#deoplete

let g:lightline = {}
let g:lightline.separator = { 'left': '', 'right': '' }
let g:lightline.subseparator = { 'left': '', 'right': '' }
let g:lightline.colorscheme = 'gruvbox'
let g:lightline.component = {
      \ 'filename': '%<%t'}
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
nnoremap <silent> ù {
nnoremap <silent> µ }
vnoremap <silent> ù {
vnoremap <silent> µ }

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

command! ProseMode Goyo 110x85%

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


  function! s:goyo_enter()
    set background=light
    set noshowmode
    set noshowcmd
    set nolist
    set showbreak=
    set scrolloff=999
    Limelight
  endfunction

  function! s:goyo_leave()
    set background=dark
    set showmode
    set showcmd
    set list
    set showbreak=↪
    set scrolloff=5
    Limelight!
  endfunction

  autocmd! User GoyoEnter nested call <SID>goyo_enter()
  autocmd! User GoyoLeave nested call <SID>goyo_leave()
endif
"}}}
