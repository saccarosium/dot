vim.cmd[[autocmd FileType org setlocal iskeyword+=:,#,+]]

require('orgmode').setup({
  org_agenda_files = {'~/Documents/nextcloud/Projects/org/*'},
  org_default_notes_file = '~/Dropbox/org/refile.org',
  org_todo_keywords = {'TODO', 'WAIT', '|', 'DONE'},
  org_hide_leading_stars = true,
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
        template = '** TODO %?\n',
        target = '~/Documents/nextcloud/Projects/org/todo.org',
        heading = 'REMINDERS',
      }
  }
})