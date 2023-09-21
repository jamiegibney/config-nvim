local builtin = require "telescope.builtin"

-- * -- KEYMAPS -- * --
-- "find file"
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})

-- "find word"
vim.keymap.set("n", "<leader>fw", builtin.live_grep, {})

-- "git file"
vim.keymap.set("n", "<leader>gf", builtin.git_files, {})

-- "file old"
vim.keymap.set("n", "<leader>fo", builtin.oldfiles, {})

-- "find in"
vim.keymap.set("n", "<leader>fi", builtin.current_buffer_fuzzy_find, {})

-- "go references"
vim.keymap.set("n", "gr", builtin.lsp_references, {})

-- "telescope resume"
vim.keymap.set("n", "<leader>tr", builtin.resume, {})

-- "buffers"
vim.keymap.set("n", "<leader>bu", builtin.buffers)

-- "spell suggest"
vim.keymap.set("n", "<leader>su", builtin.spell_suggest)

-- "undo"
vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<CR>")


require("telescope").load_extension("harpoon")
require("telescope").load_extension("undo")

require("telescope").setup {
    extensions = {
        undo = {
            -- use_delta = true,
            -- side_by_side = true,
            layout_strategy = "vertical",
            layout_config = {
                preview_height = 0.6,
            },
        },
    },
    defaults = {
        vimgrep_arguments = {
            "rg",
            "-L",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "-u",
            "-u",
        },

        prompt_title = false,
        dynamic_preview_title = true,
        results_title = false,
        path_display = "truncate",

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
        -- border = {},
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
        -- Developer configurations: Not meant for general override
        buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
    },
    pickers = {
        find_files = {
            hidden = true,
        },
        spell_suggest = {
            layout_strategy = "cursor",
        },
        lsp_references = {
            layout_strategy = "cursor",
            layout_config = {
                width = 0.8,
                height = 0.8,
            },
        },
    },
}
