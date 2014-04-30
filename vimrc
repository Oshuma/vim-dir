set nocompatible
filetype off

"
" Vundle
"
set rtp+=~/.vim/vundle.git/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'mileszs/ack.vim'
Bundle 'bling/vim-airline'
Bundle 'kien/ctrlp.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'airblade/vim-gitgutter'
Bundle 'jamessan/vim-gnupg'
Bundle 'L9'
Bundle 'tpope/vim-rails'
Bundle 'snipMate'
Bundle 'surround.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'The-NERD-tree'
Bundle 'majutsushi/tagbar'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'pangloss/vim-javascript'
Bundle 'groenewege/vim-less'
Bundle 'slim-template/vim-slim'
Bundle 'digitaltoad/vim-jade.git'
Bundle 'ZoomWin'


"
" Color options
"
set t_Co=256 " Use 256 colors.
Bundle 'altercation/vim-colors-solarized'
if has('gui_running')
  set background=dark
  colorscheme solarized
else
  colorscheme desert
endif


"
" Vim options
"
set backup
set backupdir=$HOME/.vim/backups
set backupext=.bak
set cryptmethod=blowfish
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
set number
set ruler
set shell=/bin/bash " Required when using 'fish' shell, since things fuck up.
set scrolloff=2
set showmatch
set title
set updatetime=750 " Set lower than the default so vim-gitgutter updates quicker.

" Indenting shit
set autoindent
set backspace=start,eol,indent
set expandtab
set smartindent
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

" Use 2 spaces for tabs in HTML files.
augroup filetype_html
  autocmd!
  autocmd FileType html set autoindent shiftwidth=2 softtabstop=2 expandtab
augroup END

" Use 4 spaces for tabs in java files.
augroup filetype_java
  autocmd!
  autocmd FileType java set autoindent shiftwidth=4 softtabstop=4 expandtab
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

" GUI specific options
if has("gui_running")
  set guifont=Menlo:h12
  set guioptions-=T " Remove the toolbar.
  set guioptions-=m " Remove the menubar.
endif

" Don't match things in ./.git
if filereadable("./.git")
  set wildignore+=.git
endif

" Android - Don't match things in bin/ and gen/
if filereadable("./AndroidManifest.xml")
  set wildignore+=bin,gen,out
endif

" Android (gradle) - Don't match build files.
if filereadable("./build.gradle")
  set wildignore+=build
endif

" Titanium - Don't match things in build/
if filereadable("./tiapp.xml")
  set wildignore+=build,docs
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

" Put a space after comment character with nerdcommenter.
let g:NERDSpaceDelims = 1

" CtrlP options
let g:ctrlp_map = '<Leader>t'
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)|tmp$|node_modules'

" vim-airline options
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
let g:airline_linecolumn_prefix = '␊ '
let g:airline_fugitive_prefix = '⎇ '
let g:airline#extensions#tabline#enabled = 1

" vim-gitgutter options
let g:gitgutter_sign_column_always = 1


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
" syntax enable

" Highlight the 'DEBUG' word.
highlight Debug ctermbg=red ctermfg=white guibg=red guifg=white
match Debug /DEBUG/

" Set the SignColumn colors the same as LineNr.
highlight clear SignColumn

" This must be last.
filetype plugin indent on
