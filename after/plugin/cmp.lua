local cmp = require("cmp")

cmp.setup {
    performance = {
        debounce = 15,
        throttle = 10,
        fetching_timeout = 50,
        async_budget = 2,
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
    }
}
