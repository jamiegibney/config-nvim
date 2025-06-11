-- vim.api.nvim_create_autocmd("LspAttach", {
--     group = vim.api.nvim_create_augroup("lsp_attach", { clear = true }),
--     callback = function(event)
--         local map = function(keys, func, mode)
--             mode = mode or "n"
--             vim.keymap.set(mode, keys, func, { buffer = event.buf })
--         end
--
--         map("<leader>ca", function() vim.lsp.buf.code_action() end)
--         map("<leader>i", function() vim.lsp.buf.hover() end)
--         map("<leader>rn", function() vim.lsp.buf.rename() end)
--         map("<leader>fm", function() vim.lsp.buf.format({ async = true }) end)
--         map("gd", function() vim.lsp.buf.definition() end)
--         map("<C-h>", function() vim.lsp.buf.signature_help() end, "i")
--         map("dn", function() vim.diagnostic.open_float({ source = true }) end)
--         map("<C-[>", function() vim.diagnostic.goto_prev() end)
--         map("<C-]>", function() vim.diagnostic.goto_next() end)
--     end
-- })

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend("force", capabilities, require("blink.cmp").get_lsp_capabilities({}, false))

local servers = {
    clangd = {},
    rust_analyzer = {},
    lua_ls = {},
    -- jsonls = {},
    -- zls = {},
    -- ols = {},
}

local hover_fn = function(_, result, ctx, config)
    if not (result and result.contents) then
        return vim.lsp.handlers.hover(_, result, ctx, config)
    end
    if type(result.contents) == "string" then
        local s = string.gsub(result.contents, [[\\*]], [[*]])
        s = string.gsub(s, [[\\`]], [[`]])
        result.contents = s
    else
        local s = string.gsub((result.contents or {}).value or "", "\\", "")
        -- s = string.gsub(s, "\\`", "`")
        -- s = string.gsub(s, "\\\\*", "\\*")
        s = string.gsub(s, "\n\n", "\n\n\n")

        result.contents.value = s
    end

    return vim.lsp.handlers.hover(_, result, ctx, config)
end

vim.lsp.enable("lua_ls")
vim.lsp.enable("rust_analyzer")
vim.lsp.enable("jsonls")

vim.lsp.enable("clangd")
vim.lsp.config("clangd", {
    cmd = {
        "clangd",
        "--background-index",
        "--clang-tidy",
        "--cross-file-rename",
        "--header-insertion-decorators",
    },
    init_options = {
        semanticHighlighting = true,
    },
    capabilities = capabilities,
    settings = servers["clangd"],
    filetypes = (servers["clangd"] or {}).filetypes,
    handlers = {
        ["textDocument/hover"] = vim.lsp.with(hover_fn, {})
    },
})

vim.diagnostic.config({
    virtual_text = {
        spacing = 4,
        prefix = "⏺",
    },
    signs = false,
    update_in_insert = false,
    underline = true,
    severity_sort = true,
})

-- TODO: omnisharp LSP (see _lsp.lua)
