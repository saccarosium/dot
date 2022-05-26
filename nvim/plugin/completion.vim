set shortmess+=c " Shut off completion messages
set complete=.
set completeopt+=menuone
set completeopt+=noselect
set completeopt-=preview

let g:mucomplete#enable_auto_at_startup = 1
let g:mucomplete#chains = {
    \ 'default' : ['minisnip', 'omni', 'incl', 'path'],
    \ }

let mucomplete#user_mappings = {'minisnip': "\<C-r>=MUcompleteMinisnip#complete()\<CR>"}

let g:mucomplete#no_mappings = 1

inoremap <tab> <plug>(MUcompleteFwd)
inoremap <s-tab> <plug>(MUcompleteBwd)
