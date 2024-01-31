vim.keymap.set("n", "<leader>hg", ":Inspect<CR>")

vim.g.indent_blankline_use_treesitter = true
vim.cmd "autocmd BufRead,BufNewFile * syn match Braces /[{}]/"

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

    api.nvim_set_hl(0, "@keyword.function.wgsl", { link = "Keyword" })
    api.nvim_set_hl(0, "@punctuation.bracket.wgsl", { fg = "#9c9c9c" })
    api.nvim_set_hl(0, "@type.wgsl", { link = "Keyword" })

    -- general highlights
    api.nvim_set_hl(0, "Normal", { fg = "#000000", bg = "#ffffff", })
    api.nvim_set_hl(0, "NormalNC", { link = "Normal", })
    api.nvim_set_hl(0, "Todo", { fg = "#008dde", italic = true, bold = true, --[[ bg = "#c0ddef", ]] })
    api.nvim_set_hl(0, "LineNr", { fg = "#adadad", bg = "#ffffff" })
    api.nvim_set_hl(0, "CursorLine", { bg = "#f5f5f5", })
    api.nvim_set_hl(0, "CursorLineNr", { fg = "#7a7a7a", })
    api.nvim_set_hl(0, "Search", { bg = "#baceff", })
    api.nvim_set_hl(0, "CurSearch", { bg = "#baceff", })
    api.nvim_set_hl(0, "IncSearch", { bg = "#f0a8d2", })
    api.nvim_set_hl(0, "Folded", { bg = "#eeeeee", })
    api.nvim_set_hl(0, "Visual", { bg = "#a6d2ff", })
    api.nvim_set_hl(0, "Comment", { fg = "#9c9c9c", italic = true })

    api.nvim_set_hl(0, "SpellLocal", { sp = "#bc5c00", undercurl = true, })
    api.nvim_set_hl(0, "SpellBad", { link = "SpellLocal", })

    api.nvim_set_hl(0, "StatusLine", { bg = "#ededed", fg = "none" })
    api.nvim_set_hl(0, "StatusLineNC", { bg = "#eeeeee", fg = "none" })
    api.nvim_set_hl(0, "WinBar", { link = "StatusLine", })
    api.nvim_set_hl(0, "WinBarNC", { link = "StatusLineNC", })
    api.nvim_set_hl(0, "NormalFloat", { bg = "#eeeeee", fg = "none" })
    api.nvim_set_hl(0, "VertSplit", { link = "LineNr", })
    api.nvim_set_hl(0, "PMenuSel", { bg = "#a6d2ff", fg = "none" })
    api.nvim_set_hl(0, "PMenu", { link = "NormalFloat", })
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
    api.nvim_set_hl(0, "@punctuation.delimiter", { link = "Delimiter" })
    api.nvim_set_hl(0, "rustFoldBraces", { fg = "#6a959f", })
    api.nvim_set_hl(0, "rustCommentLineDoc", { link = "Comment", })
    api.nvim_set_hl(0, "rustBoxPlacementBalance", { fg = "#6a959f", })
    api.nvim_set_hl(0, "rustIdentifier", { fg = "#000000", })
    api.nvim_set_hl(0, "Identifier", { fg = "#000000", })
    api.nvim_set_hl(0, "MatchParen", { fg = "#000000", bg = "#93d9d9", })
    api.nvim_set_hl(0, "Statement", { fg = "#0033b3", })
    api.nvim_set_hl(0, "rustStorage", { fg = "#0033b3", })
    api.nvim_set_hl(0, "rustSigil", { fg = "#000000", })
    api.nvim_set_hl(0, "rustKeyword", { fg = "#0033b3", })
    api.nvim_set_hl(0, "rustAssert", { link = "@macro", })
    api.nvim_set_hl(0, "rustQuestionMark", { link = "rustKeyword", })

    -- literals
    api.nvim_set_hl(0, "String", { fg = "#0a8521", })
    api.nvim_set_hl(0, "Character", { link = "String", })
    api.nvim_set_hl(0, "rustLifetime", { fg = "#20999d", italic = true, })
    api.nvim_set_hl(0, "@storageclass.lifetime.rust", { link = "rustLifetime" })
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
    api.nvim_set_hl(0, "@lsp.typemod.enumMember.library.rust", { link = "@lsp.type.enumMember" })
    api.nvim_set_hl(0, "@lsp.typemod.enumMember.defaultLibrary.rust", { link = "@lsp.type.enumMember" })
    api.nvim_set_hl(0, "@lsp.typemod.variable.defaultLibrary.rust", {})
    api.nvim_set_hl(0, "@lsp.typemod.variable.constant.rust", { link = "@lsp.mod.constant.rust" })
    -- api.nvim_set_hl(0, "@lsp.mod.static.rust", { fg = "#000000", bold = true, })
    api.nvim_set_hl(0, "@lsp.type.namespace.rust", { fg = "#000000", })
    api.nvim_set_hl(0, "@macro", { fg = "#dd6718", })
    -- * -- C highlights -- * --
    api.nvim_set_hl(0, "@lsp.mod.defaultLibrary.c", { link = "DiagnosticHint", })
    api.nvim_set_hl(0, "@lsp.typemod.function.defaultLibrary.c", { fg = "#00ab9c", })
    api.nvim_set_hl(0, "cType", { link = "rustKeyword", })
    api.nvim_set_hl(0, "cTypedef", { link = "cType", })
    api.nvim_set_hl(0, "cStructure", { link = "cType", })
    api.nvim_set_hl(0, "cString", { fg = "#0a8521", italic = true, })
    api.nvim_set_hl(0, "cCharacter", { link = "cString", })
    api.nvim_set_hl(0, "cEnum", { link = "cType", })
    api.nvim_set_hl(0, "cSpecialCharacter", { link = "@lsp.type.formatSpecifier.rust" })
    api.nvim_set_hl(0, "cSpecial", { link = "@lsp.type.formatSpecifier.rust" })
    api.nvim_set_hl(0, "@lsp.type.variable.c", { fg = "#000000", })
    api.nvim_set_hl(0, "@lsp.typemod.variable.readonly.c", { link = "@lsp.mod.constant.rust", })
    api.nvim_set_hl(0, "@lsp.type.function.c", { fg = "#0070a0", })
    api.nvim_set_hl(0, "cOperator", { link = "ctype", })

    -- * -- C++ highlights -- * --
    api.nvim_set_hl(0, "@lsp.typemod.class.defaultLibrary.cpp", { link = "DiagnosticHint", })
    api.nvim_set_hl(0, "@lsp.typemod.function.defaultLibrary.cpp", { fg = "#00ab9c", })
    api.nvim_set_hl(0, "@lsp.mod.defaultLibrary.cpp", { link = "none" })
    api.nvim_set_hl(0, "@lsp.type.namespace.cpp", { link = "none" })
    api.nvim_set_hl(0, "cppType", { link = "rustKeyword", })
    api.nvim_set_hl(0, "cppTypedef", { link = "cType", })
    api.nvim_set_hl(0, "cppStructure", { link = "cType", })
    api.nvim_set_hl(0, "cppString", { fg = "#0a8521", italic = true, })
    api.nvim_set_hl(0, "cppRawString", { link = "cppString", })
    api.nvim_set_hl(0, "cppRawStringDelimiter", { link = "cppString", })
    api.nvim_set_hl(0, "cppCharacter", { link = "cString", })
    api.nvim_set_hl(0, "cppEnum", { link = "cType", })
    api.nvim_set_hl(0, "cppSpecialCharacter", { link = "@lsp.type.formatSpecifier.rust" })
    api.nvim_set_hl(0, "cppSpecial", { link = "@lsp.type.formatSpecifier.rust" })
    api.nvim_set_hl(0, "cppOperator", { link = "ctype", })
    api.nvim_set_hl(0, "cStorageClass", { link = "ctype", })
    api.nvim_set_hl(0, "cppStorageClass", { link = "cStorageClass", })
    api.nvim_set_hl(0, "cInclude", { fg = "#af9800", italic = true, })
    api.nvim_set_hl(0, "@lsp.typemod.variable.readonly.cpp", { fg = "#a215a0", bold = true, })
    api.nvim_set_hl(0, "@lsp.type.variable.cpp", { fg = "#000000", })
    api.nvim_set_hl(0, "@lsp.type.function.cpp", { fg = "#0070a0", })

    local cpp_class_purple = "#8023c0"
    api.nvim_set_hl(0, "@lsp.type.class.cpp", { fg = cpp_class_purple, })
    api.nvim_set_hl(0, "@lsp.type.type.cpp", { fg = cpp_class_purple, })
    api.nvim_set_hl(0, "@lsp.typemod.variable.defaultLibrary.cpp", { italic = false, })

    local method_color = "#0070a0"
    api.nvim_set_hl(0, "@lsp.typemod.method.defaultLibrary.cpp", { fg = method_color, })
    api.nvim_set_hl(0, "@lsp.typemod.method.defaultLibrary.cpp", { fg = method_color, })
    api.nvim_set_hl(0, "@lsp.type.function.cpp", { fg = "#00ab9c", })
    api.nvim_set_hl(0, "@lsp.typemod.type.deduced.cpp", { link = "Statement", })

    -- * -- Lua highlights -- * --
    api.nvim_set_hl(0, "luaFunction", { fg = "#0033b3", italic = true, })
    api.nvim_set_hl(0, "luaString", { fg = "#0a8521", italic = true, })
    api.nvim_set_hl(0, "luaStatement", { link = "Statement", })
    api.nvim_set_hl(0, "@keyword.function.lua", { link = "Keyword", })
    api.nvim_set_hl(0, "@lsp.typemod.function.defaultLibrary.lua", { link = "@macro" })
    api.nvim_set_hl(0, "@lsp.typemod.variable.defaultLibrary.lua", { link = "DiagnosticHint" })
    api.nvim_set_hl(0, "@lsp.type.function.lua", { fg = "#00ab9c", })
    api.nvim_set_hl(0, "@lsp.type.method.lua", { fg = "#0070a0", italic = true })


    -- * -- Rust highlights -- * --
    -- types
    api.nvim_set_hl(0, "@lsp.mod.defaultLibrary.rust", { fg = "#000000", })

    -- variables and parameters (closure variables are considered parameters)
    api.nvim_set_hl(0, "@lsp.type.variable.rust", { link = "none" })
    api.nvim_set_hl(0, "@lsp.type.parameter", { fg = "#000000", })
    api.nvim_set_hl(0, "@lsp.typemod.variable.mutable.rust", { sp = "#aaaaaa", underline = true, })
    api.nvim_set_hl(0, "@lsp.typemod.parameter.mutable.rust", { link = "@lsp.typemod.variable.mutable.rust" })
    api.nvim_set_hl(0, "@lsp.typemod.variable.reference.rust", { italic = true, })
    api.nvim_set_hl(0, "@lsp.typemod.parameter.reference.rust", { italic = true, })

    -- standalone function declarations
    api.nvim_set_hl(0, "@lsp.typemod.function.declaration", { fg = "#006f95", bold = true, })
    api.nvim_set_hl(0, "@function.wgsl", { link = "@lsp.typemod.function.declaration" })
    -- standalone function calls
    api.nvim_set_hl(0, "@lsp.type.function.rust", { fg = "#00ab9c", })
    api.nvim_set_hl(0, "@lsp.typemod.variable.callable", { link = "@lsp.type.function.rust" })
    api.nvim_set_hl(0, "@lsp.typemod.function.defaultLibrary.rust", { fg = "#00ab9c", })
    -- associated function (calls and declarations)
    api.nvim_set_hl(0, "@lsp.typemod.method.static.rust", { fg = "#0079a5", italic = true, })

    local method_color = "#0070a0"
    api.nvim_set_hl(0, "@lsp.typemod.method.defaultLibrary.rust", { fg = method_color, })
    api.nvim_set_hl(0, "rustFuncCall", { fg = method_color, })
    -- method declaration
    api.nvim_set_hl(0, "@lsp.typemod.method.declaration.rust", { bold = true })
    -- method call
    api.nvim_set_hl(0, "@lsp.typemod.method.reference.rust", { fg = method_color, })
    api.nvim_set_hl(0, "@function.call.rust", { fg = method_color, })
    api.nvim_set_hl(0, "@lsp.typemod.method.consuming.rust", { fg = method_color, })

    api.nvim_set_hl(0, "@lsp.type.typeAlias.rust", { fg = "#000000", })
    api.nvim_set_hl(0, "@lsp.type.selfTypeKeyword.rust", { link = "DiagnosticHint" })
    api.nvim_set_hl(0, "@lsp.type.selfKeyword.rust", { fg = "#0033b3", })
    api.nvim_set_hl(0, "@lsp.typemod.selfKeyword.consuming.rust", { bold = true, })
    api.nvim_set_hl(0, "@lsp.typemod.selfKeyword.mutable.rust", { link = "@lsp.typemod.variable.mutable.rust" })
    api.nvim_set_hl(0, "@lsp.typemod.selfKeyword.reference.rust", { italic = true, })

    api.nvim_set_hl(0, "@lsp.mod.constant.rust", { fg = "#a215a0", bold = true, })
    api.nvim_set_hl(0, "@lsp.type.builtinType.rust", { fg = "#0033b3", })
    api.nvim_set_hl(0, "@lsp.type.label.rust", { fg = "#00ab9c", italic = true, })

    api.nvim_set_hl(0, "@lsp.type.keyword.rust", { link = "rustKeyword", })
    api.nvim_set_hl(0, "cConstant", { link = "@lsp.mod.constant.rust", })
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
    api.nvim_set_hl(0, "rustString", { link = "String" })
    api.nvim_set_hl(0, "@lsp.type.formatSpecifier.rust", { fg = "#0033b3", })
    api.nvim_set_hl(0, "@lsp.typemod.decorator.attribute.rust", { fg = "#af9800" })
    api.nvim_set_hl(0, "@lsp.typemod.generic.attribute.rust", { fg = "#000000" })
    api.nvim_set_hl(0, "@lsp.mod.attribute.rust", { fg = "#af9800" })
    api.nvim_set_hl(0, "@lsp.typemod.attributeBracket.attribute.rust", { link = "@lsp.mod.attribute.rust" })
    api.nvim_set_hl(0, "@punctuation.bracket.rust", {})
    api.nvim_set_hl(0, "@include.rust", { link = "Keyword" })
    api.nvim_set_hl(0, "@variable.builtin.rust", {})
    api.nvim_set_hl(0, "@punctuation.delimiter.rust", {})
    api.nvim_set_hl(0, "@lsp.typemod.keyword.unsafe.rust", { fg = "#cc0000", })
    api.nvim_set_hl(0, "@lsp.mod.unsafe.rust", { bg = "#ffeeee" })
    api.nvim_set_hl(0, "rustMacro", { link = "@macro" })
    api.nvim_set_hl(0, "Braces", { link = "DiagnosticHint", })

    api.nvim_set_hl(0, "TabLineSel", { link = "Visual", })
end

M = {}

function M.set_theme()
    vim.cmd.colorscheme "melange"
    vim.opt.background = "light"
    set_highlights()
    api.nvim_set_hl(0, "@lsp.type.formatSpecifier.rust", { fg = "#0033b3", italic = false, })
end

M.set_theme()

return M
