set belloff+=ctrlg
set noinfercase
set complete-=i
set complete-=t
set completeopt-=preview
set completeopt+=menu,noselect
let g:mucomplete#enable_auto_at_startup = 1
let g:mucomplete#chains = {
    \ 'default' : ['omni', 'c-n', 'c-p', 'path'],
    \ 'bash' : ['path', 'c-n', 'keyn', 'keyp'],
    \ 'sh' : ['path', 'c-n', 'keyn', 'keyp'],
    \ }
