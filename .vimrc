syntax enable
filetype on
filetype indent on
filetype plugin on

" Fast editing of the .vimrc
"map e :e! ~/.vimrc
"
" " When vimrc is edited, reload it
autocmd! bufwritepost .vimrc source ~/.vimrc
"
" indent related
set backspace=indent,eol,start
set smarttab
set expandtab
set sw=4
set tabstop=4
set softtabstop=4
"
" " other view settings, some redundant
set t_Co=256
set number
set autoindent
set smartindent
set showcmd
set showmatch
set ruler
set tw=0
set hlsearch
set incsearch
set magic
"
" " I don't like swap files
" set noswapfile
:highlight Pmenu ctermbg=238 ctermfg=white gui=bold
"
" " for tmux
set mouse=a
set ttymouse=xterm
"
" " following taken from http://items.sjbach.com/319/configuring-vim-right
set hidden
runtime macros/matchit.vim
set wildmenu
set wildmode=list:longest
set title
set visualbell
"
" "mappings
" " fast saves
" " fast quit
" " and tag/tree toggling
"nmap  :w <C-s>
"adss
":nmap  :wall
":map  :qall
":map  :TlistToggle
":map  :NERDTreeToggle
":map  :FuzzyFinderFile
"
:let NERDTreeQuitOnOpen = 1
"
" " ignore case when searching
:set ignorecase
" " but if any character is typed uppercase, respect the case
:set smartcase
"
:set wildignore=*.o,*.pyc
set completeopt=menuone,menu,longest,preview
"
:set scrolloff=8
"
:set wm=4

" " use ack instead of grep for vimgrep
:set grepprg=ack
"
" " abbreviations
" " useful
" iab Nikhil Marathe  Nikhil Marathe 
" iab =strftime(&quot;%d/%m/%y %H:%M:%S&quot;) =strftime("%d/%m/%y %H:%M:%S")
"
let g:GetLatestVimScripts_allowautoinstall=1
"
" " Tell vim to remember certain things when we exit
" "  '10 : marks will be remembered for up to 10 previously edited files
" "  "100 : will save up to 100 lines for each register
" "  :20 : up to 20 lines of command-line history will be remembered
" "  % : saves and restores the buffer list
" "  n... : where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo
"
" " when we reload, tell vim to restore the cursor to the saved position
augroup JumpCursorOnEdit
 au!
  autocmd BufReadPost *
   \ if expand(":p:h") !=? $TEMP |
   \ if line("'\"") > 1 && line("'\"") <= line("$") |
   \ let JumpCursorOnEdit_foo = line("'\"") |
 \ let b:doopenfold = 1 |
 \ if (foldlevel(JumpCursorOnEdit_foo) > foldlevel(JumpCursorOnEdit_foo - 1)) |
 \ let JumpCursorOnEdit_foo = JumpCursorOnEdit_foo - 1 |
 \ let b:doopenfold = 2 |
 \ endif |
 \ exe JumpCursorOnEdit_foo |
 \ endif |
 \ endif
 " Need to postpone using "zv" until after reading the modelines.
  autocmd BufWinEnter *
\ if exists("b:doopenfold") |
\ exe "normal zv" |
\ if(b:doopenfold > 1) |
\ exe "+".1 |
\ endif |
\ unlet b:doopenfold |
\ endif
augroup END
 " reduce vi compatibility for more usefult stuff
"
:runtime! ftplugin/man.vim
 "
"vnoremap  * :call VisualSearch('f')
"vnoremap  # :call VisualSearch('b')
 "
 "         " Smart way to move btw. windows
map  <C-J> <C-W>j<C-W>_
map  <C-K> <C-W>k<C-W>_
 "
 "         " Allow Ctrl+PgUp/PgDn in tmux
 
set nocp
