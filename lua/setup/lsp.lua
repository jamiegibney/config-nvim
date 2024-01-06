local on_attach = function(_, bufnr)
    -- local map = function(keys, func)
    --     local opts = { buffer = bufnr }
    --     vim.keymap.set("n", keys, func, opts)
    -- end
    --
    -- -- "code action"
    -- map("<leader>ca", function() vim.lsp.buf.code_action() end)
    --
    -- -- "information"
    -- map("<leader>i", function() vim.lsp.buf.hover() end)
    --
    -- -- "rename"
    -- map("<leader>rn", function() vim.lsp.buf.rename() end)
    --
    -- -- "format"
    -- map("<leader>fm", function() vim.lsp.buf.format({ async = true }) end)
    --
    -- -- "goto definition"
    -- map("gd", function() vim.lsp.buf.definition() end)
    --
    -- -- "diagnostics"
    -- map("<leader>dn", function()
    --     vim.diagnostic.open_float({
    --         -- border = "",
    --         source = true,
    --     })
    -- end)
end

local map = function(keys, func)
    vim.keymap.set("n", keys, func)
end

-- "code action"
map("<leader>ca", function() vim.lsp.buf.code_action() end)

-- "information"
map("<leader>i", function() vim.lsp.buf.hover() end)

-- "rename"
map("<leader>rn", function() vim.lsp.buf.rename() end)

-- "format"
map("<leader>fm", function() vim.lsp.buf.format({ async = true }) end)

-- "goto definition"
map("gd", function() vim.lsp.buf.definition() end)

-- "goto definition"
vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end)

-- "diagnostics"
map("<leader>dn", function()
    vim.diagnostic.open_float({
        -- border = "",
        source = true,
    })
end)

require("mason").setup()
require("mason-lspconfig").setup()

local servers = {
    lua_ls = {
        Lua = {
            diagnostics = { disable = { "missing-fields" } },
        },
    },
}

local lsp_config = require("lspconfig")
lsp_config.glsl_analyzer.setup({})
lsp_config.wgsl_analyzer.setup({})

require("neodev").setup()

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

local mason_lsp_config = require("mason-lspconfig")

mason_lsp_config.setup({
    ensure_installed = vim.tbl_keys(servers),
})

mason_lsp_config.setup_handlers({
    function(server_name)
        local lsp = require("lspconfig")
        -- rust_analyzer is setup in rust-tools.lua, so we need to skip it here
        if server_name == "rust_analyzer" then
            return
        end
        if server_name == "wgsl_analyzer" then
            return
        end
        if server_name == "clangd" then
            lsp["clangd"].setup {
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
            }
        end

        lsp[server_name].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = servers[server_name],
            filetypes = (servers[server_name] or {}).fileyptes,
        })
    end
})

-- TODO: this does not work if the "for further information" message is the last line of the message
local function remove_further_information(msg)
    local start, _ = string.find(msg, "for further information")
    if start == nil then
        return msg
    end

    local last = 0
    local i = 0
    while true do
        i = string.find(msg, "\n", last + 1)
        if i == nil then
            break
        end
        last = i
    end

    local result = string.sub(msg, 1, start - 1) .. string.sub(msg, last)
    return result
end

vim.diagnostic.config {
    virtual_text = {
        spacing = 3,
        format = function(diag)
            return remove_further_information(diag.message)
        end,
    },
    signs = false,
    update_in_insert = true,
    underline = true,
    severity_sort = true,
}
