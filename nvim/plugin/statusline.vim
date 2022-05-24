fun! PrintSpace()
    return ' '
endfun

fun! GitInfo()
  let git = FugitiveHead()
  if ! empty(git)
    return ' '. FugitiveHead()
  else
    return ''
  endif
endfun

set statusline=
set statusline+=%{PrintSpace()}
set statusline+=%{GitInfo()}
set statusline+=\ %f
set statusline+=\ %m
set statusline+=%=
set statusline+=\ %l:%c
set statusline+=\ %y
set statusline+=%{PrintSpace()}
