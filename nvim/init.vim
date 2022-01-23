call plug#begin('$XDG_DATA_HOME/nvim/plugged')

  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'dracula/vim', { 'as': 'dracula' }
  Plug 'neovim/nvim-lspconfig'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} 
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/nvim-cmp'

call plug#end()

set path+=**
set laststatus=0
set number relativenumber
set mouse=a
set smartcase
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab

syntax on

let mapleader=" "

set clipboard+=unnamedplus

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

nnoremap <leader>oc <cmd>e ~/.config/nvim/init.vim<cr>
nnoremap <leader><space> <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <C-h> <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
nnoremap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
nnoremap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
nnoremap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
nnoremap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
nnoremap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
nnoremap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
nnoremap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
nnoremap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
nnoremap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
nnoremap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
nnoremap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
nnoremap('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
nnoremap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
nnoremap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
nnoremap('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
nnoremap('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

colorscheme dracula
hi! Normal ctermbg=NONE guibg=NONE 
hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE
