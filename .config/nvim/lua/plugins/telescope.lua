local actions = require('telescope.actions')

require('telescope').setup{
  defaults = {
    prompt_prefix = "$ ",
    selection_caret = "❯ ",
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    layout_strategy = "center",
    layout_config = {
      preview_cutoff = 1, -- Preview should always show (unless previewer = false)

      width = function(_, max_columns, _)
        return math.min(max_columns - 3, 80)
      end,

      height = function(_, _, max_lines)
        return math.min(max_lines - 4, 15)
      end,
    },
    border = true,
    borderchars = {
      { "─", "│", "─", "│", "╭", "╮", "╯", "╰"},
      prompt = {"─", "│", " ", "│", "╭", "╮", "│", "│"},
      results = {"─", "│", "─", "│", "├", "┤", "╯", "╰"},
      preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰"},
    },
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
  }
}

local mapper = function(mode, key, result)
  vim.api.nvim_set_keymap(mode, key, "<cmd>lua "..result.."<cr>", {noremap = true, silent = true})
end

local M = {}

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
