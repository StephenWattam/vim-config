" ---------- misc.
set nocompatible
set bs=2
set nowrapscan
set showmatch
set showmode
set uc=0
set t_kD=^?
map ^H X
map \e[3~ x
set hlsearch
set autoindent
set smartindent
let c_comment_strings=1
" set visualbell




" ---------- No default terminal width
set tw=0
set lbr " line breaks on handy chars, best with line numbering on


" ---------- C style indents
set cindent



" ---------- Colours
set background=dark
set t_Co=256    " terminal colours
" color candycode
" color rdark 
" color xoria256 
" color wombat 
color wombat256 
" color wombat256mod 
" color manuscript 
" color railscasts


" ---------- Fonts
"set gfn=Neep\ Alt\ 8
"set gfn=CodingFontTobi\ 12
"set gfn=PixelCarnageMonoTT\ 12
"set gfn=AR\ PL\ Ukai\ HK\ 11
"set gfn=Terminus\ 8
" set gfn=Terminus\ 12
set gfn=ProggyCleanTT\ 12
"set gfn=Terminus\ 14
"set gfn=ProFont\ 9
"set gfn=Fixed\ 12
"set gfn=Numbus\ Mono\ L\ 12

" ---------- Folding & numbering
"foldingalicious
" set fdc=5
" or manual
"set fdm=indent
set fdm=indent

"set nu
"set numberwidth=2

" ---------- Enable mouse in console
set mouse=a


" ---------- Handled by the autocomplete plugin deely.
"set up the best autocomplete function for ^X^O
"set omnifunc=syntaxcomplete#Complete
"autocmd FileType python set omnifunc=pythoncomplete#Complete
"autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
"autocmd FileType css set omnifunc=csscomplete#CompleteCSS
"autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
"autocmd FileType php set omnifunc=phpcomplete#CompletePHP
"autocmd FileType c set omnifunc=ccomplete#Complete

" Make multi-line movement work a little more effortlessly for long lines
noremap  k gk
noremap  j gj
noremap <UP> gk
noremap <DOWN>  gj
" Turn off arrow keys (handy to force you to use hjkl)
" nnoremap <Left> :echoe "Use h"<CR>
" nnoremap <Right> :echoe "Use l"<CR>
" nnoremap <Up> :echoe "Use k"<CR>
" nnoremap <Down> :echoe "Use j"<CR>"
" inoremap <up> <nop>
" inoremap <down> <nop>
" inoremap <left> <nop>
" inoremap <right> <nop>



" Color for xiterm, rxvt, nxterm, color-xterm :
if has("terminfo")
set t_Co=8
set t_Sf=\e[3%p1%dm
set t_Sb=\e[4%p1%dm
else
set t_Co=8
set t_Sf=\e[3%dm
set t_Sb=\e[4%dm
endif

" ------ Save the buffer config when opening and closing files.
au BufWinLeave * if expand("%") != "" | mkview | endif
au BufWinEnter * if expand("%") != "" | silent loadview | endif
"au BufWinLeave * mkview
"au BufWinEnter * silent loadview

"autocmd WinLeave * if expand("%") != "" | mkview | endif
"autocmd WinEnter * if expand("%") != "" | loadview | endif



" -------- Control-F11 toggles menubar display
nmap <C-F11> :if &guioptions=~'m' \| set guioptions-=m \| else \| set guioptions+=m \| endif
set guioptions+=T   " if showing toolbar, include tearoff items 
set guioptions-=T   " no toolbar
set guioptions-=M   " Don't even load the menu, must be set before syntax/filetype on.
set guioptions-=m   " no menu
set guioptions-=r   " no RHS scrollbar
set guioptions=aA  " cancel e for ascii tabs and apply modeful select for X copying
set guioptions+=l   " an LHS scrollbar, like rxvt
set guioptions+=L   " an LHS scrollbar with window split
set guioptions+=h  " a bottom scrollbar only the size of the current line (less CPU pain)
" Change colour of statusline in insert mode
au InsertEnter * hi StatusLine ctermbg=DarkBlue
au InsertLeave * hi StatusLine ctermfg=Black ctermbg=White


" --------- Soft tabs, 4 wide.
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
let g:haskell_indent_if = 2  "Special rules for haskell indenting

" -------- highlightalicious
syntax on
filetype indent plugin on  "filetype specific indents and plugins on

" --------- chdir into the current buffer's pwd.
"set autochdir

" --------- Don't allow hidden buffers
"set nohidden

" --------- Hide mouse when typing.
set mousehide

" --------- makes lusty play nicely
set hidden

" --------- spare stuff, configure when bored:
"
"Vimscript
autocmd FileType vim setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4
"" Shell
autocmd FileType sh setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4
"" Lisp
autocmd Filetype lisp,scheme setlocal equalprg=~/.vim/bin/lispindent.lisp expandtab shiftwidth=2 tabstop=8 softtabstop=2
"" Ruby
autocmd FileType ruby,yaml setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2 ai 
"" PHP
autocmd FileType php setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
"" X?HTML & XML
autocmd FileType html,xhtml,xml setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
"" CSS
autocmd FileType css setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
"" JavaScript
"" autocmd BufRead,BufNewFile *.json setfiletype javascript
autocmd FileType javascript setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
"let javascript_enable_domhtmlcss=1



" Nicer indent and editing behaviour, esp. in comments
" set formatoptions+=rcj
set formatoptions+=rc



" Load matchit (% to bounce from do to end, etc.)
runtime! plugin/matchit.vim



"if has('gui_running')
"	color rdark
"endif

" Thanks to https://github.com/krisleech/vimfiles/blob/master/vimrc
" Ignore some binary, versioning and backup files when auto-completing
set wildignore=.svn,CVS,.git,*.swp,*.jpg,*.png,*.gif,*.pdf,*.bak
" Set a lower priority for .old files
set suffixes+=.old


" When vimrc, either directly or via symlink, is edited, automatically reload it
autocmd! bufwritepost .vimrc source %
autocmd! bufwritepost vimrc source %



" ======================= Status Line ==============================================
set statusline=%f       "tail of the filename
set statusline+=\ [%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%y      "filetype
set statusline+=%h      "help file flag
set statusline+=%r      "read only flag
set statusline+=%m      "modified flag

set statusline+=%=      "left/right separator
set statusline+=%o,       "Number of byte under cursor
set statusline+=%c,      "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ (%P)    "percent through file


" first, enable status line always
set laststatus=2
" now set it up to change the status line based on mode
if version >= 700
  " These colours are taken from wombat256 and won't necessarily look good with other themes
  au InsertEnter * hi StatusLine	ctermfg=7		ctermbg=238		cterm=none		guifg=#444444	guibg=#f6f3e8	gui=italic
  au InsertLeave * hi StatusLine	ctermfg=7		ctermbg=238		cterm=none		guifg=#f6f3e8	guibg=#444444	gui=italic
endif
