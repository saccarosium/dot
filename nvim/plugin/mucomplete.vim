set shortmess+=c " Shut off completion messages
set complete=.
set completeopt+=menuone,noselect
set completeopt-=preview

let g:mucomplete#enable_auto_at_startup = 1

let g:mucomplete#chains = {}
let g:mucomplete#chains = {
    \ 'default' : [ 'omni', 'user', 'incl', 'path'],
    \ }

inoremap <tab> <plug>(MUcompleteFwd)
inoremap <s-tab> <plug>(MUcompleteBwd)
