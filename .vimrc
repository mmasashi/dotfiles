set encoding=utf-8
scriptencoding utf-8
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
" enable modeline (Enable per-file vim settings written in a file)
set modeline

" -----------------------
" Backup setting
" -----------------------
" no backup
set nobackup
" set backup
" no swap file
set noswapfile

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
" show wildmenu
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
" Hotkey
" -----------------------
" open .vimrc
nnoremap <Space>. :<C-u>tabedit $MYVIMRC<CR>

" -----------------------
" Autocommand
" -----------------------
:filetype on
:autocmd FileType perl set cindent
:autocmd FileType python set tabstop=4 shiftwidth=4 expandtab colorcolumn=80
:autocmd FileType javascript set ts=2 sw=2 expandtab
:autocmd FileType coffee set ts=2 sw=2 expandtab
:autocmd FileType ruby set ts=2 sw=2 expandtab
:autocmd FileType sh set ts=2 sw=2 expandtab
:autocmd FileType java set ts=4 sw=4 expandtab
:autocmd FileType c,cpp set ts=2 sw=2 expandtab
:autocmd BufRead,BufNewFile *.js set ft=javascript fenc=utf-8
:autocmd BufRead,BufNewFile *.gradle set ts=4 sw=4 expandtab

" -----------------------
" Enable mouse
" -----------------------

let g:mouseenabled = 'off'
if mouseenabled == 'on' && has('mouse')
    set mouse=a
    if has('mouse_sgr')
        set ttymouse=sgr
    elseif v:version > 703 || v:version is 703 && has('patch632')
        set ttymouse=sgr
    else
        set ttymouse=xterm2
    endif
endif

" -----------------------
" Auto paste mode
" -----------------------
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

" -----------------------
" vim-plug
" -----------------------
call plug#begin()

" nerdtreee
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'

Plug 'othree/eregex.vim'
let g:eregex_default_enable = 0
Plug 'thinca/vim-ref'
Plug 'thinca/vim-quickrun'
Plug 'Shougo/deol.nvim'
Plug 'simeji/winresizer'

" deoplete
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
elseif has('python3')
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
else
  Plug 'Shougo/neocomplete.vim'
endif
let g:deoplete#enable_at_startup = 1

" denite
if has('nvim')
  Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
elseif has('python3')
  Plug 'Shougo/denite.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
else
  Plug 'Shougo/unite.vim'
endif

" html
Plug 'tpope/vim-haml'
" git
Plug 'tpope/vim-fugitive'
"ruby
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-cucumber'
Plug 'janx/vim-rubytest'
" js
Plug 'pangloss/vim-javascript'
" python
Plug 'nvie/vim-flake8'

" powerline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

"close tag automatically
augroup MyXML
    autocmd!
    autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
    autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
    autocmd Filetype eruby inoremap <buffer> </ </<C-x><C-o>
augroup END

" -----------------------
" Powerline
" -----------------------
set t_Co=256
" Note: This affects tmux
" set ambiwidth=double
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#whitespace#mixed_indent_algo = 1
" let g:airline_theme = 'papercolor'

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" old vim-powerline symbols
" let g:airline_left_sep = '⮀'
" let g:airline_left_alt_sep = '⮁'
" let g:airline_right_sep = '⮂'
" let g:airline_right_alt_sep = '⮃'
" let g:airline_symbols.branch = '⭠'
" let g:airline_symbols.readonly = '⭤'
" let g:airline_symbols.linenr = '⭡'

" -----------------------
" winresizer (Ctrl+e to start resizing a pane)
" -----------------------
let g:winresizer_vert_resize = 1
let g:winresizer_horiz_resize = 1

" -----------------------
" other
" -----------------------
set hidden
" Save as sudo
cmap w!! w !sudo tee > /dev/null %
" nohilight with double esc
nmap <silent> <Esc><Esc> :nohlsearch<CR>
set list
set listchars=tab:>-,trail:-,nbsp:%,extends:>,precedes:<
