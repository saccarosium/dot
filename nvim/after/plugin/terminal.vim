fun! terminal#options()
    setlocal nornu
    setlocal nonu
    startinsert
endfun

augroup terminal
    autocmd!
    " cosmetic changes for built in terminal
    autocmd TermOpen * call terminal#options()
augroup END

tnoremap <C-w>h <C-\><C-N><C-w>h
tnoremap <C-w>j <C-\><C-N><C-w>j
tnoremap <C-w>k <C-\><C-N><C-w>k
tnoremap <C-w>l <C-\><C-N><C-w>l
tnoremap <C-w>c <C-\><C-N><C-w>c
