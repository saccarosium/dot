fun! sacca#toggleQuickFix()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
        copen
    else
        cclose
    endif
endfun

fun! sacca#setFormat()
    " Only dafault plugins and filetypes change this
    set fo=
    set fo+=p " Don't break line with space
    set fo+=B " Don't insert space when join lines
    set fo+=r " Insert comment only on <enter> in insert
    set fo+=n " Recognise numbered lists
endfun

fun! sacca#editSnips() abort
    let s:type = &filetype
    let s:mode = 'vs'
    exe ':'.s:mode.' '.expand('$XDG_CONFIG_HOME/nvim/ftplugin/').s:type.'.vim'
endfun

fun! sacca#printSpace()
    return ' '
endfun

fun! sacca#gitInfo()
  let s:git = FugitiveHead()
  if ! empty(s:git)
    return ' '. FugitiveHead()
  else
    return ''
  endif
endfun

fun! sacca#modified()
    if &modified
        return '[*]'
    else
        return ''
    endif
endfun

fun! sacca#ctrlG()
    let s:file = expand('%:~')
    let s:modified = sacca#modified()
    echo s:file . sacca#printSpace() . s:modified . sacca#gitInfo()
endfun
