let g:netrw_banner = 0
let g:netrw_hide = 0
let g:netrw_localcopydircmd = 'cp -r'
hi! link netrwMarkFile Search
hi! link netrwDir Boolean
hi! link netrwExe Number
hi! link netrwSymLink String
nnoremap <leader>j :Explore<CR>

function! NetrwMapping()
  nmap <buffer> h -^
  nmap <buffer> l <CR>
  nmap <buffer> nd d
  nmap <buffer> <C-n> jp
  nmap <buffer> <C-p> kp
  nmap <buffer> nd d
  nmap <buffer> nf %:w<CR>:buffer #<CR>
  nmap <buffer> <leader>j :Rexplore<CR>
endfunction

augroup netrw
  autocmd!
  autocmd FileType netrw call NetrwMapping()
augroup END
