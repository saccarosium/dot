local autocmd = vim.api.nvim_create_autocmd
vim.api.nvim_create_augroup("sacca", {clear = true})

autocmd({"WinNew", "WinClosed", "WinLeave", "WinEnter"}, {
    pattern = "*",
    callback = function()
    if vim.fn.tabpagewinnr(vim.fn.tabpagenr(), '$') == 1 then
        vim.opt.laststatus=0
    else
        vim.opt.laststatus=2
    end
end, group = sacca})

autocmd("TextYankPost", { pattern = "*", command = "lua require'vim.highlight'.on_yank({timeout = 50})", group = sacca })
autocmd({"BufNewFile", "BufRead"}, { pattern = "*.txt", command = "set filetype=asciidoc", group = sacca })

autocmd("Filetype", { pattern = "*", command = "set fo=pqBrn", group = sacca})
