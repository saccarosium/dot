local M = {}
local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')

function M.new_note(prompt_bufnr)
  actions.close(prompt_bufnr)
  vim.cmd("edit " .. vim.env.NOTES .. "/" .. action_state.get_current_line() .. ".md")
end

return M
