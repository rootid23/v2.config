set number
set mouse=r
syntax on

set laststatus=2
map ,rel :g/^\s*$/d<CR>

let g:molokai_italic=0
"colorscheme molokai
"set background=dark

" Ack/ag
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

"call plug#begin()
call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-surround'
Plug 'editorconfig/editorconfig-vim' "editorconfig
Plug 'tpope/vim-fugitive' "Git
Plug 'tpope/vim-surround'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-repeat' "Repeat
Plug 'tpope/vim-obsession' " Session
Plug 'tpope/vim-commentary' " gcc
Plug 'nathanaelkane/vim-indent-guides' "indent
Plug 'nathanaelkane/vim-indent-guides' "indent
Plug 'Yggdroot/indentLine' "indent
Plug 'mattn/emmet-vim' "HTML
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

call plug#end()

"vim -u NONE -c "helptags vim-obsession/doc" -c q
"

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

