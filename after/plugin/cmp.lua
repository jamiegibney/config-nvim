local cmp = require("cmp")
local luasnip = require("luasnip")
require("luasnip.loaders.from_vscode").lazy_load()
luasnip.config.setup()

local vscode_icons = {
    Text = "  ",
    Method = "  ",
    Function = "  ",
    Constructor = "  ",

    Field = "  ",
    Variable = "  ",
    Property = "  ",

    Class = "  ",
    Interface = "  ",
    Struct = "  ",
    Module = "  ",

    Unit = "  ",
    Value = "󰎠  ",
    Enum = "   ",
    EnumMember = "  ",

    -- Keyword = "󰻾 ",
    Keyword = "󰌋  ",
    Constant = "󰏿  ",

    Snippet = "  ",
    Color = "  ",
    File = "  ",
    Reference = "  ",
    Folder = "  ",
    Event = "  ",
    Operator = "  ",
    TypeParameter = "  ",
}

vim.keymap.set("i", "<C-y>", function() cmp.complete() end)
vim.keymap.set("i", "<C-n>", function() cmp.complete() end)
vim.keymap.set("i", "<C-p>", function() cmp.complete() end)

cmp.setup {
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end
    },
    performance = {
        debounce = 25,
        throttle = 15,
        fetching_timeout = 50,
        async_budget = 5,
    },
    completion = {
        completeopt = "menu,menuone",
        keyword_length = 1,
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        -- TODO
        -- ["<C-f>"] = cmp.mapping.scroll_docs(-4),
        -- ["<C-g>"] = cmp.mapping.scroll_docs(4),
        ["<C-y>"] = cmp.mapping.confirm({
            behavior = cmp.SelectBehavior.Replace,
            select = true,
        }),
    }),
    sorting = {
        comparators = {
            cmp.config.compare.score,
            cmp.config.compare.offset,
            -- in-line version of cmp-under-comparator
            function(entry_1, entry_2)
                local _, e1_under = entry_1.completion_item.label:find("^_+")
                local _, e2_under = entry_2.completion_item.label:find("^_+")
                e1_under = e1_under or 0
                e2_under = e2_under or 0
                if e1_under > e2_under then
                    return false
                elseif e1_under < e2_under then
                    return true
                end
            end,
            cmp.config.compare.order,
        }
    },
    sources = {
        -- { name = "buffer" },
        { name = "nvim_lsp" },
        { name = "nvim_lua" },
        { name = "async_path" },
        { name = 'luasnip' },
    },
    window = {
        completion = {
            scrolloff = 5,
            side_padding = 1,
        },
    },
    view = {
        docs = {
            auto_open = true,
        },
        entries = {
            name = "custom",
            follow_cursor = true,
        },
    },
    formatting = {
        format = function(entry, vim_item)
            vim_item.kind = (vscode_icons[vim_item.kind] or "") .. vim_item.kind
            vim_item.menu = ({
                buffer = "",
                nvim_lsp = "",
                luasnip = "",
                nvim_lua = "",
                latex_symbols = "",
                lsp = "",
            })[entry.source.name]

            return vim_item
        end
    },
    experimental = {
        ghost_text = {
            hl_group = "LineNr",
        },
    },
    preselect = cmp.PreselectMode.Item,
}

local function hl(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
end

hl("CmpItemKindConstructor", { link = "CmpItemKind" })
hl("CmpItemKindKeyword", { link = "CmpItemKind" })
hl("CmpItemAbbrMatch", { bold = true, fg = "#a215a0" })
hl("CmpItemAbbrMatchFuzzy", { bold = true, fg = "#a270a0" })
