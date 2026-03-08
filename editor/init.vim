" commondot -- editor/init.vim
" Symlinked to ~/.config/nvim/init.vim

set nocompatible

syntax on
set ttyfast
set backspace=indent,eol,start
set mouse=a

" Spacing
set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4
set modelines=1
filetype indent on
filetype plugin on
set autoindent

" UI
set number
set ruler
set showcmd
set wildmenu
set showmatch
set laststatus=2
set visualbell
set cmdheight=2

" Search
set incsearch
set hlsearch

" Move vertically by visual line
nnoremap j gj
nnoremap k gk
