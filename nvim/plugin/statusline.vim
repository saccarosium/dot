fun! statusline#printSpace()
    return ' '
endfun

fun! statusline#gitInfo()
  let git = FugitiveHead()
  if ! empty(git)
    return ' '. FugitiveHead()
  else
    return ''
  endif
endfun

set statusline=
set statusline+=%{statusline#printSpace()}
set statusline+=%{statusline#gitInfo()}
set statusline+=\ %f
set statusline+=\ %m
set statusline+=%=
set statusline+=\ %l:%c
set statusline+=\ %y
set statusline+=%{statusline#printSpace()}
