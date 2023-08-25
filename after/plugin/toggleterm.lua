require("toggleterm").setup({
    hide_numbers = true,
    shade_terminals = false,
})

-- toggle floating terminal
vim.keymap.set("n", "<C-Space>", ":ToggleTerm size=10 direction=float<CR>a<BS>")
vim.keymap.set("t", "<C-Space>", "<C-\\><C-n>:ToggleTerm<CR>")

-- toggle rhs terminal in split
vim.keymap.set("n", "<leader>tt", ":ToggleTerm direction=vertical size=80<CR>a<BS>")
-- not using this because it causes waiting for the space key in terminal mode
-- vim.keymap.set("t", "<leader>tt", "<C-\\><C-n>:ToggleTerm<CR>")
