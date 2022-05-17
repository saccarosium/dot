set path+=**
" noshowmode
set laststatus=0
set number relativenumber

" Tabs
set tabstop=4 softtabstop=4 shiftwidth=4
set expandtab smartindent
set viminfofile="$XDG_DATA_HOME/vim/viminfo"

set nobackup noswapfile
set textwidth=80
set nowrap
" Splits
set splitbelow splitright

" Wildmenu
set wildmenu
set wildignorecase
set wildignore+=*.o
set wildignore+=*.class
set wildignore+=**/.git/*

colorscheme desert
syntax on

" Remove all trilling whitespaces when saving file
autocmd BufWritePre * %s/\s\+$//e

cnoreabbrev W! w!
cnoreabbrev Q! q!

let mapleader = ' '
nnoremap - :Explore<CR>
nnoremap <C-l> :noh<CR>
nnoremap Y y$
nnoremap <C-y> "+y$
vnoremap <C-y> "+y
nnoremap <leader>or :vsplit ./README.md<CR>

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
