local lsp = require('lspconfig')

vim.diagnostic.config({virtual_text = false})

-- You will likely want to reduce updatetime which affects CursorHold
-- note: this setting is global and should be set only once
vim.o.updatetime = 450
vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false, scope="cursor"})]]

-- local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
-- for type, icon in pairs(signs) do
--   local hl = "DiagnosticSign" .. type
--   vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
-- end

-- highlight errors instead of showing a symbol
-- vim.cmd [[
--   highlight! DiagnosticLineNrError guibg=#51202A guifg=#FF0000 gui=bold
--   highlight! DiagnosticLineNrWarn guibg=#51412A guifg=#FFA500 gui=bold
--   highlight! DiagnosticLineNrInfo guibg=#1E535D guifg=#00FFFF gui=bold
--   highlight! DiagnosticLineNrHint guibg=#1E205D guifg=#0000FF gui=bold
--
--   sign define DiagnosticSignError text= texthl=DiagnosticSignError linehl= numhl=DiagnosticLineNrError
--   sign define DiagnosticSignWarn text= texthl=DiagnosticSignWarn linehl= numhl=DiagnosticLineNrWarn
--   sign define DiagnosticSignInfo text= texthl=DiagnosticSignInfo linehl= numhl=DiagnosticLineNrInfo
--   sign define DiagnosticSignHint text= texthl=DiagnosticSignHint linehl= numhl=DiagnosticLineNrHint
-- ]]

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
local map = vim.api.nvim_set_keymap
local bmap = vim.api.nvim_buf_set_keymap

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  bmap(bufnr, 'n', ',,d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  bmap(bufnr, 'n', ',d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  bmap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  bmap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  bmap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  bmap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  bmap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  bmap(bufnr, 'n', '<space>la', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  bmap(bufnr, 'n', '<space>lr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  bmap(bufnr, 'n', '<space>ll', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  bmap(bufnr, 'n', '<space>lq', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
  bmap(bufnr, 'n', '<space>lD', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  -- bmap(bufnr, 'n', '<space>r', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  bmap(bufnr, 'n', '<space>la', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  bmap(bufnr, 'n', '<space>lf', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  bmap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
end
  
local util = require 'lspconfig.util'

lsp.clangd.setup { 
    on_attach = on_attach, 
}

-- lsp.ccls.setup {
--   on_attach = on_attach,
--   root_dir = util.root_pattern('.project', 'compile_commands.json', '.ccls', '.git'),
--   init_options = {
--     cache = {
--       directory = "/tmp/ccls";
--     };
--   }
-- }
