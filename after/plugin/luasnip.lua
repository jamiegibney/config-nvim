local snip = require "luasnip"

vim.keymap.set("i", "<Tab>", function()
    snip.jump(1)
end)
vim.keymap.set("i", "<S-Tab>", function()
    snip.jump(-1)
end)
