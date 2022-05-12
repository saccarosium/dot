let g:netrw_banner = 0
let g:netrw_hide = 0
let g:netrw_winsize = 30
let g:netrw_localcopydircmd = 'cp -r'
let g:netrw_dirhistmax = 0
hi! link netrwMarkFile Search
hi! link netrwDir Boolean
hi! link netrwExe Number
hi! link netrwSymLink String
nnoremap <leader>j :Explore<CR>

function! NetrwMapping()
  nmap <buffer> h -^
  nmap <buffer> l <CR>
  nmap <buffer> M mfj
  nmap <buffer> <leader>j :Rexplore<CR>
endfunction

augroup netrw
  autocmd!
  autocmd FileType netrw call NetrwMapping()
augroup END
