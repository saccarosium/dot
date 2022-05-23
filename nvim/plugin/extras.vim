fun! ToggleQuickFix()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
        copen
    else
        cclose
    endif
endfun

fun! SetFormat()
    " Only dafault plugins and filetypes change this
    set fo=
    set fo+=p " Don't break line with space
    set fo+=B " Don't insert space when join lines
    set fo+=r " Insert comment only on <enter> in insert
    set fo+=n " Recognise numbered lists
endfun

augroup VimRC
    autocmd!
    " Remove all trilling whitespaces when saving file
    autocmd BufWritePre * %s/\s\+$//e
    " Take control over the formatoption variable
    autocmd Filetype * call SetFormat()
augroup END

nnoremap <C-q> :call ToggleQuickFix()<CR>
