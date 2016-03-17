" ======== Plugins ========

call plug#begin('~/.config/nvim/plugged')
" utils
Plug 'morhetz/gruvbox' " color scheme
Plug 'vim-airline/vim-airline' " status bar
Plug 'ctrlpvim/ctrlp.vim' " file finder
Plug 'ryanoasis/vim-devicons' " icons
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] } | Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-surround' " easily delete, change and add surroundings
Plug 'tpope/vim-fugitive' " git wrapper
Plug 'Lokaltog/vim-easymotion' " easily move through file
Plug 'tpope/vim-repeat' " repeat last command using the . for supported plugins
Plug 'tomtom/tcomment_vim' " file-type sensible comments
Plug 'sheerun/vim-polyglot' " a solid language pack
Plug 'kassio/neoterm' " wrapper of some neovim's :terminal functions
Plug 'vim-scripts/YankRing.vim' " provide mechanism to reference previous yanded, deleted or changed text
Plug 'cohama/lexima.vim' " auto close parentheses
Plug 'tpope/vim-fireplace' " REPL for Clojure
Plug 'kien/rainbow_parentheses.vim' " diferent colors for parentheses
Plug 'rking/ag.vim' " grep
call plug#end()

" ======== General Settings ========
let mapleader = " "

set number      " display line numbers
set showcmd     " dislpay incomplete commands
set hidden      " hiden current unsaved buffer instead of closing when open a new file
set noswapfile  " stop vim from creating swap files
set nobackup    " stop vim from creating backup files
set nowb        " prevent automatic write backup before overwriting file
set visualbell  " no sounds
set scrolloff=5 " scrollwne closing to top or bottom of the screen
syntax on       " turn on syntax highlighting

" indentation
set smartindent

" 2 spaces tab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

set list listchars=tab:\ \ ,trail:· " display tabs and trailing spaces visually

set nowrap    " don't wrap lines
set linebreak " wrap lines at convenient points

" completion
set wildmode=list:longest
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing and ctrlp searching
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" search
set ignorecase " ignore case when searching...
set smartcase  " ...unless we type a capital

" color scheme
let $NVIM_TUI_ENABLE_TRUE_COLOR=1 " enable 24 bit colors
colorscheme gruvbox
set background=dark

" ======== Plugin Settings ========

" ======== Airline
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_left_sep=' '
let g:airline_right_sep=' '

" ======== CtrlP ========

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag -Q -l --nocolor --hidden -g "" %s'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" ======== Easymotion

let g:EasyMotion_do_mapping = 0 " Disable default mappings
let g:EasyMotion_smartcase = 1 " Turn on case insensitive feature

" ======== Neoterm

let g:neoterm_rspec_lib_cmd = "spring rspec"
let g:neoter_cucumber_lib_cmd = "cucumber"

" ======== Rainbow Parentheses

" always on
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" ======== Mapping ========

" surround a word with "quotes"
nnoremap <Leader>" ysiw"
vnoremap <Leader>" c"<C-R>""<ESC>

" surround a word with 'single quotes'
nnoremap <Leader>' ysiw'
vnoremap <Leader>' c'<C-R>"'<ESC>

" surround a word with (parens)
" The difference is in whether a space is put in
nnoremap <Leader>( ysiw(
nnoremap <Leader>) ysiw)
vnoremap <Leader>( c( <C-R>" )<ESC>
vnoremap <Leader>) c(<C-R>")<ESC>

" surround a word with [brackets]
nnoremap <Leader>] ysiw]
nnoremap <Leader>[ ysiw[
vnoremap <Leader>[ c[ <C-R>" ]<ESC>
vnoremap <Leader>] c[<C-R>"]<ESC>

" surround a word with {braces}
nnoremap <Leader>} ysiw}
nnoremap <Leader>{ ysiw{
vnoremap <Leader>} c{ <C-R>" }<ESC>
vnoremap <Leader>{ c{<C-R>"}<ESC>

" Move between split windows by using the four directions H, L, K, J
nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-l> <C-w>l
nnoremap <silent> <C-k> <C-w>k
nnoremap <silent> <C-j> <C-w>j

" Remap H and L (top, bottom of screen to left and right end of line)
nnoremap H ^
nnoremap L $
vnoremap H ^
vnoremap L g_

" copy current filename into system clipboard - mnemonic: (c)urrent(f)ilename
" this is helpful to paste someone the path you're looking at
nnoremap <silent> <Leader>cf :let @* = expand("%:~")<CR>
nnoremap <silent> <Leader>cn :let @* = expand("%:t")<CR>

" clear current search highlight by double tapping //
nnoremap <silent> // :nohlsearch<CR>

" copy & paste to system clipboard
vnoremap <Leader>y "+y
vnoremap <Leader>d "+d
nnoremap <Leader>p "+p
nnoremap <Leader>P "+P
vnoremap <Leader>p "+p
vnoremap <Leader>P "+P

" save file
nnoremap <Leader>w :w<CR>

" close file
nnoremap <Leader>q :q<CR>

" Resize windows
" alt-h
map <silent> ˙ <C-w><
" alt-j
map <silent> ∆ <C-W>-
" alt-k
map <silent> ˚ <C-W>+
" alt-l
map <silent> ¬ <C-w>>

" jump over character in insert mode
imap <C-f> <C-o>a<C-o>l

" move between terminal and other windows
:tnoremap <C-h> <C-\><C-n><C-w>h
:tnoremap <C-j> <C-\><C-n><C-w>j
:tnoremap <C-k> <C-\><C-n><C-w>k
:tnoremap <C-l> <C-\><C-n><C-w>l

" exit terminal mode
:tnoremap <ESC> <C-\><C-n>

" ESC for terminal
:tnoremap <C-e> <ESC>

" ======== NERD tree

" Open the project tree and expose current file in the nerdtree
nnoremap <silent> <C-\> :NERDTreeFind<CR>:vertical<CR>

" ======== CtrlP
nnoremap <Leader>o :CtrlP<cr>

" ======== Easymotion

" f{char} to move to {char}
vmap <Leader>f <Plug>(easymotion-db-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
vmap s <Plug>(easymotion-bd-f2)
nmap s <Plug>(easymotion-overwin-f2)

" line motions
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

" ======== tComment
nmap <Leader>/  gcc
vmap <Leader>/  gc

" ======== Neoterm

" run tests
nnoremap <Leader>ra :call neoterm#test#run('all')<cr>
nnoremap <Leader>rf :call neoterm#test#run('file')<cr>
nnoremap <Leader>rc :call neoterm#test#run('current')<cr>
nnoremap <Leader>rr :call neoterm#test#rerun()<cr>

" toggle last terminal
nnoremap <Leader>tt :Ttoggle<cr>

" create new terminal
nnoremap <Leader>tn :Tnew<cr>

" open terminal with number
nnoremap <Leader>to :Topen

" hide terminal with number
nnoremap <Leader>th :Tclose

" Fugitive
nmap <Leader>gs :Gstatus<CR>
nmap <Leader>gd :Gdiff<CR>
nmap <Leader>gr :Gread<CR>
nmap <Leader>gw :Gwrite<CR>
nmap <Leader>gc :Gcommit<CR>
nmap <Leader>ge :Gedit<CR>
nmap <Leader>gl :Glog<CR>

nmap <Leader>gg :Ggrep<Space>
nmap <Leader>gm :Gmove<Space>
nmap <Leader>gb :Git branch<Space>
nmap <Leader>go :Git checkout<Space>

" work with diffs
xnoremap dp :diffput<cr>
xnoremap do :diffget<cr>

" Ag
nmap <Leader>ag :Ag<Space>
