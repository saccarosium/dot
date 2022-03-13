local M = {}

function M.search_notes()
  require('telescope.builtin').find_files ({
    hidden = false,
    prompt_title = "< Notes >",
    search_dirs = { "~/Documents/nextcloud/Projects/programmazione", vim.env.NOTES },
  })
end

function M.search_dotfiles()
  require("telescope.builtin").find_files({ 
    prompt_title = "< DotFiles >", 
    cwd = vim.env.DOTFILES,  
  })
end

return M