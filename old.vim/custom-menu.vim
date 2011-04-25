"
" Custom GUI Menus
"

" Git
:menu <silent> Git.GitX <ESC>:!gitx &<CR><CR>

" Util
if has("gui_running")
  :menu <silent> &Util.&Toolbar <ESC>:call ToggleGUIToolbar()<CR>
endif
:menu <silent> &Util.&Wrap <ESC>:set wrap<CR>
:menu <silent> &Util.&NoWrap <ESC>:set nowrap<CR>

function! ToggleGUIToolbar()
  if &guioptions=='aegimrLt'
    set guioptions=aegimrLT
  else
    set guioptions=aegimrLt
  endif
endfunction
