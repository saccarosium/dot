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
