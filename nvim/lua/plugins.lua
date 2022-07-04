local function load(package, module)
    local dir = vim.fn.expand("$PLUGS/")
    local target = dir .. package
    if vim.fn.isdirectory(target) == 1 then
        vim.api.nvim_command("packadd! " .. package)
        if module == 'lua' then
            require("sacca/" .. package)
        end
    end
end

load('colorizer', 'lua')
load('fzf')
load('fzf.vim')
load('nvim-treesitter', 'lua')
load('vim-dotoo')
load('vim-table-mode')
load('vim-code-dark')
load('vim-commentary')
load('vim-eunuch')
load('vim-fugitive')
