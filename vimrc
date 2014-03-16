" To disable a plugin, add it's bundle name to the following list
let g:pathogen_disabled = []
call add(g:pathogen_disabled, 'pyflakes-vim') 

let g:Powerline_symbols = 'fancy'

filetype off 
call pathogen#helptags()
"call pathogen#runtime_append_all_bundles()
call pathogen#infect()
filetype plugin on

set nocompatible
set modelines=0

set tw=72
set tabstop=4
set sw=4
set hlsearch
set expandtab
"set nu
set cul
set shiftwidth=4
set history=1000
set viminfo='1000,f1,<500
set ruler
set showcmd
set showmode
set ttyfast
set laststatus=2

set foldmethod=marker

autocmd Filetype python setlocal ts=2 sts=2 sw=2 expandtab ai

let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1

filetype plugin indent on

cmap w!! w !sudo tee % >/dev/null

"autocmd FocusLost * :wa  " save on losing focus

augroup filetypedetect 
  au BufNewFile,BufRead *.pig set filetype=pig syntax=pig 
augroup END


"nnoremap <up> <nop>
"nnoremap <down> <nop>
"nnoremap <left> <nop>
"nnoremap <right> <nop>
"inoremap <up> <nop>
"inoremap <down> <nop>
"inoremap <left> <nop>
"inoremap <right> <nop>
"nnoremap j gj
"nnoremap k gk

inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>


let &titlestring = hostname() . "[vim(" . expand("%:t") . ")]"
if &term == "screen"
      set t_ts=^[k
      set t_fs=^[\
endif
if &term == "screen" || &term == "xterm"
    set title
endif

cnoremap sudow w !sudo tee % >/dev/null
