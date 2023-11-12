local cmp = require("cmp")

cmp.setup {
    performance = {
        debounce = 15,
        throttle = 10,
        fetching_timeout = 50,
        async_budget = 2,
    },
    completion = {
        keyword_length = 1,
    },
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
        -- { name = "buffer" },
        { name = "nvim_lsp" },
        { name = "luasnip" },
        {
            name = "spell",
            option = {
                keep_all_entries = false,
                enable_in_context = function()
                    return true
                end
            }
        },
        { name = "crates" },
        { name = "kitty" },
    }
}
