augroup sacca
    autocmd!
    " Remove all trilling whitespaces when saving file
    autocmd BufWritePre * %s/\s\+$//e
    " Take control over the formatoption variable
    autocmd Filetype * call sacca#setFormat()
    " autosource all the files that are safe under 'ftplugin'
    autocmd BufLeave ~/.config/nvim/ftplugin/* so %
augroup END

nnoremap <C-q> :call sacca#toggleQuickFix()<CR>
" nnoremap <C-q> :TroubleToggle<CR>
nnoremap <leader>oS :call sacca#editSnips()<CR>
inoremap <C-j> <Esc>/<++><Enter>"_c4l
nnoremap <C-j> <Esc>/<++><Enter>"_c4l
