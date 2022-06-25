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
    set fo+=q " Format comments with gq
    set fo+=B " Don't insert space when join lines
    set fo+=r " Insert comment only on <enter> in insert
    set fo+=n " Recognise numbered lists
    if &filetype == 'markdown' || &filetype == 'asciidoc'
        set fo+=t " Autowrap
    endif
endfun

fun! sacca#editFiletype()
    let s:type = &filetype
    let s:mode = 'vs'
    exe ':'.s:mode.' '.expand('$XDG_CONFIG_HOME/nvim/ftplugin/').s:type.'.vim'
endfun

command! EditFiletype :call sacca#editFiletype()

fun! sacca#togglestatus()
    if &laststatus == '2'
        set laststatus=0
    elseif &laststatus == '0'
        set laststatus=2
    endif
endfun

command! Statusline :call sacca#togglestatus()

fun! sacca#terminal()
    setlocal nornu
    setlocal nonu
    startinsert
endfun

fun! sacca#gitinfo()
    let s:git = FugitiveHead()
    if ! empty(s:git)
      return " " . s:git
    else
      return ''
    endif
endfun

fun! sacca#printspace()
    return ' '
endfun

fun! sacca#statusline()
    if tabpagewinnr(tabpagenr(), '$') == 1
        set laststatus=0
    else
        set laststatus=2
    endif
endfun

fun! sacca#printFile()
    if &laststatus == '0'
        echo sacca#gitinfo() expand('%:p')
    endif
endfun
