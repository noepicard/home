if has('autocmd')
  filetype plugin indent on

  autocmd! FileType fzf
  autocmd  FileType fzf set laststatus=0 noshowmode noruler
        \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

  autocmd! TermOpen *
  autocmd TermOpen * setlocal nonumber norelativenumber

  " Make current window more obvious by turning off/adjusting some features in non-current windows.
  if exists('+colorcolumn')
    autocmd BufEnter,FocusGained,VimEnter,WinEnter *
          \ let &l:colorcolumn=''
    autocmd FocusLost,WinLeave *
          \ let &l:colorcolumn=join(range(1, 999), ',')
  endif

  " Highlight too long lines and trailing spaces
  augroup LongLinesHighlighting
    autocmd!
    autocmd WinEnter,BufEnter * call clearmatches() |
          \ call matchadd('ErrorMsg', '\s\+$', 100) |
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
    autocmd BufWinEnter * if &l:buftype ==# 'help' | wincmd _ | endif
  augroup END

  " Some configuration when editing a LaTeX file
  augroup TexFileType
    autocmd!
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
    let &showbreak=''
    set scrolloff=999
    Limelight
  endfunction

  function! s:goyo_leave()
    set background=dark
    set showmode
    set showcmd
    set list
    let &showbreak='↳ '
    set scrolloff=5
    Limelight!
  endfunction

  autocmd! User GoyoEnter nested call <SID>goyo_enter()
  autocmd! User GoyoLeave nested call <SID>goyo_leave()
endif
