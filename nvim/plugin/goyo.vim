"Goyo Settings
function! s:goyo_enter()
  set noshowmode
  set noshowcmd
  set scrolloff=999
endfunction

function! s:goyo_leave()
  set showmode
  set showcmd
  set scrolloff=5
  hi! Normal ctermbg=NONE guibg=NONE 
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
