" ------------------------------------ set -----------------------------------

set path+=**
set exrc
set laststatus=2
set number relativenumber
set mouse=a guicursor=
set list listchars=trail:-,tab:>>,space:·,eol:¬
set tabstop=4 softtabstop=4 shiftwidth=4
set expandtab smarttab smartindent
set nobackup noswapfile nowritebackup
set textwidth=80 nowrap
set cursorline
set splitbelow splitright
set signcolumn=yes
set nofoldenable
set foldmethod=marker
set wildignorecase
set termguicolors
set grepprg=rg\ --vimgrep\ --no-heading

" ----------------------------------- vars -----------------------------------

let mapleader=' '
let maplocalleader = ' '

" --------------------------------- plugings ---------------------------------

packadd! vim-dirvish
packadd! vim-code-dark
packadd! nvim-treesitter
packadd! vim-eunuch
packadd! vim-fugitive
packadd! nvim-lspconfig
packadd! nvim-colorizer.lua
packadd! Comment.nvim
packadd! orgmode
packadd! vim-table-mode
packadd! nvim-cmp
packadd! cmp-buffer
packadd! cmp-path
packadd! cmp-nvim-lsp

lua require("sacca.cmp")
lua require("sacca.lsp")
lua require("sacca.colorizer")
lua require("sacca.comment")
lua require("sacca.org")
lua require("sacca.tree-sitter")

" ---------------------------------- colors ----------------------------------

filetype plugin on
syntax on
colorscheme codedark

" ------------------------------ commands/abbrev -----------------------------

:command PlugSync PlugClean | PlugInstall | PlugUpdate | PlugUpgrade
cnoreabbrev vb vs<space><bar><space>b
cnoreabbrev sb sp<space><bar><space>b
cnoreabbrev db bdelete!
cnoreabbrev _s %s/
cnoreabbrev dot $DOTFILES

" ----------------------------------- remap ----------------------------------

nnoremap <leader>or :vsplit ./README.md<CR>
nnoremap <leader>oc :e $MYVIMRC<CR>
nnoremap <leader>ob :e $DOTFILES/bash/.bashrc<CR>
nnoremap <leader>ot :e $SYNC/Projects/org/todo.org<CR>
nnoremap <leader>op :e $SYNC/Projects/org<CR>
nnoremap <leader>os :e $SYNC/scratchpad.md<CR>
nnoremap <leader>o. :e $DOTFILES/nvim<CR>
nnoremap <leader>on :e $SYNC/notes<CR>
nnoremap <leader>vsf :so %<CR>
nnoremap <leader>lf :norm m0gggqG'0<CR>
nnoremap <C-n> :cnext<CR>
nnoremap <C-p> :cprevious<CR>
vnoremap <C-y> "+y
vmap < <gv
vmap > >gv
