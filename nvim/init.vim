"GENERAL SETTINGS set path+=**
    set nobackup noswapfile autowriteall
    set conceallevel=2
    set tabstop=4 softtabstop=4 shiftwidth=4 expandtab autoindent
    set wildmenu wildignorecase 
    set number relativenumber
    set laststatus=0 noshowcmd guicursor=
    set clipboard+=unnamed "set the vim's clipboard to the system's clipboard
    let loaded_netrwPlugin = 1 "disabling netrw
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

"KEYBINDINGS
    let mapleader=" "
    let maplocalleader=" "
    nnoremap Y y$
    inoremap <C-c> <nop>
    nnoremap <C-c> <C-W>c
    nnoremap <C-h> <C-W>h
    nnoremap <C-j> <C-W>j
    nnoremap <C-k> <C-W>k
    nnoremap <C-l> <C-W>l
    nnoremap <C-s> :!
    nnoremap <leader>p :bn<CR>
    nnoremap <leader>n :bp<CR>
    nnoremap <leader>fe :e ~/.config/nvim/init.vim<CR>
    nnoremap <leader>al Vgq
    nnoremap <leader>P :!open -a Typora %<CR>
    "fix indetation command in visual mode
    vmap < <gv
    vmap > >gv

call plug#begin('~/.local/share/nvim/plugins')

    Plug 'dracula/vim'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'ap/vim-css-color'
    Plug 'vim-pandoc/vim-pandoc-syntax'
    Plug 'vim-pandoc/vim-pandoc'
    " Native Lsp
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'

call plug#end()

"COLORS
    colorscheme dracula
    set termguicolors t_Co=256


"VIM-PANDOC
    augroup pandoc_syntax
        au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
    augroup END
    let g:pandoc#modules#disabled = ["folding", "formatting", "completition", "spell", "menu"]  
    let g:pandoc#syntax#conceal#blacklist = ["atx", "codeblock_start", "codeblock_delim"]

lua << EOF

require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
}

require'cmp'.setup{

	sources = {
		{ name = "nvim_lsp" },
		{ name = "buffer" },
	},
}

vim.lsp.set_log_level("debug")

require'lspconfig'.clangd.setup{
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 100,
    }
}

EOF
