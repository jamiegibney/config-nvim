local Terminal = require("toggleterm.terminal").Terminal

require("toggleterm").setup({
    size = 40,

    hide_numbers = false,
    shade_terminals = false,
    highlights = {
        Normal = {
            link = "Normal",
        },
        NormalFloat = {
            link = "Normal",
        },
    },
    winbar = {
        enabled = false,
    },
    autochdir = true,
    start_in_insert = true,

    open_mapping = "<C-Space>",
    shell = "fish",
})

local lazygit = Terminal:new({
    cmd = "lazygit",
    hidden = true,
})

vim.keymap.set("n", "<leader>lg", function()
    lazygit:toggle()
end, {
    noremap = true,
    silent = true,
})
