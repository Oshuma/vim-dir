set nocompatible
filetype off

"
" Vundle
"
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'mileszs/ack.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'fatih/vim-go'
Plugin 'digitaltoad/vim-jade.git'
Plugin 'pangloss/vim-javascript'
Plugin 'groenewege/vim-less'
Plugin 'L9'
Plugin 'nicwest/QQ.vim'
Plugin 'tpope/vim-rails'
Plugin 'slim-template/vim-slim'
Plugin 'surround.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'The-NERD-tree'
Plugin 'majutsushi/tagbar'
Plugin 'SirVer/ultisnips'
Plugin 'kchmck/vim-coffee-script'
call vundle#end()


"
" Vim options
"
set autoread  " Updates open buffer if file was changed outside of vim.
set background=dark
set backup
set backupdir=$HOME/.vim/backups
set backupext=.bak
" set cryptmethod=blowfish
set directory=$HOME/.vim/tmp
set encoding=utf-8
set foldmethod=indent
" set foldlevelstart=1  " Close all but the top-level fold.
set foldlevelstart=9999 " All folds open.
set hidden
set history=100
set hlsearch
set mouse=c
set noincsearch
set nowrap
set number
set relativenumber
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

" Persistent undo
if exists("&undodir")
  set undofile
  let &undodir=&directory
  set undolevels=500
  set undoreload=500
endif


"
" Color options
"
set t_Co=256 " Use 256 colors.
if has('gui_running')
  set background=dark
else
  colorscheme desert
endif


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
  " set guifont=Menlo:h12
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
if filereadable("./bin/rails")
  set wildignore+=doc/app,doc/coverage,coverage,tmp,.gems
endif


" Convert tabs to 2 spaces
command TabToSpace %s/\t/  /g
" Convert tabs to 4 spaces
command TabToSpace4 %s/\t/    /g



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
let g:tagbar_type_go = {
  \ 'ctagstype' : 'go',
  \ 'kinds'     : [
    \ 'p:package',
    \ 'i:imports:1',
    \ 'c:constants',
    \ 'v:variables',
    \ 't:types',
    \ 'n:interfaces',
    \ 'w:fields',
    \ 'e:embedded',
    \ 'm:methods',
    \ 'r:constructor',
    \ 'f:functions'
  \ ],
  \ 'sro' : '.',
  \ 'kind2scope' : {
    \ 't' : 'ctype',
    \ 'n' : 'ntype'
  \ },
  \ 'scope2kind' : {
    \ 'ctype' : 't',
    \ 'ntype' : 'n'
  \ },
  \ 'ctagsbin'  : 'gotags',
  \ 'ctagsargs' : '-sort -silent'
\ }

" Put a space after comment character with nerdcommenter.
let g:NERDSpaceDelims = 1

" CtrlP options
let g:ctrlp_map = '<Leader>t'
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)|tmp$|node_modules'

" vim-airline options
" let g:airline_left_sep = '▶'
" let g:airline_right_sep = '◀'
" let g:airline_linecolumn_prefix = '␊ '
" let g:airline_fugitive_prefix = '⎇ '
" let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='bubblegum'

" tmuxline.vim options
" let g:airline#extensions#tmuxline#enabled = 0
" let g:tmuxline_powerline_separators = 0
let g:tmuxline_preset = 'full'

    " \ 'left_alt': '⊳',
    " \ 'right_alt' : '⊲',
    " \ 'left_alt': '⏵',
    " \ 'right_alt' : '⏴',
let g:tmuxline_separators = {
    \ 'left' : '',
    \ 'left_alt': '⏵',
    \ 'right' : '',
    \ 'right_alt': '⏰',
    \ 'space' : ' '}

" vim-gitgutter options
" let g:gitgutter_sign_column_always = 1
set signcolumn=yes

" UltiSnips
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsEditSplit = 'horizontal'


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
" nnoremap <silent> <F2> :NERDTreeToggle<CR>
" nnoremap <silent> <left> <ESC>:NERDTreeToggle<CR>
nnoremap <Leader>f :NERDTreeToggle<CR>

nnoremap <silent> <F4> :TagbarToggle<CR>
nnoremap <silent> <right> <ESC>:TagbarToggle<CR>
nnoremap <Leader>g :TagbarToggle<CR>

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

nnoremap <Leader>z :set foldlevel=1<CR>
nnoremap <Leader>Z zR

nnoremap <Leader>s :w<CR>
nnoremap <Leader>S :wa<CR>

nnoremap <Leader>y "+y<CR>
nnoremap <Leader>p "+p<CR>
nnoremap <Leader>P "+P<CR>

nnoremap <Leader>gc :call NERDComment('nx', 'AlignLeft')<CR>
vnoremap <Leader>gc :call NERDComment('nx', 'AlignLeft')<CR>

nnoremap <Leader>b :CtrlPBuffer<CR>


" syntax on
syntax enable

" CusorLine
set cursorline
let vimrc_cursorline_ctermbg = 8
highlight cursorline cterm=none term=none
execute "highlight cursorline cterm=none ctermfg=none ctermbg=".vimrc_cursorline_ctermbg
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline

" Highlight the 'DEBUG' word.
highlight Debug ctermbg=red ctermfg=white guibg=red guifg=white
match Debug /DEBUG/

" Set the SignColumn colors the same as LineNr.
highlight clear SignColumn

" This must be last.
filetype plugin indent on
