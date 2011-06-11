set nocompatible
filetype off

"
" Vundle
"
set rtp+=~/.vim/vundle.git/
call vundle#rc()

Bundle 'Command-T'
Bundle 'fugitive.vim'
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'rails.vim'
Bundle 'snipMate'
Bundle 'surround.vim'
Bundle 'Tabular'
Bundle 'tComment'
Bundle 'The-NERD-tree'
Bundle 'taglist.vim'
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
set foldlevelstart=1 " Close all but the top-level fold.
set hidden
set history=100
set hlsearch
set noincsearch
set nowrap
set ruler
set scrolloff=2
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

" Use 4 spaces for tabs in java files.
autocmd FileType java set autoindent shiftwidth=4 softtabstop=4 expandtab

" Highlight the 'DEBUG' word.
highlight Debug ctermbg=red ctermfg=white guibg=red guifg=white
match Debug /DEBUG/

" GUI specific options
if has("gui_running")
  " Remove the toolbar.
  set guioptions-=T
end


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
let Tlist_Ctags_Cmd = '/usr/bin/ctags'
let Tlist_Sort_Type = 'name'
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Close_On_Select = 1
let Tlist_Use_Right_Window = 1
let Tlist_WinWidth = 35
let Tlist_Enable_Fold_Column = 0
let Tlist_Inc_Winwidth = 0 " Don't auto-resize the vim window.


"
" Key / Command Binds
"
let mapleader = ','

" Swap the 'go to mark' cursor/column keys.
noremap ' `
noremap ` '

" Re-select after indenting.
vnoremap < <gv
vnoremap > >gv

" Use ':w!!' to write a file with sudo.
cmap w!! %!sudo tee > /dev/null %

nnoremap <F1> :emenu <C-Z>
nnoremap <silent> <F2> :NERDTreeToggle<CR>
nnoremap <silent> <F4> :TlistToggle<CR>

map <Leader>b :FufBuffer<CR>

" Clear highlighted search with <Leader>/
nmap <silent> <Leader>/ :let @/=""<CR>

" Clear trailing whitespace (and clear the previous highlighted search).
map <silent> <Leader>c :%s/\s\+$//g<CR><Leader>/

map <Leader>a= :Tabularize /=<CR>

nmap <C-t> :tabnew<CR>
nmap <C-h> :tabp<CR>
nmap <C-l> :tabn<CR>

nmap <C-p> :bprevious<CR>
nmap <C-n> :bnext<CR>

nmap <Leader>f zO
nmap <Leader>F zR

map <Leader>s :w<CR>
map <Leader>S :wa<CR>

map <Leader>y "+y<CR>
map <Leader>p "+p<CR>
map <Leader>P "+P<CR>

" This must be last.
filetype plugin indent on
