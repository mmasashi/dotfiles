" -----------------------
" Encoding
" -----------------------
set encoding=utf-8
scriptencoding utf-8

" -----------------------
" Basical setting
" -----------------------
set fileformats=unix,dos,mac
set backspace=indent,eol,start
set modeline
set nobackup
set noswapfile
set history=100

" -----------------------
" Search
" -----------------------
set ignorecase
set wrapscan
set noincsearch
set hlsearch

" -----------------------
" Display
" -----------------------
set number
set showcmd
set laststatus=2
set showmatch
set matchtime=2
syntax on
set wildmenu
set wrap

" highlight comments
highlight Comment ctermfg=DarkCyan

" highlight full-width space
highlight ZenkakuSpace cterm=underline ctermfg=lightblue
match ZenkakuSpace /　/

" statusline
set statusline=%n\:%y%F\ \|%{(&fenc!=''?&fenc:&enc).'\|'.&ff.'\|'}%m%r%=<%l/%L:%p%%>
highlight StatusLine term=NONE cterm=NONE ctermfg=black ctermbg=white

" -----------------------
" Indent
" -----------------------
set noautoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4

" -----------------------
" Filetype
" -----------------------
filetype on
filetype plugin indent on

autocmd FileType perl set cindent
autocmd FileType python set tabstop=4 shiftwidth=4 expandtab colorcolumn=80
autocmd FileType javascript set ts=2 sw=2 expandtab
autocmd FileType coffee set ts=2 sw=2 expandtab
autocmd FileType ruby set ts=2 sw=2 expandtab
autocmd FileType sh set ts=2 sw=2 expandtab
autocmd FileType java set ts=4 sw=4 expandtab
autocmd FileType c,cpp set ts=2 sw=2 expandtab
autocmd FileType json,yaml set ts=2 sw=2 sts=2 expandtab
autocmd FileType typescript,typescriptreact,javascriptreact set ts=2 sw=2 sts=2 expandtab
" Uncomment if editing react files causes slowness
" autocmd FileType json,typescript,typescriptreact,javascript,javascriptreact setlocal nowrap

autocmd BufRead,BufNewFile *.js set ft=javascript fenc=utf-8
autocmd BufRead,BufNewFile *.gradle set ts=4 sw=4 expandtab


" -----------------------
" Keymaps
" -----------------------

" open vimrc
nnoremap <Space>. :tabedit $MYVIMRC<CR>

" clear search highlight
nnoremap <silent> <Esc><Esc> :nohlsearch<CR>

" save with sudo
cmap w!! w !sudo tee > /dev/null %


" -----------------------
" Misc
" -----------------------

set hidden

set list
set listchars=tab:>-,trail:-,nbsp:%,extends:>,precedes:<

" -----------------------
"  Fuzzy file search
"  brew install fd ripgrep fzf
" -----------------------
set path+=**
set wildmenu

if executable('rg')
  set grepprg=rg\ --vimgrep\ --smart-case
  set grepformat=%f:%l:%c:%m
endif

" open file with fd + fzf
nnoremap <Leader>f :call OpenFzfFile()<CR>
function! OpenFzfFile()
  let file = substitute(system("sh -c 'fd -t f | fzf'"), '\n$', '', '')
  if empty(file)
    return
  endif
  execute 'edit ' . fnameescape(file)
endfunction
" grep current word with rg
nnoremap <Leader>g :execute 'silent grep! ' . expand('<cword>') . ' .' \| copen<CR>
