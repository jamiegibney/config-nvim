require("oil").setup {
    default_file_explorer = true,
    columns = {
        "icon",
        -- "size";
        -- "mtime";
    },
    skip_confirm_for_simple_edits = false,

    delete_to_trash = true,
    trash_command = "trash",

    keymaps = {
        ["<C-o>"] = "actions.select",
        ["<C-i>"] = "actions.parent",
        ["<C-v>"] = "actions.select_vsplit",
        ["<BS>"] = "actions.parent",
    },

    view_options = {
        show_hidden = true,
    },

    float = {
        padding = 1,
        border = "single",
        -- override = function(conf) -- use this to pass options to nvim_open_win
    },

    progress = {
        border = "single",
    },
}
