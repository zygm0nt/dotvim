execute pathogen#infect()
syntax on
colorscheme landscape
filetype plugin indent on

set encoding=UTF-8

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

"set list "show non-printable characters

let g:tablineclosebutton=1

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

hi TabLine      ctermfg=Black  ctermbg=Green     cterm=NONE
hi TabLineFill  ctermfg=Black  ctermbg=Green     cterm=NONE
hi TabLineSel   ctermfg=White  ctermbg=DarkBlue  cterm=NONE

"nerdtree
" start nerdtree when opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" bind ctrl+n to toggle nerdtree pane
map <C-n> :NERDTreeToggle<CR>

" NERDTress File highlighting - from https://github.com/scrooloose/nerdtree/issues/433#issuecomment-92590696
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

" rainbow_parentheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

inoremap jj <Esc>

" LaTeX relatex config
let g:tex_flavor='latex'
"let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

" Snippets config
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsSnippetDirectories = ['~/.vim/UltiSnips', 'UltiSnips']

" spellchecking + correction with ctrl+l
"setlocal spell
"set spelllang=pl,en_gb
"inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

" session support
let g:session_autosave = 'yes'
let g:session_directory = 'session'
let g:session_autoload = 'no'

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
