" -----------------------
"  Macvim setting
" -----------------------
if has('gui_macvim')
  set guifont=Monaco:h11        "set font and font size
  set antialias
  set transparency=7
  set fuoptions=maxvert,maxhorz "set max height and width on the full screen mode
endif

" -----------------------
"  GUI setting
" -----------------------
"lset showtabline=2   "show tab line always
set guioptions-=T     "hide toolbar
set guioptions-=L     "hide left scrollbar
set guioptions-=l     "hide left scrollbar
set guioptions-=R     "hide right scrollbar
set guioptions-=r     "hide right scrollbar
set background=dark   "set the background color
"set cmdheight=2       "height of command line

" https://github.com/jpo/vim-railscasts-theme
colorscheme railscasts
