syntax on
set wildmenu
set viminfofile='/tmp/viminfo/'
set path+=**
set laststatus=0
set number relativenumber
set mouse=a
set smartcase
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set hidden
set nowrap

colorscheme elflord

cnoreabbrev W! w!
cnoreabbrev Q! q!

let mapleader = ' '
nnoremap <leader>j :Explore<CR>
nnoremap <C-l> :noh<CR>
nnoremap Y y$
nnoremap Q q
nnoremap q <C-w>c

let g:netrw_home = $XDG_DATA_HOME."/vim"
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
