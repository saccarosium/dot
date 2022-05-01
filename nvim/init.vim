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
set spelllang=en_us
set nocompatible

" ----------------------------------- vars -----------------------------------

let mapleader=' '
let g:gruvbox_sign_column='none'
let g:gruvbox_contrast_dark='hard'
let g:markdown_folding=1
" let g:markdown_fenced_languages = { 'bash' 'c' 'cpp' 'python' 'ruby' 'vim' }

" ---------------------------------- autocmd ---------------------------------

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
    " LSP
    Plug 'neovim/nvim-lspconfig'
    Plug 'lifepillar/vim-mucomplete'
    " Syntax
    Plug 'gruvbox-community/gruvbox'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'norcalli/nvim-colorizer.lua'
    " Utility
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-treesitter/nvim-treesitter-refactor'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-eunuch'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-vinegar'
    Plug 'jose-elias-alvarez/null-ls.nvim'
    Plug 'ibhagwan/fzf-lua'
    " Formatting
    Plug 'sbdchd/neoformat'
    " Writing
    Plug 'vimwiki/vimwiki', { 'branch': 'dev' }
call plug#end()

" ---------------------------------- colors ----------------------------------

filetype plugin on
syntax on
colorscheme gruvbox
hi! link Delimiter GruvboxFg1

" --------------------------------- commands ---------------------------------

:command PlugSync PlugUpgrade | PlugClean | PlugInstall | sleep 3 | PlugUpdate | sleep 3 | q!

" ----------------------------------- remap ----------------------------------

nnoremap <leader>or :vsplit ./README.md<CR>
nnoremap <leader>oc :e $DOTFILES/nvim/init.*<CR>
nnoremap <leader>ob :e $DOTFILES/bash/.bashrc<CR>
nnoremap <C-f> :FzfLua files<CR>
nnoremap <C-s> :FzfLua buffers<CR>
nnoremap <C-h> :FzfLua help_tags<CR>
nnoremap <M-x> :FzfLua commands<CR>
nnoremap <leader>fl :FzfLua blines<CR>
nnoremap <leader>fh :FzfLua command_history<CR>
nnoremap <leader>fw :lua require("fzf-lua").live_grep({ exec_empty_query = true })<CR>
nnoremap <leader>fr :FzfLua resume<CR>
nnoremap <leader>gs :G<CR>
nnoremap <leader>gl :G log<CR>
nnoremap <leader>gp :G push origin<CR>
nnoremap <leader>gd :G diff<CR>
nnoremap <leader>gc :G checkout
nnoremap <leader>gb :echomsg FugitiveStatusline()<CR>
nnoremap <leader>lf :Neoformat<CR>
vnoremap <C-y> "+y
nnoremap <leader>th :TSToggle highlight<CR>
