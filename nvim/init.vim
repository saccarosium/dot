set path+=**
set laststatus=0
set number relativenumber
set mouse=a
set guicursor=
set ignorecase smartcase
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set noshowmode
set noswapfile nobackup
set foldmethod=manual
filetype plugin indent on

call plug#begin('$XDG_DATA_HOME/nvim/plugged')

  Plug 'nvim-lua/plenary.nvim' 
  Plug 'dracula/vim', { 'as': 'dracula' }
  Plug 'neovim/nvim-lspconfig'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} 
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'junegunn/fzf'
  Plug 'junegunn/fzf.vim'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-commentary'
  Plug 'ThePrimeagen/harpoon'

call plug#end()

syntax on
colorscheme dracula
hi! Normal ctermbg=NONE guibg=NONE 
hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE

let mapleader=" "

cnoreabbrev W! w!
cnoreabbrev W w

nnoremap <leader>oc :e $DOTFILES/nvim/init.vim<CR>

nnoremap <leader><space> :Files<CR>
nnoremap <leader>fg :Rg<CR>
nnoremap <C-x>b :Buffers<CR>
nnoremap <C-h> :Helptags<CR>
nnoremap <C-f> :call fzf#run({'source': 'cdscuts_glob_echo', 'sink': 'cd'})<CR>
nnoremap <M-x> :Commands<CR>

nnoremap <C-x>j :Explore<CR>
nnoremap <C-w>t :tabnew<CR>
nnoremap <C-n> :cnext<CR>
nnoremap <C-p> :cprevious<CR>

nnoremap gd :lua vim.lsp.buf.declaration()<CR>
nnoremap gi :lua vim.lsp.buf.implementation()<CR>
nnoremap gD :lua vim.lsp.buf.definition()<CR>
nnoremap gr :lua vim.lsp.buf.references()<CR>
nnoremap gh :lua vim.lsp.buf.document_symbol()<CR>
nnoremap <C-c>r :lua vim.lsp.buf.rename()<CR>
nnoremap <leader>e :lua vim.diagnostic.open_float()<CR>
nnoremap <leader>q :lua vim.diagnostic.setloclist()<CR> 
nnoremap <C-c>f :lua vim.lsp.buf.formatting()<CR>

nnoremap <leader>gs :vert G<CR>
nnoremap <leader>gd :vert G diff<CR>
nnoremap <leader>gp :vert G push<CR>

nnoremap <leader>hm :lua require("harpoon.mark").add_file()<CR>
nnoremap <leader>hl :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <leader>1 :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <leader>2 :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <leader>3 :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <leader>4 :lua require("harpoon.ui").nav_file(4)<CR>

nnoremap q <C-w>c
nnoremap Q q

let g:fzf_layout = {'down': '30%'} 
let g:netrw_banner = 0

function! NetrwMapping()
  nmap <buffer> h -^
  nmap <buffer> l <CR>
  nmap <buffer> nd d
  nmap <buffer> nf %
endfunction
 
augroup netrw_mapping
  autocmd!
  autocmd filetype netrw call NetrwMapping()
augroup END
