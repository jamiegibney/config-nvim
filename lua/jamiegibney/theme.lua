vim.keymap.set("n", "<leader>hg", ":Inspect<CR>")
-- vim.keymap.set("n", "<leader>ws", ":w<CR>:colorscheme melange<CR>:so<CR>")

vim.g.indent_blankline_use_treesitter = true

local api = vim.api

local links = {
    ["@lsp.type.namespace"]                  = "@namespace",
    ["@lsp.type.type"]                       = "@type",
    ["@lsp.type.class"]                      = "@type",
    ["@lsp.type.enum"]                       = "@type",
    ["@lsp.type.interface"]                  = "@type",
    ["@lsp.type.struct"]                     = "@type",
    ["@lsp.type.parameter"]                  = "@parameter",
    ["@lsp.type.property"]                   = "@property",
    ["@lsp.type.function"]                   = "@function",
    ["@lsp.type.method"]                     = "@method",
    ["@lsp.type.macro"]                      = "@macro",
    ["@lsp.type.decorator"]                  = "@function",
    ["@lsp.mod.defaultLibrary"]              = "@function.builtin",
    ["@lsp.mod.readonly"]                    = "@constant",
    ["@lsp.typemod.function.defaultLibrary"] = "@function.builtin",
    ["@lsp.typemod.variable.defaultLibrary"] = "@variable.builtin",
    ["@lsp.typemod.variable.readonly"]       = "@constant",
}

