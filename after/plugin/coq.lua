vim.g.coq_settings = {
    auto_start = "shut-up",
    completion = {
        replace_prefix_threshold = 6,
        smart = true,
    },
    display = {
        pum = {
            fast_close = true,
        },
        ghost_text = {
            enabled = false,
        },
    },
    keymap = {
        pre_select = true,
        manual_complete = "<C-i>",
        recommended = false,
    },
}

vim.cmd([[
ino <silent><expr> <Esc>   pumvisible() ? "\<C-e><Esc>" : "\<Esc>"
ino <silent><expr> <C-c>   pumvisible() ? "\<C-e><C-c>" : "\<C-c>"
ino <silent><expr> <BS>    pumvisible() ? "\<C-e><BS>"  : "\<BS>"
ino <silent><expr> <CR>    pumvisible() ? (complete_info().selected == -1 ? "<C-c>a<CR>" : "<C-c>a<CR>") : "\<CR>"
ino <silent><expr> <C-y>   pumvisible() ? (complete_info().selected == -1 ? "\<C-e><CR>" : "\<C-y>") : "\<CR>"
]])
