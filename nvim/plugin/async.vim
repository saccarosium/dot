fun! async#async_cmd() abort
    let s:cmd = input('Async Command: ')
    exec 'Dispatch ' . s:cmd
endfun

nnoremap & :call async#async_cmd()<CR>
