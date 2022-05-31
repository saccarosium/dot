require('orgmode').setup_ts_grammar()

require'nvim-treesitter.configs'.setup {
    -- One of "all", "maintained" (parsers with maintainers), or a list of languages
    ensure_installed = {
        "vim", "lua", "cpp", "c", "bash", "nix", "commonlisp", "llvm", "python", "go", "org"
    },
    -- Install languages synchronously (only applied to `ensure_installed`)
    sync_install = true, -- List of parsers to ignore installing
    highlight = {
        -- `false` will disable the whole extension
        enable = true, -- list of language that will be disabled
        disable = {'org'},
        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = {'org'}
    },
    indent = {enable = false},
    refactor = {
        smart_rename = {
          enable = true,
          keymaps = {
            smart_rename = "gR",
          },
        },
        navigation = {
          enable = true,
          keymaps = {
            goto_definition = "gnd",
            list_definitions = "gnD",
            list_definitions_toc = "gO",
            goto_next_usage = "<a-*>",
            goto_previous_usage = "<a-#>",
          },
        },
    },
}

vim.cmd [[nnoremap <leader>th :TSToggle highlight<CR>]]
