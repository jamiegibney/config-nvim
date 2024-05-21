local builtin = require "telescope.builtin"
local actions = require("telescope.actions")
local km = vim.keymap

-- "find file"
km.set("n", "<leader>ff", builtin.find_files, {})

-- "find all"
km.set("n", "<leader>fa", function()
    ---@diagnostic disable-next-line: param-type-mismatch, redundant-parameter
    builtin.find_files({ cwd = "~/Documents/dev/" })
end)

-- "find word"
km.set("n", "<leader>fw", builtin.live_grep, {})

-- "find this"
km.set("n", "<leader>ft", builtin.grep_string, {})

-- "git file"
km.set("n", "<leader>gf", builtin.git_files, {})

-- "file old"
km.set("n", "<leader>fo", builtin.oldfiles, {})

-- "find in"
km.set("n", "<leader>fi", builtin.current_buffer_fuzzy_find, {})

-- "goto references"
km.set("n", "gr", builtin.lsp_references, {})

-- "telescope resume"
km.set("n", "<leader>tr", builtin.resume, {})

-- "buffers"
km.set("n", "<leader>bu", builtin.buffers)

-- "what diagnostics"
km.set("n", "<leader>wd", builtin.diagnostics)

-- "spell suggest"
km.set("n", "<leader>su", builtin.spell_suggest)

-- "find help"
km.set("n", "<leader>fh", builtin.help_tags)

pcall(require("telescope").load_extension, "fzf")
pcall(require("telescope").load_extension, "smart_history")

vim.api.nvim_create_autocmd("FileType", {
    pattern = "TelescopeResults",
    callback = function(ctx)
        vim.api.nvim_buf_call(ctx.buf, function()
            vim.fn.matchadd("TelescopePwd", "[A-Za-z/…].*/")
            vim.api.nvim_set_hl(0, "TelescopePwd", { fg = "#999999" })
        end)
    end,
})

require("telescope").setup {
    extensions = {
        fzf = {},
        history = { limit = 100, },
        wrap_results = true,
    },
    defaults = {
        -- -> => == !=

        prompt_title = false,
        dynamic_preview_title = true,
        results_title = false,
        path_display = {
            truncate = 2,
        },
        -- path_display = function(_, path)
        --     local tail = vim.fs.basename(path)
        --     local parent = vim.fs.dirname(path)
        --     if parent == "." then return tail end
        --
        --     local pwd
        --     local full
        --     for str in string.gmatch(parent, "([^/]+)") do
        --         if pwd ~= nil then
        --             if full == nil then
        --                 full = string.format("%s/", pwd)
        --             end
        --             full = string.format("%s%s/", full, pwd)
        --         end
        --         pwd = str
        --     end
        --
        --     return string.format(" %s/%s\t\t%s", pwd, tail, full)
        -- end,

        prompt_prefix = "> ",
        selection_caret = "  ",
        entry_prefix = "  ",

        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "descending",

        layout_strategy = "horizontal",
        layout_config = {
            horizontal = {
                prompt_position = "bottom",
                preview_width = 0.40,
                -- results_width = 0.8,
                width = 0.85,
                height = 0.9,
            },
            vertical = {
                prompt_position = "bottom",
                mirror = false,
            },
            cursor = {
                height = 0.3,
                width = 0.3,
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

        file_sorter = require("telescope.sorters").get_fzy_sorter,
        file_ignore_patterns = { "node_modules" },
        generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
        set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
        -- file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        -- grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        -- qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,

        mappings = {
            i = {
                ["<Esc>"] = actions.close,
            },
        },
    },
    pickers = {
        find_files = {
            hidden = false,
        },
        spell_suggest = {
            layout_strategy = "cursor",
        },
    },
}
