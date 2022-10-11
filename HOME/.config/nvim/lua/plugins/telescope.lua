local actions = require('telescope.actions')

require('telescope').setup{
  defaults = {
    prompt_prefix = "❯ ",
    selection_caret = "❯ ",
    mappings = {
    },
  },
  pickers = {
    find_files = {
      theme = "ivy",
    },
    live_grep = {
      theme = "dropdown",
    },
    git_files = {
      theme = "ivy",
    },
    buffers = {
      theme = "dropdown",
    },
    current_buffer_fuzzy_find = {
      theme = "ivy",
    },
    lsp_code_actions = {
      theme = "dropdown",
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
    file_browser = {
      theme = "dropdown",
    },
  },
}

require("telescope").load_extension "file_browser"
require('telescope').load_extension('fzf')

vim.api.nvim_set_keymap(
  "n",
  "<space>fb",
  ":Telescope file_browser<CR>",
  { noremap = true }
)


local mapper = function(mode, key, result)
  vim.api.nvim_set_keymap(mode, key, "<cmd>lua "..result.."<cr>", {noremap = true, silent = true})
end

function git_find_files()
  local results = require('telescope.utils').get_os_command_output({'git', 'rev-parse', '--git-dir'})

  if results[1] then
    require('telescope.builtin').git_files()
  else
    require('telescope.builtin').find_files()
  end
end

function search_dotfiles()
  require("telescope.builtin").find_files({
    prompt_title = "VimRC",
    cwd = "$HOME/.config/nvim/",
  })
end

mapper('n', '<space><space>', "require('telescope.builtin').buffers{ show_all_buffers = true }")
mapper('n', '<space>p', "git_find_files()")
mapper('n', '<space>ff', "require('telescope.builtin').live_grep()")
mapper('n', '<space>ca', "require('telescope.builtin').lsp_code_actions()")
mapper('n', '<space>fd', "search_dotfiles()")
