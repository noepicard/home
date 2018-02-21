" Section: Plugins initialization {{{
" ------------------------------------
call plug#begin('~/.local/share/nvim/plugged')
Plug 'morhetz/gruvbox'
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
set lazyredraw                  " Only redraw when necessary
set scrolloff=1                 " Always keep one line above and below the cursor
set clipboard+=unnamedplus      " Use the system clipboard
set mouse=r                     " Enable mouse support only for hit-enter and more-prompt
set autoread                    " Read the changes automatically
set title                       " Set the title of the window
set incsearch                   " Incremental search
set number                      " Set line numbers
set relativenumber              " Relative numbering from the current line
set hidden                      " Allow hidden buffers
set shortmess+=c                " Disable the completion messages
set backspace=indent,eol,start  " Make backspace behaves normally
set wildmenu                    " Better command line completion
set wildmode=longest:full,full  " Better wild mode for command line completion
set foldmethod=marker           " Use marker (i.e. triple brackets) to fold code
set autoindent                  " Keep the indentation of the current line to a new one
set smarttab                    " Use shiftwidth when using <Tab>
set tabstop=2                   " Tab size
set shiftwidth=2                " Indentation size
set expandtab                   " Use space instead of tab
set nowrap                      " Don't wrap the code according to the window size
set showcmd                     " Useful for showing pending command
set laststatus=2                " Always show the status line
set shortmess+=A                " ignore annoying swapfile messages
set shortmess+=I                " no splash screen
set showbreak=↳\                " Character to show when lines are wrapped
set list                        " Show hidden character
set listchars=nbsp:␣            " Non breaking space
set listchars+=tab:▷\           " Tabulation
set listchars+=extends:⟫        " Too long lines to the right
set listchars+=precedes:⟪       " Too long lines to the left
set listchars+=trail:•          " Trailing space
set fillchars=vert:┃            " Vertical split character
set shiftround                  " always indent by multiple of shiftwidth
set shiftwidth=2                " spaces per tab (when shifting)
set splitbelow                  " Split horizontally below
set splitright                  " Split vertically on the right
set pumheight=10                " Max size of the completion pop-up
set background=dark             " Color of the general background
set termguicolors               " Use the GUI color inside terminal
set virtualedit=block         " allow cursor to move where there is no text in visual block mode
if exists('$SUDO_USER')
  set noundofile              " don't create root-owned files
else
  set undodir=~/.local/share/nvim/undo
  set undofile                " actually use undo files
endif

let mapleader = "\<Space>"
let maplocalleader = ";"

let g:gruvbox_number_column = 'bg1'
let g:gruvbox_contrast_light = 'soft'
let g:gruvbox_italic=1
colorscheme gruvbox

command! -nargs=* T split | terminal <args>
command! -nargs=* VT vsplit | terminal <args>
command! ProseMode Goyo 110x85%

"}}}
" Plugins settings {{{
let g:lightline = {}
let g:lightline.colorscheme = 'gruvbox'

let g:lightline.separator = { 'left': '', 'right': '' }
let g:lightline.subseparator = { 'left': '', 'right': '' }
let g:lightline.component = {
      \ 'filename': '%<%t'
      \ }


" Customize fzf colors to match the color scheme
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

let g:tex_flavor = 'latex'
let g:vimtex_view_method = 'zathura'
let g:vimtex_fold_enabled = 1
let g:vimtex_complete_enabled = 1
let g:vimtex_compiler_latexmk = {
      \ 'build_dir' : 'out'
      \ }
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
let g:deoplete#omni#input_patterns.tex = g:vimtex#re#deoplete
let g:fastfold_savehook = 1
let g:grammarous#disabled_rules = {
      \ '*' : ['WHITESPACE_RULE', 'EN_QUOTES']
      \ }
"}}}
"}}}

" Section: Mappings {{{
" ----------------------
" Terminal stuff
nnoremap <Leader>t :T<CR>i
tnoremap <M-q> <C-\><C-n>
tnoremap <M-Q> <C-\><C-n>

" Set size
nnoremap <M-S> :set lines=50 columns=110<CR>

" Disable Arrow keys in Normal and Insert mode
nnoremap <C-Left> :vertical resize -1<CR>
nnoremap <C-Right> :vertical resize +1<CR>
nnoremap <C-Up> :resize -1<CR>
nnoremap <C-Down> :resize +1<CR>
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
nnoremap <BS> <Nop>
nnoremap <CR> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

nnoremap <silent> <Leader>p :Files<CR>
nnoremap <silent> <Leader>b :Buffers<CR>

" Super fast window movement shortcuts
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Easy saving
nnoremap <leader>w :w!<CR>

" Sudo save
cmap w!! w !sudo tee >/dev/null %

" Paragraph navigation
nnoremap <silent> ù {
nnoremap <silent> µ }
vnoremap <silent> ù {
vnoremap <silent> µ }

" Scroll the viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>
nnoremap <M-e> 3<C-e>
nnoremap <M-y> 3<C-y>

nnoremap <M-d> <C-d>
nnoremap <M-u> <C-u>

" Delete to the black hole register (thus not cutting)
nnoremap <Leader>d "_d
vnoremap <Leader>d "_d
nnoremap <Leader>x "_x
vnoremap <Leader>x "_x

" Redraws the screen and removes any search highlighting.
nnoremap <silent> <C-n> :nohl<CR>

" Buffers stuff
nnoremap <Leader>n :bnext!<CR>
nnoremap <Leader>v :bprev!<CR>

" Open Grammarous info window
nnoremap <Leader>g <Plug>(grammarous-open-info-window)

" Better handling of the Popup Menu
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"}}}
