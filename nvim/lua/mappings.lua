vim.keymap.set('n', 'ga', '<C-^>')
vim.keymap.set('n', 'S', ':%s/')
vim.keymap.set('n', '-', ':Explore<CR>')
vim.keymap.set('n', '<a-o>', 'o<esc>k')
vim.keymap.set('n', '<a-O>', 'O<esc>j')
vim.keymap.set('n', '<C-q>', function()
    if vim.fn.empty(vim.fn.filter(vim.fn.getwininfo(), 'v:val.quickfix')) == 1 then
        vim.api.nvim_command('copen')
    else
        vim.api.nvim_command('cclose')
    end
end)
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')
vim.keymap.set('v', '<C-y>', '"+y')
