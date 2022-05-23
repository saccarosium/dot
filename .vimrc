set expandtab smartindent
set laststatus=0
set nobackup
set noswapfile
set nowrap
set number
set path+=**
set relativenumber
set ruler
set shiftwidth=4
set softtabstop=4
set splitbelow
set splitright
set tabstop=4
set textwidth=80
set viminfofile=/tmp/viminfo
set wildignorecase
set wildmenu
set wildignore+=**/.git/*
set wildignore+=*.class
set wildignore+=*.o

syntax on

" Remove all trilling whitespaces when saving file
autocmd BufWritePre * %s/\s\+$//e

cnoreabbrev W! w!
cnoreabbrev Q! q!

let mapleader = ' '
nnoremap <C-l> :noh<CR>
nnoremap Y y$

let g:netrw_home = '/tmp/newtrw'
let g:netrw_banner = 0
let g:netrw_keepdir = 0
hi! link netrwMarkFile Search

function! NetrwMapping()
  nmap <buffer> h -^
  nmap <buffer> l <CR>
endfunction

augroup netrw
  autocmd!
  autocmd FileType netrw call NetrwMapping()
augroup END
