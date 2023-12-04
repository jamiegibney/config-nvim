local cmp = require("cmp")
local luasnip = require("luasnip")
require("luasnip.loaders.from_vscode").lazy_load()
luasnip.config.setup()

local vscode_icons = {
    Text = "  ",
    Method = "  ",
    Function = "  ",
    Constructor = "  ",
    Field = "  ",
    Variable = "  ",
    Class = "  ",
    Interface = "  ",
    Module = "  ",
    Property = "  ",
    Unit = "  ",
    -- Value = "  ",
    Value = "󰎠",
    Enum = "  ",
    -- Keyword = "  ",
    Keyword = "󰌋",
    -- Snippet = "  ",
    Snippet = "  ",
    Color = "  ",
    File = "  ",
    Reference = "  ",
    Folder = "  ",
    -- EnumMember = "  ",
    EnumMember = "  ",
    Constant = "  ",
    -- Struct = "  ",
    Struct = "",
    Event = "  ",
    Operator = "  ",
    TypeParameter = "  ",
}

cmp.setup {
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    performance = {
        debounce = 15,
        throttle = 10,
        fetching_timeout = 50,
        async_budget = 2,
    },
    completion = {
        completeopt = "menu,menuone,noinsert,noselect",
        keyword_length = 1,
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-u>"] = cmp.mapping.scroll_docs(4),
        ["<C-y>"] = cmp.mapping.confirm({ select = true }),
    }),
    sorting = {
        comparators = {
            cmp.config.compare.offset,
            cmp.config.compare.exact,
            cmp.config.compare.score,
            require("cmp-under-comparator").under,
            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order,
        }
    },
    sources = {
        { name = "buffer" },
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "calc" },
        { name = "async_path" },
        { name = "nvim_lua" },
        { name = "git" },
        -- { name = "crates" },
    },
    window = {
        completion = {
            scrolloff = 5,
            side_padding = 1,
        },
        preselect = cmp.PreselectMode.None,
    },
    view = {
        entries = {
            name = "custom",
            selection_order = "near_cursor",
        },
    },
    formatting = {
        format = function(entry, vim_item)
            vim_item.kind = (vscode_icons[vim_item.kind] or "") .. vim_item.kind
            vim_item.menu = ({
                buffer = "[Buf]",
                lsp = "[LSP]",
            })[entry.source.name]

            return vim_item
        end
    }
}

cmp.event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done())
