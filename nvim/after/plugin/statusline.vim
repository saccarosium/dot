fun! statusline#gitinfo()
    if exists('*FugitiveHead()')
        let s:git = FugitiveHead()
        if ! empty(s:git)
          return " " . s:git
        else
          return ''
        endif
    else
        return ''
    endif
endfun

fun! statusline#printspace()
    return ' '
endfun

set statusline=
set statusline+=%{statusline#printspace()}
set statusline+=%{statusline#gitinfo()}
set statusline+=%{statusline#printspace()}
set statusline+=%F
set statusline+=%m
set statusline+=%=
set statusline+=%l:%c
set statusline+=%{statusline#printspace()}
set statusline+=%{&filetype}
set statusline+=%{statusline#printspace()}
