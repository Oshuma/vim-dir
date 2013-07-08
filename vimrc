set nocompatible
filetype off

"
" Vundle
"
set rtp+=~/.vim/vundle.git/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'kien/ctrlp.vim'
Bundle 'fugitive.vim'
Bundle 'L9'
Bundle 'tpope/vim-rails'
Bundle 'snipMate'
Bundle 'surround.vim'
Bundle 'Tabular'
Bundle 'scrooloose/nerdcommenter'
Bundle 'The-NERD-tree'
Bundle 'majutsushi/tagbar'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'groenewege/vim-less'
Bundle 'Lokaltog/vim-powerline'
Bundle 'slim-template/vim-slim'
Bundle 'ZoomWin'


"
" Vim options
"
set t_Co=256 " Use 256 colors.
colorscheme desert

set backup
set backupdir=$HOME/.vim/backups
set backupext=.bak
set directory=$HOME/.vim/tmp
set encoding=utf-8
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
augroup filetype_java
  autocmd!
  autocmd FileType java,xml set autoindent shiftwidth=4 softtabstop=4 expandtab
augroup END

" Set a Gemfile as ruby filetype.
augroup filetype_gemfile
  autocmd!
  autocmd BufNewFile,BufRead Gemfile set filetype=ruby
augroup END

" Set a Guardfile as ruby filetype.
augroup filetype_guardfile
  autocmd!
  autocmd BufNewFile,BufRead Guardfile set filetype=ruby
augroup END

" Highlight the 'DEBUG' word.
highlight Debug ctermbg=red ctermfg=white guibg=red guifg=white
match Debug /DEBUG/

" GUI specific options
if has("gui_running")
  set guifont=Ubuntu\ Mono\ 14
  set guioptions-=T " Remove the toolbar.
  set guioptions-=m " Remove the menubar.
endif

" Don't match things in ./.git
if filereadable("./.git")
  set wildignore+=.git
endif

" Android - Don't match things in bin/ and gen/
if filereadable("./AndroidManifest.xml")
  set wildignore+=bin,gen
endif

" Rails - Don't match generated docs, coverage, and tmp/
if filereadable("./script/rails")
  set wildignore+=doc/app,doc/coverage,tmp
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

let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1

" Use custom icons and arrows for Powerline (requires a patched font).
let g:Powerline_symbols = 'fancy'
" Uses unicode (doesn't need a patched font).
" let g:Powerline_symbols = 'unicode'

" Put a space after comment character with nerdcommenter.
let g:NERDSpaceDelims = 1

" CtrlP options
let g:ctrlp_map = '<Leader>t'
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)|tmp$'

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

nnoremap <Leader>gc :call NERDComment('nx', 'AlignLeft')<CR>
vnoremap <Leader>gc :call NERDComment('nx', 'AlignLeft')<CR>

nnoremap <Leader>b :CtrlPBuffer<CR>

syntax on

" This must be last.
filetype plugin indent on
