if !&compatible
  set nocompatible
endif

" reset augroup
augroup MyAutoCmd
  autocmd!
augroup END
" dein settings {{{ dein自体の自動インストール
let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim ' .
  shellescape(s:dein_repo_dir))
endif
let &runtimepath = s:dein_repo_dir .",". &runtimepath
" プラグイン読み込み＆キャッシュ作成
let s:toml_file = fnamemodify(expand('<sfile>'), ':h').'/dein.toml'
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  call dein#load_toml(s:toml_file)
  call dein#end()
  call dein#save_state()
endif
" 不足プラグインの自動インストール
if has('vim_starting') && dein#check_install()
  call dein#install()
endif
" }}}

filetype on
filetype plugin indent on
filetype indent on

set encoding=utf-8
set fileencodings=utf-8,ucs-bom,iso-2022-jp-3,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932
scriptencoding utf-8
set fileformats=unix,dos,mac

"setting
set number "line
set showmode "showmode
set ruler
set showcmd
set showmatch
nmap <Esc><Esc> :nohlsearch<CR><Esc>
set cursorline
set wildmenu
set title
set backspace=indent,eol,start
set tabstop=2
set shiftwidth=2
set expandtab
set nocp
set whichwrap=b,s,h,l,<,>,[,],~
set ignorecase
set lazyredraw
:au FocusLost * silent! wa

"search
set ignorecase
set smartcase
set wrapscan
set hlsearch
set incsearch

" fold
" set foldenable
" set foldnestmax=3
" nnoremap <space> za
" set foldmethod=indent

"display
syntax on
colorscheme koehler
"set autoindent
set smartindent
set smarttab
set expandtab
set cindent
set statusline=2
set laststatus=2

"enable mouse
if has("mouse") " Enable the use of the mouse in all modes
  set mouse=a
endif
"parantheses match
vnoremap { "zdi{z}
vnoremap {" "zdi{"z"}
vnoremap {' "zdi{'z'}
vnoremap [ "zdi[z]
vnoremap [" "zdi["z"]
vnoremap [' "zdi['z']
vnoremap ( "zdi(z)
vnoremap (" "zdi("z")
vnoremap (' "zdi('z')
set completeopt=menuone
nnoremap j gj
nnoremap k gk
nmap <up> gk
nmap <down> gj
imap <c-j> <esc>

if &term =~ "xterm"
  let &t_SI .= "\e[?2004h"
  let &t_EI .= "\e[?2004l"
  let &pastetoggle = "\e[201~"

  function XTermPasteBegin(ret)
    set paste
    return a:ret
  endfunction

  inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif

set noswapfile
autocmd BufLeave,FocusLost * silent! wall

set backupskip=/tmp/*,/private/tmp/*

if has('win32') || has('win64') || has('mac')
  set clipboard+=unnamed,unnamedplus
else
  set clipboard+=unnamed,unnamedplus
endif

set secure


