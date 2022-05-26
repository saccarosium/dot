fun! extras#toggleQuickFix()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
        copen
    else
        cclose
    endif
endfun

fun! extras#setFormat()
    " Only dafault plugins and filetypes change this
    set fo=
    set fo+=p " Don't break line with space
    set fo+=B " Don't insert space when join lines
    set fo+=r " Insert comment only on <enter> in insert
    set fo+=n " Recognise numbered lists
endfun

nnoremap <C-q> :call extras#toggleQuickFix()<CR>
