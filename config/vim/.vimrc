" vimrc file
"
" Maintainer:   JuliaLblnd
" Last change:  2020 Sep 15

" Resolve conflict with utf-8 ambiguous characters and Windows Terminal
" causing vim to open in INSERT mode
" See https://github.com/microsoft/terminal/issues/1637#issuecomment-663865934
" And https://superuser.com/a/1525060
set t_u7=
"set ambw=double

" Load indentation rules and plugins according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

" Enables syntax highlighting.
if has("syntax")
  syntax on
endif

" Allow backspacing over everything in insert mode.
set backspace=indent,eol,start

set autoindent
set history=100     " Keep 100 lines of command line history
set ruler           " Show the cursor position all the time
set showcmd         " Show (partial) command in status line.
set hidden          " Hide buffers when they are abandoned
set showmatch       " Show matching brackets.
set number          " Show line numbers
set laststatus=2    " Always show status bar
set hlsearch        " Highlight all search matches
set wildmenu        " display completion matches in a status line
set wildmode=list:longest,full
set mouse=a         " Enable mouse usage (all modes)
set autochdir

let mapleader = ","

if filereadable("~/.vimrc-extended")
"  source ~/.vimrc-extended
endif
