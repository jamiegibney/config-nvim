require("oil").setup {
    default_file_explorer = true,
    columns = {
        "icon",
    },

    skip_confirm_for_simple_edits = false,

    delete_to_trash = true,

    win_options = {
        signcolumn = "yes",
        numberwidth = 6,
    },

    keymaps = {
        ["<C-r>"] = { "actions.refresh" },
        ["<BS>"] = { "actions.parent" },
        ["<C-z>"] = { "actions.select", opts = { horizontal = true } },

        -- enable this for floating windows for easy exit
        ["<C-c>"] = { "<Esc>:noh<CR>" },
        ["<C-h>"] = false,
    },

    view_options = {
        show_hidden = true,
        is_always_hidden = function(name, _)
            if name == ".DS_Store" or name == ".git" or name == ".idea" then
                return true
            end

            local start, _ = string.find(name, ".meta")
            if start ~= nil then
                return true
            end

            return false
        end,
        natural_order = true,
    },

    git = {
        add = function(_) return true end,
        mv = function(_, _) return true end,
        rm = function(_) return true end,
    },

    float = {
        padding = 1,
        border = "single",
    },

    progress = {
        border = "single",
    },

    watch_for_changes = true,
    constrain_cursor = "name",
}

require("oil-git-status").setup({})
