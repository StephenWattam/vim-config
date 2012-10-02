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
" set visualbell






" =====================================================================================
" Folding and Numbering
" =====================================================================================
"foldingalicious
" set fdc=5
" or manual
set fdm=indent

" Numbering
"set nu
"set numberwidth=2





" =====================================================================================
" Buffer Handling and Views
" =====================================================================================

" Save the buffer config when opening and closing files.
au BufWinLeave * if expand("%") != "" | mkview | endif
au BufWinEnter * if expand("%") != "" | silent loadview | endif





" =====================================================================================
" GUI options
" =====================================================================================
" Set Control-F11 to toggle menubar display in gvim
nmap <C-F11> :if &guioptions=~'m' \| set guioptions-=m \| else \| set guioptions+=m \| endif

" Set gui options to non-GTK
set guioptions+=T       " if showing toolbar, include tearoff items 
set guioptions-=T       " no toolbar
set guioptions-=M       " Don't even load the menu, must be set before syntax/filetype on.
set guioptions-=m       " no menu
set guioptions-=r       " no RHS scrollbar
set guioptions=aA       " cancel e for ascii tabs and apply modeful select for X copying
set guioptions+=l       " an LHS scrollbar, like rxvt
set guioptions+=L       " an LHS scrollbar with window split
set guioptions+=h       " a bottom scrollbar only the size of the current line (less CPU pain)

" Hide mouse when typing.
set mousehide

" Enable mouse in console
set mouse=a

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






" =====================================================================================
" Fonts
" =====================================================================================
"set gfn=Neep\ Alt\ 8
"set gfn=CodingFontTobi\ 12
"set gfn=PixelCarnageMonoTT\ 12
"set gfn=AR\ PL\ Ukai\ HK\ 11
"set gfn=Terminus\ 8
"set gfn=Terminus\ 12
set gfn=ProggyCleanTT\ 12
"set gfn=Terminus\ 14
"set gfn=ProFont\ 9
"set gfn=Fixed\ 12
"set gfn=Numbus\ Mono\ L\ 12







" =====================================================================================
" Colour Schemes
" =====================================================================================
set background=dark " default fallback
" color candycode
" color rdark 
" color xoria256 
" color wombat 
color wombat256 
" color wombat256mod 
" color manuscript 
" color railscasts









" =====================================================================================
" Editing Behaviour
" =====================================================================================

" No default terminal width
set tw=0


" line breaks on handy chars, best with line numbering on
set lbr 


" Disabled: chdir into the current buffer's pwd.
"set autochdir


" Disabled: Don't allow hidden buffers
"set nohidden


" Nicer indent and editing behaviour, esp. in comments
set formatoptions+=rc


" Set Home behaviour to work with indented code
" Moves to first nonblank char, rather than first column
noremap <expr> <silent> <Home> col('.') == match(getline('.'),'\S')+1 ? '0' : '^'
imap <silent> <Home> <C-O><Home>


" Make multi-line movement work a little more effortlessly for long lines
noremap  k gk
noremap  j gj
noremap <UP> gk
noremap <DOWN>  gj


" Disabled: Turn off arrow keys (handy to force you to use hjkl)
" nnoremap <Left> :echoe "Use h"<CR>
" nnoremap <Right> :echoe "Use l"<CR>
" nnoremap <Up> :echoe "Use k"<CR>
" nnoremap <Down> :echoe "Use j"<CR>"
" inoremap <up> <nop>
" inoremap <down> <nop>
" inoremap <left> <nop>
" inoremap <right> <nop>






" =====================================================================================
" Highlights and Indents
" =====================================================================================
 
" Set nicer indent rules and C style commenting
set autoindent
set smartindent
let c_comment_strings=1
set cindent


" Enable Highlighting
syntax on


" By default, use soft tabs, 4 chars wide
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
let g:haskell_indent_if = 2  "Special rules for haskell indenting


" Turn filetype specific indent plugins on
filetype indent plugin on  


" Then override per filetype with style guide defaults
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







" =====================================================================================
" Status line
" =====================================================================================
" Turn on a persistent status line and configure it to display pertinent information
" about the current file
" 2 is "always displayed", rather than only when windowed
set laststatus=2

if has("statusline")
    set statusline=%f                                       "tail of the filename
    set statusline+=\ [
    if has("multi_byte")
        set statusline+=%{&enc}:%{strlen(&fenc)?&fenc:&enc},       "vim encoding//file encoding
        set statusline+=%{(&bomb\ !=\ 0)?'bom,':''}             " FIXME: Does the file have a byte order marker?
    end
    set statusline+=%{&ff}]                                 "file format
    set statusline+=%y                                      "filetype
    set statusline+=%h                                      "help file flag
    set statusline+=%r                                      "read only flag
    set statusline+=%m                                      "modified flag
    "
    set statusline+=%=                                      "left/right separator
    "
    set statusline+=%o,                                     "Number of byte under cursor
    set statusline+=%c/%{(&tw\ ==\ 0)?'-':&tw},             "cursor column/text width
    set statusline+=%l/%L                                   "cursor line/total lines
    set statusline+=\ (%P)                                  "percent through file
endif

" Invert colours when in insert mode.  Makes it possible
" to instantly recognise mode even when on the console
if version >= 700
  au InsertEnter * hi StatusLine	gui=reverse
  au InsertLeave * hi StatusLine	gui=none
endif






" =====================================================================================
" Plugin config
" =====================================================================================

" Load matchit (% to bounce from do to end, etc.)
runtime! plugin/matchit.vim






" =====================================================================================
" File Handling 
" =====================================================================================

" Thanks to https://github.com/krisleech/vimfiles/blob/master/vimrc
" Ignore some binary, versioning and backup files when auto-completing
set wildignore=.svn,CVS,.git,*.swp,*.jpg,*.png,*.gif,*.pdf,*.bak
" Set a lower priority for .old files
set suffixes+=.old


" When vimrc, either directly or via symlink, is edited, automatically reload it
autocmd! bufwritepost .vimrc source %
autocmd! bufwritepost vimrc source %


" Set encoding to UTF-8 by default (if supported in vim)
if has("multi_byte")
    " Save the current value of encoding as the terminal encoding
    if &termencoding == ""
        let &termencoding = &encoding
    endif

    set encoding=utf-8                      " Set vim to use utf8
    setglobal fileencoding=utf-8            " Set default new file to utf8
    "set bomb                               " Use a byte order marker when saving?
                                            " only necessary if using UCS, UTF16, UTF32
                                            " for utf-8, this is left off.
    set fileencodings=ucs-bom,utf-8,default,latin1  " Consider these encodings in order when opening unicode files.
endif

" =====================================================================================
" Local Modifications
" =====================================================================================
" Lastly, load local vimrc mods if they exist.
if filereadable("~/.vimrc.local")
    source ~/.vimrc.local
endif