local function set_highlights()
    for newgroup, oldgroup in pairs(links) do
        api.nvim_set_hl(0, newgroup, { link = oldgroup, default = true, })
    end

    -- general highlights
    api.nvim_set_hl(0, "Normal", { fg = "#000000", bg = "#ffffff", })
    api.nvim_set_hl(0, "NormalNC", { link = "Normal", })
    api.nvim_set_hl(0, "Todo", { fg = "#008dde", bold = true, })
    api.nvim_set_hl(0, "LineNr", { fg = "#adadad", bg = "#ffffff" })
    api.nvim_set_hl(0, "CursorLine", { bg = "#f5f5f5", })
    api.nvim_set_hl(0, "CursorLineNr", { fg = "#7a7a7a", })
    api.nvim_set_hl(0, "Search", { bg = "#baceff", })
    api.nvim_set_hl(0, "CurSearch", { bg = "#baceff", })
    api.nvim_set_hl(0, "IncSearch", { bg = "#f0a8d2", })
    api.nvim_set_hl(0, "Folded", { bg = "#eeeeee", })
    api.nvim_set_hl(0, "Visual", { bg = "#a6d2ff", })
    api.nvim_set_hl(0, "Comment", { fg = "#8c8c8c", italic = true })

    api.nvim_set_hl(0, "SpellLocal", { sp = "#bc5c00", undercurl = true, })
    api.nvim_set_hl(0, "SpellBad", { link = "SpellLocal", })

    api.nvim_set_hl(0, "StatusLine", { bg = "#ededed", fg = "none" })
    api.nvim_set_hl(0, "StatusLineNC", { bg = "#eeeeee", fg = "none" })
    api.nvim_set_hl(0, "NormalFloat", { bg = "#eeeeee", fg = "none" })
    api.nvim_set_hl(0, "VertSplit", { link = "LineNr", })
    api.nvim_set_hl(0, "PMenuSel", { bg = "#a6d2ff", fg = "none" })
    api.nvim_set_hl(0, "PMenu", { fg = "none" })
    api.nvim_set_hl(0, "IndentBlanklineChar", { fg = "#dddddd", })
    api.nvim_set_hl(0, "IndentBlanklineContextChar", { link = "DiagnosticHint", })

    -- diagnostic colours
    api.nvim_set_hl(0, "DiagnosticError", { fg = "#d95716", })
    api.nvim_set_hl(0, "DiagnosticWarn", { fg = "#d9aa0d", })
    api.nvim_set_hl(0, "DiagnosticInfo", { fg = "#cccccc", })
    api.nvim_set_hl(0, "DiagnosticHint", { fg = "#6a959f", })
    api.nvim_set_hl(0, "DiagnosticUnderlineError", { sp = "#d95716", undercurl = true, })
    api.nvim_set_hl(0, "DiagnosticUnderlineWarn", { sp = "#d9aa0d", undercurl = true, })
    api.nvim_set_hl(0, "DiagnosticUnderlineInfo", { sp = "#cccccc", undercurl = true, })
    api.nvim_set_hl(0, "DiagnosticUnderlineHint", { sp = "#6a959f", undercurl = true, })

    api.nvim_set_hl(0, "Operator", { fg = "#000000", })
    api.nvim_set_hl(0, "Delimiter", { fg = "#000000", })
    api.nvim_set_hl(0, "rustFoldBraces", { fg = "#6a959f", })
    api.nvim_set_hl(0, "rustBoxPlacementBalance", { fg = "#6a959f", })
    api.nvim_set_hl(0, "MatchParen", { bg = "#93d9d9", })
    api.nvim_set_hl(0, "Statement", { fg = "#0033b3", })
    api.nvim_set_hl(0, "rustStorage", { fg = "#0033b3", })
    api.nvim_set_hl(0, "rustSigil", { fg = "#000000", })
    api.nvim_set_hl(0, "rustKeyword", { fg = "#0033b3", })

    -- literals
    api.nvim_set_hl(0, "String", { fg = "#0a8521", })
    api.nvim_set_hl(0, "Character", { link = "String", })
    api.nvim_set_hl(0, "rustLifetime", { fg = "#20999d", italic = true, })
    api.nvim_set_hl(0, "rustEscape", { fg = "#0033b3", })
    api.nvim_set_hl(0, "Number", { fg = "#1750eb", })
    api.nvim_set_hl(0, "rustFloat", { fg = "#1750eb", })
    --

    api.nvim_set_hl(0, "Boolean", { fg = "#0033b3", })
    api.nvim_set_hl(0, "Type", { fg = "#000000", })
    api.nvim_set_hl(0, "@type", { fg = "#000000", })
    -- what do these actually do?
    api.nvim_set_hl(0, "Constant", {})

    api.nvim_set_hl(0, "PreProc", { fg = "#af9800", })
    api.nvim_set_hl(0, "rustModPath", { fg = "#0033b3", })

    api.nvim_set_hl(0, "Function", {})

    api.nvim_set_hl(0, "@lsp.type.typeParameter", { fg = "#20999d", })
    api.nvim_set_hl(0, "@lsp.type.property", { fg = "#a215a0" })
    api.nvim_set_hl(0, "@lsp.type.enumMember", { fg = "#a215a0", italic = true, })
    api.nvim_set_hl(0, "@lsp.type.namespace.rust", { fg = "#000000", })
    api.nvim_set_hl(0, "@macro", { fg = "#dd6718", })

    -- * -- Rust highlights -- * --
    -- types
    api.nvim_set_hl(0, "@lsp.mod.defaultLibrary.rust", { fg = "#000000", })

    -- variables and parameters (closure variables are considered parameters)
    api.nvim_set_hl(0, "@lsp.type.variable.rust", { fg = "#000000", })
    api.nvim_set_hl(0, "@lsp.type.parameter", { fg = "#000000", })
    api.nvim_set_hl(0, "@lsp.typemod.variable.mutable.rust", { sp = "#aaaaaa", underline = true, })
    api.nvim_set_hl(0, "@lsp.typemod.parameter.mutable.rust", { link = "@lsp.typemod.variable.mutable.rust" })
    api.nvim_set_hl(0, "@lsp.typemod.variable.reference.rust", { italic = true, })
    api.nvim_set_hl(0, "@lsp.typemod.parameter.reference.rust", { italic = true, })

    -- standalone function declarations
    api.nvim_set_hl(0, "@lsp.typemod.function.declaration", { fg = "#006f95", bold = true, })
    -- standalone function calls
    api.nvim_set_hl(0, "@lsp.type.function.rust", { fg = "#00ab9c", })
    api.nvim_set_hl(0, "@lsp.typemod.function.defaultLibrary.rust", { fg = "#00ab9c", })
    -- associated function (calls and declarations)
    api.nvim_set_hl(0, "@lsp.typemod.method.static.rust", { fg = "#0079a5", italic = true, })

    local method_color = "#0070a0"
    api.nvim_set_hl(0, "@lsp.typemod.method.defaultLibrary.rust", { fg = method_color, })
    -- method declaration
    api.nvim_set_hl(0, "@lsp.typemod.method.declaration.rust", { bold = true })
    -- method call
    api.nvim_set_hl(0, "@lsp.typemod.method.reference.rust", { fg = method_color, })
    api.nvim_set_hl(0, "@lsp.typemod.method.consuming.rust", { fg = method_color, })

    api.nvim_set_hl(0, "@lsp.type.typeAlias.rust", { fg = "#000000", })
    api.nvim_set_hl(0, "@lsp.type.selfKeyword.rust", { fg = "#0033b3", })
    api.nvim_set_hl(0, "@lsp.typemod.selfKeyword.consuming.rust", { bold = true, })
    api.nvim_set_hl(0, "@lsp.typemod.selfKeyword.mutable.rust", { link = "@lsp.typemod.variable.mutable.rust" })
    api.nvim_set_hl(0, "@lsp.typemod.selfKeyword.reference.rust", { italic = true, })

    api.nvim_set_hl(0, "@lsp.mod.constant.rust", { fg = "#a215a0", bold = true, })
    api.nvim_set_hl(0, "@lsp.type.builtinType.rust", { fg = "#0033b3", })
    api.nvim_set_hl(0, "@lsp.type.label.rust", { fg = "#00ab9c", italic = true, })

    api.nvim_set_hl(0, "@lsp.type.keyword.rust", { link = "rustKeyword", })
    api.nvim_set_hl(0, "@lsp.type.struct.rust", { link = "Type", })
    api.nvim_set_hl(0, "@lsp.type.enum.rust", { link = "Type", })
    -- default library types
    api.nvim_set_hl(0, "@lsp.typemod.enum.defaultLibrary.rust", { link = "DiagnosticHint", --[[ fg = "#bc5c00", ]] })
    api.nvim_set_hl(0, "@lsp.typemod.struct.defaultLibrary.rust", { link = "@lsp.typemod.enum.defaultLibrary.rust", })
    api.nvim_set_hl(0, "rustTrait", { link = "@lsp.typemod.enum.defaultLibrary.rust", })
    api.nvim_set_hl(0, "@keyword.function.rust", { link = "@keyword.rust", })
    api.nvim_set_hl(0, "DiagnosticUnnecessary", { fg = "#8c8c8c", sp = "#8c8c8c", underline = true, italic = true, })
    api.nvim_set_hl(0, "@lsp.type.macro.rust", { link = "@macro" })
    api.nvim_set_hl(0, "@lsp.typemod.macro.defaultLibrary.rust", { link = "@macro" })
    api.nvim_set_hl(0, "@lsp.typemod.macro.library.rust", { link = "@macro" })
    api.nvim_set_hl(0, "@lsp.type.string.rust", { fg = "#0a8521", italic = true, })
    -- api.nvim_set_hl(0, "rustString", {})
    api.nvim_set_hl(0, "@lsp.type.formatSpecifier.rust", { fg = "#0033b3", })
    api.nvim_set_hl(0, "@lsp.typemod.decorator.attribute.rust", { fg = "#af9800" })
end

api.nvim_create_autocmd({ "VimEnter", "ColorScheme" }, {
    pattern = "*",
    callback = function()
        -- in this instance, melange is being used as a "fallback" coloscheme
        -- most languages other than rust will therefore use melange highlights
        vim.cmd.colorscheme "melange"
        set_highlights()
        api.nvim_set_hl(0, "@lsp.type.formatSpecifier.rust", { fg = "#0033b3", italic = false, })
    end
})

set_highlights()
