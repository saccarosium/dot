let g:netrw_banner = 0
let g:netrw_hide = 0
let g:netrw_localcopydircmd = 'cp -r'
hi! link netrwMarkFile Search

function! NetrwMapping()
  nmap <buffer> h -^
  nmap <buffer> l <CR>
  nmap <buffer> nd d
  nmap <buffer> nf %:w<CR>:buffer #<CR>
  nmap <buffer> M mfj
  nmap <buffer> U mu
  nmap <buffer> p mtmc
  nmap <buffer> v mtmm
  nmap <buffer> <leader>j :Rexplore<CR>
endfunction

augroup netrw
  autocmd!
  autocmd FileType netrw call NetrwMapping()
augroup END
