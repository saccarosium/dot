augroup extras
    autocmd!
    " Remove all trilling whitespaces when saving file
    autocmd BufWritePre * %s/\s\+$//e
    " Take control over the formatoption variable
    autocmd Filetype * call extras#setFormat()
augroup END
