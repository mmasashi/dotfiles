" -----------------------
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

set modeline

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
" set expandtab

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
:autocmd FileType ruby set ts=2 sw=2 expandtab
:autocmd FileType *.rb set ts=2 sw=2 expandtab
:autocmd BufNewFile *.js set ft=javascript fenc=utf-8

" -----------------------
" NeoBundle
" -----------------------
set nocompatible
filetype off
set rtp+=~/dotfiles/neobundle.vim
if has('vim_starting')
  set runtimepath+=~/dotfiles/neobundle.vim
  call neobundle#rc(expand('~/.vim/'))
endif
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'clones/vim-l9'
NeoBundle 'The-NERD-tree'
NeoBundle 'The-NERD-Commenter'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'othree/eregex.vim'
let g:eregex_default_enable = 0
NeoBundle 'thinca/vim-ref'
"syntastic
"NeoBundle 'tpope/vim-pathogen'
"NeoBundle 'scrooloose/syntastic'
"call pathogen#infect()
"let g:syntastic_mode_map = { 'mode': 'active',
"  \ 'active_filetypes': [],
"  \ 'passive_filetypes': ['html', 'ruby', 'rb'] }

"html
NeoBundle 'tpope/vim-haml'
"ruby
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-cucumber'
NeoBundle 'janx/vim-rubytest'
"js
NeoBundle 'JavaScript-syntax'
NeoBundle 'itspriddle/vim-javascript-indent'
"db
NeoBundle 'dbext.vim'

filetype plugin indent on     " required!

" -----------------------
" other
" -----------------------
set hidden
"set shortmess+=I

set list
set listchars=tab:>-,trail:-,nbsp:%,extends:>,precedes:<
