require("toggleterm").setup({
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
        enabled = true,
    },
})

-- toggle floating terminal
vim.keymap.set("n", "<C-Space>", ":ToggleTerm size=10 direction=float<CR>a<Esc><BS><BS>")
vim.keymap.set("t", "<C-Space>", "<C-\\><C-n>:ToggleTerm<CR>")
