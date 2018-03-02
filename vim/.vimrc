" Section: bsc {

set nocompatible
filetype plugin on

if !exists("g:syntax_on")
    syntax enable
endif

set number
set showmatch     " Show matching brackets/parenthesis
set showcmd       " Show (partial) command in the last lien of the screen
set incsearch     " Find as you type search
set hlsearch      " Highlight search terms
"vim -u NONE -N > blnk vm
"vim -u rules.vim > opn w/ rls stngs
"vim -u NONE -c "helptags vim-obsession/doc" -c q

"set global leader ,overwrt w/ maplocalleader
let mapleader = ","

" }

" Section: stsln {

  " Section: ruler {
    if has('cmdline_info')
        set ruler                   " Show the ruler
        set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
        set showcmd                 " Show partial commands in status line and
                                    " Selected characters/lines in visual mode
    endif
  " }

  " Section: stsln {
  if has('statusline')
      set laststatus=2

      " Broken down into easily includeable segments
      set statusline=%<%f\                     " Filename
      set statusline+=%w%h%m%r                 " Options
      set statusline+=%{exists('g:loaded_fugitive')?fugitive#statusline():''} " Git Hotness
      set statusline+=\ [%{&ff}/%Y]            " Filetype
      set statusline+=\ [%{getcwd()}]          " Current dir
      set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
  endif
  " }
" }

" Section: clrs  {
"colorscheme murphy "For vimdiff
if &diff
  colorscheme evening
endif

colorscheme desert

highlight clear SignColumn      " SignColumn should match background
highlight clear LineNr          " Current line number row will have same background color in relative mode
highlight clear CursorLineNr    " Remove highlight color from current line number

set background=light
"set background=dark

"let g:solarized_termcolors = 16
"colorscheme solarized
"let g:molokai_italic=0
"colorscheme molokai

" }

set mouse=r

" Section: bscmping {

"rmv mt lns
nnoremap <C-c> :g/^$/d<CR>

"rmv mt lns
map ,rel :g/^\s*$/d<CR>

" Easier moving in tabs and windows
" Only using horizontal directions H/L and saving J/K
map <C-L> <C-W>l<C-W>_
map <C-H> <C-W>h<C-W>_

" }

" Section: xtnlprgm {

" Ack/ag
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" }

" Section: plgns {
" Prereq : mkdir -p ~/.vim/plugged
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
" }

" Section: plgcnfg {
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

 " Fugitive shortcuts {
 if isdirectory(expand("~/.vim/plugged/vim-fugitive/"))
   set diffopt+=vertical
   nnoremap <silent> <leader>gs :Gstatus<CR>
   nnoremap <silent> <leader>gd :Gdiff<CR>
   nnoremap <silent> <leader>gc :Gcommit<CR>
   nnoremap <silent> <leader>gb :Gblame<CR>
   nnoremap <silent> <leader>gl :Glog<CR>
   nnoremap <silent> <leader>gp :Git push<CR>
   nnoremap <silent> <leader>gr :Gread<CR>
   nnoremap <silent> <leader>gw :Gwrite<CR>
   nnoremap <silent> <leader>ge :Gedit<CR>
   " Mnemonic _i_nteractive
   nnoremap <silent> <leader>gi :Git add -p %<CR>
   nnoremap <silent> <leader>gg :SignifyToggle<CR>
 endif
 "}
" }

" Functions {

  " Use ctrl+l to switch btn reln and noreln
  function! g:TglRelNmMode()
    set rnu!
  endfunction

  nnoremap <silent><C-N> :call g:TglRelNmMode()<cr>

  " Strip whitespace {
  function! StripTrailingWhitespace()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " do the business:
    %s/\s\+$//e
    " clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
  endfunction
  " }

  " set zj and zk go to find open folds {
  function! GoToOpenFold(direction)
    if (a:direction == "next")
      normal zj
      let start = line('.')
      while foldclosed(start) != -1
        let start = start + 1
      endwhile
    else
      normal zk
      let start = line('.')
      while foldclosed(start) != -1
        let start = start - 1
      endwhile
    endif
    call cursor(start, 0)
  endfunction
  " }

  " Session {

     " Creates a session {
      function! MakeSession()
        let b:sessiondir = $HOME . "/.vim_sessions" . getcwd()
        if (filewritable(b:sessiondir) != 2)
          exe 'silent !mkdir -p ' b:sessiondir
          redraw!
        endif
        let b:filename = b:sessiondir . '/session.vim'
        exe "mksession! " . b:filename
      endfunction
      " }

      " Updates a session, BUT ONLY IF IT ALREADY EXISTS {
      function! UpdateSession()
        let b:sessiondir = $HOME . "/.vim_session" . getcwd()
        let b:sessionfile = b:sessiondir . "session.vim"
        if (filereadable(b:sessionfile))
          exe "mksession! " . b:filename
        endif
      endfunction
      " }

      " Loads a session if it exists {
      function! LoadSession()
        let b:sessiondir = $HOME . "/.vim_sessions" . getcwd()
        let b:sessionfile = b:sessiondir . "/session.vim"
        if (filereadable(b:sessionfile))
          exe 'source ' b:sessionfile
        else
          echo "No session loaded."
        endif
      endfunction
      " }

      " Mapping session {
      "au VimEnter * nested :call LoadSession()
      au VimLeave * :call UpdateSession()
      map ,l :call LoadSession()<CR>
      map ,m :call MakeSession()<CR>
      " }

  " }

" }

" Section: cstmcmds {

" For when you forget to sudo.. Really Write the file.
cmap w!! w !sudo tee % >/dev/null

"Format html
command Thtml set ft=html | execute "%!tidy -q -i"

"Format xml
"command Txml set ft=xml | execute "%!tidy -q -i"

"Use xmllint instead of tidy
command Txml set ft=xml | execute "%!xmllint --format --recover - 2>/dev/null"

"Format json
command Tjs set ft=json | execute "%!jq ."
" }

" Section: flds {
autocmd BufRead *.vim,.*vimrc set foldenable foldmethod=marker foldlevel=0
set foldmethod=syntax
set foldmarker={,}
" }

" Formatting {

autocmd FileType c,cpp,java,go,javascript,python,rst,ruby,rust,yml,perl autocmd BufWritePre <buffer> call StripTrailingWhitespace()
autocmd FileType haskell,python,ruby,yml setlocal expandtab shiftwidth=2 softtabstop=2

set splitright           " Puts new vsplit windows to the right of the current
set splitbelow           " Puts new split windows to the bottom of the current
set matchpairs+=<:>,`:'  " Match, to be used with %

" }
" vim: set et tw=79 foldmarker={,} foldlevel=0 foldmethod=marker spell:
