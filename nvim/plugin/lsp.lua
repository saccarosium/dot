local lsp = require('lspconfig')

vim.diagnostic.config({virtual_text = false})

-- You will likely want to reduce updatetime which affects CursorHold
-- note: this setting is global and should be set only once
vim.o.updatetime = 450
vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false, scope="cursor"})]]

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true }
local map = vim.api.nvim_set_keymap
local bmap = vim.api.nvim_buf_set_keymap

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  bmap(bufnr, 'n', ']d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  bmap(bufnr, 'n', '[d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  bmap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  bmap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  bmap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  bmap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  bmap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  bmap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  -- bmap(bufnr, 'n', '<space>la', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  -- bmap(bufnr, 'n', '<space>lr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  -- bmap(bufnr, 'n', '<space>ll', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  bmap(bufnr, 'n', '<space>ll', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
  bmap(bufnr, 'n', '<space>lD', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  bmap(bufnr, 'n', 'gR', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  bmap(bufnr, 'n', '<space>la', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  bmap(bufnr, 'n', '<space>lf', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  -- vim.cmd[[ Command! :lua vim.lsp.buf.add_workspace_folder() LspAddWorkspace]]
end

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

local null_ls = require("null-ls")
local code_actions = null_ls.builtins.code_actions
local formatting = null_ls.builtins.formatting

null_ls.setup{
    debug = false,
    on_attach = on_attach,
    sources = {
        code_actions.shellcheck,
        formatting.shfmt.with({
            extra_args = { "-i", "4" }
        }),
        formatting.nixfmt,
    },
}
