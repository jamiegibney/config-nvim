local cmp = require("cmp")
local luasnip = require("luasnip")
require("luasnip.loaders.from_vscode").lazy_load()
luasnip.config.setup()

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
}

cmp.event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done())
