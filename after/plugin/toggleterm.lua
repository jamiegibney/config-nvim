require("toggleterm").setup({
    hide_numbers = true,
    shade_terminals = false,
})

vim.keymap.set("n", "<C-Space>", ":ToggleTerm size=10 direction=float<CR>a<BS>")
vim.keymap.set("t", "<C-Space>", "<C-\\><C-n>:ToggleTerm<CR>")
