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
        harpoon.ui:toggle_quick_menu(harpoon:list())
    end)
end

-- "add file"
map("<leader>af", function()
    harpoon:list():append()
    print("File added to Harpoon")
end)

-- "goto 1"
map("<A-1>", function()
    harpoon:list():select(1)
end)
-- "goto 2"
map("<A-2>", function()
    harpoon:list():select(2)
end)
-- "goto 3"
map("<A-3>", function()
    harpoon:list():select(3)
end)
-- "goto 4"
map("<A-4>", function()
    harpoon:list():select(4)
end)
-- "goto 5"
map("<A-5>", function()
    harpoon:list():select(5)
end)
-- "goto 6"
map("<A-6>", function()
    harpoon:list():select(6)
end)
-- "goto 7"
map("<A-7>", function()
    harpoon:list():select(7)
end)
-- "goto 8"
map("<A-8>", function()
    harpoon:list():select(8)
end)
-- "goto 9"
map("<A-9>", function()
    harpoon:list():select(9)
end)

-- alternative command
-- "goto 1"
map("<C-6>", function()
    harpoon:list():select(1)
end)
-- "goto 2"
map("<C-7>", function()
    harpoon:list():select(2)
end)
-- "goto 3"
map("<C-8>", function()
    harpoon:list():select(3)
end)
-- "goto 4"
map("<C-9>", function()
    harpoon:list():select(4)
end)
-- "goto 5"
map("<C-0>", function()
    harpoon:list():select(5)
end)

-- alternative homerow
if vim.g.use_dvorak_bindings then
    -- "goto 1"
    map("<C-h>", function()
        harpoon:list():select(1)
    end)
    -- "goto 2"
    map("<C-t>", function()
        harpoon:list():select(2)
    end)
    -- "goto 3"
    map("<C-n>", function()
        harpoon:list():select(3)
    end)
    -- "goto 4"
    map("<C-s>", function()
        harpoon:list():select(4)
    end)
    -- "goto 5"
    map("<C-/>", function()
        harpoon:list():select(5)
    end)
else
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
end
