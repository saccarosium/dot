local dap = require('dap')

dap.adapters.cppdbg = {
  id = 'cppdbg',
  type = 'executable',
  command = '/Users/sacca/Repos/vscode-cpptools/extension/debugAdapters/bin/OpenDebugAD7',
}

dap.configurations.cpp = {
  {
    name = 'g++ - Build and debug',
    type = 'cppdbg',
    request = 'launch',
    MIMode = 'gdb',
    miDebuggerPath = '/usr/local/bin/gdb',
    cwd = '${workspaceFolder}',
    program = '${fileDirname}/debug_executable',
    -- program = function()
    --   return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    -- end,
    preLauchTask = 'MAKE DEBUG'
  },
}

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

vim.cmd [[
  nnoremap <silent> <F5> :lua require'dap'.continue()<CR>
  nnoremap <silent> <F10> :lua require'dap'.step_over()<CR>
  nnoremap <silent> <F11> :lua require'dap'.step_into()<CR>
  nnoremap <silent> <F12> :lua require'dap'.step_out()<CR>
  nnoremap <silent> <leader>b :lua require'dap'.toggle_breakpoint()<CR>
  nnoremap <silent> <leader>B :lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
  nnoremap <silent> <leader>lp :lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
  nnoremap <silent> <leader>dr :lua require'dap'.repl.open()<CR>
  nnoremap <silent> <leader>dl :lua require'dap'.run_last()<CR>
]]
