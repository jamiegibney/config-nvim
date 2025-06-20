-- require("blink-cmp").setup({
--     keymap = {
--         preset = "default",
--         ["<C-e>"] = { "show", "show_documentation", "hide_documentation" },
--         ["<C-y>"] = { "select_and_accept" },
--         ["<C-f>"] = { "snippet_forward" },
--         ["<S-C-f>"] = { "snippet_backward" },
--     },
--
--     completion = {
--         accept = {
--             auto_brackets = {
--                 enabled = false,
--             }
--         },
--
--         documentation = {
--             auto_show = true,
--             auto_show_delay_ms = 10,
--         },
--
--         trigger = {
--             signature_help = {
--                 enabled = false
--             }
--         },
--
--         ghost_text = {
--             enabled = true,
--         },
--     },
--
--     sources = {
--         default = { "lsp", "path", "snippets", },
--         per_filetype = {
--             oil = {},
--             txt = { "buffer", "path", },
--         },
--     },
--
--     appearance = {
--         nerd_font_variant = "mono",
--         kind_icons = {
--             Text = "  ",
--             Method = "󰊕 ",
--             Function = "󰊕 ",
--             Constructor = "󰊕 ",
--
--             Field = "  ",
--             Variable = "  ",
--             Property = "  ",
--
--             Class = "  ",
--             Interface = "  ",
--             Struct = "  ",
--             Module = "  ",
--
--             Unit = "  ",
--             Value = "󰎠  ",
--             Enum = "   ",
--             EnumMember = "  ",
--
--             -- Keyword = "󰻾 ",
--             Keyword = "󰌋  ",
--             Constant = "󰏿  ",
--
--             Snippet = "  ",
--             Color = "  ",
--             File = "  ",
--             Reference = "  ",
--             Folder = "  ",
--             Event = "  ",
--             Operator = "  ",
--             TypeParameter = "  ",
--         },
--     },
-- })
--
-- local function hl(group, opts)
--     vim.api.nvim_set_hl(0, group, opts)
-- end
--
-- hl("BlinkCmpGhostText", { fg = "#bbbbbb" })
