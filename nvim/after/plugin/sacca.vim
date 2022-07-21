augroup sacca
    autocmd!
    autocmd BufWritePre * %s/\s\+$//e
augroup END

