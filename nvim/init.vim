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
set nofoldenable foldmethod=marker
set wildignorecase
set termguicolors
set grepprg=rg\ --vimgrep\ --no-heading

" ----------------------------------- vars -----------------------------------

let mapleader=' '
let maplocalleader = ' '
let g:markdown_folding=1

" --------------------------------- plugings ---------------------------------

if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
    echo "Downloading junegunn/vim-plug to manage plugins..."
    silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
    silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
    autocmd VimEnter * PlugInstall
endif

call plug#begin('$XDG_DATA_HOME/plugs')
    Plug 'dhruvasagar/vim-table-mode'
    Plug 'justinmk/vim-dirvish'
    Plug 'lervag/wiki.vim'
    Plug 'lifepillar/vim-mucomplete'
    Plug 'neovim/nvim-lspconfig'
    Plug 'norcalli/nvim-colorizer.lua'
    Plug 'numToStr/Comment.nvim'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'sbdchd/neoformat'
    Plug 'tckmn/vim-minisnip'
    Plug 'tomasiser/vim-code-dark'
    Plug 'tpope/vim-eunuch'
    Plug 'tpope/vim-fugitive'
    Plug 'zaid/vim-rec'
call plug#end()

lua require("sacca.colorizer")
lua require("sacca.comment")
lua require("sacca.lsp")
lua require("sacca.tree-sitter")

" ---------------------------------- colors ----------------------------------

filetype plugin on
syntax on
colorscheme codedark

" ------------------------------ commands/abbrev -----------------------------

:command PlugSync PlugClean | PlugInstall
cnoreabbrev vb vs<space><bar><space>b
cnoreabbrev sb sp<space><bar><space>b
cnoreabbrev dot $DOTFILES

" ----------------------------------- remap ----------------------------------

nnoremap <leader>or :vsplit ./README.md<CR>
nnoremap <leader>oc :e $MYVIMRC<CR>
nnoremap <leader>ob :e $DOTFILES/bash/.bashrc<CR>
nnoremap <leader>os :e $SYNC/scratchpad.md<CR>
nnoremap <leader>o. :e $DOTFILES<CR>
nnoremap <leader>vsf :so %<CR>
nnoremap <C-j> :cnext<CR>
nnoremap <C-k> :cprevious<CR>
nnoremap <localleader>j :lnext<CR>
nnoremap <localleader>k :lprevious<CR>
vnoremap <C-y> "+y
nnoremap <C-n> :bn!<CR>
nnoremap <C-p> :bp!<CR>
nnoremap <leader>? :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
