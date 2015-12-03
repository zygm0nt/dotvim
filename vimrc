execute pathogen#infect()
syntax on
filetype plugin indent on

set nocompatible
set modelines=0 	"always show powerline

"sane editing properties
set tw=72
set tabstop=4
set sw=4
set hlsearch
set expandtab

set cul
set shiftwidth=4
set history=1000
set viminfo='1000,f1,<500
set ruler
set showcmd
set showmode
set ttyfast
set laststatus=2

set list "show non-printable characters

command! CopyMode set nolist | set norelativenumber

autocmd Filetype python setlocal ts=2 sts=2 sw=2 expandtab ai


let g:airline_powerline_fonts = 1
let g:airline_theme = "luna"

let &titlestring = hostname() . "[vim(" . expand("%:t") . ")]"
if &term == "screen"
      set t_ts=^[k
      set t_fs=^[\
endif
if &term == "screen" || &term == "xterm"
    set title
endif


autocmd FocusLost * :wa  " save on losing focus

cnoremap sudow w !sudo tee % >/dev/null

