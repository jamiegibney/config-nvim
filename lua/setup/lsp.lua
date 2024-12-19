local on_attach = function(client, bufnr)
    if client.server_capabilities.signatureHelpProvider then
        require("lsp-overloads").setup(client, {
            keymaps = {
                next_signature = "<C-l>",
                previous_signature = "<C-h>",
                next_parameter = "",
                previous_parameter = "",
            },
            display_automatically = false,
        })
    end
end

local hover = function(_, result, ctx, config)
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

local map = function(keys, func)
    vim.keymap.set("n", keys, func)
end

-- "code action"
map("<leader>ca", function() vim.lsp.buf.code_action() end)

-- "information"
map("<leader>i", function() vim.lsp.buf.hover() end)

-- "rename"
map("<leader>rn", function()
    vim.lsp.buf.rename()
    vim.cmd("silent! wa")
end)

-- "format"
map("<leader>fm", function() vim.lsp.buf.format({ async = true }) end)

-- "goto definition"
map("gd", function() vim.lsp.buf.definition() end)

-- "goto declaration"
map("gG", function() vim.lsp.buf.declaration() end)

-- "goto definition"
vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end)

-- "diagnostics"
map("<leader>dn", function()
    vim.diagnostic.open_float({
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
lsp_config.sourcekit.setup({
    filetypes = {
        "swift",
    },
    cmd = {
        "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/sourcekit-lsp"
    },
    capabilities = {
        workspace = {
            didChangeWatchedFiles = {
                dynamicRegistration = true,
            },
        },
    },
})

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
        if server_name == "rust_analyzer" then
            return
        end

        if server_name == "clangd" then
            require("lspconfig").clangd.setup({
                cmd = {
                    "clangd",
                    "--background-index",
                    "--clang-tidy",
                    "--cross-file-rename",
                    "--header-insertion-decorators",
                    -- "--completion-style=bundled",
                    -- "--header-insertion=iwyu",
                },
                init_options = {
                    semanticHighlighting = true,
                },
                capabilities = capabilities,
                on_attach = on_attach,
                settings = servers[server_name],
                filetypes = (servers[server_name] or {}).filetypes,
                handlers = {
                    ["textDocument/hover"] = vim.lsp.with(hover, {})
                }
            })

            return
        end

        lsp[server_name].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = servers[server_name],
            filetypes = (servers[server_name] or {}).filetypes,
        })
    end
})

local function remove_unnecessary_info(msg)
    local start, _ = string.find(msg, "for further information")
    if start == nil then
        return msg
    end

    local last = 0
    local i = 0
    while true do
        i, _ = string.find(msg, "\n", last + 1)
        if i == nil then
            break
        end
        last = i
    end

    local result = string.sub(msg, 1, start - 1) .. string.sub(msg, last)
    local final, _ = string.find(result, "for further information")
    if final ~= nil then
        result = string.sub(result, 1, final - 1)
    end

    -- remove "to override ..." messages
    final, _ = string.find(result, "to override")
    if final == nil then
        return result
    else
        return string.sub(result, 1, final - 1)
    end
end

vim.diagnostic.config {
    virtual_text = {
        spacing = 4,
        prefix = "⏺",
        format = function(diag)
            return remove_unnecessary_info(diag.message)
        end,
    },
    signs = false,
    update_in_insert = true,
    underline = true,
    severity_sort = true,
}

local omnisharp = "/Users/jamiegibney/Documents/dev/other/omnisharp-osx"

require("lspconfig").omnisharp.setup({
    cmd = {
        "mono",
        "--assembly-loader=strict",
        omnisharp .. "/omnisharp/OmniSharp.exe",
    },
    on_attach = on_attach,
    use_mono = true,
})

require("lspconfig").jsonls.setup({
    settings = {
        json = {
            -- schemas = require("schemastore").json.schemas(),
            validate = {
                enable = true,
            },
        },
    },
})
