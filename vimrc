set nocompatible
filetype off

"
" Vundle
"
set rtp+=~/.vim/vundle.git/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'Command-T'
Bundle 'fugitive.vim'
Bundle 'L9'
" Bundle 'FuzzyFinder'
Bundle 'rails.vim'
Bundle 'snipMate'
Bundle 'surround.vim'
Bundle 'Tabular'
Bundle 'tComment'
Bundle 'The-NERD-tree'
" Bundle 'taglist.vim'
Bundle 'majutsushi/tagbar'
Bundle 'ZoomWin'


"
" Vim options
"
colorscheme desert
set backup
set backupdir=$HOME/.vim/backups
set backupext=.bak
set directory=$HOME/.vim/tmp
set foldmethod=indent
" set foldlevelstart=1  " Close all but the top-level fold.
set foldlevelstart=9999 " All folds open.
set hidden
set history=100
set hlsearch
set noincsearch
set nowrap
set ruler
set scrolloff=2
set showmatch
set title

" Indenting shit
set autoindent
set backspace=start,eol,indent
set expandtab
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2

set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%04l,%04v][%p%%]\ [LINES=%L]
set laststatus=2

" Better matching with the % command
runtime macros/matchit.vim

" Enable the menu in console mode.
runtime menu.vim
set cpoptions-=<
set wildmenu
set wildcharm=<C-Z>

" Use 4 spaces for tabs in java and xml files.
autocmd FileType java,xml set autoindent shiftwidth=4 softtabstop=4 expandtab

" Set a Gemfile as ruby filetype.
autocmd BufRead Gemfile set filetype=ruby

" Highlight the 'DEBUG' word.
highlight Debug ctermbg=red ctermfg=white guibg=red guifg=white
match Debug /DEBUG/

" GUI specific options
if has("gui_running")
  set guioptions-=T " Remove the toolbar.
  set guioptions-=m " Remove the menubar.
endif


" Android specific options
if filereadable("./AndroidManifest.xml")
  set wildignore+=.git,bin,gen
endif

"
" Plugin options
"
let g:CommandTAcceptSelectionSplitMap = '<C-o>'
let g:CommandTCancelMap = '<ESC>'
let g:CommandTMatchWindowAtTop = 1
let g:CommandTMaxFiles = 5000
let g:CommandTMaxHeight = 20

let g:fuzzy_ignore = '*.log'
let g:fuzzy_matching_limit = 40

let NERDTreeQuitOnOpen = 1

" taglist.vim
" let Tlist_Ctags_Cmd = '/usr/bin/ctags'
" let Tlist_Sort_Type = 'name'
" let Tlist_GainFocus_On_ToggleOpen = 1
" let Tlist_Close_On_Select = 1
" let Tlist_Use_Right_Window = 1
" let Tlist_WinWidth = 35
" let Tlist_Enable_Fold_Column = 0
" let Tlist_Inc_Winwidth = 0 " Don't auto-resize the vim window.

let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1


"
" Key / Command Binds
"
let mapleader = ','

" Swap the 'go to mark' cursor/column keys.
noremap ' `
noremap ` '

" Use ':w!!' to write a file with sudo.
cmap w!! %!sudo tee > /dev/null %

nnoremap <F1> :emenu <C-Z>
nnoremap <silent> <F2> :NERDTreeToggle<CR>
nnoremap <silent> <left> <ESC>:NERDTreeToggle<CR>

" nnoremap <silent> <F4> :TlistToggle<CR>
" nnoremap <silent> <right> <ESC>:TlistToggle<CR>

nnoremap <silent> <F4> :TagbarToggle<CR>
nnoremap <silent> <right> <ESC>:TagbarToggle<CR>

" Clear highlighted search with <Leader>/
nnoremap <silent> <Leader>/ :let @/=""<CR>

" Clear trailing whitespace (and clear the previous highlighted search).
nnoremap <silent> <Leader>c :%s/\s\+$//ge<CR><Leader>/

nnoremap <Leader>a= :Tabularize /=<CR>

" Because Putty doesn't seem to pick up these keys.
" nnoremap <Leader>n :NERDTreeToggle<CR>
" nnoremap <Leader>m :TlistToggle<CR>

nnoremap <C-t> :tabnew<CR>
nnoremap <C-h> :tabp<CR>
nnoremap <C-l> :tabn<CR>

nnoremap <C-p> :bprevious<CR>
nnoremap <C-n> :bnext<CR>

nnoremap <Leader>f :set foldlevel=1<CR>
nnoremap <Leader>F zR

nnoremap <Leader>s :w<CR>
nnoremap <Leader>S :wa<CR>

nnoremap <Leader>y "+y<CR>
nnoremap <Leader>p "+p<CR>
nnoremap <Leader>P "+P<CR>

" This must be last.
filetype plugin indent on
