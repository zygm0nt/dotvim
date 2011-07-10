filetype off 
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

filetype plugin on

set tw=72
set tabstop=4
set sw=4
set hlsearch
set expandtab
"set nu
set cul
set shiftwidth=4

set foldmethod=marker

autocmd Filetype python setlocal ts=2 sts=2 sw=2 expandtab ai

let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1

