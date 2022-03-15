require('telescope').setup{
  defaults = require('telescope.themes').get_dropdown {
    file_previewer = require("telescope.previewers").cat.new,
    path_display = { "smart" },
    selection_caret = ">> ",
    mappings = {
      i = {
        ["<C-h>"] = "which_key",
        ["<C-s>"] = "select_horizontal",
        ["<esc>"] = require('telescope.actions').close,
        ["<C-y>"] = require('sacca.telescope.actions').new_note,
      }
    }
  },
  pickers = {
    find_files = {
      hidden = true,
    },
    buffers = {
      mappings = {
        i = {
          ["<C-x>"] = "delete_buffer",
        },
      },
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    },
  }
}

require('telescope').load_extension('fzf')

