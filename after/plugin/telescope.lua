local builtin = require "telescope.builtin"
local actions = require("telescope.actions")
local km = vim.keymap

-- "find file"
km.set("n", "<leader>ff", builtin.find_files, {})

-- "find word"
km.set("n", "<leader>fw", builtin.live_grep, {})

-- "git file"
km.set("n", "<leader>gf", builtin.git_files, {})

-- "file old"
km.set("n", "<leader>fo", builtin.oldfiles, {})

-- "find in"
km.set("n", "<leader>fi", builtin.current_buffer_fuzzy_find, {})

-- "go references"
km.set("n", "gr", builtin.lsp_references, {})

-- "telescope resume"
km.set("n", "<leader>tr", builtin.resume, {})

-- "buffers"
km.set("n", "<leader>bu", builtin.buffers)

-- "spell suggest"
km.set("n", "<leader>su", builtin.spell_suggest)


require("telescope").load_extension("fzf")

require("telescope").setup {
    defaults = {
        -- vimgrep_arguments = {
        --     "rg",
        --     "-L",
        --     "--color=never",
        --     "--no-heading",
        --     "--with-filename",
        --     "--line-number",
        --     "--column",
        --     "--smart-case",
        --     "-u",
        --     "-u",
        -- },

        prompt_title = false,
        dynamic_preview_title = true,
        results_title = false,
        -- path_display = "truncate",

        prompt_prefix = "=> ",
        selection_caret = " ",
        entry_prefix = " ",

        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "descending",

        layout_strategy = "vertical",
        layout_config = {
            horizontal = {
                prompt_position = "top",
                preview_width = 0.55,
                results_width = 0.8,
            },
            vertical = {
                prompt_position = "bottom",
                mirror = false,
            },
            cursor = {
                height = 0.5,
                width = 0.5,
                preview_width = 0.6,
            },
            center = {
                height = 0.3,
            },
            width = 0.65,
            height = 0.80,
            preview_cutoff = 0,
        },

        winblend = 0,
        color_devicons = true,
        borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
        -- borderchars = { "━", "┃", "━", "┃", "┏", "┓", "┛", "┗" },

        file_sorter = require("telescope.sorters").get_fuzzy_file,
        file_ignore_patterns = { "node_modules" },
        generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
        -- path_display = { "truncate" },
        set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,

        mappings = {
            i = {
                ["<Esc>"] = actions.close,
            },
        },
    },
    pickers = {
        find_files = {
            hidden = true,
        },
        spell_suggest = {
            layout_strategy = "cursor",
        },
    },
}
