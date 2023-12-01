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

    open_mapping = [[<C-Space>]],
})
