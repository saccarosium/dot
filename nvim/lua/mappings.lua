vim.keymap.set('n', 'ga', '<C-^>')
vim.keymap.set('n', '<tab>', 'za')
vim.keymap.set('n', 'S', ':%s/')
vim.keymap.set('n', '-', ':Explore<CR>')
vim.keymap.set('n', 'go', 'o<esc>k')
vim.keymap.set('n', 'gO', 'O<esc>j')
vim.keymap.set('n', '<C-q>', function()
    if vim.fn.empty(vim.fn.filter(vim.fn.getwininfo(), 'v:val.quickfix')) == 1 then
        vim.api.nvim_comman('copen')
    else
        vim.api.nvim_command('cclose')
    end
end)

vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')
vim.keymap.set('v', 'Y', '"+y')
