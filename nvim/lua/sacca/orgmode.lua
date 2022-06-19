local function get_project_name()
    local cwd = vim.fn.substitute(vim.fn.getcwd(), '^.*/', '', '')
    return cwd .. '.org'
end

vim.cmd[[autocmd FileType org setlocal iskeyword+=:,#,+]]

require('orgmode').setup({
  org_agenda_files = {'~/Documents/nextcloud/Projects/org/*'},
  org_todo_keywords = {'TODO(t)', 'FIXME(f)', 'BUG(b)', '|', 'WAIT(w)', 'DONE(d)'},
  org_hide_leading_stars = false,
  mappings = {
    global = {
      org_agenda = 'gA',
      org_capture = 'gC'
    },
    capture = {
        org_capture_finalize = 'ZZ',
        org_capture_refile = 'R',
        org_capture_kill = 'ZQ'
    },
  },
  org_capture_templates = {
      t = {
        description = 'Todo',
        template = '* TODO %?\n',
        target = '~/Documents/nextcloud/Projects/org/todo.org',
      },
      c = 'Code',
      ct = {
          description = 'TODO',
          template = '* TODO %?\n%a',
          target = '~/Documents/nextcloud/Projects/org/' .. get_project_name(),
      },
      cf = {
          description = 'FIXME',
          template = '* FIXME %?\n%a',
          target = '~/Documents/nextcloud/Projects/org/' .. get_project_name(),
      },
      cb = {
          description = 'BUG',
          template = '* BUG %?\n%a',
          target = '~/Documents/nextcloud/Projects/org/' .. get_project_name(),
      }
  }
})
