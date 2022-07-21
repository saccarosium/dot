function PreviewFileUnderCursor()
    let cur_line = getline(line('.'))
    let cur_file = fnameescape(substitute(cur_line, '|.*$', '', ''))
    if cur_line =~ '|\d\+'
        let cur_pos  = substitute(cur_line, '^\(.\{-}|\)\(\d\+\)\(.*\)', '\2', '')
        execute "pedit +" . cur_pos . " " . cur_file
    else
        execute "pedit " . cur_file
    endif
endfunction

map <buffer> <C-n> j:call PreviewFileUnderCursor()<CR><C-w>J
map <buffer> <C-p> k:call PreviewFileUnderCursor()<CR><C-w>J
