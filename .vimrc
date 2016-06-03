" Michael Pawliszyn

set nocompatible

" Colours:
syntax on                       " enable syntax processing

" Setup:
set ttyfast                     " faster redraw
set backspace=indent,eol,start  " backspace!

" Spacing:
set tabstop=4                   " 4 space tab
set expandtab                   " use spaces for tabs
set softtabstop=4               " 4 space tab
set shiftwidth=4
set modelines=1
filetype indent on              " File type if possible
filetype plugin on              " File type if possible
set autoindent                  " Autoindent unknown types

" UI:
set number                      " show line numbers
set ruler                       " show position of cursor
set showcmd                     " show command in bottom bar
set wildmenu
set showmatch                   " highlight matching [{()}]
set laststatus=2                " always display status line
set visualbell                  " no beeping
set cmdheight=2                 " more command info room

" Search:
set incsearch                   " search as characters are entered
set hlsearch                    " highlight matches

" Movement:
" move vertically by visual line
nnoremap j gj
nnoremap k gk


