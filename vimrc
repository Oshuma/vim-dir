"
" Vim Options
"
" TODO: Split this beast up.


set nocompatible  " This should be first.

set background=dark
set backup
set backupext=.bak
set directory=$HOME/.vim/tmp
set backupdir=$HOME/.vim/backups
helptags $HOME/.vim/doc
set foldmethod=syntax
" set foldlevelstart=1   " Close all but the top-level fold.
set foldlevelstart=99  " All folds open.
set hidden
set history=100
set nohlsearch
set noincsearch
set nowrap
set ruler
set scrolloff=2
set title

" Indenting related shit.
set autoindent
set backspace=start,eol,indent
set expandtab
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2

" Status line shit.
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%04l,%04v][%p%%]\ [LINES=%L]
set laststatus=2

" Enable Status Line Menu
" source $VIMRUNTIME/menu.vim
runtime menu.vim  " Does the same thing as above.
set wildmenu
set cpo-=<
set wcm=<C-Z>
map <F1> :emenu <C-Z>

" Better matching with the % command
runtime macros/matchit.vim

" Command to toggle showing of whitespace
" <Leader>s
set listchars=tab:>-,trail:.,eol:~
" map <silent> <Leader>s :set nolist!<CR>

colorscheme desert
syntax on
filetype on
filetype plugin on
filetype indent on

" Turn off bracket highlighting
" let loaded_matchparen = 1

" Ruby/Rails stuff
augroup railsfiletypes
  " Clear old autocmds in group
  autocmd!
  " autoindent with two spaces, always expand tabs
  " autocmd FileType eruby set ai ts=4 sw=4 noexpandtab
  " autocmd FileType ruby,yaml set ai sw=2 sts=2 expandtab
  autocmd FileType ruby,eruby,yaml set ai sw=2 sts=2 expandtab
augroup END

augroup javascriptfiletypes
  autocmd!
  autocmd! FileType javascript,rails-js set ai sw=2 sts=2 expandtab
augroup END

au BufRead,BufNewFile *.js set filetype=javascript.jquery

autocmd FileType java set ai sw=4 sts=4 expandtab

" CakePHP syntax highlighting
augroup cakephpfiletypes
  autocmd!
  au! BufRead,BufNewFile *.ctp set filetype=php ai sw=2 sts=2 expandtab
augroup END

" Template Toolkit
augroup templatetoolkitfiletypes
  autocmd!
  au! BufRead,BufNewFile,BufWinEnter *.tt2 set filetype=tt2
augroup END

autocmd FileType make set noexpandtab

au BufRead,BufNewFile Gemfile set filetype=ruby
au BufRead,BufNewFile *.ru set filetype=ruby
au BufRead,BufNewFile *.ooc set filetype=ooc

" nginx config
" au BufRead,BufNewFile /path/to/nginx/configs/* set ft=nginx

"
" Key Bindings
"

" Tab commands
nmap <C-t> :tabnew<CR>
" nmap <C-x> :tabclose<CR>
nmap <C-h> :tabp<CR>
nmap <C-l> :tabn<CR>

" Buffer commands
nmap <C-p> :bprevious<CR>
nmap <C-n> :bnext<CR>

" Remap <Leader>
let mapleader = ","
" Swap the 'go to mark' commands.
"   '    Goes to the marked line.
"   `    Goes to the marked line *and* column.
noremap ' `
noremap ` '

" Shift-K doc links
au BufNewFile,BufRead *.java nmap K yaW:!google-chrome "http://www.google.com/search?q=java ""<CR><CR>

" Clear highlighted search with <Leader>/
nmap <silent> ,/ :let @/=""<CR>

"
" GUI specific options
"
if has("gui_running")
  " colorscheme default
  colorscheme desert
  " set background=dark
  set lines=45 columns=120
  set mousehide  " Hide mouse after pressing key.
  set mouse=a    " Mouse in all modes.
  " set cursorcolumn
  set cursorline
endif

" Custom menu
source $HOME/.vim/custom-menu.vim

" Clear trailing whitespace.
map <Leader>c :%s/\s\+$//g<CR>

" Surround mappings
" vmap <Leader>s <Plug>Vsurround
" vmap <Leader>S <Plug>VSurround

map <Leader>s :w<CR>
map <Leader>S :wa<CR>

map <Leader>y "+y<CR>
map <Leader>p "+p<CR>
map <Leader>P "+P<CR>

if exists(":Tabularize")
  map <Leader>a= :Tabularize /=<CR>
  map <Leader>a- :Tabularize /-<CR>
endif


"
" Plugin Stuff
"

" rails.vim
let g:rails_menu=2

" TagList
nnoremap <silent> <F4> :TlistToggle<CR>
let Tlist_Ctags_Cmd='/usr/bin/ctags'
let Tlist_Sort_Type = "name"
let Tlist_GainFocus_On_ToggleOpen=1
let Tlist_Close_On_Select=1
let Tlist_Use_Right_Window=1
let Tlist_WinWidth=35
let Tlist_Enable_Fold_Column=0
let Tlist_Inc_Winwidth=0  " Don't auto-resize the vim window.

" FuzzyFinder
map <Leader>t :FuzzyFinderFile<CR>
map <Leader>b :FuzzyFinderBuffer<CR>
let g:fuzzy_ignore = "*.log"
let g:fuzzy_matching_limit = 40

" NERD Tree
map <F2> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen=1

" SnippetsEmu
" let g:snippetsEmu_key = "<S-Tab>"

" MiniBufferExplorer
" map <Leader>m :TMiniBufExplorer<CR>
" let g:miniBufExplUseSingleClick = 1
" let g:miniBufExplMapCTabSwitchWindows = 1
" let g:miniBufExplModSelTarget = 1
