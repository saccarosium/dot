fun! Gitinfo()
    let s:git = FugitiveHead()
    if ! empty(s:git)
      return " " . s:git
    else
      return ''
    endif
endfun

fun! PrintSpace()
    return ' '
endfun

set statusline=
set statusline+=%{PrintSpace()}
set statusline+=%{Gitinfo()}
set statusline+=%{PrintSpace()}
set statusline+=%f
set statusline+=%m
set statusline+=%=
set statusline+=%l:%c
set statusline+=%{PrintSpace()}
set statusline+=%{&filetype}
set statusline+=%{PrintSpace()}
