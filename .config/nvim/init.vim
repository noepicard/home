" Section: Plugins initialization {{{
" ------------------------------------
call plug#begin('~/.local/share/nvim/plugged')
" Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'godlygeek/tabular'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'lervag/vimtex'
Plug 'w0rp/ale'
call plug#end()
"}}}

" Section: Options {{{
" ---------------------
" Global settings {{{
set scrolloff=3                 " Always keep some lines above and below the cursor
set clipboard+=unnamedplus      " Use the system clipboard
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
set wildignore+=*/out/*
set foldmethod=marker           " Use marker (i.e. triple brackets) to fold code
set autoindent                  " Keep the indentation of the current line to a new one
set smarttab                    " Use shiftwidth when using <Tab>
set tabstop=4                   " Tab size
set shiftwidth=4                " Indentation size
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
set shiftwidth=4                " spaces per tab (when shifting)
set splitbelow                  " Split horizontally below
set splitright                  " Split vertically on the right
set background=dark             " Color of the gneral background
set termguicolors               " Use the GUI color inside terminal
set virtualedit=block           " allow cursor to move where there is no text in visual block mode
set pumheight=10                " Maximum size of the popup menu

let mapleader = "\<Space>"
let maplocalleader = ";"

" let g:gruvbox_contrast_dark = "soft"
colorscheme onedark

command! -nargs=* T split | terminal <args>
command! -nargs=* VT vsplit | terminal <args>
command! TT below 10sp term://$SHELL | startinsert
command! ProseMode Goyo 110x85%
command! SetSize set lines=50 columns=120
"}}}

" Plugins settings {{{
let g:lightline = {}
let g:lightline.colorscheme = "onedark"
let g:lightline.component = {
      \ 'filename': '%<%t'
      \ }
let g:lightline.mode_map = {
      \ 'n' : 'N',
      \ 'i' : 'I',
      \ 'R' : 'R',
      \ 'v' : 'V',
      \ 'V' : 'V-LINE',
      \ "\<C-v>": 'V-BLOCK',
      \ 'c' : 'CMD',
      \ 's' : 'SELECT',
      \ 'S' : 'S-LINE',
      \ "\<C-s>": 'S-BLOCK',
      \ 't': 'T',
      \ }

let NERDTreeMinimalUI=1

" let g:fzf_layout = { 'down': '~40%' }

" " In Neovim, you can set up fzf window using a Vim command
" let g:fzf_layout = { 'window': 'enew' }
" let g:fzf_layout = { 'window': '-tabnew' }
" let g:fzf_layout = { 'window': '10split enew' }

" " Customize fzf colors to match your color scheme
" let g:fzf_colors =
"       \ { 'fg':      ['fg', 'Normal'],
"       \ 'bg':      ['bg', 'Normal'],
"       \ 'hl':      ['fg', 'Comment'],
"       \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
"       \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
"       \ 'hl+':     ['fg', 'Statement'],
"       \ 'info':    ['fg', 'PreProc'],
"       \ 'border':  ['fg', 'Ignore'],
"       \ 'prompt':  ['fg', 'Conditional'],
"       \ 'pointer': ['fg', 'Exception'],
"       \ 'marker':  ['fg', 'Keyword'],
"       \ 'spinner': ['fg', 'Label'],
"       \ 'header':  ['fg', 'Comment'] }

let g:deoplete#enable_at_startup = 1

let g:tex_flavor = 'latex'
let g:vimtex_view_method = 'zathura'
" let g:vimtex_view_general_viewer = 'okular'
" let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
" let g:vimtex_view_general_options_latexmk = '--unique'
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_quickfix_open_on_warning = 0
let g:vimtex_fold_enabled = 1
let g:vimtex_fold_manual = 1
let g:vimtex_complete_enabled = 1
let g:vimtex_compiler_latexmk = {
      \ 'build_dir' : 'out',
      \ 'options' : [
      \   '-pdf',
      \   '-shell-escape',
      \   '-verbose',
      \   '-file-line-error',
      \   '-synctex=1',
      \   '-interaction=nonstopmode',
      \ ],
      \ }
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
let g:deoplete#omni#input_patterns.tex = g:vimtex#re#deoplete
"}}}
"}}}

" Section: Mappings {{{
" ----------------------

tnoremap <Home> <C-\><C-n>

" Disable Arrow keys in Normal and Insert mode
nnoremap <C-Left> :vertical resize -1<CR>
nnoremap <C-Right> :vertical resize +1<CR>
nnoremap <C-Up> :resize -1<CR>
nnoremap <C-Down> :resize +1<CR>

nnoremap <BS> <Nop>
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
nnoremap <silent> j gj
nnoremap <silent> k gk
vnoremap <silent> j gj
vnoremap <silent> k gk

nnoremap <silent> <Leader>p :CtrlP<CR>
nnoremap <silent> <Leader>b :CtrlPBuffer<CR>

" Super fast window movement shortcuts
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Easy saving
nnoremap <Leader>w :w!<CR>

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

" Toggle NERDTree
nnoremap <C-f> :NERDTreeToggle<CR>

nnoremap <silent> <localleader>lb :VimtexCompileSS<CR>
"}}}

" Section: Autocmds {{{
" ----------------------
if has('autocmd')
  " Highlight too long lines and trailing spaces
  " augroup LongLinesHighlighting
  "   autocmd!
  "   autocmd WinEnter,BufEnter,BufWinEnter * call clearmatches() |
  "         \ call matchadd('ErrorMsg', '\s\+$', 100) |
  "   autocmd WinEnter,BufEnter,BufWinEnter * if ((&filetype !~# '\v(tex|help)') &&  (&buftype !~# '\v(terminal|quickfix)')) |
  "         \ call matchadd('ErrorMsg', '\%101v.', 100) |
  "         \ endif
  " augroup END

  augroup CursorLine
    autocmd!
    autocmd InsertEnter * setlocal cul
    autocmd InsertLeave * setlocal nocul
  augroup END

  function! s:goyo_enter()
    " set background=light
    set noshowmode
    set noshowcmd
    set nolist
    let &showbreak=''
    set scrolloff=999
    setlocal wrap
    setlocal linebreak
    Limelight
  endfunction

  function! s:goyo_leave()
    " set background=dark
    set showmode
    set showcmd
    set list
    let &showbreak='↳ '
    set scrolloff=5
    setlocal wrap
    setlocal linebreak
    Limelight!
  endfunction

  autocmd! User GoyoEnter nested call <SID>goyo_enter()
  autocmd! User GoyoLeave nested call <SID>goyo_leave()
endif
"}}}
