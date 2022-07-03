-- Settings

vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
if vim.fn.executable('rg') == 1 then
    vim.opt.grepprg = 'rg --vimgrep --no-heading'
end
vim.opt.swapfile = false

vim.opt.shortmess = vim.opt.shortmess + 'A' -- ignore annoying swapfile messages
vim.opt.shortmess = vim.opt.shortmess + 'I' -- no splash screen
vim.opt.shortmess = vim.opt.shortmess + 'O' -- file-read message overwrites previous
vim.opt.shortmess = vim.opt.shortmess + 'T' -- truncate non-file messages in middle
vim.opt.shortmess = vim.opt.shortmess + 'W' -- don't echo "[w]"/"[written]" when writing
vim.opt.shortmess = vim.opt.shortmess + 'a' -- use abbreviations in messages eg. `[RO]` instead of `[readonly]`
vim.opt.shortmess = vim.opt.shortmess + 'c' -- completion messages
vim.opt.shortmess = vim.opt.shortmess + 'o' -- overwrite file-written messages
vim.opt.shortmess = vim.opt.shortmess + 't' -- truncate file messages at start

vim.g.mapleader = ' '

vim.opt.path = vim.opt.path + '**' -- add to path every subdirectory in cwd
vim.opt.cursorline = true
vim.opt.guicursor = nil
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.termguicolors = true
vim.opt.laststatus = 0
vim.opt.list = true
vim.opt.listchars = {eol = '¬',tab = '> ',space = '·',trail = '-'}
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.foldmethod = 'marker'
vim.opt.wrap = false
vim.opt.textwidth = 80
vim.opt.title = true
vim.opt.wildignorecase = true
vim.opt.wildignore = vim.opt.wildignore + '*.o'
vim.opt.wildignore = vim.opt.wildignore + '*.a'
vim.opt.wildignore = vim.opt.wildignore + '.git/'
