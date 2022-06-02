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
    let s:name = input('Snippet Name: ')
    let s:type = &filetype
    let s:mode = 'vs'
    exe ':'.s:mode.' '.g:minisnip_dir.'/_'.s:type.'_'.s:name
endfun
