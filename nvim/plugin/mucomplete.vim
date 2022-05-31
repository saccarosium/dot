let g:mucomplete#enable_auto_at_startup = 1
let g:mucomplete#no_mappings = 1
let g:mucomplete#chains = {
    \ 'default' : ['omni', 'incl', 'path'],
    \ }

inoremap <tab> <plug>(MUcompleteFwd)
inoremap <s-tab> <plug>(MUcompleteBwd)
