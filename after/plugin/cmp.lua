local cmp = require("cmp")
-- local dict = require("cmp_dictionary")
--
-- dict.setup({
--     document = true,
--     -- max_items = 5,
-- })
-- dict.switcher({
--     spelllang = {
--         en_us = "~/.config/nvim/en.dict"
--     }
-- })

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
        { name = "buffer" },
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "crates" },
        { name = "calc" },
        { name = "async_path" },
        { name = "git" },
        { name = "nvim_lua" },
        -- {
        --     name = "spell",
        --     option = {
        --         keep_all_entries = true,
        --         enable_in_context = function()
        --             return vim.o.spell
        --         end
        --     }
        -- },
        -- { name = "dictionary" },
        -- { name = "tmux" },
        -- { name = "kitty" },
    }
}
