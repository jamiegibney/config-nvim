local gp = require "goto-preview"
gp.setup {
    references = {
        telescope = require("telescope.themes").get_dropdown { hide_preview = false },
    },
    width = 80,
    focus_on_open = false,
    opacity = 10,
    border = { "↖", "─", "┐", "│", "┘", "─", "└", "│" },
    dismiss_on_move = true,
}

-- mappings
-- "(preview) go definition"
vim.keymap.set("n", "<leader>gd", function()
    gp.goto_preview_definition()
end)

-- "(preview) type definition"
vim.keymap.set("n", "<leader>td", function()
    gp.goto_preview_type_definition()
end)
