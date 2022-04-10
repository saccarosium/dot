syntax on
set wildmenu
set viminfofile='/tmp/viminfo/'
set path+=**
set laststatus=0
set number relativenumber
set mouse=a
set smartcase
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab smartindent smarttab
set hidden
set nowrap

cnoreabbrev W! w!
cnoreabbrev Q! q!

let mapleader = ' '
nnoremap <leader>j :Explore<CR>
nnoremap <C-l> :noh<CR>
nnoremap Y y$

let g:netrw_home = '/tmp/newtrw'
let g:netrw_banner = 0
let g:netrw_keepdir = 0
hi! link netrwMarkFile Search

function! NetrwMapping()
  nmap <buffer> h -^
  nmap <buffer> l <CR>
  nmap <buffer> <leader>j :Rexplore<CR>
endfunction
 
augroup netrw
  autocmd!
  autocmd FileType netrw call NetrwMapping()
augroup END
