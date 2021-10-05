local actions = require('telescope.actions')

require('telescope').setup{
  defaults = {
    prompt_prefix = "$ ",
    selection_caret = "❯ ",
    mappings = {
        i = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
            ["<esc>"] = actions.close,
        },
        n = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
        },
    },
  },
  pickers = {
    find_files = {
      theme = "dropdown",
    },
    live_grep = {
      theme = "dropdown",
    },
    git_files = {
      theme = "dropdown",
    },
    buffers = {
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
    }
  },
}


require('telescope').load_extension('fzf')

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
        prompt_title = "< VimRC >",
        cwd = "$HOME/.config/nvim/",
    })
end

mapper('n', '<C-p>', "git_find_files()")
mapper('', '<leader>r', "search_dotfiles()")
mapper('', '<leader>p', "require('telescope.builtin').find_files()")
mapper('', '<leader>\\', "require('telescope.builtin').buffers{ show_all_buffers = true }")
mapper('', '<leader>g', "require('telescope.builtin').live_grep()")
