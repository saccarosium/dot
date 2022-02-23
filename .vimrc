syntax on
set viminfofile='~/.local/share/vim/'
set path+=**
set laststatus=0
set number relativenumber
set mouse=a
set smartcase
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set nowrap
set nocompatible

let g:netrw_home = $XDG_DATA_HOME."/vim"

cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

nnoremap <C-j> :Explore<CR>
nnoremap <C-w>t :tabnew<CR>
nnoremap <C-n> :cnext<CR>
nnoremap <C-p> :cprevious<CR>
nnoremap <left> <C-w>>
nnoremap <right> <C-w><
nnoremap Y y$
nnoremap Q q
nnoremap q <C-w>c
nnoremap gq gqap

let g:netrw_banner = 0
let g:netrw_keepdir = 0
let g:netrw_localcopydircmd = 'cp -r'
hi! link netrwMarkFile Search
let g:ledger_maxwidth = 70
let g:markdown_folding = 1

function! NetrwMapping()
  nmap <buffer> H u
  nmap <buffer> h -^
  nmap <buffer> l <CR>
  nmap <buffer> nd d
  nmap <buffer> nf %:w<CR>:buffer #<CR>
  nmap <buffer> . gh
  nmap <buffer> M mfj
  nmap <buffer> U mu
  nmap <buffer> p mtmc
  nmap <buffer> v mtmm
  nmap <buffer> <C-g> :echo join(netrw#Expose("netrwmarkfilelist"), "\n")<CR>
  nmap <buffer> <C-j> :Rexplore<CR>
endfunction
 
augroup netrw
  autocmd!
  autocmd FileType netrw call NetrwMapping()
augroup END
