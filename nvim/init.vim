" set: {{{

set exrc
set number relativenumber
set guicursor=
set list
set listchars=trail:-,tab:>\ ,space:·,eol:¬
set tabstop=4 softtabstop=4 shiftwidth=4
set expandtab smartindent
set nobackup noswapfile nowritebackup
set textwidth=80 nowrap
set cursorline
set signcolumn=yes
set foldmethod=marker
set termguicolors
set splitbelow splitright
set grepprg=rg\ --vimgrep\ --no-heading

" }}}
" wildmenu: {{{

set path+=**
set wildignorecase
set wildignore+=*.o
set wildignore+=*.a
set wildignore+=.git/

" }}}
" vars: {{{

let g:loaded_gzip = 1
let g:loaded_zip = 1
let g:loaded_zipPlugin = 1
let g:loaded_tar = 1
let g:loaded_tarPlugin = 1
let g:loaded_getscript = 1
let g:loaded_getscriptPlugin = 1
let g:loaded_vimball = 1
let g:loaded_vimballPlugin = 1
let g:loaded_2html_plugin = 1
let g:loaded_matchit = 1
let g:loaded_matchparen = 1
let g:loaded_logiPat = 1
let g:loaded_rrhelper = 1
let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1
let g:loaded_netrwSettings = 1
let g:pad#dir = expand('$SYNC/notes')

" }}}
" plugins: {{{

call plug#begin('$XDG_DATA_HOME/bundle')
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'dhruvasagar/vim-table-mode'
    Plug 'justinmk/vim-dirvish'
    Plug 'neovim/nvim-lspconfig'
    Plug 'nvim-orgmode/orgmode'
    Plug 'norcalli/nvim-colorizer.lua'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'axvr/zepl.vim'
    Plug 'tomasiser/vim-code-dark'
    Plug 'tpope/vim-dispatch'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-fugitive'
    Plug '~/Repos/nvim-friendly-unix'
call plug#end()

lua require("sacca.treesitter")
lua require("sacca.orgmode")
lua require("sacca.colorizer")
lua require("sacca.lsp")
lua require("sacca.cmp")

" }}}
" colors: {{{

filetype plugin on
syntax on
colorscheme codedark

" }}}
" abbrevs: {{{

cnoreabbrev vb vs<space><bar><space>b
cnoreabbrev sb sp<space><bar><space>b
cnoreabbrev db bdelete!
cnoreabbrev dot $DOTFILES

" }}}
" maps: {{{

let mapleader=' '
let maplocalleader = '\'

nnoremap <leader>or :vsplit ./README.md<CR>
nnoremap <leader>oc :e $MYVIMRC<CR>
nnoremap <leader>oC :e $DOTFILES/vim/plugins.vim<CR>
nnoremap <leader>ob :e $DOTFILES/bash/.bashrc<CR>
nnoremap <leader>ot :e $SYNC/Projects/org/todo.org<CR>
nnoremap <leader>op :e $SYNC/Projects/org<CR>
nnoremap <leader>o. :e $DOTFILES/vim<CR>
nnoremap <leader>vsf :so %<CR>
nnoremap <leader>lf :norm m0gggqG'0<CR>
nnoremap <C-n> :cnext<CR>
nnoremap <C-p> :cprevious<CR>
nnoremap gR :%s/
vnoremap <C-y> "+y
vmap < <gv
vmap > >gv

" }}}
