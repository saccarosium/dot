" set path+=**
" set laststatus=0
" set number relativenumber
" set mouse=a guicursor=
" set ignorecase smartcase
" set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
" set noshowmode
" set nobackup
" set textwidth=80
" set termguicolors
" set conceallevel=3
" set nowrap
" set cursorline
" set signcolumn=yes
" set foldlevelstart=99 foldmethod=manual
" filetype plugin indent on
"
" call plug#begin('$XDG_DATA_HOME/nvim/plugged')
"
"   " Plug 'arcticicestudio/nord-vim'
"   Plug 'saccarosium/nord-vim', { 'branch': 'contrib' }
"   Plug 'neovim/nvim-lspconfig'
"   Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} 
"   Plug 'nvim-treesitter/nvim-treesitter-refactor'
"   Plug 'hrsh7th/nvim-cmp'
"   Plug 'hrsh7th/cmp-buffer'
"   Plug 'hrsh7th/cmp-nvim-lsp'
"   Plug 'nvim-lua/plenary.nvim'
"   Plug 'nvim-telescope/telescope.nvim'
"   Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
"   Plug 'tpope/vim-fugitive'
"   Plug 'norcalli/nvim-colorizer.lua'
"   Plug 'ledger/vim-ledger'
"   Plug 'kblin/vim-fountain'
"   Plug 'numToStr/Comment.nvim'
"
" call plug#end()
"
" let g:nord_bold_vertical_split_line = 1
" let g:nord_bold = 1
" colorscheme nord
" " hi! Normal ctermbg=NONE guibg=NONE
" " hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE
"  
" lua require("sacca.telescope")
" lua require("sacca.tree-sitter")
" lua require("sacca.lsp")
" lua require("sacca.comment")
" lua require("sacca.cmp")
" lua require("sacca.colorizer")
"
" let mapleader=' '
"
" cnoreabbrev W! w!
" cnoreabbrev W w
"
" nnoremap <leader>oc :e $DOTFILES/nvim/init.vim<CR>
" nnoremap <leader>os :vsplit $SYNC/scratchpad.md<CR>
" nnoremap <leader>ot :vsplit ./TODO.md<CR>
"
" " FZF
" " nnoremap <leader>ff :Files<CR>
" " nnoremap <leader>fb :Buffers<CR>
" " nnoremap <leader>fg :GitFiles<CR>
" " nnoremap <leader>fl :BLines<CR>
" " nnoremap <leader>fn :NV<CR>
" " nnoremap <leader>f. :Files $DOTFILES<CR>
" " nnoremap <leader>fw :Rg<CR>
" " nnoremap <C-h> :Helptags<CR>
"
" nnoremap <leader>ff :Telescope find_files<CR>
" nnoremap <leader>fb :Telescope buffers<CR>
" nnoremap <leader>fl :Telescope current_buffer_fuzzy_find<CR>
" nnoremap <leader>fn :NV<CR>
" nnoremap <leader>f. :Telescope find_files<CR>
" nnoremap <leader>fw :Telescope live_grep<CR>
" nnoremap <C-h> :Telescope help_tags<CR>
"
" nnoremap <leader>j :Explore<CR>
"
" nnoremap èq :cprevious<CR>
" nnoremap +q :cnext<CR>
" nnoremap èl :lprevious<CR>
" nnoremap +l :lnext<CR>
"
" nnoremap <leader>gs :vert G<CR>
" nnoremap <leader>gl :Commits<CR>
" nnoremap <leader>gd :vert G diff<CR>
" nnoremap <leader>gp :G push 
" nnoremap <leader>gc :G checkout 
" nnoremap <leader>gj :diffget //3<CR>
" nnoremap <leader>gf :diffget //2<CR>
" nnoremap <leader>gb :!git branch<CR>
"
" nnoremap q <C-w>c
" nnoremap Q q
" nnoremap <left> <C-w><
" nnoremap <right> <C-w>>
"
" let g:ledger_maxwidth = 80
" let g:markdown_folding = 1
" let g:markdown_fenced_languages = ['c', 'python', 'ruby', 'vim']
