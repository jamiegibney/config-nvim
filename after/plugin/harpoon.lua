-- * -- HARPOON KEYMAPS -- * --

local harpoon = require("harpoon")

harpoon:setup({
    settings = {
        save_on_toggle = true,
    },
})

local function map(key, cb)
    vim.keymap.set("n", key, cb)
end

-- "harpoon"
if vim.g.use_dvorak_bindings then
    map("<C-m>", function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
    end)
else
    map("<C-h>", function()
        harpoon.ui:toggle_quick_menu(harpoon:list(), {
            title = " Harpoon ",
        })
    end)
end

-- "add file"
map("<leader>af", function()
    harpoon:list():append()
    print("File added to Harpoon")
end)

-- "goto 1"
map("<C-j>", function()
    harpoon:list():select(1)
end)
-- "goto 2"
map("<C-k>", function()
    harpoon:list():select(2)
end)
-- "goto 3"
map("<C-l>", function()
    harpoon:list():select(3)
end)
-- "goto 4"
map("<C-;>", function()
    harpoon:list():select(4)
end)
-- "goto 5"
map("<C-'>", function()
    harpoon:list():select(5)
end)
