" ------------------------------------ let -----------------------------------

set path+=**
set laststatus=0 " noshowmode
set number relativenumber
set mouse=a guicursor=
set tabstop=4 softtabstop=4 shiftwidth=4
set expandtab smartindent
set nobackup noswapfile
set textwidth=80
set termguicolors
set nowrap
set cursorline
set splitright
set wildignorecase
set signcolumn=yes
set foldlevelstart=99 foldmethod=marker
set nocompatible

" ----------------------------------- vars -----------------------------------

let mapleader=' '
let maplocalleader = ' '
let g:gruvbox_sign_column='none'
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_white_delimiters=1
let g:markdown_folding=1
" let g:markdown_fenced_languages = { 'bash' 'c' 'cpp' 'python' 'ruby' 'vim' }

" ---------------------------------- autocmd ---------------------------------
"
" Remove all trilling whitespaces when saving file
autocmd BufWritePre * %s/\s\+$//e

" ----------------------------------- plug -----------------------------------

if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

call plug#begin('$XDG_DATA_HOME/nvim/plugs')
    Plug 'akinsho/toggleterm.nvim'
    Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'jose-elias-alvarez/null-ls.nvim'
    Plug 'joshdick/onedark.vim'
    Plug 'junegunn/fzf'
    Plug 'junegunn/fzf.vim'
    Plug 'neovim/nvim-lspconfig'
    Plug 'norcalli/nvim-colorizer.lua'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-eunuch'
    Plug 'tpope/vim-fugitive'
    Plug 'vimwiki/vimwiki', { 'branch': 'dev' }
call plug#end()

" ---------------------------------- colors ----------------------------------

filetype plugin on
syntax on
colorscheme onedark

" --------------------------------- commands ---------------------------------

:command PlugSync PlugUpgrade | PlugClean | PlugInstall | sleep 3 | PlugUpdate | sleep 3 | q!

" ----------------------------------- remap ----------------------------------

nnoremap <leader>or :vsplit ./README.md<CR>
nnoremap <leader>oc :e $DOTFILES/nvim/init.*<CR>
nnoremap <leader>ob :e $DOTFILES/bash/.bashrc<CR>
nnoremap <C-f> :Files<CR>
nnoremap <C-s> :Buffers<CR>
nnoremap <C-h> :Helptags<CR>
nnoremap <M-x> :Commands<CR>
nnoremap <leader>fl :BLines<CR>
nnoremap <leader>fw :Rg<CR>
nnoremap <leader>fn :WikiFzfPages<CR>
nnoremap <leader>gs :G<CR>
nnoremap <leader>gl :G log<CR>
nnoremap <leader>gp :G push origin<CR>
nnoremap <leader>gd :G diff<CR>
noremap <leader>gc :G checkout
nnoremap <leader>gb :echomsg FugitiveStatusline()<CR>
nnoremap <leader>th :TSToggle highlight<CR>
nnoremap <leader>vsf :so %<CR>
nnoremap <leader>vsc :so $XDG_CONFIG_HOME/nvim/init.*<CR>
vnoremap <C-y> "+y

" --------------------------------- firenvim ---------------------------------

if exists('g:started_by_firenvim')
    set guifont=JetBrainsMono:h18
    " hi! Normal ctermbg=NONE guibg=NONE
    " hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE
    set signcolumn=no
    set nocursorline
endif
