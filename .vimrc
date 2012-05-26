"-----------------------
" Basical setting
" -----------------------
" no compatible to vi
" set noncompatible
" new line code 
set fileformats=unix,dos,mac
" no beep
set vb t_vb=
" backspace (eol=end of line, start=start of line)
set backspace=indent,eol,start

" -----------------------
" Backup setting
" -----------------------
" no backup
set nobackup
" set backup

" -----------------------
" Search setting
" -----------------------
" number of command history
set history=100
" ignore case when search
set ignorecase
" start from head line after search end
set wrapscan
" no incremental search
set noincsearch

" -----------------------
" Show settings
" -----------------------
" show title on window
"set title
" show number of line
set number
" show CTRL-I by tab and $ on end of line
" set list
" show command
set showcmd
" show always start line
set laststatus=2
" show match ()
set showmatch
set matchtime=2
" syntax hilight on
syntax on
" set hilight search words
set hlsearch
" set comment hilight
highlight Comment ctermfg=DarkCyan
" 
set wildmenu
" wrap line if over width of window
set wrap
" hilight Japanese space 
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /　/
" status line
set statusline=%n\:%y%F\ \|%{(&fenc!=''?&fenc:&enc).'\|'.&ff.'\|'}%m%r%=<%l/%L:%p%%>
highlight StatusLine term=NONE cterm=NONE ctermfg=black ctermbg=white

" -----------------------
" Indent setting
" -----------------------
" no auto indent
set noautoindent
" number of space on tab
set tabstop=4
set softtabstop=4
set shiftwidth=4
" use space with tab key
set expandtab

" -----------------------
" Encoding
" -----------------------
:set enc=utf-8
:set tenc=utf-8
:set fenc=utf-8
":set fencs=euc-jp,cp932,iso-2022-jp
":set fencs+=utf-8

" -----------------------
" Autocommand
" -----------------------
:filetype on
:autocmd FileType c,cpp,perl set cindent
:autocmd FileType python set tabstop=4 shiftwidth=4 expandtab
:autocmd FileType javascript set ts=2 sw=2 expandtab
:autocmd BufNewFile *.js set ft=javascript fenc=utf-8

" -----------------------
" Vundle
" -----------------------
set nocompatible
filetype off
set rtp+=~/.vim/vundle.git/
call vundle#rc()
Bundle 'Shougo/neocomplcache'
Bundle 'thinca/vim-quickrun'
Bundle 'clones/vim-l9'
Bundle 'FuzzyFinder'
Bundle 'The-NERD-tree'
Bundle 'The-NERD-Commenter'
"ruby
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-cucumber'
"js
Bundle 'JavaScript-syntax'
Bundle 'itspriddle/vim-javascript-indent'
"php
Bundle 'cakephp.vim'
filetype plugin indent on     " required!

" -----------------------
" other
" -----------------------
set hidden
"set shortmess+=I

