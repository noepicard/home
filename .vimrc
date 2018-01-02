" Section: Plugins initialization {{{1
" ------------------------------------

call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'
Plug '/usr/bin/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'maralla/completor.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'rhysd/vim-grammarous', { 'for': 'tex' }
Plug 'Konfekt/FastFold', { 'for': 'tex' }
Plug 'lervag/vimtex', { 'for': 'tex' }
Plug 'junegunn/goyo.vim', { 'for': 'tex' }
call plug#end()

"}}}1
" Section: Options {{{1
" ---------------------

" Global settings {{{2
set termencoding=utf-8
set encoding=utf-8
set ttyfast
set lazyredraw
set shortmess+=c
set mouse=
set scrolloff=2
set timeout
set timeoutlen=2000
set ttimeout
set ttimeoutlen=10
set title
set cursorline
set incsearch
set number
set relativenumber
set hidden
set wildmenu
set wildmode=longest:full,full
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set foldmethod=marker
set tabstop=2
set shiftwidth=2
set expandtab
set smarttab
set nowrap
set noshowmode
set showcmd
set clipboard=unnamed
set laststatus=2
set showbreak=↪
set list
set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨
set fillchars=vert:┃
set splitbelow
set splitright
set background=dark
set termguicolors
"}}}2

let mapleader = "\<Space>"
let maplocalleader = ";"
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

" Plugins settings {{{2
" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
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
  \ 'header':  ['fg', 'Comment'] }

let g:fastfold_savehook = 1

let g:tex_flavor = 'latex'
let g:vimtex_view_method = 'zathura'
let g:vimtex_quickfix_mode = 2
let g:vimtex_fold_enabled = 1
let g:vimtex_quickfix_open_on_warning = 0
let g:vimtex_complete_enabled = 1
let g:vimtex_complete_close_braces = 1
let g:vimtex_compiler_latexmk = {
      \ 'build_dir' : 'out',
      \}
let g:vimtex#re#completor = '(\\(?:'
      \ .  '\w*cite\w*(?:\s*\[[^]]*\]){0,2}\s*{[^}]*'
      \ . '|(text|block)cquote\*?(?:\s*\[[^]]*\]){0,2}\s*{[^}]*'
      \ . '|(for|hy)\w*cquote\*?{[^}]*}(?:\s*\[[^]]*\]){0,2}\s*{[^}]*'
      \ . '|\w*ref(?:\s*\{[^}]*|range\s*\{[^,}]*(?:}{)?)'
      \ . '|hyperref\s*\[[^]]*'
      \ . '|includegraphics\*?(?:\s*\[[^]]*\]){0,2}\s*\{[^}]*'
      \ . '|(?:include(?:only)?|input)\s*\{[^}]*'
      \ . '|\w*(gls|Gls|GLS)(pl)?\w*(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
      \ . '|includepdf(\s*\[[^]]*\])?\s*\{[^}]*'
      \ . '|includestandalone(\s*\[[^]]*\])?\s*\{[^}]*'
      \ . '|usepackage(\s*\[[^]]*\])?\s*\{[^}]*'
      \ . '|documentclass(\s*\[[^]]*\])?\s*\{[^}]*'
      \ . '|\w*'
      \ .'))$'
let g:completor_tex_omni_trigger = g:vimtex#re#completor

let g:lightline = {}
let g:lightline.colorscheme = 'gruvbox'
let g:lightline.component = {
      \ 'filename': '%<%t'}

let g:gruvbox_italic = 1
let g:gruvbox_undercurl = 0
colorscheme gruvbox

"}}}2

"}}}1
" Section: Mappings {{{1
" ----------------------

map & [
map é ]

nmap <Leader>p :Files<CR>
nmap <Leader>b :Buffers<CR>

" Turn off linewise keys. Normally, the `j' and `k' keys move the cursor down one entire line. with
" line wrapping on, this can cause the cursor to actually skip a few lines on the screen because
" it's moving from line N to line N+1 in the file. I want this to act more visually -- I want `down'
" to mean the next line on the screen
nmap j gj
nmap k gk

" Super fast window movement shortcuts
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-h> <C-W>h
nmap <C-l> <C-W>l

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
nnoremap <M-e> 3<C-e>
nnoremap <M-y> 3<C-y>

" Delete to the black hole register (thus not cutting)
nnoremap <Leader>d "_d
vnoremap <Leader>d "_d
nnoremap <Leader>x "_x
vnoremap <Leader>x "_x

" Toggle spell check
map <silent> <F5> :setl spell!<CR>

" Remove the highlighting until next search
"nnoremap <F3> :nohlsearch<CR>
nnoremap <silent> <F3> :set hlsearch!<cr>

" Buffers stuff
nnoremap  <C-^>

nnoremap <silent> <Leader>n :bn<CR>
nnoremap <silent> <Leader>v :bp<CR>

nnoremap <Leader>g <Plug>(grammarous-open-info-window)

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <CR> pumvisible() ? "\<C-y>\<CR>" : "\<CR>"
"}}}
" Section: Autocommands {{{1
" --------------------------

if has('autocmd')
  filetype plugin indent on

  " Highlight too long lines and trailing spaces
  augroup ErrorsHighlighting
    autocmd!
    autocmd WinEnter,BufEnter * call clearmatches() |
          \ call matchadd('ErrorMsg', '\s\+$', 100) |
    autocmd WinEnter,BufEnter * if &filetype !~# '\v(tex|qf|help)' |
          \ call matchadd('ErrorMsg', '\%101v.', 100) |
          \ endif
  augroup END

  " Custom spell highlighting
  augroup FixSpellHighlighting
    autocmd!
    autocmd VimEnter * hi SpellBad cterm=underline
    autocmd VimEnter * hi SpellRare cterm=underline
    autocmd VimEnter * hi SpellLocal cterm=underline
    autocmd VimEnter * hi SpellCap cterm=underline
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

" }}}1
