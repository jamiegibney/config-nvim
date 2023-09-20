local cap = vim.lsp.protocol.make_client_capabilities()
cap.window.workDoneProgress = true

cap.textDocument.completion.completionItem.snippetSupport = true
cap.textDocument.completion.completionItem.commitCharactersSupport = true
cap.textDocument.completion.completionItem.deprecatedSupport = true
cap.textDocument.completion.completionItem.preselectSupport = true
cap.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
cap.textDocument.completion.completionItem.insertReplaceSupport = true
cap.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    "documentation",
    "detail",
    "additionalTextEdits",
  },
}
cap.textDocument.completion.completionItem.labelDetailsSupport = true

local lsp = require("lspconfig")
local coq = require("coq")

lsp["clangd"].setup {
    capabilities = cap,
    cmd = {
        "clangd",
        "--background-index",
        "--clang-tidy",
        "--cross-file-rename",
        -- "--completion-style=bundled",
        -- "--header-insertion=iwyu",
    },
    init_options = {
        semanticHighlighting = true,
    },
    coq.lsp_ensure_capabilities()
}

lsp["rust_analyzer"].setup {
    coq.lsp_ensure_capabilities()
}

-- local lsp = require("lsp-zero").preset {
--     configure_diagnostics = true,
--     setup_servers_on_start = true,
--     set_lsp_keymaps = false,
--     manage_nvim_cmp = {
--         set_sources = "recommended",
--         set_basic_mappings = false,
--         set_extra_mappings = false,
--         use_luasnip = true,
--         set_format = true,
--         documentation_window = true,
--     },
-- }
--
-- local cmp = require "cmp"
-- local cmp_autopairs = require "nvim-autopairs.completion.cmp"
--
-- local cmp_select = { behaviour = cmp.SelectBehavior.Insert }
-- local cmp_mappings = lsp.defaults.cmp_mappings {
--     -- ["<CR>"] = cmp.mapping.confirm { select = true },
--     ["<C-y>"] = cmp.mapping.confirm { select = true },
--     ["<C-e>"] = cmp.mapping.abort(),
--
--     ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
--     ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
--
--     ["<C-d>"] = cmp.mapping.scroll_docs(4),
--     ["<C-f>"] = cmp.mapping.scroll_docs(-4),
--
--     ["<C-i>"] = cmp.mapping.complete(),
-- }
--
-- cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
--
-- lsp.setup_nvim_cmp {
--     mapping = cmp_mappings,
--     window = {
--         completion = {
--             scrolloff = 5,
--             side_padding = 1,
--         },
--         preselect = require("cmp").PreselectMode.None,
--         complete = {
--             completeopt = "menu,menuone,noinsert,noselect",
--         },
--     },
-- }
--
-- require("mason-lspconfig").setup({
--     ensure_installed = {
--         "lua_ls",
--     },
-- })
--
-- -- LSP keymaps are here - note that the default implementation of
-- -- any of these keymaps will be used if an LSP server is not available
-- -- for the current buffer. also, Telescope implements the LSP references
-- -- with "gr" ("go references"), and goto-preview implements (type)
-- -- definition preview with "<leader>gd/td".
-- lsp.on_attach(function(client, bufnr)
--     -- lsp action - "action"
--     vim.keymap.set("n", "<leader>a", function()
--         vim.lsp.buf.code_action()
--     end)
--
--     -- lsp info - "info"
--     vim.keymap.set("n", "<leader>i", function()
--         vim.lsp.buf.hover()
--     end)
--
--     -- lsp signature
--     vim.keymap.set("n", "<leader>ls", function()
--         vim.lsp.buf.signature_help()
--     end)
--
--     -- lsp rename
--     vim.keymap.set("n", "<leader>rn", function()
--         vim.lsp.buf.rename()
--     end)
--
--     -- lsp format
--     vim.keymap.set("n", "<leader>fm", function()
--         vim.lsp.buf.format { async = true }
--     end)
--
--     -- lsp usages - "go usages"
--     vim.keymap.set("n", "gu", function()
--         vim.lsp.buf.usages()
--     end)
--
--     -- lsp definition - "go definition"
--     vim.keymap.set("n", "gd", function()
--         vim.lsp.buf.definition()
--     end)
--
--     -- lsp type definition - "type definition"
--     vim.keymap.set("n", "td", function()
--         vim.lsp.buf.type_definition()
--     end)
--
--     -- lsp diagnostics - "DiagNostics"
--     vim.keymap.set("n", "<leader>dn", function()
--         vim.diagnostic.open_float {
--             border = "rounded",
--             source = true,
--         }
--     end)
-- end)
--
-- -- require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())
--
-- lsp.set_server_config {
--     on_init = function(client)
--         client.server_capabilities.documentFormattingProvider = true
--         client.server_capabilities.documentRangeFormattingProvider = true
--     end,
-- }
--
-- lsp.set_sign_icons {
--     error = "✘",
--     warn = "!",
--     hint = "~",
--     info = "-",
-- }
--
-- lsp.skip_server_setup { "rust_analyzer" }
--
-- lsp.setup()
--
-- -- prints a table out
-- local function tprint(tbl, indent)
--     if not indent then
--         indent = 0
--     end
--     for k, v in pairs(tbl) do
--         local formatting = string.rep("{ ", indent) .. k .. ": "
--         if type(v) == "table" then
--             print(formatting)
--             tprint(v, indent + 1)
--         elseif type(v) == "boolean" then
--             print(formatting .. tostring(v))
--         else
--             print(formatting .. v)
--         end
--     end
-- end
--
-- -- TODO: this does not work if the "for further information" dialogue is the last line of the message
-- -- removes "for further information" message in clippy diagnostics
-- local function remove_further_information(msg)
--     local start, _ = string.find(msg, "for further information")
--     if start == nil then
--         return msg
--     end
--
--     local last = 0
--     local i = 0
--     while true do
--         i = string.find(msg, "\n", last + 1)
--         if i == nil then
--             break
--         end
--         last = i
--     end
--
--     local result = string.sub(msg, 1, start - 1) .. string.sub(msg, last)
--     return result
-- end
--
-- vim.diagnostic.config {
--     virtual_text = {
--         spacing = 3,
--         format = function(diag)
--             return remove_further_information(diag.message)
--         end,
--     },
--     signs = true,
--     update_in_insert = true,
--     underline = true,
--     severity_sort = true,
-- }
